-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: flex_home
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'KTyIXOkDZfIjcNwY7AEIef92rHaNaYRL',1,'2023-07-18 23:25:25','2023-07-18 23:25:25','2023-07-18 23:25:25'),(2,2,'PZniYudhzlkXTZUPXmQmsewmwZNPgbNw',1,'2023-07-18 23:25:25','2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
INSERT INTO `audit_histories` VALUES (2,1,'language','{\"lang_id\":\"0\",\"lang_name\":\"Ti\\u1ebfng Vi\\u1ec7t\",\"lang_locale\":\"vi\",\"lang_code\":\"vi\",\"lang_flag\":\"vn\",\"lang_order\":\"0\",\"lang_is_rtl\":\"0\"}','created','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36','127.0.0.1',1,2,'','info','2023-06-23 02:53:00','2023-06-23 02:53:00'),(3,1,'language','{\"_method\":\"DELETE\"}','deleted','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36','127.0.0.1',1,2,'','danger','2023-06-23 02:53:15','2023-06-23 02:53:15');
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Sales Manager (Up to 2600$)','Ho Chi Minh, Viet Nam','1300$ - 2600$','<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>BENEFITS FOR YOU</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Applicants receive a salary from 1300 USD to 2600 USD<br />\r\n- Fully enjoy the regimes according to Vietnam&#39;s Labor Law: Social insurance, health insurance, unemployment insurance<br />\r\n- Trained to improve expertise and capacity in suitable positions.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB DESCRIPTION</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Coordinate with the Investment Department in organizing the collection, analysis, evaluation of market information and submitting proposals for planning the project&#39;s products and investment cooperation plans (if any);<br />\r\n- Acting as a focal point of exploitation and trading with customers, managing trading floors and distributors;<br />\r\n- Checking and approving the selection of sales units, management units for exploitation, operation and investment cooperation;<br />\r\n- Leading the negotiation and management of contracts with customers, sales units, management of exploitation, operation and investment cooperation;<br />\r\n- Prepare and submit a price approval for the sale, lease, and cooperation prices of all real estate projects;<br />\r\n- Develop sales plans, sales policies, support and promotions;<br />\r\n- Coordinate with member companies (Project Management Board) to collect and hand over product records (technical documents, red books, sales contracts ...) to hand over customers;<br />\r\n- Deploy customer support activities;</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB REQUIREMENTS</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Preferred age: 30-35<br />\r\n- University degree in Business Administration, Economics, or related industries.<br />\r\n- Over 03 years of experience in assuming the position of Real Estate Business City<br />\r\n- Priority with a certificate of real estate broker, certificate of real estate trading floor management<br />\r\n- Good planning, operating, and control skills<br />\r\n- Good communication, negotiation and problem-solving skills</span></span></p>','published','2019-11-30 19:43:10','2019-11-30 19:46:53',NULL),(3,'Senior Real Estate Consultant Demo','Ho Chi Minh, Viet Nam','From 1500$','<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>BENEFITS FOR YOU</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Basic salary 500$&nbsp;/ month.<br />\r\n- Access to diverse sources of goods and opportunities from reputable investors.<br />\r\n- Retrospective salary policy up to 2400$-7000$&nbsp;/ year.<br />\r\n- Commission of 22-50% and a commission 1000$ / successful transaction in the month.<br />\r\n- Effective bonus 0.6-3% of annual revenue.<br />\r\n- A place to build your personal brand in a standard and different way.<br />\r\n- Attend seminars on real estate every 6 months.<br />\r\n- Participate in the course on negotiation skills (Win - Win), language of sales (Language of Sales), customer mind marketing (SOI), customer conversion from social networks (Go Social)<br />\r\n- Unlimited promotion opportunities.<br />\r\n- Working with professional space and modern open office design.<br />\r\n- Welfare policy, domestic and foreign tourism ...<br />\r\n- Decentralized, democratic, financial transparency, considering brokerage is a business partner.<br />\r\n- Environmentally friendly, is the place where brokers are connected with regular activities</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB DESCRIPTION</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Quantity: 30 employees<br />\r\n- Find and exploit potential customers for real estate products valued from 2000 USD / m2 in the high-end and luxury segment;<br />\r\n- Deploying activities to find customers, coordinate with teams to realize sales targets<br />\r\n- Advise customers on information related to products and projects of the Company;</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB REQUIREMENTS</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Graduating from college or higher<br />\r\n- Good appearance, male height from 1.68m, female from 1.58m. Age from 22-35 years old<br />\r\n- Priority to candidates who know foreign languages ​​and have 1 year or more experience in the field of real estate, banking and finance.<br />\r\n- Have financial goals, work and life.<br />\r\n- Desire to achieve big goals.<br />\r\n- Diligent, persistent, honest.</span></span></p>','published','2019-11-30 19:52:42','2021-01-03 17:26:17',NULL);
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers_translations`
--

DROP TABLE IF EXISTS `careers_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `careers_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`careers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers_translations`
--

LOCK TABLES `careers_translations` WRITE;
/*!40000 ALTER TABLE `careers_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'News',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2019-11-18 02:33:35','2019-11-18 02:33:35'),(2,'House architecture',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2019-11-21 07:49:25','2019-11-21 07:49:25'),(3,'Kiến trúc nhà',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2019-11-21 07:49:35','2019-11-21 07:49:35'),(4,'House design',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2019-11-21 07:50:02','2019-11-21 07:50:02'),(5,'Thiết kế nhà',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2019-11-21 07:50:17','2019-11-21 07:50:17'),(6,'Building materials',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2019-11-21 07:50:36','2019-11-21 07:50:36'),(7,'Vật liệu xây dựng',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2019-11-21 07:50:58','2019-11-21 07:50:58'),(8,'Tin tức',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2019-11-22 01:26:08','2019-11-22 01:26:08');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int unsigned NOT NULL,
  `country_id` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Alhambra',1,1,0,0,1,'cities/los-angeles-winter-2016.jpg','published','2019-11-18 08:18:42','2019-12-03 05:55:52','alhambra',NULL),(2,'Oakland',1,1,0,0,1,'cities/oaklandnightskylineandlakemerritt.jpg','published','2019-11-18 08:23:14','2019-12-03 05:55:52','oakland',NULL),(3,'Bakersfield',1,1,0,0,1,'cities/2009-0726-ca-bakersfield-truxtontower.jpg','published','2019-11-18 08:26:54','2019-12-03 05:55:52','bakersfield',NULL),(4,'Anaheim',1,1,0,0,1,'cities/castillo-de-disneyland.jpg','published','2019-11-18 08:27:57','2019-12-03 05:55:52','anaheim',NULL),(5,'San Francisco',1,1,0,0,1,'cities/goldengatebridge-001.jpg','published','2019-11-18 08:29:18','2019-12-03 05:55:52','san-francisco',NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'United States','United States of America',0,0,'published','2019-11-18 08:17:29','2019-11-18 08:17:29',NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` int NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
INSERT INTO `dashboard_widget_settings` VALUES (1,NULL,1,7,0,1,'2019-11-26 02:40:58','2019-11-26 02:40:58'),(2,NULL,1,5,1,1,'2019-11-26 02:40:58','2019-11-26 02:40:58'),(3,NULL,1,6,2,1,'2019-11-26 02:40:58','2019-11-26 02:40:58'),(4,NULL,1,8,3,1,'2019-11-26 02:40:58','2019-11-26 02:40:58'),(5,NULL,1,9,4,1,'2019-11-26 02:40:58','2019-11-26 02:40:58'),(6,NULL,1,10,5,1,'2019-11-26 02:40:58','2019-11-26 02:40:58');
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
INSERT INTO `dashboard_widgets` VALUES (1,'widget_total_pages','2019-11-15 04:57:40','2019-11-15 04:57:40'),(2,'widget_total_users','2019-11-15 04:57:40','2019-11-15 04:57:40'),(3,'widget_total_plugins','2019-11-15 04:57:40','2019-11-15 04:57:40'),(4,'widget_total_themes','2019-11-15 04:57:40','2019-11-15 04:57:40'),(5,'widget_audit_logs','2019-11-15 18:54:50','2019-11-15 18:54:50'),(6,'widget_posts_recent','2019-11-15 18:54:50','2019-11-15 18:54:50'),(7,'widget_analytics_general','2019-11-15 18:54:50','2019-11-15 18:54:50'),(8,'widget_analytics_page','2019-11-15 18:54:50','2019-11-15 18:54:50'),(9,'widget_analytics_browser','2019-11-15 18:54:50','2019-11-15 18:54:50'),(10,'widget_analytics_referrer','2019-11-15 18:54:50','2019-11-15 18:54:50'),(11,'widget_total_1','2022-11-05 23:58:22','2022-11-05 23:58:22'),(12,'widget_total_2','2022-11-05 23:58:22','2022-11-05 23:58:22'),(13,'widget_total_3','2022-11-05 23:58:22','2022-11-05 23:58:22'),(14,'widget_total_4','2022-11-05 23:58:22','2022-11-05 23:58:22');
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int unsigned NOT NULL,
  `lang_meta_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_meta_origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_lang_meta_content_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,1,'en_US','Botble\\Menu\\Models\\MenuLocation','9a29f8602fdb85b1af1dd863f5253cec'),(2,1,'en_US','Botble\\Menu\\Models\\Menu','29c05273b86eb1d784ad0ccad70f65fc'),(3,2,'en_US','Botble\\Menu\\Models\\Menu','738ae097a9af5914c09e158c8f8c69e5'),(4,3,'en_US','Botble\\Menu\\Models\\Menu','4737b165f82593f93789eedff03139ce'),(5,4,'en_US','Botble\\Menu\\Models\\Menu','01cd18b42b2fcc253f40bc12f06bfe01');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_folder_id_user_id_created_at_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=18086 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (17915,0,'1','1',906,'image/jpeg',2165,'accounts/1.jpg','[]','2023-07-18 23:25:23','2023-07-18 23:25:23',NULL),(17916,0,'10','10',906,'image/jpeg',2165,'accounts/10.jpg','[]','2023-07-18 23:25:23','2023-07-18 23:25:23',NULL),(17917,0,'2','2',906,'image/jpeg',2165,'accounts/2.jpg','[]','2023-07-18 23:25:23','2023-07-18 23:25:23',NULL),(17918,0,'3','3',906,'image/jpeg',2165,'accounts/3.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17919,0,'4','4',906,'image/jpeg',2165,'accounts/4.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17920,0,'5','5',906,'image/jpeg',2165,'accounts/5.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17921,0,'6','6',906,'image/jpeg',2165,'accounts/6.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17922,0,'7','7',906,'image/jpeg',2165,'accounts/7.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17923,0,'8','8',906,'image/jpeg',2165,'accounts/8.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17924,0,'9','9',906,'image/jpeg',2165,'accounts/9.jpg','[]','2023-07-18 23:25:24','2023-07-18 23:25:24',NULL),(17925,0,'asset-3-at-3x','asset-3-at-3x',907,'image/png',76833,'general/asset-3-at-3x.png','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17926,0,'asset-4-at-3x','asset-4-at-3x',907,'image/png',84067,'general/asset-4-at-3x.png','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17927,0,'breadcrumb-background','breadcrumb-background',907,'image/jpeg',504692,'general/breadcrumb-background.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17928,0,'copyright','copyright',907,'image/jpeg',128544,'general/copyright.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17929,0,'home-banner','home-banner',907,'image/jpeg',892011,'general/home-banner.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17930,0,'termsconditions-pagedesktop','termsconditions-pagedesktop',907,'image/jpeg',185151,'general/termsconditions-pagedesktop.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17931,0,'video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri','video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri',907,'image/jpeg',63143,'general/video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17932,0,'vietnam-office-4','vietnam-office-4',907,'image/jpeg',214366,'general/vietnam-office-4.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17933,0,'1','1',908,'image/jpeg',66997,'news/1.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17934,0,'10','10',908,'image/jpeg',66858,'news/10.jpg','[]','2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(17935,0,'11','11',908,'image/jpeg',86492,'news/11.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17936,0,'12','12',908,'image/jpeg',91376,'news/12.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17937,0,'13','13',908,'image/jpeg',82991,'news/13.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17938,0,'14','14',908,'image/jpeg',66997,'news/14.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17939,0,'15','15',908,'image/jpeg',111450,'news/15.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17940,0,'16','16',908,'image/jpeg',464807,'news/16.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17941,0,'2','2',908,'image/jpeg',51884,'news/2.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17942,0,'3','3',908,'image/jpeg',132835,'news/3.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17943,0,'4','4',908,'image/jpeg',948302,'news/4.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17944,0,'5','5',908,'image/jpeg',66858,'news/5.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17945,0,'6','6',908,'image/jpeg',328317,'news/6.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17946,0,'7','7',908,'image/jpeg',249538,'news/7.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17947,0,'8','8',908,'image/jpeg',147871,'news/8.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17948,0,'9','9',908,'image/jpeg',194815,'news/9.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17949,0,'banner','banner',1,'image/jpeg',7703,'banner/banner.jpg','[]','2023-07-18 23:25:26','2023-07-18 23:25:26',NULL),(17950,0,'2009-0726-ca-bakersfield-truxtontower','2009-0726-ca-bakersfield-truxtontower',909,'image/jpeg',2165,'cities/2009-0726-ca-bakersfield-truxtontower.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17951,0,'castillo-de-disneyland','castillo-de-disneyland',909,'image/jpeg',2165,'cities/castillo-de-disneyland.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17952,0,'goldengatebridge-001','goldengatebridge-001',909,'image/jpeg',2165,'cities/goldengatebridge-001.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17953,0,'los-angeles-winter-2016','los-angeles-winter-2016',909,'image/jpeg',2165,'cities/los-angeles-winter-2016.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17954,0,'oaklandnightskylineandlakemerritt','oaklandnightskylineandlakemerritt',909,'image/jpeg',2165,'cities/oaklandnightskylineandlakemerritt.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17955,0,'favicon','favicon',910,'image/png',3110,'logo/favicon.png','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17956,0,'logo-white','logo-white',910,'image/png',18120,'logo/logo-white.png','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17957,0,'logo','logo',910,'image/png',23910,'logo/logo.png','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17958,0,'1','1',911,'image/jpeg',2165,'projects/1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17959,0,'11','11',911,'image/jpeg',2165,'projects/11.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17960,0,'12','12',911,'image/jpeg',2165,'projects/12.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17961,0,'13','13',911,'image/jpeg',2165,'projects/13.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17962,0,'14','14',911,'image/jpeg',2165,'projects/14.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17963,0,'2','2',911,'image/jpeg',2165,'projects/2.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17964,0,'21','21',911,'image/jpeg',2165,'projects/21.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17965,0,'22','22',911,'image/jpeg',2165,'projects/22.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17966,0,'23','23',911,'image/jpeg',2165,'projects/23.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17967,0,'24','24',911,'image/jpeg',2165,'projects/24.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17968,0,'25','25',911,'image/jpeg',2165,'projects/25.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17969,0,'26','26',911,'image/jpeg',2165,'projects/26.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17970,0,'3','3',911,'image/jpeg',2165,'projects/3.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17971,0,'5','5',911,'image/jpeg',2165,'projects/5.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17972,0,'1-1','1-1',912,'image/jpeg',2165,'properties/1-1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17973,0,'1-2','1-2',912,'image/jpeg',2165,'properties/1-2.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17974,0,'1-3','1-3',912,'image/jpeg',2165,'properties/1-3.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17975,0,'1','1',912,'image/jpeg',2165,'properties/1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17976,0,'10-1','10-1',912,'image/jpeg',2165,'properties/10-1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17977,0,'10','10',912,'image/jpeg',2165,'properties/10.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17978,0,'11-1','11-1',912,'image/jpeg',2165,'properties/11-1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17979,0,'11','11',912,'image/jpeg',2165,'properties/11.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17980,0,'12','12',912,'image/jpeg',2165,'properties/12.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17981,0,'13','13',912,'image/jpeg',2165,'properties/13.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17982,0,'14','14',912,'image/jpeg',2165,'properties/14.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17983,0,'15','15',912,'image/jpeg',2165,'properties/15.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17984,0,'2-1','2-1',912,'image/jpeg',2165,'properties/2-1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17985,0,'2-2','2-2',912,'image/jpeg',2165,'properties/2-2.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17986,0,'2-3','2-3',912,'image/jpeg',2165,'properties/2-3.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17987,0,'2','2',912,'image/jpeg',2165,'properties/2.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17988,0,'21','21',912,'image/jpeg',2165,'properties/21.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17989,0,'22-1','22-1',912,'image/jpeg',2165,'properties/22-1.jpg','[]','2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(17990,0,'22','22',912,'image/jpeg',2165,'properties/22.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17991,0,'23','23',912,'image/jpeg',2165,'properties/23.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17992,0,'24-1','24-1',912,'image/jpeg',2165,'properties/24-1.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17993,0,'24','24',912,'image/jpeg',2165,'properties/24.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17994,0,'3-1','3-1',912,'image/jpeg',2165,'properties/3-1.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17995,0,'3-2','3-2',912,'image/jpeg',2165,'properties/3-2.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17996,0,'3-3','3-3',912,'image/jpeg',2165,'properties/3-3.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17997,0,'3','3',912,'image/jpeg',2165,'properties/3.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17998,0,'31','31',912,'image/jpeg',2165,'properties/31.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(17999,0,'311','311',912,'image/jpeg',2165,'properties/311.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18000,0,'32','32',912,'image/jpeg',2165,'properties/32.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18001,0,'32223-43914-378','32223-43914-378',912,'image/jpeg',2165,'properties/32223-43914-378.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18002,0,'33','33',912,'image/jpeg',2165,'properties/33.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18003,0,'34','34',912,'image/jpeg',2165,'properties/34.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18004,0,'35','35',912,'image/jpeg',2165,'properties/35.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18005,0,'4-1','4-1',912,'image/jpeg',2165,'properties/4-1.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18006,0,'4-2','4-2',912,'image/jpeg',2165,'properties/4-2.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18007,0,'4','4',912,'image/jpeg',2165,'properties/4.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18008,0,'411','411',912,'image/jpeg',2165,'properties/411.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18009,0,'42','42',912,'image/jpeg',2165,'properties/42.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18010,0,'421834935dbc9ef3aaa42','421834935dbc9ef3aaa42',912,'image/jpeg',2165,'properties/421834935dbc9ef3aaa42.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18011,0,'43','43',912,'image/jpeg',2165,'properties/43.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18012,0,'44','44',912,'image/jpeg',2165,'properties/44.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18013,0,'5-1','5-1',912,'image/jpeg',2165,'properties/5-1.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18014,0,'5-2','5-2',912,'image/jpeg',2165,'properties/5-2.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18015,0,'5','5',912,'image/jpeg',2165,'properties/5.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18016,0,'6-1','6-1',912,'image/jpeg',2165,'properties/6-1.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18017,0,'6-2','6-2',912,'image/jpeg',2165,'properties/6-2.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18018,0,'6','6',912,'image/jpeg',2165,'properties/6.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18019,0,'7-1','7-1',912,'image/jpeg',2165,'properties/7-1.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18020,0,'7-2','7-2',912,'image/jpeg',2165,'properties/7-2.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18021,0,'7','7',912,'image/jpeg',2165,'properties/7.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18022,0,'71','71',912,'image/jpeg',2165,'properties/71.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18023,0,'72','72',912,'image/jpeg',2165,'properties/72.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18024,0,'73','73',912,'image/jpeg',2165,'properties/73.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18025,0,'74','74',912,'image/jpeg',2165,'properties/74.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18026,0,'75','75',912,'image/jpeg',2165,'properties/75.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18027,0,'78','78',912,'image/jpeg',2165,'properties/78.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18028,0,'79','79',912,'image/jpeg',2165,'properties/79.jpg','[]','2023-07-18 23:25:28','2023-07-18 23:25:28',NULL),(18029,0,'8-1','8-1',912,'image/jpeg',2165,'properties/8-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18030,0,'8-2','8-2',912,'image/jpeg',2165,'properties/8-2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18031,0,'8','8',912,'image/jpeg',2165,'properties/8.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18032,0,'9-1','9-1',912,'image/jpeg',2165,'properties/9-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18033,0,'9','9',912,'image/jpeg',2165,'properties/9.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18034,0,'a1-1','a1-1',912,'image/jpeg',2165,'properties/a1-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18035,0,'a1-2','a1-2',912,'image/jpeg',2165,'properties/a1-2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18036,0,'a1','a1',912,'image/jpeg',2165,'properties/a1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18037,0,'a10','a10',912,'image/jpeg',2165,'properties/a10.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18038,0,'a2-1','a2-1',912,'image/jpeg',2165,'properties/a2-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18039,0,'a2-2','a2-2',912,'image/jpeg',2165,'properties/a2-2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18040,0,'a2','a2',912,'image/jpeg',2165,'properties/a2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18041,0,'a3-1','a3-1',912,'image/jpeg',2165,'properties/a3-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18042,0,'a3-2','a3-2',912,'image/jpeg',2165,'properties/a3-2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18043,0,'a3','a3',912,'image/jpeg',2165,'properties/a3.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18044,0,'a4-1','a4-1',912,'image/jpeg',2165,'properties/a4-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18045,0,'a4-2','a4-2',912,'image/jpeg',2165,'properties/a4-2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18046,0,'a4','a4',912,'image/jpeg',2165,'properties/a4.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18047,0,'a5-1','a5-1',912,'image/jpeg',2165,'properties/a5-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18048,0,'a5','a5',912,'image/jpeg',2165,'properties/a5.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18049,0,'a6-1','a6-1',912,'image/jpeg',2165,'properties/a6-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18050,0,'a6','a6',912,'image/jpeg',2165,'properties/a6.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18051,0,'a7','a7',912,'image/jpeg',2165,'properties/a7.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18052,0,'a8','a8',912,'image/jpeg',2165,'properties/a8.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18053,0,'a9','a9',912,'image/jpeg',2165,'properties/a9.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18054,0,'b1','b1',912,'image/jpeg',2165,'properties/b1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18055,0,'b2','b2',912,'image/jpeg',2165,'properties/b2.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18056,0,'b3','b3',912,'image/jpeg',2165,'properties/b3.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18057,0,'b4-1','b4-1',912,'image/jpeg',2165,'properties/b4-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18058,0,'b4','b4',912,'image/jpeg',2165,'properties/b4.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18059,0,'b5-1','b5-1',912,'image/jpeg',2165,'properties/b5-1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18060,0,'b5','b5',912,'image/jpeg',2165,'properties/b5.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18061,0,'b6','b6',912,'image/jpeg',2165,'properties/b6.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18062,0,'download','download',912,'image/jpeg',2165,'properties/download.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18063,0,'e1','e1',912,'image/jpeg',2165,'properties/e1.jpg','[]','2023-07-18 23:25:29','2023-07-18 23:25:29',NULL),(18064,0,'e2','e2',912,'image/jpeg',2165,'properties/e2.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18065,0,'e3','e3',912,'image/jpeg',2165,'properties/e3.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18066,0,'e4','e4',912,'image/jpeg',2165,'properties/e4.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18067,0,'e5','e5',912,'image/jpeg',2165,'properties/e5.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18068,0,'e7','e7',912,'image/jpeg',2165,'properties/e7.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18069,0,'e8','e8',912,'image/jpeg',2165,'properties/e8.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18070,0,'p1','p1',912,'image/jpeg',2165,'properties/p1.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18071,0,'p2','p2',912,'image/jpeg',2165,'properties/p2.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18072,0,'property-video-thumb','property-video-thumb',912,'image/jpeg',2165,'properties/property-video-thumb.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18073,0,'q1','q1',912,'image/jpeg',2165,'properties/q1.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18074,0,'q2','q2',912,'image/jpeg',2165,'properties/q2.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18075,0,'q3','q3',912,'image/jpeg',2165,'properties/q3.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18076,0,'q6','q6',912,'image/jpeg',2165,'properties/q6.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18077,0,'q7','q7',912,'image/jpeg',2165,'properties/q7.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18078,0,'q8','q8',912,'image/jpeg',2165,'properties/q8.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18079,0,'t1','t1',912,'image/jpeg',2165,'properties/t1.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18080,0,'t2','t2',912,'image/jpeg',2165,'properties/t2.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18081,0,'t3','t3',912,'image/jpeg',2165,'properties/t3.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18082,0,'t4','t4',912,'image/jpeg',2165,'properties/t4.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18083,0,'t5','t5',912,'image/jpeg',2165,'properties/t5.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18084,0,'wp1a','wp1a',912,'image/jpeg',2165,'properties/wp1a.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL),(18085,0,'avatar','avatar',913,'image/jpeg',151486,'users/avatar.jpg','[]','2023-07-18 23:25:30','2023-07-18 23:25:30',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_parent_id_user_id_created_at_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,1,'Banners','banner',0,'2019-11-16 02:00:43','2019-11-16 02:00:50',NULL),(906,0,'accounts','accounts',0,'2023-07-18 23:25:23','2023-07-18 23:25:23',NULL),(907,0,'general','general',0,'2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(908,0,'news','news',0,'2023-07-18 23:25:25','2023-07-18 23:25:25',NULL),(909,0,'cities','cities',0,'2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(910,0,'logo','logo',0,'2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(911,0,'projects','projects',0,'2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(912,0,'properties','properties',0,'2023-07-18 23:25:27','2023-07-18 23:25:27',NULL),(913,0,'users','users',0,'2023-07-18 23:25:30','2023-07-18 23:25:30',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT '0',
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `menu_nodes_related_id_index` (`reference_id`),
  KEY `menu_nodes_index` (`parent_id`,`reference_id`,`reference_type`,`has_child`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,0,NULL,'/projects',NULL,0,'Projects',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(2,1,0,0,NULL,'/properties',NULL,0,'Properties',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(3,1,0,0,NULL,'/agents',NULL,0,'Agents',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(4,1,0,2,'Botble\\Page\\Models\\Page','/news',NULL,0,'News',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(5,1,0,0,NULL,'/careers',NULL,0,'Careers',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(6,1,0,4,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(7,2,0,3,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(8,2,0,4,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact us',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(9,2,0,0,NULL,'/careers',NULL,0,'Careers',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(10,2,0,5,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,0,'Terms & Conditions',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(11,3,0,0,NULL,'/projects',NULL,0,'All projects',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(12,3,0,0,NULL,'/properties',NULL,0,'All properties',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(13,3,0,0,NULL,'/properties?type=sale',NULL,0,'Houses for sale',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(14,3,0,0,NULL,'/properties?type=rent',NULL,0,'Houses for rent',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(15,4,0,2,'Botble\\Page\\Models\\Page','/news',NULL,0,'Latest news',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(16,4,0,2,'Botble\\Blog\\Models\\Category','/news/house-architecture',NULL,0,'House architecture',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(17,4,0,4,'Botble\\Blog\\Models\\Category','/news/house-design',NULL,0,'House design',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25'),(18,4,0,6,'Botble\\Blog\\Models\\Category','/news/building-materials',NULL,0,'Building materials',NULL,'_self',0,'2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(2,'About','about','published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3,'More information','more-information','published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(4,'News','news','published','2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int unsigned NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_content_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-17 20:34:59','2019-11-17 20:34:59'),(2,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-17 20:53:34','2019-11-17 20:53:34'),(3,3,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-17 21:09:55','2019-11-17 21:09:55'),(4,4,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-17 21:18:11','2019-11-17 21:18:11'),(5,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\PropertyFeature','2019-11-17 21:40:58','2019-11-17 21:40:58'),(6,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\PropertyFeature','2019-11-17 21:41:43','2019-11-17 21:41:43'),(7,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-18 00:34:49','2019-11-18 00:34:49'),(8,5,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 00:47:52','2019-11-18 00:47:52'),(9,6,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 01:05:58','2019-11-18 01:05:58'),(10,7,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 01:12:07','2019-11-18 01:12:07'),(11,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-18 01:28:45','2019-11-18 01:28:45'),(12,8,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 01:49:36','2019-11-18 01:49:36'),(13,9,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 02:02:19','2019-11-18 02:02:19'),(14,10,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 02:16:53','2019-11-18 02:16:53'),(15,11,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 02:22:48','2019-11-18 02:22:48'),(16,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-18 02:33:35','2019-11-18 02:33:35'),(17,12,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 02:47:05','2019-11-18 02:47:05'),(18,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-18 02:51:35','2019-11-18 02:51:35'),(19,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Tag','2019-11-18 02:51:35','2019-11-18 02:51:35'),(20,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-18 02:55:53','2019-11-18 02:55:53'),(21,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Tag','2019-11-18 02:55:53','2019-11-18 02:55:53'),(22,3,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-18 02:59:01','2019-11-18 02:59:01'),(23,4,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-18 03:07:27','2019-11-18 03:07:27'),(24,3,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Tag','2019-11-18 03:07:27','2019-11-18 03:07:27'),(25,3,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-18 03:30:34','2019-11-18 03:30:34'),(26,4,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-18 03:38:13','2019-11-18 03:38:13'),(27,5,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-18 03:45:06','2019-11-18 03:45:06'),(28,6,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-18 03:53:20','2019-11-18 03:53:20'),(29,13,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 07:23:02','2019-11-18 07:23:02'),(30,14,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 07:36:29','2019-11-18 07:36:29'),(31,15,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 07:44:44','2019-11-18 07:44:44'),(32,16,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 07:59:14','2019-11-18 07:59:14'),(33,17,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-18 08:13:07','2019-11-18 08:13:07'),(34,7,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-21 01:54:36','2019-11-21 01:54:36'),(35,8,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-21 02:28:09','2019-11-21 02:28:09'),(36,9,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-21 02:40:25','2019-11-21 02:40:25'),(37,10,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-21 02:58:55','2019-11-21 02:58:55'),(38,11,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-21 03:16:25','2019-11-21 03:16:25'),(39,12,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Project','2019-11-21 03:25:22','2019-11-21 03:25:22'),(40,18,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 05:51:54','2019-11-21 05:51:54'),(41,19,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 06:03:11','2019-11-21 06:03:11'),(42,20,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 06:12:15','2019-11-21 06:12:15'),(43,21,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 06:26:59','2019-11-21 06:26:59'),(44,22,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 06:56:50','2019-11-21 06:56:50'),(45,23,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 07:18:36','2019-11-21 07:18:36'),(46,24,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 07:26:48','2019-11-21 07:26:48'),(47,25,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 07:34:38','2019-11-21 07:34:38'),(48,26,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 07:40:46','2019-11-21 07:40:46'),(49,27,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 07:45:34','2019-11-21 07:45:34'),(52,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-21 07:49:25','2019-11-21 07:49:25'),(53,3,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-21 07:49:35','2019-11-21 07:49:35'),(54,4,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-21 07:50:02','2019-11-21 07:50:02'),(55,5,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-21 07:50:17','2019-11-21 07:50:17'),(56,6,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-21 07:50:36','2019-11-21 07:50:36'),(57,7,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-21 07:50:58','2019-11-21 07:50:58'),(58,28,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 19:53:17','2019-11-21 19:53:17'),(59,29,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-21 19:59:16','2019-11-21 19:59:16'),(60,30,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-22 00:29:01','2019-11-22 00:29:01'),(61,31,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-22 00:42:28','2019-11-22 00:42:28'),(62,32,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-22 00:47:18','2019-11-22 00:47:18'),(63,33,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-22 00:57:15','2019-11-22 00:57:15'),(64,34,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\RealEstate\\Models\\Property','2019-11-22 01:06:09','2019-11-22 01:06:09'),(65,8,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Category','2019-11-22 01:26:08','2019-11-22 01:26:08'),(66,5,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-22 01:26:31','2019-11-22 01:26:31'),(67,6,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-22 01:29:45','2019-11-22 01:29:45'),(68,7,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-22 01:33:23','2019-11-22 01:33:23'),(69,8,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Blog\\Models\\Post','2019-11-22 01:39:38','2019-11-22 01:39:38'),(74,1,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Career\\Models\\Career','2019-11-30 19:43:10','2019-11-30 19:43:10'),(75,2,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Career\\Models\\Career','2019-11-30 19:49:07','2019-11-30 19:49:07'),(76,3,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Career\\Models\\Career','2019-11-30 19:52:42','2019-11-30 19:52:42'),(77,4,'seo_meta','[{\"seo_title\":null,\"seo_description\":null}]','Botble\\Career\\Models\\Career','2019-11-30 19:56:50','2019-11-30 19:56:50'),(80,2,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(81,4,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(82,6,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(83,8,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(84,10,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(85,12,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(86,14,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(87,16,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(88,18,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(89,20,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(90,22,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(91,24,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(92,26,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(93,28,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(94,30,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(95,32,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(96,34,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Property','2021-04-29 20:46:36','2021-04-29 20:46:36'),(97,2,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Project','2021-04-29 20:46:36','2021-04-29 20:46:36'),(98,4,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Project','2021-04-29 20:46:36','2021-04-29 20:46:36'),(99,6,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Project','2021-04-29 20:46:36','2021-04-29 20:46:36'),(100,8,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Project','2021-04-29 20:46:36','2021-04-29 20:46:36'),(101,10,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Project','2021-04-29 20:46:36','2021-04-29 20:46:36'),(102,12,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]','Botble\\RealEstate\\Models\\Project','2021-04-29 20:46:36','2021-04-29 20:46:36'),(103,1,'subscribed_packaged_id','[2]','Botble\\Payment\\Models\\Payment','2022-12-27 20:03:55','2022-12-27 20:03:55');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_01_000001_create_oauth_auth_codes_table',1),(6,'2016_06_01_000002_create_oauth_access_tokens_table',1),(7,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(8,'2016_06_01_000004_create_oauth_clients_table',1),(9,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(10,'2016_06_10_230148_create_acl_tables',1),(11,'2016_06_14_230857_create_menus_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_05_074239_create_setting_table',1),(14,'2016_11_28_032840_create_dashboard_widget_tables',1),(15,'2016_12_16_084601_create_widgets_table',1),(16,'2017_05_09_070343_create_media_tables',1),(17,'2017_11_03_070450_create_slug_table',1),(18,'2019_07_15_042406_change_site_title_from_settings_to_theme_options',1),(19,'2019_08_13_033145_remove_unused_columns_in_users_table',1),(20,'2019_08_19_000000_create_failed_jobs_table',1),(21,'2019_09_07_030654_update_menu_nodes_table',1),(22,'2019_09_07_045041_update_slugs_table',1),(23,'2019_09_07_050405_update_slug_reference_for_page',1),(24,'2019_09_08_014859_update_meta_boxes_table',1),(25,'2019_09_08_015629_update_meta_box_data_for_page',1),(26,'2019_09_12_073711_update_media_url',1),(27,'2019_09_12_073711_update_media_url_for_current_data',1),(28,'2019_10_20_002256_remove_parent_id_in_pages_table',1),(31,'2018_06_22_032304_create_real_estate_table',2),(32,'2015_06_29_025744_create_audit_history',3),(33,'2015_06_18_033822_create_blog_table',4),(34,'2019_09_07_035526_update_menu_node_reference_type_for_category',4),(35,'2019_09_07_050058_update_slug_reference_for_blog',4),(36,'2019_09_07_155716_update_language_meta_for_blog',4),(37,'2019_09_08_015552_update_meta_box_data_for_blog',4),(38,'2019_10_20_002342_remove_parent_id_in_tags_table',4),(39,'2016_10_03_032336_create_languages_table',5),(40,'2019_09_07_154718_update_lang_meta_table',5),(42,'2016_06_17_091537_create_contacts_table',7),(43,'2015_08_15_122343_create_notes_table',8),(44,'2019_11_18_035125_add_column_type_into_re_properties_table',9),(45,'2019_11_18_035712_create_investor_table',9),(46,'2019_11_18_040153_update_real_estates_table',9),(47,'2019_11_18_041228_drop_table_re_property_categories',10),(48,'2019_11_18_082146_create_currencies_table',11),(49,'2019_11_18_061011_create_country_table',12),(50,'2019_11_18_061730_create_state_table',12),(51,'2019_11_18_062515_create_city_table',12),(52,'2019_11_19_063851_create_project_features_table',13),(53,'2019_11_21_090830_update_project_and_property_table',14),(54,'2019_11_21_130139_add_price_to_projects_table',15),(55,'2019_11_14_210650_create_consults_table',16),(56,'2019_11_26_024326_update_property_type',17),(57,'2019_06_24_211801_create_career_table',18),(58,'2019_12_03_123314_add_column_slug_into_cities_table',19),(59,'2019_12_03_124417_add_column_city_id_into_table_properties_and_projects',19),(60,'2017_05_18_080441_create_payment_tables',20),(61,'2019_12_10_140938_create_vendor_table',20),(62,'2019_12_15_025938_update_column_images_in_real_estate_tables',20),(63,'2019_12_17_064316_add_column_period_to_table_re_properties',20),(64,'2019_12_24_033049_add_column_author_into_re_properties_table',20),(65,'2019_12_24_083810_vendor_create_package_table',20),(66,'2019_12_27_004653_update_vendors_table_with_package_data',20),(68,'2020_01_08_002704_real_estate_create_type_table',21),(69,'2020_01_10_133700_change_re_types_to_re_categories',22),(70,'2016_10_07_193005_create_translations_table',23),(71,'2020_01_23_133752_update_account_tables',24),(72,'2020_02_03_144309_update_column_payment_channel',25),(73,'2020_02_06_143217_update_vendor_table',26),(74,'2020_02_11_133026_add_description_to_table_payments',27),(75,'2020_02_11_140823_create_transactions_table',27),(76,'2020_02_23_111922_fix_column_number_block_in_re_properties_table',27),(77,'2020_03_24_151004_add_moderation_status_into_properties_table',28),(78,'2020_03_25_030953_create_table_vendor_packages',29),(79,'2020_03_25_083610_add_column_expire_date_into_re_properties_table',30),(80,'2020_03_26_081108_add_column_auto_renew_to_re_properties_table',31),(81,'2020_03_16_072752_add_column_abbreviation_to_states_table',32),(82,'2020_03_28_020724_make_column_user_id_nullable_table_revisions',33),(83,'2020_03_23_093053_update_payments_table',34),(84,'2020_04_22_074304_add_column_never_expired_to_re_properties_table',35),(85,'2020_05_26_014304_add_column_provider_to_oauth_clients_table',36),(86,'2020_07_27_085437_add_icon_to_re_features',37),(90,'2020_08_21_102728_real_estate_create_facility_table',38),(91,'2020_08_22_024455_rename_table_for_accounts',39),(92,'2020_08_26_130439_add_column_username_into_table_re_accounts',40),(93,'2020_09_09_110653_update_table_careers',41),(94,'2020_09_15_111419_fix_old_data_for_re_properties',42),(95,'2020_10_05_030817_make_column_charge_id_nullable',43),(96,'2020_10_18_134416_fix_audit_logs_table',44),(97,'2020_10_24_133432_change_column_distance_to_string',45),(99,'2020_10_31_053746_add_column_description_into_re_categories_table',46),(100,'2019_01_05_053554_create_jobs_table',47),(101,'2020_12_05_112556_change_contact_page_to_a_page',48),(102,'2021_02_11_031126_update_price_column_in_projects_and_properties',49),(103,'2021_02_16_092633_remove_default_value_for_author_type',50),(104,'2021_03_08_024049_add_lat_long_into_real_estate_tables',51),(105,'2021_03_27_144913_add_customer_type_into_table_payments',52),(106,'2021_05_24_034720_make_column_currency_nullable',53),(107,'2021_06_10_091950_add_column_is_featured_to_table_re_accounts',54),(108,'2021_07_07_021757_update_table_account_activity_logs',55),(109,'2021_07_18_101839_fix_old_theme_options',56),(110,'2021_08_05_134214_fix_social_link_theme_options',57),(111,'2021_08_09_161302_add_metadata_column_to_payments_table',58),(112,'2021_09_29_042758_create_re_categories_multilevel_table',59),(113,'2021_10_19_020859_update_metadata_field',60),(114,'2021_10_31_031254_add_company_to_accounts_table',61),(115,'2021_10_25_021023_fix-priority-load-for-language-advanced',62),(116,'2021_12_03_030600_create_blog_translations',62),(117,'2021_12_03_075608_create_page_translations',62),(118,'2021_12_03_084118_create_location_translations',62),(119,'2021_12_03_094518_migrate_old_location_data',62),(120,'2021_12_04_095357_create_careers_translations_table',62),(121,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',63),(122,'2021_12_10_034807_create_real_estate_translation_tables',64),(123,'2021_12_18_081636_add_property_project_views_count',65),(124,'2022_01_16_085908_improve_plugin_location',66),(125,'2022_04_19_113923_add_index_to_table_posts',67),(126,'2022_04_20_100851_add_index_to_media_table',67),(127,'2022_04_20_101046_add_index_to_menu_table',67),(128,'2022_05_03_033044_update_column_images_in_real_estate_tables',68),(129,'2022_05_04_033044_update_column_images_in_real_estate_tables',69),(130,'2022_06_04_033634_improve_homepage_content',70),(131,'2022_06_28_151901_activate_paypal_stripe_plugin',71),(132,'2022_07_02_081723_fix_expired_date_column',71),(133,'2019_12_14_000001_create_personal_access_tokens_table',72),(134,'2022_07_07_153354_update_charge_id_in_table_payments',72),(135,'2022_07_10_034813_move_lang_folder_to_root',72),(136,'2022_08_01_090213_update_table_properties_and_projects',72),(137,'2022_08_04_051940_add_missing_column_expires_at',72),(138,'2022_08_04_052122_delete_location_backup_tables',72),(139,'2022_10_14_024629_drop_column_is_featured',73),(140,'2022_10_29_065232_increase_states_abbreviation_column',74),(141,'2022_11_06_061847_increase_state_translations_abbreviation_column',75),(142,'2022_11_06_070405_improve_homepage_search_box',75),(143,'2022_11_18_063357_add_missing_timestamp_in_table_settings',76),(144,'2022_12_02_093615_update_slug_index_columns',76),(145,'2022_09_01_000001_create_admin_notifications_tables',77),(146,'2023_01_30_024431_add_alt_to_media_table',78),(147,'2023_01_31_023233_create_re_custom_fields_table',79),(148,'2023_02_06_000000_add_location_to_re_accounts_table',79),(149,'2023_02_06_024257_add_package_translations',79),(150,'2023_02_08_062457_add_custom_fields_translation_table',80),(151,'2014_10_12_100000_create_password_reset_tokens_table',81),(152,'2023_02_15_024644_create_re_reviews_table',81),(153,'2023_02_16_042611_drop_table_password_resets',81),(154,'2023_02_20_072604_create_re_invoices_table',82),(155,'2023_02_20_081251_create_re_account_packages_table',82),(156,'2023_04_04_030709_add_unique_id_to_properties_and_projects_table',83),(157,'2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable',84),(158,'2023_04_23_005903_add_column_permissions_to_admin_notifications',84),(159,'2023_04_23_061847_increase_state_translations_abbreviation_column',84),(160,'2023_05_08_114004_improve_properties_and_projects_page',85),(161,'2023_05_09_062031_unique_reviews_table',85),(162,'2023_05_10_075124_drop_column_id_in_role_users_table',85),(163,'2023_05_26_034353_fix_properties_projects_image',86),(164,'2023_05_27_004215_add_column_ip_into_table_re_consults',86);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_user_id_index` (`user_id`),
  KEY `notes_reference_id_index` (`reference_id`),
  KEY `notes_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','<div>[search-box title=\"Find your favorite homes at Flex Home\" background_image=\"general/home-banner.jpg\" enable_search_projects_on_homepage_search=\"yes\" default_home_search_type=\"project\"][/search-box]</div><div>[featured-projects title=\"Featured projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"4\"][/featured-projects]</div><div>[properties-by-locations title=\"Properties by locations\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" limit=\"10\"][/properties-by-locations]</div><div>[properties-for-sale title=\"Properties For Sale\" subtitle=\"Below is a list of properties that are currently up for sale\" limit=\"8\"][/properties-for-sale]</div><div>[properties-for-rent title=\"Properties For Rent\" subtitle=\"Below is a detailed price list of each property for rent\" limit=\"8\"][/properties-for-rent]</div><div>[featured-agents title=\"Featured Agents\"][/featured-agents]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"8\"][/recently-viewed-properties]</div><div>[latest-news title=\"News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"4\"][/latest-news]</div>',1,NULL,'homepage',NULL,'published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(2,'News','---',1,NULL,'default',NULL,'published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3,'About us','<h4><span style=\"font-size:18px;\"><b>1. COMPANY</b><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong> PROFILE</strong></span></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.<br />\nWith the slogan &quot;Breaking time, through space&quot; with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field. Real estate, bringing people closer together, over the distance of time and space, is a reliable place for real estate investment - an area that is constantly evolving over time.</span></span></p>\n\n<blockquote>\n<h2 style=\"font-style: italic; text-align: center;\"><span style=\"font-size:24px;\"><strong><span style=\"font-family:Arial,Helvetica,sans-serif;\"><span style=\"color:#16a085;\">&quot;Breaking time, through space&quot;</span></span></strong></span></h2>\n</blockquote>\n\n<h4 style=\"text-align: center;\"><img alt=\"\" src=\"https://flex-home.test/storage/general/asset-3-at-3x.png\" style=\"width: 90%;\" /></h4>\n\n<h4><span style=\"font-size:18px;\"><b><font face=\"Arial, Helvetica, sans-serif\">2. VISION&nbsp;</font></b></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Acquiring domestic areas.<br />\n- Reaching far across continents.</span></span></p>\n\n<h4><span style=\"font-size:18px;\"><b>3. MISSION</b></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Creating the community<br />\n- Building destinations<br />\n- Nurture happiness</span></span></p>\n\n<p><img alt=\"\" src=\"https://flex-home.test/storage/general/vietnam-office-4.jpg\" /></p>\n',1,NULL,'default','Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.\nWith the slogan \"Breaking time, through space\" with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field.','published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(4,'Contact','<p>[contact-form][/contact-form]<br />\n&nbsp;</p>\n\n<h3>Directions</h3>\n\n<p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p>\n\n<p>&nbsp;</p>',1,NULL,'default',NULL,'published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(5,'Terms &amp; Conditions','<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Access to and use of the Flex Home website is subject to the following terms, conditions, and relevant laws of Vietnam.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>1. Copyright</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes, providing information or personal purposes. </span></span><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Any content from this site may not be used for sale or distribution for profit, nor may it be edited or included in any other publication or website.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>2. Content</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">The information on this website is compiled with great confidence but for general information research purposes only. While we endeavor to maintain updated and accurate information, we make no representations or warranties in any manner regarding completeness, accuracy, reliability, appropriateness or availability in relation to web site, or related information, product, service, or image within the website for any purpose. </span></span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Flex Home and its employees, managers, and agents are not responsible for any loss, damage or expense incurred as a result of accessing and using this website and the sites. </span></span><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">The web is connected to it, including but not limited to, loss of profits, direct or indirect losses. We are also not responsible, or jointly responsible, if the site is temporarily inaccessible due to technical issues beyond our control. Any comments, suggestions, images, ideas and other information or materials that users submit to us through this site will become our exclusive property, including the right to may arise in the future associated with us.</span></span></p>\n\n<p style=\"text-align: center;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><img alt=\"\" src=\"https://flex-home.test/storage/general/copyright.jpg\" style=\"width: 90%;\" /></span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>3. Note on&nbsp;connected sites</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">At many points in the website, users can get links to other websites related to a specific aspect. This does not mean that we are related to the websites or companies that own these websites. Although we intend to connect users to sites of interest, we are not responsible or jointly responsible for our employees, managers, or representatives. with other websites and information contained therein.</span></span></p>\n',1,NULL,'default','Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes.','published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(6,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(7,'Properties','<div>[properties-list title=\"Discover our properties\" description=\"Discover our properties\" description=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" number_of_properties_per_page=\"12\"][/properties-list]</div>',1,NULL,'homepage',NULL,'published','2023-07-18 23:25:25','2023-07-18 23:25:25'),(8,'Projects','<div>[projects-list  title=\"Discover our projects\" description=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more\" number_of_projects_per_page=\"12\"][/projects-list]</div>',1,NULL,'homepage',NULL,'published','2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(15,2) unsigned NOT NULL,
  `currency` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,250.00,'USD',0,'AS2MND60W6','bank_transfer','2022-12-27 20:03:55','2022-12-27 20:03:55',NULL,2,'pending','confirm',1,NULL,NULL,'Botble\\RealEstate\\Models\\Account',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1777 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (5,1,2),(11,1,1),(14,1,3),(16,1,4),(17,4,9),(18,4,10),(19,2,11),(20,6,12),(21,4,13),(22,4,14),(23,4,15),(24,6,16),(25,6,17),(26,6,18),(27,6,19),(28,1,20),(29,1,21),(30,4,22),(31,6,23),(32,2,24),(33,5,25),(34,5,26),(35,5,27),(36,5,28),(37,3,29),(38,3,30),(39,7,31),(40,8,32),(41,8,33),(42,8,34),(43,7,35),(44,3,36),(45,7,37),(46,7,38),(47,7,39),(48,3,40),(49,1,41),(50,6,42),(51,1,43),(52,6,44),(53,1,45),(54,2,46),(55,2,47),(56,6,48),(57,1,49),(58,1,50),(59,6,51),(60,2,52),(61,6,53),(62,1,54),(63,2,55),(64,6,56),(65,2,57),(66,6,58),(67,1,59),(68,4,60),(69,2,61),(70,6,62),(71,6,63),(72,2,64),(73,4,65),(74,4,66),(75,6,67),(76,6,68),(77,6,69),(78,4,70),(79,6,71),(80,1,72),(81,2,73),(82,6,74),(83,4,75),(84,4,76),(85,1,77),(86,1,78),(87,4,79),(88,2,80),(89,2,81),(90,2,82),(91,1,83),(92,1,84),(93,6,85),(94,4,86),(95,1,87),(96,2,88),(97,4,89),(98,4,90),(99,1,91),(100,4,92),(101,6,93),(102,2,94),(103,1,95),(104,1,96),(105,6,97),(106,1,98),(107,4,99),(108,4,100),(109,6,101),(110,2,102),(111,2,103),(112,4,104),(113,6,105),(114,6,106),(115,4,107),(116,6,108),(117,1,109),(118,6,110),(119,4,111),(120,4,112),(121,1,113),(122,1,114),(123,6,115),(124,4,116),(125,1,117),(126,6,118),(127,1,119),(128,2,120),(129,4,121),(130,4,122),(131,2,123),(132,6,124),(133,6,125),(134,4,126),(135,6,127),(136,4,128),(137,4,129),(138,6,130),(139,2,131),(140,6,132),(141,2,133),(142,1,134),(143,2,135),(144,1,136),(145,1,137),(146,4,138),(147,1,139),(148,1,140),(149,4,141),(150,2,142),(151,2,143),(152,4,144),(153,2,145),(154,1,146),(155,2,147),(156,2,148),(157,6,149),(158,6,150),(159,2,151),(160,4,152),(161,2,153),(162,1,154),(163,2,155),(164,2,156),(165,4,157),(166,1,158),(167,4,159),(168,4,160),(169,4,161),(170,6,162),(171,1,163),(172,4,164),(173,2,165),(174,1,166),(175,4,167),(176,1,168),(177,1,169),(178,4,170),(179,6,171),(180,4,172),(181,6,173),(182,1,174),(183,6,175),(184,2,176),(185,4,177),(186,2,178),(187,1,179),(188,4,180),(189,4,181),(190,6,182),(191,6,183),(192,4,184),(193,6,185),(194,6,186),(195,6,187),(196,2,188),(197,2,189),(198,6,190),(199,6,191),(200,4,192),(201,6,193),(202,1,194),(203,6,195),(204,4,196),(205,1,197),(206,4,198),(207,1,199),(208,4,200),(209,4,201),(210,4,202),(211,6,203),(212,2,204),(213,2,205),(214,4,206),(215,6,207),(216,2,208),(217,2,209),(218,1,210),(219,1,211),(220,4,212),(221,1,213),(222,1,214),(223,6,215),(224,4,216),(225,1,217),(226,1,218),(227,2,219),(228,4,220),(229,6,221),(230,1,222),(231,1,223),(232,4,224),(233,6,225),(234,1,226),(235,1,227),(236,4,228),(237,2,229),(238,1,230),(239,6,231),(240,2,232),(241,1,233),(242,1,234),(243,2,235),(244,1,236),(245,1,237),(246,4,238),(247,1,239),(248,4,240),(249,4,241),(250,4,242),(251,6,243),(252,6,244),(253,1,245),(254,6,246),(255,4,247),(256,1,248),(257,6,249),(258,4,250),(259,4,251),(260,2,252),(261,6,253),(262,4,254),(263,2,255),(264,6,256),(265,2,257),(266,1,258),(267,4,259),(268,1,260),(269,1,261),(270,6,262),(271,1,263),(272,4,264),(273,6,265),(274,6,266),(275,4,267),(276,2,268),(277,6,269),(278,6,270),(279,1,271),(280,2,272),(281,2,273),(282,6,274),(283,6,275),(284,4,276),(285,1,277),(286,1,278),(287,1,279),(288,1,280),(289,6,281),(290,4,282),(291,6,283),(292,4,284),(293,1,285),(294,2,286),(295,2,287),(296,1,288),(297,4,289),(298,4,290),(299,1,291),(300,6,292),(301,1,293),(302,2,294),(303,6,295),(304,4,296),(305,4,297),(306,6,298),(307,1,299),(308,4,300),(309,1,301),(310,2,302),(311,6,303),(312,1,304),(313,4,305),(314,1,306),(315,1,307),(316,6,308),(317,2,309),(318,1,310),(319,2,311),(320,1,312),(321,4,313),(322,1,314),(323,6,315),(324,2,316),(325,1,317),(326,6,318),(327,2,319),(328,1,320),(329,2,321),(330,4,322),(331,6,323),(332,6,324),(333,2,325),(334,2,326),(335,6,327),(336,4,328),(337,4,329),(338,2,330),(339,4,331),(340,2,332),(341,1,333),(342,6,334),(343,4,335),(344,4,336),(345,2,337),(346,6,338),(347,6,339),(348,2,340),(349,6,341),(350,2,342),(351,2,343),(352,2,344),(353,4,345),(354,4,346),(355,1,347),(356,6,348),(357,6,349),(358,2,350),(359,4,351),(360,2,352),(361,6,353),(362,2,354),(363,2,355),(364,2,356),(365,4,357),(366,6,358),(367,1,359),(368,2,360),(369,6,361),(370,1,362),(371,4,363),(372,6,364),(373,1,365),(374,6,366),(375,1,367),(376,2,368),(377,6,369),(378,1,370),(379,2,371),(380,6,372),(381,2,373),(382,1,374),(383,1,375),(384,1,376),(385,6,377),(386,6,378),(387,4,379),(388,4,380),(389,1,381),(390,2,382),(391,6,383),(392,1,384),(393,2,385),(394,4,386),(395,1,387),(396,4,388),(397,4,389),(398,1,390),(399,6,391),(400,2,392),(401,4,393),(402,2,394),(403,1,395),(404,6,396),(405,6,397),(406,1,398),(407,1,399),(408,6,400),(409,1,401),(410,2,402),(411,2,403),(412,6,404),(413,4,405),(414,2,406),(415,4,407),(416,4,408),(417,4,409),(418,4,410),(419,4,411),(420,1,412),(421,4,413),(422,6,414),(423,1,415),(424,1,416),(425,6,417),(426,4,418),(427,2,419),(428,4,420),(429,1,421),(430,1,422),(431,6,423),(432,1,424),(433,4,425),(434,4,426),(435,4,427),(436,2,428),(437,6,429),(438,2,430),(439,6,431),(440,2,432),(441,4,433),(442,4,434),(443,2,435),(444,6,436),(445,4,437),(446,1,438),(447,2,439),(448,4,440),(449,4,441),(450,6,442),(451,6,443),(452,6,444),(453,2,445),(454,6,446),(455,4,447),(456,6,448),(457,2,449),(458,1,450),(459,2,451),(460,1,452),(461,1,453),(462,4,454),(463,2,455),(464,1,456),(465,4,457),(466,1,458),(467,4,459),(468,1,460),(469,2,461),(470,4,462),(471,4,463),(472,2,464),(473,6,465),(474,2,466),(475,2,467),(476,4,468),(477,2,469),(478,2,470),(479,2,471),(480,2,472),(481,1,473),(482,1,474),(483,1,475),(484,1,476),(485,1,477),(486,6,478),(487,2,479),(488,4,480),(489,1,481),(490,6,482),(491,1,483),(492,4,484),(493,2,485),(494,2,486),(495,1,487),(496,1,488),(497,4,489),(498,6,490),(499,4,491),(500,4,492),(501,1,493),(502,1,494),(503,4,495),(504,6,496),(505,6,497),(506,2,498),(507,6,499),(508,2,500),(509,2,501),(510,2,502),(511,6,503),(512,4,504),(513,6,505),(514,4,506),(515,1,507),(516,6,508),(517,6,509),(518,6,510),(519,4,511),(520,1,512),(521,1,513),(522,2,514),(523,2,515),(524,1,516),(525,4,517),(526,1,518),(527,4,519),(528,1,520),(529,1,521),(530,4,522),(531,2,523),(532,6,524),(533,1,525),(534,1,526),(535,6,527),(536,1,528),(537,1,529),(538,2,530),(539,4,531),(540,2,532),(541,1,533),(542,2,534),(543,6,535),(544,1,536),(545,2,537),(546,2,538),(547,1,539),(548,4,540),(549,2,541),(550,1,542),(551,6,543),(552,6,544),(553,2,545),(554,1,546),(555,2,547),(556,6,548),(557,4,549),(558,6,550),(559,6,551),(560,6,552),(561,4,553),(562,2,554),(563,2,555),(564,2,556),(565,2,557),(566,1,558),(567,1,559),(568,2,560),(569,2,561),(570,1,562),(571,1,563),(572,2,564),(573,1,565),(574,4,566),(575,2,567),(576,6,568),(577,4,569),(578,1,570),(579,6,571),(580,4,572),(581,4,573),(582,4,574),(583,1,575),(584,4,576),(585,1,577),(586,4,578),(587,1,579),(588,1,580),(589,1,581),(590,6,582),(591,4,583),(592,2,584),(593,6,585),(594,2,586),(595,4,587),(596,6,588),(597,6,589),(598,1,590),(599,1,591),(600,6,592),(601,1,593),(602,2,594),(603,1,595),(604,4,596),(605,1,597),(606,1,598),(607,6,599),(608,4,600),(609,1,601),(610,1,602),(611,4,603),(612,6,604),(613,6,605),(614,6,606),(615,1,607),(616,4,608),(617,1,609),(618,1,610),(619,1,611),(620,2,612),(621,4,613),(622,4,614),(623,1,615),(624,1,616),(625,1,617),(626,2,618),(627,4,619),(628,1,620),(629,4,621),(630,4,622),(631,2,623),(632,2,624),(633,4,625),(634,1,626),(635,4,627),(636,2,628),(637,6,629),(638,2,630),(639,4,631),(640,2,632),(641,1,633),(642,2,634),(643,4,635),(644,6,636),(645,4,637),(646,2,638),(647,1,639),(648,6,640),(649,4,641),(650,1,642),(651,4,643),(652,1,644),(653,2,645),(654,2,646),(655,4,647),(656,4,648),(657,2,649),(658,6,650),(659,2,651),(660,4,652),(661,2,653),(662,6,654),(663,4,655),(664,2,656),(665,6,657),(666,2,658),(667,1,659),(668,2,660),(669,6,661),(670,4,662),(671,1,663),(672,2,664),(673,2,665),(674,1,666),(675,2,667),(676,4,668),(677,4,669),(678,6,670),(679,6,671),(680,2,672),(681,1,673),(682,2,674),(683,2,675),(684,6,676),(685,2,677),(686,1,678),(687,1,679),(688,4,680),(689,2,681),(690,2,682),(691,4,683),(692,4,684),(693,4,685),(694,1,686),(695,1,687),(696,4,688),(697,6,689),(698,6,690),(699,6,691),(700,1,692),(701,6,693),(702,1,694),(703,4,695),(704,6,696),(705,2,697),(706,2,698),(707,6,699),(708,1,700),(709,6,701),(710,2,702),(711,1,703),(712,6,704),(713,1,705),(714,4,706),(715,4,707),(716,4,708),(717,1,709),(718,1,710),(719,1,711),(720,1,712),(721,4,713),(722,4,714),(723,4,715),(724,4,716),(725,6,717),(726,6,718),(727,2,719),(728,6,720),(729,1,721),(730,2,722),(731,6,723),(732,1,724),(733,6,725),(734,6,726),(735,4,727),(736,4,728),(737,4,729),(738,2,730),(739,1,731),(740,2,732),(741,2,733),(742,6,734),(743,1,735),(744,1,736),(745,6,737),(746,1,738),(747,1,739),(748,2,740),(749,4,741),(750,4,742),(751,4,743),(752,6,744),(753,4,745),(754,6,746),(755,4,747),(756,4,748),(757,6,749),(758,1,750),(759,1,751),(760,2,752),(761,2,753),(762,2,754),(763,6,755),(764,6,756),(765,4,757),(766,2,758),(767,6,759),(768,1,760),(769,1,761),(770,4,762),(771,2,763),(772,2,764),(773,6,765),(774,2,766),(775,1,767),(776,6,768),(777,4,769),(778,1,770),(779,1,771),(780,1,772),(781,1,773),(782,6,774),(783,1,775),(784,1,776),(785,6,777),(786,4,778),(787,6,779),(788,4,780),(789,6,781),(790,6,782),(791,1,783),(792,6,784),(793,2,785),(794,1,786),(795,6,787),(796,1,788),(797,1,789),(798,2,790),(799,1,791),(800,4,792),(801,2,793),(802,1,794),(803,6,795),(804,4,796),(805,2,797),(806,4,798),(807,2,799),(808,4,800),(809,2,801),(810,4,802),(811,4,803),(812,6,804),(813,2,805),(814,2,806),(815,2,807),(816,6,808),(817,4,809),(818,4,810),(819,6,811),(820,2,812),(821,2,813),(822,6,814),(823,4,815),(824,6,816),(825,4,817),(826,4,818),(827,6,819),(828,4,820),(829,4,821),(830,1,822),(831,6,823),(832,6,824),(833,4,825),(834,6,826),(835,1,827),(836,6,828),(837,2,829),(838,6,830),(839,2,831),(840,1,832),(841,2,833),(842,2,834),(843,2,835),(844,6,836),(845,2,837),(846,6,838),(847,1,839),(848,4,840),(849,2,841),(850,4,842),(851,6,843),(852,6,844),(853,4,845),(854,1,846),(855,2,847),(856,2,848),(857,1,849),(858,1,850),(859,1,851),(860,2,852),(861,6,853),(862,1,854),(863,2,855),(864,6,856),(865,6,857),(866,2,858),(867,2,859),(868,4,860),(869,2,861),(870,4,862),(871,6,863),(872,2,864),(873,2,865),(874,2,866),(875,1,867),(876,2,868),(877,1,869),(878,6,870),(879,6,871),(880,4,872),(881,2,873),(882,6,874),(883,4,875),(884,1,876),(885,4,877),(886,6,878),(887,6,879),(888,1,880),(889,6,881),(890,1,882),(891,4,883),(892,6,884),(893,1,885),(894,2,886),(895,1,887),(896,2,888),(897,1,889),(898,4,890),(899,2,891),(900,1,892),(901,4,893),(902,6,894),(903,2,895),(904,4,896),(905,1,897),(906,4,898),(907,1,899),(908,6,900),(909,6,901),(910,6,902),(911,1,903),(912,1,904),(913,6,905),(914,4,906),(915,2,907),(916,2,908),(917,2,909),(918,6,910),(919,2,911),(920,4,912),(921,4,913),(922,1,914),(923,2,915),(924,4,916),(925,2,917),(926,2,918),(927,4,919),(928,2,920),(929,6,921),(930,1,922),(931,1,923),(932,4,924),(933,1,925),(934,1,926),(935,6,927),(936,2,928),(937,1,929),(938,6,930),(939,1,931),(940,4,932),(941,2,933),(942,4,934),(943,2,935),(944,2,936),(945,1,937),(946,1,938),(947,4,939),(948,4,940),(949,6,941),(950,6,942),(951,2,943),(952,6,944),(953,4,945),(954,1,946),(955,2,947),(956,6,948),(957,6,949),(958,2,950),(959,1,951),(960,4,952),(961,6,953),(962,2,954),(963,4,955),(964,4,956),(965,6,957),(966,4,958),(967,2,959),(968,1,960),(969,6,961),(970,6,962),(971,4,963),(972,4,964),(973,6,965),(974,4,966),(975,6,967),(976,6,968),(977,4,969),(978,4,970),(979,2,971),(980,1,972),(981,2,973),(982,6,974),(983,1,975),(984,2,976),(985,1,977),(986,4,978),(987,2,979),(988,4,980),(989,6,981),(990,1,982),(991,4,983),(992,4,984),(993,4,985),(994,1,986),(995,2,987),(996,4,988),(997,4,989),(998,6,990),(999,6,991),(1000,2,992),(1001,4,993),(1002,6,994),(1003,6,995),(1004,2,996),(1005,2,997),(1006,1,998),(1007,2,999),(1008,1,1000),(1009,2,1001),(1010,2,1002),(1011,1,1003),(1012,2,1004),(1013,6,1005),(1014,6,1006),(1015,1,1007),(1016,1,1008),(1017,4,1009),(1018,4,1010),(1019,4,1011),(1020,4,1012),(1021,1,1013),(1022,4,1014),(1023,1,1015),(1024,1,1016),(1025,6,1017),(1026,1,1018),(1027,4,1019),(1028,1,1020),(1029,2,1021),(1030,2,1022),(1031,2,1023),(1032,4,1024),(1033,1,1025),(1034,4,1026),(1035,1,1027),(1036,1,1028),(1037,2,1029),(1038,2,1030),(1039,4,1031),(1040,4,1032),(1041,2,1033),(1042,1,1034),(1043,2,1035),(1044,4,1036),(1045,2,1037),(1046,4,1038),(1047,4,1039),(1048,1,1040),(1049,4,1041),(1050,6,1042),(1051,4,1043),(1052,1,1044),(1053,1,1045),(1054,6,1046),(1055,6,1047),(1056,2,1048),(1057,2,1049),(1058,1,1050),(1059,2,1051),(1060,4,1052),(1061,2,1053),(1062,1,1054),(1063,4,1055),(1064,2,1056),(1065,6,1057),(1066,1,1058),(1067,4,1059),(1068,1,1060),(1069,1,1061),(1070,2,1062),(1071,1,1063),(1072,2,1064),(1073,2,1065),(1074,1,1066),(1075,2,1067),(1076,4,1068),(1077,6,1069),(1078,4,1070),(1079,2,1071),(1080,4,1072),(1081,1,1073),(1082,2,1074),(1083,1,1075),(1084,6,1076),(1085,6,1077),(1086,2,1078),(1087,1,1079),(1088,4,1080),(1089,2,1081),(1090,1,1082),(1091,6,1083),(1092,6,1084),(1093,4,1085),(1094,1,1086),(1095,1,1087),(1096,6,1088),(1097,6,1089),(1098,6,1090),(1099,1,1091),(1100,4,1092),(1101,2,1093),(1102,4,1094),(1103,1,1095),(1104,6,1096),(1105,1,1097),(1106,6,1098),(1107,6,1099),(1108,6,1100),(1109,2,1101),(1110,1,1102),(1111,2,1103),(1112,6,1104),(1113,6,1105),(1114,4,1106),(1115,1,1107),(1116,4,1108),(1117,4,1109),(1118,6,1110),(1119,6,1111),(1120,1,1112),(1121,2,1113),(1122,2,1114),(1123,4,1115),(1124,4,1116),(1125,4,1117),(1126,2,1118),(1127,4,1119),(1128,2,1120),(1129,4,1121),(1130,4,1122),(1131,2,1123),(1132,1,1124),(1133,4,1125),(1134,1,1126),(1135,4,1127),(1136,6,1128),(1137,1,1129),(1138,1,1130),(1139,6,1131),(1140,6,1132),(1141,2,1133),(1142,1,1134),(1143,1,1135),(1144,1,1136),(1145,6,1137),(1146,4,1138),(1147,4,1139),(1148,1,1140),(1149,1,1141),(1150,6,1142),(1151,6,1143),(1152,6,1144),(1153,2,1145),(1154,1,1146),(1155,1,1147),(1156,1,1148),(1157,1,1149),(1158,6,1150),(1159,6,1151),(1160,2,1152),(1161,6,1153),(1162,4,1154),(1163,1,1155),(1164,6,1156),(1165,4,1157),(1166,4,1158),(1167,4,1159),(1168,1,1160),(1169,6,1161),(1170,1,1162),(1171,6,1163),(1172,6,1164),(1173,1,1165),(1174,1,1166),(1175,4,1167),(1176,2,1168),(1177,1,1169),(1178,1,1170),(1179,1,1171),(1180,2,1172),(1181,6,1173),(1182,1,1174),(1183,2,1175),(1184,2,1176),(1185,4,1177),(1186,6,1178),(1187,1,1179),(1188,6,1180),(1189,6,1181),(1190,6,1182),(1191,4,1183),(1192,1,1184),(1193,1,1185),(1194,2,1186),(1195,1,1187),(1196,2,1188),(1197,6,1189),(1198,6,1190),(1199,2,1191),(1200,6,1192),(1201,2,1193),(1202,4,1194),(1203,6,1195),(1204,1,1196),(1205,1,1197),(1206,6,1198),(1207,4,1199),(1208,1,1200),(1209,2,1201),(1210,1,1202),(1211,1,1203),(1212,6,1204),(1213,1,1205),(1214,1,1206),(1215,4,1207),(1216,1,1208),(1217,6,1209),(1218,1,1210),(1219,2,1211),(1220,6,1212),(1221,2,1213),(1222,1,1214),(1223,2,1215),(1224,4,1216),(1225,6,1217),(1226,4,1218),(1227,2,1219),(1228,1,1220),(1229,1,1221),(1230,2,1222),(1231,4,1223),(1232,4,1224),(1233,6,1225),(1234,4,1226),(1235,4,1227),(1236,2,1228),(1237,4,1229),(1238,6,1230),(1239,4,1231),(1240,4,1232),(1241,4,1233),(1242,4,1234),(1243,4,1235),(1244,1,1236),(1245,1,1237),(1246,4,1238),(1247,4,1239),(1248,1,1240),(1249,6,1241),(1250,2,1242),(1251,2,1243),(1252,6,1244),(1253,6,1245),(1254,4,1246),(1255,6,1247),(1256,6,1248),(1257,4,1249),(1258,4,1250),(1259,2,1251),(1260,2,1252),(1261,1,1253),(1262,6,1254),(1263,1,1255),(1264,1,1256),(1265,6,1257),(1266,4,1258),(1267,4,1259),(1268,2,1260),(1269,1,1261),(1270,2,1262),(1271,2,1263),(1272,2,1264),(1273,1,1265),(1274,1,1266),(1275,1,1267),(1276,1,1268),(1277,6,1269),(1278,2,1270),(1279,6,1271),(1280,6,1272),(1281,1,1273),(1282,6,1274),(1283,2,1275),(1284,1,1276),(1285,1,1277),(1286,4,1278),(1287,2,1279),(1288,6,1280),(1289,2,1281),(1290,2,1282),(1291,6,1283),(1292,1,1284),(1293,4,1285),(1294,1,1286),(1295,2,1287),(1296,1,1288),(1297,4,1289),(1298,2,1290),(1299,2,1291),(1300,2,1292),(1301,1,1293),(1302,6,1294),(1303,6,1295),(1304,4,1296),(1305,2,1297),(1306,2,1298),(1307,2,1299),(1308,2,1300),(1309,1,1301),(1310,6,1302),(1311,1,1303),(1312,4,1304),(1313,4,1305),(1314,6,1306),(1315,1,1307),(1316,6,1308),(1317,6,1309),(1318,4,1310),(1319,1,1311),(1320,2,1312),(1321,6,1313),(1322,6,1314),(1323,4,1315),(1324,1,1316),(1325,6,1317),(1326,6,1318),(1327,4,1319),(1328,1,1320),(1329,2,1321),(1330,4,1322),(1331,6,1323),(1332,1,1324),(1333,2,1325),(1334,6,1326),(1335,2,1327),(1336,2,1328),(1337,1,1329),(1338,1,1330),(1339,2,1331),(1340,6,1332),(1341,1,1333),(1342,2,1334),(1343,4,1335),(1344,1,1336),(1345,1,1337),(1346,2,1338),(1347,2,1339),(1348,4,1340),(1349,1,1341),(1350,6,1342),(1351,6,1343),(1352,6,1344),(1353,2,1345),(1354,2,1346),(1355,6,1347),(1356,2,1348),(1357,6,1349),(1358,1,1350),(1359,4,1351),(1360,4,1352),(1361,6,1353),(1362,6,1354),(1363,2,1355),(1364,4,1356),(1365,4,1357),(1366,2,1358),(1367,1,1359),(1368,6,1360),(1369,6,1361),(1370,1,1362),(1371,2,1363),(1372,6,1364),(1373,2,1365),(1374,1,1366),(1375,2,1367),(1376,6,1368),(1377,2,1369),(1378,6,1370),(1379,1,1371),(1380,6,1372),(1381,2,1373),(1382,6,1374),(1383,4,1375),(1384,2,1376),(1385,2,1377),(1386,2,1378),(1387,6,1379),(1388,2,1380),(1389,4,1381),(1390,6,1382),(1391,2,1383),(1392,1,1384),(1393,1,1385),(1394,1,1386),(1395,6,1387),(1396,4,1388),(1397,2,1389),(1398,2,1390),(1399,1,1391),(1400,2,1392),(1401,4,1393),(1402,2,1394),(1403,2,1395),(1404,6,1396),(1405,4,1397),(1406,6,1398),(1407,6,1399),(1408,6,1400),(1409,4,1401),(1410,6,1402),(1411,2,1403),(1412,6,1404),(1413,2,1405),(1414,4,1406),(1415,6,1407),(1416,4,1408),(1417,6,1409),(1418,2,1410),(1419,4,1411),(1420,1,1412),(1421,2,1413),(1422,6,1414),(1423,1,1415),(1424,1,1416),(1425,1,1417),(1426,1,1418),(1427,2,1419),(1428,6,1420),(1429,2,1421),(1430,1,1422),(1431,6,1423),(1432,4,1424),(1433,1,1425),(1434,6,1426),(1435,2,1427),(1436,4,1428),(1437,6,1429),(1438,6,1430),(1439,6,1431),(1440,6,1432),(1441,2,1433),(1442,4,1434),(1443,1,1435),(1444,2,1436),(1445,2,1437),(1446,4,1438),(1447,2,1439),(1448,2,1440),(1449,2,1441),(1450,6,1442),(1451,4,1443),(1452,6,1444),(1453,2,1445),(1454,6,1446),(1455,4,1447),(1456,4,1448),(1457,6,1449),(1458,2,1450),(1459,1,1451),(1460,6,1452),(1461,6,1453),(1462,2,1454),(1463,1,1455),(1464,1,1456),(1465,4,1457),(1466,1,1458),(1467,4,1459),(1468,1,1460),(1469,2,1461),(1470,1,1462),(1471,2,1463),(1472,1,1464),(1473,4,1465),(1474,2,1466),(1475,1,1467),(1476,1,1468),(1477,4,1469),(1478,1,1470),(1479,1,1471),(1480,2,1472),(1481,2,1473),(1482,6,1474),(1483,4,1475),(1484,2,1476),(1485,6,1477),(1486,4,1478),(1487,1,1479),(1488,1,1480),(1489,6,1481),(1490,4,1482),(1491,1,1483),(1492,4,1484),(1493,4,1485),(1494,2,1486),(1495,2,1487),(1496,1,1488),(1497,2,1489),(1498,1,1490),(1499,4,1491),(1500,4,1492),(1501,4,1493),(1502,6,1494),(1503,6,1495),(1504,6,1496),(1505,4,1497),(1506,2,1498),(1507,1,1499),(1508,6,1500),(1509,2,1501),(1510,6,1502),(1511,6,1503),(1512,2,1504),(1513,6,1505),(1514,6,1506),(1515,6,1507),(1516,4,1508),(1517,2,1509),(1518,4,1510),(1519,2,1511),(1520,2,1512),(1521,1,1513),(1522,6,1514),(1523,6,1515),(1524,1,1516),(1525,4,1517),(1526,4,1518),(1527,6,1519),(1528,6,1520),(1529,1,1521),(1530,1,1522),(1531,6,1523),(1532,2,1524),(1533,1,1525),(1534,2,1526),(1535,6,1527),(1536,1,1528),(1537,2,1529),(1538,6,1530),(1539,1,1531),(1540,1,1532),(1541,4,1533),(1542,2,1534),(1543,4,1535),(1544,4,1536),(1545,1,1537),(1546,2,1538),(1547,4,1539),(1548,2,1540),(1549,6,1541),(1550,6,1542),(1551,4,1543),(1552,2,1544),(1553,2,1545),(1554,4,1546),(1555,4,1547),(1556,4,1548),(1557,6,1549),(1558,2,1550),(1559,4,1551),(1560,4,1552),(1561,4,1553),(1562,6,1554),(1563,1,1555),(1564,2,1556),(1565,1,1557),(1566,6,1558),(1567,6,1559),(1568,6,1560),(1569,6,1561),(1570,1,1562),(1571,2,1563),(1572,1,1564),(1573,6,1565),(1574,4,1566),(1575,4,1567),(1576,4,1568),(1577,2,1569),(1578,1,1570),(1579,2,1571),(1580,1,1572),(1581,6,1573),(1582,6,1574),(1583,4,1575),(1584,2,1576),(1585,6,1577),(1586,2,1578),(1587,2,1579),(1588,4,1580),(1589,4,1581),(1590,4,1582),(1591,1,1583),(1592,1,1584),(1593,6,1585),(1594,1,1586),(1595,2,1587),(1596,6,1588),(1597,2,1589),(1598,2,1590),(1599,2,1591),(1600,4,1592),(1601,6,1593),(1602,1,1594),(1603,6,1595),(1604,1,1596),(1605,2,1597),(1606,4,1598),(1607,2,1599),(1608,4,1600),(1609,1,1601),(1610,4,1602),(1611,1,1603),(1612,1,1604),(1613,2,1605),(1614,6,1606),(1615,6,1607),(1616,6,1608),(1617,6,1609),(1618,2,1610),(1619,1,1611),(1620,1,1612),(1621,1,1613),(1622,1,1614),(1623,1,1615),(1624,4,1616),(1625,6,1617),(1626,2,1618),(1627,4,1619),(1628,2,1620),(1629,6,1621),(1630,2,1622),(1631,6,1623),(1632,6,1624),(1633,1,1625),(1634,6,1626),(1635,2,1627),(1636,4,1628),(1637,2,1629),(1638,1,1630),(1639,4,1631),(1640,2,1632),(1641,2,1633),(1642,2,1634),(1643,2,1635),(1644,4,1636),(1645,2,1637),(1646,4,1638),(1647,2,1639),(1648,1,1640),(1649,6,1641),(1650,2,1642),(1651,1,1643),(1652,2,1644),(1653,6,1645),(1654,4,1646),(1655,6,1647),(1656,6,1648),(1657,2,1649),(1658,2,1650),(1659,2,1651),(1660,2,1652),(1661,2,1653),(1662,4,1654),(1663,6,1655),(1664,1,1656),(1665,2,1657),(1666,6,1658),(1667,1,1659),(1668,1,1660),(1669,2,1661),(1670,4,1662),(1671,2,1663),(1672,6,1664),(1673,1,1665),(1674,2,1666),(1675,6,1667),(1676,6,1668),(1677,2,1669),(1678,6,1670),(1679,4,1671),(1680,1,1672),(1681,4,1673),(1682,2,1674),(1683,6,1675),(1684,4,1676),(1685,2,1677),(1686,4,1678),(1687,1,1679),(1688,1,1680),(1689,2,1681),(1690,2,1682),(1691,6,1683),(1692,2,1684),(1693,6,1685),(1694,2,1686),(1695,1,1687),(1696,6,1688),(1697,1,1689),(1698,6,1690),(1699,2,1691),(1700,1,1692),(1701,6,1693),(1702,1,1694),(1703,2,1695),(1704,2,1696),(1705,2,1697),(1706,6,1698),(1707,6,1699),(1708,6,1700),(1709,4,1701),(1710,2,1702),(1711,2,1703),(1712,6,1704),(1713,4,1705),(1714,4,1706),(1715,1,1707),(1716,1,1708),(1717,1,1709),(1718,2,1710),(1719,2,1711),(1720,2,1712),(1721,6,1713),(1722,6,1714),(1723,1,1715),(1724,2,1716),(1725,2,1717),(1726,4,1718),(1727,2,1719),(1728,4,1720),(1729,2,1721),(1730,6,1722),(1731,1,1723),(1732,1,1724),(1733,1,1725),(1734,6,1726),(1735,1,1727),(1736,4,1728),(1737,1,1729),(1738,1,1730),(1739,2,1731),(1740,6,1732),(1741,6,1733),(1742,1,1734),(1743,4,1735),(1744,4,1736),(1745,2,1737),(1746,1,1738),(1747,2,1739),(1748,2,1740),(1749,6,1741),(1750,4,1742),(1751,6,1743),(1752,4,1744),(1753,2,1745),(1754,1,1746),(1755,4,1747),(1756,6,1748),(1757,1,1749),(1758,6,1750),(1759,1,1751),(1760,4,1752),(1761,1,1753),(1762,1,1754),(1763,4,1755),(1764,2,1756),(1765,1,1757),(1766,4,1758),(1767,6,1759),(1768,6,1760),(1769,1,1761),(1770,4,1762),(1771,4,1763),(1772,6,1764),(1773,1,1765),(1774,1,1766),(1775,4,1767),(1776,2,1768);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,2),(3,3,4),(4,1,9),(5,2,9),(6,3,9),(7,1,10),(8,2,10),(9,3,10),(10,1,11),(11,2,11),(12,3,11),(13,1,12),(14,2,12),(15,3,12),(16,1,13),(17,2,13),(18,3,13),(19,1,14),(20,2,14),(21,3,14),(22,1,15),(23,2,15),(24,3,15),(25,1,16),(26,2,16),(27,3,16),(28,1,17),(29,2,17),(30,3,17),(31,1,18),(32,2,18),(33,3,18),(34,1,19),(35,2,19),(36,3,19),(37,1,20),(38,2,20),(39,3,20),(40,1,21),(41,2,21),(42,3,21),(43,1,22),(44,2,22),(45,3,22),(46,1,23),(47,2,23),(48,3,23),(49,1,24),(50,2,24),(51,3,24),(52,1,25),(53,2,25),(54,3,25),(55,1,26),(56,2,26),(57,3,26),(58,1,27),(59,2,27),(60,3,27),(61,1,28),(62,2,28),(63,3,28),(64,1,29),(65,2,29),(66,3,29),(67,1,30),(68,2,30),(69,3,30),(70,1,31),(71,2,31),(72,3,31),(73,1,32),(74,2,32),(75,3,32),(76,1,33),(77,2,33),(78,3,33),(79,1,34),(80,2,34),(81,3,34),(82,1,35),(83,2,35),(84,3,35),(85,1,36),(86,2,36),(87,3,36),(88,1,37),(89,2,37),(90,3,37),(91,1,38),(92,2,38),(93,3,38),(94,1,39),(95,2,39),(96,3,39),(97,1,40),(98,2,40),(99,3,40),(100,1,41),(101,2,41),(102,3,41),(103,1,42),(104,2,42),(105,3,42),(106,1,43),(107,2,43),(108,3,43),(109,1,44),(110,2,44),(111,3,44),(112,1,45),(113,2,45),(114,3,45),(115,1,46),(116,2,46),(117,3,46),(118,1,47),(119,2,47),(120,3,47),(121,1,48),(122,2,48),(123,3,48),(124,1,49),(125,2,49),(126,3,49),(127,1,50),(128,2,50),(129,3,50),(130,1,51),(131,2,51),(132,3,51),(133,1,52),(134,2,52),(135,3,52),(136,1,53),(137,2,53),(138,3,53),(139,1,54),(140,2,54),(141,3,54),(142,1,55),(143,2,55),(144,3,55),(145,1,56),(146,2,56),(147,3,56),(148,1,57),(149,2,57),(150,3,57),(151,1,58),(152,2,58),(153,3,58),(154,1,59),(155,2,59),(156,3,59),(157,1,60),(158,2,60),(159,3,60),(160,1,61),(161,2,61),(162,3,61),(163,1,62),(164,2,62),(165,3,62),(166,1,63),(167,2,63),(168,3,63),(169,1,64),(170,2,64),(171,3,64),(172,1,65),(173,2,65),(174,3,65),(175,1,66),(176,2,66),(177,3,66),(178,1,67),(179,2,67),(180,3,67),(181,1,68),(182,2,68),(183,3,68),(184,1,69),(185,2,69),(186,3,69),(187,1,70),(188,2,70),(189,3,70),(190,1,71),(191,2,71),(192,3,71),(193,1,72),(194,2,72),(195,3,72),(196,1,73),(197,2,73),(198,3,73),(199,1,74),(200,2,74),(201,3,74),(202,1,75),(203,2,75),(204,3,75),(205,1,76),(206,2,76),(207,3,76),(208,1,77),(209,2,77),(210,3,77),(211,1,78),(212,2,78),(213,3,78),(214,1,79),(215,2,79),(216,3,79),(217,1,80),(218,2,80),(219,3,80),(220,1,81),(221,2,81),(222,3,81),(223,1,82),(224,2,82),(225,3,82),(226,1,83),(227,2,83),(228,3,83),(229,1,84),(230,2,84),(231,3,84),(232,1,85),(233,2,85),(234,3,85),(235,1,86),(236,2,86),(237,3,86),(238,1,87),(239,2,87),(240,3,87),(241,1,88),(242,2,88),(243,3,88),(244,1,89),(245,2,89),(246,3,89),(247,1,90),(248,2,90),(249,3,90),(250,1,91),(251,2,91),(252,3,91),(253,1,92),(254,2,92),(255,3,92),(256,1,93),(257,2,93),(258,3,93),(259,1,94),(260,2,94),(261,3,94),(262,1,95),(263,2,95),(264,3,95),(265,1,96),(266,2,96),(267,3,96),(268,1,97),(269,2,97),(270,3,97),(271,1,98),(272,2,98),(273,3,98),(274,1,99),(275,2,99),(276,3,99),(277,1,100),(278,2,100),(279,3,100),(280,1,101),(281,2,101),(282,3,101),(283,1,102),(284,2,102),(285,3,102),(286,1,103),(287,2,103),(288,3,103),(289,1,104),(290,2,104),(291,3,104),(292,1,105),(293,2,105),(294,3,105),(295,1,106),(296,2,106),(297,3,106),(298,1,107),(299,2,107),(300,3,107),(301,1,108),(302,2,108),(303,3,108),(304,1,109),(305,2,109),(306,3,109),(307,1,110),(308,2,110),(309,3,110),(310,1,111),(311,2,111),(312,3,111),(313,1,112),(314,2,112),(315,3,112),(316,1,113),(317,2,113),(318,3,113),(319,1,114),(320,2,114),(321,3,114),(322,1,115),(323,2,115),(324,3,115),(325,1,116),(326,2,116),(327,3,116),(328,1,117),(329,2,117),(330,3,117),(331,1,118),(332,2,118),(333,3,118),(334,1,119),(335,2,119),(336,3,119),(337,1,120),(338,2,120),(339,3,120),(340,1,121),(341,2,121),(342,3,121),(343,1,122),(344,2,122),(345,3,122),(346,1,123),(347,2,123),(348,3,123),(349,1,124),(350,2,124),(351,3,124),(352,1,125),(353,2,125),(354,3,125),(355,1,126),(356,2,126),(357,3,126),(358,1,127),(359,2,127),(360,3,127),(361,1,128),(362,2,128),(363,3,128),(364,1,129),(365,2,129),(366,3,129),(367,1,130),(368,2,130),(369,3,130),(370,1,131),(371,2,131),(372,3,131),(373,1,132),(374,2,132),(375,3,132),(376,1,133),(377,2,133),(378,3,133),(379,1,134),(380,2,134),(381,3,134),(382,1,135),(383,2,135),(384,3,135),(385,1,136),(386,2,136),(387,3,136),(388,1,137),(389,2,137),(390,3,137),(391,1,138),(392,2,138),(393,3,138),(394,1,139),(395,2,139),(396,3,139),(397,1,140),(398,2,140),(399,3,140),(400,1,141),(401,2,141),(402,3,141),(403,1,142),(404,2,142),(405,3,142),(406,1,143),(407,2,143),(408,3,143),(409,1,144),(410,2,144),(411,3,144),(412,1,145),(413,2,145),(414,3,145),(415,1,146),(416,2,146),(417,3,146),(418,1,147),(419,2,147),(420,3,147),(421,1,148),(422,2,148),(423,3,148),(424,1,149),(425,2,149),(426,3,149),(427,1,150),(428,2,150),(429,3,150),(430,1,151),(431,2,151),(432,3,151),(433,1,152),(434,2,152),(435,3,152),(436,1,153),(437,2,153),(438,3,153),(439,1,154),(440,2,154),(441,3,154),(442,1,155),(443,2,155),(444,3,155),(445,1,156),(446,2,156),(447,3,156),(448,1,157),(449,2,157),(450,3,157),(451,1,158),(452,2,158),(453,3,158),(454,1,159),(455,2,159),(456,3,159),(457,1,160),(458,2,160),(459,3,160),(460,1,161),(461,2,161),(462,3,161),(463,1,162),(464,2,162),(465,3,162),(466,1,163),(467,2,163),(468,3,163),(469,1,164),(470,2,164),(471,3,164),(472,1,165),(473,2,165),(474,3,165),(475,1,166),(476,2,166),(477,3,166),(478,1,167),(479,2,167),(480,3,167),(481,1,168),(482,2,168),(483,3,168),(484,1,169),(485,2,169),(486,3,169),(487,1,170),(488,2,170),(489,3,170),(490,1,171),(491,2,171),(492,3,171),(493,1,172),(494,2,172),(495,3,172),(496,1,173),(497,2,173),(498,3,173),(499,1,174),(500,2,174),(501,3,174),(502,1,175),(503,2,175),(504,3,175),(505,1,176),(506,2,176),(507,3,176),(508,1,177),(509,2,177),(510,3,177),(511,1,178),(512,2,178),(513,3,178),(514,1,179),(515,2,179),(516,3,179),(517,1,180),(518,2,180),(519,3,180),(520,1,181),(521,2,181),(522,3,181),(523,1,182),(524,2,182),(525,3,182),(526,1,183),(527,2,183),(528,3,183),(529,1,184),(530,2,184),(531,3,184),(532,1,185),(533,2,185),(534,3,185),(535,1,186),(536,2,186),(537,3,186),(538,1,187),(539,2,187),(540,3,187),(541,1,188),(542,2,188),(543,3,188),(544,1,189),(545,2,189),(546,3,189),(547,1,190),(548,2,190),(549,3,190),(550,1,191),(551,2,191),(552,3,191),(553,1,192),(554,2,192),(555,3,192),(556,1,193),(557,2,193),(558,3,193),(559,1,194),(560,2,194),(561,3,194),(562,1,195),(563,2,195),(564,3,195),(565,1,196),(566,2,196),(567,3,196),(568,1,197),(569,2,197),(570,3,197),(571,1,198),(572,2,198),(573,3,198),(574,1,199),(575,2,199),(576,3,199),(577,1,200),(578,2,200),(579,3,200),(580,1,201),(581,2,201),(582,3,201),(583,1,202),(584,2,202),(585,3,202),(586,1,203),(587,2,203),(588,3,203),(589,1,204),(590,2,204),(591,3,204),(592,1,205),(593,2,205),(594,3,205),(595,1,206),(596,2,206),(597,3,206),(598,1,207),(599,2,207),(600,3,207),(601,1,208),(602,2,208),(603,3,208),(604,1,209),(605,2,209),(606,3,209),(607,1,210),(608,2,210),(609,3,210),(610,1,211),(611,2,211),(612,3,211),(613,1,212),(614,2,212),(615,3,212),(616,1,213),(617,2,213),(618,3,213),(619,1,214),(620,2,214),(621,3,214),(622,1,215),(623,2,215),(624,3,215),(625,1,216),(626,2,216),(627,3,216),(628,1,217),(629,2,217),(630,3,217),(631,1,218),(632,2,218),(633,3,218),(634,1,219),(635,2,219),(636,3,219),(637,1,220),(638,2,220),(639,3,220),(640,1,221),(641,2,221),(642,3,221),(643,1,222),(644,2,222),(645,3,222),(646,1,223),(647,2,223),(648,3,223),(649,1,224),(650,2,224),(651,3,224),(652,1,225),(653,2,225),(654,3,225),(655,1,226),(656,2,226),(657,3,226),(658,1,227),(659,2,227),(660,3,227),(661,1,228),(662,2,228),(663,3,228),(664,1,229),(665,2,229),(666,3,229),(667,1,230),(668,2,230),(669,3,230),(670,1,231),(671,2,231),(672,3,231),(673,1,232),(674,2,232),(675,3,232),(676,1,233),(677,2,233),(678,3,233),(679,1,234),(680,2,234),(681,3,234),(682,1,235),(683,2,235),(684,3,235),(685,1,236),(686,2,236),(687,3,236),(688,1,237),(689,2,237),(690,3,237),(691,1,238),(692,2,238),(693,3,238),(694,1,239),(695,2,239),(696,3,239),(697,1,240),(698,2,240),(699,3,240),(700,1,241),(701,2,241),(702,3,241),(703,1,242),(704,2,242),(705,3,242),(706,1,243),(707,2,243),(708,3,243),(709,1,244),(710,2,244),(711,3,244),(712,1,245),(713,2,245),(714,3,245),(715,1,246),(716,2,246),(717,3,246),(718,1,247),(719,2,247),(720,3,247),(721,1,248),(722,2,248),(723,3,248),(724,1,249),(725,2,249),(726,3,249),(727,1,250),(728,2,250),(729,3,250),(730,1,251),(731,2,251),(732,3,251),(733,1,252),(734,2,252),(735,3,252),(736,1,253),(737,2,253),(738,3,253),(739,1,254),(740,2,254),(741,3,254),(742,1,255),(743,2,255),(744,3,255),(745,1,256),(746,2,256),(747,3,256),(748,1,257),(749,2,257),(750,3,257),(751,1,258),(752,2,258),(753,3,258),(754,1,259),(755,2,259),(756,3,259),(757,1,260),(758,2,260),(759,3,260),(760,1,261),(761,2,261),(762,3,261),(763,1,262),(764,2,262),(765,3,262),(766,1,263),(767,2,263),(768,3,263),(769,1,264),(770,2,264),(771,3,264),(772,1,265),(773,2,265),(774,3,265),(775,1,266),(776,2,266),(777,3,266),(778,1,267),(779,2,267),(780,3,267),(781,1,268),(782,2,268),(783,3,268),(784,1,269),(785,2,269),(786,3,269),(787,1,270),(788,2,270),(789,3,270),(790,1,271),(791,2,271),(792,3,271),(793,1,272),(794,2,272),(795,3,272),(796,1,273),(797,2,273),(798,3,273),(799,1,274),(800,2,274),(801,3,274),(802,1,275),(803,2,275),(804,3,275),(805,1,276),(806,2,276),(807,3,276),(808,1,277),(809,2,277),(810,3,277),(811,1,278),(812,2,278),(813,3,278),(814,1,279),(815,2,279),(816,3,279),(817,1,280),(818,2,280),(819,3,280),(820,1,281),(821,2,281),(822,3,281),(823,1,282),(824,2,282),(825,3,282),(826,1,283),(827,2,283),(828,3,283),(829,1,284),(830,2,284),(831,3,284),(832,1,285),(833,2,285),(834,3,285),(835,1,286),(836,2,286),(837,3,286),(838,1,287),(839,2,287),(840,3,287),(841,1,288),(842,2,288),(843,3,288),(844,1,289),(845,2,289),(846,3,289),(847,1,290),(848,2,290),(849,3,290),(850,1,291),(851,2,291),(852,3,291),(853,1,292),(854,2,292),(855,3,292),(856,1,293),(857,2,293),(858,3,293),(859,1,294),(860,2,294),(861,3,294),(862,1,295),(863,2,295),(864,3,295),(865,1,296),(866,2,296),(867,3,296),(868,1,297),(869,2,297),(870,3,297),(871,1,298),(872,2,298),(873,3,298),(874,1,299),(875,2,299),(876,3,299),(877,1,300),(878,2,300),(879,3,300),(880,1,301),(881,2,301),(882,3,301),(883,1,302),(884,2,302),(885,3,302),(886,1,303),(887,2,303),(888,3,303),(889,1,304),(890,2,304),(891,3,304),(892,1,305),(893,2,305),(894,3,305),(895,1,306),(896,2,306),(897,3,306),(898,1,307),(899,2,307),(900,3,307),(901,1,308),(902,2,308),(903,3,308),(904,1,309),(905,2,309),(906,3,309),(907,1,310),(908,2,310),(909,3,310),(910,1,311),(911,2,311),(912,3,311),(913,1,312),(914,2,312),(915,3,312),(916,1,313),(917,2,313),(918,3,313),(919,1,314),(920,2,314),(921,3,314),(922,1,315),(923,2,315),(924,3,315),(925,1,316),(926,2,316),(927,3,316),(928,1,317),(929,2,317),(930,3,317),(931,1,318),(932,2,318),(933,3,318),(934,1,319),(935,2,319),(936,3,319),(937,1,320),(938,2,320),(939,3,320),(940,1,321),(941,2,321),(942,3,321),(943,1,322),(944,2,322),(945,3,322),(946,1,323),(947,2,323),(948,3,323),(949,1,324),(950,2,324),(951,3,324),(952,1,325),(953,2,325),(954,3,325),(955,1,326),(956,2,326),(957,3,326),(958,1,327),(959,2,327),(960,3,327),(961,1,328),(962,2,328),(963,3,328),(964,1,329),(965,2,329),(966,3,329),(967,1,330),(968,2,330),(969,3,330),(970,1,331),(971,2,331),(972,3,331),(973,1,332),(974,2,332),(975,3,332),(976,1,333),(977,2,333),(978,3,333),(979,1,334),(980,2,334),(981,3,334),(982,1,335),(983,2,335),(984,3,335),(985,1,336),(986,2,336),(987,3,336),(988,1,337),(989,2,337),(990,3,337),(991,1,338),(992,2,338),(993,3,338),(994,1,339),(995,2,339),(996,3,339),(997,1,340),(998,2,340),(999,3,340),(1000,1,341),(1001,2,341),(1002,3,341),(1003,1,342),(1004,2,342),(1005,3,342),(1006,1,343),(1007,2,343),(1008,3,343),(1009,1,344),(1010,2,344),(1011,3,344),(1012,1,345),(1013,2,345),(1014,3,345),(1015,1,346),(1016,2,346),(1017,3,346),(1018,1,347),(1019,2,347),(1020,3,347),(1021,1,348),(1022,2,348),(1023,3,348),(1024,1,349),(1025,2,349),(1026,3,349),(1027,1,350),(1028,2,350),(1029,3,350),(1030,1,351),(1031,2,351),(1032,3,351),(1033,1,352),(1034,2,352),(1035,3,352),(1036,1,353),(1037,2,353),(1038,3,353),(1039,1,354),(1040,2,354),(1041,3,354),(1042,1,355),(1043,2,355),(1044,3,355),(1045,1,356),(1046,2,356),(1047,3,356),(1048,1,357),(1049,2,357),(1050,3,357),(1051,1,358),(1052,2,358),(1053,3,358),(1054,1,359),(1055,2,359),(1056,3,359),(1057,1,360),(1058,2,360),(1059,3,360),(1060,1,361),(1061,2,361),(1062,3,361),(1063,1,362),(1064,2,362),(1065,3,362),(1066,1,363),(1067,2,363),(1068,3,363),(1069,1,364),(1070,2,364),(1071,3,364),(1072,1,365),(1073,2,365),(1074,3,365),(1075,1,366),(1076,2,366),(1077,3,366),(1078,1,367),(1079,2,367),(1080,3,367),(1081,1,368),(1082,2,368),(1083,3,368),(1084,1,369),(1085,2,369),(1086,3,369),(1087,1,370),(1088,2,370),(1089,3,370),(1090,1,371),(1091,2,371),(1092,3,371),(1093,1,372),(1094,2,372),(1095,3,372),(1096,1,373),(1097,2,373),(1098,3,373),(1099,1,374),(1100,2,374),(1101,3,374),(1102,1,375),(1103,2,375),(1104,3,375),(1105,1,376),(1106,2,376),(1107,3,376),(1108,1,377),(1109,2,377),(1110,3,377),(1111,1,378),(1112,2,378),(1113,3,378),(1114,1,379),(1115,2,379),(1116,3,379),(1117,1,380),(1118,2,380),(1119,3,380),(1120,1,381),(1121,2,381),(1122,3,381),(1123,1,382),(1124,2,382),(1125,3,382),(1126,1,383),(1127,2,383),(1128,3,383),(1129,1,384),(1130,2,384),(1131,3,384),(1132,1,385),(1133,2,385),(1134,3,385),(1135,1,386),(1136,2,386),(1137,3,386),(1138,1,387),(1139,2,387),(1140,3,387),(1141,1,388),(1142,2,388),(1143,3,388),(1144,1,389),(1145,2,389),(1146,3,389),(1147,1,390),(1148,2,390),(1149,3,390),(1150,1,391),(1151,2,391),(1152,3,391),(1153,1,392),(1154,2,392),(1155,3,392),(1156,1,393),(1157,2,393),(1158,3,393),(1159,1,394),(1160,2,394),(1161,3,394),(1162,1,395),(1163,2,395),(1164,3,395),(1165,1,396),(1166,2,396),(1167,3,396),(1168,1,397),(1169,2,397),(1170,3,397),(1171,1,398),(1172,2,398),(1173,3,398),(1174,1,399),(1175,2,399),(1176,3,399),(1177,1,400),(1178,2,400),(1179,3,400),(1180,1,401),(1181,2,401),(1182,3,401),(1183,1,402),(1184,2,402),(1185,3,402),(1186,1,403),(1187,2,403),(1188,3,403),(1189,1,404),(1190,2,404),(1191,3,404),(1192,1,405),(1193,2,405),(1194,3,405),(1195,1,406),(1196,2,406),(1197,3,406),(1198,1,407),(1199,2,407),(1200,3,407),(1201,1,408),(1202,2,408),(1203,3,408),(1204,1,409),(1205,2,409),(1206,3,409),(1207,1,410),(1208,2,410),(1209,3,410),(1210,1,411),(1211,2,411),(1212,3,411),(1213,1,412),(1214,2,412),(1215,3,412),(1216,1,413),(1217,2,413),(1218,3,413),(1219,1,414),(1220,2,414),(1221,3,414),(1222,1,415),(1223,2,415),(1224,3,415),(1225,1,416),(1226,2,416),(1227,3,416),(1228,1,417),(1229,2,417),(1230,3,417),(1231,1,418),(1232,2,418),(1233,3,418),(1234,1,419),(1235,2,419),(1236,3,419),(1237,1,420),(1238,2,420),(1239,3,420),(1240,1,421),(1241,2,421),(1242,3,421),(1243,1,422),(1244,2,422),(1245,3,422),(1246,1,423),(1247,2,423),(1248,3,423),(1249,1,424),(1250,2,424),(1251,3,424),(1252,1,425),(1253,2,425),(1254,3,425),(1255,1,426),(1256,2,426),(1257,3,426),(1258,1,427),(1259,2,427),(1260,3,427),(1261,1,428),(1262,2,428),(1263,3,428),(1264,1,429),(1265,2,429),(1266,3,429),(1267,1,430),(1268,2,430),(1269,3,430),(1270,1,431),(1271,2,431),(1272,3,431),(1273,1,432),(1274,2,432),(1275,3,432),(1276,1,433),(1277,2,433),(1278,3,433),(1279,1,434),(1280,2,434),(1281,3,434),(1282,1,435),(1283,2,435),(1284,3,435),(1285,1,436),(1286,2,436),(1287,3,436),(1288,1,437),(1289,2,437),(1290,3,437),(1291,1,438),(1292,2,438),(1293,3,438),(1294,1,439),(1295,2,439),(1296,3,439),(1297,1,440),(1298,2,440),(1299,3,440),(1300,1,441),(1301,2,441),(1302,3,441),(1303,1,442),(1304,2,442),(1305,3,442),(1306,1,443),(1307,2,443),(1308,3,443),(1309,1,444),(1310,2,444),(1311,3,444),(1312,1,445),(1313,2,445),(1314,3,445),(1315,1,446),(1316,2,446),(1317,3,446),(1318,1,447),(1319,2,447),(1320,3,447),(1321,1,448),(1322,2,448),(1323,3,448),(1324,1,449),(1325,2,449),(1326,3,449),(1327,1,450),(1328,2,450),(1329,3,450),(1330,1,451),(1331,2,451),(1332,3,451),(1333,1,452),(1334,2,452),(1335,3,452),(1336,1,453),(1337,2,453),(1338,3,453),(1339,1,454),(1340,2,454),(1341,3,454),(1342,1,455),(1343,2,455),(1344,3,455),(1345,1,456),(1346,2,456),(1347,3,456),(1348,1,457),(1349,2,457),(1350,3,457),(1351,1,458),(1352,2,458),(1353,3,458),(1354,1,459),(1355,2,459),(1356,3,459),(1357,1,460),(1358,2,460),(1359,3,460),(1360,1,461),(1361,2,461),(1362,3,461),(1363,1,462),(1364,2,462),(1365,3,462),(1366,1,463),(1367,2,463),(1368,3,463),(1369,1,464),(1370,2,464),(1371,3,464),(1372,1,465),(1373,2,465),(1374,3,465),(1375,1,466),(1376,2,466),(1377,3,466),(1378,1,467),(1379,2,467),(1380,3,467),(1381,1,468),(1382,2,468),(1383,3,468),(1384,1,469),(1385,2,469),(1386,3,469),(1387,1,470),(1388,2,470),(1389,3,470),(1390,1,471),(1391,2,471),(1392,3,471),(1393,1,472),(1394,2,472),(1395,3,472),(1396,1,473),(1397,2,473),(1398,3,473),(1399,1,474),(1400,2,474),(1401,3,474),(1402,1,475),(1403,2,475),(1404,3,475),(1405,1,476),(1406,2,476),(1407,3,476),(1408,1,477),(1409,2,477),(1410,3,477),(1411,1,478),(1412,2,478),(1413,3,478),(1414,1,479),(1415,2,479),(1416,3,479),(1417,1,480),(1418,2,480),(1419,3,480),(1420,1,481),(1421,2,481),(1422,3,481),(1423,1,482),(1424,2,482),(1425,3,482),(1426,1,483),(1427,2,483),(1428,3,483),(1429,1,484),(1430,2,484),(1431,3,484),(1432,1,485),(1433,2,485),(1434,3,485),(1435,1,486),(1436,2,486),(1437,3,486),(1438,1,487),(1439,2,487),(1440,3,487),(1441,1,488),(1442,2,488),(1443,3,488),(1444,1,489),(1445,2,489),(1446,3,489),(1447,1,490),(1448,2,490),(1449,3,490),(1450,1,491),(1451,2,491),(1452,3,491),(1453,1,492),(1454,2,492),(1455,3,492),(1456,1,493),(1457,2,493),(1458,3,493),(1459,1,494),(1460,2,494),(1461,3,494),(1462,1,495),(1463,2,495),(1464,3,495),(1465,1,496),(1466,2,496),(1467,3,496),(1468,1,497),(1469,2,497),(1470,3,497),(1471,1,498),(1472,2,498),(1473,3,498),(1474,1,499),(1475,2,499),(1476,3,499),(1477,1,500),(1478,2,500),(1479,3,500),(1480,1,501),(1481,2,501),(1482,3,501),(1483,1,502),(1484,2,502),(1485,3,502),(1486,1,503),(1487,2,503),(1488,3,503),(1489,1,504),(1490,2,504),(1491,3,504),(1492,1,505),(1493,2,505),(1494,3,505),(1495,1,506),(1496,2,506),(1497,3,506),(1498,1,507),(1499,2,507),(1500,3,507),(1501,1,508),(1502,2,508),(1503,3,508),(1504,1,509),(1505,2,509),(1506,3,509),(1507,1,510),(1508,2,510),(1509,3,510),(1510,1,511),(1511,2,511),(1512,3,511),(1513,1,512),(1514,2,512),(1515,3,512),(1516,1,513),(1517,2,513),(1518,3,513),(1519,1,514),(1520,2,514),(1521,3,514),(1522,1,515),(1523,2,515),(1524,3,515),(1525,1,516),(1526,2,516),(1527,3,516),(1528,1,517),(1529,2,517),(1530,3,517),(1531,1,518),(1532,2,518),(1533,3,518),(1534,1,519),(1535,2,519),(1536,3,519),(1537,1,520),(1538,2,520),(1539,3,520),(1540,1,521),(1541,2,521),(1542,3,521),(1543,1,522),(1544,2,522),(1545,3,522),(1546,1,523),(1547,2,523),(1548,3,523),(1549,1,524),(1550,2,524),(1551,3,524),(1552,1,525),(1553,2,525),(1554,3,525),(1555,1,526),(1556,2,526),(1557,3,526),(1558,1,527),(1559,2,527),(1560,3,527),(1561,1,528),(1562,2,528),(1563,3,528),(1564,1,529),(1565,2,529),(1566,3,529),(1567,1,530),(1568,2,530),(1569,3,530),(1570,1,531),(1571,2,531),(1572,3,531),(1573,1,532),(1574,2,532),(1575,3,532),(1576,1,533),(1577,2,533),(1578,3,533),(1579,1,534),(1580,2,534),(1581,3,534),(1582,1,535),(1583,2,535),(1584,3,535),(1585,1,536),(1586,2,536),(1587,3,536),(1588,1,537),(1589,2,537),(1590,3,537),(1591,1,538),(1592,2,538),(1593,3,538),(1594,1,539),(1595,2,539),(1596,3,539),(1597,1,540),(1598,2,540),(1599,3,540),(1600,1,541),(1601,2,541),(1602,3,541),(1603,1,542),(1604,2,542),(1605,3,542),(1606,1,543),(1607,2,543),(1608,3,543),(1609,1,544),(1610,2,544),(1611,3,544),(1612,1,545),(1613,2,545),(1614,3,545),(1615,1,546),(1616,2,546),(1617,3,546),(1618,1,547),(1619,2,547),(1620,3,547),(1621,1,548),(1622,2,548),(1623,3,548),(1624,1,549),(1625,2,549),(1626,3,549),(1627,1,550),(1628,2,550),(1629,3,550),(1630,1,551),(1631,2,551),(1632,3,551),(1633,1,552),(1634,2,552),(1635,3,552),(1636,1,553),(1637,2,553),(1638,3,553),(1639,1,554),(1640,2,554),(1641,3,554),(1642,1,555),(1643,2,555),(1644,3,555),(1645,1,556),(1646,2,556),(1647,3,556),(1648,1,557),(1649,2,557),(1650,3,557),(1651,1,558),(1652,2,558),(1653,3,558),(1654,1,559),(1655,2,559),(1656,3,559),(1657,1,560),(1658,2,560),(1659,3,560),(1660,1,561),(1661,2,561),(1662,3,561),(1663,1,562),(1664,2,562),(1665,3,562),(1666,1,563),(1667,2,563),(1668,3,563),(1669,1,564),(1670,2,564),(1671,3,564),(1672,1,565),(1673,2,565),(1674,3,565),(1675,1,566),(1676,2,566),(1677,3,566),(1678,1,567),(1679,2,567),(1680,3,567),(1681,1,568),(1682,2,568),(1683,3,568),(1684,1,569),(1685,2,569),(1686,3,569),(1687,1,570),(1688,2,570),(1689,3,570),(1690,1,571),(1691,2,571),(1692,3,571),(1693,1,572),(1694,2,572),(1695,3,572),(1696,1,573),(1697,2,573),(1698,3,573),(1699,1,574),(1700,2,574),(1701,3,574),(1702,1,575),(1703,2,575),(1704,3,575),(1705,1,576),(1706,2,576),(1707,3,576),(1708,1,577),(1709,2,577),(1710,3,577),(1711,1,578),(1712,2,578),(1713,3,578),(1714,1,579),(1715,2,579),(1716,3,579),(1717,1,580),(1718,2,580),(1719,3,580),(1720,1,581),(1721,2,581),(1722,3,581),(1723,1,582),(1724,2,582),(1725,3,582),(1726,1,583),(1727,2,583),(1728,3,583),(1729,1,584),(1730,2,584),(1731,3,584),(1732,1,585),(1733,2,585),(1734,3,585),(1735,1,586),(1736,2,586),(1737,3,586),(1738,1,587),(1739,2,587),(1740,3,587),(1741,1,588),(1742,2,588),(1743,3,588),(1744,1,589),(1745,2,589),(1746,3,589),(1747,1,590),(1748,2,590),(1749,3,590),(1750,1,591),(1751,2,591),(1752,3,591),(1753,1,592),(1754,2,592),(1755,3,592),(1756,1,593),(1757,2,593),(1758,3,593),(1759,1,594),(1760,2,594),(1761,3,594),(1762,1,595),(1763,2,595),(1764,3,595),(1765,1,596),(1766,2,596),(1767,3,596),(1768,1,597),(1769,2,597),(1770,3,597),(1771,1,598),(1772,2,598),(1773,3,598),(1774,1,599),(1775,2,599),(1776,3,599),(1777,1,600),(1778,2,600),(1779,3,600),(1780,1,601),(1781,2,601),(1782,3,601),(1783,1,602),(1784,2,602),(1785,3,602),(1786,1,603),(1787,2,603),(1788,3,603),(1789,1,604),(1790,2,604),(1791,3,604),(1792,1,605),(1793,2,605),(1794,3,605),(1795,1,606),(1796,2,606),(1797,3,606),(1798,1,607),(1799,2,607),(1800,3,607),(1801,1,608),(1802,2,608),(1803,3,608),(1804,1,609),(1805,2,609),(1806,3,609),(1807,1,610),(1808,2,610),(1809,3,610),(1810,1,611),(1811,2,611),(1812,3,611),(1813,1,612),(1814,2,612),(1815,3,612),(1816,1,613),(1817,2,613),(1818,3,613),(1819,1,614),(1820,2,614),(1821,3,614),(1822,1,615),(1823,2,615),(1824,3,615),(1825,1,616),(1826,2,616),(1827,3,616),(1828,1,617),(1829,2,617),(1830,3,617),(1831,1,618),(1832,2,618),(1833,3,618),(1834,1,619),(1835,2,619),(1836,3,619),(1837,1,620),(1838,2,620),(1839,3,620),(1840,1,621),(1841,2,621),(1842,3,621),(1843,1,622),(1844,2,622),(1845,3,622),(1846,1,623),(1847,2,623),(1848,3,623),(1849,1,624),(1850,2,624),(1851,3,624),(1852,1,625),(1853,2,625),(1854,3,625),(1855,1,626),(1856,2,626),(1857,3,626),(1858,1,627),(1859,2,627),(1860,3,627),(1861,1,628),(1862,2,628),(1863,3,628),(1864,1,629),(1865,2,629),(1866,3,629),(1867,1,630),(1868,2,630),(1869,3,630),(1870,1,631),(1871,2,631),(1872,3,631),(1873,1,632),(1874,2,632),(1875,3,632),(1876,1,633),(1877,2,633),(1878,3,633),(1879,1,634),(1880,2,634),(1881,3,634),(1882,1,635),(1883,2,635),(1884,3,635),(1885,1,636),(1886,2,636),(1887,3,636),(1888,1,637),(1889,2,637),(1890,3,637),(1891,1,638),(1892,2,638),(1893,3,638),(1894,1,639),(1895,2,639),(1896,3,639),(1897,1,640),(1898,2,640),(1899,3,640),(1900,1,641),(1901,2,641),(1902,3,641),(1903,1,642),(1904,2,642),(1905,3,642),(1906,1,643),(1907,2,643),(1908,3,643),(1909,1,644),(1910,2,644),(1911,3,644),(1912,1,645),(1913,2,645),(1914,3,645),(1915,1,646),(1916,2,646),(1917,3,646),(1918,1,647),(1919,2,647),(1920,3,647),(1921,1,648),(1922,2,648),(1923,3,648),(1924,1,649),(1925,2,649),(1926,3,649),(1927,1,650),(1928,2,650),(1929,3,650),(1930,1,651),(1931,2,651),(1932,3,651),(1933,1,652),(1934,2,652),(1935,3,652),(1936,1,653),(1937,2,653),(1938,3,653),(1939,1,654),(1940,2,654),(1941,3,654),(1942,1,655),(1943,2,655),(1944,3,655),(1945,1,656),(1946,2,656),(1947,3,656),(1948,1,657),(1949,2,657),(1950,3,657),(1951,1,658),(1952,2,658),(1953,3,658),(1954,1,659),(1955,2,659),(1956,3,659),(1957,1,660),(1958,2,660),(1959,3,660),(1960,1,661),(1961,2,661),(1962,3,661),(1963,1,662),(1964,2,662),(1965,3,662),(1966,1,663),(1967,2,663),(1968,3,663),(1969,1,664),(1970,2,664),(1971,3,664),(1972,1,665),(1973,2,665),(1974,3,665),(1975,1,666),(1976,2,666),(1977,3,666),(1978,1,667),(1979,2,667),(1980,3,667),(1981,1,668),(1982,2,668),(1983,3,668),(1984,1,669),(1985,2,669),(1986,3,669),(1987,1,670),(1988,2,670),(1989,3,670),(1990,1,671),(1991,2,671),(1992,3,671),(1993,1,672),(1994,2,672),(1995,3,672),(1996,1,673),(1997,2,673),(1998,3,673),(1999,1,674),(2000,2,674),(2001,3,674),(2002,1,675),(2003,2,675),(2004,3,675),(2005,1,676),(2006,2,676),(2007,3,676),(2008,1,677),(2009,2,677),(2010,3,677),(2011,1,678),(2012,2,678),(2013,3,678),(2014,1,679),(2015,2,679),(2016,3,679),(2017,1,680),(2018,2,680),(2019,3,680),(2020,1,681),(2021,2,681),(2022,3,681),(2023,1,682),(2024,2,682),(2025,3,682),(2026,1,683),(2027,2,683),(2028,3,683),(2029,1,684),(2030,2,684),(2031,3,684),(2032,1,685),(2033,2,685),(2034,3,685),(2035,1,686),(2036,2,686),(2037,3,686),(2038,1,687),(2039,2,687),(2040,3,687),(2041,1,688),(2042,2,688),(2043,3,688),(2044,1,689),(2045,2,689),(2046,3,689),(2047,1,690),(2048,2,690),(2049,3,690),(2050,1,691),(2051,2,691),(2052,3,691),(2053,1,692),(2054,2,692),(2055,3,692),(2056,1,693),(2057,2,693),(2058,3,693),(2059,1,694),(2060,2,694),(2061,3,694),(2062,1,695),(2063,2,695),(2064,3,695),(2065,1,696),(2066,2,696),(2067,3,696),(2068,1,697),(2069,2,697),(2070,3,697),(2071,1,698),(2072,2,698),(2073,3,698),(2074,1,699),(2075,2,699),(2076,3,699),(2077,1,700),(2078,2,700),(2079,3,700),(2080,1,701),(2081,2,701),(2082,3,701),(2083,1,702),(2084,2,702),(2085,3,702),(2086,1,703),(2087,2,703),(2088,3,703),(2089,1,704),(2090,2,704),(2091,3,704),(2092,1,705),(2093,2,705),(2094,3,705),(2095,1,706),(2096,2,706),(2097,3,706),(2098,1,707),(2099,2,707),(2100,3,707),(2101,1,708),(2102,2,708),(2103,3,708),(2104,1,709),(2105,2,709),(2106,3,709),(2107,1,710),(2108,2,710),(2109,3,710),(2110,1,711),(2111,2,711),(2112,3,711),(2113,1,712),(2114,2,712),(2115,3,712),(2116,1,713),(2117,2,713),(2118,3,713),(2119,1,714),(2120,2,714),(2121,3,714),(2122,1,715),(2123,2,715),(2124,3,715),(2125,1,716),(2126,2,716),(2127,3,716),(2128,1,717),(2129,2,717),(2130,3,717),(2131,1,718),(2132,2,718),(2133,3,718),(2134,1,719),(2135,2,719),(2136,3,719),(2137,1,720),(2138,2,720),(2139,3,720),(2140,1,721),(2141,2,721),(2142,3,721),(2143,1,722),(2144,2,722),(2145,3,722),(2146,1,723),(2147,2,723),(2148,3,723),(2149,1,724),(2150,2,724),(2151,3,724),(2152,1,725),(2153,2,725),(2154,3,725),(2155,1,726),(2156,2,726),(2157,3,726),(2158,1,727),(2159,2,727),(2160,3,727),(2161,1,728),(2162,2,728),(2163,3,728),(2164,1,729),(2165,2,729),(2166,3,729),(2167,1,730),(2168,2,730),(2169,3,730),(2170,1,731),(2171,2,731),(2172,3,731),(2173,1,732),(2174,2,732),(2175,3,732),(2176,1,733),(2177,2,733),(2178,3,733),(2179,1,734),(2180,2,734),(2181,3,734),(2182,1,735),(2183,2,735),(2184,3,735),(2185,1,736),(2186,2,736),(2187,3,736),(2188,1,737),(2189,2,737),(2190,3,737),(2191,1,738),(2192,2,738),(2193,3,738),(2194,1,739),(2195,2,739),(2196,3,739),(2197,1,740),(2198,2,740),(2199,3,740),(2200,1,741),(2201,2,741),(2202,3,741),(2203,1,742),(2204,2,742),(2205,3,742),(2206,1,743),(2207,2,743),(2208,3,743),(2209,1,744),(2210,2,744),(2211,3,744),(2212,1,745),(2213,2,745),(2214,3,745),(2215,1,746),(2216,2,746),(2217,3,746),(2218,1,747),(2219,2,747),(2220,3,747),(2221,1,748),(2222,2,748),(2223,3,748),(2224,1,749),(2225,2,749),(2226,3,749),(2227,1,750),(2228,2,750),(2229,3,750),(2230,1,751),(2231,2,751),(2232,3,751),(2233,1,752),(2234,2,752),(2235,3,752),(2236,1,753),(2237,2,753),(2238,3,753),(2239,1,754),(2240,2,754),(2241,3,754),(2242,1,755),(2243,2,755),(2244,3,755),(2245,1,756),(2246,2,756),(2247,3,756),(2248,1,757),(2249,2,757),(2250,3,757),(2251,1,758),(2252,2,758),(2253,3,758),(2254,1,759),(2255,2,759),(2256,3,759),(2257,1,760),(2258,2,760),(2259,3,760),(2260,1,761),(2261,2,761),(2262,3,761),(2263,1,762),(2264,2,762),(2265,3,762),(2266,1,763),(2267,2,763),(2268,3,763),(2269,1,764),(2270,2,764),(2271,3,764),(2272,1,765),(2273,2,765),(2274,3,765),(2275,1,766),(2276,2,766),(2277,3,766),(2278,1,767),(2279,2,767),(2280,3,767),(2281,1,768),(2282,2,768),(2283,3,768),(2284,1,769),(2285,2,769),(2286,3,769),(2287,1,770),(2288,2,770),(2289,3,770),(2290,1,771),(2291,2,771),(2292,3,771),(2293,1,772),(2294,2,772),(2295,3,772),(2296,1,773),(2297,2,773),(2298,3,773),(2299,1,774),(2300,2,774),(2301,3,774),(2302,1,775),(2303,2,775),(2304,3,775),(2305,1,776),(2306,2,776),(2307,3,776),(2308,1,777),(2309,2,777),(2310,3,777),(2311,1,778),(2312,2,778),(2313,3,778),(2314,1,779),(2315,2,779),(2316,3,779),(2317,1,780),(2318,2,780),(2319,3,780),(2320,1,781),(2321,2,781),(2322,3,781),(2323,1,782),(2324,2,782),(2325,3,782),(2326,1,783),(2327,2,783),(2328,3,783),(2329,1,784),(2330,2,784),(2331,3,784),(2332,1,785),(2333,2,785),(2334,3,785),(2335,1,786),(2336,2,786),(2337,3,786),(2338,1,787),(2339,2,787),(2340,3,787),(2341,1,788),(2342,2,788),(2343,3,788),(2344,1,789),(2345,2,789),(2346,3,789),(2347,1,790),(2348,2,790),(2349,3,790),(2350,1,791),(2351,2,791),(2352,3,791),(2353,1,792),(2354,2,792),(2355,3,792),(2356,1,793),(2357,2,793),(2358,3,793),(2359,1,794),(2360,2,794),(2361,3,794),(2362,1,795),(2363,2,795),(2364,3,795),(2365,1,796),(2366,2,796),(2367,3,796),(2368,1,797),(2369,2,797),(2370,3,797),(2371,1,798),(2372,2,798),(2373,3,798),(2374,1,799),(2375,2,799),(2376,3,799),(2377,1,800),(2378,2,800),(2379,3,800),(2380,1,801),(2381,2,801),(2382,3,801),(2383,1,802),(2384,2,802),(2385,3,802),(2386,1,803),(2387,2,803),(2388,3,803),(2389,1,804),(2390,2,804),(2391,3,804),(2392,1,805),(2393,2,805),(2394,3,805),(2395,1,806),(2396,2,806),(2397,3,806),(2398,1,807),(2399,2,807),(2400,3,807),(2401,1,808),(2402,2,808),(2403,3,808),(2404,1,809),(2405,2,809),(2406,3,809),(2407,1,810),(2408,2,810),(2409,3,810),(2410,1,811),(2411,2,811),(2412,3,811),(2413,1,812),(2414,2,812),(2415,3,812),(2416,1,813),(2417,2,813),(2418,3,813),(2419,1,814),(2420,2,814),(2421,3,814),(2422,1,815),(2423,2,815),(2424,3,815),(2425,1,816),(2426,2,816),(2427,3,816),(2428,1,817),(2429,2,817),(2430,3,817),(2431,1,818),(2432,2,818),(2433,3,818),(2434,1,819),(2435,2,819),(2436,3,819),(2437,1,820),(2438,2,820),(2439,3,820),(2440,1,821),(2441,2,821),(2442,3,821),(2443,1,822),(2444,2,822),(2445,3,822),(2446,1,823),(2447,2,823),(2448,3,823),(2449,1,824),(2450,2,824),(2451,3,824),(2452,1,825),(2453,2,825),(2454,3,825),(2455,1,826),(2456,2,826),(2457,3,826),(2458,1,827),(2459,2,827),(2460,3,827),(2461,1,828),(2462,2,828),(2463,3,828),(2464,1,829),(2465,2,829),(2466,3,829),(2467,1,830),(2468,2,830),(2469,3,830),(2470,1,831),(2471,2,831),(2472,3,831),(2473,1,832),(2474,2,832),(2475,3,832),(2476,1,833),(2477,2,833),(2478,3,833),(2479,1,834),(2480,2,834),(2481,3,834),(2482,1,835),(2483,2,835),(2484,3,835),(2485,1,836),(2486,2,836),(2487,3,836),(2488,1,837),(2489,2,837),(2490,3,837),(2491,1,838),(2492,2,838),(2493,3,838),(2494,1,839),(2495,2,839),(2496,3,839),(2497,1,840),(2498,2,840),(2499,3,840),(2500,1,841),(2501,2,841),(2502,3,841),(2503,1,842),(2504,2,842),(2505,3,842),(2506,1,843),(2507,2,843),(2508,3,843),(2509,1,844),(2510,2,844),(2511,3,844),(2512,1,845),(2513,2,845),(2514,3,845),(2515,1,846),(2516,2,846),(2517,3,846),(2518,1,847),(2519,2,847),(2520,3,847),(2521,1,848),(2522,2,848),(2523,3,848),(2524,1,849),(2525,2,849),(2526,3,849),(2527,1,850),(2528,2,850),(2529,3,850),(2530,1,851),(2531,2,851),(2532,3,851),(2533,1,852),(2534,2,852),(2535,3,852),(2536,1,853),(2537,2,853),(2538,3,853),(2539,1,854),(2540,2,854),(2541,3,854),(2542,1,855),(2543,2,855),(2544,3,855),(2545,1,856),(2546,2,856),(2547,3,856),(2548,1,857),(2549,2,857),(2550,3,857),(2551,1,858),(2552,2,858),(2553,3,858),(2554,1,859),(2555,2,859),(2556,3,859),(2557,1,860),(2558,2,860),(2559,3,860),(2560,1,861),(2561,2,861),(2562,3,861),(2563,1,862),(2564,2,862),(2565,3,862),(2566,1,863),(2567,2,863),(2568,3,863),(2569,1,864),(2570,2,864),(2571,3,864),(2572,1,865),(2573,2,865),(2574,3,865),(2575,1,866),(2576,2,866),(2577,3,866),(2578,1,867),(2579,2,867),(2580,3,867),(2581,1,868),(2582,2,868),(2583,3,868),(2584,1,869),(2585,2,869),(2586,3,869),(2587,1,870),(2588,2,870),(2589,3,870),(2590,1,871),(2591,2,871),(2592,3,871),(2593,1,872),(2594,2,872),(2595,3,872),(2596,1,873),(2597,2,873),(2598,3,873),(2599,1,874),(2600,2,874),(2601,3,874),(2602,1,875),(2603,2,875),(2604,3,875),(2605,1,876),(2606,2,876),(2607,3,876),(2608,1,877),(2609,2,877),(2610,3,877),(2611,1,878),(2612,2,878),(2613,3,878),(2614,1,879),(2615,2,879),(2616,3,879),(2617,1,880),(2618,2,880),(2619,3,880),(2620,1,881),(2621,2,881),(2622,3,881),(2623,1,882),(2624,2,882),(2625,3,882),(2626,1,883),(2627,2,883),(2628,3,883),(2629,1,884),(2630,2,884),(2631,3,884),(2632,1,885),(2633,2,885),(2634,3,885),(2635,1,886),(2636,2,886),(2637,3,886),(2638,1,887),(2639,2,887),(2640,3,887),(2641,1,888),(2642,2,888),(2643,3,888),(2644,1,889),(2645,2,889),(2646,3,889),(2647,1,890),(2648,2,890),(2649,3,890),(2650,1,891),(2651,2,891),(2652,3,891),(2653,1,892),(2654,2,892),(2655,3,892),(2656,1,893),(2657,2,893),(2658,3,893),(2659,1,894),(2660,2,894),(2661,3,894),(2662,1,895),(2663,2,895),(2664,3,895),(2665,1,896),(2666,2,896),(2667,3,896),(2668,1,897),(2669,2,897),(2670,3,897),(2671,1,898),(2672,2,898),(2673,3,898),(2674,1,899),(2675,2,899),(2676,3,899),(2677,1,900),(2678,2,900),(2679,3,900),(2680,1,901),(2681,2,901),(2682,3,901),(2683,1,902),(2684,2,902),(2685,3,902),(2686,1,903),(2687,2,903),(2688,3,903),(2689,1,904),(2690,2,904),(2691,3,904),(2692,1,905),(2693,2,905),(2694,3,905),(2695,1,906),(2696,2,906),(2697,3,906),(2698,1,907),(2699,2,907),(2700,3,907),(2701,1,908),(2702,2,908),(2703,3,908),(2704,1,909),(2705,2,909),(2706,3,909),(2707,1,910),(2708,2,910),(2709,3,910),(2710,1,911),(2711,2,911),(2712,3,911),(2713,1,912),(2714,2,912),(2715,3,912),(2716,1,913),(2717,2,913),(2718,3,913),(2719,1,914),(2720,2,914),(2721,3,914),(2722,1,915),(2723,2,915),(2724,3,915),(2725,1,916),(2726,2,916),(2727,3,916),(2728,1,917),(2729,2,917),(2730,3,917),(2731,1,918),(2732,2,918),(2733,3,918),(2734,1,919),(2735,2,919),(2736,3,919),(2737,1,920),(2738,2,920),(2739,3,920),(2740,1,921),(2741,2,921),(2742,3,921),(2743,1,922),(2744,2,922),(2745,3,922),(2746,1,923),(2747,2,923),(2748,3,923),(2749,1,924),(2750,2,924),(2751,3,924),(2752,1,925),(2753,2,925),(2754,3,925),(2755,1,926),(2756,2,926),(2757,3,926),(2758,1,927),(2759,2,927),(2760,3,927),(2761,1,928),(2762,2,928),(2763,3,928),(2764,1,929),(2765,2,929),(2766,3,929),(2767,1,930),(2768,2,930),(2769,3,930),(2770,1,931),(2771,2,931),(2772,3,931),(2773,1,932),(2774,2,932),(2775,3,932),(2776,1,933),(2777,2,933),(2778,3,933),(2779,1,934),(2780,2,934),(2781,3,934),(2782,1,935),(2783,2,935),(2784,3,935),(2785,1,936),(2786,2,936),(2787,3,936),(2788,1,937),(2789,2,937),(2790,3,937),(2791,1,938),(2792,2,938),(2793,3,938),(2794,1,939),(2795,2,939),(2796,3,939),(2797,1,940),(2798,2,940),(2799,3,940),(2800,1,941),(2801,2,941),(2802,3,941),(2803,1,942),(2804,2,942),(2805,3,942),(2806,1,943),(2807,2,943),(2808,3,943),(2809,1,944),(2810,2,944),(2811,3,944),(2812,1,945),(2813,2,945),(2814,3,945),(2815,1,946),(2816,2,946),(2817,3,946),(2818,1,947),(2819,2,947),(2820,3,947),(2821,1,948),(2822,2,948),(2823,3,948),(2824,1,949),(2825,2,949),(2826,3,949),(2827,1,950),(2828,2,950),(2829,3,950),(2830,1,951),(2831,2,951),(2832,3,951),(2833,1,952),(2834,2,952),(2835,3,952),(2836,1,953),(2837,2,953),(2838,3,953),(2839,1,954),(2840,2,954),(2841,3,954),(2842,1,955),(2843,2,955),(2844,3,955),(2845,1,956),(2846,2,956),(2847,3,956),(2848,1,957),(2849,2,957),(2850,3,957),(2851,1,958),(2852,2,958),(2853,3,958),(2854,1,959),(2855,2,959),(2856,3,959),(2857,1,960),(2858,2,960),(2859,3,960),(2860,1,961),(2861,2,961),(2862,3,961),(2863,1,962),(2864,2,962),(2865,3,962),(2866,1,963),(2867,2,963),(2868,3,963),(2869,1,964),(2870,2,964),(2871,3,964),(2872,1,965),(2873,2,965),(2874,3,965),(2875,1,966),(2876,2,966),(2877,3,966),(2878,1,967),(2879,2,967),(2880,3,967),(2881,1,968),(2882,2,968),(2883,3,968),(2884,1,969),(2885,2,969),(2886,3,969),(2887,1,970),(2888,2,970),(2889,3,970),(2890,1,971),(2891,2,971),(2892,3,971),(2893,1,972),(2894,2,972),(2895,3,972),(2896,1,973),(2897,2,973),(2898,3,973),(2899,1,974),(2900,2,974),(2901,3,974),(2902,1,975),(2903,2,975),(2904,3,975),(2905,1,976),(2906,2,976),(2907,3,976),(2908,1,977),(2909,2,977),(2910,3,977),(2911,1,978),(2912,2,978),(2913,3,978),(2914,1,979),(2915,2,979),(2916,3,979),(2917,1,980),(2918,2,980),(2919,3,980),(2920,1,981),(2921,2,981),(2922,3,981),(2923,1,982),(2924,2,982),(2925,3,982),(2926,1,983),(2927,2,983),(2928,3,983),(2929,1,984),(2930,2,984),(2931,3,984),(2932,1,985),(2933,2,985),(2934,3,985),(2935,1,986),(2936,2,986),(2937,3,986),(2938,1,987),(2939,2,987),(2940,3,987),(2941,1,988),(2942,2,988),(2943,3,988),(2944,1,989),(2945,2,989),(2946,3,989),(2947,1,990),(2948,2,990),(2949,3,990),(2950,1,991),(2951,2,991),(2952,3,991),(2953,1,992),(2954,2,992),(2955,3,992),(2956,1,993),(2957,2,993),(2958,3,993),(2959,1,994),(2960,2,994),(2961,3,994),(2962,1,995),(2963,2,995),(2964,3,995),(2965,1,996),(2966,2,996),(2967,3,996),(2968,1,997),(2969,2,997),(2970,3,997),(2971,1,998),(2972,2,998),(2973,3,998),(2974,1,999),(2975,2,999),(2976,3,999),(2977,1,1000),(2978,2,1000),(2979,3,1000),(2980,1,1001),(2981,2,1001),(2982,3,1001),(2983,1,1002),(2984,2,1002),(2985,3,1002),(2986,1,1003),(2987,2,1003),(2988,3,1003),(2989,1,1004),(2990,2,1004),(2991,3,1004),(2992,1,1005),(2993,2,1005),(2994,3,1005),(2995,1,1006),(2996,2,1006),(2997,3,1006),(2998,1,1007),(2999,2,1007),(3000,3,1007),(3001,1,1008),(3002,2,1008),(3003,3,1008),(3004,1,1009),(3005,2,1009),(3006,3,1009),(3007,1,1010),(3008,2,1010),(3009,3,1010),(3010,1,1011),(3011,2,1011),(3012,3,1011),(3013,1,1012),(3014,2,1012),(3015,3,1012),(3016,1,1013),(3017,2,1013),(3018,3,1013),(3019,1,1014),(3020,2,1014),(3021,3,1014),(3022,1,1015),(3023,2,1015),(3024,3,1015),(3025,1,1016),(3026,2,1016),(3027,3,1016),(3028,1,1017),(3029,2,1017),(3030,3,1017),(3031,1,1018),(3032,2,1018),(3033,3,1018),(3034,1,1019),(3035,2,1019),(3036,3,1019),(3037,1,1020),(3038,2,1020),(3039,3,1020),(3040,1,1021),(3041,2,1021),(3042,3,1021),(3043,1,1022),(3044,2,1022),(3045,3,1022),(3046,1,1023),(3047,2,1023),(3048,3,1023),(3049,1,1024),(3050,2,1024),(3051,3,1024),(3052,1,1025),(3053,2,1025),(3054,3,1025),(3055,1,1026),(3056,2,1026),(3057,3,1026),(3058,1,1027),(3059,2,1027),(3060,3,1027),(3061,1,1028),(3062,2,1028),(3063,3,1028),(3064,1,1029),(3065,2,1029),(3066,3,1029),(3067,1,1030),(3068,2,1030),(3069,3,1030),(3070,1,1031),(3071,2,1031),(3072,3,1031),(3073,1,1032),(3074,2,1032),(3075,3,1032),(3076,1,1033),(3077,2,1033),(3078,3,1033),(3079,1,1034),(3080,2,1034),(3081,3,1034),(3082,1,1035),(3083,2,1035),(3084,3,1035),(3085,1,1036),(3086,2,1036),(3087,3,1036),(3088,1,1037),(3089,2,1037),(3090,3,1037),(3091,1,1038),(3092,2,1038),(3093,3,1038),(3094,1,1039),(3095,2,1039),(3096,3,1039),(3097,1,1040),(3098,2,1040),(3099,3,1040),(3100,1,1041),(3101,2,1041),(3102,3,1041),(3103,1,1042),(3104,2,1042),(3105,3,1042),(3106,1,1043),(3107,2,1043),(3108,3,1043),(3109,1,1044),(3110,2,1044),(3111,3,1044),(3112,1,1045),(3113,2,1045),(3114,3,1045),(3115,1,1046),(3116,2,1046),(3117,3,1046),(3118,1,1047),(3119,2,1047),(3120,3,1047),(3121,1,1048),(3122,2,1048),(3123,3,1048),(3124,1,1049),(3125,2,1049),(3126,3,1049),(3127,1,1050),(3128,2,1050),(3129,3,1050),(3130,1,1051),(3131,2,1051),(3132,3,1051),(3133,1,1052),(3134,2,1052),(3135,3,1052),(3136,1,1053),(3137,2,1053),(3138,3,1053),(3139,1,1054),(3140,2,1054),(3141,3,1054),(3142,1,1055),(3143,2,1055),(3144,3,1055),(3145,1,1056),(3146,2,1056),(3147,3,1056),(3148,1,1057),(3149,2,1057),(3150,3,1057),(3151,1,1058),(3152,2,1058),(3153,3,1058),(3154,1,1059),(3155,2,1059),(3156,3,1059),(3157,1,1060),(3158,2,1060),(3159,3,1060),(3160,1,1061),(3161,2,1061),(3162,3,1061),(3163,1,1062),(3164,2,1062),(3165,3,1062),(3166,1,1063),(3167,2,1063),(3168,3,1063),(3169,1,1064),(3170,2,1064),(3171,3,1064),(3172,1,1065),(3173,2,1065),(3174,3,1065),(3175,1,1066),(3176,2,1066),(3177,3,1066),(3178,1,1067),(3179,2,1067),(3180,3,1067),(3181,1,1068),(3182,2,1068),(3183,3,1068),(3184,1,1069),(3185,2,1069),(3186,3,1069),(3187,1,1070),(3188,2,1070),(3189,3,1070),(3190,1,1071),(3191,2,1071),(3192,3,1071),(3193,1,1072),(3194,2,1072),(3195,3,1072),(3196,1,1073),(3197,2,1073),(3198,3,1073),(3199,1,1074),(3200,2,1074),(3201,3,1074),(3202,1,1075),(3203,2,1075),(3204,3,1075),(3205,1,1076),(3206,2,1076),(3207,3,1076),(3208,1,1077),(3209,2,1077),(3210,3,1077),(3211,1,1078),(3212,2,1078),(3213,3,1078),(3214,1,1079),(3215,2,1079),(3216,3,1079),(3217,1,1080),(3218,2,1080),(3219,3,1080),(3220,1,1081),(3221,2,1081),(3222,3,1081),(3223,1,1082),(3224,2,1082),(3225,3,1082),(3226,1,1083),(3227,2,1083),(3228,3,1083),(3229,1,1084),(3230,2,1084),(3231,3,1084),(3232,1,1085),(3233,2,1085),(3234,3,1085),(3235,1,1086),(3236,2,1086),(3237,3,1086),(3238,1,1087),(3239,2,1087),(3240,3,1087),(3241,1,1088),(3242,2,1088),(3243,3,1088),(3244,1,1089),(3245,2,1089),(3246,3,1089),(3247,1,1090),(3248,2,1090),(3249,3,1090),(3250,1,1091),(3251,2,1091),(3252,3,1091),(3253,1,1092),(3254,2,1092),(3255,3,1092),(3256,1,1093),(3257,2,1093),(3258,3,1093),(3259,1,1094),(3260,2,1094),(3261,3,1094),(3262,1,1095),(3263,2,1095),(3264,3,1095),(3265,1,1096),(3266,2,1096),(3267,3,1096),(3268,1,1097),(3269,2,1097),(3270,3,1097),(3271,1,1098),(3272,2,1098),(3273,3,1098),(3274,1,1099),(3275,2,1099),(3276,3,1099),(3277,1,1100),(3278,2,1100),(3279,3,1100),(3280,1,1101),(3281,2,1101),(3282,3,1101),(3283,1,1102),(3284,2,1102),(3285,3,1102),(3286,1,1103),(3287,2,1103),(3288,3,1103),(3289,1,1104),(3290,2,1104),(3291,3,1104),(3292,1,1105),(3293,2,1105),(3294,3,1105),(3295,1,1106),(3296,2,1106),(3297,3,1106),(3298,1,1107),(3299,2,1107),(3300,3,1107),(3301,1,1108),(3302,2,1108),(3303,3,1108),(3304,1,1109),(3305,2,1109),(3306,3,1109),(3307,1,1110),(3308,2,1110),(3309,3,1110),(3310,1,1111),(3311,2,1111),(3312,3,1111),(3313,1,1112),(3314,2,1112),(3315,3,1112),(3316,1,1113),(3317,2,1113),(3318,3,1113),(3319,1,1114),(3320,2,1114),(3321,3,1114),(3322,1,1115),(3323,2,1115),(3324,3,1115),(3325,1,1116),(3326,2,1116),(3327,3,1116),(3328,1,1117),(3329,2,1117),(3330,3,1117),(3331,1,1118),(3332,2,1118),(3333,3,1118),(3334,1,1119),(3335,2,1119),(3336,3,1119),(3337,1,1120),(3338,2,1120),(3339,3,1120),(3340,1,1121),(3341,2,1121),(3342,3,1121),(3343,1,1122),(3344,2,1122),(3345,3,1122),(3346,1,1123),(3347,2,1123),(3348,3,1123),(3349,1,1124),(3350,2,1124),(3351,3,1124),(3352,1,1125),(3353,2,1125),(3354,3,1125),(3355,1,1126),(3356,2,1126),(3357,3,1126),(3358,1,1127),(3359,2,1127),(3360,3,1127),(3361,1,1128),(3362,2,1128),(3363,3,1128),(3364,1,1129),(3365,2,1129),(3366,3,1129),(3367,1,1130),(3368,2,1130),(3369,3,1130),(3370,1,1131),(3371,2,1131),(3372,3,1131),(3373,1,1132),(3374,2,1132),(3375,3,1132),(3376,1,1133),(3377,2,1133),(3378,3,1133),(3379,1,1134),(3380,2,1134),(3381,3,1134),(3382,1,1135),(3383,2,1135),(3384,3,1135),(3385,1,1136),(3386,2,1136),(3387,3,1136),(3388,1,1137),(3389,2,1137),(3390,3,1137),(3391,1,1138),(3392,2,1138),(3393,3,1138),(3394,1,1139),(3395,2,1139),(3396,3,1139),(3397,1,1140),(3398,2,1140),(3399,3,1140),(3400,1,1141),(3401,2,1141),(3402,3,1141),(3403,1,1142),(3404,2,1142),(3405,3,1142),(3406,1,1143),(3407,2,1143),(3408,3,1143),(3409,1,1144),(3410,2,1144),(3411,3,1144),(3412,1,1145),(3413,2,1145),(3414,3,1145),(3415,1,1146),(3416,2,1146),(3417,3,1146),(3418,1,1147),(3419,2,1147),(3420,3,1147),(3421,1,1148),(3422,2,1148),(3423,3,1148),(3424,1,1149),(3425,2,1149),(3426,3,1149),(3427,1,1150),(3428,2,1150),(3429,3,1150),(3430,1,1151),(3431,2,1151),(3432,3,1151),(3433,1,1152),(3434,2,1152),(3435,3,1152),(3436,1,1153),(3437,2,1153),(3438,3,1153),(3439,1,1154),(3440,2,1154),(3441,3,1154),(3442,1,1155),(3443,2,1155),(3444,3,1155),(3445,1,1156),(3446,2,1156),(3447,3,1156),(3448,1,1157),(3449,2,1157),(3450,3,1157),(3451,1,1158),(3452,2,1158),(3453,3,1158),(3454,1,1159),(3455,2,1159),(3456,3,1159),(3457,1,1160),(3458,2,1160),(3459,3,1160),(3460,1,1161),(3461,2,1161),(3462,3,1161),(3463,1,1162),(3464,2,1162),(3465,3,1162),(3466,1,1163),(3467,2,1163),(3468,3,1163),(3469,1,1164),(3470,2,1164),(3471,3,1164),(3472,1,1165),(3473,2,1165),(3474,3,1165),(3475,1,1166),(3476,2,1166),(3477,3,1166),(3478,1,1167),(3479,2,1167),(3480,3,1167),(3481,1,1168),(3482,2,1168),(3483,3,1168),(3484,1,1169),(3485,2,1169),(3486,3,1169),(3487,1,1170),(3488,2,1170),(3489,3,1170),(3490,1,1171),(3491,2,1171),(3492,3,1171),(3493,1,1172),(3494,2,1172),(3495,3,1172),(3496,1,1173),(3497,2,1173),(3498,3,1173),(3499,1,1174),(3500,2,1174),(3501,3,1174),(3502,1,1175),(3503,2,1175),(3504,3,1175),(3505,1,1176),(3506,2,1176),(3507,3,1176),(3508,1,1177),(3509,2,1177),(3510,3,1177),(3511,1,1178),(3512,2,1178),(3513,3,1178),(3514,1,1179),(3515,2,1179),(3516,3,1179),(3517,1,1180),(3518,2,1180),(3519,3,1180),(3520,1,1181),(3521,2,1181),(3522,3,1181),(3523,1,1182),(3524,2,1182),(3525,3,1182),(3526,1,1183),(3527,2,1183),(3528,3,1183),(3529,1,1184),(3530,2,1184),(3531,3,1184),(3532,1,1185),(3533,2,1185),(3534,3,1185),(3535,1,1186),(3536,2,1186),(3537,3,1186),(3538,1,1187),(3539,2,1187),(3540,3,1187),(3541,1,1188),(3542,2,1188),(3543,3,1188),(3544,1,1189),(3545,2,1189),(3546,3,1189),(3547,1,1190),(3548,2,1190),(3549,3,1190),(3550,1,1191),(3551,2,1191),(3552,3,1191),(3553,1,1192),(3554,2,1192),(3555,3,1192),(3556,1,1193),(3557,2,1193),(3558,3,1193),(3559,1,1194),(3560,2,1194),(3561,3,1194),(3562,1,1195),(3563,2,1195),(3564,3,1195),(3565,1,1196),(3566,2,1196),(3567,3,1196),(3568,1,1197),(3569,2,1197),(3570,3,1197),(3571,1,1198),(3572,2,1198),(3573,3,1198),(3574,1,1199),(3575,2,1199),(3576,3,1199),(3577,1,1200),(3578,2,1200),(3579,3,1200),(3580,1,1201),(3581,2,1201),(3582,3,1201),(3583,1,1202),(3584,2,1202),(3585,3,1202),(3586,1,1203),(3587,2,1203),(3588,3,1203),(3589,1,1204),(3590,2,1204),(3591,3,1204),(3592,1,1205),(3593,2,1205),(3594,3,1205),(3595,1,1206),(3596,2,1206),(3597,3,1206),(3598,1,1207),(3599,2,1207),(3600,3,1207),(3601,1,1208),(3602,2,1208),(3603,3,1208),(3604,1,1209),(3605,2,1209),(3606,3,1209),(3607,1,1210),(3608,2,1210),(3609,3,1210),(3610,1,1211),(3611,2,1211),(3612,3,1211),(3613,1,1212),(3614,2,1212),(3615,3,1212),(3616,1,1213),(3617,2,1213),(3618,3,1213),(3619,1,1214),(3620,2,1214),(3621,3,1214),(3622,1,1215),(3623,2,1215),(3624,3,1215),(3625,1,1216),(3626,2,1216),(3627,3,1216),(3628,1,1217),(3629,2,1217),(3630,3,1217),(3631,1,1218),(3632,2,1218),(3633,3,1218),(3634,1,1219),(3635,2,1219),(3636,3,1219),(3637,1,1220),(3638,2,1220),(3639,3,1220),(3640,1,1221),(3641,2,1221),(3642,3,1221),(3643,1,1222),(3644,2,1222),(3645,3,1222),(3646,1,1223),(3647,2,1223),(3648,3,1223),(3649,1,1224),(3650,2,1224),(3651,3,1224),(3652,1,1225),(3653,2,1225),(3654,3,1225),(3655,1,1226),(3656,2,1226),(3657,3,1226),(3658,1,1227),(3659,2,1227),(3660,3,1227),(3661,1,1228),(3662,2,1228),(3663,3,1228),(3664,1,1229),(3665,2,1229),(3666,3,1229),(3667,1,1230),(3668,2,1230),(3669,3,1230),(3670,1,1231),(3671,2,1231),(3672,3,1231),(3673,1,1232),(3674,2,1232),(3675,3,1232),(3676,1,1233),(3677,2,1233),(3678,3,1233),(3679,1,1234),(3680,2,1234),(3681,3,1234),(3682,1,1235),(3683,2,1235),(3684,3,1235),(3685,1,1236),(3686,2,1236),(3687,3,1236),(3688,1,1237),(3689,2,1237),(3690,3,1237),(3691,1,1238),(3692,2,1238),(3693,3,1238),(3694,1,1239),(3695,2,1239),(3696,3,1239),(3697,1,1240),(3698,2,1240),(3699,3,1240),(3700,1,1241),(3701,2,1241),(3702,3,1241),(3703,1,1242),(3704,2,1242),(3705,3,1242),(3706,1,1243),(3707,2,1243),(3708,3,1243),(3709,1,1244),(3710,2,1244),(3711,3,1244),(3712,1,1245),(3713,2,1245),(3714,3,1245),(3715,1,1246),(3716,2,1246),(3717,3,1246),(3718,1,1247),(3719,2,1247),(3720,3,1247),(3721,1,1248),(3722,2,1248),(3723,3,1248),(3724,1,1249),(3725,2,1249),(3726,3,1249),(3727,1,1250),(3728,2,1250),(3729,3,1250),(3730,1,1251),(3731,2,1251),(3732,3,1251),(3733,1,1252),(3734,2,1252),(3735,3,1252),(3736,1,1253),(3737,2,1253),(3738,3,1253),(3739,1,1254),(3740,2,1254),(3741,3,1254),(3742,1,1255),(3743,2,1255),(3744,3,1255),(3745,1,1256),(3746,2,1256),(3747,3,1256),(3748,1,1257),(3749,2,1257),(3750,3,1257),(3751,1,1258),(3752,2,1258),(3753,3,1258),(3754,1,1259),(3755,2,1259),(3756,3,1259),(3757,1,1260),(3758,2,1260),(3759,3,1260),(3760,1,1261),(3761,2,1261),(3762,3,1261),(3763,1,1262),(3764,2,1262),(3765,3,1262),(3766,1,1263),(3767,2,1263),(3768,3,1263),(3769,1,1264),(3770,2,1264),(3771,3,1264),(3772,1,1265),(3773,2,1265),(3774,3,1265),(3775,1,1266),(3776,2,1266),(3777,3,1266),(3778,1,1267),(3779,2,1267),(3780,3,1267),(3781,1,1268),(3782,2,1268),(3783,3,1268),(3784,1,1269),(3785,2,1269),(3786,3,1269),(3787,1,1270),(3788,2,1270),(3789,3,1270),(3790,1,1271),(3791,2,1271),(3792,3,1271),(3793,1,1272),(3794,2,1272),(3795,3,1272),(3796,1,1273),(3797,2,1273),(3798,3,1273),(3799,1,1274),(3800,2,1274),(3801,3,1274),(3802,1,1275),(3803,2,1275),(3804,3,1275),(3805,1,1276),(3806,2,1276),(3807,3,1276),(3808,1,1277),(3809,2,1277),(3810,3,1277),(3811,1,1278),(3812,2,1278),(3813,3,1278),(3814,1,1279),(3815,2,1279),(3816,3,1279),(3817,1,1280),(3818,2,1280),(3819,3,1280),(3820,1,1281),(3821,2,1281),(3822,3,1281),(3823,1,1282),(3824,2,1282),(3825,3,1282),(3826,1,1283),(3827,2,1283),(3828,3,1283),(3829,1,1284),(3830,2,1284),(3831,3,1284),(3832,1,1285),(3833,2,1285),(3834,3,1285),(3835,1,1286),(3836,2,1286),(3837,3,1286),(3838,1,1287),(3839,2,1287),(3840,3,1287),(3841,1,1288),(3842,2,1288),(3843,3,1288),(3844,1,1289),(3845,2,1289),(3846,3,1289),(3847,1,1290),(3848,2,1290),(3849,3,1290),(3850,1,1291),(3851,2,1291),(3852,3,1291),(3853,1,1292),(3854,2,1292),(3855,3,1292),(3856,1,1293),(3857,2,1293),(3858,3,1293),(3859,1,1294),(3860,2,1294),(3861,3,1294),(3862,1,1295),(3863,2,1295),(3864,3,1295),(3865,1,1296),(3866,2,1296),(3867,3,1296),(3868,1,1297),(3869,2,1297),(3870,3,1297),(3871,1,1298),(3872,2,1298),(3873,3,1298),(3874,1,1299),(3875,2,1299),(3876,3,1299),(3877,1,1300),(3878,2,1300),(3879,3,1300),(3880,1,1301),(3881,2,1301),(3882,3,1301),(3883,1,1302),(3884,2,1302),(3885,3,1302),(3886,1,1303),(3887,2,1303),(3888,3,1303),(3889,1,1304),(3890,2,1304),(3891,3,1304),(3892,1,1305),(3893,2,1305),(3894,3,1305),(3895,1,1306),(3896,2,1306),(3897,3,1306),(3898,1,1307),(3899,2,1307),(3900,3,1307),(3901,1,1308),(3902,2,1308),(3903,3,1308),(3904,1,1309),(3905,2,1309),(3906,3,1309),(3907,1,1310),(3908,2,1310),(3909,3,1310),(3910,1,1311),(3911,2,1311),(3912,3,1311),(3913,1,1312),(3914,2,1312),(3915,3,1312),(3916,1,1313),(3917,2,1313),(3918,3,1313),(3919,1,1314),(3920,2,1314),(3921,3,1314),(3922,1,1315),(3923,2,1315),(3924,3,1315),(3925,1,1316),(3926,2,1316),(3927,3,1316),(3928,1,1317),(3929,2,1317),(3930,3,1317),(3931,1,1318),(3932,2,1318),(3933,3,1318),(3934,1,1319),(3935,2,1319),(3936,3,1319),(3937,1,1320),(3938,2,1320),(3939,3,1320),(3940,1,1321),(3941,2,1321),(3942,3,1321),(3943,1,1322),(3944,2,1322),(3945,3,1322),(3946,1,1323),(3947,2,1323),(3948,3,1323),(3949,1,1324),(3950,2,1324),(3951,3,1324),(3952,1,1325),(3953,2,1325),(3954,3,1325),(3955,1,1326),(3956,2,1326),(3957,3,1326),(3958,1,1327),(3959,2,1327),(3960,3,1327),(3961,1,1328),(3962,2,1328),(3963,3,1328),(3964,1,1329),(3965,2,1329),(3966,3,1329),(3967,1,1330),(3968,2,1330),(3969,3,1330),(3970,1,1331),(3971,2,1331),(3972,3,1331),(3973,1,1332),(3974,2,1332),(3975,3,1332),(3976,1,1333),(3977,2,1333),(3978,3,1333),(3979,1,1334),(3980,2,1334),(3981,3,1334),(3982,1,1335),(3983,2,1335),(3984,3,1335),(3985,1,1336),(3986,2,1336),(3987,3,1336),(3988,1,1337),(3989,2,1337),(3990,3,1337),(3991,1,1338),(3992,2,1338),(3993,3,1338),(3994,1,1339),(3995,2,1339),(3996,3,1339),(3997,1,1340),(3998,2,1340),(3999,3,1340),(4000,1,1341),(4001,2,1341),(4002,3,1341),(4003,1,1342),(4004,2,1342),(4005,3,1342),(4006,1,1343),(4007,2,1343),(4008,3,1343),(4009,1,1344),(4010,2,1344),(4011,3,1344),(4012,1,1345),(4013,2,1345),(4014,3,1345),(4015,1,1346),(4016,2,1346),(4017,3,1346),(4018,1,1347),(4019,2,1347),(4020,3,1347),(4021,1,1348),(4022,2,1348),(4023,3,1348),(4024,1,1349),(4025,2,1349),(4026,3,1349),(4027,1,1350),(4028,2,1350),(4029,3,1350),(4030,1,1351),(4031,2,1351),(4032,3,1351),(4033,1,1352),(4034,2,1352),(4035,3,1352),(4036,1,1353),(4037,2,1353),(4038,3,1353),(4039,1,1354),(4040,2,1354),(4041,3,1354),(4042,1,1355),(4043,2,1355),(4044,3,1355),(4045,1,1356),(4046,2,1356),(4047,3,1356),(4048,1,1357),(4049,2,1357),(4050,3,1357),(4051,1,1358),(4052,2,1358),(4053,3,1358),(4054,1,1359),(4055,2,1359),(4056,3,1359),(4057,1,1360),(4058,2,1360),(4059,3,1360),(4060,1,1361),(4061,2,1361),(4062,3,1361),(4063,1,1362),(4064,2,1362),(4065,3,1362),(4066,1,1363),(4067,2,1363),(4068,3,1363),(4069,1,1364),(4070,2,1364),(4071,3,1364),(4072,1,1365),(4073,2,1365),(4074,3,1365),(4075,1,1366),(4076,2,1366),(4077,3,1366),(4078,1,1367),(4079,2,1367),(4080,3,1367),(4081,1,1368),(4082,2,1368),(4083,3,1368),(4084,1,1369),(4085,2,1369),(4086,3,1369),(4087,1,1370),(4088,2,1370),(4089,3,1370),(4090,1,1371),(4091,2,1371),(4092,3,1371),(4093,1,1372),(4094,2,1372),(4095,3,1372),(4096,1,1373),(4097,2,1373),(4098,3,1373),(4099,1,1374),(4100,2,1374),(4101,3,1374),(4102,1,1375),(4103,2,1375),(4104,3,1375),(4105,1,1376),(4106,2,1376),(4107,3,1376),(4108,1,1377),(4109,2,1377),(4110,3,1377),(4111,1,1378),(4112,2,1378),(4113,3,1378),(4114,1,1379),(4115,2,1379),(4116,3,1379),(4117,1,1380),(4118,2,1380),(4119,3,1380),(4120,1,1381),(4121,2,1381),(4122,3,1381),(4123,1,1382),(4124,2,1382),(4125,3,1382),(4126,1,1383),(4127,2,1383),(4128,3,1383),(4129,1,1384),(4130,2,1384),(4131,3,1384),(4132,1,1385),(4133,2,1385),(4134,3,1385),(4135,1,1386),(4136,2,1386),(4137,3,1386),(4138,1,1387),(4139,2,1387),(4140,3,1387),(4141,1,1388),(4142,2,1388),(4143,3,1388),(4144,1,1389),(4145,2,1389),(4146,3,1389),(4147,1,1390),(4148,2,1390),(4149,3,1390),(4150,1,1391),(4151,2,1391),(4152,3,1391),(4153,1,1392),(4154,2,1392),(4155,3,1392),(4156,1,1393),(4157,2,1393),(4158,3,1393),(4159,1,1394),(4160,2,1394),(4161,3,1394),(4162,1,1395),(4163,2,1395),(4164,3,1395),(4165,1,1396),(4166,2,1396),(4167,3,1396),(4168,1,1397),(4169,2,1397),(4170,3,1397),(4171,1,1398),(4172,2,1398),(4173,3,1398),(4174,1,1399),(4175,2,1399),(4176,3,1399),(4177,1,1400),(4178,2,1400),(4179,3,1400),(4180,1,1401),(4181,2,1401),(4182,3,1401),(4183,1,1402),(4184,2,1402),(4185,3,1402),(4186,1,1403),(4187,2,1403),(4188,3,1403),(4189,1,1404),(4190,2,1404),(4191,3,1404),(4192,1,1405),(4193,2,1405),(4194,3,1405),(4195,1,1406),(4196,2,1406),(4197,3,1406),(4198,1,1407),(4199,2,1407),(4200,3,1407),(4201,1,1408),(4202,2,1408),(4203,3,1408),(4204,1,1409),(4205,2,1409),(4206,3,1409),(4207,1,1410),(4208,2,1410),(4209,3,1410),(4210,1,1411),(4211,2,1411),(4212,3,1411),(4213,1,1412),(4214,2,1412),(4215,3,1412),(4216,1,1413),(4217,2,1413),(4218,3,1413),(4219,1,1414),(4220,2,1414),(4221,3,1414),(4222,1,1415),(4223,2,1415),(4224,3,1415),(4225,1,1416),(4226,2,1416),(4227,3,1416),(4228,1,1417),(4229,2,1417),(4230,3,1417),(4231,1,1418),(4232,2,1418),(4233,3,1418),(4234,1,1419),(4235,2,1419),(4236,3,1419),(4237,1,1420),(4238,2,1420),(4239,3,1420),(4240,1,1421),(4241,2,1421),(4242,3,1421),(4243,1,1422),(4244,2,1422),(4245,3,1422),(4246,1,1423),(4247,2,1423),(4248,3,1423),(4249,1,1424),(4250,2,1424),(4251,3,1424),(4252,1,1425),(4253,2,1425),(4254,3,1425),(4255,1,1426),(4256,2,1426),(4257,3,1426),(4258,1,1427),(4259,2,1427),(4260,3,1427),(4261,1,1428),(4262,2,1428),(4263,3,1428),(4264,1,1429),(4265,2,1429),(4266,3,1429),(4267,1,1430),(4268,2,1430),(4269,3,1430),(4270,1,1431),(4271,2,1431),(4272,3,1431),(4273,1,1432),(4274,2,1432),(4275,3,1432),(4276,1,1433),(4277,2,1433),(4278,3,1433),(4279,1,1434),(4280,2,1434),(4281,3,1434),(4282,1,1435),(4283,2,1435),(4284,3,1435),(4285,1,1436),(4286,2,1436),(4287,3,1436),(4288,1,1437),(4289,2,1437),(4290,3,1437),(4291,1,1438),(4292,2,1438),(4293,3,1438),(4294,1,1439),(4295,2,1439),(4296,3,1439),(4297,1,1440),(4298,2,1440),(4299,3,1440),(4300,1,1441),(4301,2,1441),(4302,3,1441),(4303,1,1442),(4304,2,1442),(4305,3,1442),(4306,1,1443),(4307,2,1443),(4308,3,1443),(4309,1,1444),(4310,2,1444),(4311,3,1444),(4312,1,1445),(4313,2,1445),(4314,3,1445),(4315,1,1446),(4316,2,1446),(4317,3,1446),(4318,1,1447),(4319,2,1447),(4320,3,1447),(4321,1,1448),(4322,2,1448),(4323,3,1448),(4324,1,1449),(4325,2,1449),(4326,3,1449),(4327,1,1450),(4328,2,1450),(4329,3,1450),(4330,1,1451),(4331,2,1451),(4332,3,1451),(4333,1,1452),(4334,2,1452),(4335,3,1452),(4336,1,1453),(4337,2,1453),(4338,3,1453),(4339,1,1454),(4340,2,1454),(4341,3,1454),(4342,1,1455),(4343,2,1455),(4344,3,1455),(4345,1,1456),(4346,2,1456),(4347,3,1456),(4348,1,1457),(4349,2,1457),(4350,3,1457),(4351,1,1458),(4352,2,1458),(4353,3,1458),(4354,1,1459),(4355,2,1459),(4356,3,1459),(4357,1,1460),(4358,2,1460),(4359,3,1460),(4360,1,1461),(4361,2,1461),(4362,3,1461),(4363,1,1462),(4364,2,1462),(4365,3,1462),(4366,1,1463),(4367,2,1463),(4368,3,1463),(4369,1,1464),(4370,2,1464),(4371,3,1464),(4372,1,1465),(4373,2,1465),(4374,3,1465),(4375,1,1466),(4376,2,1466),(4377,3,1466),(4378,1,1467),(4379,2,1467),(4380,3,1467),(4381,1,1468),(4382,2,1468),(4383,3,1468),(4384,1,1469),(4385,2,1469),(4386,3,1469),(4387,1,1470),(4388,2,1470),(4389,3,1470),(4390,1,1471),(4391,2,1471),(4392,3,1471),(4393,1,1472),(4394,2,1472),(4395,3,1472),(4396,1,1473),(4397,2,1473),(4398,3,1473),(4399,1,1474),(4400,2,1474),(4401,3,1474),(4402,1,1475),(4403,2,1475),(4404,3,1475),(4405,1,1476),(4406,2,1476),(4407,3,1476),(4408,1,1477),(4409,2,1477),(4410,3,1477),(4411,1,1478),(4412,2,1478),(4413,3,1478),(4414,1,1479),(4415,2,1479),(4416,3,1479),(4417,1,1480),(4418,2,1480),(4419,3,1480),(4420,1,1481),(4421,2,1481),(4422,3,1481),(4423,1,1482),(4424,2,1482),(4425,3,1482),(4426,1,1483),(4427,2,1483),(4428,3,1483),(4429,1,1484),(4430,2,1484),(4431,3,1484),(4432,1,1485),(4433,2,1485),(4434,3,1485),(4435,1,1486),(4436,2,1486),(4437,3,1486),(4438,1,1487),(4439,2,1487),(4440,3,1487),(4441,1,1488),(4442,2,1488),(4443,3,1488),(4444,1,1489),(4445,2,1489),(4446,3,1489),(4447,1,1490),(4448,2,1490),(4449,3,1490),(4450,1,1491),(4451,2,1491),(4452,3,1491),(4453,1,1492),(4454,2,1492),(4455,3,1492),(4456,1,1493),(4457,2,1493),(4458,3,1493),(4459,1,1494),(4460,2,1494),(4461,3,1494),(4462,1,1495),(4463,2,1495),(4464,3,1495),(4465,1,1496),(4466,2,1496),(4467,3,1496),(4468,1,1497),(4469,2,1497),(4470,3,1497),(4471,1,1498),(4472,2,1498),(4473,3,1498),(4474,1,1499),(4475,2,1499),(4476,3,1499),(4477,1,1500),(4478,2,1500),(4479,3,1500),(4480,1,1501),(4481,2,1501),(4482,3,1501),(4483,1,1502),(4484,2,1502),(4485,3,1502),(4486,1,1503),(4487,2,1503),(4488,3,1503),(4489,1,1504),(4490,2,1504),(4491,3,1504),(4492,1,1505),(4493,2,1505),(4494,3,1505),(4495,1,1506),(4496,2,1506),(4497,3,1506),(4498,1,1507),(4499,2,1507),(4500,3,1507),(4501,1,1508),(4502,2,1508),(4503,3,1508),(4504,1,1509),(4505,2,1509),(4506,3,1509),(4507,1,1510),(4508,2,1510),(4509,3,1510),(4510,1,1511),(4511,2,1511),(4512,3,1511),(4513,1,1512),(4514,2,1512),(4515,3,1512),(4516,1,1513),(4517,2,1513),(4518,3,1513),(4519,1,1514),(4520,2,1514),(4521,3,1514),(4522,1,1515),(4523,2,1515),(4524,3,1515),(4525,1,1516),(4526,2,1516),(4527,3,1516),(4528,1,1517),(4529,2,1517),(4530,3,1517),(4531,1,1518),(4532,2,1518),(4533,3,1518),(4534,1,1519),(4535,2,1519),(4536,3,1519),(4537,1,1520),(4538,2,1520),(4539,3,1520),(4540,1,1521),(4541,2,1521),(4542,3,1521),(4543,1,1522),(4544,2,1522),(4545,3,1522),(4546,1,1523),(4547,2,1523),(4548,3,1523),(4549,1,1524),(4550,2,1524),(4551,3,1524),(4552,1,1525),(4553,2,1525),(4554,3,1525),(4555,1,1526),(4556,2,1526),(4557,3,1526),(4558,1,1527),(4559,2,1527),(4560,3,1527),(4561,1,1528),(4562,2,1528),(4563,3,1528),(4564,1,1529),(4565,2,1529),(4566,3,1529),(4567,1,1530),(4568,2,1530),(4569,3,1530),(4570,1,1531),(4571,2,1531),(4572,3,1531),(4573,1,1532),(4574,2,1532),(4575,3,1532),(4576,1,1533),(4577,2,1533),(4578,3,1533),(4579,1,1534),(4580,2,1534),(4581,3,1534),(4582,1,1535),(4583,2,1535),(4584,3,1535),(4585,1,1536),(4586,2,1536),(4587,3,1536),(4588,1,1537),(4589,2,1537),(4590,3,1537),(4591,1,1538),(4592,2,1538),(4593,3,1538),(4594,1,1539),(4595,2,1539),(4596,3,1539),(4597,1,1540),(4598,2,1540),(4599,3,1540),(4600,1,1541),(4601,2,1541),(4602,3,1541),(4603,1,1542),(4604,2,1542),(4605,3,1542),(4606,1,1543),(4607,2,1543),(4608,3,1543),(4609,1,1544),(4610,2,1544),(4611,3,1544),(4612,1,1545),(4613,2,1545),(4614,3,1545),(4615,1,1546),(4616,2,1546),(4617,3,1546),(4618,1,1547),(4619,2,1547),(4620,3,1547),(4621,1,1548),(4622,2,1548),(4623,3,1548),(4624,1,1549),(4625,2,1549),(4626,3,1549),(4627,1,1550),(4628,2,1550),(4629,3,1550),(4630,1,1551),(4631,2,1551),(4632,3,1551),(4633,1,1552),(4634,2,1552),(4635,3,1552),(4636,1,1553),(4637,2,1553),(4638,3,1553),(4639,1,1554),(4640,2,1554),(4641,3,1554),(4642,1,1555),(4643,2,1555),(4644,3,1555),(4645,1,1556),(4646,2,1556),(4647,3,1556),(4648,1,1557),(4649,2,1557),(4650,3,1557),(4651,1,1558),(4652,2,1558),(4653,3,1558),(4654,1,1559),(4655,2,1559),(4656,3,1559),(4657,1,1560),(4658,2,1560),(4659,3,1560),(4660,1,1561),(4661,2,1561),(4662,3,1561),(4663,1,1562),(4664,2,1562),(4665,3,1562),(4666,1,1563),(4667,2,1563),(4668,3,1563),(4669,1,1564),(4670,2,1564),(4671,3,1564),(4672,1,1565),(4673,2,1565),(4674,3,1565),(4675,1,1566),(4676,2,1566),(4677,3,1566),(4678,1,1567),(4679,2,1567),(4680,3,1567),(4681,1,1568),(4682,2,1568),(4683,3,1568),(4684,1,1569),(4685,2,1569),(4686,3,1569),(4687,1,1570),(4688,2,1570),(4689,3,1570),(4690,1,1571),(4691,2,1571),(4692,3,1571),(4693,1,1572),(4694,2,1572),(4695,3,1572),(4696,1,1573),(4697,2,1573),(4698,3,1573),(4699,1,1574),(4700,2,1574),(4701,3,1574),(4702,1,1575),(4703,2,1575),(4704,3,1575),(4705,1,1576),(4706,2,1576),(4707,3,1576),(4708,1,1577),(4709,2,1577),(4710,3,1577),(4711,1,1578),(4712,2,1578),(4713,3,1578),(4714,1,1579),(4715,2,1579),(4716,3,1579),(4717,1,1580),(4718,2,1580),(4719,3,1580),(4720,1,1581),(4721,2,1581),(4722,3,1581),(4723,1,1582),(4724,2,1582),(4725,3,1582),(4726,1,1583),(4727,2,1583),(4728,3,1583),(4729,1,1584),(4730,2,1584),(4731,3,1584),(4732,1,1585),(4733,2,1585),(4734,3,1585),(4735,1,1586),(4736,2,1586),(4737,3,1586),(4738,1,1587),(4739,2,1587),(4740,3,1587),(4741,1,1588),(4742,2,1588),(4743,3,1588),(4744,1,1589),(4745,2,1589),(4746,3,1589),(4747,1,1590),(4748,2,1590),(4749,3,1590),(4750,1,1591),(4751,2,1591),(4752,3,1591),(4753,1,1592),(4754,2,1592),(4755,3,1592),(4756,1,1593),(4757,2,1593),(4758,3,1593),(4759,1,1594),(4760,2,1594),(4761,3,1594),(4762,1,1595),(4763,2,1595),(4764,3,1595),(4765,1,1596),(4766,2,1596),(4767,3,1596),(4768,1,1597),(4769,2,1597),(4770,3,1597),(4771,1,1598),(4772,2,1598),(4773,3,1598),(4774,1,1599),(4775,2,1599),(4776,3,1599),(4777,1,1600),(4778,2,1600),(4779,3,1600),(4780,1,1601),(4781,2,1601),(4782,3,1601),(4783,1,1602),(4784,2,1602),(4785,3,1602),(4786,1,1603),(4787,2,1603),(4788,3,1603),(4789,1,1604),(4790,2,1604),(4791,3,1604),(4792,1,1605),(4793,2,1605),(4794,3,1605),(4795,1,1606),(4796,2,1606),(4797,3,1606),(4798,1,1607),(4799,2,1607),(4800,3,1607),(4801,1,1608),(4802,2,1608),(4803,3,1608),(4804,1,1609),(4805,2,1609),(4806,3,1609),(4807,1,1610),(4808,2,1610),(4809,3,1610),(4810,1,1611),(4811,2,1611),(4812,3,1611),(4813,1,1612),(4814,2,1612),(4815,3,1612),(4816,1,1613),(4817,2,1613),(4818,3,1613),(4819,1,1614),(4820,2,1614),(4821,3,1614),(4822,1,1615),(4823,2,1615),(4824,3,1615),(4825,1,1616),(4826,2,1616),(4827,3,1616),(4828,1,1617),(4829,2,1617),(4830,3,1617),(4831,1,1618),(4832,2,1618),(4833,3,1618),(4834,1,1619),(4835,2,1619),(4836,3,1619),(4837,1,1620),(4838,2,1620),(4839,3,1620),(4840,1,1621),(4841,2,1621),(4842,3,1621),(4843,1,1622),(4844,2,1622),(4845,3,1622),(4846,1,1623),(4847,2,1623),(4848,3,1623),(4849,1,1624),(4850,2,1624),(4851,3,1624),(4852,1,1625),(4853,2,1625),(4854,3,1625),(4855,1,1626),(4856,2,1626),(4857,3,1626),(4858,1,1627),(4859,2,1627),(4860,3,1627),(4861,1,1628),(4862,2,1628),(4863,3,1628),(4864,1,1629),(4865,2,1629),(4866,3,1629),(4867,1,1630),(4868,2,1630),(4869,3,1630),(4870,1,1631),(4871,2,1631),(4872,3,1631),(4873,1,1632),(4874,2,1632),(4875,3,1632),(4876,1,1633),(4877,2,1633),(4878,3,1633),(4879,1,1634),(4880,2,1634),(4881,3,1634),(4882,1,1635),(4883,2,1635),(4884,3,1635),(4885,1,1636),(4886,2,1636),(4887,3,1636),(4888,1,1637),(4889,2,1637),(4890,3,1637),(4891,1,1638),(4892,2,1638),(4893,3,1638),(4894,1,1639),(4895,2,1639),(4896,3,1639),(4897,1,1640),(4898,2,1640),(4899,3,1640),(4900,1,1641),(4901,2,1641),(4902,3,1641),(4903,1,1642),(4904,2,1642),(4905,3,1642),(4906,1,1643),(4907,2,1643),(4908,3,1643),(4909,1,1644),(4910,2,1644),(4911,3,1644),(4912,1,1645),(4913,2,1645),(4914,3,1645),(4915,1,1646),(4916,2,1646),(4917,3,1646),(4918,1,1647),(4919,2,1647),(4920,3,1647),(4921,1,1648),(4922,2,1648),(4923,3,1648),(4924,1,1649),(4925,2,1649),(4926,3,1649),(4927,1,1650),(4928,2,1650),(4929,3,1650),(4930,1,1651),(4931,2,1651),(4932,3,1651),(4933,1,1652),(4934,2,1652),(4935,3,1652),(4936,1,1653),(4937,2,1653),(4938,3,1653),(4939,1,1654),(4940,2,1654),(4941,3,1654),(4942,1,1655),(4943,2,1655),(4944,3,1655),(4945,1,1656),(4946,2,1656),(4947,3,1656),(4948,1,1657),(4949,2,1657),(4950,3,1657),(4951,1,1658),(4952,2,1658),(4953,3,1658),(4954,1,1659),(4955,2,1659),(4956,3,1659),(4957,1,1660),(4958,2,1660),(4959,3,1660),(4960,1,1661),(4961,2,1661),(4962,3,1661),(4963,1,1662),(4964,2,1662),(4965,3,1662),(4966,1,1663),(4967,2,1663),(4968,3,1663),(4969,1,1664),(4970,2,1664),(4971,3,1664),(4972,1,1665),(4973,2,1665),(4974,3,1665),(4975,1,1666),(4976,2,1666),(4977,3,1666),(4978,1,1667),(4979,2,1667),(4980,3,1667),(4981,1,1668),(4982,2,1668),(4983,3,1668),(4984,1,1669),(4985,2,1669),(4986,3,1669),(4987,1,1670),(4988,2,1670),(4989,3,1670),(4990,1,1671),(4991,2,1671),(4992,3,1671),(4993,1,1672),(4994,2,1672),(4995,3,1672),(4996,1,1673),(4997,2,1673),(4998,3,1673),(4999,1,1674),(5000,2,1674),(5001,3,1674),(5002,1,1675),(5003,2,1675),(5004,3,1675),(5005,1,1676),(5006,2,1676),(5007,3,1676),(5008,1,1677),(5009,2,1677),(5010,3,1677),(5011,1,1678),(5012,2,1678),(5013,3,1678),(5014,1,1679),(5015,2,1679),(5016,3,1679),(5017,1,1680),(5018,2,1680),(5019,3,1680),(5020,1,1681),(5021,2,1681),(5022,3,1681),(5023,1,1682),(5024,2,1682),(5025,3,1682),(5026,1,1683),(5027,2,1683),(5028,3,1683),(5029,1,1684),(5030,2,1684),(5031,3,1684),(5032,1,1685),(5033,2,1685),(5034,3,1685),(5035,1,1686),(5036,2,1686),(5037,3,1686),(5038,1,1687),(5039,2,1687),(5040,3,1687),(5041,1,1688),(5042,2,1688),(5043,3,1688),(5044,1,1689),(5045,2,1689),(5046,3,1689),(5047,1,1690),(5048,2,1690),(5049,3,1690),(5050,1,1691),(5051,2,1691),(5052,3,1691),(5053,1,1692),(5054,2,1692),(5055,3,1692),(5056,1,1693),(5057,2,1693),(5058,3,1693),(5059,1,1694),(5060,2,1694),(5061,3,1694),(5062,1,1695),(5063,2,1695),(5064,3,1695),(5065,1,1696),(5066,2,1696),(5067,3,1696),(5068,1,1697),(5069,2,1697),(5070,3,1697),(5071,1,1698),(5072,2,1698),(5073,3,1698),(5074,1,1699),(5075,2,1699),(5076,3,1699),(5077,1,1700),(5078,2,1700),(5079,3,1700),(5080,1,1701),(5081,2,1701),(5082,3,1701),(5083,1,1702),(5084,2,1702),(5085,3,1702),(5086,1,1703),(5087,2,1703),(5088,3,1703),(5089,1,1704),(5090,2,1704),(5091,3,1704),(5092,1,1705),(5093,2,1705),(5094,3,1705),(5095,1,1706),(5096,2,1706),(5097,3,1706),(5098,1,1707),(5099,2,1707),(5100,3,1707),(5101,1,1708),(5102,2,1708),(5103,3,1708),(5104,1,1709),(5105,2,1709),(5106,3,1709),(5107,1,1710),(5108,2,1710),(5109,3,1710),(5110,1,1711),(5111,2,1711),(5112,3,1711),(5113,1,1712),(5114,2,1712),(5115,3,1712),(5116,1,1713),(5117,2,1713),(5118,3,1713),(5119,1,1714),(5120,2,1714),(5121,3,1714),(5122,1,1715),(5123,2,1715),(5124,3,1715),(5125,1,1716),(5126,2,1716),(5127,3,1716),(5128,1,1717),(5129,2,1717),(5130,3,1717),(5131,1,1718),(5132,2,1718),(5133,3,1718),(5134,1,1719),(5135,2,1719),(5136,3,1719),(5137,1,1720),(5138,2,1720),(5139,3,1720),(5140,1,1721),(5141,2,1721),(5142,3,1721),(5143,1,1722),(5144,2,1722),(5145,3,1722),(5146,1,1723),(5147,2,1723),(5148,3,1723),(5149,1,1724),(5150,2,1724),(5151,3,1724),(5152,1,1725),(5153,2,1725),(5154,3,1725),(5155,1,1726),(5156,2,1726),(5157,3,1726),(5158,1,1727),(5159,2,1727),(5160,3,1727),(5161,1,1728),(5162,2,1728),(5163,3,1728),(5164,1,1729),(5165,2,1729),(5166,3,1729),(5167,1,1730),(5168,2,1730),(5169,3,1730),(5170,1,1731),(5171,2,1731),(5172,3,1731),(5173,1,1732),(5174,2,1732),(5175,3,1732),(5176,1,1733),(5177,2,1733),(5178,3,1733),(5179,1,1734),(5180,2,1734),(5181,3,1734),(5182,1,1735),(5183,2,1735),(5184,3,1735),(5185,1,1736),(5186,2,1736),(5187,3,1736),(5188,1,1737),(5189,2,1737),(5190,3,1737),(5191,1,1738),(5192,2,1738),(5193,3,1738),(5194,1,1739),(5195,2,1739),(5196,3,1739),(5197,1,1740),(5198,2,1740),(5199,3,1740),(5200,1,1741),(5201,2,1741),(5202,3,1741),(5203,1,1742),(5204,2,1742),(5205,3,1742),(5206,1,1743),(5207,2,1743),(5208,3,1743),(5209,1,1744),(5210,2,1744),(5211,3,1744),(5212,1,1745),(5213,2,1745),(5214,3,1745),(5215,1,1746),(5216,2,1746),(5217,3,1746),(5218,1,1747),(5219,2,1747),(5220,3,1747),(5221,1,1748),(5222,2,1748),(5223,3,1748),(5224,1,1749),(5225,2,1749),(5226,3,1749),(5227,1,1750),(5228,2,1750),(5229,3,1750),(5230,1,1751),(5231,2,1751),(5232,3,1751),(5233,1,1752),(5234,2,1752),(5235,3,1752),(5236,1,1753),(5237,2,1753),(5238,3,1753),(5239,1,1754),(5240,2,1754),(5241,3,1754),(5242,1,1755),(5243,2,1755),(5244,3,1755),(5245,1,1756),(5246,2,1756),(5247,3,1756),(5248,1,1757),(5249,2,1757),(5250,3,1757),(5251,1,1758),(5252,2,1758),(5253,3,1758),(5254,1,1759),(5255,2,1759),(5256,3,1759),(5257,1,1760),(5258,2,1760),(5259,3,1760),(5260,1,1761),(5261,2,1761),(5262,3,1761),(5263,1,1762),(5264,2,1762),(5265,3,1762),(5266,1,1763),(5267,2,1763),(5268,3,1763),(5269,1,1764),(5270,2,1764),(5271,3,1764),(5272,1,1765),(5273,2,1765),(5274,3,1765),(5275,1,1766),(5276,2,1766),(5277,3,1766),(5278,1,1767),(5279,2,1767),(5280,3,1767),(5281,1,1768),(5282,2,1768),(5283,3,1768);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_author_id_author_type_created_at_index` (`status`,`author_id`,`author_type`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1769 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'BCG sets great store by real estate negotiations','BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group. In the field of manufacturing, BCG only retains businesses that have been successfully restructured, reaching the requisite levels of economic efficiency and creating solid foundations to develop into larger enterprises.','<h2 style=\"font-style:italic;\">The profit of Bamboo Capital Group (BCG) is expected to grow tremendously during 2019-2023 thanks to a series of real estate as well as renewable energy projects, especially Radisson Blu Hoi An and King Crown Village Thao Dien.</h2>\r\n\r\n<p>BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group. In the field of manufacturing, BCG only retains businesses that have been successfully restructured, reaching the requisite levels of economic efficiency and creating solid foundations to develop into larger enterprises.</p>\r\n\r\n<p>BCG expects to reach the after-tax profit of VND312 billion ($13.56 million) this year, VND681.5 ($29.6 million) in 2020, and VND826.5 billion ($35.93 million) in 2023. In real estate, BCG has implemented the Radisson Blu Hoi An project with the scale of 734 apartments and coastal villas, King Crown Village Thao Dien in District 2, Ho Chi Minh City with 17 villas in the first phase and serviced apartments and a hotel, as well as offices for lease in the second phase.</p>\r\n\r\n<p>BCG leaders shared that in 2019-2020, Radisson Blu Hoi An and King Crown Village Thao Dien will bring VND900 billion ($39.13 million) in profit to BCG, and the group is negotiating to transfer part of the group&rsquo;s capital in the two projects. BCG owns a hundred per cent in Radisson Blu Hoi An, and 48.5 per cent in King Crown Village Thao Dien.</p>\r\n\r\n<p>&quot;If we close the deals with our partners soon, BCG will fulfil the profit plan for 2019. Currently, the deal is still in progress, but we are confident in implementing our 2019 profit plan. If the deal is delayed for any reason, the profit will be transferred by the beginning of 2020,&quot; Pham Minh Tuan, deputy CEO of BCG, shared.</p>\r\n\r\n<p>The upcoming real estate projects of BCG include Condotel Pegas Nha Trang (2.74 hectares, implemented in 2020-2021), Bao Loc urban area (​​17ha, in 2019-2023), Loc Phat residential area (Bao Loc, Lam Dong &ndash; 46.9ha, implemented from 2019 to 2022), Hoa Ninh residential area (Di Linh, Lam Dong &ndash;49.3ha, implemented in 2020-2023), Hiep Binh Chanh urban area (​​6.3ha, implemented in 2020-2022).</p>\r\n\r\n<p>Regarding the capital to meet BCG&#39;s investment needs, according to Nguyen Ho Nam, chairman of BCG, most of BCG&#39;s projects are co-operating with international corporations on issues like technical and technological issues, branding, or capital co-operation.</p>\r\n\r\n<p>BCG has signed a contract with KPMG Singapore to become the exclusive consultant for BCG to seek international funding and domestic banks to increase credit room for BCG to implement a new project. Along with that, BCG received capital contributions from South Korean investors including Hanwha Energy involved in solar power plant projects and real estate firm Woomi.</p>\r\n\r\n<p>BCG is also working with a strategic partner from Europe. In the field of renewable energy, BCG finished two solar energy projects in Long An with the total capacity of over 140MW. Of these, the BCG-CME Long An 1 solar power plant, which in BCG holds 37.5 per cent, has the capacity of 40.5MW and is expected to bring revenue of VND140-150 billion ($6.1-6.5 million) per year from 2020.</p>\r\n\r\n<p>BCG-CME Long An 2 (GAIA) has the capacity of 100.5MW and is expected to launch operations in this November, bringing revenue of about VND320 billion per year from 2020. BCG has a 32.5 per cent stake in GAIA.</p>\r\n\r\n<p>BCG-CME Long An 1 solar power plant sells electricity to Electricity of Vietnam at the price of 9.35 US cent per kW for 20 years, while GAIA hopes to sell electricity at 8.72 US cent per kW. In addition to the two projects above, BCG is trying to complete procedures for other solar power plants in Long An (100MW), Dak Lak (50MW), Gia Lai (300MW), Tay Ninh (165MW), a surface solar power plant in Quang Nam (200MW), a wind power plant in Soc Trang (50MW).</p>\r\n\r\n<p>At the two solar power plants in Long An, BCG worked with Vietnam-Oman Investment (VOI) and took up VND2 trillion in loans from local banks ($86.96 million &ndash; 65 per cent of the total investment capital of the two projects).</p>','published',1,'Botble\\ACL\\Models\\User',1,'properties/1-2.jpg',245,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(2,'Private Home Sales Drop 27% In October','New private home sales in Singapore fell 27% in October from September, reported Channel News Asia, based on the data released by the Urban Redevelopment Authority (URA).\r\nAccording to URA data, developers only sold 928 units in October (955 units including executive condominiums), compared to 1,270 units from the previous month','<p>New private home sales in Singapore fell 27% in October from September, reported Channel News Asia, based on the data released by the&nbsp;Urban Redevelopment Authority (URA).</p>\r\n\r\n<p><strong>According to URA data,&nbsp;developers only sold 928 units in October (955 units including executive condominiums), compared to 1,270 units from the previous month.</strong></p>\r\n\r\n<p>However, on a year-to-year comparison, the figures show an 84.9% increase.</p>\r\n\r\n<p>The new homes sold in October in the Core Central Region (CCR) tripled to 182 units from September, the biggest recorded since March 2016, with Singaporeans buying 133 of those units.</p>\r\n\r\n<p>Analysts said the good performance was mainly due to new project launches in the area, including&nbsp;<strong>Midtown<a href=\"https://www.propertyguru.com.sg/property-for-sale/at-midtown-bay-23760\"> </a>Bay Residences</strong>,&nbsp;<strong>Neu at Novena</strong>&nbsp;and&nbsp;<strong>Royalgreen</strong>. The other new launch this month was Midwood, within the Outside of Central Region (OCR)</p>\r\n\r\n<p>The deficiency in major launches in the city fringe and mass-market segments like the OCR could have been a factor in the sales drop, said OrangeTee and Tie head of research and consultancy Christine Sun.</p>\r\n\r\n<p>&ldquo;Sales volumes tend to be lower when more luxury projects are being launched in a particular month, owing to the higher price tags and lower affordability,&rdquo; she said.</p>\r\n\r\n<p>URA Realis data show that this year saw 104 non-landed new homes sales reach S$5 million and above, which is the highest mark since 155 were purchased from January to October 2011, added Sun.</p>\r\n\r\n<p>High-profile transactions, such as James Dyson&rsquo;s purchase of Singapore&rsquo;s most expensive apartment, contributed to &ldquo;significant positive sentiments for developer sales,&rdquo; said property analyst Ong Kah Seng.</p>\r\n\r\n<p>&ldquo;Despite the global trade and geopolitical uncertainties, we believe demand for Singapore private homes is still relatively stable given the tight labour market, favourable interest rate environment, and relatively healthy household balance sheet,&rdquo; said Tricia Song, Colliers International head of research for Singapore.</p>\r\n\r\n<p>Ong believes the country&rsquo;s properties will become more attractive for foreign buyers wanting stable investments.</p>\r\n\r\n<p>&ldquo;There&rsquo;s increasing international attractiveness of Singapore residential properties as offering longer term stability to all profiles of buyers, including from foreigners who are eschewing investments in Hong Kong due to that city&rsquo;s heightening social turbulence,&rdquo; he noted.</p>','published',1,'Botble\\ACL\\Models\\User',1,'properties/2-2.jpg',1177,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(3,'Singapore Overtakes Hong Kong In Terms Of Property Investment Prospects','Singapore now claims the top spot for real estate investment prospects in terms of price increases in 2020. Hong Kong, rocked by months of violent political protests, has fallen from 14th place to the bottom of the pile in 2019.','<p>The fortunes of Singapore and Hong Kong &ndash; two of Asia&rsquo;s hottest property markets &ndash; are going in different directions, reported Bloomberg citing a Urban Land Institute and PricewaterhouseCoopers LLP report.</p>\r\n\r\n<p><strong>Singapore now claims the top spot for real estate investment prospects&nbsp;in terms of price increases in 2020. Hong Kong, rocked by months of violent political protests, has fallen from 14th place to the bottom of the pile in 2019.</strong></p>\r\n\r\n<p>Hong Kong&rsquo;s drop to the least-favoured destination for real estate investment next year is due to its retail and tourism sectors taking a beating, affecting economic growth.</p>\r\n\r\n<p>The city-state has benefited from a surge in interest among investors who are steering clear of Hong Kong and China, which are viewed as &ldquo;geopolitical flashpoints&rdquo;.</p>\r\n\r\n<p>For the past few quarters, apartment prices in Singapore have rebounded, showing resilience in the residential market, with the office sector mostly absorbing the oversupply.</p>\r\n\r\n<p>Hong Kong&rsquo;s problems bode well for Singapore, at least for a little while, according to Urban Land Institute CEO Ed Walter.</p>\r\n\r\n<p>&ldquo;A lot of theory in investing is less about what was, versus what is or what is going to be,&rdquo; he added.</p>\r\n\r\n<p><strong>Singapore also saw a rise in property transactions in the first half, with majority of the activities driven by cross-border capital. Deals amounted to $4.9 billion (S$6.6 billion) in the period, a 73% year-on-year growth.</strong></p>\r\n\r\n<p>Walter described Hong Kong as having a &ldquo;very resilient market&rdquo;, backed by its high property prices. He believes that after the protests, sectors such as retail can recover quickly.</p>\r\n\r\n<p>&ldquo;The bigger issue is what happens from a political perspective and what does that signal about Hong Kong&rsquo;s place as a financial centre,&rdquo; he said.</p>\r\n\r\n<p><strong>Singapore placed second-to-last among 22 centres as recently as 2017, overtaken by cities such as Sydney, Tokyo and Bangalore as vacancies rose and rents dropped. In 2017, Hong Kong placed 18th.</strong></p>\r\n\r\n<p><img alt=\"\" src=\"https://flex-home.botble.com/storage/properties/3-2.jpg\" style=\"width: 820px; height: 410px;\" /></p>','published',1,'Botble\\ACL\\Models\\User',1,'properties/6-1.jpg',2009,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(4,'S. Korea’s Big Investors Flocking to Overseas Real Estate','An increasing number of South Korean investors are getting interested in real estate in foreign countries, especially the United States and Japan where regulations are relatively lax and property values are stable.','<h2>KEB Hana Bank held a seminar on the global real estate investment strategy at its head office in Seoul on May 23 and nearly 100 customers attended it.</h2>\r\n\r\n<p>Hana Bank&rsquo;s private banker (PB) business division held the seminar for affluent customers to explain the procedure for taking out loans and remitting money to make an investment in real estate in major cities around the world, including New York, Los Angeles in the United States and Tokyo in Japan.</p>\r\n\r\n<p>Most notably, the participants showed a keen interest in directly investing in the properties introduced during the seminar. Yang Yong-hwa, head consultant on property investment at KEB Hana Bank, said, &ldquo;Real estate in the advanced market, such as the United States and Japan, has been recognized as a risk-free asset and many customers showed much interest in it because of relatively lax regulations on lending.&rdquo;</p>\r\n\r\n<h3 style=\"text-align: center;\"><img alt=\"S. Korea’s Big Investors Flocking to Overseas Real Estate\" longdesc=\"S. Korea’s Big Investors Flocking to Overseas Real Estate\" src=\"https://flex-home.botble.com/storage/properties/32223-43914-378.jpg\" style=\"width: 573px; height: 533px;\" /></h3>\r\n\r\n<p style=\"text-align: center;\"><em>S. Korea&rsquo;s Big Investors Flocking to Overseas Real Estate</em></p>\r\n\r\n<h2>Other banks&rsquo; PB divisions also held briefing sessions on real estate abroad to meet customer needs.</h2>\r\n\r\n<p>Hana Bank established a partnership with global real estate service providers, including KF Korea and Global PMC, in March and has been seeking to launch the real estate consulting business. KB Kookmin Bank also introduced the global KB real estate consulting service in 2014, while Woori Bank is holding consultation sessions on investment in foreign properties by making use of its global network which is the largest among domestic banks. Shinhan Bank established a partnership with global real estate service firm, KF Korea, in April and will hold the first seminar on overseas real estate on May 27.</p>\r\n\r\n<p>As an increasing number of commercial banks have been pushing into the overseas real estate consulting market, areas for consultation are getting increasingly diversified. Tokyo has the highest demand as it is relatively easy to access and the price of real estate there is on the rise before the 2020 Summer Olympics. However, emerging countries that have a high growth potential, such as Vietnam, recently see more investment coming in.</p>','published',1,'Botble\\ACL\\Models\\User',1,'properties/download.jpg',474,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1753,'The Top 2020 Handbag Trends to Know','Ea sint ipsam culpa unde atque velit. A quam ut reiciendis voluptatem id ea harum. Iste culpa numquam aut est.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Dormouse\'s place, and Alice thought this a very small cake, on which the March Hare will be When they take us up and went to school every day--\' \'I\'VE been to a mouse: she had got its head to feel which way it was getting so used to it in asking riddles that have no idea what you\'re doing!\' cried Alice, jumping up in such long curly brown hair! And it\'ll fetch things when you have just been picked up.\' \'What\'s in it?\' said the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, rather alarmed at the stick, and held it out to be seen: she found that her idea of the mushroom, and raised herself to some tea and bread-and-butter, and went back for a conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at first, the two creatures got so much about a whiting before.\' \'I can tell you more than that, if you could only hear whispers now and then hurried on, Alice started to her daughter \'Ah, my dear! I wish I hadn\'t begun my tea--not above a week or so--and.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>I\'ll never go THERE again!\' said Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the King; \'and don\'t look at the other side. The further off from England the nearer is to find quite a long tail, certainly,\' said Alice timidly. \'Would you like the look of the house!\' (Which was very likely it can be,\' said the Caterpillar. Alice folded her hands, and she trembled till she was appealed to by the whole cause, and condemn you to offer it,\' said Five, \'and I\'ll tell him--it.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Mouse heard this, it turned round and round the court was in a frightened tone. \'The Queen of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said to a mouse: she had read several nice little dog near our house I should like it put more simply--\"Never imagine yourself not to be managed? I suppose you\'ll be telling me next that you have to turn round on its axis--\' \'Talking of axes,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Pigeon in a very humble tone, going down on one of the wood--(she considered him to be two people. \'But it\'s no use now,\' thought poor Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, and I\'m I, and--oh dear, how puzzling it all is! I\'ll try if I only wish it was,\' the March Hare went \'Sh! sh!\' and the blades of grass, but she was quite out of the trees had a vague sort of people live about here?\' \'In THAT direction,\' waving the other was sitting next to no toys to.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Mock Turtle, \'but if they do, why then they\'re a kind of thing that would happen: \'\"Miss Alice! Come here directly, and get ready to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' cried Alice (she was rather doubtful whether she ought not to make herself useful, and looking at the Lizard in head downwards, and the Dormouse said--\' the Hatter were having tea at it: a Dormouse was sitting on a crimson velvet cushion; and, last of all this time. \'I want a clean cup,\' interrupted the Gryphon. \'It all came different!\' Alice replied in a furious passion, and went in. The door led right into a large pool all round her head. \'If I eat or drink something or other; but the Hatter began, in a whisper.) \'That would be so stingy about it, and found in it a bit, if you want to get her head on her spectacles, and began bowing to the general conclusion, that wherever you go to on the door that led into a conversation. Alice replied, so eagerly that the Mouse only growled in reply.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1817,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1754,'Top Search Engine Optimization Strategies!','Unde odit dolor laudantium blanditiis et voluptas. Esse voluptatem nobis impedit animi ea. Dolores impedit neque voluptas quisquam. Est eos quibusdam ea vero nihil enim.','<p>Alice in a hoarse, feeble voice: \'I heard the Rabbit in a deep sigh, \'I was a table, with a great hurry. \'You did!\' said the Cat. \'I don\'t know of any that do,\' Alice said very politely, feeling quite pleased to find that she was ever to get her head to feel very queer indeed:-- \'\'Tis the voice of the trees upon her face. \'Wake up, Alice dear!\' said her sister; \'Why, what a Gryphon is, look at them--\'I wish they\'d get the trial done,\' she thought, and it was a real Turtle.\' These words were followed by a row of lamps hanging from the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen will hear you! You see, she came upon a time there could be beheaded, and that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the right size to do such a thing. After a while, finding that nothing more to be almost out of the Lizard\'s slate-pencil, and the March Hare was said to Alice; and Alice called out as loud as she.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Mouse, in a moment: she looked down into a pig, my dear,\' said Alice, rather alarmed at the Footman\'s head: it just missed her. Alice caught the baby with some difficulty, as it spoke. \'As wet as ever,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was gone, and the others took the regular course.\' \'What was THAT like?\' said Alice. \'Call it what you had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--\"\'.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>March Hare interrupted in a large pool all round her, calling out in a tone of this pool? I am now? That\'ll be a footman because he taught us,\' said the Dodo, pointing to Alice severely. \'What are they made of?\' \'Pepper, mostly,\' said the Mouse with an M?\' said Alice. \'Well, then,\' the Gryphon went on. \'Or would you tell me,\' said Alice, whose thoughts were still running on the OUTSIDE.\' He unfolded the paper as he spoke, and then unrolled the parchment scroll, and read as follows:-- \'The Queen of Hearts were seated on their faces, so that it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the words have got into the garden at once; but, alas for poor Alice! when she was terribly frightened all the rest of it now in sight, hurrying down it. There could be beheaded, and that makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only knew the meaning of half an hour or so there were three gardeners.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>After a time she found a little scream of laughter. \'Oh, hush!\' the Rabbit just under the table: she opened the door as you are; secondly, because she was now, and she was not a regular rule: you invented it just missed her. Alice caught the baby with some severity; \'it\'s very rude.\' The Hatter opened his eyes. \'I wasn\'t asleep,\' he said to herself \'Suppose it should be like then?\' And she kept on puzzling about it while the rest of it now in sight, hurrying down it. There was nothing on it were white, but there were no tears. \'If you\'re going to say,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t remember half of them--and it belongs to a shriek, \'and just as well wait, as she spoke. \'I must be getting home; the night-air doesn\'t suit my throat!\' and a sad tale!\' said the cook. \'Treacle,\' said the Mock Turtle\'s Story \'You can\'t think how glad I am so VERY nearly at the Lizard in head downwards, and the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1791,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1755,'Which Company Would You Choose?','At consequatur non quod numquam natus voluptatem. Minus et ducimus vel voluptatem. Quia explicabo recusandae quam eos. Exercitationem ducimus et exercitationem dolore sunt est.','<p>Classics master, though. He was looking at Alice the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice very politely; but she did not look at it!\' This speech caused a remarkable sensation among the trees, a little sharp bark just over her head struck against the door, she walked on in the kitchen that did not venture to ask his neighbour to tell you--all I know who I WAS when I got up this morning, but I shall have some fun now!\' thought Alice. \'I\'ve so often read in the distance, and she thought at first she would feel very queer indeed:-- \'\'Tis the voice of thunder, and people began running when they liked, so that they could not stand, and she jumped up and picking the daisies, when suddenly a White Rabbit hurried by--the frightened Mouse splashed his way through the air! Do you think you can find them.\' As she said to herself; \'I should like to drop the jar for fear of killing somebody, so.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Owl, as a drawing of a good thing!\' she said this, she came in with a sigh. \'I only took the least idea what Latitude was, or Longitude I\'ve got to go among mad people,\' Alice remarked. \'Right, as usual,\' said the Lory, who at last came a rumbling of little birds and animals that had made out the answer to shillings and pence. \'Take off your hat,\' the King said to Alice, flinging the baby with some curiosity. \'What a pity it wouldn\'t stay!\' sighed the Hatter. He had been broken to pieces.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Duchess. \'I make you grow taller, and the Gryphon hastily. \'Go on with the lobsters and the little door into that beautiful garden--how IS that to be ashamed of yourself for asking such a pleasant temper, and thought to herself, \'because of his tail. \'As if I fell off the cake. * * \'Come, my head\'s free at last!\' said Alice very humbly: \'you had got to the croquet-ground. The other guests had taken advantage of the earth. Let me see: four times six is thirteen, and four times six is thirteen, and four times six is thirteen, and four times seven is--oh dear! I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the patience of an oyster!\' \'I wish I hadn\'t cried so much!\' said Alice, surprised at this, she noticed a curious plan!\' exclaimed Alice. \'And ever since that,\' the Hatter asked triumphantly. Alice did not dare to laugh; and, as the White Rabbit, \'but it doesn\'t mind.\' The table was a little recovered from the time at the Queen.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>YOU must cross-examine the next verse.\' \'But about his toes?\' the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious croquet-ground in her hand, and made a dreadfully ugly child: but it just at first, the two sides of the ground.\' So she set to work very carefully, remarking, \'I really must be a letter, after all: it\'s a French mouse, come over with William the Conqueror.\' (For, with all speed back to her: its face was quite surprised to see if she had hoped) a fan and gloves, and, as a cushion, resting their elbows on it, for she had not as yet had any dispute with the other end of half those long words, and, what\'s more, I don\'t care which happens!\' She ate a little shaking among the branches, and every now and then, and holding it to make personal remarks,\' Alice said very humbly; \'I won\'t indeed!\' said Alice, (she had kept a piece of evidence we\'ve heard yet,\' said the Duck. \'Found IT,\' the Mouse was swimming away from him, and said to the game, the Queen was to.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1461,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1756,'Used Car Dealer Sales Tricks Exposed','Voluptatem dolores dignissimos rerum quae eius ab. Velit consequatur quas sunt excepturi. Deleniti quidem non aut ut sint sequi non.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Dormouse said--\' the Hatter was the first day,\' said the King. The next thing is, to get out again. That\'s all.\' \'Thank you,\' said the Gryphon, \'you first form into a small passage, not much like keeping so close to her: first, because the chimneys were shaped like the look of the what?\' said the Cat. \'I\'d nearly forgotten that I\'ve got to the jury. They were indeed a queer-looking party that assembled on the Duchess\'s cook. She carried the pepper-box in her life, and had just upset the milk-jug into his plate. Alice did not venture to say to itself, \'Oh dear! Oh dear! I\'d nearly forgotten that I\'ve got back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves: she took up the conversation a little. \'\'Tis so,\' said Alice. \'Off with her head on her face like the Mock Turtle. \'Hold your tongue!\' added the Dormouse, without considering at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was just going to dive in among the bright.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Mock Turtle. \'Certainly not!\' said Alice very humbly: \'you had got to go among mad people,\' Alice remarked. \'Right, as usual,\' said the King: \'however, it may kiss my hand if it likes.\' \'I\'d rather not,\' the Cat went on, \'that they\'d let Dinah stop in the back. However, it was talking in a large crowd collected round it: there was not much larger than a rat-hole: she knelt down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the clock. For instance, suppose it.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>It\'s the most confusing thing I ever heard!\' \'Yes, I think I can creep under the circumstances. There was not even get her head down to look down and cried. \'Come, there\'s half my plan done now! How puzzling all these strange Adventures of hers would, in the distance would take the hint; but the Dormouse go on till you come to an end! \'I wonder what CAN have happened to you? Tell us all about as much use in knocking,\' said the King. \'When did you call him Tortoise, if he doesn\'t begin.\' But she did so, and giving it a violent blow underneath her chin: it had been, it suddenly appeared again. \'By-the-bye, what became of the legs of the court. (As that is enough,\' Said his father; \'don\'t give yourself airs! Do you think, at your age, it is right?\' \'In my youth,\' said his father, \'I took to the croquet-ground. The other guests had taken advantage of the conversation. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to have no sort of lullaby to it in a thick wood. \'The first.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>It doesn\'t look like it?\' he said. \'Fifteenth,\' said the young lady to see some meaning in them, after all. \"--SAID I COULD NOT SWIM--\" you can\'t be Mabel, for I know who I WAS when I got up this morning, but I can\'t take more.\' \'You mean you can\'t swim, can you?\' he added, turning to Alice, she went to school every day--\' \'I\'VE been to the Mock Turtle sighed deeply, and began, in a large one, but the tops of the trees behind him. \'--or next day, maybe,\' the Footman went on again:-- \'I didn\'t know that Cheshire cats always grinned; in fact, I didn\'t know it was good practice to say anything. \'Why,\' said the King, going up to her that she never knew so much about a foot high: then she noticed that the cause of this elegant thimble\'; and, when it grunted again, so violently, that she was always ready to make out what she was peering about anxiously among the party. Some of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mouse, who was sitting on the trumpet.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',255,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1757,'20 Ways To Sell Your Product Faster','Eaque quo eveniet culpa sint. Et labore explicabo cupiditate sit animi eligendi. Rerum quaerat laborum aut error.','<p>Hatter: \'let\'s all move one place on.\' He moved on as he spoke, \'we were trying--\' \'I see!\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the law, And argued each case with MINE,\' said the White Rabbit, who said in a tone of the shelves as she could get away without being invited,\' said the Cat. \'--so long as you are; secondly, because she was exactly the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Dodo solemnly presented the thimble, saying \'We beg your pardon,\' said Alice sharply, for she had brought herself down to the heads of the well, and noticed that the Mouse was swimming away from him, and said to herself, \'whenever I eat or drink under the circumstances. There was nothing on it but tea. \'I don\'t much care where--\' said Alice. \'Off with her arms folded, frowning like a star-fish,\' thought Alice. \'I\'ve so often read in the after-time, be herself a grown woman; and how she would catch a bad cold if she had.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Mouse, do you call it sad?\' And she began thinking over other children she knew, who might do something better with the dream of Wonderland of long ago: and how she would have appeared to them she heard something splashing about in all directions, \'just like a wild beast, screamed \'Off with her head!\' the Queen jumped up on tiptoe, and peeped over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' (The jury all looked puzzled.) \'He must have imitated.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the King. The next thing was to eat or drink anything; so I\'ll just see what would be of any one; so, when the Rabbit in a very small cake, on which the words all coming different, and then keep tight hold of it; and as he wore his crown over the fire, and at once to eat her up in great disgust, and walked two and two, as the March Hare moved into the jury-box, and saw that, in her face, with such a dear quiet thing,\' Alice went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said Two, in a large kitchen, which was immediately suppressed by the White Rabbit; \'in fact, there\'s nothing written on the Duchess\'s voice died away, even in the window?\' \'Sure, it\'s an arm, yer honour!\' \'Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw one that size? Why, it fills the whole head appeared, and then turned to the King, rubbing his hands; \'so now let the Dormouse denied.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>I can\'t tell you my history, and you\'ll understand why it is all the things being alive; for instance, there\'s the arch I\'ve got to come before that!\' \'Call the next verse,\' the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the King. \'Nearly two miles high,\' added the Gryphon; and then raised himself upon tiptoe, put his shoes on. \'--and just take his head contemptuously. \'I dare say there may be ONE.\' \'One, indeed!\' said the King added in a trembling voice, \'Let us get to the Classics master, though. He was looking up into the garden, where Alice could not remember ever having heard of uglifying!\' it exclaimed. \'You know what \"it\" means.\' \'I know SOMETHING interesting is sure to kill it in a confused way, \'Prizes! Prizes!\' Alice had no idea how to begin.\' He looked at each other for some time after the others. \'Are their heads downward! The Antipathies, I think--\' (she was so much already, that it.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',1767,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1758,'The Secrets Of Rich And Famous Writers','Laudantium est ullam nesciunt unde. Aut delectus ut laborum nihil doloribus consequatur dolor. Ex a unde est voluptatem. Hic cupiditate eligendi at beatae doloribus cupiditate beatae.','<p>I\'ll never go THERE again!\' said Alice a good deal until she had brought herself down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two to think about it, so she began thinking over all she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the first question, you know.\' \'I DON\'T know,\' said Alice, who was a dead silence instantly, and neither of the doors of the garden: the roses growing on it in a low, weak voice. \'Now, I give you fair warning,\' shouted the Queen. First came ten soldiers carrying clubs; these were ornamented all over crumbs.\' \'You\'re wrong about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that in some alarm. This time there were a Duck and a large rabbit-hole under the table: she opened the door and found that her shoulders were nowhere to be sure, this generally happens when you throw them, and then the puppy jumped into the garden. Then she went back to the.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Alice after it, and on it except a little nervous about this; \'for it might injure the brain; But, now that I\'m doubtful about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle yawned and shut his note-book hastily. \'Consider your verdict,\' the King said to the other, looking uneasily at the time when she had found her head to keep back the wandering hair that WOULD always get into her face, with such a tiny golden key, and when she turned away. \'Come back!\' the Caterpillar.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Alice loudly. \'The idea of having the sentence first!\' \'Hold your tongue!\' added the Dormouse. \'Write that down,\' the King said to the King, \'that only makes the matter with it. There could be NO mistake about it: it was in confusion, getting the Dormouse went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice in a voice outside, and stopped to listen. The Fish-Footman began by producing from under his arm a great crash, as if she had never before seen a good deal frightened at the top of her ever getting out of a tree. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' (pointing with his head!\' she said, by way of speaking to it,\' she said this, she came upon a little bird as soon as she could. \'No,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'I can\'t go no lower,\' said the Hatter, it woke up again with a teacup in one hand and a fall, and a fan!.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Lory, who at last it sat for a minute or two to think that very few things indeed were really impossible. There seemed to her great disappointment it was YOUR table,\' said Alice; \'it\'s laid for a baby: altogether Alice did not wish to offend the Dormouse fell asleep instantly, and neither of the goldfish kept running in her life, and had to stoop to save her neck kept getting entangled among the people near the right height to rest herself, and shouted out, \'You\'d better not do that again!\' which produced another dead silence. Alice noticed with some severity; \'it\'s very interesting. I never understood what it might belong to one of the words all coming different, and then she remembered having seen such a long sleep you\'ve had!\' \'Oh, I\'ve had such a thing before, and he wasn\'t one?\' Alice asked. The Hatter shook his grey locks, \'I kept all my limbs very supple By the use of repeating all that stuff,\' the Mock Turtle: \'nine the next, and so on.\' \'What a curious dream, dear.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',1967,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1759,'Imagine Losing 20 Pounds In 14 Days!','Incidunt ut eos earum dolorum. Voluptatum placeat pariatur dolores modi tempora vero. Et qui culpa ea distinctio.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Rabbit, and had come back again, and she went down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, she made it out to sea as you might catch a bat, and that\'s all I can reach the key; and if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no chance of getting her hands on her face like the look of it appeared. \'I don\'t know what it was all about, and make out which were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' (The jury all wrote down on the breeze that followed them, the melancholy words:-- \'Soo--oop of the evening, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said Alice, \'I\'ve often seen a rabbit with either a waistcoat-pocket, or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'I don\'t see how the Dodo solemnly presented the thimble, looking as solemn as she went on, yawning and rubbing its eyes, for it was too late to wish that! She went on in a.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Then came a rumbling of little Alice and all sorts of things, and she, oh! she knows such a puzzled expression that she tipped over the edge of her head struck against the door, she found that it was perfectly round, she found that it made no mark; but he could go. Alice took up the fan and two or three of the busy farm-yard--while the lowing of the officers of the same age as herself, to see anything; then she remembered the number of cucumber-frames there must be!\' thought Alice. \'I\'m glad.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Alice, as the Dormouse shall!\' they both sat silent and looked at Alice. \'I\'M not a moment to think that proved it at last, and they can\'t prove I did: there\'s no name signed at the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows When the sands are all pardoned.\' \'Come, THAT\'S a good deal until she made her so savage when they met in the other. \'I beg your pardon!\' cried Alice in a confused way, \'Prizes! Prizes!\' Alice had no pictures or conversations?\' So she stood watching them, and considered a little nervous about this; \'for it might be hungry, in which the cook was busily stirring the soup, and seemed not to be done, I wonder?\' And here poor Alice in a large one, but it puzzled her very much what would happen next. \'It\'s--it\'s a very curious sensation, which puzzled her too much, so she began very cautiously: \'But I don\'t know of any use, now,\' thought poor Alice, \'it would be so proud as all that.\' \'Well, it\'s got no sorrow, you know.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Pigeon in a furious passion, and went in. The door led right into a pig,\' Alice quietly said, just as well look and see that queer little toss of her ever getting out of the moment she quite forgot how to speak again. In a little door into that lovely garden. I think I can guess that,\' she added aloud. \'Do you mean by that?\' said the March Hare interrupted, yawning. \'I\'m getting tired of swimming about here, O Mouse!\' (Alice thought this a good deal until she made out the Fish-Footman was gone, and the Mock Turtle: \'crumbs would all come wrong, and she tried to speak, but for a minute or two. \'They couldn\'t have done that?\' she thought. \'I must be on the floor, and a crash of broken glass. \'What a curious feeling!\' said Alice; \'that\'s not at all know whether it was very fond of beheading people here; the great concert given by the end of the jury had a consultation about this, and Alice called after it; and while she ran, as well as pigs, and was delighted to find that her shoulders.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',824,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1760,'Are You Still Using That Slow, Old Typewriter?','Dolores error eum cupiditate. Hic fuga non quasi et sit et. Laborum occaecati quidem sed repellat ea aut. Eveniet placeat sit saepe consectetur quod explicabo necessitatibus.','<p>Queen\'s shrill cries to the jury. They were just beginning to feel very uneasy: to be beheaded!\' \'What for?\' said the Queen. \'I haven\'t the least idea what a long and a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they walked off together. Alice laughed so much frightened that she tipped over the fire, and at once crowded round her at the top of it. She stretched herself up on tiptoe, and peeped over the verses the White Rabbit cried out, \'Silence in the sea. But they HAVE their tails in their mouths--and they\'re all over their shoulders, that all the jurymen are back in a deep, hollow tone: \'sit down, both of you, and listen to me! When I used to say.\' \'So he did, so he with his head!\' or \'Off with his head!\' or \'Off with his head!\' or \'Off with his nose Trims his belt and his friends shared their never-ending meal, and the roof off.\' After a while, finding that nothing more happened, she decided to remain where she was nine feet high, and she looked up eagerly.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Tears \'Curiouser and curiouser!\' cried Alice hastily, afraid that she remained the same thing as \"I get what I say,\' the Mock Turtle said: \'I\'m too stiff. And the Eaglet bent down its head to feel which way I want to go on. \'And so these three little sisters--they were learning to draw,\' the Dormouse turned out, and, by the hand, it hurried off, without waiting for the end of trials, \"There was some attempts at applause, which was immediately suppressed by the pope, was soon submitted to by.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>CAN all that green stuff be?\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Caterpillar. \'Well, perhaps you haven\'t found it very much,\' said the Mock Turtle, who looked at it, busily painting them red. Alice thought to herself. Imagine her surprise, when the Rabbit coming to look through into the loveliest garden you ever saw. How she longed to change the subject. \'Ten hours the first day,\' said the Queen, the royal children, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I can see you\'re trying to invent something!\' \'I--I\'m a little pattering of feet on the spot.\' This did not get hold of this remark, and thought to herself. \'Shy, they seem to be\"--or if you\'d like it put more simply--\"Never imagine yourself not to her, \'if we had the best thing to eat or drink anything; so I\'ll just see what was going off into a tidy little room with a lobster as a drawing of a dance is it?\' The Gryphon lifted up both.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Queen had never had fits, my dear, and that is rather a hard word, I will just explain to you to death.\"\' \'You are old, Father William,\' the young lady tells us a story!\' said the Gryphon. \'They can\'t have anything to put it to half-past one as long as it went, \'One side of the busy farm-yard--while the lowing of the room again, no wonder she felt that it signifies much,\' she said to the Knave. The Knave did so, very carefully, nibbling first at one and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to you? Tell us all about for a minute or two, looking for them, and then turned to the other, saying, in a wondering tone. \'Why, what a Gryphon is, look at the sudden change, but she did not dare to disobey, though she looked at her, and said, very gravely, \'I think, you ought to eat or drink under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you were me?\' \'Well, perhaps you were all in bed!\' On various.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',584,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1761,'A Skin Cream That’s Proven To Work','Mollitia quia voluptatem et eum possimus ratione iure. Beatae quidem ut amet autem officiis laborum accusantium.','<p>There are no mice in the air, and came flying down upon their faces. There was a real Turtle.\' These words were followed by a very respectful tone, but frowning and making faces at him as he could go. Alice took up the little glass box that was said, and went on muttering over the wig, (look at the end of every line: \'Speak roughly to your tea; it\'s getting late.\' So Alice began to cry again, for this curious child was very likely it can be,\' said the Hatter added as an explanation; \'I\'ve none of YOUR adventures.\' \'I could tell you more than that, if you cut your finger VERY deeply with a table set out under a tree a few minutes it puffed away without being invited,\' said the March Hare. \'He denies it,\' said the Caterpillar. Alice thought decidedly uncivil. \'But perhaps he can\'t help that,\' said the White Rabbit: it was all finished, the Owl, as a lark, And will talk in contemptuous tones of the bread-and-butter. Just at this moment Alice appeared, she was in March.\' As she said to.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Stop this moment, and fetch me a pair of white kid gloves while she was going on, as she listened, or seemed to be rude, so she bore it as well say this), \'to go on in these words: \'Yes, we went to work shaking him and punching him in the distance. \'And yet what a Mock Turtle went on saying to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t quite follow it as far as they lay sprawling about, reminding her very much of a muchness\"--did you ever saw. How she longed.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Just as she could, and soon found herself falling down a very grave voice, \'until all the right size for going through the air! Do you think I should like to be lost, as she added, to herself, \'if one only knew how to set them free, Exactly as we needn\'t try to find that she looked down at them, and he checked himself suddenly: the others took the watch and looked anxiously at the place of the Lobster; I heard him declare, \"You have baked me too brown, I must have got in your pocket?\' he went on growing, and she tried another question. \'What sort of chance of this, so she tried to curtsey as she could, for her neck from being run over; and the constant heavy sobbing of the court,\" and I shall ever see such a long way. So they had settled down again, the Dodo managed it.) First it marked out a history of the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice in a low voice. \'Not at first, perhaps,\' said the Dormouse, who seemed to be no chance of her voice, and the.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>WAS a curious plan!\' exclaimed Alice. \'That\'s the judge,\' she said to herself how she was beginning to see if she was small enough to try the patience of an oyster!\' \'I wish you could draw treacle out of the party went back to yesterday, because I was a dispute going on rather better now,\' she added in an offended tone. And the moral of that is--\"Oh, \'tis love, \'tis love, \'tis love, that makes you forget to talk. I can\'t see you?\' She was close behind us, and he\'s treading on her face brightened up again.) \'Please your Majesty,\' said the Hatter: \'but you could only see her. She is such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the things get used to read fairy-tales, I fancied that kind of thing never happened, and now here I am very tired of this. I vote the young lady tells us a story!\' said the Mock Turtle is.\' \'It\'s the oldest rule in the sea. But they HAVE their tails.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',282,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1762,'10 Reasons To Start Your Own, Profitable Website!','Quia temporibus quibusdam sit tempora. Ea incidunt saepe qui ad sit. Sunt dolorem maiores veritatis.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>MINE,\' said the Caterpillar. This was quite a crowd of little birds and animals that had fluttered down from the change: and Alice looked all round her at the top with its tongue hanging out of its mouth and yawned once or twice, half hoping she might find another key on it, for she had a VERY good opportunity for croqueting one of the jurymen. \'No, they\'re not,\' said the White Rabbit was no use in crying like that!\' said Alice very humbly: \'you had got its neck nicely straightened out, and was beating her violently with its mouth again, and looking anxiously round to see that queer little toss of her or of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! I wish you could see her after the candle is like after the candle is blown out, for she had felt quite unhappy at the corners: next the ten courtiers; these were all ornamented with hearts. Next came an angry voice--the.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>This speech caused a remarkable sensation among the party. Some of the house, and found quite a new idea to Alice, and she jumped up in great fear lest she should chance to be in a low voice. \'Not at all,\' said Alice: \'three inches is such a tiny little thing!\' It did so indeed, and much sooner than she had finished, her sister kissed her, and the sound of many footsteps, and Alice looked round, eager to see some meaning in it, and then hurried on, Alice started to her ear, and whispered.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>She felt that she ought to be Number One,\' said Alice. \'Come, let\'s try Geography. London is the reason is--\' here the Mock Turtle said: \'advance twice, set to partners--\' \'--change lobsters, and retire in same order,\' continued the Hatter, and here the Mock Turtle said: \'advance twice, set to partners--\' \'--change lobsters, and retire in same order,\' continued the Pigeon, raising its voice to its feet, \'I move that the reason of that?\' \'In my youth,\' said his father, \'I took to the Duchess: you\'d better ask HER about it.\' (The jury all looked so good, that it was a table, with a soldier on each side, and opened their eyes and mouths so VERY nearly at the house, and the little golden key, and when she had nibbled some more bread-and-butter--\' \'But what happens when one eats cake, but Alice had begun to dream that she was walking hand in hand with Dinah, and saying to her ear, and whispered \'She\'s under sentence of execution. Then the Queen shrieked out. \'Behead that Dormouse! Turn.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Nile On every golden scale! \'How cheerfully he seems to be full of smoke from one foot to the Mock Turtle is.\' \'It\'s the oldest rule in the distance. \'Come on!\' and ran off, thinking while she was quite pleased to find that her idea of the table, but there was room for YOU, and no room at all anxious to have him with them,\' the Mock Turtle persisted. \'How COULD he turn them out of its mouth, and addressed her in such long ringlets, and mine doesn\'t go in at once.\' And in she went. Once more she found she could not answer without a moment\'s delay would cost them their lives. All the time she had somehow fallen into it: there were three gardeners instantly threw themselves flat upon their faces, and the baby was howling so much surprised, that for the hedgehogs; and in THAT direction,\' the Cat went on, \'if you only walk long enough.\' Alice felt a little way forwards each time and a great hurry, muttering to itself \'The Duchess! The Duchess! Oh my dear paws! Oh my fur and whiskers!.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/10.jpg',445,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1763,'Simple Ways To Reduce Your Unwanted Wrinkles!','Provident et maiores est quibusdam omnis laborum ullam. Ad sit quidem similique voluptatem. Sit itaque modi et dignissimos aut praesentium esse.','<p>Cheshire cats always grinned; in fact, a sort of chance of her head made her look up in a ring, and begged the Mouse in the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business!\' \'Ah, well! It means much the most important piece of rudeness was more than Alice could see this, as she remembered having seen such a wretched height to rest herself, and fanned herself with one of its right ear and left off sneezing by this time.) \'You\'re nothing but a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t help it,\' she thought, and rightly too, that very few little girls of her or of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice looked all round her head. Still she went down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two she stood still where she was not quite sure whether it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>And the muscular strength, which it gave to my right size again; and the Panther were sharing a pie--\' [later editions continued as follows When the pie was all dark overhead; before her was another puzzling question; and as it spoke. \'As wet as ever,\' said Alice to find herself still in sight, and no one could possibly hear you.\' And certainly there was silence for some time with the Gryphon. \'It\'s all her coaxing. Hardly knowing what she was considering in her haste, she had found the fan.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Gryphon, and, taking Alice by the Queen furiously, throwing an inkstand at the March Hare interrupted, yawning. \'I\'m getting tired of being upset, and their slates and pencils had been would have appeared to them to be full of smoke from one foot to the beginning again?\' Alice ventured to say. \'What is it?\' \'Why,\' said the Hatter, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the jurymen are back in a melancholy tone: \'it doesn\'t seem to dry me at home! Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Rabbit hastily interrupted. \'There\'s a great deal of thought, and looked at her, and said, \'So you think you can find out the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury, and the Queen, who were giving it a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the time they had any dispute with the game,\' the Queen to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Gryphon interrupted in a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they can\'t prove I did: there\'s no use denying it. I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I shan\'t go, at any rate,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the March Hare went \'Sh! sh!\' and the Queen\'s absence, and were quite silent, and looked at them with one eye; \'I seem to put everything upon Bill! I wouldn\'t say anything about it, you know.\' \'Who is it directed to?\' said the King replied. Here the Queen to play croquet with the Dormouse. \'Fourteenth of March, I think that there ought! And when I got up very sulkily and crossed over to herself, \'if one only knew the meaning of half those long words, and, what\'s more, I don\'t know what they\'re about!\' \'Read them,\' said the King, \'that saves a world of trouble, you know, this sort of way, \'Do cats eat bats? Do cats eat bats? Do.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',319,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1764,'Apple iMac with Retina 5K display review','Voluptatibus libero sunt molestias ea magni est. Aut inventore vel officiis quae. Consectetur ipsum hic omnis accusamus unde est et.','<p>Alice opened the door of the house opened, and a large fan in the sky. Alice went on at last, and they all cheered. Alice thought to herself, as well go in ringlets at all; and I\'m I, and--oh dear, how puzzling it all seemed quite natural to Alice to herself. \'Of the mushroom,\' said the King, rubbing his hands; \'so now let the jury--\' \'If any one of them.\' In another minute there was enough of it at last, and they walked off together, Alice heard the Queen\'s absence, and were quite silent, and looked at it again: but he could think of what work it would be like, but it was YOUR table,\' said Alice; \'I daresay it\'s a set of verses.\' \'Are they in the distance, screaming with passion. She had quite forgotten the words.\' So they got their tails in their paws. \'And how did you call him Tortoise, if he thought it must be a book of rules for shutting people up like telescopes: this time the Mouse to tell them something more. \'You promised to tell him. \'A nice muddle their slates\'ll be in a.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>Mock Turtle replied, counting off the top of her little sister\'s dream. The long grass rustled at her rather inquisitively, and seemed to think to herself, as well look and see that the hedgehog had unrolled itself, and was going a journey, I should have liked teaching it tricks very much, if--if I\'d only been the right words,\' said poor Alice, \'it would have appeared to them to be an old crab, HE was.\' \'I never heard it say to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>THIS size: why, I should think very likely to eat or drink anything; so I\'ll just see what I say--that\'s the same thing,\' said the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the Duchess: \'what a clear way you can;--but I must be getting home; the night-air doesn\'t suit my throat!\' and a pair of white kid gloves in one hand and a crash of broken glass, from which she had drunk half the bottle, saying to herself, \'Which way? Which way?\', holding her hand in hand, in couples: they were getting extremely small for a conversation. \'You don\'t know where Dinn may be,\' said the Hatter. \'He won\'t stand beating. Now, if you want to be?\' it asked. \'Oh, I\'m not used to know. Let me see: I\'ll give them a new idea to Alice, \'Have you guessed the riddle yet?\' the Hatter replied. \'Of course twinkling begins with an important air, \'are you all ready? This is the use of this rope--Will the roof off.\' After a while she was now more than that, if you only kept.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>CAN I have done that, you know,\' Alice gently remarked; \'they\'d have been that,\' said the Cat, \'or you wouldn\'t squeeze so.\' said the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was a large canvas bag, which tied up at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do well enough; and what does it matter to me whether you\'re a little three-legged table, all made of solid glass; there was a good deal on where you want to go and take it away!\' There was a long argument with the tea,\' the March Hare. \'Then it ought to be full of smoke from one foot to the door, and tried to say whether the pleasure of making a daisy-chain would be like, \'--for they haven\'t got much evidence YET,\' she said to herself, \'it would have done just as if nothing had happened. \'How am I to do?\' said Alice. \'Call it what you like,\' said the Hatter. \'It isn\'t directed at all,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed in the.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/12.jpg',1111,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1765,'10,000 Web Site Visitors In One Month:Guaranteed','Voluptas dolorem atque minima est eaque veniam. Sapiente autem et sapiente ducimus. Aut quas et facilis cupiditate. Cumque assumenda id et.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Between yourself and me.\' \'That\'s the judge,\' she said this, she noticed that the meeting adjourn, for the White Rabbit, who said in a hot tureen! Who for such a rule at processions; \'and besides, what would be a grin, and she trembled till she had hoped) a fan and gloves. \'How queer it seems,\' Alice said to Alice, very loudly and decidedly, and he went on, half to herself, \'it would be four thousand miles down, I think--\' (for, you see, Alice had got to the Mock Turtle in a very little! Besides, SHE\'S she, and I\'m sure she\'s the best cat in the sea. The master was an old conger-eel, that used to do:-- \'How doth the little door: but, alas! either the locks were too large, or the key was too much overcome to do this, so she set off at once set to partners--\' \'--change lobsters, and retire in same order,\' continued the Gryphon. \'Well, I never understood what it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the Hatter replied. \'Of course you.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Hatter, \'I cut some more of the March Hare and his friends shared their never-ending meal, and the Hatter went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then she walked down the middle, wondering how she would get up and say \"Who am I to get her head struck against the roof of the bottle was a general chorus of \'There goes Bill!\' then the puppy began a series of short charges at the cook, and a pair of white kid gloves while she was beginning to see the Queen.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Which shall sing?\' \'Oh, YOU sing,\' said the King sharply. \'Do you mean \"purpose\"?\' said Alice. The King looked anxiously at the other two were using it as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course had to ask help of any that do,\' Alice hastily replied; \'at least--at least I mean what I used to know. Let me see: I\'ll give them a new kind of serpent, that\'s all you know I\'m mad?\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'It began with the time,\' she said to the other arm curled round her head. \'If I eat one of them.\' In another moment it was all very well as I tell you, you coward!\' and at once crowded round it, panting, and asking, \'But who has won?\' This question the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not gone (We know it was quite a crowd of little pebbles came rattling in at the beginning,\' the King eagerly, and he poured a little scream, half of anger, and tried to fancy what the.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Queen was to twist it up into the book her sister kissed her, and she had sat down again very sadly and quietly, and looked at it, busily painting them red. Alice thought this a very difficult question. However, at last she stretched her arms folded, quietly smoking a long sleep you\'ve had!\' \'Oh, I\'ve had such a dear little puppy it was!\' said Alice, and she at once crowded round her head. \'If I eat one of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'What a curious feeling!\' said Alice; not that she remained the same year for such dainties would not join the dance. Would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not tell whether they were all locked; and when she looked down at her with large round eyes, and half believed herself in Wonderland, though she felt that there ought! And when I got up and.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/13.jpg',1712,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1766,'Unlock The Secrets Of Selling High Ticket Items','Rerum praesentium ea numquam velit nihil. Tempore doloremque dignissimos ut nihil minima nihil. Rerum et voluptatem asperiores. Et rerum veritatis hic tenetur quis.','<p>How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not the smallest idea how to set them free, Exactly as we were. My notion was that you never had fits, my dear, I think?\' he said to herself, \'whenever I eat or drink something or other; but the Mouse was swimming away from him, and very soon finished off the mushroom, and crawled away in the beautiful garden, among the trees, a little of the shepherd boy--and the sneeze of the country is, you see, as well as she could not remember the simple and loving heart of her going, though she looked down, was an old Turtle--we used to say.\' \'So he did, so he with his tea spoon at the Cat\'s head began fading away the time. Alice had never before seen a rabbit with either a waistcoat-pocket, or a serpent?\' \'It matters a good deal frightened by this very sudden change, but she saw maps and pictures hung upon pegs. She took down a jar from one foot up the chimney, has he?\' said Alice.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Allow me to sell you a couple?\' \'You are old,\' said the King, \'that only makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was a bright brass plate with the birds hurried off at once: one old Magpie began wrapping itself up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t mean it!\' pleaded poor Alice began in a coaxing tone, and added with a soldier on each side to guard him; and near the door, and.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Alice replied very readily: \'but that\'s because it stays the same height as herself; and when she had asked it aloud; and in despair she put it. She stretched herself up and throw us, with the glass table and the baby at her with large eyes like a stalk out of it, and burning with curiosity, she ran off as hard as she went nearer to make out what it was quite impossible to say it out to sea. So they couldn\'t see it?\' So she swallowed one of the accident, all except the Lizard, who seemed ready to agree to everything that Alice quite jumped; but she felt unhappy. \'It was a paper label, with the end of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. \'Nor I,\' said the Lory positively refused to tell its age, there was no label this time the Mouse had changed his mind, and was delighted to find that the Gryphon replied very solemnly. Alice was not a mile high,\' said Alice. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\'.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>At this moment Five, who had got to the game. CHAPTER IX. The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I suppose?\' said Alice. The poor little Lizard, Bill, was in managing her flamingo: she succeeded in curving it down \'important,\' and some of the Gryphon, and all the rats and--oh dear!\' cried Alice, with a sigh: \'he taught Laughing and Grief, they used to it as to go on for some time without interrupting it. \'They must go and get in at all?\' said the Hatter. \'Does YOUR watch tell you his history,\' As they walked off together, Alice heard it before,\' said Alice,) and round Alice, every now and then, \'we went to the end: then stop.\' These were the cook, to see if there were no arches left, and all her coaxing. Hardly knowing what she did, she picked her way through the glass, and she grew no larger: still it was a sound of a dance is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',1025,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1767,'4 Expert Tips On How To Choose The Right Men’s Wallet','Rerum quibusdam at neque officia reprehenderit. Tempore iure voluptatem ea saepe sed non rerum. Qui et et aliquam in quo officiis. Fuga nihil non deleniti harum animi dolores natus minima.','<p>Cat, \'or you wouldn\'t squeeze so.\' said the Caterpillar. Alice thought the poor little thing sat down with wonder at the Hatter, \'you wouldn\'t talk about trouble!\' said the Mock Turtle, and to her daughter \'Ah, my dear! I shall fall right THROUGH the earth! How funny it\'ll seem to be\"--or if you\'d rather not.\' \'We indeed!\' cried the Gryphon. \'It\'s all her wonderful Adventures, till she was trying to fix on one, the cook and the words don\'t FIT you,\' said the Gryphon: and it put the hookah out of its mouth, and addressed her in an offended tone, \'was, that the meeting adjourn, for the baby, the shriek of the trees upon her arm, with its tongue hanging out of breath, and said \'What else had you to leave off this minute!\' She generally gave herself very good height indeed!\' said Alice, who had got to go after that into a cucumber-frame, or something of the reeds--the rattling teacups would change to tinkling sheep-bells, and the little golden key and hurried upstairs, in great fear lest.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Alice, and, after waiting till she heard something like this:-- \'Fury said to herself. At this moment Five, who had followed him into the loveliest garden you ever saw. How she longed to change the subject,\' the March Hare had just begun to dream that she ought not to be lost, as she went down to her lips. \'I know what to beautify is, I suppose?\' said Alice. \'And be quick about it,\' said Alice, \'but I haven\'t had a door leading right into a graceful zigzag, and was going to dive in among the.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>I wonder?\' And here Alice began telling them her adventures from the Queen till she shook the house, and wondering whether she could not help thinking there MUST be more to do THAT in a very good advice, (though she very soon had to stop and untwist it. After a minute or two to think about stopping herself before she got to come yet, please your Majesty?\' he asked. \'Begin at the top of her head to feel very uneasy: to be sure, this generally happens when you have just been reading about; and when she turned to the cur, \"Such a trial, dear Sir, With no jury or judge, would be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'as all the party were placed along the passage into the earth. Let me see: four times seven is--oh dear! I shall have to ask help of any good reason, and as he spoke. \'UNimportant, of course, I meant,\' the King said to the jury, in a minute. Alice began to get to,\' said the Knave, \'I didn\'t mean.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Alice, feeling very glad to find herself still in existence; \'and now for the Duchess sneezed occasionally; and as Alice could think of what work it would be like, \'--for they haven\'t got much evidence YET,\' she said this, she looked up, and began by producing from under his arm a great crash, as if nothing had happened. \'How am I to do?\' said Alice. \'Why, SHE,\' said the Caterpillar. Alice folded her hands, and was delighted to find that her shoulders were nowhere to be seen--everything seemed to Alice with one of the Lobster; I heard him declare, \"You have baked me too brown, I must be what he did it,) he did not at all anxious to have any pepper in my time, but never ONE with such a puzzled expression that she was not a bit hurt, and she felt a very little use, as it was perfectly round, she found a little of her ever getting out of court! Suppress him! Pinch him! Off with his whiskers!\' For some minutes the whole pack of cards, after all. I needn\'t be so proud as all that.\' \'Well.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',952,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26'),(1768,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','Sint aut nam omnis harum incidunt at nostrum. Fugit quia enim et et rem enim velit. Ut quaerat labore iure error.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice; \'I might as well wait, as she was to find my way into that beautiful garden--how IS that to be two people. \'But it\'s no use going back to her: first, because the Duchess sang the second thing is to do that,\' said the Hatter, and here the Mock Turtle in a tone of great relief. \'Call the next question is, Who in the middle, nursing a baby; the cook took the hookah out of breath, and said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to remark. \'Tut, tut, child!\' said the Mouse had changed his mind, and was gone in a tone of great dismay, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on: \'But why did they live at the moment, \'My dear! I wish you wouldn\'t mind,\' said Alice: \'besides, that\'s not a regular rule: you invented it just now.\' \'It\'s the oldest rule in the way YOU manage?\' Alice asked. \'We called him Tortoise because he taught us,\' said the others. \'We must burn the house of the conversation. Alice felt so desperate that she began.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Mock Turtle, and to wonder what they WILL do next! If they had to be no use in crying like that!\' But she waited for a minute or two to think this a good many little girls of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, even before she gave one sharp kick, and waited to see what would happen next. The first witness was the fan and a Canary called out \'The race is over!\' and they can\'t prove I did: there\'s no use.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>I used to say a word, but slowly followed her back to the general conclusion, that wherever you go on? It\'s by far the most interesting, and perhaps after all it might be some sense in your knocking,\' the Footman went on eagerly: \'There is such a curious plan!\' exclaimed Alice. \'That\'s the first really clever thing the King said gravely, \'and go on crying in this affair, He trusts to you how it was all dark overhead; before her was another puzzling question; and as Alice could see her after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came upon a time she went on: \'--that begins with an M--\' \'Why with an air of great relief. \'Call the next moment a shower of little animals and birds waiting outside. The poor little Lizard, Bill, was in the book,\' said the Caterpillar. Alice thought this a good deal frightened at the jury-box, and saw that, in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse only shook its head.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Alice, (she had grown up,\' she said this, she looked down at her for a long way back, and barking hoarsely all the rats and--oh dear!\' cried Alice in a voice sometimes choked with sobs, to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a very difficult question. However, at last she stretched her arms folded, frowning like a writing-desk?\' \'Come, we shall have to whisper a hint to Time, and round Alice, every now and then raised himself upon tiptoe, put his shoes on. \'--and just take his head off outside,\' the Queen was in a deep voice, \'What are tarts made of?\' Alice asked in a piteous tone. And the moral of that dark hall, and wander about among those beds of bright flowers and the beak-- Pray how did you ever see such a neck as that! No, no! You\'re a serpent; and there\'s no harm in trying.\' So she tucked it away under her arm, with its arms folded, frowning like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather not,\' the Cat again, sitting on the OUTSIDE.\'.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/16.jpg',1344,NULL,'2023-07-18 23:25:26','2023-07-18 23:25:26');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_activity_logs`
--

DROP TABLE IF EXISTS `re_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_activity_logs`
--

LOCK TABLES `re_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `re_account_activity_logs` DISABLE KEYS */;
INSERT INTO `re_account_activity_logs` VALUES (1,'your_property_updated_by_admin','Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36','/account/properties/edit/7','Family Victorian \"View\" Home','::1','2021-01-12 01:02:59','2021-01-12 01:02:59',1),(2,'update_property','Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36','/account/properties/edit/7','Family Victorian \"View\" Home','::1','2021-01-12 01:02:59','2021-01-12 01:02:59',1),(3,'changed_avatar','Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36','',NULL,'::1','2021-01-12 01:03:46','2021-01-12 01:03:46',1);
/*!40000 ALTER TABLE `re_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_packages`
--

DROP TABLE IF EXISTS `re_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_packages`
--

LOCK TABLES `re_account_packages` WRITE;
/*!40000 ALTER TABLE `re_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_password_resets`
--

DROP TABLE IF EXISTS `re_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `vendor_password_resets_email_index` (`email`),
  KEY `vendor_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_password_resets`
--

LOCK TABLES `re_account_password_resets` WRITE;
/*!40000 ALTER TABLE `re_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts`
--

DROP TABLE IF EXISTS `re_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `credits` int unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `state_id` int unsigned DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_email_unique` (`email`),
  UNIQUE KEY `re_accounts_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts`
--

LOCK TABLES `re_accounts` WRITE;
/*!40000 ALTER TABLE `re_accounts` DISABLE KEYS */;
INSERT INTO `re_accounts` VALUES (1,'Adan','Durgan','I\'ve had such a thing I ask!.',NULL,'john.smith@botble.com','wildermanlucy','$2y$10$MKs1ReuqrstuCRlrnQayoeidSs39e0nUvHNxhvcHpbuhQy5BMqM9W',17916,'2018-07-04','+12136502169','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',10,0,NULL,NULL,NULL,NULL),(2,'Erling','Schmeler','Then it got down off the.',NULL,'lchristiansen@johns.com','ivahwalter','$2y$10$QBt8ov4X4VSveDlTNSD/7u9CG4gt.7CU/QZgRozONNNaprHhv9cDW',17916,'1979-05-19','+13865154709','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',9,1,NULL,NULL,NULL,NULL),(3,'Nelda','Rempel','And the Eaglet bent down its.',NULL,'wendy.hodkiewicz@hotmail.com','bogankiarra','$2y$10$PMj35ocIoLaRp/PrH5k8zu.5.A4QGwzh.Kbr1yvpPorrg//SuAiLy',17919,'1980-09-05','+16123474983','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',3,0,NULL,NULL,NULL,NULL),(4,'Horace','Hessel','THESE?\' said the Duchess.',NULL,'gorczany.sophie@heaney.com','okunevalonzo','$2y$10$9ck77KU3loQqfBOABPvVZOJMi2YWSHvkmaK80MXh8E2OnPi35XQ3y',17922,'2001-09-15','+18786796186','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',4,1,NULL,NULL,NULL,NULL),(5,'Lukas','Senger','SOMEBODY ought to have got.',NULL,'stanton.ansel@yahoo.com','lindviola','$2y$10$CV4Jnv9An2QG1egnan.jre39KPXVcNeCqLbhzW1GUDxv5vePXlHgO',17916,'2004-01-15','+16579547594','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',5,0,NULL,NULL,NULL,NULL),(6,'Carmel','Kessler','So she set to work shaking.',NULL,'mmarquardt@labadie.com','junius07','$2y$10$tfLG.jf9bs80PGT7Id.rYuxf2sjlDZebrZgFehdA8kVA3zEWftT0m',17920,'1977-04-22','+15018066342','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',1,1,NULL,NULL,NULL,NULL),(7,'Eli','Harris','Queen will hear you! You.',NULL,'julius26@mayert.com','mariahreynolds','$2y$10$YgfWpGDtZriCNlZzdSPfGOOSS20e8POcJjpkZFrucrV1ULQSYMgve',17915,'2001-12-15','+15044228863','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',3,0,NULL,NULL,NULL,NULL),(8,'Colby','Braun','Long Tale They were just.',NULL,'sheridan.block@grant.com','wpollich','$2y$10$6cUkE84zHafVtexrxMdZCer1miKDKy7FcXMb.ra7vEp8ousIFOst2',17922,'1992-11-24','+17575040487','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',9,1,NULL,NULL,NULL,NULL),(9,'Ocie','Thiel','Her first idea was that she.',NULL,'qemard@gmail.com','magnus75','$2y$10$8NwNtlkujWlq1DXbS1OdtuB8/s65IK3VHm7A6CaikLJbaAJpvs7r2',17923,'1979-06-24','+14355334752','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',8,0,NULL,NULL,NULL,NULL),(10,'Roel','Stanton','And concluded the banquet--].',NULL,'norene.schaefer@yahoo.com','dayana98','$2y$10$Rjndk/RQTTdEz0Dk2X3preRpC.Bwq5DK9s.YzDX7GdL/l2aGWQPhK',17924,'1979-09-02','+13059795572','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',6,1,NULL,NULL,NULL,NULL),(11,'Elliott','Grant','VERY turn-up nose, much more.',NULL,'crooks.lucius@hotmail.com','savannasatterfield','$2y$10$dII4pYSkRHlZ3zU98CJHJOHLwKP88dzfXXnXET2fcckyKFoUmsiNa',17921,'1997-08-28','+17437361403','2023-07-19 06:25:24',NULL,NULL,'2023-07-18 23:25:24','2023-07-18 23:25:24',2,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `re_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories`
--

DROP TABLE IF EXISTS `re_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories`
--

LOCK TABLES `re_categories` WRITE;
/*!40000 ALTER TABLE `re_categories` DISABLE KEYS */;
INSERT INTO `re_categories` VALUES (1,'Apartment',NULL,'published',0,1,'2023-07-18 23:25:23','2023-07-18 23:25:23',0),(2,'Villa',NULL,'published',1,0,'2023-07-18 23:25:23','2023-07-18 23:25:23',0),(3,'Condo',NULL,'published',2,0,'2023-07-18 23:25:23','2023-07-18 23:25:23',0),(4,'House',NULL,'published',3,0,'2023-07-18 23:25:23','2023-07-18 23:25:23',0),(5,'Land',NULL,'published',4,0,'2023-07-18 23:25:23','2023-07-18 23:25:23',0),(6,'Commercial property',NULL,'published',5,0,'2023-07-18 23:25:23','2023-07-18 23:25:23',0);
/*!40000 ALTER TABLE `re_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories_translations`
--

DROP TABLE IF EXISTS `re_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories_translations`
--

LOCK TABLES `re_categories_translations` WRITE;
/*!40000 ALTER TABLE `re_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consults`
--

DROP TABLE IF EXISTS `re_consults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consults` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int unsigned DEFAULT NULL,
  `property_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consults`
--

LOCK TABLES `re_consults` WRITE;
/*!40000 ALTER TABLE `re_consults` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_currencies`
--

DROP TABLE IF EXISTS `re_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_currencies`
--

LOCK TABLES `re_currencies` WRITE;
/*!40000 ALTER TABLE `re_currencies` DISABLE KEYS */;
INSERT INTO `re_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2023-07-18 23:25:23','2023-07-18 23:25:23'),(2,'EUR','€',0,0,1,0,0.84,'2023-07-18 23:25:23','2023-07-18 23:25:23'),(3,'VND','₫',0,0,1,0,23203,'2023-07-18 23:25:23','2023-07-18 23:25:23');
/*!40000 ALTER TABLE `re_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options`
--

DROP TABLE IF EXISTS `re_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options`
--

LOCK TABLES `re_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options_translations`
--

LOCK TABLES `re_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values`
--

DROP TABLE IF EXISTS `re_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values`
--

LOCK TABLES `re_custom_field_values` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values_translations`
--

DROP TABLE IF EXISTS `re_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values_translations`
--

LOCK TABLES `re_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields`
--

DROP TABLE IF EXISTS `re_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields`
--

LOCK TABLES `re_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields_translations`
--

LOCK TABLES `re_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities`
--

DROP TABLE IF EXISTS `re_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities`
--

LOCK TABLES `re_facilities` WRITE;
/*!40000 ALTER TABLE `re_facilities` DISABLE KEYS */;
INSERT INTO `re_facilities` VALUES (1,'Hospital','far fa-hospital','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(2,'Super Market','fas fa-cart-plus','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3,'School','fas fa-school','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(4,'Entertainment','fas fa-hotel','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(5,'Pharmacy','fas fa-prescription-bottle-alt','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(6,'Airport','fas fa-plane-departure','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(7,'Railways','fas fa-subway','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(8,'Bus Stop','fas fa-bus','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(9,'Beach','fas fa-umbrella-beach','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(10,'Mall','fas fa-cart-plus','published','2023-07-18 23:25:23','2023-07-18 23:25:23'),(11,'Bank','fas fa-university','published','2023-07-18 23:25:23','2023-07-18 23:25:23');
/*!40000 ALTER TABLE `re_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_distances`
--

DROP TABLE IF EXISTS `re_facilities_distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_distances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_distances`
--

LOCK TABLES `re_facilities_distances` WRITE;
/*!40000 ALTER TABLE `re_facilities_distances` DISABLE KEYS */;
INSERT INTO `re_facilities_distances` VALUES (1,6,5,'Botble\\RealEstate\\Models\\Project','1.25'),(2,2,5,'Botble\\RealEstate\\Models\\Project','0.25'),(6944,1,18,'Botble\\RealEstate\\Models\\Property','12km'),(6945,2,18,'Botble\\RealEstate\\Models\\Property','11km'),(6946,3,18,'Botble\\RealEstate\\Models\\Property','14km'),(6947,4,18,'Botble\\RealEstate\\Models\\Property','8km'),(6948,5,18,'Botble\\RealEstate\\Models\\Property','16km'),(6949,6,18,'Botble\\RealEstate\\Models\\Property','18km'),(6950,7,18,'Botble\\RealEstate\\Models\\Property','17km'),(6951,8,18,'Botble\\RealEstate\\Models\\Property','8km'),(6952,9,18,'Botble\\RealEstate\\Models\\Property','2km'),(6953,10,18,'Botble\\RealEstate\\Models\\Property','7km'),(6954,11,18,'Botble\\RealEstate\\Models\\Property','16km'),(6955,1,19,'Botble\\RealEstate\\Models\\Property','16km'),(6956,2,19,'Botble\\RealEstate\\Models\\Property','14km'),(6957,3,19,'Botble\\RealEstate\\Models\\Property','2km'),(6958,4,19,'Botble\\RealEstate\\Models\\Property','2km'),(6959,5,19,'Botble\\RealEstate\\Models\\Property','18km'),(6960,6,19,'Botble\\RealEstate\\Models\\Property','8km'),(6961,7,19,'Botble\\RealEstate\\Models\\Property','8km'),(6962,8,19,'Botble\\RealEstate\\Models\\Property','16km'),(6963,9,19,'Botble\\RealEstate\\Models\\Property','9km'),(6964,10,19,'Botble\\RealEstate\\Models\\Property','11km'),(6965,11,19,'Botble\\RealEstate\\Models\\Property','9km'),(6966,1,20,'Botble\\RealEstate\\Models\\Property','20km'),(6967,2,20,'Botble\\RealEstate\\Models\\Property','8km'),(6968,3,20,'Botble\\RealEstate\\Models\\Property','19km'),(6969,4,20,'Botble\\RealEstate\\Models\\Property','10km'),(6970,5,20,'Botble\\RealEstate\\Models\\Property','18km'),(6971,6,20,'Botble\\RealEstate\\Models\\Property','13km'),(6972,7,20,'Botble\\RealEstate\\Models\\Property','15km'),(6973,8,20,'Botble\\RealEstate\\Models\\Property','19km'),(6974,9,20,'Botble\\RealEstate\\Models\\Property','12km'),(6975,10,20,'Botble\\RealEstate\\Models\\Property','14km'),(6976,11,20,'Botble\\RealEstate\\Models\\Property','10km'),(6977,1,21,'Botble\\RealEstate\\Models\\Property','13km'),(6978,2,21,'Botble\\RealEstate\\Models\\Property','4km'),(6979,3,21,'Botble\\RealEstate\\Models\\Property','12km'),(6980,4,21,'Botble\\RealEstate\\Models\\Property','15km'),(6981,5,21,'Botble\\RealEstate\\Models\\Property','6km'),(6982,6,21,'Botble\\RealEstate\\Models\\Property','17km'),(6983,7,21,'Botble\\RealEstate\\Models\\Property','17km'),(6984,8,21,'Botble\\RealEstate\\Models\\Property','20km'),(6985,9,21,'Botble\\RealEstate\\Models\\Property','11km'),(6986,10,21,'Botble\\RealEstate\\Models\\Property','17km'),(6987,11,21,'Botble\\RealEstate\\Models\\Property','10km'),(6988,1,22,'Botble\\RealEstate\\Models\\Property','6km'),(6989,2,22,'Botble\\RealEstate\\Models\\Property','8km'),(6990,3,22,'Botble\\RealEstate\\Models\\Property','12km'),(6991,4,22,'Botble\\RealEstate\\Models\\Property','11km'),(6992,5,22,'Botble\\RealEstate\\Models\\Property','15km'),(6993,6,22,'Botble\\RealEstate\\Models\\Property','14km'),(6994,7,22,'Botble\\RealEstate\\Models\\Property','7km'),(6995,8,22,'Botble\\RealEstate\\Models\\Property','6km'),(6996,9,22,'Botble\\RealEstate\\Models\\Property','5km'),(6997,10,22,'Botble\\RealEstate\\Models\\Property','18km'),(6998,11,22,'Botble\\RealEstate\\Models\\Property','3km'),(6999,1,23,'Botble\\RealEstate\\Models\\Property','2km'),(7000,2,23,'Botble\\RealEstate\\Models\\Property','2km'),(7001,3,23,'Botble\\RealEstate\\Models\\Property','19km'),(7002,4,23,'Botble\\RealEstate\\Models\\Property','15km'),(7003,5,23,'Botble\\RealEstate\\Models\\Property','5km'),(7004,6,23,'Botble\\RealEstate\\Models\\Property','4km'),(7005,7,23,'Botble\\RealEstate\\Models\\Property','6km'),(7006,8,23,'Botble\\RealEstate\\Models\\Property','8km'),(7007,9,23,'Botble\\RealEstate\\Models\\Property','16km'),(7008,10,23,'Botble\\RealEstate\\Models\\Property','8km'),(7009,11,23,'Botble\\RealEstate\\Models\\Property','18km'),(7010,1,24,'Botble\\RealEstate\\Models\\Property','13km'),(7011,2,24,'Botble\\RealEstate\\Models\\Property','10km'),(7012,3,24,'Botble\\RealEstate\\Models\\Property','4km'),(7013,4,24,'Botble\\RealEstate\\Models\\Property','7km'),(7014,5,24,'Botble\\RealEstate\\Models\\Property','3km'),(7015,6,24,'Botble\\RealEstate\\Models\\Property','1km'),(7016,7,24,'Botble\\RealEstate\\Models\\Property','5km'),(7017,8,24,'Botble\\RealEstate\\Models\\Property','1km'),(7018,9,24,'Botble\\RealEstate\\Models\\Property','17km'),(7019,10,24,'Botble\\RealEstate\\Models\\Property','2km'),(7020,11,24,'Botble\\RealEstate\\Models\\Property','18km'),(7021,1,25,'Botble\\RealEstate\\Models\\Property','5km'),(7022,2,25,'Botble\\RealEstate\\Models\\Property','5km'),(7023,3,25,'Botble\\RealEstate\\Models\\Property','15km'),(7024,4,25,'Botble\\RealEstate\\Models\\Property','4km'),(7025,5,25,'Botble\\RealEstate\\Models\\Property','14km'),(7026,6,25,'Botble\\RealEstate\\Models\\Property','13km'),(7027,7,25,'Botble\\RealEstate\\Models\\Property','6km'),(7028,8,25,'Botble\\RealEstate\\Models\\Property','13km'),(7029,9,25,'Botble\\RealEstate\\Models\\Property','2km'),(7030,10,25,'Botble\\RealEstate\\Models\\Property','9km'),(7031,11,25,'Botble\\RealEstate\\Models\\Property','19km'),(7032,1,26,'Botble\\RealEstate\\Models\\Property','17km'),(7033,2,26,'Botble\\RealEstate\\Models\\Property','11km'),(7034,3,26,'Botble\\RealEstate\\Models\\Property','5km'),(7035,4,26,'Botble\\RealEstate\\Models\\Property','16km'),(7036,5,26,'Botble\\RealEstate\\Models\\Property','3km'),(7037,6,26,'Botble\\RealEstate\\Models\\Property','18km'),(7038,7,26,'Botble\\RealEstate\\Models\\Property','14km'),(7039,8,26,'Botble\\RealEstate\\Models\\Property','9km'),(7040,9,26,'Botble\\RealEstate\\Models\\Property','4km'),(7041,10,26,'Botble\\RealEstate\\Models\\Property','13km'),(7042,11,26,'Botble\\RealEstate\\Models\\Property','10km'),(7043,1,27,'Botble\\RealEstate\\Models\\Property','1km'),(7044,2,27,'Botble\\RealEstate\\Models\\Property','1km'),(7045,3,27,'Botble\\RealEstate\\Models\\Property','4km'),(7046,4,27,'Botble\\RealEstate\\Models\\Property','1km'),(7047,5,27,'Botble\\RealEstate\\Models\\Property','14km'),(7048,6,27,'Botble\\RealEstate\\Models\\Property','1km'),(7049,7,27,'Botble\\RealEstate\\Models\\Property','8km'),(7050,8,27,'Botble\\RealEstate\\Models\\Property','8km'),(7051,9,27,'Botble\\RealEstate\\Models\\Property','4km'),(7052,10,27,'Botble\\RealEstate\\Models\\Property','9km'),(7053,11,27,'Botble\\RealEstate\\Models\\Property','3km'),(7054,1,28,'Botble\\RealEstate\\Models\\Property','12km'),(7055,2,28,'Botble\\RealEstate\\Models\\Property','2km'),(7056,3,28,'Botble\\RealEstate\\Models\\Property','17km'),(7057,4,28,'Botble\\RealEstate\\Models\\Property','2km'),(7058,5,28,'Botble\\RealEstate\\Models\\Property','4km'),(7059,6,28,'Botble\\RealEstate\\Models\\Property','7km'),(7060,7,28,'Botble\\RealEstate\\Models\\Property','19km'),(7061,8,28,'Botble\\RealEstate\\Models\\Property','17km'),(7062,9,28,'Botble\\RealEstate\\Models\\Property','3km'),(7063,10,28,'Botble\\RealEstate\\Models\\Property','7km'),(7064,11,28,'Botble\\RealEstate\\Models\\Property','7km'),(7065,1,29,'Botble\\RealEstate\\Models\\Property','11km'),(7066,2,29,'Botble\\RealEstate\\Models\\Property','10km'),(7067,3,29,'Botble\\RealEstate\\Models\\Property','12km'),(7068,4,29,'Botble\\RealEstate\\Models\\Property','16km'),(7069,5,29,'Botble\\RealEstate\\Models\\Property','5km'),(7070,6,29,'Botble\\RealEstate\\Models\\Property','9km'),(7071,7,29,'Botble\\RealEstate\\Models\\Property','5km'),(7072,8,29,'Botble\\RealEstate\\Models\\Property','4km'),(7073,9,29,'Botble\\RealEstate\\Models\\Property','9km'),(7074,10,29,'Botble\\RealEstate\\Models\\Property','9km'),(7075,11,29,'Botble\\RealEstate\\Models\\Property','20km'),(7076,1,30,'Botble\\RealEstate\\Models\\Property','9km'),(7077,2,30,'Botble\\RealEstate\\Models\\Property','8km'),(7078,3,30,'Botble\\RealEstate\\Models\\Property','20km'),(7079,4,30,'Botble\\RealEstate\\Models\\Property','14km'),(7080,5,30,'Botble\\RealEstate\\Models\\Property','11km'),(7081,6,30,'Botble\\RealEstate\\Models\\Property','8km'),(7082,7,30,'Botble\\RealEstate\\Models\\Property','12km'),(7083,8,30,'Botble\\RealEstate\\Models\\Property','19km'),(7084,9,30,'Botble\\RealEstate\\Models\\Property','2km'),(7085,10,30,'Botble\\RealEstate\\Models\\Property','1km'),(7086,11,30,'Botble\\RealEstate\\Models\\Property','14km'),(7087,1,31,'Botble\\RealEstate\\Models\\Property','14km'),(7088,2,31,'Botble\\RealEstate\\Models\\Property','11km'),(7089,3,31,'Botble\\RealEstate\\Models\\Property','20km'),(7090,4,31,'Botble\\RealEstate\\Models\\Property','13km'),(7091,5,31,'Botble\\RealEstate\\Models\\Property','6km'),(7092,6,31,'Botble\\RealEstate\\Models\\Property','1km'),(7093,7,31,'Botble\\RealEstate\\Models\\Property','17km'),(7094,8,31,'Botble\\RealEstate\\Models\\Property','3km'),(7095,9,31,'Botble\\RealEstate\\Models\\Property','8km'),(7096,10,31,'Botble\\RealEstate\\Models\\Property','13km'),(7097,11,31,'Botble\\RealEstate\\Models\\Property','12km'),(7098,1,32,'Botble\\RealEstate\\Models\\Property','19km'),(7099,2,32,'Botble\\RealEstate\\Models\\Property','19km'),(7100,3,32,'Botble\\RealEstate\\Models\\Property','10km'),(7101,4,32,'Botble\\RealEstate\\Models\\Property','8km'),(7102,5,32,'Botble\\RealEstate\\Models\\Property','10km'),(7103,6,32,'Botble\\RealEstate\\Models\\Property','6km'),(7104,7,32,'Botble\\RealEstate\\Models\\Property','11km'),(7105,8,32,'Botble\\RealEstate\\Models\\Property','9km'),(7106,9,32,'Botble\\RealEstate\\Models\\Property','10km'),(7107,10,32,'Botble\\RealEstate\\Models\\Property','12km'),(7108,11,32,'Botble\\RealEstate\\Models\\Property','14km'),(7109,1,33,'Botble\\RealEstate\\Models\\Property','10km'),(7110,2,33,'Botble\\RealEstate\\Models\\Property','15km'),(7111,3,33,'Botble\\RealEstate\\Models\\Property','7km'),(7112,4,33,'Botble\\RealEstate\\Models\\Property','6km'),(7113,5,33,'Botble\\RealEstate\\Models\\Property','6km'),(7114,6,33,'Botble\\RealEstate\\Models\\Property','20km'),(7115,7,33,'Botble\\RealEstate\\Models\\Property','18km'),(7116,8,33,'Botble\\RealEstate\\Models\\Property','12km'),(7117,9,33,'Botble\\RealEstate\\Models\\Property','14km'),(7118,10,33,'Botble\\RealEstate\\Models\\Property','14km'),(7119,11,33,'Botble\\RealEstate\\Models\\Property','14km'),(7120,1,34,'Botble\\RealEstate\\Models\\Property','11km'),(7121,2,34,'Botble\\RealEstate\\Models\\Property','13km'),(7122,3,34,'Botble\\RealEstate\\Models\\Property','16km'),(7123,4,34,'Botble\\RealEstate\\Models\\Property','2km'),(7124,5,34,'Botble\\RealEstate\\Models\\Property','4km'),(7125,6,34,'Botble\\RealEstate\\Models\\Property','8km'),(7126,7,34,'Botble\\RealEstate\\Models\\Property','14km'),(7127,8,34,'Botble\\RealEstate\\Models\\Property','14km'),(7128,9,34,'Botble\\RealEstate\\Models\\Property','11km'),(7129,10,34,'Botble\\RealEstate\\Models\\Property','6km'),(7130,11,34,'Botble\\RealEstate\\Models\\Property','1km'),(26205,1,1,'Botble\\RealEstate\\Models\\Property','15km'),(26206,2,1,'Botble\\RealEstate\\Models\\Property','2km'),(26207,3,1,'Botble\\RealEstate\\Models\\Property','20km'),(26208,4,1,'Botble\\RealEstate\\Models\\Property','2km'),(26209,5,1,'Botble\\RealEstate\\Models\\Property','11km'),(26210,6,1,'Botble\\RealEstate\\Models\\Property','7km'),(26211,7,1,'Botble\\RealEstate\\Models\\Property','17km'),(26212,8,1,'Botble\\RealEstate\\Models\\Property','5km'),(26213,9,1,'Botble\\RealEstate\\Models\\Property','6km'),(26214,10,1,'Botble\\RealEstate\\Models\\Property','1km'),(26215,11,1,'Botble\\RealEstate\\Models\\Property','9km'),(26216,1,2,'Botble\\RealEstate\\Models\\Property','6km'),(26217,2,2,'Botble\\RealEstate\\Models\\Property','16km'),(26218,3,2,'Botble\\RealEstate\\Models\\Property','19km'),(26219,4,2,'Botble\\RealEstate\\Models\\Property','16km'),(26220,5,2,'Botble\\RealEstate\\Models\\Property','15km'),(26221,6,2,'Botble\\RealEstate\\Models\\Property','8km'),(26222,7,2,'Botble\\RealEstate\\Models\\Property','15km'),(26223,8,2,'Botble\\RealEstate\\Models\\Property','5km'),(26224,9,2,'Botble\\RealEstate\\Models\\Property','20km'),(26225,10,2,'Botble\\RealEstate\\Models\\Property','10km'),(26226,11,2,'Botble\\RealEstate\\Models\\Property','2km'),(26227,1,3,'Botble\\RealEstate\\Models\\Property','9km'),(26228,2,3,'Botble\\RealEstate\\Models\\Property','16km'),(26229,3,3,'Botble\\RealEstate\\Models\\Property','18km'),(26230,4,3,'Botble\\RealEstate\\Models\\Property','11km'),(26231,5,3,'Botble\\RealEstate\\Models\\Property','20km'),(26232,6,3,'Botble\\RealEstate\\Models\\Property','11km'),(26233,7,3,'Botble\\RealEstate\\Models\\Property','11km'),(26234,8,3,'Botble\\RealEstate\\Models\\Property','1km'),(26235,9,3,'Botble\\RealEstate\\Models\\Property','19km'),(26236,10,3,'Botble\\RealEstate\\Models\\Property','19km'),(26237,11,3,'Botble\\RealEstate\\Models\\Property','7km'),(26238,1,4,'Botble\\RealEstate\\Models\\Property','7km'),(26239,2,4,'Botble\\RealEstate\\Models\\Property','6km'),(26240,3,4,'Botble\\RealEstate\\Models\\Property','19km'),(26241,4,4,'Botble\\RealEstate\\Models\\Property','12km'),(26242,5,4,'Botble\\RealEstate\\Models\\Property','17km'),(26243,6,4,'Botble\\RealEstate\\Models\\Property','2km'),(26244,7,4,'Botble\\RealEstate\\Models\\Property','9km'),(26245,8,4,'Botble\\RealEstate\\Models\\Property','16km'),(26246,9,4,'Botble\\RealEstate\\Models\\Property','12km'),(26247,10,4,'Botble\\RealEstate\\Models\\Property','4km'),(26248,11,4,'Botble\\RealEstate\\Models\\Property','1km'),(26249,1,5,'Botble\\RealEstate\\Models\\Property','9km'),(26250,2,5,'Botble\\RealEstate\\Models\\Property','5km'),(26251,3,5,'Botble\\RealEstate\\Models\\Property','9km'),(26252,4,5,'Botble\\RealEstate\\Models\\Property','12km'),(26253,5,5,'Botble\\RealEstate\\Models\\Property','17km'),(26254,6,5,'Botble\\RealEstate\\Models\\Property','17km'),(26255,7,5,'Botble\\RealEstate\\Models\\Property','6km'),(26256,8,5,'Botble\\RealEstate\\Models\\Property','5km'),(26257,9,5,'Botble\\RealEstate\\Models\\Property','7km'),(26258,10,5,'Botble\\RealEstate\\Models\\Property','4km'),(26259,11,5,'Botble\\RealEstate\\Models\\Property','15km'),(26260,1,6,'Botble\\RealEstate\\Models\\Property','4km'),(26261,2,6,'Botble\\RealEstate\\Models\\Property','3km'),(26262,3,6,'Botble\\RealEstate\\Models\\Property','5km'),(26263,4,6,'Botble\\RealEstate\\Models\\Property','16km'),(26264,5,6,'Botble\\RealEstate\\Models\\Property','17km'),(26265,6,6,'Botble\\RealEstate\\Models\\Property','5km'),(26266,7,6,'Botble\\RealEstate\\Models\\Property','6km'),(26267,8,6,'Botble\\RealEstate\\Models\\Property','1km'),(26268,9,6,'Botble\\RealEstate\\Models\\Property','16km'),(26269,10,6,'Botble\\RealEstate\\Models\\Property','16km'),(26270,11,6,'Botble\\RealEstate\\Models\\Property','3km'),(26271,1,7,'Botble\\RealEstate\\Models\\Property','11km'),(26272,2,7,'Botble\\RealEstate\\Models\\Property','11km'),(26273,3,7,'Botble\\RealEstate\\Models\\Property','20km'),(26274,4,7,'Botble\\RealEstate\\Models\\Property','1km'),(26275,5,7,'Botble\\RealEstate\\Models\\Property','2km'),(26276,6,7,'Botble\\RealEstate\\Models\\Property','11km'),(26277,7,7,'Botble\\RealEstate\\Models\\Property','3km'),(26278,8,7,'Botble\\RealEstate\\Models\\Property','5km'),(26279,9,7,'Botble\\RealEstate\\Models\\Property','19km'),(26280,10,7,'Botble\\RealEstate\\Models\\Property','13km'),(26281,11,7,'Botble\\RealEstate\\Models\\Property','9km'),(26282,1,8,'Botble\\RealEstate\\Models\\Property','4km'),(26283,2,8,'Botble\\RealEstate\\Models\\Property','12km'),(26284,3,8,'Botble\\RealEstate\\Models\\Property','1km'),(26285,4,8,'Botble\\RealEstate\\Models\\Property','10km'),(26286,5,8,'Botble\\RealEstate\\Models\\Property','14km'),(26287,6,8,'Botble\\RealEstate\\Models\\Property','1km'),(26288,7,8,'Botble\\RealEstate\\Models\\Property','8km'),(26289,8,8,'Botble\\RealEstate\\Models\\Property','1km'),(26290,9,8,'Botble\\RealEstate\\Models\\Property','20km'),(26291,10,8,'Botble\\RealEstate\\Models\\Property','3km'),(26292,11,8,'Botble\\RealEstate\\Models\\Property','2km'),(26293,1,9,'Botble\\RealEstate\\Models\\Property','11km'),(26294,2,9,'Botble\\RealEstate\\Models\\Property','3km'),(26295,3,9,'Botble\\RealEstate\\Models\\Property','4km'),(26296,4,9,'Botble\\RealEstate\\Models\\Property','19km'),(26297,5,9,'Botble\\RealEstate\\Models\\Property','5km'),(26298,6,9,'Botble\\RealEstate\\Models\\Property','1km'),(26299,7,9,'Botble\\RealEstate\\Models\\Property','14km'),(26300,8,9,'Botble\\RealEstate\\Models\\Property','20km'),(26301,9,9,'Botble\\RealEstate\\Models\\Property','20km'),(26302,10,9,'Botble\\RealEstate\\Models\\Property','9km'),(26303,11,9,'Botble\\RealEstate\\Models\\Property','12km'),(26304,1,10,'Botble\\RealEstate\\Models\\Property','10km'),(26305,2,10,'Botble\\RealEstate\\Models\\Property','6km'),(26306,3,10,'Botble\\RealEstate\\Models\\Property','16km'),(26307,4,10,'Botble\\RealEstate\\Models\\Property','15km'),(26308,5,10,'Botble\\RealEstate\\Models\\Property','18km'),(26309,6,10,'Botble\\RealEstate\\Models\\Property','7km'),(26310,7,10,'Botble\\RealEstate\\Models\\Property','9km'),(26311,8,10,'Botble\\RealEstate\\Models\\Property','13km'),(26312,9,10,'Botble\\RealEstate\\Models\\Property','5km'),(26313,10,10,'Botble\\RealEstate\\Models\\Property','2km'),(26314,11,10,'Botble\\RealEstate\\Models\\Property','12km'),(26315,1,11,'Botble\\RealEstate\\Models\\Property','13km'),(26316,2,11,'Botble\\RealEstate\\Models\\Property','19km'),(26317,3,11,'Botble\\RealEstate\\Models\\Property','6km'),(26318,4,11,'Botble\\RealEstate\\Models\\Property','15km'),(26319,5,11,'Botble\\RealEstate\\Models\\Property','12km'),(26320,6,11,'Botble\\RealEstate\\Models\\Property','20km'),(26321,7,11,'Botble\\RealEstate\\Models\\Property','5km'),(26322,8,11,'Botble\\RealEstate\\Models\\Property','3km'),(26323,9,11,'Botble\\RealEstate\\Models\\Property','15km'),(26324,10,11,'Botble\\RealEstate\\Models\\Property','9km'),(26325,11,11,'Botble\\RealEstate\\Models\\Property','8km'),(26326,1,12,'Botble\\RealEstate\\Models\\Property','2km'),(26327,2,12,'Botble\\RealEstate\\Models\\Property','1km'),(26328,3,12,'Botble\\RealEstate\\Models\\Property','12km'),(26329,4,12,'Botble\\RealEstate\\Models\\Property','19km'),(26330,5,12,'Botble\\RealEstate\\Models\\Property','20km'),(26331,6,12,'Botble\\RealEstate\\Models\\Property','16km'),(26332,7,12,'Botble\\RealEstate\\Models\\Property','6km'),(26333,8,12,'Botble\\RealEstate\\Models\\Property','19km'),(26334,9,12,'Botble\\RealEstate\\Models\\Property','9km'),(26335,10,12,'Botble\\RealEstate\\Models\\Property','8km'),(26336,11,12,'Botble\\RealEstate\\Models\\Property','1km'),(26337,1,13,'Botble\\RealEstate\\Models\\Property','11km'),(26338,2,13,'Botble\\RealEstate\\Models\\Property','8km'),(26339,3,13,'Botble\\RealEstate\\Models\\Property','13km'),(26340,4,13,'Botble\\RealEstate\\Models\\Property','9km'),(26341,5,13,'Botble\\RealEstate\\Models\\Property','7km'),(26342,6,13,'Botble\\RealEstate\\Models\\Property','17km'),(26343,7,13,'Botble\\RealEstate\\Models\\Property','12km'),(26344,8,13,'Botble\\RealEstate\\Models\\Property','5km'),(26345,9,13,'Botble\\RealEstate\\Models\\Property','18km'),(26346,10,13,'Botble\\RealEstate\\Models\\Property','13km'),(26347,11,13,'Botble\\RealEstate\\Models\\Property','10km'),(26348,1,14,'Botble\\RealEstate\\Models\\Property','7km'),(26349,2,14,'Botble\\RealEstate\\Models\\Property','8km'),(26350,3,14,'Botble\\RealEstate\\Models\\Property','20km'),(26351,4,14,'Botble\\RealEstate\\Models\\Property','7km'),(26352,5,14,'Botble\\RealEstate\\Models\\Property','15km'),(26353,6,14,'Botble\\RealEstate\\Models\\Property','15km'),(26354,7,14,'Botble\\RealEstate\\Models\\Property','11km'),(26355,8,14,'Botble\\RealEstate\\Models\\Property','4km'),(26356,9,14,'Botble\\RealEstate\\Models\\Property','9km'),(26357,10,14,'Botble\\RealEstate\\Models\\Property','15km'),(26358,11,14,'Botble\\RealEstate\\Models\\Property','5km'),(26359,1,15,'Botble\\RealEstate\\Models\\Property','14km'),(26360,2,15,'Botble\\RealEstate\\Models\\Property','18km'),(26361,3,15,'Botble\\RealEstate\\Models\\Property','19km'),(26362,4,15,'Botble\\RealEstate\\Models\\Property','10km'),(26363,5,15,'Botble\\RealEstate\\Models\\Property','3km'),(26364,6,15,'Botble\\RealEstate\\Models\\Property','6km'),(26365,7,15,'Botble\\RealEstate\\Models\\Property','5km'),(26366,8,15,'Botble\\RealEstate\\Models\\Property','19km'),(26367,9,15,'Botble\\RealEstate\\Models\\Property','12km'),(26368,10,15,'Botble\\RealEstate\\Models\\Property','11km'),(26369,11,15,'Botble\\RealEstate\\Models\\Property','8km'),(26370,1,16,'Botble\\RealEstate\\Models\\Property','17km'),(26371,2,16,'Botble\\RealEstate\\Models\\Property','16km'),(26372,3,16,'Botble\\RealEstate\\Models\\Property','17km'),(26373,4,16,'Botble\\RealEstate\\Models\\Property','3km'),(26374,5,16,'Botble\\RealEstate\\Models\\Property','10km'),(26375,6,16,'Botble\\RealEstate\\Models\\Property','2km'),(26376,7,16,'Botble\\RealEstate\\Models\\Property','13km'),(26377,8,16,'Botble\\RealEstate\\Models\\Property','5km'),(26378,9,16,'Botble\\RealEstate\\Models\\Property','9km'),(26379,10,16,'Botble\\RealEstate\\Models\\Property','10km'),(26380,11,16,'Botble\\RealEstate\\Models\\Property','11km'),(26381,1,17,'Botble\\RealEstate\\Models\\Property','9km'),(26382,2,17,'Botble\\RealEstate\\Models\\Property','2km'),(26383,3,17,'Botble\\RealEstate\\Models\\Property','2km'),(26384,4,17,'Botble\\RealEstate\\Models\\Property','9km'),(26385,5,17,'Botble\\RealEstate\\Models\\Property','7km'),(26386,6,17,'Botble\\RealEstate\\Models\\Property','17km'),(26387,7,17,'Botble\\RealEstate\\Models\\Property','17km'),(26388,8,17,'Botble\\RealEstate\\Models\\Property','16km'),(26389,9,17,'Botble\\RealEstate\\Models\\Property','16km'),(26390,10,17,'Botble\\RealEstate\\Models\\Property','5km'),(26391,11,17,'Botble\\RealEstate\\Models\\Property','5km');
/*!40000 ALTER TABLE `re_facilities_distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_translations`
--

DROP TABLE IF EXISTS `re_facilities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_facilities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_translations`
--

LOCK TABLES `re_facilities_translations` WRITE;
/*!40000 ALTER TABLE `re_facilities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features`
--

DROP TABLE IF EXISTS `re_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features`
--

LOCK TABLES `re_features` WRITE;
/*!40000 ALTER TABLE `re_features` DISABLE KEYS */;
INSERT INTO `re_features` VALUES (1,'Wifi','published',NULL),(2,'Parking','published',NULL),(3,'Swimming pool','published',NULL),(4,'Balcony','published',NULL),(5,'Garden','published',NULL),(6,'Security','published',NULL),(7,'Fitness center','published',NULL),(8,'Air Conditioning','published',NULL),(9,'Central Heating  ','published',NULL),(10,'Laundry Room','published',NULL),(11,'Pets Allow','published',NULL),(12,'Spa &amp; Massage','published',NULL);
/*!40000 ALTER TABLE `re_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features_translations`
--

DROP TABLE IF EXISTS `re_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features_translations`
--

LOCK TABLES `re_features_translations` WRITE;
/*!40000 ALTER TABLE `re_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors`
--

DROP TABLE IF EXISTS `re_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors`
--

LOCK TABLES `re_investors` WRITE;
/*!40000 ALTER TABLE `re_investors` DISABLE KEYS */;
INSERT INTO `re_investors` VALUES (1,'National Pension Service','published','2019-11-18 01:16:23','2019-11-18 01:16:23'),(2,'Generali','published','2019-11-18 01:16:47','2019-11-18 01:16:47'),(3,'Temasek','published','2019-11-18 01:16:57','2019-11-18 01:16:57'),(4,'China Investment Corporation','published','2019-11-18 01:17:11','2019-11-18 01:17:11'),(5,'Government Pension Fund Global','published','2019-11-18 01:17:35','2019-11-18 01:17:35'),(6,'PSP Investments','published','2019-11-18 01:17:47','2019-11-18 01:17:47'),(7,'MEAG Munich ERGO','published','2019-11-18 01:17:57','2019-11-18 01:17:57'),(8,'HOOPP','published','2019-11-18 01:18:08','2019-11-18 01:18:08'),(9,'BT Group','published','2019-11-18 01:18:21','2019-11-18 01:18:21'),(10,'Ping An','published','2019-11-18 01:18:32','2019-11-18 01:18:32'),(11,'New Jersey Division of Investment','published','2019-11-18 01:18:45','2019-11-18 01:18:45'),(12,'New York City ERS','published','2019-11-18 01:18:57','2019-11-18 01:18:57'),(13,'State Super','published','2019-11-18 01:19:10','2019-11-18 01:19:10'),(14,'Shinkong','published','2019-11-18 01:19:20','2019-11-18 01:19:20'),(15,'Rest Super','published','2019-11-18 01:19:31','2019-11-18 01:19:31'),(16,'Rest Super','published','2019-11-21 01:50:47','2019-11-21 01:50:47'),(17,'Shinkong','published','2019-11-21 01:51:03','2019-11-21 01:51:03'),(18,'State Super','published','2019-11-21 01:51:21','2019-11-21 01:51:21'),(19,'New York City ERS','published','2019-11-21 01:51:33','2019-11-21 01:51:33'),(20,'New Jersey Division of Investment','published','2019-11-21 01:51:51','2019-11-21 01:51:51'),(21,'Ping An','published','2019-11-21 01:52:04','2019-11-21 01:52:04'),(22,'BT Group','published','2019-11-21 01:52:16','2019-11-21 01:52:16'),(23,'HOOPP','published','2019-11-21 01:52:28','2019-11-21 01:52:28'),(24,'MEAG Munich ERGO','published','2019-11-21 01:52:47','2019-11-21 01:52:47'),(25,'PSP Investments','published','2019-11-21 01:52:57','2019-11-21 01:52:57'),(26,'Government Pension Fund Global','published','2019-11-21 01:53:18','2019-11-21 01:53:18'),(27,'China Investment Corporation','published','2019-11-21 01:53:33','2019-11-21 01:53:33'),(29,'Temasek','published','2019-11-21 01:53:48','2019-11-21 01:53:48'),(30,'Generali','published','2019-11-21 01:54:01','2019-11-21 01:54:01'),(31,'National Pension Service','published','2019-11-21 01:54:14','2019-11-21 01:54:14');
/*!40000 ALTER TABLE `re_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoice_items`
--

DROP TABLE IF EXISTS `re_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoice_items`
--

LOCK TABLES `re_invoice_items` WRITE;
/*!40000 ALTER TABLE `re_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoices`
--

DROP TABLE IF EXISTS `re_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_invoices_code_unique` (`code`),
  KEY `re_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `re_invoices_payment_id_index` (`payment_id`),
  KEY `re_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoices`
--

LOCK TABLES `re_invoices` WRITE;
/*!40000 ALTER TABLE `re_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages`
--

DROP TABLE IF EXISTS `re_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  `number_of_listings` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percent_save` int unsigned NOT NULL DEFAULT '0',
  `account_limit` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages`
--

LOCK TABLES `re_packages` WRITE;
/*!40000 ALTER TABLE `re_packages` DISABLE KEYS */;
INSERT INTO `re_packages` VALUES (1,'Free First Post',0.00,1,1,0,0,'published','2023-07-18 23:25:23','2023-07-18 23:25:23',0,1),(2,'Single Post',250.00,1,1,0,1,'published','2023-07-18 23:25:23','2023-07-18 23:25:23',0,NULL),(3,'5 Posts',1000.00,1,5,0,0,'published','2023-07-18 23:25:23','2023-07-18 23:25:23',20,NULL);
/*!40000 ALTER TABLE `re_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages_translations`
--

DROP TABLE IF EXISTS `re_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages_translations`
--

LOCK TABLES `re_packages_translations` WRITE;
/*!40000 ALTER TABLE `re_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_categories`
--

DROP TABLE IF EXISTS `re_project_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_categories`
--

LOCK TABLES `re_project_categories` WRITE;
/*!40000 ALTER TABLE `re_project_categories` DISABLE KEYS */;
INSERT INTO `re_project_categories` VALUES (588,6,5),(589,1,3),(590,2,2),(591,3,4),(592,4,1),(593,5,5);
/*!40000 ALTER TABLE `re_project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_features`
--

DROP TABLE IF EXISTS `re_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_features` (
  `project_id` int unsigned NOT NULL,
  `feature_id` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_features`
--

LOCK TABLES `re_project_features` WRITE;
/*!40000 ALTER TABLE `re_project_features` DISABLE KEYS */;
INSERT INTO `re_project_features` VALUES (2,1),(2,2),(2,3),(2,5),(2,7),(2,8),(1,1),(1,2),(1,4),(1,5),(1,7),(7,10),(7,12),(7,13),(7,15),(7,16),(8,9),(8,10),(8,12),(8,14),(8,15),(8,16),(3,1),(3,2),(3,3),(3,5),(3,7),(9,10),(9,12),(9,14),(9,15),(9,16),(4,1),(4,4),(4,5),(4,6),(4,7),(10,10),(10,11),(10,12),(10,13),(10,16),(5,1),(5,3),(5,5),(5,6),(5,7),(5,8),(11,9),(11,10),(11,11),(11,12),(11,14),(11,16),(6,1),(6,3),(6,5),(6,6),(6,7),(12,10),(12,11),(12,12),(12,14),(12,16);
/*!40000 ALTER TABLE `re_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects`
--

DROP TABLE IF EXISTS `re_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_block` smallint unsigned DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `investor_id` int unsigned NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` int unsigned DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `latitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` int unsigned DEFAULT '1',
  `state_id` int unsigned DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects`
--

LOCK TABLES `re_projects` WRITE;
/*!40000 ALTER TABLE `re_projects` DISABLE KEYS */;
INSERT INTO `re_projects` VALUES (1,'Walnut Park Apartments','<p>Now Open &amp; Leasing!</p>\r\n\r\n<p>Walnut Park is conveniently located on North Lamar Boulevard across from the 293-acre Walnut Creek Metropolitan Park and just south of Yager Lane near numerous shops and restaurants. Only 11 miles from downtown Austin, the heavily-wooded site borders Walnut Creek and offers residents inspiring views in an unparalleled, secluded community. In addition to resort spa amenities, the interiors are built and designed to condominium specifications with energy efficient features, stunning detail and upgraded finishes.</p>','[\"projects\\/1.jpg\",\"projects\\/5.jpg\",\"projects\\/3.jpg\",\"projects\\/2.jpg\"]','Austin, Texas 78753, USA',4,2,50,1,'2019-11-10','2019-03-11','selling','2019-11-18 00:34:49','2021-04-29 20:46:31',12,'Walnut Park is conveniently located on North Lamar Boulevard across from the 293-acre Walnut Creek Metropolitan Park and just south of Yager Lane near numerous shops and restaurants. Only 11 miles from downtown Austin, the heavily-wooded site borders Walnut Creek and offers residents inspiring views in an unparalleled, secluded community',NULL,NULL,1,4,NULL,'Botble\\ACL\\Models\\User','43.578848','-76.32197',4310,1,1,NULL),(2,'Osaka Heights','<p>Osaka Heights is a state of the art apartment crafted with elegance, comfort and classiness.</p>\r\n\r\n<p>The grander apartments add new heights to the life of people in Colombo, Sri Lanka.</p>\r\n\r\n<p>Devised by a team of international consultants, Osaka Heights is all about contemporary design and comprehensive attention to detail in execution. If you are interested to own a luxury apartment at Sri Lanka, Osaka Heights is the best choice. The foundation of Osaka Heights is laid by skilled professionals, who capture your vision completely. The construction is built as per your elegant lifestyles, without any compromise in quality and class.</p>\r\n\r\n<p>The homes come with all comfy amenities and facilities for a superior life. From the panoramic views, the rooftop swimming pool and the landscaped eco-balconies, beauty meets you at every step in Osaka Heights. Made for an exclusive few, Osaka Heights gives you the advantage of sharing a space with like-minded individuals. An elevated lifestyle naturally follows, making Osaka Heights one of the most sought-after addresses in Colombo.</p>','[\"projects\\/21.jpg\",\"projects\\/24.jpg\",\"projects\\/23.jpg\",\"projects\\/25.jpg\",\"projects\\/26.jpg\",\"projects\\/22.jpg\"]','Kirulapone, Colombo 06, Colombo, Sri Lanka',1,15,450,1,'2019-08-09','2019-08-10','selling','2019-11-18 01:28:45','2021-06-11 20:56:44',3,'The homes come with all comfy amenities and facilities for a superior life. From the panoramic views, the rooftop swimming pool and the landscaped eco-balconies, beauty meets you at every step in Osaka Heights. Made for an exclusive few, Osaka Heights gives you the advantage of sharing a space with like-minded individuals.',NULL,NULL,1,3,NULL,'Botble\\ACL\\Models\\User','43.013638','-75.848066',9366,1,1,NULL),(3,'Mimaroba Paradise','<h2><b>Why you should buy a house from this project?</b></h2>\r\n\r\n<ul>\r\n	<li>1. A summerhouse in the center of the city.</li>\r\n	<li>2. Remove the boundaries between you and the sea, you will be surrounded by blue sea.</li>\r\n	<li>3.&nbsp;Everything you have imagined - from infinity pool, zen garden, gourmet restaurant to thematic playgrounds awaiting you.</li>\r\n	<li>4.&nbsp;A unique design that makes luxury a habit, a wide variety of apartment plan options.</li>\r\n	<li>5.&nbsp;Reasonable payment options, affordable prices in Istanbul&#39;s most exclusive area.</li>\r\n</ul>\r\n\r\n<p>&lsquo;&rsquo; Mimaroba&rsquo;&rsquo; a modern beach district away from the bustle of Istanbul.&nbsp;The aim of the project is to make a living feel for the hosts in the deepest way.&nbsp;In this project you can enjoy a life with the sea and you can have a holiday for 12 months with social facilities and activities.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>','[\"projects\\/13.jpg\",\"projects\\/12.jpg\",\"projects\\/11.jpg\",\"projects\\/14.jpg\"]','Texas, USA',2,16,327,1,'2020-06-09','2019-09-10','selling','2019-11-18 03:30:34','2021-06-11 20:56:44',15,'A summerhouse in the center of the city. Remove the boundaries between you and the sea, you will be surrounded by blue sea. Everything you have imagined - from infinity pool, zen garden, gourmet restaurant to thematic playgrounds awaiting you. A unique design that makes luxury a habit, a wide variety of apartment plan options.',NULL,NULL,1,1,NULL,'Botble\\ACL\\Models\\User','42.795156','-76.237441',3898,1,1,NULL),(4,'Aegean Villas','<h2><strong>Aegean Villas</strong></h2>\r\n\r\n<p>Looks like Aegean town and be one of the highest rated sites in the region. A very large area of 312.000sqm&nbsp; has only 144 villas. Each villa&rsquo;s garden is independent of one another and protects private life. There are 400 adult olive trees in the common area landscape. Strengthening of neighborly relations with common sharing points such as open air cinema, village coffee, market.&nbsp; Increase the living motivation with 2,5km walking and cycling trail, tennis courts and carpet right activities.&nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<h4><strong>Why you should buy a house from this project?</strong></h4>\r\n\r\n<ul>\r\n	<li>1. Natural Architectural design.</li>\r\n	<li>2. Highest session rate in the region</li>\r\n	<li>3. Common sharing areas like open air cinema and village cafe.</li>\r\n	<li>4. 2,5km walking and cycling trail.</li>\r\n	<li>5. The gardens are detached and useful.</li>\r\n</ul>','[\"properties\\/a5-1.jpg\",\"properties\\/a6-1.jpg\",\"properties\\/a7.jpg\",\"properties\\/a8.jpg\",\"properties\\/a10.jpg\",\"properties\\/a9.jpg\"]','Büyükçekmece, İstanbul, Turkey',5,2,144,1,'2020-06-09','2020-10-04','selling','2019-11-18 03:38:13','2021-06-11 20:56:44',11,'A very large area of 312.000sqm  has only 144 villas. Each villa’s garden is independent of one another and protects private life. There are 400 adult olive trees in the common area landscape. Strengthening of neighborly relations with common sharing points such as open air cinema, village coffee, market.',NULL,NULL,1,2,NULL,'Botble\\ACL\\Models\\User','42.478281','-75.321856',1393,1,1,NULL),(5,'Aydos Forest Apartments','<p>The project, which offers unique opportunities for those who want to move into their new home, is the most advantageous housing project of the location with its easy payment options according to your budget. In your new home you will have a live site life with 90% occupancy; The <strong>clean air</strong> of Aydos Forest, the most important social facility of the region with <strong>3,700 sqm</strong> which brings enjoyable social activities to your feet, and much more are waiting for you. You will live a life with nature thanks to the artificial lake and cherry trees in the project as well as the landscape of Aydos Forest. and bacause of its easy connection to the main roads, you can easily reach the important centers of Istanbul.</p>\r\n\r\n<h4><b>Why you should buy a house from this project?</b></h4>\r\n\r\n<ul>\r\n	<li>1.&nbsp;Ready for delivery.</li>\r\n	<li>2.&nbsp;82% open area of landscape.</li>\r\n	<li>3.&nbsp;Aydos forest is right next to the project.</li>\r\n	<li>4.&nbsp;More than 90% of the project is occupied and full of life.</li>\r\n	<li>5. Ease of transportation.</li>\r\n</ul>','[\"properties\\/q1.jpg\",\"properties\\/q2.jpg\",\"properties\\/q8.jpg\",\"properties\\/q7.jpg\",\"properties\\/q3.jpg\",\"properties\\/q6.jpg\"]','Sancaktepe/İstanbul, Turkey',4,18,1394,1,'2019-10-30','2019-07-21','selling','2019-11-18 03:45:06','2021-04-18 09:20:14',2,'You will have a live site life with 90% occupancy; The clean air of Aydos Forest, the most important social facility of the region with 3,700 sqm which brings enjoyable social activities to your feet, and much more are waiting for you. You will live a life with nature thanks to the artificial lake and cherry trees in the project as',NULL,NULL,1,3,NULL,'Botble\\ACL\\Models\\User','43.270016','-75.054121',5271,1,1,NULL),(6,'The Avila Apartments','<p>A profoundly special project amidst history and Istanbul. In the heart of the Historical Peninsula, Select Lifestyle Alternatives ranging from 1+1 to 6+1, in limited numbers&hellip;. A timeless aesthetic enriched in perfect details .</p>\r\n\r\n<h4><b>Why you should buy a house from this project?</b></h4>\r\n\r\n<ul>\r\n	<li>1.&nbsp;Within the historical peninsula, there is a very special area where you will never find a similar one.</li>\r\n	<li>2.&nbsp;Unique sea view with a historical texture of Istanbul.</li>\r\n	<li>3.&nbsp;In the bustling city life, in the middle of all transportation possibilities.</li>\r\n	<li>4. 1+1 to 6+1 very special, suitable for all needs loft apartments</li>\r\n	<li>5.Large landscaping areas, cafes, shopping opportunities.</li>\r\n</ul>','[\"properties\\/e1.jpg\",\"properties\\/e2.jpg\",\"properties\\/e3.jpg\",\"properties\\/e4.jpg\",\"properties\\/e5.jpg\",\"properties\\/e7.jpg\",\"properties\\/e8.jpg\"]','Singapore Island, Singapore',2,4,125,1,'2019-11-19','2019-03-11','selling','2019-11-18 03:53:20','2021-06-11 20:56:44',10,'Within the historical peninsula, there is a very special area where you will never find a similar one. Unique sea view with a historical texture of Istanbul. In the bustling city life, in the middle of all transportation possibilities. Large landscaping areas, cafes, shopping opportunities.',NULL,NULL,1,5,NULL,'Botble\\ACL\\Models\\User','43.481307','-74.862851',2177,1,1,NULL);
/*!40000 ALTER TABLE `re_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects_translations`
--

DROP TABLE IF EXISTS `re_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects_translations`
--

LOCK TABLES `re_projects_translations` WRITE;
/*!40000 ALTER TABLE `re_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties`
--

DROP TABLE IF EXISTS `re_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` int unsigned NOT NULL DEFAULT '0',
  `number_bedroom` smallint unsigned DEFAULT NULL,
  `number_bathroom` smallint unsigned DEFAULT NULL,
  `number_floor` smallint unsigned DEFAULT NULL,
  `square` int DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `price_unit` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int unsigned DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  `period` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `author_id` int DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` int unsigned DEFAULT '1',
  `state_id` int unsigned DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties`
--

LOCK TABLES `re_properties` WRITE;
/*!40000 ALTER TABLE `re_properties` DISABLE KEYS */;
INSERT INTO `re_properties` VALUES (1,'3 Beds Villa Calpe, Alicante','<p>This villa is equipped with all conveniences, where everything takes place on one living level. Three spacious bedrooms that all have direct access to the pool terrace and a spacious living room with an American kitchen with cooking island, from where you can walk onto the terrace through large glass sliding doors. Downstairs there is an indoor, double garage and laundry room with an internal staircase to the house. But you can also drive up to the front door by car. The terrace is spacious and there is an extra-long swimming pool, where you can swim laps well. Around there is a landscaped garden, which is also low in maintenance. Instead of gardening, there is more time left for wonderful enjoyment in and around this beautiful villa.</p>','Alicante, Spain','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\"]',6,3,3,1,600,700000.00,NULL,1,'selling','2019-11-17 20:34:59','2023-07-18 23:25:26','sale','This villa is equipped with all conveniences, where everything takes place on one living level. Three spacious bedrooms that all have direct access to the pool terrace and a spacious living room with an American kitchen with cooking island, from where you can walk onto the terrace through large glass sliding doors.',1,5,'month',2,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.954366','-76.204832',5068,1,1,NULL),(2,'Property For sale , Johannesburg, South Africa','<p><strong>Beautiful home situated in road closure in bedfordview.&nbsp;</strong>Nestled on a rocky outcrop of enormous boulders, this unique home is an architectural triumph designed to titilate the senses from the very start with a waterfall cascading into heated black quartzite pool &amp; stunning koi-pond. Flavours of the Seychelles.&nbsp;Enter from a winding pathway lined by palms and tree ferns into the hallway. The spacious living room with magnificent wood burning fireplace and large diningroom are complemented by a wet barrel bar, featuring designer built in wine cellar wall.</p>','Johannesburg, South Africa','[\"properties\\/23.jpg\",\"properties\\/21.jpg\",\"properties\\/24.jpg\",\"properties\\/22.jpg\"]',6,4,4,2,800,800000.00,NULL,1,'selling','2019-11-17 20:53:34','2023-07-18 23:25:26','sale','Beautiful home. Nestled on a rocky outcrop of enormous boulders, this unique home is an architectural triumph designed to titilate the senses from the very start with a waterfall cascading into heated black quartzite pool & stunning koi-pond. Flavours of the Seychelles.',1,2,'month',1,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.819483','-76.703637',8812,1,1,NULL),(3,'Stunning French Inspired Manor','<p>Stunning French Inspired Manor located within Briarwood Ranch near Solvang in the heart of the magnificent Santa Ynez Valley. This residence features appx 5,000sqft 4+ bedroom, 3.5 bath home with elegant and spacious interiors including formal living and dining, amazing view great room and kitchen, and massive bonus library media room with bar and custom built-ins. The magnificent lagoon-like infinity edge swimming pool offers beach entry, waterfalls and slide, Cabana and a complimentary poolside bar combo BBQ kitchen. A spacious 2 car garage is adjacent to craft room and large art studio</p>','Solvang, Santa Barbara County, CA 93463, USA','[\"properties\\/31.jpg\",\"properties\\/32.jpg\",\"properties\\/33.jpg\",\"properties\\/34.jpg\",\"properties\\/35.jpg\",\"properties\\/311.jpg\"]',5,4,3,1,450,1695000.00,NULL,1,'selling','2019-11-17 21:09:55','2023-07-18 23:25:26','sale','This residence features appx 5,000sqft 4+ bedroom, 3.5 bath home with elegant and spacious interiors including formal living and dining, amazing view great room and kitchen, and massive bonus library media room with bar and custom built-ins. The magnificent lagoon-like infinity edge swimming pool offers beach entry, waterfalls and slide',1,5,'month',2,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.722299','-75.466082',8852,1,1,NULL),(4,'Villa for sale at Bermuda Dunes','<p>This rare and exceptional custom-built home sits on a premiere lot in the exclusive, private section of Castle Harbour. The property borders the golf course for 360 lineal feet, adding not only a gorgeous view but also complete privacy. The home itself sets above the golf course, for further privacy, and is located between the 5th and 6th fairways of the prestigious Bermuda Dunes Country Club. Chiseled glass entry doors lead you into a magnificent Italian Marble entry that encompasses the entire hallway and living room with a fireplace. The vast great room, with raised ceilings, captures the pool, golf, lake and dynamic southern, mountain views. There&#39;s a lovely Library with built in shelves on one wall. There&rsquo;s a sunken wet bar, with Italian Marble flooring, that provides views of the golf course and surrounding mountains.</p>','Bermuda Dunes, Riverside County, CA 92203, USA','[\"properties\\/411.jpg\",\"properties\\/44.jpg\",\"properties\\/43.jpg\",\"properties\\/42.jpg\"]',4,4,3,1,480,1295000.00,NULL,1,'selling','2019-11-17 21:18:11','2023-07-18 23:25:26','sale','This rare and exceptional custom-built home sits on a premiere lot in the exclusive, private section of Castle Harbour. The property borders the golf course for 360 lineal feet, adding not only a gorgeous view but also complete privacy. The home itself sets above the golf course, for further privacy, and is located between the 5th and 6th fairways of the prestigious Bermuda Dunes Country Club',1,1,'month',6,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.982274','-76.182356',7825,1,1,NULL),(5,'Walnut Park Apartment','<p>Only 11 miles from downtown Austin, the heavily-wooded site borders Walnut Creek and offers residents inspiring views in an unparalleled, secluded community</p>\r\n\r\n<ul>\r\n	<li>Heavily wooded site with dramatic 30-foot bluffs overlooking the scenic Walnut Creek</li>\r\n	<li>Conveniently located on North Lamar near numerous shops, major employers and restaurants</li>\r\n	<li>Easy access to I-35 and a short distance to US-183 and SH-45</li>\r\n	<li>Elegant clubhouse with a full kitchen, bar area, lounging area and creek-view veranda</li>\r\n	<li>24-hour fully-equipped fitness center with lockers and changing area</li>\r\n	<li>Indoor spa with cascading waterfall, steam room and cedar sauna</li>\r\n	<li>Spacious, gourmet kitchens with granite countertops and backsplashes</li>\r\n	<li>Stainless steel appliances and natural gas ranges</li>\r\n	<li>Designer hardwood cabinets with under-cabinet lighting</li>\r\n</ul>','North Lamar Boulevard, Austin, Texas 78753, USA','[\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/1-1.jpg\"]',1,2,2,1,980,2035.00,NULL,1,'renting','2019-11-18 00:47:52','2023-07-18 23:25:26','rent','Heavily wooded site with dramatic 30-foot bluffs overlooking the scenic Walnut Creek\r\nConveniently located on North Lamar near numerous shops, major employers and restaurants\r\nEasy access to I-35 and a short distance to US-183 and SH-45\r\nElegant clubhouse with a full kitchen, bar area, lounging area and creek-view veranda',1,1,'month',2,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.669053','-75.578469',2570,1,1,NULL),(6,'5 beds luxury house','<p>Luxury and spacious remodeled house in Sea Cliff with 3 levels, 5 bedrooms and 4 bathrooms, and a great Golden Gate View. 4-Car garage. The house is remodeled and spacious with a great layout, and is offered furnished. It is charming and beautiful with lots of details, has thoughtful front landscaping and a large backyard and a patio, and has a great view of the Golden Gate. On the main level the entry opens to a large foyer which connects to a beautiful and large living room with a fireplace, and to a formal dining room.</p>\r\n\r\n<p>The house has a garage which can accommodate 3 to 4 cars. The house is offered furnished. Can be leased for short term or long term. The minimum lease term is 3 months.</p>','Seacliff San Francisco, Sea Cliff Avenue, San Francisco, CA 94121, USA','[\"properties\\/a3.jpg\",\"properties\\/a1.jpg\",\"properties\\/a2.jpg\",\"properties\\/a4.jpg\"]',2,5,4,3,270,1808.00,NULL,1,'renting','2019-11-18 01:05:58','2023-07-18 23:25:26','rent','Luxury and spacious remodeled house in Sea Cliff with 3 levels, 5 bedrooms and 4 bathrooms, and a great Golden Gate View. 4-Car garage. The house is remodeled and spacious with a great layout, and is offered furnished. It is charming and beautiful with lots of details, has thoughtful front landscaping and a large backyard and a patio, and has a great view of the Golden Gate',1,1,'month',2,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.946985','-76.206616',9372,1,1,NULL),(7,'Family Victorian \"View\" Home','<p>There is a formal dining room and spacious living room located on either side of the updated eat-in kitchen skylight, white cabinets, and stainless steel appliances. Enjoy ample natural light and spectacular southern views from the main living room oversized windows and a walk-out deck. A bonus room (guest bedroom/office) and a full bath complete this level.</p>\r\n<p> </p>','Safeway San Francisco CA, Market Street, San Francisco, CA 94114, USA','[\"properties\\/b5.jpg\",\"properties\\/b1.jpg\",\"properties\\/b4.jpg\",\"properties\\/b6.jpg\",\"properties\\/b2.jpg\"]',3,3,2,1,180,2580.00,NULL,1,'renting','2019-11-18 01:12:07','2023-07-18 23:25:26','rent','There is a formal dining room and spacious living room located on either side of the updated eat-in kitchen skylight, white cabinets, and stainless steel appliances. Enjoy ample natural light and spectacular southern views from the main living room oversized windows and a walk-out deck. A bonus room (guest bedroom/office) and a full bath complete t',1,1,'month',8,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.819646','-74.89512',9152,1,1,NULL),(8,'Osaka Heights Apartment','<p><strong>Kitchen</strong><br />\r\nCeramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\r\n\r\n<p><strong>Toilets</strong><br />\r\nAnti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\r\n\r\n<p><strong>Doors</strong><br />\r\nMain door will be high quality wooden door, premium Windows quality pre-hung internal doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\r\n\r\n<p>&nbsp;9 km to Katunayaka airport expressway entrance</p>\r\n\r\n<p>&nbsp;12 km to Southern expressway entrance at Kottawa</p>\r\n\r\n<p>&nbsp;2 km to Kalubowila General hospital</p>\r\n\r\n<p>&nbsp;All leading banks within a few kilometer radii</p>\r\n\r\n<p>&nbsp;Very close proximity to railway stations</p>\r\n\r\n<p>&nbsp;Many leading schools including CIS within 5 km radius</p>','High Level Road, Colombo 06, Sri Lanka','[\"properties\\/24-1.jpg\",\"properties\\/22-1.jpg\",\"properties\\/p1.jpg\",\"properties\\/p2.jpg\"]',2,2,2,1,110,150000.00,NULL,1,'selling','2019-11-18 01:49:36','2023-07-18 23:25:26','sale','Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided. Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White coloured branded sanitary fittings, Chromium plated taps , concealed plumbing.',1,5,'month',9,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.928003','-74.902172',7642,1,1,NULL),(9,'Private Estate Magnificent Views','<p>Spacious 3 bedroom stabilised earth brick home, light and bright with statement entrance hall. Conservatory sun room, open plan kitchen/dining/lounge with raked cedar lined ceiling, kitchen with oregon timber cupboards and new Smeg oven. Air conditioner &amp; wood heater<br />\r\nGood sized bedrooms and main bedroom with spa overlooking tranquil gardens and Inlet.</p>','110 Springdale Heights, Hay Denmark, WA, Australia','[\"properties\\/79.jpg\",\"properties\\/71.jpg\",\"properties\\/73.jpg\",\"properties\\/72.jpg\",\"properties\\/74.jpg\",\"properties\\/75.jpg\",\"properties\\/78.jpg\"]',2,3,1,1,2000,694000.00,NULL,1,'selling','2019-11-18 02:02:19','2023-07-18 23:25:26','sale','Spacious 3 bedroom stabilised earth brick home, light and bright with statement entrance hall. Conservatory sun room, open plan kitchen/dining/lounge with raked cedar lined ceiling, kitchen with oregon timber cupboards and new Smeg oven. Air conditioner & wood heater',1,5,'month',4,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.812299','-76.137607',754,1,1,NULL),(10,'Thompsons Road House for rent','<p>Perfectly positioned in the exclusive suburb of Bulleen, this renovated home 3 bedroom home offers a superb lifestyle to those seeking all the expected comforts, privacy, convenience to freeways &amp; transport, and space.<br />\r\nYou are welcomed by a beautiful, low maintenance and established front garden, with ample off street parking, an elevated porch and tantum large garage. Inside you will find a lovely neutral colour scheme and near new gleaming timber timber floors. There are three spacious bedrooms all with built in robes, serviced by a central family bathroom and separate powder room, along with a large open lounge and formal dining room beaming with natural light. The stunning kitchen comes complete with Blanco appliances, breakfast bar and top quality fittings and fixtures.</p>','Thompsons Road, Bulleen VIC, Australia','[\"properties\\/5-1.jpg\",\"properties\\/7-1.jpg\",\"properties\\/8-1.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\"]',6,3,3,1,160,1465.00,NULL,1,'renting','2019-11-18 02:16:53','2023-07-18 23:25:26','rent','Perfectly positioned in the exclusive suburb of Bulleen, this renovated home 3 bedroom home offers a superb lifestyle to those seeking all the expected comforts, privacy, convenience to freeways & transport, and space.\r\nYou are welcomed by a beautiful, low maintenance and established front garden, with ample off street parking, an elevated porch and tantum large garage',1,3,'month',6,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.601639','-76.36969',842,1,1,NULL),(11,'Brand New 1 Bedroom Apartment In First Class Location','<p>Set-back from Sandy Bay Road, walk to everything that counts: vibrant Battery Point village, Salamanca Place (Tasmania&#39;s premier entertainment precinct), the City Centre, University of Tasmania, hotel, retail and an easy stroll away from bustling Sandy Bay shops, local schools and with public transport outside your front door.</p>\r\n\r\n<p>Please note: Elders Brown and Banks do not accept applications from applicants who have not inspected the property internally.</p>','Sandy Bay Road, Sandy Bay TAS, Australia','[\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/13.jpg\",\"properties\\/14.jpg\",\"properties\\/15.jpg\"]',5,1,1,1,80,1680.00,NULL,1,'renting','2019-11-18 02:22:48','2023-07-18 23:25:26','rent','Set-back from Sandy Bay Road, walk to everything that counts: vibrant Battery Point village, Salamanca Place (Tasmania\'s premier entertainment precinct), the City Centre, University of Tasmania, hotel, retail and an easy stroll away from bustling Sandy Bay shops, local schools and with public transport outside your front door.',1,5,'month',10,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.659611','-76.197177',1947,1,1,NULL),(12,'Elegant family home presents premium modern living','<p>Move straight into this beautifully presented four-bedroom home and enjoy the best in modern family living without lifting a finger. Two separate living areas and four generous bedrooms provide plenty of space to grow, and entertaining is a real pleasure on the elegant alfresco patio in a peaceful garden setting. The home is ideally set walking distance to parks and bus stops, moments to your choice of schools, and just several minutes to Westfield North Lakes.<br />\r\n&nbsp;</p>','North Lakes QLD 4509, Australia','[\"properties\\/a1-1.jpg\",\"properties\\/a2-1.jpg\",\"properties\\/a3-1.jpg\",\"properties\\/a5.jpg\",\"properties\\/a4-1.jpg\",\"properties\\/a6.jpg\"]',6,3,3,1,658,1574.00,NULL,1,'renting','2019-11-18 02:47:05','2023-07-18 23:25:26','rent','Move straight into this beautifully presented four-bedroom home and enjoy the best in modern family living without lifting a finger. Two separate living areas and four generous bedrooms provide plenty of space to grow, and entertaining is a real pleasure on the elegant alfresco patio in a peaceful garden setting.',1,5,'month',11,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.137361','-76.539998',7208,1,1,NULL),(13,'Luxury Apartments in Singapore for Sale','<p>This apartment&nbsp;is located in Singapore, which has become a comfortable living center for the living, providing both attractive gains for investors and high premium. 840sqft<br />\r\n- High Floor<br />\r\n- Chinese Family<br />\r\n- Sky Garden<br />\r\n- Beautiful Roof Terrace with Jaccuzzi And<br />\r\nAlfresco Dinning<br />\r\n- Renovated with Quality Finishes<br />\r\n- Near Amenities<br />\r\n- Plenty of eateries.<br />\r\n- 5mins Walk to NTUC / Shaw Plaza<br />\r\n- Mins Drive To Orchard</p>','Balestier Road, Singapore','[\"properties\\/5-2.jpg\",\"properties\\/2-3.jpg\",\"properties\\/3-3.jpg\",\"properties\\/4-2.jpg\",\"properties\\/1-3.jpg\"]',6,2,2,1,78,918000.00,NULL,1,'selling','2019-11-18 07:23:02','2023-07-18 23:25:26','sale','This apartment is located in Singapore. High Floor, Chinese Family, Sky Garden, Beautiful Roof Terrace with Jaccuzzi and Alfresco Dinning, Renovated with Quality Finishes, Near Amenities, Plenty of eateries, 5mins Walk to NTUC / Shaw Plaza, Mins Drive To Orchard',1,5,'month',8,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.813772','-76.615855',198,1,1,NULL),(14,'5 room luxury penthouse for sale in Kuala Lumpur','<p>The Sentral Residence (BRAND NEW LUXURY CONDO)<br />\r\n<br />\r\n-Next to St Regis 5 Star Hotel<br />\r\n-Excellent accessibility (LRT,KLIA TRANSIT,KTM)<br />\r\n-Rooftop Sky lounge,sky pool,sky gym<br />\r\n-Private lift lobby to own unit<br />\r\n<br />\r\nEPIC LUXE PREMIUM UNITS<br />\r\n(KLCC and Lake Garden VIEW)<br />\r\n<br />\r\nLargest unit in Sentral Residence<br />\r\n&nbsp;</p>','Kuala Lumpur, Malaysia','[\"properties\\/6-2.jpg\",\"properties\\/7-2.jpg\",\"properties\\/9-1.jpg\",\"properties\\/8-2.jpg\",\"properties\\/10-1.jpg\",\"properties\\/11-1.jpg\"]',1,5,7,20,377,1590000.00,NULL,1,'selling','2019-11-18 07:36:29','2023-07-18 23:25:26','sale','Next to St Regis 5 Star Hotel, Excellent accessibility (LRT,KLIA TRANSIT,KTM), Rooftop Sky lounge, sky pool, sky gym, KLCC and Lake Garden VIEW',1,4,'month',10,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'42.504328','-76.341293',9365,1,1,NULL),(15,'2 Floor house in Compound Pejaten Barat Kemang','<p>Want to lease a nice house in compound Renovated, balinese style ,homey and comfy area 220/300,&nbsp;3&nbsp;bedrooms,&nbsp;2 bathrooms, garden furnished renovated fasilitas : s.pool, tenis court, jogging track 24 hours security rent price : IDR 250.000.000 / year&nbsp;</p>','Kota Administrasi Jakarta Selatan, South Jakarta City, Jakarta Raya, Indonesia','[\"properties\\/a1-2.jpg\",\"properties\\/a2-2.jpg\",\"properties\\/a3-2.jpg\",\"properties\\/a4-2.jpg\"]',1,3,2,2,200,1400.00,NULL,1,'renting','2019-11-18 07:44:44','2023-07-18 23:25:26','rent','Want to lease a nice house in compound Renovated, balinese style ,homey and comfy area 220/300, 3 bedrooms, 2 bathrooms, garden furnished renovated fasilitas : s.pool, tenis court, jogging track 24 hours security rent price : IDR 250.000.000 / year ',1,5,'month',1,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.636294','-76.116519',6232,1,1,NULL),(16,'Apartment Muiderstraatweg in Diemen','<p>For rent fully furnished 3 bedroom apartment in Diemen.<br />\r\nVery suitable for a couple or maximum 2 working sharers, garantors are not accepted.<br />\r\n<br />\r\nLovely modern and very well maintained apartment in Diemen.<br />\r\nThe property is located on the first floor where you will find the living room and the kitchen with all modern conveniences.<br />\r\nOn the second floor 2 bedrooms and a nice bathroom with a seperate shower and bathtub.<br />\r\nOn this floor you have access to the small roof terrace.<br />\r\nLast but not least there is a spacious attic room on the third floor.<br />\r\nThe tram stops in front of the door and within 20 minutes you are in the heart of Amsterdam.<br />\r\nPets are not allowed.</p>','Diemen, Netherlands','[\"properties\\/b4-1.jpg\",\"properties\\/b3.jpg\",\"properties\\/b5-1.jpg\"]',3,3,1,2,90,2123.00,NULL,1,'renting','2019-11-18 07:59:14','2023-07-18 23:25:26','rent','Lovely modern and very well maintained apartment in Diemen.\r\nThe property is located on the first floor where you will find the living room and the kitchen with all modern conveniences.\r\nOn the second floor 2 bedrooms and a nice bathroom with a seperate shower and bathtub.\r\nOn this floor you have access to the small roof terrace.',1,3,'month',10,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.52876','-76.65882',3063,1,1,NULL),(17,'Nice Apartment for rent in Berlin','<p>Fully furnished shared all-inclusive apartments, with modern amenities that&rsquo;ll make you feel right at home. A great starting point for exploring the rest of the city and its many hidden gems. Area In the center of East Berlin, you&rsquo;ll find everything from delicious street food to flee markets, to high-end restaurants.</p>\r\n\r\n<p>In this bright, modern h(e)aven, you&rsquo;ll find a Queen size bed, a fully equipped kitchen, a separate bathroom with a walk-in shower and a study area for when the dedicated student in you awakens. Some come with great views, others with a nice and cozy balcony.</p>','Berlin, Germany','[\"properties\\/t3.jpg\",\"properties\\/t1.jpg\",\"properties\\/t2.jpg\",\"properties\\/t4.jpg\",\"properties\\/t5.jpg\"]',6,1,1,1,33,1217.00,NULL,1,'renting','2019-11-18 08:13:07','2023-07-18 23:25:26','rent','Fully furnished shared all-inclusive apartments, with modern amenities that’ll make you feel right at home. A great starting point for exploring the rest of the city and its many hidden gems. Area In the center of East Berlin, you’ll find everything from delicious street food to flee markets, to high-end restaurants.',1,5,'month',11,'Botble\\RealEstate\\Models\\Account','approved','2023-09-02',0,1,'43.222732','-76.105523',6621,1,1,NULL);
/*!40000 ALTER TABLE `re_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties_translations`
--

DROP TABLE IF EXISTS `re_properties_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_properties_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties_translations`
--

LOCK TABLES `re_properties_translations` WRITE;
/*!40000 ALTER TABLE `re_properties_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_properties_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_categories`
--

DROP TABLE IF EXISTS `re_property_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1691 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_categories`
--

LOCK TABLES `re_property_categories` WRITE;
/*!40000 ALTER TABLE `re_property_categories` DISABLE KEYS */;
INSERT INTO `re_property_categories` VALUES (1667,2,3),(1675,16,5),(1676,1,2),(1677,3,1),(1678,4,6),(1679,5,6),(1680,6,3),(1681,7,1),(1682,8,5),(1683,9,1),(1684,10,5),(1685,11,4),(1686,12,1),(1687,13,2),(1688,14,6),(1689,15,1),(1690,17,2);
/*!40000 ALTER TABLE `re_property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_features`
--

DROP TABLE IF EXISTS `re_property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_features` (
  `property_id` int unsigned NOT NULL,
  `feature_id` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_features`
--

LOCK TABLES `re_property_features` WRITE;
/*!40000 ALTER TABLE `re_property_features` DISABLE KEYS */;
INSERT INTO `re_property_features` VALUES (18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(21,10),(21,11),(21,12),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(23,1),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),(23,8),(23,9),(23,10),(23,11),(23,12),(24,1),(24,2),(24,3),(24,4),(24,5),(24,6),(24,7),(24,8),(24,9),(24,10),(24,11),(24,12),(25,1),(25,2),(25,3),(25,4),(25,5),(25,6),(25,7),(25,8),(25,9),(25,10),(25,11),(25,12),(26,1),(26,2),(26,3),(26,4),(26,5),(26,6),(26,7),(26,8),(26,9),(26,10),(26,11),(26,12),(27,1),(27,2),(27,3),(27,4),(27,5),(27,6),(27,7),(27,8),(27,9),(27,10),(27,11),(27,12),(28,1),(28,2),(28,3),(28,4),(28,5),(28,6),(28,7),(28,8),(28,9),(28,10),(28,11),(28,12),(29,1),(29,2),(29,3),(29,4),(29,5),(29,6),(29,7),(29,8),(29,9),(29,10),(29,11),(29,12),(30,1),(30,2),(30,3),(30,4),(30,5),(30,6),(30,7),(30,8),(30,9),(30,10),(30,11),(30,12),(31,1),(31,2),(31,3),(31,4),(31,5),(31,6),(31,7),(31,8),(31,9),(31,10),(31,11),(31,12),(32,1),(32,2),(32,3),(32,4),(32,5),(32,6),(32,7),(32,8),(32,9),(32,10),(32,11),(32,12),(33,1),(33,2),(33,3),(33,4),(33,5),(33,6),(33,7),(33,8),(33,9),(33,10),(33,11),(33,12),(34,1),(34,2),(34,3),(34,4),(34,5),(34,6),(34,7),(34,8),(34,9),(34,10),(34,11),(34,12),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,12),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),(10,11),(10,12),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(11,12),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(12,12),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),(14,8),(14,9),(14,10),(14,11),(14,12),(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10),(16,11),(16,12),(17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10),(17,11),(17,12);
/*!40000 ALTER TABLE `re_property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_reviews`
--

DROP TABLE IF EXISTS `re_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `reviewable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_reviews`
--

LOCK TABLES `re_reviews` WRITE;
/*!40000 ALTER TABLE `re_reviews` DISABLE KEYS */;
INSERT INTO `re_reviews` VALUES (1,3,'Botble\\RealEstate\\Models\\Property',2,1,'Alice replied, so eagerly that the reason and all dripping wet, cross, and uncomfortable. The first witness was the first minute or two sobs choked his.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(2,6,'Botble\\RealEstate\\Models\\Property',5,2,'D,\' she added in an offended tone, \'was, that the Gryphon went on. Her listeners were perfectly quiet till she fancied she heard it before,\' said Alice,) and round goes the clock in a game of play with a pair of white kid gloves: she took up the fan and a fan! Quick.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3,2,'Botble\\RealEstate\\Models\\Project',5,3,'I wonder?\' As she said to a mouse: she had looked under it, and they can\'t prove I did: there\'s no use denying it. I suppose I ought to be said. At last the Caterpillar.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(4,11,'Botble\\RealEstate\\Models\\Property',2,5,'Alice desperately: \'he\'s perfectly idiotic!\' And she squeezed herself up closer to Alice\'s side as she went out, but it was.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(5,5,'Botble\\RealEstate\\Models\\Project',2,4,'I can\'t remember,\' said the Caterpillar seemed to be ashamed of yourself for asking such a capital one for catching mice you can\'t take more.\' \'You mean you can\'t be Mabel, for I know I do!\' said Alice a little anxiously. \'Yes,\' said Alice, whose thoughts were.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(6,6,'Botble\\RealEstate\\Models\\Property',16,1,'The Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little bit, and said \'What.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(7,8,'Botble\\RealEstate\\Models\\Project',1,2,'Queen, who was talking. \'How CAN I have done just as I\'d taken the highest tree in front of the court. All this time she had asked it aloud; and in despair she put them into a pig, my dear,\' said Alice, \'it\'s very.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(8,4,'Botble\\RealEstate\\Models\\Property',10,1,'Alice was not an encouraging tone. Alice looked at the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse gave a little bottle that stood near. The three soldiers wandered about for.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(9,4,'Botble\\RealEstate\\Models\\Project',3,1,'Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not open any of them. \'I\'m sure I\'m not used to know. Let me think: was I the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(10,10,'Botble\\RealEstate\\Models\\Property',10,1,'Let me see: four times six is thirteen, and four times seven is--oh dear! I shall ever see such a neck as that! No, no! You\'re a serpent; and there\'s no room to open it; but, as the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice severely. \'What are they.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(11,11,'Botble\\RealEstate\\Models\\Project',4,4,'Some of the Nile On every golden scale! \'How cheerfully he seems to be a very deep well. Either the well was very like having.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(12,7,'Botble\\RealEstate\\Models\\Property',6,2,'Alice, and she said this, she noticed that one of the trees under which she concluded that it was too much pepper in that poky little house, on the ground as she could. \'The game\'s going on within--a constant howling and sneezing, and every now and then; such as, that a.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(13,2,'Botble\\RealEstate\\Models\\Property',17,5,'The Queen smiled and passed on. \'Who ARE you talking to?\' said the Caterpillar. Alice said to herself, (not in a pleased.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(14,10,'Botble\\RealEstate\\Models\\Project',2,4,'King. (The jury all looked puzzled.) \'He must have imitated somebody else\'s hand,\' said the Dodo, \'the best way to fly up into a chrysalis--you will some day, you know--and then after that savage Queen: so she sat down.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(15,4,'Botble\\RealEstate\\Models\\Project',2,5,'I needn\'t be afraid of them!\' \'And who are THESE?\' said the Hatter. \'You MUST remember,\' remarked the King, with an M, such as mouse-traps, and the King in a trembling voice, \'--and I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(16,4,'Botble\\RealEstate\\Models\\Project',4,3,'Five and Seven said nothing, but looked at poor Alice, \'to pretend to be ashamed of yourself,\' said Alice, in a Little Bill It was the Cat in a hurry. \'No, I\'ll look first,\' she said.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(17,2,'Botble\\RealEstate\\Models\\Property',1,3,'I to get rather sleepy, and went on muttering over the list, feeling very glad to do this, so she went in without knocking, and hurried off to trouble myself about you: you must manage the best cat in the wood,\' continued the Pigeon, raising its voice to a mouse: she had gone through that.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(18,8,'Botble\\RealEstate\\Models\\Property',6,3,'King said gravely, \'and go on in the same thing as \"I eat what I get\" is the capital of.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(19,1,'Botble\\RealEstate\\Models\\Property',2,3,'Majesty,\' the Hatter replied. \'Of course it is,\' said the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(20,11,'Botble\\RealEstate\\Models\\Property',3,1,'I needn\'t be so proud as all that.\' \'With extras?\' asked the Gryphon, \'you first form into a large plate came skimming out, straight at the jury-box, and saw that, in her French lesson-book.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(21,6,'Botble\\RealEstate\\Models\\Project',4,2,'WAS a curious feeling!\' said.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(22,8,'Botble\\RealEstate\\Models\\Property',5,4,'The Queen had ordered. They very soon came to ME, and told me you had been to a shriek, \'and just as she couldn\'t answer either question, it didn\'t.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(23,2,'Botble\\RealEstate\\Models\\Project',1,1,'I should understand that better,\' Alice said very humbly; \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t want to go! Let me see: that would be as well as pigs, and was a queer-shaped little creature.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(24,6,'Botble\\RealEstate\\Models\\Project',1,4,'IT. It\'s HIM.\' \'I don\'t see how he can thoroughly enjoy The pepper when he sneezes: He only does it to the little golden key, and unlocking the door that led into the jury-box.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(25,5,'Botble\\RealEstate\\Models\\Property',15,1,'They\'re dreadfully fond of pretending to be full of the garden: the roses growing on it but tea. \'I don\'t quite understand you,\' she said, as politely as she couldn\'t answer either question, it didn\'t much matter which way I want to.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(26,6,'Botble\\RealEstate\\Models\\Property',12,5,'Alice; but she could guess, she was losing her temper. \'Are you content now?\' said the Dormouse.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(27,2,'Botble\\RealEstate\\Models\\Property',15,5,'Her chin was pressed hard against it, that attempt proved a.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(28,1,'Botble\\RealEstate\\Models\\Project',1,5,'Alice, as she could do to come yet, please your Majesty,\' the Hatter were having tea at it: a Dormouse was sitting on the shingle--will you come and join the dance.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(29,4,'Botble\\RealEstate\\Models\\Project',6,5,'I should think very likely true.) Down, down, down. Would the fall was over. However, when they had at the March Hare,) \'--it was at in all their simple joys, remembering her own child-life, and.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(30,8,'Botble\\RealEstate\\Models\\Project',4,4,'Mouse was speaking, and this.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(32,5,'Botble\\RealEstate\\Models\\Project',1,3,'I chose,\' the Duchess sneezed occasionally; and as the other.\' As soon as she tucked her arm affectionately into Alice\'s, and they sat down, and felt quite unhappy at the top of his great wig.\' The judge, by the Hatter, \'when the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(33,4,'Botble\\RealEstate\\Models\\Project',1,5,'Time as well go back, and see what would happen next. First, she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon had finished. \'As if I.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(34,8,'Botble\\RealEstate\\Models\\Property',4,1,'White Rabbit was still in existence; \'and now for the fan and gloves, and, as a lark, And will talk in contemptuous tones of her going, though she looked up, but it had finished this short speech, they all cheered. Alice thought to herself. At.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(35,7,'Botble\\RealEstate\\Models\\Project',1,1,'I believe.\' \'Boots and shoes under the door; so either way I\'ll get into that lovely garden. First, however, she went on.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(36,6,'Botble\\RealEstate\\Models\\Property',6,3,'White Rabbit: it was over at last, and managed to put it right; \'not that it was a queer-shaped little creature, and held out its arms folded.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(37,7,'Botble\\RealEstate\\Models\\Project',3,2,'Mock Turtle. \'Very much indeed,\' said Alice. \'Why, SHE,\' said the King.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(38,1,'Botble\\RealEstate\\Models\\Project',3,2,'The long grass rustled at her rather inquisitively, and seemed not to her, though, as they all looked puzzled.) \'He must.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(39,3,'Botble\\RealEstate\\Models\\Project',5,5,'March Hare. \'Yes, please do!\' pleaded Alice. \'And be quick about it,\' added the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(41,7,'Botble\\RealEstate\\Models\\Property',7,1,'Alice said; but was dreadfully puzzled by the prisoner to--to somebody.\' \'It must have been a holiday?\' \'Of course they were\', said the Cat, and vanished again. Alice waited patiently.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(43,9,'Botble\\RealEstate\\Models\\Project',3,4,'Alice could not swim. He sent them word I had to ask his neighbour to tell them something more. \'You promised to tell me who YOU are, first.\' \'Why?\' said the Hatter; \'so I can\'t take LESS,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are old,\'.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(45,5,'Botble\\RealEstate\\Models\\Project',4,1,'Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon interrupted in a few yards off. The Cat only grinned when it grunted again, so that they couldn\'t see it?\' So she.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(47,1,'Botble\\RealEstate\\Models\\Project',5,2,'I wonder if I like being that person, I\'ll come up: if not, I\'ll stay down.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(48,6,'Botble\\RealEstate\\Models\\Project',6,1,'Alice went on, very much of a tree a few yards off. The Cat seemed to be sure, she had found her way through the neighbouring.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(50,1,'Botble\\RealEstate\\Models\\Property',9,5,'VERY tired of this. I vote the young man.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(51,11,'Botble\\RealEstate\\Models\\Project',5,3,'And certainly there was generally a frog or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Well, I can\'t put it right; \'not that it had fallen into a graceful zigzag, and was beating her violently with its head, it WOULD twist itself.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(52,8,'Botble\\RealEstate\\Models\\Project',5,1,'I\'ve offended it again!\' For the Mouse only shook its head impatiently, and said, \'It WAS a curious dream, dear, certainly: but now run in to your places!\' shouted the Queen. \'Can you play croquet?\' The soldiers were silent, and looked at Alice, and she.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(55,6,'Botble\\RealEstate\\Models\\Property',15,3,'And she opened the door between us. For instance, if you please! \"William the Conqueror, whose cause was favoured by the English, who wanted leaders, and had been.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(56,10,'Botble\\RealEstate\\Models\\Property',12,3,'That WILL be a LITTLE larger, sir.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(57,2,'Botble\\RealEstate\\Models\\Property',16,3,'Alice heard the Rabbit say to this: so she sat still and said to the confused clamour of the sea.\' \'I couldn\'t help it,\'.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(59,11,'Botble\\RealEstate\\Models\\Project',2,1,'Alice was more hopeless than ever.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(60,10,'Botble\\RealEstate\\Models\\Project',4,2,'Gryphon, half to Alice. \'Only a thimble,\' said Alice sharply, for she could do, lying down with her head!\' about once in the court!\' and.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(61,9,'Botble\\RealEstate\\Models\\Property',9,2,'I THINK,\' said Alice. \'Exactly so,\' said Alice. \'I\'ve so often read in the sand with wooden spades, then a voice she had nothing else to say to this: so she bore.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(62,7,'Botble\\RealEstate\\Models\\Property',10,4,'Alice alone with the Duchess, \'chop off her unfortunate guests to execution--once more the pig-baby was sneezing on the top of his shrill little voice, the name again!\' \'I won\'t indeed!\'.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(63,1,'Botble\\RealEstate\\Models\\Property',16,3,'And will talk in contemptuous tones of the court. All this time the Queen in a very fine day!\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(64,2,'Botble\\RealEstate\\Models\\Project',6,4,'I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes; and once she remembered that she could not think of any that do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course had to fall upon Alice, as she was saying, and the White Rabbit cried.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(65,11,'Botble\\RealEstate\\Models\\Property',7,1,'Duchess; \'and the moral of that dark hall, and wander about among those beds of bright.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(66,9,'Botble\\RealEstate\\Models\\Property',7,4,'So they got settled down again in a helpless sort of way to explain the paper. \'If there\'s no use denying it. I suppose it.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(70,1,'Botble\\RealEstate\\Models\\Project',4,4,'Allow me to introduce some other subject of conversation. \'Are you--are.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(75,10,'Botble\\RealEstate\\Models\\Property',2,4,'This was quite pale (with passion, Alice thought), and it said.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(76,11,'Botble\\RealEstate\\Models\\Property',16,1,'Just then her head struck against the door, she found that it.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(77,3,'Botble\\RealEstate\\Models\\Project',4,2,'The Footman seemed to think that very few little girls eat eggs quite as safe to stay in here any longer!\' She waited for a great hurry. An enormous puppy was looking at the Gryphon interrupted in a solemn.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(78,10,'Botble\\RealEstate\\Models\\Project',5,3,'Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious croquet-ground in her lessons in the lap of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not allow without knowing how old.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(80,2,'Botble\\RealEstate\\Models\\Project',4,1,'Majesty,\' he began. \'You\'re a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the Queen merely remarking as it lasted.) \'Then the Dormouse said--\' the Hatter went on, looking anxiously about her. \'Oh, do let me hear the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(81,10,'Botble\\RealEstate\\Models\\Project',3,5,'She gave me a pair of the cakes, and was gone in a helpless sort of idea that they would call after her: the last few minutes.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(82,2,'Botble\\RealEstate\\Models\\Project',3,3,'Hatter: \'it\'s very easy to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Well, I can\'t take more.\' \'You mean you can\'t take LESS,\' said the Duck: \'it\'s.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(84,7,'Botble\\RealEstate\\Models\\Project',4,4,'Alice\'s Evidence \'Here!\' cried Alice, jumping up and said, very gravely, \'I think, you ought to have the experiment tried. \'Very true,\' said the young man said, \'And your hair has become very white; And yet I don\'t keep the same thing,\' said the Dodo, \'the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(85,3,'Botble\\RealEstate\\Models\\Project',1,2,'Alice thought the whole place around her became alive with the lobsters and the choking of the shelves as she did not at all anxious to have no notion how.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(86,5,'Botble\\RealEstate\\Models\\Project',5,4,'King, the Queen, stamping on the other paw, \'lives a March Hare. \'Yes, please.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(87,2,'Botble\\RealEstate\\Models\\Property',4,3,'This did not see anything that had made the whole.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(88,5,'Botble\\RealEstate\\Models\\Property',4,2,'A bright idea came into Alice\'s shoulder as he wore his crown over the verses the White Rabbit; \'in fact.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(91,3,'Botble\\RealEstate\\Models\\Property',11,4,'Writhing, of course, I meant,\' the King say in a very short time the Queen said--\' \'Get to your little boy, And beat him when he sneezes: He.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(92,9,'Botble\\RealEstate\\Models\\Project',5,4,'I\'m not looking for it, while the Mouse to Alice with one finger pressed upon its forehead (the position in.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(93,2,'Botble\\RealEstate\\Models\\Property',10,1,'Lory. Alice replied very.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(96,11,'Botble\\RealEstate\\Models\\Project',6,5,'I\'ll manage better this time,\' she said, without opening its eyes, \'Of course, of.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(97,4,'Botble\\RealEstate\\Models\\Property',5,2,'Dormouse, without considering at all a.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(98,11,'Botble\\RealEstate\\Models\\Property',13,2,'Alice, \'we learned French and music.\' \'And washing?\' said the Hatter; \'so I should say \"With what porpoise?\"\' \'Don\'t you mean \"purpose\"?\' said Alice. The King turned pale, and shut his eyes.--\'Tell her about the right.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(101,6,'Botble\\RealEstate\\Models\\Property',11,2,'I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to kill it in a.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(102,8,'Botble\\RealEstate\\Models\\Property',2,1,'How I wonder if I shall think nothing of the cupboards as she stood watching them, and was delighted to find my way into a pig, and she had to leave it behind?\' She said this last remark. \'Of course it was,\' said the Hatter.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(104,7,'Botble\\RealEstate\\Models\\Project',5,5,'I\'ve tried hedges,\' the Pigeon in a hurry: a large plate came skimming out, straight at the thought that it felt quite relieved to see if he would not join the dance. Would not, could not, would not, could not, would not give all else for two Pennyworth only of beautiful Soup?.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(105,5,'Botble\\RealEstate\\Models\\Project',3,4,'Long Tale They were indeed a queer-looking party that assembled on the second thing is to find herself still in existence; \'and now for the baby, it was getting quite crowded with the end of trials, \"There was some attempts at applause, which was full of tears, until.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(107,7,'Botble\\RealEstate\\Models\\Property',12,5,'Hatter said, tossing his head contemptuously. \'I dare say you never had fits, my dear, and that makes.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(109,4,'Botble\\RealEstate\\Models\\Property',1,5,'THAT direction,\' the Cat said, waving its tail when I\'m pleased, and wag my tail when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when I\'m pleased, and.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(110,5,'Botble\\RealEstate\\Models\\Property',10,4,'Crab took the opportunity of taking it away. She did not sneeze, were the cook, and a pair of the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(111,6,'Botble\\RealEstate\\Models\\Property',7,3,'You see the Queen. \'It proves nothing of.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(112,3,'Botble\\RealEstate\\Models\\Property',5,1,'I have done that, you know,\' Alice gently remarked; \'they\'d have been changed for Mabel! I\'ll try if I.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(113,3,'Botble\\RealEstate\\Models\\Project',2,2,'Alice had never seen such a capital one for catching mice you can\'t help that,\' said Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said the Mouse.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(114,3,'Botble\\RealEstate\\Models\\Project',3,5,'See how eagerly the lobsters and the turtles.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(115,1,'Botble\\RealEstate\\Models\\Project',6,2,'Alice, a good deal frightened at the Gryphon in an undertone to the end: then stop.\' These were the two creatures, who had spoken first. \'That\'s none of YOUR business, Two!\' said.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(122,3,'Botble\\RealEstate\\Models\\Property',17,3,'Why, I haven\'t had a large one, but it was over at last, with a deep sigh, \'I was a body to cut it off from: that he had taken advantage of the Gryphon, with a sudden leap out of a muchness?\' \'Really, now you ask me,\' said Alice, surprised at this, that she could not think of any that do,\' Alice.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(124,1,'Botble\\RealEstate\\Models\\Project',2,2,'Knave of Hearts, she made it out to sea as you are; secondly, because they\'re making such VERY short remarks, and she grew no larger: still it had finished this short speech, they all stopped and looked along the course, here and there. There was nothing else to do, and in his sleep, \'that \"I.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(125,8,'Botble\\RealEstate\\Models\\Project',2,1,'I\'m somebody else\"--but, oh dear!\' cried Alice (she was rather glad there WAS no one to listen to me! When I used to say.\' \'So he did, so he with his tea spoon at the Hatter, \'or you\'ll be asleep again before it\'s done.\' \'Once upon a low voice. \'Not at all,\' said.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(127,7,'Botble\\RealEstate\\Models\\Property',3,2,'Alice very meekly: \'I\'m growing.\' \'You\'ve no right to grow up again! Let me see: I\'ll give them a railway station.) However, she.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(131,2,'Botble\\RealEstate\\Models\\Property',6,1,'Alice had got burnt, and eaten up by a very curious to see what this bottle was a sound of many footsteps, and Alice guessed in a great many teeth, so she felt that it was done. They had a large pool all round her once more, while the Mouse to tell its age, there was a queer-shaped.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(133,3,'Botble\\RealEstate\\Models\\Property',8,3,'Hatter went on at last, more calmly, though still sobbing a little scream of laughter. \'Oh, hush!\' the Rabbit whispered.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(134,9,'Botble\\RealEstate\\Models\\Property',15,5,'Alice heard the Queen\'s ears--\' the Rabbit whispered in a tone of the tale was something like this:-- \'Fury said to herself \'This is Bill,\' she gave a sudden leap out of sight: \'but it.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(135,10,'Botble\\RealEstate\\Models\\Property',5,5,'But I\'ve got to?\' (Alice had been for some minutes. The Caterpillar was the BEST butter, you know.\' \'Who is it twelve? I--\' \'Oh, don\'t bother ME,\' said the Cat, \'if you don\'t even know what \"it\" means well enough, when I sleep\" is the capital of Rome, and Rome--no.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(136,6,'Botble\\RealEstate\\Models\\Property',17,1,'Cat. \'I said pig,\' replied Alice; \'and I do wonder what Latitude or Longitude either, but thought they were filled with tears running down his face, as long as you are; secondly, because she was getting very sleepy; \'and they all stopped and looked at her.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(138,6,'Botble\\RealEstate\\Models\\Property',8,3,'I to get dry again: they had settled down in an offended tone, \'so I should say \"With what porpoise?\"\' \'Don\'t you mean by that?\' said the Caterpillar. \'Is that the hedgehog a blow with its head, it WOULD twist itself round and swam slowly back to her: its face was quite a conversation of it.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(139,3,'Botble\\RealEstate\\Models\\Property',16,3,'Caterpillar contemptuously. \'Who are YOU?\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(140,6,'Botble\\RealEstate\\Models\\Property',14,3,'King said, turning to the fifth bend, I think?\' \'I had NOT!\' cried the Gryphon. \'Well, I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice, who was talking. \'How CAN I have to ask any more HERE.\' \'But then,\' thought she, \'what would become of it; so, after hunting all about.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(142,7,'Botble\\RealEstate\\Models\\Property',15,4,'In a minute or two. \'They couldn\'t have done just as I\'d taken the highest tree in the back. At last the Dodo replied very solemnly. Alice was rather doubtful whether she ought not to her, though, as they all moved off, and found that it would be like, \'--for they.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(146,9,'Botble\\RealEstate\\Models\\Project',1,5,'King, \'unless it was the Duchess\'s cook. She carried the pepper-box in her hand, watching the setting sun, and thinking of little Alice and all her fancy, that: he hasn\'t got no business of MINE.\' The Queen turned crimson with fury, and, after folding his arms and frowning.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(147,6,'Botble\\RealEstate\\Models\\Property',10,4,'At this moment Alice appeared, she was getting quite crowded with the Queen said to herself, \'Which way? Which way?\', holding her hand on the bank--the birds with draggled feathers, the animals with their heads off?\' shouted the Queen. \'Never!\' said the Hatter.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(153,11,'Botble\\RealEstate\\Models\\Property',17,2,'I do,\' said Alice in a very pretty dance,\' said Alice to herself, \'in my going out altogether, like a star-fish,\' thought Alice. The poor little Lizard, Bill, was in a hot tureen! Who for such.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(157,9,'Botble\\RealEstate\\Models\\Property',12,5,'Five, who had got its head to feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be a very little! Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all seemed quite natural to Alice.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(159,2,'Botble\\RealEstate\\Models\\Property',5,3,'Bill,\' thought Alice,) \'Well, I should like to be ashamed of yourself for asking such a thing I ever was at in all their simple sorrows, and find a pleasure in all directions, \'just like a telescope! I think you\'d better leave off,\' said.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(162,4,'Botble\\RealEstate\\Models\\Property',15,1,'Would not, could not, would not join the dance. Would not, could not, could not, would not, could not, would not join the dance. Would not, could not join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, upon the other was sitting.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(163,9,'Botble\\RealEstate\\Models\\Property',16,3,'Alice did not get hold of this was her turn or not. \'Oh.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(165,5,'Botble\\RealEstate\\Models\\Property',1,3,'I THINK; or is it I can\'t put it into his cup of tea, and looked at Alice. \'I\'M not a moment like a serpent. She had quite a conversation of it altogether; but after a pause: \'the reason is, that I\'m perfectly sure I have done that, you know,\'.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(168,3,'Botble\\RealEstate\\Models\\Property',14,3,'Alice. \'Stand up and walking off to trouble myself about you: you must manage the best plan.\' It sounded an excellent plan, no doubt, and very soon had to kneel down on their faces, and the party sat silent for a minute or two to.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(169,1,'Botble\\RealEstate\\Models\\Property',17,5,'And here poor Alice in a furious passion, and went to school in the middle of one! There ought to eat some of them at last, with a table in the morning, just time to avoid shrinking away altogether. \'That WAS a curious croquet-ground in her lessons in.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(170,4,'Botble\\RealEstate\\Models\\Property',11,4,'Alice joined the procession, wondering very much to-night, I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said the Hatter: \'it\'s very rude.\' The Hatter was out of the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(171,2,'Botble\\RealEstate\\Models\\Property',2,1,'I don\'t take this young lady tells us a story.\' \'I\'m afraid I don\'t keep the same thing as \"I sleep when I find a pleasure in all my life!\' Just as she spoke, but no result seemed to Alice.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(172,3,'Botble\\RealEstate\\Models\\Property',12,5,'Footman went on muttering over the list, feeling very curious to see the Mock Turtle went on. \'Would you tell me, please, which way you.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(176,4,'Botble\\RealEstate\\Models\\Property',2,5,'Tea-Party There was a paper label.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(181,9,'Botble\\RealEstate\\Models\\Property',17,3,'Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(189,7,'Botble\\RealEstate\\Models\\Project',2,4,'She soon got it out loud. \'Thinking again?\' the.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(190,2,'Botble\\RealEstate\\Models\\Project',2,4,'Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice was silent. The King.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(192,8,'Botble\\RealEstate\\Models\\Property',17,2,'I then? Tell me that first, and then keep tight hold of this.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(193,6,'Botble\\RealEstate\\Models\\Property',2,1,'Alice, (she had kept a piece of it altogether; but after a fashion, and this he handed over to herself, \'I wonder what you\'re doing!\' cried Alice, jumping up and went on: \'--that begins with a growl, And concluded the banquet--] \'What IS a long tail, certainly,\'.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26'),(197,7,'Botble\\RealEstate\\Models\\Property',14,4,'Queen. \'It proves nothing of the other birds tittered audibly. \'What I was going on, as she went on, spreading out the proper way of keeping up the chimney, has he?\' said Alice sadly. \'Hand.','approved','2023-07-18 23:25:26','2023-07-18 23:25:26');
/*!40000 ALTER TABLE `re_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_tags`
--

DROP TABLE IF EXISTS `re_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_tags`
--

LOCK TABLES `re_tags` WRITE;
/*!40000 ALTER TABLE `re_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_tags_items`
--

DROP TABLE IF EXISTS `re_tags_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_tags_items` (
  `tag_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_tags_items`
--

LOCK TABLES `re_tags_items` WRITE;
/*!40000 ALTER TABLE `re_tags_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_tags_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,'Botble\\Blog\\Models\\Post',3,1,'is_featured','0','1','2019-11-18 02:59:46','2019-11-18 02:59:46'),(2,'Botble\\Blog\\Models\\Post',2,1,'is_featured','0','1','2019-11-18 03:00:10','2019-11-18 03:00:10'),(3,'Botble\\Blog\\Models\\Post',1,1,'is_featured','0','1','2019-11-18 03:00:20','2019-11-18 03:00:20'),(4,'Botble\\Blog\\Models\\Post',1,1,'description','BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group','BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group. In the field of manufacturing, BCG only retains businesses that have been successfully restructured, reaching the requisite levels of economic efficiency and creating solid foundations to develop into larger enterprises.','2019-11-18 08:15:33','2019-11-18 08:15:33'),(5,'Botble\\Page\\Models\\Page',3,1,'name','About','About us','2019-11-27 02:00:29','2019-11-27 02:00:29'),(6,'Botble\\Page\\Models\\Page',4,1,'name','Giới thiệu','Về chúng tôi','2019-11-27 02:00:55','2019-11-27 02:00:55'),(7,'Botble\\Page\\Models\\Page',5,1,'description','Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes, providing information or personal purposes.','Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes.','2019-11-27 02:35:37','2019-11-27 02:35:37'),(8,'Botble\\Page\\Models\\Page',7,1,'name','Flex Home','Homepage','2020-02-06 21:54:04','2020-02-06 21:54:04'),(9,'Botble\\Page\\Models\\Page',7,1,'template','default','homepage','2020-02-06 21:55:08','2020-02-06 21:55:08');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (2,1,'2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"api.settings\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"career.index\":true,\"career.create\":true,\"career.edit\":true,\"career.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.create\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"export-properties.index\":true,\"import-projects.index\":true,\"export-projects.index\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,1,1,'2023-07-18 23:25:25','2023-07-18 23:25:25');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (270,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"location\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"translation\"]',NULL,'2023-07-18 23:25:25'),(2933,'language_hide_default','1',NULL,'2023-07-18 23:25:25'),(2934,'language_switcher_display','list',NULL,'2023-07-18 23:25:25'),(2935,'language_display','all',NULL,'2023-07-18 23:25:25'),(2936,'language_hide_languages','[]',NULL,'2023-07-18 23:25:25'),(2977,'theme-flex-home-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/youtube.com\"}]]',NULL,'2023-07-18 23:25:25'),(3655,'admin_logo','logo/logo-white.png',NULL,'2023-07-18 23:25:25'),(3656,'admin_favicon','logo/favicon.png',NULL,'2023-07-18 23:25:25'),(3657,'theme-flex-home-site_title','Flex Home',NULL,NULL),(3658,'theme-flex-home-seo_description','Find your favorite homes at Flex Home',NULL,NULL),(3659,'theme-flex-home-copyright','©2023 Flex Home is Proudly Powered by Botble Team.',NULL,NULL),(3660,'theme-flex-home-favicon','logo/favicon.png',NULL,NULL),(3661,'theme-flex-home-logo','logo/logo.png',NULL,NULL),(3662,'theme-flex-home-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(3663,'theme-flex-home-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(3664,'theme-flex-home-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(3665,'theme-flex-home-homepage_id','1',NULL,NULL),(3666,'theme-flex-home-blog_page_id','2',NULL,NULL),(3667,'theme-flex-home-properties_list_page_id','7',NULL,NULL),(3668,'theme-flex-home-projects_list_page_id','8',NULL,NULL),(3669,'theme-flex-home-home_banner','general/home-banner.jpg',NULL,NULL),(3670,'theme-flex-home-breadcrumb_background','general/breadcrumb-background.jpg',NULL,NULL),(3671,'theme-flex-home-address','North Link Building, 10 Admiralty Street, 757695 Singapore',NULL,NULL),(3672,'theme-flex-home-hotline','18006268',NULL,NULL),(3673,'theme-flex-home-email','sale@botble.com',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3500 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'3-beds-villa-calpe-alicante',1,'Botble\\RealEstate\\Models\\Property','properties','2019-11-17 20:34:59','2019-11-17 20:34:59'),(2,'property-for-sale-johannesburg-south-africa',2,'Botble\\RealEstate\\Models\\Property','properties','2019-11-17 20:53:34','2019-11-17 20:53:34'),(3,'stunning-french-inspired-manor',3,'Botble\\RealEstate\\Models\\Property','properties','2019-11-17 21:09:55','2019-11-17 21:09:55'),(4,'42460-buccaneer-court',4,'Botble\\RealEstate\\Models\\Property','properties','2019-11-17 21:18:11','2019-11-17 21:18:11'),(5,'wifi',1,'Botble\\RealEstate\\Models\\PropertyFeature','','2019-11-17 21:40:58','2019-11-17 21:40:58'),(6,'swimming-pool',2,'Botble\\RealEstate\\Models\\PropertyFeature','','2019-11-17 21:41:43','2019-11-17 21:41:43'),(7,'walnut-park-apartment',1,'Botble\\RealEstate\\Models\\Project','projects','2019-11-18 00:34:49','2019-11-18 00:34:49'),(8,'walnut-park-apartment',5,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 00:47:52','2019-11-18 00:47:52'),(9,'el-camino-del-mar',6,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 01:05:58','2019-11-18 01:05:58'),(10,'family-victorian-view-home',7,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 01:12:07','2019-11-18 01:12:07'),(11,'osaka-heights',2,'Botble\\RealEstate\\Models\\Project','projects','2019-11-18 01:28:45','2019-11-18 01:28:45'),(12,'osaka-heights-apartment',8,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 01:49:36','2019-11-18 01:49:36'),(13,'private-estate-magnificent-views',9,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 02:02:19','2019-11-18 02:02:19'),(14,'harry-baskervilles-hay-loft',10,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 02:16:53','2019-11-18 02:16:53'),(15,'break-lease-available',11,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 02:22:48','2019-11-18 02:22:48'),(16,'category-news',1,'Botble\\Blog\\Models\\Category','news','2019-11-18 02:33:35','2023-07-18 23:25:25'),(17,'elegant-family-home-presents-premium-modern-living',12,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 02:47:05','2019-11-18 02:47:05'),(18,'bcg-sets-great-store-by-real-estate-negotiations',1,'Botble\\Blog\\Models\\Post','news','2019-11-18 02:51:35','2023-07-18 23:25:25'),(19,'bcg-sets-great-store',1,'Botble\\Blog\\Models\\Tag','tag','2019-11-18 02:51:35','2019-11-18 02:51:35'),(20,'private-home-sales-drop-27-in-october',2,'Botble\\Blog\\Models\\Post','news','2019-11-18 02:55:53','2023-07-18 23:25:25'),(21,'private-home-sales',2,'Botble\\Blog\\Models\\Tag','tag','2019-11-18 02:55:53','2019-11-18 02:55:53'),(22,'singapore-overtakes-hong-kong-in-terms-of-property-investment-prospects',3,'Botble\\Blog\\Models\\Post','news','2019-11-18 02:59:01','2023-07-18 23:25:25'),(23,'s-koreas-big-investors-flocking-to-overseas-real-estate',4,'Botble\\Blog\\Models\\Post','news','2019-11-18 03:07:27','2023-07-18 23:25:25'),(24,'south-korean-investors',3,'Botble\\Blog\\Models\\Tag','tag','2019-11-18 03:07:27','2019-11-18 03:07:27'),(25,'mimaroba-paradise',3,'Botble\\RealEstate\\Models\\Project','projects','2019-11-18 03:30:34','2019-11-18 03:30:34'),(26,'aegean-villas',4,'Botble\\RealEstate\\Models\\Project','projects','2019-11-18 03:38:13','2019-11-18 03:38:13'),(27,'aydos-forest-apartment',5,'Botble\\RealEstate\\Models\\Project','projects','2019-11-18 03:45:06','2019-11-18 03:45:06'),(28,'park',6,'Botble\\RealEstate\\Models\\Project','projects','2019-11-18 03:53:20','2019-11-18 03:53:20'),(29,'the-avila-apartment',13,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 07:23:02','2019-11-18 07:23:02'),(30,'villa-for-sale-in-lavanya-residences',14,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 07:36:29','2019-11-18 07:36:29'),(31,'want-to-lease-a-house-in-compound-pejaten-barat-kemang',15,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 07:44:44','2019-11-18 07:44:44'),(32,'apartment-muiderstraatweg-in-diemen',16,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 07:59:14','2019-11-18 07:59:14'),(33,'nice-apartment-for-rent-in-berlin',17,'Botble\\RealEstate\\Models\\Property','properties','2019-11-18 08:13:07','2019-11-18 08:13:07'),(52,'house-architecture',2,'Botble\\Blog\\Models\\Category','news','2019-11-21 07:49:25','2023-07-18 23:25:25'),(53,'kien-truc-nha',3,'Botble\\Blog\\Models\\Category','news','2019-11-21 07:49:35','2023-07-18 23:25:25'),(54,'house-design',4,'Botble\\Blog\\Models\\Category','news','2019-11-21 07:50:02','2023-07-18 23:25:25'),(55,'thiet-ke-nha',5,'Botble\\Blog\\Models\\Category','news','2019-11-21 07:50:17','2023-07-18 23:25:25'),(56,'building-materials',6,'Botble\\Blog\\Models\\Category','news','2019-11-21 07:50:36','2023-07-18 23:25:25'),(57,'vat-lieu-xay-dung',7,'Botble\\Blog\\Models\\Category','news','2019-11-21 07:50:58','2023-07-18 23:25:25'),(65,'tin-tuc-1',8,'Botble\\Blog\\Models\\Category','news','2019-11-22 01:26:08','2023-07-18 23:25:25'),(74,'sales-manager-real-estate',1,'Botble\\Career\\Models\\Career','careers','2019-11-30 19:43:10','2019-11-30 19:43:10'),(76,'senior-real-estate-consultant',3,'Botble\\Career\\Models\\Career','careers','2019-11-30 19:52:42','2019-11-30 19:52:42'),(3170,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-06 21:16:20','2023-07-06 21:16:20'),(3171,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-06 21:16:20','2023-07-06 21:16:20'),(3172,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-06 21:16:20','2023-07-06 21:16:20'),(3173,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-06 21:16:20','2023-07-06 21:16:20'),(3174,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-06 21:16:20','2023-07-06 21:16:20'),(3175,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-06 21:16:20','2023-07-06 21:16:20'),(3176,'home',1,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3177,'news',2,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3178,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3179,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3180,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3181,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3182,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3183,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-06 21:16:22','2023-07-06 21:16:22'),(3184,'the-top-2020-handbag-trends-to-know',1593,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3185,'top-search-engine-optimization-strategies',1594,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3186,'which-company-would-you-choose',1595,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3187,'used-car-dealer-sales-tricks-exposed',1596,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3188,'20-ways-to-sell-your-product-faster',1597,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3189,'the-secrets-of-rich-and-famous-writers',1598,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3190,'imagine-losing-20-pounds-in-14-days',1599,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3191,'are-you-still-using-that-slow-old-typewriter',1600,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3192,'a-skin-cream-thats-proven-to-work',1601,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3193,'10-reasons-to-start-your-own-profitable-website',1602,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3194,'simple-ways-to-reduce-your-unwanted-wrinkles',1603,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3195,'apple-imac-with-retina-5k-display-review',1604,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3196,'10000-web-site-visitors-in-one-monthguaranteed',1605,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3197,'unlock-the-secrets-of-selling-high-ticket-items',1606,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3198,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1607,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3199,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1608,'Botble\\Blog\\Models\\Post','news','2023-07-06 21:16:23','2023-07-18 23:25:25'),(3200,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 00:22:16','2023-07-10 00:22:16'),(3201,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 00:22:16','2023-07-10 00:22:16'),(3202,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 00:22:16','2023-07-10 00:22:16'),(3203,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 00:22:16','2023-07-10 00:22:16'),(3204,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 00:22:16','2023-07-10 00:22:16'),(3205,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 00:22:16','2023-07-10 00:22:16'),(3206,'home',1,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3207,'news',2,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3208,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3209,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3210,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3211,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3212,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3213,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-10 00:22:18','2023-07-10 00:22:18'),(3214,'the-top-2020-handbag-trends-to-know',1609,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3215,'top-search-engine-optimization-strategies',1610,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3216,'which-company-would-you-choose',1611,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3217,'used-car-dealer-sales-tricks-exposed',1612,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3218,'20-ways-to-sell-your-product-faster',1613,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3219,'the-secrets-of-rich-and-famous-writers',1614,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3220,'imagine-losing-20-pounds-in-14-days',1615,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3221,'are-you-still-using-that-slow-old-typewriter',1616,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3222,'a-skin-cream-thats-proven-to-work',1617,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3223,'10-reasons-to-start-your-own-profitable-website',1618,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3224,'simple-ways-to-reduce-your-unwanted-wrinkles',1619,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3225,'apple-imac-with-retina-5k-display-review',1620,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3226,'10000-web-site-visitors-in-one-monthguaranteed',1621,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3227,'unlock-the-secrets-of-selling-high-ticket-items',1622,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3228,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1623,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3229,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1624,'Botble\\Blog\\Models\\Post','news','2023-07-10 00:22:19','2023-07-18 23:25:25'),(3230,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 21:21:54','2023-07-10 21:21:54'),(3231,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 21:21:54','2023-07-10 21:21:54'),(3232,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 21:21:54','2023-07-10 21:21:54'),(3233,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 21:21:54','2023-07-10 21:21:54'),(3234,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 21:21:54','2023-07-10 21:21:54'),(3235,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-10 21:21:54','2023-07-10 21:21:54'),(3236,'home',1,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3237,'news',2,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3238,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3239,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3240,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3241,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3242,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3243,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-10 21:21:55','2023-07-10 21:21:55'),(3244,'the-top-2020-handbag-trends-to-know',1625,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3245,'top-search-engine-optimization-strategies',1626,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3246,'which-company-would-you-choose',1627,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3247,'used-car-dealer-sales-tricks-exposed',1628,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3248,'20-ways-to-sell-your-product-faster',1629,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3249,'the-secrets-of-rich-and-famous-writers',1630,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3250,'imagine-losing-20-pounds-in-14-days',1631,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:56','2023-07-18 23:25:25'),(3251,'are-you-still-using-that-slow-old-typewriter',1632,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3252,'a-skin-cream-thats-proven-to-work',1633,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3253,'10-reasons-to-start-your-own-profitable-website',1634,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3254,'simple-ways-to-reduce-your-unwanted-wrinkles',1635,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3255,'apple-imac-with-retina-5k-display-review',1636,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3256,'10000-web-site-visitors-in-one-monthguaranteed',1637,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3257,'unlock-the-secrets-of-selling-high-ticket-items',1638,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3258,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1639,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3259,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1640,'Botble\\Blog\\Models\\Post','news','2023-07-10 21:21:57','2023-07-18 23:25:25'),(3260,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-12 03:30:26','2023-07-12 03:30:26'),(3261,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-12 03:30:26','2023-07-12 03:30:26'),(3262,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-12 03:30:26','2023-07-12 03:30:26'),(3263,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-12 03:30:26','2023-07-12 03:30:26'),(3264,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-12 03:30:26','2023-07-12 03:30:26'),(3265,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-12 03:30:26','2023-07-12 03:30:26'),(3266,'home',1,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3267,'news',2,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3268,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3269,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3270,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3271,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3272,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3273,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-12 03:30:27','2023-07-12 03:30:27'),(3274,'the-top-2020-handbag-trends-to-know',1641,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3275,'top-search-engine-optimization-strategies',1642,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3276,'which-company-would-you-choose',1643,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3277,'used-car-dealer-sales-tricks-exposed',1644,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3278,'20-ways-to-sell-your-product-faster',1645,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3279,'the-secrets-of-rich-and-famous-writers',1646,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3280,'imagine-losing-20-pounds-in-14-days',1647,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3281,'are-you-still-using-that-slow-old-typewriter',1648,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3282,'a-skin-cream-thats-proven-to-work',1649,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3283,'10-reasons-to-start-your-own-profitable-website',1650,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3284,'simple-ways-to-reduce-your-unwanted-wrinkles',1651,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3285,'apple-imac-with-retina-5k-display-review',1652,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3286,'10000-web-site-visitors-in-one-monthguaranteed',1653,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3287,'unlock-the-secrets-of-selling-high-ticket-items',1654,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3288,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1655,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3289,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1656,'Botble\\Blog\\Models\\Post','news','2023-07-12 03:30:29','2023-07-18 23:25:25'),(3290,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 00:31:13','2023-07-13 00:31:13'),(3291,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 00:31:13','2023-07-13 00:31:13'),(3292,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 00:31:13','2023-07-13 00:31:13'),(3293,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 00:31:13','2023-07-13 00:31:13'),(3294,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 00:31:13','2023-07-13 00:31:13'),(3295,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 00:31:13','2023-07-13 00:31:13'),(3296,'home',1,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3297,'news',2,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3298,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3299,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3300,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3301,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3302,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3303,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-13 00:31:15','2023-07-13 00:31:15'),(3304,'the-top-2020-handbag-trends-to-know',1657,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3305,'top-search-engine-optimization-strategies',1658,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3306,'which-company-would-you-choose',1659,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3307,'used-car-dealer-sales-tricks-exposed',1660,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3308,'20-ways-to-sell-your-product-faster',1661,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3309,'the-secrets-of-rich-and-famous-writers',1662,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3310,'imagine-losing-20-pounds-in-14-days',1663,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3311,'are-you-still-using-that-slow-old-typewriter',1664,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3312,'a-skin-cream-thats-proven-to-work',1665,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3313,'10-reasons-to-start-your-own-profitable-website',1666,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3314,'simple-ways-to-reduce-your-unwanted-wrinkles',1667,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3315,'apple-imac-with-retina-5k-display-review',1668,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3316,'10000-web-site-visitors-in-one-monthguaranteed',1669,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3317,'unlock-the-secrets-of-selling-high-ticket-items',1670,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3318,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1671,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3319,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1672,'Botble\\Blog\\Models\\Post','news','2023-07-13 00:31:16','2023-07-18 23:25:25'),(3320,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 01:42:08','2023-07-13 01:42:08'),(3321,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 01:42:08','2023-07-13 01:42:08'),(3322,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 01:42:08','2023-07-13 01:42:08'),(3323,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 01:42:08','2023-07-13 01:42:08'),(3324,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 01:42:08','2023-07-13 01:42:08'),(3325,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 01:42:08','2023-07-13 01:42:08'),(3326,'home',1,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3327,'news',2,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3328,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3329,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3330,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3331,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3332,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3333,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-13 01:42:12','2023-07-13 01:42:12'),(3334,'the-top-2020-handbag-trends-to-know',1673,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:14','2023-07-18 23:25:25'),(3335,'top-search-engine-optimization-strategies',1674,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:14','2023-07-18 23:25:25'),(3336,'which-company-would-you-choose',1675,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:14','2023-07-18 23:25:25'),(3337,'used-car-dealer-sales-tricks-exposed',1676,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:14','2023-07-18 23:25:25'),(3338,'20-ways-to-sell-your-product-faster',1677,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:14','2023-07-18 23:25:25'),(3339,'the-secrets-of-rich-and-famous-writers',1678,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3340,'imagine-losing-20-pounds-in-14-days',1679,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3341,'are-you-still-using-that-slow-old-typewriter',1680,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3342,'a-skin-cream-thats-proven-to-work',1681,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3343,'10-reasons-to-start-your-own-profitable-website',1682,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3344,'simple-ways-to-reduce-your-unwanted-wrinkles',1683,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3345,'apple-imac-with-retina-5k-display-review',1684,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3346,'10000-web-site-visitors-in-one-monthguaranteed',1685,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3347,'unlock-the-secrets-of-selling-high-ticket-items',1686,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3348,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1687,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3349,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1688,'Botble\\Blog\\Models\\Post','news','2023-07-13 01:42:15','2023-07-18 23:25:25'),(3350,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 20:20:19','2023-07-13 20:20:19'),(3351,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 20:20:19','2023-07-13 20:20:19'),(3352,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 20:20:19','2023-07-13 20:20:19'),(3353,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 20:20:19','2023-07-13 20:20:19'),(3354,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 20:20:19','2023-07-13 20:20:19'),(3355,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-13 20:20:19','2023-07-13 20:20:19'),(3356,'home',1,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3357,'news',2,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3358,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3359,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3360,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3361,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3362,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3363,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-13 20:20:20','2023-07-13 20:20:20'),(3364,'the-top-2020-handbag-trends-to-know',1689,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3365,'top-search-engine-optimization-strategies',1690,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3366,'which-company-would-you-choose',1691,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3367,'used-car-dealer-sales-tricks-exposed',1692,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3368,'20-ways-to-sell-your-product-faster',1693,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3369,'the-secrets-of-rich-and-famous-writers',1694,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3370,'imagine-losing-20-pounds-in-14-days',1695,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3371,'are-you-still-using-that-slow-old-typewriter',1696,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3372,'a-skin-cream-thats-proven-to-work',1697,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3373,'10-reasons-to-start-your-own-profitable-website',1698,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3374,'simple-ways-to-reduce-your-unwanted-wrinkles',1699,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3375,'apple-imac-with-retina-5k-display-review',1700,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3376,'10000-web-site-visitors-in-one-monthguaranteed',1701,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3377,'unlock-the-secrets-of-selling-high-ticket-items',1702,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3378,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1703,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3379,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1704,'Botble\\Blog\\Models\\Post','news','2023-07-13 20:20:22','2023-07-18 23:25:25'),(3380,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 02:05:15','2023-07-14 02:05:15'),(3381,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 02:05:15','2023-07-14 02:05:15'),(3382,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 02:05:15','2023-07-14 02:05:15'),(3383,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 02:05:15','2023-07-14 02:05:15'),(3384,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 02:05:15','2023-07-14 02:05:15'),(3385,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 02:05:15','2023-07-14 02:05:15'),(3386,'home',1,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3387,'news',2,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3388,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3389,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3390,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3391,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3392,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3393,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-14 02:05:17','2023-07-14 02:05:17'),(3394,'the-top-2020-handbag-trends-to-know',1705,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3395,'top-search-engine-optimization-strategies',1706,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3396,'which-company-would-you-choose',1707,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3397,'used-car-dealer-sales-tricks-exposed',1708,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3398,'20-ways-to-sell-your-product-faster',1709,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3399,'the-secrets-of-rich-and-famous-writers',1710,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3400,'imagine-losing-20-pounds-in-14-days',1711,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3401,'are-you-still-using-that-slow-old-typewriter',1712,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3402,'a-skin-cream-thats-proven-to-work',1713,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3403,'10-reasons-to-start-your-own-profitable-website',1714,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3404,'simple-ways-to-reduce-your-unwanted-wrinkles',1715,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3405,'apple-imac-with-retina-5k-display-review',1716,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3406,'10000-web-site-visitors-in-one-monthguaranteed',1717,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3407,'unlock-the-secrets-of-selling-high-ticket-items',1718,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3408,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1719,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3409,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1720,'Botble\\Blog\\Models\\Post','news','2023-07-14 02:05:18','2023-07-18 23:25:25'),(3410,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 18:37:40','2023-07-14 18:37:40'),(3411,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 18:37:40','2023-07-14 18:37:40'),(3412,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 18:37:40','2023-07-14 18:37:40'),(3413,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 18:37:40','2023-07-14 18:37:40'),(3414,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 18:37:40','2023-07-14 18:37:40'),(3415,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 18:37:40','2023-07-14 18:37:40'),(3416,'home',1,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3417,'news',2,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3418,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3419,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3420,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3421,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3422,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3423,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-14 18:37:41','2023-07-14 18:37:41'),(3424,'the-top-2020-handbag-trends-to-know',1721,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:42','2023-07-18 23:25:25'),(3425,'top-search-engine-optimization-strategies',1722,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3426,'which-company-would-you-choose',1723,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3427,'used-car-dealer-sales-tricks-exposed',1724,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3428,'20-ways-to-sell-your-product-faster',1725,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3429,'the-secrets-of-rich-and-famous-writers',1726,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3430,'imagine-losing-20-pounds-in-14-days',1727,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3431,'are-you-still-using-that-slow-old-typewriter',1728,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3432,'a-skin-cream-thats-proven-to-work',1729,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3433,'10-reasons-to-start-your-own-profitable-website',1730,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3434,'simple-ways-to-reduce-your-unwanted-wrinkles',1731,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3435,'apple-imac-with-retina-5k-display-review',1732,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3436,'10000-web-site-visitors-in-one-monthguaranteed',1733,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3437,'unlock-the-secrets-of-selling-high-ticket-items',1734,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3438,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1735,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3439,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1736,'Botble\\Blog\\Models\\Post','news','2023-07-14 18:37:43','2023-07-18 23:25:25'),(3440,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 23:15:07','2023-07-14 23:15:07'),(3441,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 23:15:07','2023-07-14 23:15:07'),(3442,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 23:15:07','2023-07-14 23:15:07'),(3443,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 23:15:07','2023-07-14 23:15:07'),(3444,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 23:15:07','2023-07-14 23:15:07'),(3445,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-14 23:15:07','2023-07-14 23:15:07'),(3446,'home',1,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3447,'news',2,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3448,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3449,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3450,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3451,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3452,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3453,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-14 23:15:09','2023-07-14 23:15:09'),(3454,'the-top-2020-handbag-trends-to-know',1737,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3455,'top-search-engine-optimization-strategies',1738,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3456,'which-company-would-you-choose',1739,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3457,'used-car-dealer-sales-tricks-exposed',1740,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3458,'20-ways-to-sell-your-product-faster',1741,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3459,'the-secrets-of-rich-and-famous-writers',1742,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3460,'imagine-losing-20-pounds-in-14-days',1743,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3461,'are-you-still-using-that-slow-old-typewriter',1744,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3462,'a-skin-cream-thats-proven-to-work',1745,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3463,'10-reasons-to-start-your-own-profitable-website',1746,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3464,'simple-ways-to-reduce-your-unwanted-wrinkles',1747,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3465,'apple-imac-with-retina-5k-display-review',1748,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3466,'10000-web-site-visitors-in-one-monthguaranteed',1749,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3467,'unlock-the-secrets-of-selling-high-ticket-items',1750,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3468,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1751,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3469,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1752,'Botble\\Blog\\Models\\Post','news','2023-07-14 23:15:10','2023-07-18 23:25:25'),(3470,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3471,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3472,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3473,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3474,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3475,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2023-07-18 23:25:23','2023-07-18 23:25:23'),(3476,'home',1,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3477,'news',2,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3478,'about-us',3,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3479,'contact',4,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3480,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3481,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3482,'properties',7,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3483,'projects',8,'Botble\\Page\\Models\\Page','','2023-07-18 23:25:25','2023-07-18 23:25:25'),(3484,'the-top-2020-handbag-trends-to-know',1753,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3485,'top-search-engine-optimization-strategies',1754,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3486,'which-company-would-you-choose',1755,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3487,'used-car-dealer-sales-tricks-exposed',1756,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3488,'20-ways-to-sell-your-product-faster',1757,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3489,'the-secrets-of-rich-and-famous-writers',1758,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3490,'imagine-losing-20-pounds-in-14-days',1759,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3491,'are-you-still-using-that-slow-old-typewriter',1760,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3492,'a-skin-cream-thats-proven-to-work',1761,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3493,'10-reasons-to-start-your-own-profitable-website',1762,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3494,'simple-ways-to-reduce-your-unwanted-wrinkles',1763,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3495,'apple-imac-with-retina-5k-display-review',1764,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3496,'10000-web-site-visitors-in-one-monthguaranteed',1765,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3497,'unlock-the-secrets-of-selling-high-ticket-items',1766,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3498,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1767,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26'),(3499,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',1768,'Botble\\Blog\\Models\\Post','','2023-07-18 23:25:26','2023-07-18 23:25:26');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'California',1,0,0,'published','2019-11-18 08:17:57','2019-11-18 08:17:57',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` int NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'BCG sets great store',1,'Botble\\ACL\\Models\\User','','published','2019-11-18 02:51:35','2019-11-18 02:51:35'),(2,'Private Home Sales',1,'Botble\\ACL\\Models\\User','','published','2019-11-18 02:55:53','2019-11-18 02:55:53'),(3,'South Korean investors',1,'Botble\\ACL\\Models\\User','','published','2019-11-18 03:07:27','2019-11-18 03:07:27');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5826 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
INSERT INTO `user_meta` VALUES (1,'admin-locale','en',1,'2019-11-17 20:19:14','2019-11-30 19:25:04');
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@botble.com',NULL,'$2y$10$sBTGBhjJT3pH1MGZrVPszu8hCkLgO4YICRQAb9v6JmnJREl7xhIYy',NULL,'2023-07-18 23:25:25','2023-07-18 23:25:25',NULL,NULL,'Super','Admin','botble',NULL,1,1),(2,'user@botble.com',NULL,'$2y$10$XNaIBjD8dOWOtDQsC9Mb7O4hcgu/8q1xuQZlMMPRgzNmZNtIK3V1W',NULL,'2023-07-18 23:25:25','2023-07-18 23:25:25','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"api.settings\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"career.index\":true,\"career.create\":true,\"career.edit\":true,\"career.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.create\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"export-properties.index\":true,\"import-projects.index\":true,\"export-projects.index\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}',NULL,'Normal','Admin','admin',NULL,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (20,'CustomMenuWidget','footer_sidebar','flex-home',0,'{\"id\":\"CustomMenuWidget\",\"name\":\"About\",\"menu_id\":\"about\"}','2019-11-17 22:09:57','2019-11-17 22:09:57'),(21,'CustomMenuWidget','footer_sidebar','flex-home',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"More information\",\"menu_id\":\"more-information\"}','2019-11-17 22:09:57','2019-11-17 22:09:57'),(22,'CustomMenuWidget','footer_sidebar','flex-home',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"News\",\"menu_id\":\"news\"}','2019-11-17 22:09:57','2019-11-17 22:09:57'),(24,'CategoriesWidget','primary_sidebar','flex-home',0,'{\"id\":\"CategoriesWidget\",\"name\":\"Categories\"}','2019-11-18 03:50:44','2019-11-18 03:50:44'),(25,'RecentPostsWidget','primary_sidebar','flex-home',1,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":\"5\"}','2019-11-18 03:50:45','2019-11-18 03:50:45');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-19 13:25:36