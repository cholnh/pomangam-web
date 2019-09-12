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
-- Table structure for table `common_map`
--

DROP TABLE IF EXISTS `common_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_map` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_map`
--

LOCK TABLES `common_map` WRITE;
/*!40000 ALTER TABLE `common_map` DISABLE KEYS */;
INSERT INTO `common_map` VALUES (1,'time_start','11:30'),(2,'time_end','21:30');
/*!40000 ALTER TABLE `common_map` ENABLE KEYS */;
UNLOCK TABLES;

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
  `idx_subscribe` int(11) DEFAULT NULL,
  `regdate` varchar(45) NOT NULL,
  `moddate` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `session_key` varchar(45) DEFAULT NULL,
  `session_limit` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_member_idx` (`idx_target`),
  CONSTRAINT `fk_member` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','$2a$10$2xzerw/0WyuPc3Psx0rxhuRY4DqqjuuDJCWqFUFquSteKFFUXHh5y','최낙형','낙지',1,NULL,'2018-08-10 08:11',NULL,'010-6478-4899','788524B31A9FC20AD1A81D2AD2CEBC8D','2018-08-24 06:26:20'),(2,'cholnh','$2a$10$vPxR7pnkkpeseccDkuCV1./bkOYw/yVs0z/6aZ2RhMFkdEkEXPRpq','최낙형',NULL,1,NULL,'2018-08-27 00:34:09',NULL,'010-6478-4899','7629DBD561616B7105B561CC7972A132','2018-08-26 15:41:40');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
  `idx_target` int(11) DEFAULT NULL,
  `idx_restaurant` int(11) DEFAULT NULL,
  `idx_product` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_payment_target_idx` (`idx_target`),
  KEY `fk_payment_restaurant_idx` (`idx_restaurant`),
  KEY `fk_payment_product_idx` (`idx_product`),
  CONSTRAINT `fk_payment_product` FOREIGN KEY (`idx_product`) REFERENCES `product` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_restaurant` FOREIGN KEY (`idx_restaurant`) REFERENCES `restaurant` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_target` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (39,NULL,1,1,2,1),(40,NULL,1,1,2,1),(41,NULL,1,1,2,1),(42,NULL,1,1,2,1),(43,NULL,1,5,6,1),(44,NULL,1,1,2,1),(45,NULL,1,1,2,1),(46,NULL,1,1,1,1),(47,NULL,1,1,2,1),(48,NULL,1,1,2,1),(49,NULL,1,1,2,1),(50,NULL,1,1,2,1),(51,NULL,1,1,2,1),(52,NULL,1,1,2,1),(53,NULL,1,3,4,1),(54,NULL,1,1,1,1),(55,NULL,1,3,4,1),(56,NULL,1,1,1,10),(57,NULL,1,1,1,10),(58,NULL,1,1,2,10),(59,NULL,1,4,8,6),(60,NULL,1,1,2,5),(61,NULL,1,8,10,1),(62,NULL,1,1,1,1),(63,NULL,1,7,12,3),(64,NULL,1,9,18,2),(65,NULL,1,3,4,1),(66,NULL,1,1,2,1),(67,NULL,1,1,1,1),(68,NULL,1,1,1,1),(69,NULL,1,1,2,1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_index`
--

DROP TABLE IF EXISTS `payment_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_index` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idxes_payment` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `idx_box` int(11) DEFAULT NULL,
  `idx_target` int(11) DEFAULT NULL,
  `receive_date` varchar(45) DEFAULT NULL,
  `receive_time` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 : 결제 대기, 1 : 결제 완료, 2 : 결제 실패',
  `username` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_member_username_idx` (`username`),
  KEY `fk_idx_target_idx` (`idx_target`),
  CONSTRAINT `fk_idx_target` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_username` FOREIGN KEY (`username`) REFERENCES `member` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_index`
--

LOCK TABLES `payment_index` WRITE;
/*!40000 ALTER TABLE `payment_index` DISABLE KEYS */;
INSERT INTO `payment_index` VALUES (22,'39','74','2018-08-23 20:27:15',0,1,'2018-08-25','오후 9:45',NULL,NULL,NULL,NULL),(23,'40','57','2018-08-23 20:44:51',NULL,1,'2018-08-25','오후 9:45',NULL,NULL,NULL,NULL),(24,'41','87','2018-08-23 20:57:49',1,1,'2018-08-25','오후 9:45',NULL,NULL,NULL,NULL),(25,'42','82','2018-08-23 21:43:01',2,1,'2018-08-25','오후 9:45',NULL,NULL,NULL,NULL),(26,'43','81','2018-08-23 21:44:07',3,1,'2018-08-25','오후 9:45',NULL,NULL,NULL,NULL),(27,'44','69','2018-08-23 22:03:09',0,1,'2018-08-25','오후 5:00',NULL,NULL,NULL,NULL),(29,'45,46','81','2018-08-23 22:19:48',0,1,'2018-08-25','오전 11:00',1,NULL,NULL,NULL),(30,'47','92','2018-08-24 00:10:09',1,1,'2018-08-25','오전 11:00',1,NULL,NULL,NULL),(31,'50','09','2018-08-24 01:01:40',2,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 6398]',NULL),(32,'52','82','2018-08-24 01:02:37',3,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 6617]','010-4234'),(33,'53','13','2018-08-24 01:04:35',4,1,'2018-08-25','오전 11:00',1,'admin','web [Ip : 0:0:0:0:0:0:0:1 Port : 7012]','010-1234-5677'),(34,'54','88','2018-08-24 01:04:51',5,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 7012]','123'),(35,'55','37','2018-08-24 01:20:40',6,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 10123]','01040402131'),(36,'56','49','2018-08-25 21:45:47',0,1,'2018-08-25','오전 11:00',0,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 4188]','01064784899'),(37,'57','69','2018-08-25 21:49:20',0,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 4518]','01064784899'),(38,'58','07','2018-08-25 22:00:35',1,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 5511]','01064784899'),(39,'59,60,61','77','2018-08-25 22:01:34',2,1,'2018-08-25','오전 11:00',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 5512]','01046748822'),(40,'62,63,64,65','87','2018-08-26 20:11:50',0,1,'2018-08-26','23시 0분',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 8211]','01064784899'),(41,'66','38','2018-08-26 21:08:32',0,1,'2018-08-26','22시 0분',1,NULL,'web [Ip : 211.36.134.254 Port : 28747]','01064784899'),(42,'67','47','2018-08-26 21:14:07',0,1,'2018-08-26','0시 0분',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 1493]','01064784899'),(43,'68','65','2018-08-26 22:11:39',1,1,'2018-08-26','0시 0분',1,NULL,'web [Ip : 0:0:0:0:0:0:0:1 Port : 7626]','01011111111'),(44,'69','17','2018-08-27 01:05:49',0,1,'2018-08-27','12시',1,'cholnh','web [Ip : 0:0:0:0:0:0:0:1 Port : 11923]',NULL);
/*!40000 ALTER TABLE `payment_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_restaurant` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `imgpath` varchar(45) DEFAULT NULL,
  `description` text,
  `unit_amount` int(11) NOT NULL DEFAULT '1',
  `unit_time` int(11) NOT NULL DEFAULT '5',
  `cnt_sell` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_product_idx` (`idx_restaurant`),
  CONSTRAINT `fk_product` FOREIGN KEY (`idx_restaurant`) REFERENCES `restaurant` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,NULL,'화이트 갈릭버거',6000,'resources/img/product/1.jpg','크림처럼 부드러운 화이트 갈릭 소스에 <br>프리미엄 더블햄과 통가슴살 패티까지<br> 하나에 다 담은 묵직한 버거! ',1,5,0),(2,1,NULL,'싸이버거',3200,'resources/img/product/2.jpg','싸이버거!!',5,2,0),(3,2,NULL,'고구마피자',7000,'resources/img/product/3.jpg','고구마 피자야',1,5,0),(4,3,NULL,'고구마피자',7000,'resources/img/product/4.jpg','고구마 피자야',1,5,0),(5,5,NULL,'아이스크림',1500,'resources/img/product/8.jpg','ㅁㄴㅇ',1,5,0),(6,5,NULL,'어른스크림',3000,'resources/img/product/10.jpg','ㄴㄴㄴ',1,5,0),(7,6,NULL,'매운떡볶이',10000,'resources/img/product/6.jpg','ㅇㄹㄶ',1,5,0),(8,4,NULL,'순대국',4000,'resources/img/product/7.jpg','ㅇㅀㅀㅇ',1,1,0),(9,6,NULL,'국물떡볶이',2000,'resources/img/product/8.jpg','ㅇㅀ',1,5,0),(10,8,NULL,'빙수',3000,'resources/img/product/9.jpg','ㅇㅀ',1,15,0),(11,7,NULL,'서브웨이클럽',4500,'resources/img/product/11.jpg','음식설명',1,5,0),(12,7,NULL,'스파이시이탈리안',4500,'resources/img/product/12.jpg','음식설명',1,5,0),(13,7,NULL,'미트볼',4500,'resources/img/product/13.jpg','음식설명',1,5,0),(14,7,NULL,'터키베이컨',5100,'resources/img/product/14.jpg','음식설명',1,5,0),(15,7,NULL,'에그마요',5100,'resources/img/product/15.jpg','음식설명',1,5,0),(16,7,NULL,'로스트비프',5500,'resources/img/product/16.jpg','음식설명',1,5,0),(17,7,NULL,'스테이크&치즈',5500,'resources/img/product/17.jpg','음식설명',1,5,0),(18,9,NULL,'치킨마요',3500,'resources/img/product/18.jpg','음식설명',1,5,0),(19,9,NULL,'참치마요',3400,'resources/img/product/19.jpg','음식설명',1,5,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_recommend`
--

DROP TABLE IF EXISTS `product_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_recommend` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_product` int(11) DEFAULT NULL,
  `idx_product_recommend` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_recommend_idx` (`idx_product`),
  KEY `fk_recommend2_idx` (`idx_product_recommend`),
  CONSTRAINT `fk_recommend` FOREIGN KEY (`idx_product`) REFERENCES `product` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recommend2` FOREIGN KEY (`idx_product_recommend`) REFERENCES `product` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_recommend`
--

LOCK TABLES `product_recommend` WRITE;
/*!40000 ALTER TABLE `product_recommend` DISABLE KEYS */;
INSERT INTO `product_recommend` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,5),(5,2,1),(6,2,7),(7,2,9),(8,3,4),(9,3,5),(10,4,1),(11,4,2),(12,4,3),(13,4,6);
/*!40000 ALTER TABLE `product_recommend` ENABLE KEYS */;
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
  `cnt_star` int(11) DEFAULT NULL,
  `cnt_comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_restaurant_idx` (`idx_target`),
  CONSTRAINT `fk_restaurant` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,1,'맘스터치','가라뫼 사거리 32-15','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/12.png',5,232),(2,2,'피자스쿨','신촌역 1번출구','031-123-4567','#피자 #피자피자 #맛집','resources/img/restaurant/5.png',5,11),(3,1,'피자스쿨','가라뫼 사거리 123','031-123-4567','#피자 #항공대 피자','resources/img/restaurant/5.png',5,13),(4,1,'할매순대국','가라뫼 사거리 345','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/4.png',5,23),(5,1,'베스킨라빈스','가라뫼 사거리 22','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/1.png',5,43),(6,1,'엽기떡볶이','가라뫼 사거리 77','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/9.png',5,16),(7,1,'서브웨이','가라뫼 사거리 456','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/2.png',5,53),(8,1,'설빙','가라뫼 사거리 90','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/3.png',5,10),(9,1,'한솥도시락','가라뫼 사거리 123','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/8.png',5,123),(10,1,'교촌치킨','가라뫼 사거리 123','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/10.png',5,123),(11,1,'KFC','가라뫼 사거리 123','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/7.png',5,123),(12,1,'버거킹','가라뫼 사거리 123','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/6.png',5,123);
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
  `idx_target` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `start` varchar(45) DEFAULT NULL,
  `expire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_subscription_idx` (`idx_member`),
  KEY `fk_subscription2_idx` (`idx_target`),
  CONSTRAINT `fk_subscription` FOREIGN KEY (`idx_member`) REFERENCES `member` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription2` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `category` varchar(45) DEFAULT NULL,
  `description` text,
  `cnt_order` int(11) DEFAULT NULL,
  `cnt_subscription` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (1,'한국항공대학교','경기도 고양시 덕양구 항공대학로 76','resources/img/main/school.jpg','경기',NULL,21,0),(2,'경기대학교 수원캠퍼스','경기도 수원시 영통구 광교산로 154-42','resources/img/main/school3.jpg','경기',NULL,0,0);
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-27 11:26:30
