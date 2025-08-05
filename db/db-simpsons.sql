-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: simpsons
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `capitulos`
--

DROP TABLE IF EXISTS `capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `numero_episodio` int DEFAULT NULL,
  `temporada` int DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `sinopsis` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulos`
--

LOCK TABLES `capitulos` WRITE;
/*!40000 ALTER TABLE `capitulos` DISABLE KEYS */;
INSERT INTO `capitulos` VALUES (1,'Sin blanca navidad',1,1,'1989-12-17','Durante las compras de Navidad, Bart se escabulle y se hace un tatuaje. Marge lo descubre y usa el dinero de los regalos para quitárselo.'),(2,'Bart el genio',2,1,'1990-01-02','Bart tiene problemas en una prueba de inteligencia y en secreto intercambia su examen con el de Martin, el genio de la clase.'),(3,'La odisea de Homer',3,1,'1990-01-09','Homer, ansioso porque lo vean trabajando, accidentalmente bloquea su carrito en una tubería radioactiva, provocando de inmediato un incendio.'),(4,'Hogar, agridulce hogar',4,1,'1990-01-28','La familia Simpson va a terapia.'),(5,'Bart, el general',5,1,'1990-02-04','Bart prepara una guerra contra Nelson para defender a Lisa.'),(6,'El Blues de la Mona Lisa',6,1,'1990-02-11','Lisa está triste y se refugia en su música.'),(7,'El Abominable Hombre Del Bosque',7,1,'1990-02-18','Los Simpsons se van de viaje en caravana al bosque.'),(8,'El héroe sin cabeza',8,1,'1990-02-25','Bart roba la cabeza de la estatua de la ciudad.'),(9,'Un momento de decisión',9,1,'1990-03-03','Homer le regala a Marge una bola de bolos.'),(10,'La correría de Homer',10,1,'1990-03-10','Homer la lía.'),(11,'Intercambio cultural',11,1,'1990-03-17','Bart se va a Francia de intermcambio.');
/*!40000 ALTER TABLE `capitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` varchar(255) NOT NULL,
  `marca_tiempo` time DEFAULT NULL,
  `descripcion` text,
  `id_personaje` int DEFAULT NULL,
  `id_capitulo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_personaje` (`id_personaje`),
  KEY `id_capitulo` (`id_capitulo`),
  CONSTRAINT `frases_ibfk_1` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`),
  CONSTRAINT `frases_ibfk_2` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
INSERT INTO `frases` VALUES (1,'Hola holita',NULL,'frase típica de Flanders',6,3),(2,'¿Qué es la mente, algo real? ¿qué es lo real?, nada real-mente',NULL,'frase de Homer cundo acuesta a Bart',2,1),(4,'Marge, ¿dónde está Lisa pequeña?',NULL,'frase de Homer buscando a Maggie',2,2),(5,'¿Seguro dental? tus amigos podrían llamarte Joyu','10:30:10','frase de Bart en el dentista',3,3),(6,'Mi hermano es malo malo, no hace más que chinchar.','05:14:00','Frase de Lisa cantando blues',4,6),(7,'Pues... ¡que empiece la zampa!','01:55:50','a la hora de la cena en el comedor',4,4),(8,'Duerme mi niña sobre la rama, cuando la rama se rompa ya, junto a mi niña la cuna caerá','01:55:50','Marge le canta una nana a Maggie',1,1),(9,'Esto es un vehículo para todo tipo de terreno','02:24:50','conduciendo una caravana en medio del bosque',2,7),(10,'No te apures, la situación no es tan mala como pudiera parecer, ¿acaso olvidas que soy un experto montañero?','11:58:32','frase de Homer cuando se pierden en el bosque',2,7),(11,'Vuestra madre todavía no ha abierto mi regalo.','04:14:40','Cumpleaños de Marge',2,9),(12,'No he aprendido ni una palabra... ¡un momento, estoy hablando francés!','16:45:50','Bart en Francia',3,11),(13,'Ir a Francia parece una oportunidad fantástica','01:05:12','el colegio quiere mandar a Bart fuera',1,11),(14,'Por esas y otras razones elegimos un electrizante futuro.','12:44:50','en una reunión',1,8),(15,'Homer, ¿me podrías prestar mi cortacésped?','11:28:12','frase de Ned en el jardín',6,10);
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `ocupacion` varchar(45) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Marge','Bouvier','ama de casa','Es la madre de la familia Simpson'),(2,'Homer','Simpson','inspector de seguridad','Es el padre de la familia Simpson'),(3,'Bart','Simpson','estudiante','Es el hijo mayor de la familia Simpson'),(4,'Lisa','Simpson','estudiante','Es la hija mediana de la familia Simpson'),(5,'Maggie','Simpson','','Es la hija menor de la familia Simpson'),(6,'Ned','Flanders','emprendedor','Es el vecino de la familia Simpson');
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes_has_capitulos`
--

DROP TABLE IF EXISTS `personajes_has_capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes_has_capitulos` (
  `personajes_id` int NOT NULL,
  `capitulos_id` int NOT NULL,
  PRIMARY KEY (`personajes_id`,`capitulos_id`),
  KEY `fk_personajes_has_capitulos_capitulos1_idx` (`capitulos_id`),
  KEY `fk_personajes_has_capitulos_personajes_idx` (`personajes_id`),
  CONSTRAINT `fk_personajes_has_capitulos_capitulos1` FOREIGN KEY (`capitulos_id`) REFERENCES `capitulos` (`id`),
  CONSTRAINT `fk_personajes_has_capitulos_personajes` FOREIGN KEY (`personajes_id`) REFERENCES `personajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes_has_capitulos`
--

LOCK TABLES `personajes_has_capitulos` WRITE;
/*!40000 ALTER TABLE `personajes_has_capitulos` DISABLE KEYS */;
INSERT INTO `personajes_has_capitulos` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3);
/*!40000 ALTER TABLE `personajes_has_capitulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-05 11:29:02
