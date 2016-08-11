CREATE DATABASE  IF NOT EXISTS `startapp_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `startapp_db`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: startapp_db
-- ------------------------------------------------------
-- Server version	5.6.14-log

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
-- Table structure for table `main_chat`
--

DROP TABLE IF EXISTS `main_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `message_date` datetime(6) NOT NULL,
  `message_author_id` int(11) NOT NULL,
  `message_channel_id` int(11) NOT NULL,
  `message_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_chat_message_author_id_89226625_fk_main_user_id` (`message_author_id`),
  KEY `main_chat_message_channel_id_0e90ea85_fk_main_channel_id` (`message_channel_id`),
  KEY `main_chat_message_project_id_16fa188f_fk_main_project_id` (`message_project_id`),
  CONSTRAINT `main_chat_message_project_id_16fa188f_fk_main_project_id` FOREIGN KEY (`message_project_id`) REFERENCES `main_project` (`id`),
  CONSTRAINT `main_chat_message_author_id_89226625_fk_main_user_id` FOREIGN KEY (`message_author_id`) REFERENCES `main_user` (`id`),
  CONSTRAINT `main_chat_message_channel_id_0e90ea85_fk_main_channel_id` FOREIGN KEY (`message_channel_id`) REFERENCES `main_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_chat`
--

LOCK TABLES `main_chat` WRITE;
/*!40000 ALTER TABLE `main_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_like`
--

DROP TABLE IF EXISTS `main_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `like_date` datetime(6) NOT NULL,
  `like_author_id` int(11) NOT NULL,
  `like_update_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_like_like_author_id_d3c727c2_fk_main_user_id` (`like_author_id`),
  KEY `main_like_like_update_id_936afc65_fk_main_update_id` (`like_update_id`),
  CONSTRAINT `main_like_like_update_id_936afc65_fk_main_update_id` FOREIGN KEY (`like_update_id`) REFERENCES `main_update` (`id`),
  CONSTRAINT `main_like_like_author_id_d3c727c2_fk_main_user_id` FOREIGN KEY (`like_author_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_like`
--

LOCK TABLES `main_like` WRITE;
/*!40000 ALTER TABLE `main_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user`
--

DROP TABLE IF EXISTS `main_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(200) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `position` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` varchar(200) DEFAULT NULL,
  `rank` varchar(200) DEFAULT NULL,
  `role` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user`
--

LOCK TABLES `main_user` WRITE;
/*!40000 ALTER TABLE `main_user` DISABLE KEYS */;
INSERT INTO `main_user` VALUES (1,'','abaybek','Abay Kerimov','abaybek@list.ru','77054101380','Web разработчик','1','','',''),(2,'','Boris','Denis Artemyev','denis.art@mail.ru','','Web разработчик','1','','',''),(3,'','Ganizhol','Gani Shoiynbay','gani.shoiynbay@gmail.com','77473892638','Web разработчик','1','','','');
/*!40000 ALTER TABLE `main_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_projectuser`
--

DROP TABLE IF EXISTS `main_projectuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_projectuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isCreator` tinyint(1) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_projectuser_project_id_c01b7f9e_fk_main_project_id` (`project_id`),
  KEY `main_projectuser_user_id_23d3e5b6_fk_main_user_id` (`user_id`),
  CONSTRAINT `main_projectuser_user_id_23d3e5b6_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`),
  CONSTRAINT `main_projectuser_project_id_c01b7f9e_fk_main_project_id` FOREIGN KEY (`project_id`) REFERENCES `main_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_projectuser`
--

LOCK TABLES `main_projectuser` WRITE;
/*!40000 ALTER TABLE `main_projectuser` DISABLE KEYS */;
INSERT INTO `main_projectuser` VALUES (1,0,1,1),(2,0,2,2),(3,1,2,3);
/*!40000 ALTER TABLE `main_projectuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_update`
--

DROP TABLE IF EXISTS `main_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `isNotification` tinyint(1) NOT NULL,
  `update_author_id` int(11) NOT NULL,
  `update_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `heading` (`heading`),
  KEY `main_update_update_author_id_85209154_fk_main_user_id` (`update_author_id`),
  KEY `main_update_update_project_id_6fad9319_fk_main_project_id` (`update_project_id`),
  CONSTRAINT `main_update_update_project_id_6fad9319_fk_main_project_id` FOREIGN KEY (`update_project_id`) REFERENCES `main_project` (`id`),
  CONSTRAINT `main_update_update_author_id_85209154_fk_main_user_id` FOREIGN KEY (`update_author_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_update`
--

LOCK TABLES `main_update` WRITE;
/*!40000 ALTER TABLE `main_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_category`
--

DROP TABLE IF EXISTS `main_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_category`
--

LOCK TABLES `main_category` WRITE;
/*!40000 ALTER TABLE `main_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_channeluser`
--

DROP TABLE IF EXISTS `main_channeluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_channeluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isCreator` tinyint(1) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_channeluser_channel_id_95fcc3e0_fk_main_channel_id` (`channel_id`),
  KEY `main_channeluser_user_id_dc030b17_fk_main_user_id` (`user_id`),
  CONSTRAINT `main_channeluser_user_id_dc030b17_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`),
  CONSTRAINT `main_channeluser_channel_id_95fcc3e0_fk_main_channel_id` FOREIGN KEY (`channel_id`) REFERENCES `main_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_channeluser`
--

LOCK TABLES `main_channeluser` WRITE;
/*!40000 ALTER TABLE `main_channeluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_channeluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_comment`
--

DROP TABLE IF EXISTS `main_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) NOT NULL,
  `comment_date` datetime(6) NOT NULL,
  `comment_author_id` int(11) NOT NULL,
  `comment_update_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_comment_comment_author_id_b0c6882c_fk_main_user_id` (`comment_author_id`),
  KEY `main_comment_comment_update_id_a47add8f_fk_main_update_id` (`comment_update_id`),
  CONSTRAINT `main_comment_comment_update_id_a47add8f_fk_main_update_id` FOREIGN KEY (`comment_update_id`) REFERENCES `main_update` (`id`),
  CONSTRAINT `main_comment_comment_author_id_b0c6882c_fk_main_user_id` FOREIGN KEY (`comment_author_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_comment`
--

LOCK TABLES `main_comment` WRITE;
/*!40000 ALTER TABLE `main_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_channel`
--

DROP TABLE IF EXISTS `main_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(200) NOT NULL,
  `open_date` datetime(6) NOT NULL,
  `close_date` datetime(6) NOT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `channel_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_channel_channel_project_id_d169089f_fk_main_project_id` (`channel_project_id`),
  CONSTRAINT `main_channel_channel_project_id_d169089f_fk_main_project_id` FOREIGN KEY (`channel_project_id`) REFERENCES `main_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_channel`
--

LOCK TABLES `main_channel` WRITE;
/*!40000 ALTER TABLE `main_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subscribeproject`
--

DROP TABLE IF EXISTS `main_subscribeproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_subscribeproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscribe_date` datetime(6) NOT NULL,
  `subscribe_author_id` int(11) NOT NULL,
  `subscribe_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_subscribeproje_subscribe_author_id_cce84f80_fk_main_user_id` (`subscribe_author_id`),
  KEY `main_subscribep_subscribe_project_id_5a28db51_fk_main_project_id` (`subscribe_project_id`),
  CONSTRAINT `main_subscribep_subscribe_project_id_5a28db51_fk_main_project_id` FOREIGN KEY (`subscribe_project_id`) REFERENCES `main_project` (`id`),
  CONSTRAINT `main_subscribeproje_subscribe_author_id_cce84f80_fk_main_user_id` FOREIGN KEY (`subscribe_author_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subscribeproject`
--

LOCK TABLES `main_subscribeproject` WRITE;
/*!40000 ALTER TABLE `main_subscribeproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subscribeproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_notification`
--

DROP TABLE IF EXISTS `main_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` varchar(200) NOT NULL,
  `notification_date` datetime(6) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_notification_to_user_id_e1344da7_fk_main_user_id` (`to_user_id`),
  CONSTRAINT `main_notification_to_user_id_e1344da7_fk_main_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_notification`
--

LOCK TABLES `main_notification` WRITE;
/*!40000 ALTER TABLE `main_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_project`
--

DROP TABLE IF EXISTS `main_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_project`
--

LOCK TABLES `main_project` WRITE;
/*!40000 ALTER TABLE `main_project` DISABLE KEYS */;
INSERT INTO `main_project` VALUES (1,'abaysys','Great project','2016-08-11 17:16:50.110713'),(2,'Автоматизированная система','Номер два.','2016-08-11 17:34:16.913828');
/*!40000 ALTER TABLE `main_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-12  1:05:23
