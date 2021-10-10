-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tdb_autos
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB-1:10.6.4+maria~focal

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
-- Table structure for table `au_auditoria`
--

DROP TABLE IF EXISTS `au_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_auditoria` (
  `aud_secuencial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'secuencial',
  `aud_id_trn` int(11) NOT NULL COMMENT 'ID transaccion',
  `aud_fecha` datetime NOT NULL COMMENT 'Fecha de transaccion',
  `aud_usuario` varchar(32) NOT NULL COMMENT 'Usuario que ejecuta la transaccion',
  `aud_operacion` char(2) NOT NULL COMMENT 'Operacion ejecutada',
  `aud_login_usuario` varchar(100) NOT NULL COMMENT 'Login del usuario generado por sistema',
  `aud_sp_name` varchar(64) DEFAULT NULL COMMENT 'Nombre de SP ejecutado',
  `aud_int01` int(11) DEFAULT NULL,
  `aud_int02` int(11) DEFAULT NULL,
  `aud_int03` int(11) DEFAULT NULL,
  `aud_mon01` decimal(19,4) DEFAULT NULL,
  `aud_mon02` decimal(19,4) DEFAULT NULL,
  `aud_descripcion01` varchar(100) DEFAULT NULL,
  `aud_descripcion02` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aud_secuencial`,`aud_id_trn`,`aud_fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de auditoria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_auditoria`
--

LOCK TABLES `au_auditoria` WRITE;
/*!40000 ALTER TABLE `au_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_autos`
--

DROP TABLE IF EXISTS `au_autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_autos` (
  `au_auto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de auto',
  `au_nombre` varchar(32) NOT NULL COMMENT 'Nombre del vehiculo',
  `au_marca` varchar(32) NOT NULL COMMENT 'Marca del vehiculo',
  `au_tipo` varchar(32) NOT NULL COMMENT 'Marca del vehiculo',
  `au_color` varchar(32) NOT NULL COMMENT 'Color del vehiculo',
  `au_precio_lista` decimal(19,4) NOT NULL COMMENT 'Precio del vehiculo',
  `au_disponibilidad` int(11) NOT NULL COMMENT 'Cantidad de autos disponibles',
  `au_creado_por` varchar(32) NOT NULL COMMENT 'ID del creador',
  `au_fecha_creacion` datetime NOT NULL COMMENT 'Fecha de creacion del registro',
  `au_modificado_por` varchar(32) DEFAULT NULL COMMENT 'ID de usuario que modifica',
  `au_fecha_modifica` datetime DEFAULT NULL COMMENT 'Fecha de modificacion',
  `au_anio` int(11) NOT NULL,
  `au_estado` char(1) NOT NULL COMMENT 'Estado del registro',
  PRIMARY KEY (`au_auto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Listado de vehiculos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_autos`
--

LOCK TABLES `au_autos` WRITE;
/*!40000 ALTER TABLE `au_autos` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_catalogo`
--

DROP TABLE IF EXISTS `au_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_catalogo` (
  `ca_catalogo` varchar(32) NOT NULL COMMENT 'Llave del catalogo',
  `ca_codigo` varchar(16) NOT NULL COMMENT 'Codigo del catalogo',
  `ca_descripcion` varchar(64) NOT NULL COMMENT 'Descripcion del elemento',
  `ca_orden` int(11) NOT NULL COMMENT 'Usado para devolver busquedas ordenadas',
  `ca_creado_por` varchar(32) NOT NULL COMMENT 'Usuario que crea',
  `ca_fecha_creacion` datetime NOT NULL COMMENT 'Fecha de creacion',
  `ca_modificado_por` varchar(32) DEFAULT NULL COMMENT 'Usuario que modifica',
  `ca_fecha_modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificacion',
  `ca_estado` char(1) NOT NULL COMMENT 'Estado',
  UNIQUE KEY `au_catalogo_UN` (`ca_catalogo`,`ca_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de catalogos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_catalogo`
--

LOCK TABLES `au_catalogo` WRITE;
/*!40000 ALTER TABLE `au_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_clientes`
--

DROP TABLE IF EXISTS `au_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_clientes` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de cliente',
  `cli_tipo_cliente` char(1) NOT NULL,
  `cli_ced_ruc` varchar(64) NOT NULL COMMENT 'Cedula o RUC',
  `cli_p_nombre` varchar(100) DEFAULT NULL COMMENT 'Primer nombre',
  `cli_s_nombre` varchar(100) DEFAULT NULL COMMENT 'Segundo nombre',
  `cli_p_apellido` varchar(100) DEFAULT NULL COMMENT 'Primer apellido',
  `cli_s_apellido` varchar(100) DEFAULT NULL COMMENT 'Segundo apellido',
  `cli_apellido_casada` varchar(100) DEFAULT NULL COMMENT 'Apellido de casada',
  `cli_sexo` char(1) DEFAULT NULL COMMENT 'Sexo de cliente',
  `cli_fecha_nac` datetime DEFAULT NULL COMMENT 'Fecha de nacimiento',
  `cli_empresa_nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre empresa',
  `cli_formato_nombre` int(11) NOT NULL,
  `cli_c_apoderado` int(11) DEFAULT NULL COMMENT 'Apoderado de la empresa',
  `cli_es_preferente` char(1) DEFAULT NULL COMMENT 'Marca de cliente preferencial',
  `cli_usuario_crea` varchar(32) NOT NULL COMMENT 'Usuario que crea',
  `cli_fecha_creacion` datetime NOT NULL COMMENT 'Fecha de creacion',
  `cli_usuario_mod` varchar(32) DEFAULT NULL COMMENT 'Usuario que modifica',
  `cli_fecha_modificacion` datetime DEFAULT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`cli_id`),
  UNIQUE KEY `au_clientes_cedruc` (`cli_ced_ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Catalogo de clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_clientes`
--

LOCK TABLES `au_clientes` WRITE;
/*!40000 ALTER TABLE `au_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_facturas`
--

DROP TABLE IF EXISTS `au_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_facturas` (
  `fac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de factura',
  `fac_cliente` int(11) NOT NULL COMMENT 'Cliente',
  `fac_vendedor` varchar(32) NOT NULL,
  `fac_autorizador` varchar(32) NOT NULL COMMENT 'ID de autorizador',
  `fac_fecha` datetime NOT NULL COMMENT 'Fecha de confeccion de la factura',
  `fac_parcial` char(1) DEFAULT NULL COMMENT 'Es una factura parcial',
  `fac_id_externo` varchar(64) NOT NULL COMMENT 'Codigo de referencia',
  `fac_forma_pago` varchar(16) DEFAULT NULL COMMENT 'Forma de pago',
  `fac_monto` decimal(19,4) NOT NULL COMMENT 'Monto a pagar',
  `fac_monto_comision` decimal(19,4) DEFAULT NULL COMMENT 'Comision',
  `fac_monto_impuesto` decimal(19,4) NOT NULL,
  `fac_descuento` decimal(19,4) DEFAULT NULL COMMENT 'Descuento',
  `fac_monto_total` decimal(19,4) NOT NULL COMMENT 'Monto total a pagar',
  `fac_ref_venta` int(11) NOT NULL COMMENT 'ID de referencia de venta',
  `fac_descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripcion de la factura',
  PRIMARY KEY (`fac_id`),
  UNIQUE KEY `au_facturas_fac_id_externo_IDX` (`fac_id_externo`) USING BTREE,
  KEY `au_facturas_fac_ref_venta_IDX` (`fac_ref_venta`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Registro de facturas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_facturas`
--

LOCK TABLES `au_facturas` WRITE;
/*!40000 ALTER TABLE `au_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_parametro`
--

DROP TABLE IF EXISTS `au_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_parametro` (
  `pa_nemonico` varchar(8) NOT NULL COMMENT 'Nemonico del parametro',
  `pa_descripcion` varchar(100) NOT NULL COMMENT 'Descripcion',
  `pa_tipo` varchar(10) NOT NULL COMMENT 'Tipo de dato de parametro',
  `pa_parametro` varchar(100) NOT NULL COMMENT 'Valor del parametro',
  `pa_usuario_crea` varchar(32) NOT NULL COMMENT 'Usuario que crea el parametro',
  `pa_fecha_crea` datetime NOT NULL COMMENT 'Fecha de creacion',
  `pa_usuario_mod` varchar(32) DEFAULT NULL COMMENT 'Usuario que modifica',
  `pa_fecha_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificacion',
  `pa_estado` char(1) DEFAULT NULL COMMENT 'Estado',
  UNIQUE KEY `au_parametro_pa_nemonico_IDX` (`pa_nemonico`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Parametros de uso general';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_parametro`
--

LOCK TABLES `au_parametro` WRITE;
/*!40000 ALTER TABLE `au_parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_roles`
--

DROP TABLE IF EXISTS `au_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_roles` (
  `ro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de rol',
  `ro_rol` varchar(32) NOT NULL COMMENT 'Mnemonico',
  `ro_descripcion` varchar(100) NOT NULL COMMENT 'Descripcion de rol',
  `ro_admin` char(1) DEFAULT NULL COMMENT 'Indicador de si es un rol administrativo',
  `ro_creado_por` varchar(32) NOT NULL COMMENT 'Usuario creador',
  `ro_fecha_creacion` datetime NOT NULL COMMENT 'Fecha de creacion',
  `ro_modificado_por` varchar(32) DEFAULT NULL COMMENT 'Usuario modificador',
  `ro_fecha_modificacion` datetime DEFAULT NULL COMMENT 'Fecha de ultima modificacion',
  `ro_estado` char(1) NOT NULL COMMENT 'Estado',
  PRIMARY KEY (`ro_id`),
  UNIQUE KEY `au_roles_ro_rol_IDX` (`ro_rol`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Roles de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_roles`
--

LOCK TABLES `au_roles` WRITE;
/*!40000 ALTER TABLE `au_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_usuario_rol`
--

DROP TABLE IF EXISTS `au_usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_usuario_rol` (
  `au_usuario` int(11) NOT NULL COMMENT 'ID de usuario',
  `au_rol` int(11) NOT NULL COMMENT 'ID de rol',
  `au_creado_por` varchar(32) NOT NULL COMMENT 'Usuario que crea la relacion',
  `au_fecha_creacion` datetime NOT NULL COMMENT 'Fecha de creacion',
  PRIMARY KEY (`au_usuario`,`au_rol`),
  KEY `au_usuario_rol_FK_1` (`au_rol`),
  CONSTRAINT `au_usuario_rol_FK` FOREIGN KEY (`au_usuario`) REFERENCES `au_usuarios` (`us_id`),
  CONSTRAINT `au_usuario_rol_FK_1` FOREIGN KEY (`au_rol`) REFERENCES `au_roles` (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Roles de usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_usuario_rol`
--

LOCK TABLES `au_usuario_rol` WRITE;
/*!40000 ALTER TABLE `au_usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_usuarios`
--

DROP TABLE IF EXISTS `au_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_usuarios` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Secuencial de usuario',
  `us_usuario` varchar(32) NOT NULL COMMENT 'ID de usuario',
  `us_primer_nombre` varchar(100) NOT NULL COMMENT 'Primer nombre',
  `us_segundo_nombre` varchar(100) DEFAULT NULL COMMENT 'Segundo nombre',
  `us_primer_apellido` varchar(100) NOT NULL COMMENT 'Primer apellido',
  `us_segundo_apellido` varchar(100) DEFAULT NULL,
  `us_apellido_casada` varchar(100) DEFAULT NULL COMMENT 'Apellido de casada',
  `us_sexo` char(1) NOT NULL,
  `us_id_personal` varchar(64) NOT NULL,
  `us_fecha_nac` datetime DEFAULT NULL COMMENT 'Fecha de nacimiento',
  `us_supervisor` varchar(32) NOT NULL,
  `us_creado_por` varchar(32) NOT NULL,
  `us_fecha_creacion` datetime NOT NULL,
  `us_modificado_por` varchar(32) DEFAULT NULL COMMENT 'Usuario que modifica',
  `us_fecha_modificacion` datetime DEFAULT NULL,
  `us_email` varchar(32) DEFAULT NULL COMMENT 'Correo electronico de contacto',
  `us_telefono` varchar(16) DEFAULT NULL COMMENT 'Telefono de contacto',
  `us_login` varchar(100) DEFAULT NULL COMMENT 'Login generado por sistema',
  `us_password` varchar(128) NOT NULL,
  `us_estado` char(1) NOT NULL COMMENT 'Estado',
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `au_usuarios_us_usuario_IDX` (`us_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_usuarios`
--

LOCK TABLES `au_usuarios` WRITE;
/*!40000 ALTER TABLE `au_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_ventas`
--

DROP TABLE IF EXISTS `au_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_ventas` (
  `ven_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de venta',
  `ven_fecha` datetime NOT NULL COMMENT 'Fecha de venta',
  `ven_usuario` varchar(32) NOT NULL COMMENT 'Usuario que realiza la venta',
  `ven_autorizador` varchar(32) DEFAULT NULL COMMENT 'Autorizador',
  `ven_cliente` int(11) NOT NULL COMMENT 'ID de cliente',
  `ven_contrato_firmado` char(1) DEFAULT NULL COMMENT 'Indicador de que el contrato ha sido firmado',
  `ven_etapa` varchar(16) NOT NULL COMMENT 'Etapa en la que se encuentra la venta',
  `ven_monto_venta` decimal(19,4) NOT NULL COMMENT 'Monto total de la venta',
  `ven_monto_total_com` decimal(19,4) DEFAULT NULL COMMENT 'Monto total de comisiones',
  `ven_monto_tot_imp` decimal(19,4) DEFAULT NULL COMMENT 'Monto total impuestos',
  `ven_monto_tot_desc` decimal(19,4) DEFAULT NULL COMMENT 'Monto total descuento',
  `ven_porc_descuento` decimal(19,4) DEFAULT NULL COMMENT 'Porcentaje de descuento',
  `ven_saldo_pendiente` decimal(19,4) NOT NULL COMMENT 'Saldo pendiente a pagar',
  `ven_mon_ult_pago` decimal(19,4) DEFAULT NULL COMMENT 'Monto del ultimo pago realizado',
  `ven_fecha_ult_pago` datetime DEFAULT NULL COMMENT 'Fecha de ultimo pago',
  `ven_descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripcion de la venta',
  PRIMARY KEY (`ven_id`),
  KEY `au_ventas_ven_cliente_IDX` (`ven_cliente`) USING BTREE,
  KEY `au_ventas_ven_fecha_IDX` (`ven_fecha`,`ven_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_ventas`
--

LOCK TABLES `au_ventas` WRITE;
/*!40000 ALTER TABLE `au_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `au_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_det_venta`
--

DROP TABLE IF EXISTS `aud_det_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aud_det_venta` (
  `dv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de detalle',
  `dv_id_venta` int(11) NOT NULL COMMENT 'ID de venta',
  `dv_vehiculo` int(11) NOT NULL COMMENT 'Detalle de vehiculo',
  `dv_cantidad` int(11) NOT NULL COMMENT 'Cantidad de vehiculos a vender',
  `dv_monto` decimal(19,4) NOT NULL COMMENT 'Monto de venta',
  `dv_aplica_impuesto` char(1) DEFAULT NULL COMMENT 'Aplica impuesto de venta',
  `dv_es_adenda` char(1) DEFAULT NULL COMMENT 'Forma parte de una adenda',
  `dv_usuario_crea` varchar(32) NOT NULL COMMENT 'Usuario que crea el registro',
  `dv_fecha_crea` datetime NOT NULL COMMENT 'Fecha de creacion',
  `dv_usuario_mod` varchar(32) DEFAULT NULL COMMENT 'Usuario que modifica',
  `dv_fecha_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificacion',
  PRIMARY KEY (`dv_id`,`dv_id_venta`),
  KEY `aud_det_venta_FK` (`dv_id_venta`),
  CONSTRAINT `aud_det_venta_FK` FOREIGN KEY (`dv_id_venta`) REFERENCES `au_ventas` (`ven_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Detalle de venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_det_venta`
--

LOCK TABLES `aud_det_venta` WRITE;
/*!40000 ALTER TABLE `aud_det_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `aud_det_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10  6:20:41
