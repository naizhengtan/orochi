--
-- Table structure for table `ActionLog`
--

DROP TABLE IF EXISTS `ActionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActionLog` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `paperId` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipaddr` varchar(16) DEFAULT NULL,
  `action` varbinary(4096) NOT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`logId`),
  KEY `logId` (`logId`),
  KEY `contactId` (`contactId`),
  KEY `paperId` (`paperId`),
  KEY `logId_key` (`logId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=865 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Capability`
--

DROP TABLE IF EXISTS `Capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Capability` (
  `capabilityId` int(11) NOT NULL AUTO_INCREMENT,
  `capabilityType` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `timeExpires` int(11) NOT NULL,
  `salt` varbinary(255) NOT NULL,
  `data` varbinary(4096) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`capabilityId`),
  KEY `capabilityId` (`capabilityId`),
  KEY `salt` (`salt`),
  KEY `capabilityId_key` (`capabilityId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContactInfo`
--

DROP TABLE IF EXISTS `ContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactInfo` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(60) NOT NULL DEFAULT '',
  `lastName` varchar(60) NOT NULL DEFAULT '',
  `unaccentedName` varchar(120) NOT NULL DEFAULT '',
  `email` varchar(120) NOT NULL,
  `preferredEmail` varchar(120) DEFAULT NULL,
  `affiliation` varchar(2048) NOT NULL DEFAULT '',
  `voicePhoneNumber` varchar(256) DEFAULT NULL,
  `faxPhoneNumber` varchar(256) DEFAULT NULL,
  `password` varbinary(2048) NOT NULL,
  `passwordTime` int(11) NOT NULL DEFAULT '0',
  `passwordIsCdb` tinyint(1) NOT NULL DEFAULT '0',
  `collaborators` varbinary(8192) DEFAULT NULL,
  `creationTime` int(11) NOT NULL DEFAULT '0',
  `lastLogin` int(11) NOT NULL DEFAULT '0',
  `defaultWatch` int(11) NOT NULL DEFAULT '2',
  `roles` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `contactTags` varbinary(4096) DEFAULT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`contactId`),
  KEY `contactId` (`contactId`),
  KEY `contactIdRoles` (`contactId`,`roles`),
  KEY `email` (`email`),
  KEY `fullName` (`lastName`,`firstName`,`email`),
  KEY `contactId_key` (`contactId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Formula`
--

DROP TABLE IF EXISTS `Formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Formula` (
  `formulaId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `heading` varchar(200) NOT NULL DEFAULT '',
  `headingTitle` varbinary(4096) NOT NULL,
  `expression` varbinary(4096) NOT NULL,
  `authorView` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` int(11) NOT NULL DEFAULT '0',
  `timeModified` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`formulaId`),
  KEY `formulaId` (`formulaId`),
  KEY `formulaId_key` (`formulaId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MailLog`
--

DROP TABLE IF EXISTS `MailLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MailLog` (
  `mailId` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` varchar(200) NOT NULL,
  `q` varchar(4096) DEFAULT NULL,
  `t` varchar(200) DEFAULT NULL,
  `paperIds` text,
  `cc` text,
  `replyto` text,
  `subject` text,
  `emailBody` text,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `mailId` (`mailId`),
  PRIMARY KEY (`start_ts`, `mailId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Paper`
--

DROP TABLE IF EXISTS `Paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paper` (
  `paperId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `authorInformation` varbinary(8192) DEFAULT NULL,
  `abstract` varbinary(16384) DEFAULT NULL,
  `collaborators` varbinary(8192) DEFAULT NULL,
  `timeSubmitted` int(11) NOT NULL DEFAULT '0',
  `timeWithdrawn` int(11) NOT NULL DEFAULT '0',
  `timeFinalSubmitted` int(11) NOT NULL DEFAULT '0',
  `paperStorageId` int(11) NOT NULL DEFAULT '0',
  `sha1` varbinary(20) NOT NULL DEFAULT '',
  `finalPaperStorageId` int(11) NOT NULL DEFAULT '0',
  `blind` tinyint(1) NOT NULL DEFAULT '1',
  `outcome` tinyint(1) NOT NULL DEFAULT '0',
  `leadContactId` int(11) NOT NULL DEFAULT '0',
  `shepherdContactId` int(11) NOT NULL DEFAULT '0',
  `managerContactId` int(11) NOT NULL DEFAULT '0',
  `capVersion` int(1) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `mimetype` varchar(80) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `withdrawReason` varbinary(1024) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`paperId`),
  KEY `paperId` (`paperId`),
  KEY `title` (`title`),
  KEY `timeSubmitted` (`timeSubmitted`),
  KEY `leadContactId` (`leadContactId`),
  KEY `shepherdContactId` (`shepherdContactId`),
  KEY `paperId_key` (`paperId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperComment`
--

DROP TABLE IF EXISTS `PaperComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperComment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `timeModified` int(11) NOT NULL,
  `timeNotified` int(11) NOT NULL DEFAULT '0',
  `comment` varbinary(32767) DEFAULT NULL,
  `commentType` int(11) NOT NULL DEFAULT '0',
  `replyTo` int(11) NOT NULL,
  `paperStorageId` int(11) NOT NULL DEFAULT '0',
  `ordinal` int(11) NOT NULL DEFAULT '0',
  `commentTags` varbinary(1024) DEFAULT NULL,
  `commentRound` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`commentId`),
  KEY `commentId` (`commentId`),
  KEY `contactId` (`contactId`),
  KEY `paperId` (`paperId`),
  KEY `contactPaper` (`contactId`,`paperId`),
  KEY `timeModified` (`timeModified`),
  KEY `commentId_key` (`commentId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperConflict`
--

DROP TABLE IF EXISTS `PaperConflict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperConflict` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `conflictType` tinyint(1) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `contactPaper` (`start_ts`,`contactId`,`paperId`),
  KEY `contactPaperConflict` (`contactId`,`paperId`,`conflictType`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperOption`
--

DROP TABLE IF EXISTS `PaperOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperOption` (
  `paperId` int(11) NOT NULL,
  `optionId` int(11) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `data` varbinary(32768) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `paperOption` (`start_ts`,`paperId`,`optionId`,`value`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperReview`
--

DROP TABLE IF EXISTS `PaperReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperReview` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `reviewToken` int(11) NOT NULL DEFAULT '0',
  `reviewType` tinyint(1) NOT NULL DEFAULT '0',
  `reviewRound` int(1) NOT NULL DEFAULT '0',
  `requestedBy` int(11) NOT NULL DEFAULT '0',
  `timeRequested` int(11) NOT NULL DEFAULT '0',
  `timeRequestNotified` int(11) NOT NULL DEFAULT '0',
  `reviewBlind` tinyint(1) NOT NULL DEFAULT '1',
  `reviewModified` int(1) DEFAULT NULL,
  `reviewSubmitted` int(1) DEFAULT NULL,
  `reviewNotified` int(1) DEFAULT NULL,
  `reviewAuthorNotified` int(11) NOT NULL DEFAULT '0',
  `reviewAuthorSeen` int(1) DEFAULT NULL,
  `reviewOrdinal` int(1) DEFAULT NULL,
  `reviewEditVersion` int(1) NOT NULL DEFAULT '0',
  `reviewNeedsSubmit` tinyint(1) NOT NULL DEFAULT '1',
  `overAllMerit` tinyint(1) NOT NULL DEFAULT '0',
  `reviewerQualification` tinyint(1) NOT NULL DEFAULT '0',
  `novelty` tinyint(1) NOT NULL DEFAULT '0',
  `technicalMerit` tinyint(1) NOT NULL DEFAULT '0',
  `interestToCommunity` tinyint(1) NOT NULL DEFAULT '0',
  `longevity` tinyint(1) NOT NULL DEFAULT '0',
  `grammar` tinyint(1) NOT NULL DEFAULT '0',
  `likelyPresentation` tinyint(1) NOT NULL DEFAULT '0',
  `suitableForShort` tinyint(1) NOT NULL DEFAULT '0',
  `paperSummary` mediumtext,
  `commentsToAuthor` mediumtext,
  `commentsToPC` mediumtext,
  `commentsToAddress` mediumtext,
  `weaknessOfPaper` mediumtext,
  `strengthOfPaper` mediumtext,
  `potential` tinyint(4) NOT NULL DEFAULT '0',
  `fixability` tinyint(4) NOT NULL DEFAULT '0',
  `textField7` mediumtext,
  `textField8` mediumtext,
  `reviewWordCount` int(11) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`reviewId`),
  KEY `reviewId` (`reviewId`),
  KEY `contactPaper` (`contactId`,`paperId`),
  KEY `paperId` (`paperId`,`reviewOrdinal`),
  KEY `reviewSubmitted` (`reviewSubmitted`),
  KEY `reviewNeedsSubmit` (`reviewNeedsSubmit`),
  KEY `reviewType` (`reviewType`),
  KEY `reviewRound` (`reviewRound`),
  KEY `requestedBy` (`requestedBy`),
  KEY `reviewId_key` (`reviewId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperReviewArchive`
--

DROP TABLE IF EXISTS `PaperReviewArchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperReviewArchive` (
  `reviewArchiveId` int(11) NOT NULL AUTO_INCREMENT,
  `reviewId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `reviewToken` int(11) NOT NULL DEFAULT '0',
  `reviewType` tinyint(1) NOT NULL DEFAULT '0',
  `reviewRound` int(1) NOT NULL DEFAULT '0',
  `requestedBy` int(11) NOT NULL DEFAULT '0',
  `timeRequested` int(11) NOT NULL DEFAULT '0',
  `timeRequestNotified` int(11) NOT NULL DEFAULT '0',
  `reviewBlind` tinyint(1) NOT NULL DEFAULT '1',
  `reviewModified` int(1) DEFAULT NULL,
  `reviewSubmitted` int(1) DEFAULT NULL,
  `reviewNotified` int(1) DEFAULT NULL,
  `reviewAuthorNotified` int(11) NOT NULL DEFAULT '0',
  `reviewAuthorSeen` int(1) DEFAULT NULL,
  `reviewOrdinal` int(1) DEFAULT NULL,
  `reviewNeedsSubmit` tinyint(1) NOT NULL DEFAULT '1',
  `overAllMerit` tinyint(1) NOT NULL DEFAULT '0',
  `reviewerQualification` tinyint(1) NOT NULL DEFAULT '0',
  `novelty` tinyint(1) NOT NULL DEFAULT '0',
  `technicalMerit` tinyint(1) NOT NULL DEFAULT '0',
  `interestToCommunity` tinyint(1) NOT NULL DEFAULT '0',
  `longevity` tinyint(1) NOT NULL DEFAULT '0',
  `grammar` tinyint(1) NOT NULL DEFAULT '0',
  `likelyPresentation` tinyint(1) NOT NULL DEFAULT '0',
  `suitableForShort` tinyint(1) NOT NULL DEFAULT '0',
  `paperSummary` mediumtext,
  `commentsToAuthor` mediumtext,
  `commentsToPC` mediumtext,
  `commentsToAddress` mediumtext,
  `weaknessOfPaper` mediumtext,
  `strengthOfPaper` mediumtext,
  `potential` tinyint(4) NOT NULL DEFAULT '0',
  `fixability` tinyint(4) NOT NULL DEFAULT '0',
  `textField7` mediumtext,
  `textField8` mediumtext,
  `reviewWordCount` int(11) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`reviewArchiveId`),
  KEY `reviewArchiveId` (`reviewArchiveId`),
  KEY `paperId` (`paperId`),
  KEY `reviewArchiveId_key` (`reviewArchiveId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperReviewPreference`
--

DROP TABLE IF EXISTS `PaperReviewPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperReviewPreference` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `preference` int(4) NOT NULL DEFAULT '0',
  `expertise` int(4) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `contactPaper` (`start_ts`, `contactId`,`paperId`),
  KEY `paperId` (`paperId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperReviewRefused`
--

DROP TABLE IF EXISTS `PaperReviewRefused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperReviewRefused` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `requestedBy` int(11) NOT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  KEY `paperId` (`paperId`),
  KEY `contactId` (`contactId`),
  KEY `requestedBy` (`requestedBy`),
  UNIQUE KEY `refusedPaper` (`start_ts`, `paperId`, `contactId`, `requestedBy`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperStorage`
--

DROP TABLE IF EXISTS `PaperStorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperStorage` (
  `paperStorageId` int(11) NOT NULL AUTO_INCREMENT,
  `paperId` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `mimetype` varchar(80) NOT NULL DEFAULT '',
  `paper` longblob,
  `compression` tinyint(1) NOT NULL DEFAULT '0',
  `sha1` varbinary(20) NOT NULL DEFAULT '',
  `documentType` int(3) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT NULL,
  `infoJson` varchar(255) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `filterType` int(3) DEFAULT NULL,
  `originalStorageId` int(11) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`paperStorageId`),
  KEY `paperStorageId` (`paperStorageId`),
  KEY `paperId` (`paperId`),
  KEY `mimetype` (`mimetype`),
  KEY `paperStorageId_key` (`paperStorageId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperTag`
--

DROP TABLE IF EXISTS `PaperTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperTag` (
  `paperId` int(11) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `tagIndex` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `paperTag` (`start_ts`, `paperId`,`tag`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperTopic`
--

DROP TABLE IF EXISTS `PaperTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperTopic` (
  `topicId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `paperTopic` (`start_ts`, `paperId`,`topicId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperWatch`
--

DROP TABLE IF EXISTS `PaperWatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaperWatch` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `watch` int(11) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `contactPaper` (`start_ts`,`contactId`,`paperId`),
  KEY `contactPaperWatch` (`contactId`,`paperId`,`watch`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReviewRating`
--

DROP TABLE IF EXISTS `ReviewRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReviewRating` (
  `reviewId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `reviewContact` (`start_ts`,`reviewId`,`contactId`),
  KEY `reviewContactRating` (`reviewId`,`contactId`,`rating`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReviewRequest`
--

DROP TABLE IF EXISTS `ReviewRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReviewRequest` (
  `paperId` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  `requestedBy` int(11) NOT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `paperEmail` (`start_ts`,`paperId`,`email`),
  KEY `paperId` (`paperId`),
  KEY `requestedBy` (`requestedBy`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Settings` (
  `name` varbinary(256) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `name` (`start_ts`,`name`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TopicArea`
--

DROP TABLE IF EXISTS `TopicArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TopicArea` (
  `topicId` int(11) NOT NULL AUTO_INCREMENT,
  `topicName` varchar(200) DEFAULT NULL,
  `start_ts` bigint(20) NOT NULL DEFAULT '0',
  `end_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`start_ts`,`topicId`),
  KEY `topicId` (`topicId`),
  KEY `topicName` (`topicName`),
  KEY `topicId_key` (`topicId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TopicInterest`
--

DROP TABLE IF EXISTS `TopicInterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TopicInterest` (
  `contactId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  `interest` int(1) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `contactTopic` (`start_ts`, `contactId`,`topicId`),
  INDEX `end_ts` (`end_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



