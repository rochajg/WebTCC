CREATE DATABASE  IF NOT EXISTS `tcc_ifpa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tcc_ifpa`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tcc_ifpa
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `acompanhamento_tcc`
--

DROP TABLE IF EXISTS `acompanhamento_tcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acompanhamento_tcc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orientador_aluno` int(10) unsigned NOT NULL,
  `data_obs` date NOT NULL,
  `observacao` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orientador_aluno_idx` (`id_orientador_aluno`),
  CONSTRAINT `fk_orientador_aluno` FOREIGN KEY (`id_orientador_aluno`) REFERENCES `orientador_aluno` (`id_orientador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompanhamento_tcc`
--

LOCK TABLES `acompanhamento_tcc` WRITE;
/*!40000 ALTER TABLE `acompanhamento_tcc` DISABLE KEYS */;
INSERT INTO `acompanhamento_tcc` VALUES (1,1,'2018-05-05','teste');
/*!40000 ALTER TABLE `acompanhamento_tcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `matricula` int(12) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `curso` varchar(120) NOT NULL,
  `campus` varchar(45) NOT NULL,
  `turma` varchar(30) NOT NULL,
  `ano_semestre` varchar(6) NOT NULL,
  `titulo_tcc` varchar(200) DEFAULT NULL,
  `senha` varchar(200) NOT NULL,
  PRIMARY KEY (`matricula`,`nome`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (2015790019,'Jordan Gabriel Lameira Rocha','TADS','Belém','C79TP','2017.2',NULL,'202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientador_aluno`
--

DROP TABLE IF EXISTS `orientador_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orientador_aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orientador` int(10) unsigned NOT NULL,
  `id_aluno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_aluno_UNIQUE` (`id_aluno`),
  KEY `fk_id_orientador_idx` (`id_orientador`),
  CONSTRAINT `fk_id_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_orientador` FOREIGN KEY (`id_orientador`) REFERENCES `orientadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientador_aluno`
--

LOCK TABLES `orientador_aluno` WRITE;
/*!40000 ALTER TABLE `orientador_aluno` DISABLE KEYS */;
INSERT INTO `orientador_aluno` VALUES (1,1,2015790019);
/*!40000 ALTER TABLE `orientador_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientadores`
--

DROP TABLE IF EXISTS `orientadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orientadores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `curso` varchar(120) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(200) NOT NULL,
  PRIMARY KEY (`id`,`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientadores`
--

LOCK TABLES `orientadores` WRITE;
/*!40000 ALTER TABLE `orientadores` DISABLE KEYS */;
INSERT INTO `orientadores` VALUES (1,'Marcio Warris','TADS','marcio.warris','202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `orientadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tcc_ifpa'
--

--
-- Dumping routines for database 'tcc_ifpa'
--
/*!50003 DROP PROCEDURE IF EXISTS `addObservacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addObservacao`(IN obs TEXT, IN nomeOrientador varchar(120), IN matAluno INT)
BEGIN
	DECLARE idOrientador INT;
    DECLARE idOriAluno INT;
    
    SELECT id INTO idOrientador FROM orientadores
		WHERE nome=nomeOrientador;
        
	SELECT id INTO idOriAluno FROM orientador_aluno
		WHERE id_orientador=idOrientador AND id_aluno=matAluno;
        
	INSERT INTO acompanhamento_tcc(id_orientador_aluno, data_obs, observacao)
		VALUES(idOriAluno, CURDATE(), obs);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getObservacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getObservacoes`(IN nomeOrientador VARCHAR(120), IN matAluno INT)
BEGIN
	DECLARE idOrientador INT;
    
    SELECT id INTO idOrientador FROM orientadores
		WHERE nome=nomeOrientador;
        
	SELECT * FROM orientador_aluno
		WHERE id_orientador=idOrientador AND id_aluno=matAluno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-05 18:03:37
