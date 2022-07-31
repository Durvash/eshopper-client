-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 31, 2022 at 10:35 AM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `GetBrandName`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `GetBrandName` (`V_BrandId` BIGINT) RETURNS VARCHAR(40) CHARSET latin1 BEGIN
    DECLARE V_Name varchar(40);
 
    SELECT BrandName INTO V_Name FROM tbl_brand WHERE BrandId = V_BrandId;

    RETURN V_Name;
END$$

DROP FUNCTION IF EXISTS `GetCategoryName`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCategoryName` (`V_CategoryId` BIGINT) RETURNS VARCHAR(40) CHARSET latin1 BEGIN
    DECLARE V_Name varchar(40);
 
    SELECT Name INTO V_Name FROM tbl_product_category WHERE CategoryId = V_CategoryId;

    RETURN V_Name;
END$$

DROP FUNCTION IF EXISTS `GetRoleName`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `GetRoleName` (`V_RoleId` BIGINT) RETURNS VARCHAR(64) CHARSET latin1 BEGIN
    DECLARE V_RoleName varchar(64);
 
    SELECT RoleName INTO V_RoleName FROM tbl_role_master WHERE RoleId = V_RoleId;

    RETURN V_RoleName;
END$$

DROP FUNCTION IF EXISTS `GetUserName`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `GetUserName` (`V_UserId` BIGINT) RETURNS VARCHAR(60) CHARSET latin1 BEGIN
    DECLARE V_UserName varchar(60);
 
    SELECT concat(FirstName, ' ', LastName) INTO V_UserName FROM tbl_user_master WHERE UserId = V_UserId;

    RETURN V_UserName;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('camosuije9jkr8fi0ue9macvaus0vjat', '::1', 1658059932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635383035393839303b4c6f67676564557365727c613a33303a7b733a363a22557365724964223b733a313a2231223b733a383a2253656c6c65724964223b733a313a2230223b733a363a22526f6c654964223b733a313a2231223b733a393a2246697273744e616d65223b733a373a2244757276617368223b733a383a224c6173744e616d65223b733a353a224e696d6a65223b733a383a22557365724e616d65223b733a373a2244757276617368223b733a353a22456d61696c223b733a32323a22647572766173686e696d6a6540676d61696c2e636f6d223b733a383a2250617373776f7264223b733a33323a2263474a434e444a576357316d576c70535755787455455a5564457071647a3039223b733a383a224d6f62696c654e6f223b733a31303a2237303936373134373936223b733a31313a22436f6d70616e794e616d65223b733a31393a22466972737465636820446576656c6f70657273223b733a373a2250726f66696c65223b733a33343a22313630313832323338312d494d472d32303139313130362d5741303030312e6a7067223b733a31313a22466f72676f74546f6b656e223b4e3b733a393a224c6f67696e54696d65223b733a31393a22323032302d30332d32322031343a32383a3537223b733a31303a224c6f676f757454696d65223b733a31393a22323032302d30332d32322031343a32383a3433223b733a31333a2249734f776e537570706c696572223b733a313a2230223b733a31303a224973417070726f766564223b733a313a2231223b733a31303a2249735665726966696564223b733a313a2231223b733a363a22537461747573223b733a313a2231223b733a393a22497344656c65746564223b733a313a2230223b733a393a22456e7472795465726d223b733a363a223a3a31207c20223b733a393a22456e74727955736572223b733a313a2231223b733a393a22456e74727944617465223b733a31393a22323032302d30342d30352030353a30383a3033223b733a373a225570645465726d223b733a363a223a3a31207c20223b733a373a2255706455736572223b733a313a2231223b733a373a2255706444617465223b733a31393a22323032302d31302d31312031303a31383a3538223b733a393a2254696d655374616d70223b733a31393a22323032302d31302d31312031353a34383a3538223b733a383a22526f6c654e616d65223b733a31313a2253757065722041646d696e223b733a31303a224973437573746f6d6572223b733a313a2230223b733a31343a226c6f676765645f696e5f74696d65223b733a31393a22323032322d30372d31372031323a31313a3335223b733a363a2249505f416464223b733a363a223a3a31207c20223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

DROP TABLE IF EXISTS `tbl_brand`;
CREATE TABLE IF NOT EXISTS `tbl_brand` (
  `BrandId` int(11) NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(40) DEFAULT NULL,
  `Slug` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`BrandId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`BrandId`, `BrandName`, `Slug`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'Siyaram', 'siyaram', 1, 0, '::1 | ', 1, '2020-10-18 10:39:56', '::1 | ', 1, '2020-10-18 10:42:08'),
(2, 'Reebock', 'reebock', 1, 0, '::1 | ', 1, '2020-10-18 10:40:23', '::1 | ', 1, '2022-06-24 17:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE IF NOT EXISTS `tbl_city` (
  `CityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StateId` bigint(20) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CityId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`CityId`, `Name`, `StateId`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'Surat', 1, 1, 0, '', 1, '2020-04-04 00:00:00', '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 17:10:00'),
(2, 'Ahemdabad', 1, 1, 0, '', 1, '2020-04-04 00:00:00', '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 17:11:48'),
(3, 'Mumbai', 2, 1, 0, '', 1, '2020-04-04 00:00:00', NULL, NULL, NULL),
(4, 'Nagpur', 2, 1, 0, '', 1, '2020-04-04 00:00:00', '::1 | ', 1, '2020-04-08 06:42:07'),
(5, 'Pune', 2, 1, 0, '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 17:13:31', '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 17:15:08'),
(6, 'Vadodara', 1, 1, 0, '::1 | ', 1, '2020-04-08 11:39:19', NULL, NULL, NULL),
(7, 'Bharuch', 1, 1, 0, '::1 | ', 1, '2020-04-08 11:42:48', '::1 | ', 2, '2020-10-11 13:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

DROP TABLE IF EXISTS `tbl_country`;
CREATE TABLE IF NOT EXISTS `tbl_country` (
  `CountryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Flag` varchar(100) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`CountryId`, `Name`, `Code`, `Flag`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'India', 'IN', '1586329729-logo_sm.png', 1, 0, '', 1, '2020-04-04 00:00:00', '::1 | ', 1, '2020-04-08 07:08:53'),
(2, 'Pakistan', 'PK', NULL, 1, 0, '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 16:24:18', '::1 | ', 2, '2020-10-11 13:20:57'),
(3, 'China', 'CN', NULL, 1, 0, '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 16:25:21', '::1 | ', 2, '2020-10-11 13:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_block`
--

DROP TABLE IF EXISTS `tbl_login_block`;
CREATE TABLE IF NOT EXISTS `tbl_login_block` (
  `IP` varchar(64) NOT NULL,
  `Attempt` tinyint(1) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_detail`
--

DROP TABLE IF EXISTS `tbl_login_detail`;
CREATE TABLE IF NOT EXISTS `tbl_login_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `LoginToken` varchar(256) NOT NULL,
  `LoginTime` datetime NOT NULL,
  `DeviceType` enum('W','A','I') NOT NULL DEFAULT 'W',
  `DeviceKey` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_login_detail`
--

INSERT INTO `tbl_login_detail` (`id`, `UserId`, `LoginToken`, `LoginTime`, `DeviceType`, `DeviceKey`) VALUES
(1, 8, '123456', '2022-06-26 00:00:00', 'W', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_attributes`
--

DROP TABLE IF EXISTS `tbl_product_attributes`;
CREATE TABLE IF NOT EXISTS `tbl_product_attributes` (
  `Aid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  `Slug` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_attributes`
--

INSERT INTO `tbl_product_attributes` (`Aid`, `Name`, `Slug`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'Color', 'color', 1, 0, '::1 | ', 1, '2020-10-18 11:21:08', NULL, NULL, NULL),
(2, 'Size', 'size', 1, 0, '::1 | ', 1, '2020-10-18 11:21:20', '::1 | ', 1, '2020-10-19 16:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

DROP TABLE IF EXISTS `tbl_product_category`;
CREATE TABLE IF NOT EXISTS `tbl_product_category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `ParentId` int(11) DEFAULT NULL,
  `Name` varchar(40) NOT NULL,
  `Slug` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`CategoryId`, `ParentId`, `Name`, `Slug`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, NULL, 'Cloth', 'cloth', 1, 0, '::1 | ', 1, '2020-10-18 09:24:45', NULL, NULL, NULL),
(2, 1, 'Blouse', 'blouse', 1, 0, '::1 | ', 1, '2020-10-18 09:25:06', NULL, NULL, NULL),
(3, NULL, 'Toys', 'toys', 1, 0, '::1 | ', 1, '2020-10-18 09:25:26', '::1 | ', 1, '2020-10-18 10:04:11'),
(4, 3, 'Cricket Kit', 'cricket-kit', 1, 0, '::1 | ', 1, '2020-10-18 09:25:50', '::1 | ', 1, '2020-10-18 10:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_detail`
--

DROP TABLE IF EXISTS `tbl_product_detail`;
CREATE TABLE IF NOT EXISTS `tbl_product_detail` (
  `Did` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `Aid` int(11) DEFAULT NULL,
  `Vid` int(11) DEFAULT NULL,
  `Pvid` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SKU` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RegularPrice` float NOT NULL DEFAULT '0',
  `SalePrice` float NOT NULL DEFAULT '0',
  `IsManageStock` tinyint(1) NOT NULL DEFAULT '0',
  `StockQty` int(11) DEFAULT NULL,
  `AllowBackOrder` tinyint(1) DEFAULT NULL,
  `LowStockThreshold` int(11) DEFAULT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Did`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_detail`
--

INSERT INTO `tbl_product_detail` (`Did`, `ProductId`, `Aid`, `Vid`, `Pvid`, `SKU`, `RegularPrice`, `SalePrice`, `IsManageStock`, `StockQty`, `AllowBackOrder`, `LowStockThreshold`, `Enabled`) VALUES
(2, 6, 2, 5, '6004', '', 1100, 850, 1, 4, 0, 1, 1),
(3, 6, 2, 4, '6002', '', 1100, 850, 1, 10, 1, 2, 1),
(4, 6, 2, 4, '6001', '', 1100, 850, 1, 10, 1, 2, 1),
(5, 6, 2, 4, '6000', '', 1100, 850, 1, 10, 1, 2, 1),
(7, 6, 2, 5, '6004', '', 1100, 850, 1, 4, 0, 1, 1),
(8, 6, 2, 4, '6002', '', 1100, 850, 1, 10, 1, 2, 1),
(9, 6, 2, 4, '6001', '', 1100, 850, 1, 10, 1, 2, 1),
(10, 6, 2, 4, '6000', '', 1100, 850, 1, 10, 1, 2, 1),
(11, 7, 2, 4, '7001', '111', 169, 149, 1, NULL, NULL, NULL, 1),
(12, 7, 2, 4, '7001', '111', 169, 149, 1, NULL, NULL, NULL, 1),
(13, 7, 2, 5, '7002', '', 169, 149, 1, NULL, NULL, NULL, 1),
(14, 7, 2, 5, '7002', '', 169, 149, 1, NULL, NULL, NULL, 1),
(15, 8, 2, 6, '8002', '', 450, 300, 1, NULL, NULL, NULL, 1),
(16, 8, 2, 5, '8001', '', 450, 300, 1, NULL, NULL, NULL, 1),
(17, 8, 2, 5, '8000', '', 450, 300, 1, NULL, NULL, NULL, 1),
(18, 8, 1, 2, '8002', '', 450, 300, 1, NULL, NULL, NULL, 1),
(19, 8, 1, 3, '8001', '', 450, 300, 1, NULL, NULL, NULL, 1),
(20, 8, 1, 1, '8000', '', 450, 300, 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_master`
--

DROP TABLE IF EXISTS `tbl_product_master`;
CREATE TABLE IF NOT EXISTS `tbl_product_master` (
  `ProductId` bigint(20) NOT NULL AUTO_INCREMENT,
  `SellerId` bigint(20) NOT NULL DEFAULT '0',
  `CategoryId` int(11) NOT NULL,
  `BrandId` int(11) NOT NULL,
  `ProductName` varchar(40) DEFAULT NULL,
  `Slug` varchar(50) NOT NULL,
  `ShortDesc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LongDesc` text,
  `ProductType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Simple Product, and 1- Variable Product',
  `Image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TaxId` int(11) DEFAULT NULL,
  `RegularPrice` float NOT NULL DEFAULT '0',
  `SalePrice` float NOT NULL DEFAULT '0',
  `Weight` float DEFAULT NULL COMMENT 'In KG',
  `Length` float DEFAULT NULL COMMENT 'In CM',
  `Width` float DEFAULT NULL COMMENT 'In CM',
  `Height` float DEFAULT NULL COMMENT 'In CM',
  `ShipDaysWithStock` int(11) DEFAULT NULL,
  `ShipDaysWithoutStock` int(11) DEFAULT NULL,
  `IsManageStock` tinyint(1) NOT NULL DEFAULT '0',
  `StockQty` int(11) DEFAULT NULL,
  `AllowBackOrder` tinyint(1) DEFAULT NULL,
  `LowStockThreshold` int(11) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_master`
--

INSERT INTO `tbl_product_master` (`ProductId`, `SellerId`, `CategoryId`, `BrandId`, `ProductName`, `Slug`, `ShortDesc`, `LongDesc`, `ProductType`, `Image`, `TaxId`, `RegularPrice`, `SalePrice`, `Weight`, `Length`, `Width`, `Height`, `ShipDaysWithStock`, `ShipDaysWithoutStock`, `IsManageStock`, `StockQty`, `AllowBackOrder`, `LowStockThreshold`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(6, 3, 4, 2, 'Bat Ball', 'bat-ball', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 1, '1657357782-IMG-20191106-WA0003.jpg', 1, 1100, 850, 10, 100, 80, 40, 2, 5, 1, 10, 1, 2, 1, 0, '::1 | ', 1, '2022-07-09 09:09:42', '::1 | ', 1, '2020-12-31 13:09:55'),
(7, 3, 3, 2, 'Disney Mickey & Friends My first Racket', 'disney-mickey-friends-my-first-racket', 'Disney Mickey & Friends My first Racket Set Badminton Kit', 'This Disney Mickey racket Set for kids is an excellent way for kids to improve gross motor skills. The clubs are of perfect size for your kid, so that they can practice drives. Has a sturdy and Fine finish making it safe for children. A great way to teach the young player hand and eye coordination. These rackets that are lightweight, easy to grip and hard to lose - a must have for trips to the beach and holidays. Disclaimer: Color of balls may vary as per availability in stock.', 1, '1657357751-IMG-20191106-WA0002.jpg', 2, 169, 149, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '::1 | ', 1, '2022-07-09 09:09:11', NULL, NULL, NULL),
(8, 6, 1, 1, 'Printed Women Straight Kurta', 'printed-women-straight-kurta', 'Shipping charges are calculated based on the number of units, distance, and delivery date', 'Shipping charges are calculated based on the number of units, distance, and delivery date. For Plus customers, shipping charges are free., For non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit, For faster delivery, shipping charges will be applicable.', 1, '1657357718-IMG-20191106-WA0001.jpg', 0, 450, 300, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '::1 | ', 1, '2022-07-09 09:08:39', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_media`
--

DROP TABLE IF EXISTS `tbl_product_media`;
CREATE TABLE IF NOT EXISTS `tbl_product_media` (
  `Mid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductId` bigint(20) NOT NULL,
  `Pvid` varchar(8) DEFAULT NULL,
  `Type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Image, and 1- Video',
  `Location` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Mid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_media`
--

INSERT INTO `tbl_product_media` (`Mid`, `ProductId`, `Pvid`, `Type`, `Location`) VALUES
(7, 7, '7002', 0, '7002-IMG-20191106-WA0000.jpg'),
(8, 7, '7001', 0, '7001-IMG-20191106-WA00023.jpg'),
(9, 7, '7001', 0, '7001-IMG-20191106-WA00033.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_tag_detail`
--

DROP TABLE IF EXISTS `tbl_product_tag_detail`;
CREATE TABLE IF NOT EXISTS `tbl_product_tag_detail` (
  `Did` bigint(20) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) NOT NULL,
  `ProductId` bigint(20) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_tag_detail`
--

INSERT INTO `tbl_product_tag_detail` (`Did`, `TagId`, `ProductId`) VALUES
(1, 4, 7),
(2, 1, 7),
(3, 2, 8),
(4, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_tag_master`
--

DROP TABLE IF EXISTS `tbl_product_tag_master`;
CREATE TABLE IF NOT EXISTS `tbl_product_tag_master` (
  `TagId` int(11) NOT NULL AUTO_INCREMENT,
  `TagName` varchar(40) DEFAULT NULL,
  `Slug` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TagId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_tag_master`
--

INSERT INTO `tbl_product_tag_master` (`TagId`, `TagName`, `Slug`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'Best Seller', 'best-seller', 1, 0, '::1 | ', 1, '2020-10-18 11:00:59', NULL, NULL, NULL),
(2, 'Women Cloth', 'women-cloth', 1, 0, '::1 | ', 1, '2020-10-18 11:01:25', NULL, NULL, NULL),
(3, 'Design Blouse', 'design-blouse', 1, 0, '::1 | ', 1, '2020-10-18 11:01:43', '::1 | ', 1, '2020-10-18 11:02:45'),
(4, 'Child Cricket Kit', 'child-cricket-kit', 1, 0, '::1 | ', 1, '2020-10-18 11:02:03', '::1 | ', 1, '2020-10-18 11:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_variations`
--

DROP TABLE IF EXISTS `tbl_product_variations`;
CREATE TABLE IF NOT EXISTS `tbl_product_variations` (
  `Vid` int(11) NOT NULL AUTO_INCREMENT,
  `Aid` int(11) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Slug` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Vid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_variations`
--

INSERT INTO `tbl_product_variations` (`Vid`, `Aid`, `Name`, `Slug`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 1, 'Red', 'red', 1, 0, '::1 | ', 1, '2020-10-19 16:40:41', NULL, NULL, NULL),
(2, 1, 'Yellow', 'yellow', 1, 0, '::1 | ', 1, '2020-10-19 16:41:46', NULL, NULL, NULL),
(3, 1, 'Pink', 'pink', 1, 0, '::1 | ', 1, '2020-10-19 16:42:00', NULL, NULL, NULL),
(4, 2, 'S', 's', 1, 0, '::1 | ', 1, '2020-10-19 16:53:54', NULL, NULL, NULL),
(5, 2, 'M', 'm', 1, 0, '::1 | ', 1, '2020-10-19 16:53:59', NULL, NULL, NULL),
(6, 2, 'L', 'l', 1, 0, '::1 | ', 1, '2020-10-19 16:54:04', NULL, NULL, NULL),
(7, 2, 'XL', 'xl', 1, 0, '::1 | ', 1, '2020-10-19 16:54:10', NULL, NULL, NULL),
(8, 2, 'XXL', 'xxl', 1, 0, '::1 | ', 1, '2020-10-19 16:54:15', '::1 | ', 1, '2020-10-19 17:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_master`
--

DROP TABLE IF EXISTS `tbl_role_master`;
CREATE TABLE IF NOT EXISTS `tbl_role_master` (
  `RoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(64) NOT NULL,
  `ParentId` bigint(20) NOT NULL,
  `IsSys` tinyint(1) NOT NULL DEFAULT '0',
  `IsCustomer` tinyint(1) NOT NULL DEFAULT '0',
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(64) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(64) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_role_master`
--

INSERT INTO `tbl_role_master` (`RoleId`, `RoleName`, `ParentId`, `IsSys`, `IsCustomer`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'Super Admin', 0, 1, 0, 1, 0, '', 1, '2020-03-30 00:00:00', NULL, NULL, NULL),
(2, 'Admin', 1, 1, 0, 1, 0, '', 1, '2020-03-30 00:00:00', '::1 | ', 1, '2022-06-24 17:33:44'),
(3, 'Seller', 2, 1, 0, 1, 0, '', 1, '2020-03-30 00:00:00', '::1 | ', 1, '2020-04-10 13:01:24'),
(4, 'Customer', 2, 1, 1, 1, 0, '::1 | ', 1, '2020-04-10 13:08:41', NULL, NULL, NULL),
(5, 'Sales Manager', 3, 0, 0, 1, 0, '::1 | ', 1, '2020-04-10 13:09:55', '::1 | ', 1, '2020-10-11 12:58:13'),
(6, 'Sales Executive', 5, 0, 0, 1, 0, '::1 | ', 4, '2020-04-10 13:21:27', '::1 | ', 1, '2022-05-27 13:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

DROP TABLE IF EXISTS `tbl_state`;
CREATE TABLE IF NOT EXISTS `tbl_state` (
  `StateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `CountryId` bigint(20) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`StateId`, `Name`, `CountryId`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'Gujarat', 1, 1, 0, '', 1, '2020-04-04 00:00:00', NULL, NULL, NULL),
(2, 'Maharashtra', 1, 1, 0, '', 1, '2020-04-04 00:00:00', '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 16:45:19'),
(3, 'Lahor', 2, 1, 0, '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 16:52:58', '::1 | 2402:3a80:16ae:76ac:9582:ce36:f874', 1, '2020-04-07 16:54:21'),
(4, 'Uttar Pradesh', 1, 1, 0, '::1 | ', 1, '2020-04-08 11:48:19', '::1 | ', 2, '2020-10-11 13:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax`
--

DROP TABLE IF EXISTS `tbl_tax`;
CREATE TABLE IF NOT EXISTS `tbl_tax` (
  `TaxId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `IsOverride` tinyint(1) NOT NULL DEFAULT '0',
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TaxId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tax`
--

INSERT INTO `tbl_tax` (`TaxId`, `Name`, `IsOverride`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 'GST', 0, 1, 0, '::1 | ', 1, '2020-12-29 13:52:03', NULL, NULL, NULL),
(2, 'VAT', 0, 1, 0, '::1 | ', 1, '2020-12-29 13:52:35', '::1 | ', 1, '2022-07-16 12:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax_detail`
--

DROP TABLE IF EXISTS `tbl_tax_detail`;
CREATE TABLE IF NOT EXISTS `tbl_tax_detail` (
  `Tid` int(11) NOT NULL AUTO_INCREMENT,
  `TaxId` int(11) NOT NULL,
  `CountryId` bigint(20) NOT NULL,
  `Rate` double(5,2) NOT NULL DEFAULT '0.00',
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Tid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tax_detail`
--

INSERT INTO `tbl_tax_detail` (`Tid`, `TaxId`, `CountryId`, `Rate`) VALUES
(1, 1, 1, 18.00),
(2, 2, 1, 8.00),
(3, 2, 3, 20.00),
(4, 2, 2, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_address`
--

DROP TABLE IF EXISTS `tbl_user_address`;
CREATE TABLE IF NOT EXISTS `tbl_user_address` (
  `AddId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MobileNo` varchar(20) NOT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `TelephoneNo` varchar(20) DEFAULT NULL,
  `Address` mediumtext NOT NULL,
  `Country` bigint(20) NOT NULL,
  `State` bigint(20) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Pincode` varchar(10) NOT NULL,
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AddId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_master`
--

DROP TABLE IF EXISTS `tbl_user_master`;
CREATE TABLE IF NOT EXISTS `tbl_user_master` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `SellerId` bigint(20) NOT NULL DEFAULT '0',
  `RoleId` bigint(20) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `MobileNo` varchar(20) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `Profile` varchar(64) DEFAULT NULL,
  `ForgotToken` varchar(64) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `LogoutTime` datetime DEFAULT NULL,
  `IsOwnSupplier` tinyint(1) NOT NULL DEFAULT '0',
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsVerified` tinyint(1) NOT NULL DEFAULT '0',
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `EntryTerm` varchar(40) NOT NULL,
  `EntryUser` bigint(20) NOT NULL,
  `EntryDate` datetime NOT NULL,
  `UpdTerm` varchar(40) DEFAULT NULL,
  `UpdUser` bigint(20) DEFAULT NULL,
  `UpdDate` datetime DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user_master`
--

INSERT INTO `tbl_user_master` (`UserId`, `SellerId`, `RoleId`, `FirstName`, `LastName`, `UserName`, `Email`, `Password`, `MobileNo`, `CompanyName`, `Profile`, `ForgotToken`, `LoginTime`, `LogoutTime`, `IsOwnSupplier`, `IsApproved`, `IsVerified`, `Status`, `IsDeleted`, `EntryTerm`, `EntryUser`, `EntryDate`, `UpdTerm`, `UpdUser`, `UpdDate`) VALUES
(1, 0, 1, 'Durvash', 'Nimje', 'Durvash', 'durvashnimje@gmail.com', 'cGJCNDJWcW1mWlpSWUxtUEZUdEpqdz09', '7096714796', 'Firstech Developers', '1601822381-IMG-20191106-WA0001.jpg', NULL, '2020-03-22 14:28:57', '2020-03-22 14:28:43', 0, 1, 1, 1, 0, '::1 | ', 1, '2020-04-05 05:08:03', '::1 | ', 1, '2020-10-11 10:18:58'),
(2, 0, 2, 'Maulik', 'Kanani', 'Maulik', 'durvashn@gmail.com', 'RkJmSy9pMTBWalRDdUNYaEhYWmp0UT09', '7777777777', 'Ecommerce Pvt. Ltd.', NULL, NULL, '2020-03-22 14:28:57', '2020-03-22 14:28:43', 0, 1, 1, 1, 0, '::1 | ', 1, '2020-04-05 05:07:40', '::1 | ', 2, '2020-10-11 11:28:36'),
(3, 0, 3, 'Pravesh', 'Ghildiyal', 'Pravesh', 'durvashnimje@hotmail.com', 'eXY5a1poL2hJOTE2YVNLRkVqZXVQdz09', '8888888888', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, '::1 | ', 1, '2020-04-05 05:22:19', '::1 | ', 3, '2020-10-11 11:19:23'),
(4, 0, 4, 'Test', 'Customer', 'customer', 'durvash_customer@gmail.com', 'cGJCNDJWcW1mWlpSWUxtUEZUdEpqdz09', '9999999989', '', NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 2, '2020-10-11 11:48:46', '::1 | ', 1, '2020-10-11 11:13:02'),
(6, 0, 3, 'Pramod', 'Italiya', 'pramod', 'pramod@italy.com', 'R1lmSXBzNXVHVmp2NEtnOFI5WnUrdz09', '8866886699', 'Italia Pvt Ltd.', NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 2, '2020-10-12 16:10:17', '::1 | ', 2, '2020-10-12 16:10:29'),
(7, 0, 3, 'Anand', 'Soni', 'anand', 'anand@site.com', 'WXdrTlpXSTVzVVJPNUYxQlFOb3J0QT09', '7766776677', 'AS Pvt.', NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 2, '2020-10-12 16:16:24', NULL, NULL, NULL),
(8, 0, 4, 'Sandip', 'Patil', 'sandip', 'sandip@site.com', '321', '7777777778', '', NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 2, '2020-10-12 16:44:12', NULL, NULL, NULL),
(9, 0, 5, 'Ruchi', 'Patel', 'ruchi', 'ruchi@site.com', 'Sk12aU8vM0x2WkhSYmN5YnN3akRlZz09', '8889995554', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 2, '2020-10-12 17:25:00', NULL, NULL, NULL),
(10, 0, 6, 'Mitali', 'Surti', 'mitali', 'mitali@site.com', 'UkpSZExnTmVia25BMkd1WkFaNzhzdz09', '7096708596', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 2, '2020-10-12 17:29:53', NULL, NULL, NULL),
(11, 3, 5, 'Ghildiyal', 'Staff', '', 'ghildiyal@site.com', 'dk5BNG85UjcvKy9PSDNER0JDdm5Kdz09', '7070708090', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 3, '2020-10-12 17:53:31', NULL, NULL, NULL),
(12, 3, 6, 'rakesh', 'Roshan', 'Rakesh', 'rakesh@site.com', 'SmtKeFhGRjZvOXY3T201TUo2RjhxUT09', '5500223355', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, '::1 | ', 3, '2020-10-12 17:55:29', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
