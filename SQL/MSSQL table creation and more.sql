--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_final;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_history;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_contacts;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.campaigns;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.voice_recordings;
----------------------------
--truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper;
--truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_final;
--truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_history;
--truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_contacts;
--truncate TABLE ggutman_telemarketing_2_V4.dbo.campaigns;
--truncate TABLE ggutman_telemarketing_2_V4.dbo.voice_recordings;
----------------------------


-- CM_HOPPER
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper (
[id] int NOT NULL,
[phone] varchar(255) NOT NULL,
[active] smallint DEFAULT '0',
[scheduledat] datetime2(0) DEFAULT '2020-08-26 04:55:56',
[countbusyretry] int DEFAULT '0',
[countcongestionretry] int DEFAULT '0',
[countnoanswerretry] int DEFAULT '0',
[callback] smallint DEFAULT '0',
[callbackuniqueid] varchar(255) DEFAULT NULL,
[callbackat] datetime2(0) DEFAULT NULL,
[priority] int check ([priority] > 0) DEFAULT '2',
[recallme] smallint DEFAULT '0',
[ContactId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[UserId] int DEFAULT NULL,
[VoiceQueueId] int DEFAULT NULL,
[CampaignId] int DEFAULT NULL,
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[OwnerId] int DEFAULT NULL,
[countnosuchnumberretry] int DEFAULT '0',
[countdropretry] int DEFAULT '0',
[countabandonedretry] int DEFAULT '0',
[countmachineretry] int DEFAULT '0',
[countagentrejectretry] int DEFAULT '0',
PRIMARY KEY ([id]),
)  ;



-- CM_HOPPER_FINAL
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_final (
[id] int NOT NULL,
[state] int DEFAULT NULL,
[statedesc] varchar(255) DEFAULT NULL,
[scheduledat] datetime2(0) DEFAULT NULL,
[countbusyretry] int DEFAULT '0',
[countcongestionretry] int DEFAULT '0',
[countnoanswerretry] int DEFAULT '0',
[countglobal] int DEFAULT '0',
[uniqueid] varchar(255) DEFAULT NULL,
[originatecalleridnum] varchar(255) DEFAULT NULL,
[originatecalleridname] varchar(255) DEFAULT NULL,
[calleridnum] varchar(255) DEFAULT NULL,
[calleridname] varchar(255) DEFAULT NULL,
[starttime] datetime2(0) DEFAULT NULL,
[responsetime] datetime2(0) DEFAULT NULL,
[answertime] datetime2(0) DEFAULT NULL,
[droptime] datetime2(0) DEFAULT NULL,
[endtime] datetime2(0) DEFAULT NULL,
[ringtime] int DEFAULT '0',
[holdtime] int DEFAULT '0',
[talktime] int DEFAULT '0',
[followuptime] int DEFAULT '0',
[dropreason] varchar(255) DEFAULT NULL,
[campaign] varchar(255) DEFAULT NULL,
[campaigntype] varchar(255) DEFAULT NULL,
[membername] varchar(255) DEFAULT NULL,
[reason] varchar(255) DEFAULT NULL,
[disposition] varchar(255) DEFAULT NULL,
[secondDisposition] varchar(255) DEFAULT NULL,
[thirdDisposition] varchar(255) DEFAULT NULL,
[dispositionat] datetime2(0) DEFAULT NULL,
[amd] smallint DEFAULT '0',
[fax] smallint DEFAULT '0',
[blacklist] smallint DEFAULT '0',
[rescheduled] smallint DEFAULT '0',
[rescheduledat] datetime2(0) DEFAULT NULL,
[callback] smallint DEFAULT '0',
[callbackuniqueid] varchar(255) DEFAULT NULL,
[callbackat] datetime2(0) DEFAULT NULL,
[deleted] varchar(255) DEFAULT NULL,
[deletedat] datetime2(0) DEFAULT NULL,
[recallme] smallint DEFAULT '0',
[agiafterat] datetime2(0) DEFAULT NULL,
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[UserId] int DEFAULT NULL,
[VoiceQueueId] int DEFAULT NULL,
[ContactId] int DEFAULT NULL,
[CampaignId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[countnosuchnumberretry] int DEFAULT '0',
[countdropretry] int DEFAULT '0',
[countabandonedretry] int DEFAULT '0',
[countmachineretry] int DEFAULT '0',
[countagentrejectretry] int DEFAULT '0',
PRIMARY KEY ([id],[createdAt])
);



-- cm_hopper_history
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_history (
[id] int NOT NULL,
[state] int DEFAULT NULL,
[statedesc] varchar(255) DEFAULT NULL,
[scheduledat] datetime2(0) DEFAULT NULL,
[countbusyretry] int DEFAULT '0',
[countcongestionretry] int DEFAULT '0',
[countnoanswerretry] int DEFAULT '0',
[countglobal] int DEFAULT '0',
[uniqueid] varchar(255) DEFAULT NULL,
[originatecalleridnum] varchar(255) DEFAULT NULL,
[originatecalleridname] varchar(255) DEFAULT NULL,
[calleridnum] varchar(255) DEFAULT NULL,
[calleridname] varchar(255) DEFAULT NULL,
[starttime] datetime2(0) DEFAULT NULL,
[responsetime] datetime2(0) DEFAULT NULL,
[answertime] datetime2(0) DEFAULT NULL,
[droptime] datetime2(0) DEFAULT NULL,
[endtime] datetime2(0) DEFAULT NULL,
[ringtime] int DEFAULT '0',
[holdtime] int DEFAULT '0',
[talktime] int DEFAULT '0',
[followuptime] int DEFAULT '0',
[dropreason] varchar(255) DEFAULT NULL,
[campaign] varchar(255) DEFAULT NULL,
[campaigntype] varchar(255) DEFAULT NULL,
[membername] varchar(255) DEFAULT NULL,
[reason] varchar(255) DEFAULT NULL,
[amd] smallint DEFAULT '0',
[fax] smallint DEFAULT '0',
[callback] smallint DEFAULT '0',
[callbackuniqueid] varchar(255) DEFAULT NULL,
[callbackat] datetime2(0) DEFAULT NULL,
[recallme] smallint DEFAULT '0',
[editedat] datetime2(0) DEFAULT NULL,
[edited] smallint DEFAULT '0',
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[UserId] int DEFAULT NULL,
[VoiceQueueId] int DEFAULT NULL,
[ContactId] int DEFAULT NULL,
[CampaignId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[countnosuchnumberretry] int DEFAULT '0',
[countdropretry] int DEFAULT '0',
[countabandonedretry] int DEFAULT '0',
[countmachineretry] int DEFAULT '0',
[countagentrejectretry] int DEFAULT '0',
PRIMARY KEY ([id],[createdAt])
);


-- cm_contacts
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_contacts (
[id] int NOT NULL,
[firstName] varchar(255) NOT NULL,
[lastName] varchar(255) DEFAULT NULL,
[street] varchar(255) DEFAULT NULL,
[postalCode] varchar(255) DEFAULT NULL,
[city] varchar(255) DEFAULT NULL,
[country] varchar(255) DEFAULT NULL,
[dateOfBirth] varchar(255) DEFAULT NULL,
[description] varchar(max),
[phone] varchar(255) DEFAULT NULL,
[mobile] varchar(255) DEFAULT NULL,
[fax] varchar(255) DEFAULT NULL,
[email] varchar(255) DEFAULT NULL,
[url] varchar(255) DEFAULT NULL,
[facebook] varchar(255) DEFAULT NULL,
[fb_data] varchar(255) DEFAULT NULL,
[twitter] varchar(255) DEFAULT NULL,
[skype] varchar(255) DEFAULT NULL,
[teams] varchar(255) DEFAULT NULL,
[viber] varchar(255) DEFAULT NULL,
[line] varchar(255) DEFAULT NULL,
[wechat] varchar(255) DEFAULT NULL,
[telegram] varchar(255) DEFAULT NULL,
[UserId] int DEFAULT NULL,
[priority] int check ([priority] > 0) DEFAULT '2',
[scheduledat] datetime2(0) DEFAULT NULL,
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[deletedAt] datetime2(0) DEFAULT NULL,
[CompanyId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[cf_1] int DEFAULT NULL,
[cf_2] int DEFAULT NULL,
[cf_3] varchar(max),
[cf_4] varchar(max),
[cf_5] varchar(max),
[cf_6] varchar(max),
[cf_7] varchar(max),
[cf_8] varchar(max),
[cf_9] smallint DEFAULT '0',
[cf_10] smallint DEFAULT '0',
[cf_11] smallint DEFAULT '0',
[cf_12] varchar(max),
[cf_13] varchar(max),
[cf_15] varchar(max),
[cf_16] varchar(max),
[cf_17] varchar(max),
[cf_18] varchar(max),
[cf_19] varchar(max),
[cf_20] varchar(max),
[cf_21] varchar(max),
[cf_22] varchar(max),
[cf_23] varchar(max),
PRIMARY KEY ([id]));


-- campaigns
CREATE TABLE ggutman_telemarketing_2_V4.dbo.campaigns (
[id] int NOT NULL,
[name] varchar(255) NOT NULL,
[type] varchar(255) NOT NULL CHECK ([type] IN('ivr')) DEFAULT 'ivr',
[description] varchar(255) DEFAULT NULL,
[active] bit DEFAULT '0',
[limitCalls] int CHECK ([limitCalls] >= 0) DEFAULT '30',
[dialOriginateCallerIdName] varchar(255) DEFAULT NULL,
[dialOriginateCallerIdNumber] varchar(255) DEFAULT NULL,
[dialOriginateTimeout] int CHECK ([dialOriginateTimeout] >= 0) DEFAULT '30',
[dialCongestionMaxRetry] int CHECK ([dialCongestionMaxRetry] >= 0) DEFAULT '3',
[dialCongestionRetryFrequency] int CHECK ([dialCongestionRetryFrequency] >= 0) DEFAULT '150',
[dialBusyMaxRetry] int CHECK ([dialBusyMaxRetry] >= 0) DEFAULT '3',
[dialBusyRetryFrequency] int CHECK ([dialBusyRetryFrequency] >= 0) DEFAULT '150',
[dialNoAnswerMaxRetry] int CHECK ([dialNoAnswerMaxRetry] >= 0) DEFAULT '3',
[dialNoAnswerRetryFrequency] int CHECK ([dialNoAnswerRetryFrequency] >= 0) DEFAULT '150',
[dialGlobalMaxRetry] int CHECK ([dialGlobalMaxRetry] >= 0) DEFAULT '4',
[dialTimezone] varchar(255) DEFAULT NULL,
[dialGlobalInterval] varchar(255) DEFAULT '07:00-22:00,*,*,*',
[dialCheckDuplicateType] varchar(11) CHECK ([dialCheckDuplicateType] IN('always','never','onlyIfOpen')) DEFAULT 'always',
[dialAMDActive] bit DEFAULT '0',
[dialAMDInitialSilence] int CHECK ([dialAMDInitialSilence] >= 0) DEFAULT '2500',
[dialAMDGreeting] int CHECK ([dialAMDGreeting] >= 0) DEFAULT '1500',
[dialAMDAfterGreetingSilence] int CHECK ([dialAMDAfterGreetingSilence] >= 0) DEFAULT '800',
[dialAMDTotalAnalysisTime] int CHECK ([dialAMDTotalAnalysisTime] >= 0) DEFAULT '5000',
[dialAMDMinWordLength] int CHECK ([dialAMDMinWordLength] >= 0) DEFAULT '100',
[dialAMDBetweenWordsSilence] int CHECK ([dialAMDBetweenWordsSilence] >= 0) DEFAULT '50',
[dialAMDMaximumNumberOfWords] int CHECK ([dialAMDMaximumNumberOfWords] >= 0) DEFAULT '3',
[dialAMDSilenceThreshold] int CHECK ([dialAMDSilenceThreshold] >= 0) DEFAULT '256',
[dialAMDMaximumWordLength] int CHECK ([dialAMDMaximumWordLength] >= 0) DEFAULT '5000',
[dialOrderByScheduledAt] varchar(4) CHECK ([dialOrderByScheduledAt] in ('DESC','ASC')) DEFAULT 'DESC',
[dialPrefix] varchar(255) DEFAULT NULL,
[dialRandomLastDigitCallerIdNumber] int CHECK ([dialRandomLastDigitCallerIdNumber] >= 0) DEFAULT '0',
[dialCutDigit] int CHECK ([dialCutDigit] >= 0) DEFAULT '0',
[createdAt] datetime NOT NULL,
[updatedAt] datetime NOT NULL,
[TrunkId] int DEFAULT NULL,
[TrunkBackupId] int DEFAULT NULL,
[IntervalId] int DEFAULT NULL,
[SquareProjectId] int DEFAULT NULL,
[dialNoSuchNumberMaxRetry] int DEFAULT '3',
[dialNoSuchNumberRetryFrequency] int DEFAULT '150',
[dialDropMaxRetry] int DEFAULT '3',
[dialDropRetryFrequency] int DEFAULT '150',
[dialAbandonedMaxRetry] int DEFAULT '3',
[dialAbandonedRetryFrequency] int DEFAULT '150',
[dialMachineMaxRetry] int DEFAULT '3',
[dialMachineRetryFrequency] int DEFAULT '150',
[dialAgentRejectMaxRetry] int DEFAULT '3',
[dialAgentRejectRetryFrequency] int DEFAULT '150',
PRIMARY KEY ([id]))
;



-- voice_recordings
CREATE TABLE ggutman_telemarketing_2_V4.dbo.voice_recordings (
[id] int NOT NULL,
[uniqueid] varchar(255) DEFAULT NULL,
[channel] varchar(255) DEFAULT NULL,
[membername] varchar(255) DEFAULT NULL,
[calleridnum] varchar(255) DEFAULT NULL,
[calleridname] varchar(255) DEFAULT NULL,
[connectedlinenum] varchar(255) DEFAULT NULL,
[connectedlinename] varchar(255) DEFAULT NULL,
[accountcode] varchar(255) DEFAULT NULL,
[context] varchar(255) DEFAULT NULL,
[exten] varchar(255) DEFAULT NULL,
[value] varchar(255) DEFAULT NULL,
[type] varchar(255) DEFAULT NULL,
[rating] int DEFAULT NULL,
[queue] varchar(255) DEFAULT NULL,
[userDisposition] varchar(255) DEFAULT NULL,
[userSecondDisposition] varchar(255) DEFAULT NULL,
[userThirdDisposition] varchar(255) DEFAULT NULL,
[location] varchar(max),
[transcribeName] varchar(255) DEFAULT NULL,
[transcribeStatus] varchar(255) DEFAULT 'NEW',
[fileUri] varchar(max),
[fileText] varchar(max),
[failureReason] varchar(max),
[sentiment] varchar(255) DEFAULT NULL,
[sPositive] float DEFAULT NULL,
[sNegative] float DEFAULT NULL,
[sNeutral] float DEFAULT NULL,
[sMixed] float DEFAULT NULL,
[tempSentiment] smallint DEFAULT '0',
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[UserId] int DEFAULT NULL,
PRIMARY KEY ([id],[createdAt])
);



-- Dates log:
CREATE TABLE ggutman_telemarketing_2_V4.dbo.db_copy_logs (
[_created_on] [datetime] NOT NULL DEFAULT (getdate()),
[createdAt_max_date] datetime2(0) NOT NULL,
[updatedAt_max_date] datetime2(0) NOT NULL);

SELECT table_name, max(created_at_day_shift), max(updated_at_day_shift) FROM ggutman_telemarketing_2_V4.dbo.db_copy_logs GROUP BY table_name;
/*
 * 
 * 
 * 
 * 
 * */

select count(*) from ggutman_telemarketing_2_V4.dbo.cm_hopper;
select count(*) from ggutman_telemarketing_2_V4.dbo.cm_hopper_final;
select count(*) from ggutman_telemarketing_2_V4.dbo.cm_hopper_history;
select count(*) from ggutman_telemarketing_2_V4.dbo.cm_contacts;
select count(*) from ggutman_telemarketing_2_V4.dbo.campaigns;
select count(*) from ggutman_telemarketing_2_V4.dbo.voice_recordings;

select * from ggutman_telemarketing_2_V4.dbo.mysql_copy_last_dates;

CREATE VIEW dbo.mysql_copy_last_dates as
SELECT * FROM (
select max(createdAt) createdAt, max(updatedAt) updatedAt, 'cm_hopper' table_name from ggutman_telemarketing_2_V4.dbo.cm_hopper union
select max(createdAt) createdAt, max(updatedAt) updatedAt, 'cm_hopper_final' table_name from ggutman_telemarketing_2_V4.dbo.cm_hopper_final union
select max(createdAt) createdAt, max(updatedAt) updatedAt, 'cm_hopper_history' table_name from ggutman_telemarketing_2_V4.dbo.cm_hopper_history union
select max(createdAt) createdAt, max(updatedAt) updatedAt, 'cm_contacts' table_name from ggutman_telemarketing_2_V4.dbo.cm_contacts union
select max(createdAt) createdAt, max(updatedAt) updatedAt, 'campaigns' table_name from ggutman_telemarketing_2_V4.dbo.campaigns union 
select max(createdAt) createdAt, max(updatedAt) updatedAt, 'voice_recordings' table_name from ggutman_telemarketing_2_V4.dbo.voice_recordings) a;



SELECT TOP 10 *  FROM cm_hopper_final;
SELECT TOP 10 * FROM cm_hopper;
SELECT * FROM dbo.campaigns c ;

SELECT TOP 10 scheduledat, phone, ContactId, campaignid, ListId FROM cm_hopper ch WHERE scheduledat >= '2021-10-05 05:52:21.000' AND ContactId =27672718;
SELECT TOP 10 scheduledat, calleridnum, ContactId, CampaignId, ListId  FROM cm_hopper_final chf WHERE scheduledat >= '2021-10-05 05:52:21.000' AND ContactId =27672718;

DELETE FROM dbo.cm_hopper WHERE id in
(SELECT 
distinct
count(ch.id)
FROM 
cm_hopper ch INNER JOIN cm_hopper_final chf
ON 
ch.phone = chf.calleridnum and
ch.ContactId = chf.ContactId and
ch.campaignid = chf.campaignid and
ch.ListId = chf.ListId);


EXECUTE sp_helpindex cm_hopper_history;
-- Columnstore indices:
DROP INDEX cm_hopper_history.index_cm_hopper_history_cols;
DROP INDEX cm_contacts.index_cm_contacts_cols;
DROP INDEX TlmContacts.index_TlmContacts_cols;
CREATE NONCLUSTERED  COLUMNSTORE INDEX index_cm_hopper_history_cols ON [cm_hopper_history]
        (contactid, calleridnum, uniqueid, statedesc, campaign, updatedAt, ListId, 
         talktime, starttime, campaignid) 
    WITH (ONLINE=ON)
    ;
CREATE NONCLUSTERED  COLUMNSTORE INDEX index_TlmContacts_cols ON [TlmContacts]
        (tel1, tel2, tel3, "Source", gender, Category, ContactComments, city)  
    WITH (ONLINE=ON)
   ;
CREATE NONCLUSTERED  COLUMNSTORE INDEX index_cm_contacts_info_cols ON [cm_contacts_info]
        (phone, cf_15, cf_17, cf_13, cf_16, city)  
    WITH (ONLINE=ON)
   ;
CREATE NONCLUSTERED  COLUMNSTORE INDEX index_cm_contacts_cols ON [cm_contacts]
        (phone, firstName, ListId, id)  
    WITH (ONLINE=ON)
   ;
CREATE NONCLUSTERED  COLUMNSTORE INDEX index_campaigns_cols ON [campaigns]
        (id, name)  
    WITH (ONLINE=ON)
   ;
   
-- Indices:
CREATE NONCLUSTERED INDEX index_cm_hopper_history_ContactId ON [cm_hopper_history] (ContactId);
CREATE NONCLUSTERED INDEX index_cm_hopper_history_phone ON [cm_hopper_history] (calleridnum);
CREATE NONCLUSTERED INDEX index_cm_hopper_history_uniqueid ON [cm_hopper_history] (uniqueid);
CREATE NONCLUSTERED INDEX index_cm_hopper_history_statedesc ON [cm_hopper_history] (statedesc);
CREATE NONCLUSTERED INDEX index_cm_hopper_history_campaign ON [cm_hopper_history] (campaign);
CREATE NONCLUSTERED INDEX index_cm_hopper_history_updatedAt ON [cm_hopper_history] (updatedAt);
CREATE NONCLUSTERED INDEX index_cm_hopper_history_ListId ON [cm_hopper_history] (ListId);
CREATE NONCLUSTERED INDEX index_cm_hopper_final_uniqueid ON [cm_hopper_final] (uniqueid);
CREATE NONCLUSTERED INDEX index_voice_recordings_uniqueid ON [voice_recordings] (uniqueid); 
CREATE NONCLUSTERED INDEX index_cm_contacts_phone ON [cm_contacts] (phone);
CREATE NONCLUSTERED INDEX index_cm_contacts_firstName ON [cm_contacts] (firstName);
CREATE NONCLUSTERED INDEX index_cm_hopper_phone ON [cm_hopper] (phone);

CREATE UNIQUE CLUSTERED INDEX IX_cm_contacts_info 
	ON cm_contacts_info
	 (phone, cf_15, cf_17, cf_13);

SELECT TOP 10 * FROM cm_contacts_info cci ;

SELECT TOP 20 * FROM dbo.TlmContactData WHERE DataId = 24; -- DATA text IS YEAR OF born...

SELECT LEFT(tcd.DataText, PATINDEX('%/%',tcd.DataText)-1) day_, PATINDEX('%/%',tcd.DataText) string_to_date, tcd.DataText FROM dbo.TlmContacts tc 
LEFT JOIN dbo.TlmContactData tcd ON tc.ContactId = tcd.ContactId WHERE tcd.DataId = 24 ;

--DROP VIEW dbo.cm_contacts_info;
CREATE VIEW dbo.cm_contacts_info WITH SCHEMABINDING AS 
SELECT
	LEFT(CASE
		WHEN tc.tel1 IS NOT NULL THEN tc.tel1
		ELSE
		CASE
			WHEN tc.tel2 IS NOT NULL THEN tc.tel2
			ELSE
			CASE
				WHEN tc.tel3 IS NOT NULL THEN tc.tel3
				ELSE NULL
			END
		END
	END, 100) phone,
	LEFT("Source", 200) cf_15,
	gender cf_17,
	LEFT(Category, 200) cf_13,
	LEFT(ContactComments, 200) cf_16,
	LEFT(city, 100) city 
FROM
	dbo.TlmContacts tc;

SELECT DISTINCT chf.campaign FROM dbo.cm_hopper_history chf WHERE chf.campaign IS NOT null;
SELECT TOP 10 * FROM dbo.TlmContacts WHERE ContactId = 1587253;
SELECT TOP 10 * FROM dbo.cm_contacts cc WHERE id = 1587253;
SELECT TOP 10 * FROM dbo.managers;
select 
    o.name,c.name 
    from sys.columns            c
        inner join sys.objects  o on c.object_id=o.object_id
        WHERE c.name LIKE '%date%'
    order by c.name;


-- DBA: 
SELECT sqltext.TEXT,
req.session_id,
req.status,
req.command,
req.cpu_time,
req.total_elapsed_time
FROM sys.dm_exec_requests req
CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext;

KILL 57;


-- Maintenance:
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
/*AND DDIPS.avg_fragmentation_in_percent > 9.9*/
AND S.name = 'dbo'
ORDER BY DDIPS.avg_fragmentation_in_percent DESC;



ALTER INDEX "unique_values" ON "TlmContacts2CallsCampaign" REBUILD WITH(ONLINE=ON);



/*
 * RAW tables:
 * */
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_raw;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_final_raw;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_history_raw;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.cm_contacts_raw;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.campaigns_raw;
--DROP TABLE ggutman_telemarketing_2_V4.dbo.voice_recordings_raw;
------------------------------------------------------------
truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_raw;
truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_final_raw;
truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_history_raw;
truncate TABLE ggutman_telemarketing_2_V4.dbo.cm_contacts_raw;
truncate TABLE ggutman_telemarketing_2_V4.dbo.campaigns_raw;
truncate TABLE ggutman_telemarketing_2_V4.dbo.voice_recordings_raw;
------------------------------------------------------------

-- CM_HOPPER
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_raw (
[id] int NOT NULL,
[phone] varchar(255) NOT NULL,
[active] smallint DEFAULT '0',
[scheduledat] datetime2(0) DEFAULT '2020-08-26 04:55:56',
[countbusyretry] int DEFAULT '0',
[countcongestionretry] int DEFAULT '0',
[countnoanswerretry] int DEFAULT '0',
[callback] smallint DEFAULT '0',
[callbackuniqueid] varchar(255) DEFAULT NULL,
[callbackat] datetime2(0) DEFAULT NULL,
[priority] int check ([priority] > 0) DEFAULT '2',
[recallme] smallint DEFAULT '0',
[ContactId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[UserId] int DEFAULT NULL,
[VoiceQueueId] int DEFAULT NULL,
[CampaignId] int DEFAULT NULL,
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[OwnerId] int DEFAULT NULL,
[countnosuchnumberretry] int DEFAULT '0',
[countdropretry] int DEFAULT '0',
[countabandonedretry] int DEFAULT '0',
[countmachineretry] int DEFAULT '0',
[countagentrejectretry] int DEFAULT '0',
PRIMARY KEY ([id]),
)  ;



-- CM_HOPPER_FINAL
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_final_raw (
[id] int NOT NULL,
[state] int DEFAULT NULL,
[statedesc] varchar(255) DEFAULT NULL,
[scheduledat] datetime2(0) DEFAULT NULL,
[countbusyretry] int DEFAULT '0',
[countcongestionretry] int DEFAULT '0',
[countnoanswerretry] int DEFAULT '0',
[countglobal] int DEFAULT '0',
[uniqueid] varchar(255) DEFAULT NULL,
[originatecalleridnum] varchar(255) DEFAULT NULL,
[originatecalleridname] varchar(255) DEFAULT NULL,
[calleridnum] varchar(255) DEFAULT NULL,
[calleridname] varchar(255) DEFAULT NULL,
[starttime] datetime2(0) DEFAULT NULL,
[responsetime] datetime2(0) DEFAULT NULL,
[answertime] datetime2(0) DEFAULT NULL,
[droptime] datetime2(0) DEFAULT NULL,
[endtime] datetime2(0) DEFAULT NULL,
[ringtime] int DEFAULT '0',
[holdtime] int DEFAULT '0',
[talktime] int DEFAULT '0',
[followuptime] int DEFAULT '0',
[dropreason] varchar(255) DEFAULT NULL,
[campaign] varchar(255) DEFAULT NULL,
[campaigntype] varchar(255) DEFAULT NULL,
[membername] varchar(255) DEFAULT NULL,
[reason] varchar(255) DEFAULT NULL,
[disposition] varchar(255) DEFAULT NULL,
[secondDisposition] varchar(255) DEFAULT NULL,
[thirdDisposition] varchar(255) DEFAULT NULL,
[dispositionat] datetime2(0) DEFAULT NULL,
[amd] smallint DEFAULT '0',
[fax] smallint DEFAULT '0',
[blacklist] smallint DEFAULT '0',
[rescheduled] smallint DEFAULT '0',
[rescheduledat] datetime2(0) DEFAULT NULL,
[callback] smallint DEFAULT '0',
[callbackuniqueid] varchar(255) DEFAULT NULL,
[callbackat] datetime2(0) DEFAULT NULL,
[deleted] varchar(255) DEFAULT NULL,
[deletedat] datetime2(0) DEFAULT NULL,
[recallme] smallint DEFAULT '0',
[agiafterat] datetime2(0) DEFAULT NULL,
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[UserId] int DEFAULT NULL,
[VoiceQueueId] int DEFAULT NULL,
[ContactId] int DEFAULT NULL,
[CampaignId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[countnosuchnumberretry] int DEFAULT '0',
[countdropretry] int DEFAULT '0',
[countabandonedretry] int DEFAULT '0',
[countmachineretry] int DEFAULT '0',
[countagentrejectretry] int DEFAULT '0',
PRIMARY KEY ([id],[createdAt])
);



-- cm_hopper_history
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_hopper_history_raw (
[id] int NOT NULL,
[state] int DEFAULT NULL,
[statedesc] varchar(255) DEFAULT NULL,
[scheduledat] datetime2(0) DEFAULT NULL,
[countbusyretry] int DEFAULT '0',
[countcongestionretry] int DEFAULT '0',
[countnoanswerretry] int DEFAULT '0',
[countglobal] int DEFAULT '0',
[uniqueid] varchar(255) DEFAULT NULL,
[originatecalleridnum] varchar(255) DEFAULT NULL,
[originatecalleridname] varchar(255) DEFAULT NULL,
[calleridnum] varchar(255) DEFAULT NULL,
[calleridname] varchar(255) DEFAULT NULL,
[starttime] datetime2(0) DEFAULT NULL,
[responsetime] datetime2(0) DEFAULT NULL,
[answertime] datetime2(0) DEFAULT NULL,
[droptime] datetime2(0) DEFAULT NULL,
[endtime] datetime2(0) DEFAULT NULL,
[ringtime] int DEFAULT '0',
[holdtime] int DEFAULT '0',
[talktime] int DEFAULT '0',
[followuptime] int DEFAULT '0',
[dropreason] varchar(255) DEFAULT NULL,
[campaign] varchar(255) DEFAULT NULL,
[campaigntype] varchar(255) DEFAULT NULL,
[membername] varchar(255) DEFAULT NULL,
[reason] varchar(255) DEFAULT NULL,
[amd] smallint DEFAULT '0',
[fax] smallint DEFAULT '0',
[callback] smallint DEFAULT '0',
[callbackuniqueid] varchar(255) DEFAULT NULL,
[callbackat] datetime2(0) DEFAULT NULL,
[recallme] smallint DEFAULT '0',
[editedat] datetime2(0) DEFAULT NULL,
[edited] smallint DEFAULT '0',
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[UserId] int DEFAULT NULL,
[VoiceQueueId] int DEFAULT NULL,
[ContactId] int DEFAULT NULL,
[CampaignId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[countnosuchnumberretry] int DEFAULT '0',
[countdropretry] int DEFAULT '0',
[countabandonedretry] int DEFAULT '0',
[countmachineretry] int DEFAULT '0',
[countagentrejectretry] int DEFAULT '0',
PRIMARY KEY ([id],[createdAt])
);


-- cm_contacts
CREATE TABLE ggutman_telemarketing_2_V4.dbo.cm_contacts_raw (
[id] int NOT NULL,
[firstName] varchar(255) NOT NULL,
[lastName] varchar(255) DEFAULT NULL,
[street] varchar(255) DEFAULT NULL,
[postalCode] varchar(255) DEFAULT NULL,
[city] varchar(255) DEFAULT NULL,
[country] varchar(255) DEFAULT NULL,
[dateOfBirth] varchar(255) DEFAULT NULL,
[description] varchar(max),
[phone] varchar(255) DEFAULT NULL,
[mobile] varchar(255) DEFAULT NULL,
[fax] varchar(255) DEFAULT NULL,
[email] varchar(255) DEFAULT NULL,
[url] varchar(255) DEFAULT NULL,
[facebook] varchar(255) DEFAULT NULL,
[fb_data] varchar(255) DEFAULT NULL,
[twitter] varchar(255) DEFAULT NULL,
[skype] varchar(255) DEFAULT NULL,
[teams] varchar(255) DEFAULT NULL,
[viber] varchar(255) DEFAULT NULL,
[line] varchar(255) DEFAULT NULL,
[wechat] varchar(255) DEFAULT NULL,
[telegram] varchar(255) DEFAULT NULL,
[UserId] int DEFAULT NULL,
[priority] int check ([priority] > 0) DEFAULT '2',
[scheduledat] datetime2(0) DEFAULT NULL,
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[deletedAt] datetime2(0) DEFAULT NULL,
[CompanyId] int DEFAULT NULL,
[ListId] int DEFAULT NULL,
[cf_1] int DEFAULT NULL,
[cf_2] int DEFAULT NULL,
[cf_3] varchar(max),
[cf_4] varchar(max),
[cf_5] varchar(max),
[cf_6] varchar(max),
[cf_7] varchar(max),
[cf_8] varchar(max),
[cf_9] smallint DEFAULT '0',
[cf_10] smallint DEFAULT '0',
[cf_11] smallint DEFAULT '0',
[cf_12] varchar(max),
[cf_13] varchar(max),
[cf_15] varchar(max),
[cf_16] varchar(max),
[cf_17] varchar(max),
[cf_18] varchar(max),
[cf_19] varchar(max),
[cf_20] varchar(max),
[cf_21] varchar(max),
[cf_22] varchar(max),
[cf_23] varchar(max),
PRIMARY KEY ([id]));


-- campaigns
CREATE TABLE ggutman_telemarketing_2_V4.dbo.campaigns_raw (
[id] int NOT NULL,
[name] varchar(255) NOT NULL,
[type] varchar(255) NOT NULL CHECK ([type] IN('ivr')) DEFAULT 'ivr',
[description] varchar(255) DEFAULT NULL,
[active] bit DEFAULT '0',
[limitCalls] int CHECK ([limitCalls] >= 0) DEFAULT '30',
[dialOriginateCallerIdName] varchar(255) DEFAULT NULL,
[dialOriginateCallerIdNumber] varchar(255) DEFAULT NULL,
[dialOriginateTimeout] int CHECK ([dialOriginateTimeout] >= 0) DEFAULT '30',
[dialCongestionMaxRetry] int CHECK ([dialCongestionMaxRetry] >= 0) DEFAULT '3',
[dialCongestionRetryFrequency] int CHECK ([dialCongestionRetryFrequency] >= 0) DEFAULT '150',
[dialBusyMaxRetry] int CHECK ([dialBusyMaxRetry] >= 0) DEFAULT '3',
[dialBusyRetryFrequency] int CHECK ([dialBusyRetryFrequency] >= 0) DEFAULT '150',
[dialNoAnswerMaxRetry] int CHECK ([dialNoAnswerMaxRetry] >= 0) DEFAULT '3',
[dialNoAnswerRetryFrequency] int CHECK ([dialNoAnswerRetryFrequency] >= 0) DEFAULT '150',
[dialGlobalMaxRetry] int CHECK ([dialGlobalMaxRetry] >= 0) DEFAULT '4',
[dialTimezone] varchar(255) DEFAULT NULL,
[dialGlobalInterval] varchar(255) DEFAULT '07:00-22:00,*,*,*',
[dialCheckDuplicateType] varchar(11) CHECK ([dialCheckDuplicateType] IN('always','never','onlyIfOpen')) DEFAULT 'always',
[dialAMDActive] bit DEFAULT '0',
[dialAMDInitialSilence] int CHECK ([dialAMDInitialSilence] >= 0) DEFAULT '2500',
[dialAMDGreeting] int CHECK ([dialAMDGreeting] >= 0) DEFAULT '1500',
[dialAMDAfterGreetingSilence] int CHECK ([dialAMDAfterGreetingSilence] >= 0) DEFAULT '800',
[dialAMDTotalAnalysisTime] int CHECK ([dialAMDTotalAnalysisTime] >= 0) DEFAULT '5000',
[dialAMDMinWordLength] int CHECK ([dialAMDMinWordLength] >= 0) DEFAULT '100',
[dialAMDBetweenWordsSilence] int CHECK ([dialAMDBetweenWordsSilence] >= 0) DEFAULT '50',
[dialAMDMaximumNumberOfWords] int CHECK ([dialAMDMaximumNumberOfWords] >= 0) DEFAULT '3',
[dialAMDSilenceThreshold] int CHECK ([dialAMDSilenceThreshold] >= 0) DEFAULT '256',
[dialAMDMaximumWordLength] int CHECK ([dialAMDMaximumWordLength] >= 0) DEFAULT '5000',
[dialOrderByScheduledAt] varchar(4) CHECK ([dialOrderByScheduledAt] in ('DESC','ASC')) DEFAULT 'DESC',
[dialPrefix] varchar(255) DEFAULT NULL,
[dialRandomLastDigitCallerIdNumber] int CHECK ([dialRandomLastDigitCallerIdNumber] >= 0) DEFAULT '0',
[dialCutDigit] int CHECK ([dialCutDigit] >= 0) DEFAULT '0',
[createdAt] datetime NOT NULL,
[updatedAt] datetime NOT NULL,
[TrunkId] int DEFAULT NULL,
[TrunkBackupId] int DEFAULT NULL,
[IntervalId] int DEFAULT NULL,
[SquareProjectId] int DEFAULT NULL,
[dialNoSuchNumberMaxRetry] int DEFAULT '3',
[dialNoSuchNumberRetryFrequency] int DEFAULT '150',
[dialDropMaxRetry] int DEFAULT '3',
[dialDropRetryFrequency] int DEFAULT '150',
[dialAbandonedMaxRetry] int DEFAULT '3',
[dialAbandonedRetryFrequency] int DEFAULT '150',
[dialMachineMaxRetry] int DEFAULT '3',
[dialMachineRetryFrequency] int DEFAULT '150',
[dialAgentRejectMaxRetry] int DEFAULT '3',
[dialAgentRejectRetryFrequency] int DEFAULT '150',
PRIMARY KEY ([id]))
;



-- voice_recordings
CREATE TABLE ggutman_telemarketing_2_V4.dbo.voice_recordings_raw (
[id] int NOT NULL,
[uniqueid] varchar(255) DEFAULT NULL,
[channel] varchar(255) DEFAULT NULL,
[membername] varchar(255) DEFAULT NULL,
[calleridnum] varchar(255) DEFAULT NULL,
[calleridname] varchar(255) DEFAULT NULL,
[connectedlinenum] varchar(255) DEFAULT NULL,
[connectedlinename] varchar(255) DEFAULT NULL,
[accountcode] varchar(255) DEFAULT NULL,
[context] varchar(255) DEFAULT NULL,
[exten] varchar(255) DEFAULT NULL,
[value] varchar(255) DEFAULT NULL,
[type] varchar(255) DEFAULT NULL,
[rating] int DEFAULT NULL,
[queue] varchar(255) DEFAULT NULL,
[userDisposition] varchar(255) DEFAULT NULL,
[userSecondDisposition] varchar(255) DEFAULT NULL,
[userThirdDisposition] varchar(255) DEFAULT NULL,
[location] varchar(max),
[transcribeName] varchar(255) DEFAULT NULL,
[transcribeStatus] varchar(255) DEFAULT 'NEW',
[fileUri] varchar(max),
[fileText] varchar(max),
[failureReason] varchar(max),
[sentiment] varchar(255) DEFAULT NULL,
[sPositive] float DEFAULT NULL,
[sNegative] float DEFAULT NULL,
[sNeutral] float DEFAULT NULL,
[sMixed] float DEFAULT NULL,
[tempSentiment] smallint DEFAULT '0',
[createdAt] datetime2(0) NOT NULL,
[updatedAt] datetime2(0) NOT NULL,
[UserId] int DEFAULT NULL,
PRIMARY KEY ([id],[createdAt])
);




select * from ggutman_telemarketing_2_V4.dbo.cm_hopper_raw;
select * from ggutman_telemarketing_2_V4.dbo.cm_hopper_final_raw;
select * from ggutman_telemarketing_2_V4.dbo.cm_hopper_history_raw;
select * from ggutman_telemarketing_2_V4.dbo.cm_contacts_raw;
select * from ggutman_telemarketing_2_V4.dbo.campaigns_raw;
select * from ggutman_telemarketing_2_V4.dbo.voice_recordings_raw;


MERGE dbo.cm_hopper AS T
USING dbo.cm_hopper_raw AS S 
ON (T.ID = S.ID)
WHEN MATCHED  
THEN UPDATE SET 
	T.id = S.id,
	T.phone = S.phone,
	T.active = S.active,
	T.scheduledat = S.scheduledat,
	T.countbusyretry = S.countbusyretry,
	T.countcongestionretry = S.countcongestionretry,
	T.countnoanswerretry = S.countnoanswerretry,
	T.callback = S.callback,
	T.callbackuniqueid = S.callbackuniqueid,
	T.callbackat = S.callbackat,
	T.priority = S.priority,
	T.recallme = S.recallme,
	T.ContactId = S.ContactId,
	T.ListId = S.ListId,
	T.UserId = S.UserId,
	T.VoiceQueueId = S.VoiceQueueId,
	T.CampaignId = S.CampaignId,
	T.createdAt = S.createdAt,
	T.updatedAt = S.updatedAt,
	T.OwnerId = S.OwnerId,
	T.countnosuchnumberretry = S.countnosuchnumberretry,
	T.countdropretry = S.countdropretry,
	T.countabandonedretry = S.countabandonedretry,
	T.countmachineretry = S.countmachineretry,
	T.countagentrejectretry = S.countagentrejectretry
WHEN NOT MATCHED BY TARGET 
THEN INSERT 
	(id,
	phone,
	active,
	scheduledat,
	countbusyretry,
	countcongestionretry,
	countnoanswerretry,
	callback,
	callbackuniqueid,
	callbackat,
	priority,
	recallme,
	ContactId,
	ListId,
	UserId,
	VoiceQueueId,
	CampaignId,
	createdAt,
	updatedAt,
	OwnerId,
	countnosuchnumberretry,
	countdropretry,
	countabandonedretry,
	countmachineretry,
	countagentrejectretry) 
VALUES 
	(s.id,
	s.phone,
	s.active,
	s.scheduledat,
	s.countbusyretry,
	s.countcongestionretry,
	s.countnoanswerretry,
	s.callback,
	s.callbackuniqueid,
	s.callbackat,
	s.priority,
	s.recallme,
	s.ContactId,
	s.ListId,
	s.UserId,
	s.VoiceQueueId,
	s.CampaignId,
	s.createdAt,
	s.updatedAt,
	s.OwnerId,
	s.countnosuchnumberretry,
	s.countdropretry,
	s.countabandonedretry,
	s.countmachineretry,
	s.countagentrejectretry);






