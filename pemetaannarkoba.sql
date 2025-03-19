/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - pemetaannarkoba
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pemetaannarkoba` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pemetaannarkoba`;

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_app` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'logo-aplikasi/logo.svg',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `applications` */

insert  into `applications`(`id`,`name_app`,`description_app`,`logo`,`address`,`open_days`,`close_days`,`open_time`,`close_time`,`created_at`,`updated_at`) values 
(1,'MyApp','Aplikasi untuk manajemen data.','logo-aplikasi/myapp-logo.svg','Jl. Kebangsaan No. 123','Senin - Jumat','Sabtu - Minggu','08:00:00','17:00:00','2025-01-04 14:06:21','2025-01-04 14:06:21'),
(2,'EduApp','Aplikasi pembelajaran online.','logo-aplikasi/eduapp-logo.svg','Jl. Pendidikan No. 45','Senin - Sabtu','Minggu','07:00:00','15:00:00','2025-01-04 14:06:21','2025-01-04 14:06:21'),
(3,'HealthApp','Aplikasi untuk layanan kesehatan.','logo-aplikasi/healthapp-logo.svg','Jl. Sehat No. 78','Senin - Jumat','Sabtu - Minggu','09:00:00','18:00:00','2025-01-04 14:06:21','2025-01-04 14:06:21');

/*Table structure for table `desa` */

DROP TABLE IF EXISTS `desa`;

CREATE TABLE `desa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_desa` varchar(100) NOT NULL,
  `kecamatan_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `desa` */

insert  into `desa`(`id`,`nama_desa`,`kecamatan_id`) values 
(1,'Badas',1),
(2,'Blaru',1),
(3,'Bringin',1),
(4,'Canggu',1),
(5,'Krecek',1),
(6,'Lamong',1),
(7,'Sekoto',1),
(8,'Tunglur',1),
(9,'Banyakan',2),
(10,'Jabon',2),
(11,'Jatirejo',2),
(12,'Manyaran',2),
(13,'Maron',2),
(14,'Ngablak',2),
(15,'Parang',2),
(16,'Sendang',2),
(17,'Tiron',2),
(18,'Gampeng',3),
(19,'Jongbiru',3),
(20,'Kalibelo',3),
(21,'Kepuhrejo',3),
(22,'Ngebrak',3),
(23,'Plosorejo',3),
(24,'Putih',3),
(25,'Sambirejo',3),
(26,'Sambiresik',3),
(27,'Turus',3),
(28,'Wanengpaten',3),
(29,'Bakalan',4),
(30,'Cerme',4),
(31,'Datengan',4),
(32,'Gambyok',4),
(33,'Grogol',4),
(34,'Kalipang',4),
(35,'Sonorejo',4),
(36,'Sumberejo',4),
(37,'Wonoasri',4),
(38,'Adan-Adan',5),
(39,'Bangkok',5),
(40,'Banyuanyar',5),
(41,'Besuk',5),
(42,'Blimbing',5),
(43,'Bogem',5),
(44,'Gabru',5),
(45,'Gayam',5),
(46,'Gempolan',5),
(47,'Gurah',5),
(48,'Kerkep',5),
(49,'Kranggan',5),
(50,'Ngasem',5),
(51,'Nglumbang',5),
(52,'Sukorejo',5),
(53,'Sumbercangkring',5),
(54,'Tambakrejo',5),
(55,'Tiru Kidul',5),
(56,'Tiru Lor',5),
(57,'Turus',5),
(58,'Wonojoyo',5),
(59,'Banaran',6),
(60,'Bukur',6),
(61,'Jerukgulung',6),
(62,'Jerukwangi',6),
(63,'Jlumbang',6),
(64,'Kandangan',6),
(65,'Karangtengah',6),
(66,'Kasreman',6),
(67,'Kemiri',6),
(68,'Klampisan',6),
(69,'Medowo',6),
(70,'Mlancu',6),
(71,'Blabak',7),
(72,'Cendono',7),
(73,'Kandat',7),
(74,'Karangrejo',7),
(75,'Ngletih',7),
(76,'Ngreco',7),
(77,'Pule',7),
(78,'Purworejo',7),
(79,'Ringinsari',7),
(80,'Selosari',7),
(81,'Sumberjo',7),
(82,'Tegalan',7),
(83,'Bangsongan',8),
(84,'Baye',8),
(85,'Jambu',8),
(86,'Kayen Kidul',8),
(87,'Mukuh',8),
(88,'Nanggungan',8),
(89,'Padangan',8),
(90,'Sambirobyong',8),
(91,'Sekaran',8),
(92,'Semambung',8),
(93,'Senden',8),
(94,'Sukoharjo',8),
(95,'Besowo',9),
(96,'Brumbung',9),
(97,'Damarwulan',9),
(98,'Kampungbaru',9),
(99,'Kebonrejo',9),
(100,'Keling',9),
(101,'Kencong',9),
(102,'Kepung',9),
(103,'Krenceng',9),
(104,'Siman',9),
(105,'Banjaranyar',10),
(106,'Bendosari',10),
(107,'Bleber',10),
(108,'Butuh',10),
(109,'Jabang',10),
(110,'Jambean',10),
(111,'Kanigoro',10),
(112,'Karangtalun',10),
(113,'Krandang',10),
(114,'Kras',10),
(115,'Mojosari',10),
(116,'Nyawangan',10),
(117,'Pelas',10),
(118,'Purwodadi',10),
(119,'Rejomulyo',10),
(120,'Setonorejo',10),
(121,'Balongjeruk',11),
(122,'Dungus',11),
(123,'Juwet',11),
(124,'Kapas',11),
(125,'Kapi',11),
(126,'Klepek',11),
(127,'Kunjang',11),
(128,'Kuwik',11),
(129,'Pakis',11),
(130,'Parelor',11),
(131,'Tengger Lor',11),
(132,'Wonorejo',11),
(133,'Blimbing',12),
(134,'Jugo',12),
(135,'Kedawung',12),
(136,'Keniten',12),
(137,'Kranding',12),
(138,'Kraton',12),
(139,'Maesan',12),
(140,'Mlati',12),
(141,'Mojo',12),
(142,'Mondo',12),
(143,'Ngadi',12),
(144,'Ngetrep',12),
(145,'Pamongan',12),
(146,'Petok',12),
(147,'Petungroto',12),
(148,'Ploso',12),
(149,'Ponggok',12),
(150,'Sukoanyar',12),
(151,'Surat',12),
(152,'Tambibendo',12),
(153,'Badal',13),
(154,'Badal Pandean',13),
(155,'Banggle',13),
(156,'Banjarejo',13),
(157,'Bedug',13),
(158,'Branggahan',13),
(159,'Dukuh',13),
(160,'Mangunrejo',13),
(161,'Ngadiluwih',13),
(162,'Purwokerto',13),
(163,'Rembang',13),
(164,'Rembangkepuh',13),
(165,'Seketi',13),
(166,'Slumbung',13),
(167,'Tales',13),
(168,'Wonorejo',13),
(169,'Babadan',14),
(170,'Bedali',14),
(171,'Jagul',14),
(172,'Kunjang',14),
(173,'Manggis',14),
(174,'Margourip',14),
(175,'Ngancar',14),
(176,'Pandantoyo',14),
(177,'Sempu',14),
(178,'Sugihwaras',14),
(179,'Doko',15),
(180,'Gogorante',15),
(181,'Karangrejo',15),
(182,'Kwadungan',15),
(183,'Nambaan',15),
(184,'Ngasem',15),
(185,'Paron',15),
(186,'Sukorejo',15),
(187,'Sumberejo',15),
(188,'Toyoresmi',15),
(189,'Tugurejo',15),
(190,'Wonocatur',15),
(191,'Bendo',16),
(192,'Bulupasar',16),
(193,'Jagung',16),
(194,'Kambingan',16),
(195,'Menang',16),
(196,'Pagu',16),
(197,'Semanding',16),
(198,'Semen',16),
(199,'Sitimerto',16),
(200,'Tanjung',16),
(201,'Tengger Kidul',16),
(202,'Wates',16),
(203,'Wonosari',16),
(204,'Dawuhan Kidul',17),
(205,'Jambangan',17),
(206,'Janti',17),
(207,'Kedungmalang',17),
(208,'Kepuh',17),
(209,'Kwaron',17),
(210,'Maduretno',17),
(211,'Minggiran',17),
(212,'Ngampel',17),
(213,'Papar',17),
(214,'Pehkulon',17),
(215,'Pehwetan',17),
(216,'Puhjajar',17),
(217,'Purwotengah',17),
(218,'Srikaton',17),
(219,'Sukomoro',17),
(220,'Tanon',17),
(221,'Bendo',18),
(222,'Darungan',18),
(223,'Gedangsewu',18),
(224,'Pelem',18),
(225,'Sambirejo',18),
(226,'Sidorejo',18),
(227,'Sumberbendo',18),
(228,'Tertek',18),
(229,'Tulungrejo',18),
(230,'Pare',18),
(231,'Banjarejo',19),
(232,'Bogokidul',19),
(233,'Kayen Lor',19),
(234,'Langenharjo',19),
(235,'Mejono',19),
(236,'Mojoayu',19),
(237,'Mojokerep',19),
(238,'Ngino',19),
(239,'Payaman',19),
(240,'Plemahan',19),
(241,'Puhjarak',19),
(242,'Ringinpitu',19),
(243,'Sebet',19),
(244,'Sidowarek',19),
(245,'Sukoharjo',19),
(246,'Tegowangi',19),
(247,'Wonokerto',19),
(248,'Brenggolo',20),
(249,'Donganti',20),
(250,'Gondang',20),
(251,'Jarak',20),
(252,'Kawedusan',20),
(253,'Kayunan',20),
(254,'Klanderan',20),
(255,'Panjer',20),
(256,'Ploso Kidul',20),
(257,'Ploso Lor',20),
(258,'Pranggang',20),
(259,'Sepawon',20),
(260,'Sumberagung',20),
(261,'Wonorejo Trisulo',20),
(262,'Asmorobangun',21),
(263,'Gadungan',21),
(264,'Manggis',21),
(265,'Puncu',21),
(266,'Satak',21),
(267,'Sidomulyo',21),
(268,'Watugede',21),
(269,'Wonorejo',21),
(270,'Belor',22),
(271,'Blawe',22),
(272,'Bulu',22),
(273,'Dawuhan',22),
(274,'Dayu',22),
(275,'Jantok',22),
(276,'Karangpakis',22),
(277,'Kempleng',22),
(278,'Ketawang',22),
(279,'Klampitan',22),
(280,'Mekikis',22),
(281,'Merjoyo',22),
(282,'Mranggen',22),
(283,'Muneng',22),
(284,'Pandansari',22),
(285,'Pesing',22),
(286,'Purwoasri',22),
(287,'Purwodadi',22),
(288,'Sidomulyo',22),
(289,'Sumberjo',22),
(290,'Tugu',22),
(291,'Wonotengah',22),
(292,'Woromarto',22),
(293,'Batuaji',23),
(294,'Dawung',23),
(295,'Deyeng',23),
(296,'Jemekan',23),
(297,'Nambakan',23),
(298,'Purwodadi',23),
(299,'Ringinrejo',23),
(300,'Sambi',23),
(301,'Selodono',23),
(302,'Srikaton',23),
(303,'Susuhbango',23),
(304,'Bobang',24),
(305,'Bulu',24),
(306,'Joho',24),
(307,'Kanyoran',24),
(308,'Kedak',24),
(309,'Pagung',24),
(310,'Puhrubuh',24),
(311,'Puhsarang',24),
(312,'Selopanggung',24),
(313,'Semen',24),
(314,'Sidomulyo',24),
(315,'Titik',24),
(316,'Blimbing',25),
(317,'Bulusari',25),
(318,'Cengkok',25),
(319,'Jati',25),
(320,'Kaliboto',25),
(321,'Kalirong',25),
(322,'Kedungsari',25),
(323,'Kerep',25),
(324,'Sumberduren',25),
(325,'Tarokan',25),
(326,'Duwet',26),
(327,'Gadungan',26),
(328,'Jajar',26),
(329,'Janti',26),
(330,'Joho',26),
(331,'Karanganyar',26),
(332,'Pagu',26),
(333,'Plaosan',26),
(334,'Pojok',26),
(335,'Segaran',26),
(336,'Sidomulyo',26),
(337,'Silir',26),
(338,'Sumberagung',26),
(339,'Tawang',26),
(340,'Tempurejo',26),
(341,'Tunge',26),
(342,'Wates',26),
(343,'Wonorejo',26);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `kecamatan` */

DROP TABLE IF EXISTS `kecamatan`;

CREATE TABLE `kecamatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_kecamatan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `kecamatan` */

insert  into `kecamatan`(`id`,`nama_kecamatan`) values 
(1,'Badas'),
(2,'Banyakan'),
(3,'Gampengrejo'),
(4,'Grogol'),
(5,'Gurah'),
(6,'Kandangan'),
(7,'Kandat'),
(8,'Kayen Kidul'),
(9,'Kepung'),
(10,'Kras'),
(11,'Kunjang'),
(12,'Mojo'),
(13,'Ngadiluwih'),
(14,'Ngancar'),
(15,'Ngasem'),
(16,'Pagu'),
(17,'Papar'),
(18,'Pare'),
(19,'Plemahan'),
(20,'Plosoklaten'),
(21,'Puncu'),
(22,'Purwoasri'),
(23,'Ringinrejo'),
(24,'Semen'),
(25,'Tarokan'),
(26,'Wates');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('pending','processed','feedback') DEFAULT 'pending',
  `admin_feedback` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `messages` */

insert  into `messages`(`id`,`nama`,`email`,`subject`,`message`,`status`,`admin_feedback`,`created_at`,`updated_at`) values 
(1,'ss','tt4@gmail.com','ssa','aa','pending','-','2025-03-09 21:49:33','2025-03-09 21:49:33'),
(2,'aa','tobel22@gmail.com','aa','aa','pending','-','2025-03-09 21:49:43','2025-03-09 21:49:43'),
(3,'ss','tobel22@gmail.com','ssss','ss','pending','-',NULL,NULL),
(4,'aa','po55@gmail.com','aa','s','pending','-',NULL,NULL),
(5,'aa','po55@gmail.com','aa','aa','pending','-',NULL,NULL),
(6,'ssss','tobel22@gmail.com','ss','ss','pending','-',NULL,NULL),
(7,'ss','po55@gmail.com','xx','ss','pending','-',NULL,NULL),
(8,'aa','po55@gmail.com','aa','p','pending','-',NULL,NULL),
(9,'aa','po55@gmail.com','aa','k','pending','-',NULL,NULL),
(10,'aa','po55@gmail.com','aa','k','pending','-',NULL,NULL),
(11,'aa','po55@gmail.com','aa','k','pending','-',NULL,NULL),
(12,'ss','tobel22@gmail.com','aa','l','pending','-',NULL,NULL),
(13,'ss','po55@gmail.com','aa','j','pending','-',NULL,NULL),
(14,'ss','tobel22@gmail.com','aaa','s','pending','-',NULL,NULL),
(15,' d','tobel22@gmail.com','d','s','pending','-',NULL,NULL),
(16,'ss','tt4@gmail.com','ss','k','pending','-',NULL,NULL),
(17,'aa','po55@gmail.com','aa','i','pending','-',NULL,NULL),
(18,'aa','po55@gmail.com','ss','d','pending','-',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_11_20_075336_create_applications_table',1),
(6,'2023_11_20_105307_create_queue_numbers_table',1),
(7,'2023_11_21_051328_create_patients_table',1);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `patients` */

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue_number_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old` int NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `late_queue_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pemeriksaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Diperiksa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `patients` */

insert  into `patients`(`id`,`queue_number_id`,`name`,`address`,`old`,`gender`,`late_queue_number`,`status_pemeriksaan`,`created_at`,`updated_at`) values 
(1,3,'Ahmad Fauzi','Jl. Merdeka No. 45',32,'Laki-laki',NULL,'Belum Diperiksa','2025-01-04 14:07:30','2025-01-04 14:07:30'),
(2,4,'Siti Aisyah','Jl. Mawar No. 12',28,'Perempuan',NULL,'Belum Diperiksa','2025-01-04 14:07:30','2025-01-04 14:07:30'),
(3,NULL,'Budi Santoso','Jl. Kenangan No. 89',40,'Laki-Laki',NULL,'Sudah Diperiksa','2025-01-04 14:07:30','2025-03-09 00:46:33'),
(4,NULL,'Rina Melati','Jl. Anggrek No. 33',35,'Perempuan',NULL,'Sudah Diperiksa','2025-01-04 14:07:30','2025-02-19 20:05:52'),
(5,NULL,'Dewi Sartika','Jl. Kamboja No. 7',25,'Perempuan',NULL,'Sudah Diperiksa','2025-01-04 14:07:30','2025-02-19 19:54:33'),
(6,6,'Fatimah','Kediri',40,'Perempuan',NULL,'Belum Diperiksa','2025-02-19 22:10:00','2025-02-19 22:10:00'),
(7,7,'Maulana','Kediri',50,'Laki-Laki',NULL,'Belum Diperiksa','2025-02-20 00:15:11','2025-02-20 00:15:11'),
(8,8,'Nana','Kediri',50,'Laki-Laki',NULL,'Belum Diperiksa','2025-03-07 00:42:18','2025-03-07 00:42:18'),
(9,9,'Bagas','Kediri',60,'Laki-Laki',NULL,'Belum Diperiksa','2025-03-07 01:02:13','2025-03-07 01:02:13'),
(10,10,'ss','ss',23,'Perempuan',NULL,'Belum Diperiksa','2025-03-07 01:14:40','2025-03-07 01:14:40');

/*Table structure for table `pengaduan` */

DROP TABLE IF EXISTS `pengaduan`;

CREATE TABLE `pengaduan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `kategori` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL,
  `deskripsi` text NOT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pengaduan` */

insert  into `pengaduan`(`id`,`nama`,`no_hp`,`kategori`,`lokasi`,`waktu`,`deskripsi`,`bukti`,`created_at`,`updated_at`) values 
(1,'ss','344','Peredaran Narkotika','kediri','2025-03-13 16:31:00','fghskjajlk','bukti_pengaduan/dd9SKVmQcURGHJI6iw90SPB1eH4j0ekKAG6Cy5nC.jpg','2025-03-07 16:32:30','2025-03-07 16:32:30'),
(2,'ww','344','Penyalahgunaan Narkotika','po','2025-03-07 16:32:00','9879','bukti_pengaduan/fzENHgrJcnXJQ2q1Kcr1ULZWjATtzowTBXvCnjuF.jpg','2025-03-07 16:33:07','2025-03-07 16:33:07'),
(3,'jj','868','Penyalahgunaan Narkotika','tubk','2025-03-07 16:37:00','hkhl','bukti_pengaduan//Andromeda-Dwi-Laksono-2.png','2025-03-07 16:38:07','2025-03-07 16:38:07'),
(5,'oo','97768','Permasalahan Lain','hkhk','2025-03-07 16:46:00','khk','bukti_pengaduan//images (3).jpg','2025-03-07 16:46:56','2025-03-07 16:46:56'),
(7,'hk','868','Peredaran Narkotika','kjhk','2025-03-07 17:19:00','skhk','bukti_pengaduan//images (3)_2.jpg','2025-03-07 17:19:29','2025-03-07 17:19:29'),
(9,'hkh','7586','Peredaran Narkotika','kjlkj','2025-03-07 17:37:00','shkj','bukti_pengaduan//images (3)_4.jpg','2025-03-07 17:37:40','2025-03-07 17:37:40'),
(12,'ss','89','Penyalahgunaan Narkotika','hk','2025-03-07 17:55:00','shk','bukti_pengaduan//images (3)_5.jpg','2025-03-07 17:55:50','2025-03-07 17:55:50'),
(13,'jk','879','Penyalahgunaan Narkotika','jhks','2025-03-07 18:00:00','hsk','bukti_pengaduan//images (3)_6.jpg','2025-03-07 18:00:45','2025-03-07 18:00:45'),
(14,'jk','879','Penyalahgunaan Narkotika','jhks','2025-03-07 18:00:00','hsk','bukti_pengaduan//images (3)_7.jpg','2025-03-07 18:01:52','2025-03-07 18:01:52'),
(15,'hj','79','Peredaran Narkotika','kjl','2025-03-07 18:12:00','skjk','bukti_pengaduan//images (3)_8.jpg','2025-03-07 18:12:41','2025-03-07 18:12:41'),
(16,'hj','79','Peredaran Narkotika','kjl','2025-03-07 18:12:00','skjk','bukti_pengaduan//images (3)_9.jpg','2025-03-07 18:15:38','2025-03-07 18:15:38'),
(17,'ss','768','Penyalahgunaan Narkotika','hk','2025-03-07 18:18:00','skjhkj','bukti_pengaduan//images (3)_10.jpg','2025-03-07 18:18:23','2025-03-07 18:18:23'),
(18,'pp','656979','Peredaran Narkotika','shlkl','2025-03-07 18:20:00','khkjh','bukti_pengaduan//images (3)_11.jpg','2025-03-07 18:21:12','2025-03-07 18:21:12'),
(19,'uuu','123456789','Permasalahan Lain','hsk','2025-03-10 23:47:00','hj','bukti_pengaduan//WhatsApp Image 2024-09-08 at 11.59.19.jpeg','2025-03-10 23:47:53','2025-03-10 23:47:53');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `queue_numbers` */

DROP TABLE IF EXISTS `queue_numbers`;

CREATE TABLE `queue_numbers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number` int unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `queue_numbers` */

insert  into `queue_numbers`(`id`,`number`,`created_at`,`updated_at`) values 
(1,1,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(2,2,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(3,3,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(4,4,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(5,5,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(6,6,'2025-02-19 22:10:00','2025-02-19 22:10:00'),
(7,7,'2025-02-20 00:15:11','2025-02-20 00:15:11'),
(8,8,'2025-03-07 00:42:18','2025-03-07 00:42:18'),
(9,9,'2025-03-07 01:02:13','2025-03-07 01:02:13'),
(10,10,'2025-03-07 01:14:40','2025-03-07 01:14:40');

/*Table structure for table `sosialisasi` */

DROP TABLE IF EXISTS `sosialisasi`;

CREATE TABLE `sosialisasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text,
  `gambar` varchar(255) NOT NULL,
  `status` enum('aktif','nonaktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'nonaktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sosialisasi` */

insert  into `sosialisasi`(`id`,`judul`,`deskripsi`,`gambar`,`status`,`created_at`,`updated_at`) values 
(1,'d','jj','sosialisasi/1741626661_images (3).jpg','aktif','2025-03-08 03:20:51','2025-03-11 00:11:39'),
(4,'Sosialisasi Bersinar Bersih Narkoba','PPP','sosialisasi/images (4).jpg','nonaktif','2025-03-08 17:11:56','2025-03-11 02:40:09'),
(5,'ss','ss','sosialisasi/images (4).jpg','nonaktif','2025-03-10 23:51:58','2025-03-10 23:51:58'),
(6,'Pemberantasan Narkoba','sdfghjk','sosialisasi/images (4).jpg','aktif','2025-03-11 02:34:01','2025-03-11 11:40:14'),
(8,'sss','aa','sosialisasi/images (3).jpg','aktif','2025-03-11 02:39:18','2025-03-11 02:39:18');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`username`,`is_admin`,`gender`,`image`,`alamat`,`tanggal_lahir`,`password`,`created_at`,`updated_at`) values 
(1,'admin','admin@gmail.com','admin',1,'Perempuan','profil-images/Ankty23nNTP9IMjVPyKHgA6htY4a1d4XXWlAgegb.jpg','Medan kota','2025-03-01','$2y$12$euKb49uAxlR/fTzX.BnEIOvs43APlj5jNpS6j4Ph8n9sLJm8vbsmG','2025-03-11 15:10:20','2025-03-19 10:48:38'),
(2,'user user','user@gmail.com','user',0,'Laki-Laki','profil-images/xQPfRkiM5cKfDySvOjRsMXQsXJxxPLQhzAo7xxYW.jpg','alamat sini','2025-02-28','$2y$12$w4YuA81kbqoVv60xP3wT5.Wa52GJ03Dsin137yiFcB1MAz8HaVTny','2025-03-11 15:24:27','2025-03-19 10:49:15'),
(3,'Kepala BNN','bnn@gmail.com','bnn',2,'Male','profil-images/man.jpeg','kediri','2000-01-01','$2y$12$RDDqkTrjwBlmdUrvR.Nsr.yRzNWIqLqnFKTN/jz25XR35vet.0H8G','2025-03-19 10:47:10','2025-03-19 10:47:10');

/*Table structure for table `wargas` */

DROP TABLE IF EXISTS `wargas`;

CREATE TABLE `wargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `status_narkoba` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `desa_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kecamatan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `wargas` */

insert  into `wargas`(`id`,`nik`,`nama`,`alamat`,`jk`,`status_narkoba`,`desa_id`,`kecamatan_id`,`created_at`,`updated_at`) values 
(1,'688','kjk','khkj','Laki-Laki','Ngadiluwih','Ngadiluwih','Ngadiluwih','2025-02-19 23:31:50','2025-02-19 23:31:50'),
(2,'099798','fefe','kediri','Laki-Laki','Negatif Narkoba','186','15','2025-03-06 23:20:50','2025-03-06 23:20:50'),
(3,'1234567890123456','sssa','Kediri','Laki-Laki','Negatif Narkoba','44','5','2025-03-07 00:07:07','2025-03-07 00:07:07'),
(4,'1234567890123459','Popo','Jl. Manggis 29','Perempuan','Negatif Narkoba','173','14','2025-03-07 00:16:53','2025-03-07 00:16:53'),
(5,'1234567890123458','haha','Kediri','Laki-Laki','Negatif Narkoba','19','3','2025-03-07 01:03:16','2025-03-07 01:03:16'),
(6,'1234567890123457','hehe','Kediri','Laki-Laki','Negatif Narkoba','64','6','2025-03-07 01:10:55','2025-03-07 01:10:55'),
(14,'1234567890176523','pp','mk','Perempuan','Positif Narkoba','11','2','2025-03-07 02:14:52','2025-03-19 10:44:34'),
(15,'1234567890735261','fghj','jj','Perempuan','Belum Diketahui','20','3','2025-03-08 17:33:35','2025-03-08 17:33:35'),
(16,'1234567890435267','kj','slk','Laki-Laki','Belum Diketahui','31','4','2025-03-08 17:39:17','2025-03-08 17:39:17'),
(17,'1234567890637283','adsf','hgsksl','Laki-Laki','Belum Diketahui','31','4','2025-03-08 19:22:52','2025-03-08 19:22:52'),
(18,'1234567890813425','jhskl','sjhkjla','Laki-Laki','Belum Diketahui','99','9','2025-03-08 19:23:21','2025-03-08 19:23:21'),
(19,'0987654321987234','sjhk','wertyuio','Perempuan','Belum Diketahui','114','10','2025-03-08 20:33:08','2025-03-08 20:33:08'),
(20,'0987654321653765','mnk','ghjk','Laki-Laki','Belum Diketahui','31','4','2025-03-08 20:44:48','2025-03-08 20:44:48'),
(21,'1234567890241582','k','pp','Perempuan','Belum Diketahui','54','5','2025-03-09 00:53:31','2025-03-09 01:10:12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
