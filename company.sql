-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DNO` int NOT NULL,
  `Dname` varchar(30) DEFAULT NULL,
  `MgrSSN` int DEFAULT NULL,
  `MgrStartDate` date DEFAULT NULL,
  PRIMARY KEY (`DNO`),
  KEY `MgrSSN` (`MgrSSN`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MgrSSN`) REFERENCES `employee` (`ssn`),
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`MgrSSN`) REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Research',1000001,'2022-09-12'),(2,'Administration',1000003,'2022-07-15'),(3,'Headquater',1000010,'2021-10-12');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlocation`
--

DROP TABLE IF EXISTS `dlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dlocation` (
  `DNO` int NOT NULL,
  `DLOC` varchar(100) NOT NULL,
  PRIMARY KEY (`DNO`,`DLOC`),
  CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`),
  CONSTRAINT `dlocation_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlocation`
--

LOCK TABLES `dlocation` WRITE;
/*!40000 ALTER TABLE `dlocation` DISABLE KEYS */;
INSERT INTO `dlocation` VALUES (1,'Bangalore'),(1,'Hyderabad'),(2,'Delhi'),(2,'Mumbai'),(3,'Delhi'),(3,'Gurgaon');
/*!40000 ALTER TABLE `dlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ssn` int NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `superSSN` int DEFAULT NULL,
  `DNO` int DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `superSSN` (`superSSN`),
  KEY `DNO` (`DNO`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`superSSN`) REFERENCES `employee` (`ssn`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1000000,'Elda','Fritsch','1369 Hailee Knoll\nNorth Krystelland, SC 26068-8930','F',5641,1000005,3),(1000001,'Amir','Runolfsson','95787 Cassin Springs\nNew Esperanza, MI 13480-1651','F',8686,1000005,3),(1000002,'Durward','Champlin','3550 Lenna Street Apt. 940\nWest Halie, TN 51286-5814','F',8866,1000005,3),(1000003,'Natalie','Parisian','95480 Langworth Underpass\nWest Bettyebury, AK 37474-8200','M',8926,1000014,1),(1000004,'Sammie','Thiel','135 Sheldon Ranch Suite 155\nNorth Juniorburgh, NC 09844','F',8468,1000005,3),(1000005,'Jaleel','Larkin','327 Bins Wells Suite 597\nPfefferchester, KS 31228','F',7998,1000005,2),(1000006,'Rosina','Hayes','805 Billy Landing Suite 824\nEast Lutherfort, NC 63173-4310','M',8101,1000014,2),(1000007,'Aniyah','Bednar','50543 Clementina Lodge Suite 310\nHettingerburgh, MN 65406-1371','M',5775,1000014,2),(1000009,'Lilyan','Pollich','4422 Jenkins Alley\nPriscillaberg, CO 07989','M',8229,1000014,2),(1000010,'Marina','Stracke','7027 Hoppe Rue Suite 629\nSchneiderhaven, KS 88356','F',5293,1000005,2),(1000011,'Delbert','Cassin','445 Elyse Shores Suite 907\nSouth Tomaston, VA 75377-2397','F',8026,1000005,2),(1000012,'Danial','Stehr','5635 Prohaska Hollow Suite 445\nNorth Devon, DC 00364','F',8381,1000005,2),(1000013,'Vivianne','Schowalter','173 Madilyn Light Suite 660\nNicolestad, MD 09462-9791','F',9242,1000005,2),(1000014,'Breanne','Donnelly','6423 Schaefer Alley Apt. 103\nPort Ludwigmouth, MT 78861','F',5057,1000005,2),(1000015,'Seamus','Turner','366 April Track Apt. 980\nSouth Marc, TN 03425-8636','M',6499,1000014,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `PNO` int NOT NULL,
  `PName` varchar(100) DEFAULT NULL,
  `PLocation` varchar(100) DEFAULT NULL,
  `DNO` int DEFAULT NULL,
  PRIMARY KEY (`PNO`),
  KEY `DNO` (`DNO`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (101,'Behaviour of machine','Bangalore',1),(102,'Documentation','Mumbai',2),(103,'Use of AI in robotics','Hydrabad',1),(104,'Computerization','stanford',1),(105,'Reorganisation','Bellaire',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `SSN` int NOT NULL,
  `PNO` int NOT NULL,
  `hours` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SSN`,`PNO`),
  KEY `PNO` (`PNO`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`ssn`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `project` (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (1000000,103,'23.2'),(1000002,104,'24.2'),(1000009,101,'34.6'),(1000010,103,'36.2'),(1000010,105,'26.2'),(1000011,102,'30.2'),(1000014,105,'26.2'),(1000015,102,'39.2');
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 13:37:38
