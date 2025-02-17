-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: horoscopo_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `horoscopo`
--

DROP TABLE IF EXISTS `horoscopo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horoscopo` (
  `ANIMAL` varchar(30) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horoscopo`
--

LOCK TABLES `horoscopo` WRITE;
/*!40000 ALTER TABLE `horoscopo` DISABLE KEYS */;
INSERT INTO `horoscopo` VALUES ('Rata','1924-02-05','1925-01-24'),('Buey','1925-01-25','1926-02-12'),('Tigre','1926-02-13','1927-02-01'),('Conejo','1927-02-02','1928-01-22'),('Dragón','1928-01-23','1929-02-09'),('Serpiente','1929-02-10','1930-01-29'),('Caballo','1930-01-30','1931-02-16'),('Cabra','1931-02-17','1932-02-05'),('Mono','1932-02-06','1933-01-25'),('Gallo','1933-01-26','1934-02-13'),('Perro','1934-02-14','1935-02-03'),('Cerdo','1935-02-04','1936-01-23'),('Rata','1936-01-24','1937-02-10'),('Buey','1937-02-11','1938-01-30'),('Tigre','1938-01-31','1939-02-18'),('Conejo','1939-02-19','1940-02-07'),('Dragón','1940-02-08','1941-01-26'),('Serpiente','1941-01-27','1942-02-14'),('Caballo','1942-02-15','1943-02-04'),('Cabra','1943-02-05','1944-01-24'),('Mono','1944-01-25','1945-02-12'),('Gallo','1945-02-13','1946-02-01'),('Perro','1946-02-02','1947-01-21'),('Cerdo','1947-01-22','1948-02-09'),('Rata','1948-02-10','1949-01-28'),('Buey','1949-01-29','1950-02-16'),('Tigre','1950-02-17','1951-02-05'),('Conejo','1951-02-06','1952-01-26'),('Dragón','1952-01-27','1953-02-13'),('Serpiente','1953-02-14','1954-02-02'),('Caballo','1954-02-03','1955-01-23'),('Cabra','1955-01-24','1956-02-11'),('Mono','1956-02-12','1957-01-30'),('Gallo','1957-01-31','1958-02-17'),('Perro','1958-02-18','1959-02-07'),('Cerdo','1959-02-08','1960-01-27'),('Rata','1960-01-28','1961-02-14'),('Buey','1961-02-15','1962-02-04'),('Tigre','1962-02-05','1963-01-24'),('Conejo','1963-01-25','1964-02-12'),('Dragón','1964-02-13','1965-02-01'),('Serpiente','1965-02-02','1966-01-20'),('Caballo','1966-01-21','1967-02-08'),('Cabra','1967-02-09','1968-01-29'),('Mono','1968-01-30','1969-02-16'),('Gallo','1969-02-17','1970-02-05'),('Perro','1970-02-06','1971-01-26'),('Cerdo','1971-01-27','1972-02-14'),('Rata','1972-02-15','1973-02-02'),('Buey','1973-02-03','1974-01-22'),('Tigre','1974-01-23','1975-02-10'),('Conejo','1975-02-11','1976-01-30'),('Dragón','1976-01-31','1977-02-17'),('Serpiente','1977-02-18','1978-02-06'),('Caballo','1978-02-07','1979-01-27'),('Cabra','1979-01-28','1980-02-15'),('Mono','1980-02-16','1981-02-04'),('Gallo','1981-02-05','1982-01-24'),('Perro','1982-01-25','1983-02-12'),('Cerdo','1983-02-13','1984-02-01'),('Rata','1984-02-02','1985-02-19'),('Buey','1985-02-20','1986-02-08'),('Tigre','1986-02-09','1987-01-28'),('Conejo','1987-01-29','1988-02-16'),('Dragón','1988-02-17','1989-02-05'),('Serpiente','1989-02-06','1990-01-26'),('Caballo','1990-01-27','1991-02-14'),('Cabra','1991-02-15','1992-02-03'),('Mono','1992-02-04','1993-01-22'),('Gallo','1993-01-23','1994-02-09'),('Perro','1994-02-10','1995-01-30'),('Cerdo','1995-01-31','1996-02-18'),('Rata','1996-02-19','1997-02-06'),('Buey','1997-02-07','1998-01-27'),('Tigre','1998-01-28','1999-02-15'),('Conejo','1999-02-16','2000-02-04'),('Dragón','2000-02-05','2001-01-23'),('Serpiente','2001-01-24','2002-02-11'),('Caballo','2002-02-12','2003-01-31'),('Cabra','2003-02-01','2004-01-21'),('Mono','2004-01-22','2005-02-08'),('Gallo','2005-02-09','2006-01-28'),('Perro','2006-01-29','2007-02-17'),('Cerdo','2007-02-18','2008-02-06'),('Rata','2008-02-07','2009-01-25'),('Buey','2009-01-26','2010-02-13'),('Tigre','2010-02-14','2011-02-02'),('Conejo','2011-02-03','2012-01-22'),('Dragón','2012-01-23','2013-02-09'),('Serpiente','2013-02-10','2014-01-30'),('Caballo','2014-01-31','2015-02-18'),('Cabra','2015-02-19','2016-02-07'),('Mono','2016-02-08','2017-01-27'),('Gallo','2017-01-28','2018-02-15'),('Perro','2018-02-16','2019-02-04'),('Cerdo','2019-02-05','2020-01-24'),('Rata','2020-01-25','2021-02-11'),('Buey','2021-02-12','2022-01-31'),('Tigre','2022-02-01','2023-01-21'),('Conejo','2023-01-22','2024-02-09');
/*!40000 ALTER TABLE `horoscopo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL,
  `ANIMAL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (14,'admin1','admin1','fran@gmail.com','2022-06-15','admin','Caballo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-15  6:26:06
