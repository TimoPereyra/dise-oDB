-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: wow_macetas
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Macetas','Mediana'),(2,'Bachas','Chicas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `dirCalle` varchar(255) DEFAULT NULL,
  `dirNumero` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Timoteo','11 de septiembre',21,'M','1996-09-06','timo_futbol@hotmail.com','2345-659793'),(2,'Eugenio','25 de mayo',21,'M','1996-09-06','timopereyra@gmail.com','2345-659793');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_insumos`
--

DROP TABLE IF EXISTS `compra_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_insumos` (
  `idInsumos` int(11) NOT NULL AUTO_INCREMENT,
  `idLote` int(11) DEFAULT NULL,
  `proveedor` varchar(255) DEFAULT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `montoFinal` float(20,2) DEFAULT NULL,
  PRIMARY KEY (`idInsumos`),
  KEY `idLote` (`idLote`),
  CONSTRAINT `compra_insumos_ibfk_1` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_insumos`
--

LOCK TABLES `compra_insumos` WRITE;
/*!40000 ALTER TABLE `compra_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `fechaIngreso` date DEFAULT NULL,
  PRIMARY KEY (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,'2022-11-08'),(2,'2022-11-10'),(3,'2022-11-15');
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote_detalle`
--

DROP TABLE IF EXISTS `lote_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote_detalle` (
  `idProducto` int(11) DEFAULT NULL,
  `idLoteDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `operario` varchar(255) DEFAULT NULL,
  `tiempoEspera` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo` float(20,2) DEFAULT NULL,
  `cantMoldes` int(11) DEFAULT NULL,
  `idLote` int(11) NOT NULL,
  PRIMARY KEY (`idLoteDetalle`),
  KEY `idProducto` (`idProducto`),
  KEY `idLote` (`idLote`),
  CONSTRAINT `lote_detalle_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `lote_detalle_ibfk_2` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote_detalle`
--

LOCK TABLES `lote_detalle` WRITE;
/*!40000 ALTER TABLE `lote_detalle` DISABLE KEYS */;
INSERT INTO `lote_detalle` VALUES (2,1,'Jorgelina','15 dias ',25,250.00,30,1),(3,2,'Jorgelina','15 dias ',5,950.00,10,1),(4,3,'Jorgelina','10 dias ',4,350.00,9,1),(5,4,'Jorgelina','15 dias ',8,750.00,10,1),(6,5,'Jorgelina','15 dias ',10,600.00,15,1),(7,6,'Jorgelina','15 dias ',25,250.00,30,1),(8,7,'Jorgelina','15 dias ',3,250.00,5,1);
/*!40000 ALTER TABLE `lote_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) DEFAULT NULL,
  `idLote` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` float(20,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idLote` (`idLote`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (2,1,1,25,'Sin pintar fragil',550.00,'rutaRaiz/img/productos','Maceta lisa mediana'),(3,2,1,5,'Bacha con kit',2550.00,'rutaRaiz/img/productos','Bacha lisa'),(4,1,1,4,'Fragil',950.00,'rutaRaiz/img/productos','Maceta de dos colores'),(5,2,1,8,'Fragil',1550.00,'rutaRaiz/img/productos','Bacha de dos colores'),(6,1,1,10,'Fragil',1250.00,'rutaRaiz/img/productos','Maceta de tres colores '),(7,2,1,25,'Sin pintar fragil',550.00,'rutaRaiz/img/productos','Bacha de tres colores'),(8,1,1,3,'Fragil',550.00,'rutaRaiz/img/productos','Maceta barnizada');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idCliente` int(11) DEFAULT NULL,
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `fechaVenta` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `montoFinal` float(20,2) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'abc123','2022-11-08','Se entrega en domicilio',0.00),(2,2,'abc123','2022-11-08','Delivery',0.00),(1,3,'abc123','2022-11-10','Paquete de regalo',0.00),(2,4,'abc123','2022-11-11','Delivery',0.00);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_detalle` (
  `idLote` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float(20,2) DEFAULT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `idVenta` (`idVenta`),
  KEY `idProducto` (`idProducto`),
  KEY `idLote` (`idLote`),
  CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`),
  CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`),
  CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `venta_detalle_ibfk_4` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
INSERT INTO `venta_detalle` VALUES (1,1,2,1,5,550.00),(1,1,3,2,1,2550.00),(1,1,4,3,2,950.00),(1,1,5,4,3,1550.00);
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 16:38:36
