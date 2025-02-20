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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `patients` */

insert  into `patients`(`id`,`queue_number_id`,`name`,`address`,`old`,`gender`,`late_queue_number`,`status_pemeriksaan`,`created_at`,`updated_at`) values 
(1,3,'Ahmad Fauzi','Jl. Merdeka No. 45',32,'Laki-laki',NULL,'Belum Diperiksa','2025-01-04 14:07:30','2025-01-04 14:07:30'),
(2,4,'Siti Aisyah','Jl. Mawar No. 12',28,'Perempuan',NULL,'Belum Diperiksa','2025-01-04 14:07:30','2025-01-04 14:07:30'),
(3,NULL,'Budi Santoso','Jl. Kenangan No. 89',40,'Laki-laki',NULL,'Sudah Diperiksa','2025-01-04 14:07:30','2025-02-19 19:55:22'),
(4,NULL,'Rina Melati','Jl. Anggrek No. 33',35,'Perempuan',NULL,'Sudah Diperiksa','2025-01-04 14:07:30','2025-02-19 20:05:52'),
(5,NULL,'Dewi Sartika','Jl. Kamboja No. 7',25,'Perempuan',NULL,'Sudah Diperiksa','2025-01-04 14:07:30','2025-02-19 19:54:33'),
(6,6,'Fatimah','Kediri',40,'Perempuan',NULL,'Belum Diperiksa','2025-02-19 22:10:00','2025-02-19 22:10:00'),
(7,7,'Maulana','Kediri',50,'Laki-Laki',NULL,'Belum Diperiksa','2025-02-20 00:15:11','2025-02-20 00:15:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `queue_numbers` */

insert  into `queue_numbers`(`id`,`number`,`created_at`,`updated_at`) values 
(1,1,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(2,2,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(3,3,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(4,4,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(5,5,'2025-01-04 14:08:58','2025-01-04 14:08:58'),
(6,6,'2025-02-19 22:10:00','2025-02-19 22:10:00'),
(7,7,'2025-02-20 00:15:11','2025-02-20 00:15:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`username`,`is_admin`,`gender`,`image`,`alamat`,`tanggal_lahir`,`password`,`created_at`,`updated_at`) values 
(1,'admin','admin@gmail.com','admin',1,'Male','john_doe.jpg','123 Main Street, Cityville','1990-01-01','$2y$12$LiHuhUDUWqyU6bXobgEm.uggk5rsTq/QGOWEVjvB0cLlwb9svzrnW','2025-01-03 02:50:27','2025-01-03 02:50:27'),
(2,'pengadu','pengadu@gmail.com','pengadu',0,'Male','john_doe.jpg','123','2025-01-24','$2y$12$LiHuhUDUWqyU6bXobgEm.uggk5rsTq/QGOWEVjvB0cLlwb9svzrnW','2025-01-04 14:41:53',NULL);

/*Table structure for table `wargas` */

DROP TABLE IF EXISTS `wargas`;

CREATE TABLE `wargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `dsn_id` varchar(255) NOT NULL,
  `ds_id` varchar(255) NOT NULL,
  `kec_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `wargas` */

insert  into `wargas`(`id`,`nik`,`nama`,`alamat`,`jk`,`dsn_id`,`ds_id`,`kec_id`,`created_at`,`updated_at`) values 
(1,'688','kjk','khkj','Laki-Laki','Ngadiluwih','Ngadiluwih','Ngadiluwih','2025-02-19 23:31:50','2025-02-19 23:31:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
