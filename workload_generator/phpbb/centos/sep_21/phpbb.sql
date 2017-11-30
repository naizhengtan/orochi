-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: phpbb
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `phpbb_acl_groups`
--

DROP TABLE IF EXISTS `phpbb_acl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_acl_groups`
--

LOCK TABLES `phpbb_acl_groups` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_groups` DISABLE KEYS */;
INSERT INTO `phpbb_acl_groups` VALUES (1,0,90,0,1),(1,0,99,0,1),(1,0,117,0,1),(5,0,0,5,0),(5,0,0,1,0),(2,0,0,6,0),(3,0,0,6,0),(4,0,0,5,0),(4,0,0,10,0),(1,1,0,17,0),(2,1,0,17,0),(3,1,0,17,0),(6,1,0,17,0),(1,2,0,17,0),(3,2,0,15,0),(4,2,0,21,0),(5,2,0,14,0),(5,2,0,10,0),(6,2,0,19,0),(7,0,0,23,0),(2,2,0,14,0),(7,2,0,14,0);
/*!40000 ALTER TABLE `phpbb_acl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_options`
--

DROP TABLE IF EXISTS `phpbb_acl_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auth_option` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_local` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `founder_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_acl_options`
--

LOCK TABLES `phpbb_acl_options` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_options` DISABLE KEYS */;
INSERT INTO `phpbb_acl_options` VALUES (1,'f_',0,1,0),(2,'f_announce',0,1,0),(3,'f_announce_global',0,1,0),(4,'f_attach',0,1,0),(5,'f_bbcode',0,1,0),(6,'f_bump',0,1,0),(7,'f_delete',0,1,0),(8,'f_download',0,1,0),(9,'f_edit',0,1,0),(10,'f_email',0,1,0),(11,'f_flash',0,1,0),(12,'f_icons',0,1,0),(13,'f_ignoreflood',0,1,0),(14,'f_img',0,1,0),(15,'f_list',0,1,0),(16,'f_noapprove',0,1,0),(17,'f_poll',0,1,0),(18,'f_post',0,1,0),(19,'f_postcount',0,1,0),(20,'f_print',0,1,0),(21,'f_read',0,1,0),(22,'f_reply',0,1,0),(23,'f_report',0,1,0),(24,'f_search',0,1,0),(25,'f_sigs',0,1,0),(26,'f_smilies',0,1,0),(27,'f_sticky',0,1,0),(28,'f_subscribe',0,1,0),(29,'f_user_lock',0,1,0),(30,'f_vote',0,1,0),(31,'f_votechg',0,1,0),(32,'f_softdelete',0,1,0),(33,'m_',1,1,0),(34,'m_approve',1,1,0),(35,'m_chgposter',1,1,0),(36,'m_delete',1,1,0),(37,'m_edit',1,1,0),(38,'m_info',1,1,0),(39,'m_lock',1,1,0),(40,'m_merge',1,1,0),(41,'m_move',1,1,0),(42,'m_report',1,1,0),(43,'m_split',1,1,0),(44,'m_softdelete',1,1,0),(45,'m_ban',1,0,0),(46,'m_pm_report',1,0,0),(47,'m_warn',1,0,0),(48,'a_',1,0,0),(49,'a_aauth',1,0,0),(50,'a_attach',1,0,0),(51,'a_authgroups',1,0,0),(52,'a_authusers',1,0,0),(53,'a_backup',1,0,0),(54,'a_ban',1,0,0),(55,'a_bbcode',1,0,0),(56,'a_board',1,0,0),(57,'a_bots',1,0,0),(58,'a_clearlogs',1,0,0),(59,'a_email',1,0,0),(60,'a_extensions',1,0,0),(61,'a_fauth',1,0,0),(62,'a_forum',1,0,0),(63,'a_forumadd',1,0,0),(64,'a_forumdel',1,0,0),(65,'a_group',1,0,0),(66,'a_groupadd',1,0,0),(67,'a_groupdel',1,0,0),(68,'a_icons',1,0,0),(69,'a_jabber',1,0,0),(70,'a_language',1,0,0),(71,'a_mauth',1,0,0),(72,'a_modules',1,0,0),(73,'a_names',1,0,0),(74,'a_phpinfo',1,0,0),(75,'a_profile',1,0,0),(76,'a_prune',1,0,0),(77,'a_ranks',1,0,0),(78,'a_reasons',1,0,0),(79,'a_roles',1,0,0),(80,'a_search',1,0,0),(81,'a_server',1,0,0),(82,'a_styles',1,0,0),(83,'a_switchperm',1,0,0),(84,'a_uauth',1,0,0),(85,'a_user',1,0,0),(86,'a_userdel',1,0,0),(87,'a_viewauth',1,0,0),(88,'a_viewlogs',1,0,0),(89,'a_words',1,0,0),(90,'u_',1,0,0),(91,'u_attach',1,0,0),(92,'u_chgavatar',1,0,0),(93,'u_chgcensors',1,0,0),(94,'u_chgemail',1,0,0),(95,'u_chggrp',1,0,0),(96,'u_chgname',1,0,0),(97,'u_chgpasswd',1,0,0),(98,'u_chgprofileinfo',1,0,0),(99,'u_download',1,0,0),(100,'u_hideonline',1,0,0),(101,'u_ignoreflood',1,0,0),(102,'u_masspm',1,0,0),(103,'u_masspm_group',1,0,0),(104,'u_pm_attach',1,0,0),(105,'u_pm_bbcode',1,0,0),(106,'u_pm_delete',1,0,0),(107,'u_pm_download',1,0,0),(108,'u_pm_edit',1,0,0),(109,'u_pm_emailpm',1,0,0),(110,'u_pm_flash',1,0,0),(111,'u_pm_forward',1,0,0),(112,'u_pm_img',1,0,0),(113,'u_pm_printpm',1,0,0),(114,'u_pm_smilies',1,0,0),(115,'u_readpm',1,0,0),(116,'u_savedrafts',1,0,0),(117,'u_search',1,0,0),(118,'u_sendemail',1,0,0),(119,'u_sendim',1,0,0),(120,'u_sendpm',1,0,0),(121,'u_sig',1,0,0),(122,'u_viewonline',1,0,0),(123,'u_viewprofile',1,0,0);
/*!40000 ALTER TABLE `phpbb_acl_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_roles`
--

DROP TABLE IF EXISTS `phpbb_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_bin NOT NULL,
  `role_type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_acl_roles`
--

LOCK TABLES `phpbb_acl_roles` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_roles` DISABLE KEYS */;
INSERT INTO `phpbb_acl_roles` VALUES (1,'ROLE_ADMIN_STANDARD','ROLE_DESCRIPTION_ADMIN_STANDARD','a_',1),(2,'ROLE_ADMIN_FORUM','ROLE_DESCRIPTION_ADMIN_FORUM','a_',3),(3,'ROLE_ADMIN_USERGROUP','ROLE_DESCRIPTION_ADMIN_USERGROUP','a_',4),(4,'ROLE_ADMIN_FULL','ROLE_DESCRIPTION_ADMIN_FULL','a_',2),(5,'ROLE_USER_FULL','ROLE_DESCRIPTION_USER_FULL','u_',3),(6,'ROLE_USER_STANDARD','ROLE_DESCRIPTION_USER_STANDARD','u_',1),(7,'ROLE_USER_LIMITED','ROLE_DESCRIPTION_USER_LIMITED','u_',2),(8,'ROLE_USER_NOPM','ROLE_DESCRIPTION_USER_NOPM','u_',4),(9,'ROLE_USER_NOAVATAR','ROLE_DESCRIPTION_USER_NOAVATAR','u_',5),(10,'ROLE_MOD_FULL','ROLE_DESCRIPTION_MOD_FULL','m_',3),(11,'ROLE_MOD_STANDARD','ROLE_DESCRIPTION_MOD_STANDARD','m_',1),(12,'ROLE_MOD_SIMPLE','ROLE_DESCRIPTION_MOD_SIMPLE','m_',2),(13,'ROLE_MOD_QUEUE','ROLE_DESCRIPTION_MOD_QUEUE','m_',4),(14,'ROLE_FORUM_FULL','ROLE_DESCRIPTION_FORUM_FULL','f_',7),(15,'ROLE_FORUM_STANDARD','ROLE_DESCRIPTION_FORUM_STANDARD','f_',5),(16,'ROLE_FORUM_NOACCESS','ROLE_DESCRIPTION_FORUM_NOACCESS','f_',1),(17,'ROLE_FORUM_READONLY','ROLE_DESCRIPTION_FORUM_READONLY','f_',2),(18,'ROLE_FORUM_LIMITED','ROLE_DESCRIPTION_FORUM_LIMITED','f_',3),(19,'ROLE_FORUM_BOT','ROLE_DESCRIPTION_FORUM_BOT','f_',9),(20,'ROLE_FORUM_ONQUEUE','ROLE_DESCRIPTION_FORUM_ONQUEUE','f_',8),(21,'ROLE_FORUM_POLLS','ROLE_DESCRIPTION_FORUM_POLLS','f_',6),(22,'ROLE_FORUM_LIMITED_POLLS','ROLE_DESCRIPTION_FORUM_LIMITED_POLLS','f_',4),(23,'ROLE_USER_NEW_MEMBER','ROLE_DESCRIPTION_USER_NEW_MEMBER','u_',6),(24,'ROLE_FORUM_NEW_MEMBER','ROLE_DESCRIPTION_FORUM_NEW_MEMBER','f_',10);
/*!40000 ALTER TABLE `phpbb_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_roles_data`
--

DROP TABLE IF EXISTS `phpbb_acl_roles_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_acl_roles_data`
--

LOCK TABLES `phpbb_acl_roles_data` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_roles_data` DISABLE KEYS */;
INSERT INTO `phpbb_acl_roles_data` VALUES (1,48,1),(1,50,1),(1,51,1),(1,52,1),(1,54,1),(1,55,1),(1,56,1),(1,60,1),(1,61,1),(1,62,1),(1,63,1),(1,64,1),(1,65,1),(1,66,1),(1,67,1),(1,68,1),(1,71,1),(1,73,1),(1,75,1),(1,76,1),(1,77,1),(1,78,1),(1,84,1),(1,85,1),(1,86,1),(1,87,1),(1,88,1),(1,89,1),(2,48,1),(2,51,1),(2,52,1),(2,61,1),(2,62,1),(2,63,1),(2,64,1),(2,71,1),(2,76,1),(2,84,1),(2,87,1),(2,88,1),(3,48,1),(3,51,1),(3,52,1),(3,54,1),(3,65,1),(3,66,1),(3,67,1),(3,77,1),(3,84,1),(3,85,1),(3,87,1),(3,88,1),(4,48,1),(4,49,1),(4,50,1),(4,51,1),(4,52,1),(4,53,1),(4,54,1),(4,55,1),(4,56,1),(4,57,1),(4,58,1),(4,59,1),(4,60,1),(4,61,1),(4,62,1),(4,63,1),(4,64,1),(4,65,1),(4,66,1),(4,67,1),(4,68,1),(4,69,1),(4,70,1),(4,71,1),(4,72,1),(4,73,1),(4,74,1),(4,75,1),(4,76,1),(4,77,1),(4,78,1),(4,79,1),(4,80,1),(4,81,1),(4,82,1),(4,83,1),(4,84,1),(4,85,1),(4,86,1),(4,87,1),(4,88,1),(4,89,1),(5,90,1),(5,91,1),(5,92,1),(5,93,1),(5,94,1),(5,95,1),(5,96,1),(5,97,1),(5,98,1),(5,99,1),(5,100,1),(5,101,1),(5,102,1),(5,103,1),(5,104,1),(5,105,1),(5,106,1),(5,107,1),(5,108,1),(5,109,1),(5,110,1),(5,111,1),(5,112,1),(5,113,1),(5,114,1),(5,115,1),(5,116,1),(5,117,1),(5,118,1),(5,119,1),(5,120,1),(5,121,1),(5,122,1),(5,123,1),(6,90,1),(6,91,1),(6,92,1),(6,93,1),(6,94,1),(6,97,1),(6,98,1),(6,99,1),(6,100,1),(6,102,1),(6,103,1),(6,104,1),(6,105,1),(6,106,1),(6,107,1),(6,108,1),(6,109,1),(6,112,1),(6,113,1),(6,114,1),(6,115,1),(6,116,1),(6,117,1),(6,118,1),(6,119,1),(6,120,1),(6,121,1),(6,123,1),(7,90,1),(7,92,1),(7,93,1),(7,94,1),(7,97,1),(7,98,1),(7,99,1),(7,100,1),(7,105,1),(7,106,1),(7,107,1),(7,108,1),(7,111,1),(7,112,1),(7,113,1),(7,114,1),(7,115,1),(7,120,1),(7,121,1),(7,123,1),(8,90,1),(8,92,1),(8,93,1),(8,94,1),(8,97,1),(8,99,1),(8,100,1),(8,102,0),(8,103,0),(8,115,0),(8,120,0),(8,121,1),(8,123,1),(9,90,1),(9,92,0),(9,93,1),(9,94,1),(9,97,1),(9,98,1),(9,99,1),(9,100,1),(9,105,1),(9,106,1),(9,107,1),(9,108,1),(9,111,1),(9,112,1),(9,113,1),(9,114,1),(9,115,1),(9,120,1),(9,121,1),(9,123,1),(10,33,1),(10,34,1),(10,35,1),(10,36,1),(10,37,1),(10,38,1),(10,39,1),(10,40,1),(10,41,1),(10,42,1),(10,43,1),(10,44,1),(10,45,1),(10,46,1),(10,47,1),(11,33,1),(11,34,1),(11,36,1),(11,37,1),(11,38,1),(11,39,1),(11,40,1),(11,41,1),(11,42,1),(11,43,1),(11,44,1),(11,46,1),(11,47,1),(12,33,1),(12,36,1),(12,37,1),(12,38,1),(12,42,1),(12,44,1),(12,46,1),(13,33,1),(13,34,1),(13,37,1),(14,1,1),(14,2,1),(14,3,1),(14,4,1),(14,5,1),(14,6,1),(14,7,1),(14,8,1),(14,9,1),(14,10,1),(14,11,1),(14,12,1),(14,13,1),(14,14,1),(14,15,1),(14,16,1),(14,17,1),(14,18,1),(14,19,1),(14,20,1),(14,21,1),(14,22,1),(14,23,1),(14,24,1),(14,25,1),(14,26,1),(14,27,1),(14,28,1),(14,29,1),(14,30,1),(14,31,1),(14,32,1),(15,1,1),(15,4,1),(15,5,1),(15,6,1),(15,7,1),(15,8,1),(15,9,1),(15,10,1),(15,12,1),(15,14,1),(15,15,1),(15,16,1),(15,18,1),(15,19,1),(15,20,1),(15,21,1),(15,22,1),(15,23,1),(15,24,1),(15,25,1),(15,26,1),(15,28,1),(15,30,1),(15,31,1),(15,32,1),(16,1,0),(17,1,1),(17,8,1),(17,15,1),(17,20,1),(17,21,1),(17,24,1),(17,28,1),(18,1,1),(18,5,1),(18,8,1),(18,9,1),(18,10,1),(18,14,1),(18,15,1),(18,16,1),(18,18,1),(18,19,1),(18,20,1),(18,21,1),(18,22,1),(18,23,1),(18,24,1),(18,25,1),(18,26,1),(18,28,1),(18,30,1),(18,32,1),(19,1,1),(19,8,1),(19,15,1),(19,20,1),(19,21,1),(20,1,1),(20,4,1),(20,5,1),(20,8,1),(20,9,1),(20,10,1),(20,14,1),(20,15,1),(20,16,0),(20,18,1),(20,19,1),(20,20,1),(20,21,1),(20,22,1),(20,23,1),(20,24,1),(20,25,1),(20,26,1),(20,28,1),(20,30,1),(20,32,1),(21,1,1),(21,4,1),(21,5,1),(21,6,1),(21,7,1),(21,8,1),(21,9,1),(21,10,1),(21,12,1),(21,14,1),(21,15,1),(21,16,1),(21,17,1),(21,18,1),(21,19,1),(21,20,1),(21,21,1),(21,22,1),(21,23,1),(21,24,1),(21,25,1),(21,26,1),(21,28,1),(21,30,1),(21,31,1),(21,32,1),(22,1,1),(22,5,1),(22,8,1),(22,9,1),(22,10,1),(22,14,1),(22,15,1),(22,16,1),(22,17,1),(22,18,1),(22,19,1),(22,20,1),(22,21,1),(22,22,1),(22,23,1),(22,24,1),(22,25,1),(22,26,1),(22,28,1),(22,30,1),(22,32,1),(23,98,0),(23,102,0),(23,103,0),(23,120,0),(24,16,0);
/*!40000 ALTER TABLE `phpbb_acl_roles_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_users`
--

DROP TABLE IF EXISTS `phpbb_acl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_acl_users` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_acl_users`
--

LOCK TABLES `phpbb_acl_users` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_users` DISABLE KEYS */;
INSERT INTO `phpbb_acl_users` VALUES (2,0,0,5,0);
/*!40000 ALTER TABLE `phpbb_acl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_attachments`
--

DROP TABLE IF EXISTS `phpbb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_attachments` (
  `attach_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_msg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `in_message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_orphan` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `physical_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `real_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_comment` text COLLATE utf8_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mimetype` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `filetime` int(11) unsigned NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_attachments`
--

LOCK TABLES `phpbb_attachments` WRITE;
/*!40000 ALTER TABLE `phpbb_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_banlist`
--

DROP TABLE IF EXISTS `phpbb_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_banlist` (
  `ban_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `ban_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_end` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_give_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_banlist`
--

LOCK TABLES `phpbb_banlist` WRITE;
/*!40000 ALTER TABLE `phpbb_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_bbcodes`
--

DROP TABLE IF EXISTS `phpbb_bbcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_bbcodes` (
  `bbcode_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bbcode_tag` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_helpline` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_match` text COLLATE utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_bbcodes`
--

LOCK TABLES `phpbb_bbcodes` WRITE;
/*!40000 ALTER TABLE `phpbb_bbcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_bbcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_bookmarks`
--

DROP TABLE IF EXISTS `phpbb_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_bookmarks` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_bookmarks`
--

LOCK TABLES `phpbb_bookmarks` WRITE;
/*!40000 ALTER TABLE `phpbb_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_bots`
--

DROP TABLE IF EXISTS `phpbb_bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_bots` (
  `bot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bot_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `bot_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bot_agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bot_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_bots`
--

LOCK TABLES `phpbb_bots` WRITE;
/*!40000 ALTER TABLE `phpbb_bots` DISABLE KEYS */;
INSERT INTO `phpbb_bots` VALUES (1,1,'AdsBot [Google]',3,'AdsBot-Google',''),(2,1,'Alexa [Bot]',4,'ia_archiver',''),(3,1,'Alta Vista [Bot]',5,'Scooter/',''),(4,1,'Ask Jeeves [Bot]',6,'Ask Jeeves',''),(5,1,'Baidu [Spider]',7,'Baiduspider',''),(6,1,'Bing [Bot]',8,'bingbot/',''),(7,1,'Exabot [Bot]',9,'Exabot',''),(8,1,'FAST Enterprise [Crawler]',10,'FAST Enterprise Crawler',''),(9,1,'FAST WebCrawler [Crawler]',11,'FAST-WebCrawler/',''),(10,1,'Francis [Bot]',12,'http://www.neomo.de/',''),(11,1,'Gigabot [Bot]',13,'Gigabot/',''),(12,1,'Google Adsense [Bot]',14,'Mediapartners-Google',''),(13,1,'Google Desktop',15,'Google Desktop',''),(14,1,'Google Feedfetcher',16,'Feedfetcher-Google',''),(15,1,'Google [Bot]',17,'Googlebot',''),(16,1,'Heise IT-Markt [Crawler]',18,'heise-IT-Markt-Crawler',''),(17,1,'Heritrix [Crawler]',19,'heritrix/1.',''),(18,1,'IBM Research [Bot]',20,'ibm.com/cs/crawler',''),(19,1,'ICCrawler - ICjobs',21,'ICCrawler - ICjobs',''),(20,1,'ichiro [Crawler]',22,'ichiro/',''),(21,1,'Majestic-12 [Bot]',23,'MJ12bot/',''),(22,1,'Metager [Bot]',24,'MetagerBot/',''),(23,1,'MSN NewsBlogs',25,'msnbot-NewsBlogs/',''),(24,1,'MSN [Bot]',26,'msnbot/',''),(25,1,'MSNbot Media',27,'msnbot-media/',''),(26,1,'Nutch [Bot]',28,'http://lucene.apache.org/nutch/',''),(27,1,'Online link [Validator]',29,'online link validator',''),(28,1,'psbot [Picsearch]',30,'psbot/0',''),(29,1,'Sensis [Crawler]',31,'Sensis Web Crawler',''),(30,1,'SEO Crawler',32,'SEO search Crawler/',''),(31,1,'Seoma [Crawler]',33,'Seoma [SEO Crawler]',''),(32,1,'SEOSearch [Crawler]',34,'SEOsearch/',''),(33,1,'Snappy [Bot]',35,'Snappy/1.1 ( http://www.urltrends.com/ )',''),(34,1,'Steeler [Crawler]',36,'http://www.tkl.iis.u-tokyo.ac.jp/~crawler/',''),(35,1,'Telekom [Bot]',37,'crawleradmin.t-info@telekom.de',''),(36,1,'TurnitinBot [Bot]',38,'TurnitinBot/',''),(37,1,'Voyager [Bot]',39,'voyager/',''),(38,1,'W3 [Sitesearch]',40,'W3 SiteSearch Crawler',''),(39,1,'W3C [Linkcheck]',41,'W3C-checklink/',''),(40,1,'W3C [Validator]',42,'W3C_Validator',''),(41,1,'YaCy [Bot]',43,'yacybot',''),(42,1,'Yahoo MMCrawler [Bot]',44,'Yahoo-MMCrawler/',''),(43,1,'Yahoo Slurp [Bot]',45,'Yahoo! DE Slurp',''),(44,1,'Yahoo [Bot]',46,'Yahoo! Slurp',''),(45,1,'YahooSeeker [Bot]',47,'YahooSeeker/','');
/*!40000 ALTER TABLE `phpbb_bots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_config`
--

DROP TABLE IF EXISTS `phpbb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_config` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_config`
--

LOCK TABLES `phpbb_config` WRITE;
/*!40000 ALTER TABLE `phpbb_config` DISABLE KEYS */;
INSERT INTO `phpbb_config` VALUES ('active_sessions','0',0),('allow_attachments','1',0),('allow_autologin','1',0),('allow_avatar','1',0),('allow_avatar_gravatar','0',0),('allow_avatar_local','0',0),('allow_avatar_remote','0',0),('allow_avatar_remote_upload','0',0),('allow_avatar_upload','1',0),('allow_bbcode','1',0),('allow_birthdays','1',0),('allow_board_notifications','1',0),('allow_bookmarks','1',0),('allow_cdn','0',0),('allow_emailreuse','0',0),('allow_forum_notify','1',0),('allow_live_searches','1',0),('allow_mass_pm','1',0),('allow_name_chars','USERNAME_CHARS_ANY',0),('allow_namechange','0',0),('allow_nocensors','0',0),('allow_password_reset','1',0),('allow_pm_attach','0',0),('allow_pm_report','1',0),('allow_post_flash','1',0),('allow_post_links','1',0),('allow_privmsg','1',0),('allow_quick_reply','1',0),('allow_sig','1',0),('allow_sig_bbcode','1',0),('allow_sig_flash','0',0),('allow_sig_img','1',0),('allow_sig_links','1',0),('allow_sig_pm','1',0),('allow_sig_smilies','1',0),('allow_smilies','1',0),('allow_topic_notify','1',0),('allow_viglink_phpbb','1',0),('allowed_schemes_links','http,https,ftp',0),('assets_version','2',0),('attachment_quota','52428800',0),('auth_bbcode_pm','1',0),('auth_flash_pm','0',0),('auth_img_pm','1',0),('auth_method','db',0),('auth_smilies_pm','1',0),('avatar_filesize','6144',0),('avatar_gallery_path','images/avatars/gallery',0),('avatar_max_height','90',0),('avatar_max_width','90',0),('avatar_min_height','20',0),('avatar_min_width','20',0),('avatar_path','images/avatars/upload',0),('avatar_salt','825484b920a8dff6bef65a16f222676c',0),('board_contact','admin@nyu.edu',0),('board_contact_name','',0),('board_disable','0',0),('board_disable_msg','',0),('board_email','admin@nyu.edu',0),('board_email_form','0',0),('board_email_sig','Thanks, The Management',0),('board_hide_emails','1',0),('board_index_text','',0),('board_startdate','1490128344',0),('board_timezone','UTC',0),('browser_check','1',0),('bump_interval','10',0),('bump_type','d',0),('cache_gc','7200',0),('cache_last_gc','1506041442',1),('captcha_gd','1',0),('captcha_gd_3d_noise','1',0),('captcha_gd_fonts','1',0),('captcha_gd_foreground_noise','0',0),('captcha_gd_wave','0',0),('captcha_gd_x_grid','25',0),('captcha_gd_y_grid','25',0),('captcha_plugin','core.captcha.plugins.gd',0),('check_attachment_content','1',0),('check_dnsbl','0',0),('chg_passforce','0',0),('confirm_refresh','1',0),('contact_admin_form_enable','1',0),('cookie_domain','',0),('cookie_name','phpbb3_etzgc',0),('cookie_path','/',0),('cookie_secure','',0),('coppa_enable','0',0),('coppa_fax','',0),('coppa_mail','',0),('cron_lock','0',1),('database_gc','604800',0),('database_last_gc','1506041443',1),('dbms_version','5.6.34',0),('default_dateformat','D M d, Y g:i a',0),('default_lang','',0),('default_style','1',0),('delete_time','0',0),('display_last_edited','1',0),('display_last_subject','1',0),('display_order','0',0),('edit_time','0',0),('email_check_mx','1',0),('email_enable','',0),('email_function_name','mail',0),('email_max_chunk_size','50',0),('email_package_size','20',0),('enable_confirm','1',0),('enable_mod_rewrite','0',0),('enable_pm_icons','1',0),('enable_post_confirm','1',0),('extension_force_unstable','0',0),('feed_enable','1',0),('feed_forum','1',0),('feed_http_auth','0',0),('feed_item_statistics','1',0),('feed_limit_post','15',0),('feed_limit_topic','10',0),('feed_overall','1',0),('feed_overall_forums','0',0),('feed_topic','1',0),('feed_topics_active','0',0),('feed_topics_new','1',0),('flood_interval','15',0),('force_server_vars','',0),('form_token_lifetime','7200',0),('form_token_mintime','0',0),('form_token_sid_guests','1',0),('forward_pm','1',0),('forwarded_for_check','0',0),('full_folder_action','2',0),('fulltext_mysql_max_word_len','254',0),('fulltext_mysql_min_word_len','4',0),('fulltext_native_common_thres','5',0),('fulltext_native_load_upd','1',0),('fulltext_native_max_chars','14',0),('fulltext_native_min_chars','3',0),('fulltext_postgres_max_word_len','254',0),('fulltext_postgres_min_word_len','4',0),('fulltext_postgres_ts_name','simple',0),('fulltext_sphinx_indexer_mem_limit','512',0),('fulltext_sphinx_stopwords','0',0),('gzip_compress','0',0),('help_send_statistics','1',0),('help_send_statistics_time','0',0),('hot_threshold','25',0),('icons_path','images/icons',0),('img_create_thumbnail','0',0),('img_display_inlined','1',0),('img_imagick','',0),('img_link_height','0',0),('img_link_width','0',0),('img_max_height','0',0),('img_max_thumb_width','400',0),('img_max_width','0',0),('img_min_thumb_filesize','12000',0),('ip_check','3',0),('ip_login_limit_max','50',0),('ip_login_limit_time','21600',0),('ip_login_limit_use_forwarded','0',0),('jab_enable','0',0),('jab_host','',0),('jab_package_size','20',0),('jab_password','',0),('jab_port','5222',0),('jab_use_ssl','0',0),('jab_username','',0),('last_queue_run','0',1),('ldap_base_dn','',0),('ldap_email','',0),('ldap_password','',0),('ldap_port','',0),('ldap_server','',0),('ldap_uid','',0),('ldap_user','',0),('ldap_user_filter','',0),('legend_sort_groupname','0',0),('limit_load','0',0),('limit_search_load','0',0),('load_anon_lastread','0',0),('load_birthdays','1',0),('load_cpf_memberlist','1',0),('load_cpf_pm','1',0),('load_cpf_viewprofile','1',0),('load_cpf_viewtopic','1',0),('load_db_lastread','1',0),('load_db_track','1',0),('load_jquery_url','//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js',0),('load_jumpbox','1',0),('load_moderators','1',0),('load_notifications','1',0),('load_online','1',0),('load_online_guests','1',0),('load_online_time','5',0),('load_onlinetrack','1',0),('load_search','1',0),('load_tplcompile','0',0),('load_unreads_search','1',0),('load_user_activity','1',0),('max_attachments','3',0),('max_attachments_pm','1',0),('max_autologin_time','0',0),('max_filesize','262144',0),('max_filesize_pm','262144',0),('max_login_attempts','3',0),('max_name_chars','20',0),('max_num_search_keywords','10',0),('max_pass_chars','100',0),('max_poll_options','10',0),('max_post_chars','60000',0),('max_post_font_size','200',0),('max_post_img_height','0',0),('max_post_img_width','0',0),('max_post_smilies','0',0),('max_post_urls','0',0),('max_quote_depth','3',0),('max_reg_attempts','5',0),('max_sig_chars','255',0),('max_sig_font_size','200',0),('max_sig_img_height','0',0),('max_sig_img_width','0',0),('max_sig_smilies','0',0),('max_sig_urls','5',0),('mime_triggers','body|head|html|img|plaintext|a href|pre|script|table|title',0),('min_name_chars','3',0),('min_pass_chars','6',0),('min_post_chars','1',0),('min_search_author_chars','3',0),('new_member_group_default','0',0),('new_member_post_limit','3',0),('newest_user_colour','',1),('newest_user_id','147',1),('newest_username','user99',1),('num_files','0',1),('num_posts','100',1),('num_topics','100',1),('num_users','101',1),('override_user_style','0',0),('pass_complex','PASS_TYPE_ANY',0),('phpbb_viglink_api_key','e4fd14f5d7f2bb6d80b8f8da1354718c',0),('plupload_last_gc','0',1),('plupload_salt','a6a987810984979edb7e8dcddf7adae6',0),('pm_edit_time','0',0),('pm_max_boxes','4',0),('pm_max_msgs','50',0),('pm_max_recipients','0',0),('posts_per_page','10',0),('print_pm','1',0),('queue_interval','60',0),('rand_seed','0',1),('rand_seed_last_update','0',1),('ranks_path','images/ranks',0),('read_notification_expire_days','30',0),('read_notification_gc','86400',0),('read_notification_last_gc','1506041442',1),('record_online_date','1506041530',1),('record_online_users','2',1),('referer_validation','0',0),('remote_upload_verify','0',0),('require_activation','0',0),('script_path','',0),('search_anonymous_interval','0',0),('search_block_size','250',0),('search_gc','7200',0),('search_indexing_state','',1),('search_interval','0',0),('search_last_gc','1506041444',1),('search_store_results','1800',0),('search_type','\\phpbb\\search\\fulltext_native',0),('secure_allow_deny','1',0),('secure_allow_empty_referer','1',0),('secure_downloads','0',0),('server_name','',0),('server_port','',0),('server_protocol','',0),('session_gc','3600',0),('session_last_gc','1506041443',1),('session_length','3600',0),('site_desc','',0),('site_home_text','',0),('site_home_url','',0),('sitename','',0),('smilies_path','images/smilies',0),('smilies_per_page','50',0),('smtp_auth_method','',0),('smtp_delivery','',0),('smtp_host','',0),('smtp_password','',0),('smtp_port','',0),('smtp_username','',0),('teampage_forums','1',0),('teampage_memberships','1',0),('topics_per_page','25',0),('tpl_allow_php','0',0),('upload_dir_size','0',1),('upload_icons_path','images/upload_icons',0),('upload_path','files',0),('use_system_cron','0',0),('version','3.2.0',0),('viglink_api_siteid','d41d8cd98f00b204e9800998ecf8427e',0),('viglink_ask_admin','',0),('viglink_convert_account_url','',0),('viglink_enabled','0',0),('viglink_last_gc','1490128348',1),('warnings_expire_days','90',0),('warnings_gc','14400',0),('warnings_last_gc','1506041443',1);
/*!40000 ALTER TABLE `phpbb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_config_text`
--

DROP TABLE IF EXISTS `phpbb_config_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_config_text` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_config_text`
--

LOCK TABLES `phpbb_config_text` WRITE;
/*!40000 ALTER TABLE `phpbb_config_text` DISABLE KEYS */;
INSERT INTO `phpbb_config_text` VALUES ('contact_admin_info',''),('contact_admin_info_bitfield',''),('contact_admin_info_flags','7'),('contact_admin_info_uid','');
/*!40000 ALTER TABLE `phpbb_config_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_confirm`
--

DROP TABLE IF EXISTS `phpbb_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_confirm` (
  `confirm_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `confirm_type` tinyint(3) NOT NULL DEFAULT '0',
  `code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seed` int(10) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_confirm`
--

LOCK TABLES `phpbb_confirm` WRITE;
/*!40000 ALTER TABLE `phpbb_confirm` DISABLE KEYS */;
INSERT INTO `phpbb_confirm` VALUES ('eb247d2ce4895115042ae673d41507d2','0067ff2e5a6dbc658cb65899052377d0',1,'26GMV5',1255426441,0),('6bb65a0adfe9c261dc044f8191da92be','00daffeec787300b73f9aa6af608b716',1,'52S118L',569762656,0),('660be541da14be4888076695aa6a69e0','0106fa976cbc55fb1b3056b89c66fc4e',1,'68F4TF',1257311207,0),('0571b5837698bce1f1ef0fe6be376c12','011e4f2c8d23901404e80a315a430745',1,'52GYQV2',910297843,0),('855dd92db4942da755e7490ced0ac675','01e4fbf612c53fcde6b1c038a591471b',1,'6EQ2WT3',908653505,0),('f65de6b04c46861b0ab9fe6a8e1beae9','05f2c383b7c3afcaafa44efc3c5a88bc',1,'12K1NI',467727950,0),('72670a5729b9c2acbb788d3838c6eeee','09a75b26d77590983b04636ea22a9d5d',1,'3M6UY',1407884328,0),('099052e5b6ea4ae30eaabce630f4ae1b','0ab0f4d3c16c5c1943addfc98a9b5bb6',1,'61UA',315853957,0),('8ffd531a5fd4ed4afbd7ba2563af1f95','0c171fcc75e08748f8a4dd175a3ec283',1,'496R',520432860,0),('58563d8af73bffbdfbc73a1e21baa15d','0df1942bcbb61fc5475cd496f1bb1356',1,'4RYYL',739962791,0),('ff049cadd54b1e1ae19f2690e582c886','1556f0b2426860752a502a1d650397eb',1,'5WTEU',1409085754,0),('a9c8810c96971d8b91a8afa4ae98d547','1a77bdc369f697f03b8980a81eb6abaf',1,'UBCUN',1761887862,0),('7106d769a921c81c7cfbc7b7c04c4d33','20296675a9ac74b331be03f80c7efdb2',1,'1XHCD',1712646483,0),('f4f303b7ea83b79a510ce9d8eea2d8c6','224ec9eaeb5d98ed7e0179a94bd2ca91',1,'7BEUR',1897558353,0),('64996cd53f4635fcedb9fee7b71e0dd9','255183edce9972a1410b9f5ce54b13f4',1,'5HL49',230631271,0),('4f8526f525d590d54a96a838f5295983','26de2c287f41a9a51a96e87881f255f4',1,'4YGNZ',2065755757,0),('103274e5458cc180d3504211c52617b7','2716c09de17a206561b2f2cd44720081',1,'6MVTR',437949755,0),('dec3d63561ca774e2d2e54690f80e400','2b42425981faa279d629ca6e5593cfd5',1,'44Q1A',2034091353,0),('c2ae5ae672ea7b0a997915270f4398be','2be9392d91e7e65cd6887fea974ac4bc',1,'7HP8RD',1707602511,0),('e8f1296898c6219a4cedfcd8e3648728','2c9f267f04ab53e493a89a092fb246c3',1,'2THJL64',2059034303,0),('d0387ccb17b2178af8206d5fd575c308','2d1ba5009a9eceb1b39a46002897e8c8',1,'4JNGEYT',1313573996,0),('f34efded8507439096b36f603a8e854f','2eee334a8a62c792ea52f8fb0c4846ab',1,'29LC',1592174894,0),('8db65e54e8888ad8967839fe7239edc6','323751deb9ab420e5010a0901613d097',1,'25GFFF',1265778905,0),('3d40a9392f528780e9de67b51aa2ba5e','337b49513652509fec34980c1496ffdc',1,'57M7T',1801969286,0),('9215a128e8699b43cce0539a4e58931f','3463a61c97cafc8a40a49e1b1d83ceef',1,'3N7HU9',948298735,0),('3a7f8a69c923a165276bc91371d4c22d','3bda22cbaf184060c2db6a660e91a158',1,'3EQHKX',15987263,0),('0d92d3bd7850ace8b0c619e90c876c59','3d1ceca8132ddf906a5710b33e7d53c1',1,'7ZS4',1685162090,0),('f22f2889d806a073d85246dfe30476a0','40a948d38b261f6a90f3959d2255dda8',1,'68P86',1054826853,0),('f09ad9e22798c4984cea9678e3dd80d3','415b33ff9143aecb16a70238d9efd752',1,'1V9BFN',491070589,0),('5fe85ed56d5574b7808d3576937bed37','41b4df29a25f4517759c55463d8b0b76',1,'53T7',35041665,0),('bcde7980bffeb57824a315a2948734ac','41bb8bd1a7f107ba4cebc62a303cab81',1,'2N3T',724174636,0),('0ed73e9887cb7c6bb731c451ca04a753','47397d757222593db72fd21d9e905b9e',1,'8KTXY4F',186849013,0),('fc49d0227b2be7ca38c2c8888566fa43','475af41bcca5b789b697705feb2819e2',1,'3FFLGXW',370584905,0),('fcf88956de03f11e95456e05a1168c34','4c878cce52ee7c40d8db67b55f513314',1,'4IHSZQB',874611766,0),('f84cf2ca01ad34f2b41fe6acdf760d47','4dbb5f59d55e838517793d3e2d309aef',1,'6UQJIMV',189257312,0),('457dc5a5b864873634ea4c61a74baf64','4dfb14ace120e84710710ad15cf94aba',1,'7H1YAZJ',1719092402,0),('5a1aa50501be89bc943a548daf986a1f','4e34b437b0c103469396f171aa3c17bb',1,'5F8QL',400269819,0),('c89642bc27c1152ea1dcdd9336d3e732','4f97bd811ed0ac5424d8cea568264585',1,'4BII6I',4348193,0),('a07c6a80ec252911b600459db52f24e1','57984fa6f1e8f6125514f1fa76a5dbf4',1,'6M8YDZK',343094305,0),('9f611146012e177f250fb25a00602ed8','58fb07687128a932f0b01e7d256777cd',1,'7L6RYYB',718510569,0),('ae5b1061effa14a8ae816e7df3330fbf','5aa07e18f17d35f3114b7022159cf448',1,'77NYCU',1599474653,0),('a5f72659bec1d16348d28a97bd7fb7e3','5e03160096206d886264e2702a23e45a',1,'14U9X',682639683,0),('d0bab39aeb6db0dbb3db9f8bdcc132a5','612c6407ecd57c442c3a77c27d563364',1,'2P2F26B',1960334201,0),('012573dca8b76c6a125254a372900d3c','6293ace444455d9f6817b78e96c55a62',1,'4619IV3',108338725,0),('cfa4cbb3659b124b8f9c07dee5e1600e','62d7854fa0a391f6a856ee148ddab29a',1,'2H6V',1546211979,0),('7736fcb2c006b9e3c4619cea69f44f84','6841a28f841f26c799155dc4064ed64b',1,'67A3C',173376600,0),('f7ed7862047ab31fd8431645cdab6acb','6a63be4a8823f7b9348b8e1056c5b734',1,'1QQQEE',749499378,0),('710fbc5192b2a45324b4f65b8e3d7d04','767e7d24cf26c0372b9b1a8195e4b4c2',1,'425M13',1449891948,0),('466256af185190abd4c2ee0b5ccfe3d8','77912350e601609155104cd70394f6a6',1,'4LBF4',314717191,0),('ed6411b6b0ac96cfdeef3ba7288daaf0','7a9af01c1ca2011d4a6a1eb55068cb81',1,'1A3A',1840063523,0),('600d58be43c807c5e46003dc78b42d1d','819917833656c1de5322c1b361d02699',1,'F67X',771795287,0),('71efbf02d81dbe44fcadfff39de5a30c','84115bb2f2d53a5358aec98d04c3866e',1,'17YBV',759188501,0),('979fbfe7aae17ce99ef8829646fea821','8566f96fdc1aa2af6f80349126a66012',1,'4Z4WW8Y',713054656,0),('9652d9774de6aa9c885181677acfa96b','8d4f8cfead313fa95a08c37ec1314a60',1,'4DTA7B9',1911834730,0),('51974364a14c7c086c776a579cb7f4a6','8e142ee2880dfe13ade50261fe95941b',1,'1UVYDD',101572534,0),('9b2a7d2bc9b74d08f501051d48a4541b','93cb3b8531a84781c03d0f7fd77a0013',1,'5JFLIPC',1513532894,0),('3cc2edd4a60d0a54dea5019aae209fb1','94691e221809e0021670bf4c92ffd97e',1,'4T5HC',1206514547,0),('8c2ea90b15da96ba24d5379e57f85467','94a6e4b45cd3c7b45914e3dc4dfd6be2',1,'4W8MGU9',1304806461,0),('546807f08ba787afb7af4d5551fabb26','95d293e9c4535d62887aad0fdb6a0a24',1,'5JR2',480174029,0),('e8a5bd539d3a87287a5d6b8d6ac8abba','97f1372114b73a3fad66edf5c19fcdb2',1,'G4G2MX',879496741,0),('bd3f9843c9df21cbbf1ca4dfd9bd9427','9c57d905ecf145e9fbdf06e1a7e1d971',1,'4QBE',1188304155,0),('73227db7e10b11515d2f2097ca83745d','a2939ac85b1bb5aaf72d3a58af1114d3',1,'2XRI',1470074506,0),('1f9a11f048c4f6f21972055040fc05cb','a50e0ed9a09582ecd924740871c8929d',1,'63AK',1877766200,0),('d56dce932ceb535242809a2275500c06','a7ffd1217b1225d31eb3ec92f113eac2',1,'6A582A',2032575438,0),('bca5a45036402f07f6f4da112d0d54eb','a906c1d9518b0b0fb212175ea64d4900',1,'2FHKL',1520379974,0),('a0e3caef53d89ab16adb045e505af11a','abd32e26c7144d20c28e8fdcb39eb920',1,'2C6USL8',825476421,0),('9f3175b45448c1ec5c60aae0dec3def0','acabc8bc7297e7760308a80bf2ee4e78',1,'29JHU',1100446901,0),('442f39eefab72e5550ca27561a63232c','af9bae958017cdc5d6bc53d76090efa0',1,'2FFAB',1691560058,0),('6cd92117b88baa8c8781ea36f2b8395b','b07d31b811a5b458de7e5a9ac68cf555',1,'7IXWQ7',1856303112,0),('376a610e5d109c1ffce568259593a666','b1b0faca7ee15500b82832e1161cc094',1,'2C3IU5',57629619,0),('c92982d7fab7c588c6c55b990e7d784f','b2aa5ccfd61d9c0ca558ac7525e391e2',1,'15D34',1520916340,0),('57bba75e03c84487e94c41121c18aa36','ba9223e5434263f19ca3fe84e5a26b70',1,'24VGQ',1218703763,0),('3ce0826724e4b2ba70fd9228ae7aa6bb','bc56b134a58d48a8d707eaa53e0a16fb',1,'2WCB5',2010766028,0),('cabcade7e3b2fb6c60e631ab04429a3a','c0961594cf795db76ce8a9f0cda4f5a7',1,'6UP9N',947534255,0),('edd57ba0cc836871cc95d769e3a3ddf0','c760dda3622d2b49165f39a94f175a59',1,'3Z962T',1751770988,0),('53349b85b6cdf4f575936927b8659efe','c80f11a27777785a3df87a1416352d61',1,'3RAWI',1785618851,0),('d3491938ce26163bdda9c5b0de45c651','d1fe985313dc14c2620438774976ec5f',1,'218CV',1136198530,0),('105058954eb2770f28b271aa4ef97058','d2e0948297846570acb625d990db3753',1,'IUJUF5',744940916,0),('5f4b29a8f9d65cd69ca1d912fb403cc3','d4b7b67d3a14518722c799ed58fe39f7',1,'4GWX',246779377,0),('2fd1fa4d6d50d6a6ac0cf4d32ac8a05b','d4e7c57fd19fa5ac2b5b769a510814cb',1,'3MGJI',723409301,0),('00cdd5c24eb6440c259c36d5c6f0ff7e','d620a428f5521facd807c8641e326312',1,'3R4BABP',2058074489,0),('e3977f4a64a4f5196976f6f46055b5de','d694a523f484990999a22178c81faf12',1,'38HDEA',832482087,0),('0d714a5983d55ff3c8d92298d8fe6a26','d78f0523cd7e346039dea389cf37cddc',1,'A9HA5',408805159,0),('0078441f35cc084c13ff6626bd2e857d','daf3d0e3fed3f91142416fb08c467d5b',1,'5P7EY',1971250219,0),('c74b548651cd46f0253a28c2e2da7698','dda25742946e95f87c9d228910e0751f',1,'14WZI',871331810,0),('62838e871f06258c2f6cd0aca087955a','dfc7ec9598cdc01bcbe87d3db8a0cf03',1,'1VVS5',1042100774,0),('cfe67eb9fd60148c9a6e51bfade8e7a0','e05b5fa77ae5f877f7bc7fcad9aa3520',1,'4DE4MZ',1053897470,0),('ccaf2b163eedfe3bab483af5c7b1ad1f','e09b668fab470e18e59a42581498e056',1,'3X6MJN',1620557088,0),('46d574be9023783f65691b8211f0064f','e2fefdc54088a96a860d85691b07fbd4',1,'4QAP',1875033530,0),('3d914a043c553be6be949bec63bba658','e5754ac2cc1c3a080aa693e610000ce1',1,'6K98',2072743412,0),('dc36c993a6a8bc826e8dbcc4208c9e73','e6009bbfa36775e42ea257fb7d7b02f3',1,'1ALE',1725080099,0),('e9be7b2096c620876aa8f4f3051ba813','e7140e919b04e13a46cce57de63ebc6c',1,'7I6B1FX',1357187669,0),('5af9da6eb495a19d7008feedcb97ea38','e914b7eb8c94293f8062ae72d784cfe6',1,'6YCMJ',937737114,0),('dc093ad9549fe9c101edc9ce729f7ae9','e9c40ac4ee9a335d18c38516b192be4c',1,'XRZD66',1265951084,0),('c1a28ddb26cb07ae320ae3da4f3ae6aa','f06050871790bb93cbb2c387fc73b9aa',1,'4QA3EA',1543804183,0),('b6dfdfcf779e68ac9e3ece422abe6ceb','f0663b06fce3f10eeac6a32c0563e8d0',1,'5HIPK',1610678038,0),('aebea6612a61a9a52098b879ad3ffcf6','f69d855e3adf9d7aae5b46f51e9decc8',1,'M8FIV8V',1757843078,0),('67ceca0cd8040e490608f7185dce2553','fbc39638b07103e8da91f211b6c23312',1,'5BLS',6695599,0),('1deda5a94b3f7abcc27bd4682d4ec519','fe352ccd0c4cab6f23aebdc6bed0e7cf',1,'4TW9RJZ',1797397051,0),('b3feeb9e0bada5a7c09d79a5ffab113c','ff5125a83740fb58f4be907593e7e1d1',1,'1FTL',1483919213,0);
/*!40000 ALTER TABLE `phpbb_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_disallow`
--

DROP TABLE IF EXISTS `phpbb_disallow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_disallow`
--

LOCK TABLES `phpbb_disallow` WRITE;
/*!40000 ALTER TABLE `phpbb_disallow` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_disallow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_drafts`
--

DROP TABLE IF EXISTS `phpbb_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_drafts` (
  `draft_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `save_time` int(11) unsigned NOT NULL DEFAULT '0',
  `draft_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `draft_message` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_drafts`
--

LOCK TABLES `phpbb_drafts` WRITE;
/*!40000 ALTER TABLE `phpbb_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_ext`
--

DROP TABLE IF EXISTS `phpbb_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_ext` (
  `ext_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ext_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ext_state` text COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `ext_name` (`ext_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_ext`
--

LOCK TABLES `phpbb_ext` WRITE;
/*!40000 ALTER TABLE `phpbb_ext` DISABLE KEYS */;
INSERT INTO `phpbb_ext` VALUES ('phpbb/viglink',1,'b:0;');
/*!40000 ALTER TABLE `phpbb_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_extension_groups`
--

DROP TABLE IF EXISTS `phpbb_extension_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `allowed_forums` text COLLATE utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_extension_groups`
--

LOCK TABLES `phpbb_extension_groups` WRITE;
/*!40000 ALTER TABLE `phpbb_extension_groups` DISABLE KEYS */;
INSERT INTO `phpbb_extension_groups` VALUES (1,'IMAGES',1,1,1,'',0,'',0),(2,'ARCHIVES',0,1,1,'',0,'',0),(3,'PLAIN_TEXT',0,0,1,'',0,'',0),(4,'DOCUMENTS',0,0,1,'',0,'',0),(5,'FLASH_FILES',5,0,1,'',0,'',0),(6,'DOWNLOADABLE_FILES',0,0,1,'',0,'',0);
/*!40000 ALTER TABLE `phpbb_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_extensions`
--

DROP TABLE IF EXISTS `phpbb_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_extensions`
--

LOCK TABLES `phpbb_extensions` WRITE;
/*!40000 ALTER TABLE `phpbb_extensions` DISABLE KEYS */;
INSERT INTO `phpbb_extensions` VALUES (1,1,'gif'),(2,1,'png'),(3,1,'jpeg'),(4,1,'jpg'),(5,1,'tif'),(6,1,'tiff'),(7,1,'tga'),(8,2,'gtar'),(9,2,'gz'),(10,2,'tar'),(11,2,'zip'),(12,2,'rar'),(13,2,'ace'),(14,2,'torrent'),(15,2,'tgz'),(16,2,'bz2'),(17,2,'7z'),(18,3,'txt'),(19,3,'c'),(20,3,'h'),(21,3,'cpp'),(22,3,'hpp'),(23,3,'diz'),(24,3,'csv'),(25,3,'ini'),(26,3,'log'),(27,3,'js'),(28,3,'xml'),(29,4,'xls'),(30,4,'xlsx'),(31,4,'xlsm'),(32,4,'xlsb'),(33,4,'doc'),(34,4,'docx'),(35,4,'docm'),(36,4,'dot'),(37,4,'dotx'),(38,4,'dotm'),(39,4,'pdf'),(40,4,'ai'),(41,4,'ps'),(42,4,'ppt'),(43,4,'pptx'),(44,4,'pptm'),(45,4,'odg'),(46,4,'odp'),(47,4,'ods'),(48,4,'odt'),(49,4,'rtf'),(50,5,'swf'),(51,6,'mp3'),(52,6,'mpeg'),(53,6,'mpg'),(54,6,'ogg'),(55,6,'ogm');
/*!40000 ALTER TABLE `phpbb_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums`
--

DROP TABLE IF EXISTS `phpbb_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_parents` mediumtext COLLATE utf8_bin NOT NULL,
  `forum_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc` text COLLATE utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules` text COLLATE utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_rules_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_topics_per_page` tinyint(4) NOT NULL DEFAULT '0',
  `forum_type` tinyint(4) NOT NULL DEFAULT '0',
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_flags` tinyint(4) NOT NULL DEFAULT '32',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_icons` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) unsigned NOT NULL DEFAULT '0',
  `prune_days` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_freq` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `forum_options` int(20) unsigned NOT NULL DEFAULT '0',
  `forum_posts_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_posts_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_posts_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enable_shadow_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_shadow_days` mediumint(8) unsigned NOT NULL DEFAULT '7',
  `prune_shadow_freq` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `prune_shadow_next` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_forums`
--

LOCK TABLES `phpbb_forums` WRITE;
/*!40000 ALTER TABLE `phpbb_forums` DISABLE KEYS */;
INSERT INTO `phpbb_forums` VALUES (1,0,1,4,'','Your first category','','',7,'','','',0,'','','','',7,'',0,0,0,1,2,'',1490128344,'admin','AA0000',32,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,7,1,0),(2,1,2,3,'a:1:{i:1;a:2:{i:0;s:19:\"Your first category\";i:1;i:0;}}','Your first forum','Description of your first forum.','',7,'','','',0,'','','','',7,'',0,1,0,100,2,'4SiV9HWcfCFq1QL3Wp9K',1506041612,'admin','AA0000',48,1,1,1,0,0,0,0,0,1,0,100,0,0,100,0,0,0,7,1,0);
/*!40000 ALTER TABLE `phpbb_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums_access`
--

DROP TABLE IF EXISTS `phpbb_forums_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`forum_id`,`user_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_forums_access`
--

LOCK TABLES `phpbb_forums_access` WRITE;
/*!40000 ALTER TABLE `phpbb_forums_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_forums_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums_track`
--

DROP TABLE IF EXISTS `phpbb_forums_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_forums_track` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_forums_track`
--

LOCK TABLES `phpbb_forums_track` WRITE;
/*!40000 ALTER TABLE `phpbb_forums_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_forums_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums_watch`
--

DROP TABLE IF EXISTS `phpbb_forums_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_forums_watch`
--

LOCK TABLES `phpbb_forums_watch` WRITE;
/*!40000 ALTER TABLE `phpbb_forums_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_forums_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_groups`
--

DROP TABLE IF EXISTS `phpbb_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `group_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_legend` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_groups`
--

LOCK TABLES `phpbb_groups` WRITE;
/*!40000 ALTER TABLE `phpbb_groups` DISABLE KEYS */;
INSERT INTO `phpbb_groups` VALUES (1,3,0,0,'GUESTS','','',7,'',0,'','',0,0,0,'',0,0,0,0,5),(2,3,0,0,'REGISTERED','','',7,'',0,'','',0,0,0,'',0,0,0,0,5),(3,3,0,0,'REGISTERED_COPPA','','',7,'',0,'','',0,0,0,'',0,0,0,0,5),(4,3,0,0,'GLOBAL_MODERATORS','','',7,'',0,'','',0,0,0,'00AA00',0,0,0,2,0),(5,3,1,0,'ADMINISTRATORS','','',7,'',0,'','',0,0,0,'AA0000',0,0,0,1,0),(6,3,0,0,'BOTS','','',7,'',0,'','',0,0,0,'9E8DA7',0,0,0,0,5),(7,3,0,0,'NEWLY_REGISTERED','','',7,'',0,'','',0,0,0,'',0,0,0,0,5);
/*!40000 ALTER TABLE `phpbb_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_icons`
--

DROP TABLE IF EXISTS `phpbb_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icons_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_width` tinyint(4) NOT NULL DEFAULT '0',
  `icons_height` tinyint(4) NOT NULL DEFAULT '0',
  `icons_alt` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_icons`
--

LOCK TABLES `phpbb_icons` WRITE;
/*!40000 ALTER TABLE `phpbb_icons` DISABLE KEYS */;
INSERT INTO `phpbb_icons` VALUES (1,'misc/fire.gif',16,16,'',1,1),(2,'smile/redface.gif',16,16,'',9,1),(3,'smile/mrgreen.gif',16,16,'',10,1),(4,'misc/heart.gif',16,16,'',4,1),(5,'misc/star.gif',16,16,'',2,1),(6,'misc/radioactive.gif',16,16,'',3,1),(7,'misc/thinking.gif',16,16,'',5,1),(8,'smile/info.gif',16,16,'',8,1),(9,'smile/question.gif',16,16,'',6,1),(10,'smile/alert.gif',16,16,'',7,1);
/*!40000 ALTER TABLE `phpbb_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_lang`
--

DROP TABLE IF EXISTS `phpbb_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_dir` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_english_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_local_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_author` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_lang`
--

LOCK TABLES `phpbb_lang` WRITE;
/*!40000 ALTER TABLE `phpbb_lang` DISABLE KEYS */;
INSERT INTO `phpbb_lang` VALUES (1,'en','en','British English','British English','phpBB Limited');
/*!40000 ALTER TABLE `phpbb_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_log`
--

DROP TABLE IF EXISTS `phpbb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reportee_id` int(10) unsigned NOT NULL DEFAULT '0',
  `log_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_operation` text COLLATE utf8_bin NOT NULL,
  `log_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`),
  KEY `log_time` (`log_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_log`
--

LOCK TABLES `phpbb_log` WRITE;
/*!40000 ALTER TABLE `phpbb_log` DISABLE KEYS */;
INSERT INTO `phpbb_log` VALUES (1,0,1,0,0,0,0,'172.16.12.243',1490128348,'LOG_MODULE_ADD','a:1:{i:0;s:20:\"ACP_VIGLINK_SETTINGS\";}'),(2,0,1,0,0,0,0,'',1490128348,'LOG_EXT_ENABLE','a:1:{i:0;s:13:\"phpbb/viglink\";}'),(3,0,2,0,0,0,0,'172.16.12.243',1490128348,'LOG_INSTALL_INSTALLED','a:1:{i:0;s:5:\"3.2.0\";}'),(4,0,2,0,0,0,0,'172.16.10.151',1490371390,'LOG_ADMIN_AUTH_SUCCESS',''),(5,0,2,0,0,0,0,'172.16.10.151',1490371415,'LOG_ACL_ADD_FORUM_LOCAL_F_','a:2:{i:0;s:16:\"Your first forum\";i:1;s:41:\"<span class=\"sep\">Registered users</span>\";}'),(6,0,2,0,0,0,0,'172.16.10.151',1490371423,'LOG_ACL_ADD_FORUM_LOCAL_F_','a:2:{i:0;s:16:\"Your first forum\";i:1;s:47:\"<span class=\"sep\">Newly registered users</span>\";}');
/*!40000 ALTER TABLE `phpbb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_login_attempts`
--

DROP TABLE IF EXISTS `phpbb_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_login_attempts` (
  `attempt_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  KEY `att_ip` (`attempt_ip`,`attempt_time`),
  KEY `att_for` (`attempt_forwarded_for`,`attempt_time`),
  KEY `att_time` (`attempt_time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_login_attempts`
--

LOCK TABLES `phpbb_login_attempts` WRITE;
/*!40000 ALTER TABLE `phpbb_login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_migrations`
--

DROP TABLE IF EXISTS `phpbb_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_migrations` (
  `migration_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `migration_depends_on` text COLLATE utf8_bin NOT NULL,
  `migration_schema_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `migration_data_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `migration_data_state` text COLLATE utf8_bin NOT NULL,
  `migration_start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `migration_end_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`migration_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_migrations`
--

LOCK TABLES `phpbb_migrations` WRITE;
/*!40000 ALTER TABLE `phpbb_migrations` DISABLE KEYS */;
INSERT INTO `phpbb_migrations` VALUES ('\\phpbb\\db\\migration\\data\\v30x\\local_url_bbcode','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_0','a:0:{}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc2','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc3','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc1','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_10\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc2','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc1','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc2','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc3','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_pl1','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_rc1','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14_rc1','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_0\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc2','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5','a:1:{i:0;s:52:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1part2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_4\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1part2','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc4\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_5\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc2','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc3','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc4','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6_rc3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_pl1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_6\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc2','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8_rc1','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_7_pl1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc4\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc1','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_8\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc2','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc3','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc4','a:1:{i:0;s:47:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_9_rc3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\acp_prune_users_module','a:1:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v310\\beta1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\acp_style_components_module','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\allow_cdn','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v310\\jquery_update\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\alpha1','a:18:{i:0;s:46:\"\\phpbb\\db\\migration\\data\\v30x\\local_url_bbcode\";i:1;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_12\";i:2;s:57:\"\\phpbb\\db\\migration\\data\\v310\\acp_style_components_module\";i:3;s:39:\"\\phpbb\\db\\migration\\data\\v310\\allow_cdn\";i:4;s:49:\"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth\";i:5;s:37:\"\\phpbb\\db\\migration\\data\\v310\\avatars\";i:6;s:40:\"\\phpbb\\db\\migration\\data\\v310\\boardindex\";i:7;s:44:\"\\phpbb\\db\\migration\\data\\v310\\config_db_text\";i:8;s:45:\"\\phpbb\\db\\migration\\data\\v310\\forgot_password\";i:9;s:41:\"\\phpbb\\db\\migration\\data\\v310\\mod_rewrite\";i:10;s:49:\"\\phpbb\\db\\migration\\data\\v310\\mysql_fulltext_drop\";i:11;s:40:\"\\phpbb\\db\\migration\\data\\v310\\namespaces\";i:12;s:48:\"\\phpbb\\db\\migration\\data\\v310\\notifications_cron\";i:13;s:60:\"\\phpbb\\db\\migration\\data\\v310\\notification_options_reconvert\";i:14;s:38:\"\\phpbb\\db\\migration\\data\\v310\\plupload\";i:15;s:51:\"\\phpbb\\db\\migration\\data\\v310\\signature_module_auth\";i:16;s:52:\"\\phpbb\\db\\migration\\data\\v310\\softdelete_mcp_modules\";i:17;s:38:\"\\phpbb\\db\\migration\\data\\v310\\teampage\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\alpha2','a:2:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v310\\alpha1\";i:1;s:51:\"\\phpbb\\db\\migration\\data\\v310\\notifications_cron_p2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\alpha3','a:4:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v310\\alpha2\";i:1;s:42:\"\\phpbb\\db\\migration\\data\\v310\\avatar_types\";i:2;s:39:\"\\phpbb\\db\\migration\\data\\v310\\passwords\";i:3;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth','a:0:{}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth2','a:1:{i:0;s:49:\"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\avatar_types','a:2:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";i:1;s:37:\"\\phpbb\\db\\migration\\data\\v310\\avatars\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\avatars','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\beta1','a:7:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v310\\alpha3\";i:1;s:42:\"\\phpbb\\db\\migration\\data\\v310\\passwords_p2\";i:2;s:52:\"\\phpbb\\db\\migration\\data\\v310\\postgres_fulltext_drop\";i:3;s:63:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_change_load_settings\";i:4;s:51:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_location\";i:5;s:54:\"\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert2\";i:6;s:48:\"\\phpbb\\db\\migration\\data\\v310\\ucp_popuppm_module\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\beta2','a:3:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v310\\beta1\";i:1;s:52:\"\\phpbb\\db\\migration\\data\\v310\\acp_prune_users_module\";i:2;s:59:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_location_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\beta3','a:6:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v310\\beta2\";i:1;s:50:\"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth2\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\board_contact_name\";i:3;s:44:\"\\phpbb\\db\\migration\\data\\v310\\jquery_update2\";i:4;s:50:\"\\phpbb\\db\\migration\\data\\v310\\live_searches_config\";i:5;s:49:\"\\phpbb\\db\\migration\\data\\v310\\prune_shadow_topics\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\beta4','a:3:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v310\\beta3\";i:1;s:69:\"\\phpbb\\db\\migration\\data\\v310\\extensions_version_check_force_unstable\";i:2;s:58:\"\\phpbb\\db\\migration\\data\\v310\\reset_missing_captcha_plugin\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\board_contact_name','a:1:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v310\\beta2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\boardindex','a:0:{}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\bot_update','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc6\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\captcha_plugins','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\config_db_text','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\contact_admin_acp_module','a:0:{}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\contact_admin_form','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v310\\config_db_text\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\dev','a:5:{i:0;s:40:\"\\phpbb\\db\\migration\\data\\v310\\extensions\";i:1;s:45:\"\\phpbb\\db\\migration\\data\\v310\\style_update_p2\";i:2;s:41:\"\\phpbb\\db\\migration\\data\\v310\\timezone_p2\";i:3;s:52:\"\\phpbb\\db\\migration\\data\\v310\\reported_posts_display\";i:4;s:46:\"\\phpbb\\db\\migration\\data\\v310\\migrations_table\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\extensions','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\extensions_version_check_force_unstable','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\forgot_password','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\gold','a:2:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc6\";i:1;s:40:\"\\phpbb\\db\\migration\\data\\v310\\bot_update\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\jquery_update','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\jquery_update2','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v310\\jquery_update\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\live_searches_config','a:0:{}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\migrations_table','a:0:{}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\mod_rewrite','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\mysql_fulltext_drop','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\namespaces','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\notification_options_reconvert','a:1:{i:0;s:54:\"\\phpbb\\db\\migration\\data\\v310\\notifications_schema_fix\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\notifications','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\notifications_cron','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v310\\notifications\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\notifications_cron_p2','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v310\\notifications_cron\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\notifications_schema_fix','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v310\\notifications\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\notifications_use_full_name','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\passwords','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p1','a:1:{i:0;s:42:\"\\phpbb\\db\\migration\\data\\v310\\passwords_p2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p2','a:1:{i:0;s:50:\"\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\passwords_p2','a:1:{i:0;s:39:\"\\phpbb\\db\\migration\\data\\v310\\passwords\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\plupload','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\postgres_fulltext_drop','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_aol','a:1:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_aol_cleanup','a:1:{i:0;s:46:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_aol\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_change_load_settings','a:1:{i:0;s:54:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_aol_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_cleanup','a:2:{i:0;s:52:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_interests\";i:1;s:53:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_occupation\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field','a:1:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_facebook','a:3:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field\";i:1;s:55:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_field_validation_length','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_googleplus','a:3:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field\";i:1;s:55:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_icq','a:1:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_icq_cleanup','a:1:{i:0;s:46:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_icq\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_interests','a:2:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";i:1;s:55:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_location','a:2:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";i:1;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_location_cleanup','a:1:{i:0;s:51:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_location\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_occupation','a:1:{i:0;s:52:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_interests\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist','a:1:{i:0;s:50:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_skype','a:3:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field\";i:1;s:55:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_twitter','a:3:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field\";i:1;s:55:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_types','a:1:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v310\\alpha2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_website','a:2:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_on_memberlist\";i:1;s:54:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_icq_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_website_cleanup','a:1:{i:0;s:50:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_website\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm','a:1:{i:0;s:58:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_website_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm_cleanup','a:1:{i:0;s:46:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo','a:1:{i:0;s:54:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_wlm_cleanup\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo_cleanup','a:1:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_yahoo\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\profilefield_youtube','a:3:{i:0;s:56:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_contact_field\";i:1;s:55:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_show_novalue\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_types\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\prune_shadow_topics','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rc1','a:9:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v310\\beta4\";i:1;s:54:\"\\phpbb\\db\\migration\\data\\v310\\contact_admin_acp_module\";i:2;s:48:\"\\phpbb\\db\\migration\\data\\v310\\contact_admin_form\";i:3;s:50:\"\\phpbb\\db\\migration\\data\\v310\\passwords_convert_p2\";i:4;s:51:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_facebook\";i:5;s:53:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_googleplus\";i:6;s:48:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_skype\";i:7;s:50:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_twitter\";i:8;s:50:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_youtube\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rc2','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rc3','a:5:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc2\";i:1;s:45:\"\\phpbb\\db\\migration\\data\\v310\\captcha_plugins\";i:2;s:53:\"\\phpbb\\db\\migration\\data\\v310\\rename_too_long_indexes\";i:3;s:41:\"\\phpbb\\db\\migration\\data\\v310\\search_type\";i:4;s:49:\"\\phpbb\\db\\migration\\data\\v310\\topic_sort_username\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rc4','a:2:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc3\";i:1;s:57:\"\\phpbb\\db\\migration\\data\\v310\\notifications_use_full_name\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rc5','a:3:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc4\";i:1;s:66:\"\\phpbb\\db\\migration\\data\\v310\\profilefield_field_validation_length\";i:2;s:53:\"\\phpbb\\db\\migration\\data\\v310\\remove_acp_styles_cache\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rc6','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc5\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\remove_acp_styles_cache','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\rc4\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\rename_too_long_indexes','a:1:{i:0;s:43:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_0\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\reported_posts_display','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\reset_missing_captcha_plugin','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\search_type','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\signature_module_auth','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert','a:1:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v310\\alpha3\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert2','a:1:{i:0;s:53:\"\\phpbb\\db\\migration\\data\\v310\\soft_delete_mod_convert\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\softdelete_mcp_modules','a:2:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";i:1;s:43:\"\\phpbb\\db\\migration\\data\\v310\\softdelete_p2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\softdelete_p1','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\softdelete_p2','a:2:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";i:1;s:43:\"\\phpbb\\db\\migration\\data\\v310\\softdelete_p1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\style_update_p1','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\style_update_p2','a:1:{i:0;s:45:\"\\phpbb\\db\\migration\\data\\v310\\style_update_p1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\teampage','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\timezone','a:1:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_11\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\timezone_p2','a:1:{i:0;s:38:\"\\phpbb\\db\\migration\\data\\v310\\timezone\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\topic_sort_username','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v310\\ucp_popuppm_module','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v310\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\add_log_time_index','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v319\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_dateformat','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v317\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_emotion','a:1:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v31x\\v3110\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\m_pm_report','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v316rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\m_softdelete_global','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v311\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\plupload_last_gc_dynamic','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v312\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\profilefield_remove_underscore_from_alpha','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v311\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\profilefield_yahoo_update_url','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v312\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\remove_duplicate_migrations','a:1:{i:0;s:35:\"\\phpbb\\db\\migration\\data\\v31x\\v3110\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\style_update','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v310\\gold\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\update_custom_bbcodes_with_idn','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v312\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v311','a:2:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v310\\gold\";i:1;s:42:\"\\phpbb\\db\\migration\\data\\v31x\\style_update\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v3110','a:1:{i:0;s:38:\"\\phpbb\\db\\migration\\data\\v31x\\v3110rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v3110rc1','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v319\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v312','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v312rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v312rc1','a:2:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v311\";i:1;s:49:\"\\phpbb\\db\\migration\\data\\v31x\\m_softdelete_global\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v313','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v313rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v313rc1','a:5:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_rc1\";i:1;s:54:\"\\phpbb\\db\\migration\\data\\v31x\\plupload_last_gc_dynamic\";i:2;s:71:\"\\phpbb\\db\\migration\\data\\v31x\\profilefield_remove_underscore_from_alpha\";i:3;s:59:\"\\phpbb\\db\\migration\\data\\v31x\\profilefield_yahoo_update_url\";i:4;s:60:\"\\phpbb\\db\\migration\\data\\v31x\\update_custom_bbcodes_with_idn\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v313rc2','a:2:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_13_pl1\";i:1;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v313rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v314','a:2:{i:0;s:44:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14\";i:1;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v314rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v314rc1','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v313\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v314rc2','a:2:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v30x\\release_3_0_14_rc1\";i:1;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v314rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v315','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v315rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v315rc1','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v314\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v316','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v316rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v316rc1','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v315\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v317','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v317rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v317pl1','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v317\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v317rc1','a:2:{i:0;s:41:\"\\phpbb\\db\\migration\\data\\v31x\\m_pm_report\";i:1;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v316\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v318','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v318rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v318rc1','a:2:{i:0;s:57:\"\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_dateformat\";i:1;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v317pl1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v319','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v319rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v31x\\v319rc1','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v318\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\add_help_phpbb','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v320\\v320rc1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\allowed_schemes_links','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\announce_global_permission','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\cookie_notice','a:1:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v320\\v320rc2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\default_data_type_ids','a:2:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v320\\v320a2\";i:1;s:42:\"\\phpbb\\db\\migration\\data\\v320\\oauth_states\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\dev','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v316\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\font_awesome_update','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\icons_alt','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\log_post_id','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\notifications_board','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\oauth_states','a:1:{i:0;s:49:\"\\phpbb\\db\\migration\\data\\v310\\auth_provider_oauth\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\remote_upload_validation','a:1:{i:0;s:36:\"\\phpbb\\db\\migration\\data\\v320\\v320a2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\remove_outdated_media','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\remove_profilefield_wlm','a:1:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\report_id_auto_increment','a:1:{i:0;s:51:\"\\phpbb\\db\\migration\\data\\v320\\default_data_type_ids\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\text_reparser','a:2:{i:0;s:48:\"\\phpbb\\db\\migration\\data\\v310\\contact_admin_form\";i:1;s:51:\"\\phpbb\\db\\migration\\data\\v320\\allowed_schemes_links\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320','a:2:{i:0;s:54:\"\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_emotion\";i:1;s:43:\"\\phpbb\\db\\migration\\data\\v320\\cookie_notice\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320a1','a:9:{i:0;s:33:\"\\phpbb\\db\\migration\\data\\v320\\dev\";i:1;s:51:\"\\phpbb\\db\\migration\\data\\v320\\allowed_schemes_links\";i:2;s:56:\"\\phpbb\\db\\migration\\data\\v320\\announce_global_permission\";i:3;s:53:\"\\phpbb\\db\\migration\\data\\v320\\remove_profilefield_wlm\";i:4;s:49:\"\\phpbb\\db\\migration\\data\\v320\\font_awesome_update\";i:5;s:39:\"\\phpbb\\db\\migration\\data\\v320\\icons_alt\";i:6;s:41:\"\\phpbb\\db\\migration\\data\\v320\\log_post_id\";i:7;s:51:\"\\phpbb\\db\\migration\\data\\v320\\remove_outdated_media\";i:8;s:49:\"\\phpbb\\db\\migration\\data\\v320\\notifications_board\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320a2','a:3:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v317rc1\";i:1;s:43:\"\\phpbb\\db\\migration\\data\\v320\\text_reparser\";i:2;s:36:\"\\phpbb\\db\\migration\\data\\v320\\v320a1\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320b1','a:4:{i:0;s:37:\"\\phpbb\\db\\migration\\data\\v31x\\v317pl1\";i:1;s:36:\"\\phpbb\\db\\migration\\data\\v320\\v320a2\";i:2;s:57:\"\\phpbb\\db\\migration\\data\\v31x\\increase_size_of_dateformat\";i:3;s:51:\"\\phpbb\\db\\migration\\data\\v320\\default_data_type_ids\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320b2','a:3:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v318\";i:1;s:36:\"\\phpbb\\db\\migration\\data\\v320\\v320b1\";i:2;s:54:\"\\phpbb\\db\\migration\\data\\v320\\remote_upload_validation\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320rc1','a:3:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v319\";i:1;s:54:\"\\phpbb\\db\\migration\\data\\v320\\report_id_auto_increment\";i:2;s:36:\"\\phpbb\\db\\migration\\data\\v320\\v320b2\";}',1,1,'',1490128347,1490128347),('\\phpbb\\db\\migration\\data\\v320\\v320rc2','a:3:{i:0;s:57:\"\\phpbb\\db\\migration\\data\\v31x\\remove_duplicate_migrations\";i:1;s:48:\"\\phpbb\\db\\migration\\data\\v31x\\add_log_time_index\";i:2;s:44:\"\\phpbb\\db\\migration\\data\\v320\\add_help_phpbb\";}',1,1,'',1490128347,1490128347),('\\phpbb\\viglink\\migrations\\viglink_ask_admin','a:1:{i:0;s:41:\"\\phpbb\\viglink\\migrations\\viglink_data_v2\";}',1,1,'',1490128348,1490128348),('\\phpbb\\viglink\\migrations\\viglink_cron','a:1:{i:0;s:38:\"\\phpbb\\viglink\\migrations\\viglink_data\";}',1,1,'',0,0),('\\phpbb\\viglink\\migrations\\viglink_data','a:1:{i:0;s:34:\"\\phpbb\\db\\migration\\data\\v31x\\v312\";}',1,1,'',1490128348,1490128348),('\\phpbb\\viglink\\migrations\\viglink_data_v2','a:1:{i:0;s:38:\"\\phpbb\\viglink\\migrations\\viglink_data\";}',1,1,'',1490128348,1490128348);
/*!40000 ALTER TABLE `phpbb_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_moderator_cache`
--

DROP TABLE IF EXISTS `phpbb_moderator_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_moderator_cache`
--

LOCK TABLES `phpbb_moderator_cache` WRITE;
/*!40000 ALTER TABLE `phpbb_moderator_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_moderator_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_modules`
--

DROP TABLE IF EXISTS `phpbb_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_basename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_class` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_langname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_mode` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_auth` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_modules`
--

LOCK TABLES `phpbb_modules` WRITE;
/*!40000 ALTER TABLE `phpbb_modules` DISABLE KEYS */;
INSERT INTO `phpbb_modules` VALUES (1,1,1,'','acp',0,1,68,'ACP_CAT_GENERAL','',''),(2,1,1,'','acp',1,4,17,'ACP_QUICK_ACCESS','',''),(3,1,1,'','acp',1,18,45,'ACP_BOARD_CONFIGURATION','',''),(4,1,1,'','acp',1,46,53,'ACP_CLIENT_COMMUNICATION','',''),(5,1,1,'','acp',1,54,67,'ACP_SERVER_CONFIGURATION','',''),(6,1,1,'','acp',0,69,88,'ACP_CAT_FORUMS','',''),(7,1,1,'','acp',6,70,75,'ACP_MANAGE_FORUMS','',''),(8,1,1,'','acp',6,76,87,'ACP_FORUM_BASED_PERMISSIONS','',''),(9,1,1,'','acp',0,89,116,'ACP_CAT_POSTING','',''),(10,1,1,'','acp',9,90,103,'ACP_MESSAGES','',''),(11,1,1,'','acp',9,104,115,'ACP_ATTACHMENTS','',''),(12,1,1,'','acp',0,117,174,'ACP_CAT_USERGROUP','',''),(13,1,1,'','acp',12,118,153,'ACP_CAT_USERS','',''),(14,1,1,'','acp',12,154,163,'ACP_GROUPS','',''),(15,1,1,'','acp',12,164,173,'ACP_USER_SECURITY','',''),(16,1,1,'','acp',0,175,224,'ACP_CAT_PERMISSIONS','',''),(17,1,1,'','acp',16,178,187,'ACP_GLOBAL_PERMISSIONS','',''),(18,1,1,'','acp',16,188,199,'ACP_FORUM_BASED_PERMISSIONS','',''),(19,1,1,'','acp',16,200,209,'ACP_PERMISSION_ROLES','',''),(20,1,1,'','acp',16,210,223,'ACP_PERMISSION_MASKS','',''),(21,1,1,'','acp',0,225,240,'ACP_CAT_CUSTOMISE','',''),(22,1,1,'','acp',21,230,235,'ACP_STYLE_MANAGEMENT','',''),(23,1,1,'','acp',21,226,229,'ACP_EXTENSION_MANAGEMENT','',''),(24,1,1,'','acp',21,236,239,'ACP_LANGUAGE','',''),(25,1,1,'','acp',0,241,260,'ACP_CAT_MAINTENANCE','',''),(26,1,1,'','acp',25,242,251,'ACP_FORUM_LOGS','',''),(27,1,1,'','acp',25,252,259,'ACP_CAT_DATABASE','',''),(28,1,1,'','acp',0,261,284,'ACP_CAT_SYSTEM','',''),(29,1,1,'','acp',28,262,265,'ACP_AUTOMATION','',''),(30,1,1,'','acp',28,266,275,'ACP_GENERAL_TASKS','',''),(31,1,1,'','acp',28,276,283,'ACP_MODULE_MANAGEMENT','',''),(32,1,1,'','acp',0,285,286,'ACP_CAT_DOT_MODS','',''),(33,1,1,'acp_attachments','acp',3,19,20,'ACP_ATTACHMENT_SETTINGS','attach','acl_a_attach'),(34,1,1,'acp_attachments','acp',11,105,106,'ACP_ATTACHMENT_SETTINGS','attach','acl_a_attach'),(35,1,1,'acp_attachments','acp',11,107,108,'ACP_MANAGE_EXTENSIONS','extensions','acl_a_attach'),(36,1,1,'acp_attachments','acp',11,109,110,'ACP_EXTENSION_GROUPS','ext_groups','acl_a_attach'),(37,1,1,'acp_attachments','acp',11,111,112,'ACP_ORPHAN_ATTACHMENTS','orphan','acl_a_attach'),(38,1,1,'acp_attachments','acp',11,113,114,'ACP_MANAGE_ATTACHMENTS','manage','acl_a_attach'),(39,1,1,'acp_ban','acp',15,165,166,'ACP_BAN_EMAILS','email','acl_a_ban'),(40,1,1,'acp_ban','acp',15,167,168,'ACP_BAN_IPS','ip','acl_a_ban'),(41,1,1,'acp_ban','acp',15,169,170,'ACP_BAN_USERNAMES','user','acl_a_ban'),(42,1,1,'acp_bbcodes','acp',10,91,92,'ACP_BBCODES','bbcodes','acl_a_bbcode'),(43,1,1,'acp_board','acp',3,21,22,'ACP_BOARD_SETTINGS','settings','acl_a_board'),(44,1,1,'acp_board','acp',3,23,24,'ACP_BOARD_FEATURES','features','acl_a_board'),(45,1,1,'acp_board','acp',3,25,26,'ACP_AVATAR_SETTINGS','avatar','acl_a_board'),(46,1,1,'acp_board','acp',3,27,28,'ACP_MESSAGE_SETTINGS','message','acl_a_board'),(47,1,1,'acp_board','acp',10,93,94,'ACP_MESSAGE_SETTINGS','message','acl_a_board'),(48,1,1,'acp_board','acp',3,29,30,'ACP_POST_SETTINGS','post','acl_a_board'),(49,1,1,'acp_board','acp',10,95,96,'ACP_POST_SETTINGS','post','acl_a_board'),(50,1,1,'acp_board','acp',3,31,32,'ACP_SIGNATURE_SETTINGS','signature','acl_a_board'),(51,1,1,'acp_board','acp',3,33,34,'ACP_FEED_SETTINGS','feed','acl_a_board'),(52,1,1,'acp_board','acp',3,35,36,'ACP_REGISTER_SETTINGS','registration','acl_a_board'),(53,1,1,'acp_board','acp',4,47,48,'ACP_AUTH_SETTINGS','auth','acl_a_server'),(54,1,1,'acp_board','acp',4,49,50,'ACP_EMAIL_SETTINGS','email','acl_a_server'),(55,1,1,'acp_board','acp',5,55,56,'ACP_COOKIE_SETTINGS','cookie','acl_a_server'),(56,1,1,'acp_board','acp',5,57,58,'ACP_SERVER_SETTINGS','server','acl_a_server'),(57,1,1,'acp_board','acp',5,59,60,'ACP_SECURITY_SETTINGS','security','acl_a_server'),(58,1,1,'acp_board','acp',5,61,62,'ACP_LOAD_SETTINGS','load','acl_a_server'),(59,1,1,'acp_bots','acp',30,267,268,'ACP_BOTS','bots','acl_a_bots'),(60,1,1,'acp_captcha','acp',3,37,38,'ACP_VC_SETTINGS','visual','acl_a_board'),(61,1,0,'acp_captcha','acp',3,39,40,'ACP_VC_CAPTCHA_DISPLAY','img','acl_a_board'),(62,1,1,'acp_contact','acp',3,41,42,'ACP_CONTACT_SETTINGS','contact','acl_a_board'),(63,1,1,'acp_database','acp',27,253,254,'ACP_BACKUP','backup','acl_a_backup'),(64,1,1,'acp_database','acp',27,255,256,'ACP_RESTORE','restore','acl_a_backup'),(65,1,1,'acp_disallow','acp',15,171,172,'ACP_DISALLOW_USERNAMES','usernames','acl_a_names'),(66,1,1,'acp_email','acp',30,269,270,'ACP_MASS_EMAIL','email','acl_a_email && cfg_email_enable'),(67,1,1,'acp_extensions','acp',23,227,228,'ACP_EXTENSIONS','main','acl_a_extensions'),(68,1,1,'acp_forums','acp',7,71,72,'ACP_MANAGE_FORUMS','manage','acl_a_forum'),(69,1,1,'acp_groups','acp',14,155,156,'ACP_GROUPS_MANAGE','manage','acl_a_group'),(70,1,1,'acp_groups','acp',14,157,158,'ACP_GROUPS_POSITION','position','acl_a_group'),(71,1,1,'acp_help_phpbb','acp',5,63,64,'ACP_HELP_PHPBB','help_phpbb','acl_a_server'),(72,1,1,'acp_icons','acp',10,97,98,'ACP_ICONS','icons','acl_a_icons'),(73,1,1,'acp_icons','acp',10,99,100,'ACP_SMILIES','smilies','acl_a_icons'),(74,1,1,'acp_inactive','acp',13,119,120,'ACP_INACTIVE_USERS','list','acl_a_user'),(75,1,1,'acp_jabber','acp',4,51,52,'ACP_JABBER_SETTINGS','settings','acl_a_jabber'),(76,1,1,'acp_language','acp',24,237,238,'ACP_LANGUAGE_PACKS','lang_packs','acl_a_language'),(77,1,1,'acp_logs','acp',26,243,244,'ACP_ADMIN_LOGS','admin','acl_a_viewlogs'),(78,1,1,'acp_logs','acp',26,245,246,'ACP_MOD_LOGS','mod','acl_a_viewlogs'),(79,1,1,'acp_logs','acp',26,247,248,'ACP_USERS_LOGS','users','acl_a_viewlogs'),(80,1,1,'acp_logs','acp',26,249,250,'ACP_CRITICAL_LOGS','critical','acl_a_viewlogs'),(81,1,1,'acp_main','acp',1,2,3,'ACP_INDEX','main',''),(82,1,1,'acp_modules','acp',31,277,278,'ACP','acp','acl_a_modules'),(83,1,1,'acp_modules','acp',31,279,280,'UCP','ucp','acl_a_modules'),(84,1,1,'acp_modules','acp',31,281,282,'MCP','mcp','acl_a_modules'),(85,1,1,'acp_permission_roles','acp',19,201,202,'ACP_ADMIN_ROLES','admin_roles','acl_a_roles && acl_a_aauth'),(86,1,1,'acp_permission_roles','acp',19,203,204,'ACP_USER_ROLES','user_roles','acl_a_roles && acl_a_uauth'),(87,1,1,'acp_permission_roles','acp',19,205,206,'ACP_MOD_ROLES','mod_roles','acl_a_roles && acl_a_mauth'),(88,1,1,'acp_permission_roles','acp',19,207,208,'ACP_FORUM_ROLES','forum_roles','acl_a_roles && acl_a_fauth'),(89,1,1,'acp_permissions','acp',16,176,177,'ACP_PERMISSIONS','intro','acl_a_authusers || acl_a_authgroups || acl_a_viewauth'),(90,1,0,'acp_permissions','acp',20,211,212,'ACP_PERMISSION_TRACE','trace','acl_a_viewauth'),(91,1,1,'acp_permissions','acp',18,189,190,'ACP_FORUM_PERMISSIONS','setting_forum_local','acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),(92,1,1,'acp_permissions','acp',18,191,192,'ACP_FORUM_PERMISSIONS_COPY','setting_forum_copy','acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),(93,1,1,'acp_permissions','acp',18,193,194,'ACP_FORUM_MODERATORS','setting_mod_local','acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),(94,1,1,'acp_permissions','acp',17,179,180,'ACP_USERS_PERMISSIONS','setting_user_global','acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(95,1,1,'acp_permissions','acp',13,123,124,'ACP_USERS_PERMISSIONS','setting_user_global','acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(96,1,1,'acp_permissions','acp',18,195,196,'ACP_USERS_FORUM_PERMISSIONS','setting_user_local','acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),(97,1,1,'acp_permissions','acp',13,125,126,'ACP_USERS_FORUM_PERMISSIONS','setting_user_local','acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),(98,1,1,'acp_permissions','acp',17,181,182,'ACP_GROUPS_PERMISSIONS','setting_group_global','acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(99,1,1,'acp_permissions','acp',14,159,160,'ACP_GROUPS_PERMISSIONS','setting_group_global','acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(100,1,1,'acp_permissions','acp',18,197,198,'ACP_GROUPS_FORUM_PERMISSIONS','setting_group_local','acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),(101,1,1,'acp_permissions','acp',14,161,162,'ACP_GROUPS_FORUM_PERMISSIONS','setting_group_local','acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),(102,1,1,'acp_permissions','acp',17,183,184,'ACP_ADMINISTRATORS','setting_admin_global','acl_a_aauth && (acl_a_authusers || acl_a_authgroups)'),(103,1,1,'acp_permissions','acp',17,185,186,'ACP_GLOBAL_MODERATORS','setting_mod_global','acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),(104,1,1,'acp_permissions','acp',20,213,214,'ACP_VIEW_ADMIN_PERMISSIONS','view_admin_global','acl_a_viewauth'),(105,1,1,'acp_permissions','acp',20,215,216,'ACP_VIEW_USER_PERMISSIONS','view_user_global','acl_a_viewauth'),(106,1,1,'acp_permissions','acp',20,217,218,'ACP_VIEW_GLOBAL_MOD_PERMISSIONS','view_mod_global','acl_a_viewauth'),(107,1,1,'acp_permissions','acp',20,219,220,'ACP_VIEW_FORUM_MOD_PERMISSIONS','view_mod_local','acl_a_viewauth'),(108,1,1,'acp_permissions','acp',20,221,222,'ACP_VIEW_FORUM_PERMISSIONS','view_forum_local','acl_a_viewauth'),(109,1,1,'acp_php_info','acp',30,271,272,'ACP_PHP_INFO','info','acl_a_phpinfo'),(110,1,1,'acp_profile','acp',13,127,128,'ACP_CUSTOM_PROFILE_FIELDS','profile','acl_a_profile'),(111,1,1,'acp_prune','acp',7,73,74,'ACP_PRUNE_FORUMS','forums','acl_a_prune'),(112,1,1,'acp_prune','acp',13,129,130,'ACP_PRUNE_USERS','users','acl_a_userdel'),(113,1,1,'acp_ranks','acp',13,131,132,'ACP_MANAGE_RANKS','ranks','acl_a_ranks'),(114,1,1,'acp_reasons','acp',30,273,274,'ACP_MANAGE_REASONS','main','acl_a_reasons'),(115,1,1,'acp_search','acp',5,65,66,'ACP_SEARCH_SETTINGS','settings','acl_a_search'),(116,1,1,'acp_search','acp',27,257,258,'ACP_SEARCH_INDEX','index','acl_a_search'),(117,1,1,'acp_styles','acp',22,231,232,'ACP_STYLES','style','acl_a_styles'),(118,1,1,'acp_styles','acp',22,233,234,'ACP_STYLES_INSTALL','install','acl_a_styles'),(119,1,1,'acp_update','acp',29,263,264,'ACP_VERSION_CHECK','version_check','acl_a_board'),(120,1,1,'acp_users','acp',13,121,122,'ACP_MANAGE_USERS','overview','acl_a_user'),(121,1,0,'acp_users','acp',13,133,134,'ACP_USER_FEEDBACK','feedback','acl_a_user'),(122,1,0,'acp_users','acp',13,135,136,'ACP_USER_WARNINGS','warnings','acl_a_user'),(123,1,0,'acp_users','acp',13,137,138,'ACP_USER_PROFILE','profile','acl_a_user'),(124,1,0,'acp_users','acp',13,139,140,'ACP_USER_PREFS','prefs','acl_a_user'),(125,1,0,'acp_users','acp',13,141,142,'ACP_USER_AVATAR','avatar','acl_a_user'),(126,1,0,'acp_users','acp',13,143,144,'ACP_USER_RANK','rank','acl_a_user'),(127,1,0,'acp_users','acp',13,145,146,'ACP_USER_SIG','sig','acl_a_user'),(128,1,0,'acp_users','acp',13,147,148,'ACP_USER_GROUPS','groups','acl_a_user && acl_a_group'),(129,1,0,'acp_users','acp',13,149,150,'ACP_USER_PERM','perm','acl_a_user && acl_a_viewauth'),(130,1,0,'acp_users','acp',13,151,152,'ACP_USER_ATTACH','attach','acl_a_user'),(131,1,1,'acp_words','acp',10,101,102,'ACP_WORDS','words','acl_a_words'),(132,1,1,'acp_users','acp',2,5,6,'ACP_MANAGE_USERS','overview','acl_a_user'),(133,1,1,'acp_groups','acp',2,7,8,'ACP_GROUPS_MANAGE','manage','acl_a_group'),(134,1,1,'acp_forums','acp',2,9,10,'ACP_MANAGE_FORUMS','manage','acl_a_forum'),(135,1,1,'acp_logs','acp',2,11,12,'ACP_MOD_LOGS','mod','acl_a_viewlogs'),(136,1,1,'acp_bots','acp',2,13,14,'ACP_BOTS','bots','acl_a_bots'),(137,1,1,'acp_php_info','acp',2,15,16,'ACP_PHP_INFO','info','acl_a_phpinfo'),(138,1,1,'acp_permissions','acp',8,77,78,'ACP_FORUM_PERMISSIONS','setting_forum_local','acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),(139,1,1,'acp_permissions','acp',8,79,80,'ACP_FORUM_PERMISSIONS_COPY','setting_forum_copy','acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),(140,1,1,'acp_permissions','acp',8,81,82,'ACP_FORUM_MODERATORS','setting_mod_local','acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),(141,1,1,'acp_permissions','acp',8,83,84,'ACP_USERS_FORUM_PERMISSIONS','setting_user_local','acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),(142,1,1,'acp_permissions','acp',8,85,86,'ACP_GROUPS_FORUM_PERMISSIONS','setting_group_local','acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),(143,1,1,'','mcp',0,1,10,'MCP_MAIN','',''),(144,1,1,'','mcp',0,11,22,'MCP_QUEUE','',''),(145,1,1,'','mcp',0,23,36,'MCP_REPORTS','',''),(146,1,1,'','mcp',0,37,42,'MCP_NOTES','',''),(147,1,1,'','mcp',0,43,52,'MCP_WARN','',''),(148,1,1,'','mcp',0,53,60,'MCP_LOGS','',''),(149,1,1,'','mcp',0,61,68,'MCP_BAN','',''),(150,1,1,'mcp_ban','mcp',149,62,63,'MCP_BAN_USERNAMES','user','acl_m_ban'),(151,1,1,'mcp_ban','mcp',149,64,65,'MCP_BAN_IPS','ip','acl_m_ban'),(152,1,1,'mcp_ban','mcp',149,66,67,'MCP_BAN_EMAILS','email','acl_m_ban'),(153,1,1,'mcp_logs','mcp',148,54,55,'MCP_LOGS_FRONT','front','acl_m_ || aclf_m_'),(154,1,1,'mcp_logs','mcp',148,56,57,'MCP_LOGS_FORUM_VIEW','forum_logs','acl_m_,$id'),(155,1,1,'mcp_logs','mcp',148,58,59,'MCP_LOGS_TOPIC_VIEW','topic_logs','acl_m_,$id'),(156,1,1,'mcp_main','mcp',143,2,3,'MCP_MAIN_FRONT','front',''),(157,1,1,'mcp_main','mcp',143,4,5,'MCP_MAIN_FORUM_VIEW','forum_view','acl_m_,$id'),(158,1,1,'mcp_main','mcp',143,6,7,'MCP_MAIN_TOPIC_VIEW','topic_view','acl_m_,$id'),(159,1,1,'mcp_main','mcp',143,8,9,'MCP_MAIN_POST_DETAILS','post_details','acl_m_,$id || (!$id && aclf_m_)'),(160,1,1,'mcp_notes','mcp',146,38,39,'MCP_NOTES_FRONT','front',''),(161,1,1,'mcp_notes','mcp',146,40,41,'MCP_NOTES_USER','user_notes',''),(162,1,1,'mcp_pm_reports','mcp',145,30,31,'MCP_PM_REPORTS_OPEN','pm_reports','acl_m_pm_report'),(163,1,1,'mcp_pm_reports','mcp',145,32,33,'MCP_PM_REPORTS_CLOSED','pm_reports_closed','acl_m_pm_report'),(164,1,1,'mcp_pm_reports','mcp',145,34,35,'MCP_PM_REPORT_DETAILS','pm_report_details','acl_m_pm_report'),(165,1,1,'mcp_queue','mcp',144,12,13,'MCP_QUEUE_UNAPPROVED_TOPICS','unapproved_topics','aclf_m_approve'),(166,1,1,'mcp_queue','mcp',144,14,15,'MCP_QUEUE_UNAPPROVED_POSTS','unapproved_posts','aclf_m_approve'),(167,1,1,'mcp_queue','mcp',144,16,17,'MCP_QUEUE_DELETED_TOPICS','deleted_topics','aclf_m_approve'),(168,1,1,'mcp_queue','mcp',144,18,19,'MCP_QUEUE_DELETED_POSTS','deleted_posts','aclf_m_approve'),(169,1,1,'mcp_queue','mcp',144,20,21,'MCP_QUEUE_APPROVE_DETAILS','approve_details','acl_m_approve,$id || (!$id && aclf_m_approve)'),(170,1,1,'mcp_reports','mcp',145,24,25,'MCP_REPORTS_OPEN','reports','aclf_m_report'),(171,1,1,'mcp_reports','mcp',145,26,27,'MCP_REPORTS_CLOSED','reports_closed','aclf_m_report'),(172,1,1,'mcp_reports','mcp',145,28,29,'MCP_REPORT_DETAILS','report_details','acl_m_report,$id || (!$id && aclf_m_report)'),(173,1,1,'mcp_warn','mcp',147,44,45,'MCP_WARN_FRONT','front','aclf_m_warn'),(174,1,1,'mcp_warn','mcp',147,46,47,'MCP_WARN_LIST','list','aclf_m_warn'),(175,1,1,'mcp_warn','mcp',147,48,49,'MCP_WARN_USER','warn_user','aclf_m_warn'),(176,1,1,'mcp_warn','mcp',147,50,51,'MCP_WARN_POST','warn_post','acl_m_warn && acl_f_read,$id'),(177,1,1,'','ucp',0,1,14,'UCP_MAIN','',''),(178,1,1,'','ucp',0,15,28,'UCP_PROFILE','',''),(179,1,1,'','ucp',0,29,38,'UCP_PREFS','',''),(180,1,1,'ucp_pm','ucp',0,39,48,'UCP_PM','',''),(181,1,1,'','ucp',0,49,54,'UCP_USERGROUPS','',''),(182,1,1,'','ucp',0,55,60,'UCP_ZEBRA','',''),(183,1,1,'ucp_attachments','ucp',177,10,11,'UCP_MAIN_ATTACHMENTS','attachments','acl_u_attach'),(184,1,1,'ucp_auth_link','ucp',178,26,27,'UCP_AUTH_LINK_MANAGE','auth_link','authmethod_oauth'),(185,1,1,'ucp_groups','ucp',181,50,51,'UCP_USERGROUPS_MEMBER','membership',''),(186,1,1,'ucp_groups','ucp',181,52,53,'UCP_USERGROUPS_MANAGE','manage',''),(187,1,1,'ucp_main','ucp',177,2,3,'UCP_MAIN_FRONT','front',''),(188,1,1,'ucp_main','ucp',177,4,5,'UCP_MAIN_SUBSCRIBED','subscribed',''),(189,1,1,'ucp_main','ucp',177,6,7,'UCP_MAIN_BOOKMARKS','bookmarks','cfg_allow_bookmarks'),(190,1,1,'ucp_main','ucp',177,8,9,'UCP_MAIN_DRAFTS','drafts',''),(191,1,1,'ucp_notifications','ucp',179,36,37,'UCP_NOTIFICATION_OPTIONS','notification_options',''),(192,1,1,'ucp_notifications','ucp',177,12,13,'UCP_NOTIFICATION_LIST','notification_list','cfg_allow_board_notifications'),(193,1,0,'ucp_pm','ucp',180,40,41,'UCP_PM_VIEW','view','cfg_allow_privmsg'),(194,1,1,'ucp_pm','ucp',180,42,43,'UCP_PM_COMPOSE','compose','cfg_allow_privmsg'),(195,1,1,'ucp_pm','ucp',180,44,45,'UCP_PM_DRAFTS','drafts','cfg_allow_privmsg'),(196,1,1,'ucp_pm','ucp',180,46,47,'UCP_PM_OPTIONS','options','cfg_allow_privmsg'),(197,1,1,'ucp_prefs','ucp',179,30,31,'UCP_PREFS_PERSONAL','personal',''),(198,1,1,'ucp_prefs','ucp',179,32,33,'UCP_PREFS_POST','post',''),(199,1,1,'ucp_prefs','ucp',179,34,35,'UCP_PREFS_VIEW','view',''),(200,1,1,'ucp_profile','ucp',178,16,17,'UCP_PROFILE_PROFILE_INFO','profile_info','acl_u_chgprofileinfo'),(201,1,1,'ucp_profile','ucp',178,18,19,'UCP_PROFILE_SIGNATURE','signature','acl_u_sig'),(202,1,1,'ucp_profile','ucp',178,20,21,'UCP_PROFILE_AVATAR','avatar','cfg_allow_avatar'),(203,1,1,'ucp_profile','ucp',178,22,23,'UCP_PROFILE_REG_DETAILS','reg_details',''),(204,1,1,'ucp_profile','ucp',178,24,25,'UCP_PROFILE_AUTOLOGIN_KEYS','autologin_keys',''),(205,1,1,'ucp_zebra','ucp',182,56,57,'UCP_ZEBRA_FRIENDS','friends',''),(206,1,1,'ucp_zebra','ucp',182,58,59,'UCP_ZEBRA_FOES','foes',''),(207,1,1,'\\phpbb\\viglink\\acp\\viglink_module','acp',3,43,44,'ACP_VIGLINK_SETTINGS','settings','ext_phpbb/viglink && acl_a_board');
/*!40000 ALTER TABLE `phpbb_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_notification_types`
--

DROP TABLE IF EXISTS `phpbb_notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_notification_types` (
  `notification_type_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notification_type_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`notification_type_id`),
  UNIQUE KEY `type` (`notification_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_notification_types`
--

LOCK TABLES `phpbb_notification_types` WRITE;
/*!40000 ALTER TABLE `phpbb_notification_types` DISABLE KEYS */;
INSERT INTO `phpbb_notification_types` VALUES (1,'notification.type.topic',1),(2,'notification.type.approve_topic',1),(3,'notification.type.quote',1),(4,'notification.type.bookmark',1),(5,'notification.type.post',1),(6,'notification.type.approve_post',1),(7,'notification.type.group_request',1);
/*!40000 ALTER TABLE `phpbb_notification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_notifications`
--

DROP TABLE IF EXISTS `phpbb_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_notifications` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item_parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notification_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notification_time` int(11) unsigned NOT NULL DEFAULT '1',
  `notification_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `item_ident` (`notification_type_id`,`item_id`),
  KEY `user` (`user_id`,`notification_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_notifications`
--

LOCK TABLES `phpbb_notifications` WRITE;
/*!40000 ALTER TABLE `phpbb_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_oauth_accounts`
--

DROP TABLE IF EXISTS `phpbb_oauth_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_oauth_accounts` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_provider_id` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_oauth_accounts`
--

LOCK TABLES `phpbb_oauth_accounts` WRITE;
/*!40000 ALTER TABLE `phpbb_oauth_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_oauth_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_oauth_states`
--

DROP TABLE IF EXISTS `phpbb_oauth_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_oauth_states` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_state` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `user_id` (`user_id`),
  KEY `provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_oauth_states`
--

LOCK TABLES `phpbb_oauth_states` WRITE;
/*!40000 ALTER TABLE `phpbb_oauth_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_oauth_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_oauth_tokens`
--

DROP TABLE IF EXISTS `phpbb_oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_oauth_tokens` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_token` mediumtext COLLATE utf8_bin NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_oauth_tokens`
--

LOCK TABLES `phpbb_oauth_tokens` WRITE;
/*!40000 ALTER TABLE `phpbb_oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_poll_options`
--

DROP TABLE IF EXISTS `phpbb_poll_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_option_text` text COLLATE utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_poll_options`
--

LOCK TABLES `phpbb_poll_options` WRITE;
/*!40000 ALTER TABLE `phpbb_poll_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_poll_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_poll_votes`
--

DROP TABLE IF EXISTS `phpbb_poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_poll_votes` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_poll_votes`
--

LOCK TABLES `phpbb_poll_votes` WRITE;
/*!40000 ALTER TABLE `phpbb_poll_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_poll_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_posts`
--

DROP TABLE IF EXISTS `phpbb_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_posts` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `post_checksum` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_postcount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_edit_user` int(10) unsigned NOT NULL DEFAULT '0',
  `post_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `post_visibility` tinyint(3) NOT NULL DEFAULT '0',
  `post_delete_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_delete_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_delete_user` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `tid_post_time` (`topic_id`,`post_time`),
  KEY `post_username` (`post_username`),
  KEY `post_visibility` (`post_visibility`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_posts`
--

LOCK TABLES `phpbb_posts` WRITE;
/*!40000 ALTER TABLE `phpbb_posts` DISABLE KEYS */;
INSERT INTO `phpbb_posts` VALUES (1,1,2,2,0,'172.16.12.243',1490128344,0,1,1,1,1,'','Welcome to phpBB3','This is an example post in your phpBB3 installation. Everything seems to be working. You may delete this post if you like and continue to set up your board. During the installation process your first category and your first forum are assigned an appropriate set of permissions for the predefined usergroups administrators, bots, global moderators, guests, registered users and registered COPPA users. If you also choose to delete your first category and your first forum, do not forget to assign permissions for all these usergroups for all new categories and forums you create. It is recommended to rename your first category and your first forum and copy permissions from these while creating new categories and forums. Have fun!','5dd683b17f641daf84c040bfefc58ce9',0,'','',1,0,'',0,0,0,1,0,'',0),(2,2,2,2,0,'127.0.0.1',1506041531,0,1,1,1,1,'','UBVnwkDiqe1JvUk9TaWh','<t>fITXvbDsjf4qlD59sGMBAr3f7MzSPnBB9d4Seqkm0C6iNVhP4J4lStsqbAAztb5qz0cTDMbX1oreYV7f0SiKQrRolmmDtK9CkZupKlV1WukOA4ue3d8N3bjZ5xL1NsrD4xDFdVzZ6NCChJ9bA2mTkEf8yVfXGkxnDTnH9n7FLNEW85IHOOERo2Cewcege2e42ooy3eRr</t>','515320ed118953d7b230d868dfdf3547',0,'','35b5o7hp',1,0,'',0,0,0,1,0,'',0),(3,3,2,2,0,'127.0.0.1',1506041532,0,1,1,1,1,'','gy10rWgcQ7rzhQcy2Xu6','<t>ld7HPN0VqL10GXW6DBXUK7AL6KfyS4mBpSttz4aC3i09OwQTFqFcQKGx05qCH56vgzL5BwYFpXseucSzPWVkyOnwlBU18oVVA4SwYj2vqPPpGJQCHB5Z6rH2pikMkI6ZGZczO73F7v3ZYVSuyuXYrnDQS8fu2LI76zpQVGdIR48tcmneQ5hWPuBtnBrPcsr6qQ0IHrBz</t>','8bae8178e2eb562aaf6b5cbc0d4b352c',0,'','3s7katcd',1,0,'',0,0,0,1,0,'',0),(4,4,2,2,0,'127.0.0.1',1506041532,0,1,1,1,1,'','RM4L6lG38n72SPV4ahVy','<t>n3ZgpKBxene2RLjCYdNsog3al2tgv238OFifYDiwtiBsaEi2LBTuKzmWHAhPfLOoE8oK1nNandVHH3RW56i38DC6hSu7f8O3drzJNalz4VjRn3tNg4Tspt0h0ycOwS2RqZ3RTAaVXoMZIhHAtP3V6MLkTUbrGy61ElaoMjzyxrnoDtFqFxnrX73oZ2ycDFHitGPvyjku</t>','e3b9f5d77a24c0e26b5e7caa9f2f6fe8',0,'','2mgkdbbt',1,0,'',0,0,0,1,0,'',0),(5,5,2,2,0,'127.0.0.1',1506041533,0,1,1,1,1,'','Fnl1bmCSQsdfdJlgcMA9','<t>BUNyAefU29ILM6947EkGfjI8zoUrTJmEcgLUM5ll8xnxq0XYcsHwyVgNYOzDo9soIJlTSM1jjDNHTgIZgIQAeg14fEx3g3CSwDT0IXtXrjK6vgDCuQzD5KkGMfyaaU7amjiso4w0zJLd21DVYSVE9Xv93b2X2DtWBlW8lU7njwIrY5SU7KYgfyIkx9hK25PmxukJLzBZ</t>','dc174136fda40cfc40a8424e044c686e',0,'','5bi2aehj',1,0,'',0,0,0,1,0,'',0),(6,6,2,2,0,'127.0.0.1',1506041534,0,1,1,1,1,'','BVkXGaLpWeueDsgRKgjm','<t>4ILHggdYn8ovzsbvH9hqRAUZ3rpICIx0wGKnmVaCylU4QQxuVziuDrpNerjX5GZ5JHlpt1grOoDdq1dZMc2JRT9oQbpZCB0n8VCzckXq3TlW5s8QndbUsbXHJ8kMPLL35wvwJeuB91KKZoMPdXybCkKRaGwOzIXpGutJC9PEltNecpixou9ODTmnHpl0WVM2koUCbqmm</t>','c3fd6efab7244cf69b76178e864a25bb',0,'','dwgswptd',1,0,'',0,0,0,1,0,'',0),(7,7,2,2,0,'127.0.0.1',1506041535,0,1,1,1,1,'','HAcQvWF9rCLLxTse9YSh','<t>dDBfW3fJpEeiOWJmgSi4zyew147L5GN2mgptd3Xk4AeqJmJH6q1lXrUCHbpHqeVoR55Aqu23GvyovPKFFBxCzlnGGdCjVFMWBtSVCPed6mMjYB7m30Z6uJ4nPakPnALtBekjlApAlEHFbU8HTQ1Hr8ZdZVnKbVVmNm7JsH8Pgf9mBtm0GXG5vanrzUETOJX4ZSiXptss</t>','ae27d1331b64d68192ab87d8eb5c4786',0,'','3dopgo9e',1,0,'',0,0,0,1,0,'',0),(8,8,2,2,0,'127.0.0.1',1506041536,0,1,1,1,1,'','t6QYloTePk57FMkhDmyz','<t>sWbD5BnplMQ4GSVLN6EM66jzn1apWZoSybW0M9AeLPZBkqTFmRWe4sirl6FBj8Ls5HedHK1IwK4qaBVKC6nziZ9ZYyOFYqoxPAWtDR1OzLmgpCuFrBj6oqddvVma4atQ7BVqo0XWRJbGBCWYZvZ2LDSiZYgooATjAq3FQpoJiGIRDMMXk8knZiQPeOOeScMTBMVBpJ2t</t>','5e986183fdcef7831cc3edb012868bad',0,'','1kwyi7if',1,0,'',0,0,0,1,0,'',0),(9,9,2,2,0,'127.0.0.1',1506041536,0,1,1,1,1,'','Ju6g578qzPHvBxrGvK0b','<t>qzPlpLwxJ1IbzjCQnLV0lYZDxoee8D0vXiY5vEgRK122UwQ8zpdL0htxupjh1WXP8u73M5R02Waqn8Aj69Au7gvSzbX1PFROHSosbkSOSf76LcYvH18xrTebYjqp2rh9x0hBj8rwkly96xJSGBVZmlDif1zRZAErAvsQXBIBApvEndku2itNaKpkatKNS8sjfyUYf86M</t>','2fa2b447265528cc96530381ebc77223',0,'','iv6n3qe6',1,0,'',0,0,0,1,0,'',0),(10,10,2,2,0,'127.0.0.1',1506041537,0,1,1,1,1,'','Ad4VqYtsi8i3gSUREE1W','<t>yeo2YHPqII9A60greoQzqWCg6dEcmcIXvJoBlJZCOHFkFgrqnl2HQf2lBAnDTy1c4WpNDkY8iGMWKTL1ZAQF433KGDclBdDWXtH5QvfHrOERL7yS9Z2mAy3vtq2x2E6jNTa2zKzCMKyZBamihqkwhVvuhtkxgQbupwEWV6FL40Zcz71VsCMlai4scZuimvxOm5L7E6xK</t>','ab621d00097e74beb69dbd602f0e6c2e',0,'','1bgbwbhz',1,0,'',0,0,0,1,0,'',0),(11,11,2,2,0,'127.0.0.1',1506041538,0,1,1,1,1,'','GPNRFWyQA6BgGwxHocX5','<t>WX6yBJ2xQExPpaBpZBkGBn2mlcpqauBroMcqlmvqyP8NPpbbYBde3Ja7JCNX4IRPw9XQrOq4zY89Coe3zTeOoOCZogWBlICiZC0C68zkz0kuUtCE9Xe5cZ4csCCEx6Ojg15nmjD59nxNMMhYu5OCX1chaDUxfDaSRe57XRAVL7mkt44BPCOX7RthVkAEbJIQwLCUiVIp</t>','7f2e367c16845e622f16a64d2b1007ab',0,'','3iqiefes',1,0,'',0,0,0,1,0,'',0),(12,12,2,2,0,'127.0.0.1',1506041539,0,1,1,1,1,'','bCxP7fbmDAFw6OmrZe9Y','<t>8NLfCe82maDi1DlEOkEIWgx95oowwIR6bfG63EzOLdrROJElItXpP6BcKJOiZodrfmB2rxTWlg073fQr3a3PTH8Jvva97voV0ysEVjy2SgNj36MsTnWmZu3GnLhZQ7uBLFgfbRTBAoyUjSmyYJaR4GjYjFWaEXuKvXmAM4mW8e7vK8xttEe8CTojtOShiPftfBlFBmzg</t>','21488638c9d77a2d07d0947fb9f641f6',0,'','iz9o3ntb',1,0,'',0,0,0,1,0,'',0),(13,13,2,2,0,'127.0.0.1',1506041540,0,1,1,1,1,'','aO8Ge46IXIHaddvHsaEq','<t>a5GeNEv7j66uyDO6vwM1DBWGXfDAOUlAvLCDd04O5BwaSUWTxzo0jSck8gZusPxtvgHHzNSAfmRPX0BF9akMLYJREhhn5PeA6BuCyq8QhEKmWWR5d4q6YRuSxDAj5DSszo61L1HZuVcqaGOaORyUh06d2EpLZ0dqB6zGCJHCdtiFqGvcBQz7y7UxENYiqeNkWs2OK6s5</t>','1d08e8b29fc0158c543c3e52edbce9bc',0,'','2xone1gw',1,0,'',0,0,0,1,0,'',0),(14,14,2,2,0,'127.0.0.1',1506041541,0,1,1,1,1,'','E0HWbVZF404XA3reGbKn','<t>NFjPVhNxw1vpaDYM5Wp68GRxFfeDvd75oaylvCf8CRhOyrcUULgLKOjatsWTatbCtoy1cRwQnaC3NgsuDCMVulqyrmbRSFSmrbt0Be49S2h4gJynS2H2r0lXsWHU78cS0he9MZhg0HeYu5IsW3NLnarYSBFFWA1w2el9AWCBQRWE35PeRGy2JaSeWwX8hOvOs3q0RFeC</t>','461b2c5068b16eebc872d0632dea19a9',0,'','332aqs76',1,0,'',0,0,0,1,0,'',0),(15,15,2,2,0,'127.0.0.1',1506041541,0,1,1,1,1,'','VSSDEyPemSn3qGNDDsxA','<t>ODRfUPSP6qtPTtOWmoPLTzSNlDR6YOKKCh4FkzSlaHRgcwBXRsU8wO7lzwbWWQssfqi0zZ93nRYYbGq41cGKVIOCfkAPTE11D6wC8JYPbYJxXNSjTK29UswStMwTPrNmoBGn1WpeHEkXrkFick6n8rj2WYQD9ntID5CYoThRhiitrDNENPYfjLae3cjlrTeQoJl2FpQs</t>','b416089f8cb000bb5a7bc5345224017c',0,'','zcpbbekf',1,0,'',0,0,0,1,0,'',0),(16,16,2,2,0,'127.0.0.1',1506041542,0,1,1,1,1,'','HiDhB3cpgBqTnPK6axMb','<t>AHvH7GCCyJId8Z2xrFjWQ70TGv7kFaM6b6uPT8LagYWmHTAbRGqSLl50jefPD7o51TeMi9YoASNmQDamTmuGOw7HPe8AYGMqS1ZGw2VRGxnMbohgkWLBYd2S8wbwOb96ILc39h0rKaoqFYlvhBhyG5SBbCGZpQXwIrKGoolQkBYkud1DdcLcy9yFuH1pktqAHznvo0iJ</t>','a74b961550529b0c8136c21c0afd69b3',0,'','4193o2jj',1,0,'',0,0,0,1,0,'',0),(17,17,2,2,0,'127.0.0.1',1506041543,0,1,1,1,1,'','vFjMtQA7Be7TXJyUAiVB','<t>5isXMtR5lx1uZfH1hx8RLrqh1N2peWhuJnIEuJXlsd5asMtVeoKD51rb2lobe8IGhhdUT2Wgl7Tut9komUsSBFWdplyjSbhyCEEx5PnwlEjkGldcUk6wdO2rI5vt408NK6xPz6jEfjMLdhhuycbgqtP6OXI4rJ1fyI7S2zBKyfSMtPokpysrq9RcqwdmKqa6URqMePzw</t>','19715ae45fe5cfb5581b08c345f4f78b',0,'','8j5c1gbf',1,0,'',0,0,0,1,0,'',0),(18,18,2,2,0,'127.0.0.1',1506041544,0,1,1,1,1,'','pRWZm0CxAW3RsmmdhFZu','<t>KpG0zREkY6e70d7onKWTdbESkx3PUlx8lhL2dcyyX4rJBI4TTnzHDyoMSDkwhtV0cSc4IIydTVTE9Z0RtwMTxnvygsbabRZUAdna1WnK6W2tdSLp80SX1iMxVIHIPgLwu0wyA2mn4YLYJbtorykI1oV29SzSEESIka5Zjm25YqldHfTBPvmpjywMaYouqleiLrnnYHqL</t>','ab64e96d19f7330d351c643b29f5dec0',0,'','22t87d3j',1,0,'',0,0,0,1,0,'',0),(19,19,2,2,0,'127.0.0.1',1506041545,0,1,1,1,1,'','8hBtwWqzSr64otGwAPd4','<t>uktlyeExxJskpoK6mAcdJPDm8Ns250l10fU9xDL64fl89UBHtz4wdlSOUjJdlQcS16D7lY5O8ueDMXUzvTn0nCMP6oeWlA9CvAoFH4wO5W6Dlt8hVlO8Woxej4sekSLLI5GjREaeyADE5VfPsagp6KBWACcE0Q07lGhjFovebZEpGpH3AxdYgwP8GxKDPPTEH3VgZSPy</t>','b7ff851ef97b4f28eb4ddd8b6a993517',0,'','25fyhzkp',1,0,'',0,0,0,1,0,'',0),(20,20,2,2,0,'127.0.0.1',1506041546,0,1,1,1,1,'','v0yOgnVovC7zHFTkS57A','<t>mfDeajFQHFfypUMPZzwEoqaYnJVDgXIbHRAZJmOL8f3UlH4aSOEZP2BX3T1C02uqkpUxbX6iEHFYKbi6bPVpk43Vb0RELxuTmxdj4tiw2vciK1Sxu13RgT8Mx7Aw6YNirHes2cRs9qmJXcDOLavkXqLfdqfiwImCzEVguzXBCK15vvvHdvHWFuHcBOGEiBXY9CuS0AqT</t>','796bed4e4f1a4a295b27bd610642348f',0,'','2wugk3d7',1,0,'',0,0,0,1,0,'',0),(21,21,2,2,0,'127.0.0.1',1506041546,0,1,1,1,1,'','PFjSgG1ZTYqW5mqYKvbh','<t>dKkcNd3KQOqtoQWCLLc7PXUnC8z8eVwH390tUZDEldAehKFO45k9PyDRmSzdb7ZWs6QMyEsKPHHunMhCt7FDtg6v48la041bLiqJkHF872xiDzyP8VsKxkVNa8ff8Tz6pdzfPTSQwFuaEmKGrv6MFmwTvHX5F57zrRV89kxaGHGSs34xcd00TiaO0aGoUkJyA155MDpE</t>','57cd615295ffd66f907def987ca27d3e',0,'','kjry28ae',1,0,'',0,0,0,1,0,'',0),(22,22,2,2,0,'127.0.0.1',1506041547,0,1,1,1,1,'','LBwrijB8QmvnQS1orZEV','<t>EcB5wv1gubWKa6eb0BJQan02LAjviuY7uEfRM8P9bQAVRTtvfkACeW4ldmx6ms19lbxm1ZmJx2ZkLBuKjT5yaqvAtF57ktMU1wDgN7K2TQipvLsb8WUrGAnDXDmn5lABwoMTH0jw210z4Ts75qxPJ5jddQNkopxe08Mq9dwbbU3KuDgkbCIHcPdV8GRNyH2wCK1nrV2p</t>','2623b09fce06fcb3f76d744f35b78350',0,'','28lh0tg5',1,0,'',0,0,0,1,0,'',0),(23,23,2,2,0,'127.0.0.1',1506041548,0,1,1,1,1,'','xcrS7ASeCGkc4Mt9QwGi','<t>kPOkr0T2mE7Plz7awrjE6GCAmhSWEI4e9zQDxUEt2cz6O1qpF0d0Wy4WduvPqK4DwUug7DGz0wB2r52MBpDYDmjr5ErcePS5wBNHhcJPMN3yUPUspJg9vL6sb3uH3pcJygzTdyENe9FkonfZdScZIq9AzBihPS3v9LK0fXZXAdgBlvqQF8vOy9xzu2YTBNnINYRpOxck</t>','c078fe31387e315973be605dda30a41f',0,'','360xse42',1,0,'',0,0,0,1,0,'',0),(24,24,2,2,0,'127.0.0.1',1506041549,0,1,1,1,1,'','0scN4uSXBExSoMFu8oQ3','<t>dUYgquP6KGTgFQF0rXwbV0SWOGPlrkRi36Q9NQqhwZ2NO6f8qsZHcXRNtGCkwZGOkzNcGapn0jFjwvqdBHHgjilJMqchml6PkWET2x9J7HTJWe1ZbUBmML6d1Vuqtq41CaytpSfflKYVbJA79M6JUKWcq0ui9nKUig8hsyAs5WPwk1Yi3CsgxLAZDLuubKjpFYeR9e5g</t>','8bf1b76c8bdbd7dcd465ce0527ebed04',0,'','whmvdw0k',1,0,'',0,0,0,1,0,'',0),(25,25,2,2,0,'127.0.0.1',1506041550,0,1,1,1,1,'','HzyfBwzcy7TNzBaMU3jI','<t>Z99V0UD4pJ0g3a13AGcW2oraN0ghKzPutAlplMQ4ENFdOjtNtYqUN21st7Ci4zideM6q9OiKj4HwgYhtCTMewlPFNrPgJR0t9W2JPJa5X9YxXU99rNszaB0R9a9BQYvYrdyzlvZ8t6E6YiMRzpvrADhp7xhdo6UrjbAPrcPd5NYgaiTQYscKTfLw2TOCqdAS2FIwZJ5O</t>','d67bba776c9d5204a86f2259f8337394',0,'','1rcz1s6g',1,0,'',0,0,0,1,0,'',0),(26,26,2,2,0,'127.0.0.1',1506041550,0,1,1,1,1,'','J9gILOopbomUktHcjcTJ','<t>Ur0wfskAUy1Uc7l7lP0aRYreW7ct9ySeYUcjlG5wtzg4GcRbE1nRj9UgpbA2UGpiVdYBT25ZclHMrizd7UV31YiLIS70EKq4VevySsHhphMWc1jGcN2CjldAAoAE8VUXwsGEQXrKFyZK18ZJQuTmUiSeRoCKgIsiTT2eCQz4pfDSnF2Pz7qduIDyiw5Echl6SsrByfR7</t>','949801111714c6fd186009c7c2cd18c5',0,'','6ppninqg',1,0,'',0,0,0,1,0,'',0),(27,27,2,2,0,'127.0.0.1',1506041551,0,1,1,1,1,'','2pqffzcysWHvqj1HZI6q','<t>9KTZVtW8pwhZKHriCJHeTsD8kCenmn14Z1QhAvOKbiupt7FpLjddfN3X315rNtxReOrbpKdiH87MG2vXkllyzSo0sR5RgriV04A7yPqUiHzKf7xcDMfvNtRQ6HauYjEgIZO7axMgWO8CJtV7c9CNQTD6ReRBg8kVLigZJ3zsvJtmuzj5DHCnPHevmTU4oegPE8sDJAJU</t>','1b5715c2342e63fcb6ef9481b5590682',0,'','2qggmx5d',1,0,'',0,0,0,1,0,'',0),(28,28,2,2,0,'127.0.0.1',1506041552,0,1,1,1,1,'','f00zj6P3doqr4049d7RT','<t>7R5PlIIJjpxMoFvsEnrbbrSouITAirahCWn7NGdGB3vd0Tg4SuvJJTQ8oZAfyIEwZQYsjoz3Y2V3JJs6f48D8u2ZclHHVbkcf51Gf4wfXRv8cn9Fks5dQhTjgRtoXUnah79YNqRCLshpvsvEVU23pgLuCF39I29GwtWvT7tM8xmV3EhgKHeuctenFIgJ1F66m0ljYdLI</t>','578fda1137fdb024c32c801690650ab2',0,'','qn8gqz09',1,0,'',0,0,0,1,0,'',0),(29,29,2,2,0,'127.0.0.1',1506041553,0,1,1,1,1,'','fe5YSo4bAkVC5echt3vd','<t>gCY3xuPDuFOP0RUBXBSY8KN0UhrUeHCJuirxskV8ZkgfomEkj9H9Mhs1aKYGUVju3hijXOPEcYQCE95o41TfPvkCIAKZNT72OqPWjXWhzVOveib2hKvYcQrcoEJiODiIAjilmJEJuhqvpiXQbwpqo7JJ4xUPUtuXKtahlqOPhkdUPnogGNIL9YWdBTjy4Yy9qi8z8AZg</t>','c9b37a35184855dc2f14f9cefd4032ae',0,'','2lzv8kqk',1,0,'',0,0,0,1,0,'',0),(30,30,2,2,0,'127.0.0.1',1506041554,0,1,1,1,1,'','F7aB99YlOV1jP1aL8Xlg','<t>eiWRZoMSpCuzoq3BqjENLfH0Lcr3tVEqjYkt2jvSntMl6SZayb6N8xw86ETFL9furjLWc3oZWw35xaVam7bHzD57xgsoN7n34r4jFipaqnTZHRPS92LaWrBrrX9KmVMtMjZQ3fLuTHNpFBtTHGISrvehze6HgUc3GH1uRQku9za72na8Nu1r4nO5m3FU5aVmez8CD9po</t>','3a362b2fc98f2036e3420298abe19392',0,'','1alraf8q',1,0,'',0,0,0,1,0,'',0),(31,31,2,2,0,'127.0.0.1',1506041555,0,1,1,1,1,'','lPMQiSK5K0O9sPEJlDJY','<t>lAlg43Wb0MtFnAobbH3wqrElbjxJkzEvvdJY4nLYpwfrXO4zf8naVx5FT3acGDZvwF3e2Vqa1IxcBR5Sz3ZkJ3YK2FvOTFtSHJaStU8r8KSckj3ISjC5vv75GbjqOMQr05BURAh3OLu4Q9GwG2t1hBenkfbrEyDXukZuSt6u8fjgWOWjGKmSHizqSCs1d4QNsmHa0bge</t>','2bd367d7d791a1f5ca86c766a8e034fe',0,'','1mst122k',1,0,'',0,0,0,1,0,'',0),(32,32,2,2,0,'127.0.0.1',1506041555,0,1,1,1,1,'','6g0Y5XxkGcJkH1D9Mkw6','<t>dFy9xrOLem21Dd49T5sZ6DQawWcpTsEGHucdLGVNw3IiyMVqKI7wJgA6y8iklgmR101egtPNMXtklkE40IQzGhasl66crcwypIr0tHQGFlODYiJMlDJe8K5swPKFHGDtrk081Z82mUsdrU5wazZDu3kOHh37Lm4VmPUs9XdfxEZTrGF7DN40Oz1RGt3btg3AAw8go1ZS</t>','386ae33d388ae04320889e270855c982',0,'','26htr6ti',1,0,'',0,0,0,1,0,'',0),(33,33,2,2,0,'127.0.0.1',1506041556,0,1,1,1,1,'','0JHYwzVr1gbKKwvgXPiN','<t>G3X3sUwkCKJmt2OdKpb5Kr28DQySR4A9ZkI7oFioYle8oU1H55gmACXAzjLUa7F7CEUA5G8trvc3Ugtnlj6dgUvehb76fugyo1amIoZDxyMz1WZnbagjU6LyHmrg1GdZ2ZoDSJQBSuUg4JJ1ji73KkB2alcDAijp10Ab6NMrsi1CNiXapLRqLPYIDO5AzqMEHi78D4gM</t>','4477c83f183b5d4d99d7195405a5b3f6',0,'','3t8zvtpz',1,0,'',0,0,0,1,0,'',0),(34,34,2,2,0,'127.0.0.1',1506041557,0,1,1,1,1,'','82VDYkYET0sub6qwlmw3','<t>ilvBJjjQXJd7eTUULZw2eMVopPDwHOGQWqQgStQxOu62b9wJt33hbRhART4JiMwiBE2xZkYvG6VDZvBCAkSbrfW4QFGi9Kpsj7UCyblc5mWKSkdregpxqfDIDLV2KgJlEpZEy4ZXRFKNazv5LPTEBhQc6ZMG5b8zZorxOymVJJE1GxMHYkGBATTTpaXNgH0MiAxSV0jV</t>','c8c9139f08450dd3234cd95071bdc730',0,'','t084v1ew',1,0,'',0,0,0,1,0,'',0),(35,35,2,2,0,'127.0.0.1',1506041558,0,1,1,1,1,'','qkUDrkcr8fHsc7HYxrur','<t>5wtb5otil6nB3NujhHdA64PaCTge0Kp5OAH3c6s8V8n2BLfVdBeTPCPvcDjAmXNfPW4lMeFEQKyPeu0aIV9CmvF1RIDGQvHtSh6Rdu5xW9KwBZIECGRxM62E5t1bpWZqcRxG6LbcDKC9hRiSeQhqFdxPtDV9jnNy3WTNEVFXlffr23BUXXsSos9xdO0jw37IqT2SmJDx</t>','932e551cc68a3c75a2c72372d919c537',0,'','3optx5mr',1,0,'',0,0,0,1,0,'',0),(36,36,2,2,0,'127.0.0.1',1506041559,0,1,1,1,1,'','rdtixhVurXOL7Mx1kVun','<t>KmeV2GklSV3f72e4WlBc534geeUZLUPA0Meqq2nO3fiFiYR5kXOhSdHCIpR4krhwrFKxPTGxdmiMVUaMNvaKFw7dipAWqTd4Rv1gPc1HOSGMG4BXrhUoO2z4k0pzMzu7H5IdxbhqCe9DWvzY5loXRPDT2qgkULFtkKhNghoJJVSAkEwvK3VEnhcAPjAyUaIatyUzbbGB</t>','b9cc3aec6c93415382d37493e55ebe54',0,'','5dlv8hec',1,0,'',0,0,0,1,0,'',0),(37,37,2,2,0,'127.0.0.1',1506041560,0,1,1,1,1,'','G6Z6sMKiCYdMob1DZKMh','<t>ligxHk4Z18aaWSoai4xtSSmtw9uNXXqDyDVoQeMch0C9rkSCwA28Dg2zo2yFxOKbk4KPNr0ElLlvfnIXUildUPmjRXJeDyP5YFhCwBKGn5wH6wyLoMSfWhUePYLiI4SrQQH35Dw9dY5mWIH8mdNKqPzYQcEvMxHbCWhciGYljzwDwQZRJNPUT9jDz97QAQgg8iyKDp86</t>','515e285dec8e921918afd813c3297663',0,'','2x8k4txu',1,0,'',0,0,0,1,0,'',0),(38,38,2,2,0,'127.0.0.1',1506041560,0,1,1,1,1,'','0duWCEM1tAShAze91SH1','<t>UxjFW1uvd6jQ5qAYG6o8JVlCxNB0sfKjfdYqHE9KpRxIQUCxqjqbSDFFPlkI1ab5VIHR2hENclnCgQEerd3OBFpmSF5bEOvp7ejjemdjFXicg9CjvPkm8JBRtMDZzKZ3z79VSI4ATjOkylDVzxDfIqWnM2AkwPbEPHCUO9naDrZzuXBUNNha2Xivd1EhouCHeTjdD5MX</t>','749d866247bbd28efa84def4231c53cc',0,'','15095pb7',1,0,'',0,0,0,1,0,'',0),(39,39,2,2,0,'127.0.0.1',1506041561,0,1,1,1,1,'','lF5PpI7XAHnhBUyu5KJB','<t>NoF8k34wMi6fPK16E5e8ngtFutQcSDpWmImKLGIBpc34u2UGbqhUsgwdOc8eXjGcvBA0ExSeg0HV3IQOv6P2pec2zPNXKTODD2eP1joeqiytC3yOsbAcmjee89iwbWFKGG1HwIyXjpCYqJxu9Re1XRtMZ1iAD7M03kNHjGmJJ9yITLTN4iVFHFMVunvCVXItIcFZomvX</t>','4e66b14847c096fc0bb120b72d67f39e',0,'','tch85t5f',1,0,'',0,0,0,1,0,'',0),(40,40,2,2,0,'127.0.0.1',1506041562,0,1,1,1,1,'','YlHGO8HOzUekAmx36Fg3','<t>wcLtNwMs57wJP5exGAmAOrsU8KzL3jCz83BSTOXdnk14eGAo0dG8aFMqWFHLfVnnb98qQC98JsaQd9Z9OFFmSMtaX7jHMOqwuiE3BycPBMsfbCglL5dVSIZ9wc5vGuGrEsY7TSqLZDRVzuH4nSiAZwaixctfveYE2BtIK0Tisc1L8DzX2ucMxaUpmOD70mEpDteSVNs1</t>','3e00d634d89b2e0c786f9333a6dcd6af',0,'','1e5to71h',1,0,'',0,0,0,1,0,'',0),(41,41,2,2,0,'127.0.0.1',1506041563,0,1,1,1,1,'','WHnMCXnjn4Qnip9gWg58','<t>acet8KuTlJ5V44JZRdW1sEtI53RtL32IT9nDpQhEyO2OoYD5ZMsWVELOjRIwsjsdTAxCFl2kkamlSjxdoKhzBtrYDWIvB04y2HFCiEmLQUwxdPwPlTvIOTD7PWylhCLIZ6bPNK9Q7Pj4VvvAiZqaZZMMvbVqlFhXSDHGMVqX9zO2KWZGnuTycfUrOsDRyBGBj8P9xqn2</t>','6b68be1d629127ba1fc5bba8d054cf6b',0,'','24pnlo79',1,0,'',0,0,0,1,0,'',0),(42,42,2,2,0,'127.0.0.1',1506041564,0,1,1,1,1,'','IHoqsliqggs9QJiQUiQ9','<t>bwGJKzkrhqV62rkadIyUG5hhxash8Qw4t6hsIPpZRvEyxWgPbWL7BL6IYbO9u97VRMOEcVIo9CAlRYf3i1hVkHg3X3MRF8RUl0Na77U75F8x9qKZvLxfBKXbUZJKrbeX0rCtOZe7z1esdmHZfJaofXIBbzE6SCdHS48qP6mzzhpLfoYxMPKVlRwXOhbEH4kcWz2vHPB2</t>','67161d109e6068436c8141a993754b0f',0,'','fhepsefp',1,0,'',0,0,0,1,0,'',0),(43,43,2,2,0,'127.0.0.1',1506041564,0,1,1,1,1,'','FWxrvs86JftA73YA9BhG','<t>seJygzUjKGFS2jJZ3nLeAyd4jbrOeTDgxwthNjRfNXHazIUrX1PVSdlsayI8RrK8PbSTrsciJswNMVHQMES0gDOi92mZDmG2B0p8Nd76Led9uibjohelgzEVArIwVdaXm5fbAk7e51nn0A0Vp8BKUvuMU9SxlalsxS7CfQcCvRMdhj6bUqvy4X4eYoYRCLaW1px1hoC9</t>','d396843ab088b4616a075a58b2d6318e',0,'','2afxls1i',1,0,'',0,0,0,1,0,'',0),(44,44,2,2,0,'127.0.0.1',1506041565,0,1,1,1,1,'','x8NWm6Y07bmFiIV6CvYH','<t>09juIILykpcg66WRGwi8w2v0FIWusAtOdsr5qS5Wwe0rBxjkCBZDADf36Kirv9ziche8y3nOELpMibVJPSdq9NBJEBjMJ3RSqOjedeHkeaKAKsir2BlTP43lK9I0KyO8uauLZ8FuOcrvPtYoLvkSHIMa9Y5BdYCCsDCisMl2ChzgifLmcE3DyZ7DWrlnqSfYGhj1vz4e</t>','9b4d97b8e2055ac268506e8c163c01e4',0,'','1ucv73k1',1,0,'',0,0,0,1,0,'',0),(45,45,2,2,0,'127.0.0.1',1506041566,0,1,1,1,1,'','IPSQyEm4b003wlIBRZ0l','<t>YbPcmBjZfrCZoAQLjK2CuU2AgmwP35U712T2oNf5aFsr5PeDN7jAlPrzWxIReorHiHRueOPFm54s4jAProB6GNqxyrawRkZDHFRosbkQG2RitiNSIuNomyTM09TyKjfysAtQmKCp0eG4LR2KnmHc4nAuly61jnEGcBlfn2KQdloEnlACjsGLgEcu8yQbTLMDj5FbPZGI</t>','4a96e594785159b3a2c8a0f9cede3c53',0,'','34vz0kz7',1,0,'',0,0,0,1,0,'',0),(46,46,2,2,0,'127.0.0.1',1506041567,0,1,1,1,1,'','llGnmA8QvTVN81aWZm5X','<t>4ToPUiXc6JNBE7wHRKXkKT5AzsTbNmRPI1whNhObLdqYv5UakWL1vb96nOJgzpP4W22DMuKEbAtDeVfEkZQu5XcnTxbaF6H4d0PZtBTKWVQf2z69VYeEYvP76JHHvizQN5UaFSY7JM1gOyXG3W413hoEJmkOC7zj6VQsS0T3OahUDmKCcC0WVmhAeeAjvy2FzIwHrBhz</t>','a936aea7cb0df5fb1afdd46ea571bd47',0,'','1z9bewu8',1,0,'',0,0,0,1,0,'',0),(47,47,2,2,0,'127.0.0.1',1506041568,0,1,1,1,1,'','AkKCgMVtAVRyrGBKF4Gn','<t>eweQeAeO7Hoi78mJtQLlBNv6HV1GQWV29AnauddVufikZOIj0oA7XRBerjNP22oc9Kao8PNyCkxJG54wpZAQ0A8Ye1LhWTRCDxOdqozcth10bB6pNAANCfdgt3xk2EPlYXXKJsgvLKGRpxqQHHQuCfq1ZOn4p2TLwwtMzC8WRGzxvIcs850XEYd3clsBOA8eOhcOplZt</t>','c477682cd5f8706c177c3e874b96e254',0,'','2heucpcd',1,0,'',0,0,0,1,0,'',0),(48,48,2,2,0,'127.0.0.1',1506041569,0,1,1,1,1,'','1jD8bTCT9OWFxYZ7j8su','<t>bEKTGL5SJB80k29A4eOmr6sOjIE75zqWpAABsxBSOusflKlMOSsqMoWux02G4bru2T1djb6wAMIvQnY2Ui19jJvasMjoM6ZFajObVNJsT9vKpoCBX9xhISfbxGoLTgbsyulQh16Yex3hY6alo44LyyWhPefkGHe7QR6ULLaIGR9CsEBefisq9Cj0hjgGSZAVzqgtzvnR</t>','58d7120fe78e1fcba82504ee6db2ca88',0,'','8iftl16u',1,0,'',0,0,0,1,0,'',0),(49,49,2,2,0,'127.0.0.1',1506041569,0,1,1,1,1,'','7zDayrj7gyTs0Z6jeykb','<t>21fFAo1iYz0q4trbJjpEUUzwQX9F4uFXoDiIaPAhGBq99mPIgyqXWxAS6nG6HEICrd0nswg6XbOw7bhtYrtw4hhhVOVg6vhdtMJA6n0kfM7xZgMOqJUrNQUurLbjRrRADWf0MntbiCUitlcHkqNvlYaF1vr2smRraoKk8bzoLmZFCs7rj5jDOi92pnvpyUUWlB2jOb0J</t>','b1bc249592c3b5cfb6341daf4a118d6e',0,'','70xjbf2y',1,0,'',0,0,0,1,0,'',0),(50,50,2,2,0,'127.0.0.1',1506041570,0,1,1,1,1,'','0CctVQCaXavYzBkCHOEX','<t>810LceB3ByaInDept82wR8Z6zno6XBs7D5VZ0VYQB0LXVqIMWPnRDUPMa6Twu8Z7Y2zzdmN3LPzGnvyvrq6Euk4dsMm7RMpbnEMv5EMeK1KNyGtOTLCOvcHyuvTRWtlwPJ1Sk03L6PsbBh8qufYMYslr9TfyFLWgu3mzb5WjxqjLcyFMWdgIYhQvlIb5sUtbm98HLcBa</t>','ba0882376d79008c40d0bfaaf04a4f94',0,'','3nnvvpfi',1,0,'',0,0,0,1,0,'',0),(51,51,2,2,0,'127.0.0.1',1506041571,0,1,1,1,1,'','asxujIJzJ5ut7GysLHQC','<t>TuOFfAhQ5zhE6U3umuhbOP7GQEQZ6HFeZHUoxpVZD9SfPz04tWMMNM54pRPsNeKbe0KkmPHEGKTnWIeaUNeH1VEkSpqrsCQNu19FZSuV7nqQsTQ6ENCSsFmHJGUxJrCi2bFy7qRAwLpjsAXl8YzvsVhZFY9CdKJNiaw7IhmhWJEobypA0zdtoSOdOT1fCQwvNQpOln73</t>','a560d01a83a8f03c33e93fc6bc544669',0,'','3d1kn7nn',1,0,'',0,0,0,1,0,'',0),(52,52,2,2,0,'127.0.0.1',1506041572,0,1,1,1,1,'','Q1DuXBe2ZEtwME0k2HdW','<t>px5UkSsIUyr07tFCX7tSdfrpBKBLWBoAVHFR89hgeRHLVzDNVddDJ6u2g5HfWngAhrrptK0GPJfJF95sLswUvNq3xW9IpmNy9unF43TwVQxdVlO29bSuLVn4LGp5njLoieJpwW5p8YOfeXQbrVmfJL4RKOuNWfREw3VO05B1YyXKStFsdRXbgRDw1RDb2U1KTWCl144w</t>','e09d9335142bce37c0a7fef45dab53f9',0,'','1xf9jp6i',1,0,'',0,0,0,1,0,'',0),(53,53,2,2,0,'127.0.0.1',1506041573,0,1,1,1,1,'','sQOH9XiPfgqaDHJfaB4N','<t>iuw9rCzwQG3hgxay4JoILNpw3H1FZypdt8awkLyR5aK18aOfeaa6HNESoxsf4czmB9dhvd8e1eY4SJRAMWF3wkU3K4sr9Uqa9oea4DG3BRXeSNXw2kfSZS4N5h1MCXzR9yg8soCvUmAPEJ3N6cd2GRhA7Bs3TKpaqOtRJh0tbb03iTnXf8OWTrXISsFujjId3dYzDbVv</t>','0da066151654a85087755502a352ef06',0,'','38n293qs',1,0,'',0,0,0,1,0,'',0),(54,54,2,2,0,'127.0.0.1',1506041574,0,1,1,1,1,'','WQOyZ7N9zzEHcLJOmmUa','<t>FDb0D19I28AeyvmFuRS6DEj4xaEQzzTXvIveKzkAy1jGxlYQcyt2IRsiq3HCoIn3CVJVQFColbsBkTLkyZLgfceHiV6vFgQDdskWrPwSEDLuYBmV1KDVs2uQvoh5h6zWln1oVW7qgd3yHu33gV5fGYJv3WZhHXcAClq0MfYfDZzgzfTkPGyAoDEzoAfjVn6rC0xO4MYZ</t>','0239264c51dbd8fd1a89135bf31a7269',0,'','1vrzraaj',1,0,'',0,0,0,1,0,'',0),(55,55,2,2,0,'127.0.0.1',1506041574,0,1,1,1,1,'','KmKoEnJNNhL6VrFdmiei','<t>O2MP1KvEhkVn2fcKKthxUhG7xkKSRdn0y5KI8DM2t7H6Q6NabBExW4CeZ9y4nLyULRs9duTCLvtTqHfmZ2gRKoFWCgVIfZKlmqznUbVAcgDwTW9CtMgD98Uc5mHOPpjCVufIzpYCettxB88sA4HevR77JG7Lz61GyItCeeKPAaWYmC1czOYr7L2t0nb1q5XMfjviOUSR</t>','5611734075bd397926fe8adbf3de54b3',0,'','2wzaas86',1,0,'',0,0,0,1,0,'',0),(56,56,2,2,0,'127.0.0.1',1506041575,0,1,1,1,1,'','iexCUECUYjeuwej8Dl1g','<t>Upf14s6pQ4bJwpde7F8Ki1YD3fjEc72wDHknolxr1VJjBYgdgAErFFvU3I9GCAt5gyl0bz4IlAzQKMmv9miN4fak7rLUSgtFZbHazOtBOmcguIqX4QS5KkR53x8mzXsqqmxmhVQiTYw3uJVUueVvxrLxDLHn1dMSdDZ0enzQwTNnCHTbjeqhrSsIdUXqaOnpvCGdOV1Y</t>','ff26012bde010abb28cce442a5fb050d',0,'','1a1grdni',1,0,'',0,0,0,1,0,'',0),(57,57,2,2,0,'127.0.0.1',1506041576,0,1,1,1,1,'','XDkF08wmAk1QVZ7KVW9X','<t>M9nfWmCGYvuCtFzkbbEqGlz9WZZo7a7TbUUvypBOTKSSOnkNEIbZLs5mbxhdJ4xkSwxzshHQU1CKL9HR6sjiA5KZShloAYyspRfjy0RiekDANSi5pFAV3lB1FRIazB3PG2n7Nnk9IBRwXnJthSQzdJzreYdbDUuUcskkmNbev41o7E7Xc0JihCjnURb25g8VV69uh2Va</t>','53ad452002b32df66b4fe82af602b711',0,'','35he26r0',1,0,'',0,0,0,1,0,'',0),(58,58,2,2,0,'127.0.0.1',1506041577,0,1,1,1,1,'','58PJ2hadbAMWRpS60obE','<t>fkHwERdqxeqWLxj2ZoOBeGFGcYFVyaoFULP1nqTyj3hL3yv84AEZXJp2molIBJ3JohuPUlqfGH1Z3tSnFi9u7KUmGFEdk20FmaegYeMDCFVGL07AqochIpn0R614dXKeIJWNlL14S4xuGd2nFKBBxOdpln4LTgt2l0hQXexO79cLTuLBVq3zlyp3jCT3JSQw383q79lL</t>','59d0e8633481b02aac117b1158c1285d',0,'','3h441juq',1,0,'',0,0,0,1,0,'',0),(59,59,2,2,0,'127.0.0.1',1506041578,0,1,1,1,1,'','SO9ahIBDbpOG0QgrkbHp','<t>DZPTvEiyMTkxB0QTxibzoyDTJUSOhIx6lIo6Kp5TULDVLuy8JynunyfEsdGnBckhdjZfHqwVxRzNmZNkgTrZZS3PHRJuGI3uHjTDS7HFV0R9wbs7iXlIjAnhyWlNH9yPrYw047L28ywmbL79K6NukmcfAOWNVNt1HpSyKRT1FcK8jbQlTTWgqvTJz6S1h2eEmLNF6TdG</t>','fb9c8eaf57003c24551cf6beb72b1edc',0,'','sjtkjxns',1,0,'',0,0,0,1,0,'',0),(60,60,2,2,0,'127.0.0.1',1506041579,0,1,1,1,1,'','p9hLwdtHHKxhiKrsBq4S','<t>GWbxO9I5f6iTOzfYmFOzEZ7VuZrYYbeM2Y9M7nPXbwSVXm6ieCfe2DHBh15DQ5oYBf1RiGDHnJikBY0upJ6tc3r4PtEegLSFjn712oOCDSJnhSaYMEUHgIE75vbkZwKEozXw8nbpD8z7dSoxE4cwAqi7y68YjFyP5bSRQCGDHHG4L7j4M2pkttOz5cmGgA1g8ncbI4wl</t>','43a620d0f04a0a014c46e607b89fb702',0,'','3smbkz71',1,0,'',0,0,0,1,0,'',0),(61,61,2,2,0,'127.0.0.1',1506041579,0,1,1,1,1,'','FE3MFAQEgWBAuS8hVIaF','<t>LupJSICTKwCvghGgLfj29phDNS9rb8Jd69V95AkfK88J2FZtZqdvoERYMGUCJ4at6nqpUhgfqrPCpwPVwVmNG2Y520RuVXQAyC9NlzG4RClkvJteQP6BCZbdxSQDk6N2hDGAKefQsjEZAMEFsnUDrkdvJ8aMsYdbTVB3IIXridL6xdwF1DQO5fCDBTHhNTmnUbHLwucM</t>','ebfe7a1224b8f2f6ccc19a8e57ce8268',0,'','264xekjx',1,0,'',0,0,0,1,0,'',0),(62,62,2,2,0,'127.0.0.1',1506041580,0,1,1,1,1,'','5b9kaV7g7qtgfmpUigcd','<t>BPdkZKvTC1aZoWIiuYVQA4ZKpPDSLA5lznwJy1cx3JvltuWUbyokLhF6jyuWL6PIFZVEhpP9b6tLEPI0ioWNEgxti5WT1sCiiK6sPJWKjNKCw2R52EGX3U7bJrZpLj08XerieZuUu4eCnX9jOjaIUmpSQZ5OmU4q6Prym3v8aKLXD1tkcfOC3ggxd6TSwjonNPsSwB3O</t>','7a8f331c8219fab925577381d6e974bc',0,'','gdef3pta',1,0,'',0,0,0,1,0,'',0),(63,63,2,2,0,'127.0.0.1',1506041581,0,1,1,1,1,'','4K5xA5CJn5hPJrXWDG2b','<t>9ABhFrcGsVfk3ILJo4ld7FHyn7aW1dCXRW4XSlomky5nuEplCCfbMe7ZAVfWQSMs6d26ELhYoexxdZWF5I8qc8HVgxFNhGeu2Y3ZEnaBoRjLDzWBZptJcmfYRjHlOYwIn7Yjzv1D4jQlWqsrosPQeZ3mcjiOjAawZZR1NIargPcseMWjPwkFPWF3xswRGsyJ0BDlDR0B</t>','60ef41f4a2b8401b4e8dd89d38955a68',0,'','3joio7it',1,0,'',0,0,0,1,0,'',0),(64,64,2,2,0,'127.0.0.1',1506041582,0,1,1,1,1,'','EhUBEKsPiMW9CrA0AMFi','<t>imvnmlE3tr47aurnX8Nx8C0HyPHP6B33voZATCnwbMjko3Dz8NWn9jZj2k6zND1nGxd74lORGqIih13eDx7z4BnczrBuVxrdgEeMpKuYoDP4akdMlaAsmuq77UN1IzaxYILV7l9kIY8DnwH3RAgWJfU3r8XBsCUxyQUqF2MoXAxDOJkeJHlN9MBsXgjnMPqPnrBAMYAa</t>','3c9b39cdbd94d4c2f0993174cec6fe5b',0,'','if6to61q',1,0,'',0,0,0,1,0,'',0),(65,65,2,2,0,'127.0.0.1',1506041583,0,1,1,1,1,'','rJ2FHmyQdHVUfc81GVTz','<t>zhTxBnIZ9ElnlXCZXjXc6LVcWhdEHzUoGmLSgbwEkA3bogGBWrxU3rQgxtw0YMqO1i1TXXpGBymE1xFTQrepC0b0X6Z1rV9ZpwS55FB5XvEJRTIMDpN6zu0bg0w8UssAwWzqPqb4LySS2zYmfMauwQn37Jhr1XGPwhc32c0KFmuE5lNSONwTslYo6mwCdzmFQYOR60Nt</t>','776823b4b56b8732b1f8ba2dd8415a2e',0,'','1yn7e9e4',1,0,'',0,0,0,1,0,'',0),(66,66,2,2,0,'127.0.0.1',1506041584,0,1,1,1,1,'','eAekVo2cMWwHlzGxzjSk','<t>Ix3dti6IVlF6pPMrVHOku1RouUFdtohPyDxp8W7eUTOwKJvDwmwtJbouO02MrSkRa8pLL1L7ulcdDdO249s6i8B8e8b0mB8bYVSx9VGLuiqxx6eVvCnPvEHBWLsmUOY0DJJzlz9FT1R9uTTyYzzygy4652tZmoq6AfvbgtOH1TqNAVmm7CoOzXJE5hXGHAzHIhSYx62d</t>','18e635ac5edd6b6a69b9a2653eb12656',0,'','24fkmqux',1,0,'',0,0,0,1,0,'',0),(67,67,2,2,0,'127.0.0.1',1506041584,0,1,1,1,1,'','K3IKmnd4iMuNyP1T9hbe','<t>gSCtuAVkAmmKmVwDvoCsMN1HoupQLV9zzLi2SnbIOPd0pdoriRtpcnjIAHvyuJduDJZywCjZoOuYflyzMRoNgYP84l7NrzrIgHR26reza2FsPgAp19CFGH9e3MImlfDG1jeo0Aty4tUEu0VZojzt7gjhXPWevHizKKGW9yoktqBK78qEOULTQFJGEtoYLAUUeWlruDLu</t>','8b8253b729f00d6ce40c86377885885f',0,'','34j1ood3',1,0,'',0,0,0,1,0,'',0),(68,68,2,2,0,'127.0.0.1',1506041585,0,1,1,1,1,'','rVwZU3hLp67yLVH2pI2o','<t>X5JtAchdVV6g4gQM22tu4yufC7dZVJOLFbZURt05BVSCk7UQugnts5tZTe35WUTbijBuWsP40yIWQfo2xwnePBBDTEPLN0nujpHB7OH1ipaamC0d3dHulZbEsL3pVxrVDlNQRf3tglP4KENKFeiveDvosbBBzoFwVgl3GBlDbXs3FoQyPssC0hOqvF5kLL6ar1ZDA31x</t>','c621a84ca20dfde48cb0cea578991d87',0,'','1ej6e24h',1,0,'',0,0,0,1,0,'',0),(69,69,2,2,0,'127.0.0.1',1506041586,0,1,1,1,1,'','R7ct2WzNhLfmJ4cZlIZZ','<t>tBe1nC8YNufxWv5d5NDK9kGzzNwqvotK4S3DximQ2BjuCzRQl4jlf8vsIyLt3xNZSV2QDAOCdWJmvPlvfz1o50K3UI4eUHZJahArKGd6WvhFipXc5MfCGfJ5VxZgkvnli6guGC4FkTN2xaxJKFSvKzmZPYnPijub5ayj5v7QjUEZVSagkNeoSbD7FxChgOSAKQ2YiinI</t>','986a6dc926f1dcaf4579e698eeffd7ca',0,'','1mgl4dxh',1,0,'',0,0,0,1,0,'',0),(70,70,2,2,0,'127.0.0.1',1506041587,0,1,1,1,1,'','Yww4IBoJwVXHYxKkoTSg','<t>M5X1oMgCyTQfb91Jds60lqMZPCv3clBTYK4qCbONRd1oWQgONY5S3PkILXPpWSCKVE6DkVf21Irfje3d0pD9T0fzbG5X88KLN68zpLDKz2su54CWZWkvA5s1Zh5JJ1mrW8DRVZI2m9chYCYL1H5yGP8ur0stwTJ0FziXPkYtz4EkMxdp1SuCLYsUiMOimkmAlv13Gw2y</t>','9f175c37144a9ba3adc4db6308b5a130',0,'','18bljg72',1,0,'',0,0,0,1,0,'',0),(71,71,2,2,0,'127.0.0.1',1506041588,0,1,1,1,1,'','Yv02zwtzWP9WUcHzWLF4','<t>XvNq6DOiWYi4hr5aE1S3CvcUbn9gQJvj7vva0TnVqstvIg0St4s5dkvSM5SSpFC222LMUQ2OFKwqJKkPCXeAyqtQSn1LMJdOaNi7K4t0hBhzOWo1BiEbe9rUpSN5Lx9HIAUJv7gzkyVlSgUsLaBL9w1R7DowBgFfuzG5h7d4waAFQLwIHr6iGj09VVMCMoJQegPskM3f</t>','a849a91e1f7691b79a1ffa9086d3743d',0,'','2ezwxux1',1,0,'',0,0,0,1,0,'',0),(72,72,2,2,0,'127.0.0.1',1506041589,0,1,1,1,1,'','oZoP48Ss54vLjE7sXgdT','<t>KReDVii2HRh82u6uj2QBFoiGkivXpjQaYXrU2bL9awED15G5btxCuAfhX44sohrm6CvpQlAXimFwJr375rBG1vTUr6TZdAFuNe2VAr6B2OMWS7VTjmdO0UxrmG79fOYyGcQTnh26syHfwLcQGz9ggZ9MjHT8Suc7SIKnEHM54mDec0HeZw9RBEmfDhjDeNzseXYLSN95</t>','f46d5905835c45b7c0a46e67c96bc06b',0,'','1anmtard',1,0,'',0,0,0,1,0,'',0),(73,73,2,2,0,'127.0.0.1',1506041590,0,1,1,1,1,'','HiEjE9rQC60sd96mHtST','<t>DZHdvv8hdExhFPbXuPayQ98OPWMbscBqeUeoAa0tgpcfzjNBJmOuOyTFA8AMxhYjyR63BuF8JQtxlzorzuso0sttKutFzROegdiO2JFVsxaPzdXqbbdWjop56VWa1zOIBCGU7rWtafn2BrkFLCAkdJ8Huxp50DeARMZeofdkg2P5tgRDD97xZVf55P0swfGDmouyXMvg</t>','40896081dc7407e7fe40289ad5a5ad8b',0,'','30v5p76n',1,0,'',0,0,0,1,0,'',0),(74,74,2,2,0,'127.0.0.1',1506041590,0,1,1,1,1,'','jQEFLjokZK6ARVfc0UYY','<t>jmVxdbF1x2dhvYpfAk6fEabzM2qeYmAya2jmct15GqbYAoNRKDXSFwoWCh6c7Gibz8IX9fboQrJm2DdlvUTUclqViZ7zO3Lboxfvk0leCUzrsbBB1xkQf2BupOdmOU3svdB3VEe8kh53SJ3a9DPRRyGrJHt6dtVNxm9qWAlV4a0oFHyWyoR4UnBbuSFYapqSLKLLBTCV</t>','27834d9f976ff59cb6c4fdbcf649e5ff',0,'','2ko8nz9u',1,0,'',0,0,0,1,0,'',0),(75,75,2,2,0,'127.0.0.1',1506041591,0,1,1,1,1,'','QgBHnphC0yNuhVcbPIW7','<t>ueMwPwA8iCjD9oFfaqfnEBH4UWwQUSbfbqwrjRwz8IwilVKAcyArkDFozRZvEfos87HVEAOFvTCuBDsZZ9oMROUOv4N1txe8hEKVUAdkNLWC7KE25H8iAg7wMDCXdssJf2XDzR3F8HQ0TVAKQ6mSsoe4kP3ly2vZXnTBQAdYZeYp8jYlCJry5BXXPKfaFNStsT4AV3bW</t>','bf0c6ebf39845483712e0c1d2ccfd932',0,'','rwzbgnay',1,0,'',0,0,0,1,0,'',0),(76,76,2,2,0,'127.0.0.1',1506041592,0,1,1,1,1,'','r9PmdfnrUdKP4A8UOCut','<t>1x2HHJ12v0KefD59kjc75eqYapSq97xArMczOuEZJ9vMrmu8EcbPxCsXFwzMzxKy98dxvteB6aVRHY9ymcSZcazfK6CgQVhJjDu1niVSng9XH2aM014ksHFK3AFqYUzRXRRyNHe7XtXi7H44nFhiBcN7QPdlue7bsFQzESlLaP5TZDUnyunUrQ8Db5NP7hBw8CoUR3r4</t>','02d0f48ad70a0711d82b4222ee1d650b',0,'','3m7xkuvt',1,0,'',0,0,0,1,0,'',0),(77,77,2,2,0,'127.0.0.1',1506041593,0,1,1,1,1,'','BlPFafzCGI9WTVsgilYK','<t>2zqp25a0IDggjriglZUZaMBEO1poHEPLBFJdUq3Xw0NKFOihG3umiv553uXY0LyYlvSEcx5c7YrM0uzhCmG9eZR2TgpTieS5XmvYZi7whbhgKd1NeELx9OhUM8LtkwGkCAyvmjsrHgA5wyEP4hDBvYSeBbAIqtlBdUeAY58S1g0Z6Vl5HynyzYJk2zsM2RyzM7XGiG3P</t>','5f4a543bae9c25dd32e975ea64a52d0c',0,'','1pcg10ww',1,0,'',0,0,0,1,0,'',0),(78,78,2,2,0,'127.0.0.1',1506041594,0,1,1,1,1,'','uwxPvfAPqeaG2yyLhw8p','<t>tsVZ4afXBVFmigQAu97XakPzwuP8dLnBR7j1FmA2VTgTZ7dgMMmA94QUrKLKdLMaOZR3Gjd2EQkQyk5kN1hqpXr8s5S95Cr0Fagce8BnBFCfvi31eINU3TF82ugA2Kh6qAk4iUafokzs0Lm6Vhy3b6eInGrY3Fkrtu99Mlx9hNBWgHO2FZzw6KGxgpkGycuE6iAf1cOV</t>','9ece3a3b31826b234dc0b50a60a3a9e6',0,'','6z95jwn8',1,0,'',0,0,0,1,0,'',0),(79,79,2,2,0,'127.0.0.1',1506041594,0,1,1,1,1,'','Qsrtq2oTPnxJKQBIGPb5','<t>8cgsSbAzqpBgXg7Cm5s4PvOBHpevZAv63OFzee3B3M8gpWTXgpqCTaXn3W1JNFNToS1iqqYr8qvwclQFv5gxjuOUpAlWT8zIYcP7hS2dPFgyvrZwPhPqIgmSY9xt7CmIkscnVRRLq5hK36RowiyqA37ynGxbvPlm63JoRyPmYC9pDQh4iqw2W5o9dieUMXsrFLvDoD6V</t>','56b8412db068714deb550744483cd180',0,'','1kvg4wri',1,0,'',0,0,0,1,0,'',0),(80,80,2,2,0,'127.0.0.1',1506041595,0,1,1,1,1,'','b8OEFoanCEUpiktsACaS','<t>xfeFp6FRoitPVtK8Rn19VVOLrEDyoIAHx7OiblLj9c68GFEvvrCTfsr822pODDP8GA9uHPHNJ9KnMfUEceurCBV4k8oZSmaqgueWAus6KHxdaxwV1m9uly74tGVfhCzmfgImgeSRwMJt1JoLVr9YgmKGN0pxsBAS0f5vJ9z0C83Y9AJAhzzveyEoQt6rvwYXf75Liu3Y</t>','79e7132b7453894f30528e21abe01df0',0,'','3q4hziee',1,0,'',0,0,0,1,0,'',0),(81,81,2,2,0,'127.0.0.1',1506041596,0,1,1,1,1,'','CNSgwLm3J0wIpjwNBeNj','<t>qEUQmHZSUrnHeA88eF2QtdDlAiDLduSIoVdpMNXJO6KduLsTdrbEBq6u18wLULHbZQEE5nsLOi1fkopEiTIjyhsOdVK59LH0n6T9uXkq78R65U4ufUMhZ6ofhRKPeIsvG2VTjgF9MLO8D9FOuHyopLS4CCgyl89nN9DathLFanQWyTWM5r8GAfwoRHGGJOVemefxSRI4</t>','51ac7daef3623a065647b64bde9c7e88',0,'','e37c4865',1,0,'',0,0,0,1,0,'',0),(82,82,2,2,0,'127.0.0.1',1506041597,0,1,1,1,1,'','Iqp2PtHn8e0l2d5Hmuxx','<t>6jmqq8Fxn6XLXIZqlq7PXfWY0AF9iFwuASezNq7JihKFTP9rounrDiTKrOwMr1sDDdTwTvyH1LrqGKqsj5R2ZWu9YZP8t4sqeYaNVP6iPqxOY78fkxYg3BurY8GXmHBzoLGaqZ1PQBmI6IB6YzPom2iCT5OkFDBTImcDugLq5yQbSH8Xnko5NWl0Cx9Uv3lfODHWOmJs</t>','283368fb36be3be0bb217eb1f2eccb20',0,'','xnlcyxyq',1,0,'',0,0,0,1,0,'',0),(83,83,2,2,0,'127.0.0.1',1506041598,0,1,1,1,1,'','AY2E39BYaczc10tId4oE','<t>AYCDTXeSQiVeEouZKkvWMvbeTl867mr8gXsnJpn2bgnAgQHoQGcmH1TBgQxWDv93Jqfid2e8Ga4HCW97JIK361CjXlIh6dHrc8P0IdCSPgxZbceHgOkuT9Jv4DED1J908iidGY2lIVmz3K9detcJPV070KGL263I2O5XK2LJd5IBRsGsZCjD3R3ApGToG5YPBey9hCZZ</t>','3d3d90f6d1af1ec01967f3e801357aa3',0,'','1pt0wnw9',1,0,'',0,0,0,1,0,'',0),(84,84,2,2,0,'127.0.0.1',1506041599,0,1,1,1,1,'','pxF1QF3rNC8Ef0rWJ6Sa','<t>EWntYf8Tukb0lkQ7c973LILzpAfgOUEWzZfebp3LHybRQLyaK9XnlvUc5bVqvunbKyemiNYcuEgxQs64nmvxR0tlxuJULNuTx5apVc0A3UcEJxEn4WfwyPfXVcjkDwVhl3ButihvGlD8nIsIwZwbXD8X3itz5SfHQ6R4JO6oeXnFMnaejmKKh530aTKrIZ7Dp9yBSg7p</t>','e82c7dbc541c9fbfadd61eb97f8d84fe',0,'','2meizma6',1,0,'',0,0,0,1,0,'',0),(85,85,2,2,0,'127.0.0.1',1506041599,0,1,1,1,1,'','gjSPeLFCBA6vNrjfJnmw','<t>JqWy7XXPCEDISsuZO31ss0nUcZL73wqji5j6vChb2Hgbx6BIV3QzFMKtE8XMwvpASlLTxdDenb7tzla8Ov1puDgEWPQoqhD27kxY8pucPxQlRiaHVsBWRvdZ7ckcHZ6udKtOzWLNdNLW4ZWuCjDKXeiITOOvOWcDUn2AcpKxwFhJm8SKbpTgPdXFirTItmTCsuGv57pq</t>','989aa6c760d526d8f36f0d17c437d312',0,'','j7rzs6mg',1,0,'',0,0,0,1,0,'',0),(86,86,2,2,0,'127.0.0.1',1506041600,0,1,1,1,1,'','drg7S8n7Q5nKK1OLdsUb','<t>x3ouBeBUTqIMXRtiyZx2GmNp3sD9PkrhIIrpbgGnm2h2vOZSRmcrbXQtzATSEvkOpkb51XfHCM6Kh80iRsu0ApsrTY4h6vBdRVmWN1pCn8jHdXYmByUcLiGw3lRQ6939QQKXrkp4JI53qTXFOPh9FhcAqVunQ8lm7udVZZKAEWXRWMhI1JTLYg0QzXTr8jN3wlec45g9</t>','c07ebedbc96220226afad5ea5e5f816e',0,'','3riipjkt',1,0,'',0,0,0,1,0,'',0),(87,87,2,2,0,'127.0.0.1',1506041601,0,1,1,1,1,'','KjR543MQj7zhUAxEL5yN','<t>tkfCKJgWry9d9XjoK5cWYfhOsjLzXOSiN18bXEOaNKbOdfjC41MbXnsmcJtKnrS9RObdYeQT2e895RTiolm4QppDKzVoCWW41ZjMKWGJtpQtiHkpNwu38eClSxF8UEYqwU8DZy4avv0AryBPABjdJDXhCyd2hWg0nTKUzRKcj5NXlwuyEHXy5niO4fVSCD2ifo2F2Kw4</t>','6f466e50337b3a2bb2f0ab8d32fc5ccd',0,'','ktjd51lg',1,0,'',0,0,0,1,0,'',0),(88,88,2,2,0,'127.0.0.1',1506041602,0,1,1,1,1,'','9eAd0bRlgLO4Hc1vqIyS','<t>IIWHN5NsjpuhJJ1LA5KBwmQqd6NwDV2JXn8WmHzGRPzHvOQ5Ny99kQQFl2yeWNmlc9Avequrpvav4OFjgaCbUSYbSaUzwaCHRGXwFTz7x9eTnmZzeONAYYkWUajtq1ck9I0iZZJInP76DsurIqqFFZ1JSXMLqJaDTZ7D0sJzQ9n25uGN7uySK4WqBLqz20wobHlzsQy3</t>','78f93a3535b5b7c619cb49fbf6fa77df',0,'','w2iyqnzp',1,0,'',0,0,0,1,0,'',0),(89,89,2,2,0,'127.0.0.1',1506041603,0,1,1,1,1,'','vSUTYQkGh5cEiCzHfERC','<t>sN4mAi2dJAeGEBLk0QhNjztgv0wmKFYmQhdYVvtV7Gkd19AyG6zFEUvBNiTL232NW5D4BJubNL8WWmlOOn9xMC9QI0ZGnPTUgr3vejM1LVSoNmynGb8DhbBtfN5tQMcdWRiKy2REb4bLEw8ixW6o15vNlKLMhWjVcCrDedBqPYbuJ3E9JVCykJOKQM2klCCcOffcfMzL</t>','7431555906d31abc35898dabb7b11feb',0,'','ki58bnj3',1,0,'',0,0,0,1,0,'',0),(90,90,2,2,0,'127.0.0.1',1506041604,0,1,1,1,1,'','HF5OE1rRXFYzUIOuUtqm','<t>UyqRxwymRbciP2G1kbZ9aViVa3IYwjSQ0gVYS0CcTov5bG9o3u8gicHgU77zz0McUZ6U7X6BfZAz8xpI3pY37D4eEC0nAcXu9aiub0GtW3I3t2qd0dFrZ01wR4FzgRAA68DdtUP9TGvEH0mwrDL6yGSJVcwKvdAR5Sz3bpXhJ3ZL3Fq1IqTuzJ4S9WwXbZWsYGJMjd6Z</t>','9b621e4309d115a295797e01f8c9444f',0,'','3867sc8r',1,0,'',0,0,0,1,0,'',0),(91,91,2,2,0,'127.0.0.1',1506041604,0,1,1,1,1,'','mRatq8yrEfRIwnMe0IQb','<t>gXVoT8CQQKYw5r2VQ5HgIoPTXqMWyc21s6yztt2qYeRhuSIrgAMan26SPF7a1TyAy7JG20rnmAm0FlHSqPcB2v0YWUT4XeXJ0qSj36Q9JDF1MGM5GUYSaX9Ry0WiRimyjIyh8w7Ez8MUizKZBXwUQ32mXwl5soNZYjhCveIgemGDJ2DUi8nzAO1jQ2aEh8gJpGnF0910</t>','389da62b633511ec61f83490dffc97db',0,'','31rmei5n',1,0,'',0,0,0,1,0,'',0),(92,92,2,2,0,'127.0.0.1',1506041605,0,1,1,1,1,'','MAte74iCnMXq0wi4Q8zw','<t>6udhJwEMKtFBfgm2HICZUHvbjhS2FrE14mGm17IjxJNZaM5q8MayjLyabAsXvfsNaIiNTntkOTHp4t7egbIp50a7vL8wjKZwGZKB1dZftDZeXPSJlns3wnG2oaHsVbWJ9PEsJgR8KsrRucvaNieQtqeu026LAeerUtC9pWhqGnXEAq97cqaspWZ7hzOQOhL2F63bSCPv</t>','f722bc58af329eb0bf4560d1233dded0',0,'','3o4sfqic',1,0,'',0,0,0,1,0,'',0),(93,93,2,2,0,'127.0.0.1',1506041606,0,1,1,1,1,'','xG11fwvhy2uR5Sjx0I8k','<t>8UMaZTVEAa5bIy1LpNXq10yoXvaSvHAZIbf0HW6SvkauPeIUMCA0dXZXBfmSTlf4PyN0UKOknfLfGB9N39zub1aAbwKdRJ5M8j7USypApGEp4iOHlHpMJyDqGGvMbs2qJd6vZ41pnrcIW1f2mplEsHwa1pC0wMy6pZlvHXMMlvC1YpxS0i3fDdmdIUkmI0UIAwLhAxST</t>','ecc6efaa44d27fb7d3a95d55cb8ffbbd',0,'','1e9f7l3t',1,0,'',0,0,0,1,0,'',0),(94,94,2,2,0,'127.0.0.1',1506041607,0,1,1,1,1,'','FatiSeqNF1aImGsbElAg','<t>6yYsB9x5V90obHtSMiuP0simQuhAKTQx4DLhWhL2RoKEuFHwUz1FdqCO3e1bDqhawcH9dJSvUnRSdBXxctVCFSKpoiHKzI0eBB36EtrXCXVeNHKV0JjcpT51qmpRgl4D08JDpLwRFFUKiK8cIWGeGGKqJQZOUCG4iU7lcbI2qRcgzFPncehZeL6n34ovGuyjZFviJfOo</t>','778c6d7d497054c4c928ef56fbb84405',0,'','v2ponm60',1,0,'',0,0,0,1,0,'',0),(95,95,2,2,0,'127.0.0.1',1506041608,0,1,1,1,1,'','FEyJGa5X7PUBjyxlAbUi','<t>YprlV00uGSOkKsaysPnMH0QccxL0qoBmy7M33cj7G1zbpjNOxn4VLi0rUFzD55oCQkJSztAaFw93HkMsN0gzPTZChgwgNQLAJdmwZiCdFXSYCrNDN9YM2Fq8h4vPZRMWpghlaVbdSQlhG0kIOKSVYFvWV3jP3jnSClSnb3QGTST1M0YeU256jcI7Frtk17xHESgJf1HA</t>','4a16307b12d708bbd11caca6fcaeaca1',0,'','3vbflx4y',1,0,'',0,0,0,1,0,'',0),(96,96,2,2,0,'127.0.0.1',1506041609,0,1,1,1,1,'','l6OjR30qr4CskEI1cBIc','<t>0rfrqWgSkuKiy8gHuiSJU0XbS7YhYHlxhpE98a1NYp26N49uZThHoeSh45LqQjRifXLJxrRnDcq1hrINkIdf4T9uRMcaN4ki3paeNMl2gdI8CaxxAeI09m5vAcQa9m4N1nbUjDQGFg39R3oW6PISLzTqWjHw80DeDhC3clTZ6frxD5lWz7PxUXO4gQ3n4LnxxumdUXMe</t>','ae34d8081ef11b2304d539cf824e8fe4',0,'','3ts3mbwb',1,0,'',0,0,0,1,0,'',0),(97,97,2,2,0,'127.0.0.1',1506041609,0,1,1,1,1,'','zDf4znwcC0GRLhHutBgS','<t>SSKgShZ5syommIFUapwmOJaZSPvG4CAJbUsHIDRzhGaKtpgwASGQMGV6scIpEdeE6CosxsqvUYu20m8OiOwgza5Tbaq2ClKqDbZ3e4zeHQgiOeqVleKVfFUX2xItxgZKNFudnu2cVA5dbemlCjkKxCClBOtvbNvS3Uz0JqbRhHuzVjTo5q4bk1rfyJ39uba1CIH244PU</t>','67b096f105f1b1b4067e9da7aa745261',0,'','3b1b80jn',1,0,'',0,0,0,1,0,'',0),(98,98,2,2,0,'127.0.0.1',1506041610,0,1,1,1,1,'','8f8lZbQh43CKsLRSoVIe','<t>foQjpDVdaorc1SXYrH9m44qyTVdCWuSP9YWjWYuo5oQ3X9UbMv4YfxxLPmLkxoO7lvjsNW55ZYakriaMHi32zemMvrvmfUXIPGxeooZ3r7WD3pPQ0vOOgtHbeGL4XgQoJpLEhPYzIjkK5l2DRxHijJ5pHxZqBA9iQb0FKK0nxwU7DhXsti7acMgBkZWE6OV25lOHfzxw</t>','2cf60f942f08eb484aa6ca3b01999bc8',0,'','rp2xzhgu',1,0,'',0,0,0,1,0,'',0),(99,99,2,2,0,'127.0.0.1',1506041611,0,1,1,1,1,'','fRRr2JysDkhBW25Zaf3k','<t>FQhvA3hRt2QQOfEiMhfi0NuM79Y4ZJ5WtKqHxnlAvdKtQ92umeavaBtwSY2f3ozDUHO8Qwpuq74HjDJarQRUqdaOXbmlDmqXPIuacMRASwfHpFk1KBbOrQ5uXp84wGLwJBReO4RZL2aHnMEfCsxcECyddzxMPmFPshmoaDOhxKaJw6jDXMGHJOSUFChI7Y98F1L5j8f5</t>','b6c450ac09e9ab703b72cf53f08df579',0,'','1n9142xb',1,0,'',0,0,0,1,0,'',0),(100,100,2,2,0,'127.0.0.1',1506041612,0,1,1,1,1,'','4SiV9HWcfCFq1QL3Wp9K','<t>q6WYTRu7UNrcoB60KQw1sA6JbdLmYzFoHKGSqztWSc6JJvPhAp04uPwzM8cVP97sQAuJnj0iL54Aorrb3kdvWyG9XKpXi3y2xy6lxQXwQN1CZBlj0buh0tCxbFccttR13LjyE1M0IdAKyPMlIi0BiCS8glKw5pe1kczmomEtIzgELVMboQY3i94aiFuFbGpllVFrbzqD</t>','ed173ed96d5dcac3dbf2f32fdadd5ee5',0,'','1gp6kas3',1,0,'',0,0,0,1,0,'',0);
/*!40000 ALTER TABLE `phpbb_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs`
--

DROP TABLE IF EXISTS `phpbb_privmsgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_privmsgs` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `root_level` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_time` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_text` mediumtext COLLATE utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_user` int(10) unsigned NOT NULL DEFAULT '0',
  `message_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `message_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `to_address` text COLLATE utf8_bin NOT NULL,
  `bcc_address` text COLLATE utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_privmsgs`
--

LOCK TABLES `phpbb_privmsgs` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs_folder`
--

DROP TABLE IF EXISTS `phpbb_privmsgs_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pm_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_privmsgs_folder`
--

LOCK TABLES `phpbb_privmsgs_folder` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs_rules`
--

DROP TABLE IF EXISTS `phpbb_privmsgs_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_check` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_connection` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_string` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rule_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_folder_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_privmsgs_rules`
--

LOCK TABLES `phpbb_privmsgs_rules` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs_to`
--

DROP TABLE IF EXISTS `phpbb_privmsgs_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_privmsgs_to` (
  `msg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_replied` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_marked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_privmsgs_to`
--

LOCK TABLES `phpbb_privmsgs_to` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_fields`
--

DROP TABLE IF EXISTS `phpbb_profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_ident` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_length` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_minlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_maxlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_novalue` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_validation` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_no_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_novalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_ml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_is_contact` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_contact_desc` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_contact_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_profile_fields`
--

LOCK TABLES `phpbb_profile_fields` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_fields` DISABLE KEYS */;
INSERT INTO `phpbb_profile_fields` VALUES (1,'phpbb_location','profilefields.type.string','phpbb_location','20','2','100','','','.*',0,0,0,0,1,1,1,1,0,1,1,0,'',''),(2,'phpbb_website','profilefields.type.url','phpbb_website','40','12','255','','','',0,0,0,0,1,2,1,1,0,1,1,1,'VISIT_WEBSITE','%s'),(3,'phpbb_interests','profilefields.type.text','phpbb_interests','3|30','2','500','','','.*',0,0,0,0,0,3,1,0,0,0,0,0,'',''),(4,'phpbb_occupation','profilefields.type.text','phpbb_occupation','3|30','2','500','','','.*',0,0,0,0,0,4,1,0,0,0,0,0,'',''),(5,'phpbb_aol','profilefields.type.string','phpbb_aol','40','5','255','','','.*',0,0,0,0,0,5,1,1,0,1,1,1,'',''),(6,'phpbb_icq','profilefields.type.string','phpbb_icq','20','3','15','','','[0-9]+',0,0,0,0,0,6,1,1,0,1,1,1,'SEND_ICQ_MESSAGE','https://www.icq.com/people/%s/'),(7,'phpbb_yahoo','profilefields.type.string','phpbb_yahoo','40','5','255','','','.*',0,0,0,0,0,8,1,1,0,1,1,1,'SEND_YIM_MESSAGE','ymsgr:sendim?%s'),(8,'phpbb_facebook','profilefields.type.string','phpbb_facebook','20','5','50','','','[\\w.]+',0,0,0,0,1,9,1,1,0,1,1,1,'VIEW_FACEBOOK_PROFILE','http://facebook.com/%s/'),(9,'phpbb_twitter','profilefields.type.string','phpbb_twitter','20','1','15','','','[\\w_]+',0,0,0,0,1,10,1,1,0,1,1,1,'VIEW_TWITTER_PROFILE','http://twitter.com/%s'),(10,'phpbb_skype','profilefields.type.string','phpbb_skype','20','6','32','','','[a-zA-Z][\\w\\.,\\-_]+',0,0,0,0,1,11,1,1,0,1,1,1,'VIEW_SKYPE_PROFILE','skype:%s?userinfo'),(11,'phpbb_youtube','profilefields.type.string','phpbb_youtube','20','3','60','','','[a-zA-Z][\\w\\.,\\-_]+',0,0,0,0,1,12,1,1,0,1,1,1,'VIEW_YOUTUBE_CHANNEL','http://youtube.com/user/%s'),(12,'phpbb_googleplus','profilefields.type.googleplus','phpbb_googleplus','20','3','255','','','[\\w]+',0,0,0,0,1,13,1,1,0,1,1,1,'VIEW_GOOGLEPLUS_PROFILE','http://plus.google.com/%s');
/*!40000 ALTER TABLE `phpbb_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_fields_data`
--

DROP TABLE IF EXISTS `phpbb_profile_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_profile_fields_data` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pf_phpbb_interests` mediumtext COLLATE utf8_bin NOT NULL,
  `pf_phpbb_occupation` mediumtext COLLATE utf8_bin NOT NULL,
  `pf_phpbb_location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_youtube` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_facebook` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_icq` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_skype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_twitter` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_googleplus` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_website` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_yahoo` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_aol` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_profile_fields_data`
--

LOCK TABLES `phpbb_profile_fields_data` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_fields_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_profile_fields_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_fields_lang`
--

DROP TABLE IF EXISTS `phpbb_profile_fields_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_profile_fields_lang`
--

LOCK TABLES `phpbb_profile_fields_lang` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_fields_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_profile_fields_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_lang`
--

DROP TABLE IF EXISTS `phpbb_profile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_explain` text COLLATE utf8_bin NOT NULL,
  `lang_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_profile_lang`
--

LOCK TABLES `phpbb_profile_lang` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_lang` DISABLE KEYS */;
INSERT INTO `phpbb_profile_lang` VALUES (1,1,'LOCATION','',''),(2,1,'WEBSITE','',''),(3,1,'INTERESTS','',''),(4,1,'OCCUPATION','',''),(5,1,'AOL','',''),(6,1,'ICQ','',''),(7,1,'YAHOO','',''),(8,1,'FACEBOOK','',''),(9,1,'TWITTER','',''),(10,1,'SKYPE','',''),(11,1,'YOUTUBE','',''),(12,1,'GOOGLEPLUS','','');
/*!40000 ALTER TABLE `phpbb_profile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_ranks`
--

DROP TABLE IF EXISTS `phpbb_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_ranks`
--

LOCK TABLES `phpbb_ranks` WRITE;
/*!40000 ALTER TABLE `phpbb_ranks` DISABLE KEYS */;
INSERT INTO `phpbb_ranks` VALUES (1,'Site Admin',0,1,'');
/*!40000 ALTER TABLE `phpbb_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_reports`
--

DROP TABLE IF EXISTS `phpbb_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_reports` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_time` int(11) unsigned NOT NULL DEFAULT '0',
  `report_text` mediumtext COLLATE utf8_bin NOT NULL,
  `pm_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reported_post_enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `reported_post_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reported_post_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_reports`
--

LOCK TABLES `phpbb_reports` WRITE;
/*!40000 ALTER TABLE `phpbb_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_reports_reasons`
--

DROP TABLE IF EXISTS `phpbb_reports_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reason_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reason_description` mediumtext COLLATE utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_reports_reasons`
--

LOCK TABLES `phpbb_reports_reasons` WRITE;
/*!40000 ALTER TABLE `phpbb_reports_reasons` DISABLE KEYS */;
INSERT INTO `phpbb_reports_reasons` VALUES (1,'warez','The post contains links to illegal or pirated software.',1),(2,'spam','The reported post has the only purpose to advertise for a website or another product.',2),(3,'off_topic','The reported post is off topic.',3),(4,'other','The reported post does not fit into any other category, please use the further information field.',4);
/*!40000 ALTER TABLE `phpbb_reports_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_search_results`
--

DROP TABLE IF EXISTS `phpbb_search_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_search_results` (
  `search_key` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) unsigned NOT NULL DEFAULT '0',
  `search_keywords` mediumtext COLLATE utf8_bin NOT NULL,
  `search_authors` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`search_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_search_results`
--

LOCK TABLES `phpbb_search_results` WRITE;
/*!40000 ALTER TABLE `phpbb_search_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_search_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_search_wordlist`
--

DROP TABLE IF EXISTS `phpbb_search_wordlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_search_wordlist` (
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `word_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_search_wordlist`
--

LOCK TABLES `phpbb_search_wordlist` WRITE;
/*!40000 ALTER TABLE `phpbb_search_wordlist` DISABLE KEYS */;
INSERT INTO `phpbb_search_wordlist` VALUES (1,'fitxvbdsjf4qld59sgmbar3f7mzspnbb9d4seqkm0c6invhp4j4lstsqbaaztb5qz0ctdmbx1oreyv7f0sikqrrolmmdtk9ckzupklv1wukoa4ue3d8n3bjz5xl1nsrd4xdfdvzz6ncchj9ba2mtkef8yvfxgkxndtnh9n7flnew85ihooero2cewcege2e42ooy3err',0,1),(2,'ubvnwkdiqe1jvuk9tawh',0,1),(3,'ld7hpn0vql10gxw6dbxuk7al6kfys4mbpsttz4ac3i09owqtfqfcqkgx05qch56vgzl5bwyfpxseucszpwvkyonwlbu18ovva4swyj2vqpppgjqchb5z6rh2pikmki6zgzczo73f7v3zyvsuyuxyrndqs8fu2li76zpqvgdir48tcmneq5hwpubtnbrpcsr6qq0ihrbz',0,1),(4,'gy10rwgcq7rzhqcy2xu6',0,1),(5,'n3zgpkbxene2rljcydnsog3al2tgv238ofifydiwtibsaei2lbtukzmwhahpflooe8ok1nnandvhh3rw56i38dc6hsu7f8o3drzjnalz4vjrn3tng4tspt0h0ycows2rqz3rtaavxomzihhatp3v6mlktubrgy61elaomjzyxrnodtfqfxnrx73oz2ycdfhitgpvyjku',0,1),(6,'rm4l6lg38n72spv4ahvy',0,1),(7,'bunyaefu29ilm6947ekgfji8zourtjmecglum5ll8xnxq0xycshwyvgnyozdo9soijltsm1jjdnhtgizgiqaeg14fex3g3cswdt0ixtxrjk6vgdcuqzd5kkgmfyaau7amjiso4w0zjld21dvysve9xv93b2x2dtwblw8lu7njwiry5su7kygfyikx9hk25pmxukjlzbz',0,1),(8,'fnl1bmcsqsdfdjlgcma9',0,1),(9,'4ilhggdyn8ovzsbvh9hqrauz3rpicix0wgknmvacylu4qqxuvziudrpnerjx5gz5jhlpt1grooddq1dzmc2jrt9oqbpzcb0n8vczckxq3tlw5s8qndbusbxhj8kmpll35wvwjeub91kkzompdxybckkragwozixpgutjc9peltnecpixou9odtmnhpl0wvm2koucbqmm',0,1),(10,'bvkxgalpweuedsgrkgjm',0,1),(11,'ddbfw3fjpeeiowjmgsi4zyew147l5gn2mgptd3xk4aeqjmjh6q1lxruchbphqevor55aqu23gvyovpkffbxczlnggdcjvfmwbtsvcped6mmjyb7m30z6uj4npakpnaltbekjlapalehfbu8htq1hr8zdzvnkbvvmnm7jsh8pgf9mbtm0gxg5vanrzuetojx4zsixptss',0,1),(12,'hacqvwf9rcllxtse9ysh',0,1),(13,'swbd5bnplmq4gsvln6em66jzn1apwzosybw0m9aelpzbkqtfmrwe4sirl6fbj8ls5hedhk1iwk4qabvkc6nziz9zyyofyqoxpawtdr1ozlmgpcufrbj6oqddvvma4atq7bvqo0xwrjbgbcwyzvz2ldsizygooatjaq3fqpojigirdmmxk8knziqpeooescmtbmvbpj2t',0,1),(14,'t6qylotepk57fmkhdmyz',0,1),(15,'qzplplwxj1ibzjcqnlv0lyzdxoee8d0vxiy5vegrk122uwq8zpdl0htxupjh1wxp8u73m5r02waqn8aj69au7gvszbx1pfrohsosbksosf76lcyvh18xrtebyjqp2rh9x0hbj8rwkly96xjsgbvzmldif1zrzaeravsqxbibapvendku2itnakpkatkns8sjfyuyf86m',0,1),(16,'ju6g578qzphvbxrgvk0b',0,1),(17,'yeo2yhpqii9a60greoqzqwcg6decmcixvjobljzcohfkfgrqnl2hqf2lbandty1c4wpndky8igmwktl1zaqf433kgdclbddwxth5qvfhroerl7ys9z2may3vtq2x2e6jnta2zkzcmkyzbamihqkwhvvuhtkxgqbupwewv6fl40zcz71vscmlai4sczuimvxom5l7e6xk',0,1),(18,'ad4vqytsi8i3gsuree1w',0,1),(19,'wx6ybj2xqexppabpzbkgbn2mlcpqaubromcqlmvqyp8nppbbybde3ja7jcnx4irpw9xqroq4zy89coe3zteoooczogwblicizc0c68zkz0kuutce9xe5cz4csccex6ojg15nmjd59nxnmmhyu5ocx1chaduxfdasre57xravl7mkt44bpcox7rthvkaebjiqwlcuivip',0,1),(20,'gpnrfwyqa6bggwxhocx5',0,1),(21,'8nlfce82madi1dleokeiwgx95oowwir6bfg63ezoldrrojelitxpp6bckjoizodrfmb2rxtwlg073fqr3a3pth8jvva97vov0ysevjy2sgnj36mstnwmzu3gnlhzq7ublfgfbrtbaoyujsmyyjar4gjyjfwaexukvxmam4mw8e7vk8xttee8ctojtoshipftfblfbmzg',0,1),(22,'bcxp7fbmdafw6omrze9y',0,1),(23,'a5genev7j66uydo6vwm1dbwgxfdaoulavlcdd04o5bwasuwtxzo0jsck8gzuspxtvghhznsafmrpx0bf9akmlyjrehhn5pea6bucyq8qhekmwwr5d4q6yrusxdaj5dsszo61l1hzuvcqagoaoryuh06d2eplz0dqb6zgcjhcdtifqgvcbqz7y7uxenyiqenkws2ok6s5',0,1),(24,'ao8ge46ixihaddvhsaeq',0,1),(25,'nfjpvhnxw1vpadym5wp68grxffedvd75oaylvcf8crhoyrcuulglkojatswtatbctoy1crwqnac3ngsudcmvulqyrmbrsfsmrbt0be49s2h4gjyns2h2r0lxswhu78cs0he9mzhg0heyu5isw3nlnarysbffwa1w2el9awcbqrwe35pergy2jasewwx8hovos3q0rfec',0,1),(26,'e0hwbvzf404xa3regbkn',0,1),(27,'odrfupsp6qtpttowmopltzsnldr6yokkch4fkzslahrgcwbxrsu8wo7lzwbwwqssfqi0zz93nryybgq41cgkviocfkapte11d6wc8jypbyjxxnsjtk29uswstmwtprnmobgn1wpehekxrkfick6n8rj2wyqd9ntid5cyothrhiitrdnenpyfjlae3cjlrteqojl2fpqs',0,1),(28,'vssdeypemsn3qgnddsxa',0,1),(29,'ahvh7gccyjid8z2xrfjwq70tgv7kfam6b6upt8lagywmhtabrgqsll50jefpd7o51temi9yoasnmqdamtmugow7hpe8aygmqs1zgw2vrgxnmbohgkwlbyd2s8wbwob96ilc39h0rkaoqfylvhbhyg5sbbcgzpqxwirkgoolqkbykud1ddclcy9yfuh1pktqahznvo0ij',0,1),(30,'hidhb3cpgbqtnpk6axmb',0,1),(31,'5isxmtr5lx1uzfh1hx8rlrqh1n2pewhujnieujxlsd5asmtveokd51rb2lobe8ighhdut2wgl7tut9komussbfwdplyjsbhyceex5pnwlejkgldcuk6wdo2ri5vt408nk6xpz6jefjmldhhuycbgqtp6oxi4rj1fyi7s2zbkyfsmtpokpysrq9rcqwdmkqa6urqmepzw',0,1),(32,'vfjmtqa7be7txjyuaivb',0,1),(33,'kpg0zreky6e70d7onkwtdbeskx3pulx8lhl2dcyyx4rjbi4ttnzhdyomsdkwhtv0csc4iiydtvte9z0rtwmtxnvygsbabrzuadna1wnk6w2tdslp80sx1imxvihipglwu0wya2mn4ylyjbtoryki1ov29szseesika5zjm25yqldhftbpvmpjywmayouqleilrnnyhql',0,1),(34,'prwzm0cxaw3rsmmdhfzu',0,1),(35,'uktlyeexxjskpok6macdjpdm8ns250l10fu9xdl64fl89ubhtz4wdlsoujjdlqcs16d7ly5o8uedmxuzvtn0ncmp6oewla9cvaofh4wo5w6dlt8hvlo8woxej4sekslli5gjreaeyade5vfpsagp6kbwacce0q07lghjfovebzepgph3axdygwp8gxkdppteh3vgzspy',0,1),(36,'8hbtwwqzsr64otgwapd4',0,1),(37,'mfdeajfqhffypumpzzweoqaynjvdgxibhrazjmol8f3ulh4asoezp2bx3t1c02uqkpuxbx6iehfykbi6bpvpk43vb0relxutmxdj4tiw2vcik1sxu13rgt8mx7aw6ynirhes2crs9qmjxcdolavkxqlfdqfiwimczevguzxbck15vvvhdvhwfuhcbogeibxy9cus0aqt',0,1),(38,'v0yognvovc7zhftks57a',0,1),(39,'dkkcnd3kqoqtoqwcllc7pxunc8z8evwh390tuzdeldaehkfo45k9pydrmszdb7zws6qmyeskphhunmhct7fdtg6v48la041bliqjkhf872xidzyp8vskxkvna8ff8tz6pdzfptsqwfuaemkgrv6mfmwtvhx5f57zrrv89kxaghgss34xcd00tiao0agoukjya155mdpe',0,1),(40,'pfjsgg1ztyqw5mqykvbh',0,1),(41,'ecb5wv1gubwka6eb0bjqan02lajviuy7uefrm8p9bqavrttvfkacew4ldmx6ms19lbxm1zmjx2zklbukjt5yaqvatf57ktmu1wdgn7k2tqipvlsb8wurgandxdmn5labwomth0jw210z4ts75qxpj5jddqnkopxe08mq9dwbbu3kudgkbcihcpdv8grnyh2wck1nrv2p',0,1),(42,'lbwrijb8qmvnqs1orzev',0,1),(43,'kpokr0t2me7plz7awrje6gcamhswei4e9zqdxuet2cz6o1qpf0d0wy4wduvpqk4dwuug7dgz0wb2r52mbpdydmjr5erceps5wbnhhcjpmn3yupuspjg9vl6sb3uh3pcjygztdyene9fkonfzdscziq9azbihps3v9lk0fxzxadgblvqqf8voy9xzu2ytbnninyrpoxck',0,1),(44,'xcrs7asecgkc4mt9qwgi',0,1),(45,'duygqup6kgtgfqf0rxwbv0swogplrkri36q9nqqhwz2no6f8qszhcxrntgckwzgokzncgapn0jfjwvqdbhhgjiljmqchml6pkwet2x9j7htjwe1zbubmml6d1vuqtq41caytpsfflkyvbja79m6jukwcq0ui9nkuig8hsyas5wpwk1yi3csgxlazdluubkjpfyer9e5g',0,1),(46,'0scn4usxbexsomfu8oq3',0,1),(47,'z99v0ud4pj0g3a13agcw2oran0ghkzputalplmq4enfdojtntyqun21st7ci4zidem6q9oikj4hwgyhtctmewlpfnrpgjr0t9w2jpja5x9yxxu99rnszab0r9a9bqyvyrdyzlvz8t6e6yimrzpvradhp7xhdo6urjbaprcpd5nygaitqyscktflw2tocqdas2fiwzj5o',0,1),(48,'hzyfbwzcy7tnzbamu3ji',0,1),(49,'ur0wfskauy1uc7l7lp0aryrew7ct9yseyucjlg5wtzg4gcrbe1nrj9ugpba2ugpivdybt25zclhmrizd7uv31yilis70ekq4vevysshhphmwc1jgcn2cjldaaoae8vuxwsgeqxrkfyzk18zjqutmuiserockgisitt2ecqz4pfdsnf2pz7qduidyiw5echl6ssrbyfr7',0,1),(50,'j9giloopbomukthcjctj',0,1),(51,'9ktzvtw8pwhzkhricjhetsd8kcenmn14z1qhavokbiupt7fpljddfn3x315rntxreorbpkdih87mg2vxkllyzso0sr5rgriv04a7ypquihzkf7xcdmfvntrq6hauyjegizo7axmgwo8cjtv7c9cnqtd6rerbg8kvligzj3zsvjtmuzj5dhcnphevmtu4oegpe8sdjaju',0,1),(52,'2pqffzcyswhvqj1hzi6q',0,1),(53,'7r5pliijjpxmofvsenrbbrsouitairahcwn7ngdgb3vd0tg4suvjjtq8ozafyiewzqysjoz3y2v3jjs6f48d8u2zclhhvbkcf51gf4wfxrv8cn9fks5dqhtjgrtoxunah79ynqrclshpvsvevu23pglucf39i29gwtwvt7tm8xmv3ehgkheuctenfigj1f66m0ljydli',0,1),(54,'f00zj6p3doqr4049d7rt',0,1),(55,'gcy3xupdufop0rubxbsy8kn0uhruehcjuirxskv8zkgfomekj9h9mhs1akyguvju3hijxopecyqce95o41tfpvkciakznt72oqpwjxwhzvoveib2hkvycqrcoejiodiiajilmjejuhqvpixqbwpqo7jj4xuputuxktahlqophkdupnoggnil9ywdbtjy4yy9qi8z8azg',0,1),(56,'fe5yso4bakvc5echt3vd',0,1),(57,'eiwrzomspcuzoq3bqjenlfh0lcr3tveqjykt2jvsntml6szayb6n8xw86etfl9furjlwc3ozww35xavam7bhzd57xgson7n34r4jfipaqntzhrps92lawrbrrx9kmvmtmjzq3fluthnpfbtthgisrvehze6hguc3gh1urqku9za72na8nu1r4no5m3fu5avmez8cd9po',0,1),(58,'f7ab99ylov1jp1al8xlg',0,1),(59,'lalg43wb0mtfnaobbh3wqrelbjxjkzevvdjy4nlypwfrxo4zf8navx5ft3acgdzvwf3e2vqa1ixcbr5sz3zkj3yk2fvotftshjastu8r8ksckj3isjc5vv75gbjqomqr05burah3olu4q9gwg2t1hbenkfbreydxukzust6u8fjgwowjgkmshizqscs1d4qnsmha0bge',0,1),(60,'lpmqisk5k0o9spejldjy',0,1),(61,'dfy9xrolem21dd49t5sz6dqawwcptseghucdlgvnw3iiymvqki7wjga6y8iklgmr101egtpnmxtklke40iqzghasl66crcwypir0thqgflodyijmldje8k5swpkfhgdtrk081z82musdru5wazzdu3kohh37lm4vmpus9xdfxeztrgf7dn40oz1rgt3btg3aaw8go1zs',0,1),(62,'6g0y5xxkgcjkh1d9mkw6',0,1),(63,'g3x3suwkckjmt2odkpb5kr28dqysr4a9zki7ofioyle8ou1h55gmacxazjlua7f7ceua5g8trvc3ugtnlj6dguvehb76fugyo1amiozdxymz1wznbagju6lyhmrg1gdz2zodsjqbsuug4jj1ji73kkb2alcdaijp10ab6nmrsi1cnixaplrqlpyido5azqmehi78d4gm',0,1),(64,'0jhywzvr1gbkkwvgxpin',0,1),(65,'ilvbjjjqxjd7etuulzw2emvoppdwhogqwqqgstqxou62b9wjt33hbrhart4jimwibe2xzkyvg6vdzvbcaksbrfw4qfgi9kpsj7ucyblc5mwkskdregpxqfdidlv2kgjlepzey4zxrfknazv5lptebhqc6zmg5b8zzorxoymvjje1gxmhykgbatttpaxngh0miaxsv0jv',0,1),(66,'82vdykyet0sub6qwlmw3',0,1),(67,'5wtb5otil6nb3nujhhda64pactge0kp5oah3c6s8v8n2blfvdbetpcpvcdjamxnfpw4lmefeqkypeu0aiv9cmvf1ridgqvhtsh6rdu5xw9kwbziecgrxm62e5t1bpwzqcrxg6lbcdkc9hriseqhqfdxptdv9jnny3wtnevfxlffr23buxxssos9xdo0jw37iqt2smjdx',0,1),(68,'qkudrkcr8fhsc7hyxrur',0,1),(69,'kmev2gklsv3f72e4wlbc534geeuzlupa0meqq2no3fifiyr5kxohsdhcipr4krhwrfkxptgxdmimvuamnvakfw7dipawqtd4rv1gpc1hosgmg4bxrhuoo2z4k0pzmzu7h5idxbhqce9dwvzy5loxrpdt2qgkulftkkhnghojjvsakewvk3venhcapjayuaiatyuzbbgb',0,1),(70,'rdtixhvurxol7mx1kvun',0,1),(71,'ligxhk4z18aawsoai4xtssmtw9unxxqdydvoqemch0c9rkscwa28dg2zo2yfxokbk4kpnr0elllvfnixuildupmjrxjedyp5yfhcwbkgn5wh6wylomsfwhuepylii4srqqh35dw9dy5mwih8mdnkqpzyqcevmxhbcwhcigyljzwdwqzrjnput9jdz97qaqgg8iykdp86',0,1),(72,'g6z6smkicydmob1dzkmh',0,1),(73,'uxjfw1uvd6jq5qayg6o8jvlcxnb0sfkjfdyqhe9kprxiqucxqjqbsdffplki1ab5vihr2henclncgqeerd3obfpmsf5beovp7ejjemdjfxicg9cjvpkm8jbrtmdzzkz3z79vsi4atjokyldvzxdfiqwnm2akwpbephcuo9nadrzzuxbunnha2xivd1ehouchetjdd5mx',0,1),(74,'0duwcem1tashaze91sh1',0,1),(75,'nof8k34wmi6fpk16e5e8ngtfutqcsdpwmimklgibpc34u2ugbqhusgwdoc8exjgcvba0exseg0hv3iqov6p2pec2zpnxktodd2ep1joeqiytc3yosbacmjee89iwbwfkgg1hwiyxjpcyqjxu9re1xrtmz1iad7m03knhjgmjj9yitltn4ivfhfmvunvcvxiticfzomvx',0,1),(76,'lf5ppi7xahnhbuyu5kjb',0,1),(77,'wcltnwms57wjp5exgamaorsu8kzl3jcz83bstoxdnk14egao0dg8afmqwfhlfvnnb98qqc98jsaqd9z9offmsmtax7jhmoqwuie3bycpbmsfbcgll5dvsiz9wc5vgugresy7tsqlzdrvzuh4nsiazwaixctfveye2btik0tisc1l8dzx2ucmxaupmod70mepdtesvns1',0,1),(78,'ylhgo8hozuekamx36fg3',0,1),(79,'acet8kutlj5v44jzrdw1seti53rtl32it9ndpqheyo2ooyd5zmswvelojriwsjsdtaxcfl2kkamlsjxdokhzbtrydwivb04y2hfciemlquwxdpwpltviotd7pwylhcliz6bpnk9q7pj4vvvaizqazzmmvbvqlfhxsdhgmvqx9zo2kwzgnutycfurosdrybgbj8p9xqn2',0,1),(80,'whnmcxnjn4qnip9gwg58',0,1),(81,'bwgjkzkrhqv62rkadiyug5hhxash8qw4t6hsippzrveyxwgpbwl7bl6iybo9u97vrmoecvio9calryf3i1hvkhg3x3mrf8rul0na77u75f8x9qkzvlxfbkxbuzjkrbex0rctoze7z1esdmhzfjaofxibbze6scdhs48qp6mzzhplfoyxmpkvlrwxohbeh4kcwz2vhpb2',0,1),(82,'ihoqsliqggs9qjiquiq9',0,1),(83,'sejygzujkgfs2jjz3nleayd4jbroetdgxwthnjrfnxhaziurx1pvsdlsayi8rrk8pbstrscijswnmvhqmes0gdoi92mzdmg2b0p8nd76led9uibjohelgzevariwvdaxm5fbak7e51nn0a0vp8bkuvumu9sxlalsxs7cfqccvrmdhj6buqvy4x4eyoyrclaw1px1hoc9',0,1),(84,'fwxrvs86jfta73ya9bhg',0,1),(85,'09juiilykpcg66wrgwi8w2v0fiwusatodsr5qs5wwe0rbxjkcbzdadf36kirv9ziche8y3noelpmibvjpsdq9nbjebjmj3rsqojedehkeakaksir2bltp43lk9i0kyo8uaulz8fuocrvptyolvkshima9y5bdyccsdcisml2chzgiflmce3dyz7dwrlnqsfyghj1vz4e',0,1),(86,'x8nwm6y07bmfiiv6cvyh',0,1),(87,'ybpcmbjzfrczoaqljk2cuu2agmwp35u712t2onf5afsr5pedn7jalprzwxireorhihrueopfm54s4japrob6gnqxyrawrkzdhfrosbkqg2ritinsiunomytm09tykjfysatqmkcp0eg4lr2knmhc4nauly61jnegcblfn2kqdloenlacjsglgecu8yqbtlmdj5fbpzgi',0,1),(88,'ipsqyem4b003wlibrz0l',0,1),(89,'4topuixc6jnbe7whrkxkkt5azstbnmrpi1whnhobldqyv5uakwl1vb96nojgzpp4w22dmukebatdevfekzqu5xcntxbaf6h4d0pztbtkwvqf2z69vyeeyvp76jhhvizqn5uafsy7jm1goyxg3w413hoejmkoc7zj6vqss0t3oahudmkccc0wvmhaeeajvy2fziwhrbhz',0,1),(90,'llgnma8qvtvn81awzm5x',0,1),(91,'eweqeaeo7hoi78mjtqllbnv6hv1gqwv29anauddvufikzoij0oa7xrberjnp22oc9kao8pnyckxjg54wpzaq0a8ye1lhwtrcdxodqozcth10bb6pnaancfdgt3xk2eplyxxkjsgvlkgrpxqqhhqucfq1zon4p2tlwwtmzc8wrgzxvics850xeyd3clsboa8eohcoplzt',0,1),(92,'akkcgmvtavryrgbkf4gn',0,1),(93,'bektgl5sjb80k29a4eomr6sojie75zqwpaabsxbsousflklmossqmowux02g4bru2t1djb6wamivqny2ui19jjvasmjom6zfajobvnjst9vkpocbx9xhisfbxgoltgbsyulqh16yex3hy6alo44lyywhpefkghe7qr6ullaigr9csebefisq9cj0hjggszavzqgtzvnr',0,1),(94,'1jd8btct9owfxyz7j8su',0,1),(95,'21ffao1iyz0q4trbjjpeuuzwqx9f4ufxodiiapahgbq99mpigyqxwxas6ng6heicrd0nswg6xbow7bhtyrtw4hhhvovg6vhdtmja6n0kfm7xzgmoqjurnquurlbjrrradwf0mntbicuitlchkqnvlyaf1vr2smrraokk8bzolmzfcs7rj5jdoi92pnvpyuuwlb2job0j',0,1),(96,'7zdayrj7gyts0z6jeykb',0,1),(97,'810lceb3byaindept82wr8z6zno6xbs7d5vz0vyqb0lxvqimwpnrdupma6twu8z7y2zzdmn3lpzgnvyvrq6euk4dsmm7rmpbnemv5emek1knygtotlcovchyuvtrwtlwpj1sk03l6psbbh8qufymyslr9tfyflwgu3mzb5wjxqjlcyfmwdgiyhqvlib5sutbm98hlcba',0,1),(98,'0cctvqcaxavyzbkchoex',0,1),(99,'tuoffahq5zhe6u3umuhbop7gqeqz6hfezhuoxpvzd9sfpz04twmmnm54prpsnekbe0kkmphegktnwieauneh1vekspqrscqnu19fzsuv7nqqstq6encssfmhjguxjrci2bfy7qrawlpjsaxl8yzvsvhzfy9cdkjniaw7ihmhwjeobypa0zdtosodot1fcqwvnqpoln73',0,1),(100,'asxujijzj5ut7gyslhqc',0,1),(101,'px5ukssiuyr07tfcx7tsdfrpbkblwboavhfr89hgerhlvzdnvdddj6u2g5hfwngahrrptk0gpjfjf95slswuvnq3xw9ipmny9unf43twvqxdvlo29bsulvn4lgp5njloiejpww5p8yofexqbrvmfjl4rkounwfrew3vo05b1yyxkstfsdrxbgrdw1rdb2u1ktwcl144w',0,1),(102,'q1duxbe2zetwme0k2hdw',0,1),(103,'iuw9rczwqg3hgxay4joilnpw3h1fzypdt8awklyr5ak18aofeaa6hnesoxsf4czmb9dhvd8e1ey4sjramwf3wku3k4sr9uqa9oea4dg3brxesnxw2kfszs4n5h1mcxzr9yg8socvumapej3n6cd2grha7bs3tkpaqotrjh0tbb03itnxf8owtrxissfujjid3dyzdbvv',0,1),(104,'sqoh9xipfgqadhjfab4n',0,1),(105,'fdb0d19i28aeyvmfurs6dej4xaeqzztxvivekzkay1jgxlyqcyt2irsiq3hcoin3cvjvqfcolbsbktlkyzlgfcehiv6vfgqddskwrpwsedluybmv1kdvs2uqvoh5h6zwln1ovw7qgd3yhu33gv5fgyjv3wzhhxcaclq0mfyfdzzgzftkpgyaodezoafjvn6rc0xo4myz',0,1),(106,'wqoyz7n9zzehcljommua',0,1),(107,'o2mp1kvehkvn2fckkthxuhg7xkksrdn0y5ki8dm2t7h6q6nabbexw4cez9y4nlyulrs9dutclvttqhfmz2grkofwcgvifzklmqznubvacgdwtw9ctmgd98uc5mhoppjcvufizpycettxb88sa4hevr77jg7lz61gyitceekpaawymc1czoyr7l2t0nb1q5xmfjviousr',0,1),(108,'kmkoenjnnhl6vrfdmiei',0,1),(109,'upf14s6pq4bjwpde7f8ki1yd3fjec72wdhknolxr1vjjbygdgaerffvu3i9gcat5gyl0bz4ilazqkmmv9min4fak7rlusgtfzbhazotbomcguiqx4qs5kkr53x8mzxsqqmxmhvqityw3ujvuuevvxrlxdlhn1dmsddz0enzqwtnnchtbjeqhrssiduxqaonpvcgdov1y',0,1),(110,'iexcuecuyjeuwej8dl1g',0,1),(111,'m9nfwmcgyvuctfzkbbeqglz9wzzo7a7tbuuvypbotkssonkneibzls5mbxhdj4xkswxzshhqu1ckl9hr6sjia5kzshloayysprfjy0riekdansi5pfav3lb1friazb3pg2n7nnk9ibrwxnjthsqzdjzreydbduuucskkmnbev41o7e7xc0jihcjnurb25g8vv69uh2va',0,1),(112,'xdkf08wmak1qvz7kvw9x',0,1),(113,'fkhwerdqxeqwlxj2zoobegfgcyfvyaofulp1nqtyj3hl3yv84aezxjp2molibj3johupulqfgh1z3tsnfi9u7kumgfedk20fmaegyemdcfvgl07aqochipn0r614dxkeijwnll14s4xugd2nfkbbxodpln4ltgt2l0hqxexo79cltulbvq3zlyp3jct3jsqw383q79ll',0,1),(114,'58pj2hadbamwrps60obe',0,1),(115,'dzptveiymtkxb0qtxibzoydtjusohix6lio6kp5tuldvluy8jynunyfesdgnbckhdjzfhqwvxrznmznkgtrzzs3phrjugi3uhjtds7hfv0r9wbs7ixlijanhywlnh9ypryw047l28ywmbl79k6nukmcfaownvnt1hpsykrt1fck8jbqlttwgqvtjz6s1h2eemlnf6tdg',0,1),(116,'so9ahibdbpog0qgrkbhp',0,1),(117,'gwbxo9i5f6itozfymfozez7vuzryybem2y9m7npxbwsvxm6iecfe2dhbh15dq5oybf1rigdhnjikby0upj6tc3r4pteeglsfjn712oocdsjnhsaymeuhgie75vbkzwkeozxw8nbpd8z7dsoxe4cwaqi7y68yjfyp5bsrqcgdhhg4l7j4m2pkttoz5cmgga1g8ncbi4wl',0,1),(118,'p9hlwdthhkxhikrsbq4s',0,1),(119,'lupjsictkwcvghgglfj29phdns9rb8jd69v95akfk88j2fztzqdvoerymgucj4at6nqpuhgfqrpcpwpvwvmng2y520ruvxqayc9nlzg4rclkvjteqp6bczbdxsqdk6n2hdgakefqsjezamefsnudrkdvj8amsydbtvb3iixridl6xdwf1dqo5fcdbthhntmnubhlwucm',0,1),(120,'fe3mfaqegwbaus8hviaf',0,1),(121,'bpdkzkvtc1azowiiuyvqa4zkppdsla5lznwjy1cx3jvltuwubyoklhf6jyuwl6pifzvehpp9b6tlepi0iownegxti5wt1sciik6spjwkjnkcw2r52egx3u7bjrzplj08xeriezuuu4ecnx9jojaiumpsqz5omu4q6prym3v8aklxd1tkcfoc3ggxd6tswjonnpsswb3o',0,1),(122,'5b9kav7g7qtgfmpuigcd',0,1),(123,'9abhfrcgsvfk3iljo4ld7fhyn7aw1dcxrw4xslomky5nueplccfbme7zavfwqsms6d26elhyoexxdzwf5i8qc8hvgxfnhgeu2y3zenaborjldzwbzptjcmfyrjhloywin7yjzv1d4jqlwqsrospqez3mcjiojaawzzr1niargpcsemwjpwkfpwf3xswrgsyj0bdldr0b',0,1),(124,'4k5xa5cjn5hpjrxwdg2b',0,1),(125,'imvnmle3tr47aurnx8nx8c0hyphp6b33vozatcnwbmjko3dz8nwn9jzj2k6znd1ngxd74lorgqiih13edx7z4bnczrbuvxrdgeempkuyodp4akdmlaasmuq77un1izaxyilv7l9kiy8dnwh3ragwjfu3r8xbscuxyquqf2moxaxdojkejhln9mbsxgjnmpqpnrbamyaa',0,1),(126,'ehubekspimw9cra0amfi',0,1),(127,'zhtxbniz9elnlxczxjxc6lvcwhdehzuogmlsgbweka3boggbwrxu3rqgxtw0ymqo1i1txxpgbyme1xftqrepc0b0x6z1rv9zpws55fb5xvejrtimdpn6zu0bg0w8ussawwzqpqb4lyss2zymfmauwqn37jhr1xgpwhc32c0kfmue5lnsonwtslyo6mwcdzmfqyor60nt',0,1),(128,'rj2fhmyqdhvufc81gvtz',0,1),(129,'ix3dti6ivlf6ppmrvhoku1rouufdtohpydxp8w7eutowkjvdwmwtjbouo02mrskra8pll1l7ulcdddo249s6i8b8e8b0mb8byvsx9vgluiqxx6evvcnpvehbwlsmuoy0djjzlz9ft1r9uttyyzzygy4652tzmoq6afvbgtoh1tqnavmm7coozxje5hxghazhihsyx62d',0,1),(130,'eaekvo2cmwwhlzgxzjsk',0,1),(131,'gsctuavkammkmvwdvocsmn1houpqlv9zzli2snbiopd0pdorirtpcnjiahvyujdudjzywcjzoouyflyzmrongyp84l7nrzrighr26reza2fspgap19cfgh9e3mimlfdg1jeo0aty4tueu0vzojzt7gjhxpwevhizkkgw9yoktqbk78qeoultqfjgetoylauuewlrudlu',0,1),(132,'k3ikmnd4imunyp1t9hbe',0,1),(133,'x5jtachdvv6g4gqm22tu4yufc7dzvjolfbzurt05bvsck7uqugnts5tzte35wutbijbuwsp40yiwqfo2xwnepbbdtepln0nujphb7oh1ipaamc0d3dhulzbesl3pvxrvdlnqrf3tglp4kenkfeivedvosbbbzofwvgl3gbldbxs3foqypssc0hoqvf5kll6ar1zda31x',0,1),(134,'rvwzu3hlp67ylvh2pi2o',0,1),(135,'tbe1nc8ynufxwv5d5ndk9kgzznwqvotk4s3dximq2bjuczrql4jlf8vsiylt3xnzsv2qdaocdwjmvplvfz1o50k3ui4euhzjaharkgd6wvhfipxc5mfcgfj5vxzgkvnli6gugc4fktn2xaxjkfsvkzmzpynpijub5ayj5v7qjuezvsagkneosbd7fxchgosakq2yiini',0,1),(136,'r7ct2wznhlfmj4czlizz',0,1),(137,'m5x1omgcytqfb91jds60lqmzpcv3clbtyk4qcbonrd1owqgony5s3pkilxppwsckve6dkvf21irfje3d0pd9t0fzbg5x88kln68zpldkz2su54cwzwkva5s1zh5jj1mrw8drvzi2m9chycyl1h5ygp8ur0stwtj0fzixpkytz4ekmxdp1suclysuimoimkmalv13gw2y',0,1),(138,'yww4ibojwvxhyxkkotsg',0,1),(139,'xvnq6doiwyi4hr5ae1s3cvcubn9gqjvj7vva0tnvqstvig0st4s5dkvsm5sspfc222lmuq2ofkwqjkkpcxeayqtqsn1lmjdoani7k4t0hbhzowo1biebe9rupsn5lx9hiaujv7gzkyvlsguslabl9w1r7dowbgffuzg5h7d4waafqlwihr6igj09vvmcmojqegpskm3f',0,1),(140,'yv02zwtzwp9wuchzwlf4',0,1),(141,'kredvii2hrh82u6uj2qbfoigkivxpjqayxru2bl9awed15g5btxcuafhx44sohrm6cvpqlaximfwjr375rbg1vtur6tzdafune2var6b2omws7vtjmdo0uxrmg79foyygcqtnh26syhfwlcqgz9ggz9mjht8suc7siknehm54mdec0hezw9rbemfdhjdenzsexylsn95',0,1),(142,'ozop48ss54vlje7sxgdt',0,1),(143,'dzhdvv8hdexhfpbxupayq98opwmbscbqeueoaa0tgpcfzjnbjmouoytfa8amxhyjyr63buf8jqtxlzorzuso0sttkutfzroegdio2jfvsxapzdxqbbdwjop56vwa1zoibcgu7rwtafn2brkflcakdj8huxp50dearmzeofdkg2p5tgrdd97xzvf55p0swfgdmouyxmvg',0,1),(144,'hieje9rqc60sd96mhtst',0,1),(145,'jmvxdbf1x2dhvypfak6feabzm2qeymaya2jmct15gqbyaonrkdxsfwowch6c7gibz8ix9fboqrjm2ddlvutuclqviz7zo3lboxfvk0lecuzrsbbb1xkqf2bupodmou3svdb3vee8kh53sj3a9dprrygrjht6dtvnxm9qwalv4a0ofhywyor4unbbusfyapqslkllbtcv',0,1),(146,'jqefljokzk6arvfc0uyy',0,1),(147,'uemwpwa8icjd9offaqfnebh4uwwqusbfbqwrjrwz8iwilvkacyarkdfozrzvefos87hveaofvtcubdszz9omrouov4n1txe8hekvuadknlwc7ke25h8iag7wmdcxdssjf2xdzr3f8hq0tvakq6mssoe4kp3ly2vzxntbqadyzeyp8jylcjry5bxxpkfafnstst4av3bw',0,1),(148,'qgbhnphc0ynuhvcbpiw7',0,1),(149,'1x2hhj12v0kefd59kjc75eqyapsq97xarmczouezj9vmrmu8ecbpxcsxfwzmzxky98dxvteb6avrhy9ymcszcazfk6cgqvhjjdu1nivsng9xh2am014kshfk3afqyuzrxrrynhe7xtxi7h44nfhibcn7qpdlue7bsfqzesllap5tzdunyunurq8db5np7hbw8cour3r4',0,1),(150,'r9pmdfnrudkp4a8uocut',0,1),(151,'2zqp25a0idggjriglzuzambeo1poheplbfjduq3xw0nkfoihg3umiv553uxy0lyylvsecx5c7yrm0uzhcmg9ezr2tgpties5xmvyzi7whbhgkd1neelx9ohum8ltkwgkcayvmjsrhga5wyep4hdbvysebbaiqtlbdueay58s1g0z6vl5hynyzyjk2zsm2ryzm7xgig3p',0,1),(152,'blpfafzcgi9wtvsgilyk',0,1),(153,'tsvz4afxbvfmigqau97xakpzwup8dlnbr7j1fma2vtgtz7dgmmma94qurklkdlmaozr3gjd2eqkqyk5kn1hqpxr8s5s95cr0fagce8bnbfcfvi31einu3tf82uga2kh6qak4iuafokzs0lm6vhy3b6eingry3fkrtu99mlx9hnbwgho2fzzw6kgxgpkgycue6iaf1cov',0,1),(154,'uwxpvfapqeag2yylhw8p',0,1),(155,'8cgssbazqpbgxg7cm5s4pvobhpevzav63ofzee3b3m8gpwtxgpqctaxn3w1jnfntos1iqqyr8qvwclqfv5gxjuoupalwt8ziycp7hs2dpfgyvrzwphpqigmsy9xt7cmikscnvrrlq5hk36rowiyqa37yngxbvplm63jorypmyc9pdqh4iqw2w5o9dieumxsrflvdod6v',0,1),(156,'qsrtq2otpnxjkqbigpb5',0,1),(157,'xfefp6froitpvtk8rn19vvolredyoiahx7oibllj9c68gfevvrctfsr822poddp8ga9uhphnj9knmfueceurcbv4k8ozsmaqguewaus6khxdaxwv1m9uly74tgvfhczmfgimgesrwmjt1jolvr9ygmkgn0pxsbas0f5vj9z0c83y9ajahzzveyeoqt6rvwyxf75liu3y',0,1),(158,'b8oefoanceupiktsacas',0,1),(159,'qeuqmhzsurnhea88ef2qtddlaidldusiovdpmnxjo6kdulstdrbebq6u18wlulhbzqee5nsloi1fkopeitijyhsodvk59lh0n6t9uxkq78r65u4ufumhz6ofhrkpeisvg2vtjgf9mlo8d9fouhyopls4ccgyl89nn9dathlfanqwytwm5r8gafworhggjovemefxsri4',0,1),(160,'cnsgwlm3j0wipjwnbenj',0,1),(161,'6jmqq8fxn6xlxizqlq7pxfwy0af9ifwuaseznq7jihkftp9rounrditkrowmr1sdddtwtvyh1lrqgkqsj5r2zwu9yzp8t4sqeyanvp6ipqxoy78fkxyg3bury8gxmhbzolgaqz1pqbmi6ib6yzpom2ict5okfdbtimcduglq5yqbsh8xnko5nwl0cx9uv3lfodhwomjs',0,1),(162,'iqp2pthn8e0l2d5hmuxx',0,1),(163,'aycdtxesqiveeouzkkvwmvbetl867mr8gxsnjpn2bgnagqhoqgcmh1tbgqxwdv93jqfid2e8ga4hcw97jik361cjxlih6dhrc8p0idcspgxzbcehgokut9jv4ded1j908iidgy2livmz3k9detcjpv070kgl263i2o5xk2ljd5ibrsgszcjd3r3apgtog5ypbey9hczz',0,1),(164,'ay2e39byaczc10tid4oe',0,1),(165,'ewntyf8tukb0lkq7c973lilzpafgouewzzfebp3lhybrqlyak9xnlvuc5bvqvunbkyeminycuegxqs64nmvxr0tlxujulnutx5apvc0a3ucejxen4wfwypfxvcjkdwvhl3butihvgld8nisiwzwbxd8x3itz5sfhq6r4jo6oexnfmnaejmkkh530atkriz7dp9ybsg7p',0,1),(166,'pxf1qf3rnc8ef0rwj6sa',0,1),(167,'jqwy7xxpcedissuzo31ss0nuczl73wqji5j6vchb2hgbx6biv3qzfmkte8xmwvpaslltxddenb7tzla8ov1pudgewpqoqhd27kxy8pucpxqlriahvsbwrvdz7ckchz6udktozwlndnlw4zwucjdkxeiitoovowcdun2acpkxwfhjm8skbptgpdxfirtitmtcsugv57pq',0,1),(168,'gjspelfcba6vnrjfjnmw',0,1),(169,'x3oubebutqimxrtiyzx2gmnp3sd9pkrhiirpbggnm2h2vozsrmcrbxqtzatsevkopkb51xfhcm6kh80irsu0apsrty4h6vbdrvmwn1pcn8jhdxymbyucligw3lrq6939qqkxrkp4ji53qtxfoph9fhcaqvunq8lm7udvzzkaewxrwmhi1jtlyg0qzxtr8jn3wlec45g9',0,1),(170,'drg7s8n7q5nkk1oldsub',0,1),(171,'tkfckjgwry9d9xjok5cwyfhosjlzxosin18bxeoankbodfjc41mbxnsmcjtknrs9robdyeqt2e895rtiolm4qppdkzvocww41zjmkwgjtpqtihkpnwu38eclsxf8ueyqwu8dzy4avv0arybpabjdjdxhcyd2hwg0ntkuzrkcj5nxlwuyehxy5nio4fvscd2ifo2f2kw4',0,1),(172,'kjr543mqj7zhuaxel5yn',0,1),(173,'iiwhn5nsjpuhjj1la5kbwmqqd6nwdv2jxn8wmhzgrpzhvoq5ny99kqqfl2yewnmlc9avequrpvav4ofjgacbusybsauzwachrgxwftz7x9etnmzzeonayykwuajtq1ck9i0izzjinp76dsuriqqffz1jsxmlqjadtz7d0sjzq9n25ugn7uysk4wqblqz20wobhlzsqy3',0,1),(174,'9ead0brlglo4hc1vqiys',0,1),(175,'sn4mai2djaegeblk0qhnjztgv0wmkfymqhdyvvtv7gkd19ayg6zfeuvbnitl232nw5d4bjubnl8wwmloon9xmc9qi0zgnptugr3vejm1lvsonmyngb8dhbbtfn5tqmcdwriky2reb4blew8ixw6o15vnlklmhwjvccrdedbqpybuj3e9jvcykjokqm2klcccoffcfmzl',0,1),(176,'vsutyqkgh5ceiczhferc',0,1),(177,'uyqrxwymrbcip2g1kbz9aviva3iywjsq0gvys0cctov5bg9o3u8gichgu77zz0mcuz6u7x6bfzaz8xpi3py37d4eec0nacxu9aiub0gtw3i3t2qd0dfrz01wr4fzgraa68ddtup9tgveh0mwrdl6ygsjvcwkvdar5sz3bpxhj3zl3fq1iqtuzj4s9wwxbzwsygjmjd6z',0,1),(178,'hf5oe1rrxfyzuiouutqm',0,1),(179,'gxvot8cqqkyw5r2vq5hgioptxqmwyc21s6yztt2qyerhusirgaman26spf7a1tyay7jg20rnmam0flhsqpcb2v0ywut4xexj0qsj36q9jdf1mgm5guysax9ry0wirimyjiyh8w7ez8muizkzbxwuq32mxwl5sonzyjhcveigemgdj2dui8nzao1jq2aeh8gjpgnf0910',0,1),(180,'mratq8yrefriwnme0iqb',0,1),(181,'6udhjwemktfbfgm2hiczuhvbjhs2fre14mgm17ijxjnzam5q8mayjlyabasxvfsnaiintntkothp4t7egbip50a7vl8wjkzwgzkb1dzftdzexpsjlns3wng2oahsvbwj9pesjgr8ksrrucvanieqtqeu026laeerutc9pwhqgnxeaq97cqaspwz7hzoqohl2f63bscpv',0,1),(182,'mate74icnmxq0wi4q8zw',0,1),(183,'8umaztveaa5biy1lpnxq10yoxvasvhazibf0hw6svkaupeiumca0dxzxbfmstlf4pyn0ukoknflfgb9n39zub1aabwkdrj5m8j7usypapgep4iohlhpmjydqggvmbs2qjd6vz41pnrciw1f2mpleshwa1pc0wmy6pzlvhxmmlvc1ypxs0i3fddmdiukmi0uiawlhaxst',0,1),(184,'xg11fwvhy2ur5sjx0i8k',0,1),(185,'6yysb9x5v90obhtsmiup0simquhaktqx4dlhwhl2rokeufhwuz1fdqco3e1bdqhawch9djsvunrsdbxxctvcfskpoihkzi0ebb36etrxcxvenhkv0jjcpt51qmprgl4d08jdplwrffukik8ciwgeggkqjqzoucg4iu7lcbi2qrcgzfpncehzel6n34ovguyjzfvijfoo',0,1),(186,'fatiseqnf1aimgsbelag',0,1),(187,'yprlv00ugsokksayspnmh0qccxl0qobmy7m33cj7g1zbpjnoxn4vli0rufzd55ocqkjsztaafw93hkmsn0gzptzchgwgnqlajdmwzicdfxsycrndn9ym2fq8h4vpzrmwpghlavbdsqlhg0kioksvyfvwv3jp3jnsclsnb3qgtst1m0yeu256jci7frtk17xhesgjf1ha',0,1),(188,'feyjga5x7pubjyxlabui',0,1),(189,'0rfrqwgskukiy8ghuisju0xbs7yhyhlxhpe98a1nyp26n49uzthhoesh45lqqjrifxljxrrndcq1hrinkidf4t9urmcan4ki3paenml2gdi8caxxaei09m5vacqa9m4n1nbujdqgfg39r3ow6pislztqwjhw80dedhc3cltz6frxd5lwz7pxuxo4gq3n4lnxxumduxme',0,1),(190,'l6ojr30qr4cskei1cbic',0,1),(191,'sskgshz5syommifuapwmojazspvg4cajbushidrzhgaktpgwasgqmgv6scipedee6cosxsqvuyu20m8oiowgza5tbaq2clkqdbz3e4zehqgioeqvlekvffux2xitxgzknfudnu2cva5dbemlcjkkxcclbotvbnvs3uz0jqbrhhuzvjto5q4bk1rfyj39uba1cih244pu',0,1),(192,'zdf4znwcc0grlhhutbgs',0,1),(193,'foqjpdvdaorc1sxyrh9m44qytvdcwusp9ywjwyuo5oq3x9ubmv4yfxxlpmlkxoo7lvjsnw55zyakriamhi32zemmvrvmfuxipgxeooz3r7wd3ppq0voogthbegl4xgqojplehpyzijkk5l2drxhijj5phxzqba9iqb0fkk0nxwu7dhxsti7acmgbkzwe6ov25lohfzxw',0,1),(194,'8f8lzbqh43ckslrsovie',0,1),(195,'fqhva3hrt2qqofeimhfi0num79y4zj5wtkqhxnlavdktq92umeavabtwsy2f3ozduho8qwpuq74hjdjarqruqdaoxbmldmqxpiuacmraswfhpfk1kbborq5uxp84wglwjbreo4rzl2ahnmefcsxcecyddzxmpmfpshmoadohxkajw6jdxmghjosufchi7y98f1l5j8f5',0,1),(196,'frrr2jysdkhbw25zaf3k',0,1),(197,'q6wytru7unrcob60kqw1sa6jbdlmyzfohkgsqztwsc6jjvphap04upwzm8cvp97sqaujnj0il54aorrb3kdvwyg9xkpxi3y2xy6lxqxwqn1czblj0buh0tcxbfccttr13ljye1m0idakypmlii0bics8glkw5pe1kczmometizgelvmboqy3i94aifufbgpllvfrbzqd',0,1),(198,'4siv9hwcfcfq1ql3wp9k',0,1);
/*!40000 ALTER TABLE `phpbb_search_wordlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_search_wordmatch`
--

DROP TABLE IF EXISTS `phpbb_search_wordmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_search_wordmatch` (
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `word_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `un_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_search_wordmatch`
--

LOCK TABLES `phpbb_search_wordmatch` WRITE;
/*!40000 ALTER TABLE `phpbb_search_wordmatch` DISABLE KEYS */;
INSERT INTO `phpbb_search_wordmatch` VALUES (2,1,0),(2,2,1),(3,3,0),(3,4,1),(4,5,0),(4,6,1),(5,7,0),(5,8,1),(6,9,0),(6,10,1),(7,11,0),(7,12,1),(8,13,0),(8,14,1),(9,15,0),(9,16,1),(10,17,0),(10,18,1),(11,19,0),(11,20,1),(12,21,0),(12,22,1),(13,23,0),(13,24,1),(14,25,0),(14,26,1),(15,27,0),(15,28,1),(16,29,0),(16,30,1),(17,31,0),(17,32,1),(18,33,0),(18,34,1),(19,35,0),(19,36,1),(20,37,0),(20,38,1),(21,39,0),(21,40,1),(22,41,0),(22,42,1),(23,43,0),(23,44,1),(24,45,0),(24,46,1),(25,47,0),(25,48,1),(26,49,0),(26,50,1),(27,51,0),(27,52,1),(28,53,0),(28,54,1),(29,55,0),(29,56,1),(30,57,0),(30,58,1),(31,59,0),(31,60,1),(32,61,0),(32,62,1),(33,63,0),(33,64,1),(34,65,0),(34,66,1),(35,67,0),(35,68,1),(36,69,0),(36,70,1),(37,71,0),(37,72,1),(38,73,0),(38,74,1),(39,75,0),(39,76,1),(40,77,0),(40,78,1),(41,79,0),(41,80,1),(42,81,0),(42,82,1),(43,83,0),(43,84,1),(44,85,0),(44,86,1),(45,87,0),(45,88,1),(46,89,0),(46,90,1),(47,91,0),(47,92,1),(48,93,0),(48,94,1),(49,95,0),(49,96,1),(50,97,0),(50,98,1),(51,99,0),(51,100,1),(52,101,0),(52,102,1),(53,103,0),(53,104,1),(54,105,0),(54,106,1),(55,107,0),(55,108,1),(56,109,0),(56,110,1),(57,111,0),(57,112,1),(58,113,0),(58,114,1),(59,115,0),(59,116,1),(60,117,0),(60,118,1),(61,119,0),(61,120,1),(62,121,0),(62,122,1),(63,123,0),(63,124,1),(64,125,0),(64,126,1),(65,127,0),(65,128,1),(66,129,0),(66,130,1),(67,131,0),(67,132,1),(68,133,0),(68,134,1),(69,135,0),(69,136,1),(70,137,0),(70,138,1),(71,139,0),(71,140,1),(72,141,0),(72,142,1),(73,143,0),(73,144,1),(74,145,0),(74,146,1),(75,147,0),(75,148,1),(76,149,0),(76,150,1),(77,151,0),(77,152,1),(78,153,0),(78,154,1),(79,155,0),(79,156,1),(80,157,0),(80,158,1),(81,159,0),(81,160,1),(82,161,0),(82,162,1),(83,163,0),(83,164,1),(84,165,0),(84,166,1),(85,167,0),(85,168,1),(86,169,0),(86,170,1),(87,171,0),(87,172,1),(88,173,0),(88,174,1),(89,175,0),(89,176,1),(90,177,0),(90,178,1),(91,179,0),(91,180,1),(92,181,0),(92,182,1),(93,183,0),(93,184,1),(94,185,0),(94,186,1),(95,187,0),(95,188,1),(96,189,0),(96,190,1),(97,191,0),(97,192,1),(98,193,0),(98,194,1),(99,195,0),(99,196,1),(100,197,0),(100,198,1);
/*!40000 ALTER TABLE `phpbb_search_wordmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_sessions`
--

DROP TABLE IF EXISTS `phpbb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_sessions` (
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_last_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `session_start` int(11) unsigned NOT NULL DEFAULT '0',
  `session_time` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_page` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_sessions`
--

LOCK TABLES `phpbb_sessions` WRITE;
/*!40000 ALTER TABLE `phpbb_sessions` DISABLE KEYS */;
INSERT INTO `phpbb_sessions` VALUES ('0067ff2e5a6dbc658cb65899052377d0',1,1506041483,1506041483,1506041483,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('00daffeec787300b73f9aa6af608b716',1,1506041476,1506041476,1506041476,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('0106fa976cbc55fb1b3056b89c66fc4e',1,1506041452,1506041452,1506041452,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('011e4f2c8d23901404e80a315a430745',1,1506041464,1506041464,1506041464,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('01e4fbf612c53fcde6b1c038a591471b',1,1506041520,1506041520,1506041520,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('01e736d79d3b04217d8e3bdbaab9e8ce',2,1490371398,1506041541,1506041541,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=15',1,0,0,2),('05f2c383b7c3afcaafa44efc3c5a88bc',1,1506041516,1506041516,1506041516,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('07426427b8cbbef6a5e9b6deae90267e',2,1490371398,1506041560,1506041560,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=38',1,0,0,2),('08e316b7952c569d22f5a54961879171',2,1490371398,1506041554,1506041555,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=31',1,0,0,2),('09a75b26d77590983b04636ea22a9d5d',1,1506041448,1506041448,1506041448,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('0ab0f4d3c16c5c1943addfc98a9b5bb6',1,1506041502,1506041502,1506041502,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('0c171fcc75e08748f8a4dd175a3ec283',1,1506041495,1506041495,1506041495,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('0df1942bcbb61fc5475cd496f1bb1356',1,1506041501,1506041501,1506041501,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('101b123da706bdd71ec63438a3971169',2,1490371398,1506041535,1506041536,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=8',1,0,0,2),('10923eca2986efa182713ab2cb8eb241',2,1490371398,1506041598,1506041599,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=84',1,0,0,2),('13297b8ca075e647889e57ca31f03134',2,1490371398,1506041539,1506041540,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=13',1,0,0,2),('1556f0b2426860752a502a1d650397eb',1,1506041515,1506041515,1506041515,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('16be1bb54de02241c506b4f243e998de',2,1490371398,1506041596,1506041596,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=81',1,0,0,2),('17951913268ac6e1551b73fa01ef13d7',2,1490371398,1506041545,1506041546,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=20',1,0,0,2),('1a77bdc369f697f03b8980a81eb6abaf',1,1506041500,1506041500,1506041500,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('1e2404d7bc1d9e7c8cfe871f7676b05d',2,1490371398,1506041599,1506041599,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=85',1,0,0,2),('1e32b79b49ea32e69d7f97fe720d32e0',2,1490371398,1506041573,1506041574,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=54',1,0,0,2),('20296675a9ac74b331be03f80c7efdb2',1,1506041525,1506041525,1506041525,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('2034cce94b72a639b7d2e4a82bc7479e',2,1490371398,1506041550,1506041550,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=26',1,0,0,2),('224ec9eaeb5d98ed7e0179a94bd2ca91',1,1506041463,1506041463,1506041463,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('255183edce9972a1410b9f5ce54b13f4',1,1506041499,1506041499,1506041499,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('26de2c287f41a9a51a96e87881f255f4',1,1506041518,1506041518,1506041518,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('2716c09de17a206561b2f2cd44720081',1,1506041468,1506041468,1506041468,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('28352d0dffaaa1b48b7ffac3f93be132',2,1490371398,1506041582,1506041583,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=65',1,0,0,2),('2847f135e428b249bd8deb6c8b13939e',2,1490371398,1506041602,1506041602,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=88',1,0,0,2),('29c5e553b1288e5e41f119228b25d243',2,1490371398,1506041575,1506041575,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=56',1,0,0,2),('2a79a3b0c8ba0d7600fa749158005f40',2,1490371398,1506041609,1506041609,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=97',1,0,0,2),('2b42425981faa279d629ca6e5593cfd5',1,1506041491,1506041491,1506041491,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('2be9392d91e7e65cd6887fea974ac4bc',1,1506041524,1506041524,1506041524,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('2c008f02739500c134e2a023b571dfa3',2,1490371398,1506041589,1506041590,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=73',1,0,0,2),('2c9f267f04ab53e493a89a092fb246c3',1,1506041474,1506041474,1506041474,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('2d1ba5009a9eceb1b39a46002897e8c8',1,1506041483,1506041483,1506041483,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('2dd1ea699f42ebb2e609c73052efcd9f',2,1490371398,1506041578,1506041579,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=60',1,0,0,2),('2eee334a8a62c792ea52f8fb0c4846ab',1,1506041476,1506041476,1506041476,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('323751deb9ab420e5010a0901613d097',1,1506041492,1506041492,1506041492,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('337b49513652509fec34980c1496ffdc',1,1506041522,1506041522,1506041522,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('343637d74fccf77e9321f5de227f40b4',2,1490371398,1506041583,1506041584,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=66',1,0,0,2),('3463a61c97cafc8a40a49e1b1d83ceef',1,1506041496,1506041496,1506041496,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('34ef556154d78ce41d53db315c50eab9',2,1490371398,1506041597,1506041597,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=82',1,0,0,2),('367dbcb0dc26a4af3faca1afc2debb91',2,1490371398,1506041543,1506041543,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=17',1,0,0,2),('3bda22cbaf184060c2db6a660e91a158',1,1506041478,1506041478,1506041478,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('3cadc58bbe4b1ca469046fc752478c60',2,1490371398,1506041590,1506041590,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=74',1,0,0,2),('3d1ceca8132ddf906a5710b33e7d53c1',1,1506041458,1506041458,1506041458,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('3d5feef72c61b9abf3bac7d9bfc1b91d',2,1490371398,1506041582,1506041582,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=64',1,0,0,2),('40a948d38b261f6a90f3959d2255dda8',1,1506041458,1506041458,1506041458,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('415b33ff9143aecb16a70238d9efd752',1,1506041467,1506041467,1506041467,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('41b4df29a25f4517759c55463d8b0b76',1,1506041463,1506041463,1506041463,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('41bb8bd1a7f107ba4cebc62a303cab81',1,1506041521,1506041521,1506041521,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('432babb1a5403c58269f5a0f8c5065ca',2,1490371398,1506041579,1506041579,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=61',1,0,0,2),('4486571b3f7d59aa845bb4ee3f8de088',2,1490371398,1506041549,1506041550,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=25',1,0,0,2),('44b1554247fb1f631e4cdb2d8a00f3b8',2,1490371398,1506041612,1506041612,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=100',1,0,0,2),('45a2f52462497e994dc9bfe4b764aa9c',2,1490371398,1506041540,1506041541,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=14',1,0,0,2),('46350660fc6fe4ff13c0806ef6c29407',2,1490371398,1506041553,1506041553,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=29',1,0,0,2),('47397d757222593db72fd21d9e905b9e',1,1506041488,1506041488,1506041488,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('475af41bcca5b789b697705feb2819e2',1,1506041505,1506041505,1506041505,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('4c878cce52ee7c40d8db67b55f513314',1,1506041507,1506041507,1506041507,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('4dbb5f59d55e838517793d3e2d309aef',1,1506041481,1506041481,1506041481,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('4dfb14ace120e84710710ad15cf94aba',1,1506041475,1506041475,1506041475,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('4e34b437b0c103469396f171aa3c17bb',1,1506041442,1506041442,1506041442,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('4f97bd811ed0ac5424d8cea568264585',1,1506041501,1506041501,1506041501,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('50bdca0d2fb1966f70a9fb29d7599bdc',2,1490371398,1506041555,1506041556,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=32',1,0,0,2),('5121b06c4a86ad27d637acda7237de1c',2,1490371398,1506041592,1506041593,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=77',1,0,0,2),('5167edb048fd405665589bc99772fd30',2,1490371398,1506041531,1506041532,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=3',1,0,0,2),('51e3fe2ee6209e1082aee75658b871ca',2,1490371398,1506041595,1506041595,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=80',1,0,0,2),('536ee2f385e0d733b717434872b59924',2,1490371398,1506041572,1506041572,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=52',1,0,0,2),('56f03748037796a4b370260d10c980fa',2,1490371398,1506041610,1506041610,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=98',1,0,0,2),('57984fa6f1e8f6125514f1fa76a5dbf4',1,1506041469,1506041469,1506041469,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('57b00ac60af668f1eec5b8e313f76783',2,1490371398,1506041572,1506041573,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=53',1,0,0,2),('57ed33eec339ba524616d62e4621c6d9',2,1490371398,1506041581,1506041581,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=63',1,0,0,2),('58fb07687128a932f0b01e7d256777cd',1,1506041528,1506041528,1506041528,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('59154120a9dad2a537534a7edeac8389',2,1490371398,1506041607,1506041607,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=94',1,0,0,2),('592b6e9d39877dca9c463cd375005208',2,1490371398,1506041588,1506041589,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=72',1,0,0,2),('5976a9c2c160a5932bfe703234a062eb',2,1490371398,1506041564,1506041565,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=43',1,0,0,2),('5aa07e18f17d35f3114b7022159cf448',1,1506041504,1506041504,1506041504,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('5e03160096206d886264e2702a23e45a',1,1506041506,1506041506,1506041506,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('612c6407ecd57c442c3a77c27d563364',1,1506041479,1506041479,1506041479,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('6293ace444455d9f6817b78e96c55a62',1,1506041526,1506041526,1506041526,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('62d7854fa0a391f6a856ee148ddab29a',1,1506041484,1506041484,1506041484,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('65979bf98c78f1cb4365d54a65c99609',2,1490371398,1506041585,1506041585,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=68',1,0,0,2),('6841a28f841f26c799155dc4064ed64b',1,1506041459,1506041459,1506041459,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('685a4b73e94b39fa1eff0fc6cc9b20d1',2,1490371398,1506041533,1506041533,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=5',1,0,0,2),('68ed94585f58875180024b2979b0373b',2,1490371398,1506041604,1506041604,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=91',1,0,0,2),('6a63be4a8823f7b9348b8e1056c5b734',1,1506041497,1506041497,1506041497,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('6d88d0655945a8aaba1f49b270d58d81',2,1490371398,1506041562,1506041562,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=40',1,0,0,2),('71456ba74111801a77bf89a4ce97bd63',2,1490371398,1506041571,1506041571,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=51',1,0,0,2),('717983fa690f88e7876f2e339f9bbec4',2,1490371398,1506041536,1506041537,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=9',1,0,0,2),('71f688ec745839de851c58d9ae06e809',2,1490371398,1506041547,1506041547,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=22',1,0,0,2),('72b08a02fc06d53d416078aab0571221',2,1490371398,1506041588,1506041588,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=71',1,0,0,2),('739e7cc5bf4cf860fcc45dee2dcde040',2,1490371398,1506041552,1506041552,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=28',1,0,0,2),('76231a82625129a1c3a173151482c25e',2,1490371398,1506041577,1506041577,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=58',1,0,0,2),('767e7d24cf26c0372b9b1a8195e4b4c2',1,1506041517,1506041517,1506041517,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('7734b1df4628a5efa43bb80e4dc218ee',2,1490371398,1506041534,1506041534,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=6',1,0,0,2),('77912350e601609155104cd70394f6a6',1,1506041460,1506041460,1506041460,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('7a9af01c1ca2011d4a6a1eb55068cb81',1,1506041452,1506041452,1506041452,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('7ac7643d472c4158f9b786e3df8a4820',2,1490371398,1506041597,1506041598,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=83',1,0,0,2),('7bedfb1a7d6d48f545b4f412798a2d1e',2,1490371398,1506041565,1506041565,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=44',1,0,0,2),('81585a0abb8b1e46c26bab009b629d86',2,1490371398,1506041567,1506041568,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=47',1,0,0,2),('8166175f97da093704e417239ba992c6',2,1490371398,1506041530,1506041531,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=2',1,0,0,2),('819917833656c1de5322c1b361d02699',1,1506041495,1506041495,1506041495,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('81a2e31bb5776a76595aedaf9f841848',2,1490371398,1506041591,1506041591,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=75',1,0,0,2),('84115bb2f2d53a5358aec98d04c3866e',1,1506041443,1506041443,1506041443,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('85428b11779ed603b11236172ac956b0',2,1490371398,1506041584,1506041585,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=67',1,0,0,2),('8566f96fdc1aa2af6f80349126a66012',1,1506041453,1506041453,1506041453,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('87d4f6f542d6979cd8c5e9ccb42e63c3',2,1490371398,1506041538,1506041538,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=11',1,0,0,2),('88449da778bd44b50d03b1ddf8816db3',2,1490371398,1506041569,1506041570,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=49',1,0,0,2),('8d4f8cfead313fa95a08c37ec1314a60',1,1506041471,1506041471,1506041471,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('8e142ee2880dfe13ade50261fe95941b',1,1506041498,1506041498,1506041498,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('8e8a976247769154e3a2689e0cf89cec',2,1490371398,1506041574,1506041575,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=55',1,0,0,2),('8f7bb30dda231ef49ac9c3b3195f17f6',2,1490371398,1506041603,1506041604,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=90',1,0,0,2),('9064dcd8f18a7a973abf500759eb1f02',2,1490371398,1506041607,1506041608,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=95',1,0,0,2),('93cb3b8531a84781c03d0f7fd77a0013',1,1506041511,1506041511,1506041511,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('94691e221809e0021670bf4c92ffd97e',1,1506041447,1506041447,1506041447,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('94a6e4b45cd3c7b45914e3dc4dfd6be2',1,1506041487,1506041487,1506041487,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('95d293e9c4535d62887aad0fdb6a0a24',1,1506041527,1506041527,1506041527,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('973752e87c3496ebb475f72e34b81d0f',2,1490371398,1506041566,1506041566,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=45',1,0,0,2),('97f1372114b73a3fad66edf5c19fcdb2',1,1506041465,1506041465,1506041465,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('9ae4700f5add9c514eebf5fb5afe68fe',2,1490371398,1506041593,1506041594,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=78',1,0,0,2),('9b278e707f5b8adfde4abce892e2c770',2,1490371398,1506041542,1506041542,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=16',1,0,0,2),('9c57d905ecf145e9fbdf06e1a7e1d971',1,1506041523,1506041523,1506041523,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('9cfa76451cfbcd5495c8122a49bcf504',2,1490371398,1506041587,1506041587,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=70',1,0,0,2),('9fc9a3c59668114ccb9f2237f2848b80',2,1490371398,1506041559,1506041560,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=37',1,0,0,2),('a2939ac85b1bb5aaf72d3a58af1114d3',1,1506041485,1506041485,1506041485,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('a37f85a6d06d786790cf55d25cf690ba',2,1490371398,1506041570,1506041570,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=50',1,0,0,2),('a4913cd2047f6bebfcc72f41d7698b5c',2,1490371398,1506041539,1506041539,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=12',1,0,0,2),('a50e0ed9a09582ecd924740871c8929d',1,1506041480,1506041480,1506041480,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('a61011bcd4b4480b7ccd6a3a2cd2e271',2,1490371398,1506041558,1506041559,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=36',1,0,0,2),('a7ffd1217b1225d31eb3ec92f113eac2',1,1506041503,1506041503,1506041503,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('a856dfa0bdc754fa420b46ec53a45923',2,1490371398,1506041532,1506041533,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=4',1,0,0,2),('a906c1d9518b0b0fb212175ea64d4900',1,1506041470,1506041470,1506041470,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('abd32e26c7144d20c28e8fdcb39eb920',1,1506041509,1506041509,1506041509,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('acabc8bc7297e7760308a80bf2ee4e78',1,1506041494,1506041494,1506041494,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('af9bae958017cdc5d6bc53d76090efa0',1,1506041489,1506041489,1506041489,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('afe887d78001ba7a0f5704deff07ac60',2,1490371398,1506041558,1506041558,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=35',1,0,0,2),('b07d31b811a5b458de7e5a9ac68cf555',1,1506041489,1506041489,1506041489,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('b1b0faca7ee15500b82832e1161cc094',1,1506041455,1506041455,1506041455,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('b2aa5ccfd61d9c0ca558ac7525e391e2',1,1506041454,1506041454,1506041454,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('ba9223e5434263f19ca3fe84e5a26b70',1,1506041508,1506041508,1506041508,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('bb1bfea33348675272654ede2282ad83',2,1490371398,1506041608,1506041609,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=96',1,0,0,2),('bb4ec525b05f53d360f012c11a4a7b23',2,1490371398,1506041586,1506041586,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=69',1,0,0,2),('bc56b134a58d48a8d707eaa53e0a16fb',1,1506041477,1506041477,1506041477,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('be349ec0a086acd0faa77c2141eb0071',2,1490371398,1506041592,1506041592,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=76',1,0,0,2),('be4a14d13957f37406789d665e8000c1',2,1490371398,1506041556,1506041556,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=33',1,0,0,2),('c0961594cf795db76ce8a9f0cda4f5a7',1,1506041445,1506041445,1506041445,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('c760dda3622d2b49165f39a94f175a59',1,1506041493,1506041493,1506041493,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('c7949e8b273895ee49f72373e8f34af2',2,1490371398,1506041602,1506041603,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=89',1,0,0,2),('c80f11a27777785a3df87a1416352d61',1,1506041490,1506041490,1506041490,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('c9cacaaa14cfcd276e032146550e57fd',2,1490371398,1506041605,1506041605,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=92',1,0,0,2),('cc2123f02ef084d62347c188cbceb62d',2,1490371398,1506041600,1506041600,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=86',1,0,0,2),('cd7613c984bc93468ad18c8fcb961494',2,1490371398,1506041553,1506041554,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=30',1,0,0,2),('cdc8474ebc90f1f262e0f5f5d3169f5d',2,1490371398,1506041548,1506041548,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=23',1,0,0,2),('cdf072c74553c44996867568a508e544',2,1490371398,1506041535,1506041535,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=7',1,0,0,2),('d1fe985313dc14c2620438774976ec5f',1,1506041513,1506041513,1506041513,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d23422538c4c0facab09a601bdc8b9b6',2,1490371398,1506041562,1506041563,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=41',1,0,0,2),('d2e0948297846570acb625d990db3753',1,1506041444,1506041444,1506041444,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d338b894692194cdd7d7da3d778327c3',2,1490371398,1506041576,1506041576,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=57',1,0,0,2),('d4b7b67d3a14518722c799ed58fe39f7',1,1506041456,1506041456,1506041456,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d4e7c57fd19fa5ac2b5b769a510814cb',1,1506041486,1506041486,1506041486,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d620a428f5521facd807c8641e326312',1,1506041466,1506041466,1506041466,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d694a523f484990999a22178c81faf12',1,1506041461,1506041461,1506041461,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d78f0523cd7e346039dea389cf37cddc',1,1506041462,1506041462,1506041462,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('d798c57db06f4d64e63ad2f2e83d493d',2,1490371398,1506041563,1506041564,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=42',1,0,0,2),('d8830830a2a8b8b70314cad2735c06d6',2,1490371398,1506041577,1506041578,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=59',1,0,0,2),('daf3d0e3fed3f91142416fb08c467d5b',1,1506041508,1506041508,1506041508,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('dd33e26d564242c7f401d0643dd4b379',2,1490371398,1506041580,1506041580,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=62',1,0,0,2),('dda25742946e95f87c9d228910e0751f',1,1506041527,1506041527,1506041527,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('df744082f00f4902e02d1368be1e8c73',2,1490371398,1506041601,1506041601,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=87',1,0,0,2),('dfc7ec9598cdc01bcbe87d3db8a0cf03',1,1506041514,1506041514,1506041514,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('dff99ad497cceb98ef9cf8058c6e98a4',2,1490371398,1506041606,1506041606,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=93',1,0,0,2),('e05b5fa77ae5f877f7bc7fcad9aa3520',1,1506041472,1506041472,1506041472,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e09b668fab470e18e59a42581498e056',1,1506041512,1506041512,1506041512,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e140aa1828aa385c830c9361ea0714d1',2,1490371398,1506041544,1506041544,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=18',1,0,0,2),('e233692ac391a05dc236a0979e2bb4e2',2,1490371398,1506041557,1506041557,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=34',1,0,0,2),('e2c3eb04d7f1171e43256850c09c9401',2,1490371398,1506041548,1506041549,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=24',1,0,0,2),('e2fefdc54088a96a860d85691b07fbd4',1,1506041514,1506041514,1506041514,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e5754ac2cc1c3a080aa693e610000ce1',1,1506041519,1506041519,1506041519,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e6009bbfa36775e42ea257fb7d7b02f3',1,1506041482,1506041482,1506041482,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e7140e919b04e13a46cce57de63ebc6c',1,1506041450,1506041450,1506041450,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e7a311f9d8920a35778d3bdb913521f2',2,1490371398,1506041537,1506041537,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=10',1,0,0,2),('e84d344f713105f49ba8278cadf15f8e',2,1490371398,1506041561,1506041561,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=39',1,0,0,2),('e914b7eb8c94293f8062ae72d784cfe6',1,1506041473,1506041473,1506041473,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('e91dc0fb42e6bb97e72dcba359d3e258',2,1490371398,1506041568,1506041569,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=48',1,0,0,2),('e9c40ac4ee9a335d18c38516b192be4c',1,1506041451,1506041451,1506041451,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('edbb0f0603b829b6c07e637d30b09cce',2,1490371398,1506041551,1506041551,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=27',1,0,0,2),('ef263f60d8d5dfa210f4345d79b8fb4d',2,1490371398,1506041544,1506041545,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=19',1,0,0,2),('f06050871790bb93cbb2c387fc73b9aa',1,1506041529,1506041529,1506041529,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('f0663b06fce3f10eeac6a32c0563e8d0',1,1506041510,1506041510,1506041510,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('f39da709b5b36750b5bfaed2c00adf1b',2,1490371398,1506041567,1506041567,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=46',1,0,0,2),('f59f8394e85ba3bc02a48ce5a7171261',2,1490371398,1506041594,1506041594,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=79',1,0,0,2),('f69d855e3adf9d7aae5b46f51e9decc8',1,1506041521,1506041521,1506041521,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('fb752d433d376601380b9258e19ff9b1',2,1490371398,1506041546,1506041546,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=21',1,0,0,2),('fbc39638b07103e8da91f211b6c23312',1,1506041470,1506041470,1506041470,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('fe352ccd0c4cab6f23aebdc6bed0e7cf',1,1506041449,1506041449,1506041449,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('ff5125a83740fb58f4be907593e7e1d1',1,1506041457,1506041457,1506041457,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('ff9a4c5218a5b9319fa67b26dbaa5aa9',2,1490371398,1506041611,1506041611,'127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1','','viewtopic.php?f=2&t=99',1,0,0,2);
/*!40000 ALTER TABLE `phpbb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_sessions_keys`
--

DROP TABLE IF EXISTS `phpbb_sessions_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_sessions_keys` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_sessions_keys`
--

LOCK TABLES `phpbb_sessions_keys` WRITE;
/*!40000 ALTER TABLE `phpbb_sessions_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_sessions_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_sitelist`
--

DROP TABLE IF EXISTS `phpbb_sitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_hostname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_sitelist`
--

LOCK TABLES `phpbb_sitelist` WRITE;
/*!40000 ALTER TABLE `phpbb_sitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_sitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_smilies`
--

DROP TABLE IF EXISTS `phpbb_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `emotion` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_url` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_smilies`
--

LOCK TABLES `phpbb_smilies` WRITE;
/*!40000 ALTER TABLE `phpbb_smilies` DISABLE KEYS */;
INSERT INTO `phpbb_smilies` VALUES (1,':D','Very Happy','icon_e_biggrin.gif',15,17,1,1),(2,':-D','Very Happy','icon_e_biggrin.gif',15,17,2,1),(3,':grin:','Very Happy','icon_e_biggrin.gif',15,17,3,1),(4,':)','Smile','icon_e_smile.gif',15,17,4,1),(5,':-)','Smile','icon_e_smile.gif',15,17,5,1),(6,':smile:','Smile','icon_e_smile.gif',15,17,6,1),(7,';)','Wink','icon_e_wink.gif',15,17,7,1),(8,';-)','Wink','icon_e_wink.gif',15,17,8,1),(9,':wink:','Wink','icon_e_wink.gif',15,17,9,1),(10,':(','Sad','icon_e_sad.gif',15,17,10,1),(11,':-(','Sad','icon_e_sad.gif',15,17,11,1),(12,':sad:','Sad','icon_e_sad.gif',15,17,12,1),(13,':o','Surprised','icon_e_surprised.gif',15,17,13,1),(14,':-o','Surprised','icon_e_surprised.gif',15,17,14,1),(15,':eek:','Surprised','icon_e_surprised.gif',15,17,15,1),(16,':shock:','Shocked','icon_eek.gif',15,17,16,1),(17,':?','Confused','icon_e_confused.gif',15,17,17,1),(18,':-?','Confused','icon_e_confused.gif',15,17,18,1),(19,':???:','Confused','icon_e_confused.gif',15,17,19,1),(20,'8-)','Cool','icon_cool.gif',15,17,20,1),(21,':cool:','Cool','icon_cool.gif',15,17,21,1),(22,':lol:','Laughing','icon_lol.gif',15,17,22,1),(23,':x','Mad','icon_mad.gif',15,17,23,1),(24,':-x','Mad','icon_mad.gif',15,17,24,1),(25,':mad:','Mad','icon_mad.gif',15,17,25,1),(26,':P','Razz','icon_razz.gif',15,17,26,1),(27,':-P','Razz','icon_razz.gif',15,17,27,1),(28,':razz:','Razz','icon_razz.gif',15,17,28,1),(29,':oops:','Embarrassed','icon_redface.gif',15,17,29,1),(30,':cry:','Crying or Very Sad','icon_cry.gif',15,17,30,1),(31,':evil:','Evil or Very Mad','icon_evil.gif',15,17,31,1),(32,':twisted:','Twisted Evil','icon_twisted.gif',15,17,32,1),(33,':roll:','Rolling Eyes','icon_rolleyes.gif',15,17,33,1),(34,':!:','Exclamation','icon_exclaim.gif',15,17,34,1),(35,':?:','Question','icon_question.gif',15,17,35,1),(36,':idea:','Idea','icon_idea.gif',15,17,36,1),(37,':arrow:','Arrow','icon_arrow.gif',15,17,37,1),(38,':|','Neutral','icon_neutral.gif',15,17,38,1),(39,':-|','Neutral','icon_neutral.gif',15,17,39,1),(40,':mrgreen:','Mr. Green','icon_mrgreen.gif',15,17,40,1),(41,':geek:','Geek','icon_e_geek.gif',17,17,41,1),(42,':ugeek:','Uber Geek','icon_e_ugeek.gif',17,18,42,1);
/*!40000 ALTER TABLE `phpbb_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles`
--

DROP TABLE IF EXISTS `phpbb_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `style_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'kNg=',
  `style_parent_id` int(4) unsigned NOT NULL DEFAULT '0',
  `style_parent_tree` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_name` (`style_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_styles`
--

LOCK TABLES `phpbb_styles` WRITE;
/*!40000 ALTER TABLE `phpbb_styles` DISABLE KEYS */;
INSERT INTO `phpbb_styles` VALUES (1,'prosilver','&copy; phpBB Limited',1,'prosilver','kNg=',0,'');
/*!40000 ALTER TABLE `phpbb_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_teampage`
--

DROP TABLE IF EXISTS `phpbb_teampage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_teampage` (
  `teampage_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `teampage_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `teampage_position` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `teampage_parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`teampage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_teampage`
--

LOCK TABLES `phpbb_teampage` WRITE;
/*!40000 ALTER TABLE `phpbb_teampage` DISABLE KEYS */;
INSERT INTO `phpbb_teampage` VALUES (1,5,'',1,0),(2,4,'',2,0);
/*!40000 ALTER TABLE `phpbb_teampage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics`
--

DROP TABLE IF EXISTS `phpbb_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_topics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_poster` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_time_limit` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_first_poster_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_first_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_last_view_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poll_start` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_length` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_max_options` tinyint(4) NOT NULL DEFAULT '1',
  `poll_last_vote` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_visibility` tinyint(3) NOT NULL DEFAULT '0',
  `topic_delete_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_delete_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_delete_user` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_posts_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`),
  KEY `topic_visibility` (`topic_visibility`),
  KEY `forum_vis_last` (`forum_id`,`topic_visibility`,`topic_last_post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_topics`
--

LOCK TABLES `phpbb_topics` WRITE;
/*!40000 ALTER TABLE `phpbb_topics` DISABLE KEYS */;
INSERT INTO `phpbb_topics` VALUES (1,2,0,0,0,'Welcome to phpBB3',2,1490128344,0,0,0,0,1,'admin','AA0000',1,2,'admin','AA0000','Welcome to phpBB3',1490128344,972086460,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(2,2,0,0,0,'UBVnwkDiqe1JvUk9TaWh',2,1506041531,0,1,0,0,2,'admin','AA0000',2,2,'admin','AA0000','UBVnwkDiqe1JvUk9TaWh',1506041531,1506041531,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(3,2,0,0,0,'gy10rWgcQ7rzhQcy2Xu6',2,1506041532,0,1,0,0,3,'admin','AA0000',3,2,'admin','AA0000','gy10rWgcQ7rzhQcy2Xu6',1506041532,1506041532,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(4,2,0,0,0,'RM4L6lG38n72SPV4ahVy',2,1506041532,0,1,0,0,4,'admin','AA0000',4,2,'admin','AA0000','RM4L6lG38n72SPV4ahVy',1506041532,1506041533,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(5,2,0,0,0,'Fnl1bmCSQsdfdJlgcMA9',2,1506041533,0,1,0,0,5,'admin','AA0000',5,2,'admin','AA0000','Fnl1bmCSQsdfdJlgcMA9',1506041533,1506041533,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(6,2,0,0,0,'BVkXGaLpWeueDsgRKgjm',2,1506041534,0,1,0,0,6,'admin','AA0000',6,2,'admin','AA0000','BVkXGaLpWeueDsgRKgjm',1506041534,1506041534,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(7,2,0,0,0,'HAcQvWF9rCLLxTse9YSh',2,1506041535,0,1,0,0,7,'admin','AA0000',7,2,'admin','AA0000','HAcQvWF9rCLLxTse9YSh',1506041535,1506041535,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(8,2,0,0,0,'t6QYloTePk57FMkhDmyz',2,1506041536,0,1,0,0,8,'admin','AA0000',8,2,'admin','AA0000','t6QYloTePk57FMkhDmyz',1506041536,1506041536,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(9,2,0,0,0,'Ju6g578qzPHvBxrGvK0b',2,1506041536,0,1,0,0,9,'admin','AA0000',9,2,'admin','AA0000','Ju6g578qzPHvBxrGvK0b',1506041536,1506041537,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(10,2,0,0,0,'Ad4VqYtsi8i3gSUREE1W',2,1506041537,0,1,0,0,10,'admin','AA0000',10,2,'admin','AA0000','Ad4VqYtsi8i3gSUREE1W',1506041537,1506041537,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(11,2,0,0,0,'GPNRFWyQA6BgGwxHocX5',2,1506041538,0,1,0,0,11,'admin','AA0000',11,2,'admin','AA0000','GPNRFWyQA6BgGwxHocX5',1506041538,1506041538,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(12,2,0,0,0,'bCxP7fbmDAFw6OmrZe9Y',2,1506041539,0,1,0,0,12,'admin','AA0000',12,2,'admin','AA0000','bCxP7fbmDAFw6OmrZe9Y',1506041539,1506041539,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(13,2,0,0,0,'aO8Ge46IXIHaddvHsaEq',2,1506041540,0,1,0,0,13,'admin','AA0000',13,2,'admin','AA0000','aO8Ge46IXIHaddvHsaEq',1506041540,1506041540,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(14,2,0,0,0,'E0HWbVZF404XA3reGbKn',2,1506041541,0,1,0,0,14,'admin','AA0000',14,2,'admin','AA0000','E0HWbVZF404XA3reGbKn',1506041541,1506041541,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(15,2,0,0,0,'VSSDEyPemSn3qGNDDsxA',2,1506041541,0,1,0,0,15,'admin','AA0000',15,2,'admin','AA0000','VSSDEyPemSn3qGNDDsxA',1506041541,1506041541,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(16,2,0,0,0,'HiDhB3cpgBqTnPK6axMb',2,1506041542,0,1,0,0,16,'admin','AA0000',16,2,'admin','AA0000','HiDhB3cpgBqTnPK6axMb',1506041542,1506041542,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(17,2,0,0,0,'vFjMtQA7Be7TXJyUAiVB',2,1506041543,0,1,0,0,17,'admin','AA0000',17,2,'admin','AA0000','vFjMtQA7Be7TXJyUAiVB',1506041543,1506041543,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(18,2,0,0,0,'pRWZm0CxAW3RsmmdhFZu',2,1506041544,0,1,0,0,18,'admin','AA0000',18,2,'admin','AA0000','pRWZm0CxAW3RsmmdhFZu',1506041544,1506041544,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(19,2,0,0,0,'8hBtwWqzSr64otGwAPd4',2,1506041545,0,1,0,0,19,'admin','AA0000',19,2,'admin','AA0000','8hBtwWqzSr64otGwAPd4',1506041545,1506041545,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(20,2,0,0,0,'v0yOgnVovC7zHFTkS57A',2,1506041546,0,1,0,0,20,'admin','AA0000',20,2,'admin','AA0000','v0yOgnVovC7zHFTkS57A',1506041546,1506041546,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(21,2,0,0,0,'PFjSgG1ZTYqW5mqYKvbh',2,1506041546,0,1,0,0,21,'admin','AA0000',21,2,'admin','AA0000','PFjSgG1ZTYqW5mqYKvbh',1506041546,1506041546,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(22,2,0,0,0,'LBwrijB8QmvnQS1orZEV',2,1506041547,0,1,0,0,22,'admin','AA0000',22,2,'admin','AA0000','LBwrijB8QmvnQS1orZEV',1506041547,1506041547,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(23,2,0,0,0,'xcrS7ASeCGkc4Mt9QwGi',2,1506041548,0,1,0,0,23,'admin','AA0000',23,2,'admin','AA0000','xcrS7ASeCGkc4Mt9QwGi',1506041548,1506041548,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(24,2,0,0,0,'0scN4uSXBExSoMFu8oQ3',2,1506041549,0,1,0,0,24,'admin','AA0000',24,2,'admin','AA0000','0scN4uSXBExSoMFu8oQ3',1506041549,1506041549,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(25,2,0,0,0,'HzyfBwzcy7TNzBaMU3jI',2,1506041550,0,1,0,0,25,'admin','AA0000',25,2,'admin','AA0000','HzyfBwzcy7TNzBaMU3jI',1506041550,1506041550,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(26,2,0,0,0,'J9gILOopbomUktHcjcTJ',2,1506041550,0,1,0,0,26,'admin','AA0000',26,2,'admin','AA0000','J9gILOopbomUktHcjcTJ',1506041550,1506041551,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(27,2,0,0,0,'2pqffzcysWHvqj1HZI6q',2,1506041551,0,1,0,0,27,'admin','AA0000',27,2,'admin','AA0000','2pqffzcysWHvqj1HZI6q',1506041551,1506041551,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(28,2,0,0,0,'f00zj6P3doqr4049d7RT',2,1506041552,0,1,0,0,28,'admin','AA0000',28,2,'admin','AA0000','f00zj6P3doqr4049d7RT',1506041552,1506041552,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(29,2,0,0,0,'fe5YSo4bAkVC5echt3vd',2,1506041553,0,1,0,0,29,'admin','AA0000',29,2,'admin','AA0000','fe5YSo4bAkVC5echt3vd',1506041553,1506041553,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(30,2,0,0,0,'F7aB99YlOV1jP1aL8Xlg',2,1506041554,0,1,0,0,30,'admin','AA0000',30,2,'admin','AA0000','F7aB99YlOV1jP1aL8Xlg',1506041554,1506041554,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(31,2,0,0,0,'lPMQiSK5K0O9sPEJlDJY',2,1506041555,0,1,0,0,31,'admin','AA0000',31,2,'admin','AA0000','lPMQiSK5K0O9sPEJlDJY',1506041555,1506041555,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(32,2,0,0,0,'6g0Y5XxkGcJkH1D9Mkw6',2,1506041555,0,1,0,0,32,'admin','AA0000',32,2,'admin','AA0000','6g0Y5XxkGcJkH1D9Mkw6',1506041555,1506041556,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(33,2,0,0,0,'0JHYwzVr1gbKKwvgXPiN',2,1506041556,0,1,0,0,33,'admin','AA0000',33,2,'admin','AA0000','0JHYwzVr1gbKKwvgXPiN',1506041556,1506041556,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(34,2,0,0,0,'82VDYkYET0sub6qwlmw3',2,1506041557,0,1,0,0,34,'admin','AA0000',34,2,'admin','AA0000','82VDYkYET0sub6qwlmw3',1506041557,1506041557,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(35,2,0,0,0,'qkUDrkcr8fHsc7HYxrur',2,1506041558,0,1,0,0,35,'admin','AA0000',35,2,'admin','AA0000','qkUDrkcr8fHsc7HYxrur',1506041558,1506041558,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(36,2,0,0,0,'rdtixhVurXOL7Mx1kVun',2,1506041559,0,1,0,0,36,'admin','AA0000',36,2,'admin','AA0000','rdtixhVurXOL7Mx1kVun',1506041559,1506041559,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(37,2,0,0,0,'G6Z6sMKiCYdMob1DZKMh',2,1506041560,0,1,0,0,37,'admin','AA0000',37,2,'admin','AA0000','G6Z6sMKiCYdMob1DZKMh',1506041560,1506041560,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(38,2,0,0,0,'0duWCEM1tAShAze91SH1',2,1506041560,0,1,0,0,38,'admin','AA0000',38,2,'admin','AA0000','0duWCEM1tAShAze91SH1',1506041560,1506041560,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(39,2,0,0,0,'lF5PpI7XAHnhBUyu5KJB',2,1506041561,0,1,0,0,39,'admin','AA0000',39,2,'admin','AA0000','lF5PpI7XAHnhBUyu5KJB',1506041561,1506041561,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(40,2,0,0,0,'YlHGO8HOzUekAmx36Fg3',2,1506041562,0,1,0,0,40,'admin','AA0000',40,2,'admin','AA0000','YlHGO8HOzUekAmx36Fg3',1506041562,1506041562,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(41,2,0,0,0,'WHnMCXnjn4Qnip9gWg58',2,1506041563,0,1,0,0,41,'admin','AA0000',41,2,'admin','AA0000','WHnMCXnjn4Qnip9gWg58',1506041563,1506041563,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(42,2,0,0,0,'IHoqsliqggs9QJiQUiQ9',2,1506041564,0,1,0,0,42,'admin','AA0000',42,2,'admin','AA0000','IHoqsliqggs9QJiQUiQ9',1506041564,1506041564,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(43,2,0,0,0,'FWxrvs86JftA73YA9BhG',2,1506041564,0,1,0,0,43,'admin','AA0000',43,2,'admin','AA0000','FWxrvs86JftA73YA9BhG',1506041564,1506041565,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(44,2,0,0,0,'x8NWm6Y07bmFiIV6CvYH',2,1506041565,0,1,0,0,44,'admin','AA0000',44,2,'admin','AA0000','x8NWm6Y07bmFiIV6CvYH',1506041565,1506041565,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(45,2,0,0,0,'IPSQyEm4b003wlIBRZ0l',2,1506041566,0,1,0,0,45,'admin','AA0000',45,2,'admin','AA0000','IPSQyEm4b003wlIBRZ0l',1506041566,1506041566,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(46,2,0,0,0,'llGnmA8QvTVN81aWZm5X',2,1506041567,0,1,0,0,46,'admin','AA0000',46,2,'admin','AA0000','llGnmA8QvTVN81aWZm5X',1506041567,1506041567,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(47,2,0,0,0,'AkKCgMVtAVRyrGBKF4Gn',2,1506041568,0,1,0,0,47,'admin','AA0000',47,2,'admin','AA0000','AkKCgMVtAVRyrGBKF4Gn',1506041568,1506041568,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(48,2,0,0,0,'1jD8bTCT9OWFxYZ7j8su',2,1506041569,0,1,0,0,48,'admin','AA0000',48,2,'admin','AA0000','1jD8bTCT9OWFxYZ7j8su',1506041569,1506041569,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(49,2,0,0,0,'7zDayrj7gyTs0Z6jeykb',2,1506041569,0,1,0,0,49,'admin','AA0000',49,2,'admin','AA0000','7zDayrj7gyTs0Z6jeykb',1506041569,1506041570,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(50,2,0,0,0,'0CctVQCaXavYzBkCHOEX',2,1506041570,0,1,0,0,50,'admin','AA0000',50,2,'admin','AA0000','0CctVQCaXavYzBkCHOEX',1506041570,1506041570,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(51,2,0,0,0,'asxujIJzJ5ut7GysLHQC',2,1506041571,0,1,0,0,51,'admin','AA0000',51,2,'admin','AA0000','asxujIJzJ5ut7GysLHQC',1506041571,1506041571,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(52,2,0,0,0,'Q1DuXBe2ZEtwME0k2HdW',2,1506041572,0,1,0,0,52,'admin','AA0000',52,2,'admin','AA0000','Q1DuXBe2ZEtwME0k2HdW',1506041572,1506041572,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(53,2,0,0,0,'sQOH9XiPfgqaDHJfaB4N',2,1506041573,0,1,0,0,53,'admin','AA0000',53,2,'admin','AA0000','sQOH9XiPfgqaDHJfaB4N',1506041573,1506041573,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(54,2,0,0,0,'WQOyZ7N9zzEHcLJOmmUa',2,1506041574,0,1,0,0,54,'admin','AA0000',54,2,'admin','AA0000','WQOyZ7N9zzEHcLJOmmUa',1506041574,1506041574,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(55,2,0,0,0,'KmKoEnJNNhL6VrFdmiei',2,1506041574,0,1,0,0,55,'admin','AA0000',55,2,'admin','AA0000','KmKoEnJNNhL6VrFdmiei',1506041574,1506041575,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(56,2,0,0,0,'iexCUECUYjeuwej8Dl1g',2,1506041575,0,1,0,0,56,'admin','AA0000',56,2,'admin','AA0000','iexCUECUYjeuwej8Dl1g',1506041575,1506041575,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(57,2,0,0,0,'XDkF08wmAk1QVZ7KVW9X',2,1506041576,0,1,0,0,57,'admin','AA0000',57,2,'admin','AA0000','XDkF08wmAk1QVZ7KVW9X',1506041576,1506041576,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(58,2,0,0,0,'58PJ2hadbAMWRpS60obE',2,1506041577,0,1,0,0,58,'admin','AA0000',58,2,'admin','AA0000','58PJ2hadbAMWRpS60obE',1506041577,1506041577,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(59,2,0,0,0,'SO9ahIBDbpOG0QgrkbHp',2,1506041578,0,1,0,0,59,'admin','AA0000',59,2,'admin','AA0000','SO9ahIBDbpOG0QgrkbHp',1506041578,1506041578,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(60,2,0,0,0,'p9hLwdtHHKxhiKrsBq4S',2,1506041579,0,1,0,0,60,'admin','AA0000',60,2,'admin','AA0000','p9hLwdtHHKxhiKrsBq4S',1506041579,1506041579,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(61,2,0,0,0,'FE3MFAQEgWBAuS8hVIaF',2,1506041579,0,1,0,0,61,'admin','AA0000',61,2,'admin','AA0000','FE3MFAQEgWBAuS8hVIaF',1506041579,1506041579,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(62,2,0,0,0,'5b9kaV7g7qtgfmpUigcd',2,1506041580,0,1,0,0,62,'admin','AA0000',62,2,'admin','AA0000','5b9kaV7g7qtgfmpUigcd',1506041580,1506041580,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(63,2,0,0,0,'4K5xA5CJn5hPJrXWDG2b',2,1506041581,0,1,0,0,63,'admin','AA0000',63,2,'admin','AA0000','4K5xA5CJn5hPJrXWDG2b',1506041581,1506041581,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(64,2,0,0,0,'EhUBEKsPiMW9CrA0AMFi',2,1506041582,0,1,0,0,64,'admin','AA0000',64,2,'admin','AA0000','EhUBEKsPiMW9CrA0AMFi',1506041582,1506041582,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(65,2,0,0,0,'rJ2FHmyQdHVUfc81GVTz',2,1506041583,0,1,0,0,65,'admin','AA0000',65,2,'admin','AA0000','rJ2FHmyQdHVUfc81GVTz',1506041583,1506041583,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(66,2,0,0,0,'eAekVo2cMWwHlzGxzjSk',2,1506041584,0,1,0,0,66,'admin','AA0000',66,2,'admin','AA0000','eAekVo2cMWwHlzGxzjSk',1506041584,1506041584,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(67,2,0,0,0,'K3IKmnd4iMuNyP1T9hbe',2,1506041584,0,1,0,0,67,'admin','AA0000',67,2,'admin','AA0000','K3IKmnd4iMuNyP1T9hbe',1506041584,1506041585,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(68,2,0,0,0,'rVwZU3hLp67yLVH2pI2o',2,1506041585,0,1,0,0,68,'admin','AA0000',68,2,'admin','AA0000','rVwZU3hLp67yLVH2pI2o',1506041585,1506041585,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(69,2,0,0,0,'R7ct2WzNhLfmJ4cZlIZZ',2,1506041586,0,1,0,0,69,'admin','AA0000',69,2,'admin','AA0000','R7ct2WzNhLfmJ4cZlIZZ',1506041586,1506041586,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(70,2,0,0,0,'Yww4IBoJwVXHYxKkoTSg',2,1506041587,0,1,0,0,70,'admin','AA0000',70,2,'admin','AA0000','Yww4IBoJwVXHYxKkoTSg',1506041587,1506041587,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(71,2,0,0,0,'Yv02zwtzWP9WUcHzWLF4',2,1506041588,0,1,0,0,71,'admin','AA0000',71,2,'admin','AA0000','Yv02zwtzWP9WUcHzWLF4',1506041588,1506041588,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(72,2,0,0,0,'oZoP48Ss54vLjE7sXgdT',2,1506041589,0,1,0,0,72,'admin','AA0000',72,2,'admin','AA0000','oZoP48Ss54vLjE7sXgdT',1506041589,1506041589,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(73,2,0,0,0,'HiEjE9rQC60sd96mHtST',2,1506041590,0,1,0,0,73,'admin','AA0000',73,2,'admin','AA0000','HiEjE9rQC60sd96mHtST',1506041590,1506041590,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(74,2,0,0,0,'jQEFLjokZK6ARVfc0UYY',2,1506041590,0,1,0,0,74,'admin','AA0000',74,2,'admin','AA0000','jQEFLjokZK6ARVfc0UYY',1506041590,1506041590,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(75,2,0,0,0,'QgBHnphC0yNuhVcbPIW7',2,1506041591,0,1,0,0,75,'admin','AA0000',75,2,'admin','AA0000','QgBHnphC0yNuhVcbPIW7',1506041591,1506041591,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(76,2,0,0,0,'r9PmdfnrUdKP4A8UOCut',2,1506041592,0,1,0,0,76,'admin','AA0000',76,2,'admin','AA0000','r9PmdfnrUdKP4A8UOCut',1506041592,1506041592,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(77,2,0,0,0,'BlPFafzCGI9WTVsgilYK',2,1506041593,0,1,0,0,77,'admin','AA0000',77,2,'admin','AA0000','BlPFafzCGI9WTVsgilYK',1506041593,1506041593,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(78,2,0,0,0,'uwxPvfAPqeaG2yyLhw8p',2,1506041594,0,1,0,0,78,'admin','AA0000',78,2,'admin','AA0000','uwxPvfAPqeaG2yyLhw8p',1506041594,1506041594,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(79,2,0,0,0,'Qsrtq2oTPnxJKQBIGPb5',2,1506041594,0,1,0,0,79,'admin','AA0000',79,2,'admin','AA0000','Qsrtq2oTPnxJKQBIGPb5',1506041594,1506041594,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(80,2,0,0,0,'b8OEFoanCEUpiktsACaS',2,1506041595,0,1,0,0,80,'admin','AA0000',80,2,'admin','AA0000','b8OEFoanCEUpiktsACaS',1506041595,1506041595,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(81,2,0,0,0,'CNSgwLm3J0wIpjwNBeNj',2,1506041596,0,1,0,0,81,'admin','AA0000',81,2,'admin','AA0000','CNSgwLm3J0wIpjwNBeNj',1506041596,1506041596,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(82,2,0,0,0,'Iqp2PtHn8e0l2d5Hmuxx',2,1506041597,0,1,0,0,82,'admin','AA0000',82,2,'admin','AA0000','Iqp2PtHn8e0l2d5Hmuxx',1506041597,1506041597,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(83,2,0,0,0,'AY2E39BYaczc10tId4oE',2,1506041598,0,1,0,0,83,'admin','AA0000',83,2,'admin','AA0000','AY2E39BYaczc10tId4oE',1506041598,1506041598,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(84,2,0,0,0,'pxF1QF3rNC8Ef0rWJ6Sa',2,1506041599,0,1,0,0,84,'admin','AA0000',84,2,'admin','AA0000','pxF1QF3rNC8Ef0rWJ6Sa',1506041599,1506041599,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(85,2,0,0,0,'gjSPeLFCBA6vNrjfJnmw',2,1506041599,0,1,0,0,85,'admin','AA0000',85,2,'admin','AA0000','gjSPeLFCBA6vNrjfJnmw',1506041599,1506041599,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(86,2,0,0,0,'drg7S8n7Q5nKK1OLdsUb',2,1506041600,0,1,0,0,86,'admin','AA0000',86,2,'admin','AA0000','drg7S8n7Q5nKK1OLdsUb',1506041600,1506041600,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(87,2,0,0,0,'KjR543MQj7zhUAxEL5yN',2,1506041601,0,1,0,0,87,'admin','AA0000',87,2,'admin','AA0000','KjR543MQj7zhUAxEL5yN',1506041601,1506041601,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(88,2,0,0,0,'9eAd0bRlgLO4Hc1vqIyS',2,1506041602,0,1,0,0,88,'admin','AA0000',88,2,'admin','AA0000','9eAd0bRlgLO4Hc1vqIyS',1506041602,1506041602,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(89,2,0,0,0,'vSUTYQkGh5cEiCzHfERC',2,1506041603,0,1,0,0,89,'admin','AA0000',89,2,'admin','AA0000','vSUTYQkGh5cEiCzHfERC',1506041603,1506041603,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(90,2,0,0,0,'HF5OE1rRXFYzUIOuUtqm',2,1506041604,0,1,0,0,90,'admin','AA0000',90,2,'admin','AA0000','HF5OE1rRXFYzUIOuUtqm',1506041604,1506041604,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(91,2,0,0,0,'mRatq8yrEfRIwnMe0IQb',2,1506041604,0,1,0,0,91,'admin','AA0000',91,2,'admin','AA0000','mRatq8yrEfRIwnMe0IQb',1506041604,1506041605,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(92,2,0,0,0,'MAte74iCnMXq0wi4Q8zw',2,1506041605,0,1,0,0,92,'admin','AA0000',92,2,'admin','AA0000','MAte74iCnMXq0wi4Q8zw',1506041605,1506041605,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(93,2,0,0,0,'xG11fwvhy2uR5Sjx0I8k',2,1506041606,0,1,0,0,93,'admin','AA0000',93,2,'admin','AA0000','xG11fwvhy2uR5Sjx0I8k',1506041606,1506041606,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(94,2,0,0,0,'FatiSeqNF1aImGsbElAg',2,1506041607,0,1,0,0,94,'admin','AA0000',94,2,'admin','AA0000','FatiSeqNF1aImGsbElAg',1506041607,1506041607,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(95,2,0,0,0,'FEyJGa5X7PUBjyxlAbUi',2,1506041608,0,1,0,0,95,'admin','AA0000',95,2,'admin','AA0000','FEyJGa5X7PUBjyxlAbUi',1506041608,1506041608,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(96,2,0,0,0,'l6OjR30qr4CskEI1cBIc',2,1506041609,0,1,0,0,96,'admin','AA0000',96,2,'admin','AA0000','l6OjR30qr4CskEI1cBIc',1506041609,1506041609,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(97,2,0,0,0,'zDf4znwcC0GRLhHutBgS',2,1506041609,0,1,0,0,97,'admin','AA0000',97,2,'admin','AA0000','zDf4znwcC0GRLhHutBgS',1506041609,1506041609,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(98,2,0,0,0,'8f8lZbQh43CKsLRSoVIe',2,1506041610,0,1,0,0,98,'admin','AA0000',98,2,'admin','AA0000','8f8lZbQh43CKsLRSoVIe',1506041610,1506041610,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(99,2,0,0,0,'fRRr2JysDkhBW25Zaf3k',2,1506041611,0,1,0,0,99,'admin','AA0000',99,2,'admin','AA0000','fRRr2JysDkhBW25Zaf3k',1506041611,1506041611,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(100,2,0,0,0,'4SiV9HWcfCFq1QL3Wp9K',2,1506041612,0,1,0,0,100,'admin','AA0000',100,2,'admin','AA0000','4SiV9HWcfCFq1QL3Wp9K',1506041612,1506041612,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0);
/*!40000 ALTER TABLE `phpbb_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics_posted`
--

DROP TABLE IF EXISTS `phpbb_topics_posted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_topics_posted` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_posted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_topics_posted`
--

LOCK TABLES `phpbb_topics_posted` WRITE;
/*!40000 ALTER TABLE `phpbb_topics_posted` DISABLE KEYS */;
INSERT INTO `phpbb_topics_posted` VALUES (2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(2,6,1),(2,7,1),(2,8,1),(2,9,1),(2,10,1),(2,11,1),(2,12,1),(2,13,1),(2,14,1),(2,15,1),(2,16,1),(2,17,1),(2,18,1),(2,19,1),(2,20,1),(2,21,1),(2,22,1),(2,23,1),(2,24,1),(2,25,1),(2,26,1),(2,27,1),(2,28,1),(2,29,1),(2,30,1),(2,31,1),(2,32,1),(2,33,1),(2,34,1),(2,35,1),(2,36,1),(2,37,1),(2,38,1),(2,39,1),(2,40,1),(2,41,1),(2,42,1),(2,43,1),(2,44,1),(2,45,1),(2,46,1),(2,47,1),(2,48,1),(2,49,1),(2,50,1),(2,51,1),(2,52,1),(2,53,1),(2,54,1),(2,55,1),(2,56,1),(2,57,1),(2,58,1),(2,59,1),(2,60,1),(2,61,1),(2,62,1),(2,63,1),(2,64,1),(2,65,1),(2,66,1),(2,67,1),(2,68,1),(2,69,1),(2,70,1),(2,71,1),(2,72,1),(2,73,1),(2,74,1),(2,75,1),(2,76,1),(2,77,1),(2,78,1),(2,79,1),(2,80,1),(2,81,1),(2,82,1),(2,83,1),(2,84,1),(2,85,1),(2,86,1),(2,87,1),(2,88,1),(2,89,1),(2,90,1),(2,91,1),(2,92,1),(2,93,1),(2,94,1),(2,95,1),(2,96,1),(2,97,1),(2,98,1),(2,99,1),(2,100,1);
/*!40000 ALTER TABLE `phpbb_topics_posted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics_track`
--

DROP TABLE IF EXISTS `phpbb_topics_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_topics_track` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_topics_track`
--

LOCK TABLES `phpbb_topics_track` WRITE;
/*!40000 ALTER TABLE `phpbb_topics_track` DISABLE KEYS */;
INSERT INTO `phpbb_topics_track` VALUES (2,2,2,1506041531),(2,3,2,1506041532),(2,4,2,1506041532),(2,5,2,1506041533),(2,6,2,1506041534),(2,7,2,1506041535),(2,8,2,1506041536),(2,9,2,1506041536),(2,10,2,1506041537),(2,11,2,1506041538),(2,12,2,1506041539),(2,13,2,1506041540),(2,14,2,1506041541),(2,15,2,1506041541),(2,16,2,1506041542),(2,17,2,1506041543),(2,18,2,1506041544),(2,19,2,1506041545),(2,20,2,1506041546),(2,21,2,1506041546),(2,22,2,1506041547),(2,23,2,1506041548),(2,24,2,1506041549),(2,25,2,1506041550),(2,26,2,1506041550),(2,27,2,1506041551),(2,28,2,1506041552),(2,29,2,1506041553),(2,30,2,1506041554),(2,31,2,1506041555),(2,32,2,1506041555),(2,33,2,1506041556),(2,34,2,1506041557),(2,35,2,1506041558),(2,36,2,1506041559),(2,37,2,1506041560),(2,38,2,1506041560),(2,39,2,1506041561),(2,40,2,1506041562),(2,41,2,1506041563),(2,42,2,1506041564),(2,43,2,1506041564),(2,44,2,1506041565),(2,45,2,1506041566),(2,46,2,1506041567),(2,47,2,1506041568),(2,48,2,1506041569),(2,49,2,1506041569),(2,50,2,1506041570),(2,51,2,1506041571),(2,52,2,1506041572),(2,53,2,1506041573),(2,54,2,1506041574),(2,55,2,1506041574),(2,56,2,1506041575),(2,57,2,1506041576),(2,58,2,1506041577),(2,59,2,1506041578),(2,60,2,1506041579),(2,61,2,1506041579),(2,62,2,1506041580),(2,63,2,1506041581),(2,64,2,1506041582),(2,65,2,1506041583),(2,66,2,1506041584),(2,67,2,1506041585),(2,68,2,1506041585),(2,69,2,1506041586),(2,70,2,1506041587),(2,71,2,1506041588),(2,72,2,1506041589),(2,73,2,1506041590),(2,74,2,1506041590),(2,75,2,1506041591),(2,76,2,1506041592),(2,77,2,1506041593),(2,78,2,1506041594),(2,79,2,1506041594),(2,80,2,1506041595),(2,81,2,1506041596),(2,82,2,1506041597),(2,83,2,1506041598),(2,84,2,1506041599),(2,85,2,1506041599),(2,86,2,1506041600),(2,87,2,1506041601),(2,88,2,1506041602),(2,89,2,1506041603),(2,90,2,1506041604),(2,91,2,1506041604),(2,92,2,1506041605),(2,93,2,1506041606),(2,94,2,1506041607),(2,95,2,1506041608),(2,96,2,1506041609),(2,97,2,1506041609),(2,98,2,1506041610),(2,99,2,1506041611),(2,100,2,1506041612);
/*!40000 ALTER TABLE `phpbb_topics_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics_watch`
--

DROP TABLE IF EXISTS `phpbb_topics_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_topics_watch` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_topics_watch`
--

LOCK TABLES `phpbb_topics_watch` WRITE;
/*!40000 ALTER TABLE `phpbb_topics_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_topics_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_user_group`
--

DROP TABLE IF EXISTS `phpbb_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_user_group`
--

LOCK TABLES `phpbb_user_group` WRITE;
/*!40000 ALTER TABLE `phpbb_user_group` DISABLE KEYS */;
INSERT INTO `phpbb_user_group` VALUES (1,1,0,0),(2,2,0,0),(4,2,0,0),(5,2,1,0),(6,3,0,0),(6,4,0,0),(6,5,0,0),(6,6,0,0),(6,7,0,0),(6,8,0,0),(6,9,0,0),(6,10,0,0),(6,11,0,0),(6,12,0,0),(6,13,0,0),(6,14,0,0),(6,15,0,0),(6,16,0,0),(6,17,0,0),(6,18,0,0),(6,19,0,0),(6,20,0,0),(6,21,0,0),(6,22,0,0),(6,23,0,0),(6,24,0,0),(6,25,0,0),(6,26,0,0),(6,27,0,0),(6,28,0,0),(6,29,0,0),(6,30,0,0),(6,31,0,0),(6,32,0,0),(6,33,0,0),(6,34,0,0),(6,35,0,0),(6,36,0,0),(6,37,0,0),(6,38,0,0),(6,39,0,0),(6,40,0,0),(6,41,0,0),(6,42,0,0),(6,43,0,0),(6,44,0,0),(6,45,0,0),(6,46,0,0),(6,47,0,0),(2,48,0,0),(7,48,0,0),(2,49,0,0),(7,49,0,0),(2,50,0,0),(7,50,0,0),(2,51,0,0),(7,51,0,0),(2,52,0,0),(7,52,0,0),(2,53,0,0),(7,53,0,0),(2,54,0,0),(7,54,0,0),(2,55,0,0),(7,55,0,0),(2,56,0,0),(7,56,0,0),(2,57,0,0),(7,57,0,0),(2,58,0,0),(7,58,0,0),(2,59,0,0),(7,59,0,0),(2,60,0,0),(7,60,0,0),(2,61,0,0),(7,61,0,0),(2,62,0,0),(7,62,0,0),(2,63,0,0),(7,63,0,0),(2,64,0,0),(7,64,0,0),(2,65,0,0),(7,65,0,0),(2,66,0,0),(7,66,0,0),(2,67,0,0),(7,67,0,0),(2,68,0,0),(7,68,0,0),(2,69,0,0),(7,69,0,0),(2,70,0,0),(7,70,0,0),(2,71,0,0),(7,71,0,0),(2,72,0,0),(7,72,0,0),(2,73,0,0),(7,73,0,0),(2,74,0,0),(7,74,0,0),(2,75,0,0),(7,75,0,0),(2,76,0,0),(7,76,0,0),(2,77,0,0),(7,77,0,0),(2,78,0,0),(7,78,0,0),(2,79,0,0),(7,79,0,0),(2,80,0,0),(7,80,0,0),(2,81,0,0),(7,81,0,0),(2,82,0,0),(7,82,0,0),(2,83,0,0),(7,83,0,0),(2,84,0,0),(7,84,0,0),(2,85,0,0),(7,85,0,0),(2,86,0,0),(7,86,0,0),(2,87,0,0),(7,87,0,0),(2,88,0,0),(7,88,0,0),(2,89,0,0),(7,89,0,0),(2,90,0,0),(7,90,0,0),(2,91,0,0),(7,91,0,0),(2,92,0,0),(7,92,0,0),(2,93,0,0),(7,93,0,0),(2,94,0,0),(7,94,0,0),(2,95,0,0),(7,95,0,0),(2,96,0,0),(7,96,0,0),(2,97,0,0),(7,97,0,0),(2,98,0,0),(7,98,0,0),(2,99,0,0),(7,99,0,0),(2,100,0,0),(7,100,0,0),(2,101,0,0),(7,101,0,0),(2,102,0,0),(7,102,0,0),(2,103,0,0),(7,103,0,0),(2,104,0,0),(7,104,0,0),(2,105,0,0),(7,105,0,0),(2,106,0,0),(7,106,0,0),(2,107,0,0),(7,107,0,0),(2,108,0,0),(7,108,0,0),(2,109,0,0),(7,109,0,0),(2,110,0,0),(7,110,0,0),(2,111,0,0),(7,111,0,0),(2,112,0,0),(7,112,0,0),(2,113,0,0),(7,113,0,0),(2,114,0,0),(7,114,0,0),(2,115,0,0),(7,115,0,0),(2,116,0,0),(7,116,0,0),(2,117,0,0),(7,117,0,0),(2,118,0,0),(7,118,0,0),(2,119,0,0),(7,119,0,0),(2,120,0,0),(7,120,0,0),(2,121,0,0),(7,121,0,0),(2,122,0,0),(7,122,0,0),(2,123,0,0),(7,123,0,0),(2,124,0,0),(7,124,0,0),(2,125,0,0),(7,125,0,0),(2,126,0,0),(7,126,0,0),(2,127,0,0),(7,127,0,0),(2,128,0,0),(7,128,0,0),(2,129,0,0),(7,129,0,0),(2,130,0,0),(7,130,0,0),(2,131,0,0),(7,131,0,0),(2,132,0,0),(7,132,0,0),(2,133,0,0),(7,133,0,0),(2,134,0,0),(7,134,0,0),(2,135,0,0),(7,135,0,0),(2,136,0,0),(7,136,0,0),(2,137,0,0),(7,137,0,0),(2,138,0,0),(7,138,0,0),(2,139,0,0),(7,139,0,0),(2,140,0,0),(7,140,0,0),(2,141,0,0),(7,141,0,0),(2,142,0,0),(7,142,0,0),(2,143,0,0),(7,143,0,0),(2,144,0,0),(7,144,0,0),(2,145,0,0),(7,145,0,0),(2,146,0,0),(7,146,0,0),(2,147,0,0),(7,147,0,0);
/*!40000 ALTER TABLE `phpbb_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_user_notifications`
--

DROP TABLE IF EXISTS `phpbb_user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_user_notifications` (
  `item_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notify` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_user_notifications`
--

LOCK TABLES `phpbb_user_notifications` WRITE;
/*!40000 ALTER TABLE `phpbb_user_notifications` DISABLE KEYS */;
INSERT INTO `phpbb_user_notifications` VALUES ('notification.type.post',0,2,'notification.method.board',1),('notification.type.post',0,2,'notification.method.email',1),('notification.type.topic',0,2,'notification.method.board',1),('notification.type.topic',0,2,'notification.method.email',1),('notification.type.post',0,3,'notification.method.email',1),('notification.type.topic',0,3,'notification.method.email',1),('notification.type.post',0,4,'notification.method.email',1),('notification.type.topic',0,4,'notification.method.email',1),('notification.type.post',0,5,'notification.method.email',1),('notification.type.topic',0,5,'notification.method.email',1),('notification.type.post',0,6,'notification.method.email',1),('notification.type.topic',0,6,'notification.method.email',1),('notification.type.post',0,7,'notification.method.email',1),('notification.type.topic',0,7,'notification.method.email',1),('notification.type.post',0,8,'notification.method.email',1),('notification.type.topic',0,8,'notification.method.email',1),('notification.type.post',0,9,'notification.method.email',1),('notification.type.topic',0,9,'notification.method.email',1),('notification.type.post',0,10,'notification.method.email',1),('notification.type.topic',0,10,'notification.method.email',1),('notification.type.post',0,11,'notification.method.email',1),('notification.type.topic',0,11,'notification.method.email',1),('notification.type.post',0,12,'notification.method.email',1),('notification.type.topic',0,12,'notification.method.email',1),('notification.type.post',0,13,'notification.method.email',1),('notification.type.topic',0,13,'notification.method.email',1),('notification.type.post',0,14,'notification.method.email',1),('notification.type.topic',0,14,'notification.method.email',1),('notification.type.post',0,15,'notification.method.email',1),('notification.type.topic',0,15,'notification.method.email',1),('notification.type.post',0,16,'notification.method.email',1),('notification.type.topic',0,16,'notification.method.email',1),('notification.type.post',0,17,'notification.method.email',1),('notification.type.topic',0,17,'notification.method.email',1),('notification.type.post',0,18,'notification.method.email',1),('notification.type.topic',0,18,'notification.method.email',1),('notification.type.post',0,19,'notification.method.email',1),('notification.type.topic',0,19,'notification.method.email',1),('notification.type.post',0,20,'notification.method.email',1),('notification.type.topic',0,20,'notification.method.email',1),('notification.type.post',0,21,'notification.method.email',1),('notification.type.topic',0,21,'notification.method.email',1),('notification.type.post',0,22,'notification.method.email',1),('notification.type.topic',0,22,'notification.method.email',1),('notification.type.post',0,23,'notification.method.email',1),('notification.type.topic',0,23,'notification.method.email',1),('notification.type.post',0,24,'notification.method.email',1),('notification.type.topic',0,24,'notification.method.email',1),('notification.type.post',0,25,'notification.method.email',1),('notification.type.topic',0,25,'notification.method.email',1),('notification.type.post',0,26,'notification.method.email',1),('notification.type.topic',0,26,'notification.method.email',1),('notification.type.post',0,27,'notification.method.email',1),('notification.type.topic',0,27,'notification.method.email',1),('notification.type.post',0,28,'notification.method.email',1),('notification.type.topic',0,28,'notification.method.email',1),('notification.type.post',0,29,'notification.method.email',1),('notification.type.topic',0,29,'notification.method.email',1),('notification.type.post',0,30,'notification.method.email',1),('notification.type.topic',0,30,'notification.method.email',1),('notification.type.post',0,31,'notification.method.email',1),('notification.type.topic',0,31,'notification.method.email',1),('notification.type.post',0,32,'notification.method.email',1),('notification.type.topic',0,32,'notification.method.email',1),('notification.type.post',0,33,'notification.method.email',1),('notification.type.topic',0,33,'notification.method.email',1),('notification.type.post',0,34,'notification.method.email',1),('notification.type.topic',0,34,'notification.method.email',1),('notification.type.post',0,35,'notification.method.email',1),('notification.type.topic',0,35,'notification.method.email',1),('notification.type.post',0,36,'notification.method.email',1),('notification.type.topic',0,36,'notification.method.email',1),('notification.type.post',0,37,'notification.method.email',1),('notification.type.topic',0,37,'notification.method.email',1),('notification.type.post',0,38,'notification.method.email',1),('notification.type.topic',0,38,'notification.method.email',1),('notification.type.post',0,39,'notification.method.email',1),('notification.type.topic',0,39,'notification.method.email',1),('notification.type.post',0,40,'notification.method.email',1),('notification.type.topic',0,40,'notification.method.email',1),('notification.type.post',0,41,'notification.method.email',1),('notification.type.topic',0,41,'notification.method.email',1),('notification.type.post',0,42,'notification.method.email',1),('notification.type.topic',0,42,'notification.method.email',1),('notification.type.post',0,43,'notification.method.email',1),('notification.type.topic',0,43,'notification.method.email',1),('notification.type.post',0,44,'notification.method.email',1),('notification.type.topic',0,44,'notification.method.email',1),('notification.type.post',0,45,'notification.method.email',1),('notification.type.topic',0,45,'notification.method.email',1),('notification.type.post',0,46,'notification.method.email',1),('notification.type.topic',0,46,'notification.method.email',1),('notification.type.post',0,47,'notification.method.email',1),('notification.type.topic',0,47,'notification.method.email',1),('notification.type.post',0,48,'notification.method.email',1),('notification.type.topic',0,48,'notification.method.email',1),('notification.type.post',0,49,'notification.method.email',1),('notification.type.topic',0,49,'notification.method.email',1),('notification.type.post',0,50,'notification.method.email',1),('notification.type.topic',0,50,'notification.method.email',1),('notification.type.post',0,51,'notification.method.email',1),('notification.type.topic',0,51,'notification.method.email',1),('notification.type.post',0,52,'notification.method.email',1),('notification.type.topic',0,52,'notification.method.email',1),('notification.type.post',0,53,'notification.method.email',1),('notification.type.topic',0,53,'notification.method.email',1),('notification.type.post',0,54,'notification.method.email',1),('notification.type.topic',0,54,'notification.method.email',1),('notification.type.post',0,55,'notification.method.email',1),('notification.type.topic',0,55,'notification.method.email',1),('notification.type.post',0,56,'notification.method.email',1),('notification.type.topic',0,56,'notification.method.email',1),('notification.type.post',0,57,'notification.method.email',1),('notification.type.topic',0,57,'notification.method.email',1),('notification.type.post',0,58,'notification.method.email',1),('notification.type.topic',0,58,'notification.method.email',1),('notification.type.post',0,59,'notification.method.email',1),('notification.type.topic',0,59,'notification.method.email',1),('notification.type.post',0,60,'notification.method.email',1),('notification.type.topic',0,60,'notification.method.email',1),('notification.type.post',0,61,'notification.method.email',1),('notification.type.topic',0,61,'notification.method.email',1),('notification.type.post',0,62,'notification.method.email',1),('notification.type.topic',0,62,'notification.method.email',1),('notification.type.post',0,63,'notification.method.email',1),('notification.type.topic',0,63,'notification.method.email',1),('notification.type.post',0,64,'notification.method.email',1),('notification.type.topic',0,64,'notification.method.email',1),('notification.type.post',0,65,'notification.method.email',1),('notification.type.topic',0,65,'notification.method.email',1),('notification.type.post',0,66,'notification.method.email',1),('notification.type.topic',0,66,'notification.method.email',1),('notification.type.post',0,67,'notification.method.email',1),('notification.type.topic',0,67,'notification.method.email',1),('notification.type.post',0,68,'notification.method.email',1),('notification.type.topic',0,68,'notification.method.email',1),('notification.type.post',0,69,'notification.method.email',1),('notification.type.topic',0,69,'notification.method.email',1),('notification.type.post',0,70,'notification.method.email',1),('notification.type.topic',0,70,'notification.method.email',1),('notification.type.post',0,71,'notification.method.email',1),('notification.type.topic',0,71,'notification.method.email',1),('notification.type.post',0,72,'notification.method.email',1),('notification.type.topic',0,72,'notification.method.email',1),('notification.type.post',0,73,'notification.method.email',1),('notification.type.topic',0,73,'notification.method.email',1),('notification.type.post',0,74,'notification.method.email',1),('notification.type.topic',0,74,'notification.method.email',1),('notification.type.post',0,75,'notification.method.email',1),('notification.type.topic',0,75,'notification.method.email',1),('notification.type.post',0,76,'notification.method.email',1),('notification.type.topic',0,76,'notification.method.email',1),('notification.type.post',0,77,'notification.method.email',1),('notification.type.topic',0,77,'notification.method.email',1),('notification.type.post',0,78,'notification.method.email',1),('notification.type.topic',0,78,'notification.method.email',1),('notification.type.post',0,79,'notification.method.email',1),('notification.type.topic',0,79,'notification.method.email',1),('notification.type.post',0,80,'notification.method.email',1),('notification.type.topic',0,80,'notification.method.email',1),('notification.type.post',0,81,'notification.method.email',1),('notification.type.topic',0,81,'notification.method.email',1),('notification.type.post',0,82,'notification.method.email',1),('notification.type.topic',0,82,'notification.method.email',1),('notification.type.post',0,83,'notification.method.email',1),('notification.type.topic',0,83,'notification.method.email',1),('notification.type.post',0,84,'notification.method.email',1),('notification.type.topic',0,84,'notification.method.email',1),('notification.type.post',0,85,'notification.method.email',1),('notification.type.topic',0,85,'notification.method.email',1),('notification.type.post',0,86,'notification.method.email',1),('notification.type.topic',0,86,'notification.method.email',1),('notification.type.post',0,87,'notification.method.email',1),('notification.type.topic',0,87,'notification.method.email',1),('notification.type.post',0,88,'notification.method.email',1),('notification.type.topic',0,88,'notification.method.email',1),('notification.type.post',0,89,'notification.method.email',1),('notification.type.topic',0,89,'notification.method.email',1),('notification.type.post',0,90,'notification.method.email',1),('notification.type.topic',0,90,'notification.method.email',1),('notification.type.post',0,91,'notification.method.email',1),('notification.type.topic',0,91,'notification.method.email',1),('notification.type.post',0,92,'notification.method.email',1),('notification.type.topic',0,92,'notification.method.email',1),('notification.type.post',0,93,'notification.method.email',1),('notification.type.topic',0,93,'notification.method.email',1),('notification.type.post',0,94,'notification.method.email',1),('notification.type.topic',0,94,'notification.method.email',1),('notification.type.post',0,95,'notification.method.email',1),('notification.type.topic',0,95,'notification.method.email',1),('notification.type.post',0,96,'notification.method.email',1),('notification.type.topic',0,96,'notification.method.email',1),('notification.type.post',0,97,'notification.method.email',1),('notification.type.topic',0,97,'notification.method.email',1),('notification.type.post',0,98,'notification.method.email',1),('notification.type.topic',0,98,'notification.method.email',1),('notification.type.post',0,99,'notification.method.email',1),('notification.type.topic',0,99,'notification.method.email',1),('notification.type.post',0,100,'notification.method.email',1),('notification.type.topic',0,100,'notification.method.email',1),('notification.type.post',0,101,'notification.method.email',1),('notification.type.topic',0,101,'notification.method.email',1),('notification.type.post',0,102,'notification.method.email',1),('notification.type.topic',0,102,'notification.method.email',1),('notification.type.post',0,103,'notification.method.email',1),('notification.type.topic',0,103,'notification.method.email',1),('notification.type.post',0,104,'notification.method.email',1),('notification.type.topic',0,104,'notification.method.email',1),('notification.type.post',0,105,'notification.method.email',1),('notification.type.topic',0,105,'notification.method.email',1),('notification.type.post',0,106,'notification.method.email',1),('notification.type.topic',0,106,'notification.method.email',1),('notification.type.post',0,107,'notification.method.email',1),('notification.type.topic',0,107,'notification.method.email',1),('notification.type.post',0,108,'notification.method.email',1),('notification.type.topic',0,108,'notification.method.email',1),('notification.type.post',0,109,'notification.method.email',1),('notification.type.topic',0,109,'notification.method.email',1),('notification.type.post',0,110,'notification.method.email',1),('notification.type.topic',0,110,'notification.method.email',1),('notification.type.post',0,111,'notification.method.email',1),('notification.type.topic',0,111,'notification.method.email',1),('notification.type.post',0,112,'notification.method.email',1),('notification.type.topic',0,112,'notification.method.email',1),('notification.type.post',0,113,'notification.method.email',1),('notification.type.topic',0,113,'notification.method.email',1),('notification.type.post',0,114,'notification.method.email',1),('notification.type.topic',0,114,'notification.method.email',1),('notification.type.post',0,115,'notification.method.email',1),('notification.type.topic',0,115,'notification.method.email',1),('notification.type.post',0,116,'notification.method.email',1),('notification.type.topic',0,116,'notification.method.email',1),('notification.type.post',0,117,'notification.method.email',1),('notification.type.topic',0,117,'notification.method.email',1),('notification.type.post',0,118,'notification.method.email',1),('notification.type.topic',0,118,'notification.method.email',1),('notification.type.post',0,119,'notification.method.email',1),('notification.type.topic',0,119,'notification.method.email',1),('notification.type.post',0,120,'notification.method.email',1),('notification.type.topic',0,120,'notification.method.email',1),('notification.type.post',0,121,'notification.method.email',1),('notification.type.topic',0,121,'notification.method.email',1),('notification.type.post',0,122,'notification.method.email',1),('notification.type.topic',0,122,'notification.method.email',1),('notification.type.post',0,123,'notification.method.email',1),('notification.type.topic',0,123,'notification.method.email',1),('notification.type.post',0,124,'notification.method.email',1),('notification.type.topic',0,124,'notification.method.email',1),('notification.type.post',0,125,'notification.method.email',1),('notification.type.topic',0,125,'notification.method.email',1),('notification.type.post',0,126,'notification.method.email',1),('notification.type.topic',0,126,'notification.method.email',1),('notification.type.post',0,127,'notification.method.email',1),('notification.type.topic',0,127,'notification.method.email',1),('notification.type.post',0,128,'notification.method.email',1),('notification.type.topic',0,128,'notification.method.email',1),('notification.type.post',0,129,'notification.method.email',1),('notification.type.topic',0,129,'notification.method.email',1),('notification.type.post',0,130,'notification.method.email',1),('notification.type.topic',0,130,'notification.method.email',1),('notification.type.post',0,131,'notification.method.email',1),('notification.type.topic',0,131,'notification.method.email',1),('notification.type.post',0,132,'notification.method.email',1),('notification.type.topic',0,132,'notification.method.email',1),('notification.type.post',0,133,'notification.method.email',1),('notification.type.topic',0,133,'notification.method.email',1),('notification.type.post',0,134,'notification.method.email',1),('notification.type.topic',0,134,'notification.method.email',1),('notification.type.post',0,135,'notification.method.email',1),('notification.type.topic',0,135,'notification.method.email',1),('notification.type.post',0,136,'notification.method.email',1),('notification.type.topic',0,136,'notification.method.email',1),('notification.type.post',0,137,'notification.method.email',1),('notification.type.topic',0,137,'notification.method.email',1),('notification.type.post',0,138,'notification.method.email',1),('notification.type.topic',0,138,'notification.method.email',1),('notification.type.post',0,139,'notification.method.email',1),('notification.type.topic',0,139,'notification.method.email',1),('notification.type.post',0,140,'notification.method.email',1),('notification.type.topic',0,140,'notification.method.email',1),('notification.type.post',0,141,'notification.method.email',1),('notification.type.topic',0,141,'notification.method.email',1),('notification.type.post',0,142,'notification.method.email',1),('notification.type.topic',0,142,'notification.method.email',1),('notification.type.post',0,143,'notification.method.email',1),('notification.type.topic',0,143,'notification.method.email',1),('notification.type.post',0,144,'notification.method.email',1),('notification.type.topic',0,144,'notification.method.email',1),('notification.type.post',0,145,'notification.method.email',1),('notification.type.topic',0,145,'notification.method.email',1),('notification.type.post',0,146,'notification.method.email',1),('notification.type.topic',0,146,'notification.method.email',1),('notification.type.post',0,147,'notification.method.email',1),('notification.type.topic',0,147,'notification.method.email',1);
/*!40000 ALTER TABLE `phpbb_user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_users`
--

DROP TABLE IF EXISTS `phpbb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '3',
  `user_permissions` mediumtext COLLATE utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passchg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_email_hash` bigint(20) NOT NULL DEFAULT '0',
  `user_birthday` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastmark` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpost_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpage` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_confirm_key` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_search` int(11) unsigned NOT NULL DEFAULT '0',
  `user_warnings` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_warning` int(11) unsigned NOT NULL DEFAULT '0',
  `user_login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `user_inactive_reason` tinyint(2) NOT NULL DEFAULT '0',
  `user_inactive_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_timezone` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_dateformat` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_full_folder` int(11) NOT NULL DEFAULT '-3',
  `user_emailtime` int(11) unsigned NOT NULL DEFAULT '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_topic_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_post_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_post_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'a',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_notify_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_options` int(11) unsigned NOT NULL DEFAULT '230271',
  `user_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_sig` mediumtext COLLATE utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_jabber` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_actkey` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newpasswd` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_form_salt` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_reminded` tinyint(4) NOT NULL DEFAULT '0',
  `user_reminded_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_users`
--

LOCK TABLES `phpbb_users` WRITE;
/*!40000 ALTER TABLE `phpbb_users` DISABLE KEYS */;
INSERT INTO `phpbb_users` VALUES (1,2,1,'00000000000g13ydq8\nhwba88000000\nhwba88000000',0,'',1490128344,'Anonymous','anonymous','',0,'',0,'',0,0,0,'','',0,0,0,0,0,0,0,'en','','d M Y H:i',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,230271,'','',0,0,'','','','','','','c160d6aec20803c2',1,0,0),(2,3,5,'zik0zjzik0zjzik0zg\nhwba88000000\nzik0zjzieeps',0,'172.16.12.243',1490128344,'admin','admin','$2y$10$PAAYREakD4ADo8dIiiRgk.mOWG9JXDGzSA/rXJeKJzGe1FOUyk3ni',0,'admin@nyu.edu',35772842413,'',1490371398,0,1506041612,'install/app.php/install','',0,0,0,0,0,0,100,'en','','D M d, Y g:i a',1,1,'AA0000',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','402ecd669be46dff',0,0,0),(3,2,6,'',0,'',1490128344,'AdsBot [Google]','adsbot [google]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','37c5fe46e92b5d09',0,0,0),(4,2,6,'',0,'',1490128344,'Alexa [Bot]','alexa [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9285386f77487ad0',0,0,0),(5,2,6,'',0,'',1490128344,'Alta Vista [Bot]','alta vista [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','c0a9504fa4bf5624',0,0,0),(6,2,6,'',0,'',1490128344,'Ask Jeeves [Bot]','ask jeeves [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','2523d78ca3fccc23',0,0,0),(7,2,6,'',0,'',1490128344,'Baidu [Spider]','baidu [spider]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','94a7b2b13a454c6e',0,0,0),(8,2,6,'',0,'',1490128344,'Bing [Bot]','bing [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','2fe5ecd1a5434e30',0,0,0),(9,2,6,'',0,'',1490128344,'Exabot [Bot]','exabot [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','64103a7aa1cfe8a8',0,0,0),(10,2,6,'',0,'',1490128344,'FAST Enterprise [Crawler]','fast enterprise [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','00e57ca4ed5c0069',0,0,0),(11,2,6,'',0,'',1490128344,'FAST WebCrawler [Crawler]','fast webcrawler [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','d04d8aa797e33db9',0,0,0),(12,2,6,'',0,'',1490128344,'Francis [Bot]','francis [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','5472edcff5b1b00f',0,0,0),(13,2,6,'',0,'',1490128344,'Gigabot [Bot]','gigabot [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','0bbe4b1fd56132f0',0,0,0),(14,2,6,'',0,'',1490128344,'Google Adsense [Bot]','google adsense [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','659e718e087ce41f',0,0,0),(15,2,6,'',0,'',1490128344,'Google Desktop','google desktop','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','d92b55fe06f3e694',0,0,0),(16,2,6,'',0,'',1490128344,'Google Feedfetcher','google feedfetcher','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','fac36ddcbcbd13d4',0,0,0),(17,2,6,'',0,'',1490128344,'Google [Bot]','google [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','3abfc6f5e7cf8d17',0,0,0),(18,2,6,'',0,'',1490128344,'Heise IT-Markt [Crawler]','heise it-markt [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','ef6b218733a37d1f',0,0,0),(19,2,6,'',0,'',1490128344,'Heritrix [Crawler]','heritrix [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','1db09ec609ba1bff',0,0,0),(20,2,6,'',0,'',1490128344,'IBM Research [Bot]','ibm research [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','6aab4c9aa0fa47fc',0,0,0),(21,2,6,'',0,'',1490128344,'ICCrawler - ICjobs','iccrawler - icjobs','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','4ef25e8d19aa3018',0,0,0),(22,2,6,'',0,'',1490128345,'ichiro [Crawler]','ichiro [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','7da0d277eae1f597',0,0,0),(23,2,6,'',0,'',1490128345,'Majestic-12 [Bot]','majestic-12 [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','4afd17829227690b',0,0,0),(24,2,6,'',0,'',1490128345,'Metager [Bot]','metager [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','f92df17b29d4c173',0,0,0),(25,2,6,'',0,'',1490128345,'MSN NewsBlogs','msn newsblogs','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','815247a09fac4aec',0,0,0),(26,2,6,'',0,'',1490128345,'MSN [Bot]','msn [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','87a0152c5fdbb076',0,0,0),(27,2,6,'',0,'',1490128345,'MSNbot Media','msnbot media','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9242274ba8f17274',0,0,0),(28,2,6,'',0,'',1490128345,'Nutch [Bot]','nutch [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','2aadd8efc0731690',0,0,0),(29,2,6,'',0,'',1490128345,'Online link [Validator]','online link [validator]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','e34461f81677673d',0,0,0),(30,2,6,'',0,'',1490128345,'psbot [Picsearch]','psbot [picsearch]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','829515225f8c4dbb',0,0,0),(31,2,6,'',0,'',1490128345,'Sensis [Crawler]','sensis [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','682ced82f82670cb',0,0,0),(32,2,6,'',0,'',1490128345,'SEO Crawler','seo crawler','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','5bcc9234c99f73f5',0,0,0),(33,2,6,'',0,'',1490128345,'Seoma [Crawler]','seoma [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','1ef98325c62e3af5',0,0,0),(34,2,6,'',0,'',1490128345,'SEOSearch [Crawler]','seosearch [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','38a044936a64353b',0,0,0),(35,2,6,'',0,'',1490128345,'Snappy [Bot]','snappy [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','f943dde0beef6d44',0,0,0),(36,2,6,'',0,'',1490128345,'Steeler [Crawler]','steeler [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9a310fe620a78ac4',0,0,0),(37,2,6,'',0,'',1490128345,'Telekom [Bot]','telekom [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','716bdce423506599',0,0,0),(38,2,6,'',0,'',1490128345,'TurnitinBot [Bot]','turnitinbot [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','ce6287b8c33dd47e',0,0,0),(39,2,6,'',0,'',1490128345,'Voyager [Bot]','voyager [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','175751a545850f02',0,0,0),(40,2,6,'',0,'',1490128345,'W3 [Sitesearch]','w3 [sitesearch]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','7825b860ddbbf7f0',0,0,0),(41,2,6,'',0,'',1490128345,'W3C [Linkcheck]','w3c [linkcheck]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','b5de7ebed93e4320',0,0,0),(42,2,6,'',0,'',1490128345,'W3C [Validator]','w3c [validator]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','969fa4a9cef7b534',0,0,0),(43,2,6,'',0,'',1490128345,'YaCy [Bot]','yacy [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','3476473b4d2cc67a',0,0,0),(44,2,6,'',0,'',1490128345,'Yahoo MMCrawler [Bot]','yahoo mmcrawler [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','c51bfdfc1ada712b',0,0,0),(45,2,6,'',0,'',1490128345,'Yahoo Slurp [Bot]','yahoo slurp [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','332f72ed3bd7c37d',0,0,0),(46,2,6,'',0,'',1490128345,'Yahoo [Bot]','yahoo [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9831cb6e43e21eb6',0,0,0),(47,2,6,'',0,'',1490128345,'YahooSeeker [Bot]','yahooseeker [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','588b875f8a4d0162',0,0,0),(48,0,2,'',0,'127.0.0.1',1506041443,'user0','user0','$2y$10$sKbCtQCBIV1qp0pQdISFmeQvMgSFUKE4ZN9kbO3JNmdsB2hyZqu3W',1506041443,'user0@email.com',324665297915,'',0,1506041443,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','26127e5e0b9081e0',1,0,0),(49,0,2,'',0,'127.0.0.1',1506041444,'user1','user1','$2y$10$SL0o7b7HdaBwMNZ50Cm58u4SJcPWa/q6ytlZmznal2Xeiz5LsAa1y',1506041444,'user1@email.com',86065915,'',0,1506041444,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','5d9be7e6fb459f98',1,0,0),(50,0,2,'',0,'127.0.0.1',1506041445,'user2','user2','$2y$10$f8Ltu2bSny3jHnpAkFDDYuLWTYteQPtnphT4D9KmAldD5dahFh/2K',1506041445,'user2@email.com',258259557015,'',0,1506041445,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','51645d718df10676',1,0,0),(51,0,2,'',0,'127.0.0.1',1506041447,'user3','user3','$2y$10$43aQ6K8s73Vdz/ElycRr2OdUsiEQRXTK3DNKE2jFTL8UUXQ0ZJy0W',1506041447,'user3@email.com',148279096215,'',0,1506041447,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','3d4216af7ee3a73a',1,0,0),(52,0,2,'',0,'127.0.0.1',1506041448,'user4','user4','$2y$10$DVIOTYb/LqBQ8yjRlL.Gq.KdiQQwivUmVvEl3ZMpquDq8K2K8fXGe',1506041448,'user4@email.com',190175992115,'',0,1506041448,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','aab5af9ae1db437a',1,0,0),(53,0,2,'',0,'127.0.0.1',1506041449,'user5','user5','$2y$10$ZhYB4GTtJII44/f3Ybeg/OrGtaBjZP310FRIwqryWv4XmhMAyQH7u',1506041449,'user5@email.com',296670475315,'',0,1506041449,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','9489a4d903861d31',1,0,0),(54,0,2,'',0,'127.0.0.1',1506041450,'user6','user6','$2y$10$/ditBnV0CjbaAyLBtVpMEuC5GhcI4egVOqS9MZwKNuJQaDoU/HNQC',1506041450,'user6@email.com',69141822415,'',0,1506041450,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','a3262bcce6bf61c9',1,0,0),(55,0,2,'',0,'127.0.0.1',1506041450,'user7','user7','$2y$10$waZg/t8iTziGoLl5lItot.bz1ftubUeIfRbfJCwemsqjzpmm1BFpG',1506041450,'user7@email.com',390443307215,'',0,1506041450,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','13d05be431f41b73',1,0,0),(56,0,2,'',0,'127.0.0.1',1506041451,'user8','user8','$2y$10$IhweKrC/C1/yjgexNQ9uVe09Ea/2cpc.L04A0zcaeZ.KE5tKjl4zi',1506041451,'user8@email.com',206779992615,'',0,1506041451,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','b9e7fb8478251b20',1,0,0),(57,0,2,'',0,'127.0.0.1',1506041452,'user9','user9','$2y$10$GvvFsF.A1GorWxDDdbnV9ekSxSnQe75.XREGrsMD/MMD1LF61opfa',1506041452,'user9@email.com',313411192615,'',0,1506041452,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','10d1d72f49c7f5e5',1,0,0),(58,0,2,'',0,'127.0.0.1',1506041453,'user10','user10','$2y$10$JPSGCGAudcKWnK4slIAHsey9kZHCA476sLCnc0MM4S.BeyUv1k0yu',1506041453,'user10@email.com',184285546016,'',0,1506041453,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','1c3add9fce7adbb9',1,0,0),(59,0,2,'',0,'127.0.0.1',1506041454,'user11','user11','$2y$10$onQq0sTw5Tk1LMAsAOS2NOvGJGvjai8xUJV4U5rShJQXaKmOFl/Fi',1506041454,'user11@email.com',289153891616,'',0,1506041454,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','2eaba0d296894d84',1,0,0),(60,0,2,'',0,'127.0.0.1',1506041455,'user12','user12','$2y$10$OFY8F/shq8sXYoJlXUTaquoLoVIVaW3kHW9T2zMD3fPt/WAoHBjcq',1506041455,'user12@email.com',90144970116,'',0,1506041455,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','ece86554467b7669',1,0,0),(61,0,2,'',0,'127.0.0.1',1506041456,'user13','user13','$2y$10$d1IbNIP6NNw5uIohyxoVIuIi0WPDOLhiJ6JY9oQxoFTaghYMtE9GS',1506041456,'user13@email.com',409716944516,'',0,1506041456,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','9fb37ffd2f971a5d',1,0,0),(62,0,2,'',0,'127.0.0.1',1506041456,'user14','user14','$2y$10$FyXpAQw68Tic2BK2QRBEROlnzTdL8BIR04mN7mTpCUScHwFv/321e',1506041456,'user14@email.com',370873488616,'',0,1506041456,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','52ccf1266180376c',1,0,0),(63,0,2,'',0,'127.0.0.1',1506041457,'user15','user15','$2y$10$BcZxiG9PJNla1j5W5QeSh.ZYvoXHhtMLHu/ocfKahQZis5G9z23NS',1506041457,'user15@email.com',47815536616,'',0,1506041457,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4c74f3fa6f7317d6',1,0,0),(64,0,2,'',0,'127.0.0.1',1506041458,'user16','user16','$2y$10$I04qbmzmXZlXuydfgOL5q.UVTu7fmeHmDQXXaDz4I1BqVZxUIxoOO',1506041458,'user16@email.com',223782205516,'',0,1506041458,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','7537cebdadd8ceb1',1,0,0),(65,0,2,'',0,'127.0.0.1',1506041459,'user17','user17','$2y$10$ndBhOZKwmk5BoVf9nw8KQOM.nRwEdbBtCSGAzrSJAyrlObhuKgu02',1506041459,'user17@email.com',115636112716,'',0,1506041459,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','9b1b657f11fc55fb',1,0,0),(66,0,2,'',0,'127.0.0.1',1506041460,'user18','user18','$2y$10$RE9WUBTblK1ETxf0.xXqd.uN7d2wpGxMbzKAFCszsTQml8A984SVO',1506041460,'user18@email.com',360843657716,'',0,1506041460,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','cb9122db2d286bbc',1,0,0),(67,0,2,'',0,'127.0.0.1',1506041461,'user19','user19','$2y$10$8K9U6P23lzI5iIPhelSm0uibs9ioUHKfFje0q/sDfrf7zyIqEhBmS',1506041461,'user19@email.com',37922422516,'',0,1506041461,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','207e4853b7176878',1,0,0),(68,0,2,'',0,'127.0.0.1',1506041462,'user20','user20','$2y$10$QCSIQkm.qIrvbtCzzu2GTOrpYBV7UAbdjLcPDz9eM..JRcLZ3CjQu',1506041462,'user20@email.com',44101960416,'',0,1506041462,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','e0cef66287619839',1,0,0),(69,0,2,'',0,'127.0.0.1',1506041462,'user21','user21','$2y$10$x.l04EG9eu/iK1K5vcmY9eWpE/iGIpheGPEdgUoSaFj/NAr5FyVUy',1506041462,'user21@email.com',368729781216,'',0,1506041462,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','43cfb78726b2ad3f',1,0,0),(70,0,2,'',0,'127.0.0.1',1506041463,'user22','user22','$2y$10$8CKdmViVz2EbhXVF4DJkZO5Yqi1BIbOqczfIXUdVPJpl8DT0BiZo2',1506041463,'user22@email.com',110977563716,'',0,1506041463,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','a0d95308839afcae',1,0,0),(71,0,2,'',0,'127.0.0.1',1506041464,'user23','user23','$2y$10$MwHzu.p3fQvDvP9MaBlGK.2HQ7MipVlQTle05Ow8Qnv2kiv2WQqzi',1506041464,'user23@email.com',220902472516,'',0,1506041464,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','7598012154c861d5',1,0,0),(72,0,2,'',0,'127.0.0.1',1506041465,'user24','user24','$2y$10$fQ0oi0OffrMmJXT8ipaFIePlO0piREAcugjslnr8whD7x.Ah1sbk6',1506041465,'user24@email.com',286157192616,'',0,1506041465,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','7039b1e3114145aa',1,0,0),(73,0,2,'',0,'127.0.0.1',1506041466,'user25','user25','$2y$10$hjCQ1e0uXCjHtMefyk5GteMGzrJvT2XxbEPDn1nPTvmiSi3SWYQPK',1506041466,'user25@email.com',179717749416,'',0,1506041466,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','dd9ce9d8b00eb430',1,0,0),(74,0,2,'',0,'127.0.0.1',1506041467,'user26','user26','$2y$10$.Tj5b9ZKpAeaZVORty7XzeSUyo95LcuWGomHq0GbAFYwGqIz7xubq',1506041467,'user26@email.com',407664399116,'',0,1506041467,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','8803925ada0150e1',1,0,0),(75,0,2,'',0,'127.0.0.1',1506041467,'user27','user27','$2y$10$tsDHT6/NXQC6WLPOgrVITeO7qZAQ5tFnNhd2pU8vLu/G5c/csV0RK',1506041467,'user27@email.com',86314018316,'',0,1506041467,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','925108a5216e9939',1,0,0),(76,0,2,'',0,'127.0.0.1',1506041468,'user28','user28','$2y$10$oWudcuOG0KvT2lPQv.xQDu19/XKnKkLd6jlWVrPnNFtmXRDN/mx6K',1506041468,'user28@email.com',269343476916,'',0,1506041468,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','71c6598a9dfff932',1,0,0),(77,0,2,'',0,'127.0.0.1',1506041469,'user29','user29','$2y$10$FFZ7JpkFdzi81C1VZNIgEu6NplKjsr0gNx2zi5cXLnT1nY2XsJHf2',1506041469,'user29@email.com',162767316916,'',0,1506041469,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','e80a259ac975cc35',1,0,0),(78,0,2,'',0,'127.0.0.1',1506041470,'user30','user30','$2y$10$4r2HgTemrmJ71UKNS4qP8uxqPARLqdzWwd6s6CZlwPiNBxC45eW/q',1506041470,'user30@email.com',217973573916,'',0,1506041470,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','f798a33a9b206ebd',1,0,0),(79,0,2,'',0,'127.0.0.1',1506041471,'user31','user31','$2y$10$L6vOqlZzNwPvkq.JK7A4l./5swT5ONO7ZBdhf/ZflRoFXSon4AOy2',1506041471,'user31@email.com',108022975516,'',0,1506041471,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','bac44419ca4d0c90',1,0,0),(80,0,2,'',0,'127.0.0.1',1506041472,'user32','user32','$2y$10$LBKwjhDQzcXMtIsdrIWai.lZ976n1ULGRWQZGh9o4acf3JvirJC1W',1506041472,'user32@email.com',364908377016,'',0,1506041472,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','6de122df4adeee10',1,0,0),(81,0,2,'',0,'127.0.0.1',1506041473,'user33','user33','$2y$10$M1JmgCMSwjF4m8f7U2seUOI/yYBez1EsrZ6ZOe.QTJo1DDJJW3Ada',1506041473,'user33@email.com',40358879416,'',0,1506041473,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','02f631aad8439720',1,0,0),(82,0,2,'',0,'127.0.0.1',1506041474,'user34','user34','$2y$10$7xqRKPF0lR8Z7eMDxPdcr.XRvW0tnta6i1rnL/hG0T.Ayw4R8/5i6',1506041474,'user34@email.com',82557829716,'',0,1506041474,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','1571441c2553cca9',1,0,0),(83,0,2,'',0,'127.0.0.1',1506041474,'user35','user35','$2y$10$bN0tRg.oLM659Y9DSa2EKOVO7HH7vt74EFaIztINhNLlrsVK5xY0S',1506041474,'user35@email.com',403882316116,'',0,1506041474,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','3aab71cb7dea1f22',1,0,0),(84,0,2,'',0,'127.0.0.1',1506041475,'user36','user36','$2y$10$q8zgKt3yTz25pDq3NGolXuVfZW6OAXuLjpOSeyDqMOab1JriXNpry',1506041475,'user36@email.com',176750053616,'',0,1506041475,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4b61b1ae1035094e',1,0,0),(85,0,2,'',0,'127.0.0.1',1506041476,'user37','user37','$2y$10$.Vw.GA1FJTUf.gsFhXVGROq6l/lUMCjQzEoFH8pC21lROshQHt.4a',1506041476,'user37@email.com',283267615216,'',0,1506041476,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','8432e38286f051a0',1,0,0),(86,0,2,'',0,'127.0.0.1',1506041477,'user38','user38','$2y$10$2mndBW3KtgH51xLEv5h8Lun6GSvNlRGOxDHE1dAxc93lHghQkBiMC',1506041477,'user38@email.com',99298559816,'',0,1506041477,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','734ed6a39782a22b',1,0,0),(87,0,2,'',0,'127.0.0.1',1506041478,'user39','user39','$2y$10$YCHhENOZHvPbfKJ9JqdmzeFsLw4/7pS.rTFsMCaEC9Ugdlfsdf33y',1506041478,'user39@email.com',420486303816,'',0,1506041478,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','5705f901b76ca869',1,0,0),(88,0,2,'',0,'127.0.0.1',1506041479,'user40','user40','$2y$10$TDbi79ikV9FlkUTJbZtYP.uMhalST1a68QSmQaN1N/E46XODNY/oG',1506041479,'user40@email.com',411807160416,'',0,1506041479,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','1db483b52519417e',1,0,0),(89,0,2,'',0,'127.0.0.1',1506041480,'user41','user41','$2y$10$59zPfW.MOIAfafEb1VVtduDRzg0fqgXfVplo5VwErWZNyWTlf4rre',1506041480,'user41@email.com',88880510816,'',0,1506041480,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','e1a74ef9a1358cc7',1,0,0),(90,0,2,'',0,'127.0.0.1',1506041481,'user42','user42','$2y$10$Igwwb4RxikzZo/5H1SSBGuxLDwuNzI69I/HmE1HfnQN9agp8lL0ky',1506041481,'user42@email.com',290406014916,'',0,1506041481,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','8568bff11c17e17d',1,0,0),(91,0,2,'',0,'127.0.0.1',1506041481,'user43','user43','$2y$10$nZRUoc3iLJdsViO4.GSxTuZRIY.XSftvgHqrbTg3Iklsyb2XT.xJe',1506041481,'user43@email.com',182181458116,'',0,1506041481,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4ad1f78509247df0',1,0,0),(92,0,2,'',0,'127.0.0.1',1506041482,'user44','user44','$2y$10$bj877heOxk1ZjYcgpFESW.OJuLg8xNQwkky6GioJqi7S.w1d14.ai',1506041482,'user44@email.com',116901343016,'',0,1506041482,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','fc2b1aac52833a51',1,0,0),(93,0,2,'',0,'127.0.0.1',1506041483,'user45','user45','$2y$10$.z7W2lq6u0xlTfDDtxpnuOncYO3ZKPx34aBUoo/YgmVOI.FAp513C',1506041483,'user45@email.com',221691224616,'',0,1506041483,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','954be4c5909d9b1b',1,0,0),(94,0,2,'',0,'127.0.0.1',1506041484,'user46','user46','$2y$10$KyoW6X5jfINXHT3Vekd8FOlW9M6Jm.LR5z5SuMj4Ii6eQobN1ivSC',1506041484,'user46@email.com',49918859916,'',0,1506041484,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4b6d97a70520eb92',1,0,0),(95,0,2,'',0,'127.0.0.1',1506041485,'user47','user47','$2y$10$esPFhaSO.BoDkuolxqEb5OBcTZZQI6xrrbGYu2.pHxdZvEJ1plVNS',1506041485,'user47@email.com',369622136716,'',0,1506041485,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','146ab558798d11a3',1,0,0),(96,0,2,'',0,'127.0.0.1',1506041486,'user48','user48','$2y$10$pDV6ejiH8UWV0RVYrmHD7eJgmXu9/blxt6EIUeZJ/ZkbLhWupyZj2',1506041486,'user48@email.com',133740350516,'',0,1506041486,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','9b4eb692be3bda90',1,0,0),(97,0,2,'',0,'127.0.0.1',1506041487,'user49','user49','$2y$10$i3q4H5VUS5f.Ef.iawoq5eLRjcscFprp3PG6CiZm9ErYdnJd.WWv2',1506041487,'user49@email.com',238616363316,'',0,1506041487,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','81863285079fc6f8',1,0,0),(98,0,2,'',0,'127.0.0.1',1506041487,'user50','user50','$2y$10$/T4VZPbZaFFFMXV1cq.DE.9fSMychPD5WTzU1RGADcMF81vRC3nVK',1506041487,'user50@email.com',185922492316,'',0,1506041487,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','c5eb040b6e5adff0',1,0,0),(99,0,2,'',0,'127.0.0.1',1506041488,'user51','user51','$2y$10$BbwTNJ9BBQBsfSwLKqlntew/ggqRxoaFJh4orMGGMvoUtE/g6m2Za',1506041488,'user51@email.com',294226191516,'',0,1506041488,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','a4b3bf51d7f57046',1,0,0),(100,0,2,'',0,'127.0.0.1',1506041489,'user52','user52','$2y$10$NU5JVpj7G.MrqP.4UXhrZO3PsLSuZIc2v1nvVqn0BEB49qMybmkqG',1506041489,'user52@email.com',91837148216,'',0,1506041489,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','7a90eebfd49dd146',1,0,0),(101,0,2,'',0,'127.0.0.1',1506041490,'user53','user53','$2y$10$OQnqchlhGOeXn5k3NBeTxeBkRmGwAxjLRvN1L2lZAbkROg7H9ktN6',1506041490,'user53@email.com',414737289016,'',0,1506041490,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4ff329050f3cf1b4',1,0,0),(102,0,2,'',0,'127.0.0.1',1506041491,'user54','user54','$2y$10$QbbisIvjV8OSMeNlWRGWou9k3YtXgp.3iMEkNvmK.6hObNi4sFV9S',1506041491,'user54@email.com',372512943316,'',0,1506041491,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','cb5c263e963c0c8f',1,0,0),(103,0,2,'',0,'127.0.0.1',1506041492,'user55','user55','$2y$10$fSd9HRWsVbxMhB688NwDeucgWOq3HzLWMBlHFKkmg4.1ZaHWsdy/W',1506041492,'user55@email.com',52888604116,'',0,1506041492,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4a87ab3cf5cca48e',1,0,0),(104,0,2,'',0,'127.0.0.1',1506041493,'user56','user56','$2y$10$k0DEvFY1DECQp0zNv917COr1JPXYvVO24jzprQjc6k6kfYlB/cbjm',1506041493,'user56@email.com',225472079216,'',0,1506041493,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','afa7ca96651af97f',1,0,0),(105,0,2,'',0,'127.0.0.1',1506041494,'user57','user57','$2y$10$5igOVKyq1.D9an2s.i0SXe3gUj1wQRNu5TzYFmbUyI1cStTgidNgq',1506041494,'user57@email.com',120655484016,'',0,1506041494,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','2a4fe657681a6e72',1,0,0),(106,0,2,'',0,'127.0.0.1',1506041494,'user58','user58','$2y$10$PpQEj9GaJdUDnxHeH0Su7.ftzc1GavyuYwENFvB/YsCm159UfK97a',1506041494,'user58@email.com',355797507016,'',0,1506041494,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','346a94d25f90a8b0',1,0,0),(107,0,2,'',0,'127.0.0.1',1506041495,'user59','user59','$2y$10$uMab/M5/mURoU.NTXVJuXOozNhuKMdXaXUsz2Kc2d7fQYnipvcIwu',1506041495,'user59@email.com',36259324616,'',0,1506041495,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4344e5605398524b',1,0,0),(108,0,2,'',0,'127.0.0.1',1506041496,'user60','user60','$2y$10$vTdwghLn0kHp1Q/fcB2W2OzX0Ej1R.INJcVy0BepBFiHYfJD1OJA.',1506041496,'user60@email.com',42463018716,'',0,1506041496,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4e9eb5f475bb90db',1,0,0),(109,0,2,'',0,'127.0.0.1',1506041497,'user61','user61','$2y$10$QvCytIePDfKYhuKjipWhuevr.tzHYiUB.m0TZzsnde/yxbn2ml3d.',1506041497,'user61@email.com',363656202716,'',0,1506041497,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','2b591ba627bb0b81',1,0,0),(110,0,2,'',0,'127.0.0.1',1506041498,'user62','user62','$2y$10$JmESOYKExjFSlqtj1Ba3/Olz8qzbKZvGoB5QHxxAZywxrVJqCRAem',1506041498,'user62@email.com',109287383416,'',0,1506041498,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','93d2c9123ac4ab4d',1,0,0),(111,0,2,'',0,'127.0.0.1',1506041499,'user63','user63','$2y$10$yQRUCTKZouFDD5FLQiDAo.94kw4BxDZInEsOoeGogdpWScNY.Uyr6',1506041499,'user63@email.com',215883409016,'',0,1506041499,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','c09cba97e35adadf',1,0,0),(112,0,2,'',0,'127.0.0.1',1506041499,'user64','user64','$2y$10$fL6N3mL4iTHzwmpeVtugee0/x9eyjjXJi33ec3yWfPr7XU9ZeP44C',1506041499,'user64@email.com',284518916116,'',0,1506041499,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','019db74f4f185852',1,0,0),(113,0,2,'',0,'127.0.0.1',1506041500,'user65','user65','$2y$10$hDZxLdGdOr2Hxl7ySyk6Xu6sy8.shnsTUCIjjKztKeZ8qSsTDso6q',1506041500,'user65@email.com',174646781716,'',0,1506041500,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4e4414ef84ba36ea',1,0,0),(114,0,2,'',0,'127.0.0.1',1506041501,'user66','user66','$2y$10$.ZapiFHuXVjLRHxtWFAx0e2NWL3LdM3pZ4R/5TRkkidlwC7QJNscK',1506041501,'user66@email.com',405973348016,'',0,1506041501,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','112905f06949013c',1,0,0),(115,0,2,'',0,'127.0.0.1',1506041502,'user67','user67','$2y$10$lg7QcOnxwaRUBcJR9nqCsOFw/Q6vMuyd/RJFGkqJTLGId5z3Ff6JS',1506041502,'user67@email.com',81292548016,'',0,1506041502,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','5e244306db51a1a2',1,0,0),(116,0,2,'',0,'127.0.0.1',1506041503,'user68','user68','$2y$10$uiYBRtzV4O7eHrafcjVcZu.glX43HTOx4fVm65P01VvQ5e/IA93Le',1506041503,'user68@email.com',274390807816,'',0,1506041503,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','0b0ca00af6c6e544',1,0,0),(117,0,2,'',0,'127.0.0.1',1506041504,'user69','user69','$2y$10$.uKUIl0gdcrDxi/o3b7fLe09wDgE3ZpMFr60Ke/SIhYWxJvpNWtcS',1506041504,'user69@email.com',164432516616,'',0,1506041504,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','63944ca8c7801f97',1,0,0),(118,0,2,'',0,'127.0.0.1',1506041505,'user70','user70','$2y$10$SXee6v4n.jlVI3GkbIb2kuCaoq/PXYhWQihcP7oqyMbnmw5th.JAy',1506041505,'user70@email.com',219638061216,'',0,1506041505,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','532ffd359af5088f',1,0,0),(119,0,2,'',0,'127.0.0.1',1506041506,'user71','user71','$2y$10$38hfcMxDM8lJyfC9L4pt0ur2wzYF.pvlDGMxq8ruXqfBdHN0597Py',1506041506,'user71@email.com',113067725216,'',0,1506041506,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','6f2732e252733c83',1,0,0),(120,0,2,'',0,'127.0.0.1',1506041506,'user72','user72','$2y$10$L5Pbe5zGu9U0Bov446oEHuxWAYQsNKHHskPKsLsQQRG9CfbLK7emi',1506041506,'user72@email.com',366625638916,'',0,1506041506,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','f3b32ca61e51be0f',1,0,0),(121,0,2,'',0,'127.0.0.1',1506041507,'user73','user73','$2y$10$soVXrACL3pVBJehwUBkdy.gU/6SotaTXlYqzrTALMxJUJ0Po0I1ze',1506041507,'user73@email.com',45354131716,'',0,1506041507,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','40a3cd5b128cb441',1,0,0),(122,0,2,'',0,'127.0.0.1',1506041508,'user74','user74','$2y$10$M2ETymqkh0aJQcc1fL.W5eF2ayMLjnLqNnJ/b/hEdpY7/mPdKUR5i',1506041508,'user74@email.com',84222983016,'',0,1506041508,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','f26a7f73778af693',1,0,0),(123,0,2,'',0,'127.0.0.1',1506041509,'user75','user75','$2y$10$rVAcCL8rsbB.iPgay4a9qeUQgSInTffrxqwkAPio1KtFQjAiV9vEq',1506041509,'user75@email.com',408929677416,'',0,1506041509,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','b35f3f7fd6af4196',1,0,0),(124,0,2,'',0,'127.0.0.1',1506041510,'user76','user76','$2y$10$Abah5GdGiRC1YxLEnucmruCMkfMfFVcDjGbLELbhfQTzrpA5ETKte',1506041510,'user76@email.com',178466445516,'',0,1506041510,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','92f99010847c6b9d',1,0,0),(125,0,2,'',0,'127.0.0.1',1506041511,'user77','user77','$2y$10$KIGSDBjkCbBa6lSh52IktuUrGahTANBuZV22T44NYJgEQ2NN.G3CC',1506041511,'user77@email.com',288260461516,'',0,1506041511,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','2474bcb588285907',1,0,0),(126,0,2,'',0,'127.0.0.1',1506041512,'user78','user78','$2y$10$z7AifwBbr6dbR3gz.pQUnOG5uOoq7CgoOIpLXFDHKSpQQYZ/XxFA6',1506041512,'user78@email.com',94227520116,'',0,1506041512,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','a8ca893c396d3491',1,0,0),(127,0,2,'',0,'127.0.0.1',1506041512,'user79','user79','$2y$10$jRT85VgNML17amrecj7GAOGjzaQhtCg/2YNKuemADK4VTv6YJ79ti',1506041512,'user79@email.com',418848083316,'',0,1506041512,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','921da20e983f6f10',1,0,0),(128,0,2,'',0,'127.0.0.1',1506041513,'user80','user80','$2y$10$1fW5BC1sG4iTs7zB6YP2xOicgQLV72L0cYWthGCA.cGSBMLj4lbpS',1506041513,'user80@email.com',403482334916,'',0,1506041513,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','d02aa17951a1a1a8',1,0,0),(129,0,2,'',0,'127.0.0.1',1506041514,'user81','user81','$2y$10$L23sliDNeBenV1vuJPwgCOsBhiIo7yyqOQz1GGlTqaPwk2G8j1ANS',1506041514,'user81@email.com',83783563716,'',0,1506041514,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','9b431bde56c25215',1,0,0),(130,0,2,'',0,'127.0.0.1',1506041515,'user82','user82','$2y$10$1CeRlBQbtKmCCB0EbTiJL.imI87OIlGEet0qf7FYC5CJrZV2HFlIy',1506041515,'user82@email.com',281976766816,'',0,1506041515,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','58b023074ffe2d54',1,0,0),(131,0,2,'',0,'127.0.0.1',1506041516,'user83','user83','$2y$10$D49cVe02xD7jgQNfGqV0jeZLiC.PF0awVm8GmLxZP82RKrGJig3Em',1506041516,'user83@email.com',177188933216,'',0,1506041516,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','5b2f322a9cea528b',1,0,0),(132,0,2,'',0,'127.0.0.1',1506041517,'user84','user84','$2y$10$mUTtuMpJ/fSdMDwTzBiFpeJf0WEVaGqB1z4WKZmRzsquEoTsQ3Hwu',1506041517,'user84@email.com',108474962316,'',0,1506041517,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','db7ae16ed4f7e4b8',1,0,0),(133,0,2,'',0,'127.0.0.1',1506041518,'user85','user85','$2y$10$kHMQH7lyrpctD3NgVo44ze8dLUi7SpjQYH1op00YyoZl3tLk1t1Ve',1506041518,'user85@email.com',216695832716,'',0,1506041518,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','090b46918a808400',1,0,0),(134,0,2,'',0,'127.0.0.1',1506041519,'user86','user86','$2y$10$21o5f1DkDeD7WZnf3hfhYuKhFNKPbMPd2NWuH0OTE4wd8nTi9O3Va',1506041519,'user86@email.com',41597720616,'',0,1506041519,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','e4d6e3b92da0ead8',1,0,0),(135,0,2,'',0,'127.0.0.1',1506041519,'user87','user87','$2y$10$U9achIaHPW2IBGHiwXehVOJ74k1Xwd1uPlt8CrMwtSLdTR0.t3BNC',1506041519,'user87@email.com',364521503016,'',0,1506041519,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','c2f300e5c9e6715c',1,0,0),(136,0,2,'',0,'127.0.0.1',1506041520,'user88','user88','$2y$10$UEs5win89CC0mViPuC28x.ozo86TMU5M/K1hYk9tm1vFxS9PW60te',1506041520,'user88@email.com',125392638416,'',0,1506041520,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','141775d88e3949a9',1,0,0),(137,0,2,'',0,'127.0.0.1',1506041521,'user89','user89','$2y$10$g6JUtWtQ7ujKar.JvpcVX.2Us357rTimxqPhdWb6ns9dmn6fP6aZm',1506041521,'user89@email.com',233542302416,'',0,1506041521,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','11db3527fa2d75e0',1,0,0),(138,0,2,'',0,'127.0.0.1',1506041522,'user90','user90','$2y$10$r2c7bGBAUqXrus6NPMcK/OC/PcasP7BfDPE0huSEMdzVtZzZNIQkG',1506041522,'user90@email.com',180956591416,'',0,1506041522,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','c354e472f679857f',1,0,0),(139,0,2,'',0,'127.0.0.1',1506041523,'user91','user91','$2y$10$mnAIfGv87gLKJSkAPPQsP.4zro29SzM9hFeir2BQ27DMBxlhSXOWe',1506041523,'user91@email.com',285770319416,'',0,1506041523,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','a92e5183d5daae66',1,0,0),(140,0,2,'',0,'127.0.0.1',1506041524,'user92','user92','$2y$10$XZCXsbDDZvsqqcngWdAlnuG1jrR8p5OHBXebqF71yS45.7kskMYMG',1506041524,'user92@email.com',86766005916,'',0,1506041524,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','aa525443d51ffa18',1,0,0),(141,0,2,'',0,'127.0.0.1',1506041525,'user93','user93','$2y$10$9K0duajEzAV62hx1IYH3fOcfW8ONT//iVSO2laSCWceBoxUHKZYqS',1506041525,'user93@email.com',406386658716,'',0,1506041525,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','9bb94c10b9c0e527',1,0,0),(142,0,2,'',0,'127.0.0.1',1506041525,'user94','user94','$2y$10$jUsG/xuxWirhNReHTCQkTenXAF62S/41ZmmoAdeQRrmVZQZJYBzj2',1506041525,'user94@email.com',367438933616,'',0,1506041525,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','f03cec9c232c37cc',1,0,0),(143,0,2,'',0,'127.0.0.1',1506041526,'user95','user95','$2y$10$75mdr/caZAZPMggEM6xSVe.GOHU.7b2SRMuByuJh0V5pXLeqshFMS',1506041526,'user95@email.com',44540840816,'',0,1506041526,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','ab986ba115d4b123',1,0,0),(144,0,2,'',0,'127.0.0.1',1506041527,'user96','user96','$2y$10$ZzrhWAfxnCU1irO8NovqF.UsTw937MW6umK9BgRFtepL0JxkV0u6m',1506041527,'user96@email.com',220502492116,'',0,1506041527,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','774303400a16a008',1,0,0),(145,0,2,'',0,'127.0.0.1',1506041528,'user97','user97','$2y$10$paZXvyBSuRpNtd8uTXHVRezL93Yjg1dAclJT1p68WQ29iild74vji',1506041528,'user97@email.com',112203298516,'',0,1506041528,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','92634fbd0774c018',1,0,0),(146,0,2,'',0,'127.0.0.1',1506041529,'user98','user98','$2y$10$LQ8cLfn61H8BuziIclQq/escHxPPtYgp2zDPDIiKmPWkVNRllyuQK',1506041529,'user98@email.com',350802166316,'',0,1506041529,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','6711e88cfeba1e36',1,0,0),(147,0,2,'',0,'127.0.0.1',1506041530,'user99','user99','$2y$10$Ya1gofoDHMvv0AAUdlIH.OPn5Csxu.jC4/Nr9.P//lioA27XUDMCy',1506041530,'user99@email.com',27832892716,'',0,1506041530,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','d6cf22863f4cc650',1,0,0);
/*!40000 ALTER TABLE `phpbb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_warnings`
--

DROP TABLE IF EXISTS `phpbb_warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `log_id` int(10) unsigned NOT NULL DEFAULT '0',
  `warning_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_warnings`
--

LOCK TABLES `phpbb_warnings` WRITE;
/*!40000 ALTER TABLE `phpbb_warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_words`
--

DROP TABLE IF EXISTS `phpbb_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_words` (
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_words`
--

LOCK TABLES `phpbb_words` WRITE;
/*!40000 ALTER TABLE `phpbb_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_zebra`
--

DROP TABLE IF EXISTS `phpbb_zebra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpbb_zebra` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `zebra_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `foe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`zebra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_zebra`
--

LOCK TABLES `phpbb_zebra` WRITE;
/*!40000 ALTER TABLE `phpbb_zebra` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_zebra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-21 20:53:32
