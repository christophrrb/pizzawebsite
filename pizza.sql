-- MySQL dump 10.16  Distrib 10.1.10-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: hscc_pizza
-- ------------------------------------------------------
-- Server version	10.1.10-MariaDB

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
-- Table structure for table `address_types`
--

DROP TABLE IF EXISTS `address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_types` (
  `address_type_cd` int(11) NOT NULL,
  `address_type_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`address_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_types`
--

LOCK TABLES `address_types` WRITE;
/*!40000 ALTER TABLE `address_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `address_type_cd` int(11) NOT NULL,
  `address_line_one` varchar(255) NOT NULL,
  `address_line_two` varchar(255) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `state_cd` char(2) NOT NULL DEFAULT 'GA',
  `postal_cd` varchar(32) NOT NULL,
  `active_sw` enum('Y','N') DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_types`
--

DROP TABLE IF EXISTS `credit_card_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_types` (
  `credit_card_type_cd` varchar(32) NOT NULL,
  `credit_card_type_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`credit_card_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_types`
--

LOCK TABLES `credit_card_types` WRITE;
/*!40000 ALTER TABLE `credit_card_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crust`
--

DROP TABLE IF EXISTS `crust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crust` (
  `crust_id` int(11) NOT NULL AUTO_INCREMENT,
  `crust_desc` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`crust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crust`
--

LOCK TABLES `crust` WRITE;
/*!40000 ALTER TABLE `crust` DISABLE KEYS */;
INSERT INTO `crust` VALUES (1,'Regular',0.50,'Y','2017-03-27 11:48:56'),(2,'Thin and Slim',0.50,'Y','2017-03-27 11:48:56'),(3,'Bacon-Encrusted',1.00,'Y','2017-03-27 11:48:56');
/*!40000 ALTER TABLE `crust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `pri_phone` varchar(255) DEFAULT NULL,
  `alt_phone` varchar(255) DEFAULT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_codes`
--

DROP TABLE IF EXISTS `discount_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_codes` (
  `discount_cd` varchar(32) NOT NULL,
  `discount_cd_desc` varchar(255) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valid_thru_date` date NOT NULL DEFAULT '2020-12-31',
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`discount_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_codes`
--

LOCK TABLES `discount_codes` WRITE;
/*!40000 ALTER TABLE `discount_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `pizza_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `topping_id` int(11) NOT NULL,
  `topping_price` decimal(8,2) NOT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `pizza_id` (`pizza_id`),
  KEY `size_id` (`size_id`),
  KEY `topping_id` (`topping_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`pizza_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `pizza_sizes` (`size_id`),
  CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`topping_id`) REFERENCES `toppings` (`topping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_codes`
--

DROP TABLE IF EXISTS `order_status_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status_codes` (
  `order_status_cd` int(11) NOT NULL,
  `order_status_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_status_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_codes`
--

LOCK TABLES `order_status_codes` WRITE;
/*!40000 ALTER TABLE `order_status_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_types` (
  `order_type_cd` int(11) NOT NULL,
  `order_type_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_types`
--

LOCK TABLES `order_types` WRITE;
/*!40000 ALTER TABLE `order_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL DEFAULT '0000-00-00',
  `customer_id` int(11) NOT NULL,
  `order_type_cd` int(11) NOT NULL,
  `order_status_cd` int(11) NOT NULL,
  `discount_cd` varchar(32) DEFAULT NULL,
  `remarks` text,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_type_cd` (`order_type_cd`),
  KEY `order_status_cd` (`order_status_cd`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_type_cd`) REFERENCES `order_types` (`order_type_cd`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_status_cd`) REFERENCES `order_status_codes` (`order_status_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_order_status_codes`
--

DROP TABLE IF EXISTS `p_order_status_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_order_status_codes` (
  `order_status_cd` int(11) NOT NULL,
  `order_status_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_status_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_order_status_codes`
--

LOCK TABLES `p_order_status_codes` WRITE;
/*!40000 ALTER TABLE `p_order_status_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_order_status_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_profiles`
--

DROP TABLE IF EXISTS `payment_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_profiles` (
  `payment_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `credit_card_type_cd` varchar(32) NOT NULL,
  `credit_card_number` varchar(64) NOT NULL,
  `credit_card_name` varchar(255) NOT NULL,
  `expiration_month` int(2) NOT NULL,
  `expiration_year` int(4) NOT NULL,
  `security_code` char(3) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_profile_id`),
  KEY `customer_id` (`customer_id`),
  KEY `address_id` (`address_id`),
  KEY `credit_card_type_cd` (`credit_card_type_cd`),
  CONSTRAINT `payment_profiles_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `payment_profiles_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `payment_profiles_ibfk_3` FOREIGN KEY (`credit_card_type_cd`) REFERENCES `credit_card_types` (`credit_card_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_profiles`
--

LOCK TABLES `payment_profiles` WRITE;
/*!40000 ALTER TABLE `payment_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza` (
  `pizza_id` int(11) NOT NULL AUTO_INCREMENT,
  `selected_type` varchar(255) NOT NULL,
  `selected_crust` varchar(255) NOT NULL COMMENT 'The crust that the person selectes for their pizza goes in here.',
  `pizza_desc` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pizza_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'\r\n      Regular Pepperoni ','','',0.00,'Y','2017-04-13 11:45:32'),(2,'\r\n      Meat Supreme ','Regular Cheese, Pesto Sauce, Tomato, Pepperoni, Sausage, Bacon, Bell Peppers, Onions, Pineapple','',0.00,'Y','2017-04-13 11:47:49'),(3,'\r\n      Vegetarian Delight ','Regular Cheese, Pepperoni, Sausage, Ham, Bacon, Anchovies, Olive','',0.00,'Y','2017-04-13 11:50:33'),(4,'\r\n      Vegetarian Delight ','','Regular Cheese, Pepperoni, Sausage, Ham, Bacon, Anchovies, Bell Peppers, Olive',0.00,'Y','2017-04-13 11:51:11'),(5,'\r\n      Meat Supreme ','','Regular Cheese, Pesto Sauce, Pepperoni, Ham',0.00,'Y','2017-04-13 13:41:02'),(6,'\r\n      Vegetarian Delight ','','Extra Cheese, Tomato, Anchovies, Bell Peppers, Onions',0.00,'Y','2017-04-14 18:21:46'),(7,'','','',0.00,'Y','2017-04-17 02:44:09'),(8,'','Bacon-Encrusted','Extra Cheese, Pesto Sauce, Tomato, Ham, Bacon, Bell Peppers, Olive',0.00,'Y','2017-04-17 02:49:52'),(9,'\r\n          Vegetarian Delight ','Regular','Extra Cheese, Pesto Sauce, Tomato, Pepperoni, Ham, Bacon, Bell Peppers, Olive, Pineapple',0.00,'Y','2017-04-17 02:50:24'),(10,'\r\n          Meat Supreme ','Bacon-Encrusted','Regular Cheese, Extra Cheese, Pesto Sauce, Tomato, Pepperoni, Sausage, Ham, Bacon, Anchovies, Bell Peppers, Onions, Olive, Pineapple',0.00,'Y','2017-04-20 15:02:39'),(11,'\r\n          Regular Pepperoni ','Thin and Slim','Regular Cheese, Tomato, Pepperoni, Bacon, Onions',0.00,'Y','2017-04-20 15:05:47'),(12,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Pepperoni, Ham, Bell Peppers',0.00,'Y','2017-04-22 15:11:09'),(13,'\r\n      Regular Pepperoni ','','Regular Cheese, Pesto Sauce, Sausage, Bacon, Pineapple',0.00,'Y','2017-04-22 15:14:39'),(14,'\r\n          Meat Supreme ','Thin and Slim','Extra Cheese, Pesto Sauce, Sausage, Pineapple',0.00,'Y','2017-04-22 18:02:52'),(15,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 19:01:08'),(16,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 19:03:49'),(17,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 19:07:40'),(18,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 19:10:50'),(19,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 19:11:29'),(20,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 19:13:47'),(21,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:17:34'),(22,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:18:22'),(23,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:18:45'),(24,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:21:10'),(25,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:22:03'),(26,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:22:21'),(27,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:26:25'),(28,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:26:56'),(29,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:27:05'),(30,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:27:27'),(31,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:31:57'),(32,'\r\n          Meat Supreme ','Regular','Extra Cheese, Pesto Sauce, Bacon, Pineapple',0.00,'Y','2017-04-23 22:34:10'),(33,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:34:42'),(34,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:36:43'),(35,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:36:57'),(36,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:41:16'),(37,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:41:34'),(38,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:42:57'),(39,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:46:46'),(40,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:54:13'),(41,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:54:52'),(42,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:55:14'),(43,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:56:04'),(44,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:56:57'),(45,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:58:00'),(46,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:58:34'),(47,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:58:50'),(48,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 22:58:55'),(49,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 23:55:24'),(50,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 23:55:44'),(51,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 23:57:11'),(52,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 23:57:24'),(53,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-23 23:59:50'),(54,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:02:02'),(55,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:07:06'),(56,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:08:25'),(57,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:32:43'),(58,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:44:10'),(59,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:50:24'),(60,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:53:44'),(61,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:58:19'),(62,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:59:16'),(63,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 00:59:50'),(64,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 01:01:59'),(65,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 01:12:13'),(66,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 01:12:41'),(67,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 01:31:10'),(68,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-24 01:34:52'),(69,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 14:20:13'),(70,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 14:22:11'),(71,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 14:23:35'),(72,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 14:23:47'),(73,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 14:24:08'),(74,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 14:26:39'),(75,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 15:34:59'),(76,'\r\n          Regular Pepperoni ','Bacon-Encrusted','Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple',0.00,'Y','2017-04-29 15:35:32');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_sizes`
--

DROP TABLE IF EXISTS `pizza_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_sizes` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_sizes`
--

LOCK TABLES `pizza_sizes` WRITE;
/*!40000 ALTER TABLE `pizza_sizes` DISABLE KEYS */;
INSERT INTO `pizza_sizes` VALUES (1,'Small','Y','2017-03-27 11:43:36'),(2,'Medium','Y','2017-03-27 11:43:36'),(3,'Big','Y','2017-03-27 11:43:36');
/*!40000 ALTER TABLE `pizza_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_type`
--

DROP TABLE IF EXISTS `pizza_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_type` (
  `pizza_id` int(11) NOT NULL AUTO_INCREMENT,
  `pizza_desc` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pizza_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_type`
--

LOCK TABLES `pizza_type` WRITE;
/*!40000 ALTER TABLE `pizza_type` DISABLE KEYS */;
INSERT INTO `pizza_type` VALUES (1,'Regular Pepperoni',5.00,'Y','2017-03-27 11:48:55'),(2,'Meat Supreme',6.00,'Y','2017-03-27 11:48:55'),(3,'Vegetarian Delight',5.50,'Y','2017-03-27 11:48:55');
/*!40000 ALTER TABLE `pizza_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping_categories`
--

DROP TABLE IF EXISTS `topping_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topping_categories` (
  `topping_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `topping_category_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topping_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping_categories`
--

LOCK TABLES `topping_categories` WRITE;
/*!40000 ALTER TABLE `topping_categories` DISABLE KEYS */;
INSERT INTO `topping_categories` VALUES (1,'Cheese','Y','2017-03-25 15:45:26'),(2,'Sauces','Y','2017-03-25 15:45:26'),(3,'Meat','Y','2017-03-25 15:45:26'),(4,'Fruits and Veggies','Y','2017-03-25 15:45:26');
/*!40000 ALTER TABLE `topping_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toppings` (
  `topping_id` int(11) NOT NULL AUTO_INCREMENT,
  `topping_category_id` int(11) NOT NULL,
  `topping_desc` varchar(255) NOT NULL,
  `topping_price` decimal(8,2) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topping_id`),
  KEY `topping_category_id` (`topping_category_id`),
  CONSTRAINT `toppings_ibfk_1` FOREIGN KEY (`topping_category_id`) REFERENCES `topping_categories` (`topping_category_id`),
  CONSTRAINT `toppings_ibfk_2` FOREIGN KEY (`topping_category_id`) REFERENCES `topping_categories` (`topping_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` VALUES (1,1,'Regular Cheese',0.50,'Y','2017-03-25 17:25:30'),(2,1,'Extra Cheese',1.00,'Y','2017-03-25 17:25:30'),(3,2,'Pesto Sauce',0.00,'Y','2017-03-25 17:25:30'),(5,2,'Tomato',0.00,'Y','2017-03-25 17:25:30'),(6,3,'Pepperoni',1.00,'Y','2017-03-25 17:25:30'),(7,3,'Sausage',0.80,'Y','2017-03-25 17:25:30'),(8,3,'Ham',1.50,'Y','2017-03-25 17:25:30'),(9,3,'Bacon',1.30,'Y','2017-03-25 17:25:30'),(10,3,'Anchovies',2.00,'Y','2017-03-25 17:25:30'),(11,4,'Bell Peppers',0.30,'Y','2017-03-25 17:25:30'),(12,4,'Onions',0.10,'Y','2017-03-25 17:25:30'),(13,4,'Olive',0.55,'Y','2017-03-25 17:25:30'),(14,4,'Pineapple',1.00,'Y','2017-03-25 17:25:30');
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-29 11:39:07
