-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paprika
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB-1:11.0.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `paprika`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `paprika` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `paprika`;

--
-- Table structure for table `DietModel`
--

DROP TABLE IF EXISTS `DietModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DietModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DietModel`
--

LOCK TABLES `DietModel` WRITE;
/*!40000 ALTER TABLE `DietModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `DietModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DishIngredientModel`
--

DROP TABLE IF EXISTS `DishIngredientModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DishIngredientModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `dish` int(11) NOT NULL,
  `ingredient` int(11) NOT NULL,
  `measure_count` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DishIngredientModel_dish__id` (`dish`),
  KEY `fk_DishIngredientModel_ingredient__id` (`ingredient`),
  CONSTRAINT `fk_DishIngredientModel_dish__id` FOREIGN KEY (`dish`) REFERENCES `DishModel` (`id`),
  CONSTRAINT `fk_DishIngredientModel_ingredient__id` FOREIGN KEY (`ingredient`) REFERENCES `IngredientModel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DishIngredientModel`
--

LOCK TABLES `DishIngredientModel` WRITE;
/*!40000 ALTER TABLE `DishIngredientModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `DishIngredientModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DishModel`
--

DROP TABLE IF EXISTS `DishModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DishModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `name` text NOT NULL,
  `calories` double NOT NULL,
  `protein` double NOT NULL,
  `fat` double NOT NULL,
  `carbohydrates` double NOT NULL,
  `cellulose` double NOT NULL,
  `weight` double NOT NULL,
  `time_to_cook` int(11) NOT NULL,
  `diet` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_DishModel_diet__id` (`diet`),
  KEY `fk_DishModel_type__id` (`type`),
  CONSTRAINT `fk_DishModel_diet__id` FOREIGN KEY (`diet`) REFERENCES `DietModel` (`id`),
  CONSTRAINT `fk_DishModel_type__id` FOREIGN KEY (`type`) REFERENCES `DishTypeModel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DishModel`
--

LOCK TABLES `DishModel` WRITE;
/*!40000 ALTER TABLE `DishModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `DishModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DishTypeModel`
--

DROP TABLE IF EXISTS `DishTypeModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DishTypeModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DishTypeModel`
--

LOCK TABLES `DishTypeModel` WRITE;
/*!40000 ALTER TABLE `DishTypeModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `DishTypeModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EatingCacheDishesModel`
--

DROP TABLE IF EXISTS `EatingCacheDishesModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EatingCacheDishesModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `dish` int(11) NOT NULL,
  `eating_cache` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_EatingCacheDishesModel_dish__id` (`dish`),
  KEY `fk_EatingCacheDishesModel_eating_cache__id` (`eating_cache`),
  CONSTRAINT `fk_EatingCacheDishesModel_dish__id` FOREIGN KEY (`dish`) REFERENCES `DishModel` (`id`),
  CONSTRAINT `fk_EatingCacheDishesModel_eating_cache__id` FOREIGN KEY (`eating_cache`) REFERENCES `EatingCacheModel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EatingCacheDishesModel`
--

LOCK TABLES `EatingCacheDishesModel` WRITE;
/*!40000 ALTER TABLE `EatingCacheDishesModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `EatingCacheDishesModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EatingCacheModel`
--

DROP TABLE IF EXISTS `EatingCacheModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EatingCacheModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `calories` double NOT NULL,
  `protein` double NOT NULL,
  `fat` double NOT NULL,
  `carbohydrates` double NOT NULL,
  `cellulose` double NOT NULL,
  `diet` int(11) DEFAULT NULL,
  `size` double NOT NULL,
  `difficulty` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `dish_count` int(11) NOT NULL,
  `use_times_from_last_scrap` int(11) NOT NULL,
  `use_times_from_creation` int(11) NOT NULL,
  `on_remove` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_EatingCacheModel_diet__id` (`diet`),
  KEY `fk_EatingCacheModel_type__id` (`type`),
  CONSTRAINT `fk_EatingCacheModel_diet__id` FOREIGN KEY (`diet`) REFERENCES `DietModel` (`id`),
  CONSTRAINT `fk_EatingCacheModel_type__id` FOREIGN KEY (`type`) REFERENCES `DishTypeModel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EatingCacheModel`
--

LOCK TABLES `EatingCacheModel` WRITE;
/*!40000 ALTER TABLE `EatingCacheModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `EatingCacheModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngredientMeasureModel`
--

DROP TABLE IF EXISTS `IngredientMeasureModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngredientMeasureModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `name` text NOT NULL,
  `name_five_items` text NOT NULL,
  `name_fractional` text NOT NULL,
  `name_two_items` text NOT NULL,
  `is_dimensional` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngredientMeasureModel`
--

LOCK TABLES `IngredientMeasureModel` WRITE;
/*!40000 ALTER TABLE `IngredientMeasureModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngredientMeasureModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngredientModel`
--

DROP TABLE IF EXISTS `IngredientModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngredientModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `name` text NOT NULL,
  `measure` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_IngredientModel_measure__id` (`measure`),
  CONSTRAINT `fk_IngredientModel_measure__id` FOREIGN KEY (`measure`) REFERENCES `IngredientMeasureModel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngredientModel`
--

LOCK TABLES `IngredientModel` WRITE;
/*!40000 ALTER TABLE `IngredientModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngredientModel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-13 16:07:06
