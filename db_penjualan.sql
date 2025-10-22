-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_penjualan
CREATE DATABASE IF NOT EXISTS `db_penjualan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_penjualan`;

-- Dumping structure for table db_penjualan.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nama_Barang` varchar(100) NOT NULL,
  `Kode_Barang` varchar(50) DEFAULT NULL,
  `Tipe_Barang` varchar(50) DEFAULT NULL,
  `Harga_Barang` decimal(15,2) DEFAULT NULL,
  `Harga_Jual` decimal(15,2) DEFAULT NULL,
  `Quantity` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Kode_Barang` (`Kode_Barang`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.cabang
CREATE TABLE IF NOT EXISTS `cabang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nama_Cabang` varchar(100) NOT NULL,
  `Alamat_Cabang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nama_Cust` varchar(100) NOT NULL,
  `No_Tlp_Cust` varchar(20) DEFAULT NULL,
  `Alamat_Cust` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.detail_purchasing
CREATE TABLE IF NOT EXISTS `detail_purchasing` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Purchasing` int DEFAULT NULL,
  `ID_Barang` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Purchasing` (`ID_Purchasing`),
  KEY `ID_Barang` (`ID_Barang`),
  CONSTRAINT `detail_purchasing_ibfk_1` FOREIGN KEY (`ID_Purchasing`) REFERENCES `purchasing` (`ID`),
  CONSTRAINT `detail_purchasing_ibfk_2` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.detail_selling
CREATE TABLE IF NOT EXISTS `detail_selling` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Selling` int DEFAULT NULL,
  `ID_Barang` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Selling` (`ID_Selling`),
  KEY `ID_Barang` (`ID_Barang`),
  CONSTRAINT `detail_selling_ibfk_1` FOREIGN KEY (`ID_Selling`) REFERENCES `selling` (`ID`),
  CONSTRAINT `detail_selling_ibfk_2` FOREIGN KEY (`ID_Barang`) REFERENCES `barang` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.purchasing
CREATE TABLE IF NOT EXISTS `purchasing` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_User` int DEFAULT NULL,
  `Total_Harga` decimal(15,2) DEFAULT NULL,
  `Supplier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_User` (`ID_User`),
  CONSTRAINT `purchasing_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.selling
CREATE TABLE IF NOT EXISTS `selling` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_User` int DEFAULT NULL,
  `ID_Cust` int DEFAULT NULL,
  `ID_Cabang` int DEFAULT NULL,
  `Total_Harga` decimal(15,2) DEFAULT NULL,
  `Payment` decimal(15,2) DEFAULT NULL,
  `Kembalian` decimal(15,2) DEFAULT NULL,
  `Tipe_Transaksi` varchar(50) DEFAULT NULL,
  `Status_Transaksi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_User` (`ID_User`),
  KEY `ID_Cust` (`ID_Cust`),
  KEY `ID_Cabang` (`ID_Cabang`),
  CONSTRAINT `selling_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID`),
  CONSTRAINT `selling_ibfk_2` FOREIGN KEY (`ID_Cust`) REFERENCES `customer` (`ID`),
  CONSTRAINT `selling_ibfk_3` FOREIGN KEY (`ID_Cabang`) REFERENCES `cabang` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_penjualan.user
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Cabang` int DEFAULT NULL,
  `Nama_User` varchar(100) NOT NULL,
  `No_Tlp_User` varchar(20) DEFAULT NULL,
  `Alamat_User` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Cabang` (`ID_Cabang`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ID_Cabang`) REFERENCES `cabang` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
