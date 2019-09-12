CREATE DATABASE  IF NOT EXISTS `db_pomangam` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_pomangam`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_pomangam
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(150) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `idx_target` int(11) DEFAULT NULL,
  `regdate` varchar(45) NOT NULL,
  `moddate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_member_idx` (`idx_target`),
  CONSTRAINT `fk_member` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','$2a$10$2xzerw/0WyuPc3Psx0rxhuRY4DqqjuuDJCWqFUFquSteKFFUXHh5y','최낙형','낙지',NULL,'2018-08-10 08:11',NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_restaurant` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `imgpath` varchar(45) DEFAULT NULL,
  `description` text,
  `cnt_limit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_menu_idx` (`idx_restaurant`),
  CONSTRAINT `fk_menu` FOREIGN KEY (`idx_restaurant`) REFERENCES `restaurant` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_recommand`
--

DROP TABLE IF EXISTS `menu_recommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_recommand` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_menu` int(11) DEFAULT NULL,
  `idx_menu_recommand` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_recommand_idx` (`idx_menu`),
  KEY `fk_recommand2_idx` (`idx_menu_recommand`),
  CONSTRAINT `fk_recommand` FOREIGN KEY (`idx_menu`) REFERENCES `menu` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recommand2` FOREIGN KEY (`idx_menu_recommand`) REFERENCES `menu` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_recommand`
--

LOCK TABLES `menu_recommand` WRITE;
/*!40000 ALTER TABLE `menu_recommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_recommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `idx_member` int(11) DEFAULT NULL,
  `idx_target` int(11) DEFAULT NULL,
  `idx_restaurant` int(11) DEFAULT NULL,
  `idx_menu` int(11) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_payment_idx` (`idx_member`),
  KEY `fk_payment_target_idx` (`idx_target`),
  KEY `fk_payment_restaurant_idx` (`idx_restaurant`),
  KEY `fk_payment_menu_idx` (`idx_menu`),
  CONSTRAINT `fk_payment_member` FOREIGN KEY (`idx_member`) REFERENCES `member` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_menu` FOREIGN KEY (`idx_menu`) REFERENCES `menu` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_restaurant` FOREIGN KEY (`idx_restaurant`) REFERENCES `restaurant` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_target` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_target` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `description` text,
  `imgpath` varchar(45) DEFAULT NULL,
  `cnt_star` varchar(45) DEFAULT NULL,
  `cnt_comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_restaurant_idx` (`idx_target`),
  CONSTRAINT `fk_restaurant` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_member` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `start` varchar(45) DEFAULT NULL,
  `expire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_subscription_idx` (`idx_member`),
  CONSTRAINT `fk_subscription` FOREIGN KEY (`idx_member`) REFERENCES `member` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `imgpath` varchar(45) DEFAULT NULL,
  `description` text,
  `cnt_order` int(11) DEFAULT NULL,
  `cnt_subscription` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_category`
--

DROP TABLE IF EXISTS `target_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_category` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_target` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_category_idx` (`idx_target`),
  CONSTRAINT `fk_category` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_category`
--

LOCK TABLES `target_category` WRITE;
/*!40000 ALTER TABLE `target_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_destination`
--

DROP TABLE IF EXISTS `target_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_destination` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_target` int(11) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `arrival` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_destination_idx` (`idx_target`),
  CONSTRAINT `fk_destination` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_destination`
--

LOCK TABLES `target_destination` WRITE;
/*!40000 ALTER TABLE `target_destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_ordertime`
--

DROP TABLE IF EXISTS `target_ordertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_ordertime` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_target` int(11) DEFAULT NULL,
  `start` varchar(45) DEFAULT NULL,
  `end` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_ordertime_idx` (`idx_target`),
  CONSTRAINT `fk_ordertime` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_ordertime`
--

LOCK TABLES `target_ordertime` WRITE;
/*!40000 ALTER TABLE `target_ordertime` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_ordertime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_region`
--

DROP TABLE IF EXISTS `target_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_region` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_target` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_region_idx` (`idx_target`),
  CONSTRAINT `fk_region` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_region`
--

LOCK TABLES `target_region` WRITE;
/*!40000 ALTER TABLE `target_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-14 14:22:55
