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
  `idx_product` int(11) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_payment_idx` (`idx_member`),
  KEY `fk_payment_target_idx` (`idx_target`),
  KEY `fk_payment_restaurant_idx` (`idx_restaurant`),
  KEY `fk_payment_product_idx` (`idx_product`),
  CONSTRAINT `fk_payment_member` FOREIGN KEY (`idx_member`) REFERENCES `member` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_product` FOREIGN KEY (`idx_product`) REFERENCES `product` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_restaurant` FOREIGN KEY (`idx_restaurant`) REFERENCES `restaurant` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_target` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'1',1,1,1,1,'학생회관 앞 키오스크','2018-08-15 22:48'),(2,'2',1,1,1,1,'학생회관 앞 키오스크','2018-08-16 22:48');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
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
  `cnt_limit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_product_idx` (`idx_restaurant`),
  CONSTRAINT `fk_product` FOREIGN KEY (`idx_restaurant`) REFERENCES `restaurant` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,NULL,'화이트 갈릭버거',6000,'resources/img/product/1.jpg','크림처럼 부드러운 화이트 갈릭 소스에 프리미엄 더블햄과 통가슴살 패티까지 하나에 다 담은 묵직한 버거! ','32'),(2,1,NULL,'싸이버거',3200,'resources/img/product/2.jpg','싸이버거!!','16'),(3,2,NULL,'고구마피자',7000,'resources/img/product/3.jpg','고구마 피자야','5'),(4,3,NULL,'고구마피자',7000,'resources/img/product/3.jpg','고구마 피자야','6'),(5,5,NULL,'아이스크림',1500,'resources/img/product/4.jpg','ㅁㄴㅇ','100'),(6,5,NULL,'어른스크림',3000,'resources/img/product/5.jpg','ㄴㄴㄴ','50'),(7,6,NULL,'매운떡볶이',10000,'resources/img/product/6.jpg','ㅇㄹㄶ','109'),(8,4,NULL,'순대국',4000,'resources/img/product/7.jpg','ㅇㅀㅀㅇ','34'),(9,7,NULL,'국물떡볶이',2000,'resources/img/product/8.jpg','ㅇㅀ','45'),(10,8,NULL,'빙수',3000,'resources/img/product/9.jpg','ㅇㅀ','87');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_recommand`
--

DROP TABLE IF EXISTS `product_recommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_recommand` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `idx_product` int(11) DEFAULT NULL,
  `idx_product_recommand` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_recommand_1_idx` (`idx_product`),
  KEY `fk_recommand_2_idx` (`idx_product_recommand`),
  CONSTRAINT `fk_recommand_1` FOREIGN KEY (`idx_product`) REFERENCES `product` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recommand_2` FOREIGN KEY (`idx_product_recommand`) REFERENCES `product` (`idx`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_recommand`
--

LOCK TABLES `product_recommand` WRITE;
/*!40000 ALTER TABLE `product_recommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_recommand` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,1,'맘스터치','가라뫼 사거리 32-15','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/1.png',5,232),(2,2,'피자스쿨','신촌역 1번출구','031-123-4567','#피자 #피자피자 #맛집','resources/img/restaurant/2.png',4,11),(3,1,'피자스쿨','가라뫼 사거리 123','031-123-4567','#피자 #항공대 피자','resources/img/restaurant/3.png',4,13),(4,1,'할매순대국','가라뫼 사거리 345','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/4.png',3,23),(5,1,'베스킨라빈스','가라뫼 사거리 22','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/5.png',3,43),(6,1,'엽기떡볶이','가라뫼 사거리 77','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/6.png',4,16),(7,1,'죠스떡볶이','가라뫼 사거리 456','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/7.png',3,53),(8,1,'설빙','가라뫼 사거리 90','031-123-4567','#존맛탱 #친절 #맛집 #항공대','resources/img/restaurant/8.png',4,10);
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
INSERT INTO `target` VALUES (1,'한국항공대학교','경기도 고양시 덕양구 항공대학로 76','resources/img/main/school.jpg','경기',NULL,12323,0),(2,'경기대학교 수원캠퍼스','경기도 수원시 영통구 광교산로 154-42','resources/img/main/school3.jpg','경기',NULL,23423,0);
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
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
  `type` int(11) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `arrival` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_destination_idx` (`idx_target`),
  CONSTRAINT `fk_destination` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_destination`
--

LOCK TABLES `target_destination` WRITE;
/*!40000 ALTER TABLE `target_destination` DISABLE KEYS */;
INSERT INTO `target_destination` VALUES (7,1,1,'학생회관 앞','오후 12:00'),(8,1,2,'학생회관 앞','오후 6:00'),(9,1,3,'학생회관 앞','오후 9:45'),(10,1,1,'도서관 앞','오후 12:25'),(11,1,2,'도서관 앞','오후 6:25'),(12,1,3,'도서관 앞','오후 10:00');
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
  `type` int(11) DEFAULT NULL,
  `start` varchar(45) DEFAULT NULL,
  `end` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_ordertime_idx` (`idx_target`),
  CONSTRAINT `fk_ordertime` FOREIGN KEY (`idx_target`) REFERENCES `target` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_ordertime`
--

LOCK TABLES `target_ordertime` WRITE;
/*!40000 ALTER TABLE `target_ordertime` DISABLE KEYS */;
INSERT INTO `target_ordertime` VALUES (1,1,1,NULL,'오전 11:00',0),(2,1,2,NULL,'오후 5:00',0),(3,1,3,NULL,'오후 8:45',0);
/*!40000 ALTER TABLE `target_ordertime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-16 19:34:56
