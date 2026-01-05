/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - db_ecom
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ecom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_ecom`;

/*Table structure for table `order_items` */

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id_order_item` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_produk` int NOT NULL,
  `qty` int NOT NULL,
  `harga` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order_item`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order_items` */

insert  into `order_items`(`id_order_item`,`id_order`,`id_produk`,`qty`,`harga`,`created_at`) values 
(8,4,4,2,25000000,'2025-12-09 14:59:32'),
(9,4,6,1,16499000,'2025-12-09 14:59:32'),
(10,5,6,1,16499000,'2025-12-09 15:23:04'),
(11,6,7,1,17249000,'2025-12-09 17:48:49'),
(12,7,6,1,16499000,'2025-12-09 18:40:54'),
(13,7,7,3,17249000,'2025-12-09 18:40:54'),
(14,8,6,2,16499000,'2025-12-09 20:24:45'),
(15,8,7,2,17249000,'2025-12-09 20:24:45'),
(16,10,4,3,25000000,'2025-12-09 20:52:03'),
(17,10,6,1,16499000,'2025-12-09 20:52:03'),
(18,11,6,1,16499000,'2025-12-09 20:53:09'),
(19,12,31,1,18499000,'2025-12-26 22:57:37'),
(20,13,31,2,18499000,'2025-12-26 23:48:29'),
(21,14,31,1,18499000,'2025-12-26 23:50:00'),
(22,15,31,6,18499000,'2025-12-26 23:53:17'),
(23,15,27,9,1999000,'2025-12-26 23:53:17');

/*Table structure for table `tb_alamat` */

DROP TABLE IF EXISTS `tb_alamat`;

CREATE TABLE `tb_alamat` (
  `id_alamat` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `alamat` text,
  `kota` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_alamat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_alamat` */

insert  into `tb_alamat`(`id_alamat`,`id_user`,`alamat`,`kota`,`provinsi`) values 
(1,8,'Jln. Tukad Batanghari ','Denpasar','Bali'),
(3,8,'jalan babi anjing','Denpasar','Bali');

/*Table structure for table `tb_carts` */

DROP TABLE IF EXISTS `tb_carts`;

CREATE TABLE `tb_carts` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_produk` int NOT NULL,
  `prod_qty` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cart`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_carts` */

insert  into `tb_carts`(`id_cart`,`id_user`,`id_produk`,`prod_qty`,`created_at`) values 
(43,4,6,2,'2025-12-09 19:09:03'),
(48,3,6,2,'2025-12-09 20:27:54'),
(49,3,7,1,'2025-12-09 20:27:58');

/*Table structure for table `tb_kategori` */

DROP TABLE IF EXISTS `tb_kategori`;

CREATE TABLE `tb_kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `popularitas` tinyint NOT NULL DEFAULT '0',
  `gambar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_kategori` */

insert  into `tb_kategori`(`id_kategori`,`nama_kategori`,`slug`,`deskripsi`,`status`,`popularitas`,`gambar`,`meta_title`,`meta_description`,`meta_keywords`,`created_at`) values 
(17,'Macbook','macbook','Ultra-thin, fast performance',0,1,'1764916507.png','Macbook','Ultra-thin, fast performance','Mac','2025-12-05 14:35:07'),
(18,'Iphone','Iphone','Fast, smooth, reliable device',0,1,'1764916605.png','Iphone','Fast, smooth, reliable device','Iphone','2025-12-05 14:36:45'),
(19,'Ipad','ipad','Portable creative work device',0,1,'1764916999.png','Ipad','Portable creative work device','Ipad','2025-12-05 14:43:19'),
(20,'Apple Watch','Apple Watch','Smart, stylish, powerful',0,1,'1765093857.avif','Apple Watch','Smart, stylish, powerful','Apple Watch','2025-12-07 15:47:56'),
(21,'Airpods','Airpods','Premium sound, ultimate focus',0,1,'1765093754.webp','Airpods','Premium sound, ultimate focus','Airpods','2025-12-07 15:49:14'),
(22,'Aksesoris','Aksesoris','Crafted for seamless use.',0,1,'1765094145.webp','Aksesoris','Crafted for seamless use.','Aksesoris','2025-12-07 15:55:45');

/*Table structure for table `tb_orders` */

DROP TABLE IF EXISTS `tb_orders`;

CREATE TABLE `tb_orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `no_tracking` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` int NOT NULL,
  `nama_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pincode` int NOT NULL,
  `total_harga` int NOT NULL,
  `payment_mode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_payment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_orders` */

insert  into `tb_orders`(`id_order`,`no_tracking`,`id_user`,`nama_user`,`email`,`no_telp`,`alamat`,`pincode`,`total_harga`,`payment_mode`,`id_payment`,`status`,`comments`,`created_at`) values 
(4,'aldyne7873727378382',4,'aldin','muhamadaldin@gmail.com','09727378382','timor',30494,66499000,'COD','',1,NULL,'2025-12-09 14:59:32'),
(5,'7818988444',4,'aldin','muhamadaldin@gmail.com','03988444','timor',30494,16499000,'COD','',1,NULL,'2025-12-09 15:23:04'),
(6,'886473837382',4,'suraz','paramasuraqutay@gmail.com','0873837382','sidakarya',2838822,17249000,'COD','',2,NULL,'2025-12-09 17:48:49'),
(7,'9174988444',3,'anjing','muhamadaldin@gmail.com','03988444','anxcssxsx',30494,68246000,'COD','',0,NULL,'2025-12-09 18:40:54'),
(8,'7516988444',3,'e','paramasuraqutay@gmail.com','03988444','timor',233,67496000,'COD','',0,NULL,'2025-12-09 20:24:45'),
(9,'ORD20251209605',8,'babi','paramasuraqutay@gmail.com','03988444','njknjnjnsa',30494,91499000,'COD',NULL,0,NULL,'2025-12-09 20:50:54'),
(10,'ORD20251209213',8,'babi','paramasuraqutay@gmail.com','03988444','njknjnjnsa',30494,91499000,'COD',NULL,0,NULL,'2025-12-09 20:52:03'),
(11,'ORD20251209552',8,'anjing','muhamadaldin@gmail.com','03988444','eee',30494,16499000,'COD',NULL,0,NULL,'2025-12-09 20:53:09'),
(12,'ORD20251226469',8,'nopal','abidian@gmail.com','0293883','1',9838383,18499000,'COD',NULL,0,NULL,'2025-12-26 22:57:37'),
(13,'ORD20251226647',8,'nopal','abidian@gmail.com','0293883','2',9838383,36998000,'COD',NULL,0,NULL,'2025-12-26 23:48:29'),
(14,'ORD20251226741',8,'lol','abidiannaufal450@gmail.com','0293883','1',9838383,18499000,'COD',NULL,0,NULL,'2025-12-26 23:50:00'),
(15,'ORD20251226983',8,'nopal','abidian@gmail.com','0293883','1',9838383,128985000,'COD',NULL,0,NULL,'2025-12-26 23:53:17');

/*Table structure for table `tb_orders_log` */

DROP TABLE IF EXISTS `tb_orders_log`;

CREATE TABLE `tb_orders_log` (
  `order_id` int DEFAULT NULL,
  `log_sts` tinyint DEFAULT NULL,
  `log_admin` int DEFAULT NULL,
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_orders_log` */

insert  into `tb_orders_log`(`order_id`,`log_sts`,`log_admin`,`keterangan`,`created_at`) values 
(5,1,8,'zz mengubah status orderan dari 1 menjadi 0','2025-12-19 17:21:57'),
(5,0,8,'zz mengubah status orderan dari 0 menjadi 1','2025-12-19 17:22:00');

/*Table structure for table `tb_produk` */

DROP TABLE IF EXISTS `tb_produk`;

CREATE TABLE `tb_produk` (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `headline` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga_asli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `gambar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_kategori` int NOT NULL,
  `qty` int NOT NULL,
  `status` tinyint NOT NULL,
  `popularitas` tinyint NOT NULL,
  `meta_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_keywords` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_produk` */

insert  into `tb_produk`(`id_produk`,`nama_produk`,`slug`,`headline`,`deskripsi`,`harga_asli`,`harga_jual`,`gambar`,`id_kategori`,`qty`,`status`,`popularitas`,`meta_title`,`meta_description`,`meta_keywords`,`created_at`) values 
(9,'EarPods (USB-C)','EarPods-(USB-C)','menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Sehingga lebih nyaman dipakai daripada headphone model earbud lainnya.\r\n\r\nSpeaker dalam EarPods dirancang untuk memaksimalkan output suara dengan perangkat favorit Anda, sehingga Anda selalu mendapatkan audio berkualitas tinggi.',359000,329000,'1766127997.jpeg',22,100,0,0,'EarPods (USB-C)','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Sehingga lebih nyaman dipakai daripada headphone model earbud lainnya.\r\n\r\nSpeaker dalam EarPods dirancang untuk memaksimalkan output suara dengan perangkat favorit Anda, sehingga Anda selalu mendapatkan audio berkualitas tinggi.','EarPods (USB-C)','2025-12-19 15:06:37'),
(10,'140W USB-C Power Adapter','140W-USB-C-Power-Adapter','Adaptor Daya USB-C 140 W memberikan pengisian daya yang cepat dan efisien','Adaptor Daya USB-C 140 W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian. Kompatibel dengan berbagai kabel pengisian daya USB-C. Apple menyarankan pemasangan adaptor daya ini dengan MacBook Pro 16 inci (2021) menggunakan Kabel USB-C ke MagSafe 3 untuk memanfaatkan kemampuan pengisian cepat, sehingga Anda bisa mendapatkan pengisian daya dari 0 menjadi 50 persen dalam waktu sekitar 30 menit.',1799000,1699000,'1766128146.jpeg',22,100,0,0,'140W USB-C Power Adapter','Adaptor Daya USB-C 140 W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian. Kompatibel dengan berbagai kabel pengisian daya USB-C. Apple menyarankan pemasangan adaptor daya ini dengan MacBook Pro 16 inci (2021) menggunakan Kabel USB-C ke MagSafe 3 untuk memanfaatkan kemampuan pengisian cepat, sehingga Anda bisa mendapatkan pengisian daya dari 0 menjadi 50 persen dalam waktu sekitar 30 menit.','140W USB-C Power Adapter','2025-12-19 15:09:06'),
(11,'Magic Mouse (USB-C)','Magic-Mouse-(USB-C)','Magic Mouse hadir tanpa kabel dan dapat diisi ulang','Magic Mouse hadir tanpa kabel dan dapat diisi ulang, dengan desain alas yang optimal, sehingga bisa meluncur tanpa hambatan di meja Anda. Permukaan Multi-Touch memungkinkan Anda melakukan gerakan sederhana, seperti mengusap pada halaman web dan menggulir dokumen.\r\nDengan baterai yang dapat diisi ulang, Magic Mouse bisa tahan selama satu bulan atau lebih. Magic Mouse siap untuk langsung digunakan dan otomatis melakukan pairing dengan Mac.\r\n\r\nMagic Mouse dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.',1899000,1799000,'1766128243.jpeg',22,100,0,0,'Magic Mouse (USB-C)','Magic Mouse hadir tanpa kabel dan dapat diisi ulang, dengan desain alas yang optimal, sehingga bisa meluncur tanpa hambatan di meja Anda. Permukaan Multi-Touch memungkinkan Anda melakukan gerakan sederhana, seperti mengusap pada halaman web dan menggulir dokumen.\r\nDengan baterai yang dapat diisi ulang, Magic Mouse bisa tahan selama satu bulan atau lebih. Magic Mouse siap untuk langsung digunakan dan otomatis melakukan pairing dengan Mac.\r\n\r\nMagic Mouse dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.','Magic Mouse (USB-C)','2025-12-19 15:10:43'),
(12,'USB-C Digital AV Multiport Adapter','USB-C-Digital-AV-Multiport-Adapter','Dengan Adaptor Multiport AV Digital USB-C, Anda dapat menghubungkan Mac, iPad, atau iPhone yang memiliki port USB-C ke layar HDMI','Dengan Adaptor Multiport AV Digital USB-C, Anda dapat menghubungkan Mac, iPad, atau iPhone yang memiliki port USB-C ke layar HDMI, sekaligus menghubungkan perangkat USB standar dan kabel pengisi daya USB-C.\r\n\r\nAdaptor ini memungkinkan Anda menayangkan layar Mac, iPad, atau iPhone yang memiliki port USB-C ke TV atau layar dengan port HDMI.\r\n\r\n3840 x 2160 pada kecepatan 60 Hz pada:\r\niPhone 15, iPhone 15 Plus, iPhone 15 Pro, iPhone 15 Pro Max, iPad Air (generasi ke-5), iPad Pro 11-inci, iPad Pro 12,9 inci (generasi ke-3 dan lebih baru), MacBook Pro (16 inci, 2019), MacBook Pro (15 inci, 2017 dan lebih baru), MacBook Pro (13 inci, empat port Thunderbolt 3, 2020), MacBook Air (2020), iMac (Retina 5K, 27 inci, 2017 dan lebih baru), iMac (Retina 4K, 21,5 inci, 2017 dan lebih baru), dan iMac Pro (2017 dan lebih baru)\r\n\r\n1080p pada kecepatan 60 Hz atau UHD (3840 x 2160) pada kecepatan 30 Hz pada:\r\niPad Air (generasi ke-4), MacBook Air (2018 dan lebih baru), MacBook Pro (13 inci, 2016 dan lebih baru), MacBook Pro (15 inci, 2016), iMac (non-Retina, 21,5‑inci, 2017), dan Mac mini (2018)\r\n\r\nCukup hubungkan adaptor ke port USB-C atau Thunderbolt 3 (USB-C) pada Mac, iPad, atau iPhone, lalu ke TV atau proyektor melalui kabel HDMI (dijual terpisah).\r\n\r\nGunakan port USB standar untuk menghubungkan perangkat, seperti flash drive atau kamera atau kabel USB, untuk penyelarasan dan pengisian daya perangkat iOS. Anda juga bisa menghubungkan kabel pengisian daya ke port USB-C untuk mengisi daya Mac, iPad, atau iPhone.',1799000,1599000,'1766128421.jpeg',22,100,0,0,'USB-C Digital AV Multiport Adapter','Dengan Adaptor Multiport AV Digital USB-C, Anda dapat menghubungkan Mac, iPad, atau iPhone yang memiliki port USB-C ke layar HDMI, sekaligus menghubungkan perangkat USB standar dan kabel pengisi daya USB-C.\r\n\r\nAdaptor ini memungkinkan Anda menayangkan layar Mac, iPad, atau iPhone yang memiliki port USB-C ke TV atau layar dengan port HDMI.\r\n\r\n3840 x 2160 pada kecepatan 60 Hz pada:\r\niPhone 15, iPhone 15 Plus, iPhone 15 Pro, iPhone 15 Pro Max, iPad Air (generasi ke-5), iPad Pro 11-inci, iPad Pro 12,9 inci (generasi ke-3 dan lebih baru), MacBook Pro (16 inci, 2019), MacBook Pro (15 inci, 2017 dan lebih baru), MacBook Pro (13 inci, empat port Thunderbolt 3, 2020), MacBook Air (2020), iMac (Retina 5K, 27 inci, 2017 dan lebih baru), iMac (Retina 4K, 21,5 inci, 2017 dan lebih baru), dan iMac Pro (2017 dan lebih baru)\r\n\r\n1080p pada kecepatan 60 Hz atau UHD (3840 x 2160) pada kecepatan 30 Hz pada:\r\niPad Air (generasi ke-4), MacBook Air (2018 dan lebih baru), MacBook Pro (13 inci, 2016 dan lebih baru), MacBook Pro (15 inci, 2016), iMac (non-Retina, 21,5‑inci, 2017), dan Mac mini (2018)\r\n\r\nCukup hubungkan adaptor ke port USB-C atau Thunderbolt 3 (USB-C) pada Mac, iPad, atau iPhone, lalu ke TV atau proyektor melalui kabel HDMI (dijual terpisah).\r\n\r\nGunakan port USB standar untuk menghubungkan perangkat, seperti flash drive atau kamera atau kabel USB, untuk penyelarasan dan pengisian daya perangkat iOS. Anda juga bisa menghubungkan kabel pengisian daya ke port USB-C untuk mengisi daya Mac, iPad, atau iPhone.','USB-C Digital AV Multiport Adapter','2025-12-19 15:13:41'),
(13,'Earpods With 3.5 mm Headphone Plug','Earpods-With-3.5-mm-Headphone-Plug','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga.','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Hal ini membuatnya lebih nyaman untuk lebih banyak orang daripada headphone bergaya earbud lainnya.\r\nSpeaker di dalam EarPods telah dirancang untuk memaksimalkan output suara dan meminimalkan kehilangan suara, yang berarti Anda mendapatkan audio berkualitas tinggi.\r\n\r\nEarPods juga menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan dengan mencubit kabel.\r\n\r\nSpesifikasi Teknis\r\nUmum\r\nDengan Remote dan Mikrofon\r\n\r\nPersyaratan Sistem\r\n• Remote dan mikrofon didukung oleh semua model iPod, iPhone, dan iPad (tidak semua model mendukung fungsi volume naik/turun). Audio didukung oleh semua model iPod.\r\n• Memerlukan perangkat lunak versi 1.0.3 untuk iPod nano (generasi ke-4), 2.0.1 untuk iPod classic (120 GB), dan 2.2 atau lebih baru untuk iPod touch (generasi ke-2).\r\n',569000,499000,'1766128615.jpeg',22,256,0,0,'Earpods With 3.5 mm Headphone Plug','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Hal ini membuatnya lebih nyaman untuk lebih banyak orang daripada headphone bergaya earbud lainnya.\r\nSpeaker di dalam EarPods telah dirancang untuk memaksimalkan output suara dan meminimalkan kehilangan suara, yang berarti Anda mendapatkan audio berkualitas tinggi.\r\n\r\nEarPods juga menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan dengan mencubit kabel.\r\n\r\nSpesifikasi Teknis\r\nUmum\r\nDengan Remote dan Mikrofon\r\n\r\nPersyaratan Sistem\r\n• Remote dan mikrofon didukung oleh semua model iPod, iPhone, dan iPad (tidak semua model mendukung fungsi volume naik/turun). Audio didukung oleh semua model iPod.\r\n• Memerlukan perangkat lunak versi 1.0.3 untuk iPod nano (generasi ke-4), 2.0.1 untuk iPod classic (120 GB), dan 2.2 atau lebih baru untuk iPod touch (generasi ke-2).\r\n','Earpods With 3.5 mm Headphone Plug','2025-12-19 15:16:55'),
(14,'240W USB-C Charger Cable (2m)','240W-USB-C-Charger-Cable (2m)','Kabel pengisian daya 2 meter ini dibuat dengan desain anyaman — dengan konektor USB-C di kedua ujungnya','Kabel pengisian daya 2 meter ini dibuat dengan desain anyaman — dengan konektor USB-C di kedua ujungnya — dan sangat ideal untuk pengisian daya, penyelarasan, dan transfer data di antara perangkat USB-C. Kabel ini mendukung pengisian daya hingga 240 watt dan transfer data pada kecepatan USB 2. Pasangkan Kabel Pengisian Daya USB-C dengan adaptor daya USB-C yang kompatibel untuk mengisi daya perangkat Anda dengan mudah dari stopkontak di dinding dan memanfaatkan kemampuan pengisian cepat. Adaptor daya USB-C dijual terpisah.',599000,499000,'1766128844.jpeg',22,80,0,0,'240W USB-C Charger Cable (2m)','Kabel pengisian daya 2 meter ini dibuat dengan desain anyaman — dengan konektor USB-C di kedua ujungnya — dan sangat ideal untuk pengisian daya, penyelarasan, dan transfer data di antara perangkat USB-C. Kabel ini mendukung pengisian daya hingga 240 watt dan transfer data pada kecepatan USB 2. Pasangkan Kabel Pengisian Daya USB-C dengan adaptor daya USB-C yang kompatibel untuk mengisi daya perangkat Anda dengan mudah dari stopkontak di dinding dan memanfaatkan kemampuan pengisian cepat. Adaptor daya USB-C dijual terpisah.','240W USB-C Charger Cable (2m)','2025-12-19 15:20:44'),
(15,'USB-C Woven Charge Cable (1m)','USB-C-Woven-Charge-Cable (1m)','Kabel pengisian daya 1 meter ini dibuat dengan desain anyaman — dengan konektor USB-C di kedua ujungnya','Kabel pengisian daya 1 meter ini dibuat dengan desain anyaman — dengan konektor USB-C di kedua ujungnya — dan sangat ideal untuk pengisian daya, penyelarasan, dan transfer data di antara perangkat USB-C. Kabel ini mendukung pengisian daya hingga 60 watt dan transfer data pada kecepatan USB 2. Pasangkan Kabel Pengisian Daya USB-C dengan adaptor daya USB-C yang kompatibel untuk mengisi daya perangkat Anda dengan mudah dari stopkontak di dinding dan memanfaatkan kemampuan pengisian cepat. Adaptor daya USB-C dijual terpisah.',499000,399000,'1766128996.jpeg',22,70,0,0,'USB-C Woven Charge Cable (1m)','Kabel pengisian daya 1 meter ini dibuat dengan desain anyaman — dengan konektor USB-C di kedua ujungnya — dan sangat ideal untuk pengisian daya, penyelarasan, dan transfer data di antara perangkat USB-C. Kabel ini mendukung pengisian daya hingga 60 watt dan transfer data pada kecepatan USB 2. Pasangkan Kabel Pengisian Daya USB-C dengan adaptor daya USB-C yang kompatibel untuk mengisi daya perangkat Anda dengan mudah dari stopkontak di dinding dan memanfaatkan kemampuan pengisian cepat. Adaptor daya USB-C dijual terpisah.','USB-C Woven Charge Cable (1m)','2025-12-19 15:23:16'),
(16,'35W Dual USB-C Port Power Adapter','35W-Dual-USB-C-Port-Power-Adapter','Adaptor Daya Port USB-C Ganda 35 W memungkinkan Anda mengisi daya dua perangkat secara bersamaan, baik di rumah, kantor, atau saat bepergian. ','Adaptor Daya Port USB-C Ganda 35 W memungkinkan Anda mengisi daya dua perangkat secara bersamaan, baik di rumah, kantor, atau saat bepergian. Apple merekomendasikan untuk menggunakannya dengan MacBook Air. Anda juga dapat menggunakannya dengan iPhone, iPad, Apple Watch, dan AirPods.\r\n\r\nPasangkan adaptor daya ini dengan World Travel Adapter Kit untuk mengisi daya di wilayah lain di seluruh dunia. Kabel pengisian daya dijual terpisah.',1399000,1199000,'1766129092.jpeg',22,373,0,0,'35W Dual USB-C Port Power Adapter','Adaptor Daya Port USB-C Ganda 35 W memungkinkan Anda mengisi daya dua perangkat secara bersamaan, baik di rumah, kantor, atau saat bepergian. Apple merekomendasikan untuk menggunakannya dengan MacBook Air. Anda juga dapat menggunakannya dengan iPhone, iPad, Apple Watch, dan AirPods.\r\n\r\nPasangkan adaptor daya ini dengan World Travel Adapter Kit untuk mengisi daya di wilayah lain di seluruh dunia. Kabel pengisian daya dijual terpisah.','35W Dual USB-C Port Power Adapter','2025-12-19 15:24:52'),
(17,'Earpods With Lightning Connector','Earpods-With-Lightning-Connector','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga.','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Hal ini membuatnya lebih nyaman untuk lebih banyak orang daripada headphone bergaya earbud lainnya.\r\nSpeaker di dalam EarPods telah dirancang untuk memaksimalkan output suara dan meminimalkan kehilangan suara, yang berarti Anda mendapatkan audio berkualitas tinggi.\r\n\r\nEarPods dengan Konektor Lightning juga menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan dengan mencubit kabel.',599000,499000,'1766129220.jpeg',22,455,0,0,'Earpods With Lightning Connector','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Hal ini membuatnya lebih nyaman untuk lebih banyak orang daripada headphone bergaya earbud lainnya.\r\nSpeaker di dalam EarPods telah dirancang untuk memaksimalkan output suara dan meminimalkan kehilangan suara, yang berarti Anda mendapatkan audio berkualitas tinggi.\r\n\r\nEarPods dengan Konektor Lightning juga menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan dengan mencubit kabel.','Earpods With Lightning Connector','2025-12-19 15:27:00'),
(18,'EarPods (USB-C)','EarPods-(USB-C)','Speaker dalam EarPods dirancang untuk memaksimalkan output suara dengan perangkat favorit Anda, sehingga Anda selalu mendapatkan audio berkualitas tinggi.','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Sehingga lebih nyaman dipakai daripada headphone model earbud lainnya.\r\n\r\nEarPods (USB-C) juga menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan cukup dengan menekan remote.',469000,329000,'1766129555.jpeg',22,332,0,0,'EarPods (USB-C)','Tidak seperti earbud bundar tradisional, desain EarPods ditentukan oleh geometri telinga. Sehingga lebih nyaman dipakai daripada headphone model earbud lainnya.\r\n\r\nEarPods (USB-C) juga menyertakan remote bawaan yang memungkinkan Anda menyesuaikan volume, mengontrol pemutaran musik dan video, dan menjawab atau mengakhiri panggilan cukup dengan menekan remote.','EarPods (USB-C)','2025-12-19 15:32:35'),
(19,'Magic Mouse, Silver','Magic,Mouse,Silver','Baterai internalnya luar biasa tahan lama sehingga daya Magic Mouse tahan selama satu bulan atau lebih.','Baterai internalnya luar biasa tahan lama sehingga daya Magic Mouse tahan selama satu bulan atau lebih. Magic Mouse siap untuk langsung digunakan dan otomatis melakukan pairing dengan Mac, serta dilengkapi Kabel anyam USB-C ke Lightning yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menghubungkan ke port USB-C pada Mac.',1599000,1299000,'1766129667.jpeg',22,162,0,0,'Magic Mouse, Silver','Baterai internalnya luar biasa tahan lama sehingga daya Magic Mouse tahan selama satu bulan atau lebih. Magic Mouse siap untuk langsung digunakan dan otomatis melakukan pairing dengan Mac, serta dilengkapi Kabel anyam USB-C ke Lightning yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menghubungkan ke port USB-C pada Mac.','Magic Mouse, Silver','2025-12-19 15:34:27'),
(20,'70W USB-C Power Adapter','70W-USB-C-Power-Adapter','Adaptor Daya USB-C 70 W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian.','Adaptor Daya USB-C 70 W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian.',1399000,999000,'1766130229.jpeg',22,653,0,0,'70W USB-C Power Adapter','Adaptor Daya USB-C 70 W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian.','70W USB-C Power Adapter','2025-12-19 15:43:49'),
(21,'96W USB-C Power Adapter','96W-USB-C-Power-Adapter','Adaptor Daya USB-C 96W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian.','Adaptor Daya USB-C 96W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian. Meskipun adaptor daya ini kompatibel dengan perangkat yang memiliki port USB-C, Apple merekomendasikan pairing dengan MacBook Pro 16 inci untuk pengisian daya yang optimal. Kabel pengisian daya dijual terpisah.',1799000,1599000,'1766130302.jpeg',22,236,0,0,'96W USB-C Power Adapter','Adaptor Daya USB-C 96W memberikan pengisian daya yang cepat dan efisien di rumah, kantor, atau saat bepergian. Meskipun adaptor daya ini kompatibel dengan perangkat yang memiliki port USB-C, Apple merekomendasikan pairing dengan MacBook Pro 16 inci untuk pengisian daya yang optimal. Kabel pengisian daya dijual terpisah.','96W USB-C Power Adapter','2025-12-19 15:45:02'),
(22,'Magic Trackpad, Silver','Magic,Trackpad,Silver','Magic Trackpad otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya.','Magic Trackpad otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya. Baterai internalnya yang luar biasa tahan lama bisa bertahan selama satu bulan atau lebih, dan dilengkapi Kabel anyam USB-C ke Lightning yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menghubungkan ke port USB-C pada Mac.',2499000,2199000,'1766130380.jpeg',22,195,0,0,'Magic Trackpad, Silver','Magic Trackpad otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya. Baterai internalnya yang luar biasa tahan lama bisa bertahan selama satu bulan atau lebih, dan dilengkapi Kabel anyam USB-C ke Lightning yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menghubungkan ke port USB-C pada Mac.','Magic Trackpad, Silver','2025-12-19 15:46:20'),
(23,'Keyboard (USB-C) with Touch ID and Numeric Keypad (2024)','Keyboard-(USB-C)-with-Touch-ID-and-Numeric-Keypad-(2024)','Magic Keyboard tersedia dengan Touch ID, yang menyediakan autentikasi cepat, mudah, dan aman untuk masuk dan pembelian.','Magic Keyboard tersedia dengan Touch ID, yang menyediakan autentikasi cepat, mudah, dan aman untuk masuk dan pembelian.\r\nMagic Keyboard dengan Touch ID dan Keypad Numerik menghadirkan pengalaman pengetikan yang sangat nyaman dan presisi. Magic Keyboard dengan Touch ID dan Keypad Numerik memiliki tata letak yang diperluas, dengan kontrol navigasi dokumen untuk pengguliran cepat dan tombol panah ukuran penuh, yang sangat cocok untuk bermain game. Keypad Numerik juga cocok untuk spreadsheet dan aplikasi keuangan. Magic Keyboard dengan Touch ID dan Keypad Numerik hadir tanpa kabel dan dilengkapi baterai dapat diisi ulang yang tahan selama satu bulan atau lebih. 1 Magic Keyboard otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya.\r\n\r\nMagic Keyboard dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.',3299000,2999000,'1766130470.jpeg',22,235,0,0,'Keyboard (USB-C) with Touch ID and Numeric Keypad (2024)','Magic Keyboard tersedia dengan Touch ID, yang menyediakan autentikasi cepat, mudah, dan aman untuk masuk dan pembelian.\r\nMagic Keyboard dengan Touch ID dan Keypad Numerik menghadirkan pengalaman pengetikan yang sangat nyaman dan presisi. Magic Keyboard dengan Touch ID dan Keypad Numerik memiliki tata letak yang diperluas, dengan kontrol navigasi dokumen untuk pengguliran cepat dan tombol panah ukuran penuh, yang sangat cocok untuk bermain game. Keypad Numerik juga cocok untuk spreadsheet dan aplikasi keuangan. Magic Keyboard dengan Touch ID dan Keypad Numerik hadir tanpa kabel dan dilengkapi baterai dapat diisi ulang yang tahan selama satu bulan atau lebih. 1 Magic Keyboard otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya.\r\n\r\nMagic Keyboard dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.','Keyboard (USB-C) with Touch ID and Numeric Keypad (2024)','2025-12-19 15:47:50'),
(24,'Magic Trackpad (USB-C)','Magic-Trackpad -USB-C)','Magic Trackpad hadir tanpa kabel dan dapat diisi ulang, dilengkapi beragam gerakan Multi-Touch dan teknologi Force Touch.','Magic Trackpad hadir tanpa kabel dan dapat diisi ulang, dilengkapi beragam gerakan Multi-Touch dan teknologi Force Touch. Sensor di balik permukaan trackpad memungkinkan Anda mendeteksi perbedaan halus dalam jumlah tekanan yang Anda berikan, membawa lebih banyak fungsi pada ujung jari Anda, mempererat koneksi antara Anda dan semua konten Anda. Magic Trackpad dilengkapi dengan area permukaan kaca sepenuhnya, sehingga gerakan menggulir dan mengusap pada konten favorit Anda menjadi lebih produktif dan menyenangkan dibanding sebelumnya.\r\nMagic Trackpad otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya. Dengan baterai yang dapat diisi ulang, Magic Trackpad bisa tahan selama satu bulan atau lebih.\r\n\r\nMagic Trackpad dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.',2999000,2899000,'1766130534.jpeg',22,456,0,0,'Magic Trackpad (USB-C)','Magic Trackpad hadir tanpa kabel dan dapat diisi ulang, dilengkapi beragam gerakan Multi-Touch dan teknologi Force Touch. Sensor di balik permukaan trackpad memungkinkan Anda mendeteksi perbedaan halus dalam jumlah tekanan yang Anda berikan, membawa lebih banyak fungsi pada ujung jari Anda, mempererat koneksi antara Anda dan semua konten Anda. Magic Trackpad dilengkapi dengan area permukaan kaca sepenuhnya, sehingga gerakan menggulir dan mengusap pada konten favorit Anda menjadi lebih produktif dan menyenangkan dibanding sebelumnya.\r\nMagic Trackpad otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya. Dengan baterai yang dapat diisi ulang, Magic Trackpad bisa tahan selama satu bulan atau lebih.\r\n\r\nMagic Trackpad dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.','Magic Trackpad (USB-C)','2025-12-19 15:48:54'),
(25,'Magic Keyboard (USB-C)','Magic-Keyboard-(USB-C)','Magic Keyboard menghadirkan pengalaman pengetikan yang sangat nyaman dan presisi. ','Magic Keyboard menghadirkan pengalaman pengetikan yang sangat nyaman dan presisi. Magic Keyboard hadir tanpa kabel dan dapat diisi ulang, dengan baterai internal luar biasa tahan lama yang tahan selama satu bulan atau lebih.1 Magic Keyboard otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya.\r\n\r\nMagic Keyboard dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.',1799000,1699000,'1766130661.jpeg',22,156,0,0,'Magic Keyboard (USB-C)','Magic Keyboard menghadirkan pengalaman pengetikan yang sangat nyaman dan presisi. Magic Keyboard hadir tanpa kabel dan dapat diisi ulang, dengan baterai internal luar biasa tahan lama yang tahan selama satu bulan atau lebih.1 Magic Keyboard otomatis melakukan pairing dengan Mac Anda, jadi Anda dapat langsung menggunakannya.\r\n\r\nMagic Keyboard dilengkapi port USB-C dan disertai Kabel Pengisian Daya USB-C anyam yang memungkinkan Anda memasangkan dan mengisi daya dengan cara menyambungkan ke port USB-C pada Mac, sehingga Anda dapat mengisi daya semua perangkat favorit Anda hanya dengan satu kabel.','Magic Keyboard (USB-C)','2025-12-19 15:51:01'),
(26,'Thunderbolt 4 USB-C Pro Cable (3m)','Thunderbolt 4-USB-C-Pro-Cable (3m)','mendukung transfer data Thunderbolt 3, Thunderbolt 4, dan USB 4 hingga 40 Gb/dtk, transfer data USB 3 hingga 10 Gb/dtk.','Dengan desain pilin hitam yang tidak kusut saat digulung, kabel sepanjang 3 meter ini mendukung transfer data Thunderbolt 3, Thunderbolt 4, dan USB 4 hingga 40 Gb/dtk, transfer data USB 3 hingga 10 Gb/dtk, output video DisplayPort (HBR3), dan pengisian daya hingga 100 W. Gunakan kabel ini untuk menghubungkan Mac dengan port Thunderbolt 3 atau 4 (USB-C) ke layar dan perangkat Thunderbolt (USB-C) dan USB seperti Studio Display, Pro Display XDR, dock, dan hard drive. Anda juga bisa menggunakan kabel ini untuk menghubungkan iPhone 15 Pro ke Mac.',2599000,2499000,'1766130762.jpeg',22,474,0,0,'Thunderbolt 4 USB-C Pro Cable (3m)','Dengan desain pilin hitam yang tidak kusut saat digulung, kabel sepanjang 3 meter ini mendukung transfer data Thunderbolt 3, Thunderbolt 4, dan USB 4 hingga 40 Gb/dtk, transfer data USB 3 hingga 10 Gb/dtk, output video DisplayPort (HBR3), dan pengisian daya hingga 100 W. Gunakan kabel ini untuk menghubungkan Mac dengan port Thunderbolt 3 atau 4 (USB-C) ke layar dan perangkat Thunderbolt (USB-C) dan USB seperti Studio Display, Pro Display XDR, dock, dan hard drive. Anda juga bisa menggunakan kabel ini untuk menghubungkan iPhone 15 Pro ke Mac.','Thunderbolt 4 USB-C Pro Cable (3m)','2025-12-19 15:52:42'),
(27,'Thunderbolt 4 Pro Cable (1.8M)','Thunderbolt-4-Pro-Cable-(1.8M)','kabel sepanjang 3 meter ini mendukung transfer data Thunderbolt 3, Thunderbolt 4, dan USB 4 hingga 40 Gb/dtk, transfer data USB 3 hingga 10 Gb/dtk.','Dengan desain pilin hitam yang tidak kusut saat digulung, kabel sepanjang 3 meter ini mendukung transfer data Thunderbolt 3, Thunderbolt 4, dan USB 4 hingga 40 Gb/dtk, transfer data USB 3 hingga 10 Gb/dtk, output video DisplayPort (HBR3), dan pengisian daya hingga 100 W. Gunakan kabel ini untuk menghubungkan Mac dengan port Thunderbolt 3 atau 4 (USB-C) ke layar dan perangkat Thunderbolt (USB-C) dan USB seperti Studio Display, Pro Display XDR, dock, dan hard drive. Anda juga bisa menggunakan kabel ini untuk menghubungkan iPhone 15 Pro ke Mac.',2099000,1999000,'1766130878.jpg',22,742,0,0,'Thunderbolt 4 Pro Cable (1.8M)','Dengan desain pilin hitam yang tidak kusut saat digulung, kabel sepanjang 3 meter ini mendukung transfer data Thunderbolt 3, Thunderbolt 4, dan USB 4 hingga 40 Gb/dtk, transfer data USB 3 hingga 10 Gb/dtk, output video DisplayPort (HBR3), dan pengisian daya hingga 100 W. Gunakan kabel ini untuk menghubungkan Mac dengan port Thunderbolt 3 atau 4 (USB-C) ke layar dan perangkat Thunderbolt (USB-C) dan USB seperti Studio Display, Pro Display XDR, dock, dan hard drive. Anda juga bisa menggunakan kabel ini untuk menghubungkan iPhone 15 Pro ke Mac.','Thunderbolt 4 Pro Cable (1.8M)','2025-12-19 15:54:38'),
(28,'USB C VGA Multiport Adapter','USB C VGA Multiport Adapter','Dengan Adaptor Multiport VGA USB-C, Anda dapat menghubungkan Mac dan iPad Pro yang memiliki port USB-C atau Thunderbolt 3 (USB-C) ke layar VGA, selagi juga menghubungkan perangkat USB standar dan kabel pengisi daya USB-C.','Adaptor Multiport VGA USB-C memungkinkan Anda menayangkan layar Mac atau iPad Pro ke TV atau layar dengan port VGA dalam format HD hingga 1080p. Adaptor ini juga menghasilkan output konten video seperti film dan video rekaman. Cukup hubungkan adaptor ke port USB-C atau Thunderbolt 3 (USB-C) pada Mac atau iPad, lalu ke TV atau proyektor melalui kabel VGA (dijual terpisah).\r\n\r\nGunakan port USB standar untuk menghubungkan perangkat seperti flash drive atau kamera atau kabel USB untuk penyelarasan dan pengisian daya iPhone, iPad, atau iPod. Anda juga bisa menghubungkan kabel pengisian daya ke port USB-C untuk mengisi daya Mac atau iPad Pro.',1599000,1499000,'1766130932.jpeg',22,246,0,0,'USB C VGA Multiport Adapter','Adaptor Multiport VGA USB-C memungkinkan Anda menayangkan layar Mac atau iPad Pro ke TV atau layar dengan port VGA dalam format HD hingga 1080p. Adaptor ini juga menghasilkan output konten video seperti film dan video rekaman. Cukup hubungkan adaptor ke port USB-C atau Thunderbolt 3 (USB-C) pada Mac atau iPad, lalu ke TV atau proyektor melalui kabel VGA (dijual terpisah).\r\n\r\nGunakan port USB standar untuk menghubungkan perangkat seperti flash drive atau kamera atau kabel USB untuk penyelarasan dan pengisian daya iPhone, iPad, atau iPod. Anda juga bisa menghubungkan kabel pengisian daya ke port USB-C untuk mengisi daya Mac atau iPad Pro.','USB C VGA Multiport Adapter','2025-12-19 15:55:32'),
(29,'Mac mini M4 Pro','Mac-min-M4-Pro','Sebuah device yang kecil dan simpel untuk di gunakan.','Sebuah device yang kecil dan simpel untuk digunakan dimana pun dan tidak memakan ruang yang banyak dengan spesifikasi menggunakan Apple M4 Pro Chip (CPU 12-Core, GPU 16-Core), dengan memori 24 GB dan penyimpanan 512GB dan juga memiliki koneksi Wi-Fi +Ethernet',23499000,22999000,'1766131968.jpeg',17,133,0,1,'Mac mini M4 Pro','Sebuah device yang kecil dan simpel untuk digunakan dimana pun dan tidak memakan ruang yang banyak dengan spesifikasi menggunakan Apple M4 Pro Chip (CPU 12-Core, GPU 16-Core), dengan memori 24 GB dan penyimpanan 512GB dan juga memiliki koneksi Wi-Fi +Ethernet','Mac mini M4 Pro','2025-12-19 16:12:48'),
(30,'Mac mini M4 ','Mac-mini-M4','Sebuah device yang kecil dan simpel untuk digunakan.','Sebuah device yang kecil dan simpel untuk digunakan dimana pun dan tidak memakan ruang yang banyak dengan spesifikasi menggunakan Apple M4 Pro Chip (CPU 12-Core, GPU 16-Core), dengan memori 24 GB dan penyimpanan 512GB dan juga memiliki koneksi Wi-Fi +Ethernet',23499000,22999000,'1766132308.jpeg',17,547,0,1,'Mac mini M4 ','Sebuah device yang kecil dan simpel untuk digunakan dimana pun dan tidak memakan ruang yang banyak dengan spesifikasi menggunakan Apple M4 Pro Chip (CPU 12-Core, GPU 16-Core), dengan memori 24 GB dan penyimpanan 512GB dan juga memiliki koneksi Wi-Fi +Ethernet','Mac mini M4 ','2025-12-19 16:18:28'),
(31,'24-inch iMac with Retina 4.5K display M3','24-inch-iMac-with-Retina-4.5K-display-M3','iMac 24-inch M3 adalah komputer desktop all-in-one yang kuat.','iMac 24-inch M3 adalah komputer desktop all-in-one yang ringkas dan kuat, ditenagai chip Apple M3 untuk performa lebih cepat dalam tugas sehari-hari, desain ikonik tipis penuh warna, Layar Retina 4.5K 24 inci cemerlang dengan warna luas (P3) dan True Tone, dilengkapi kamera 1080p, mikrofon berkualitas studio, sistem speaker enam speaker, Magic Keyboard & Mouse warna senada, serta berbagai opsi RAM (8GB/16GB), penyimpanan (256GB/512GB/1TB/2TB SSD), dan port (2 atau 4 port Thunderbolt/USB 4), menjadikannya ideal untuk kreativitas dan produktivitas dengan ekosistem Apple yang terintegrasi. ',22499000,18499000,'1766132575.jpeg',17,611,0,1,'24-inch iMac with Retina 4.5K display M3','iMac 24-inch M3 adalah komputer desktop all-in-one yang ringkas dan kuat, ditenagai chip Apple M3 untuk performa lebih cepat dalam tugas sehari-hari, desain ikonik tipis penuh warna, Layar Retina 4.5K 24 inci cemerlang dengan warna luas (P3) dan True Tone, dilengkapi kamera 1080p, mikrofon berkualitas studio, sistem speaker enam speaker, Magic Keyboard & Mouse warna senada, serta berbagai opsi RAM (8GB/16GB), penyimpanan (256GB/512GB/1TB/2TB SSD), dan port (2 atau 4 port Thunderbolt/USB 4), menjadikannya ideal untuk kreativitas dan produktivitas dengan ekosistem Apple yang terintegrasi. ','24-inch iMac with Retina 4.5K display M3','2025-12-19 16:22:55'),
(32,'24-inch iMac with Retina 4.5K display M4','24-inch-iMac-with-Retina-4.5K-display-M4','iMac 24-inch M3 adalah komputer desktop all-in-one yang ringkas dan kuat, ditenagai chip Apple M3','iMac 24-inch M3 adalah komputer desktop all-in-one yang ringkas dan kuat, ditenagai chip Apple M3 untuk performa lebih cepat dalam tugas sehari-hari, desain ikonik tipis penuh warna, Layar Retina 4.5K 24 inci cemerlang dengan warna luas (P3) dan True Tone, dilengkapi kamera 1080p, mikrofon berkualitas studio, sistem speaker enam speaker, Magic Keyboard & Mouse warna senada, serta berbagai opsi RAM (8GB/16GB), penyimpanan (256GB/512GB/1TB/2TB SSD), dan port (2 atau 4 port Thunderbolt/USB 4), menjadikannya ideal untuk kreativitas dan produktivitas dengan ekosistem Apple yang terintegrasi. ',21999000,21499000,'1766133071.jpeg',17,143,0,1,'24-inch iMac with Retina 4.5K display M4','iMac 24-inch M3 adalah komputer desktop all-in-one yang ringkas dan kuat, ditenagai chip Apple M3 untuk performa lebih cepat dalam tugas sehari-hari, desain ikonik tipis penuh warna, Layar Retina 4.5K 24 inci cemerlang dengan warna luas (P3) dan True Tone, dilengkapi kamera 1080p, mikrofon berkualitas studio, sistem speaker enam speaker, Magic Keyboard & Mouse warna senada, serta berbagai opsi RAM (8GB/16GB), penyimpanan (256GB/512GB/1TB/2TB SSD), dan port (2 atau 4 port Thunderbolt/USB 4), menjadikannya ideal untuk kreativitas dan produktivitas dengan ekosistem Apple yang terintegrasi. ','24-inch iMac with Retina 4.5K display M4','2025-12-19 16:31:11'),
(33,'15-inch MacBook Air','15-inch-MacBook-Air','laptop tipis dan ringan dengan layar Liquid Retina 15,3 inci yang imersif.','laptop tipis dan ringan dengan layar Liquid Retina 15,3 inci yang imersif, ditenagai oleh chip Apple M-series (M3 atau M4 terbaru), menawarkan kinerja cepat untuk tugas sehari-hari, daya tahan baterai sepanjang hari (hingga 18 jam), desain portabel dengan ketebalan hanya 1,15 cm, serta dilengkapi port MagSafe, Thunderbolt, dan jack headphone',21499000,20999000,'1766133495.jpeg',17,631,0,1,'15-inch MacBook Air','laptop tipis dan ringan dengan layar Liquid Retina 15,3 inci yang imersif, ditenagai oleh chip Apple M-series (M3 atau M4 terbaru), menawarkan kinerja cepat untuk tugas sehari-hari, daya tahan baterai sepanjang hari (hingga 18 jam), desain portabel dengan ketebalan hanya 1,15 cm, serta dilengkapi port MagSafe, Thunderbolt, dan jack headphone','15-inch MacBook Air','2025-12-19 16:38:15'),
(34,'13-inch MacBook Air','13-inch-MacBook-Air','laptop ultra-portabel dari Apple yang dikenal tipis, ringan, bertenaga','laptop ultra-portabel dari Apple yang dikenal tipis, ringan, bertenaga (terutama dengan chip Apple Silicon seperti M1/M2/M4), memiliki Layar Liquid Retina yang cerah (mendukung miliaran warna, True Tone), desain tanpa kipas (silent), daya tahan baterai luar biasa, serta fitur seperti kamera FaceTime HD, speaker stereo, dan berbagai pilihan konektivivitas (Thunderbolt/USB-C, MagSafe) untuk produktivitas sehari-hari dan tugas kreatif ringan dalam paket yang elegan dan ringkas.',17999000,16799000,'1766133592.jpeg',17,342,0,1,'13-inch MacBook Air','laptop ultra-portabel dari Apple yang dikenal tipis, ringan, bertenaga (terutama dengan chip Apple Silicon seperti M1/M2/M4), memiliki Layar Liquid Retina yang cerah (mendukung miliaran warna, True Tone), desain tanpa kipas (silent), daya tahan baterai luar biasa, serta fitur seperti kamera FaceTime HD, speaker stereo, dan berbagai pilihan konektivivitas (Thunderbolt/USB-C, MagSafe) untuk produktivitas sehari-hari dan tugas kreatif ringan dalam paket yang elegan dan ringkas.','13-inch MacBook Air','2025-12-19 16:39:52'),
(35,'13-inch MacBook Air (M1 Chip)','13-inch-MacBook-Air-(M1 Chip)','laptop tipis dan ringan dari Apple yang bertenaga oleh chip Apple M1','laptop tipis dan ringan dari Apple yang bertenaga oleh chip Apple M1 (CPU 8-core, GPU hingga 8-core), menawarkan performa cepat dan efisien energi tanpa kipas untuk tugas sehari-hari, dengan daya tahan baterai hingga 18 jam, Layar Retina 13,3 inci dengan True Tone, Touch ID, dan port Thunderbolt/USB 4.',15999000,11499000,'1766133703.jpeg',17,234,0,1,'13-inch MacBook Air (M1 Chip)','laptop tipis dan ringan dari Apple yang bertenaga oleh chip Apple M1 (CPU 8-core, GPU hingga 8-core), menawarkan performa cepat dan efisien energi tanpa kipas untuk tugas sehari-hari, dengan daya tahan baterai hingga 18 jam, Layar Retina 13,3 inci dengan True Tone, Touch ID, dan port Thunderbolt/USB 4','13-inch MacBook Air (M1 Chip)','2025-12-19 16:41:43');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id_user`,`nama_user`,`email`,`no_telp`,`password`,`role`,`created_at`) values 
(3,'Kei Uzuki','muhamadaldin@gmail.com','38884844','test',0,'2025-11-25 21:25:29'),
(4,'Sura','paramasuraqutay@gmail.com','087784078923','TESTTEST',1,'2025-11-27 16:55:03'),
(5,'ronni','roni@gmail.com','2939844','lol',0,'2025-11-27 18:40:32'),
(6,'krisna','krisna@gmail.com','028383929','tes',0,'2025-11-27 19:03:50'),
(7,'telorgoreng','telor@gmail.com','9837883','$2y$10$DZ7Sp8dQNL35b1LMuTuaAOfUnpbB0XLKV/3hM/fm4EMVb1c9/aG9a',0,'2025-12-09 15:37:02'),
(8,'zz','haha@gmail.com','0293993','$2y$10$ck2AWVvIufIfWDFHXnAE3usdScekSa/idFjboOHHvekdJ5gG3g4b6',1,'2025-12-09 15:40:13'),
(9,'E','anjing@gmail.com','343','$2y$10$Ca.iaWIE65J4Dn/t1SLlD.rclqMMxxAzHZr/cdmIp1.EyGeL7S1U2',0,'2025-12-09 15:45:42'),
(10,'wiwir','wir@gmail.com','083119973105','$2y$10$5oih6pNsDL5PKLTBIZ.LR.8n/cFCjYmVQQND4U3X0XQyi2RTxpfK6',1,'2025-12-19 15:39:57'),
(11,'awir2','awiwir@gmial.com','083119924110','$2y$10$DgdhAj1/S0cREgbZZc7uS.C7cBvCdyFRw.YMqeRm/kZJgClkk9om2',0,'2025-12-19 16:23:49'),
(12,'aldin boty','emut123@gmail.com','0987654321','$2y$10$S.AUF2M9Wkb9wJzsQhqTXO/LghPLiLWPchWF1SPMG.dS29fRkzEZC',0,'2025-12-27 01:16:07');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
