CREATE DATABASE  IF NOT EXISTS `autotrasporti` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `autotrasporti`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autotrasporti
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assegnazioni_rimorchi`
--

DROP TABLE IF EXISTS `assegnazioni_rimorchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assegnazioni_rimorchi` (
  `Autista_ID_autista` int NOT NULL,
  `Rimorchio_Targa_r` varchar(255) NOT NULL,
  PRIMARY KEY (`Autista_ID_autista`,`Rimorchio_Targa_r`),
  KEY `fk_Autista_has_Rimorchio_Rimorchio1_idx` (`Rimorchio_Targa_r`),
  KEY `fk_Autista_has_Rimorchio_Autista1_idx` (`Autista_ID_autista`),
  CONSTRAINT `fk_Autista_has_Rimorchio_Autista1` FOREIGN KEY (`Autista_ID_autista`) REFERENCES `autista` (`ID_autista`),
  CONSTRAINT `fk_Autista_has_Rimorchio_Rimorchio1` FOREIGN KEY (`Rimorchio_Targa_r`) REFERENCES `rimorchio` (`Targa_r`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assegnazioni_rimorchi`
--

LOCK TABLES `assegnazioni_rimorchi` WRITE;
/*!40000 ALTER TABLE `assegnazioni_rimorchi` DISABLE KEYS */;
INSERT INTO `assegnazioni_rimorchi` VALUES (1,'XA125EW'),(2,'XA712EW'),(3,'XA734EW'),(4,'XA738EW'),(5,'XA739EW'),(6,'XA740EW'),(7,'XA741EW'),(8,'XA742EW');
/*!40000 ALTER TABLE `assegnazioni_rimorchi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autista`
--

DROP TABLE IF EXISTS `autista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autista` (
  `ID_autista` int NOT NULL COMMENT 'tabella autista',
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `età` int NOT NULL,
  `n_telefono` varchar(45) NOT NULL,
  `giorni_lavoro` int NOT NULL,
  `stipendio_ID_stipendio` int NOT NULL,
  PRIMARY KEY (`ID_autista`),
  UNIQUE KEY `ID_autista_UNIQUE` (`ID_autista`),
  KEY `fk_Autista_stipenedio1_idx` (`stipendio_ID_stipendio`),
  CONSTRAINT `fk_Autista_stipenedio1` FOREIGN KEY (`stipendio_ID_stipendio`) REFERENCES `stipendio` (`ID_stipendio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autista`
--

LOCK TABLES `autista` WRITE;
/*!40000 ALTER TABLE `autista` DISABLE KEYS */;
INSERT INTO `autista` VALUES (1,'Giuseppe','porchetta',45,'789-901-2342',25,1),(2,'Tom','Cruise',24,'012-678-9011',25,2),(3,'cassiopea','armandino',56,'456-123-7895',25,4),(4,'Alfredo ','Pulvirenti',39,'095-7383-082',24,2),(5,'Salvatore','Alaimo',47,'901-345-6787',25,3),(6,'Federica','Biuso',34,'567-890-1238',21,2),(7,'Enzo','calabrese',61,'901-345-6782',23,5),(8,'Simone','Avellino',35,'890-123-4561',4,6);
/*!40000 ALTER TABLE `autista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `autista_BEFORE_INSERT` BEFORE INSERT ON `autista` FOR EACH ROW BEGIN
IF (LENGTH(NEW.n_telefono) <> 12) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero di telefono deve avere 10 cifre';
  END IF;

  IF (NEW.giorni_lavoro > 26) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero massimo di giorni di lavoro è 25';
  END IF;

  IF (NEW.età <= 21) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''età deve essere maggiore di 21';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `autista_BEFORE_UPDATE` BEFORE UPDATE ON `autista` FOR EACH ROW BEGIN
IF (LENGTH(NEW.n_telefono) <> 12) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero di telefono deve avere 10 cifre';
  END IF;

  IF (NEW.giorni_lavoro > 26) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero massimo di giorni di lavoro è 25';
  END IF;

  IF (NEW.età <= 21) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''età deve essere maggiore di 21';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion` (
  `targa_c` varchar(255) NOT NULL COMMENT 'tabella camion',
  `cilindrata` int NOT NULL,
  `modello` varchar(45) NOT NULL,
  `anno` date NOT NULL,
  `assicurazione` varchar(45) NOT NULL,
  `Autista_ID_autista` int NOT NULL,
  PRIMARY KEY (`targa_c`),
  UNIQUE KEY `targa_c_UNIQUE` (`targa_c`),
  KEY `fk_Camion_Autista1_idx` (`Autista_ID_autista`),
  CONSTRAINT `Autista_ID_autista` FOREIGN KEY (`Autista_ID_autista`) REFERENCES `autista` (`ID_autista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion`
--

LOCK TABLES `camion` WRITE;
/*!40000 ALTER TABLE `camion` DISABLE KEYS */;
INSERT INTO `camion` VALUES ('BF124 KL',8213,'scania','2019-08-05','Allianz',8),('BF214CE',7500,'scania','2018-04-28','Allianz',1),('BF243LK',7235,'iveco','2020-04-09','Allianz',7),('BF285LM',8344,'mercedes','2016-12-05','Allianz',5),('BF345NH',9028,'renault','2018-06-23','Allianz',4),('BF524JD',9623,'iveco','2019-08-23','Allianz',3),('BF752HG',7900,'daf','2016-03-07','Allianz',2),('BF982NT',9236,'volvo','2018-07-29','Allianz',6);
/*!40000 ALTER TABLE `camion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `camion_BEFORE_INSERT` BEFORE INSERT ON `camion` FOR EACH ROW BEGIN
IF  (LENGTH(NEW.Targa_c) < 7 OR NOT NEW.Targa_c REGEXP '^BF.*$') THEN
        -- mostrare un messaggio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La targa del trattore deve essere formata da 4 lettere e 3 numeri.';
    END IF;
 -- controllo della compagnia di assicurazione
    IF (NEW.assicurazione != 'Allianz') THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La compagnia di assicurazione deve essere Allianz.';
    END IF;

    -- controllo della cilindrata
    IF (NEW.cilindrata < 7000 OR NEW.cilindrata > 10000) THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cilindrata deve essere compresa tra 7000 e 10000.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `carta_tachigrafo`
--

DROP TABLE IF EXISTS `carta_tachigrafo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carta_tachigrafo` (
  `ID_carta` int NOT NULL COMMENT 'tabella carta_tachigrafo',
  `ore_guida` int NOT NULL,
  `ore_pausa` int NOT NULL,
  `data_scadenza` date NOT NULL,
  `Autista_ID_autista` int NOT NULL,
  PRIMARY KEY (`ID_carta`),
  UNIQUE KEY `ID_carta_UNIQUE` (`ID_carta`),
  KEY `fk_carta_tachigrafo_Autista1_idx` (`Autista_ID_autista`),
  CONSTRAINT `fk_carta_tachigrafo_Autista1` FOREIGN KEY (`Autista_ID_autista`) REFERENCES `autista` (`ID_autista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta_tachigrafo`
--

LOCK TABLES `carta_tachigrafo` WRITE;
/*!40000 ALTER TABLE `carta_tachigrafo` DISABLE KEYS */;
INSERT INTO `carta_tachigrafo` VALUES (1,12,2,'2025-02-12',1),(2,14,4,'2026-04-11',2),(3,11,1,'2024-02-17',3),(4,5,3,'2028-12-06',4),(5,7,2,'2032-09-23',5),(6,2,5,'2029-02-19',6),(7,8,3,'2030-01-01',7),(8,1,2,'2025-02-06',8);
/*!40000 ALTER TABLE `carta_tachigrafo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `carta_tachigrafo_BEFORE_INSERT` BEFORE INSERT ON `carta_tachigrafo` FOR EACH ROW BEGIN
    -- controllo della data di scadenza
    IF (NEW.data_scadenza < CURRENT_DATE) THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La data di scadenza deve essere maggiore della data attuale.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_cliente` int NOT NULL COMMENT 'tabella cliente',
  `nome_azienda` varchar(45) NOT NULL COMMENT 'tabella cliente',
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `n_telefono` varchar(255) NOT NULL,
  `Ufficio_ID_ufficio` int NOT NULL,
  PRIMARY KEY (`ID_cliente`),
  UNIQUE KEY `ID_cliente_UNIQUE` (`ID_cliente`),
  KEY `fk_Cliente_Ufficio_idx` (`Ufficio_ID_ufficio`),
  CONSTRAINT `fk_Cliente_Ufficio` FOREIGN KEY (`Ufficio_ID_ufficio`) REFERENCES `ufficio` (`ID_ufficio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'aricò.srl','franco','aricò','-','890-678-4512',1),(2,'lo faccio.srl','ciccio','lo faccio','-','678-901-2345',2),(3,'mazzarroti e co','antonio','lo dico','-','234-567-8901',3),(4,'piante e erba srl','giuseppe','di maio','-','012-345-6789',6),(5,'bvlgary','mario','caliri','-','789-012-3456',5),(6,'ferrossi spa','achille','lauro','-','567-890-1234',3),(7,'stufati e co','ettore','romano','-','123-456-7890',7),(8,'barchetta spa','clizia','d\'amore','-','456-789-0123',8),(9,'nicolosi spa','eva','canto','-','901-234-5678',8),(10,'miggy spa','matteo','capitale','-','345-678-9012',2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_BEFORE_INSERT` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
-- controllo del numero_t
    IF (LENGTH(NEW.n_telefono) != 12) THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero_t deve essere uguale a 10 cifre numeriche.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comunicazioni`
--

DROP TABLE IF EXISTS `comunicazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunicazioni` (
  `responsabile_logistica_ID_responsabile` int NOT NULL,
  `Ufficio_ID_ufficio` int NOT NULL,
  PRIMARY KEY (`responsabile_logistica_ID_responsabile`,`Ufficio_ID_ufficio`),
  KEY `fk_responsabile_logistica_has_Ufficio_Ufficio1_idx` (`Ufficio_ID_ufficio`),
  KEY `fk_responsabile_logistica_has_Ufficio_responsabile_logistic_idx` (`responsabile_logistica_ID_responsabile`),
  CONSTRAINT `fk_responsabile_logistica_has_Ufficio_responsabile_logistica1` FOREIGN KEY (`responsabile_logistica_ID_responsabile`) REFERENCES `responsabile_logistica` (`ID_responsabile`),
  CONSTRAINT `fk_responsabile_logistica_has_Ufficio_Ufficio1` FOREIGN KEY (`Ufficio_ID_ufficio`) REFERENCES `ufficio` (`ID_ufficio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicazioni`
--

LOCK TABLES `comunicazioni` WRITE;
/*!40000 ALTER TABLE `comunicazioni` DISABLE KEYS */;
INSERT INTO `comunicazioni` VALUES (7,2),(8,2),(6,3),(5,4),(4,5),(3,6),(2,7),(1,8);
/*!40000 ALTER TABLE `comunicazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutenzione`
--

DROP TABLE IF EXISTS `manutenzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutenzione` (
  `officina_ID_officina` int NOT NULL,
  `Camion_targa_c` varchar(255) NOT NULL,
  PRIMARY KEY (`officina_ID_officina`,`Camion_targa_c`),
  KEY `fk_officina_has_Camion_Camion1_idx` (`Camion_targa_c`),
  KEY `fk_officina_has_Camion_officina1_idx` (`officina_ID_officina`),
  CONSTRAINT `fk_officina_has_Camion_Camion1` FOREIGN KEY (`Camion_targa_c`) REFERENCES `camion` (`targa_c`),
  CONSTRAINT `fk_officina_has_Camion_officina1` FOREIGN KEY (`officina_ID_officina`) REFERENCES `officina` (`ID_officina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutenzione`
--

LOCK TABLES `manutenzione` WRITE;
/*!40000 ALTER TABLE `manutenzione` DISABLE KEYS */;
INSERT INTO `manutenzione` VALUES (1,'BF124 KL'),(2,'BF214CE'),(3,'BF243LK'),(4,'BF285LM'),(5,'BF345NH');
/*!40000 ALTER TABLE `manutenzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merce`
--

DROP TABLE IF EXISTS `merce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merce` (
  `ID_merce` int NOT NULL COMMENT 'tabella merce',
  `tipologia` varchar(45) NOT NULL,
  `data_consegna` date NOT NULL,
  `descrizione` text NOT NULL,
  `peso` int NOT NULL,
  `volume` int NOT NULL,
  `Cliente_ID_cliente` int NOT NULL,
  `Rimorchio_Targa_r` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_merce`),
  UNIQUE KEY `ID_merce_UNIQUE` (`ID_merce`),
  KEY `fk_Merce_Cliente1_idx` (`Cliente_ID_cliente`),
  KEY `fk_Merce_Rimorchio1_idx` (`Rimorchio_Targa_r`),
  CONSTRAINT `fk_Merce_Cliente1` FOREIGN KEY (`Cliente_ID_cliente`) REFERENCES `cliente` (`ID_cliente`),
  CONSTRAINT `fk_Merce_Rimorchio1` FOREIGN KEY (`Rimorchio_Targa_r`) REFERENCES `rimorchio` (`Targa_r`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merce`
--

LOCK TABLES `merce` WRITE;
/*!40000 ALTER TABLE `merce` DISABLE KEYS */;
INSERT INTO `merce` VALUES (1,'frutta','2024-12-04','merce frutta e verdura',10000,612,1,'XA125EW'),(2,'ferro','2025-11-06','merce pesante ',10000,125,2,'XA712EW'),(3,'congelato','2026-01-23','alimentare ',8573,125,5,'XA734EW'),(4,'rifiuti ','2025-11-07','rifiuti da riciclare',9278,672,3,'XA738EW'),(5,'piante','2023-11-30','merce per vivai',10000,125,6,'XA739EW'),(6,'acciaio','2035-06-01','merce pesante',20000,4367,2,'XA740EW'),(7,'legname','2030-03-05','merce pesante',21565,6213,7,'XA741EW'),(8,'cibo','2025-02-09','alimentare',67352,521,1,'XA742EW'),(9,'concime','2027-09-16','merce per vivai',65261,657,5,'XA745EW'),(10,'pannelli solari','2024-02-07','merce fragile',10000,672,2,'XA765EW');
/*!40000 ALTER TABLE `merce` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `merce_BEFORE_INSERT` BEFORE INSERT ON `merce` FOR EACH ROW BEGIN
 -- controllo della data di consegna
    IF (NEW.data_consegna < CURRENT_DATE) THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La data di consegna deve essere maggiore della data attuale.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `officina`
--

DROP TABLE IF EXISTS `officina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officina` (
  `ID_officina` int NOT NULL COMMENT 'tabella officina',
  `nome` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `numero_dipendenti` int NOT NULL,
  PRIMARY KEY (`ID_officina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officina`
--

LOCK TABLES `officina` WRITE;
/*!40000 ALTER TABLE `officina` DISABLE KEYS */;
INSERT INTO `officina` VALUES (1,'meccanik','2000-12-01','via giostra',5),(2,'aggiusta ruote','1952-04-23','via mazzarà',2),(3,'mekkanius','1978-04-05','via portosalvo',6),(4,'tutto ruote','1998-07-11','piazzale novantedue',12),(5,'sedici bar','2015-02-07','via amazzonia',7);
/*!40000 ALTER TABLE `officina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsabile_logistica`
--

DROP TABLE IF EXISTS `responsabile_logistica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsabile_logistica` (
  `ID_responsabile` int NOT NULL COMMENT 'tabella responsabile logistica',
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `n_telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_responsabile`),
  UNIQUE KEY `ID_responsabile_UNIQUE` (`ID_responsabile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile_logistica`
--

LOCK TABLES `responsabile_logistica` WRITE;
/*!40000 ALTER TABLE `responsabile_logistica` DISABLE KEYS */;
INSERT INTO `responsabile_logistica` VALUES (1,'giustino','Gauderian','123-456-7890'),(2,'alfonso','bianchi','234-567-8901'),(3,'maria','aricò','345-678-9012'),(4,'enzo','calabrò','456-789-0123'),(5,'ugo','boss','567-890-1234'),(6,'fillippo','gregoraci','678-901-2345'),(7,'ezio','auditore','789-012-3456'),(8,'cirillia','torione','890-123-4567'),(9,'eros','rossi','901-234-5678');
/*!40000 ALTER TABLE `responsabile_logistica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `responsabile_logistica_BEFORE_INSERT` BEFORE INSERT ON `responsabile_logistica` FOR EACH ROW BEGIN
 -- controllo del numero_t
    IF (length(NEW.n_telefono) != 12) THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero_t deve essere uguale a 10 cifre numeriche.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rimorchio`
--

DROP TABLE IF EXISTS `rimorchio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rimorchio` (
  `Targa_r` varchar(255) NOT NULL COMMENT 'rabella rimorchio',
  `anno` date NOT NULL,
  `pos_partenza` varchar(45) NOT NULL,
  `pos_arrivo` varchar(45) NOT NULL,
  `capacità_carico` int NOT NULL,
  `tipologia` varchar(255) NOT NULL,
  `responsabile_logistica_ID_responsabile` int NOT NULL,
  PRIMARY KEY (`Targa_r`),
  UNIQUE KEY `Targa_r_UNIQUE` (`Targa_r`),
  KEY `fk_Rimorchio_responsabile_logistica1_idx` (`responsabile_logistica_ID_responsabile`),
  CONSTRAINT `fk_Rimorchio_responsabile_logistica1` FOREIGN KEY (`responsabile_logistica_ID_responsabile`) REFERENCES `responsabile_logistica` (`ID_responsabile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rimorchio`
--

LOCK TABLES `rimorchio` WRITE;
/*!40000 ALTER TABLE `rimorchio` DISABLE KEYS */;
INSERT INTO `rimorchio` VALUES ('XA125EW','2011-01-23','calabria','lombardia',34500,'cassonato',2),('XA712EW','2013-04-09','puglia','sicilia',39000,'frigorifero',6),('XA734EW','2012-12-08','sicilia','toscana',36000,'frigorifero',4),('XA738EW','2010-12-20','sicilia','calabria',25000,'cassonato',2),('XA739EW','2011-10-02','calabria','calabria',28000,'frigorifero',1),('XA740EW','2012-07-21','puglia','toscana',37000,'frigorifero',4),('XA741EW','2013-04-03','veneto','sicilia',25000,'centinato',2),('XA742EW','2014-03-11','emilia-romagna','',25000,'cassonato',1),('XA745EW','2014-05-10','lazio','puglia',36000,'centinato',8),('XA765EW','2010-07-21','sicilia','basilicata',21000,'centinato',5);
/*!40000 ALTER TABLE `rimorchio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rimorchio_BEFORE_INSERT` BEFORE INSERT ON `rimorchio` FOR EACH ROW BEGIN
 IF (LENGTH(NEW.Targa_r) < 7 OR NOT NEW.Targa_r REGEXP '^XA.*$') THEN
        -- mostrare un messaggio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La targa del rimorchio deve iniziare con XA.';
    END IF;

    -- controllo dell'anno
    IF (NEW.anno < '2000-01-01') THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'bisogna segnalare ad un superiore questo rimorchio perchè troppo vecchio.';
    END IF;

    -- controllo della capacità di carico per il modello autoarticolato
    IF (NEW.capacità_carico > 40000) THEN
        -- mostrare un messagio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La capacità di carico non può superare 40000 per il modello autoarticolato.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stipendio`
--

DROP TABLE IF EXISTS `stipendio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipendio` (
  `ID_stipendio` int NOT NULL COMMENT 'tabella stipendio',
  `trasferta` int NOT NULL,
  `importo_giornaliero` int NOT NULL,
  PRIMARY KEY (`ID_stipendio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipendio`
--

LOCK TABLES `stipendio` WRITE;
/*!40000 ALTER TABLE `stipendio` DISABLE KEYS */;
INSERT INTO `stipendio` VALUES (1,50,70),(2,40,60),(3,35,50),(4,50,80),(5,25,40),(6,90,80);
/*!40000 ALTER TABLE `stipendio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `stipendio_AFTER_INSERT` AFTER INSERT ON `stipendio` FOR EACH ROW BEGIN
IF (NEW.importo_giornaliero > 80) THEN
        -- mostrare un messaggio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L''importo giornaliero non può superare 80€.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ufficio`
--

DROP TABLE IF EXISTS `ufficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ufficio` (
  `ID_ufficio` int NOT NULL COMMENT 'tabella ufficio',
  `indirizzo` varchar(45) NOT NULL,
  `n_dipendenti` int NOT NULL,
  `n_telefono` varchar(255) NOT NULL,
  `capo_ufficio` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_ufficio`),
  UNIQUE KEY `ID_ufficio_UNIQUE` (`ID_ufficio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ufficio`
--

LOCK TABLES `ufficio` WRITE;
/*!40000 ALTER TABLE `ufficio` DISABLE KEYS */;
INSERT INTO `ufficio` VALUES (1,'via caronda 15',6,'555-555-0001','Blanco Antonio'),(2,'via stretto bruschetta',8,'555-555-0002','Giuseppe mastroeni'),(3,'via fagiolino',9,'555-555-0003','Salvatore Alaimo'),(4,'via garibaldi',9,'555-555-0004','Stanco filippo'),(5,'via pirri antonio',9,'555-555-0005','Carmelo lo Iacono'),(6,'piazza gesualdo',3,'555-555-0006','Antonio zuppardo'),(7,'piazzale michelangelo',5,'555-555-0007','Carlo terzo'),(8,'via dante alighieri',7,'555-555-0008','Enrico augusto');
/*!40000 ALTER TABLE `ufficio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ufficio_AFTER_INSERT` AFTER INSERT ON `ufficio` FOR EACH ROW BEGIN
IF (NEW.n_dipendenti <= 0 OR NEW.n_dipendenti >= 20) THEN
       -- messaggio di errore
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il numero di dipendenti deve essere compreso tra 1 e 19.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'autotrasporti'
--

--
-- Dumping routines for database 'autotrasporti'
--
/*!50003 DROP PROCEDURE IF EXISTS `controllo ore guida rimanenti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllo ore guida rimanenti`()
BEGIN
select Autista_ID_autista, ore_guida
from carta_tachigrafo
where ore_guida>2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `giorni_lavoro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `giorni_lavoro`()
BEGIN
select ID_autista, giorni_lavoro
from autista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista camion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista camion`()
BEGIN
select*
from camion
where targa_c LIKE 'A%Z';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista clienti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista clienti`()
BEGIN
select ID_cliente
from cliente
where cognome='Alaimo' AND nome like 'S%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista dipendenti anziani` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista dipendenti anziani`()
BEGIN
select ID_autista, nome, età
from autista
where età>60 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista numero di consegne` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista numero di consegne`()
BEGIN
select count(*) AS numero_rimorchi , Autista_ID_autista
from assegnazioni_rimorchi
group by Autista_ID_autista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista responsabili` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista responsabili`()
BEGIN
select *
from comunicazioni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_consegna_merce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_consegna_merce`()
BEGIN
select Cliente_ID_cliente, count(*) as numero_consegne
from merce
group by Cliente_ID_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `numero_manutenzioni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `numero_manutenzioni`()
BEGIN
select targa_c, count(*) AS numero_manutenzioni
from camion LEFT join manutenzione on camion.targa_c=manutenzione.Camion_targa_c
group by targa_c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrazione_peso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrazione_peso`()
BEGIN
UPDATE Merce
SET peso = 10000
WHERE ID_merce = 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Stipendio_mensile_di_ tutti_ gli_autisti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Stipendio_mensile_di_ tutti_ gli_autisti`()
BEGIN
select ID_autista,nome,cognome, giorni_lavoro * importo_giornaliero as stipendio_mensile
from autista  join stipendio on ID_stipendio=stipendio_ID_stipendio;
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

-- Dump completed on 2023-02-14 13:06:38
