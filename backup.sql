-- MySQL dump 10.13  Distrib 9.0.1, for macos14 (arm64)
--
-- Host: localhost    Database: FarmerMarket
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add farmer',7,'add_farmer'),(26,'Can change farmer',7,'change_farmer'),(27,'Can delete farmer',7,'delete_farmer'),(28,'Can view farmer',7,'view_farmer'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add buyer',14,'add_buyer'),(34,'Can change buyer',14,'change_buyer'),(35,'Can delete buyer',14,'delete_buyer'),(36,'Can view buyer',14,'view_buyer'),(37,'Can add buyer contact data',13,'add_buyercontactdata'),(38,'Can change buyer contact data',13,'change_buyercontactdata'),(39,'Can delete buyer contact data',13,'delete_buyercontactdata'),(40,'Can view buyer contact data',13,'view_buyercontactdata'),(41,'Can add contact data',9,'add_contactdata'),(42,'Can change contact data',9,'change_contactdata'),(43,'Can delete contact data',9,'delete_contactdata'),(44,'Can view contact data',9,'view_contactdata'),(45,'Can add delivery addresses',15,'add_deliveryaddresses'),(46,'Can change delivery addresses',15,'change_deliveryaddresses'),(47,'Can delete delivery addresses',15,'delete_deliveryaddresses'),(48,'Can view delivery addresses',15,'view_deliveryaddresses'),(49,'Can add farm',12,'add_farm'),(50,'Can change farm',12,'change_farm'),(51,'Can delete farm',12,'delete_farm'),(52,'Can view farm',12,'view_farm'),(53,'Can add farm contact data',16,'add_farmcontactdata'),(54,'Can change farm contact data',16,'change_farmcontactdata'),(55,'Can delete farm contact data',16,'delete_farmcontactdata'),(56,'Can view farm contact data',16,'view_farmcontactdata'),(57,'Can add ordering addresses',17,'add_orderingaddresses'),(58,'Can change ordering addresses',17,'change_orderingaddresses'),(59,'Can delete ordering addresses',17,'delete_orderingaddresses'),(60,'Can view ordering addresses',17,'view_orderingaddresses'),(61,'Can add orders',18,'add_orders'),(62,'Can change orders',18,'change_orders'),(63,'Can delete orders',18,'delete_orders'),(64,'Can view orders',18,'view_orders'),(65,'Can add payment',11,'add_payment'),(66,'Can change payment',11,'change_payment'),(67,'Can delete payment',11,'delete_payment'),(68,'Can view payment',11,'view_payment'),(69,'Can add product',10,'add_product'),(70,'Can change product',10,'change_product'),(71,'Can delete product',10,'delete_product'),(72,'Can view product',10,'view_product'),(73,'Can add delivery',19,'add_delivery'),(74,'Can change delivery',19,'change_delivery'),(75,'Can delete delivery',19,'delete_delivery'),(76,'Can view delivery',19,'view_delivery'),(77,'Can add includes',20,'add_includes'),(78,'Can change includes',20,'change_includes'),(79,'Can delete includes',20,'delete_includes'),(80,'Can view includes',20,'view_includes'),(81,'Can add sold to',21,'add_soldto'),(82,'Can change sold to',21,'change_soldto'),(83,'Can delete sold to',21,'delete_soldto'),(84,'Can view sold to',21,'view_soldto'),(85,'Can add admin',22,'add_admin'),(86,'Can change admin',22,'change_admin'),(87,'Can delete admin',22,'delete_admin'),(88,'Can view admin',22,'view_admin'),(89,'Can add category',23,'add_category'),(90,'Can change category',23,'change_category'),(91,'Can delete category',23,'delete_category'),(92,'Can view category',23,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$LHXpSF5L3VFmQhujeDHlap$cMTUfYn+eFHfODS7tF+LRNsXg//jUyYGrHn1HfKScv8=','2024-11-19 22:58:25.226683',1,'admin','','','',1,1,'2024-11-03 13:22:04.120009');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buyer`
--

DROP TABLE IF EXISTS `Buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buyer` (
  `BuyerID` int NOT NULL AUTO_INCREMENT,
  `BuyerName` varchar(100) NOT NULL,
  `Buyer_rating` decimal(2,1) DEFAULT NULL,
  `Total_orders` int DEFAULT NULL,
  `Prefferred_delivery_type` varchar(100) DEFAULT NULL,
  `ActivityStatus` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`BuyerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buyer`
--

LOCK TABLES `Buyer` WRITE;
/*!40000 ALTER TABLE `Buyer` DISABLE KEYS */;
INSERT INTO `Buyer` VALUES (1,'Emma Watson',4.5,5,'Home Delivery',1),(2,'James Miller',4.2,3,'Pickup',3),(3,'Olivia Johnson',4.9,6,'Home Delivery',1),(4,'Liam Garcia',4.0,2,'Pickup',1),(5,'Noah Martinez',3.8,4,'Home Delivery',1);
/*!40000 ALTER TABLE `Buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buyer_Contact_data`
--

DROP TABLE IF EXISTS `Buyer_Contact_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buyer_Contact_data` (
  `Contact_dataID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL,
  `Mobile_phone` varchar(15) DEFAULT NULL,
  `Telegram_ID` varchar(255) DEFAULT NULL,
  `BuyerID` int DEFAULT NULL,
  PRIMARY KEY (`Contact_dataID`),
  UNIQUE KEY `BuyerID` (`BuyerID`),
  CONSTRAINT `buyer_contact_data_ibfk_1` FOREIGN KEY (`BuyerID`) REFERENCES `Buyer` (`BuyerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buyer_Contact_data`
--

LOCK TABLES `Buyer_Contact_data` WRITE;
/*!40000 ALTER TABLE `Buyer_Contact_data` DISABLE KEYS */;
INSERT INTO `Buyer_Contact_data` VALUES (1,'emma.watson@gmail.com','789-123-4567','@emma_watson',1),(2,'james.miller@yahoo.com','654-789-1230','@james_miller',2),(3,'olivia.johnson@hotmail.com','321-987-6540','@olivia_johnson',3),(4,'liam.garcia@aol.com','987-654-1234','@liam_garcia',4),(5,'noah.martinez@gmail.com','567-890-1234','@noah_martinez',5);
/*!40000 ALTER TABLE `Buyer_Contact_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Vegetables',NULL),(2,'Fruits',NULL),(3,'Seeds',NULL),(4,'Others',NULL);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact_data`
--

DROP TABLE IF EXISTS `Contact_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact_data` (
  `FarmerID` int DEFAULT NULL,
  `Contact_dataID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL,
  `Mobile_phone` varchar(15) DEFAULT NULL,
  `Telegram_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Contact_dataID`),
  UNIQUE KEY `FarmerID` (`FarmerID`),
  CONSTRAINT `contact_data_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `Farmer` (`FarmerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact_data`
--

LOCK TABLES `Contact_data` WRITE;
/*!40000 ALTER TABLE `Contact_data` DISABLE KEYS */;
INSERT INTO `Contact_data` VALUES (1,1,'john.doe@gmail.com','123-456-7890','@john_doe'),(2,2,'alice.smith@yahoo.com','987-654-3210','@alice_smith'),(3,3,'mark.brown@hotmail.com','456-789-0123','@mark_brown'),(4,4,'sophie.white@aol.com','321-654-9870','@sophie_white'),(5,5,'henry.green@gmail.com','654-321-0987','@henry_green');
/*!40000 ALTER TABLE `Contact_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `OrderID` int NOT NULL,
  `Delivery_type` varchar(100) DEFAULT NULL,
  `Delivery_route` varchar(100) DEFAULT NULL,
  `Delivery_address` varchar(255) NOT NULL,
  `Delivery_duration` varchar(100) DEFAULT NULL,
  `Delivery_implementer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`Delivery_address`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,'Home Delivery','Route 1','123 Main St, California','1 hour','DHL'),(2,'Pickup','Route 2','Pickup Point 1','N/A','Customer'),(3,'Home Delivery','Route 3','456 Oak Ave, Texas','2 hours','FedEx'),(4,'Pickup','Route 4','Pickup Point 2','N/A','Customer'),(5,'Home Delivery','Route 5','789 Pine St, Colorado','1.5 hours','UPS'),(6,'Home Delivery','Route 1','321 Elm St, California','1 hour','DHL'),(7,'Pickup','Route 2','Pickup Point 3','N/A','Customer'),(8,'Home Delivery','Route 3','654 Cedar Ave, Texas','2 hours','FedEx'),(9,'Pickup','Route 4','Pickup Point 4','N/A','Customer'),(10,'Home Delivery','Route 5','123 Maple St, Colorado','1.5 hours','UPS'),(11,'Home Delivery','Route 1','789 Spruce St, California','2 hours','DHL'),(12,'Pickup','Route 2','Pickup Point 5','N/A','Customer'),(13,'Home Delivery','Route 3','456 Oak St, Texas','3 hours','FedEx'),(14,'Pickup','Route 4','Pickup Point 6','N/A','Customer'),(15,'Home Delivery','Route 5','654 Pine St, Colorado','2 hours','UPS'),(16,'Pickup','Route 2','Pickup Point 7','N/A','Customer'),(17,'Home Delivery','Route 1','123 Birch St, California','1 hour','DHL'),(18,'Pickup','Route 3','Pickup Point 8','N/A','Customer'),(19,'Home Delivery','Route 4','987 Maple St, Texas','2 hours','FedEx'),(20,'Home Delivery','Route 5','321 Oak St, Colorado','1.5 hours','UPS');
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery_Addresses`
--

DROP TABLE IF EXISTS `Delivery_Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery_Addresses` (
  `FarmerID` int DEFAULT NULL,
  `Ordering_Address` varchar(255) DEFAULT NULL,
  `Delivery_id` int DEFAULT NULL,
  KEY `FarmerID` (`FarmerID`),
  CONSTRAINT `delivery_addresses_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `Farmer` (`FarmerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery_Addresses`
--

LOCK TABLES `Delivery_Addresses` WRITE;
/*!40000 ALTER TABLE `Delivery_Addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Delivery_Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-03 17:15:28.628628','2','BuyerContactData object (2)',2,'[]',13,1),(2,'2024-11-03 18:45:35.799844','1','Farmer object (1)',2,'[{\"changed\": {\"fields\": [\"Farmer status\"]}}]',7,1),(3,'2024-11-03 18:45:39.999195','2','Farmer object (2)',2,'[{\"changed\": {\"fields\": [\"Farmer status\"]}}]',7,1),(4,'2024-11-03 18:45:43.090298','3','Farmer object (3)',2,'[{\"changed\": {\"fields\": [\"Farmer status\"]}}]',7,1),(5,'2024-11-03 18:45:46.303063','4','Farmer object (4)',2,'[{\"changed\": {\"fields\": [\"Farmer status\"]}}]',7,1),(6,'2024-11-03 18:45:49.912820','5','Farmer object (5)',2,'[{\"changed\": {\"fields\": [\"Farmer status\"]}}]',7,1),(7,'2024-11-03 19:01:06.909176','5','Farm object (5)',2,'[{\"changed\": {\"fields\": [\"Farm size\"]}}]',12,1),(8,'2024-11-03 19:01:11.295917','4','Farm object (4)',2,'[{\"changed\": {\"fields\": [\"Farm size\"]}}]',12,1),(9,'2024-11-03 19:01:15.037852','3','Farm object (3)',2,'[{\"changed\": {\"fields\": [\"Farm size\"]}}]',12,1),(10,'2024-11-03 19:01:21.313390','2','Farm object (2)',2,'[{\"changed\": {\"fields\": [\"Farm size\"]}}]',12,1),(11,'2024-11-03 19:01:25.755068','1','Farm object (1)',2,'[{\"changed\": {\"fields\": [\"Farm size\"]}}]',12,1),(12,'2024-11-03 19:47:46.409861','1','ContactData object (1)',2,'[{\"changed\": {\"fields\": [\"Farmer id\"]}}]',9,1),(13,'2024-11-03 19:47:50.711474','2','ContactData object (2)',2,'[{\"changed\": {\"fields\": [\"Farmer id\"]}}]',9,1),(14,'2024-11-03 19:47:56.215870','3','ContactData object (3)',2,'[{\"changed\": {\"fields\": [\"Farmer id\"]}}]',9,1),(15,'2024-11-03 19:47:59.993114','4','ContactData object (4)',2,'[{\"changed\": {\"fields\": [\"Farmer id\"]}}]',9,1),(16,'2024-11-03 19:48:04.374559','5','ContactData object (5)',2,'[{\"changed\": {\"fields\": [\"Farmer id\"]}}]',9,1),(17,'2024-11-03 19:52:21.519776','1','ContactData object (1)',2,'[]',9,1),(18,'2024-11-03 19:52:44.787836','5','BuyerContactData object (5)',2,'[{\"changed\": {\"fields\": [\"Buyer id\"]}}]',13,1),(19,'2024-11-03 19:52:48.812173','4','BuyerContactData object (4)',2,'[{\"changed\": {\"fields\": [\"Buyer id\"]}}]',13,1),(20,'2024-11-03 19:52:53.245952','3','BuyerContactData object (3)',2,'[{\"changed\": {\"fields\": [\"Buyer id\"]}}]',13,1),(21,'2024-11-03 19:52:56.803890','2','BuyerContactData object (2)',2,'[{\"changed\": {\"fields\": [\"Buyer id\"]}}]',13,1),(22,'2024-11-03 19:52:59.777922','1','BuyerContactData object (1)',2,'[{\"changed\": {\"fields\": [\"Buyer id\"]}}]',13,1),(23,'2024-11-04 12:27:34.985943','2','Buyer object (2)',2,'[{\"changed\": {\"fields\": [\"Activity status\"]}}]',14,1),(24,'2024-11-11 23:49:01.432112','1','Category object (1)',1,'[{\"added\": {}}]',23,1),(25,'2024-11-11 23:49:11.472532','2','Category object (2)',1,'[{\"added\": {}}]',23,1),(26,'2024-11-11 23:49:15.603543','3','Category object (3)',1,'[{\"added\": {}}]',23,1),(27,'2024-11-11 23:49:24.645490','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(28,'2024-11-11 23:49:36.498925','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(29,'2024-11-11 23:49:40.441461','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(30,'2024-11-11 23:49:45.149842','4','Product object (4)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(31,'2024-11-11 23:49:58.471443','4','Category object (4)',1,'[{\"added\": {}}]',23,1),(32,'2024-11-11 23:50:06.416400','5','Product object (5)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(33,'2024-11-11 23:50:10.092676','5','Product object (5)',2,'[]',10,1),(34,'2024-11-11 23:50:14.590286','6','Product object (6)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(35,'2024-11-11 23:50:18.614881','7','Product object (7)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(36,'2024-11-11 23:50:23.013582','8','Product object (8)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(37,'2024-11-11 23:50:28.348763','9','Product object (9)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1),(38,'2024-11-11 23:50:31.759250','10','Product object (10)',2,'[{\"changed\": {\"fields\": [\"Category id\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(22,'market','admin'),(14,'market','buyer'),(13,'market','buyercontactdata'),(23,'market','category'),(9,'market','contactdata'),(19,'market','delivery'),(15,'market','deliveryaddresses'),(12,'market','farm'),(16,'market','farmcontactdata'),(7,'market','farmer'),(20,'market','includes'),(17,'market','orderingaddresses'),(18,'market','orders'),(11,'market','payment'),(10,'market','product'),(21,'market','soldto'),(8,'market','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-30 23:05:28.802083'),(2,'auth','0001_initial','2024-10-30 23:05:28.912233'),(3,'admin','0001_initial','2024-10-30 23:05:28.936672'),(4,'admin','0002_logentry_remove_auto_add','2024-10-30 23:05:28.939677'),(5,'admin','0003_logentry_add_action_flag_choices','2024-10-30 23:05:28.941991'),(6,'contenttypes','0002_remove_content_type_name','2024-10-30 23:05:28.958652'),(7,'auth','0002_alter_permission_name_max_length','2024-10-30 23:05:28.970942'),(8,'auth','0003_alter_user_email_max_length','2024-10-30 23:05:28.980585'),(9,'auth','0004_alter_user_username_opts','2024-10-30 23:05:28.983066'),(10,'auth','0005_alter_user_last_login_null','2024-10-30 23:05:28.993244'),(11,'auth','0006_require_contenttypes_0002','2024-10-30 23:05:28.993713'),(12,'auth','0007_alter_validators_add_error_messages','2024-10-30 23:05:28.996322'),(13,'auth','0008_alter_user_username_max_length','2024-10-30 23:05:29.010857'),(14,'auth','0009_alter_user_last_name_max_length','2024-10-30 23:05:29.021158'),(15,'auth','0010_alter_group_name_max_length','2024-10-30 23:05:29.026548'),(16,'auth','0011_update_proxy_permissions','2024-10-30 23:05:29.029180'),(17,'auth','0012_alter_user_first_name_max_length','2024-10-30 23:05:29.041569'),(18,'market','0001_initial','2024-10-30 23:05:29.046820'),(19,'sessions','0001_initial','2024-10-30 23:05:29.052280'),(20,'market','0002_buyer_buyercontactdata_contactdata_deliveryaddresses_and_more','2024-11-03 14:24:24.903044'),(21,'market','0003_alter_farmer_table','2024-11-03 17:14:55.076381'),(22,'market','0004_admin_category','2024-11-11 22:53:10.541761');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3bsyngv6hm4gy8d6yd1gn1lqel3kjfpk','.eJxVjMsOwiAQRf-FtSEwTHm4dN9vIAODUjU0Ke3K-O_apAvd3nPOfYlI21rj1ssSJxZnocXpd0uUH6XtgO_UbrPMc1uXKcldkQftcpy5PC-H-3dQqddvTQRBKQDDrB2RtUNO4DP5wYeExinkKzIaowCRdLHoTDCAGsHqrIJ4fwDFrjZm:1t7aZ8:tj3g55yf7znrJRtSgKz6ZB8S16GTbpaVsf4lOv7q_V8','2024-11-17 13:22:50.059279'),('wj3sjtnz4ro8j2kwvc06tetljqchc11s','.eJxVjDsOwyAQBe9CHSFYzMcp0_sMCNglOIlAMnYV5e4RkoukfTPz3syHYy_-6LT5FdmVSXb53WJIT6oD4CPUe-Op1X1bIx8KP2nnS0N63U7376CEXkZNKs6JUtQCQaAGM4msTBQ5W7IoAJ0GGVWyOM3JZAID4DBoIUN2oNjnC_z6OCI:1tAdLc:sXIclhCienCeC_dnTU7b8dS2KZ2Db7NOxHZrcsjRRkI','2024-11-25 22:57:28.295956'),('y35cpfd8y3u13aznypb3y78fjhqeuzxb','.eJxVjDsOwyAQBe9CHSFYzMcp0_sMCNglOIlAMnYV5e4RkoukfTPz3syHYy_-6LT5FdmVSXb53WJIT6oD4CPUe-Op1X1bIx8KP2nnS0N63U7376CEXkZNKs6JUtQCQaAGM4msTBQ5W7IoAJ0GGVWyOM3JZAID4DBoIUN2oNjnC_z6OCI:1tDXAv:yZy22aEPaklBa-wN13pWQ2UDBPHLcaEQICDIQL0il20','2024-12-03 22:58:25.230759');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Farm`
--

DROP TABLE IF EXISTS `Farm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Farm` (
  `FarmID` int NOT NULL AUTO_INCREMENT,
  `FarmName` varchar(100) NOT NULL,
  `Product_types` varchar(255) DEFAULT NULL,
  `Working_Hours` varchar(255) DEFAULT NULL,
  `FarmerID` int DEFAULT NULL,
  `FarmAddress` varchar(255) DEFAULT NULL,
  `FarmSize` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`FarmID`),
  KEY `FarmerID` (`FarmerID`),
  CONSTRAINT `farm_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `Farmer` (`FarmerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Farm`
--

LOCK TABLES `Farm` WRITE;
/*!40000 ALTER TABLE `Farm` DISABLE KEYS */;
INSERT INTO `Farm` VALUES (1,'Green Valley Farm','Vegetables, Fruits','8 AM - 5 PM',1,'123 Farm Lane, California',98),(2,'Sunshine Farm','Fruits','6 AM - 3 PM',2,'456 Orchard Road, Texas',12),(3,'Meadow Dairy','Dairy','7 AM - 4 PM',3,'789 Milk Street, Colorado',10),(4,'Happy Meats Farm','Meat','9 AM - 6 PM',4,'321 Ranch Ave, Kansas',23),(5,'Golden Wheat Fields','Grains','6 AM - 2 PM',5,'654 Wheat Road, Iowa',24);
/*!40000 ALTER TABLE `Farm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Farm_Contact_data`
--

DROP TABLE IF EXISTS `Farm_Contact_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Farm_Contact_data` (
  `FarmID` int DEFAULT NULL,
  `Contact_dataID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL,
  `Mobile_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Contact_dataID`),
  UNIQUE KEY `FarmID` (`FarmID`),
  CONSTRAINT `farm_contact_data_ibfk_1` FOREIGN KEY (`FarmID`) REFERENCES `Farm` (`FarmID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Farm_Contact_data`
--

LOCK TABLES `Farm_Contact_data` WRITE;
/*!40000 ALTER TABLE `Farm_Contact_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `Farm_Contact_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Farmer`
--

DROP TABLE IF EXISTS `Farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Farmer` (
  `FarmerID` int NOT NULL AUTO_INCREMENT,
  `FarmerName` varchar(100) NOT NULL,
  `Niche` varchar(100) DEFAULT NULL,
  `Total_sold` int DEFAULT NULL,
  `Farmer_Rating` int DEFAULT NULL,
  `Contact_dataID` int DEFAULT NULL,
  `FarmerStatus` varchar(10) DEFAULT NULL,
  `ActivityStatus` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`FarmerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Farmer`
--

LOCK TABLES `Farmer` WRITE;
/*!40000 ALTER TABLE `Farmer` DISABLE KEYS */;
INSERT INTO `Farmer` VALUES (1,'John Doe','Vegetables',5000,4,1,'Pending',0),(2,'Alice Smith','Fruits',3200,5,2,'Pending',0),(3,'Mark Brown','Dairy',2200,4,3,'Pending',0),(4,'Sophie White','Meat',1800,4,4,'Pending',0),(5,'Henry Green','Grains',2500,5,5,'Pending',0);
/*!40000 ALTER TABLE `Farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Includes`
--

DROP TABLE IF EXISTS `Includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Includes` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `includes_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE,
  CONSTRAINT `includes_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Includes`
--

LOCK TABLES `Includes` WRITE;
/*!40000 ALTER TABLE `Includes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Includes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordering_Addresses`
--

DROP TABLE IF EXISTS `Ordering_Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordering_Addresses` (
  `FarmerID` int DEFAULT NULL,
  `Ordering_Address` varchar(255) DEFAULT NULL,
  `Order_id` int DEFAULT NULL,
  KEY `FarmerID` (`FarmerID`),
  CONSTRAINT `ordering_addresses_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `Farmer` (`FarmerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordering_Addresses`
--

LOCK TABLES `Ordering_Addresses` WRITE;
/*!40000 ALTER TABLE `Ordering_Addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ordering_Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `BuyerID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Discount_amount` int DEFAULT NULL,
  `Order_comments` varchar(255) DEFAULT NULL,
  `Total_price` decimal(10,2) DEFAULT NULL,
  `Order_timeStamp` timestamp NULL DEFAULT NULL,
  `Order_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `BuyerID` (`BuyerID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`BuyerID`) REFERENCES `Buyer` (`BuyerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,1,0,'Deliver quickly',20.00,'2024-01-01 05:30:00','Completed'),(2,1,2,1,'Handle with care',18.00,'2024-01-05 07:00:00','Completed'),(3,1,3,2,'Need fresh produce',25.00,'2024-01-10 09:15:00','Completed'),(4,1,4,0,'No rush',24.00,'2024-01-15 04:45:00','Pending'),(5,1,5,1,'Deliver soon',22.00,'2024-01-20 06:20:00','Completed'),(6,2,6,2,'Will pick up',18.00,'2024-02-01 08:00:00','Completed'),(7,2,7,0,'No rush',30.00,'2024-02-07 11:30:00','Completed'),(8,2,8,1,'Please pack well',35.00,'2024-02-14 10:15:00','Pending'),(9,3,9,0,'Fresh grains needed',10.00,'2024-03-01 04:00:00','Completed'),(10,3,10,0,'Quick delivery',12.00,'2024-03-05 12:45:00','Pending'),(11,3,1,1,'Fast delivery needed',20.00,'2024-03-10 07:30:00','Completed'),(12,3,2,1,'Need these fresh',15.00,'2024-03-15 03:15:00','Completed'),(13,3,3,2,'Please pack carefully',25.00,'2024-03-20 09:45:00','Completed'),(14,3,4,1,'Deliver fast',20.00,'2024-03-25 06:00:00','Completed'),(15,4,5,0,'Pickup soon',22.00,'2024-04-02 05:10:00','Completed'),(16,4,6,2,'Please pack well',24.00,'2024-04-07 09:20:00','Pending'),(17,5,7,1,'Need beef soon',30.00,'2024-05-01 08:30:00','Completed'),(18,5,8,0,'Fast delivery',35.00,'2024-05-07 11:00:00','Pending'),(19,5,9,1,'Grains for quick delivery',10.00,'2024-05-14 07:50:00','Completed'),(20,5,10,1,'Oats needed fast',12.00,'2024-05-21 06:15:00','Completed');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `Payment_type` varchar(100) DEFAULT NULL,
  `Payment_timestamp` timestamp NULL DEFAULT NULL,
  `Payment_amount` decimal(10,2) DEFAULT NULL,
  `Payment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `OrderID` (`OrderID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,'Credit Card','2024-01-01 06:00:00',20.00,'Completed'),(2,2,'Cash','2024-01-05 07:30:00',18.00,'Completed'),(3,3,'Credit Card','2024-01-10 09:45:00',25.00,'Completed'),(4,4,'PayPal','2024-01-15 05:00:00',24.00,'Pending'),(5,5,'Credit Card','2024-01-20 07:00:00',22.00,'Completed'),(6,6,'Credit Card','2024-02-01 08:30:00',18.00,'Completed'),(7,7,'Cash','2024-02-07 11:45:00',30.00,'Completed'),(8,8,'Credit Card','2024-02-14 10:30:00',35.00,'Pending'),(9,9,'PayPal','2024-03-01 04:30:00',10.00,'Completed'),(10,10,'Credit Card','2024-03-05 13:00:00',12.00,'Pending'),(11,11,'Credit Card','2024-03-10 07:45:00',20.00,'Completed'),(12,12,'Cash','2024-03-15 03:45:00',15.00,'Completed'),(13,13,'Credit Card','2024-03-20 10:00:00',25.00,'Completed'),(14,14,'PayPal','2024-03-25 06:15:00',20.00,'Pending'),(15,15,'Credit Card','2024-04-02 05:30:00',22.00,'Completed'),(16,16,'Credit Card','2024-04-07 09:45:00',24.00,'Pending'),(17,17,'Credit Card','2024-05-01 08:45:00',30.00,'Completed'),(18,18,'Cash','2024-05-07 11:30:00',35.00,'Pending'),(19,19,'PayPal','2024-05-14 08:00:00',10.00,'Completed'),(20,20,'Credit Card','2024-05-21 06:30:00',12.00,'Completed');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `Available_quantity` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Product_type` varchar(100) DEFAULT NULL,
  `Product_rating` decimal(2,1) DEFAULT NULL,
  `FarmID` int DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `photo` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FarmID` (`FarmID`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`) ON DELETE SET NULL,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`FarmID`) REFERENCES `Farm` (`FarmID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Tomatoes',1000,2,'Vegetables',4.5,1,NULL,1,'2024-11-12 04:00:39','',NULL,NULL),(2,'Carrots',800,1,'Vegetables',4.2,1,NULL,1,'2024-11-12 04:00:39','',NULL,NULL),(3,'Apples',900,3,'Fruits',4.8,2,NULL,2,'2024-11-12 04:00:39','',NULL,NULL),(4,'Bananas',700,2,'Fruits',4.3,2,NULL,2,'2024-11-12 04:00:39','',NULL,NULL),(5,'Milk',500,4,'Dairy',4.6,3,NULL,4,'2024-11-12 04:00:39','',NULL,NULL),(6,'Cheese',300,6,'Dairy',4.9,3,NULL,4,'2024-11-12 04:00:39','',NULL,NULL),(7,'Beef',200,10,'Meat',4.2,4,NULL,4,'2024-11-12 04:00:39','',NULL,NULL),(8,'Chicken',250,7,'Meat',4.4,4,NULL,4,'2024-11-12 04:00:39','',NULL,NULL),(9,'Wheat',1500,1,'Grains',4.7,5,NULL,3,'2024-11-12 04:00:39','',NULL,NULL),(10,'Oats',1200,2,'Grains',4.5,5,NULL,3,'2024-11-12 04:00:39','',NULL,NULL);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sold_to`
--

DROP TABLE IF EXISTS `Sold_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sold_to` (
  `ProductID` int NOT NULL,
  `BuyerID` int NOT NULL,
  PRIMARY KEY (`BuyerID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `sold_to_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE,
  CONSTRAINT `sold_to_ibfk_2` FOREIGN KEY (`BuyerID`) REFERENCES `Buyer` (`BuyerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sold_to`
--

LOCK TABLES `Sold_to` WRITE;
/*!40000 ALTER TABLE `Sold_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sold_to` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20  5:10:22
