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
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centers` (
  `idcenter` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `person` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`idcenter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centers`
--

LOCK TABLES `centers` WRITE;
/*!40000 ALTER TABLE `centers` DISABLE KEYS */;
INSERT INTO `centers` VALUES ('101','Novák'),('102','Lenka Dvořáková');
/*!40000 ALTER TABLE `centers` ENABLE KEYS */;
UNLOCK TABLES;

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
  `mobil` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`ico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('00297488','Statutární město Havířov','Město','Svornosti 86, 73601 Havířov',NULL,NULL,NULL,NULL),('05998468','Ing. Jiří Bonczek','IT','Těrlická 1473, 73535 Horní Suchá',1,'Dohoda',NULL,NULL),('47983531','Radim Pich','Malířství, Kácení','Těrlická 1025, 73535 Horní Suchá',1,NULL,NULL,NULL),('70890692','Moravskoslezský kraj',NULL,'28. října 2771, 70200 Ostrava',NULL,NULL,NULL,NULL),('70994234','Správa železniční dopravní cesty, státní organizace',NULL,'Dlážděná 1003, 11000 Praha',NULL,'Smlouva',NULL,NULL),('76084051','Radek Revenda','Stavební práce','275, 73911 Malenovice',1,'Dohoda','606789456','revenda@seznam.cz');
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
  `techname` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'OR','pokus.pdf','Popis','2018-12-31',NULL),(2,'A1','C:\\TEST\\pokus.pdf','Popis',NULL,NULL),(3,'A2','C:\\TEST\\pokus.pdf','Popis',NULL,NULL),(4,'','C:\\TEST\\pokus.pdf','Nab Dok 1',NULL,NULL),(5,'OR','C:\\TEST\\pokus.pdf','Popis','0000-00-00',NULL),(6,'A4','C:\\TEST\\pokus.pdf','Popis','0000-00-00',NULL),(7,'A4','pokus.pdf','Popis','2017-01-31',NULL),(8,'type01','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL,NULL),(9,'type01','pokus1.pdf','Popis dokumentu 1 XXXX','2018-02-01',NULL),(10,'type02','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL,NULL),(11,'type02','c:\\temp\\pokus2.pdf','Popis dokumentu 1','2018-02-01',NULL),(12,'type02','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL,NULL),(13,'type022','c:\\temp\\pokus2.pdf','Popis dokumentu 12','2018-02-01',NULL),(14,'type03','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL,NULL),(15,'type03','c:\\temp\\pokus2.pdf','Popis dokumentu 1','2018-02-01',NULL),(16,'type04','c:\\temp\\pokus1.pdf','Popis dokumentu 1',NULL,NULL),(17,'type04','c:\\temp\\pokus2.pdf','Popis dokumentu BBBB','2018-02-01',NULL),(18,'test01','pokus1.pdf','Popis dokumentu 21','2018-07-31',NULL),(19,'ŽL','TNODConfig.exe','test path','2018-04-20',NULL),(20,'OR','','khjklhjklh',NULL,NULL),(21,'OR','','sdfsdfsdfsdfsdfsd',NULL,NULL),(22,'TEST','','',NULL,NULL),(24,'','','',NULL,NULL),(25,'','','',NULL,NULL),(26,'','','',NULL,NULL),(27,'','','',NULL,NULL),(28,'','','',NULL,NULL),(29,'','','',NULL,NULL),(30,'','','',NULL,NULL),(31,'','','',NULL,NULL),(32,'','','',NULL,NULL),(33,'','','',NULL,NULL),(34,'','J','',NULL,NULL),(35,'','','',NULL,NULL),(36,'','','',NULL,NULL),(37,'','','',NULL,NULL),(38,'','','',NULL,NULL),(39,'','','',NULL,NULL),(40,'','offersDocuments.php','',NULL,NULL),(41,'','offersDocuments.php','',NULL,NULL),(42,'','tasks.php','',NULL,NULL),(43,'','tasks.php','',NULL,NULL),(48,'','api.php','',NULL,NULL),(49,'','api.php','',NULL,NULL),(51,'','composer.lock','',NULL,NULL),(52,'','api.php','',NULL,NULL),(53,'','App.php','',NULL,NULL),(54,'','CallableResolver.php','',NULL,NULL),(55,'','api.php','',NULL,NULL),(56,'','api.php','',NULL,NULL),(57,'','composer.json','',NULL,NULL),(58,'','api.php','',NULL,NULL),(59,'','composer.lock','',NULL,NULL),(60,'','api.php','',NULL,NULL),(61,'','App.php','',NULL,NULL),(62,'','CallableResolver.php','',NULL,NULL),(63,'','api.php','',NULL,NULL),(64,'','api.php','',NULL,NULL),(65,'','App.php','',NULL,NULL),(66,'','CallableResolver.php','',NULL,NULL),(67,'','api.php','',NULL,NULL),(68,'','api.php','',NULL,NULL),(69,'','App.php','',NULL,NULL),(70,'','CallableResolver.php','',NULL,NULL),(71,'','api.php','',NULL,NULL),(72,'','api.php','',NULL,NULL),(73,'','composer.json','',NULL,NULL),(74,'','composer.lock','',NULL,NULL),(75,'','api.php','',NULL,NULL),(76,'','api.php','',NULL,NULL),(77,'','composer.json','',NULL,NULL),(78,'','composer.lock','',NULL,NULL),(79,'','api.php','',NULL,NULL),(80,'','api.php','',NULL,NULL),(81,'','App.php','',NULL,NULL),(82,'','CallableResolver.php','',NULL,NULL),(83,'','api.php','',NULL,NULL),(84,'','api.php','',NULL,NULL),(85,'','App.php','',NULL,NULL),(86,'','CallableResolver.php','',NULL,NULL),(87,'','api.php','',NULL,NULL),(88,'','api.php','',NULL,NULL),(89,'','App.php','',NULL,NULL),(90,'','CallableResolver.php','',NULL,NULL),(91,'','api.php','',NULL,NULL),(92,'','api.php','',NULL,NULL),(93,'','App.php','',NULL,NULL),(94,'','CallableResolver.php','',NULL,NULL),(95,'','api.php','',NULL,NULL),(96,'','api.php','',NULL,NULL),(97,'','composer.json','',NULL,NULL),(98,'','composer.lock','',NULL,NULL),(99,'','api.php','',NULL,NULL),(100,'','api.php','',NULL,NULL),(101,'','composer.json','',NULL,NULL),(102,'','composer.lock','',NULL,NULL),(103,'','api.php','',NULL,NULL),(104,'','api.php','',NULL,NULL),(105,'','composer.json','',NULL,NULL),(106,'','composer.lock','',NULL,NULL),(107,'','api.php','',NULL,NULL),(108,'','api.php','',NULL,NULL),(109,'','composer.json','',NULL,NULL),(110,'','composer.lock','',NULL,NULL),(111,'','api.php','',NULL,NULL),(112,'','api.php','',NULL,NULL),(113,'','composer.json','',NULL,NULL),(114,'','composer.lock','',NULL,NULL),(115,'','api.php','',NULL,NULL),(116,'','api.php','',NULL,NULL),(117,'','composer.json','',NULL,NULL),(118,'','composer.lock','',NULL,NULL),(119,'','api.php','',NULL,NULL),(120,'','api.php','',NULL,NULL),(121,'','composer.json','',NULL,NULL),(122,'','composer.lock','',NULL,NULL),(123,'','api.php','',NULL,NULL),(124,'','api.php','',NULL,NULL),(125,'','composer.json','',NULL,NULL),(126,'','composer.lock','',NULL,NULL),(127,'','api.php','',NULL,NULL),(128,'','api.php','',NULL,NULL),(129,'','api.php','',NULL,NULL),(130,'','api.php','',NULL,NULL),(131,'','composer.json','',NULL,NULL),(132,'','App.php','',NULL,NULL),(133,'','composer.lock','',NULL,NULL),(134,'','CallableResolver.php','',NULL,NULL),(135,'','api.php','',NULL,NULL),(136,'','api.php','',NULL,NULL),(137,'','api.php','',NULL,NULL),(138,'','api.php','',NULL,NULL),(139,'','composer.json','',NULL,NULL),(140,'','App.php','',NULL,NULL),(141,'','composer.lock','',NULL,NULL),(142,'','CallableResolver.php','',NULL,NULL),(143,'','api.php','',NULL,NULL),(144,'','api.php','',NULL,NULL),(145,'','api.php','',NULL,NULL),(146,'','api.php','',NULL,NULL),(147,'','composer.json','',NULL,NULL),(148,'','App.php','',NULL,NULL),(149,'','composer.lock','',NULL,NULL),(150,'','CallableResolver.php','',NULL,NULL),(151,'','api.php','',NULL,NULL),(152,'','api.php','',NULL,NULL),(153,'','api.php','',NULL,NULL),(154,'','api.php','',NULL,NULL),(155,'','composer.json','',NULL,NULL),(156,'','App.php','',NULL,NULL),(157,'','composer.lock','',NULL,NULL),(158,'','CallableResolver.php','',NULL,NULL),(159,'','api.php','',NULL,NULL),(160,'','api.php','',NULL,NULL),(161,'','App.php','',NULL,NULL),(162,'','CallableResolver.php','',NULL,NULL),(163,'','api.php','',NULL,NULL),(164,'','api.php','',NULL,NULL),(165,'','App.php','',NULL,NULL),(166,'','CallableResolver.php','',NULL,NULL),(167,'','api.php','',NULL,NULL),(168,'','api.php','',NULL,NULL),(169,'','App.php','',NULL,NULL),(170,'','CallableResolver.php','',NULL,NULL),(171,'','api.php','',NULL,NULL),(172,'','api.php','',NULL,NULL),(173,'','App.php','',NULL,NULL),(174,'','CallableResolver.php','',NULL,NULL),(175,'','api.php','',NULL,NULL),(176,'','api.php','',NULL,NULL),(177,'','App.php','',NULL,NULL),(178,'','CallableResolver.php','',NULL,NULL),(179,'','api.php','',NULL,NULL),(180,'','api.php','',NULL,NULL),(181,'','App.php','',NULL,NULL),(182,'','CallableResolver.php','',NULL,NULL),(183,'','api.php','',NULL,NULL),(184,'','api.php','',NULL,NULL),(185,'','App.php','',NULL,NULL),(186,'','CallableResolver.php','',NULL,NULL),(187,'','api.php','',NULL,NULL),(188,'','api.php','',NULL,NULL),(189,'','App.php','',NULL,NULL),(190,'','CallableResolver.php','',NULL,NULL),(191,'','api.php','',NULL,NULL),(192,'','api.php','',NULL,NULL),(193,'','App.php','',NULL,NULL),(194,'','CallableResolver.php','',NULL,NULL),(195,'','api.php','',NULL,NULL),(196,'','api.php','',NULL,NULL),(197,'','App.php','',NULL,NULL),(198,'','CallableResolver.php','',NULL,NULL),(199,'','api.php','',NULL,NULL),(200,'','api.php','',NULL,NULL),(201,'','App.php','',NULL,NULL),(202,'','CallableResolver.php','',NULL,NULL),(203,'','api.php','',NULL,NULL),(204,'','api.php','',NULL,NULL),(205,'','App.php','',NULL,NULL),(206,'','CallableResolver.php','',NULL,NULL),(207,'','api.php','',NULL,NULL),(208,'','api.php','',NULL,NULL),(209,'','App.php','',NULL,NULL),(210,'','CallableResolver.php','',NULL,NULL),(211,'','api.php','',NULL,NULL),(212,'','api.php','',NULL,NULL),(213,'','App.php','',NULL,NULL),(214,'','CallableResolver.php','',NULL,NULL),(215,'','api.php','',NULL,NULL),(216,'','api.php','',NULL,NULL),(217,'','App.php','',NULL,NULL),(218,'','CallableResolver.php','',NULL,NULL),(219,'','api.php','',NULL,NULL),(220,'','api.php','',NULL,NULL),(221,'','App.php','',NULL,NULL),(222,'','CallableResolver.php','',NULL,NULL),(223,'','api.php','',NULL,NULL),(224,'','api.php','',NULL,NULL),(225,'','App.php','',NULL,NULL),(226,'','CallableResolver.php','',NULL,NULL),(227,'','api.php','',NULL,NULL),(228,'','api.php','',NULL,NULL),(229,'','App.php','',NULL,NULL),(230,'','CallableResolver.php','',NULL,NULL),(231,'','api.php','',NULL,NULL),(232,'','api.php','',NULL,NULL),(233,'','App.php','',NULL,NULL),(234,'','CallableResolver.php','',NULL,NULL),(235,'','api.php','',NULL,NULL),(236,'','api.php','',NULL,NULL),(237,'','App.php','',NULL,NULL),(238,'','CallableResolver.php','',NULL,NULL),(239,'','api.php','',NULL,NULL),(240,'','api.php','',NULL,NULL),(241,'','App.php','',NULL,NULL),(242,'','CallableResolver.php','',NULL,NULL),(243,'','api.php','',NULL,NULL),(244,'','api.php','',NULL,NULL),(245,'','App.php','',NULL,NULL),(246,'','CallableResolver.php','',NULL,NULL),(247,'','api.php','',NULL,NULL),(248,'','api.php','',NULL,NULL),(249,'','App.php','',NULL,NULL),(250,'','CallableResolver.php','',NULL,NULL),(251,'','api.php','',NULL,NULL),(252,'','api.php','',NULL,NULL),(253,'','App.php','',NULL,NULL),(254,'','CallableResolver.php','',NULL,NULL),(255,'','api.php','',NULL,NULL),(256,'','api.php','',NULL,NULL),(257,'','App.php','',NULL,NULL),(258,'','CallableResolver.php','',NULL,NULL),(259,'','api.php','',NULL,NULL),(260,'','api.php','',NULL,NULL),(261,'','App.php','',NULL,NULL),(262,'','CallableResolver.php','',NULL,NULL),(263,'','api.php','',NULL,NULL),(264,'','api.php','',NULL,NULL),(265,'','App.php','',NULL,NULL),(266,'','CallableResolver.php','',NULL,NULL),(267,'','api.php','',NULL,NULL),(268,'','api.php','',NULL,NULL),(269,'','App.php','',NULL,NULL),(270,'','CallableResolver.php','',NULL,NULL),(271,'','api.php','',NULL,NULL),(272,'','api.php','',NULL,NULL),(273,'','App.php','',NULL,NULL),(274,'','CallableResolver.php','',NULL,NULL),(275,'','api.php','',NULL,NULL),(276,'','api.php','',NULL,NULL),(277,'','App.php','',NULL,NULL),(278,'','CallableResolver.php','',NULL,NULL),(279,'','api.php','',NULL,NULL),(280,'','api.php','',NULL,NULL),(281,'','App.php','',NULL,NULL),(282,'','CallableResolver.php','',NULL,NULL),(283,'','api.php','',NULL,NULL),(284,'','api.php','',NULL,NULL),(285,'','App.php','',NULL,NULL),(286,'','CallableResolver.php','',NULL,NULL),(287,'','api.php','',NULL,NULL),(288,'','api.php','',NULL,NULL),(289,'','App.php','',NULL,NULL),(290,'','CallableResolver.php','',NULL,NULL),(291,'','api.php','',NULL,NULL),(292,'','api.php','',NULL,NULL),(293,'','App.php','',NULL,NULL),(294,'','CallableResolver.php','',NULL,NULL),(295,'','api.php','',NULL,NULL),(296,'','api.php','',NULL,NULL),(297,'','App.php','',NULL,NULL),(298,'','CallableResolver.php','',NULL,NULL),(299,'','api.php','',NULL,NULL),(300,'','api.php','',NULL,NULL),(301,'','App.php','',NULL,NULL),(302,'','CallableResolver.php','',NULL,NULL),(303,'','api.php','',NULL,NULL),(304,'','api.php','',NULL,NULL),(305,'','App.php','',NULL,NULL),(306,'','CallableResolver.php','',NULL,NULL),(307,'','api.php','',NULL,NULL),(308,'','api.php','',NULL,NULL),(309,'','App.php','',NULL,NULL),(310,'','CallableResolver.php','',NULL,NULL),(311,'','api.php','',NULL,NULL),(312,'','api.php','',NULL,NULL),(313,'','App.php','',NULL,NULL),(314,'','CallableResolver.php','',NULL,NULL),(315,'','api.php','',NULL,NULL),(316,'','api.php','',NULL,NULL),(317,'','App.php','',NULL,NULL),(318,'','CallableResolver.php','',NULL,NULL),(319,'','api.php','',NULL,NULL),(320,'','api.php','',NULL,NULL),(321,'','App.php','',NULL,NULL),(322,'','CallableResolver.php','',NULL,NULL),(323,'','api.php','',NULL,NULL),(324,'','api.php','',NULL,NULL),(325,'','App.php','',NULL,NULL),(326,'','CallableResolver.php','',NULL,NULL),(327,'','api.php','',NULL,NULL),(328,'','api.php','',NULL,NULL),(329,'','App.php','',NULL,NULL),(330,'','CallableResolver.php','',NULL,NULL),(331,'','api.php','',NULL,NULL),(332,'','api.php','',NULL,NULL),(333,'','App.php','',NULL,NULL),(334,'','CallableResolver.php','',NULL,NULL),(335,'','api.php','',NULL,NULL),(336,'','api.php','',NULL,NULL),(337,'','App.php','',NULL,NULL),(338,'','CallableResolver.php','',NULL,NULL),(339,'','api.php','',NULL,NULL),(340,'','api.php','',NULL,NULL),(341,'','App.php','',NULL,NULL),(342,'','CallableResolver.php','',NULL,NULL),(343,'','api.php','',NULL,NULL),(344,'','api.php','',NULL,NULL),(345,'','App.php','',NULL,NULL),(346,'','CallableResolver.php','',NULL,NULL),(347,'','api.php','',NULL,NULL),(348,'','api.php','',NULL,NULL),(349,'','App.php','',NULL,NULL),(350,'','CallableResolver.php','',NULL,NULL),(351,'','api.php','',NULL,NULL),(352,'','api.php','',NULL,NULL),(353,'','App.php','',NULL,NULL),(354,'','CallableResolver.php','',NULL,NULL),(355,'','api.php','',NULL,NULL),(356,'','api.php','',NULL,NULL),(357,'','App.php','',NULL,NULL),(358,'','CallableResolver.php','',NULL,NULL),(359,'','api.php','',NULL,NULL),(360,'','api.php','',NULL,NULL),(361,'','App.php','',NULL,NULL),(362,'','CallableResolver.php','',NULL,NULL),(363,'','api.php','',NULL,NULL),(364,'','api.php','',NULL,NULL),(365,'','App.php','',NULL,NULL),(366,'','CallableResolver.php','',NULL,NULL),(367,'','api.php','',NULL,NULL),(368,'','api.php','',NULL,NULL),(369,'','App.php','',NULL,NULL),(370,'','CallableResolver.php','',NULL,NULL),(371,'','api.php','',NULL,NULL),(372,'','api.php','',NULL,NULL),(373,'','App.php','',NULL,NULL),(374,'','CallableResolver.php','',NULL,NULL),(375,'','api.php','',NULL,NULL),(376,'','api.php','',NULL,NULL),(377,'','App.php','',NULL,NULL),(378,'','CallableResolver.php','',NULL,NULL),(379,'','api.php','',NULL,NULL),(380,'','api.php','',NULL,NULL),(381,'','App.php','',NULL,NULL),(382,'','CallableResolver.php','',NULL,NULL),(383,'','api.php','',NULL,NULL),(384,'','api.php','',NULL,NULL),(385,'','App.php','',NULL,NULL),(386,'','CallableResolver.php','',NULL,NULL),(387,'','api.php','',NULL,NULL),(388,'','api.php','',NULL,NULL),(389,'','App.php','',NULL,NULL),(390,'','CallableResolver.php','',NULL,NULL),(391,'','api.php','',NULL,NULL),(392,'','api.php','',NULL,NULL),(393,'','App.php','',NULL,NULL),(394,'','CallableResolver.php','',NULL,NULL),(395,'','api.php','',NULL,NULL),(396,'','api.php','',NULL,NULL),(397,'','App.php','',NULL,NULL),(398,'','CallableResolver.php','',NULL,NULL),(399,'','api.php','',NULL,NULL),(400,'','api.php','',NULL,NULL),(401,'','App.php','',NULL,NULL),(402,'','CallableResolver.php','',NULL,NULL),(403,'','api.php','',NULL,NULL),(404,'','api.php','',NULL,NULL),(405,'','App.php','',NULL,NULL),(406,'','CallableResolver.php','',NULL,NULL),(407,'','api.php','',NULL,NULL),(408,'','api.php','',NULL,NULL),(409,'','App.php','',NULL,NULL),(410,'','CallableResolver.php','',NULL,NULL),(411,'','api.php','',NULL,NULL),(412,'','api.php','',NULL,NULL),(413,'','App.php','',NULL,NULL),(414,'','CallableResolver.php','',NULL,NULL),(415,'','api.php','',NULL,NULL),(416,'','api.php','',NULL,NULL),(417,'','App.php','',NULL,NULL),(418,'','CallableResolver.php','',NULL,NULL),(419,'','api.php','',NULL,NULL),(420,'','api.php','',NULL,NULL),(421,'','App.php','',NULL,NULL),(422,'','CallableResolver.php','',NULL,NULL),(423,'','api.php','',NULL,NULL),(424,'','api.php','',NULL,NULL),(425,'','App.php','',NULL,NULL),(426,'','CallableResolver.php','',NULL,NULL),(427,'','api.php','',NULL,NULL),(428,'','api.php','',NULL,NULL),(429,'','App.php','',NULL,NULL),(430,'','CallableResolver.php','',NULL,NULL),(431,'','api.php','',NULL,NULL),(432,'','api.php','',NULL,NULL),(433,'','App.php','',NULL,NULL),(434,'','CallableResolver.php','',NULL,NULL),(435,'','api.php','',NULL,NULL),(436,'','api.php','',NULL,NULL),(437,'','App.php','',NULL,NULL),(438,'','CallableResolver.php','',NULL,NULL),(439,'','api.php','',NULL,NULL),(440,'','api.php','',NULL,NULL),(441,'','App.php','',NULL,NULL),(442,'','CallableResolver.php','',NULL,NULL),(443,'','api.php','',NULL,NULL),(444,'','api.php','',NULL,NULL),(445,'','App.php','',NULL,NULL),(446,'','CallableResolver.php','',NULL,NULL),(447,'','api.php','',NULL,NULL),(448,'','api.php','',NULL,NULL),(449,'','App.php','',NULL,NULL),(450,'','CallableResolver.php','',NULL,NULL),(451,'','api.php','',NULL,NULL),(452,'','api.php','',NULL,NULL),(453,'','App.php','',NULL,NULL),(454,'','CallableResolver.php','',NULL,NULL),(455,'','api.php','',NULL,NULL),(456,'','api.php','',NULL,NULL),(457,'','App.php','',NULL,NULL),(458,'','CallableResolver.php','',NULL,NULL),(459,'','api.php','',NULL,NULL),(460,'','api.php','',NULL,NULL),(461,'','App.php','',NULL,NULL),(462,'','CallableResolver.php','',NULL,NULL),(463,'','api.php','',NULL,NULL),(464,'','api.php','',NULL,NULL),(465,'','App.php','',NULL,NULL),(466,'','CallableResolver.php','',NULL,NULL),(467,'','api.php','',NULL,NULL),(468,'','api.php','',NULL,NULL),(469,'','App.php','',NULL,NULL),(470,'','CallableResolver.php','',NULL,NULL),(471,'','api.php','',NULL,NULL),(472,'','api.php','',NULL,NULL),(473,'','App.php','',NULL,NULL),(474,'','CallableResolver.php','',NULL,NULL),(475,'','api.php','',NULL,NULL),(476,'','api.php','',NULL,NULL),(477,'','App.php','',NULL,NULL),(478,'','CallableResolver.php','',NULL,NULL),(479,'','api.php','',NULL,NULL),(480,'','api.php','',NULL,NULL),(481,'','App.php','',NULL,NULL),(482,'','CallableResolver.php','',NULL,NULL),(483,'','api.php','',NULL,NULL),(484,'','api.php','',NULL,NULL),(485,'','App.php','',NULL,NULL),(486,'','CallableResolver.php','',NULL,NULL),(487,'','api.php','',NULL,NULL),(488,'','api.php','',NULL,NULL),(489,'','App.php','',NULL,NULL),(490,'','CallableResolver.php','',NULL,NULL),(491,'','api.php','',NULL,NULL),(492,'','api.php','',NULL,NULL),(493,'','App.php','',NULL,NULL),(494,'','CallableResolver.php','',NULL,NULL),(495,'','api.php','',NULL,NULL),(496,'','api.php','',NULL,NULL),(497,'','App.php','',NULL,NULL),(498,'','CallableResolver.php','',NULL,NULL),(499,'','api.php','',NULL,NULL),(500,'','api.php','',NULL,NULL),(501,'','App.php','',NULL,NULL),(502,'','CallableResolver.php','',NULL,NULL),(503,'','api.php','',NULL,NULL),(504,'','api.php','',NULL,NULL),(505,'','App.php','',NULL,NULL),(506,'','CallableResolver.php','',NULL,NULL),(507,'','api.php','',NULL,NULL),(508,'','api.php','',NULL,NULL),(509,'','App.php','',NULL,NULL),(510,'','CallableResolver.php','',NULL,NULL),(511,'','api.php','',NULL,NULL),(512,'','api.php','',NULL,NULL),(513,'','App.php','',NULL,NULL),(514,'','CallableResolver.php','',NULL,NULL),(515,'','api.php','',NULL,NULL),(516,'','api.php','',NULL,NULL),(517,'','App.php','',NULL,NULL),(518,'','CallableResolver.php','',NULL,NULL),(519,'','api.php','',NULL,NULL),(520,'','api.php','',NULL,NULL),(521,'','App.php','',NULL,NULL),(522,'','CallableResolver.php','',NULL,NULL),(523,'','api.php','',NULL,NULL),(524,'','api.php','',NULL,NULL),(525,'','App.php','',NULL,NULL),(526,'','CallableResolver.php','',NULL,NULL),(527,'','api.php','',NULL,NULL),(528,'','api.php','',NULL,NULL),(529,'','App.php','',NULL,NULL),(530,'','CallableResolver.php','',NULL,NULL),(531,'','api.php','',NULL,NULL),(532,'','api.php','',NULL,NULL),(533,'','App.php','',NULL,NULL),(534,'','CallableResolver.php','',NULL,NULL),(535,'','api.php','',NULL,NULL),(536,'','api.php','',NULL,NULL),(537,'','App.php','',NULL,NULL),(538,'','CallableResolver.php','',NULL,NULL),(539,'','api.php','',NULL,NULL),(540,'','api.php','',NULL,NULL),(541,'','App.php','',NULL,NULL),(542,'','CallableResolver.php','',NULL,NULL),(543,'','api.php','',NULL,NULL),(544,'','api.php','',NULL,NULL),(545,'','App.php','',NULL,NULL),(546,'','CallableResolver.php','',NULL,NULL),(547,'','api.php','',NULL,NULL),(548,'','api.php','',NULL,NULL),(549,'','App.php','',NULL,NULL),(550,'','CallableResolver.php','',NULL,NULL),(551,'','api.php','',NULL,NULL),(552,'','api.php','',NULL,NULL),(553,'','App.php','',NULL,NULL),(554,'','CallableResolver.php','',NULL,NULL),(555,'','api.php','',NULL,NULL),(556,'','api.php','',NULL,NULL),(557,'','App.php','',NULL,NULL),(558,'','CallableResolver.php','',NULL,NULL),(559,'','api.php','',NULL,NULL),(560,'','api.php','',NULL,NULL),(561,'','App.php','',NULL,NULL),(562,'','CallableResolver.php','',NULL,NULL),(563,'','api.php','',NULL,NULL),(564,'','api.php','',NULL,NULL),(565,'','App.php','',NULL,NULL),(566,'','CallableResolver.php','',NULL,NULL),(567,'','api.php','',NULL,NULL),(568,'','api.php','',NULL,NULL),(569,'','App.php','',NULL,NULL),(570,'','CallableResolver.php','',NULL,NULL),(571,'','api.php','',NULL,NULL),(572,'','api.php','',NULL,NULL),(573,'','App.php','',NULL,NULL),(574,'','CallableResolver.php','',NULL,NULL),(575,'','api.php','',NULL,NULL),(576,'','api.php','',NULL,NULL),(577,'','App.php','',NULL,NULL),(578,'','CallableResolver.php','',NULL,NULL),(579,'','api.php','',NULL,NULL),(580,'','api.php','',NULL,NULL),(581,'','App.php','',NULL,NULL),(582,'','CallableResolver.php','',NULL,NULL),(583,'','api.php','',NULL,NULL),(584,'','api.php','',NULL,NULL),(585,'','App.php','',NULL,NULL),(586,'','CallableResolver.php','',NULL,NULL),(587,'','api.php','',NULL,NULL),(588,'','api.php','',NULL,NULL),(589,'','App.php','',NULL,NULL),(590,'','CallableResolver.php','',NULL,NULL),(591,'','api.php','',NULL,NULL),(592,'','api.php','',NULL,NULL),(593,'','App.php','',NULL,NULL),(594,'','CallableResolver.php','',NULL,NULL),(595,'','api.php','',NULL,NULL),(596,'','api.php','',NULL,NULL),(597,'','App.php','',NULL,NULL),(598,'','CallableResolver.php','',NULL,NULL),(599,'','api.php','',NULL,NULL),(600,'','api.php','',NULL,NULL),(601,'','App.php','',NULL,NULL),(602,'','CallableResolver.php','',NULL,NULL),(603,'','api.php','',NULL,NULL),(604,'','api.php','',NULL,NULL),(605,'','App.php','',NULL,NULL),(606,'','CallableResolver.php','',NULL,NULL),(607,'','api.php','',NULL,NULL),(608,'','api.php','',NULL,NULL),(609,'','App.php','',NULL,NULL),(610,'','CallableResolver.php','',NULL,NULL),(611,'','api.php','',NULL,NULL),(612,'','api.php','',NULL,NULL),(613,'','App.php','',NULL,NULL),(614,'','CallableResolver.php','',NULL,NULL),(615,'','api.php','',NULL,NULL),(616,'','api.php','',NULL,NULL),(617,'','App.php','',NULL,NULL),(618,'','CallableResolver.php','',NULL,NULL),(619,'','api.php','',NULL,NULL),(620,'','api.php','',NULL,NULL),(621,'','App.php','',NULL,NULL),(622,'','CallableResolver.php','',NULL,NULL),(623,'','Container.php','',NULL,NULL),(626,'','dbManager.inc','',NULL,NULL),(627,'','dbTable.inc','',NULL,NULL),(628,'','logger.inc','',NULL,NULL),(629,'','Middleware.inc','',NULL,NULL),(630,'','mysql_create','',NULL,NULL),(633,'','dbManager.inc','',NULL,NULL),(634,'','Middleware.inc','',NULL,NULL),(635,'','mysql_create','',NULL,NULL),(636,'','tabCustomers.inc','',NULL,NULL),(637,'','logger.inc','',NULL,NULL),(638,'','Middleware.inc','',NULL,NULL),(639,'','mysql_create','',NULL,NULL),(640,'','Ares.inc','',NULL,NULL),(642,'','dbManager.inc','',NULL,NULL),(644,'','tabOffers.inc','',NULL,NULL),(645,'','tabOrders.inc','',NULL,NULL),(648,'','tabOffers.inc','',NULL,NULL),(649,'','tabOrders.inc','',NULL,NULL),(650,'','tabOffers.inc','',NULL,NULL),(651,'','tabDocType.inc','',NULL,NULL),(652,'','Ares.inc','',NULL,NULL),(653,'','dbManager.inc','',NULL,NULL),(654,'','logger.inc','',NULL,NULL),(655,'','Ares.inc','',NULL,NULL),(656,'','Ares.inc','',NULL,NULL),(657,'','aresMF.inc','',NULL,NULL),(658,'','dbManager.inc','',NULL,NULL),(659,'','dbTable.inc','',NULL,NULL),(660,'','tabCustomers.inc','',NULL,NULL),(661,'','tabDocType.inc','',NULL,NULL),(662,'','d3dcompiler_47.dll','',NULL,NULL),(663,'','eventlog_provider.dll','',NULL,NULL),(664,'','LICENSE.md','',NULL,'847f48b2707e0d05.md'),(665,'','LICENSE.md','',NULL,'75fa214a284117fa.md'),(666,'','composer.json','',NULL,'b2100d84134f5eb4.json'),(667,'','composer.lock','',NULL,'d139b524a1d09399.lock'),(668,'','composer.json','',NULL,'b29442cf5b822be3.json'),(669,'','composer.json','',NULL,'38a64d5620b2ce02.json'),(670,'','composer.phar','',NULL,'51a3b8a11c7f325f.phar'),(671,'','customers.php','',NULL,'0d17312ac62e2d2d.php'),(672,'','files.php','',NULL,'dce9072711edeec9.php'),(673,'','doctype.php','',NULL,'3edf8689236cfd12.php'),(674,'','customers.php','',NULL,'6c5226a0e570f74c.php'),(675,'','doctype.php','',NULL,'adde5a47d2866e21.php'),(676,'','wlf_plyn_teplota.sql','',NULL,'a603573f5c657091.sql'),(677,'','TNod-1.6.4-final-setup.rar','',NULL,'3078b1b6cad10cf9.rar'),(678,'','Dump20180522.sql','',NULL,'8381a32f4e1492c7.sql'),(679,'','Dump20180603.sql','',NULL,'bc98341aaaf7b9a5.sql'),(680,'','Dump20180531.sql','',NULL,'6d8e0018a174e998.sql'),(681,'','wlf_plyn_teplota.sql','',NULL,'327c45308634bf77.sql'),(683,'','wlf_plyn_teplota.sql','',NULL,'4ec62ae8c1c51de2.sql'),(684,'','wlf_plyn_teplota.sql','',NULL,'e0ab29e524c73b5b.sql'),(685,'','wlf_plyn_teplota.sql','',NULL,'4631be6d07ba33d3.sql'),(686,'','cAlgo.API.dll','',NULL,'12d37b1472bfcaf4.dll'),(687,'','cAlgo.API.xml','',NULL,'3b7d815d13797b45.xml'),(688,'','','',NULL,NULL),(689,'','','',NULL,NULL),(690,'','','',NULL,NULL),(691,'','','',NULL,NULL),(692,'','','',NULL,NULL),(693,'','','',NULL,NULL),(694,'','','',NULL,NULL),(695,'','','',NULL,NULL),(696,'','','',NULL,NULL),(697,'','','',NULL,NULL),(698,'','','',NULL,NULL),(699,'','','',NULL,NULL),(700,'','','',NULL,NULL),(701,'','','',NULL,NULL),(702,'','','',NULL,NULL),(703,'','','',NULL,'Journal-2017-04.txt'),(704,'','','',NULL,'Journal-2017-05.txt'),(705,'','','',NULL,'Journal-2017-04.txt'),(706,'','77a46e7589adffc0.txt','',NULL,'Journal-2017-04.txt'),(707,'','bf5dd4b8d05b2e4b.txt','',NULL,'Journal-2017-04.txt'),(708,'','d6ab973a219ffcbe.txt','',NULL,'Journal-2017-05.txt'),(709,'','7c0bab785094f672.txt','',NULL,'Journal-2017-04.txt'),(710,'','Journal-2017-04.txt','',NULL,'19d9a2faecf824e1.txt'),(711,'','Journal-2017-05.txt','',NULL,'0e4010e1aa886098.txt'),(712,'','Journal-2017-04.txt','',NULL,'ae926fae67c69f88.txt'),(713,'','Journal-2017-04.txt','',NULL,'4d525c37da676feb.txt'),(714,'','debug.log','',NULL,'0c0bfa6ff9515a27.log'),(715,'','customers (1).php','',NULL,'64d8915757dfaca4.php'),(716,'','customers (2).php','',NULL,'2d7b477aa131b28e.php'),(717,'','customers.php','',NULL,'dd2f2d70bbfaf1b3.php'),(718,'','customers (1).php','',NULL,'6b9bd19893ab7979.php'),(719,'','doctype.php','',NULL,'7b70849274510804.php'),(720,'','doctype (1).php','',NULL,'54d68cb132f63705.php'),(721,'','Download (1).xlsx','',NULL,'ceeb29b43d6f1060.xlsx'),(722,'','doctype.php','',NULL,'773fce7a0152f9ff.php'),(723,'','testTabDocuments.json','',NULL,'ce434a3191403dad.json'),(724,'','testTabDocuments.json','',NULL,'e15399bea3e619bd.json'),(725,'','README.txt','',NULL,'079fa328ad400493.txt'),(726,'','CHANGES.txt','',NULL,'f0b47f62d45dd77c.txt'),(727,'','LICENSE.txt','',NULL,'3da97c79e77cacae.txt'),(728,'','CHANGES.txt','',NULL,'7f675d305bdb6542.txt'),(729,'','LICENSE.txt','',NULL,'d16b790ec63a07a0.txt'),(730,'','LICENSE.txt','',NULL,'120ea28062c16318.txt'),(731,'','CHANGES.txt','',NULL,'997ea5cfec951aa4.txt'),(732,'','LICENSE.txt','',NULL,'ab162910830cb297.txt'),(733,'','doctype.csv','',NULL,'c0b026524dbb1ff0.csv'),(734,'','customers (1).php','',NULL,'71c648e5c04393b9.php'),(735,'','customers (2).php','',NULL,'78f46ba0fcfe3837.php'),(736,'','doctype (3).php','',NULL,'a7386d641afe44fe.php'),(737,'','customers.php','',NULL,'f53df4a63e788a07.php'),(738,'','doctype.php','',NULL,'2377f779a407b5cf.php'),(739,'','doctype (1).php','',NULL,'b6f9e703768432eb.php'),(740,'','doctype (2).php','',NULL,'a2c3b38895f7536c.php'),(741,'','doctype (4).php','',NULL,'7fb9bf3e6623d600.php'),(742,'','customers (1).php','',NULL,'247aa364d9c2ff8c.php'),(743,'','CHANGES.txt','',NULL,'9c6610d3d84b2b8b.txt'),(744,'','LICENSE.txt','',NULL,'730d1289a286c27d.txt'),(745,'','LICENSE.txt','',NULL,'f98a3f440f15c5d6.txt'),(746,'','CHANGES.txt','',NULL,'06cfcd3353d6038b.txt');
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
  `json` longtext CHARACTER SET utf8,
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
  `ico` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
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
INSERT INTO `offers` VALUES (201802,'Rekonstrukce','70890692','2018-04-30',NULL,'email','false',NULL,NULL,NULL,0),(201803,'Test','hhhhhh','2018-05-10',NULL,'post','true',NULL,2000000,NULL,0),(201804,'Test2','dddddd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(201811,'test 11','FFFF','2018-06-01',NULL,'post','true',2,1,201801,0),(201812,'test 10','00297488',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(201813,'Rekonstrukce Havířov E1','00297488','2018-06-30',NULL,'post','true',NULL,NULL,201816,0),(201814,'Rekonstrukce','70890692','2018-06-30',NULL,'post','true',NULL,NULL,NULL,0);
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
INSERT INTO `offersdocuments` VALUES (0,0,'R'),(2,2,'2'),(6,6,'6'),(201801,1,''),(201801,4,''),(201801,10,''),(201801,637,''),(201801,638,''),(201801,639,'R'),(201801,640,'S'),(201801,642,'S'),(201801,644,''),(201801,645,''),(201801,648,''),(201801,649,''),(201801,651,'R'),(201803,623,'R'),(201803,626,'S'),(201803,627,'S'),(201803,628,'S'),(201803,629,'S'),(201803,630,'S'),(201804,48,'S'),(201804,49,'R'),(201804,51,'R'),(201804,52,'S'),(201804,53,'S'),(201804,54,'S'),(201804,55,'R'),(201804,56,'R'),(201804,57,'R'),(201804,58,'S'),(201804,59,'R'),(201804,60,'S'),(201804,61,'S'),(201804,62,'S'),(201804,63,'S'),(201804,64,'S'),(201804,65,'S'),(201804,66,'S'),(201804,67,'S'),(201804,68,'S'),(201804,69,'S'),(201804,70,'S'),(201804,71,'R'),(201804,72,'R'),(201804,73,'R'),(201804,74,'R'),(201804,75,'R'),(201804,76,'R'),(201804,77,'R'),(201804,78,'R'),(201804,79,'S'),(201804,80,'S'),(201804,81,'S'),(201804,82,'S'),(201804,83,'S'),(201804,84,'S'),(201804,85,'S'),(201804,86,'S'),(201804,87,'S'),(201804,88,'S'),(201804,89,'S'),(201804,90,'S'),(201804,91,'S'),(201804,92,'S'),(201804,93,'S'),(201804,94,'S'),(201804,95,'R'),(201804,96,'R'),(201804,97,'R'),(201804,98,'R'),(201804,99,'R'),(201804,100,'R'),(201804,101,'R'),(201804,102,'R'),(201804,103,'R'),(201804,104,'R'),(201804,105,'R'),(201804,106,'R'),(201804,107,'R'),(201804,108,'R'),(201804,109,'R'),(201804,110,'R'),(201804,111,'R'),(201804,112,'R'),(201804,113,'R'),(201804,114,'R'),(201804,115,'R'),(201804,116,'R'),(201804,117,'R'),(201804,118,'R'),(201804,119,'R'),(201804,120,'R'),(201804,121,'R'),(201804,122,'R'),(201804,123,'R'),(201804,124,'R'),(201804,125,'R'),(201804,126,'R'),(201804,127,'R'),(201804,128,'S'),(201804,129,'R'),(201804,130,'S'),(201804,131,'R'),(201804,132,'S'),(201804,133,'R'),(201804,134,'S'),(201804,135,'R'),(201804,136,'S'),(201804,137,'R'),(201804,138,'S'),(201804,139,'R'),(201804,140,'S'),(201804,141,'R'),(201804,142,'S'),(201804,143,'R'),(201804,144,'S'),(201804,145,'R'),(201804,146,'S'),(201804,147,'R'),(201804,148,'S'),(201804,149,'R'),(201804,150,'S'),(201804,151,'R'),(201804,152,'S'),(201804,153,'R'),(201804,154,'S'),(201804,155,'R'),(201804,156,'S'),(201804,157,'R'),(201804,158,'S'),(201804,159,'S'),(201804,160,'S'),(201804,161,'S'),(201804,162,'S'),(201804,163,'S'),(201804,164,'S'),(201804,165,'S'),(201804,166,'S'),(201804,167,'S'),(201804,168,'S'),(201804,169,'S'),(201804,170,'S'),(201804,171,'S'),(201804,172,'S'),(201804,173,'S'),(201804,174,'S'),(201804,175,'S'),(201804,176,'S'),(201804,177,'S'),(201804,178,'S'),(201804,179,'S'),(201804,180,'S'),(201804,181,'S'),(201804,182,'S'),(201804,183,'S'),(201804,184,'S'),(201804,185,'S'),(201804,186,'S'),(201804,187,'S'),(201804,188,'S'),(201804,189,'S'),(201804,190,'S'),(201804,191,'S'),(201804,192,'S'),(201804,193,'S'),(201804,194,'S'),(201804,195,'S'),(201804,196,'S'),(201804,197,'S'),(201804,198,'S'),(201804,199,'S'),(201804,200,'S'),(201804,201,'S'),(201804,202,'S'),(201804,203,'S'),(201804,204,'S'),(201804,205,'S'),(201804,206,'S'),(201804,207,'S'),(201804,208,'S'),(201804,209,'S'),(201804,210,'S'),(201804,211,'S'),(201804,212,'S'),(201804,213,'S'),(201804,214,'S'),(201804,215,'S'),(201804,216,'S'),(201804,217,'S'),(201804,218,'S'),(201804,219,'S'),(201804,220,'S'),(201804,221,'S'),(201804,222,'S'),(201804,223,'S'),(201804,224,'S'),(201804,225,'S'),(201804,226,'S'),(201804,227,'S'),(201804,228,'S'),(201804,229,'S'),(201804,230,'S'),(201804,231,'S'),(201804,232,'S'),(201804,233,'S'),(201804,234,'S'),(201804,235,'S'),(201804,236,'S'),(201804,237,'S'),(201804,238,'S'),(201804,239,'S'),(201804,240,'S'),(201804,241,'S'),(201804,242,'S'),(201804,243,'S'),(201804,244,'S'),(201804,245,'S'),(201804,246,'S'),(201804,247,'S'),(201804,248,'S'),(201804,249,'S'),(201804,250,'S'),(201804,251,'S'),(201804,252,'S'),(201804,253,'S'),(201804,254,'S'),(201804,255,'S'),(201804,256,'S'),(201804,257,'S'),(201804,258,'S'),(201804,259,'S'),(201804,260,'S'),(201804,261,'S'),(201804,262,'S'),(201804,263,'S'),(201804,264,'S'),(201804,265,'S'),(201804,266,'S'),(201804,267,'S'),(201804,268,'S'),(201804,269,'S'),(201804,270,'S'),(201804,271,'S'),(201804,272,'S'),(201804,273,'S'),(201804,274,'S'),(201804,275,'S'),(201804,276,'S'),(201804,277,'S'),(201804,278,'S'),(201804,279,'S'),(201804,280,'S'),(201804,281,'S'),(201804,282,'S'),(201804,283,'S'),(201804,284,'S'),(201804,285,'S'),(201804,286,'S'),(201804,287,'S'),(201804,288,'S'),(201804,289,'S'),(201804,290,'S'),(201804,291,'S'),(201804,292,'S'),(201804,293,'S'),(201804,294,'S'),(201804,295,'S'),(201804,296,'S'),(201804,297,'S'),(201804,298,'S'),(201804,299,'S'),(201804,300,'S'),(201804,301,'S'),(201804,302,'S'),(201804,303,'S'),(201804,304,'S'),(201804,305,'S'),(201804,306,'S'),(201804,307,'S'),(201804,308,'S'),(201804,309,'S'),(201804,310,'S'),(201804,311,'S'),(201804,312,'S'),(201804,313,'S'),(201804,314,'S'),(201804,315,'S'),(201804,316,'S'),(201804,317,'S'),(201804,318,'S'),(201804,319,'S'),(201804,320,'S'),(201804,321,'S'),(201804,322,'S'),(201804,323,'S'),(201804,324,'S'),(201804,325,'S'),(201804,326,'S'),(201804,327,'S'),(201804,328,'S'),(201804,329,'S'),(201804,330,'S'),(201804,331,'S'),(201804,332,'S'),(201804,333,'S'),(201804,334,'S'),(201804,335,'S'),(201804,336,'S'),(201804,337,'S'),(201804,338,'S'),(201804,339,'S'),(201804,340,'S'),(201804,341,'S'),(201804,342,'S'),(201804,343,'S'),(201804,344,'S'),(201804,345,'S'),(201804,346,'S'),(201804,347,'S'),(201804,348,'S'),(201804,349,'S'),(201804,350,'S'),(201804,351,'S'),(201804,352,'S'),(201804,353,'S'),(201804,354,'S'),(201804,355,'S'),(201804,356,'S'),(201804,357,'S'),(201804,358,'S'),(201804,359,'S'),(201804,360,'S'),(201804,361,'S'),(201804,362,'S'),(201804,363,'S'),(201804,364,'S'),(201804,365,'S'),(201804,366,'S'),(201804,367,'S'),(201804,368,'S'),(201804,369,'S'),(201804,370,'S'),(201804,371,'S'),(201804,372,'S'),(201804,373,'S'),(201804,374,'S'),(201804,375,'S'),(201804,376,'S'),(201804,377,'S'),(201804,378,'S'),(201804,379,'S'),(201804,380,'S'),(201804,381,'S'),(201804,382,'S'),(201804,383,'S'),(201804,384,'S'),(201804,385,'S'),(201804,386,'S'),(201804,387,'S'),(201804,388,'S'),(201804,389,'S'),(201804,390,'S'),(201804,391,'S'),(201804,392,'S'),(201804,393,'S'),(201804,394,'S'),(201804,395,'S'),(201804,396,'S'),(201804,397,'S'),(201804,398,'S'),(201804,399,'S'),(201804,400,'S'),(201804,401,'S'),(201804,402,'S'),(201804,403,'S'),(201804,404,'S'),(201804,405,'S'),(201804,406,'S'),(201804,407,'S'),(201804,408,'S'),(201804,409,'S'),(201804,410,'S'),(201804,411,'S'),(201804,412,'S'),(201804,413,'S'),(201804,414,'S'),(201804,415,'S'),(201804,416,'S'),(201804,417,'S'),(201804,418,'S'),(201804,419,'S'),(201804,420,'S'),(201804,421,'S'),(201804,422,'S'),(201804,423,'S'),(201804,424,'S'),(201804,425,'S'),(201804,426,'S'),(201804,427,'S'),(201804,428,'S'),(201804,429,'S'),(201804,430,'S'),(201804,431,'S'),(201804,432,'S'),(201804,433,'S'),(201804,434,'S'),(201804,435,'S'),(201804,436,'S'),(201804,437,'S'),(201804,438,'S'),(201804,439,'S'),(201804,440,'S'),(201804,441,'S'),(201804,442,'S'),(201804,443,'S'),(201804,444,'S'),(201804,445,'S'),(201804,446,'S'),(201804,447,'S'),(201804,448,'S'),(201804,449,'S'),(201804,450,'S'),(201804,451,'S'),(201804,452,'S'),(201804,453,'S'),(201804,454,'S'),(201804,455,'S'),(201804,456,'S'),(201804,457,'S'),(201804,458,'S'),(201804,459,'S'),(201804,460,'S'),(201804,461,'S'),(201804,462,'S'),(201804,463,'S'),(201804,464,'S'),(201804,465,'S'),(201804,466,'S'),(201804,467,'S'),(201804,468,'S'),(201804,469,'S'),(201804,470,'S'),(201804,471,'S'),(201804,472,'S'),(201804,473,'S'),(201804,474,'S'),(201804,475,'S'),(201804,476,'S'),(201804,477,'S'),(201804,478,'S'),(201804,479,'S'),(201804,480,'S'),(201804,481,'S'),(201804,482,'S'),(201804,483,'S'),(201804,484,'S'),(201804,485,'S'),(201804,486,'S'),(201804,487,'S'),(201804,488,'S'),(201804,489,'S'),(201804,490,'S'),(201804,491,'S'),(201804,492,'S'),(201804,493,'S'),(201804,494,'S'),(201804,495,'S'),(201804,496,'S'),(201804,497,'S'),(201804,498,'S'),(201804,499,'S'),(201804,500,'S'),(201804,501,'S'),(201804,502,'S'),(201804,503,'S'),(201804,504,'S'),(201804,505,'S'),(201804,506,'S'),(201804,507,'S'),(201804,508,'S'),(201804,509,'S'),(201804,510,'S'),(201804,511,'S'),(201804,512,'S'),(201804,513,'S'),(201804,514,'S'),(201804,515,'S'),(201804,516,'S'),(201804,517,'S'),(201804,518,'S'),(201804,519,'S'),(201804,520,'S'),(201804,521,'S'),(201804,522,'S'),(201804,523,'S'),(201804,524,'S'),(201804,525,'S'),(201804,526,'S'),(201804,527,'S'),(201804,528,'S'),(201804,529,'S'),(201804,530,'S'),(201804,531,'S'),(201804,532,'S'),(201804,533,'S'),(201804,534,'S'),(201804,535,'S'),(201804,536,'S'),(201804,537,'S'),(201804,538,'S'),(201804,539,'S'),(201804,540,'S'),(201804,541,'S'),(201804,542,'S'),(201804,543,'S'),(201804,544,'S'),(201804,545,'S'),(201804,546,'S'),(201804,547,'S'),(201804,548,'S'),(201804,549,'S'),(201804,550,'S'),(201804,551,'S'),(201804,552,'S'),(201804,553,'S'),(201804,554,'S'),(201804,555,'S'),(201804,556,'S'),(201804,557,'S'),(201804,558,'S'),(201804,559,'S'),(201804,560,'S'),(201804,561,'S'),(201804,562,'S'),(201804,563,'S'),(201804,564,'S'),(201804,565,'S'),(201804,566,'S'),(201804,567,'S'),(201804,568,'S'),(201804,569,'S'),(201804,570,'S'),(201804,571,'S'),(201804,572,'S'),(201804,573,'S'),(201804,574,'S'),(201804,575,'S'),(201804,576,'S'),(201804,577,'S'),(201804,578,'S'),(201804,579,'S'),(201804,580,'S'),(201804,581,'S'),(201804,582,'S'),(201804,583,'S'),(201804,584,'S'),(201804,585,'S'),(201804,586,'S'),(201804,587,'S'),(201804,588,'S'),(201804,589,'S'),(201804,590,'S'),(201804,591,'S'),(201804,592,'S'),(201804,593,'S'),(201804,594,'S'),(201804,595,'S'),(201804,596,'S'),(201804,597,'S'),(201804,598,'S'),(201804,599,'S'),(201804,600,'S'),(201804,601,'S'),(201804,602,'S'),(201804,603,'S'),(201804,604,'S'),(201804,605,'S'),(201804,606,'S'),(201804,607,'S'),(201804,608,'S'),(201804,609,'S'),(201804,610,'S'),(201804,611,'S'),(201804,612,'S'),(201804,613,'S'),(201804,614,'S'),(201804,615,'S'),(201804,616,'S'),(201804,617,'S'),(201804,618,'S'),(201804,619,'S'),(201804,620,'S'),(201804,621,'S'),(201804,622,'S'),(201811,633,'R'),(201811,634,'S'),(201811,635,'S'),(201811,636,'S'),(201811,650,''),(201811,669,'R'),(201811,670,'R'),(201811,671,'S'),(201812,676,'S');
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
  `idcenter` varchar(10) COLLATE utf8_czech_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (201701,'Nemocnice Bohumín',NULL,'2018-08-31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'V realizaci'),(201801,'Rekonstrukce','00297488','2018-06-30',NULL,'person','true',NULL,15000000,NULL,100000,50000,1000,0,NULL,'101','V projekci'),(201802,'test 11','00297488','2018-06-01',NULL,'post','true',2,1,NULL,0,0,0,0,NULL,'102','Dokončená v projekci'),(201810,'Název 2','Investor','2018-12-31',NULL,'email','true',0,1000000,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(201811,'test 10','05998468',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL,NULL,NULL),(201812,'test 11','70890692',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL,NULL,NULL),(201813,'test 12','05998468',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL,NULL,NULL),(201814,'Rekonstrukce nádraží Havířov','70994234','2018-12-31',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,NULL),(201815,'Rekonstrukce nádraží Havířov - Etapa 2','70994234','2019-03-31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(201816,'Rekonstrukce Havířov E1','00297488','2018-06-30',NULL,'post','true',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
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
  `ico` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`idorder`,`iddocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdocuments`
--

LOCK TABLES `ordersdocuments` WRITE;
/*!40000 ALTER TABLE `ordersdocuments` DISABLE KEYS */;
INSERT INTO `ordersdocuments` VALUES (201701,715,'P',NULL),(201701,716,'P',NULL),(201701,717,'P',NULL),(201701,719,'P',NULL),(201701,720,'P',NULL),(201701,722,'P',NULL),(201701,732,'F',NULL),(201701,733,'P',NULL),(201701,736,'P',NULL),(201701,739,'P',NULL),(201701,742,'O',NULL),(201701,745,'O','05998468'),(201701,746,'O','47983531'),(201801,656,'P',NULL),(201801,658,'F',NULL),(201801,659,'F',NULL),(201801,661,'O',NULL),(201801,685,'P',NULL),(201801,686,'P',NULL),(201801,687,'P',NULL),(201801,689,'P',NULL),(201802,712,'P',NULL),(201803,662,'O',NULL),(201803,663,'O',NULL),(201813,672,'F',NULL),(201813,673,'F',NULL),(201813,674,'O',NULL),(201813,675,'O',NULL),(201814,678,'P',NULL),(201814,679,'P',NULL),(201814,680,'P',NULL),(201814,681,'F',NULL);
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
  `ico` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`idsub`,`idorder`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderssubs`
--

LOCK TABLES `orderssubs` WRITE;
/*!40000 ALTER TABLE `orderssubs` DISABLE KEYS */;
INSERT INTO `orderssubs` VALUES (1,201801,'47983531'),(2,201801,'05998468'),(3,201801,'00297488'),(4,201801,'76084051'),(5,201801,'47983531'),(6,201802,'47983531'),(7,201802,'76084051'),(8,201802,'76084051'),(9,201803,'47983531'),(10,201803,'76084051'),(11,201803,'47983531'),(12,201804,'47983531'),(13,201803,'47983531'),(14,201803,'76084051'),(15,201813,'47983531'),(19,201812,'47983531'),(20,201812,'76084051'),(22,201813,'76084051'),(23,201812,'05998468'),(24,201814,'76084051'),(25,201814,'47983531'),(26,201701,'47983531'),(27,201701,'76084051'),(28,201701,'05998468'),(29,201701,'47983531'),(30,201701,'05998468'),(34,201701,'47983531');
/*!40000 ALTER TABLE `orderssubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderssubsdetail`
--

DROP TABLE IF EXISTS `orderssubsdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderssubsdetail` (
  `idsubdetail` int(11) NOT NULL AUTO_INCREMENT,
  `idorder` int(11) NOT NULL,
  `idsub` int(11) NOT NULL,
  `taskdate` date DEFAULT NULL,
  `finished` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `invoice` varchar(5) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`idsubdetail`),
  KEY `idorder` (`idorder`,`idsub`,`idsubdetail`),
  KEY `idsub` (`idsub`,`idsubdetail`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderssubsdetail`
--

LOCK TABLES `orderssubsdetail` WRITE;
/*!40000 ALTER TABLE `orderssubsdetail` DISABLE KEYS */;
INSERT INTO `orderssubsdetail` VALUES (1,201813,22,'2018-07-31',NULL,10000,'false'),(23,201801,4,'2018-06-30',NULL,1000,'false'),(24,201801,4,'2018-08-31',NULL,20000,'false'),(25,201813,15,NULL,NULL,25000,NULL),(26,201812,23,'2018-06-30',NULL,2000,NULL),(27,201814,24,'2018-06-30',NULL,50000,NULL),(28,201814,24,'2018-07-31',NULL,50000,NULL),(29,201814,25,'2018-06-30',NULL,1000,NULL),(30,201701,26,'2018-08-31',NULL,1020,'false'),(31,201701,27,'2018-07-31',NULL,20000,'false'),(32,201701,28,'2018-06-01',NULL,1500000,'false'),(33,201701,29,'2018-08-31',NULL,147,'false'),(34,201701,30,'2018-06-14',NULL,500000,'true'),(38,201701,34,'2018-06-27',NULL,100,'false');
/*!40000 ALTER TABLE `orderssubsdetail` ENABLE KEYS */;
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
  `invoice` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`idtask`,`idorder`),
  KEY `idorder` (`idorder`,`taskdate`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstasks`
--

LOCK TABLES `orderstasks` WRITE;
/*!40000 ALTER TABLE `orderstasks` DISABLE KEYS */;
INSERT INTO `orderstasks` VALUES (1,201801,'2018-05-20','Vyjádření RWE',NULL,1000000,'0',NULL),(2,201801,'2018-05-10','Vyjádření čez',NULL,NULL,'0',NULL),(4,201813,'2018-07-31','Fakt 1',NULL,250000,'0',NULL),(5,201801,'2018-08-31','Etapa 1',NULL,50000,'true',NULL),(6,201813,'2018-07-20','Etapa 1',NULL,1000,'0',NULL),(7,201813,'2018-09-03','Etapa 2',NULL,25000,'0',NULL),(8,201814,'2018-07-31','Etapa 1',NULL,300000,'0',NULL),(9,201814,'2018-12-31','Etapa 2',NULL,5000000,'0',NULL),(10,201701,'2018-06-30','Fakt 1',NULL,101,'0',NULL),(11,201701,'2018-06-30','Fakt 2',NULL,3,'0',NULL),(12,201701,'2018-06-15','Fakt 3',NULL,223,'true','Poznámka'),(13,201701,'2018-06-16','Fakt 3',NULL,1000,'false',NULL);
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
INSERT INTO `users` VALUES ('JB','jiri.bonczek@volny.cz','111','Jiří','Bonczek',1,1,'22176d751a6c83b6','2018-06-14 22:29:21'),('LZ','zahradnicek@atris.cz','111','Ladislav','Zahradníček',0,1,'fb80fd91b9b74d1c','2018-06-14 21:36:38');
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
 1 AS `dealtype`,
 1 AS `mobil`,
 1 AS `email`*/;
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
 1 AS `ico`,
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
 1 AS `idcenter`,
 1 AS `status`,
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
 1 AS `price_w`,
 1 AS `price_d`,
 1 AS `price_r`,
 1 AS `archive`,
 1 AS `archiveloc`,
 1 AS `idcenter`,
 1 AS `status`,
 1 AS `idoffer`,
 1 AS `idofferdesc`,
 1 AS `price_s`,
 1 AS `price_s_pl`,
 1 AS `price_c`,
 1 AS `price_c_pl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ordersdocuments`
--

DROP TABLE IF EXISTS `v_ordersdocuments`;
/*!50001 DROP VIEW IF EXISTS `v_ordersdocuments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_ordersdocuments` AS SELECT 
 1 AS `idorder`,
 1 AS `iddocument`,
 1 AS `typeRS`,
 1 AS `ico`,
 1 AS `filename`,
 1 AS `name`*/;
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
 1 AS `price`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orderssubsdetail`
--

DROP TABLE IF EXISTS `v_orderssubsdetail`;
/*!50001 DROP VIEW IF EXISTS `v_orderssubsdetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_orderssubsdetail` AS SELECT 
 1 AS `idsubdetail`,
 1 AS `idorder`,
 1 AS `idsub`,
 1 AS `taskdate`,
 1 AS `finished`,
 1 AS `price`,
 1 AS `invoice`,
 1 AS `ico`,
 1 AS `name`,
 1 AS `mobil`,
 1 AS `email`*/;
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
 1 AS `invoice`,
 1 AS `note`,
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
 1 AS `dealtype`,
 1 AS `mobil`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'nz_db'
--

--
-- Dumping routines for database 'nz_db'
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
/*!50001 VIEW `v_customers` AS select `customers`.`ico` AS `ico`,`customers`.`name` AS `name`,`customers`.`profession` AS `profession`,`customers`.`address` AS `address`,`customers`.`sub` AS `sub`,`customers`.`dealtype` AS `dealtype`,`customers`.`mobil` AS `mobil`,`customers`.`email` AS `email` from `customers` where isnull(`customers`.`sub`) */;
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
/*!50001 VIEW `v_offers` AS select `offers`.`id` AS `id`,`offers`.`name` AS `name`,`offers`.`ico` AS `ico`,`customers`.`name` AS `customer`,`offers`.`processdate` AS `processdate`,`offers`.`processtime` AS `processtime`,`offers`.`deliverytype` AS `deliverytype`,`offers`.`errand` AS `errand`,`offers`.`winprice` AS `winprice`,`offers`.`price` AS `price`,`offers`.`idorder` AS `idorder`,`orders`.`name` AS `nameorder`,`orders`.`archive` AS `archive` from ((`offers` left join `orders` on((`offers`.`idorder` = `orders`.`id`))) left join `customers` on((`offers`.`ico` = `customers`.`ico`))) order by `offers`.`id` */;
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
/*!50001 VIEW `v_orders` AS select `orders`.`id` AS `id`,`orders`.`name` AS `name`,`orders`.`ico` AS `ico`,`customers`.`name` AS `customer`,`orders`.`processdate` AS `processdate`,`orders`.`processtime` AS `processtime`,`orders`.`deliverytype` AS `deliverytype`,`orders`.`errand` AS `errand`,`orders`.`winprice` AS `winprice`,`orders`.`price` AS `price`,`orders`.`idoffer` AS `idoffer`,`orders`.`price_w` AS `price_w`,`orders`.`price_d` AS `price_d`,`orders`.`price_r` AS `price_r`,`orders`.`archive` AS `archive`,`orders`.`archiveloc` AS `archiveloc`,`orders`.`idcenter` AS `idcenter`,`orders`.`status` AS `status`,(select sum(`orderssubsdetail`.`price`) from `orderssubsdetail` where (`orderssubsdetail`.`idorder` = `orders`.`id`)) AS `subs` from (`orders` left join `customers` on((`orders`.`ico` = `customers`.`ico`))) order by `orders`.`id` */;
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
/*!50001 VIEW `v_orders_all` AS select `orders`.`id` AS `id`,`orders`.`name` AS `name`,`orders`.`ico` AS `ico`,`customers`.`name` AS `customer`,`orders`.`processdate` AS `processdate`,`orders`.`processtime` AS `processtime`,`orders`.`deliverytype` AS `deliverytype`,`orders`.`errand` AS `errand`,`orders`.`winprice` AS `winprice`,`orders`.`price` AS `price`,ifnull(`orders`.`price_w`,0) AS `price_w`,ifnull(`orders`.`price_d`,0) AS `price_d`,ifnull(`orders`.`price_r`,0) AS `price_r`,`orders`.`archive` AS `archive`,`orders`.`archiveloc` AS `archiveloc`,`orders`.`idcenter` AS `idcenter`,`orders`.`status` AS `status`,`offers`.`id` AS `idoffer`,`offers`.`name` AS `idofferdesc`,ifnull((select sum(`orderssubsdetail`.`price`) from `orderssubsdetail` where ((`orderssubsdetail`.`idorder` = `orders`.`id`) and (`orderssubsdetail`.`invoice` = 'true'))),0) AS `price_s`,ifnull((select sum(`orderssubsdetail`.`price`) from `orderssubsdetail` where (`orderssubsdetail`.`idorder` = `orders`.`id`)),0) AS `price_s_pl`,ifnull((select sum(`orderstasks`.`price`) from `orderstasks` where ((`orderstasks`.`idorder` = `orders`.`id`) and (`orderstasks`.`invoice` = 'true'))),0) AS `price_c`,ifnull((select sum(`orderstasks`.`price`) from `orderstasks` where (`orderstasks`.`idorder` = `orders`.`id`)),0) AS `price_c_pl` from ((`orders` left join `offers` on((`offers`.`idorder` = `orders`.`id`))) left join `customers` on((`orders`.`ico` = `customers`.`ico`))) order by `orders`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ordersdocuments`
--

/*!50001 DROP VIEW IF EXISTS `v_ordersdocuments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ordersdocuments` AS select `ordersdocuments`.`idorder` AS `idorder`,`ordersdocuments`.`iddocument` AS `iddocument`,`ordersdocuments`.`typeRS` AS `typeRS`,`ordersdocuments`.`ico` AS `ico`,`documents`.`filename` AS `filename`,`customers`.`name` AS `name` from ((`ordersdocuments` join `documents` on((`ordersdocuments`.`iddocument` = `documents`.`id`))) left join `customers` on((`ordersdocuments`.`ico` = `customers`.`ico`))) */;
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
/*!50001 VIEW `v_orderssubs` AS select `orderssubs`.`idsub` AS `idsub`,`orderssubs`.`idorder` AS `idorder`,`orderssubs`.`ico` AS `ico`,(select sum(`orderssubsdetail`.`price`) from `orderssubsdetail` where (`orderssubsdetail`.`idsub` = `orderssubs`.`idsub`)) AS `price`,`customers`.`name` AS `name` from (`orderssubs` join `customers`) where (`orderssubs`.`ico` = `customers`.`ico`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orderssubsdetail`
--

/*!50001 DROP VIEW IF EXISTS `v_orderssubsdetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orderssubsdetail` AS select `orderssubsdetail`.`idsubdetail` AS `idsubdetail`,`orderssubsdetail`.`idorder` AS `idorder`,`orderssubsdetail`.`idsub` AS `idsub`,`orderssubsdetail`.`taskdate` AS `taskdate`,`orderssubsdetail`.`finished` AS `finished`,`orderssubsdetail`.`price` AS `price`,`orderssubsdetail`.`invoice` AS `invoice`,`customers`.`ico` AS `ico`,`customers`.`name` AS `name`,`customers`.`mobil` AS `mobil`,`customers`.`email` AS `email` from ((`orderssubsdetail` join `orderssubs` on((`orderssubsdetail`.`idsub` = `orderssubs`.`idsub`))) join `customers` on((`orderssubs`.`ico` = `customers`.`ico`))) */;
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
/*!50001 VIEW `v_orderstasks` AS select `orderstasks`.`idtask` AS `idtask`,`orderstasks`.`idorder` AS `idorder`,`orderstasks`.`taskdate` AS `taskdate`,`orderstasks`.`taskdesc` AS `taskdesc`,`orderstasks`.`finished` AS `finished`,`orderstasks`.`price` AS `price`,`orderstasks`.`invoice` AS `invoice`,`orderstasks`.`note` AS `note`,`orders`.`name` AS `name` from (`orderstasks` join `orders`) where (`orderstasks`.`idorder` = `orders`.`id`) */;
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
/*!50001 VIEW `v_subcustomers` AS select `customers`.`ico` AS `ico`,`customers`.`name` AS `name`,`customers`.`profession` AS `profession`,`customers`.`address` AS `address`,`customers`.`sub` AS `sub`,`customers`.`dealtype` AS `dealtype`,`customers`.`mobil` AS `mobil`,`customers`.`email` AS `email` from `customers` where (`customers`.`sub` is not null) */;
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

-- Dump completed on 2018-06-14 21:56:33
