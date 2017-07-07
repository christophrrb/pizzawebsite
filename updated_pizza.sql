-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2017 at 01:26 AM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hscc_pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `customer_id`, `address_type_cd`, `address_line_one`, `address_line_two`, `city_name`, `state_cd`, `postal_cd`, `active_sw`, `lastmod`) VALUES
(1, 2, 0, '98765 OIOUYf', '', 'IUh', 'GA', '34567', 'Y', '2017-07-07 22:00:23'),
(2, 3, 0, '0987 Sqkwd', '', 'Jn', 'GA', '98765', 'Y', '2017-07-07 22:20:25'),
(3, 4, 0, '987t DTfgbuni', '', 'ikuhjgv', 'GA', '9876', 'Y', '2017-07-07 22:58:58'),
(4, 5, 0, '9876 HVh', '', 'GHFCV', 'GA', '12345', 'Y', '2017-07-07 23:14:54'),
(5, 6, 0, '123 Ghjb', '', 'LKjhj', 'GA', '30038', 'Y', '2017-07-07 23:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `address_types`
--

CREATE TABLE IF NOT EXISTS `address_types` (
  `address_type_cd` int(11) NOT NULL,
  `address_type_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`address_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_card_types`
--

CREATE TABLE IF NOT EXISTS `credit_card_types` (
  `credit_card_type_cd` varchar(32) NOT NULL,
  `credit_card_type_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`credit_card_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crust`
--

CREATE TABLE IF NOT EXISTS `crust` (
  `crust_id` int(11) NOT NULL AUTO_INCREMENT,
  `crust_desc` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`crust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crust`
--

INSERT INTO `crust` (`crust_id`, `crust_desc`, `price`, `active_sw`, `lastmod`) VALUES
(1, 'Regular', '0.50', 'Y', '2017-03-27 11:48:56'),
(2, 'Thin and Slim', '0.50', 'Y', '2017-03-27 11:48:56'),
(3, 'Bacon-Encrusted', '1.00', 'Y', '2017-03-27 11:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `pri_phone` varchar(255) DEFAULT NULL,
  `alt_phone` varchar(255) DEFAULT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uniqid` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_id`, `pri_phone`, `alt_phone`, `lastmod`, `uniqid`) VALUES
(2, 'Wes', 'Sup', 'at@gmail.com', '1234567890', '1234567890', '2017-07-07 22:00:23', '596004210754e'),
(3, 'Woot', 'Woot', 'woot@gmail.com', '987654345', '1234567890', '2017-07-07 22:20:25', '59600907763c6'),
(4, 'Everything', 'Shouldwork', 'djfvjm@fmkmf.com', '98765432', '1234567890', '2017-07-07 22:58:58', '59601211b458c'),
(5, 'Name', 'Apellido', 'kjhbv@gms.com', '1234567890', '1234567890', '2017-07-07 23:14:54', '596015ce38ee6'),
(6, 'Nam', 'Nam', 'jkhg@gmail.com', '1234567890', '1234567890', '2017-07-07 23:18:48', '596016c08809e');

-- --------------------------------------------------------

--
-- Table structure for table `discount_codes`
--

CREATE TABLE IF NOT EXISTS `discount_codes` (
  `discount_cd` varchar(32) NOT NULL,
  `discount_cd_desc` varchar(255) NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valid_thru_date` date NOT NULL DEFAULT '2020-12-31',
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`discount_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL DEFAULT '0000-00-00',
  `customer_id` int(11) NOT NULL,
  `order_type_cd` int(11) NOT NULL,
  `order_status_cd` enum('Pending','Out for Delivery','Delivered','Canceled') NOT NULL DEFAULT 'Pending',
  `carry_out` enum('Y','N') NOT NULL,
  `price` float DEFAULT NULL,
  `discount_cd` varchar(32) DEFAULT NULL,
  `remarks` text,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_type_cd` (`order_type_cd`),
  KEY `order_status_cd` (`order_status_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `customer_id`, `order_type_cd`, `order_status_cd`, `carry_out`, `price`, `discount_cd`, `remarks`, `lastmod`) VALUES
(6, '0000-00-00', 4, 0, 'Pending', 'Y', NULL, NULL, NULL, '2017-07-07 23:13:52'),
(7, '0000-00-00', 5, 0, 'Pending', 'Y', NULL, NULL, NULL, '2017-07-07 23:16:07'),
(8, '0000-00-00', 6, 0, 'Pending', 'Y', 3.3, NULL, NULL, '2017-07-07 23:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
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
  KEY `topping_id` (`topping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_codes`
--

CREATE TABLE IF NOT EXISTS `order_status_codes` (
  `order_status_cd` int(11) NOT NULL,
  `order_status_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_status_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

CREATE TABLE IF NOT EXISTS `order_types` (
  `order_type_cd` int(11) NOT NULL,
  `order_type_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_profiles`
--

CREATE TABLE IF NOT EXISTS `payment_profiles` (
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
  KEY `credit_card_type_cd` (`credit_card_type_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE IF NOT EXISTS `pizza` (
  `pizza_id` int(11) NOT NULL AUTO_INCREMENT,
  `selected_type` varchar(255) NOT NULL,
  `selected_crust` varchar(255) NOT NULL COMMENT 'The crust that the person selectes for their pizza goes in here.',
  `pizza_desc` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL,
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pizza_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizza_id`, `selected_type`, `selected_crust`, `pizza_desc`, `price`, `active_sw`, `lastmod`, `order_id`) VALUES
(1, '\r\n      Regular Pepperoni ', '', '', '0.00', 'Y', '2017-04-13 11:45:32', NULL),
(2, '\r\n      Meat Supreme ', 'Regular Cheese, Pesto Sauce, Tomato, Pepperoni, Sausage, Bacon, Bell Peppers, Onions, Pineapple', '', '0.00', 'Y', '2017-04-13 11:47:49', NULL),
(3, '\r\n      Vegetarian Delight ', 'Regular Cheese, Pepperoni, Sausage, Ham, Bacon, Anchovies, Olive', '', '0.00', 'Y', '2017-04-13 11:50:33', NULL),
(4, '\r\n      Vegetarian Delight ', '', 'Regular Cheese, Pepperoni, Sausage, Ham, Bacon, Anchovies, Bell Peppers, Olive', '0.00', 'Y', '2017-04-13 11:51:11', NULL),
(5, '\r\n      Meat Supreme ', '', 'Regular Cheese, Pesto Sauce, Pepperoni, Ham', '0.00', 'Y', '2017-04-13 13:41:02', NULL),
(6, '\r\n      Vegetarian Delight ', '', 'Extra Cheese, Tomato, Anchovies, Bell Peppers, Onions', '0.00', 'Y', '2017-04-14 18:21:46', NULL),
(7, '', '', '', '0.00', 'Y', '2017-04-17 02:44:09', NULL),
(8, '', 'Bacon-Encrusted', 'Extra Cheese, Pesto Sauce, Tomato, Ham, Bacon, Bell Peppers, Olive', '0.00', 'Y', '2017-04-17 02:49:52', NULL),
(9, '\r\n          Vegetarian Delight ', 'Regular', 'Extra Cheese, Pesto Sauce, Tomato, Pepperoni, Ham, Bacon, Bell Peppers, Olive, Pineapple', '0.00', 'Y', '2017-04-17 02:50:24', NULL),
(10, '\r\n          Meat Supreme ', 'Bacon-Encrusted', 'Regular Cheese, Extra Cheese, Pesto Sauce, Tomato, Pepperoni, Sausage, Ham, Bacon, Anchovies, Bell Peppers, Onions, Olive, Pineapple', '0.00', 'Y', '2017-04-20 15:02:39', NULL),
(11, '\r\n          Regular Pepperoni ', 'Thin and Slim', 'Regular Cheese, Tomato, Pepperoni, Bacon, Onions', '0.00', 'Y', '2017-04-20 15:05:47', NULL),
(12, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Pepperoni, Ham, Bell Peppers', '0.00', 'Y', '2017-04-22 15:11:09', NULL),
(13, '\r\n      Regular Pepperoni ', '', 'Regular Cheese, Pesto Sauce, Sausage, Bacon, Pineapple', '0.00', 'Y', '2017-04-22 15:14:39', NULL),
(14, '\r\n          Meat Supreme ', 'Thin and Slim', 'Extra Cheese, Pesto Sauce, Sausage, Pineapple', '0.00', 'Y', '2017-04-22 18:02:52', NULL),
(15, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 19:01:08', NULL),
(16, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 19:03:49', NULL),
(17, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 19:07:40', NULL),
(18, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 19:10:50', NULL),
(19, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 19:11:29', NULL),
(20, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 19:13:47', NULL),
(21, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:17:34', NULL),
(22, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:18:22', NULL),
(23, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:18:45', NULL),
(24, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:21:10', NULL),
(25, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:22:03', NULL),
(26, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:22:21', NULL),
(27, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:26:25', NULL),
(28, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:26:56', NULL),
(29, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:27:05', NULL),
(30, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:27:27', NULL),
(31, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:31:57', NULL),
(32, '\r\n          Meat Supreme ', 'Regular', 'Extra Cheese, Pesto Sauce, Bacon, Pineapple', '0.00', 'Y', '2017-04-23 22:34:10', NULL),
(33, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:34:42', NULL),
(34, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:36:43', NULL),
(35, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:36:57', NULL),
(36, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:41:16', NULL),
(37, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:41:34', NULL),
(38, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:42:57', NULL),
(39, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:46:46', NULL),
(40, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:54:13', NULL),
(41, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:54:52', NULL),
(42, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:55:14', NULL),
(43, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:56:04', NULL),
(44, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:56:57', NULL),
(45, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:58:00', NULL),
(46, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:58:34', NULL),
(47, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:58:50', NULL),
(48, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 22:58:55', NULL),
(49, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 23:55:24', NULL),
(50, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 23:55:44', NULL),
(51, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 23:57:11', NULL),
(52, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 23:57:24', NULL),
(53, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-23 23:59:50', NULL),
(54, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:02:02', NULL),
(55, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:07:06', NULL),
(56, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:08:25', NULL),
(57, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:32:43', NULL),
(58, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:44:10', NULL),
(59, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:50:24', NULL),
(60, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:53:44', NULL),
(61, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:58:19', NULL),
(62, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:59:16', NULL),
(63, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 00:59:50', NULL),
(64, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 01:01:59', NULL),
(65, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 01:12:13', NULL),
(66, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 01:12:41', NULL),
(67, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 01:31:10', NULL),
(68, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-24 01:34:52', NULL),
(69, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 14:20:13', NULL),
(70, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 14:22:11', NULL),
(71, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 14:23:35', NULL),
(72, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 14:23:47', NULL),
(73, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 14:24:08', NULL),
(74, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 14:26:39', NULL),
(75, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 15:34:59', NULL),
(76, '\r\n          Regular Pepperoni ', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage, Ham, Anchovies, Pineapple', '0.00', 'Y', '2017-04-29 15:35:32', NULL),
(84, 'Meat Supreme', 'Regular', 'Regular Cheese, Pesto Sauce, Olive', '1.55', 'Y', '2017-07-07 23:15:18', 7),
(85, 'Regular Pepperoni', 'Thin and Slim', 'Regular Cheese, Pepperoni, Onions', '2.10', 'Y', '2017-07-07 23:15:18', 7),
(86, 'Regular Pepperoni', 'Thin and Slim', 'Regular Cheese', '1.00', 'Y', '2017-07-07 23:19:05', 8),
(87, 'Meat Supreme', 'Bacon-Encrusted', 'Regular Cheese, Pesto Sauce, Sausage', '2.30', 'Y', '2017-07-07 23:19:05', 8);

-- --------------------------------------------------------

--
-- Table structure for table `pizza_sizes`
--

CREATE TABLE IF NOT EXISTS `pizza_sizes` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizza_sizes`
--

INSERT INTO `pizza_sizes` (`size_id`, `size_desc`, `active_sw`, `lastmod`) VALUES
(1, 'Small', 'Y', '2017-03-27 11:43:36'),
(2, 'Medium', 'Y', '2017-03-27 11:43:36'),
(3, 'Big', 'Y', '2017-03-27 11:43:36');

-- --------------------------------------------------------

--
-- Table structure for table `pizza_type`
--

CREATE TABLE IF NOT EXISTS `pizza_type` (
  `pizza_id` int(11) NOT NULL AUTO_INCREMENT,
  `pizza_desc` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pizza_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizza_type`
--

INSERT INTO `pizza_type` (`pizza_id`, `pizza_desc`, `price`, `active_sw`, `lastmod`) VALUES
(1, 'Regular Pepperoni', '5.00', 'Y', '2017-03-27 11:48:55'),
(2, 'Meat Supreme', '6.00', 'Y', '2017-03-27 11:48:55'),
(3, 'Vegetarian Delight', '5.50', 'Y', '2017-03-27 11:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `p_order_status_codes`
--

CREATE TABLE IF NOT EXISTS `p_order_status_codes` (
  `order_status_cd` int(11) NOT NULL,
  `order_status_cd_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_status_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toppings`
--

CREATE TABLE IF NOT EXISTS `toppings` (
  `topping_id` int(11) NOT NULL AUTO_INCREMENT,
  `topping_category_id` int(11) NOT NULL,
  `topping_desc` varchar(255) NOT NULL,
  `topping_price` decimal(8,2) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topping_id`),
  KEY `topping_category_id` (`topping_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toppings`
--

INSERT INTO `toppings` (`topping_id`, `topping_category_id`, `topping_desc`, `topping_price`, `active_sw`, `lastmod`) VALUES
(1, 1, 'Regular Cheese', '0.50', 'Y', '2017-03-25 17:25:30'),
(2, 1, 'Extra Cheese', '1.00', 'Y', '2017-03-25 17:25:30'),
(3, 2, 'Pesto Sauce', '0.00', 'Y', '2017-03-25 17:25:30'),
(5, 2, 'Tomato', '0.00', 'Y', '2017-03-25 17:25:30'),
(6, 3, 'Pepperoni', '1.00', 'Y', '2017-03-25 17:25:30'),
(7, 3, 'Sausage', '0.80', 'Y', '2017-03-25 17:25:30'),
(8, 3, 'Ham', '1.50', 'Y', '2017-03-25 17:25:30'),
(9, 3, 'Bacon', '1.30', 'Y', '2017-03-25 17:25:30'),
(10, 3, 'Anchovies', '2.00', 'Y', '2017-03-25 17:25:30'),
(11, 4, 'Bell Peppers', '0.30', 'Y', '2017-03-25 17:25:30'),
(12, 4, 'Onions', '0.10', 'Y', '2017-03-25 17:25:30'),
(13, 4, 'Olive', '0.55', 'Y', '2017-03-25 17:25:30'),
(14, 4, 'Pineapple', '1.00', 'Y', '2017-03-25 17:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `topping_categories`
--

CREATE TABLE IF NOT EXISTS `topping_categories` (
  `topping_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `topping_category_desc` varchar(255) NOT NULL,
  `active_sw` enum('Y','N') NOT NULL DEFAULT 'Y',
  `lastmod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topping_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topping_categories`
--

INSERT INTO `topping_categories` (`topping_category_id`, `topping_category_desc`, `active_sw`, `lastmod`) VALUES
(1, 'Cheese', 'Y', '2017-03-25 15:45:26'),
(2, 'Sauces', 'Y', '2017-03-25 15:45:26'),
(3, 'Meat', 'Y', '2017-03-25 15:45:26'),
(4, 'Fruits and Veggies', 'Y', '2017-03-25 15:45:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`pizza_id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `pizza_sizes` (`size_id`),
  ADD CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`topping_id`) REFERENCES `toppings` (`topping_id`);

--
-- Constraints for table `payment_profiles`
--
ALTER TABLE `payment_profiles`
  ADD CONSTRAINT `payment_profiles_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `payment_profiles_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  ADD CONSTRAINT `payment_profiles_ibfk_3` FOREIGN KEY (`credit_card_type_cd`) REFERENCES `credit_card_types` (`credit_card_type_cd`);

--
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `toppings`
--
ALTER TABLE `toppings`
  ADD CONSTRAINT `toppings_ibfk_1` FOREIGN KEY (`topping_category_id`) REFERENCES `topping_categories` (`topping_category_id`),
  ADD CONSTRAINT `toppings_ibfk_2` FOREIGN KEY (`topping_category_id`) REFERENCES `topping_categories` (`topping_category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
