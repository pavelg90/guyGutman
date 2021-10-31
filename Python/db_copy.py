from datetime import datetime
from datetime import time as dt_time
import pytz
import pandas as pd
import pymysql
import pyodbc
from time import sleep
import logging
import sshtunnel
from sshtunnel import SSHTunnelForwarder
from sqlalchemy import create_engine
import time
import gc

# Set global variables:
azure_engine = mysql_connection = tunnel = ''
interval = 1800

# Download data Queries (MySQL):
cm_hopper = "select * from motion2.cm_hopper WHERE createdAt BETWEEN '{}' AND '{}' OR updatedAt BETWEEN '{}' AND '{}'"
cm_hopper_final = "select * from motion2.cm_hopper_final WHERE createdAt BETWEEN '{}' AND '{}' OR updatedAt BETWEEN '{}' AND '{}'"
cm_hopper_history = "select * from motion2.cm_hopper_history WHERE createdAt BETWEEN '{}' AND '{}' OR updatedAt BETWEEN '{}' AND '{}'"
cm_contacts = "select * from motion2.cm_contacts WHERE createdAt BETWEEN '{}' AND '{}' OR updatedAt BETWEEN '{}' AND '{}'"
campaigns = "select * from motion2.campaigns WHERE createdAt BETWEEN '{}' AND '{}' OR updatedAt BETWEEN '{}' AND '{}'"
voice_recordings = "select * from motion2.voice_recordings WHERE createdAt BETWEEN '{}' AND '{}' OR updatedAt BETWEEN '{}' AND '{}'"

# aggregate queries into list:
queries = {'cm_hopper': cm_hopper, 'cm_hopper_final': cm_hopper_final,
           'cm_hopper_history': cm_hopper_history, 'cm_contacts': cm_contacts,
           'campaigns': campaigns, 'voice_recordings': voice_recordings}

def mysql(connect=False, disconnect=False):
    global mysql_connection, tunnel
    if connect:
        ssh_host = ''
        ssh_username = ''
        ssh_password = ''
        database_username = ''
        database_password = ''
        database_name = ''

        # SSH tunnel:
        sshtunnel.DEFAULT_LOGLEVEL = logging.DEBUG
        tunnel = SSHTunnelForwarder(
            (ssh_host, 22),
            ssh_username=ssh_username,
            ssh_password=ssh_password,
            remote_bind_address=('127.0.0.1', 3306)
        )
        tunnel.start()
        # MySQL connection:
        mysql_connection = pymysql.connect(
                host='127.0.0.1',
                user=database_username,
                passwd=database_password,
                db=database_name,
                port=tunnel.local_bind_port
            )
    elif disconnect:
        mysql_connection.close()
        tunnel.close

def azure():
    global azure_engine
    driver = 'ODBC Driver 17 for SQL Server'
    server = ''
    port = ''
    database = ''
    username = ''
    password = ''
    connection_string = f'mssql+pyodbc://{username}:{password}@{server}:{port}/{database}?driver={driver.replace(" ", "+")}'
    azure_engine = create_engine(connection_string, fast_executemany=True)

def get_min_dates(tables):
    df_final = pd.DataFrame(columns=['createdAt', 'updatedAt', 'table_name',])
    for table_name in tables:
        print(f'Getting min dates from {table_name}')
        query = f'select min(createdAt) createdAt, min(updatedAt) updatedAt from motion2.{table_name}'
        df = pd.read_sql(query, con=mysql_connection)
        df['table_name'] = table_name
        df_final = df_final.append(df)
    return df_final

def get_last_dates():
    global azure_engine
    query = 'select * from ggutman_telemarketing_2_V4.dbo.mysql_copy_last_dates'
    #query = 'select table_name, max(created_at_day_shift) createdAt, max(updated_at_day_shift) updatedAt from ggutman_telemarketing_2_V4.dbo.db_copy_logs GROUP BY table_name'
    df = pd.read_sql(query, con=azure_engine)
    ##############################################################################################
    '''
    df['created_at_day_shift'] = pd.DatetimeIndex(df['createdAt']) + pd.DateOffset(1)
    df['updated_at_day_shift'] = pd.DatetimeIndex(df['updatedAt']) + pd.DateOffset(1)
    df[['created_at_day_shift', 'updated_at_day_shift', 'table_name']].to_sql(name='db_copy_logs',
                                                                       schema='dbo',
                                                                       if_exists='append',
                                                                       index=False,
                                                                       con=azure_engine)
    '''
    ##############################################################################################
    if df.isnull().sum().sum() >= 4:
        df = get_min_dates(df['table_name'].to_list())
    for index, row in df.iterrows():
        if row['createdAt'] is pd.NaT:
            df.loc[index, ['createdAt']] = df['createdAt'].min()
        if row['updatedAt'] is pd.NaT:
            df.loc[index, ['updatedAt']] = df['updatedAt'].min()
    return df[['createdAt', 'updatedAt', 'table_name']]

def downlaod_data(query, df_row):
    global mysql_connection
    # Tune for +5 days from max date in db (just in case)
    created_at_shift = pd.DatetimeIndex(df_row['createdAt']) + pd.DateOffset(5)
    updated_at_shift = pd.DatetimeIndex(df_row['updatedAt']) + pd.DateOffset(5)
    query = query.format(str(df_row['createdAt'].values[0]), str(created_at_shift.values[0]),
                         str(df_row['updatedAt'].values[0]), str(updated_at_shift.values[0]))
    return pd.read_sql_query(query, con=mysql_connection)

def upload_data(df, table):
    global azure_engine
    chunksize = 10000
    rows = 0
    for start in range(0, len(df), chunksize):
        try:
            print(f'Writing {len(df[start:start + chunksize])} rows to {table}_raw')
            df[start:start + chunksize].to_sql(name=table + '_raw',
                                               schema='dbo',
                                               if_exists='append',
                                               index=False,
                                               con=azure_engine)
            rows += len(df[start:start + chunksize])
        except Exception as e:
            print(f'Writing ; Batch write failed on row: {rows}, msg: {e}')
            return rows
    return rows

def merge_tables(target_table, source_table, fields):
    global azure_engine
    query = """
            MERGE {target_table} AS T
            USING {source_table} AS S 
            ON (T.ID = S.ID)
            WHEN MATCHED  
            THEN UPDATE SET {update_set}
            WHEN NOT MATCHED BY TARGET 
            THEN INSERT ({columns}) VALUES ({source_values});
            """
    # Format merge statement
    columns = source_values = update_set = ''
    for col in fields:
        update_set += f'T.{col} = S.{col},'
        source_values += f'S.{col},'
        columns += f'{col},'
    # Remove last ","
    update_set = update_set[:-1]
    source_values = source_values[:-1]
    columns = columns[:-1]
    query = query.format(target_table=target_table,
                         source_table=source_table,
                         update_set=update_set,
                         columns=columns,
                         source_values=source_values)
    # Execute:
    with azure_engine.connect().execution_options(autocommit=True) as conn:
        conn.execution_options(stream_results=True).execute(query)

def truncate(conn, table):
    query = f'truncate TABLE ggutman_telemarketing_2_V4.dbo.{table};'
    with conn.connect().execution_options(autocommit=True) as conn:
        conn.execution_options(stream_results=True).execute(query)

def delete_finished_hopper_rows(conn):
    query = """
                DELETE FROM dbo.cm_hopper WHERE id in
                (SELECT 
                distinct
                ch.id
                FROM 
                cm_hopper ch INNER JOIN cm_hopper_final chf
                ON 
                ch.phone = chf.calleridnum and
                ch.ContactId = chf.ContactId and
                ch.campaignid = chf.campaignid and
                ch.ListId = chf.ListId);
    """
    with conn.connect().execution_options(autocommit=True) as conn:
        conn.execution_options(stream_results=True).execute(query)

def db_maintenance(conn):
    select = '''
            SELECT S.name as 'Schema',
            T.name as 'Table',
            I.name as 'Index',
            DDIPS.avg_fragmentation_in_percent,
            DDIPS.page_count
            FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
            INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
            INNER JOIN sys.schemas S on T.schema_id = S.schema_id
            INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
            AND DDIPS.index_id = I.index_id
            WHERE DDIPS.database_id = DB_ID()
            and I.name is not null
            AND DDIPS.avg_fragmentation_in_percent > 9.9
            AND S.name = 'dbo'
            ORDER BY DDIPS.avg_fragmentation_in_percent DESC;
            '''
    rebuild_index = 'ALTER INDEX "{index_name}" ON "{table_name}" REBUILD WITH(ONLINE=ON);'
    reorganize_index = 'ALTER INDEX "{index_name}" ON "{table_name}" REORGANIZE;'
    df = pd.read_sql(select, con=conn)
    maitenance_time_start = dt_time(1, 30, 0)
    maitenance_time_end = dt_time(6, 30, 0)
    israel = pytz.timezone('Asia/Jerusalem')
    israel_time = datetime.now(israel).time()
    if israel_time >= maitenance_time_start and israel_time <= maitenance_time_end:
        for index, row in df.iterrows():
            if row['avg_fragmentation_in_percent'] < 30:
                query = reorganize_index.format(index_name=row['Index'], table_name=row['Table'])
            elif row['avg_fragmentation_in_percent'] >= 30:
                query = rebuild_index.format(index_name=row['Index'], table_name=row['Table'])
            # Execute maintenance:
            with conn.connect().execution_options(autocommit=True) as conn:
                conn.execution_options(stream_results=True).execute(query)

if __name__ == "__main__":
    while True:
        gc.collect()
        execution_start = time.time()

        # Connect to both DBs:
        mysql(connect=True)
        azure()
        # Get date for each table to download
        last_dates_df = get_last_dates()
        # Process each table
        for table in queries.keys():
            # make sure no old data in _raw tables:
            truncate(azure_engine, table + '_raw')
            print(f'Truncated {table}_raw')
            created_at_shift = last_dates_df['createdAt'].loc[last_dates_df['table_name'] == table].iloc[0]
            updated_at_shift = last_dates_df['updatedAt'].loc[last_dates_df['table_name'] == table].iloc[0]
            if created_at_shift < datetime.now() or updated_at_shift < datetime.now():
                df = downlaod_data(queries[table], last_dates_df.loc[last_dates_df['table_name'] == table])
                print(f'Downloaded {table}')
                rows = upload_data(df, table)
                print(f'Uploaded {rows} to {table}_raw')
                merge_tables(target_table=table, source_table=table + '_raw', fields=df.columns)
                print(f'Merged {table}_raw to {table}')
        delete_finished_hopper_rows(azure_engine)
        db_maintenance(azure_engine)
        # Reset globals:
        mysql(disconnect=True)
        azure_engine = mysql_connection = tunnel = last_dates_df =''

        execution_end = time.time()
        execution_time = execution_end - execution_start
        if execution_time < interval:
            print(f'Sleeping for: {interval - execution_time}')
            sleep(interval - execution_time)








