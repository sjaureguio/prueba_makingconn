-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para makingconn
CREATE DATABASE IF NOT EXISTS `makingconn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `makingconn`;

-- Volcando estructura para tabla makingconn.campaigns
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaFin` date NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `observacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tipoPublico` tinyint DEFAULT NULL,
  `tipoObjetivo` tinyint DEFAULT NULL,
  `tipoAudiencia` tinyint DEFAULT NULL,
  `interesPublico` tinyint DEFAULT NULL,
  `novedad` tinyint DEFAULT NULL,
  `actualidad` tinyint DEFAULT NULL,
  `autoridadCliente` tinyint DEFAULT NULL,
  `mediaticoCliente` tinyint DEFAULT NULL,
  `autoridadVoceros` tinyint DEFAULT NULL,
  `mediaticoVoceros` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `campaigns_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1387 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.campaigns: ~5 rows (aproximadamente)
INSERT INTO `campaigns` (`id`, `titulo`, `fechaFin`, `cliente_id`, `observacion`, `tipoPublico`, `tipoObjetivo`, `tipoAudiencia`, `interesPublico`, `novedad`, `actualidad`, `autoridadCliente`, `mediaticoCliente`, `autoridadVoceros`, `mediaticoVoceros`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(448, 'Proyecto: Agente de Prensa 2019', '2019-05-31', 32, 'Difusión en medios sobre el proyecto financiado por Innóvate Perú', 2, 1, 4, 3, 4, 5, 5, 4, 5, 4, '2019-05-17 14:26:43', '2021-05-30 02:14:16', NULL),
	(675, 'Book Media', '2020-02-01', 32, 'difundir', 2, 1, 1, 3, 4, 3, 3, 3, 4, 3, '2019-11-06 20:02:11', '2019-11-06 20:04:16', NULL),
	(798, 'En voz alta: Audioteca', '2020-12-30', 59, 'Camapaña cultural-social', 2, 2, 1, 3, 5, 5, 4, 3, 4, 3, '2020-04-23 03:17:02', '2021-05-26 00:07:45', NULL),
	(823, 'Booktrailer.pe', '2020-06-21', 59, 'Difundir la labor de booktrailer', 2, 1, 4, 4, 3, 3, 3, 4, 3, 3, '2020-05-21 17:52:58', '2020-05-21 17:52:58', NULL),
	(1360, 'Fiestas Patrias', '2021-07-31', 59, 'Entrevista', 2, 1, 1, 5, 5, 5, 3, 2, 2, 2, '2021-07-26 19:46:52', '2021-07-26 20:30:19', NULL);

-- Volcando estructura para tabla makingconn.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombreComercial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `razonSocial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rubro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.clientes: ~2 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nombreComercial`, `razonSocial`, `rubro`, `observacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(32, 'Making Connexion', 'Making Connexion SAC', 'Comunicaciones', '', '2019-05-17 14:23:32', '2019-05-17 14:23:32', NULL),
	(59, 'Bookmedia', 'Bookmedia', 'Editorial', '', '2020-04-23 03:13:54', '2020-04-23 03:13:54', NULL),
	(95, 'Cliente Prueba 2', 'Razón social de prueba 2', 'ICs', NULL, '2022-10-27 04:40:38', '2022-10-27 04:40:38', NULL);

-- Volcando estructura para tabla makingconn.detalle_plan_medios
CREATE TABLE IF NOT EXISTS `detalle_plan_medios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idPlanMedio` bigint unsigned NOT NULL,
  `idProgramaContacto` bigint unsigned NOT NULL,
  `idsMedioPlataforma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoTier` tinyint DEFAULT NULL,
  `tipoNota` tinyint NOT NULL,
  `tipoEtapa` tinyint NOT NULL,
  `statusPublicado` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_plan_medios_idplanmedio_foreign` (`idPlanMedio`),
  KEY `detalle_plan_medios_idprogramacontacto_foreign` (`idProgramaContacto`),
  CONSTRAINT `detalle_plan_medios_idplanmedio_foreign` FOREIGN KEY (`idPlanMedio`) REFERENCES `plan_medios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_plan_medios_idprogramacontacto_foreign` FOREIGN KEY (`idProgramaContacto`) REFERENCES `programa_contactos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17799 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.detalle_plan_medios: ~14 rows (aproximadamente)
INSERT INTO `detalle_plan_medios` (`id`, `idPlanMedio`, `idProgramaContacto`, `idsMedioPlataforma`, `tipoTier`, `tipoNota`, `tipoEtapa`, `statusPublicado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(4543, 516, 1277, '99', 2, 2, 2, 1, '2019-05-17 14:30:21', '2021-05-30 02:16:19', NULL),
	(4544, 516, 423, '3', 1, 2, 2, 1, '2019-05-17 14:30:51', '2021-05-30 02:16:19', NULL),
	(4545, 516, 745, '54', 3, 1, 2, 1, '2019-05-17 14:38:51', '2021-05-30 02:16:19', NULL),
	(4546, 516, 839, '59,60', 1, 2, 2, 0, '2019-05-17 14:39:06', '2021-05-30 02:16:18', NULL),
	(8997, 780, 745, '54,78,193', 2, 1, 2, 1, '2020-04-23 03:23:29', '2021-05-26 01:22:06', NULL),
	(9002, 943, 600, '54,78,193,853', 2, 1, 2, 1, '2020-04-23 13:34:45', '2021-05-26 01:22:07', NULL),
	(9006, 943, 1277, '99', 2, 2, 2, 1, '2020-04-23 14:47:15', '2021-05-26 01:22:07', NULL),
	(9007, 977, 745, '54', 2, 2, 2, 0, '2020-04-23 15:02:57', '2020-04-23 15:02:57', NULL),
	(9008, 977, 1260, '59', 3, 2, 2, 0, '2020-04-23 15:03:42', '2020-04-23 15:03:42', NULL),
	(9009, 943, 966, '3,4', 1, 2, 2, 1, '2020-04-23 19:15:24', '2021-05-26 01:22:08', NULL),
	(9011, 1651, 1277, '99', 2, 1, 2, 1, '2020-04-23 21:24:35', '2021-05-26 01:22:08', NULL),
	(9014, 1651, 1260, '59', 3, 1, 2, 1, '2020-04-24 15:47:30', '2021-05-26 01:23:05', NULL),
	(9086, 1651, 600, '54,193', 2, 2, 2, 0, '2020-05-05 15:00:49', '2020-05-05 15:00:49', NULL),
	(9087, 1651, 1281, '4', 1, 1, 2, 1, '2020-05-05 15:12:06', '2021-05-26 00:24:23', NULL);

-- Volcando estructura para tabla makingconn.medios
CREATE TABLE IF NOT EXISTS `medios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoRegion` tinyint DEFAULT NULL,
  `observacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.medios: ~4 rows (aproximadamente)
INSERT INTO `medios` (`id`, `nombre`, `alias`, `tipoRegion`, `observacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(22, 'El Comercio', 'EL COMERCIO', 1, NULL, '2021-03-02 00:34:50', '2021-05-20 16:51:25', NULL),
	(64, 'Radio Nacional', 'RADIO NACIONAL', 2, NULL, '2021-03-01 18:33:56', '2021-05-21 20:15:43', NULL),
	(76, 'RPP', 'RPP', 3, 'CANAL 10  MOVISTAR', '2021-03-01 22:20:42', '2021-03-01 22:20:42', NULL),
	(123, 'TV Perú', 'TV PERÚ', 1, NULL, '2021-02-19 22:36:16', '2021-02-19 22:36:16', NULL);

-- Volcando estructura para tabla makingconn.medio_plataformas
CREATE TABLE IF NOT EXISTS `medio_plataformas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `medio_id` bigint unsigned NOT NULL,
  `idPlataformaClasificacion` bigint unsigned NOT NULL,
  `valor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alcance` int DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medio_plataformas_medio_id_foreign` (`medio_id`),
  KEY `medio_plataformas_idplataformaclasificacion_foreign` (`idPlataformaClasificacion`),
  CONSTRAINT `medio_plataformas_idplataformaclasificacion_foreign` FOREIGN KEY (`idPlataformaClasificacion`) REFERENCES `plataforma_clasificacions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `medio_plataformas_medio_id_foreign` FOREIGN KEY (`medio_id`) REFERENCES `medios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.medio_plataformas: ~12 rows (aproximadamente)
INSERT INTO `medio_plataformas` (`id`, `medio_id`, `idPlataformaClasificacion`, `valor`, `alcance`, `observacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 76, 3, '10', 750000, '', '2017-07-09 03:19:04', '2017-07-09 03:19:04', NULL),
	(4, 76, 2, '89.7', 871428, '', '2017-07-09 03:31:53', '2017-07-09 03:31:53', NULL),
	(5, 22, 6, 'www.elcomercio.pe', 600000, 'El Comercio', '2017-07-13 03:48:56', '2021-05-20 16:51:42', NULL),
	(6, 22, 10, 'Página interior', 321993, '', '2017-07-13 03:48:56', '2017-09-10 02:52:23', NULL),
	(54, 64, 2, '103.9FM', 576000, '', '2017-09-10 03:53:03', '2017-09-10 03:53:03', NULL),
	(59, 123, 1, '7', 1000000, '', '2017-09-10 04:26:45', '2017-09-10 04:26:45', NULL),
	(60, 123, 6, 'http://www.tvperu.gob.pe/', 100290, '', '2017-09-10 04:26:45', '2017-09-10 04:26:45', NULL),
	(78, 64, 6, 'https://www.radionacional.com.', 7500, '', '2018-02-05 17:41:15', '2021-01-21 02:13:14', NULL),
	(99, 76, 6, 'http://rpp.pe/', 443413, '', '2018-03-12 21:50:29', '2018-03-12 21:50:29', NULL),
	(193, 64, 14, 'https://www.facebook.com/queha', 20000, 'QUÉ HACER', '2018-10-04 17:37:23', '2019-08-16 17:50:14', NULL),
	(514, 76, 15, 'https://www.youtube.com/channe', 443413, '', '2020-04-23 21:00:32', '2020-04-23 21:00:32', NULL),
	(853, 64, 14, 'https://www.facebook.com/radio', 268851, 'Nacional', '2021-02-03 21:05:05', '2021-02-03 21:05:05', NULL);

-- Volcando estructura para tabla makingconn.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apodo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genero` tinyint(1) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `profesion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `famoso` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2603 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.personas: ~4 rows (aproximadamente)
INSERT INTO `personas` (`id`, `apellidos`, `nombres`, `apodo`, `genero`, `fechaNacimiento`, `profesion`, `observacion`, `famoso`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(306, 'Elías', 'Betty', NULL, 0, NULL, 'Productora', NULL, NULL, '2017-06-06 22:59:36', '2021-08-06 20:22:35', NULL),
	(330, 'Acuña Villalobos', 'Pedro', NULL, 1, NULL, 'Editor General de Televisión', NULL, NULL, '2017-06-17 22:53:24', '2021-03-15 18:48:56', NULL),
	(1102, 'Coya ', 'Hugo', '', 1, NULL, '', '', 1, '2019-05-17 14:33:52', '2019-05-17 14:33:52', NULL),
	(1583, 'Garcia ', 'Brenda', '', 0, NULL, '', '', NULL, '2020-04-23 14:45:57', '2020-04-23 14:45:57', NULL);

-- Volcando estructura para tabla makingconn.plan_medios
CREATE TABLE IF NOT EXISTS `plan_medios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint unsigned NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_medios_campaign_id_foreign` (`campaign_id`),
  CONSTRAINT `plan_medios_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1680 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.plan_medios: ~0 rows (aproximadamente)
INSERT INTO `plan_medios` (`id`, `campaign_id`, `nombre`, `descripcion`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(516, 448, 'Agente de Prensa 2019', 'Proyecto financiado por Innovate Perú y PUCP', 1, '2019-05-17 14:27:20', '2019-05-17 14:27:20', NULL),
	(780, 675, 'Book Media', 'Difundir', 1, '2019-11-06 20:03:08', '2019-11-06 20:03:08', NULL),
	(943, 798, 'En voz alta: Audioteca para personas con disc', 'Publicar notas en webs y gestionar entrevista', 1, '2020-04-23 03:22:19', '2020-04-23 03:22:19', NULL),
	(977, 823, 'Difusión Booktrailer.pe', 'Difundir nota o entrevistas de la herramienta', 1, '2020-05-21 17:55:11', '2020-05-21 17:55:11', NULL),
	(1651, 1360, 'Fiestas patrias', 'Entrevistas', 1, '2021-07-26 20:01:01', '2021-07-26 20:12:44', NULL);

-- Volcando estructura para tabla makingconn.plataformas
CREATE TABLE IF NOT EXISTS `plataformas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.plataformas: ~5 rows (aproximadamente)
INSERT INTO `plataformas` (`id`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Web', '2020-04-25 17:36:07', '2020-04-25 17:36:07', NULL),
	(2, 'Televisión', '2019-10-02 16:39:14', '2019-10-02 16:39:14', NULL),
	(3, 'Radio', '2021-03-06 04:50:46', '2021-03-06 04:50:46', NULL),
	(5, 'Impreso', '2017-01-03 21:50:39', '2017-08-10 21:43:21', NULL),
	(9, 'Social Media', '2019-05-07 20:28:34', '2020-04-29 18:41:04', NULL);

-- Volcando estructura para tabla makingconn.plataforma_clasificacions
CREATE TABLE IF NOT EXISTS `plataforma_clasificacions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plataforma_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plataforma_clasificacions_plataforma_id_foreign` (`plataforma_id`),
  CONSTRAINT `plataforma_clasificacions_plataforma_id_foreign` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.plataforma_clasificacions: ~0 rows (aproximadamente)
INSERT INTO `plataforma_clasificacions` (`id`, `descripcion`, `plataforma_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Señal Abierta', 2, '2021-03-06 04:51:27', '2021-03-06 04:51:27', NULL),
	(2, 'Señal Abierta', 3, '2021-03-06 04:51:27', '2021-03-06 04:51:27', NULL),
	(3, 'Cable Movistar', 2, '2021-03-06 04:51:27', '2021-03-06 04:51:27', NULL),
	(5, 'DirecTV', 2, '2021-03-06 04:51:27', '2021-03-06 04:51:27', NULL),
	(6, 'URL', 1, '2021-03-06 04:51:27', '2021-03-06 04:51:27', NULL),
	(10, 'Formato', 5, '2021-03-06 04:51:27', '2021-03-06 04:51:27', NULL),
	(14, 'Facebook', 9, '2019-05-07 20:30:33', '2019-05-07 20:30:33', NULL),
	(15, 'Youtube', 9, '2019-05-07 20:30:33', '2019-05-07 20:30:33', NULL),
	(16, 'Twitter', 9, '2019-05-07 20:30:33', '2019-05-07 20:30:33', NULL),
	(17, 'Instagram', 9, '2019-05-07 20:30:33', '2019-05-07 20:30:33', NULL),
	(18, 'Spotify', 9, '2020-05-08 00:01:48', '2020-05-08 00:01:48', NULL),
	(20, 'LinkedIn', 9, '2020-11-30 21:38:55', '2020-11-30 21:38:55', NULL);

-- Volcando estructura para tabla makingconn.programas
CREATE TABLE IF NOT EXISTS `programas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medio_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programas_medio_id_foreign` (`medio_id`),
  CONSTRAINT `programas_medio_id_foreign` FOREIGN KEY (`medio_id`) REFERENCES `medios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.programas: ~0 rows (aproximadamente)
INSERT INTO `programas` (`id`, `nombre`, `descripcion`, `medio_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(47, 'Primera Fila', 'Notas de cultura y entretenimiento', 76, '2017-07-09 03:10:39', '2017-07-09 03:10:39', NULL),
	(71, 'TV Perú Noticias', 'Noticiero general', 123, '2017-09-10 04:27:45', '2021-07-22 16:37:55', NULL),
	(106, 'La Rotativa del Aire', 'Entrevistas políticas, actualidad y cultura', 76, '2018-03-03 16:09:47', '2018-03-03 16:09:47', NULL),
	(126, 'Escape', 'Suplemento de actividades culturales, entrevi', 22, '2018-04-02 15:06:31', '2018-04-02 15:06:31', NULL),
	(142, 'Qué hacer', 'Programa de actualidad y agenda', 64, '2018-06-05 23:04:54', '2018-06-05 23:04:54', NULL),
	(143, 'Conexión', 'Actualidad y entrevistas.', 76, '2018-06-11 20:23:49', '2020-11-10 00:47:22', NULL),
	(203, 'Entre libros', 'Programa de entrevistas a autores', 64, '2019-02-04 21:50:19', '2019-02-04 21:50:19', NULL),
	(368, 'Diálogo abierto', 'Programa de actualidad', 123, '2020-03-25 19:44:30', '2020-03-25 19:44:30', NULL),
	(710, 'Claro y Sencillo', 'Consejos económicos', 76, '2021-03-06 14:48:03', '2021-07-09 16:31:27', NULL);

-- Volcando estructura para tabla makingconn.programa_contactos
CREATE TABLE IF NOT EXISTS `programa_contactos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `programa_id` bigint unsigned NOT NULL,
  `idContacto` bigint unsigned NOT NULL,
  `tipoInfluencia` tinyint NOT NULL,
  `idsMedioPlataforma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programa_contactos_programa_id_foreign` (`programa_id`),
  KEY `programa_contactos_idcontacto_foreign` (`idContacto`),
  CONSTRAINT `programa_contactos_idcontacto_foreign` FOREIGN KEY (`idContacto`) REFERENCES `personas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `programa_contactos_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2079 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla makingconn.programa_contactos: ~0 rows (aproximadamente)
INSERT INTO `programa_contactos` (`id`, `programa_id`, `idContacto`, `tipoInfluencia`, `idsMedioPlataforma`, `observacion`, `activo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(423, 47, 330, 2, '3', '', 0, '2018-04-12 15:41:51', '2021-07-20 14:37:30', NULL),
	(600, 142, 330, 2, '54,78,193,853', NULL, 0, '2018-10-03 13:58:42', '2021-08-02 18:31:58', NULL),
	(745, 203, 1102, 2, '54,78,193', '', 1, '2019-03-25 22:46:53', '2019-09-17 17:28:08', NULL),
	(839, 71, 1102, 2, '59,60', '', 1, '2019-05-17 14:33:52', '2019-07-01 17:09:58', NULL),
	(966, 143, 306, 2, '3,4,99,514', '', 1, '2019-07-15 22:51:20', '2020-07-31 17:22:42', NULL),
	(1260, 368, 1583, 2, '59', '', 1, '2020-03-25 19:43:01', '2020-04-25 22:07:07', NULL),
	(1276, 126, 330, 2, '5,6', '', 0, '2020-04-23 13:31:57', '2021-04-22 17:31:34', NULL),
	(1277, 710, 1583, 2, '99', '', 1, '2020-04-23 14:45:58', '2020-04-23 20:59:00', NULL),
	(1281, 106, 1102, 2, '4', '', 1, '2020-05-05 15:11:09', '2020-06-12 14:31:27', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
