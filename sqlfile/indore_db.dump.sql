-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: indore
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int DEFAULT NULL,
  `name` varchar(22) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `cat` varchar(22) DEFAULT NULL,
  `cmp` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `pan` varchar(10) DEFAULT NULL,
  `account` varchar(16) DEFAULT NULL,
  `pwd` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('rahul dangi','rahuldangi@gmail.com','8962301602','2222-03-03','GJGPD11FS1','5236894541','123456');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienttradedata`
--

DROP TABLE IF EXISTS `clienttradedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienttradedata` (
  `id` int DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `stockname` varchar(20) DEFAULT NULL,
  `buyprice` int DEFAULT NULL,
  `buyquantity` int DEFAULT NULL,
  `sellprice` int DEFAULT NULL,
  `sellquantity` int DEFAULT NULL,
  `profit` int DEFAULT NULL,
  `loss` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienttradedata`
--

LOCK TABLES `clienttradedata` WRITE;
/*!40000 ALTER TABLE `clienttradedata` DISABLE KEYS */;
INSERT INTO `clienttradedata` VALUES (101,'rahuldangi@gmail.com','2022-04-03','teasu',234,5,235,5,200,0);
/*!40000 ALTER TABLE `clienttradedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int DEFAULT NULL,
  `name` varchar(22) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `cat` varchar(22) DEFAULT NULL,
  `cmp` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (102,'m15',12999,'mobile','sumsung');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradedata`
--

DROP TABLE IF EXISTS `tradedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradedata` (
  `id` int DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `stockname` varchar(20) DEFAULT NULL,
  `buyprice` int DEFAULT NULL,
  `buyquantity` int DEFAULT NULL,
  `sellprice` int DEFAULT NULL,
  `sellquantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradedata`
--

LOCK TABLES `tradedata` WRITE;
/*!40000 ALTER TABLE `tradedata` DISABLE KEYS */;
INSERT INTO `tradedata` VALUES (101,'23/03/2022','natural',238,3,240,3),(102,'24/03/2022','gold-mega',52000,1,52012,1);
/*!40000 ALTER TABLE `tradedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw`
--

DROP TABLE IF EXISTS `withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw` (
  `refrence_id` varchar(20) DEFAULT NULL,
  `m_pin` varchar(6) DEFAULT NULL,
  `account_no` varchar(20) DEFAULT NULL,
  `account_holder_name` varchar(20) DEFAULT NULL,
  `upi_id` varchar(20) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw`
--

LOCK TABLES `withdraw` WRITE;
/*!40000 ALTER TABLE `withdraw` DISABLE KEYS */;
INSERT INTO `withdraw` VALUES ('refrence test 102','4321','12344321','abhishek','87654321@paytm','10000'),(NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `withdraw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08 12:15:07
