CREATE DATABASE  IF NOT EXISTS `library_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library_management_system`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: library_management_system
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `book_borrowing`
--

DROP TABLE IF EXISTS `book_borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_borrowing` (
  `borrowing_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `member_id` int NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_borrowing`
--

LOCK TABLES `book_borrowing` WRITE;
/*!40000 ALTER TABLE `book_borrowing` DISABLE KEYS */;
INSERT INTO `book_borrowing` VALUES (1,1,1,'2023-10-11','2023-11-11','2023-10-15'),(2,2,2,'2023-10-11','2023-10-19',NULL),(3,3,3,'2023-11-01','2023-11-11',NULL),(4,4,4,'2023-10-20','2023-11-10',NULL),(5,5,5,'2023-10-15','2023-11-05',NULL),(6,6,6,'2023-10-25','2023-11-07',NULL),(7,7,7,'2023-10-03','2023-10-13',NULL),(8,8,8,'2023-10-17','2023-10-27',NULL),(9,9,9,'2023-10-22','2023-11-02',NULL),(10,10,10,'2023-10-21','2023-11-11',NULL);
/*!40000 ALTER TABLE `book_borrowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publication_year` int DEFAULT NULL,
  `ISBN` varchar(13) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby','F. Scott Fitzgerald',1925,'ISBN123456789'),(2,'catch-22','Joseph Heller',1961,'ISBN987654321'),(3,'ulysses','James joyce',1922,'ISBN498371068'),(4,'Anna Karenina','Leo Tolstoy',1878,'ISBN753159842'),(5,'To Kill a Mockingbird','Harper Lee',1960,'ISBN492710328'),(6,'The God Delusion','Richard Dawkins',2006,'ISBN532219523'),(7,'The Silence of the Girls','Pat Barker',2018,'ISBN507693549'),(8,'Moneyball','Michael Lewis',2010,'ISBN295815607'),(9,'The Corrections','Jonathan Franzen',2001,'ISBN295492378'),(10,'Night Watch','Terry Pratchett',2002,'ISBN157351573');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Doe','johndoe@yahoo.com','2023-10-11'),(3,'Sam','Dove','Samdove@gmail.com','2023-09-11'),(4,'may','cross','maycross@hotmail.com','2023-09-19'),(5,'bayle','lawson','bayle987@gmail.com','2023-10-01'),(6,'will','Smith','willsmith@hotmail.com','2023-10-05'),(7,'Alex','rogan','Aogan@gmail.com','2023-10-07'),(8,'meridith','grey','grey@gmail.com','2023-08-05'),(9,'Avery','John','johnA@gmail.com','2023-05-27'),(10,'Kai','shelby','shelby@gmail.com','2023-03-28');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11 18:33:31
