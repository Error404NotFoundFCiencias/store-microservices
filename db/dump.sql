-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: customer-service
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Current Database: `customer-service`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `customer-service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `customer-service`;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `number_id` varchar(8) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `region_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dwk6cx0afu8bs9o4t536v1j5v` (`email`),
  UNIQUE KEY `UK_1kd255931sapbwlg2qi0mm1f3` (`number_id`),
  KEY `FKqnnfcxwwuj4cjmxitfyhvp94u` (`region_id`),
  CONSTRAINT `FKqnnfcxwwuj4cjmxitfyhvp94u` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `email`, `first_name`, `last_name`, `number_id`, `photo_url`, `state`, `region_id`) VALUES (1,'example@gmail.com','Juan','Santana','12345678','http://via.placeholder.com/150x200','CREATED',1),(3,'fofo@ciencias.unam.mx','Predo','Martinez','12345679','http://via.placeholder.com/150x200','CREATED',2);

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `name`) VALUES (1,'Noroeste'),(2,'Noreste'),(3,'Occidente'),(4,'Oriente'),(5,'Centronorte'),(6,'Centrosur'),(7,'Suroeste'),(8,'Sureste');

--
-- Current Database: `payment-service`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `payment-service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `payment-service`;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `name`) VALUES (1,'BBVA'),(2,'Banorte'),(3,'Citibanamex'),(4,'Santander'),(5,'HSBC'),(6,'Scotiabank'),(7,'Banco Azteca');

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `exp_date` datetime(6) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `bank_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_492xmgvvn7qbnwhcvpr3yor6h` (`number`),
  KEY `FK73u1abbacqsc1lcrl3ut1e2kp` (`bank_id`),
  CONSTRAINT `FK73u1abbacqsc1lcrl3ut1e2kp` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `customer_id`, `cvv`, `exp_date`, `number`, `state`, `bank_id`) VALUES (1,1,'$2a$10$2gLd9MCUdnQLT9nCxDuW6ORx39eL3jvIvjkz2CsDLk5aFtvs1oTli','2050-04-05 00:00:00.000000','1234123412341234','CREATED',1),(3,2,'$2a$10$SNMAkirtapvjfL4t6HxTC.WCtfBXLWmmmxix0PfFUlPSG6bpJfYmO','2060-04-05 00:00:00.000000','1234123412341235','CREATED',2),(4,1,'$2a$10$iEGUYOM3V2RvxjMQWXoCpe1HTKiAtyxbhhu3OMo5pk77YZA4O9f4S','2070-04-05 00:00:00.000000','1234123412341236','CREATED',3),(5,1,'$2a$10$5hZzeaQYVoGjhgdaKnjeOe9uwJoNx98kn9rQehRGyv2jSGQK8Aski','2072-04-05 00:00:00.000000','1234123412341237','CREATED',4);

--
-- Current Database: `product-service`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `product-service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `product-service`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES (1,'Skin care'),(2,'Phones');

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `create_at`, `description`, `name`, `price`, `status`, `stock`, `category_id`) VALUES (1,'2021-02-02 20:31:35.752000','Fabuloso exfoliante para la piel con aroma a limón','Gel para la piel',300,'CREATED',10,1),(2,'2021-02-02 21:22:18.136000','64MP camera, 120Hz display | SnapdragonTM 750G','Mi 10T Lite | 5G',6000,'DELETED',3,2);

--
-- Current Database: `shopping-service`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shopping-service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shopping-service`;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` date DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `number_invoice` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `card_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `create_at`, `customer_id`, `description`, `number_invoice`, `state`, `payment`, `card_id`) VALUES (1,'2021-02-03',NULL,'Factura electronica (con terminal de liverpool)','12345678','CREATED','CARD',1);

--
-- Table structure for table `invoice_item`
--

DROP TABLE IF EXISTS `invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbu6tmpd0mtgu9wrw5bj5uv09v` (`invoice_id`),
  CONSTRAINT `FKbu6tmpd0mtgu9wrw5bj5uv09v` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_item`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-04 16:13:38
