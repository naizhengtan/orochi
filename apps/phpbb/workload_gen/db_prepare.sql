-- MySQL dump 10.13  Distrib 5.6.34, for Linux (x86_64)
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
INSERT INTO `phpbb_config` VALUES ('active_sessions','0',0),('allow_attachments','1',0),('allow_autologin','1',0),('allow_avatar','1',0),('allow_avatar_gravatar','0',0),('allow_avatar_local','0',0),('allow_avatar_remote','0',0),('allow_avatar_remote_upload','0',0),('allow_avatar_upload','1',0),('allow_bbcode','1',0),('allow_birthdays','1',0),('allow_board_notifications','1',0),('allow_bookmarks','1',0),('allow_cdn','0',0),('allow_emailreuse','0',0),('allow_forum_notify','1',0),('allow_live_searches','1',0),('allow_mass_pm','1',0),('allow_name_chars','USERNAME_CHARS_ANY',0),('allow_namechange','0',0),('allow_nocensors','0',0),('allow_password_reset','1',0),('allow_pm_attach','0',0),('allow_pm_report','1',0),('allow_post_flash','1',0),('allow_post_links','1',0),('allow_privmsg','1',0),('allow_quick_reply','1',0),('allow_sig','1',0),('allow_sig_bbcode','1',0),('allow_sig_flash','0',0),('allow_sig_img','1',0),('allow_sig_links','1',0),('allow_sig_pm','1',0),('allow_sig_smilies','1',0),('allow_smilies','1',0),('allow_topic_notify','1',0),('allow_viglink_phpbb','1',0),('allowed_schemes_links','http,https,ftp',0),('assets_version','2',0),('attachment_quota','52428800',0),('auth_bbcode_pm','1',0),('auth_flash_pm','0',0),('auth_img_pm','1',0),('auth_method','db',0),('auth_smilies_pm','1',0),('avatar_filesize','6144',0),('avatar_gallery_path','images/avatars/gallery',0),('avatar_max_height','90',0),('avatar_max_width','90',0),('avatar_min_height','20',0),('avatar_min_width','20',0),('avatar_path','images/avatars/upload',0),('avatar_salt','825484b920a8dff6bef65a16f222676c',0),('board_contact','admin@nyu.edu',0),('board_contact_name','',0),('board_disable','0',0),('board_disable_msg','',0),('board_email','admin@nyu.edu',0),('board_email_form','0',0),('board_email_sig','Thanks, The Management',0),('board_hide_emails','1',0),('board_index_text','',0),('board_startdate','1490128344',0),('board_timezone','UTC',0),('browser_check','1',0),('bump_interval','10',0),('bump_type','d',0),('cache_gc','7200',0),('cache_last_gc','1490556165',1),('captcha_gd','1',0),('captcha_gd_3d_noise','1',0),('captcha_gd_fonts','1',0),('captcha_gd_foreground_noise','0',0),('captcha_gd_wave','0',0),('captcha_gd_x_grid','25',0),('captcha_gd_y_grid','25',0),('captcha_plugin','core.captcha.plugins.gd',0),('check_attachment_content','1',0),('check_dnsbl','0',0),('chg_passforce','0',0),('confirm_refresh','1',0),('contact_admin_form_enable','1',0),('cookie_domain','',0),('cookie_name','phpbb3_etzgc',0),('cookie_path','/',0),('cookie_secure','',0),('coppa_enable','0',0),('coppa_fax','',0),('coppa_mail','',0),('cron_lock','0',1),('database_gc','604800',0),('database_last_gc','1490556164',1),('dbms_version','5.6.34',0),('default_dateformat','D M d, Y g:i a',0),('default_lang','',0),('default_style','1',0),('delete_time','0',0),('display_last_edited','1',0),('display_last_subject','1',0),('display_order','0',0),('edit_time','0',0),('email_check_mx','1',0),('email_enable','',0),('email_function_name','mail',0),('email_max_chunk_size','50',0),('email_package_size','20',0),('enable_confirm','1',0),('enable_mod_rewrite','0',0),('enable_pm_icons','1',0),('enable_post_confirm','1',0),('extension_force_unstable','0',0),('feed_enable','1',0),('feed_forum','1',0),('feed_http_auth','0',0),('feed_item_statistics','1',0),('feed_limit_post','15',0),('feed_limit_topic','10',0),('feed_overall','1',0),('feed_overall_forums','0',0),('feed_topic','1',0),('feed_topics_active','0',0),('feed_topics_new','1',0),('flood_interval','15',0),('force_server_vars','',0),('form_token_lifetime','7200',0),('form_token_mintime','0',0),('form_token_sid_guests','1',0),('forward_pm','1',0),('forwarded_for_check','0',0),('full_folder_action','2',0),('fulltext_mysql_max_word_len','254',0),('fulltext_mysql_min_word_len','4',0),('fulltext_native_common_thres','5',0),('fulltext_native_load_upd','1',0),('fulltext_native_max_chars','14',0),('fulltext_native_min_chars','3',0),('fulltext_postgres_max_word_len','254',0),('fulltext_postgres_min_word_len','4',0),('fulltext_postgres_ts_name','simple',0),('fulltext_sphinx_indexer_mem_limit','512',0),('fulltext_sphinx_stopwords','0',0),('gzip_compress','0',0),('help_send_statistics','1',0),('help_send_statistics_time','0',0),('hot_threshold','25',0),('icons_path','images/icons',0),('img_create_thumbnail','0',0),('img_display_inlined','1',0),('img_imagick','',0),('img_link_height','0',0),('img_link_width','0',0),('img_max_height','0',0),('img_max_thumb_width','400',0),('img_max_width','0',0),('img_min_thumb_filesize','12000',0),('ip_check','3',0),('ip_login_limit_max','50',0),('ip_login_limit_time','21600',0),('ip_login_limit_use_forwarded','0',0),('jab_enable','0',0),('jab_host','',0),('jab_package_size','20',0),('jab_password','',0),('jab_port','5222',0),('jab_use_ssl','0',0),('jab_username','',0),('last_queue_run','0',1),('ldap_base_dn','',0),('ldap_email','',0),('ldap_password','',0),('ldap_port','',0),('ldap_server','',0),('ldap_uid','',0),('ldap_user','',0),('ldap_user_filter','',0),('legend_sort_groupname','0',0),('limit_load','0',0),('limit_search_load','0',0),('load_anon_lastread','0',0),('load_birthdays','1',0),('load_cpf_memberlist','1',0),('load_cpf_pm','1',0),('load_cpf_viewprofile','1',0),('load_cpf_viewtopic','1',0),('load_db_lastread','1',0),('load_db_track','1',0),('load_jquery_url','//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js',0),('load_jumpbox','1',0),('load_moderators','1',0),('load_notifications','1',0),('load_online','1',0),('load_online_guests','1',0),('load_online_time','5',0),('load_onlinetrack','1',0),('load_search','1',0),('load_tplcompile','0',0),('load_unreads_search','1',0),('load_user_activity','1',0),('max_attachments','3',0),('max_attachments_pm','1',0),('max_autologin_time','0',0),('max_filesize','262144',0),('max_filesize_pm','262144',0),('max_login_attempts','3',0),('max_name_chars','20',0),('max_num_search_keywords','10',0),('max_pass_chars','100',0),('max_poll_options','10',0),('max_post_chars','60000',0),('max_post_font_size','200',0),('max_post_img_height','0',0),('max_post_img_width','0',0),('max_post_smilies','0',0),('max_post_urls','0',0),('max_quote_depth','3',0),('max_reg_attempts','5',0),('max_sig_chars','255',0),('max_sig_font_size','200',0),('max_sig_img_height','0',0),('max_sig_img_width','0',0),('max_sig_smilies','0',0),('max_sig_urls','5',0),('mime_triggers','body|head|html|img|plaintext|a href|pre|script|table|title',0),('min_name_chars','3',0),('min_pass_chars','6',0),('min_post_chars','1',0),('min_search_author_chars','3',0),('new_member_group_default','0',0),('new_member_post_limit','3',0),('newest_user_colour','',1),('newest_user_id','57',1),('newest_username','user9',1),('num_files','0',1),('num_posts','100',1),('num_topics','100',1),('num_users','11',1),('override_user_style','0',0),('pass_complex','PASS_TYPE_ANY',0),('phpbb_viglink_api_key','e4fd14f5d7f2bb6d80b8f8da1354718c',0),('plupload_last_gc','0',1),('plupload_salt','a6a987810984979edb7e8dcddf7adae6',0),('pm_edit_time','0',0),('pm_max_boxes','4',0),('pm_max_msgs','50',0),('pm_max_recipients','0',0),('posts_per_page','10',0),('print_pm','1',0),('queue_interval','60',0),('rand_seed','0',1),('rand_seed_last_update','0',1),('ranks_path','images/ranks',0),('read_notification_expire_days','30',0),('read_notification_gc','86400',0),('read_notification_last_gc','1490556164',1),('record_online_date','1490556172',1),('record_online_users','2',1),('referer_validation','0',0),('remote_upload_verify','0',0),('require_activation','0',0),('script_path','',0),('search_anonymous_interval','0',0),('search_block_size','250',0),('search_gc','7200',0),('search_indexing_state','',1),('search_interval','0',0),('search_last_gc','1490556165',1),('search_store_results','1800',0),('search_type','\\phpbb\\search\\fulltext_native',0),('secure_allow_deny','1',0),('secure_allow_empty_referer','1',0),('secure_downloads','0',0),('server_name','',0),('server_port','',0),('server_protocol','',0),('session_gc','3600',0),('session_last_gc','1490556164',1),('session_length','3600',0),('site_desc','',0),('site_home_text','',0),('site_home_url','',0),('sitename','',0),('smilies_path','images/smilies',0),('smilies_per_page','50',0),('smtp_auth_method','',0),('smtp_delivery','',0),('smtp_host','',0),('smtp_password','',0),('smtp_port','',0),('smtp_username','',0),('teampage_forums','1',0),('teampage_memberships','1',0),('topics_per_page','25',0),('tpl_allow_php','0',0),('upload_dir_size','0',1),('upload_icons_path','images/upload_icons',0),('upload_path','files',0),('use_system_cron','0',0),('version','3.2.0',0),('viglink_api_siteid','d41d8cd98f00b204e9800998ecf8427e',0),('viglink_ask_admin','',0),('viglink_convert_account_url','',0),('viglink_enabled','0',0),('viglink_last_gc','1490128348',1),('warnings_expire_days','90',0),('warnings_gc','14400',0),('warnings_last_gc','1490556165',1);
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
INSERT INTO `phpbb_confirm` VALUES ('a49260a818190a78908b3912e7943f41','089a786a6c470fb96588e9602385a911',1,'3619U',1865183425,0),('7900034d9b49ad649787c2585c7f1e1f','349628f34019a9d61310e2649aa56102',1,'13YYT6',221187826,0),('751bff77e7db8f3a63e7b954535c4aa4','3b4759bd1f2752550171e2d03c03163b',1,'5KVU',658362144,0),('a667ba29f20e62596fecf13434632d64','3f8b8032a1e6698ba58d72ec4e8f9c29',1,'2Y5BE7',1493009698,0),('ea155a6749094adae93114e00327d930','7dde880c9032dfaaaffe748c08fbbe37',1,'4EBA',650703463,0),('57d9c7b36d783fd455fdb37f6c72069e','903d646ff3385905ecbcba7b8233b1f7',1,'1E2TV',1279142164,0),('970cd63e854e64b0e5da8d24caced346','bf1b5c9856e66b3c7f49142a0d9a7dea',1,'48FYT',1516212904,0),('9384d05f526c8204eeb44c16bc44c4c7','c23112c7332bfb7407087853f85bc98b',1,'3SVX',1806659166,0),('191e0466b56bbc1dab9bf444b2d6b50f','ca662f343d12e52a286fbce0b23f84eb',1,'6Y21FKD',2107871828,0),('725a116482cf112d8e03dab4aae41463','f64912588a20efef5f133b6a9f85e756',1,'6Y968IF',313254395,0);
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
INSERT INTO `phpbb_forums` VALUES (1,0,1,4,'','Your first category','','',7,'','','',0,'','','','',7,'',0,0,0,1,2,'',1490128344,'admin','AA0000',32,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,7,1,0),(2,1,2,3,'a:1:{i:1;a:2:{i:0;s:19:\"Your first category\";i:1;i:0;}}','Your first forum','Description of your first forum.','',7,'','','',0,'','','','',7,'',0,1,0,100,2,'TOBclOMYGBM7PvlhFRXE',1490556244,'admin','AA0000',48,1,1,1,0,0,0,0,0,1,0,100,0,0,100,0,0,0,7,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_notification_types`
--

LOCK TABLES `phpbb_notification_types` WRITE;
/*!40000 ALTER TABLE `phpbb_notification_types` DISABLE KEYS */;
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
INSERT INTO `phpbb_posts` VALUES (1,1,2,2,0,'172.16.12.243',1490128344,0,1,1,1,1,'','Welcome to phpBB3','This is an example post in your phpBB3 installation. Everything seems to be working. You may delete this post if you like and continue to set up your board. During the installation process your first category and your first forum are assigned an appropriate set of permissions for the predefined usergroups administrators, bots, global moderators, guests, registered users and registered COPPA users. If you also choose to delete your first category and your first forum, do not forget to assign permissions for all these usergroups for all new categories and forums you create. It is recommended to rename your first category and your first forum and copy permissions from these while creating new categories and forums. Have fun!','5dd683b17f641daf84c040bfefc58ce9',0,'','',1,0,'',0,0,0,1,0,'',0),(2,2,2,2,0,'216.165.71.216',1490556172,0,1,1,1,1,'','SVjyGLYmAjZfo13NDp9B','<t>y5LTtgZ8VI90ehBVrOK5d8wNC40wzJXOVB7TsCUD2qVnAIiby9Kgav5CQ3lPpkc8C4BQLzQchGIkSPGnCS3PtrCyb87z8dOY3cjfTAndPRFfcYRh6AYKdlBfN6JxDfa0KwUei4U7ilKqlkVHz2GOt2773qImk50DZrSRPSJfMPilZ9EGnFRrZE7eUCHLo0KBhk0h9Ost</t>','6e7f88953ea547147fade626815d1a43',0,'','2ql2meiq',1,0,'',0,0,0,1,0,'',0),(3,3,2,2,0,'216.165.71.216',1490556173,0,1,1,1,1,'','oNN9f2NM5eCB48L8T6Dt','<t>Mar2tVHy6djvSQMJwk0O9JB3LLbrSYt0tSDsySWosdzGqPkUvGEvXLKKH135aAuCVuosvUPMIypKKnYeqFrqHJjQK2CcKE3fWLjfRrdtYIXCL9reBOlHNkDGSXdPGILVrgdSZS2GkiJzVKHIJH4GlXZaSdlxrstLx2fAhA2Xb4abGJzFp1EfvPsHjtrmeXfgWMM9TGrx</t>','bce2f28e178c1e1f80f13dfc18a1cc6f',0,'','20ne5rtv',1,0,'',0,0,0,1,0,'',0),(4,4,2,2,0,'216.165.71.216',1490556173,0,1,1,1,1,'','FrcsLZEXr41tLqn2WNrS','<t>BACZj5NYlulTj2yvZlfJOH7Kw0oowrwIkC3bmXnlZ53jKGqpj9mAwygHDmljSz5KhmbDLQ1VaNstwqqzqkS5SYHmp7rOiF4dkK2T29j1lrz0F2XiZGbLmGoPaw72fS2bEcofNgF1UFv6nSIV99aEBBUP7e5hWetPK9rs8ShB1mW3IuJ8Ds6drMqPN5QG63vnX7O3UIB6</t>','e27a5cd858d54f1e0c72df7c7deb82ec',0,'','16becsyu',1,0,'',0,0,0,1,0,'',0),(5,5,2,2,0,'216.165.71.216',1490556174,0,1,1,1,1,'','iZfJ1WCiNdLcfx4q6rdm','<t>kNWN7puRfUATBfVHZGTPQt8ak0toRj219K1yUUiWdBfWXYNSKr6lYiwRCSRccLs1YrneCJGX7l3PCMHDesaoWWbn1BocqD7tmbXsdZIGqjGdHad0O2lLYqwch2x5Dw28xPgvwBuIAJD4K7kEujdvNPQndsbR0UpTYmWGcckKagC33RsGmCvyfCy5pVStDwwWmmnyu2Rw</t>','42cfe19466789243d0eeb45cba33749e',0,'','1fmjk74q',1,0,'',0,0,0,1,0,'',0),(6,6,2,2,0,'216.165.71.216',1490556175,0,1,1,1,1,'','rmYK7Iu0xR0vvUUiWc7T','<t>z2Vav65yU9STsUzOf9xb2lpi1EQogqH9wmQjEoecIzbcBoCpQmWsyAiQKyufTC6im8zsDYwkSMgeS2J4roz2Y6nz64vSComu1mCStkiSE1PgqiV3Hpy5Eg1l2eAYZ83NnDw4w6W6l0AOyZsOwakuJnLPUy8D9ofIsEXBeNtUKdbVRndwo819ElES1B8Ye1JY39lDT1B5</t>','36734ac80d1cb9296d6a7d104ef99d90',0,'','1q4pwclq',1,0,'',0,0,0,1,0,'',0),(7,7,2,2,0,'216.165.71.216',1490556176,0,1,1,1,1,'','LcwgCdiLLk5uOaczTR9T','<t>ChVBC4ydocv0ymI5z4bS2oy0dYT7iGJIdRhhaQR9C4vQ8fTDQwdGsVfoI4aWczojFL8uvEd2rSyz9IuZFwzJpV1QbiQtexeVw6P3rmz7vKSG8HoabSpWSAGLo0MI5sAKK2p11WyT7nyuOsb5Jq2BRA9Y1Qrq6isBwLDGpbm5kvEw6D3TaABhhcKxQx7rkLf7jjKvAAkE</t>','90db6017e5ba2d616cdb1050463f46bc',0,'','1np7arzj',1,0,'',0,0,0,1,0,'',0),(8,8,2,2,0,'216.165.71.216',1490556176,0,1,1,1,1,'','N12ey158L24kGqKAOQh3','<t>nGPQw5EMfL4Tm4Dk6ySdUDmJ4CsFCdV98tYZ6dor2l9ECgxoMwDG1ziGAY5kyAUP09OfN1AgjhZY2AAod594POWKVWdQRr2K4DDbWEW66RuPFYiIKf0qT9fJZHcyFE25CqnUFwyBO88geYBccy8BAzNWJ4rFklKxB6VRNQM0dPCUM6iWD8kp8qGFnu9ke7NhFQ7XMBoh</t>','700f6957a6c96ce5ee31aec2b74a408a',0,'','32uzkgac',1,0,'',0,0,0,1,0,'',0),(9,9,2,2,0,'216.165.71.216',1490556177,0,1,1,1,1,'','QlGVFq75hICkgY1xWr96','<t>v6izgdMHgvclDPDAYogU1DdWvDqbWw1xbanJT7McotSJ0G3qpAfUfCcAEa6TnKF0bPCYWZ13e9kOpyYB6sYihbb48rh94SCa4ju18Yqd9mMb4j0RWfO6b85x4ZMhn6Cizhmt0ddirmvXplbBKUOmQGjDjFHHfgdZsMShlY9HTVJFfzvnGxUXEOSurJVRcbKs6t0CENcC</t>','eed4256e591d8cb394258ab29715d5c4',0,'','38ft2njl',1,0,'',0,0,0,1,0,'',0),(10,10,2,2,0,'216.165.71.216',1490556178,0,1,1,1,1,'','9WX5zJnXIRif8eldGRaH','<t>uGWsUiH2XOI6SUrIEycXkHXYwSandaZCisi9aXuAcrLqRXc2nXTt07IrT1PcqsJiC3fy9Ycds7M68m2lhN2ZHrgJsEW7V1y67QHr2Ypb1IuSh5PYeQDw5h2wW3wfQ0V05THgBmekodP1X6K4odTaaTaW5EQVUy2vGKs7YcahUSjQFqfEfdseYJHslLmcMXkPrQCOAdcp</t>','871543cbcef39fd10ed2cb12c0e1e605',0,'','1y5kzctp',1,0,'',0,0,0,1,0,'',0),(11,11,2,2,0,'216.165.71.216',1490556179,0,1,1,1,1,'','CL7oY3DV0HSft74zYN6I','<t>rsbVTDAlklaTXU6WVr9hHk2DfuNn7L0gHcR8QDuRBzZYttXN7O7ZUWjA3u4kAMjOxi6u26hTogCnAkGOdlm5II3ybngF5DwOYWjnfS9pn1JcRRfFjTzV07dqO36SyXcXI2yt4nKs67szLxr26jY1DYHA8AM2zTNHCphN4ioTFpb13vHO5iGICHLa7PdpqFZo59R9Dq1Q</t>','35e60f82443e009cde83bdf74e46ac4b',0,'','2hm4d1do',1,0,'',0,0,0,1,0,'',0),(12,12,2,2,0,'216.165.71.216',1490556179,0,1,1,1,1,'','FVqTmgSnQEe2JEiluHlK','<t>VwYtdtaS5opJQ2FVoPa925ghjkF8BjVnWbvns219SZnrWdBn4Jo4TYaxb6QKbpPQbI5pHvQKepGmV9wDNHidKSSaW47y7V0PstJNnTHccjEJswxh4N1iFJIeRgaGVsDeuGPqegfLojcALWU29CsoXJ4Djc2DQkTALqgo1IJIpENZhi9oD15qUMX8pLLx6Nmrdw4CVNmL</t>','056c9b6218306f7f1b085c9c0cdc78dc',0,'','1pb38efb',1,0,'',0,0,0,1,0,'',0),(13,13,2,2,0,'216.165.71.216',1490556180,0,1,1,1,1,'','RdsWojUmAHhWndx2xcdx','<t>oqoEnrXN9N085UZvHqRmVmgJIqiBKKsD3GXcYgVgY0eK49WyFMQFPX01VfGDPJ1fam9wUnALyRVFjl1iBT5RtgPQBT2x8BesUO6IkSGemGsvUsDJUeu9DRs3672pDaFlW4a0qOlNQY9dZkKi7ZysizBMox17RUZCilBQT9i2L9LOnbk836sMqnxFZY9D1o5EDy3EEG3P</t>','c19e37fbd95708fb28a82ba367471b31',0,'','jk9wqde9',1,0,'',0,0,0,1,0,'',0),(14,14,2,2,0,'216.165.71.216',1490556181,0,1,1,1,1,'','dRMcJEHbZGbEKqgvSjW3','<t>oxyZQANumw7BQ3qggCPWG1pPYUUw21hmA6C71YHj9WcXWun8z1mOKkAMvCbUp0KG2tQLU8y0VN5L3YZ3bmxWO1zkZGviGUo9b0qT9c5p8ceT19NfM2H5xDDYEEWcom7F4GbtTPAadzGZI5hftQXuEi3ePTbvViFu79qmXQWg0XQwYDv2iEmDusH2drtwA4vGSSy2xLab</t>','5bfdc8b4ac76c88bf1cd6d012fd7abda',0,'','336e72wb',1,0,'',0,0,0,1,0,'',0),(15,15,2,2,0,'216.165.71.216',1490556182,0,1,1,1,1,'','eVV0Jq6Q99a9q4EKSduJ','<t>rSkLDxPshUfqHrimfsrQAiYITjdrhpJNmLjtcqeraUHUtCZY9BsOqnvAHks4aHFCEIV0GWwoqjteSzKCSjfvp4nNyPv4qqnCig9QmOeUBR5IN3iQzPiE8zwvAAPrClIVyfCVGyQtnnaN79FoSEKgtFR4XRcH6xhAurFvHsDk4c8TSvgfOGOpBtsRjtXapZJbMi38SAHz</t>','4b97581d9fb87b15128c2fa5947bea72',0,'','19afsx6j',1,0,'',0,0,0,1,0,'',0),(16,16,2,2,0,'216.165.71.216',1490556182,0,1,1,1,1,'','rncVbbM7uImhxZy8ahuf','<t>HBdD2be5Lc4yybjL6gcjyHWBik8Bl63jUtqdrse4Yl59WOvpQunYbG4z0KXKBAAEUEK0GliCaDau96ruATbhNqc154lrE1buD3Wa1WXGZ5oIGoqpZ63lOQGsO3iuvlLIkJvjP4fWWRyEm7ndrD0RLOp4TZkYSO2kh2kPBADZdjFFb4MRHI09RnhqG6nK8GyHyVhm9Wui</t>','d04bc4a60110289252a9baabe0648aec',0,'','165ymjon',1,0,'',0,0,0,1,0,'',0),(17,17,2,2,0,'216.165.71.216',1490556183,0,1,1,1,1,'','cduEiBA5MBoBVAjmHd2b','<t>Snma3mlNqeChw3LDqEUuhWpMl28O1pjzIjv4Vqot7AXTAXOF4ReYc35g6OA7Qa8F0hclyDA2KEBbrfF1zGSD6I3UWwPRLK0wZwMa5y0dpYbuhZ8YUlmXwV5cL128vPlI8gfpEvAQkT52qiVMXx71Y2imbry3H1JrrQrUWTPolQLXC34PeVRUTE8UkcYXAhw2FpaZHBUb</t>','62e171c76144fc43f509ab8421d14af3',0,'','2i7zcskc',1,0,'',0,0,0,1,0,'',0),(18,18,2,2,0,'216.165.71.216',1490556184,0,1,1,1,1,'','Vuha8Pw0eJMMYrbF9hbN','<t>d5SnPeNemFsznoxvAzgVLbE5xts9K9Om6YvmVX9unrW1lv25HtjwEg1eZAoQf6TrcF2AqDCoDOh80oo6Tu3nnmNUCYCKyHq6RCJzDgWncsl67iEoMOKNDefrWwKQXKJmERy4tzGXPegi3UEFXZYpCwFkjHqzjjiMlNPUsm6xzocAJUR1Ipy0vjHEfLMQmeuhjqpAMJpx</t>','98deb38f9f894ebccd2cf143b8423fdc',0,'','14z8kr1w',1,0,'',0,0,0,1,0,'',0),(19,19,2,2,0,'216.165.71.216',1490556184,0,1,1,1,1,'','NF09dTs7gEh2PVcIr1iW','<t>sgxjhVbNXWQcsQSZ6MZjlH6sb1klWVqi1wEwPR0zeD4U6BgdMVYmx3Unjlus921i278yTzqcawlr15Ud5j2az18Eeo623tZgTlzZRzdQPDaUL4409gXzFl3b6QNnSJnGhsoiVF3LNmUO56z3HGFoRFSCUtJua4ALUoPjhl3Qs3xW6BWxA7hDtnto0lSXP0MJgGsow1hm</t>','c0ee99ebaf2f555c79f5af5ae76fa1f5',0,'','1oxbye7l',1,0,'',0,0,0,1,0,'',0),(20,20,2,2,0,'216.165.71.216',1490556185,0,1,1,1,1,'','IrvNRpILRA7ZB85J4UMH','<t>IIDoTUHieXDpPN168mhRLbOfm36Yh9dRQNAITDCeDswSdLfxx6QdBDdLMV4WMPkjPVFVq34655ASQD0Am0UjNT1lZbKKoP0eld8vvUcFCUd5mGLEKMVer1pKqtNddv68CEMbFqya9vBOVYHydkayRbrtMlG6aO4CXx0SZ3kIY2pVEuvDb0rbZtggeDOU8djRZFJ0HuFq</t>','4c1eb67c7ca9bce394c1e6ee4f9c5276',0,'','2rb2k678',1,0,'',0,0,0,1,0,'',0),(21,21,2,2,0,'216.165.71.216',1490556186,0,1,1,1,1,'','YOZ7fiLB633BkWjCSRsf','<t>ltyUBL1JqtZQDT6Am2miP7kj0amGjHKUGL8bmYvF3LkHQrV0MUUxuPeh4S3ZNI9iNTcDcBDSc0eyhhazcEoTlNH5fOrBAy3JPkNuYefezWcjAwb65uv61yjF24XGXSPbxruuKkFBymDubCXQPdAZ3xrBTj8klREzMYZ1pmLZeA4C2kis46KvjlUI2Dp3TSJ6BRUX9aVg</t>','f2bc8735a7b238961497ddb293d17e23',0,'','l63lmejl',1,0,'',0,0,0,1,0,'',0),(22,22,2,2,0,'216.165.71.216',1490556187,0,1,1,1,1,'','JBvtsKyELFdV5ySMOiWi','<t>QNSgEWcGYtBKgSRXk4bNTopTOSjQ6GpslDm0BVPvnEFnwICwfv9bxmLwFQbhWPSN0XzsbUaisoxWarlzfAdr3eW4bycX9skmRvkFWxe6BG5UTfZwMJ0SiukVmBKptmI3oPaiGFWhAwZwWC7tWVxMCTgSBcsqt3sZZ2Lr363p8F8VRLL8Q7Ofpp3tkBueN52tqsL9n5CD</t>','4da43ac5b1e074a1ac03ef23e1d8593b',0,'','29k77kho',1,0,'',0,0,0,1,0,'',0),(23,23,2,2,0,'216.165.71.216',1490556187,0,1,1,1,1,'','SlW3ki9Bm61YvGJL0knQ','<t>xvtTUq08WfyB9v1Oxd7BFy39vF8FDE2UkpJsp3RySGIcgj5XGA4vZgQbT3CQd4tgiFTbM6ll6rT4PUDm4AFJNPIfUyVwzGobaLN5GYl5OWcPHILUnT0ghMAyZXoelDEY1Md5xp1wAmwBfBTLOyfSO0nxzfiycuj69toXFnLBUgR5HooWRXnLXDVo24APBMSvxfWGH6lb</t>','89d865609256936cce3ef9e13b50587f',0,'','2dlz0y3w',1,0,'',0,0,0,1,0,'',0),(24,24,2,2,0,'216.165.71.216',1490556188,0,1,1,1,1,'','l2Uu1bCxEPNyJ8EyRgoR','<t>cLcoSeOfpJzB8WSJ8Ly3sv637CYbe4nPxD9ci4Bsh0XmL5TtUXXdTbQi1sYPRQGUuFiwBqpWIxrfdtORaGzaa4TEADXYUccJpwQgWKxceKDLudXwuWEclTknwWapaMo0aBzMrkopMECMrMXr5EccQ0H1s3w2FB3MJPBQo9f8CPb52GVRvjxOL8rs9Z5NP5dvE8mJ1tq8</t>','2ffa8576dca1a694c92e463c50a179ec',0,'','kknw2wo2',1,0,'',0,0,0,1,0,'',0),(25,25,2,2,0,'216.165.71.216',1490556189,0,1,1,1,1,'','AjQL132Snxj6CAkMEe7b','<t>8IpurYpvAxReh2MnpRBhMbFJpewaE5YFYc3dqA5yINwCfgRj7CYJTCUrBXXEY9CcF3bWbrLFzaOCZhCwUZLlWrrjJKw5KcRUu11pHnqQ0z5ztYnu91lis0ranokgqnARh4cSjYqrjOcrgUz6KgfF59gTnhKGdvmUYISUiu81lkwDSA12MaMC4gbcVoIT29z13VwJbGjO</t>','8d9421ebbaebc2d4eb4ac5b975fc7a20',0,'','xzpj9ghd',1,0,'',0,0,0,1,0,'',0),(26,26,2,2,0,'216.165.71.216',1490556190,0,1,1,1,1,'','nFjdnD84QZ9IBGDCv5ZX','<t>Kns9rD23fqR7K2Zkhcb58rcvNUo6WmKCxVFu0SOHCkOM9ew2J5R3C0xbrtw7qDCkwXA5tf6sxpuGnZTzKAKIMBYP9ctwCxNNoTDNsYCv4mRNpEJPEVxO4tiXTu169IjzUwEHATFeD4k9ckjk8holW33wBzmrSqEXNQq3NHr3d4GrGAcRzktvjEucANpddTk5weVR3hP2</t>','e8a23adef0c66f99822ed92e40f7d071',0,'','1cn4dk4e',1,0,'',0,0,0,1,0,'',0),(27,27,2,2,0,'216.165.71.216',1490556190,0,1,1,1,1,'','Yb4TFABQDX0YU0ZyrXNJ','<t>3BShHR6NoW6mmB7LXEwRBuLu4xG97a6mtk36ppnJCGoVOtMdDGgIz4adlD2lQg9bAQKRGePm0gfaANdq2vfnWVhACaJNjwKYCbBEYvu8heKHevh7KgM2AdX6ohrwkKCSRU6fyIDrIcIjG3OoOXuCabIb3bUmg8bZ3YgisighKhGC3zmQafzLrHwjYYD0w1eqUHkDfzPj</t>','2b554ef55b1fdfbba0a6eaaa86e202c8',0,'','2eocu050',1,0,'',0,0,0,1,0,'',0),(28,28,2,2,0,'216.165.71.216',1490556191,0,1,1,1,1,'','nmS9bzU3ZHx2RDZv94iS','<t>ofEsTbesxhyuPnKBgT0aDg5dEjDzDK7A3zh1GkzMNNosriS2ONqevaHGA4fXLeLOlyLUsUsu2MWyqup2soVzsW7IquoHs8JVpW2aCdyLVqJBmwaHQlzG7bhAeUWclpQUyXrVUPBB2n490KFIxxlilT7OByoX5FcFsvMMVJYlRqGXGvHVk0F8fwth5XZNu7g6DRlYRA7p</t>','a52ed55df76c6f4c853ca4783a608cc1',0,'','4rqo203f',1,0,'',0,0,0,1,0,'',0),(29,29,2,2,0,'216.165.71.216',1490556192,0,1,1,1,1,'','KdJVIs5mWcbTWFFmb00k','<t>lv4vXL9ZnfT2K5w0VN6QKKjtDCG4RNVDDjUhIyFK51ZTPGbS588by6arcy4764xftulLJnSJk58HPlafwYpWcz2a3Y4En4gJzw1j8MkYYYLMzvWnxU9BQSVAnG25ddflXIvcq7mpmKFRKxLVX36qdzcI8YyQzR4ZMBjNTfM1IDSnpO4PfpidYrOhaSDE6q1lWmBGcH5f</t>','a1ed546ebe84b79cc7c23853131a126e',0,'','3edafnln',1,0,'',0,0,0,1,0,'',0),(30,30,2,2,0,'216.165.71.216',1490556193,0,1,1,1,1,'','2bArvXyV7gULmwRq7AFC','<t>1MJWahSDrkajjRqVULvLZuL1x71305RhS5AMNLnxH8mGrQXXjrqzcrcmJh4UoVniQdnH2XPOTagcs13CbsXdxt7feQfxnXeVxkt4DpZXD6OX5FEegjx5q3dxnFWtQM5TW0iSLjrBAHHJ9Ybu2vXK4I3d1Z8ZuMuSS8JYfezMzlT8kbW4RD40zD4nkrm0ruzdmKrgRSBI</t>','2d8a5c6a1b487474e9f989fa22eedacc',0,'','2w03jbr9',1,0,'',0,0,0,1,0,'',0),(31,31,2,2,0,'216.165.71.216',1490556193,0,1,1,1,1,'','fiDvRRwcQYlKXM4b9CPR','<t>T5dwJPaaEY88PhcoYSHcQuZSr3QQNavkdALVT19HEwrZCS9YCRLP50SDhOfU1q9jwG6bdz5uAwfYgr56Jk8wHySSvYBoeWrbYNfCiTDKbeSCtpqWvRyOnhlvuDDUwEU2HQR7jJQX9cXgCOJXnTvMgR20s0YbmMddqk0rw2nEX49gsMm7SPz47q2cyuhvuVHriLyR2MZj</t>','054e6c0eece3509d14c2fa571ba61952',0,'','22kkgwep',1,0,'',0,0,0,1,0,'',0),(32,32,2,2,0,'216.165.71.216',1490556194,0,1,1,1,1,'','8d7Wl11CZpMDr1c2GvbK','<t>35IIOKzcOGkCYaA9fdXFvhEMQ1TWEY710U9Iu9YOjvOvYixdxrPx0Jup5XJRxZ39PowqUVyPKmTUSLdH7rL0WPZAm4N1lRzIEfV1b9SKO1oteVFDvCzuJu1pr0y6Y8loPxsmCo7XZP5hR5sCaErvMOcfXUnS7AMLDT5xzahAZ8K8zE9D6r0c07Q51FJieDwgJgWFW9En</t>','3a8993a687ccb75d1e9f12b687527dd2',0,'','3iy0xf5x',1,0,'',0,0,0,1,0,'',0),(33,33,2,2,0,'216.165.71.216',1490556195,0,1,1,1,1,'','mY22rwKz6rdvLJA7qCJG','<t>io3j2nohx3vT8UeWTfydvekyR75IIMDdfqTp1eW2UcahRKJDtmXML8TMEBxLYa89k2q4biuXlVgMKYMerSWok8MUU6R8gi58h8O2ZgV34twAIo9txouL6WCUaAH71T47U4mD3GNxPQ4JlZZYJ8BUZkesm3zHxCX3KSRvvedo6VtrzFMjVVYbNEJaUwdShEiOp4tD43db</t>','8d00c93438acac8c5b8af4d20e84b201',0,'','38avp5z6',1,0,'',0,0,0,1,0,'',0),(34,34,2,2,0,'216.165.71.216',1490556196,0,1,1,1,1,'','b1R6pH2w3j46xFCMSmMk','<t>zsYYx30cTFW9AaE6tanu90jgmoQXABkq4aLW5qZFqTbh2T90oZ6FWreNUYm3QgHPz3sv65DTJf8WrQM8f5a4BaOgggssNz7kAOphqCqwqFa0nPxAunHDUjS330LVAbPCf2J8OkzG7ae1CButrGjVKikrGrsQisYiI1S2D0tK0NrqB1s4vxvB9JYKJaV6BBeuh6HWuliO</t>','738923ea2a46834a6cebaf2e37ea5600',0,'','3jnhpzq1',1,0,'',0,0,0,1,0,'',0),(35,35,2,2,0,'216.165.71.216',1490556196,0,1,1,1,1,'','X6eoolpLMfuO20A8DIaJ','<t>JZRyrMWRWD4Cq2SKtsnEp4JlyDrnITQdm0zAcAc6yfKdLdi3HLJrDCvemiIGhHy5gyoBFvWDqlnXEepZsw1G5boiUtgydMPPVUBqVk9K2kXLSaznezZvoWWzIqEtfWizafkz9vCrIJyOWQS3hIaGarr6sWGy5bbab9QoMVtHz0Xaso85Oyr00QihxwKR2EOSOkUXjGP4</t>','84915a0a9ff8b940d928aa5504332e66',0,'','3b78k473',1,0,'',0,0,0,1,0,'',0),(36,36,2,2,0,'216.165.71.216',1490556197,0,1,1,1,1,'','YF0nObnY82dsmPLcaLt9','<t>y8LPQ4jQvC2LvxYzSrq0PwVZUIDmVg5CoMr62dIRm0G4RDmpA0mjxDR9vlaUkIi8iTKm2mxMChbRw5Q77X8zjOiMMT0PB8J2IjUNygiQLUwCT3VH9xR3HBQmvqe94XPDmK7JC8Zv5iTiFlV7nk2aivZnWd7Tws3JQiAAJICdqVavuNfpb6mbeUl3kvG2O1EHxgf9MTNg</t>','8d94cc37d973185d4cad66a6fd204bf0',0,'','2efkle09',1,0,'',0,0,0,1,0,'',0),(37,37,2,2,0,'216.165.71.216',1490556198,0,1,1,1,1,'','cxsi5YaNrrsjcVj6xhfr','<t>CiNyh0WlKAo4yMNh79MaFr0gRhGxFPO0QQ01poteHORspMmQc9rI54Qo3BVMmM1z6vcc3C8ctphHQSrejpqGlWHTvOFb0FAhyqPzD275HnQ1gkUW0N5sfP95rTTyXug5A8hH6UuPCN9gtjBbPNRXda1jRLjvOpDgxJOZZHp3uGCNRfxTIfywwncL2nAgs6gXuwpK0XQZ</t>','2765ba9c5426ff724a455555048a7f50',0,'','2hahfgf8',1,0,'',0,0,0,1,0,'',0),(38,38,2,2,0,'216.165.71.216',1490556198,0,1,1,1,1,'','8KFBamRY7qX3CbNTxPKq','<t>h7E9XWWlB5trwgF4F5u6wsVp70gUAxDK2oudKY4kAw2ttuO7W0lIZ0ewV2ZI3NT5OtsJMnVOyimblZkSNNOIkuKYL4fVLlpyNsPPCk9XYGbA55Ur1kuMNWJSL3nwlp4OcBK2ZuKdTOL34wy90jmC8JMd6Gzkj95KceIVb89eedd79k44qvHrm4erGOspJYeKjKHB6ozf</t>','e6cfdd19a36e9de45ba3762a4c53b608',0,'','1pcovbk5',1,0,'',0,0,0,1,0,'',0),(39,39,2,2,0,'216.165.71.216',1490556199,0,1,1,1,1,'','Z3YSp4Yy5VYd79fl1oTK','<t>TvFl4a29ZU7DEhvXNsQ0WFzLajeg5tl0DNmh4B3OG63vlStiEdQEjCjC8qRKaS279ojRJPgVdDoxjqE4lOYjPsWVHdLZP2I0c1heGtKtBV9lxtTGyCxhg63P9Vybo952ZKnCTD1qVoEUHBJj4qBvfXeig0Ko4M69o5qrhj8zvMx1c1HxkkGQMVWRi9FhgRhzmM1XI6cG</t>','a12c56fad433eaeeca6cc612e135ed56',0,'','3w1jsm9g',1,0,'',0,0,0,1,0,'',0),(40,40,2,2,0,'216.165.71.216',1490556200,0,1,1,1,1,'','2xx92tFYtPIrobjVa8gq','<t>lSj0qWOThGXeHVb8AirHQ2Kmcfki4PuCQsvXDQ4JWcUYCtXn9BMX15lRUMyQjCvEbGqlmXIxlISTraRs1NFr93SK9wGRMfAXpDezZLUxQMulCFtOjMX86U2mIQRriziTbj5XBr1qxIlEC32y3QnxpN5gf1wEr2ET7nICa7ltj00Y6sHzd3kkP7eLioFbvLqGsXz01oJx</t>','ecb776cea0f3862259ec22f6f6570c4b',0,'','90q0b7hw',1,0,'',0,0,0,1,0,'',0),(41,41,2,2,0,'216.165.71.216',1490556201,0,1,1,1,1,'','B5Lk8s5LfXgJw92FhImC','<t>kGMVManOUwSXawViErzllnW6BH4My88gDoZH6OSthkgAz0YWao9fL3BifORAMcgT6PD2z0KWDluZQ3uL6nEpJIwF45itT1l4cwem2dfdTPlhJCQJ1hg3w6KJ7CHm8yOKULkVjOJGDyBo9utWvOnqKh6gSRJq93arsyHS6YSZ5QtuJJYi4XCs51RaCJ6pklOnOGrqoNPs</t>','e9e2fc455594085cbf4c26b03e7e3d42',0,'','2o18hquv',1,0,'',0,0,0,1,0,'',0),(42,42,2,2,0,'216.165.71.216',1490556201,0,1,1,1,1,'','MasRXni25kY044mwVrxM','<t>X7F8EIfY1YrURHqHdSNL6DRN1RXM7tFZ0smDvWrNxhACzrQWDTmz1Ab04MxnqZFbYZqJJLq9rpPi3DpT9vGa43FRA3F2eEGFaS0sJDK5P4OnQmnvLxt37gI9eKXBHwH40OoH5QpI6U0mQ1MVUtZJOY8cTTYdXn0Na8Dp9w21PaFazTA0jCyyRI1SoFnU2VrVdxvE1e8v</t>','752a091d85aaea20933294be9b245e09',0,'','3vi1gayn',1,0,'',0,0,0,1,0,'',0),(43,43,2,2,0,'216.165.71.216',1490556202,0,1,1,1,1,'','BRgA52PhiBjnVVncmJes','<t>ps57QBUsEeos86DKmv5WuxIB005fW6maRhGqnzFS4XRcLLir94yQxqk8iyNSdYxTiF1YXoh3A4Xpr6uXGumbdHvKorQzvsL3T8UpBan2wk5OwJrDk5gKzshh7yydx6N58m2pv3zxpeLtEKN60S6I83W62zKWJBEQ61KZXwXy5SJogGsItL8ClgIxXY8umqX872DnkMyH</t>','888a4944a7daae82025748fc5a3804f8',0,'','2z1d3hfd',1,0,'',0,0,0,1,0,'',0),(44,44,2,2,0,'216.165.71.216',1490556203,0,1,1,1,1,'','XKMinp1qf3iM0lAraNL6','<t>MzAF07IEueuCqnITQeqDbtLoEpV4UhqYwF3Idyciq9RUKFfucpUInJwgDRrToja694M8ejCbBPE46JDxoPgyzEswp9DsXNZ7gkQNbKLk3mv9Vgy9xG1gFLR5lMb2YQgbDF0bGcdw3rA8WMvrfkKkNVs8RHXiIP172MF7EaoIy6sf0WmK8eUDOl3Y3OWUpLXALIVmU4wT</t>','236b7b934a3f169eebebb72ebbd328b8',0,'','1hgq16ea',1,0,'',0,0,0,1,0,'',0),(45,45,2,2,0,'216.165.71.216',1490556204,0,1,1,1,1,'','6pbxcKKD1EvNP3KpnHZo','<t>ylEbM7WnvUJrdzmt26SUaBcO6L3VQaHDPBV3unyuECPdIpkgGWrCYYDSlx1H4VQUstWK13AyUuUQ32mTi4AcjxiI2wuDRNqjDVwhNCKoQwNmirH1R9gYT9w4mKwTLYLf3DqVGC1dTJilxZkJx7uoOacuBWSxn3UNtdkqxYZiB9LPeziAMdzh40Xq1cQmmliuxbZdkeqi</t>','71b41478c12da3f49a482df1b4662b26',0,'','1qt6ociy',1,0,'',0,0,0,1,0,'',0),(46,46,2,2,0,'216.165.71.216',1490556204,0,1,1,1,1,'','CRg91qqAaCgHRwhUchqe','<t>S3YyguPdMnODd5XzwzsmbTaglTzpJPCvjMjRowJRwsIFRTYJEVRF2EtBrSx4UUQUMkYtunPQyjlUI6SbIhMUyWhysskl5aTvJI2idjnbKq83eC1NoTt2WndHI3ZwNnsVKxseal0LaDb5qJHjUfBdMxoU6QPpS72riVIH7gF8kwcVA0HSKWcr222zy4ZEELwcMEg6QQ3M</t>','4de54d42f08be40b0c693941efc0fb3e',0,'','1in626r2',1,0,'',0,0,0,1,0,'',0),(47,47,2,2,0,'216.165.71.216',1490556205,0,1,1,1,1,'','tCyr9Pd0erHOoWKdWCQt','<t>X0Bj3mqrZuD2O4T3BubUiGg6klO2OckV8KmVJhl1qeyNHs4cwnMyJXm4KEiktGoXGDyQlCmaXBuiULWyGZEq0hVuuk7RxFUukjUKJAjGxyLy4jJ32EA7iaG9XrzcS0X29YPrQzWIC1bO6CRXfXgSYC0v1fxpHXp6GpHMOvEtaI02HS2RBvSKQsBi84pgO7tIpubTGSq9</t>','f514a938e260c44420314f5b095b92d9',0,'','2xgazhlh',1,0,'',0,0,0,1,0,'',0),(48,48,2,2,0,'216.165.71.216',1490556206,0,1,1,1,1,'','Our9lyGwydAxBH1ydyEt','<t>gkZgPKSr0zrTUyUi5KHq5lXgp9PNzI3rp6Oc603k495eHHELX6V9Y0j6wAWur1Lfbu0vbgHuDOYeYhZs5RVWwnxHj6nqhwuPteCcbx9IZFyUFxFIvTunbr7fJ2AktD2bt6iUhASYNFQtKDfNZCBXv5pu48USKFjASGDVVRdtNChRnr2YLefh0R848gVv5N58n86hCmPl</t>','04984274f7f804ec6061d4bc7aff267a',0,'','2ze0w3au',1,0,'',0,0,0,1,0,'',0),(49,49,2,2,0,'216.165.71.216',1490556207,0,1,1,1,1,'','xAtSxzEg767llneewSXi','<t>Q7PLTKldG48eRkgSqYbiv1gjr34Fg655ifbDaLy1FUGHoUNsMjdbZ6HTYWtW6kep9iathn2RuAGMNETzdxcSquy2Qjj12WmifbwVob5buPwTJVEQTmHQtgeK3n9cdIM5TMLbIFNwa9VVwY2I53YLrVS63gxvhy40irWCQ4GM76jxhiiQ2H2ol1Mp5LwYyqQwx8LAU53J</t>','33b171c6a820b552181a32983dba54e1',0,'','38flift4',1,0,'',0,0,0,1,0,'',0),(50,50,2,2,0,'216.165.71.216',1490556207,0,1,1,1,1,'','fy269MzpujhkWK4DfMDq','<t>qthU4RS0zc7kadXzp3UIadrqESVCl1563uWUolL8wXbBwkXLMI6HlSESARirkZBWMD3Y89LKHm4tF53U2qTwsix40m22fOgQggelZXj5oFEnyUontCVZOGNcRX8oOXfEOHIvnHJwBk0XyApYW8sjiCDjmpvVYpk1v8cNUs4DWOoNwZfcSLaCxYhZBLXUzsIBGx7OhWVa</t>','c461722ec0840176fbcefefd301f69aa',0,'','3rw06xvc',1,0,'',0,0,0,1,0,'',0),(51,51,2,2,0,'216.165.71.216',1490556208,0,1,1,1,1,'','UuifM6sIpviqPkwh14tA','<t>397Hh0cUyMImdBgrqlecyhSXXRh79S0amwOymVIBonoYAJcwboMtd59ArroJ6pONsZSvDvqCo1HnHJHZHIdpGkLaFRMO1jblv7uNdpigjPxzAM2t42OMNrAqemnWwZNY5emfIRRh3rT1BkzX3Y6K82MYK6q7GH4CPM2bBLodkzPxWZNqoe1VdnSrFQtp9vdSO0if4zHq</t>','20e687c06150da2f7fb4e5c9f9fb4572',0,'','2tin1iur',1,0,'',0,0,0,1,0,'',0),(52,52,2,2,0,'216.165.71.216',1490556209,0,1,1,1,1,'','8VmjrKE8AHnIX8FzdMyf','<t>qvzHITbq49TJlUf8TnKG7yWLAjOXpm9JBRuPLy7PntdqdnLj5RZeGYouUK1BeUmkRdfmQpKrQQCgtjBbSZ1EMQKhUoqolvnntgOhI9qAKPLmnhLc2U3RrfORIvQx9x4FAtnZRUR8rmsjl1Mlsg2Gea2WaQ9pjlT8TSoEC3AVkLSzorbMtIZ8FtJNAw1TEbv4fPay82Yw</t>','4cdcd84b96cfa5d3261668a59a907600',0,'','lhpwzyyb',1,0,'',0,0,0,1,0,'',0),(53,53,2,2,0,'216.165.71.216',1490556210,0,1,1,1,1,'','H6Z3jtz4NOR4gCD8LsZF','<t>5VxXXGVq1zsROcRjwT9Eb19iAPzGbEjQmowLsZ5N92CuHBPaCZ4vloLWM7r3v4Qq5AIXAmzwYPFj3599971l284gSyMSQjHg0KMHX3bZ2WZMt0M9aKlDexNfQ4DcFyIWdWdMHS5vzbpdy4899BENnvwuvBFfeRtnRAoo3T7vaxV4aCZlfdhVUoclEMwAWD4td3mlOtoi</t>','9554476ccc53dbd5650681735737ed75',0,'','3d3wxsi7',1,0,'',0,0,0,1,0,'',0),(54,54,2,2,0,'216.165.71.216',1490556210,0,1,1,1,1,'','wmKauBLiZnXRKsKcBHqv','<t>udzI10XXiKkIBo1hSg6JEaJVGgMZFPG2ymaEk5L3u2oUZMjLDr1Zqe7ZaDFvE21ci9OTIHtjA6WKsjJnqEIkc2IgauvgqXN2uUhgjAykca9WDiXDBwQtnhEI0Z2rPgz5Zuu2KQi93u4lFbM4OQthsCokCGvRreErSadvCWQoJdYeCVoBcydkuFYX66i1zluX4lnSAavD</t>','0ff609258d43ec766f2f4b2ac056ebd7',0,'','2adricqx',1,0,'',0,0,0,1,0,'',0),(55,55,2,2,0,'216.165.71.216',1490556211,0,1,1,1,1,'','wCjP8CSWaFmsS2vhbgau','<t>JCltMaM1NUG0pPXSNc7UwplLWWm0IG9MuijP7eKffoPiqN4NXNPwWxwwlRg00De9OAzzDGYBtJzXcLbpcHNRqhxcBso0BA5a7rBdYyIykcid6oZQb19vwq2pbtHD2ylTqanLmH3IO3bwQq0ijnjseT4b1l0Ubphk0JcQOXtls4ClKtN5xrwSRVupA381sOBybhMGMn7k</t>','c7f0c0af48c08db784bd56e205084582',0,'','jylh6sw5',1,0,'',0,0,0,1,0,'',0),(56,56,2,2,0,'216.165.71.216',1490556212,0,1,1,1,1,'','Xrqanma9DAUMzFvToPIz','<t>Cm1UiJFIgnxZdscGG2dIbUMEbereWF7ShZYjxGPsrNkCqnBznpJIZk6X5NTHCWXeJt5ofAE59ARGgMUwOGfBkZV9qcHwe0dKBeApsU0nFEmqyFITg6sTrYi7HzmsbOuISgngaaAYIw4agvldDYEczOkbVJPQZcUZHCUVbGr7B2MHInJikBWub19MjjK93yw4fjtHlJSn</t>','4e4de57d9d7d92a8ea60da7700209f89',0,'','1g6v7ntj',1,0,'',0,0,0,1,0,'',0),(57,57,2,2,0,'216.165.71.216',1490556213,0,1,1,1,1,'','pw1YFLkBBBiJ6MLbvgGv','<t>d2ow69Nwa4BRqtVEcsqs0j8NpnDMFOSj93u1bkASYRWGHtvsO5V21CJn1ThIJbjvoiUIEu0JnFBtR8kl99VBEeErnyAADAxE68uNnY7lVD7hfkrjcUhuM0v1qd3miCKENY6MalnHxHfLujNxKXn2Ah8Kr067DSCHwBiqzKU3DDj689u7lCLYebs8WemTuR4ky7Hit9wM</t>','ae4499abcfb079c1b0b464893aa81926',0,'','3jovhui6',1,0,'',0,0,0,1,0,'',0),(58,58,2,2,0,'216.165.71.216',1490556213,0,1,1,1,1,'','7qd1ke8D5FZj07fDlNcA','<t>1qknOhvlSWGWqzmBQjB3mUoSL3CbCnjtAUXRUB5QjlHxLrvXCLmOtLrBWG869PHr5nd2r1ELfIw1UTUmIUDigm3MYzncovzNcUThCOFFpe1s8gjbBILsCvtQU2t0wAtMUQabRNllb8AysWqCFMK65uexI3GPCDuApNmfY9YUkiLMscfY0p1IaQW5h7rugYNYrjkmQnFf</t>','71a55e19fe446cf948505bf5f11e1372',0,'','2co7s5ul',1,0,'',0,0,0,1,0,'',0),(59,59,2,2,0,'216.165.71.216',1490556214,0,1,1,1,1,'','DscyeTlVauo0WXZjqjfh','<t>IfFDDYabvQUZ25jJ47W3egJ843Eu5Op18JoFBqJhXREPhiMR8MfuCGWwzY3dSYkC4uxJlGHFXKdpVjYzUnQUjcqiztC1psNPiuCBE1MJVVPcsUiOTvLGnkc2mg4srWycZ8jBx9EsftBlVR4r0wE61PnAd0iwNQYICN24nOFUM0MP3PBwcr3W0KRVBnEsX3DgeJLxzs95</t>','c27d2c1d58b257fa76b2bb066576b59c',0,'','2ew2n2nf',1,0,'',0,0,0,1,0,'',0),(60,60,2,2,0,'216.165.71.216',1490556215,0,1,1,1,1,'','iJtGdNAgGE72l8QxBJPP','<t>A6cQycTf8NQ7lNWiUJ13BzRfi7aNPdHwDFwhndssVTd9RdiNj9Udf2WT67uh6kKloERMcviNHbi3HH1tQRsMUjnWtKW0rqRisRI1KGSXn4PWgbt013Ad7RS2EShB3uyLtfQO1sDlqg3QCDc3H5CBOtLHrv6KAaRAVQPhOEsu5Ewyooz2Y4hgATsdFxswc0J8NcXsAkSI</t>','ea2e58fb48ceff18636bdef5dc727539',0,'','1bfteesx',1,0,'',0,0,0,1,0,'',0),(61,61,2,2,0,'216.165.71.216',1490556215,0,1,1,1,1,'','wI23di45VUVk92qrCfOA','<t>Vb5pWEw0O4CyheyeDpToWhGppAwbGdex0eU8wBFsXJJHG2FqwylGuSUCStSapeaTqZYQuz6DbisYu4Vg9o5O1jIUo6RQAoRZiECOSbbFaCHmdzxUtMtL2qcODR9ObWp7gOItkJeDDL9UDZyPvIjkFkdhqtQClfX12ptCb33BGZLVESdLv1QK3Y0htCswnxc6bydhhZb9</t>','fab2c28dda94e03fc613a8e44e2002a8',0,'','2h2tgcqh',1,0,'',0,0,0,1,0,'',0),(62,62,2,2,0,'216.165.71.216',1490556216,0,1,1,1,1,'','U6LIb8bIshInwedgbtDp','<t>cdPR3s2yG6pbCcasrQ6Um3BbivfDsa8O1O3WJ9np3RxLp0xbYftEdsABHF7UXsCkLkqMvnh7qYKFtsoFr7MmqXc6S0DDoKmvhveV9pdSbivyV61v2beoIAxjCz0YapZMnwQp3zktYA8zvlaOO6BEgwceinV1rHBMKL0qAbNLOYtcCupyyMZNFFC6hU2YztdbtW2X2Bgp</t>','b63668db5e3489fde740946026d60e8b',0,'','3dar1u0r',1,0,'',0,0,0,1,0,'',0),(63,63,2,2,0,'216.165.71.216',1490556217,0,1,1,1,1,'','9BgpEQ9tc4zXpySwP4nE','<t>ypsRcNoTTN87vckZr1Gz68hH2D3uDSYTiwNuRQ5EQRJRUfkaTS90JVNZcd6y64Kz63OKJeaFPYBhgzs0FNmg24lZ2CQmcemseE9dPo4q4ZcckesoDWoEphnpTiik3RyP0S7fahzVSAOsaG6SkrWeDrBWF4oDjqkOTEcOveozIOg89NeUXwxZHXJpjSRzY0zxad29zEq1</t>','05d5764931ffba0c5fa16b0353c7464f',0,'','2ff7ugxs',1,0,'',0,0,0,1,0,'',0),(64,64,2,2,0,'216.165.71.216',1490556218,0,1,1,1,1,'','3ST8R28qVSs8e5AOgVVg','<t>2lFRgrwOrOJv0AFbUxaH4OXJ6tKwFY6JGdLRuOTUoPp671W5ymhlYTXWH6DhNFrlZdKELpKWvTalQsQ86Ew7T3ceH79VkPipEatJnEup7XCxP3T18kALc2vrOLWGOG0rQYN1SiwsstInYHG7omtvP0yCPEReMzDwge2tz1ZHVDTgZgEb6vdHeZZhiOlJ07mBJSSBseGf</t>','0166bb6dec655f39a8dd4c4bfe1462ca',0,'','2nudpz88',1,0,'',0,0,0,1,0,'',0),(65,65,2,2,0,'216.165.71.216',1490556218,0,1,1,1,1,'','HGmmjT2CcRklgbgVbJFU','<t>P9mSmVhLD5rHkgykc6EGuhu9WftpzYdrY8vBRdxNybsHQrdZBoKGlb4MxN8yttFf9AJF3BYxzMG61oQQymw2tUJBu5kGebqgnC0iPpmiQ0G3yLoUwBupNVK3hetSiVzdTf5CrVGAr6w3As2NyhLuHaCVhdmTAVThfISQYV7R6WAWozpP7lqRzrZK0ujelg2P1evF8j8V</t>','8757673f56d133a6e5d42e9ed8e2b57c',0,'','24gnarsj',1,0,'',0,0,0,1,0,'',0),(66,66,2,2,0,'216.165.71.216',1490556219,0,1,1,1,1,'','PEogOJfm1vthRw5YercK','<t>XzQ947Wv7u9gjgR6eDJal3E08H5Mxzb4dEfw6b5PQ5TLNn0PVmvv2SuKrDhyLReiWFoJ1vwSJ5cCEKzuMFFadewKwiVU5kOopyLl3NL4iRyPhE814KNakyzKHIqPwIa6BhnyQ2vr9PZklFuGlrh5SA0qcIn2zhgrBe9Ijbtm77ag1B1K4cmZxKFq5lYjzZaYQcqLCq86</t>','85a39ab8af7bac90e5eb2a29e55a2b67',0,'','yygur56m',1,0,'',0,0,0,1,0,'',0),(67,67,2,2,0,'216.165.71.216',1490556220,0,1,1,1,1,'','7srW0m7mMpvRsHjw1Fw4','<t>6kfOMpGRrV0Pct1kvUqzYB5pQNoGPmKZHiMVvL59jms0j7HUmKSva9cyT0S0GJ3tCY00HnVEHMozDnWRyTnNJ9u5lJrAQwAIPWZNLm1aGBwT5PVEsM1cjXtILMrBtnD1syasqiINCwuuQEs5qiCDp7twr73FZitfJK5XiZHil2toPbdu3yiwsLmQfLT9JKhVld6bknzp</t>','351c965f4742b72921136ccfe4b46d78',0,'','2i9i4e10',1,0,'',0,0,0,1,0,'',0),(68,68,2,2,0,'216.165.71.216',1490556221,0,1,1,1,1,'','W6Zb9tgWXGHv08672tTR','<t>kkUrMn3560nCfc1IgZpgvlsBiSM0qF1ofbwbDvxPH2bJoJzphocf2soObbooM6hj66WRH1zwEIjfIAMCm7HbFs1iQZmNcXRUMkWkUa3Mmdiu9FdX2iSIZNqXbbYtRldQrqjG9MOaisiYEqPN032VvLo00qKwEUtgTi8IxZ6DaDuBLQKgPWzPEN9ZSNKzpBn5aqN5IA5V</t>','57c2868b5f1cbd178b0b83c123920e27',0,'','fzm1q499',1,0,'',0,0,0,1,0,'',0),(69,69,2,2,0,'216.165.71.216',1490556221,0,1,1,1,1,'','7SOk9BMWxr3MfYhHmZF8','<t>bGMlCCEpbo9zfLicS3TbVRf7GxdN9Kqfo1IKM1ownuL8hl8CivQq7CJToWEMgr4oA8dk9MIia6f6tDq8fxYIOhmgWKMEqTR0mpbVTC8ePjjksgU3PJbra0LAPbJzNf2ZMSpxwtnkuq84ETLjK3HCJJLAS8KLkZpdpT6ANRYTrVDHSDI4byNeHXYq4L9SwasUIhxlGjgw</t>','72dad79403013b200172c742a43b7387',0,'','fg0xjdt9',1,0,'',0,0,0,1,0,'',0),(70,70,2,2,0,'216.165.71.216',1490556222,0,1,1,1,1,'','8fzRnfZI33BtApLfJXLx','<t>E36sSGA0aPEgxsg0Jva8QCxf1XratnIon5pPwA0BTeyNtIvWl9L1iPwKWn2CoVQtF9dfrUr4jcBde6YMNcKC6yfsnOGHYMfubtlEcKxw1rbr5cEuxPMNjb0Hm2RUWujnqZ5s6MdHjKMRu39EOpxwnTiwcseoKdjJHYbd5y68YiBmpVHse8EEpRDEP66ego9dJz4VHcsj</t>','645b8e4e90b5eeae902c6af76317e944',0,'','2zer5x80',1,0,'',0,0,0,1,0,'',0),(71,71,2,2,0,'216.165.71.216',1490556223,0,1,1,1,1,'','VatDg5sH9ExI85VvLo02','<t>1sZowECCqmXUkO4GuI9IECmXmIkE2Ounqgi5pQw4bvpZhWrByJxJs7LlnUX0PBCb1EyuTaEIyFrF0zTJ1I98fQljbIo3xUwacW8TFxS5TqOK7gGHEPo07PFgQloxQ9MFCcxw2BppdmXXi945im0TDLz68nhM3jvrP8dNvYRq0I8cevowJsfUh1pVMRgLx3REayHRkC80</t>','c0c2775181bc6907242d98199c6cf427',0,'','54emz6h1',1,0,'',0,0,0,1,0,'',0),(72,72,2,2,0,'216.165.71.216',1490556224,0,1,1,1,1,'','Xx0HpcbLHfsVSPHcT3za','<t>vAqmMkNQbI5o9U5ZK4QaPF8kgZ1yVovQvZjxah0uy1TwRDEWZb40KvwVsA6ohTQr2NEkjkj7fiY1nsl37ohM1XEmX1J1qqG2exEz8DvteUIQePG9ompfbgavH1A7MwmqhpSxcfX32gE3IR9sfIlsQ0wvPCotIEHsemsvHWSl6sIGfJ9nxZ7qxp0aqctl9HEgn614woTl</t>','1797f2a0e0a57c4c268e1c840c7d93bf',0,'','1fghsfzt',1,0,'',0,0,0,1,0,'',0),(73,73,2,2,0,'216.165.71.216',1490556224,0,1,1,1,1,'','bI0fqoVkp3tgtysf8vyh','<t>KMBpYqOyh5t02aIU55XLqWZXMN7GSLnfChoZnhEzodXnGNmR754MMRABrB5P4Bxipcf3zBTbnl25d7azk85blL9nzkibxThE0XWs026J03tqlwovJwvNIKkxOeR7O8l9bfU7N0Knj2rpYDXQKKDnK1rfWZOf0y6I3GasQJw3NsNM4WhZN5wTQfXvJFtFKBHLdJ5bKqRK</t>','f48cddd84ae9dc50177df3c5f8754721',0,'','11q1fw8g',1,0,'',0,0,0,1,0,'',0),(74,74,2,2,0,'216.165.71.216',1490556225,0,1,1,1,1,'','HLJ1uSYDLEAc3PYfNyBp','<t>Opo1VJgwlL4nCoHDmtE4kMSSfsBQCBfJEzQlBkUFOl2SjPkvTCRKBGR5qeUWMfDqrKS4JbuTRHsSFFQ4suQRhiSuerHKWaYvVuyFtzwMgx8omYXutSztkwsIakhqUyaSkZu3Egzgmu4sPuuAeNGuy8Efp6yn4A0LFHsfr7bCkU4eJpJxgETwiTS6yHcwWR6A6KwuMKXW</t>','aa2a06911165931e6755f4bc35fdd3e6',0,'','2dkds5wd',1,0,'',0,0,0,1,0,'',0),(75,75,2,2,0,'216.165.71.216',1490556226,0,1,1,1,1,'','NRH5BSYkiAjtvqhUGBos','<t>6VuwKJSMs0HsfgNB4n9PmaVFDs0PGonmWBWPRomOC0aTTVOjPJ5SZBMMjQK5PJLsQpmpvfBoTvzAVdofdjfzIm2NJxMVShwR9GrupHr0tITOcm7PWaBV0sl8cbD4E4pp3McGe5hc15t2WP27E3STo9nkGZvLxd3uMMnSDOxtI6qXsTAAIyznjf3iFYHqottHeyS3gncw</t>','78e5a3327177ed8c148c6704a8759cf4',0,'','2f1eufd5',1,0,'',0,0,0,1,0,'',0),(76,76,2,2,0,'216.165.71.216',1490556227,0,1,1,1,1,'','qJAeWGUzcxeaJHoZiwWW','<t>WaQXMnauoLqmu522xrhUD2MaZzZvj9HJxgfAPft70iflnRghoRksMwqtdFKOqx0z4QcDQOcnBeDWRbQgrImMZ4mIPRrj51NAjpJdqotHoaOfFzPzC7SFhSqzNUsPXpvlGwVbS4L4g5gIl6M3sp5LWsThLMcZCOYOVHUeFVdKpiVfkpQW5vwWeGBIvpIJoiEbHkI9dQxa</t>','ca4ae8a8d8af4d16e63da7245986734b',0,'','68uynayp',1,0,'',0,0,0,1,0,'',0),(77,77,2,2,0,'216.165.71.216',1490556227,0,1,1,1,1,'','rXqSGesfBnKNE7VjZLq7','<t>yNMdoBWiukWvjyXqkXrLdTK6Ipj87aaf0bqMqNHoc4FUpZFJKaAietWxHI4xSI6jeeROkkZ53jJCc8ki8Ak7BCv2HYMOrG9gm9Dir9xY1qKSIAN00broc5t37ldFqHsNHjLAb7r9XHFOwYzwqFiXYZPVMpne4lVNhY3gJo8KmnUVt132zuokqZFWALDDpjP9sAIFn9C7</t>','3980c7a5e66c3fee181e1340d5f79410',0,'','2otezm3x',1,0,'',0,0,0,1,0,'',0),(78,78,2,2,0,'216.165.71.216',1490556228,0,1,1,1,1,'','lKLFDrqk7YPbLWNzJFZ2','<t>QuzZ4eRN8Jh879qyIuo2LikMEDOzhQBBCSDTfO2H1jUBv5qbp2Ts2lpx1UvKig13fLQY3DBftafxiPP5DL6CCS76RrATIP9SwhN6zlRkGsozBA7keVoJde2P3i5bynGThmUtPr51fS0Vwqg0N67aLdcZhc1YnEaoxdlCM7x4izmwL9bP0tVxemu83uJhEIWdncXU4XbK</t>','8c73e41fb2269dbbe41bb9e085b04920',0,'','1ljdz1hi',1,0,'',0,0,0,1,0,'',0),(79,79,2,2,0,'216.165.71.216',1490556229,0,1,1,1,1,'','Erfq2JJEWHXe90xIewJc','<t>QMNL8HYZN91aXe0iGjrYbvmqzw0FFLJ589WZiSBg9ngsBhKtTR3zWeHDPGp6wDq8gybPia6oddK5rK4oOUOELYG5xjHI0ThoNJKcNTyXqO7J4g8rubEMaW42cw3K3DIsPogVxsU6FmodyJ23bdscHJFF4UdOuqdjPBpq5W5eWdwc3Hp7dzm96YXZpF3YZw8GV4ZUjYlZ</t>','c5a513682e6793b90b7eceacd794f155',0,'','2das5147',1,0,'',0,0,0,1,0,'',0),(80,80,2,2,0,'216.165.71.216',1490556229,0,1,1,1,1,'','v2Ex7LUoPicVJLDse4u9','<t>ZF1WGocBeoiTtg0pzKqOUcDXwXccgLronZHl0wfiAK9BxTvhFcSJ27LNREMRoYPyX7UedtwgtisRkn66Q9PaNHLX6XGxC6Kfs6wV223jtStGXBdMsWWGTllFmnEQLYmKLabQD8lo4caIRWrRnlq49g9QEASSU1Hidz4vJUPepBZqIrZ9br2fdSmKrWnN4G1gOtCD29NN</t>','76be8b211badd8c9cfcdc3de253442fd',0,'','3548hf5w',1,0,'',0,0,0,1,0,'',0),(81,81,2,2,0,'216.165.71.216',1490556230,0,1,1,1,1,'','4AitLXDeLhrQChMWzYis','<t>QNKKBdpWeDp22mtKLXT6R8gj9MNzPR5Logp7aDqo3UB66MH79CYZWghQvtoJ5rWm5ylviea0r4NnvmHrBU8ipZd25jMFjLBhQhWzX2EtW7WhhvtDDW2YPZAn9aeU7VRhiXDgskMIfyoP6fXXSvwpEcFf5dL9WjaQ7uBNO90IP3aovLhtrrwVYqk1u3McL4UoBWbSJKCq</t>','18ad07f36a8bcb2950a07307fade7799',0,'','1gis3sqa',1,0,'',0,0,0,1,0,'',0),(82,82,2,2,0,'216.165.71.216',1490556231,0,1,1,1,1,'','70yyGKhPK9f7fHjz3CXd','<t>jFHhK4LNoeubLZ7pKHkViGogeJvHYzpeqy2IBtduJIES2lPv6kOETJwIM6qo3LaBXvSJgzti4UMj557vS3F1q2yF1Zr6rAufe7D38Cf0ysPE1ecsY7r1xKS7VHxGHsFBipDKptpUdRuizc9d1eY2M1cr7q2P7Cnu8a4I53ehznZkuCGX5ZK8fJV2qiv2ynFtNERNFNaH</t>','1d188aeeb22d7660a454310079fa50c8',0,'','ats9drkc',1,0,'',0,0,0,1,0,'',0),(83,83,2,2,0,'216.165.71.216',1490556232,0,1,1,1,1,'','uJKrupNEDP1qrRgglHJg','<t>ATU23kNN4KstWAKpen4aMV0WXFWxRGXalgwwV9IqqbbvhZ6Q6df7Ty6qhBF4zaf8XAZ1l9y7BjJuczjqxyGCBjOPJ5DVf0Npxl43azJGwT2ExkoT6HptoJ0YWs16GmJdRCgz8Yh06hOQNHgjtQORlVRLuQrpzMn6SSDoJzmU7b0dcKIjEbiUxhott6ubWiDOC5K9pTaX</t>','f5724f4faa4ef411da8af19f4de7e607',0,'','kl446dia',1,0,'',0,0,0,1,0,'',0),(84,84,2,2,0,'216.165.71.216',1490556232,0,1,1,1,1,'','70FgGdncEIB9r7vtb96n','<t>K3vmjw8CMfVeI2aUZrSljjmOhte4O815aMghmAjmUVtysSIByOlDv8CutlrQhgnMYKwAtgqsbxG185KxxYvC4WayJrI8QfbqoKzLiLhpQJAqqyzNbN8iU5iUIX90wBDaPm74wGKs8dtQ0lGNJVmU3vScS7TQgmqGkTA7xlHDZzHOTIPK9FTJe7XwjKwMs3wLVKAEP3u4</t>','e75e278544c4aacacbf53c622e8e343f',0,'','2uolur7m',1,0,'',0,0,0,1,0,'',0),(85,85,2,2,0,'216.165.71.216',1490556233,0,1,1,1,1,'','Ua2YZKhMPfZyPPE16Ros','<t>UJz3HS2Q7hnSJ8b1UzBwtZ2lsrTVr19SMvz56DYbYigD7NX8SteGxmXJBeAnhwMBeQsIW0tyru8DhvUADSTRmQ9N9k3FdaA1FJnwAiQM3AORS2TTzp1FQv6A6mjhIYpwenLnMMF8ZvAzK8sayeXzBWGFUOyBefV266fMXyO5teJmvYMqHbPEx5ZS55tkOmUhNLV6i4Ys</t>','91f72c00529d1a310cd93c7b919cfdce',0,'','3g809f0t',1,0,'',0,0,0,1,0,'',0),(86,86,2,2,0,'216.165.71.216',1490556234,0,1,1,1,1,'','Az4DzI0WcMiFuzbyDum4','<t>VJXRDvsrL9qJsDbTia1WhxsttFXhkDvPKcl8VpRZyHhkQV7zCHm3gQWctHtigFVn3Ch3xaFWGkZCz9xl0992aGUDdKbVOLxdXqbdilPhue2DXFABRJt4aoNBhSuE6XTRVS4VV1mfzb04DP1fAA27KEuadJEUTOXkBxVfbWaQerM9dNm2sMg4aJ8fQr6ry87ACJbQdTtU</t>','f4fb2ece004310a5676ba81fb5068116',0,'','3uz0zgbz',1,0,'',0,0,0,1,0,'',0),(87,87,2,2,0,'216.165.71.216',1490556235,0,1,1,1,1,'','jt4lvKE1oDm1K5C41i04','<t>1irU51tyO5IFSkbdrFsqE2qny1ZDFO40Q5HDRmnM6dTHgm8H1sASlMYHe9oxqCMETpwlBYFsxRYyUWLzYCf9s5GII0wdA2TFppvyS2ultdQu7jLzjC8ZMsYaU5RF9FahsgRoYjHmW6jUEINoutmcPGWFUc88YJbesqBEkwNaGd7lqepcfwXmPMKMK5615KICVJmXqh6I</t>','823cfd7ff00e078499334c43a8fdcc3a',0,'','dl6jby5w',1,0,'',0,0,0,1,0,'',0),(88,88,2,2,0,'216.165.71.216',1490556235,0,1,1,1,1,'','a4Jr6P6z7qJb6wjeowuz','<t>IXLJcYDRn8b214uagMIS4pdYqSzcZ5YY6w1mSXNv8g2tOftoooGxN6nAenotL0B6Nys5KSi2YLW5oSvx5Eqbga76h1585uNuvFxHpz0rQGCDIZKLhtENtzvVHwy9HoEF7DQGZ2U8ierLMWMdwmasJObeSE2MT6VGwHQNne296jUsskG55V0YRkiToHencEIA5hdaHxdr</t>','c8d43991e9aa85a812981a7de1f2ca05',0,'','206r8sue',1,0,'',0,0,0,1,0,'',0),(89,89,2,2,0,'216.165.71.216',1490556236,0,1,1,1,1,'','LBX99OVubDx0UPEvpdbu','<t>Z9ojvAM0iR7sAMVda0d7LvCda6kKa810S1tm15ot7QVY9WAVo5BXNmHhx4TczRBBTauFi2Z9jVGMXCvYgaKr6vCrDxq4D3QLNrCy7AiGscAUG2eezt7cVxNM4bySwGQes8BPq4GiyRnn5wtVigcdAObgR4NFK2EWoRgPhqFdxS6vXo3n2fAWTpAu6LX12Vatyk32dD8p</t>','40d7a508e135916d74bd91df6a78dbab',0,'','33elh19p',1,0,'',0,0,0,1,0,'',0),(90,90,2,2,0,'216.165.71.216',1490556237,0,1,1,1,1,'','JZoQaB5DyOR3FTfxGT1G','<t>ScmnDgP7HkWXXOXcmk7Rrn0TLsh77lIxgCIJo5lasTzXH9q4swzZTJqGUwmlVFsfDXCa3kyK6Nfqq3oRFC982qJuBPkTCPyvLC311HGLCei4CvoMTI2l1BJY8bN6NC1yyHR8lBlJUsJ5MaZ0fFj1Ci63nhYlwDEH8bpgKKwz0dcjxCGPYqKCq97h8XdTEvsrNFBHaXBN</t>','dbe05d96e7ea9ee72113546fe04d0d74',0,'','3qdgc5ra',1,0,'',0,0,0,1,0,'',0),(91,91,2,2,0,'216.165.71.216',1490556238,0,1,1,1,1,'','XxzCe8L2czUzIK99vU9b','<t>4oApSzDxrGwOCBRM8vA8TFeBuCW1AunHFdCmgntop10I6gz8VSCgumNEFWPxzvNrcCoPZmbTEGB6jinpMD5zoSdj4PjVEVDWmqM0C275GmP4uVksKqaAg5iYi1i64jQbsmowpkelcmWTXdeGWp33548M9U55PrIzwFczj87lK2up0suzckEYq8HlwAldynwEcsFWOXJV</t>','84fb82389664d90166beedeef07a4bcb',0,'','2zn44msv',1,0,'',0,0,0,1,0,'',0),(92,92,2,2,0,'216.165.71.216',1490556238,0,1,1,1,1,'','RkGR2CEsdlplrQW2mXPd','<t>CmmBDfaGKBy6ddWAcmZ2eJynT3I1jVF8ibPjK3LTDzqdN4uRPiq2iwY8tBSnV3icuX3Z6IyXsO2tifwM9UvQETQOlc09IUw2mlkKUONoyH5YVb48pXaMe1AqaeVtV9zZc6bZ2TOqTA614HAthCIETzWYJhTr4cDqigIiU2kjFVlvlRZUI8PJBFQ2kQwD5P5GFaJR3zO6</t>','c56b8f5030d1e24cd93f779aed440add',0,'','2tn2unn9',1,0,'',0,0,0,1,0,'',0),(93,93,2,2,0,'216.165.71.216',1490556239,0,1,1,1,1,'','ex033CfAXfVGwlPqkaya','<t>BmW8jOq0aD5fmHhEDBUPAkNTa5Bvk6fvOknCRWKCNubI4H4lUy7UJh7QPx5DGLNN61XQI25E3VdLf08iGnJAY3jyGvrF0e6onMjEu2pnhvzk22iX6cwNlpMwxFmVLihff5urLEGg0rR08frMoGxuCb5En5kWaZLCMsXAoggLxHPLkYqkFlnKobDwt57YiCq3ACAyIGa6</t>','1ca1876c038b360bb81f20a9deb008c1',0,'','33utr29g',1,0,'',0,0,0,1,0,'',0),(94,94,2,2,0,'216.165.71.216',1490556240,0,1,1,1,1,'','aIzfsvvzLgmWtKWyiN85','<t>6NMKjnpvVZu0p9BpO3jy7Hl5liKs4prqK5goXd6Ng940MZPPliLGWUMM462DkYkADcPeW40apppsK4VCc5mx9O77hktDZksXjRX6nMYnoEd9CTnisMMWGHqh64akMIIW5fqrnjpZHbSCbiF0cpplgmYOCTBReYjapoUaFCWkQkxcgtOJ7nnzHVAjtgtfegTMTiLmH1Ax</t>','e29812be7eede7e6cddfd683be9ff471',0,'','3a20bw1q',1,0,'',0,0,0,1,0,'',0),(95,95,2,2,0,'216.165.71.216',1490556241,0,1,1,1,1,'','hZndpWKuZZD5KLYmHA0u','<t>gMlcJOLM30ew4HrZKKDx2JddB39tLbuDQxEYAgVO0gaoIQvn1Q9DjZy5CHTw8DBuyCN3ohneoYQDUCRZDa9BRgNte2zXwNjcceSPiWmiH8ChNI1I4kOd5aOPWoSuIVxniDFr9vuZ2jiKt4qqkz1eRt8og5v23Uq1jq8jhJ1emaqtodJkm1i9Nql5vtYxRpnvJraFxu3y</t>','42f3dcebb5807584ac2518eab1a925ab',0,'','2kl77lm3',1,0,'',0,0,0,1,0,'',0),(96,96,2,2,0,'216.165.71.216',1490556241,0,1,1,1,1,'','cVuyxkGzlXG4NRun5i5y','<t>Uko7Cl9DEtmLcxEHI10qkeqvjJBRUipo0oXggYVqZTBAtLe8xdAA126XwA4ZojbJxbgRddZknaBKYZKwOncQmZpf02owPOQqsfvwgsei1dpHXSeaBG9C84n2vEzeGU0roJGWdxJkw3K9flCVjvrrvSNIEuqfiBGxUuhDZJw3VUSVLd4LPHQXsSlbC8dVDMZRitHdleVJ</t>','1a1376d7b42bc21fccd88c4554977ee3',0,'','6i91kml7',1,0,'',0,0,0,1,0,'',0),(97,97,2,2,0,'216.165.71.216',1490556242,0,1,1,1,1,'','VMAHbm1z6LH1qEo1DZYE','<t>VyctT70mVywm34gMRZ5FCcelD1jPiMNYHCM13nVhrKz7oREEKm6kc0tE0iQyKOGMKFhuZZYSlIfv0KKQAF7zPpPTcCY1nNlUuBvzryRItv24MDqGdQEoWmHkIF5vMw4nc31c2WujOGQ2t32MKLqFF5514F2QHEPxdDaZsytdwEtm3TFO7R14ZexvIIYnOX84Mdb2aqGY</t>','f4b6c5d2f95e27c05e4e2a95c25f2f69',0,'','2jqf5g5c',1,0,'',0,0,0,1,0,'',0),(98,98,2,2,0,'216.165.71.216',1490556243,0,1,1,1,1,'','j9S8l5O3mRsrrhUBvzRK','<t>5c93oWrUIemEkYOqyH3TH2cN31xAyherCmfuRcC7CryCSJe4KHozTiRpAA9mb5Klh48rkNrptwP0yBL2s33RWvQTUmFIXjAoz52tSLNcI3eeypv50vbqv0JRshmrjhmbXfmoGs2xOfiDxXkp69XTEjyqP4TsUe07pjMsyPSingXOXh7rOcqklur6wk0CKeL9lgeM3eal</t>','b6c1599736f69d22c2e387b74aecdedf',0,'','27594cfe',1,0,'',0,0,0,1,0,'',0),(99,99,2,2,0,'216.165.71.216',1490556244,0,1,1,1,1,'','n6a5K99ms6Y6Z7J1ayYI','<t>IKZ9heypyHdkfZbH0gu3Frgr2EvwlmzDHQaqCgCNsqLblZHcR49F2KzLvCStuMYL5khtDjKlzrR7a9DUmTzbPYtsFJopg2RIcra1NFa1NgHWNEE8t6qbkkYBWIzNbkbXZNULvD1614AkUdsXu2PQQng25prwmZ5BExzyRwf3wOSzsBijTbOi33BMziVT4jR3dM48Pb7A</t>','715d34e703e13b7f82732b0f7a50840c',0,'','20zmjiul',1,0,'',0,0,0,1,0,'',0),(100,100,2,2,0,'216.165.71.216',1490556244,0,1,1,1,1,'','TOBclOMYGBM7PvlhFRXE','<t>o6BC1PW7ILwRh5SlNaGUXrH9jvedcOHRwQQAciH0Za1MwOBCby0J1FVhx7r1MyngxJxr26gPZyAAx9jtBt8VAxcuBv6LY23WYkTEh4NHgOUqzxqVlxVJj7HlszCzSbMuyBVbd3oabBk09Q99aECANzr4GF4HmYZU5SHER78in2diqBYqK3E7B62k0zbNsIZBSdVY4Pw6</t>','37a7018d2a09af6cc93c702c8a4c3e60',0,'','3vqcntdt',1,0,'',0,0,0,1,0,'',0);
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
INSERT INTO `phpbb_search_wordlist` VALUES (1,'y5lttgz8vi90ehbvrok5d8wnc40wzjxovb7tscud2qvnaiiby9kgav5cq3lppkc8c4bqlzqchgikspgncs3ptrcyb87z8doy3cjftandprffcyrh6aykdlbfn6jxdfa0kwuei4u7ilkqlkvhz2got2773qimk50dzrsrpsjfmpilz9egnfrrze7euchlo0kbhk0h9ost',0,1),(2,'svjyglymajzfo13ndp9b',0,1),(3,'mar2tvhy6djvsqmjwk0o9jb3llbrsyt0tsdsyswosdzgqpkuvgevxlkkh135aaucvuosvupmiypkknyeqfrqhjjqk2ccke3fwljfrrdtyixcl9rebolhnkdgsxdpgilvrgdszs2gkijzvkhijh4glxzasdlxrstlx2faha2xb4abgjzfp1efvpshjtrmexfgwmm9tgrx',0,1),(4,'onn9f2nm5ecb48l8t6dt',0,1),(5,'baczj5nylultj2yvzlfjoh7kw0oowrwikc3bmxnlz53jkgqpj9mawyghdmljsz5khmbdlq1vanstwqqzqks5syhmp7roif4dkk2t29j1lrz0f2xizgblmgopaw72fs2becofngf1ufv6nsiv99aebbup7e5hwetpk9rs8shb1mw3iuj8ds6drmqpn5qg63vnx7o3uib6',0,1),(6,'frcslzexr41tlqn2wnrs',0,1),(7,'knwn7purfuatbfvhzgtpqt8ak0torj219k1yuuiwdbfwxynskr6lyiwrcsrccls1yrnecjgx7l3pcmhdesaowwbn1bocqd7tmbxsdzigqjgdhad0o2llyqwch2x5dw28xpgvwbuiajd4k7keujdvnpqndsbr0uptymwgcckkagc33rsgmcvyfcy5pvstdwwwmmnyu2rw',0,1),(8,'izfj1wcindlcfx4q6rdm',0,1),(9,'z2vav65yu9stsuzof9xb2lpi1eqogqh9wmqjeoecizbcbocpqmwsyaiqkyuftc6im8zsdywksmges2j4roz2y6nz64vscomu1mcstkise1pgqiv3hpy5eg1l2eayz83nndw4w6w6l0aoyzsowakujnlpuy8d9ofisexbentukdbvrndwo819eles1b8ye1jy39ldt1b5',0,1),(10,'rmyk7iu0xr0vvuuiwc7t',0,1),(11,'chvbc4ydocv0ymi5z4bs2oy0dyt7igjidrhhaqr9c4vq8ftdqwdgsvfoi4awczojfl8uved2rsyz9iuzfwzjpv1qbiqtexevw6p3rmz7vksg8hoabspwsaglo0mi5sakk2p11wyt7nyuosb5jq2bra9y1qrq6isbwldgpbm5kvew6d3taabhhckxqx7rklf7jjkvaake',0,1),(12,'lcwgcdillk5uoacztr9t',0,1),(13,'ngpqw5emfl4tm4dk6ysdudmj4csfcdv98tyz6dor2l9ecgxomwdg1zigay5kyaup09ofn1agjhzy2aaod594powkvwdqrr2k4ddbwew66rupfyiikf0qt9fjzhcyfe25cqnufwybo88geybccy8baznwj4rfklkxb6vrnqm0dpcum6iwd8kp8qgfnu9ke7nhfq7xmboh',0,1),(14,'n12ey158l24kgqkaoqh3',0,1),(15,'v6izgdmhgvcldpdayogu1ddwvdqbww1xbanjt7mcotsj0g3qpafufccaea6tnkf0bpcywz13e9kopyyb6syihbb48rh94sca4ju18yqd9mmb4j0rwfo6b85x4zmhn6cizhmt0ddirmvxplbbkuomqgjdjfhhfgdzsmshly9htvjffzvngxuxeosurjvrcbks6t0cencc',0,1),(16,'qlgvfq75hickgy1xwr96',0,1),(17,'ugwsuih2xoi6surieycxkhxywsandazcisi9axuacrlqrxc2nxtt07irt1pcqsjic3fy9ycds7m68m2lhn2zhrgjsew7v1y67qhr2ypb1iush5pyeqdw5h2ww3wfq0v05thgbmekodp1x6k4odtaataw5eqvuy2vgks7ycahusjqfqfefdseyjhsllmcmxkprqcoadcp',0,1),(18,'9wx5zjnxirif8eldgrah',0,1),(19,'rsbvtdalklatxu6wvr9hhk2dfunn7l0ghcr8qdurbzzyttxn7o7zuwja3u4kamjoxi6u26htogcnakgodlm5ii3ybngf5dwoywjnfs9pn1jcrrffjtzv07dqo36syxcxi2yt4nks67szlxr26jy1dyha8am2ztnhcphn4iotfpb13vho5igichla7pdpqfzo59r9dq1q',0,1),(20,'cl7oy3dv0hsft74zyn6i',0,1),(21,'vwytdtas5opjq2fvopa925ghjkf8bjvnwbvns219sznrwdbn4jo4tyaxb6qkbppqbi5phvqkepgmv9wdnhidkssaw47y7v0pstjnnthccjejswxh4n1ifjiergagvsdeugpqegflojcalwu29csoxj4djc2dqktalqgo1ijipenzhi9od15qumx8pllx6nmrdw4cvnml',0,1),(22,'fvqtmgsnqee2jeiluhlk',0,1),(23,'oqoenrxn9n085uzvhqrmvmgjiqibkksd3gxcygvgy0ek49wyfmqfpx01vfgdpj1fam9wunalyrvfjl1ibt5rtgpqbt2x8besuo6iksgemgsvusdjueu9drs3672pdaflw4a0qolnqy9dzkki7zysizbmox17ruzcilbqt9i2l9lonbk836smqnxfzy9d1o5edy3eeg3p',0,1),(24,'rdswojumahhwndx2xcdx',0,1),(25,'oxyzqanumw7bq3qggcpwg1ppyuuw21hma6c71yhj9wcxwun8z1mokkamvcbup0kg2tqlu8y0vn5l3yz3bmxwo1zkzgviguo9b0qt9c5p8cet19nfm2h5xddyeewcom7f4gbttpaadzgzi5hftqxuei3eptbvvifu79qmxqwg0xqwydv2iemdush2drtwa4vgssy2xlab',0,1),(26,'drmcjehbzgbekqgvsjw3',0,1),(27,'rskldxpshufqhrimfsrqaiyitjdrhpjnmljtcqerauhutczy9bsoqnvahks4ahfceiv0gwwoqjteszkcsjfvp4nnypv4qqncig9qmoeubr5in3iqzpie8zwvaaprclivyfcvgyqtnnan79fosekgtfr4xrch6xhaurfvhsdk4c8tsvgfogopbtsrjtxapzjbmi38sahz',0,1),(28,'evv0jq6q99a9q4eksduj',0,1),(29,'hbdd2be5lc4yybjl6gcjyhwbik8bl63jutqdrse4yl59wovpqunybg4z0kxkbaaeuek0glicadau96ruatbhnqc154lre1bud3wa1wxgz5oigoqpz63loqgso3iuvllikjvjp4fwwryem7ndrd0rlop4tzkyso2kh2kpbadzdjffb4mrhi09rnhqg6nk8gyhyvhm9wui',0,1),(30,'rncvbbm7uimhxzy8ahuf',0,1),(31,'snma3mlnqechw3ldqeuuhwpml28o1pjzijv4vqot7axtaxof4reyc35g6oa7qa8f0hclyda2kebbrff1zgsd6i3uwwprlk0wzwma5y0dpybuhz8yulmxwv5cl128vpli8gfpevaqkt52qivmxx71y2imbry3h1jrrqruwtpolqlxc34pevrute8ukcyxahw2fpazhbub',0,1),(32,'cdueiba5mbobvajmhd2b',0,1),(33,'d5snpenemfsznoxvazgvlbe5xts9k9om6yvmvx9unrw1lv25htjweg1ezaoqf6trcf2aqdcodoh80oo6tu3nnmnucyckyhq6rcjzdgwncsl67ieomokndefrwwkqxkjmery4tzgxpegi3uefxzypcwfkjhqzjjimlnpusm6xzocajur1ipy0vjheflmqmeuhjqpamjpx',0,1),(34,'vuha8pw0ejmmyrbf9hbn',0,1),(35,'sgxjhvbnxwqcsqsz6mzjlh6sb1klwvqi1wewpr0zed4u6bgdmvymx3unjlus921i278ytzqcawlr15ud5j2az18eeo623tzgtlzzrzdqpdaul4409gxzfl3b6qnnsjnghsoivf3lnmuo56z3hgforfscutjua4aluopjhl3qs3xw6bwxa7hdtnto0lsxp0mjggsow1hm',0,1),(36,'nf09dts7geh2pvcir1iw',0,1),(37,'iidotuhiexdppn168mhrlbofm36yh9drqnaitdcedswsdlfxx6qdbddlmv4wmpkjpvfvq34655asqd0am0ujnt1lzbkkop0eld8vvucfcud5mglekmver1pkqtnddv68cembfqya9vbovyhydkayrbrtmlg6ao4cxx0sz3kiy2pveuvdb0rbztggedou8djrzfj0hufq',0,1),(38,'irvnrpilra7zb85j4umh',0,1),(39,'ltyubl1jqtzqdt6am2mip7kj0amgjhkugl8bmyvf3lkhqrv0muuxupeh4s3zni9intcdcbdsc0eyhhazceotlnh5forbay3jpknuyefezwcjawb65uv61yjf24xgxspbxruukkfbymdubcxqpdaz3xrbtj8klrezmyz1pmlzea4c2kis46kvjlui2dp3tsj6brux9avg',0,1),(40,'yoz7filb633bkwjcsrsf',0,1),(41,'qnsgewcgytbkgsrxk4bntoptosjq6gpsldm0bvpvnefnwicwfv9bxmlwfqbhwpsn0xzsbuaisoxwarlzfadr3ew4bycx9skmrvkfwxe6bg5utfzwmj0siukvmbkptmi3opaigfwhawzwwc7twvxmctgsbcsqt3szz2lr363p8f8vrll8q7ofpp3tkbuen52tqsl9n5cd',0,1),(42,'jbvtskyelfdv5ysmoiwi',0,1),(43,'xvttuq08wfyb9v1oxd7bfy39vf8fde2ukpjsp3rysgicgj5xga4vzgqbt3cqd4tgiftbm6ll6rt4pudm4afjnpifuyvwzgobaln5gyl5owcphilunt0ghmayzxoeldey1md5xp1wamwbfbtloyfso0nxzfiycuj69toxfnlbugr5hoowrxnlxdvo24apbmsvxfwgh6lb',0,1),(44,'slw3ki9bm61yvgjl0knq',0,1),(45,'clcoseofpjzb8wsj8ly3sv637cybe4npxd9ci4bsh0xml5ttuxxdtbqi1syprqguufiwbqpwixrfdtoragzaa4teadxyuccjpwqgwkxcekdludxwuwecltknwwapamo0abzmrkopmecmrmxr5eccq0h1s3w2fb3mjpbqo9f8cpb52gvrvjxol8rs9z5np5dve8mj1tq8',0,1),(46,'l2uu1bcxepnyj8eyrgor',0,1),(47,'8ipurypvaxreh2mnprbhmbfjpewae5yfyc3dqa5yinwcfgrj7cyjtcurbxxey9ccf3bwbrlfzaoczhcwuzllwrrjjkw5kcruu11phnqq0z5ztynu91lis0ranokgqnarh4csjyqrjocrguz6kgff59gtnhkgdvmuyisuiu81lkwdsa12mamc4gbcvoit29z13vwjbgjo',0,1),(48,'ajql132snxj6cakmee7b',0,1),(49,'kns9rd23fqr7k2zkhcb58rcvnuo6wmkcxvfu0sohckom9ew2j5r3c0xbrtw7qdckwxa5tf6sxpugnztzkakimbyp9ctwcxnnotdnsycv4mrnpejpevxo4tixtu169ijzuwehatfed4k9ckjk8holw33wbzmrsqexnqq3nhr3d4grgacrzktvjeucanpddtk5wevr3hp2',0,1),(50,'nfjdnd84qz9ibgdcv5zx',0,1),(51,'3bshhr6now6mmb7lxewrbulu4xg97a6mtk36ppnjcgovotmddggiz4adld2lqg9baqkrgepm0gfaandq2vfnwvhacajnjwkycbbeyvu8hekhevh7kgm2adx6ohrwkkcsru6fyidricijg3oooxucabib3bumg8bz3ygisighkhgc3zmqafzlrhwjyyd0w1equhkdfzpj',0,1),(52,'yb4tfabqdx0yu0zyrxnj',0,1),(53,'ofestbesxhyupnkbgt0adg5dejdzdk7a3zh1gkzmnnosris2onqevahga4fxlelolylususu2mwyqup2sovzsw7iquohs8jvpw2acdylvqjbmwahqlzg7bhaeuwclpquyxrvupbb2n490kfixxlilt7obyox5fcfsvmmvjylrqgxgvhvk0f8fwth5xznu7g6drlyra7p',0,1),(54,'nms9bzu3zhx2rdzv94is',0,1),(55,'lv4vxl9znft2k5w0vn6qkkjtdcg4rnvddjuhiyfk51ztpgbs588by6arcy4764xftulljnsjk58hplafwypwcz2a3y4en4gjzw1j8mkyyylmzvwnxu9bqsvang25ddflxivcq7mpmkfrkxlvx36qdzci8yyqzr4zmbjntfm1idsnpo4pfpidyrohasde6q1lwmbgch5f',0,1),(56,'kdjvis5mwcbtwffmb00k',0,1),(57,'1mjwahsdrkajjrqvulvlzul1x71305rhs5amnlnxh8mgrqxxjrqzcrcmjh4uovniqdnh2xpotagcs13cbsxdxt7feqfxnxevxkt4dpzxd6ox5feegjx5q3dxnfwtqm5tw0isljrbahhj9ybu2vxk4i3d1z8zumuss8jyfezmzlt8kbw4rd40zd4nkrm0ruzdmkrgrsbi',0,1),(58,'2barvxyv7gulmwrq7afc',0,1),(59,'t5dwjpaaey88phcoyshcquzsr3qqnavkdalvt19hewrzcs9ycrlp50sdhofu1q9jwg6bdz5uawfygr56jk8whyssvyboewrbynfcitdkbesctpqwvryonhlvudduweu2hqr7jjqx9cxgcojxntvmgr20s0ybmmddqk0rw2nex49gsmm7spz47q2cyuhvuvhrilyr2mzj',0,1),(60,'fidvrrwcqylkxm4b9cpr',0,1),(61,'35iiokzcogkcyaa9fdxfvhemq1twey710u9iu9yojvovyixdxrpx0jup5xjrxz39powquvypkmtusldh7rl0wpzam4n1lrziefv1b9sko1otevfdvczuju1pr0y6y8lopxsmco7xzp5hr5scaervmocfxuns7amldt5xzahaz8k8ze9d6r0c07q51fjiedwgjgwfw9en',0,1),(62,'8d7wl11czpmdr1c2gvbk',0,1),(63,'io3j2nohx3vt8uewtfydvekyr75iimddfqtp1ew2ucahrkjdtmxml8tmebxlya89k2q4biuxlvgmkymerswok8muu6r8gi58h8o2zgv34twaio9txoul6wcuaah71t47u4md3gnxpq4jlzzyj8buzkesm3zhxcx3ksrvvedo6vtrzfmjvvybnejauwdsheiop4td43db',0,1),(64,'my22rwkz6rdvlja7qcjg',0,1),(65,'zsyyx30ctfw9aae6tanu90jgmoqxabkq4alw5qzfqtbh2t90oz6fwrenuym3qghpz3sv65dtjf8wrqm8f5a4baogggssnz7kaophqcqwqfa0npxaunhdujs330lvabpcf2j8okzg7ae1cbutrgjvkikrgrsqisyii1s2d0tk0nrqb1s4vxvb9jykjav6bbeuh6hwulio',0,1),(66,'b1r6ph2w3j46xfcmsmmk',0,1),(67,'jzryrmwrwd4cq2sktsnep4jlydrnitqdm0zacac6yfkdldi3hljrdcvemiighhy5gyobfvwdqlnxeepzsw1g5boiutgydmppvubqvk9k2kxlsaznezzvowwziqetfwizafkz9vcrijyowqs3hiagarr6swgy5bbab9qomvthz0xaso85oyr00qihxwkr2eosokuxjgp4',0,1),(68,'x6eoolplmfuo20a8diaj',0,1),(69,'y8lpq4jqvc2lvxyzsrq0pwvzuidmvg5comr62dirm0g4rdmpa0mjxdr9vlaukii8itkm2mxmchbrw5q77x8zjoimmt0pb8j2ijunygiqluwct3vh9xr3hbqmvqe94xpdmk7jc8zv5itiflv7nk2aivznwd7tws3jqiaajicdqvavunfpb6mbeul3kvg2o1ehxgf9mtng',0,1),(70,'yf0nobny82dsmplcalt9',0,1),(71,'cinyh0wlkao4ymnh79mafr0grhgxfpo0qq01potehorspmmqc9ri54qo3bvmmm1z6vcc3c8ctphhqsrejpqglwhtvofb0fahyqpzd275hnq1gkuw0n5sfp95rttyxug5a8hh6uupcn9gtjbbpnrxda1jrljvopdgxjozzhp3ugcnrfxtifywwncl2nags6gxuwpk0xqz',0,1),(72,'cxsi5yanrrsjcvj6xhfr',0,1),(73,'h7e9xwwlb5trwgf4f5u6wsvp70guaxdk2oudky4kaw2ttuo7w0liz0ewv2zi3nt5otsjmnvoyimblzksnnoikukyl4fvllpynsppck9xygba55ur1kumnwjsl3nwlp4ocbk2zukdtol34wy90jmc8jmd6gzkj95kceivb89eedd79k44qvhrm4ergospjyekjkhb6ozf',0,1),(74,'8kfbamry7qx3cbntxpkq',0,1),(75,'tvfl4a29zu7dehvxnsq0wfzlajeg5tl0dnmh4b3og63vlstiedqejcjc8qrkas279ojrjpgvddoxjqe4loyjpswvhdlzp2i0c1hegtktbv9lxttgycxhg63p9vybo952zknctd1qvoeuhbjj4qbvfxeig0ko4m69o5qrhj8zvmx1c1hxkkgqmvwri9fhgrhzmm1xi6cg',0,1),(76,'z3ysp4yy5vyd79fl1otk',0,1),(77,'lsj0qwothgxehvb8airhq2kmcfki4pucqsvxdq4jwcuyctxn9bmx15lrumyqjcvebgqlmxixlistrars1nfr93sk9wgrmfaxpdezzluxqmulcftojmx86u2miqrrizitbj5xbr1qxilec32y3qnxpn5gf1wer2et7nica7ltj00y6shzd3kkp7eliofbvlqgsxz01ojx',0,1),(78,'2xx92tfytpirobjva8gq',0,1),(79,'kgmvmanouwsxawvierzllnw6bh4my88gdozh6osthkgaz0ywao9fl3biforamcgt6pd2z0kwdluzq3ul6nepjiwf45itt1l4cwem2dfdtplhjcqj1hg3w6kj7chm8yokulkvjojgdybo9utwvonqkh6gsrjq93arsyhs6ysz5qtujjyi4xcs51racj6pklonogrqonps',0,1),(80,'b5lk8s5lfxgjw92fhimc',0,1),(81,'x7f8eify1yrurhqhdsnl6drn1rxm7tfz0smdvwrnxhaczrqwdtmz1ab04mxnqzfbyzqjjlq9rppi3dpt9vga43fra3f2eegfas0sjdk5p4onqmnvlxt37gi9ekxbhwh40ooh5qpi6u0mq1mvutzjoy8cttydxn0na8dp9w21pafazta0jcyyri1sofnu2vrvdxve1e8v',0,1),(82,'masrxni25ky044mwvrxm',0,1),(83,'ps57qbuseeos86dkmv5wuxib005fw6marhgqnzfs4xrcllir94yqxqk8iynsdyxtif1yxoh3a4xpr6uxgumbdhvkorqzvsl3t8upban2wk5owjrdk5gkzshh7yydx6n58m2pv3zxpeltekn60s6i83w62zkwjbeq61kzxwxy5sjoggsitl8clgixxy8umqx872dnkmyh',0,1),(84,'brga52phibjnvvncmjes',0,1),(85,'mzaf07ieueucqnitqeqdbtloepv4uhqywf3idyciq9rukffucpuinjwgdrrtoja694m8ejcbbpe46jdxopgyzeswp9dsxnz7gkqnbklk3mv9vgy9xg1gflr5lmb2yqgbdf0bgcdw3ra8wmvrfkkknvs8rhxiip172mf7eaoiy6sf0wmk8eudol3y3owuplxalivmu4wt',0,1),(86,'xkminp1qf3im0laranl6',0,1),(87,'ylebm7wnvujrdzmt26suabco6l3vqahdpbv3unyuecpdipkggwrcyydslx1h4vqustwk13ayuuuq32mti4acjxii2wudrnqjdvwhnckoqwnmirh1r9gyt9w4mkwtlylf3dqvgc1dtjilxzkjx7uooacubwsxn3untdkqxyzib9lpeziamdzh40xq1cqmmliuxbzdkeqi',0,1),(88,'6pbxckkd1evnp3kpnhzo',0,1),(89,'s3yygupdmnodd5xzwzsmbtagltzpjpcvjmjrowjrwsifrtyjevrf2etbrsx4uuqumkytunpqyjlui6sbihmuywhysskl5atvji2idjnbkq83ec1nott2wndhi3zwnnsvkxseal0ladb5qjhjufbdmxou6qpps72rivih7gf8kwcva0hskwcr222zy4zeelwcmeg6qq3m',0,1),(90,'crg91qqaacghrwhuchqe',0,1),(91,'x0bj3mqrzud2o4t3bubuigg6klo2ockv8kmvjhl1qeynhs4cwnmyjxm4keiktgoxgdyqlcmaxbuiulwygzeq0hvuuk7rxfuukjukjajgxyly4jj32ea7iag9xrzcs0x29yprqzwic1bo6crxfxgsyc0v1fxphxp6gphmovetai02hs2rbvskqsbi84pgo7tipubtgsq9',0,1),(92,'tcyr9pd0erhoowkdwcqt',0,1),(93,'gkzgpksr0zrtuyui5khq5lxgp9pnzi3rp6oc603k495ehhelx6v9y0j6wawur1lfbu0vbghudoyeyhzs5rvwwnxhj6nqhwupteccbx9izfyufxfivtunbr7fj2aktd2bt6iuhasynfqtkdfnzcbxv5pu48uskfjasgdvvrdtnchrnr2ylefh0r848gvv5n58n86hcmpl',0,1),(94,'our9lygwydaxbh1ydyet',0,1),(95,'q7pltkldg48erkgsqybiv1gjr34fg655ifbdaly1fughounsmjdbz6htywtw6kep9iathn2ruagmnetzdxcsquy2qjj12wmifbwvob5bupwtjveqtmhqtgek3n9cdim5tmlbifnwa9vvwy2i53ylrvs63gxvhy40irwcq4gm76jxhiiq2h2ol1mp5lwyyqqwx8lau53j',0,1),(96,'xatsxzeg767llneewsxi',0,1),(97,'qthu4rs0zc7kadxzp3uiadrqesvcl1563uwuoll8wxbbwkxlmi6hlsesarirkzbwmd3y89lkhm4tf53u2qtwsix40m22fogqggelzxj5ofenyuontcvzogncrx8ooxfeohivnhjwbk0xyapyw8sjicdjmpvvypk1v8cnus4dwoonwzfcslacxyhzblxuzsibgx7ohwva',0,1),(98,'fy269mzpujhkwk4dfmdq',0,1),(99,'397hh0cuymimdbgrqlecyhsxxrh79s0amwoymvibonoyajcwbomtd59arroj6ponszsvdvqco1hnhjhzhidpgklafrmo1jblv7undpigjpxzam2t42omnraqemnwwzny5emfirrh3rt1bkzx3y6k82myk6q7gh4cpm2bblodkzpxwznqoe1vdnsrfqtp9vdso0if4zhq',0,1),(100,'uuifm6sipviqpkwh14ta',0,1),(101,'qvzhitbq49tjluf8tnkg7ywlajoxpm9jbruply7pntdqdnlj5rzegyouuk1beumkrdfmqpkrqqcgtjbbsz1emqkhuoqolvnntgohi9qakplmnhlc2u3rrforivqx9x4fatnzrur8rmsjl1mlsg2gea2waq9pjlt8tsoec3avklszorbmtiz8ftjnaw1tebv4fpay82yw',0,1),(102,'8vmjrke8ahnix8fzdmyf',0,1),(103,'5vxxxgvq1zsrocrjwt9eb19iapzgbejqmowlsz5n92cuhbpacz4vlolwm7r3v4qq5aixamzwypfj3599971l284gsymsqjhg0kmhx3bz2wzmt0m9akldexnfq4dcfyiwdwdmhs5vzbpdy4899bennvwuvbffertnraoo3t7vaxv4aczlfdhvuoclemwawd4td3mlotoi',0,1),(104,'h6z3jtz4nor4gcd8lszf',0,1),(105,'udzi10xxikkibo1hsg6jeajvggmzfpg2ymaek5l3u2ouzmjldr1zqe7zadfve21ci9otihtja6wksjjnqeikc2igauvgqxn2uuhgjaykca9wdixdbwqtnhei0z2rpgz5zuu2kqi93u4lfbm4oqthscokcgvrreersadvcwqojdyecvobcydkufyx66i1zlux4lnsaavd',0,1),(106,'wmkaubliznxrkskcbhqv',0,1),(107,'jcltmam1nug0ppxsnc7uwpllwwm0ig9muijp7ekffopiqn4nxnpwwxwwlrg00de9oazzdgybtjzxclbpchnrqhxcbso0ba5a7rbdyyiykcid6ozqb19vwq2pbthd2yltqanlmh3io3bwqq0ijnjset4b1l0ubphk0jcqoxtls4clktn5xrwsrvupa381sobybhmgmn7k',0,1),(108,'wcjp8cswafmss2vhbgau',0,1),(109,'cm1uijfignxzdscgg2dibumeberewf7shzyjxgpsrnkcqnbznpjizk6x5nthcwxejt5ofae59arggmuwogfbkzv9qchwe0dkbeapsu0nfemqyfitg6stryi7hzmsbouisgngaaayiw4agvlddyeczokbvjpqzcuzhcuvbgr7b2mhinjikbwub19mjjk93yw4fjthljsn',0,1),(110,'xrqanma9daumzfvtopiz',0,1),(111,'d2ow69nwa4brqtvecsqs0j8npndmfosj93u1bkasyrwghtvso5v21cjn1thijbjvoiuieu0jnfbtr8kl99vbeeernyaadaxe68unny7lvd7hfkrjcuhum0v1qd3mickeny6malnhxhflujnxkxn2ah8kr067dschwbiqzku3ddj689u7lclyebs8wemtur4ky7hit9wm',0,1),(112,'pw1yflkbbbij6mlbvggv',0,1),(113,'1qknohvlswgwqzmbqjb3muosl3cbcnjtauxrub5qjlhxlrvxclmotlrbwg869phr5nd2r1elfiw1utumiudigm3myzncovzncuthcoffpe1s8gjbbilscvtqu2t0watmuqabrnllb8ayswqcfmk65uexi3gpcduapnmfy9yukilmscfy0p1iaqw5h7rugynyrjkmqnff',0,1),(114,'7qd1ke8d5fzj07fdlnca',0,1),(115,'iffddyabvquz25jj47w3egj843eu5op18jofbqjhxrephimr8mfucgwwzy3dsykc4uxjlghfxkdpvjyzunqujcqiztc1psnpiucbe1mjvvpcsuiotvlgnkc2mg4srwycz8jbx9esftblvr4r0we61pnad0iwnqyicn24nofum0mp3pbwcr3w0krvbnesx3dgejlxzs95',0,1),(116,'dscyetlvauo0wxzjqjfh',0,1),(117,'a6cqyctf8nq7lnwiuj13bzrfi7anpdhwdfwhndssvtd9rdinj9udf2wt67uh6kkloermcvinhbi3hh1tqrsmujnwtkw0rqrisri1kgsxn4pwgbt013ad7rs2eshb3uyltfqo1sdlqg3qcdc3h5cbotlhrv6kaaravqphoesu5ewyooz2y4hgatsdfxswc0j8ncxsaksi',0,1),(118,'ijtgdnagge72l8qxbjpp',0,1),(119,'vb5pwew0o4cyheyedptowhgppawbgdex0eu8wbfsxjjhg2fqwylgusucstsapeatqzyquz6dbisyu4vg9o5o1jiuo6rqaorziecosbbfachmdzxutmtl2qcodr9obwp7goitkjeddl9udzypvijkfkdhqtqclfx12ptcb33bgzlvesdlv1qk3y0htcswnxc6bydhhzb9',0,1),(120,'wi23di45vuvk92qrcfoa',0,1),(121,'cdpr3s2yg6pbccasrq6um3bbivfdsa8o1o3wj9np3rxlp0xbyftedsabhf7uxscklkqmvnh7qykftsofr7mmqxc6s0ddokmvhvev9pdsbivyv61v2beoiaxjcz0yapzmnwqp3zktya8zvlaoo6begwceinv1rhbmkl0qabnloytccupyymznffc6hu2yztdbtw2x2bgp',0,1),(122,'u6lib8bishinwedgbtdp',0,1),(123,'ypsrcnottn87vckzr1gz68hh2d3udsytiwnurq5eqrjrufkats90jvnzcd6y64kz63okjeafpybhgzs0fnmg24lz2cqmcemsee9dpo4q4zcckesodwoephnptiik3ryp0s7fahzvsaosag6skrwedrbwf4odjqkotecoveoziog89neuxwxzhxjpjsrzy0zxad29zeq1',0,1),(124,'9bgpeq9tc4zxpyswp4ne',0,1),(125,'2lfrgrworojv0afbuxah4oxj6tkwfy6jgdlruotuopp671w5ymhlytxwh6dhnfrlzdkelpkwvtalqsq86ew7t3ceh79vkpipeatjneup7xcxp3t18kalc2vrolwgog0rqyn1siwsstinyhg7omtvp0ycperemzdwge2tz1zhvdtgzgeb6vdhezzhiolj07mbjssbsegf',0,1),(126,'3st8r28qvss8e5aogvvg',0,1),(127,'p9msmvhld5rhkgykc6eguhu9wftpzydry8vbrdxnybshqrdzbokglb4mxn8yttff9ajf3byxzmg61oqqymw2tujbu5kgebqgnc0ippmiq0g3ylouwbupnvk3hetsivzdtf5crvgar6w3as2nyhluhacvhdmtavthfisqyv7r6wawozpp7lqrzrzk0ujelg2p1evf8j8v',0,1),(128,'hgmmjt2ccrklgbgvbjfu',0,1),(129,'xzq947wv7u9gjgr6edjal3e08h5mxzb4defw6b5pq5tlnn0pvmvv2sukrdhylreiwfoj1vwsj5ccekzumffadewkwivu5koopyll3nl4iryphe814knakyzkhiqpwia6bhnyq2vr9pzklfuglrh5sa0qcin2zhgrbe9ijbtm77ag1b1k4cmzxkfq5lyjzzayqcqlcq86',0,1),(130,'peogojfm1vthrw5yerck',0,1),(131,'6kfompgrrv0pct1kvuqzyb5pqnogpmkzhimvvl59jms0j7humksva9cyt0s0gj3tcy00hnvehmozdnwrytnnj9u5ljraqwaipwznlm1agbwt5pvesm1cjxtilmrbtnd1syasqiincwuuqes5qicdp7twr73fzitfjk5xizhil2topbdu3yiwslmqflt9jkhvld6bknzp',0,1),(132,'7srw0m7mmpvrshjw1fw4',0,1),(133,'kkurmn3560ncfc1igzpgvlsbism0qf1ofbwbdvxph2bjojzphocf2soobboom6hj66wrh1zweijfiamcm7hbfs1iqzmncxrumkwkua3mmdiu9fdx2isiznqxbbytrldqrqjg9moaisiyeqpn032vvlo00qkweutgti8ixz6dadublqkgpwzpen9zsnkzpbn5aqn5ia5v',0,1),(134,'w6zb9tgwxghv08672ttr',0,1),(135,'bgmlccepbo9zflics3tbvrf7gxdn9kqfo1ikm1ownul8hl8civqq7cjtowemgr4oa8dk9miia6f6tdq8fxyiohmgwkmeqtr0mpbvtc8epjjksgu3pjbra0lapbjznf2zmspxwtnkuq84etljk3hcjjlas8klkzpdpt6anrytrvdhsdi4bynehxyq4l9swasuihxlgjgw',0,1),(136,'7sok9bmwxr3mfyhhmzf8',0,1),(137,'e36ssga0apegxsg0jva8qcxf1xratnion5ppwa0bteyntivwl9l1ipwkwn2covqtf9dfrur4jcbde6ymnckc6yfsnoghymfubtleckxw1rbr5ceuxpmnjb0hm2ruwujnqz5s6mdhjkmru39eopxwntiwcseokdjjhybd5y68yibmpvhse8eeprdep66ego9djz4vhcsj',0,1),(138,'8fzrnfzi33btaplfjxlx',0,1),(139,'1szoweccqmxuko4gui9iecmxmike2ounqgi5pqw4bvpzhwrbyjxjs7llnux0pbcb1eyutaeiyfrf0ztj1i98fqljbio3xuwacw8tfxs5tqok7gghepo07pfgqloxq9mfccxw2bppdmxxi945im0tdlz68nhm3jvrp8dnvyrq0i8cevowjsfuh1pvmrglx3reayhrkc80',0,1),(140,'vatdg5sh9exi85vvlo02',0,1),(141,'vaqmmknqbi5o9u5zk4qapf8kgz1yvovqvzjxah0uy1twrdewzb40kvwvsa6ohtqr2nekjkj7fiy1nsl37ohm1xemx1j1qqg2exez8dvteuiqepg9ompfbgavh1a7mwmqhpsxcfx32ge3ir9sfilsq0wvpcotiehsemsvhwsl6sigfj9nxz7qxp0aqctl9hegn614wotl',0,1),(142,'xx0hpcblhfsvsphct3za',0,1),(143,'kmbpyqoyh5t02aiu55xlqwzxmn7gslnfchoznhezodxngnmr754mmrabrb5p4bxipcf3zbtbnl25d7azk85bll9nzkibxthe0xws026j03tqlwovjwvnikkxoer7o8l9bfu7n0knj2rpydxqkkdnk1rfwzof0y6i3gasqjw3nsnm4whzn5wtqfxvjftfkbhldj5bkqrk',0,1),(144,'bi0fqovkp3tgtysf8vyh',0,1),(145,'opo1vjgwll4ncohdmte4kmssfsbqcbfjezqlbkufol2sjpkvtcrkbgr5qeuwmfdqrks4jbutrhssffq4suqrhisuerhkwayvvuyftzwmgx8omyxutsztkwsiakhquyaskzu3egzgmu4spuuaenguy8efp6yn4a0lfhsfr7bcku4ejpjxgetwits6yhcwwr6a6kwumkxw',0,1),(146,'hlj1usydleac3pyfnybp',0,1),(147,'6vuwkjsms0hsfgnb4n9pmavfds0pgonmwbwpromoc0attvojpj5szbmmjqk5pjlsqpmpvfbotvzavdofdjfzim2njxmvshwr9gruphr0titocm7pwabv0sl8cbd4e4pp3mcge5hc15t2wp27e3sto9nkgzvlxd3ummnsdoxti6qxstaaiyznjf3ifyhqottheys3gncw',0,1),(148,'nrh5bsykiajtvqhugbos',0,1),(149,'waqxmnauolqmu522xrhud2mazzzvj9hjxgfapft70iflnrghorksmwqtdfkoqx0z4qcdqocnbedwrbqgrimmz4miprrj51najpjdqothoaoffzpzc7sfhsqznuspxpvlgwvbs4l4g5gil6m3sp5lwsthlmczcoyovhuefvdkpivfkpqw5vwwegbivpijoiebhki9dqxa',0,1),(150,'qjaewguzcxeajhoziwww',0,1),(151,'ynmdobwiukwvjyxqkxrldtk6ipj87aaf0bqmqnhoc4fupzfjkaaietwxhi4xsi6jeerokkz53jjcc8ki8ak7bcv2hymorg9gm9dir9xy1qksian00broc5t37ldfqhsnhjlab7r9xhfowyzwqfixyzpvmpne4lvnhy3gjo8kmnuvt132zuokqzfwalddpjp9saifn9c7',0,1),(152,'rxqsgesfbnkne7vjzlq7',0,1),(153,'quzz4ern8jh879qyiuo2likmedozhqbbcsdtfo2h1jubv5qbp2ts2lpx1uvkig13flqy3dbftafxipp5dl6ccs76rratip9swhn6zlrkgsozba7kevojde2p3i5byngthmutpr51fs0vwqg0n67aldczhc1yneaoxdlcm7x4izmwl9bp0tvxemu83ujheiwdncxu4xbk',0,1),(154,'lklfdrqk7ypblwnzjfz2',0,1),(155,'qmnl8hyzn91axe0igjrybvmqzw0fflj589wzisbg9ngsbhkttr3zwehdpgp6wdq8gybpia6oddk5rk4oouoelyg5xjhi0thonjkcntyxqo7j4g8rubemaw42cw3k3dispogvxsu6fmodyj23bdschjff4udouqdjpbpq5w5ewdwc3hp7dzm96yxzpf3yzw8gv4zujylz',0,1),(156,'erfq2jjewhxe90xiewjc',0,1),(157,'zf1wgocbeoittg0pzkqoucdxwxccglronzhl0wfiak9bxtvhfcsj27lnremroypyx7uedtwgtisrkn66q9panhlx6xgxc6kfs6wv223jtstgxbdmswwgtllfmneqlymklabqd8lo4cairwrrnlq49g9qeassu1hidz4vjupepbzqirz9br2fdsmkrwnn4g1gotcd29nn',0,1),(158,'v2ex7luopicvjldse4u9',0,1),(159,'qnkkbdpwedp22mtklxt6r8gj9mnzpr5logp7adqo3ub66mh79cyzwghqvtoj5rwm5ylviea0r4nnvmhrbu8ipzd25jmfjlbhqhwzx2etw7whhvtddw2ypzan9aeu7vrhixdgskmifyop6fxxsvwpecff5dl9wjaq7ubno90ip3aovlhtrrwvyqk1u3mcl4uobwbsjkcq',0,1),(160,'4aitlxdelhrqchmwzyis',0,1),(161,'jfhhk4lnoeublz7pkhkvigogejvhyzpeqy2ibtdujies2lpv6koetjwim6qo3labxvsjgzti4umj557vs3f1q2yf1zr6raufe7d38cf0yspe1ecsy7r1xks7vhxghsfbipdkptpudruizc9d1ey2m1cr7q2p7cnu8a4i53ehznzkucgx5zk8fjv2qiv2ynftnernfnah',0,1),(162,'70yygkhpk9f7fhjz3cxd',0,1),(163,'atu23knn4kstwakpen4amv0wxfwxrgxalgwwv9iqqbbvhz6q6df7ty6qhbf4zaf8xaz1l9y7bjjuczjqxygcbjopj5dvf0npxl43azjgwt2exkot6hptoj0yws16gmjdrcgz8yh06hoqnhgjtqorlvrluqrpzmn6ssdojzmu7b0dckijebiuxhott6ubwidoc5k9ptax',0,1),(164,'ujkrupnedp1qrrgglhjg',0,1),(165,'k3vmjw8cmfvei2auzrsljjmohte4o815amghmajmuvtyssibyoldv8cutlrqhgnmykwatgqsbxg185kxxyvc4wayjri8qfbqokzlilhpqjaqqyznbn8iu5iuix90wbdapm74wgks8dtq0lgnjvmu3vscs7tqgmqgkta7xlhdzzhotipk9ftje7xwjkwms3wlvkaep3u4',0,1),(166,'70fggdnceib9r7vtb96n',0,1),(167,'ujz3hs2q7hnsj8b1uzbwtz2lsrtvr19smvz56dybyigd7nx8stegxmxjbeanhwmbeqsiw0tyru8dhvuadstrmq9n9k3fdaa1fjnwaiqm3aors2ttzp1fqv6a6mjhiypwenlnmmf8zvazk8sayexzbwgfuoybefv266fmxyo5tejmvymqhbpex5zs55tkomuhnlv6i4ys',0,1),(168,'ua2yzkhmpfzyppe16ros',0,1),(169,'vjxrdvsrl9qjsdbtia1whxsttfxhkdvpkcl8vprzyhhkqv7zchm3gqwcthtigfvn3ch3xafwgkzcz9xl0992aguddkbvolxdxqbdilphue2dxfabrjt4aonbhsue6xtrvs4vv1mfzb04dp1faa27keuadjeutoxkbxvfbwaqerm9dnm2smg4aj8fqr6ry87acjbqdttu',0,1),(170,'az4dzi0wcmifuzbydum4',0,1),(171,'1iru51tyo5ifskbdrfsqe2qny1zdfo40q5hdrmnm6dthgm8h1saslmyhe9oxqcmetpwlbyfsxryyuwlzycf9s5gii0wda2tfppvys2ultdqu7jlzjc8zmsyau5rf9fahsgroyjhmw6jueinoutmcpgwfuc88yjbesqbekwnagd7lqepcfwxmpmkmk5615kicvjmxqh6i',0,1),(172,'jt4lvke1odm1k5c41i04',0,1),(173,'ixljcydrn8b214uagmis4pdyqszcz5yy6w1msxnv8g2toftooogxn6naenotl0b6nys5ksi2ylw5osvx5eqbga76h1585unuvfxhpz0rqgcdizklhtentzvvhwy9hoef7dqgz2u8ierlmwmdwmasjobese2mt6vgwhqnne296jusskg55v0yrkitohenceia5hdahxdr',0,1),(174,'a4jr6p6z7qjb6wjeowuz',0,1),(175,'z9ojvam0ir7samvda0d7lvcda6kka810s1tm15ot7qvy9wavo5bxnmhhx4tczrbbtaufi2z9jvgmxcvygakr6vcrdxq4d3qlnrcy7aigscaug2eezt7cvxnm4byswgqes8bpq4giyrnn5wtvigcdaobgr4nfk2eworgphqfdxs6vxo3n2fawtpau6lx12vatyk32dd8p',0,1),(176,'lbx99ovubdx0upevpdbu',0,1),(177,'scmndgp7hkwxxoxcmk7rrn0tlsh77lixgcijo5lastzxh9q4swzztjqguwmlvfsfdxca3kyk6nfqq3orfc982qjubpktcpyvlc311hglcei4cvomti2l1bjy8bn6nc1yyhr8lbljusj5maz0ffj1ci63nhylwdeh8bpgkkwz0dcjxcgpyqkcq97h8xdtevsrnfbhaxbn',0,1),(178,'jzoqab5dyor3ftfxgt1g',0,1),(179,'4oapszdxrgwocbrm8va8tfebucw1aunhfdcmgntop10i6gz8vscgumnefwpxzvnrccopzmbtegb6jinpmd5zosdj4pjvevdwmqm0c275gmp4uvkskqaag5iyi1i64jqbsmowpkelcmwtxdegwp33548m9u55prizwfczj87lk2up0suzckeyq8hlwaldynwecsfwoxjv',0,1),(180,'xxzce8l2czuzik99vu9b',0,1),(181,'cmmbdfagkby6ddwacmz2ejynt3i1jvf8ibpjk3ltdzqdn4urpiq2iwy8tbsnv3icux3z6iyxso2tifwm9uvqetqolc09iuw2mlkkuonoyh5yvb48pxame1aqaevtv9zzc6bz2toqta614hathcietzwyjhtr4cdqigiiu2kjfvlvlrzui8pjbfq2kqwd5p5gfajr3zo6',0,1),(182,'rkgr2cesdlplrqw2mxpd',0,1),(183,'bmw8joq0ad5fmhhedbupaknta5bvk6fvokncrwkcnubi4h4luy7ujh7qpx5dglnn61xqi25e3vdlf08ignjay3jygvrf0e6onmjeu2pnhvzk22ix6cwnlpmwxfmvlihff5urlegg0rr08frmogxucb5en5kwazlcmsxaogglxhplkyqkflnkobdwt57yicq3acayiga6',0,1),(184,'ex033cfaxfvgwlpqkaya',0,1),(185,'6nmkjnpvvzu0p9bpo3jy7hl5liks4prqk5goxd6ng940mzpplilgwumm462dkykadcpew40apppsk4vcc5mx9o77hktdzksxjrx6nmynoed9ctnismmwghqh64akmiiw5fqrnjpzhbscbif0cpplgmyoctbreyjapouafcwkqkxcgtoj7nnzhvajtgtfegtmtilmh1ax',0,1),(186,'aizfsvvzlgmwtkwyin85',0,1),(187,'gmlcjolm30ew4hrzkkdx2jddb39tlbudqxeyagvo0gaoiqvn1q9djzy5chtw8dbuycn3ohneoyqducrzda9brgnte2zxwnjccespiwmih8chni1i4kod5aopwosuivxnidfr9vuz2jikt4qqkz1ert8og5v23uq1jq8jhj1emaqtodjkm1i9nql5vtyxrpnvjrafxu3y',0,1),(188,'hzndpwkuzzd5klymha0u',0,1),(189,'uko7cl9detmlcxehi10qkeqvjjbruipo0oxggyvqztbatle8xdaa126xwa4zojbjxbgrddzknabkyzkwoncqmzpf02owpoqqsfvwgsei1dphxseabg9c84n2vezegu0rojgwdxjkw3k9flcvjvrrvsnieuqfibgxuuhdzjw3vusvld4lphqxsslbc8dvdmzrithdlevj',0,1),(190,'cvuyxkgzlxg4nrun5i5y',0,1),(191,'vyctt70mvywm34gmrz5fcceld1jpimnyhcm13nvhrkz7oreekm6kc0te0iqykogmkfhuzzyslifv0kkqaf7zppptccy1nnluubvzryritv24mdqgdqeowmhkif5vmw4nc31c2wujogq2t32mklqff5514f2qhepxddazsytdwetm3tfo7r14zexviiynox84mdb2aqgy',0,1),(192,'vmahbm1z6lh1qeo1dzye',0,1),(193,'5c93owruiemekyoqyh3th2cn31xayhercmfurcc7crycsje4khoztirpaa9mb5klh48rknrptwp0ybl2s33rwvqtumfixjaoz52tslnci3eeypv50vbqv0jrshmrjhmbxfmogs2xofidxxkp69xtejyqp4tsue07pjmsypsingxoxh7rocqklur6wk0ckel9lgem3eal',0,1),(194,'j9s8l5o3mrsrrhubvzrk',0,1),(195,'ikz9heypyhdkfzbh0gu3frgr2evwlmzdhqaqcgcnsqlblzhcr49f2kzlvcstumyl5khtdjklzrr7a9dumtzbpytsfjopg2ricra1nfa1nghwnee8t6qbkkybwiznbkbxznulvd1614akudsxu2pqqng25prwmz5bexzyrwf3woszsbijtboi33bmzivt4jr3dm48pb7a',0,1),(196,'n6a5k99ms6y6z7j1ayyi',0,1),(197,'o6bc1pw7ilwrh5slnaguxrh9jvedcohrwqqacih0za1mwobcby0j1fvhx7r1myngxjxr26gpzyaax9jtbt8vaxcubv6ly23wykteh4nhgouqzxqvlxvjj7hlszczsbmuybvbd3oabbk09q99aecanzr4gf4hmyzu5sher78in2diqbyqk3e7b62k0zbnsizbsdvy4pw6',0,1),(198,'tobclomygbm7pvlhfrxe',0,1);
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
INSERT INTO `phpbb_sessions` VALUES ('035930d85e6df313e0516769eaa81bc8',2,1490371398,1490556172,1490556173,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=3',1,0,0,2),('035d6e50a846ebcdf02957c189585c35',2,1490371398,1490556213,1490556213,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=58',1,0,0,2),('04e42819f17cc9c2ec8dd5e216e3176f',2,1490371398,1490556236,1490556236,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=89',1,0,0,2),('059ef29eb856ffc0d37bbad43781d984',2,1490371398,1490556214,1490556214,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=59',1,0,0,2),('084262759ae312ed4f49ef7b07de0245',2,1490371398,1490556222,1490556222,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=70',1,0,0,2),('089a786a6c470fb96588e9602385a911',1,1490556166,1490556166,1490556166,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('0b79d895693ac9d3a4e5e45ffde5a40f',2,1490371398,1490556190,1490556190,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=27',1,0,0,2),('1974a033d730a36da5843e83321c8ba8',2,1490371398,1490556180,1490556181,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=14',1,0,0,2),('19a258503054e4c14ee208157b57b868',2,1490371398,1490556187,1490556187,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=23',1,0,0,2),('1dc791c90a06d1860d29b1e8ba25f08a',2,1490371398,1490556189,1490556189,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=25',1,0,0,2),('236b3312eeab6957c6d93ffc237f8d54',2,1490371398,1490556201,1490556202,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=42',1,0,0,2),('2669ab313735e3a2f32fbe24bc838d0c',2,1490371398,1490556220,1490556220,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=67',1,0,0,2),('2a64236045be8be028376732ac0c24be',2,1490371398,1490556195,1490556196,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=34',1,0,0,2),('2ba37bb51147fb86bddbfaab74611ad7',2,1490371398,1490556235,1490556235,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=88',1,0,0,2),('2dfdc87792b9351ff187bfdd5c87d121',2,1490371398,1490556185,1490556185,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=20',1,0,0,2),('3264c6d7a6097b7b9e96733ac6161b3e',2,1490371398,1490556214,1490556215,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=60',1,0,0,2),('349628f34019a9d61310e2649aa56102',1,1490556168,1490556168,1490556168,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('36cd1068b8852d265b2a78cb1ea43a95',2,1490371398,1490556225,1490556226,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=75',1,0,0,2),('37e5ee19644d0657c8d640ab892d47a5',2,1490371398,1490556210,1490556210,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=54',1,0,0,2),('3b4759bd1f2752550171e2d03c03163b',1,1490556164,1490556164,1490556164,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('3e3e379132dde12ed5b2a3bea0b29140',2,1490371398,1490556193,1490556193,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=31',1,0,0,2),('3ea16036a5ecb34f648cb5f31e7da99b',2,1490371398,1490556183,1490556183,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=17',1,0,0,2),('3f8b8032a1e6698ba58d72ec4e8f9c29',1,1490556165,1490556165,1490556166,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('416b3c5dfc1e71d79f2967ad39bc0861',2,1490371398,1490556227,1490556227,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=77',1,0,0,2),('434ff5c276c6e73204213e9f9bdca910',2,1490371398,1490556233,1490556233,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=85',1,0,0,2),('4373ed18ae876804b83737405e3e9133',2,1490371398,1490556202,1490556202,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=43',1,0,0,2),('4441f123c0bd2676f29fac28cc69cb8f',2,1490371398,1490556183,1490556184,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=18',1,0,0,2),('4a40ec6a9ce29d8e5e4cac198b699c1f',2,1490371398,1490556209,1490556209,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=52',1,0,0,2),('4c8d71577daf9f537536b355d6ea2366',2,1490371398,1490556228,1490556228,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=78',1,0,0,2),('4e96e29461d6dbab6d4ff3d1891c1c48',2,1490371398,1490556200,1490556201,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=41',1,0,0,2),('51b52538012751fc8499f7a53d213120',2,1490371398,1490556195,1490556195,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=33',1,0,0,2),('566dbf6988bc6f500a6316a5a4b1ab77',2,1490371398,1490556209,1490556210,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=53',1,0,0,2),('5c4bd600ab54f0d484e58975894c7e06',2,1490371398,1490556182,1490556182,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=16',1,0,0,2),('5d5f14470a50f2c4979e1d160e0a1cd3',2,1490371398,1490556189,1490556190,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=26',1,0,0,2),('5dcf5468adf93b31e0668382fcac41a7',2,1490371398,1490556179,1490556179,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=12',1,0,0,2),('63105d25fdfdb96fea06463fc6ccd913',2,1490371398,1490556224,1490556224,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=73',1,0,0,2),('6792496727c03241ad484f852040c0e1',2,1490371398,1490556242,1490556242,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=97',1,0,0,2),('684ac12988dba97bdb693d546076fc51',2,1490371398,1490556192,1490556192,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=29',1,0,0,2),('68d8299de09ce23c2202e472b1c5becf',2,1490371398,1490556205,1490556205,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=47',1,0,0,2),('6979da76a3153ab73112c6defb0f1e70',2,1490371398,1490556207,1490556207,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=50',1,0,0,2),('69b7594680f60977b55cd6f97dff44ef',2,1490371398,1490556238,1490556238,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=92',1,0,0,2),('6b789c735d895461b7a892fba22a9af1',2,1490371398,1490556204,1490556204,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=46',1,0,0,2),('6dee2af10e1171e0a74e89b7a9de71da',2,1490371398,1490556243,1490556244,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=99',1,0,0,2),('6ff486ee75771aa08c3769413f5f5a39',2,1490371398,1490556188,1490556188,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=24',1,0,0,2),('70692f49fb475bde2cf175e0cffe0d74',2,1490371398,1490556242,1490556243,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=98',1,0,0,2),('7137a34cefd15313d111098080b513f4',2,1490371398,1490556239,1490556239,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=93',1,0,0,2),('78d7a76bc42adb68afe91a9ecb55df61',2,1490371398,1490556197,1490556198,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=37',1,0,0,2),('7cbad4b1af6b89dfdc792fb031091285',2,1490371398,1490556217,1490556217,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=63',1,0,0,2),('7dbcd34029d93b4a7341d5fa7d3cf5dc',2,1490371398,1490556221,1490556221,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=69',1,0,0,2),('7dde880c9032dfaaaffe748c08fbbe37',1,1490556167,1490556167,1490556167,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('82fe4eddafdaeba70caa02f476af9c72',2,1490371398,1490556234,1490556234,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=86',1,0,0,2),('831b0cd3fa38f46a8a34d692cad66127',2,1490371398,1490556208,1490556208,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=51',1,0,0,2),('842b7e09cf03a46dd4566d8abd8213d1',2,1490371398,1490556200,1490556200,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=40',1,0,0,2),('851a5b14832bd559ef604ba38eae0e9d',2,1490371398,1490556177,1490556177,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=9',1,0,0,2),('854ddacb763afff323f881f0c09eed36',2,1490371398,1490556211,1490556212,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=56',1,0,0,2),('86f3b483c9a4d00bf102752b5f0b544f',2,1490371398,1490556212,1490556213,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=57',1,0,0,2),('87444fb818eafa094a86e33940fdf049',2,1490371398,1490556176,1490556176,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=8',1,0,0,2),('88964b1b23a78d857ecfb11b0a6da371',2,1490371398,1490556186,1490556187,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=22',1,0,0,2),('8eae987528341543a24094294d25fc08',2,1490371398,1490556219,1490556219,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=66',1,0,0,2),('903d646ff3385905ecbcba7b8233b1f7',1,1490556169,1490556169,1490556169,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('94e4a9f0bbc22b6d3b29b4195f3afd24',2,1490371398,1490556181,1490556182,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=15',1,0,0,2),('95a9b191b13fe02881e24452f61e9f91',2,1490371398,1490556241,1490556241,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=96',1,0,0,2),('95d8c2add2d6726f4d8eb709b2b2a76a',2,1490371398,1490556180,1490556180,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=13',1,0,0,2),('98ee9e3c0397b98efcd16578d3405c9a',2,1490371398,1490556231,1490556232,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=83',1,0,0,2),('9d77ba1b521e89e17b720383bbaf2e42',2,1490371398,1490556240,1490556240,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=94',1,0,0,2),('9ea9c5451c2b8acab40fce6687de3c96',2,1490371398,1490556194,1490556194,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=32',1,0,0,2),('a1a2420876fa06525d1001a3ec26ad3c',2,1490371398,1490556218,1490556218,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=65',1,0,0,2),('a3bfbd525856bc64706e76dd951a2a22',2,1490371398,1490556175,1490556176,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=7',1,0,0,2),('a551557fe27d626e6fd7c316f2f4b1e2',2,1490371398,1490556174,1490556174,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=5',1,0,0,2),('a6411063f98ba41c00f8ff50864a5ca1',2,1490371398,1490556240,1490556241,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=95',1,0,0,2),('a69d576135269b8c771f80962f5986e4',2,1490371398,1490556244,1490556244,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=100',1,0,0,2),('a9c0cddb900268ccc0d7f99d8d871aa9',2,1490371398,1490556172,1490556172,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=2',1,0,0,2),('a9ea5dccd05e281e269f79ef60e5e9f2',2,1490371398,1490556178,1490556179,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=11',1,0,0,2),('a9f3f898f137b4301b2ce6672faa635e',2,1490371398,1490556175,1490556175,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=6',1,0,0,2),('ad80d67a4cda521c7edd67100ae12f0a',2,1490371398,1490556229,1490556230,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=80',1,0,0,2),('ad8ec618a6af4acf0fc26661c7e5c106',2,1490371398,1490556206,1490556207,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=49',1,0,0,2),('b00cf68c0c064e1fb578ce496bf78749',2,1490371398,1490556186,1490556186,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=21',1,0,0,2),('b010326e7f3a292caf675ce9b4afd9dc',2,1490371398,1490556234,1490556235,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=87',1,0,0,2),('b7b461731ae69ac215c91d2e773c025c',2,1490371398,1490556220,1490556221,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=68',1,0,0,2),('b84c51635fa8c11edd1b0e4963e32346',2,1490371398,1490556192,1490556193,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=30',1,0,0,2),('ba5a3807a470a093bf8efbaec054f3d7',2,1490371398,1490556230,1490556230,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=81',1,0,0,2),('bcc0a9e447809c34318ab37aa3e7f966',2,1490371398,1490556198,1490556199,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=38',1,0,0,2),('bd26b8dd35794841c600d024a96f16ba',2,1490371398,1490556216,1490556216,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=62',1,0,0,2),('bf1b5c9856e66b3c7f49142a0d9a7dea',1,1490556165,1490556165,1490556165,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('bfc836d393521ac78afc9e11a9c4ad0d',2,1490371398,1490556203,1490556203,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=44',1,0,0,2),('c12daffefba329117eab21dffbab52f0',2,1490371398,1490556199,1490556199,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=39',1,0,0,2),('c23112c7332bfb7407087853f85bc98b',1,1490556170,1490556170,1490556170,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('c37e9901de9b5114ac4a1a980a4451e1',2,1490371398,1490556196,1490556196,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=35',1,0,0,2),('c3f36bfde2d93eea7fc0231e60966c75',2,1490371398,1490556223,1490556223,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=71',1,0,0,2),('ca662f343d12e52a286fbce0b23f84eb',1,1490556171,1490556171,1490556171,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('ca94d96382b6fa3eb8fba525fd85bf1a',2,1490371398,1490556206,1490556206,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=48',1,0,0,2),('d1a1761f4110224ce29cb33984c55ef1',2,1490371398,1490556177,1490556178,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=10',1,0,0,2),('d3066df32a317f9d24a8e738e64d545f',2,1490371398,1490556203,1490556204,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=45',1,0,0,2),('d30fafeb01a6b359d6283d6e9fbbfaf4',2,1490371398,1490556237,1490556238,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=91',1,0,0,2),('d94660de3f4ade87d6988da9ef0dd84c',2,1490371398,1490556226,1490556227,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=76',1,0,0,2),('db21c32d3a1e4861e3110c102847be3b',2,1490371398,1490556173,1490556173,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=4',1,0,0,2),('db9a032f3cab0113d3afcc5bb8c4c364',2,1490371398,1490556217,1490556218,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=64',1,0,0,2),('e03374b82d476a36ce054f93daba0535',2,1490371398,1490556228,1490556229,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=79',1,0,0,2),('e4d2b96c5b8d02c61fa0a4755487ee5e',2,1490371398,1490556211,1490556211,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=55',1,0,0,2),('e4df39eefedafb0493b8da564d63bc29',2,1490371398,1490556184,1490556185,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=19',1,0,0,2),('e57fcd389fee719d8fdf025a963feaf1',2,1490371398,1490556231,1490556231,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=82',1,0,0,2),('ebd6e7674b639c0cbfbcdfbeb7bed232',2,1490371398,1490556197,1490556197,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=36',1,0,0,2),('ecb6cd315e974294036f173ff3e3e8e7',2,1490371398,1490556232,1490556232,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=84',1,0,0,2),('f073f604fc0e8fec6db2ea6de61d2a66',2,1490371398,1490556225,1490556225,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=74',1,0,0,2),('f3613561a38096a1115269cf4735b745',2,1490371398,1490556237,1490556237,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=90',1,0,0,2),('f64912588a20efef5f133b6a9f85e756',1,1490556168,1490556168,1490556169,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','ucp.php?mode=register',1,0,0,0),('f7d9bffdafaebfcfd03fa8372da2a90c',2,1490371398,1490556215,1490556215,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=61',1,0,0,2),('fbc3018582341692e7d1181993e5793c',2,1490371398,1490556191,1490556191,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=28',1,0,0,2),('fc5efcd34e7ac0704e89f20dd0787ee9',2,1490371398,1490556223,1490556224,'216.165.71.216','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.3+PhantomJS/2.1.1 Safari/538.1','','viewtopic.php?f=2&t=72',1,0,0,2);
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
INSERT INTO `phpbb_topics` VALUES (1,2,0,0,0,'Welcome to phpBB3',2,1490128344,0,0,0,0,1,'admin','AA0000',1,2,'admin','AA0000','Welcome to phpBB3',1490128344,972086460,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(2,2,0,0,0,'SVjyGLYmAjZfo13NDp9B',2,1490556172,0,1,0,0,2,'admin','AA0000',2,2,'admin','AA0000','SVjyGLYmAjZfo13NDp9B',1490556172,1490556172,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(3,2,0,0,0,'oNN9f2NM5eCB48L8T6Dt',2,1490556173,0,1,0,0,3,'admin','AA0000',3,2,'admin','AA0000','oNN9f2NM5eCB48L8T6Dt',1490556173,1490556173,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(4,2,0,0,0,'FrcsLZEXr41tLqn2WNrS',2,1490556173,0,1,0,0,4,'admin','AA0000',4,2,'admin','AA0000','FrcsLZEXr41tLqn2WNrS',1490556173,1490556173,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(5,2,0,0,0,'iZfJ1WCiNdLcfx4q6rdm',2,1490556174,0,1,0,0,5,'admin','AA0000',5,2,'admin','AA0000','iZfJ1WCiNdLcfx4q6rdm',1490556174,1490556174,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(6,2,0,0,0,'rmYK7Iu0xR0vvUUiWc7T',2,1490556175,0,1,0,0,6,'admin','AA0000',6,2,'admin','AA0000','rmYK7Iu0xR0vvUUiWc7T',1490556175,1490556175,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(7,2,0,0,0,'LcwgCdiLLk5uOaczTR9T',2,1490556176,0,1,0,0,7,'admin','AA0000',7,2,'admin','AA0000','LcwgCdiLLk5uOaczTR9T',1490556176,1490556176,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(8,2,0,0,0,'N12ey158L24kGqKAOQh3',2,1490556176,0,1,0,0,8,'admin','AA0000',8,2,'admin','AA0000','N12ey158L24kGqKAOQh3',1490556176,1490556176,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(9,2,0,0,0,'QlGVFq75hICkgY1xWr96',2,1490556177,0,1,0,0,9,'admin','AA0000',9,2,'admin','AA0000','QlGVFq75hICkgY1xWr96',1490556177,1490556177,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(10,2,0,0,0,'9WX5zJnXIRif8eldGRaH',2,1490556178,0,1,0,0,10,'admin','AA0000',10,2,'admin','AA0000','9WX5zJnXIRif8eldGRaH',1490556178,1490556178,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(11,2,0,0,0,'CL7oY3DV0HSft74zYN6I',2,1490556179,0,1,0,0,11,'admin','AA0000',11,2,'admin','AA0000','CL7oY3DV0HSft74zYN6I',1490556179,1490556179,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(12,2,0,0,0,'FVqTmgSnQEe2JEiluHlK',2,1490556179,0,1,0,0,12,'admin','AA0000',12,2,'admin','AA0000','FVqTmgSnQEe2JEiluHlK',1490556179,1490556179,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(13,2,0,0,0,'RdsWojUmAHhWndx2xcdx',2,1490556180,0,1,0,0,13,'admin','AA0000',13,2,'admin','AA0000','RdsWojUmAHhWndx2xcdx',1490556180,1490556180,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(14,2,0,0,0,'dRMcJEHbZGbEKqgvSjW3',2,1490556181,0,1,0,0,14,'admin','AA0000',14,2,'admin','AA0000','dRMcJEHbZGbEKqgvSjW3',1490556181,1490556181,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(15,2,0,0,0,'eVV0Jq6Q99a9q4EKSduJ',2,1490556182,0,1,0,0,15,'admin','AA0000',15,2,'admin','AA0000','eVV0Jq6Q99a9q4EKSduJ',1490556182,1490556182,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(16,2,0,0,0,'rncVbbM7uImhxZy8ahuf',2,1490556182,0,1,0,0,16,'admin','AA0000',16,2,'admin','AA0000','rncVbbM7uImhxZy8ahuf',1490556182,1490556182,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(17,2,0,0,0,'cduEiBA5MBoBVAjmHd2b',2,1490556183,0,1,0,0,17,'admin','AA0000',17,2,'admin','AA0000','cduEiBA5MBoBVAjmHd2b',1490556183,1490556183,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(18,2,0,0,0,'Vuha8Pw0eJMMYrbF9hbN',2,1490556184,0,1,0,0,18,'admin','AA0000',18,2,'admin','AA0000','Vuha8Pw0eJMMYrbF9hbN',1490556184,1490556184,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(19,2,0,0,0,'NF09dTs7gEh2PVcIr1iW',2,1490556184,0,1,0,0,19,'admin','AA0000',19,2,'admin','AA0000','NF09dTs7gEh2PVcIr1iW',1490556184,1490556185,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(20,2,0,0,0,'IrvNRpILRA7ZB85J4UMH',2,1490556185,0,1,0,0,20,'admin','AA0000',20,2,'admin','AA0000','IrvNRpILRA7ZB85J4UMH',1490556185,1490556185,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(21,2,0,0,0,'YOZ7fiLB633BkWjCSRsf',2,1490556186,0,1,0,0,21,'admin','AA0000',21,2,'admin','AA0000','YOZ7fiLB633BkWjCSRsf',1490556186,1490556186,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(22,2,0,0,0,'JBvtsKyELFdV5ySMOiWi',2,1490556187,0,1,0,0,22,'admin','AA0000',22,2,'admin','AA0000','JBvtsKyELFdV5ySMOiWi',1490556187,1490556187,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(23,2,0,0,0,'SlW3ki9Bm61YvGJL0knQ',2,1490556187,0,1,0,0,23,'admin','AA0000',23,2,'admin','AA0000','SlW3ki9Bm61YvGJL0knQ',1490556187,1490556187,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(24,2,0,0,0,'l2Uu1bCxEPNyJ8EyRgoR',2,1490556188,0,1,0,0,24,'admin','AA0000',24,2,'admin','AA0000','l2Uu1bCxEPNyJ8EyRgoR',1490556188,1490556188,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(25,2,0,0,0,'AjQL132Snxj6CAkMEe7b',2,1490556189,0,1,0,0,25,'admin','AA0000',25,2,'admin','AA0000','AjQL132Snxj6CAkMEe7b',1490556189,1490556189,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(26,2,0,0,0,'nFjdnD84QZ9IBGDCv5ZX',2,1490556190,0,1,0,0,26,'admin','AA0000',26,2,'admin','AA0000','nFjdnD84QZ9IBGDCv5ZX',1490556190,1490556190,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(27,2,0,0,0,'Yb4TFABQDX0YU0ZyrXNJ',2,1490556190,0,1,0,0,27,'admin','AA0000',27,2,'admin','AA0000','Yb4TFABQDX0YU0ZyrXNJ',1490556190,1490556190,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(28,2,0,0,0,'nmS9bzU3ZHx2RDZv94iS',2,1490556191,0,1,0,0,28,'admin','AA0000',28,2,'admin','AA0000','nmS9bzU3ZHx2RDZv94iS',1490556191,1490556191,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(29,2,0,0,0,'KdJVIs5mWcbTWFFmb00k',2,1490556192,0,1,0,0,29,'admin','AA0000',29,2,'admin','AA0000','KdJVIs5mWcbTWFFmb00k',1490556192,1490556192,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(30,2,0,0,0,'2bArvXyV7gULmwRq7AFC',2,1490556193,0,1,0,0,30,'admin','AA0000',30,2,'admin','AA0000','2bArvXyV7gULmwRq7AFC',1490556193,1490556193,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(31,2,0,0,0,'fiDvRRwcQYlKXM4b9CPR',2,1490556193,0,1,0,0,31,'admin','AA0000',31,2,'admin','AA0000','fiDvRRwcQYlKXM4b9CPR',1490556193,1490556193,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(32,2,0,0,0,'8d7Wl11CZpMDr1c2GvbK',2,1490556194,0,1,0,0,32,'admin','AA0000',32,2,'admin','AA0000','8d7Wl11CZpMDr1c2GvbK',1490556194,1490556194,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(33,2,0,0,0,'mY22rwKz6rdvLJA7qCJG',2,1490556195,0,1,0,0,33,'admin','AA0000',33,2,'admin','AA0000','mY22rwKz6rdvLJA7qCJG',1490556195,1490556195,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(34,2,0,0,0,'b1R6pH2w3j46xFCMSmMk',2,1490556196,0,1,0,0,34,'admin','AA0000',34,2,'admin','AA0000','b1R6pH2w3j46xFCMSmMk',1490556196,1490556196,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(35,2,0,0,0,'X6eoolpLMfuO20A8DIaJ',2,1490556196,0,1,0,0,35,'admin','AA0000',35,2,'admin','AA0000','X6eoolpLMfuO20A8DIaJ',1490556196,1490556196,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(36,2,0,0,0,'YF0nObnY82dsmPLcaLt9',2,1490556197,0,1,0,0,36,'admin','AA0000',36,2,'admin','AA0000','YF0nObnY82dsmPLcaLt9',1490556197,1490556197,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(37,2,0,0,0,'cxsi5YaNrrsjcVj6xhfr',2,1490556198,0,1,0,0,37,'admin','AA0000',37,2,'admin','AA0000','cxsi5YaNrrsjcVj6xhfr',1490556198,1490556198,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(38,2,0,0,0,'8KFBamRY7qX3CbNTxPKq',2,1490556198,0,1,0,0,38,'admin','AA0000',38,2,'admin','AA0000','8KFBamRY7qX3CbNTxPKq',1490556198,1490556199,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(39,2,0,0,0,'Z3YSp4Yy5VYd79fl1oTK',2,1490556199,0,1,0,0,39,'admin','AA0000',39,2,'admin','AA0000','Z3YSp4Yy5VYd79fl1oTK',1490556199,1490556199,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(40,2,0,0,0,'2xx92tFYtPIrobjVa8gq',2,1490556200,0,1,0,0,40,'admin','AA0000',40,2,'admin','AA0000','2xx92tFYtPIrobjVa8gq',1490556200,1490556200,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(41,2,0,0,0,'B5Lk8s5LfXgJw92FhImC',2,1490556201,0,1,0,0,41,'admin','AA0000',41,2,'admin','AA0000','B5Lk8s5LfXgJw92FhImC',1490556201,1490556201,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(42,2,0,0,0,'MasRXni25kY044mwVrxM',2,1490556201,0,1,0,0,42,'admin','AA0000',42,2,'admin','AA0000','MasRXni25kY044mwVrxM',1490556201,1490556202,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(43,2,0,0,0,'BRgA52PhiBjnVVncmJes',2,1490556202,0,1,0,0,43,'admin','AA0000',43,2,'admin','AA0000','BRgA52PhiBjnVVncmJes',1490556202,1490556202,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(44,2,0,0,0,'XKMinp1qf3iM0lAraNL6',2,1490556203,0,1,0,0,44,'admin','AA0000',44,2,'admin','AA0000','XKMinp1qf3iM0lAraNL6',1490556203,1490556203,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(45,2,0,0,0,'6pbxcKKD1EvNP3KpnHZo',2,1490556204,0,1,0,0,45,'admin','AA0000',45,2,'admin','AA0000','6pbxcKKD1EvNP3KpnHZo',1490556204,1490556204,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(46,2,0,0,0,'CRg91qqAaCgHRwhUchqe',2,1490556204,0,1,0,0,46,'admin','AA0000',46,2,'admin','AA0000','CRg91qqAaCgHRwhUchqe',1490556204,1490556204,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(47,2,0,0,0,'tCyr9Pd0erHOoWKdWCQt',2,1490556205,0,1,0,0,47,'admin','AA0000',47,2,'admin','AA0000','tCyr9Pd0erHOoWKdWCQt',1490556205,1490556205,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(48,2,0,0,0,'Our9lyGwydAxBH1ydyEt',2,1490556206,0,1,0,0,48,'admin','AA0000',48,2,'admin','AA0000','Our9lyGwydAxBH1ydyEt',1490556206,1490556206,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(49,2,0,0,0,'xAtSxzEg767llneewSXi',2,1490556207,0,1,0,0,49,'admin','AA0000',49,2,'admin','AA0000','xAtSxzEg767llneewSXi',1490556207,1490556207,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(50,2,0,0,0,'fy269MzpujhkWK4DfMDq',2,1490556207,0,1,0,0,50,'admin','AA0000',50,2,'admin','AA0000','fy269MzpujhkWK4DfMDq',1490556207,1490556207,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(51,2,0,0,0,'UuifM6sIpviqPkwh14tA',2,1490556208,0,1,0,0,51,'admin','AA0000',51,2,'admin','AA0000','UuifM6sIpviqPkwh14tA',1490556208,1490556208,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(52,2,0,0,0,'8VmjrKE8AHnIX8FzdMyf',2,1490556209,0,1,0,0,52,'admin','AA0000',52,2,'admin','AA0000','8VmjrKE8AHnIX8FzdMyf',1490556209,1490556209,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(53,2,0,0,0,'H6Z3jtz4NOR4gCD8LsZF',2,1490556210,0,1,0,0,53,'admin','AA0000',53,2,'admin','AA0000','H6Z3jtz4NOR4gCD8LsZF',1490556210,1490556210,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(54,2,0,0,0,'wmKauBLiZnXRKsKcBHqv',2,1490556210,0,1,0,0,54,'admin','AA0000',54,2,'admin','AA0000','wmKauBLiZnXRKsKcBHqv',1490556210,1490556210,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(55,2,0,0,0,'wCjP8CSWaFmsS2vhbgau',2,1490556211,0,1,0,0,55,'admin','AA0000',55,2,'admin','AA0000','wCjP8CSWaFmsS2vhbgau',1490556211,1490556211,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(56,2,0,0,0,'Xrqanma9DAUMzFvToPIz',2,1490556212,0,1,0,0,56,'admin','AA0000',56,2,'admin','AA0000','Xrqanma9DAUMzFvToPIz',1490556212,1490556212,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(57,2,0,0,0,'pw1YFLkBBBiJ6MLbvgGv',2,1490556213,0,1,0,0,57,'admin','AA0000',57,2,'admin','AA0000','pw1YFLkBBBiJ6MLbvgGv',1490556213,1490556213,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(58,2,0,0,0,'7qd1ke8D5FZj07fDlNcA',2,1490556213,0,1,0,0,58,'admin','AA0000',58,2,'admin','AA0000','7qd1ke8D5FZj07fDlNcA',1490556213,1490556213,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(59,2,0,0,0,'DscyeTlVauo0WXZjqjfh',2,1490556214,0,1,0,0,59,'admin','AA0000',59,2,'admin','AA0000','DscyeTlVauo0WXZjqjfh',1490556214,1490556214,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(60,2,0,0,0,'iJtGdNAgGE72l8QxBJPP',2,1490556215,0,1,0,0,60,'admin','AA0000',60,2,'admin','AA0000','iJtGdNAgGE72l8QxBJPP',1490556215,1490556215,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(61,2,0,0,0,'wI23di45VUVk92qrCfOA',2,1490556215,0,1,0,0,61,'admin','AA0000',61,2,'admin','AA0000','wI23di45VUVk92qrCfOA',1490556215,1490556215,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(62,2,0,0,0,'U6LIb8bIshInwedgbtDp',2,1490556216,0,1,0,0,62,'admin','AA0000',62,2,'admin','AA0000','U6LIb8bIshInwedgbtDp',1490556216,1490556216,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(63,2,0,0,0,'9BgpEQ9tc4zXpySwP4nE',2,1490556217,0,1,0,0,63,'admin','AA0000',63,2,'admin','AA0000','9BgpEQ9tc4zXpySwP4nE',1490556217,1490556217,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(64,2,0,0,0,'3ST8R28qVSs8e5AOgVVg',2,1490556218,0,1,0,0,64,'admin','AA0000',64,2,'admin','AA0000','3ST8R28qVSs8e5AOgVVg',1490556218,1490556218,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(65,2,0,0,0,'HGmmjT2CcRklgbgVbJFU',2,1490556218,0,1,0,0,65,'admin','AA0000',65,2,'admin','AA0000','HGmmjT2CcRklgbgVbJFU',1490556218,1490556218,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(66,2,0,0,0,'PEogOJfm1vthRw5YercK',2,1490556219,0,1,0,0,66,'admin','AA0000',66,2,'admin','AA0000','PEogOJfm1vthRw5YercK',1490556219,1490556219,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(67,2,0,0,0,'7srW0m7mMpvRsHjw1Fw4',2,1490556220,0,1,0,0,67,'admin','AA0000',67,2,'admin','AA0000','7srW0m7mMpvRsHjw1Fw4',1490556220,1490556220,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(68,2,0,0,0,'W6Zb9tgWXGHv08672tTR',2,1490556221,0,1,0,0,68,'admin','AA0000',68,2,'admin','AA0000','W6Zb9tgWXGHv08672tTR',1490556221,1490556221,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(69,2,0,0,0,'7SOk9BMWxr3MfYhHmZF8',2,1490556221,0,1,0,0,69,'admin','AA0000',69,2,'admin','AA0000','7SOk9BMWxr3MfYhHmZF8',1490556221,1490556221,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(70,2,0,0,0,'8fzRnfZI33BtApLfJXLx',2,1490556222,0,1,0,0,70,'admin','AA0000',70,2,'admin','AA0000','8fzRnfZI33BtApLfJXLx',1490556222,1490556222,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(71,2,0,0,0,'VatDg5sH9ExI85VvLo02',2,1490556223,0,1,0,0,71,'admin','AA0000',71,2,'admin','AA0000','VatDg5sH9ExI85VvLo02',1490556223,1490556223,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(72,2,0,0,0,'Xx0HpcbLHfsVSPHcT3za',2,1490556224,0,1,0,0,72,'admin','AA0000',72,2,'admin','AA0000','Xx0HpcbLHfsVSPHcT3za',1490556224,1490556224,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(73,2,0,0,0,'bI0fqoVkp3tgtysf8vyh',2,1490556224,0,1,0,0,73,'admin','AA0000',73,2,'admin','AA0000','bI0fqoVkp3tgtysf8vyh',1490556224,1490556224,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(74,2,0,0,0,'HLJ1uSYDLEAc3PYfNyBp',2,1490556225,0,1,0,0,74,'admin','AA0000',74,2,'admin','AA0000','HLJ1uSYDLEAc3PYfNyBp',1490556225,1490556225,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(75,2,0,0,0,'NRH5BSYkiAjtvqhUGBos',2,1490556226,0,1,0,0,75,'admin','AA0000',75,2,'admin','AA0000','NRH5BSYkiAjtvqhUGBos',1490556226,1490556226,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(76,2,0,0,0,'qJAeWGUzcxeaJHoZiwWW',2,1490556227,0,1,0,0,76,'admin','AA0000',76,2,'admin','AA0000','qJAeWGUzcxeaJHoZiwWW',1490556227,1490556227,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(77,2,0,0,0,'rXqSGesfBnKNE7VjZLq7',2,1490556227,0,1,0,0,77,'admin','AA0000',77,2,'admin','AA0000','rXqSGesfBnKNE7VjZLq7',1490556227,1490556227,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(78,2,0,0,0,'lKLFDrqk7YPbLWNzJFZ2',2,1490556228,0,1,0,0,78,'admin','AA0000',78,2,'admin','AA0000','lKLFDrqk7YPbLWNzJFZ2',1490556228,1490556228,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(79,2,0,0,0,'Erfq2JJEWHXe90xIewJc',2,1490556229,0,1,0,0,79,'admin','AA0000',79,2,'admin','AA0000','Erfq2JJEWHXe90xIewJc',1490556229,1490556229,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(80,2,0,0,0,'v2Ex7LUoPicVJLDse4u9',2,1490556229,0,1,0,0,80,'admin','AA0000',80,2,'admin','AA0000','v2Ex7LUoPicVJLDse4u9',1490556229,1490556230,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(81,2,0,0,0,'4AitLXDeLhrQChMWzYis',2,1490556230,0,1,0,0,81,'admin','AA0000',81,2,'admin','AA0000','4AitLXDeLhrQChMWzYis',1490556230,1490556230,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(82,2,0,0,0,'70yyGKhPK9f7fHjz3CXd',2,1490556231,0,1,0,0,82,'admin','AA0000',82,2,'admin','AA0000','70yyGKhPK9f7fHjz3CXd',1490556231,1490556231,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(83,2,0,0,0,'uJKrupNEDP1qrRgglHJg',2,1490556232,0,1,0,0,83,'admin','AA0000',83,2,'admin','AA0000','uJKrupNEDP1qrRgglHJg',1490556232,1490556232,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(84,2,0,0,0,'70FgGdncEIB9r7vtb96n',2,1490556232,0,1,0,0,84,'admin','AA0000',84,2,'admin','AA0000','70FgGdncEIB9r7vtb96n',1490556232,1490556232,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(85,2,0,0,0,'Ua2YZKhMPfZyPPE16Ros',2,1490556233,0,1,0,0,85,'admin','AA0000',85,2,'admin','AA0000','Ua2YZKhMPfZyPPE16Ros',1490556233,1490556233,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(86,2,0,0,0,'Az4DzI0WcMiFuzbyDum4',2,1490556234,0,1,0,0,86,'admin','AA0000',86,2,'admin','AA0000','Az4DzI0WcMiFuzbyDum4',1490556234,1490556234,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(87,2,0,0,0,'jt4lvKE1oDm1K5C41i04',2,1490556235,0,1,0,0,87,'admin','AA0000',87,2,'admin','AA0000','jt4lvKE1oDm1K5C41i04',1490556235,1490556235,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(88,2,0,0,0,'a4Jr6P6z7qJb6wjeowuz',2,1490556235,0,1,0,0,88,'admin','AA0000',88,2,'admin','AA0000','a4Jr6P6z7qJb6wjeowuz',1490556235,1490556235,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(89,2,0,0,0,'LBX99OVubDx0UPEvpdbu',2,1490556236,0,1,0,0,89,'admin','AA0000',89,2,'admin','AA0000','LBX99OVubDx0UPEvpdbu',1490556236,1490556236,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(90,2,0,0,0,'JZoQaB5DyOR3FTfxGT1G',2,1490556237,0,1,0,0,90,'admin','AA0000',90,2,'admin','AA0000','JZoQaB5DyOR3FTfxGT1G',1490556237,1490556237,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(91,2,0,0,0,'XxzCe8L2czUzIK99vU9b',2,1490556238,0,1,0,0,91,'admin','AA0000',91,2,'admin','AA0000','XxzCe8L2czUzIK99vU9b',1490556238,1490556238,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(92,2,0,0,0,'RkGR2CEsdlplrQW2mXPd',2,1490556238,0,1,0,0,92,'admin','AA0000',92,2,'admin','AA0000','RkGR2CEsdlplrQW2mXPd',1490556238,1490556238,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(93,2,0,0,0,'ex033CfAXfVGwlPqkaya',2,1490556239,0,1,0,0,93,'admin','AA0000',93,2,'admin','AA0000','ex033CfAXfVGwlPqkaya',1490556239,1490556239,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(94,2,0,0,0,'aIzfsvvzLgmWtKWyiN85',2,1490556240,0,1,0,0,94,'admin','AA0000',94,2,'admin','AA0000','aIzfsvvzLgmWtKWyiN85',1490556240,1490556240,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(95,2,0,0,0,'hZndpWKuZZD5KLYmHA0u',2,1490556241,0,1,0,0,95,'admin','AA0000',95,2,'admin','AA0000','hZndpWKuZZD5KLYmHA0u',1490556241,1490556241,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(96,2,0,0,0,'cVuyxkGzlXG4NRun5i5y',2,1490556241,0,1,0,0,96,'admin','AA0000',96,2,'admin','AA0000','cVuyxkGzlXG4NRun5i5y',1490556241,1490556241,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(97,2,0,0,0,'VMAHbm1z6LH1qEo1DZYE',2,1490556242,0,1,0,0,97,'admin','AA0000',97,2,'admin','AA0000','VMAHbm1z6LH1qEo1DZYE',1490556242,1490556242,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(98,2,0,0,0,'j9S8l5O3mRsrrhUBvzRK',2,1490556243,0,1,0,0,98,'admin','AA0000',98,2,'admin','AA0000','j9S8l5O3mRsrrhUBvzRK',1490556243,1490556243,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(99,2,0,0,0,'n6a5K99ms6Y6Z7J1ayYI',2,1490556244,0,1,0,0,99,'admin','AA0000',99,2,'admin','AA0000','n6a5K99ms6Y6Z7J1ayYI',1490556244,1490556244,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0),(100,2,0,0,0,'TOBclOMYGBM7PvlhFRXE',2,1490556244,0,1,0,0,100,'admin','AA0000',100,2,'admin','AA0000','TOBclOMYGBM7PvlhFRXE',1490556244,1490556244,0,0,0,'',0,0,1,0,0,1,0,'',0,1,0,0);
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
INSERT INTO `phpbb_topics_track` VALUES (2,2,2,1490556172),(2,3,2,1490556173),(2,4,2,1490556173),(2,5,2,1490556174),(2,6,2,1490556175),(2,7,2,1490556176),(2,8,2,1490556176),(2,9,2,1490556177),(2,10,2,1490556178),(2,11,2,1490556179),(2,12,2,1490556179),(2,13,2,1490556180),(2,14,2,1490556181),(2,15,2,1490556182),(2,16,2,1490556182),(2,17,2,1490556183),(2,18,2,1490556184),(2,19,2,1490556185),(2,20,2,1490556185),(2,21,2,1490556186),(2,22,2,1490556187),(2,23,2,1490556187),(2,24,2,1490556188),(2,25,2,1490556189),(2,26,2,1490556190),(2,27,2,1490556190),(2,28,2,1490556191),(2,29,2,1490556192),(2,30,2,1490556193),(2,31,2,1490556193),(2,32,2,1490556194),(2,33,2,1490556195),(2,34,2,1490556196),(2,35,2,1490556196),(2,36,2,1490556197),(2,37,2,1490556198),(2,38,2,1490556199),(2,39,2,1490556199),(2,40,2,1490556200),(2,41,2,1490556201),(2,42,2,1490556201),(2,43,2,1490556202),(2,44,2,1490556203),(2,45,2,1490556204),(2,46,2,1490556204),(2,47,2,1490556205),(2,48,2,1490556206),(2,49,2,1490556207),(2,50,2,1490556207),(2,51,2,1490556208),(2,52,2,1490556209),(2,53,2,1490556210),(2,54,2,1490556210),(2,55,2,1490556211),(2,56,2,1490556212),(2,57,2,1490556213),(2,58,2,1490556213),(2,59,2,1490556214),(2,60,2,1490556215),(2,61,2,1490556215),(2,62,2,1490556216),(2,63,2,1490556217),(2,64,2,1490556218),(2,65,2,1490556218),(2,66,2,1490556219),(2,67,2,1490556220),(2,68,2,1490556221),(2,69,2,1490556221),(2,70,2,1490556222),(2,71,2,1490556223),(2,72,2,1490556224),(2,73,2,1490556224),(2,74,2,1490556225),(2,75,2,1490556226),(2,76,2,1490556227),(2,77,2,1490556227),(2,78,2,1490556228),(2,79,2,1490556229),(2,80,2,1490556229),(2,81,2,1490556230),(2,82,2,1490556231),(2,83,2,1490556232),(2,84,2,1490556232),(2,85,2,1490556233),(2,86,2,1490556234),(2,87,2,1490556235),(2,88,2,1490556235),(2,89,2,1490556236),(2,90,2,1490556237),(2,91,2,1490556238),(2,92,2,1490556238),(2,93,2,1490556239),(2,94,2,1490556240),(2,95,2,1490556241),(2,96,2,1490556241),(2,97,2,1490556242),(2,98,2,1490556243),(2,99,2,1490556244),(2,100,2,1490556244);
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
INSERT INTO `phpbb_user_group` VALUES (1,1,0,0),(2,2,0,0),(4,2,0,0),(5,2,1,0),(6,3,0,0),(6,4,0,0),(6,5,0,0),(6,6,0,0),(6,7,0,0),(6,8,0,0),(6,9,0,0),(6,10,0,0),(6,11,0,0),(6,12,0,0),(6,13,0,0),(6,14,0,0),(6,15,0,0),(6,16,0,0),(6,17,0,0),(6,18,0,0),(6,19,0,0),(6,20,0,0),(6,21,0,0),(6,22,0,0),(6,23,0,0),(6,24,0,0),(6,25,0,0),(6,26,0,0),(6,27,0,0),(6,28,0,0),(6,29,0,0),(6,30,0,0),(6,31,0,0),(6,32,0,0),(6,33,0,0),(6,34,0,0),(6,35,0,0),(6,36,0,0),(6,37,0,0),(6,38,0,0),(6,39,0,0),(6,40,0,0),(6,41,0,0),(6,42,0,0),(6,43,0,0),(6,44,0,0),(6,45,0,0),(6,46,0,0),(6,47,0,0),(2,48,0,0),(7,48,0,0),(2,49,0,0),(7,49,0,0),(2,50,0,0),(7,50,0,0),(2,51,0,0),(7,51,0,0),(2,52,0,0),(7,52,0,0),(2,53,0,0),(7,53,0,0),(2,54,0,0),(7,54,0,0),(2,55,0,0),(7,55,0,0),(2,56,0,0),(7,56,0,0),(2,57,0,0),(7,57,0,0);
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
INSERT INTO `phpbb_user_notifications` VALUES ('notification.type.post',0,2,'notification.method.board',1),('notification.type.post',0,2,'notification.method.email',1),('notification.type.topic',0,2,'notification.method.board',1),('notification.type.topic',0,2,'notification.method.email',1),('notification.type.post',0,3,'notification.method.email',1),('notification.type.topic',0,3,'notification.method.email',1),('notification.type.post',0,4,'notification.method.email',1),('notification.type.topic',0,4,'notification.method.email',1),('notification.type.post',0,5,'notification.method.email',1),('notification.type.topic',0,5,'notification.method.email',1),('notification.type.post',0,6,'notification.method.email',1),('notification.type.topic',0,6,'notification.method.email',1),('notification.type.post',0,7,'notification.method.email',1),('notification.type.topic',0,7,'notification.method.email',1),('notification.type.post',0,8,'notification.method.email',1),('notification.type.topic',0,8,'notification.method.email',1),('notification.type.post',0,9,'notification.method.email',1),('notification.type.topic',0,9,'notification.method.email',1),('notification.type.post',0,10,'notification.method.email',1),('notification.type.topic',0,10,'notification.method.email',1),('notification.type.post',0,11,'notification.method.email',1),('notification.type.topic',0,11,'notification.method.email',1),('notification.type.post',0,12,'notification.method.email',1),('notification.type.topic',0,12,'notification.method.email',1),('notification.type.post',0,13,'notification.method.email',1),('notification.type.topic',0,13,'notification.method.email',1),('notification.type.post',0,14,'notification.method.email',1),('notification.type.topic',0,14,'notification.method.email',1),('notification.type.post',0,15,'notification.method.email',1),('notification.type.topic',0,15,'notification.method.email',1),('notification.type.post',0,16,'notification.method.email',1),('notification.type.topic',0,16,'notification.method.email',1),('notification.type.post',0,17,'notification.method.email',1),('notification.type.topic',0,17,'notification.method.email',1),('notification.type.post',0,18,'notification.method.email',1),('notification.type.topic',0,18,'notification.method.email',1),('notification.type.post',0,19,'notification.method.email',1),('notification.type.topic',0,19,'notification.method.email',1),('notification.type.post',0,20,'notification.method.email',1),('notification.type.topic',0,20,'notification.method.email',1),('notification.type.post',0,21,'notification.method.email',1),('notification.type.topic',0,21,'notification.method.email',1),('notification.type.post',0,22,'notification.method.email',1),('notification.type.topic',0,22,'notification.method.email',1),('notification.type.post',0,23,'notification.method.email',1),('notification.type.topic',0,23,'notification.method.email',1),('notification.type.post',0,24,'notification.method.email',1),('notification.type.topic',0,24,'notification.method.email',1),('notification.type.post',0,25,'notification.method.email',1),('notification.type.topic',0,25,'notification.method.email',1),('notification.type.post',0,26,'notification.method.email',1),('notification.type.topic',0,26,'notification.method.email',1),('notification.type.post',0,27,'notification.method.email',1),('notification.type.topic',0,27,'notification.method.email',1),('notification.type.post',0,28,'notification.method.email',1),('notification.type.topic',0,28,'notification.method.email',1),('notification.type.post',0,29,'notification.method.email',1),('notification.type.topic',0,29,'notification.method.email',1),('notification.type.post',0,30,'notification.method.email',1),('notification.type.topic',0,30,'notification.method.email',1),('notification.type.post',0,31,'notification.method.email',1),('notification.type.topic',0,31,'notification.method.email',1),('notification.type.post',0,32,'notification.method.email',1),('notification.type.topic',0,32,'notification.method.email',1),('notification.type.post',0,33,'notification.method.email',1),('notification.type.topic',0,33,'notification.method.email',1),('notification.type.post',0,34,'notification.method.email',1),('notification.type.topic',0,34,'notification.method.email',1),('notification.type.post',0,35,'notification.method.email',1),('notification.type.topic',0,35,'notification.method.email',1),('notification.type.post',0,36,'notification.method.email',1),('notification.type.topic',0,36,'notification.method.email',1),('notification.type.post',0,37,'notification.method.email',1),('notification.type.topic',0,37,'notification.method.email',1),('notification.type.post',0,38,'notification.method.email',1),('notification.type.topic',0,38,'notification.method.email',1),('notification.type.post',0,39,'notification.method.email',1),('notification.type.topic',0,39,'notification.method.email',1),('notification.type.post',0,40,'notification.method.email',1),('notification.type.topic',0,40,'notification.method.email',1),('notification.type.post',0,41,'notification.method.email',1),('notification.type.topic',0,41,'notification.method.email',1),('notification.type.post',0,42,'notification.method.email',1),('notification.type.topic',0,42,'notification.method.email',1),('notification.type.post',0,43,'notification.method.email',1),('notification.type.topic',0,43,'notification.method.email',1),('notification.type.post',0,44,'notification.method.email',1),('notification.type.topic',0,44,'notification.method.email',1),('notification.type.post',0,45,'notification.method.email',1),('notification.type.topic',0,45,'notification.method.email',1),('notification.type.post',0,46,'notification.method.email',1),('notification.type.topic',0,46,'notification.method.email',1),('notification.type.post',0,47,'notification.method.email',1),('notification.type.topic',0,47,'notification.method.email',1),('notification.type.post',0,48,'notification.method.email',1),('notification.type.topic',0,48,'notification.method.email',1),('notification.type.post',0,49,'notification.method.email',1),('notification.type.topic',0,49,'notification.method.email',1),('notification.type.post',0,50,'notification.method.email',1),('notification.type.topic',0,50,'notification.method.email',1),('notification.type.post',0,51,'notification.method.email',1),('notification.type.topic',0,51,'notification.method.email',1),('notification.type.post',0,52,'notification.method.email',1),('notification.type.topic',0,52,'notification.method.email',1),('notification.type.post',0,53,'notification.method.email',1),('notification.type.topic',0,53,'notification.method.email',1),('notification.type.post',0,54,'notification.method.email',1),('notification.type.topic',0,54,'notification.method.email',1),('notification.type.post',0,55,'notification.method.email',1),('notification.type.topic',0,55,'notification.method.email',1),('notification.type.post',0,56,'notification.method.email',1),('notification.type.topic',0,56,'notification.method.email',1),('notification.type.post',0,57,'notification.method.email',1),('notification.type.topic',0,57,'notification.method.email',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpbb_users`
--

LOCK TABLES `phpbb_users` WRITE;
/*!40000 ALTER TABLE `phpbb_users` DISABLE KEYS */;
INSERT INTO `phpbb_users` VALUES (1,2,1,'00000000000g13ydq8\nhwba88000000\nhwba88000000',0,'',1490128344,'Anonymous','anonymous','',0,'',0,'',0,0,0,'','',0,0,0,0,0,0,0,'en','','d M Y H:i',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,230271,'','',0,0,'','','','','','','3c464a6eaf054f88',1,0,0),(2,3,5,'zik0zjzik0zjzik0zg\nhwba88000000\nzik0zjzieeps',0,'172.16.12.243',1490128344,'admin','admin','$2y$10$PAAYREakD4ADo8dIiiRgk.mOWG9JXDGzSA/rXJeKJzGe1FOUyk3ni',0,'admin@nyu.edu',35772842413,'',1490371398,0,1490556244,'install/app.php/install','',0,0,0,0,0,0,100,'en','','D M d, Y g:i a',1,1,'AA0000',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','4c50ce234ce14446',0,0,0),(3,2,6,'',0,'',1490128344,'AdsBot [Google]','adsbot [google]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','37c5fe46e92b5d09',0,0,0),(4,2,6,'',0,'',1490128344,'Alexa [Bot]','alexa [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9285386f77487ad0',0,0,0),(5,2,6,'',0,'',1490128344,'Alta Vista [Bot]','alta vista [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','c0a9504fa4bf5624',0,0,0),(6,2,6,'',0,'',1490128344,'Ask Jeeves [Bot]','ask jeeves [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','2523d78ca3fccc23',0,0,0),(7,2,6,'',0,'',1490128344,'Baidu [Spider]','baidu [spider]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','94a7b2b13a454c6e',0,0,0),(8,2,6,'',0,'',1490128344,'Bing [Bot]','bing [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','2fe5ecd1a5434e30',0,0,0),(9,2,6,'',0,'',1490128344,'Exabot [Bot]','exabot [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','64103a7aa1cfe8a8',0,0,0),(10,2,6,'',0,'',1490128344,'FAST Enterprise [Crawler]','fast enterprise [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','00e57ca4ed5c0069',0,0,0),(11,2,6,'',0,'',1490128344,'FAST WebCrawler [Crawler]','fast webcrawler [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','d04d8aa797e33db9',0,0,0),(12,2,6,'',0,'',1490128344,'Francis [Bot]','francis [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','5472edcff5b1b00f',0,0,0),(13,2,6,'',0,'',1490128344,'Gigabot [Bot]','gigabot [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','0bbe4b1fd56132f0',0,0,0),(14,2,6,'',0,'',1490128344,'Google Adsense [Bot]','google adsense [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','659e718e087ce41f',0,0,0),(15,2,6,'',0,'',1490128344,'Google Desktop','google desktop','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','d92b55fe06f3e694',0,0,0),(16,2,6,'',0,'',1490128344,'Google Feedfetcher','google feedfetcher','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','fac36ddcbcbd13d4',0,0,0),(17,2,6,'',0,'',1490128344,'Google [Bot]','google [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','3abfc6f5e7cf8d17',0,0,0),(18,2,6,'',0,'',1490128344,'Heise IT-Markt [Crawler]','heise it-markt [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','ef6b218733a37d1f',0,0,0),(19,2,6,'',0,'',1490128344,'Heritrix [Crawler]','heritrix [crawler]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','1db09ec609ba1bff',0,0,0),(20,2,6,'',0,'',1490128344,'IBM Research [Bot]','ibm research [bot]','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','6aab4c9aa0fa47fc',0,0,0),(21,2,6,'',0,'',1490128344,'ICCrawler - ICjobs','iccrawler - icjobs','',1490128344,'',0,'',0,1490128344,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','4ef25e8d19aa3018',0,0,0),(22,2,6,'',0,'',1490128345,'ichiro [Crawler]','ichiro [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','7da0d277eae1f597',0,0,0),(23,2,6,'',0,'',1490128345,'Majestic-12 [Bot]','majestic-12 [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','4afd17829227690b',0,0,0),(24,2,6,'',0,'',1490128345,'Metager [Bot]','metager [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','f92df17b29d4c173',0,0,0),(25,2,6,'',0,'',1490128345,'MSN NewsBlogs','msn newsblogs','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','815247a09fac4aec',0,0,0),(26,2,6,'',0,'',1490128345,'MSN [Bot]','msn [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','87a0152c5fdbb076',0,0,0),(27,2,6,'',0,'',1490128345,'MSNbot Media','msnbot media','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9242274ba8f17274',0,0,0),(28,2,6,'',0,'',1490128345,'Nutch [Bot]','nutch [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','2aadd8efc0731690',0,0,0),(29,2,6,'',0,'',1490128345,'Online link [Validator]','online link [validator]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','e34461f81677673d',0,0,0),(30,2,6,'',0,'',1490128345,'psbot [Picsearch]','psbot [picsearch]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','829515225f8c4dbb',0,0,0),(31,2,6,'',0,'',1490128345,'Sensis [Crawler]','sensis [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','682ced82f82670cb',0,0,0),(32,2,6,'',0,'',1490128345,'SEO Crawler','seo crawler','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','5bcc9234c99f73f5',0,0,0),(33,2,6,'',0,'',1490128345,'Seoma [Crawler]','seoma [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','1ef98325c62e3af5',0,0,0),(34,2,6,'',0,'',1490128345,'SEOSearch [Crawler]','seosearch [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','38a044936a64353b',0,0,0),(35,2,6,'',0,'',1490128345,'Snappy [Bot]','snappy [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','f943dde0beef6d44',0,0,0),(36,2,6,'',0,'',1490128345,'Steeler [Crawler]','steeler [crawler]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9a310fe620a78ac4',0,0,0),(37,2,6,'',0,'',1490128345,'Telekom [Bot]','telekom [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','716bdce423506599',0,0,0),(38,2,6,'',0,'',1490128345,'TurnitinBot [Bot]','turnitinbot [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','ce6287b8c33dd47e',0,0,0),(39,2,6,'',0,'',1490128345,'Voyager [Bot]','voyager [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','175751a545850f02',0,0,0),(40,2,6,'',0,'',1490128345,'W3 [Sitesearch]','w3 [sitesearch]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','7825b860ddbbf7f0',0,0,0),(41,2,6,'',0,'',1490128345,'W3C [Linkcheck]','w3c [linkcheck]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','b5de7ebed93e4320',0,0,0),(42,2,6,'',0,'',1490128345,'W3C [Validator]','w3c [validator]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','969fa4a9cef7b534',0,0,0),(43,2,6,'',0,'',1490128345,'YaCy [Bot]','yacy [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','3476473b4d2cc67a',0,0,0),(44,2,6,'',0,'',1490128345,'Yahoo MMCrawler [Bot]','yahoo mmcrawler [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','c51bfdfc1ada712b',0,0,0),(45,2,6,'',0,'',1490128345,'Yahoo Slurp [Bot]','yahoo slurp [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','332f72ed3bd7c37d',0,0,0),(46,2,6,'',0,'',1490128345,'Yahoo [Bot]','yahoo [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','9831cb6e43e21eb6',0,0,0),(47,2,6,'',0,'',1490128345,'YahooSeeker [Bot]','yahooseeker [bot]','',1490128345,'',0,'',0,1490128345,0,'','',0,0,0,0,0,0,0,'0','UTC','D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,0,1,1,0,230271,'','',0,0,'','','','','','','588b875f8a4d0162',0,0,0),(48,0,2,'',0,'216.165.71.216',1490556164,'user0','user0','$2y$10$9HkncIcviMEBqF1AHGcZuuqV0U8u0PoSGgM4It5X2kbDp185MCEkq',1490556164,'user0@email.com',324665297915,'',0,1490556164,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','20ce05b02c41ae3c',1,0,0),(49,0,2,'',0,'216.165.71.216',1490556165,'user1','user1','$2y$10$qq47mAg2cXEAEqd2q6m7a.r1P5IcLZpj7lgJyMcO6z6/mBmLX0cKi',1490556165,'user1@email.com',86065915,'',0,1490556165,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','621ae99a71249c31',1,0,0),(50,0,2,'',0,'216.165.71.216',1490556166,'user2','user2','$2y$10$zx.URATBk8svyE7C4M3fhuSYs7UHixQEtw56sFXRNfubBA4SVpbPe',1490556166,'user2@email.com',258259557015,'',0,1490556166,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','1360c83f445202d7',1,0,0),(51,0,2,'',0,'216.165.71.216',1490556167,'user3','user3','$2y$10$SUEpolle/AIA9h3GGz6C6unlunvP6xb8l.I1cDp73kn.bV8jH.aEi',1490556167,'user3@email.com',148279096215,'',0,1490556167,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','3c41bbb6859ff416',1,0,0),(52,0,2,'',0,'216.165.71.216',1490556167,'user4','user4','$2y$10$859KyPnVccZc3NgLqgJk3OpfFD/UFXWlvwUNIUHIFi36DgnizWfuG',1490556167,'user4@email.com',190175992115,'',0,1490556167,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','35af65fa0ac7b2bb',1,0,0),(53,0,2,'',0,'216.165.71.216',1490556168,'user5','user5','$2y$10$w3TcEiMSeNWk/zptgt.OI.hGpm3E4YEuz9OLz0QMmRi1wuimb.u42',1490556168,'user5@email.com',296670475315,'',0,1490556168,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','c25fafc07215db1c',1,0,0),(54,0,2,'',0,'216.165.71.216',1490556169,'user6','user6','$2y$10$bGGgGVh2PO4y6bERFuydAO0L5oRrRQfJm88ltvbD3oZo2VC3m2SmC',1490556169,'user6@email.com',69141822415,'',0,1490556169,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','f10fab15d4b08db9',1,0,0),(55,0,2,'',0,'216.165.71.216',1490556170,'user7','user7','$2y$10$/hDe8QG5vIUiTDAbZhSr2ON61ufVOzIuIPjuX4KS53c.jWuVvIdga',1490556170,'user7@email.com',390443307215,'',0,1490556170,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','63860ee77a2d0e12',1,0,0),(56,0,2,'',0,'216.165.71.216',1490556170,'user8','user8','$2y$10$IblAMUR/SV7wt5mZ6J8BkOWohh0jk0IA/CjAJaU86hE.P/SSakUi.',1490556170,'user8@email.com',206779992615,'',0,1490556170,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','e75142ab7d562f1c',1,0,0),(57,0,2,'',0,'216.165.71.216',1490556171,'user9','user9','$2y$10$3bP5xlvozlxWjw74YkoIZ.bpO9z2j1p/84izvLaTKK0A/dZn.inD.',1490556171,'user9@email.com',313411192615,'',0,1490556171,0,'','',0,0,0,0,0,0,0,'en','America/Anguilla','D M d, Y g:i a',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,230271,'','',0,0,'','','','','','','5a03431672befc45',1,0,0);
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

-- Dump completed on 2017-03-26 15:24:04
