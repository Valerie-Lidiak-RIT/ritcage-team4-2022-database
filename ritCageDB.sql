-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: ritCageDB
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `borrower_contents`
--

DROP TABLE IF EXISTS `borrower_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower_contents` (
  `reservationID` int NOT NULL,
  `itemID` int NOT NULL,
  `checkin` datetime DEFAULT NULL,
  `conditionID` int DEFAULT NULL,
  PRIMARY KEY (`reservationID`,`itemID`),
  KEY `fk_borrower_contents_1_idx` (`itemID`),
  KEY `fk_borrower_contents_item_condition_idx` (`conditionID`),
  CONSTRAINT `fk_borrower_content_borrower_item` FOREIGN KEY (`reservationID`) REFERENCES `borrower_item` (`reservationID`),
  CONSTRAINT `fk_borrower_content_item_instance` FOREIGN KEY (`itemID`) REFERENCES `item_instance` (`itemID`),
  CONSTRAINT `fk_borrower_contents_item_condition` FOREIGN KEY (`conditionID`) REFERENCES `item_condition` (`conditionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_contents`
--

LOCK TABLES `borrower_contents` WRITE;
/*!40000 ALTER TABLE `borrower_contents` DISABLE KEYS */;
INSERT INTO `borrower_contents` VALUES (2,4,'2022-01-15 12:00:00',3),(2,6,NULL,NULL),(3,3,'2022-03-24 11:30:56',1),(3,5,'2022-03-24 11:46:17',1);
/*!40000 ALTER TABLE `borrower_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_item`
--

DROP TABLE IF EXISTS `borrower_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower_item` (
  `reservationID` int NOT NULL AUTO_INCREMENT,
  `universityID` varchar(9) DEFAULT NULL,
  `reservationTime` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  PRIMARY KEY (`reservationID`),
  KEY `universityID` (`universityID`),
  CONSTRAINT `borrower_item_ibfk_2` FOREIGN KEY (`universityID`) REFERENCES `user` (`universityID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_item`
--

LOCK TABLES `borrower_item` WRITE;
/*!40000 ALTER TABLE `borrower_item` DISABLE KEYS */;
INSERT INTO `borrower_item` VALUES (1,'569001234','2022-02-08 02:00:00',NULL),(2,'569002134','2022-01-08 12:00:00','2022-01-10 09:25:00'),(3,'569004321',NULL,'2022-01-20 11:10:00'),(9,'569002134',NULL,'2022-03-12 09:00:00'),(13,'569001234','2022-03-30 03:00:00',NULL);
/*!40000 ALTER TABLE `borrower_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_supply`
--

DROP TABLE IF EXISTS `class_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_supply` (
  `typeID` int DEFAULT NULL,
  `courseID` int DEFAULT NULL,
  KEY `typeID` (`typeID`),
  KEY `courseID` (`courseID`),
  CONSTRAINT `class_supply_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `item_type` (`typeID`),
  CONSTRAINT `class_supply_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_supply`
--

LOCK TABLES `class_supply` WRITE;
/*!40000 ALTER TABLE `class_supply` DISABLE KEYS */;
INSERT INTO `class_supply` VALUES (1,1),(2,1),(3,2);
/*!40000 ALTER TABLE `class_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseID` int NOT NULL AUTO_INCREMENT,
  `courseNumber` int DEFAULT NULL,
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `instructor` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,12345,'2022-01-15','2022-01-20','Bob Smith','Computer System Concepts','teaches students essential technologies needed by NSSA majors, focused on PC and mainframe hardware topics...'),(2,54321,'2022-02-01','2022-02-10','Sarah Brown','Intro to Routing and Switching','introdution to wired network infrastructures, topologies,...'),(3,13579,'2022-01-01','2022-03-10','Sarah Brown','System Administration I','give students an understanding of the role of system administrator...');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_course`
--

DROP TABLE IF EXISTS `enrolled_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled_course` (
  `universityID` varchar(45) DEFAULT NULL,
  `courseID` int DEFAULT NULL,
  KEY `universityID` (`universityID`),
  KEY `courseID` (`courseID`),
  CONSTRAINT `enrolled_course_ibfk_1` FOREIGN KEY (`universityID`) REFERENCES `user` (`universityID`),
  CONSTRAINT `enrolled_course_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_course`
--

LOCK TABLES `enrolled_course` WRITE;
/*!40000 ALTER TABLE `enrolled_course` DISABLE KEYS */;
INSERT INTO `enrolled_course` VALUES ('569001234',1),('569002134',2),('569004321',3),('569001234',2);
/*!40000 ALTER TABLE `enrolled_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemKitContent`
--

DROP TABLE IF EXISTS `itemKitContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemKitContent` (
  `typeID` int NOT NULL,
  `kitID` int NOT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`typeID`,`kitID`),
  KEY `itemKitContent_ibfk_2` (`kitID`),
  CONSTRAINT `itemKitContent_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `item_type` (`typeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `itemKitContent_ibfk_2` FOREIGN KEY (`kitID`) REFERENCES `kit_type` (`kitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemKitContent`
--

LOCK TABLES `itemKitContent` WRITE;
/*!40000 ALTER TABLE `itemKitContent` DISABLE KEYS */;
INSERT INTO `itemKitContent` VALUES (1,1,5),(1,2,4),(2,1,8),(3,2,15);
/*!40000 ALTER TABLE `itemKitContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_condition` (
  `conditionID` int NOT NULL AUTO_INCREMENT,
  `conditionStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`conditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (1,'available'),(2,'unavailable'),(3,'reserved'),(4,'damaged'),(5,'in repair'),(6,'obsolete');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_instance`
--

DROP TABLE IF EXISTS `item_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_instance` (
  `itemID` int NOT NULL,
  `typeID` int DEFAULT NULL,
  `conditionID` int DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `typeID` (`typeID`),
  KEY `conditionID` (`conditionID`),
  CONSTRAINT `item_instance_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `item_type` (`typeID`),
  CONSTRAINT `item_instance_ibfk_2` FOREIGN KEY (`conditionID`) REFERENCES `item_condition` (`conditionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_instance`
--

LOCK TABLES `item_instance` WRITE;
/*!40000 ALTER TABLE `item_instance` DISABLE KEYS */;
INSERT INTO `item_instance` VALUES (1,1,1),(2,1,2),(3,3,3),(4,2,3),(5,4,1),(6,3,2),(123456,1,1),(306090,5,2),(456789,1,5);
/*!40000 ALTER TABLE `item_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_type` (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_type`
--

LOCK TABLES `item_type` WRITE;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` VALUES (1,'iPhone 1','Apple iPhone Pro','1 year old iPhone, silver, good battery life',700),(2,'iPhone 2','Apple iPhone 13','new iPhone, silver, good battery life',900),(3,'Laptop 1','Dell Laptop','3 years old, Windows 10, slow performance',500),(4,'Laptop 2','Microsoft Surface Pro','2 years old, good battery life, good performance',900),(5,'logitech keyboard 1','logitech k110','logitech keyboard',40),(10,'test','test model','testing',300),(11,'','','',0);
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_type`
--

DROP TABLE IF EXISTS `kit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kit_type` (
  `kitID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `universityID` varchar(9) DEFAULT NULL,
  `courseID` int DEFAULT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`kitID`),
  KEY `universityID` (`universityID`),
  KEY `courseID` (`courseID`),
  CONSTRAINT `kit_type_ibfk_1` FOREIGN KEY (`universityID`) REFERENCES `user` (`universityID`),
  CONSTRAINT `kit_type_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_type`
--

LOCK TABLES `kit_type` WRITE;
/*!40000 ALTER TABLE `kit_type` DISABLE KEYS */;
INSERT INTO `kit_type` VALUES (1,'kit1','569004321',1,13),(2,'kit2','569004321',1,34),(3,'kit3','569004321',1,4),(4,'kit4','569005466',2,18),(5,'kit5','569005466',3,9),(6,'NSSA 245 Wireless kit','569005466',3,29),(12,'testKit','569004321',1,2),(16,'testKit2','569001234',1,21),(17,'NSSA241kit',NULL,2,31);
/*!40000 ALTER TABLE `kit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_contents`
--

DROP TABLE IF EXISTS `reservation_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_contents` (
  `reservationID` int NOT NULL,
  `typeID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`reservationID`,`typeID`),
  KEY `fk_reservation_contents_item_type_idx` (`typeID`),
  CONSTRAINT `fk_reservation_contents_borrower_item` FOREIGN KEY (`reservationID`) REFERENCES `borrower_item` (`reservationID`) ON DELETE CASCADE,
  CONSTRAINT `fk_reservation_contents_item_type` FOREIGN KEY (`typeID`) REFERENCES `item_type` (`typeID`),
  CONSTRAINT `reservation_contents_ibfk_1` FOREIGN KEY (`reservationID`) REFERENCES `borrower_item` (`reservationID`),
  CONSTRAINT `reservationContents_borrowerItem_fk` FOREIGN KEY (`reservationID`) REFERENCES `borrower_item` (`reservationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_contents`
--

LOCK TABLES `reservation_contents` WRITE;
/*!40000 ALTER TABLE `reservation_contents` DISABLE KEYS */;
INSERT INTO `reservation_contents` VALUES (1,1,2),(1,2,3),(2,2,1),(2,5,3);
/*!40000 ALTER TABLE `reservation_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'student'),(2,'faculty'),(3,'cage employee');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `universityID` varchar(9) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(7) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `roleID` int DEFAULT NULL,
  PRIMARY KEY (`universityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('569001234','Jazz','King','jxa4485@rit.edu','jxa4485','Jazz12345',1),('569002134','Val','Lid','tlv4046@rit.edu','tvl4046','Schoolsucks1',1),('569004321','Bob','Smith','bxm1234@rit.edu','bxm1234','Lifeiseasy1',2),('569005466','Sarah','Brown','sam1234@rit.edu','sam1234','Yolo12345',2),('569005678','Rachel','Smith','rfm7369@rit.edu','rfm7369','Abc12345',1),('569009876','Andrew','Johnson','aaj1234@rit.edu','aaj1234','Rit12345',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-02 16:39:10
