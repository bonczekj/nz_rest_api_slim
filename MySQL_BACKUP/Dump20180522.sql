CREATE DATABASE  IF NOT EXISTS `nz_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci */;
USE `nz_db`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: nz_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `ico` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `profession` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_czech_ci DEFAULT NULL,
  `sub` tinyint(1) DEFAULT NULL,
  `dealtype` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`ico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('00297488','Statutární město Havířov','Město','Svornosti 86, 73601 Havířov',NULL,NULL),('05998468','Ing. Jiří Bonczek','IT','Těrlická 1473, 73535 Horní Suchá',NULL,NULL),('47983531','Radim Pich','Malířství, Kácení','Těrlická 1025, 73535 Horní Suchá',1,NULL),('70890692','Moravskoslezský kraj',NULL,'28. října 2771, 70200 Ostrava',NULL,NULL),('76084051','Radek Revenda','Stavební práce','275, 73911 Malenovice',1,'Dohoda');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctype`
--

DROP TABLE IF EXISTS `doctype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctype` (
  `type` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctype`
--

LOCK TABLES `doctype` WRITE;
/*!40000 ALTER TABLE `doctype` DISABLE KEYS */;
INSERT INTO `doctype` VALUES ('OR','Obchodní rejstřík'),('TEST','Testovací'),('ŽL','Živnostenský rejstřík');
/*!40000 ALTER TABLE `doctype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `expiration` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=664 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'OR','pokus.pdf','Popis','2018-12-31'),(2,'A1','C:\\TEST\\pokus.pdf','Popis',NULL),(3,'A2','C:\\TEST\\pokus.pdf','Popis',NULL),(4,'','C:\\TEST\\pokus.pdf','Nab Dok 1',NULL),(5,'OR','C:\\TEST\\pokus.pdf','Popis','0000-00-00'),(6,'A4','C:\\TEST\\pokus.pdf','Popis','0000-00-00'),(7,'A4','pokus.pdf','Popis','2017-01-31'),(8,'type01','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL),(9,'type01','pokus1.pdf','Popis dokumentu 1 XXXX','2018-02-01'),(10,'type02','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL),(11,'type02','c:\\temp\\pokus2.pdf','Popis dokumentu 1','2018-02-01'),(12,'type02','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL),(13,'type022','c:\\temp\\pokus2.pdf','Popis dokumentu 12','2018-02-01'),(14,'type03','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL),(15,'type03','c:\\temp\\pokus2.pdf','Popis dokumentu 1','2018-02-01'),(16,'type04','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL),(17,'type04','c:\\temp\\pokus2.pdf','Popis dokumentu BBBB','2018-02-01'),(18,'test01','pokus1.pdf','Popis dokumentu 21','2018-07-31'),(19,'ŽL','TNODConfig.exe','test path','2018-04-20'),(20,'OR','','khjklhjklh',NULL),(21,'OR','','sdfsdfsdfsdfsdfsd',NULL),(22,'TEST','','',NULL),(23,'TEST','',NULL,NULL),(24,'','','',NULL),(25,'','','',NULL),(26,'','','',NULL),(27,'','','',NULL),(28,'','','',NULL),(29,'','','',NULL),(30,'','','',NULL),(31,'','','',NULL),(32,'','','',NULL),(33,'','','',NULL),(34,'','J','',NULL),(35,'','','',NULL),(36,'','','',NULL),(37,'','','',NULL),(38,'','','',NULL),(39,'','','',NULL),(40,'','offersDocuments.php','',NULL),(41,'','offersDocuments.php','',NULL),(42,'','tasks.php','',NULL),(43,'','tasks.php','',NULL),(48,'','api.php','',NULL),(49,'','api.php','',NULL),(51,'','composer.lock','',NULL),(52,'','api.php','',NULL),(53,'','App.php','',NULL),(54,'','CallableResolver.php','',NULL),(55,'','api.php','',NULL),(56,'','api.php','',NULL),(57,'','composer.json','',NULL),(58,'','api.php','',NULL),(59,'','composer.lock','',NULL),(60,'','api.php','',NULL),(61,'','App.php','',NULL),(62,'','CallableResolver.php','',NULL),(63,'','api.php','',NULL),(64,'','api.php','',NULL),(65,'','App.php','',NULL),(66,'','CallableResolver.php','',NULL),(67,'','api.php','',NULL),(68,'','api.php','',NULL),(69,'','App.php','',NULL),(70,'','CallableResolver.php','',NULL),(71,'','api.php','',NULL),(72,'','api.php','',NULL),(73,'','composer.json','',NULL),(74,'','composer.lock','',NULL),(75,'','api.php','',NULL),(76,'','api.php','',NULL),(77,'','composer.json','',NULL),(78,'','composer.lock','',NULL),(79,'','api.php','',NULL),(80,'','api.php','',NULL),(81,'','App.php','',NULL),(82,'','CallableResolver.php','',NULL),(83,'','api.php','',NULL),(84,'','api.php','',NULL),(85,'','App.php','',NULL),(86,'','CallableResolver.php','',NULL),(87,'','api.php','',NULL),(88,'','api.php','',NULL),(89,'','App.php','',NULL),(90,'','CallableResolver.php','',NULL),(91,'','api.php','',NULL),(92,'','api.php','',NULL),(93,'','App.php','',NULL),(94,'','CallableResolver.php','',NULL),(95,'','api.php','',NULL),(96,'','api.php','',NULL),(97,'','composer.json','',NULL),(98,'','composer.lock','',NULL),(99,'','api.php','',NULL),(100,'','api.php','',NULL),(101,'','composer.json','',NULL),(102,'','composer.lock','',NULL),(103,'','api.php','',NULL),(104,'','api.php','',NULL),(105,'','composer.json','',NULL),(106,'','composer.lock','',NULL),(107,'','api.php','',NULL),(108,'','api.php','',NULL),(109,'','composer.json','',NULL),(110,'','composer.lock','',NULL),(111,'','api.php','',NULL),(112,'','api.php','',NULL),(113,'','composer.json','',NULL),(114,'','composer.lock','',NULL),(115,'','api.php','',NULL),(116,'','api.php','',NULL),(117,'','composer.json','',NULL),(118,'','composer.lock','',NULL),(119,'','api.php','',NULL),(120,'','api.php','',NULL),(121,'','composer.json','',NULL),(122,'','composer.lock','',NULL),(123,'','api.php','',NULL),(124,'','api.php','',NULL),(125,'','composer.json','',NULL),(126,'','composer.lock','',NULL),(127,'','api.php','',NULL),(128,'','api.php','',NULL),(129,'','api.php','',NULL),(130,'','api.php','',NULL),(131,'','composer.json','',NULL),(132,'','App.php','',NULL),(133,'','composer.lock','',NULL),(134,'','CallableResolver.php','',NULL),(135,'','api.php','',NULL),(136,'','api.php','',NULL),(137,'','api.php','',NULL),(138,'','api.php','',NULL),(139,'','composer.json','',NULL),(140,'','App.php','',NULL),(141,'','composer.lock','',NULL),(142,'','CallableResolver.php','',NULL),(143,'','api.php','',NULL),(144,'','api.php','',NULL),(145,'','api.php','',NULL),(146,'','api.php','',NULL),(147,'','composer.json','',NULL),(148,'','App.php','',NULL),(149,'','composer.lock','',NULL),(150,'','CallableResolver.php','',NULL),(151,'','api.php','',NULL),(152,'','api.php','',NULL),(153,'','api.php','',NULL),(154,'','api.php','',NULL),(155,'','composer.json','',NULL),(156,'','App.php','',NULL),(157,'','composer.lock','',NULL),(158,'','CallableResolver.php','',NULL),(159,'','api.php','',NULL),(160,'','api.php','',NULL),(161,'','App.php','',NULL),(162,'','CallableResolver.php','',NULL),(163,'','api.php','',NULL),(164,'','api.php','',NULL),(165,'','App.php','',NULL),(166,'','CallableResolver.php','',NULL),(167,'','api.php','',NULL),(168,'','api.php','',NULL),(169,'','App.php','',NULL),(170,'','CallableResolver.php','',NULL),(171,'','api.php','',NULL),(172,'','api.php','',NULL),(173,'','App.php','',NULL),(174,'','CallableResolver.php','',NULL),(175,'','api.php','',NULL),(176,'','api.php','',NULL),(177,'','App.php','',NULL),(178,'','CallableResolver.php','',NULL),(179,'','api.php','',NULL),(180,'','api.php','',NULL),(181,'','App.php','',NULL),(182,'','CallableResolver.php','',NULL),(183,'','api.php','',NULL),(184,'','api.php','',NULL),(185,'','App.php','',NULL),(186,'','CallableResolver.php','',NULL),(187,'','api.php','',NULL),(188,'','api.php','',NULL),(189,'','App.php','',NULL),(190,'','CallableResolver.php','',NULL),(191,'','api.php','',NULL),(192,'','api.php','',NULL),(193,'','App.php','',NULL),(194,'','CallableResolver.php','',NULL),(195,'','api.php','',NULL),(196,'','api.php','',NULL),(197,'','App.php','',NULL),(198,'','CallableResolver.php','',NULL),(199,'','api.php','',NULL),(200,'','api.php','',NULL),(201,'','App.php','',NULL),(202,'','CallableResolver.php','',NULL),(203,'','api.php','',NULL),(204,'','api.php','',NULL),(205,'','App.php','',NULL),(206,'','CallableResolver.php','',NULL),(207,'','api.php','',NULL),(208,'','api.php','',NULL),(209,'','App.php','',NULL),(210,'','CallableResolver.php','',NULL),(211,'','api.php','',NULL),(212,'','api.php','',NULL),(213,'','App.php','',NULL),(214,'','CallableResolver.php','',NULL),(215,'','api.php','',NULL),(216,'','api.php','',NULL),(217,'','App.php','',NULL),(218,'','CallableResolver.php','',NULL),(219,'','api.php','',NULL),(220,'','api.php','',NULL),(221,'','App.php','',NULL),(222,'','CallableResolver.php','',NULL),(223,'','api.php','',NULL),(224,'','api.php','',NULL),(225,'','App.php','',NULL),(226,'','CallableResolver.php','',NULL),(227,'','api.php','',NULL),(228,'','api.php','',NULL),(229,'','App.php','',NULL),(230,'','CallableResolver.php','',NULL),(231,'','api.php','',NULL),(232,'','api.php','',NULL),(233,'','App.php','',NULL),(234,'','CallableResolver.php','',NULL),(235,'','api.php','',NULL),(236,'','api.php','',NULL),(237,'','App.php','',NULL),(238,'','CallableResolver.php','',NULL),(239,'','api.php','',NULL),(240,'','api.php','',NULL),(241,'','App.php','',NULL),(242,'','CallableResolver.php','',NULL),(243,'','api.php','',NULL),(244,'','api.php','',NULL),(245,'','App.php','',NULL),(246,'','CallableResolver.php','',NULL),(247,'','api.php','',NULL),(248,'','api.php','',NULL),(249,'','App.php','',NULL),(250,'','CallableResolver.php','',NULL),(251,'','api.php','',NULL),(252,'','api.php','',NULL),(253,'','App.php','',NULL),(254,'','CallableResolver.php','',NULL),(255,'','api.php','',NULL),(256,'','api.php','',NULL),(257,'','App.php','',NULL),(258,'','CallableResolver.php','',NULL),(259,'','api.php','',NULL),(260,'','api.php','',NULL),(261,'','App.php','',NULL),(262,'','CallableResolver.php','',NULL),(263,'','api.php','',NULL),(264,'','api.php','',NULL),(265,'','App.php','',NULL),(266,'','CallableResolver.php','',NULL),(267,'','api.php','',NULL),(268,'','api.php','',NULL),(269,'','App.php','',NULL),(270,'','CallableResolver.php','',NULL),(271,'','api.php','',NULL),(272,'','api.php','',NULL),(273,'','App.php','',NULL),(274,'','CallableResolver.php','',NULL),(275,'','api.php','',NULL),(276,'','api.php','',NULL),(277,'','App.php','',NULL),(278,'','CallableResolver.php','',NULL),(279,'','api.php','',NULL),(280,'','api.php','',NULL),(281,'','App.php','',NULL),(282,'','CallableResolver.php','',NULL),(283,'','api.php','',NULL),(284,'','api.php','',NULL),(285,'','App.php','',NULL),(286,'','CallableResolver.php','',NULL),(287,'','api.php','',NULL),(288,'','api.php','',NULL),(289,'','App.php','',NULL),(290,'','CallableResolver.php','',NULL),(291,'','api.php','',NULL),(292,'','api.php','',NULL),(293,'','App.php','',NULL),(294,'','CallableResolver.php','',NULL),(295,'','api.php','',NULL),(296,'','api.php','',NULL),(297,'','App.php','',NULL),(298,'','CallableResolver.php','',NULL),(299,'','api.php','',NULL),(300,'','api.php','',NULL),(301,'','App.php','',NULL),(302,'','CallableResolver.php','',NULL),(303,'','api.php','',NULL),(304,'','api.php','',NULL),(305,'','App.php','',NULL),(306,'','CallableResolver.php','',NULL),(307,'','api.php','',NULL),(308,'','api.php','',NULL),(309,'','App.php','',NULL),(310,'','CallableResolver.php','',NULL),(311,'','api.php','',NULL),(312,'','api.php','',NULL),(313,'','App.php','',NULL),(314,'','CallableResolver.php','',NULL),(315,'','api.php','',NULL),(316,'','api.php','',NULL),(317,'','App.php','',NULL),(318,'','CallableResolver.php','',NULL),(319,'','api.php','',NULL),(320,'','api.php','',NULL),(321,'','App.php','',NULL),(322,'','CallableResolver.php','',NULL),(323,'','api.php','',NULL),(324,'','api.php','',NULL),(325,'','App.php','',NULL),(326,'','CallableResolver.php','',NULL),(327,'','api.php','',NULL),(328,'','api.php','',NULL),(329,'','App.php','',NULL),(330,'','CallableResolver.php','',NULL),(331,'','api.php','',NULL),(332,'','api.php','',NULL),(333,'','App.php','',NULL),(334,'','CallableResolver.php','',NULL),(335,'','api.php','',NULL),(336,'','api.php','',NULL),(337,'','App.php','',NULL),(338,'','CallableResolver.php','',NULL),(339,'','api.php','',NULL),(340,'','api.php','',NULL),(341,'','App.php','',NULL),(342,'','CallableResolver.php','',NULL),(343,'','api.php','',NULL),(344,'','api.php','',NULL),(345,'','App.php','',NULL),(346,'','CallableResolver.php','',NULL),(347,'','api.php','',NULL),(348,'','api.php','',NULL),(349,'','App.php','',NULL),(350,'','CallableResolver.php','',NULL),(351,'','api.php','',NULL),(352,'','api.php','',NULL),(353,'','App.php','',NULL),(354,'','CallableResolver.php','',NULL),(355,'','api.php','',NULL),(356,'','api.php','',NULL),(357,'','App.php','',NULL),(358,'','CallableResolver.php','',NULL),(359,'','api.php','',NULL),(360,'','api.php','',NULL),(361,'','App.php','',NULL),(362,'','CallableResolver.php','',NULL),(363,'','api.php','',NULL),(364,'','api.php','',NULL),(365,'','App.php','',NULL),(366,'','CallableResolver.php','',NULL),(367,'','api.php','',NULL),(368,'','api.php','',NULL),(369,'','App.php','',NULL),(370,'','CallableResolver.php','',NULL),(371,'','api.php','',NULL),(372,'','api.php','',NULL),(373,'','App.php','',NULL),(374,'','CallableResolver.php','',NULL),(375,'','api.php','',NULL),(376,'','api.php','',NULL),(377,'','App.php','',NULL),(378,'','CallableResolver.php','',NULL),(379,'','api.php','',NULL),(380,'','api.php','',NULL),(381,'','App.php','',NULL),(382,'','CallableResolver.php','',NULL),(383,'','api.php','',NULL),(384,'','api.php','',NULL),(385,'','App.php','',NULL),(386,'','CallableResolver.php','',NULL),(387,'','api.php','',NULL),(388,'','api.php','',NULL),(389,'','App.php','',NULL),(390,'','CallableResolver.php','',NULL),(391,'','api.php','',NULL),(392,'','api.php','',NULL),(393,'','App.php','',NULL),(394,'','CallableResolver.php','',NULL),(395,'','api.php','',NULL),(396,'','api.php','',NULL),(397,'','App.php','',NULL),(398,'','CallableResolver.php','',NULL),(399,'','api.php','',NULL),(400,'','api.php','',NULL),(401,'','App.php','',NULL),(402,'','CallableResolver.php','',NULL),(403,'','api.php','',NULL),(404,'','api.php','',NULL),(405,'','App.php','',NULL),(406,'','CallableResolver.php','',NULL),(407,'','api.php','',NULL),(408,'','api.php','',NULL),(409,'','App.php','',NULL),(410,'','CallableResolver.php','',NULL),(411,'','api.php','',NULL),(412,'','api.php','',NULL),(413,'','App.php','',NULL),(414,'','CallableResolver.php','',NULL),(415,'','api.php','',NULL),(416,'','api.php','',NULL),(417,'','App.php','',NULL),(418,'','CallableResolver.php','',NULL),(419,'','api.php','',NULL),(420,'','api.php','',NULL),(421,'','App.php','',NULL),(422,'','CallableResolver.php','',NULL),(423,'','api.php','',NULL),(424,'','api.php','',NULL),(425,'','App.php','',NULL),(426,'','CallableResolver.php','',NULL),(427,'','api.php','',NULL),(428,'','api.php','',NULL),(429,'','App.php','',NULL),(430,'','CallableResolver.php','',NULL),(431,'','api.php','',NULL),(432,'','api.php','',NULL),(433,'','App.php','',NULL),(434,'','CallableResolver.php','',NULL),(435,'','api.php','',NULL),(436,'','api.php','',NULL),(437,'','App.php','',NULL),(438,'','CallableResolver.php','',NULL),(439,'','api.php','',NULL),(440,'','api.php','',NULL),(441,'','App.php','',NULL),(442,'','CallableResolver.php','',NULL),(443,'','api.php','',NULL),(444,'','api.php','',NULL),(445,'','App.php','',NULL),(446,'','CallableResolver.php','',NULL),(447,'','api.php','',NULL),(448,'','api.php','',NULL),(449,'','App.php','',NULL),(450,'','CallableResolver.php','',NULL),(451,'','api.php','',NULL),(452,'','api.php','',NULL),(453,'','App.php','',NULL),(454,'','CallableResolver.php','',NULL),(455,'','api.php','',NULL),(456,'','api.php','',NULL),(457,'','App.php','',NULL),(458,'','CallableResolver.php','',NULL),(459,'','api.php','',NULL),(460,'','api.php','',NULL),(461,'','App.php','',NULL),(462,'','CallableResolver.php','',NULL),(463,'','api.php','',NULL),(464,'','api.php','',NULL),(465,'','App.php','',NULL),(466,'','CallableResolver.php','',NULL),(467,'','api.php','',NULL),(468,'','api.php','',NULL),(469,'','App.php','',NULL),(470,'','CallableResolver.php','',NULL),(471,'','api.php','',NULL),(472,'','api.php','',NULL),(473,'','App.php','',NULL),(474,'','CallableResolver.php','',NULL),(475,'','api.php','',NULL),(476,'','api.php','',NULL),(477,'','App.php','',NULL),(478,'','CallableResolver.php','',NULL),(479,'','api.php','',NULL),(480,'','api.php','',NULL),(481,'','App.php','',NULL),(482,'','CallableResolver.php','',NULL),(483,'','api.php','',NULL),(484,'','api.php','',NULL),(485,'','App.php','',NULL),(486,'','CallableResolver.php','',NULL),(487,'','api.php','',NULL),(488,'','api.php','',NULL),(489,'','App.php','',NULL),(490,'','CallableResolver.php','',NULL),(491,'','api.php','',NULL),(492,'','api.php','',NULL),(493,'','App.php','',NULL),(494,'','CallableResolver.php','',NULL),(495,'','api.php','',NULL),(496,'','api.php','',NULL),(497,'','App.php','',NULL),(498,'','CallableResolver.php','',NULL),(499,'','api.php','',NULL),(500,'','api.php','',NULL),(501,'','App.php','',NULL),(502,'','CallableResolver.php','',NULL),(503,'','api.php','',NULL),(504,'','api.php','',NULL),(505,'','App.php','',NULL),(506,'','CallableResolver.php','',NULL),(507,'','api.php','',NULL),(508,'','api.php','',NULL),(509,'','App.php','',NULL),(510,'','CallableResolver.php','',NULL),(511,'','api.php','',NULL),(512,'','api.php','',NULL),(513,'','App.php','',NULL),(514,'','CallableResolver.php','',NULL),(515,'','api.php','',NULL),(516,'','api.php','',NULL),(517,'','App.php','',NULL),(518,'','CallableResolver.php','',NULL),(519,'','api.php','',NULL),(520,'','api.php','',NULL),(521,'','App.php','',NULL),(522,'','CallableResolver.php','',NULL),(523,'','api.php','',NULL),(524,'','api.php','',NULL),(525,'','App.php','',NULL),(526,'','CallableResolver.php','',NULL),(527,'','api.php','',NULL),(528,'','api.php','',NULL),(529,'','App.php','',NULL),(530,'','CallableResolver.php','',NULL),(531,'','api.php','',NULL),(532,'','api.php','',NULL),(533,'','App.php','',NULL),(534,'','CallableResolver.php','',NULL),(535,'','api.php','',NULL),(536,'','api.php','',NULL),(537,'','App.php','',NULL),(538,'','CallableResolver.php','',NULL),(539,'','api.php','',NULL),(540,'','api.php','',NULL),(541,'','App.php','',NULL),(542,'','CallableResolver.php','',NULL),(543,'','api.php','',NULL),(544,'','api.php','',NULL),(545,'','App.php','',NULL),(546,'','CallableResolver.php','',NULL),(547,'','api.php','',NULL),(548,'','api.php','',NULL),(549,'','App.php','',NULL),(550,'','CallableResolver.php','',NULL),(551,'','api.php','',NULL),(552,'','api.php','',NULL),(553,'','App.php','',NULL),(554,'','CallableResolver.php','',NULL),(555,'','api.php','',NULL),(556,'','api.php','',NULL),(557,'','App.php','',NULL),(558,'','CallableResolver.php','',NULL),(559,'','api.php','',NULL),(560,'','api.php','',NULL),(561,'','App.php','',NULL),(562,'','CallableResolver.php','',NULL),(563,'','api.php','',NULL),(564,'','api.php','',NULL),(565,'','App.php','',NULL),(566,'','CallableResolver.php','',NULL),(567,'','api.php','',NULL),(568,'','api.php','',NULL),(569,'','App.php','',NULL),(570,'','CallableResolver.php','',NULL),(571,'','api.php','',NULL),(572,'','api.php','',NULL),(573,'','App.php','',NULL),(574,'','CallableResolver.php','',NULL),(575,'','api.php','',NULL),(576,'','api.php','',NULL),(577,'','App.php','',NULL),(578,'','CallableResolver.php','',NULL),(579,'','api.php','',NULL),(580,'','api.php','',NULL),(581,'','App.php','',NULL),(582,'','CallableResolver.php','',NULL),(583,'','api.php','',NULL),(584,'','api.php','',NULL),(585,'','App.php','',NULL),(586,'','CallableResolver.php','',NULL),(587,'','api.php','',NULL),(588,'','api.php','',NULL),(589,'','App.php','',NULL),(590,'','CallableResolver.php','',NULL),(591,'','api.php','',NULL),(592,'','api.php','',NULL),(593,'','App.php','',NULL),(594,'','CallableResolver.php','',NULL),(595,'','api.php','',NULL),(596,'','api.php','',NULL),(597,'','App.php','',NULL),(598,'','CallableResolver.php','',NULL),(599,'','api.php','',NULL),(600,'','api.php','',NULL),(601,'','App.php','',NULL),(602,'','CallableResolver.php','',NULL),(603,'','api.php','',NULL),(604,'','api.php','',NULL),(605,'','App.php','',NULL),(606,'','CallableResolver.php','',NULL),(607,'','api.php','',NULL),(608,'','api.php','',NULL),(609,'','App.php','',NULL),(610,'','CallableResolver.php','',NULL),(611,'','api.php','',NULL),(612,'','api.php','',NULL),(613,'','App.php','',NULL),(614,'','CallableResolver.php','',NULL),(615,'','api.php','',NULL),(616,'','api.php','',NULL),(617,'','App.php','',NULL),(618,'','CallableResolver.php','',NULL),(619,'','api.php','',NULL),(620,'','api.php','',NULL),(621,'','App.php','',NULL),(622,'','CallableResolver.php','',NULL),(623,'','Container.php','',NULL),(625,'','App.php','',NULL),(626,'','dbManager.inc','',NULL),(627,'','dbTable.inc','',NULL),(628,'','logger.inc','',NULL),(629,'','Middleware.inc','',NULL),(630,'','mysql_create','',NULL),(633,'','dbManager.inc','',NULL),(634,'','Middleware.inc','',NULL),(635,'','mysql_create','',NULL),(636,'','tabCustomers.inc','',NULL),(637,'','logger.inc','',NULL),(638,'','Middleware.inc','',NULL),(639,'','mysql_create','',NULL),(640,'','Ares.inc','',NULL),(642,'','dbManager.inc','',NULL),(644,'','tabOffers.inc','',NULL),(645,'','tabOrders.inc','',NULL),(648,'','tabOffers.inc','',NULL),(649,'','tabOrders.inc','',NULL),(650,'','tabOffers.inc','',NULL),(651,'','tabDocType.inc','',NULL),(652,'','Ares.inc','',NULL),(653,'','dbManager.inc','',NULL),(654,'','logger.inc','',NULL),(655,'','Ares.inc','',NULL),(656,'','Ares.inc','',NULL),(657,'','aresMF.inc','',NULL),(658,'','dbManager.inc','',NULL),(659,'','dbTable.inc','',NULL),(660,'','tabCustomers.inc','',NULL),(661,'','tabDocType.inc','',NULL),(662,'','d3dcompiler_47.dll','',NULL),(663,'','eventlog_provider.dll','',NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logphp`
--

DROP TABLE IF EXISTS `logphp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logphp` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `remote_addr` varchar(255) COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  `request_uri` varchar(255) COLLATE utf8_czech_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `json` json DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logphp`
--

LOCK TABLES `logphp` WRITE;
/*!40000 ALTER TABLE `logphp` DISABLE KEYS */;
/*!40000 ALTER TABLE `logphp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `customer` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `processdate` date DEFAULT NULL,
  `processtime` time DEFAULT NULL,
  `deliverytype` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `errand` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `winprice` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `idorder` int(11) DEFAULT NULL,
  `archiv` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (201801,'Název 2','Investor','2018-12-31',NULL,'email','true',0,1000000,201810,0),(201802,'Rekonstrukce',NULL,'2018-04-30',NULL,'email','false',NULL,NULL,NULL,0),(201803,'Test','hhhhhh','2018-05-10',NULL,'post','true',NULL,2000000,NULL,0),(201804,'Test2','dddddd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(201811,'test 11','FFFF','2018-06-01',NULL,'post','true',2,1,201801,0),(201812,'test 10','Investor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offersdocuments`
--

DROP TABLE IF EXISTS `offersdocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offersdocuments` (
  `idoffer` int(11) NOT NULL,
  `iddocument` int(11) NOT NULL,
  `typeRS` varchar(1) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idoffer`,`iddocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offersdocuments`
--

LOCK TABLES `offersdocuments` WRITE;
/*!40000 ALTER TABLE `offersdocuments` DISABLE KEYS */;
INSERT INTO `offersdocuments` VALUES (201801,1,''),(201801,4,''),(201801,10,''),(201801,637,''),(201801,638,''),(201801,639,'R'),(201801,640,'S'),(201801,642,'S'),(201801,644,''),(201801,645,''),(201801,648,''),(201801,649,''),(201801,651,'R'),(201803,623,'R'),(201803,625,'R'),(201803,626,'S'),(201803,627,'S'),(201803,628,'S'),(201803,629,'S'),(201803,630,'S'),(201804,48,'S'),(201804,49,'R'),(201804,51,'R'),(201804,52,'S'),(201804,53,'S'),(201804,54,'S'),(201804,55,'R'),(201804,56,'R'),(201804,57,'R'),(201804,58,'S'),(201804,59,'R'),(201804,60,'S'),(201804,61,'S'),(201804,62,'S'),(201804,63,'S'),(201804,64,'S'),(201804,65,'S'),(201804,66,'S'),(201804,67,'S'),(201804,68,'S'),(201804,69,'S'),(201804,70,'S'),(201804,71,'R'),(201804,72,'R'),(201804,73,'R'),(201804,74,'R'),(201804,75,'R'),(201804,76,'R'),(201804,77,'R'),(201804,78,'R'),(201804,79,'S'),(201804,80,'S'),(201804,81,'S'),(201804,82,'S'),(201804,83,'S'),(201804,84,'S'),(201804,85,'S'),(201804,86,'S'),(201804,87,'S'),(201804,88,'S'),(201804,89,'S'),(201804,90,'S'),(201804,91,'S'),(201804,92,'S'),(201804,93,'S'),(201804,94,'S'),(201804,95,'R'),(201804,96,'R'),(201804,97,'R'),(201804,98,'R'),(201804,99,'R'),(201804,100,'R'),(201804,101,'R'),(201804,102,'R'),(201804,103,'R'),(201804,104,'R'),(201804,105,'R'),(201804,106,'R'),(201804,107,'R'),(201804,108,'R'),(201804,109,'R'),(201804,110,'R'),(201804,111,'R'),(201804,112,'R'),(201804,113,'R'),(201804,114,'R'),(201804,115,'R'),(201804,116,'R'),(201804,117,'R'),(201804,118,'R'),(201804,119,'R'),(201804,120,'R'),(201804,121,'R'),(201804,122,'R'),(201804,123,'R'),(201804,124,'R'),(201804,125,'R'),(201804,126,'R'),(201804,127,'R'),(201804,128,'S'),(201804,129,'R'),(201804,130,'S'),(201804,131,'R'),(201804,132,'S'),(201804,133,'R'),(201804,134,'S'),(201804,135,'R'),(201804,136,'S'),(201804,137,'R'),(201804,138,'S'),(201804,139,'R'),(201804,140,'S'),(201804,141,'R'),(201804,142,'S'),(201804,143,'R'),(201804,144,'S'),(201804,145,'R'),(201804,146,'S'),(201804,147,'R'),(201804,148,'S'),(201804,149,'R'),(201804,150,'S'),(201804,151,'R'),(201804,152,'S'),(201804,153,'R'),(201804,154,'S'),(201804,155,'R'),(201804,156,'S'),(201804,157,'R'),(201804,158,'S'),(201804,159,'S'),(201804,160,'S'),(201804,161,'S'),(201804,162,'S'),(201804,163,'S'),(201804,164,'S'),(201804,165,'S'),(201804,166,'S'),(201804,167,'S'),(201804,168,'S'),(201804,169,'S'),(201804,170,'S'),(201804,171,'S'),(201804,172,'S'),(201804,173,'S'),(201804,174,'S'),(201804,175,'S'),(201804,176,'S'),(201804,177,'S'),(201804,178,'S'),(201804,179,'S'),(201804,180,'S'),(201804,181,'S'),(201804,182,'S'),(201804,183,'S'),(201804,184,'S'),(201804,185,'S'),(201804,186,'S'),(201804,187,'S'),(201804,188,'S'),(201804,189,'S'),(201804,190,'S'),(201804,191,'S'),(201804,192,'S'),(201804,193,'S'),(201804,194,'S'),(201804,195,'S'),(201804,196,'S'),(201804,197,'S'),(201804,198,'S'),(201804,199,'S'),(201804,200,'S'),(201804,201,'S'),(201804,202,'S'),(201804,203,'S'),(201804,204,'S'),(201804,205,'S'),(201804,206,'S'),(201804,207,'S'),(201804,208,'S'),(201804,209,'S'),(201804,210,'S'),(201804,211,'S'),(201804,212,'S'),(201804,213,'S'),(201804,214,'S'),(201804,215,'S'),(201804,216,'S'),(201804,217,'S'),(201804,218,'S'),(201804,219,'S'),(201804,220,'S'),(201804,221,'S'),(201804,222,'S'),(201804,223,'S'),(201804,224,'S'),(201804,225,'S'),(201804,226,'S'),(201804,227,'S'),(201804,228,'S'),(201804,229,'S'),(201804,230,'S'),(201804,231,'S'),(201804,232,'S'),(201804,233,'S'),(201804,234,'S'),(201804,235,'S'),(201804,236,'S'),(201804,237,'S'),(201804,238,'S'),(201804,239,'S'),(201804,240,'S'),(201804,241,'S'),(201804,242,'S'),(201804,243,'S'),(201804,244,'S'),(201804,245,'S'),(201804,246,'S'),(201804,247,'S'),(201804,248,'S'),(201804,249,'S'),(201804,250,'S'),(201804,251,'S'),(201804,252,'S'),(201804,253,'S'),(201804,254,'S'),(201804,255,'S'),(201804,256,'S'),(201804,257,'S'),(201804,258,'S'),(201804,259,'S'),(201804,260,'S'),(201804,261,'S'),(201804,262,'S'),(201804,263,'S'),(201804,264,'S'),(201804,265,'S'),(201804,266,'S'),(201804,267,'S'),(201804,268,'S'),(201804,269,'S'),(201804,270,'S'),(201804,271,'S'),(201804,272,'S'),(201804,273,'S'),(201804,274,'S'),(201804,275,'S'),(201804,276,'S'),(201804,277,'S'),(201804,278,'S'),(201804,279,'S'),(201804,280,'S'),(201804,281,'S'),(201804,282,'S'),(201804,283,'S'),(201804,284,'S'),(201804,285,'S'),(201804,286,'S'),(201804,287,'S'),(201804,288,'S'),(201804,289,'S'),(201804,290,'S'),(201804,291,'S'),(201804,292,'S'),(201804,293,'S'),(201804,294,'S'),(201804,295,'S'),(201804,296,'S'),(201804,297,'S'),(201804,298,'S'),(201804,299,'S'),(201804,300,'S'),(201804,301,'S'),(201804,302,'S'),(201804,303,'S'),(201804,304,'S'),(201804,305,'S'),(201804,306,'S'),(201804,307,'S'),(201804,308,'S'),(201804,309,'S'),(201804,310,'S'),(201804,311,'S'),(201804,312,'S'),(201804,313,'S'),(201804,314,'S'),(201804,315,'S'),(201804,316,'S'),(201804,317,'S'),(201804,318,'S'),(201804,319,'S'),(201804,320,'S'),(201804,321,'S'),(201804,322,'S'),(201804,323,'S'),(201804,324,'S'),(201804,325,'S'),(201804,326,'S'),(201804,327,'S'),(201804,328,'S'),(201804,329,'S'),(201804,330,'S'),(201804,331,'S'),(201804,332,'S'),(201804,333,'S'),(201804,334,'S'),(201804,335,'S'),(201804,336,'S'),(201804,337,'S'),(201804,338,'S'),(201804,339,'S'),(201804,340,'S'),(201804,341,'S'),(201804,342,'S'),(201804,343,'S'),(201804,344,'S'),(201804,345,'S'),(201804,346,'S'),(201804,347,'S'),(201804,348,'S'),(201804,349,'S'),(201804,350,'S'),(201804,351,'S'),(201804,352,'S'),(201804,353,'S'),(201804,354,'S'),(201804,355,'S'),(201804,356,'S'),(201804,357,'S'),(201804,358,'S'),(201804,359,'S'),(201804,360,'S'),(201804,361,'S'),(201804,362,'S'),(201804,363,'S'),(201804,364,'S'),(201804,365,'S'),(201804,366,'S'),(201804,367,'S'),(201804,368,'S'),(201804,369,'S'),(201804,370,'S'),(201804,371,'S'),(201804,372,'S'),(201804,373,'S'),(201804,374,'S'),(201804,375,'S'),(201804,376,'S'),(201804,377,'S'),(201804,378,'S'),(201804,379,'S'),(201804,380,'S'),(201804,381,'S'),(201804,382,'S'),(201804,383,'S'),(201804,384,'S'),(201804,385,'S'),(201804,386,'S'),(201804,387,'S'),(201804,388,'S'),(201804,389,'S'),(201804,390,'S'),(201804,391,'S'),(201804,392,'S'),(201804,393,'S'),(201804,394,'S'),(201804,395,'S'),(201804,396,'S'),(201804,397,'S'),(201804,398,'S'),(201804,399,'S'),(201804,400,'S'),(201804,401,'S'),(201804,402,'S'),(201804,403,'S'),(201804,404,'S'),(201804,405,'S'),(201804,406,'S'),(201804,407,'S'),(201804,408,'S'),(201804,409,'S'),(201804,410,'S'),(201804,411,'S'),(201804,412,'S'),(201804,413,'S'),(201804,414,'S'),(201804,415,'S'),(201804,416,'S'),(201804,417,'S'),(201804,418,'S'),(201804,419,'S'),(201804,420,'S'),(201804,421,'S'),(201804,422,'S'),(201804,423,'S'),(201804,424,'S'),(201804,425,'S'),(201804,426,'S'),(201804,427,'S'),(201804,428,'S'),(201804,429,'S'),(201804,430,'S'),(201804,431,'S'),(201804,432,'S'),(201804,433,'S'),(201804,434,'S'),(201804,435,'S'),(201804,436,'S'),(201804,437,'S'),(201804,438,'S'),(201804,439,'S'),(201804,440,'S'),(201804,441,'S'),(201804,442,'S'),(201804,443,'S'),(201804,444,'S'),(201804,445,'S'),(201804,446,'S'),(201804,447,'S'),(201804,448,'S'),(201804,449,'S'),(201804,450,'S'),(201804,451,'S'),(201804,452,'S'),(201804,453,'S'),(201804,454,'S'),(201804,455,'S'),(201804,456,'S'),(201804,457,'S'),(201804,458,'S'),(201804,459,'S'),(201804,460,'S'),(201804,461,'S'),(201804,462,'S'),(201804,463,'S'),(201804,464,'S'),(201804,465,'S'),(201804,466,'S'),(201804,467,'S'),(201804,468,'S'),(201804,469,'S'),(201804,470,'S'),(201804,471,'S'),(201804,472,'S'),(201804,473,'S'),(201804,474,'S'),(201804,475,'S'),(201804,476,'S'),(201804,477,'S'),(201804,478,'S'),(201804,479,'S'),(201804,480,'S'),(201804,481,'S'),(201804,482,'S'),(201804,483,'S'),(201804,484,'S'),(201804,485,'S'),(201804,486,'S'),(201804,487,'S'),(201804,488,'S'),(201804,489,'S'),(201804,490,'S'),(201804,491,'S'),(201804,492,'S'),(201804,493,'S'),(201804,494,'S'),(201804,495,'S'),(201804,496,'S'),(201804,497,'S'),(201804,498,'S'),(201804,499,'S'),(201804,500,'S'),(201804,501,'S'),(201804,502,'S'),(201804,503,'S'),(201804,504,'S'),(201804,505,'S'),(201804,506,'S'),(201804,507,'S'),(201804,508,'S'),(201804,509,'S'),(201804,510,'S'),(201804,511,'S'),(201804,512,'S'),(201804,513,'S'),(201804,514,'S'),(201804,515,'S'),(201804,516,'S'),(201804,517,'S'),(201804,518,'S'),(201804,519,'S'),(201804,520,'S'),(201804,521,'S'),(201804,522,'S'),(201804,523,'S'),(201804,524,'S'),(201804,525,'S'),(201804,526,'S'),(201804,527,'S'),(201804,528,'S'),(201804,529,'S'),(201804,530,'S'),(201804,531,'S'),(201804,532,'S'),(201804,533,'S'),(201804,534,'S'),(201804,535,'S'),(201804,536,'S'),(201804,537,'S'),(201804,538,'S'),(201804,539,'S'),(201804,540,'S'),(201804,541,'S'),(201804,542,'S'),(201804,543,'S'),(201804,544,'S'),(201804,545,'S'),(201804,546,'S'),(201804,547,'S'),(201804,548,'S'),(201804,549,'S'),(201804,550,'S'),(201804,551,'S'),(201804,552,'S'),(201804,553,'S'),(201804,554,'S'),(201804,555,'S'),(201804,556,'S'),(201804,557,'S'),(201804,558,'S'),(201804,559,'S'),(201804,560,'S'),(201804,561,'S'),(201804,562,'S'),(201804,563,'S'),(201804,564,'S'),(201804,565,'S'),(201804,566,'S'),(201804,567,'S'),(201804,568,'S'),(201804,569,'S'),(201804,570,'S'),(201804,571,'S'),(201804,572,'S'),(201804,573,'S'),(201804,574,'S'),(201804,575,'S'),(201804,576,'S'),(201804,577,'S'),(201804,578,'S'),(201804,579,'S'),(201804,580,'S'),(201804,581,'S'),(201804,582,'S'),(201804,583,'S'),(201804,584,'S'),(201804,585,'S'),(201804,586,'S'),(201804,587,'S'),(201804,588,'S'),(201804,589,'S'),(201804,590,'S'),(201804,591,'S'),(201804,592,'S'),(201804,593,'S'),(201804,594,'S'),(201804,595,'S'),(201804,596,'S'),(201804,597,'S'),(201804,598,'S'),(201804,599,'S'),(201804,600,'S'),(201804,601,'S'),(201804,602,'S'),(201804,603,'S'),(201804,604,'S'),(201804,605,'S'),(201804,606,'S'),(201804,607,'S'),(201804,608,'S'),(201804,609,'S'),(201804,610,'S'),(201804,611,'S'),(201804,612,'S'),(201804,613,'S'),(201804,614,'S'),(201804,615,'S'),(201804,616,'S'),(201804,617,'S'),(201804,618,'S'),(201804,619,'S'),(201804,620,'S'),(201804,621,'S'),(201804,622,'S'),(201811,633,'R'),(201811,634,'S'),(201811,635,'S'),(201811,636,'S'),(201811,650,'');
/*!40000 ALTER TABLE `offersdocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `ico` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `processdate` date DEFAULT NULL,
  `processtime` time DEFAULT NULL,
  `deliverytype` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `errand` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `winprice` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `idoffer` int(11) DEFAULT NULL,
  `price_w` int(11) DEFAULT NULL,
  `price_d` int(11) DEFAULT NULL,
  `price_r` int(11) DEFAULT NULL,
  `archive` tinyint(4) NOT NULL DEFAULT '0',
  `archiveloc` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (201801,'Rekonstrukce','00297488','2018-05-31',NULL,'person','true',NULL,15000000,NULL,100000,50000,1000,0,NULL),(201802,'test 11','00297488','2018-06-01',NULL,'post','true',2,1,NULL,0,0,0,0,NULL),(201810,'Název 2','Investor','2018-12-31',NULL,'email','true',0,1000000,NULL,NULL,NULL,NULL,1,NULL),(201811,'test 10','05998468',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(201812,'test 11','70890692',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(201813,'test 12','05998468',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdocuments`
--

DROP TABLE IF EXISTS `ordersdocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordersdocuments` (
  `idorder` int(11) NOT NULL,
  `iddocument` int(11) NOT NULL,
  `typeRS` varchar(1) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idorder`,`iddocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdocuments`
--

LOCK TABLES `ordersdocuments` WRITE;
/*!40000 ALTER TABLE `ordersdocuments` DISABLE KEYS */;
INSERT INTO `ordersdocuments` VALUES (201801,656,'P'),(201801,657,'P'),(201801,658,'F'),(201801,659,'F'),(201801,660,'O'),(201801,661,'O'),(201803,662,'O'),(201803,663,'O');
/*!40000 ALTER TABLE `ordersdocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderssubs`
--

DROP TABLE IF EXISTS `orderssubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderssubs` (
  `idsub` int(11) NOT NULL AUTO_INCREMENT,
  `idorder` int(11) NOT NULL,
  `ico` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `taskdate` date DEFAULT NULL,
  `finished` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `invoice` varchar(5) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`idsub`,`idorder`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderssubs`
--

LOCK TABLES `orderssubs` WRITE;
/*!40000 ALTER TABLE `orderssubs` DISABLE KEYS */;
INSERT INTO `orderssubs` VALUES (1,201801,'47983531',NULL,NULL,50000,'false'),(2,201801,'05998468',NULL,NULL,100000,'false'),(3,201801,'00297488',NULL,NULL,50000,'false'),(4,201801,'76084051',NULL,NULL,20000,'false'),(5,201801,'47983531',NULL,NULL,2000,'false'),(6,201802,'47983531',NULL,NULL,20000,NULL),(7,201802,'76084051',NULL,NULL,2000,NULL),(8,201802,'76084051',NULL,NULL,1000,NULL),(9,201803,'47983531',NULL,NULL,1000,NULL),(10,201803,'76084051',NULL,NULL,2000000,NULL),(11,201803,'47983531',NULL,NULL,2000000,NULL),(12,201804,'47983531',NULL,NULL,2000,'true'),(13,201803,'47983531',NULL,NULL,2000,NULL),(14,201803,'76084051',NULL,NULL,30000,'false');
/*!40000 ALTER TABLE `orderssubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstasks`
--

DROP TABLE IF EXISTS `orderstasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstasks` (
  `idtask` int(11) NOT NULL AUTO_INCREMENT,
  `idorder` int(11) NOT NULL,
  `taskdate` date DEFAULT NULL,
  `taskdesc` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `finished` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `invoice` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtask`,`idorder`),
  KEY `idorder` (`idorder`,`taskdate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstasks`
--

LOCK TABLES `orderstasks` WRITE;
/*!40000 ALTER TABLE `orderstasks` DISABLE KEYS */;
INSERT INTO `orderstasks` VALUES (1,201801,'2018-05-20','Vyjádření RWE',NULL,1000000,0),(2,201801,'2018-05-10','Vyjádření čez',NULL,NULL,0),(3,201801,'2018-04-25','Dopis',NULL,NULL,0);
/*!40000 ALTER TABLE `orderstasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(40) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_czech_ci NOT NULL,
  `firstname` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `lastname` varchar(80) COLLATE utf8_czech_ci NOT NULL,
  `salesData` tinyint(1) DEFAULT NULL,
  `techData` tinyint(1) DEFAULT NULL,
  `token` varchar(16) COLLATE utf8_czech_ci DEFAULT NULL,
  `tokenExpire` datetime DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('JB','jiri.bonczek@volny.cz','111','Jiří','Bonczek',1,NULL,'819918a7c3a567f1','2018-05-21 23:05:49'),('LZ','zahradnicek@atris.cz','111','Ladislav','Zahradníček',0,NULL,'51e6cb90acbdfd1d','2018-05-15 00:10:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_customers`
--

DROP TABLE IF EXISTS `v_customers`;
/*!50001 DROP VIEW IF EXISTS `v_customers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_customers` AS SELECT 
 1 AS `ico`,
 1 AS `name`,
 1 AS `profession`,
 1 AS `address`,
 1 AS `sub`,
 1 AS `dealtype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_log`
--

DROP TABLE IF EXISTS `v_log`;
/*!50001 DROP VIEW IF EXISTS `v_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_log` AS SELECT 
 1 AS `log_id`,
 1 AS `remote_addr`,
 1 AS `request_uri`,
 1 AS `message`,
 1 AS `log_date`,
 1 AS `json`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_offers`
--

DROP TABLE IF EXISTS `v_offers`;
/*!50001 DROP VIEW IF EXISTS `v_offers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_offers` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `customer`,
 1 AS `processdate`,
 1 AS `processtime`,
 1 AS `deliverytype`,
 1 AS `errand`,
 1 AS `winprice`,
 1 AS `price`,
 1 AS `idorder`,
 1 AS `nameorder`,
 1 AS `archive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orders`
--

DROP TABLE IF EXISTS `v_orders`;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_orders` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `ico`,
 1 AS `customer`,
 1 AS `processdate`,
 1 AS `processtime`,
 1 AS `deliverytype`,
 1 AS `errand`,
 1 AS `winprice`,
 1 AS `price`,
 1 AS `idoffer`,
 1 AS `price_w`,
 1 AS `price_d`,
 1 AS `price_r`,
 1 AS `archive`,
 1 AS `archiveloc`,
 1 AS `subs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orders_all`
--

DROP TABLE IF EXISTS `v_orders_all`;
/*!50001 DROP VIEW IF EXISTS `v_orders_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_orders_all` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `ico`,
 1 AS `customer`,
 1 AS `processdate`,
 1 AS `processtime`,
 1 AS `deliverytype`,
 1 AS `errand`,
 1 AS `winprice`,
 1 AS `price`,
 1 AS `idoffer`,
 1 AS `price_w`,
 1 AS `price_d`,
 1 AS `price_r`,
 1 AS `archive`,
 1 AS `archiveloc`,
 1 AS `price_s`,
 1 AS `price_s_pl`,
 1 AS `price_c`,
 1 AS `price_c_pl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orderssubs`
--

DROP TABLE IF EXISTS `v_orderssubs`;
/*!50001 DROP VIEW IF EXISTS `v_orderssubs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_orderssubs` AS SELECT 
 1 AS `idsub`,
 1 AS `idorder`,
 1 AS `ico`,
 1 AS `taskdate`,
 1 AS `finished`,
 1 AS `price`,
 1 AS `invoice`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orderstasks`
--

DROP TABLE IF EXISTS `v_orderstasks`;
/*!50001 DROP VIEW IF EXISTS `v_orderstasks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_orderstasks` AS SELECT 
 1 AS `idtask`,
 1 AS `idorder`,
 1 AS `taskdate`,
 1 AS `taskdesc`,
 1 AS `finished`,
 1 AS `price`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_subcustomers`
--

DROP TABLE IF EXISTS `v_subcustomers`;
/*!50001 DROP VIEW IF EXISTS `v_subcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_subcustomers` AS SELECT 
 1 AS `ico`,
 1 AS `name`,
 1 AS `profession`,
 1 AS `address`,
 1 AS `sub`,
 1 AS `dealtype`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'nz_db'
--

--
-- Final view structure for view `v_customers`
--

/*!50001 DROP VIEW IF EXISTS `v_customers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_customers` AS select `customers`.`ico` AS `ico`,`customers`.`name` AS `name`,`customers`.`profession` AS `profession`,`customers`.`address` AS `address`,`customers`.`sub` AS `sub`,`customers`.`dealtype` AS `dealtype` from `customers` where isnull(`customers`.`sub`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_log`
--

/*!50001 DROP VIEW IF EXISTS `v_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_log` AS select `logphp`.`log_id` AS `log_id`,`logphp`.`remote_addr` AS `remote_addr`,`logphp`.`request_uri` AS `request_uri`,`logphp`.`message` AS `message`,`logphp`.`log_date` AS `log_date`,`logphp`.`json` AS `json` from `logphp` order by `logphp`.`log_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_offers`
--

/*!50001 DROP VIEW IF EXISTS `v_offers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_offers` AS select `offers`.`id` AS `id`,`offers`.`name` AS `name`,`offers`.`customer` AS `customer`,`offers`.`processdate` AS `processdate`,`offers`.`processtime` AS `processtime`,`offers`.`deliverytype` AS `deliverytype`,`offers`.`errand` AS `errand`,`offers`.`winprice` AS `winprice`,`offers`.`price` AS `price`,`offers`.`idorder` AS `idorder`,`orders`.`name` AS `nameorder`,`orders`.`archive` AS `archive` from (`offers` left join `orders` on((`offers`.`idorder` = `orders`.`id`))) order by `offers`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orders`
--

/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orders` AS select `orders`.`id` AS `id`,`orders`.`name` AS `name`,`orders`.`ico` AS `ico`,`customers`.`name` AS `customer`,`orders`.`processdate` AS `processdate`,`orders`.`processtime` AS `processtime`,`orders`.`deliverytype` AS `deliverytype`,`orders`.`errand` AS `errand`,`orders`.`winprice` AS `winprice`,`orders`.`price` AS `price`,`orders`.`idoffer` AS `idoffer`,`orders`.`price_w` AS `price_w`,`orders`.`price_d` AS `price_d`,`orders`.`price_r` AS `price_r`,`orders`.`archive` AS `archive`,`orders`.`archiveloc` AS `archiveloc`,(select sum(`orderssubs`.`price`) from `orderssubs` where (`orderssubs`.`idorder` = `orders`.`id`)) AS `subs` from (`orders` left join `customers` on((`orders`.`ico` = `customers`.`ico`))) order by `orders`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orders_all`
--

/*!50001 DROP VIEW IF EXISTS `v_orders_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orders_all` AS select `orders`.`id` AS `id`,`orders`.`name` AS `name`,`orders`.`ico` AS `ico`,`customers`.`name` AS `customer`,`orders`.`processdate` AS `processdate`,`orders`.`processtime` AS `processtime`,`orders`.`deliverytype` AS `deliverytype`,`orders`.`errand` AS `errand`,`orders`.`winprice` AS `winprice`,`orders`.`price` AS `price`,`orders`.`idoffer` AS `idoffer`,ifnull(`orders`.`price_w`,0) AS `price_w`,ifnull(`orders`.`price_d`,0) AS `price_d`,ifnull(`orders`.`price_r`,0) AS `price_r`,`orders`.`archive` AS `archive`,`orders`.`archiveloc` AS `archiveloc`,ifnull((select sum(`orderssubs`.`price`) from `orderssubs` where ((`orderssubs`.`idorder` = `orders`.`id`) and (`orderssubs`.`invoice` = 'true'))),0) AS `price_s`,ifnull((select sum(`orderssubs`.`price`) from `orderssubs` where (`orderssubs`.`idorder` = `orders`.`id`)),0) AS `price_s_pl`,ifnull((select sum(`orderstasks`.`price`) from `orderstasks` where ((`orderstasks`.`idorder` = `orders`.`id`) and (`orderstasks`.`invoice` = 'true'))),0) AS `price_c`,ifnull((select sum(`orderstasks`.`price`) from `orderstasks` where (`orderstasks`.`idorder` = `orders`.`id`)),0) AS `price_c_pl` from (`orders` left join `customers` on((`orders`.`ico` = `customers`.`ico`))) order by `orders`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orderssubs`
--

/*!50001 DROP VIEW IF EXISTS `v_orderssubs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orderssubs` AS select `orderssubs`.`idsub` AS `idsub`,`orderssubs`.`idorder` AS `idorder`,`orderssubs`.`ico` AS `ico`,`orderssubs`.`taskdate` AS `taskdate`,`orderssubs`.`finished` AS `finished`,`orderssubs`.`price` AS `price`,`orderssubs`.`invoice` AS `invoice`,`customers`.`name` AS `name` from (`orderssubs` join `customers`) where (`orderssubs`.`ico` = `customers`.`ico`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orderstasks`
--

/*!50001 DROP VIEW IF EXISTS `v_orderstasks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orderstasks` AS select `orderstasks`.`idtask` AS `idtask`,`orderstasks`.`idorder` AS `idorder`,`orderstasks`.`taskdate` AS `taskdate`,`orderstasks`.`taskdesc` AS `taskdesc`,`orderstasks`.`finished` AS `finished`,`orderstasks`.`price` AS `price`,`orders`.`name` AS `name` from (`orderstasks` join `orders`) where (`orderstasks`.`idorder` = `orders`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_subcustomers`
--

/*!50001 DROP VIEW IF EXISTS `v_subcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_subcustomers` AS select `customers`.`ico` AS `ico`,`customers`.`name` AS `name`,`customers`.`profession` AS `profession`,`customers`.`address` AS `address`,`customers`.`sub` AS `sub`,`customers`.`dealtype` AS `dealtype` from `customers` where (`customers`.`sub` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-22  1:02:00
