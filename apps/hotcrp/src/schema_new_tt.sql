-- MySQL dump 10.13  Distrib 5.6.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tt_hotcrp
-- ------------------------------------------------------
-- Server version	5.6.31-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
  KEY `logId_key` (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActionLog`
--

LOCK TABLES `ActionLog` WRITE;
/*!40000 ALTER TABLE `ActionLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActionLog` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `capabilityId_key` (`capabilityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Capability`
--

LOCK TABLES `Capability` WRITE;
/*!40000 ALTER TABLE `Capability` DISABLE KEYS */;
/*!40000 ALTER TABLE `Capability` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `contactId_key` (`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactInfo`
--

LOCK TABLES `ContactInfo` WRITE;
/*!40000 ALTER TABLE `ContactInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `formulaId_key` (`formulaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formula`
--

LOCK TABLES `Formula` WRITE;
/*!40000 ALTER TABLE `Formula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Formula` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `mailId` (`mailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MailLog`
--

LOCK TABLES `MailLog` WRITE;
/*!40000 ALTER TABLE `MailLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `MailLog` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `paperId_key` (`paperId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paper`
--

LOCK TABLES `Paper` WRITE;
/*!40000 ALTER TABLE `Paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paper` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `commentId_key` (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperComment`
--

LOCK TABLES `PaperComment` WRITE;
/*!40000 ALTER TABLE `PaperComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperComment` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `contactPaper` (`contactId`,`paperId`),
  KEY `contactPaperConflict` (`contactId`,`paperId`,`conflictType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperConflict`
--

LOCK TABLES `PaperConflict` WRITE;
/*!40000 ALTER TABLE `PaperConflict` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperConflict` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `paperOption` (`paperId`,`optionId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperOption`
--

LOCK TABLES `PaperOption` WRITE;
/*!40000 ALTER TABLE `PaperOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperOption` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `reviewId_key` (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReview`
--

LOCK TABLES `PaperReview` WRITE;
/*!40000 ALTER TABLE `PaperReview` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReview` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `reviewArchiveId_key` (`reviewArchiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewArchive`
--

LOCK TABLES `PaperReviewArchive` WRITE;
/*!40000 ALTER TABLE `PaperReviewArchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewArchive` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `contactPaper` (`contactId`,`paperId`),
  KEY `paperId` (`paperId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewPreference`
--

LOCK TABLES `PaperReviewPreference` WRITE;
/*!40000 ALTER TABLE `PaperReviewPreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewPreference` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `requestedBy` (`requestedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewRefused`
--

LOCK TABLES `PaperReviewRefused` WRITE;
/*!40000 ALTER TABLE `PaperReviewRefused` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewRefused` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `paperStorageId_key` (`paperStorageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperStorage`
--

LOCK TABLES `PaperStorage` WRITE;
/*!40000 ALTER TABLE `PaperStorage` DISABLE KEYS */;
INSERT INTO `PaperStorage` VALUES (1,0,0,'text/plain','',0,'',0,NULL,NULL,NULL,NULL,NULL,0,999999999900);
/*!40000 ALTER TABLE `PaperStorage` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `paperTag` (`paperId`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTag`
--

LOCK TABLES `PaperTag` WRITE;
/*!40000 ALTER TABLE `PaperTag` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTag` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `paperTopic` (`paperId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTopic`
--

LOCK TABLES `PaperTopic` WRITE;
/*!40000 ALTER TABLE `PaperTopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTopic` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `contactPaper` (`contactId`,`paperId`),
  KEY `contactPaperWatch` (`contactId`,`paperId`,`watch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperWatch`
--

LOCK TABLES `PaperWatch` WRITE;
/*!40000 ALTER TABLE `PaperWatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperWatch` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `reviewContact` (`reviewId`,`contactId`),
  KEY `reviewContactRating` (`reviewId`,`contactId`,`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRating`
--

LOCK TABLES `ReviewRating` WRITE;
/*!40000 ALTER TABLE `ReviewRating` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRating` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `paperEmail` (`paperId`,`email`),
  KEY `paperId` (`paperId`),
  KEY `requestedBy` (`requestedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRequest`
--

LOCK TABLES `ReviewRequest` WRITE;
/*!40000 ALTER TABLE `ReviewRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRequest` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Settings`
--

LOCK TABLES `Settings` WRITE;
/*!40000 ALTER TABLE `Settings` DISABLE KEYS */;
INSERT INTO `Settings` VALUES ('allowPaperOption',101,NULL,0,999999999900),('setupPhase',1,NULL,0,999999999900),('sub_pcconf',1,NULL,0,999999999900),('tag_chair',1,'accept reject pcpaper',0,999999999900),('sub_sha1',1,NULL,0,999999999900),('pcrev_any',1,NULL,0,999999999900),('extrev_view',2,NULL,0,999999999900),('outcome_map',1,'{\"0\":\"Unspecified\",\"-1\":\"Rejected\",\"1\":\"Accepted\"}',0,999999999900),('review_form',1,'{\"overAllMerit\":{\"name\":\"Overall merit\",\"position\":1,\"view_score\":1,\"options\":[\"Reject\",\"Weak reject\",\"Weak accept\",\"Accept\",\"Strong accept\"]},\"reviewerQualification\":{\"name\":\"Reviewer expertise\",\"position\":2,\"view_score\":1,\"options\":[\"No familiarity\",\"Some familiarity\",\"Knowledgeable\",\"Expert\"]},\"suitableForShort\":{\"name\":\"Suitable for short paper\",\"view_score\":1,\"options\":[\"Not suitable\",\"Can\'t tell\",\"Suitable\"]},\"paperSummary\":{\"name\":\"Paper summary\",\"position\":3,\"display_space\":5,\"view_score\":1},\"commentsToAuthor\":{\"name\":\"Comments for author\",\"position\":4,\"display_space\":15,\"view_score\":1},\"commentsToPC\":{\"name\":\"Comments for PC\",\"position\":5,\"display_space\":10,\"view_score\":0}}',0,999999999900);
/*!40000 ALTER TABLE `Settings` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `topicId_key` (`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TopicArea`
--

LOCK TABLES `TopicArea` WRITE;
/*!40000 ALTER TABLE `TopicArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `TopicArea` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `contactTopic` (`contactId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TopicInterest`
--

LOCK TABLES `TopicInterest` WRITE;
/*!40000 ALTER TABLE `TopicInterest` DISABLE KEYS */;
/*!40000 ALTER TABLE `TopicInterest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-09 11:53:31
