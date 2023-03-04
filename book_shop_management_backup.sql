-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: book
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill_hist`
--

DROP TABLE IF EXISTS `bill_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_hist` (
  `bill_id` tinyint NOT NULL AUTO_INCREMENT,
  `purchaser_name` varchar(45) DEFAULT NULL,
  `contact_no` bigint DEFAULT NULL,
  `b_book_id` tinyint DEFAULT NULL,
  `b_qnty` bigint DEFAULT NULL,
  `price_pp` float DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `payment_status` varchar(45) DEFAULT 'not paid',
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `idbill_hist_UNIQUE` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_hist`
--

LOCK TABLES `bill_hist` WRITE;
/*!40000 ALTER TABLE `bill_hist` DISABLE KEYS */;
INSERT INTO `bill_hist` VALUES (1,'om tiwari',8965231234,4,1,7.75,'2021-02-05',7.75,'paid'),(2,'rajesh dewangan',8965231256,14,1,1,'2021-02-05',1,'paid'),(3,'unknown dewangan',8956231256,11,1,1,'2021-02-05',1,'paid'),(4,'ok dewangan',8965231265,14,4,1,'2021-02-05',4,'paid'),(5,'last dewangan',5698231256,9,1,1500,'2021-02-05',1500,'paid'),(6,'anyone human',4564564567,12,1,14,'2021-02-06',14,'paid'),(7,'try try',9879879876,5,1,25,'2021-02-07',25,'paid'),(8,'maybe me',7657657654,3,3,29,'2021-02-07',87,'paid'),(9,'maybe',7657657654,3,3,29,'2021-02-07',87,'paid'),(10,'again try',9879872323,7,8,78,'2021-02-07',624,'paid'),(11,'again try',9879872323,7,8,78,'2021-02-07',624,'paid'),(12,'meto',9850980536,8,1,13.4,'2021-02-08',13.4,'paid'),(13,'kindness',7470825671,16,4000,0,'2021-02-08',0,'paid'),(14,'vipul',5679870923,7,5,78,'2021-02-09',390,'paid'),(15,'nipa',9879345234,10,5,12,'2021-02-09',60,'paid'),(16,'vishu',7470825671,3,1,29,'2021-02-09',29,'paid'),(17,'harshit',9694659346,9,56,1500,'2021-02-09',84000,'paid'),(18,'harshit',9768413412,4,6,7.75,'2021-02-09',46.5,'paid'),(19,'tarak mehta',1765280747,17,99,23.985,'2021-02-09',2374.52,'paid'),(20,'tarak mehta',1765280747,10,76,12,'2021-02-09',912,'paid'),(21,'tarak mehta',1765280747,12,8,14,'2021-02-09',112,'paid'),(22,'tarak mehta',1765280747,8,5,13.4,'2021-02-09',67,'paid'),(23,'doraemon',9747358028,7,5,78,'2021-02-09',390,'paid'),(24,'sundar',8763456783,14,3,1,'2021-02-10',3,'paid'),(25,'astha',8305234746,5,7,25,'2021-02-10',175,'paid'),(26,'narendra modi',7659873452,9,1,1500,'2021-02-10',1500,'paid'),(27,'rahul gandhi',8768766785,8,1,13.4,'2021-02-10',13.4,'paid'),(28,'notdefined ambani',7470824673,6,86,10,'2021-02-11',860,'paid');
/*!40000 ALTER TABLE `bill_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_detail`
--

DROP TABLE IF EXISTS `book_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_detail` (
  `book_id` tinyint NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `isbn` bigint DEFAULT NULL,
  `year_pub` smallint DEFAULT NULL,
  `price_usd` float DEFAULT NULL,
  `qnty` bigint DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `id_UNIQUE` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_detail`
--

LOCK TABLES `book_detail` WRITE;
/*!40000 ALTER TABLE `book_detail` DISABLE KEYS */;
INSERT INTO `book_detail` VALUES (1,'Northanger Abbey','Austen',1648642541,1814,18.2,3012,'novel'),(2,'War and Peace','Tolstoy',8282113122,1865,12.7,3014,'novel'),(3,'A Room of One\'s Own','Woolf',1534747323,1922,29,3010,'essay'),(4,'Tom Sawye','Mark',7535556464,1922,7.75,3055,'novel'),(5,'Mrs. Dalloway','Woolf',1508160575,1999,25,3003,'novel'),(6,'unknown','unknowns',8765425786,2000,10,3458,'novel'),(7,'unfortunately ','i am',3558976547,2020,78,3012,'mythology'),(8,'the stories','mythology',1234567898,2004,13.4,3040,'mythology'),(9,'titte','auau',2586749035,2012,1500,3025,'essay'),(10,'auau','titte',7789599753,2005,12,2942,'essay'),(11,'title','author',2365709126,2012,1,3010,'mythology'),(12,'ifa','award',5762560981,1111,14,3067,'novel'),(13,'ok! its me','me me ne',6788763457,1999,23,3040,'educational'),(14,'sunderben deltA','takla',5676879064,1992,1,3023,'medical'),(15,'harry potter stories','author',5645674129,1867,32.87,3038,'story'),(16,'eco develpoment','good humans',9898675625,2021,0,3000,'educational'),(17,'tmkoc','asit modi',7470825671,2001,23.985,3900,'comedy');
/*!40000 ALTER TABLE `book_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'book'
--

--
-- Dumping routines for database 'book'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 21:53:05
