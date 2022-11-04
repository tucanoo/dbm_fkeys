-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.7.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE `nexx_dbm_fkeys`;
-- Dumping database structure for nexx_dbm_fkeys
CREATE DATABASE IF NOT EXISTS `nexx_dbm_fkeys` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `nexx_dbm_fkeys`;

CREATE TABLE `live_seller` (
                               `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                               `version` BIGINT(20) NOT NULL,
                               `display_name` VARCHAR(80) NOT NULL COLLATE 'utf8mb3_unicode_ci',
                               PRIMARY KEY (`id`) USING BTREE,
                               UNIQUE INDEX `display_name` (`display_name`) USING BTREE
) COLLATE='utf8mb3_unicode_ci' ENGINE=InnoDB AUTO_INCREMENT=34;

CREATE TABLE `live_seller_aud` (
                                   `id` BIGINT(20) NOT NULL,
                                   `rev` INT(11) NOT NULL,
                                   `revtype` TINYINT(4) NULL DEFAULT NULL,
                                   `version` BIGINT(20) NULL DEFAULT NULL,
                                   `display_name` VARCHAR(80) NULL COLLATE 'utf8mb3_unicode_ci',
                                   PRIMARY KEY (`id`, `rev`) USING BTREE,
                                   INDEX `FKD9CC3B23BECB20A8` (`rev`) USING BTREE
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
;


-- Dumping structure for table nexx_dbm_fkeys.databasechangelog
CREATE TABLE IF NOT EXISTS `databasechangelog` (
  `ID` varchar(63) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AUTHOR` varchar(63) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FILENAME` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table nexx_dbm_fkeys.databasechangeloglock
CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.
-- Data exporting was unselected.
CREATE TABLE `live_seller_state` (
                                     `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                                     `version` BIGINT(20) NOT NULL,
                                     `fiscal_year` INT(11) NOT NULL,
                                     `seller_id` BIGINT(20) NOT NULL,
                                     PRIMARY KEY (`id`) USING BTREE,
                                     UNIQUE INDEX `UC_LIVE_SELLER_STATESELLER_ID_COL` (`seller_id`) USING BTREE,
                                     INDEX `FK98A73444893772C9` (`seller_id`) USING BTREE,
                                     INDEX `seller_idx` (`seller_id`) USING BTREE,
                                     CONSTRAINT `FK98A73444893772C9` FOREIGN KEY (`seller_id`) REFERENCES `live_seller` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=34
;

-- Data exporting was unselected.

-- Dumping structure for table nexx_dbm.live_seller_state_aud
CREATE TABLE `live_seller_state_aud` (
                                         `id` BIGINT(20) NOT NULL,
                                         `rev` INT(11) NOT NULL,
                                         `revtype` TINYINT(4) NULL DEFAULT NULL,
                                         `version` BIGINT(20) NULL DEFAULT NULL,
                                         `fiscal_year` INT(11) NULL DEFAULT NULL,
                                         `seller_id` BIGINT(20) NULL DEFAULT NULL,

                                         PRIMARY KEY (`id`, `rev`) USING BTREE,
                                         INDEX `FKCDD81C35BECB20A8` (`rev`) USING BTREE
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `live_abstract_hole` (
                                      `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                                      `version` BIGINT(20) NOT NULL,
                                      `number` INT(11) NOT NULL,
                                      PRIMARY KEY (`id`) USING BTREE
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=287181
;

CREATE TABLE `live_abstract_hole_aud` (
                                          `id` BIGINT(20) NOT NULL,
                                          `rev` INT(11) NOT NULL,
                                          `revtype` TINYINT(4) NULL DEFAULT NULL,
                                          `version` BIGINT(20) NULL DEFAULT NULL,
                                          `number` INT(11) NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`, `rev`) USING BTREE,
                                          INDEX `FKB37B3D9BBECB20A8` (`rev`) USING BTREE
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
;

CREATE TABLE `live_hole` (
                             `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
                             PRIMARY KEY (`id`) USING BTREE
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=285573
;

CREATE TABLE `live_hole_aud` (
                                 `id` BIGINT(20) NOT NULL,
                                 `rev` INT(11) NOT NULL,
                                 PRIMARY KEY (`id`, `rev`) USING BTREE
)
    COLLATE='utf8mb3_unicode_ci'
ENGINE=InnoDB
;



/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
