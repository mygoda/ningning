-- MySQL dump 10.13  Distrib 5.7.10, for osx10.11 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add water',7,'add_water'),(20,'Can change water',7,'change_water'),(21,'Can delete water',7,'delete_water'),(22,'Can add pesticide',8,'add_pesticide'),(23,'Can change pesticide',8,'change_pesticide'),(24,'Can delete pesticide',8,'delete_pesticide'),(25,'Can add metal',9,'add_metal'),(26,'Can change metal',9,'change_metal'),(27,'Can delete metal',9,'delete_metal'),(28,'Can add code',10,'add_code'),(29,'Can change code',10,'change_code'),(30,'Can delete code',10,'delete_code'),(31,'Can add zone',11,'add_zone'),(32,'Can change zone',11,'change_zone'),(33,'Can delete zone',11,'delete_zone'),(34,'Can add 蔬菜',12,'add_goods'),(35,'Can change 蔬菜',12,'change_goods'),(36,'Can delete 蔬菜',12,'delete_goods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$tNenUOMJoXzh$nXXWTlvCwVTgp+SiJYFt90X4zU4REsASLuhS84W/lRg=','2017-03-12 02:19:48',1,'ningning','','','ningning@1.com',1,1,'2017-03-12 02:19:20');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_code`
--

DROP TABLE IF EXISTS `demo_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `status` varchar(16) DEFAULT NULL,
  `metal_id` int(11),
  `pesticide_id` int(11),
  `water_id` int(11),
  `goods_id` int(11),
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  KEY `demo_code_51297b59` (`metal_id`),
  KEY `demo_code_4869ef78` (`pesticide_id`),
  KEY `demo_code_e669f235` (`water_id`),
  KEY `demo_code_6753b66e` (`goods_id`),
  KEY `demo_code_06342dd7` (`zone_id`),
  CONSTRAINT `demo_code_goods_id_78ce3ce7fab1e3d9_fk_demo_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `demo_goods` (`id`),
  CONSTRAINT `demo_code_metal_id_517c223f255d430_fk_demo_metal_id` FOREIGN KEY (`metal_id`) REFERENCES `demo_metal` (`id`),
  CONSTRAINT `demo_code_pesticide_id_262b948652b10b11_fk_demo_pesticide_id` FOREIGN KEY (`pesticide_id`) REFERENCES `demo_pesticide` (`id`),
  CONSTRAINT `demo_code_water_id_523c057e5291afb4_fk_demo_water_id` FOREIGN KEY (`water_id`) REFERENCES `demo_water` (`id`),
  CONSTRAINT `demo_code_zone_id_34a48379a1bc4842_fk_demo_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `demo_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_code`
--

LOCK TABLES `demo_code` WRITE;
/*!40000 ALTER TABLE `demo_code` DISABLE KEYS */;
INSERT INTO `demo_code` VALUES (1,'100000000','',1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `demo_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_goods`
--

DROP TABLE IF EXISTS `demo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  KEY `demo_goods_06342dd7` (`zone_id`),
  CONSTRAINT `demo_goods_zone_id_4a0129448c45d448_fk_demo_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `demo_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_goods`
--

LOCK TABLES `demo_goods` WRITE;
/*!40000 ALTER TABLE `demo_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_metal`
--

DROP TABLE IF EXISTS `demo_metal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_metal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quality` varchar(16) NOT NULL,
  `value` double NOT NULL,
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  KEY `demo_metal_06342dd7` (`zone_id`),
  CONSTRAINT `demo_metal_zone_id_6da6af69ef72c529_fk_demo_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `demo_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_metal`
--

LOCK TABLES `demo_metal` WRITE;
/*!40000 ALTER TABLE `demo_metal` DISABLE KEYS */;
INSERT INTO `demo_metal` VALUES (1,'middle',30,NULL);
/*!40000 ALTER TABLE `demo_metal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_pesticide`
--

DROP TABLE IF EXISTS `demo_pesticide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_pesticide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quality` varchar(16) NOT NULL,
  `value` double NOT NULL,
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  KEY `demo_pesticide_06342dd7` (`zone_id`),
  CONSTRAINT `demo_pesticide_zone_id_1dc9c008f5d9e25e_fk_demo_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `demo_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_pesticide`
--

LOCK TABLES `demo_pesticide` WRITE;
/*!40000 ALTER TABLE `demo_pesticide` DISABLE KEYS */;
INSERT INTO `demo_pesticide` VALUES (1,'middle',20,NULL);
/*!40000 ALTER TABLE `demo_pesticide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_water`
--

DROP TABLE IF EXISTS `demo_water`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quality` varchar(16) NOT NULL,
  `value` double NOT NULL,
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  KEY `demo_water_06342dd7` (`zone_id`),
  CONSTRAINT `demo_water_zone_id_70d00bd086f57b03_fk_demo_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `demo_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_water`
--

LOCK TABLES `demo_water` WRITE;
/*!40000 ALTER TABLE `demo_water` DISABLE KEYS */;
INSERT INTO `demo_water` VALUES (1,'low',60,NULL);
/*!40000 ALTER TABLE `demo_water` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_zone`
--

DROP TABLE IF EXISTS `demo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `source` varchar(16) NOT NULL,
  `work` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_zone`
--

LOCK TABLES `demo_zone` WRITE;
/*!40000 ALTER TABLE `demo_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-03-12 02:38:10','1','middle-30.0',1,'',9,1),(2,'2017-03-12 02:38:24','1','middle-20.0',1,'',8,1),(3,'2017-03-12 02:38:35','1','low-60.0',1,'',7,1),(4,'2017-03-12 02:38:42','1','100000000',1,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'demo','code'),(12,'demo','goods'),(9,'demo','metal'),(8,'demo','pesticide'),(7,'demo','water'),(11,'demo','zone'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-03-12 02:18:57'),(2,'auth','0001_initial','2017-03-12 02:18:58'),(3,'admin','0001_initial','2017-03-12 02:18:59'),(4,'contenttypes','0002_remove_content_type_name','2017-03-12 02:18:59'),(5,'auth','0002_alter_permission_name_max_length','2017-03-12 02:18:59'),(6,'auth','0003_alter_user_email_max_length','2017-03-12 02:18:59'),(7,'auth','0004_alter_user_username_opts','2017-03-12 02:18:59'),(8,'auth','0005_alter_user_last_login_null','2017-03-12 02:18:59'),(9,'auth','0006_require_contenttypes_0002','2017-03-12 02:18:59'),(10,'demo','0001_initial','2017-03-12 02:19:00'),(11,'sessions','0001_initial','2017-03-12 02:19:00'),(12,'demo','0002_auto_20170319_0724','2017-03-19 07:24:37');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9bmm01oehf4ep7dzcxypoui0ewvzej56','YWM3OTJlODUzZTQ3OWM4NjRkYzhkN2JiZTdkMmVmNzU2NTYyZGY1Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjlhZGEyOTVlYTBhOWYzNGQ0YWY4NmQ3YTJjOTE2YjI0ZTI2YWJjNjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-26 02:19:48');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-19 15:25:07
