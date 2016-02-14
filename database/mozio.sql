-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mozio
-- ------------------------------------------------------
-- Server version	5.6.17

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'alumno'),(1,'asesor');
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
  KEY `auth_group__permission_id_2588899ad9ec62c3_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_7388d7dc6453ff6f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_2588899ad9ec62c3_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  CONSTRAINT `auth__content_type_id_62fcb9095f4eaaf6_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(28,'Can add niveles_dificultad',10,'add_niveles_dificultad'),(29,'Can change niveles_dificultad',10,'change_niveles_dificultad'),(30,'Can delete niveles_dificultad',10,'delete_niveles_dificultad'),(37,'Can add nivel_escolar',13,'add_nivel_escolar'),(38,'Can change nivel_escolar',13,'change_nivel_escolar'),(39,'Can delete nivel_escolar',13,'delete_nivel_escolar'),(40,'Can add materia',14,'add_materia'),(41,'Can change materia',14,'change_materia'),(42,'Can delete materia',14,'delete_materia'),(43,'Can add tema',15,'add_tema'),(44,'Can change tema',15,'change_tema'),(45,'Can delete tema',15,'delete_tema'),(46,'Can add topico',16,'add_topico'),(47,'Can change topico',16,'change_topico'),(48,'Can delete topico',16,'delete_topico'),(49,'Can add video',17,'add_video'),(50,'Can change video',17,'change_video'),(51,'Can delete video',17,'delete_video'),(52,'Can add pregunta',18,'add_pregunta'),(53,'Can change pregunta',18,'change_pregunta'),(54,'Can delete pregunta',18,'delete_pregunta'),(55,'Can add respuesta',19,'add_respuesta'),(56,'Can change respuesta',19,'change_respuesta'),(57,'Can delete respuesta',19,'delete_respuesta'),(58,'Can add clases',20,'add_clases'),(59,'Can change clases',20,'change_clases'),(60,'Can delete clases',20,'delete_clases');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$gPZE4wCPVxao$VIQ3N24Hr2Kip239GzC3Po8q0Bna/QVAHcYjSb0uJVg=','2016-02-14 06:36:12.488000',1,'rmendez1972','Rafael','Méndez Asencio','rmendez1972@hotmail.com',1,1,'2015-04-06 21:09:27.000000'),(2,'pbkdf2_sha256$24000$poufxNaHejou$ppm8VEll11uZALmubvAOsFj6TZ8Tdnh0cH5d/0XQZsI=','2015-04-21 16:53:32.937986',0,'veronica','Veronica','Torrres','aurea2014@hotmail.com',0,1,'2015-04-16 17:34:08.000000');
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
  KEY `auth_user_groups_group_id_3c99daea86985a9d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_3c99daea86985a9d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_5c8c8558d4260d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,1,1),(4,2,2);
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
  KEY `auth_user_u_permission_id_5be1a9e5dbb55d1e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissio_user_id_52b2d17f4b33941_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_5be1a9e5dbb55d1e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_6ef9594e65de793b_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1a8192f24a9405c6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1a8192f24a9405c6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_6ef9594e65de793b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-04-06 21:24:33.220095','1','asesor',1,'',3,1),(2,'2015-04-06 21:26:03.554262','1','asesor',2,'Changed permissions.',3,1),(3,'2015-04-06 21:29:29.565045','1','rmendez1972',2,'Changed first_name, last_name and groups.',4,1),(4,'2015-04-06 21:42:21.862218','2','alumno',1,'',3,1),(5,'2015-04-06 21:46:32.215537','1','Bajo',1,'',10,1),(6,'2015-04-07 17:33:59.181503','1','Secundaria',1,'',13,1),(7,'2015-04-07 17:34:13.309311','2','Bachillerato',1,'',13,1),(8,'2015-04-07 17:34:47.501266','1','Matemáticas I',1,'',14,1),(9,'2015-04-07 17:35:25.166421','2','Algebra',1,'',14,1),(10,'2015-04-07 17:38:27.715862','3','Matemáticas II',1,'',14,1),(11,'2015-04-07 23:54:23.806389','1','Polinomios',1,'',15,1),(12,'2015-04-07 23:55:46.607734','1','Identificar el Concepto de Polinomio',1,'',16,1),(13,'2015-04-07 23:58:08.015677','4','Geometría Analítica',1,'',14,1),(14,'2015-04-07 23:58:22.432312','5','Trigonometría',1,'',14,1),(15,'2015-04-07 23:58:48.254522','6','Cálculo Integral y Diferencial',1,'',14,1),(16,'2015-04-08 02:41:30.322810','2','Monomios',1,'',15,1),(17,'2015-04-08 16:48:19.586900','1','rmendez1972',2,'Changed is_active.',4,1),(18,'2015-04-16 17:34:09.041377','2','veronica',1,'',4,1),(19,'2015-04-16 17:35:08.446971','2','veronica',2,'Changed first_name, last_name, email and groups.',4,1),(20,'2015-04-18 15:01:55.868555','1','rmendez1972',2,'No fields changed.',4,1),(21,'2015-04-18 15:07:48.778902','1','rmendez1972',2,'Changed groups.',4,1),(22,'2015-04-20 14:50:48.723237','2','veronica',2,'Changed groups.',4,1),(23,'2015-04-25 19:48:11.768148','3','Resta de Polinomios',2,'Changed duracion_aprox.',17,1),(24,'2015-04-25 19:54:22.512894','3','Resta de Polinomios',2,'Changed url.',17,1),(25,'2015-04-25 19:54:35.123147','2','Suma de Polinomios',2,'No fields changed.',17,1);
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
  UNIQUE KEY `django_content_type_app_label_14e16e8882f529fa_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'abaco','materia'),(10,'abaco','niveles_dificultad'),(13,'abaco','nivel_escolar'),(18,'abaco','pregunta'),(19,'abaco','respuesta'),(15,'abaco','tema'),(16,'abaco','topico'),(17,'abaco','video'),(20,'abaco_videos','clases'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'abaco','0001_initial','2015-04-06 20:19:45.911754'),(2,'contenttypes','0001_initial','2015-04-06 20:19:48.557905'),(3,'auth','0001_initial','2015-04-06 20:20:47.047250'),(4,'admin','0001_initial','2015-04-06 20:21:00.101997'),(5,'auth','0002_alter_permission_name_max_length','2015-04-06 20:21:07.659429'),(6,'auth','0003_alter_user_email_max_length','2015-04-06 20:21:11.087626'),(7,'auth','0004_alter_user_username_opts','2015-04-06 20:21:11.395643'),(8,'auth','0005_alter_user_last_login_null','2015-04-06 20:21:15.959904'),(9,'contenttypes','0002_remove_content_type_name','2015-04-06 20:21:25.300438'),(10,'sessions','0001_initial','2015-04-06 20:21:30.282723'),(11,'abaco','0002_preguntas','2015-04-06 21:38:50.709141'),(12,'abaco','0003_auto_20150407_1331','2015-04-07 17:32:04.840963'),(13,'abaco','0002_respuesta','2015-04-14 19:14:49.523491'),(14,'abaco','0003_pregunta_user','2015-04-16 16:18:25.576922'),(15,'abaco','0004_pregunta_fecha','2015-04-16 18:53:09.508809'),(16,'abaco','0005_respuesta_user','2015-04-18 15:42:58.696618'),(17,'abaco','0006_respuesta_fecha','2015-04-20 15:24:20.003899');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('04amzols4ea5l69ts7gsh4c96guloo05','NDI5MDcwYmUxOGZkZWJkMzVjZmU0MmZiNjUyZjdjZmQwY2RmMTg3Mzp7InVzdWFyaW9faWQiOjEsIm5vbWJyZV91c3VhcmlvIjoiUmFmYWVsIE1cdTAwZTluZGV6IEFzZW5jaW8iLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciIsIl9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-06-02 22:54:09.937768'),('1r40e9vh7ieyn0zzkwc4lgb7mjudw3qh','ZGM1MjU5NzA5YmExNzNkYWY1M2YzODc2NzA1MzNlYTJiZmQ5MjNkZDp7InVzdWFyaW9faWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwibWVzc2FnZSI6IkJpZW52ZW5pZG8gdXN1YXJpbyBybWVuZGV6MTk3MiwgaGF6IGluaWNpYWRvIHNlc2lcdTAwZjNuIGNvcnJlY3RhbWVudGUiLCJfYXV0aF91c2VyX2hhc2giOiJiNTJiNmZlODhmZDA1MTllNTVmNDUwZTk2YjQ1NTMzZjUxYWNlOWE2Iiwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyIsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-05-02 15:08:03.834263'),('5050na3aznpjj6kg6hl54bfh7bzs3grs','YjVkYzA2M2RkYWE5MDQ5MDNiMGM0ZDU1ZWY3MjcxNTdmNmU3ODZkOTp7InVzdWFyaW9faWQiOjEsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciIsIl9hdXRoX3VzZXJfaWQiOjEsIm1lc3NhZ2UiOiJCaWVudmVuaWRvIHVzdWFyaW8gcm1lbmRlejE5NzIsIGhheiBpbmljaWFkbyBzZXNpXHUwMGYzbiBjb3JyZWN0YW1lbnRlIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNTJiNmZlODhmZDA1MTllNTVmNDUwZTk2YjQ1NTMzZjUxYWNlOWE2Iiwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyJ9','2015-05-05 15:52:48.564463'),('6go5z7bdahciqdiy6zsekvzchr0vf5lb','MzU4NzVkMzJjMWYyYmU1M2JlMzgxMjAzOWI5NDU5MzdlNThkM2EzNjp7InVzdWFyaW9faWQiOjEsIm1lc3NhZ2UiOiJCaWVudmVuaWRvIHVzdWFyaW8gcm1lbmRlejE5NzIsIGhheiBpbmljaWFkbyBzZXNpXHUwMGYzbiBjb3JyZWN0YW1lbnRlIiwibm9tYnJlX2dydXBvIjoiYXNlc29yIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2hhc2giOiJiNTJiNmZlODhmZDA1MTllNTVmNDUwZTk2YjQ1NTMzZjUxYWNlOWE2Iiwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyJ9','2015-05-06 20:51:01.487442'),('6sptn7y45vhj68h526t6sq4zr8mb0vs2','Yzk2MDk3NDM5YWI0NjNkOWFmODI2NTgzMzlhYzg1MmFhZDhiZWIwMzp7Im5vbWJyZV91c3VhcmlvIjoiUmFmYWVsIE1cdTAwZTluZGV6IEFzZW5jaW8iLCJ1c3VhcmlvX2lkIjoxLCJfYXV0aF91c2VyX2lkIjoxLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciIsIl9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2015-08-31 15:50:57.022954'),('chyylqaeac8s5b1i8hbsmxjke72qfqjv','NTMxMzZmYzMwZTA5MTU5ODkxNTNmN2M5OWEzYTRjM2NlZmJhMzhkODp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjUyYjZmZTg4ZmQwNTE5ZTU1ZjQ1MGU5NmI0NTUzM2Y1MWFjZTlhNiJ9','2015-04-21 20:31:56.363712'),('ffmn282v5a0a5phtv239rbkfuo7at5p0','NjkyNjA3ZmQyYTMyY2FlMGYzNDAzOTdhZDE2MTdjNWRhYTc4Yjc5ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwibWVzc2FnZSI6IkJpZW52ZW5pZG8gdXN1YXJpbyBybWVuZGV6MTk3MiwgaGF6IGluaWNpYWRvIHNlc2lcdTAwZjNuIGNvcnJlY3RhbWVudGUiLCJub21icmVfdXN1YXJpbyI6IlJhZmFlbCBNXHUwMGU5bmRleiBBc2VuY2lvIiwiX2F1dGhfdXNlcl9pZCI6MSwidXN1YXJpb19pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiYjUyYjZmZTg4ZmQwNTE5ZTU1ZjQ1MGU5NmI0NTUzM2Y1MWFjZTlhNiIsIm5vbWJyZV9ncnVwbyI6ImFsdW1ubyJ9','2015-05-03 13:51:12.890640'),('h63d099w1rwftz910recy4wnp2a1n1wh','NGI4YjRiNjM1MjJhOGNmOTAxNmIxZjM4YTIxZmQwMmEzNzE0MWViNTp7InVzdWFyaW9faWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsIm5vbWJyZV91c3VhcmlvIjoiUmFmYWVsIE1cdTAwZTluZGV6IEFzZW5jaW8iLCJub21icmVfZ3J1cG8iOiJhc2Vzb3IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-05-14 14:03:21.836589'),('jjtz38rlbmptwzzw4s5a2sfu05sxjljb','NmY0MTU0ZTJiNzczMmJlZGMzNWY0NTRjNmZjN2Q1M2I1ODkzYWQ0Njp7Im5vbWJyZV91c3VhcmlvIjoiUmFmYWVsIE1cdTAwZTluZGV6IEFzZW5jaW8iLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciIsIl9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEsInVzdWFyaW9faWQiOjF9','2016-02-27 18:55:51.256675'),('joe5qolv3ndcaknum6tj0nvmddoul8wd','YjRjYjZhNjY3YTVhYmNlN2YyMTI4ZGI4OWQxNWY2YzIyYjdmYzVjNDp7InVzdWFyaW9faWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyIsIl9hdXRoX3VzZXJfaWQiOjEsIm1lc3NhZ2UiOiJCaWVudmVuaWRvIHVzdWFyaW8gcm1lbmRlejE5NzIsIGhheiBpbmljaWFkbyBzZXNpXHUwMGYzbiBjb3JyZWN0YW1lbnRlIiwibm9tYnJlX2dydXBvIjoiYXNlc29yIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjUyYjZmZTg4ZmQwNTE5ZTU1ZjQ1MGU5NmI0NTUzM2Y1MWFjZTlhNiJ9','2015-05-26 15:03:21.950839'),('lnkd9jimdw29f54v1olccnos9m4mt1zk','OGI0YmY5OTNjMDc3M2M2ZmRkYjllYzRlMzZlOTRiZjlkNGNiMzhkNjp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyIsInVzdWFyaW9faWQiOjEsIm1lc3NhZ2UiOiJCaWVudmVuaWRvIHVzdWFyaW8gcm1lbmRlejE5NzIsIGhheiBpbmljaWFkbyBzZXNpXHUwMGYzbiBjb3JyZWN0YW1lbnRlIiwibm9tYnJlX2dydXBvIjoiYXNlc29yIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjUyYjZmZTg4ZmQwNTE5ZTU1ZjQ1MGU5NmI0NTUzM2Y1MWFjZTlhNiJ9','2015-05-14 19:13:41.623379'),('me9ykpxbiqs6gkjiahdseho1z22kt6yw','NWE2MzBkMGUxM2E5ZmVlZjc1MzgzNGIxM2NkNTIzNjMwNWM4YzU5ODp7InVzdWFyaW9faWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJub21icmVfZ3J1cG8iOiJhc2Vzb3IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm5vbWJyZV91c3VhcmlvIjoiUmFmYWVsIE1cdTAwZTluZGV6IEFzZW5jaW8iLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsIl9hdXRoX3VzZXJfaWQiOjF9','2016-02-28 06:36:12.792197'),('o1ts6lcrmmgbsgdd0kjmsuaugnkpt3jl','ZjU0M2JlZmYxMzhlODkyMTg5ZGY3MDg3NWQzOTIxMjY0NTU5MzYyZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsInVzdWFyaW9faWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyIsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciJ9','2015-06-24 17:08:23.455774'),('u2du94lwygtp5yrrmuadst3q48dfzw12','ZmZlM2VjMGRmYWI4ZmJlNDc2MjU5MGE5ZTcyY2E2NDk0NzEwY2I0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJub21icmVfdXN1YXJpbyI6IlJhZmFlbCBNXHUwMGU5bmRleiBBc2VuY2lvIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJub21icmVfZ3J1cG8iOiJhc2Vzb3IiLCJ1c3VhcmlvX2lkIjoxLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsIl9hdXRoX3VzZXJfaWQiOjF9','2016-02-27 17:51:36.502843'),('u8dhspyvt615ho59hrc9a9m1j1ggi4fv','YzJhMGE3MzhlY2IzMjBjMDRmZTg0YjA5NjgyYWQ0NGQ2M2M5MGFkZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1MmI2ZmU4OGZkMDUxOWU1NWY0NTBlOTZiNDU1MzNmNTFhY2U5YTYiLCJub21icmVfdXN1YXJpbyI6IlJhZmFlbCBNXHUwMGU5bmRleiBBc2VuY2lvIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJub21icmVfZ3J1cG8iOiJhc2Vzb3IiLCJtZXNzYWdlIjoiQmllbnZlbmlkbyB1c3VhcmlvIHJtZW5kZXoxOTcyLCBoYXogaW5pY2lhZG8gc2VzaVx1MDBmM24gY29ycmVjdGFtZW50ZSIsInVzdWFyaW9faWQiOjEsIl9hdXRoX3VzZXJfaWQiOjF9','2015-05-11 20:38:46.579328'),('wv2fwhydwj3n268xa4s262uwnzxa98p5','YjVkYzA2M2RkYWE5MDQ5MDNiMGM0ZDU1ZWY3MjcxNTdmNmU3ODZkOTp7InVzdWFyaW9faWQiOjEsIm5vbWJyZV9ncnVwbyI6ImFzZXNvciIsIl9hdXRoX3VzZXJfaWQiOjEsIm1lc3NhZ2UiOiJCaWVudmVuaWRvIHVzdWFyaW8gcm1lbmRlejE5NzIsIGhheiBpbmljaWFkbyBzZXNpXHUwMGYzbiBjb3JyZWN0YW1lbnRlIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNTJiNmZlODhmZDA1MTllNTVmNDUwZTk2YjQ1NTMzZjUxYWNlOWE2Iiwibm9tYnJlX3VzdWFyaW8iOiJSYWZhZWwgTVx1MDBlOW5kZXogQXNlbmNpbyJ9','2015-05-05 14:15:06.603521');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_materia`
--

DROP TABLE IF EXISTS `mozioproject_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nivel_escolar_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abaco_materia_b2b48711` (`nivel_escolar_id`),
  CONSTRAINT `abac_nivel_escolar_id_72f323d5ba422530_fk_abaco_nivel_escolar_id` FOREIGN KEY (`nivel_escolar_id`) REFERENCES `mozioproject_nivel_escolar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_materia`
--

LOCK TABLES `mozioproject_materia` WRITE;
/*!40000 ALTER TABLE `mozioproject_materia` DISABLE KEYS */;
INSERT INTO `mozioproject_materia` VALUES (1,'Matemáticas I',1),(2,'Algebra',2),(3,'Matemáticas II',1),(4,'Geometría Analítica',2),(5,'Trigonometría',2),(6,'Cálculo Integral y Diferencial',2);
/*!40000 ALTER TABLE `mozioproject_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_nivel_escolar`
--

DROP TABLE IF EXISTS `mozioproject_nivel_escolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_nivel_escolar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_nivel_escolar`
--

LOCK TABLES `mozioproject_nivel_escolar` WRITE;
/*!40000 ALTER TABLE `mozioproject_nivel_escolar` DISABLE KEYS */;
INSERT INTO `mozioproject_nivel_escolar` VALUES (1,'Secundaria'),(2,'Bachillerato');
/*!40000 ALTER TABLE `mozioproject_nivel_escolar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_niveles_dificultad`
--

DROP TABLE IF EXISTS `mozioproject_niveles_dificultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_niveles_dificultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_niveles_dificultad`
--

LOCK TABLES `mozioproject_niveles_dificultad` WRITE;
/*!40000 ALTER TABLE `mozioproject_niveles_dificultad` DISABLE KEYS */;
INSERT INTO `mozioproject_niveles_dificultad` VALUES (1,'Bajo','imagen.png'),(2,'Medio','imagen.png'),(3,'Alto','imagen.png');
/*!40000 ALTER TABLE `mozioproject_niveles_dificultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_pregunta`
--

DROP TABLE IF EXISTS `mozioproject_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `email` varchar(300) DEFAULT NULL,
  `phone` varchar(300) DEFAULT NULL,
  `language` varchar(300) DEFAULT NULL,
  `currency` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abaco_pregunta_e8701ad4` (`user_id`),
  CONSTRAINT `abaco_pregunta_user_id_10e1de4fcb0477cf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_pregunta`
--

LOCK TABLES `mozioproject_pregunta` WRITE;
/*!40000 ALTER TABLE `mozioproject_pregunta` DISABLE KEYS */;
INSERT INTO `mozioproject_pregunta` VALUES (105,'rafa mendez',1,'2016-02-13','rmendez1972@hotmail.com','83','spanish','peso'),(106,'Veronica Torres',1,'2016-02-13','rasencio@gmail.com','879','fkjfkjfj','lkjjrj'),(107,'juan',1,'2016-02-13','x@gmail.com','89','flkfk','lfklkf'),(108,'veronica torres alonso',1,'2016-02-14','x@gmail.com','9874747','spanish','peso mexicano');
/*!40000 ALTER TABLE `mozioproject_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_respuesta`
--

DROP TABLE IF EXISTS `mozioproject_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pregunta_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abaco_respuest_pregunta_id_3aa57ca03c39ff19_fk_abaco_pregunta_id` (`pregunta_id`),
  KEY `abaco_respuesta_e8701ad4` (`user_id`),
  CONSTRAINT `abaco_respuesta_user_id_28fa8c0a695a2b7d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `abaco_respuest_pregunta_id_3aa57ca03c39ff19_fk_abaco_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `mozioproject_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_respuesta`
--

LOCK TABLES `mozioproject_respuesta` WRITE;
/*!40000 ALTER TABLE `mozioproject_respuesta` DISABLE KEYS */;
INSERT INTO `mozioproject_respuesta` VALUES (31,'polygon 1 de vero',106,1,'2016-02-13','1','2','3'),(32,'post 1 de rafa',105,1,'2016-02-13',NULL,NULL,NULL),(33,'post 2 de rafa',105,1,'2016-02-13',NULL,NULL,NULL),(35,'polygono 1 de juanito hernández',107,1,'2016-02-14','1','5','10.45'),(36,'polygono 2 de juanito',107,1,'2016-02-14','4','6','89.90'),(38,'ruta maya',108,1,'2016-02-14','78.90','85959','985775');
/*!40000 ALTER TABLE `mozioproject_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_tema`
--

DROP TABLE IF EXISTS `mozioproject_tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `materia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abaco_tema_materia_id_12f73944802279e2_fk_abaco_materia_id` (`materia_id`),
  CONSTRAINT `abaco_tema_materia_id_12f73944802279e2_fk_abaco_materia_id` FOREIGN KEY (`materia_id`) REFERENCES `mozioproject_materia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_tema`
--

LOCK TABLES `mozioproject_tema` WRITE;
/*!40000 ALTER TABLE `mozioproject_tema` DISABLE KEYS */;
INSERT INTO `mozioproject_tema` VALUES (1,'Polinomios','algebra.png',2),(2,'Monomios','monomio.png',2);
/*!40000 ALTER TABLE `mozioproject_tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_topico`
--

DROP TABLE IF EXISTS `mozioproject_topico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_topico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `tema_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abaco_topicos_tema_id_50b4024f3cc271a4_fk_abaco_tema_id` (`tema_id`),
  CONSTRAINT `abaco_topicos_tema_id_50b4024f3cc271a4_fk_abaco_tema_id` FOREIGN KEY (`tema_id`) REFERENCES `mozioproject_tema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_topico`
--

LOCK TABLES `mozioproject_topico` WRITE;
/*!40000 ALTER TABLE `mozioproject_topico` DISABLE KEYS */;
INSERT INTO `mozioproject_topico` VALUES (1,'Identificar el Concepto de Polinomio','concepto.png',1);
/*!40000 ALTER TABLE `mozioproject_topico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozioproject_video`
--

DROP TABLE IF EXISTS `mozioproject_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozioproject_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_corta` varchar(255) NOT NULL,
  `descripcion_larga` longtext NOT NULL,
  `url` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `duracion_aprox` time(6) NOT NULL,
  `nivel_dificultad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `d682445db055c579cca6bcf631fb49fb` (`nivel_dificultad_id`),
  CONSTRAINT `d682445db055c579cca6bcf631fb49fb` FOREIGN KEY (`nivel_dificultad_id`) REFERENCES `mozioproject_niveles_dificultad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozioproject_video`
--

LOCK TABLES `mozioproject_video` WRITE;
/*!40000 ALTER TABLE `mozioproject_video` DISABLE KEYS */;
INSERT INTO `mozioproject_video` VALUES (3,'interview with david litwak CEO of mozio','a long description here ','3PI2KqQWdCA','algebra.jpg','00:02:51.000000',3);
/*!40000 ALTER TABLE `mozioproject_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-14  1:48:03
