/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : presensigpsv2

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 20/02/2025 18:57:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_cabang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_cabang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon_cabang` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `radius_cabang` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_cabang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cabang
-- ----------------------------
INSERT INTO `cabang` VALUES ('BGR', 'Bogor', 'Jln. Raya Bogor  no. 27 Kabupaten Bogor', '089671121142', '-7.302118667228677, 108.24403570552717', 30, '2024-06-15 14:36:25', '2024-06-15 14:36:25');
INSERT INTO `cabang` VALUES ('TSM', 'Tasikmalaya', 'Jln. Perintis Kemerdekaan No. 27', '089670444321', '-7.295478120856331, 108.24691103344777', 30, '2024-06-15 14:44:04', '2024-06-15 14:44:04');

-- ----------------------------
-- Table structure for cuti
-- ----------------------------
DROP TABLE IF EXISTS `cuti`;
CREATE TABLE `cuti`  (
  `kode_cuti` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_cuti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_hari` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_cuti`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cuti
-- ----------------------------
INSERT INTO `cuti` VALUES ('C01', 'Tahunan', 12, '2024-06-15 15:03:56', '2024-06-15 15:03:56');
INSERT INTO `cuti` VALUES ('C02', 'Melahirkan', 90, '2024-06-15 15:03:56', '2024-06-15 15:03:56');
INSERT INTO `cuti` VALUES ('C03', 'Khusus', 2, '2024-06-15 15:03:56', '2024-10-14 20:31:20');

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `kode_dept` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dept` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('AKT', 'Akunting', '2024-06-15 14:24:09', '2024-06-15 14:24:23');
INSERT INTO `departemen` VALUES ('ICT', 'Information Technology', '2024-04-27 21:06:16', '2024-06-15 14:24:14');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for hari_libur
-- ----------------------------
DROP TABLE IF EXISTS `hari_libur`;
CREATE TABLE `hari_libur`  (
  `kode_libur` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_libur`) USING BTREE,
  INDEX `hari_libur_kode_cabang_foreign`(`kode_cabang` ASC) USING BTREE,
  CONSTRAINT `hari_libur_kode_cabang_foreign` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hari_libur
-- ----------------------------
INSERT INTO `hari_libur` VALUES ('LB24001', '2024-12-25', 'BGR', 'Hari Natal dan tahun baru', '2024-12-30 21:15:11', '2024-12-30 21:15:11');

-- ----------------------------
-- Table structure for hari_libur_detail
-- ----------------------------
DROP TABLE IF EXISTS `hari_libur_detail`;
CREATE TABLE `hari_libur_detail`  (
  `kode_libur` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `hari_libur_detail_kode_libur_foreign`(`kode_libur` ASC) USING BTREE,
  INDEX `hari_libur_detail_nik_foreign`(`nik` ASC) USING BTREE,
  CONSTRAINT `hari_libur_detail_kode_libur_foreign` FOREIGN KEY (`kode_libur`) REFERENCES `hari_libur` (`kode_libur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hari_libur_detail_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hari_libur_detail
-- ----------------------------
INSERT INTO `hari_libur_detail` VALUES ('LB24001', '12.34.567', '2025-01-31 16:49:22', '2025-01-31 16:49:22');

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `kode_jabatan` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_jabatan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_jabatan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES ('J01', 'Kepala IT', '2024-04-27 21:11:42', '2024-04-27 21:11:42');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_karyawan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jenis_kelamin` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_status_kawin` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pendidikan_terakhir` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_dept` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jabatan` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `status_karyawan` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_jadwal` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pin` smallint NULL DEFAULT NULL,
  `tanggal_nonaktif` date NULL DEFAULT NULL,
  `tanggal_off_gaji` date NULL DEFAULT NULL,
  `lock_location` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lock_jam_kerja` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status_aktif_karyawan` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  INDEX `karyawan_kode_dept_foreign`(`kode_dept` ASC) USING BTREE,
  CONSTRAINT `karyawan_kode_dept_foreign` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES ('12.34.567', '3207321607930001', 'Adam Abdi Al Ala', 'Ciamis', '2024-06-15', 'Ciamis', '089670444321', 'L', 'K3', 'S1', 'BGR', 'AKT', 'J01', '2024-06-15', 'T', '12.34.567.jpg', NULL, NULL, NULL, NULL, '1', '1', '1', '$2y$12$8xL2yTFTBSP1zI7nXZPC6e3TKoJjjxots4bTjBlk.j3QgEiKTNi76', '2024-06-15 14:43:34', '2024-06-15 15:05:59');
INSERT INTO `karyawan` VALUES ('12.44.544', '320732114545445', 'Qiana Aqila Qanita Nadhria', 'Ciamis', '2024-05-25', 'Ciamsi', '0897112124442', 'P', 'TK', 'S3', 'TSM', 'ICT', 'J01', '2024-05-25', 'K', '12.44.544.jpg', NULL, NULL, NULL, NULL, '0', '1', '1', '$2y$12$6IX5KupiBy75i3M7ItqYLeyQcBlENySk9MKI/ZNSC.CQFj02fTlDu', '2024-05-25 14:46:04', '2025-02-01 20:10:58');
INSERT INTO `karyawan` VALUES ('23.00.110', '320732111000111', 'Adam Adifa', 'Ciamis', '2024-05-04', 'Jln. H. Makbul No. 74 Dusun Kadupugur', '085967012122', 'L', 'K2', 'S2', 'TSM', 'ICT', 'J01', '2024-05-04', 'K', '23.00.110.jpg', NULL, NULL, NULL, NULL, '0', '1', '1', '$2y$12$9AXmU5gMd9Cr7f.Rutzrt..UOxU1uRhhK.b2HPanVYn34ubdDGtMe', '2024-05-04 22:01:38', '2024-05-25 14:59:27');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_01_13_163827_add_username_field_to_users', 1);
INSERT INTO `migrations` VALUES (6, '2024_01_14_065610_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (7, '2024_01_15_170203_create_permission_groups_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_01_16_081416_add_id_permission_group_to_permissions', 1);
INSERT INTO `migrations` VALUES (9, '2024_01_16_082530_add_relation_from_permissions_to_permission_groups', 1);
INSERT INTO `migrations` VALUES (10, '2024_04_27_133940_create_karyawans_table', 2);
INSERT INTO `migrations` VALUES (11, '2024_04_27_134826_create_cabangs_table', 3);
INSERT INTO `migrations` VALUES (12, '2024_04_27_140209_create_departemens_table', 4);
INSERT INTO `migrations` VALUES (13, '2024_04_27_140736_create_jabatans_table', 5);
INSERT INTO `migrations` VALUES (14, '2024_04_27_141507_crate_table_status_kawin', 6);
INSERT INTO `migrations` VALUES (15, '2024_05_25_080125_add_column_to_karyawan', 7);
INSERT INTO `migrations` VALUES (16, '2024_06_01_151030_create_relation_karyawan_to_departemen', 8);
INSERT INTO `migrations` VALUES (17, '2024_06_15_075718_create_cutis_table', 9);
INSERT INTO `migrations` VALUES (19, '2024_12_01_143041_create_jamkerjas_table', 10);
INSERT INTO `migrations` VALUES (21, '2024_12_17_221256_create_setjamkerjas_table', 11);
INSERT INTO `migrations` VALUES (22, '2024_12_25_141314_create_hariliburs_table', 12);
INSERT INTO `migrations` VALUES (23, '2024_12_30_143453_create_detailhariliburs_table', 13);
INSERT INTO `migrations` VALUES (24, '2025_01_13_152829_create_setjamkerjabydates_table', 14);
INSERT INTO `migrations` VALUES (25, '2025_01_21_074359_create_userkaryawans_table', 15);
INSERT INTO `migrations` VALUES (26, '2025_01_22_150849_create_presensis_table', 16);
INSERT INTO `migrations` VALUES (27, '2025_01_22_153134_create_setjamkerjabydepts_table', 17);
INSERT INTO `migrations` VALUES (28, '2025_01_22_153959_create_detailsetjamkerjabydepts_table', 18);
INSERT INTO `migrations` VALUES (29, '2025_01_27_083520_create_izinabsens_table', 19);
INSERT INTO `migrations` VALUES (32, '2025_01_28_225208_create_approveizinabsens_table', 20);
INSERT INTO `migrations` VALUES (33, '2025_01_29_110840_create_izinsakits_table', 21);
INSERT INTO `migrations` VALUES (34, '2025_01_29_235629_create_approveizinsakits_table', 22);
INSERT INTO `migrations` VALUES (35, '2025_01_31_052651_create_izincutis_table', 23);
INSERT INTO `migrations` VALUES (36, '2025_02_01_221452_create_approveizincutis_table', 24);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 3);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 4);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permission_groups
-- ----------------------------
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_groups
-- ----------------------------
INSERT INTO `permission_groups` VALUES (1, 'Karyawan', '2024-03-14 16:46:22', '2024-03-14 16:46:22');
INSERT INTO `permission_groups` VALUES (2, 'Departemen', '2024-03-14 16:55:53', '2024-03-14 16:55:53');
INSERT INTO `permission_groups` VALUES (3, 'Cabang', '2024-03-14 17:09:23', '2024-03-14 17:09:23');
INSERT INTO `permission_groups` VALUES (4, 'Cuti', '2024-03-14 17:15:40', '2024-03-14 17:15:40');
INSERT INTO `permission_groups` VALUES (5, 'Presensi', '2024-03-14 17:22:00', '2024-03-14 17:22:00');
INSERT INTO `permission_groups` VALUES (6, 'Jam Kerja', '2024-12-01 21:41:55', '2024-12-01 21:41:55');
INSERT INTO `permission_groups` VALUES (7, 'Haril Libur', '2024-12-25 21:16:11', '2024-12-25 21:16:11');
INSERT INTO `permission_groups` VALUES (8, 'User', '2025-01-21 15:01:51', '2025-01-21 15:01:51');
INSERT INTO `permission_groups` VALUES (10, 'Presensi', '2025-01-22 21:14:08', '2025-01-22 21:14:08');
INSERT INTO `permission_groups` VALUES (11, 'Jam Kerja Departemen', '2025-01-22 22:42:39', '2025-01-22 22:42:39');
INSERT INTO `permission_groups` VALUES (12, 'Izin Absen', '2025-01-27 08:40:47', '2025-01-27 08:40:47');
INSERT INTO `permission_groups` VALUES (13, 'Izin Sakit', '2025-01-29 21:10:31', '2025-01-29 21:10:31');
INSERT INTO `permission_groups` VALUES (14, 'Izin Cuti', '2025-02-01 20:20:35', '2025-02-01 20:20:35');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_permission_group` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE,
  INDEX `permissions_id_permission_group_foreign`(`id_permission_group` ASC) USING BTREE,
  CONSTRAINT `permissions_id_permission_group_foreign` FOREIGN KEY (`id_permission_group`) REFERENCES `permission_groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'karyawan.index', 'web', '2024-03-14 16:46:35', '2024-03-14 16:46:35', 1);
INSERT INTO `permissions` VALUES (2, 'karyawan.create', 'web', '2024-03-14 16:46:44', '2024-03-14 16:46:44', 1);
INSERT INTO `permissions` VALUES (3, 'karyawan.edit', 'web', '2024-03-14 16:46:54', '2024-03-14 16:46:54', 1);
INSERT INTO `permissions` VALUES (4, 'karyawan.show', 'web', '2024-03-14 16:48:11', '2024-03-14 16:48:11', 1);
INSERT INTO `permissions` VALUES (5, 'karyawan.delete', 'web', '2024-03-14 16:48:18', '2024-03-14 16:48:18', 1);
INSERT INTO `permissions` VALUES (6, 'departemen.index', 'web', '2024-03-14 16:56:41', '2024-03-14 16:56:41', 2);
INSERT INTO `permissions` VALUES (7, 'departemen.create', 'web', '2024-03-14 16:57:08', '2024-03-14 16:57:08', 2);
INSERT INTO `permissions` VALUES (8, 'departemen.edit', 'web', '2024-03-14 16:57:16', '2024-03-14 16:57:16', 2);
INSERT INTO `permissions` VALUES (9, 'departemen.delete', 'web', '2024-03-14 16:57:32', '2024-03-14 16:57:32', 2);
INSERT INTO `permissions` VALUES (10, 'cabang.index', 'web', '2024-03-14 17:12:07', '2024-03-14 17:12:07', 3);
INSERT INTO `permissions` VALUES (11, 'cabang.create', 'web', '2024-03-14 17:12:15', '2024-03-14 17:12:15', 3);
INSERT INTO `permissions` VALUES (12, 'cabang.edit', 'web', '2024-03-14 17:12:25', '2024-03-14 17:12:25', 3);
INSERT INTO `permissions` VALUES (13, 'cabang.delete', 'web', '2024-03-14 17:12:41', '2024-03-14 17:12:41', 3);
INSERT INTO `permissions` VALUES (14, 'cuti.index', 'web', '2024-03-14 17:15:53', '2024-03-14 17:15:53', 4);
INSERT INTO `permissions` VALUES (15, 'cuti.create', 'web', '2024-03-14 17:16:00', '2024-03-14 17:16:00', 4);
INSERT INTO `permissions` VALUES (16, 'cuti.edit', 'web', '2024-03-14 17:16:09', '2024-03-14 17:16:09', 4);
INSERT INTO `permissions` VALUES (17, 'cuti.delete', 'web', '2024-03-14 17:16:20', '2024-03-14 17:16:20', 4);
INSERT INTO `permissions` VALUES (18, 'presensi.index', 'web', '2024-03-14 17:22:37', '2025-01-22 21:15:52', 10);
INSERT INTO `permissions` VALUES (19, 'karyawan.lockunlocklocation', 'web', '2024-05-25 15:39:29', '2024-05-25 15:39:29', 1);
INSERT INTO `permissions` VALUES (20, 'karyawan.lockunlockjamkerja', 'web', '2024-05-25 15:39:40', '2024-05-25 15:39:40', 1);
INSERT INTO `permissions` VALUES (21, 'karyawan.setjamkerja', 'web', '2024-10-14 20:38:16', '2024-10-14 20:38:16', 1);
INSERT INTO `permissions` VALUES (22, 'jamkerja.index', 'web', '2024-12-01 21:41:55', '2024-12-01 21:41:55', 6);
INSERT INTO `permissions` VALUES (23, 'jamkerja.create', 'web', '2024-12-01 21:41:55', '2024-12-01 21:41:55', 6);
INSERT INTO `permissions` VALUES (24, 'jamkerja.edit', 'web', '2024-12-01 21:41:55', '2024-12-01 21:41:55', 6);
INSERT INTO `permissions` VALUES (25, 'jamkerja.show', 'web', '2024-12-01 21:41:55', '2024-12-01 21:41:55', 6);
INSERT INTO `permissions` VALUES (26, 'jamkerja.delete', 'web', '2024-12-01 21:41:55', '2024-12-01 21:41:55', 6);
INSERT INTO `permissions` VALUES (27, 'suratjalancabang.index', 'web', '2024-12-01 21:41:55', '2024-12-01 21:41:55', 6);
INSERT INTO `permissions` VALUES (28, 'harilibur.index', 'web', '2024-12-25 21:16:11', '2024-12-25 21:16:11', 7);
INSERT INTO `permissions` VALUES (29, 'harilibur.create', 'web', '2024-12-25 21:16:11', '2024-12-25 21:16:11', 7);
INSERT INTO `permissions` VALUES (30, 'harilibur.edit', 'web', '2024-12-25 21:16:11', '2024-12-25 21:16:11', 7);
INSERT INTO `permissions` VALUES (31, 'harilibur.show', 'web', '2024-12-25 21:16:11', '2024-12-25 21:16:11', 7);
INSERT INTO `permissions` VALUES (32, 'harilibur.delete', 'web', '2024-12-25 21:16:11', '2024-12-25 21:16:11', 7);
INSERT INTO `permissions` VALUES (33, 'harilibur.setharilibur', 'web', '2024-12-25 21:44:03', '2024-12-25 21:44:03', 7);
INSERT INTO `permissions` VALUES (34, 'users.index', 'web', '2025-01-21 15:02:01', '2025-01-21 15:02:01', 8);
INSERT INTO `permissions` VALUES (35, 'users.create', 'web', '2025-01-21 15:02:09', '2025-01-21 15:02:09', 8);
INSERT INTO `permissions` VALUES (36, 'users.edit', 'web', '2025-01-21 15:02:20', '2025-01-21 15:02:20', 8);
INSERT INTO `permissions` VALUES (37, 'users.delete', 'web', '2025-01-21 15:02:31', '2025-01-21 15:02:31', 8);
INSERT INTO `permissions` VALUES (38, 'presensi.create', 'web', '2025-01-22 21:14:08', '2025-01-22 21:14:08', 10);
INSERT INTO `permissions` VALUES (39, 'presensi.edit', 'web', '2025-01-22 21:14:08', '2025-01-22 21:14:08', 10);
INSERT INTO `permissions` VALUES (40, 'presensi.delete', 'web', '2025-01-22 21:14:08', '2025-01-22 21:14:08', 10);
INSERT INTO `permissions` VALUES (41, 'jamkerjabydept.index', 'web', '2025-01-22 22:42:39', '2025-01-22 22:42:39', 11);
INSERT INTO `permissions` VALUES (42, 'jamkerjabydept.create', 'web', '2025-01-22 22:42:39', '2025-01-22 22:42:39', 11);
INSERT INTO `permissions` VALUES (43, 'jamkerjabydept.edit', 'web', '2025-01-22 22:42:39', '2025-01-22 22:42:39', 11);
INSERT INTO `permissions` VALUES (44, 'jamkerjabydept.delete', 'web', '2025-01-22 22:42:39', '2025-01-22 22:42:39', 11);
INSERT INTO `permissions` VALUES (45, 'izinabsen.index', 'web', '2025-01-27 08:40:48', '2025-01-27 08:40:48', 12);
INSERT INTO `permissions` VALUES (46, 'izinabsen.create', 'web', '2025-01-27 08:40:48', '2025-01-27 08:40:48', 12);
INSERT INTO `permissions` VALUES (47, 'izinabsen.edit', 'web', '2025-01-27 08:40:48', '2025-01-27 08:40:48', 12);
INSERT INTO `permissions` VALUES (48, 'izinabsen.delete', 'web', '2025-01-27 08:40:48', '2025-01-27 08:40:48', 12);
INSERT INTO `permissions` VALUES (49, 'izinsakit.index', 'web', '2025-01-29 21:10:31', '2025-01-29 21:10:31', 13);
INSERT INTO `permissions` VALUES (50, 'izinsakit.create', 'web', '2025-01-29 21:10:31', '2025-01-29 21:10:31', 13);
INSERT INTO `permissions` VALUES (51, 'izinsakit.edit', 'web', '2025-01-29 21:10:31', '2025-01-29 21:10:31', 13);
INSERT INTO `permissions` VALUES (52, 'izinsakit.delete', 'web', '2025-01-29 21:10:31', '2025-01-29 21:10:31', 13);
INSERT INTO `permissions` VALUES (53, 'izinsakit.approve', 'web', '2025-01-29 21:52:51', '2025-01-29 21:52:51', 13);
INSERT INTO `permissions` VALUES (54, 'izincuti.index', 'web', '2025-02-01 20:20:35', '2025-02-01 20:20:35', 14);
INSERT INTO `permissions` VALUES (55, 'izincuti.create', 'web', '2025-02-01 20:20:35', '2025-02-01 20:20:35', 14);
INSERT INTO `permissions` VALUES (56, 'izincuti.edit', 'web', '2025-02-01 20:20:35', '2025-02-01 20:20:35', 14);
INSERT INTO `permissions` VALUES (57, 'izincuti.delete', 'web', '2025-02-01 20:20:35', '2025-02-01 20:20:35', 14);
INSERT INTO `permissions` VALUES (58, 'izincuti.approve', 'web', '2025-02-01 20:20:35', '2025-02-01 20:20:35', 14);
INSERT INTO `permissions` VALUES (59, 'izinabsen.approve', 'web', '2025-02-01 22:46:19', '2025-02-01 22:46:19', 12);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for presensi
-- ----------------------------
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE `presensi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam_in` datetime NULL DEFAULT NULL,
  `jam_out` datetime NULL DEFAULT NULL,
  `foto_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `foto_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lokasi_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lokasi_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `presensi_nik_foreign`(`nik` ASC) USING BTREE,
  INDEX `presensi_kode_jam_kerja_foreign`(`kode_jam_kerja` ASC) USING BTREE,
  CONSTRAINT `presensi_kode_jam_kerja_foreign` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `presensi_jamkerja` (`kode_jam_kerja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `presensi_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presensi
-- ----------------------------
INSERT INTO `presensi` VALUES (25, '12.44.544', '2025-02-02', NULL, NULL, NULL, NULL, NULL, NULL, 'JK01', 'i', '2025-02-01 22:46:39', '2025-02-01 22:46:39');
INSERT INTO `presensi` VALUES (26, '12.44.544', '2025-02-03', NULL, NULL, NULL, NULL, NULL, NULL, 'JK01', 'i', '2025-02-01 22:46:39', '2025-02-01 22:46:39');

-- ----------------------------
-- Table structure for presensi_izinabsen
-- ----------------------------
DROP TABLE IF EXISTS `presensi_izinabsen`;
CREATE TABLE `presensi_izinabsen`  (
  `kode_izin` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `dari` date NOT NULL,
  `sampai` date NOT NULL,
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_hrd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_izin`) USING BTREE,
  INDEX `presensi_izinabsen_nik_foreign`(`nik` ASC) USING BTREE,
  CONSTRAINT `presensi_izinabsen_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_izinabsen
-- ----------------------------
INSERT INTO `presensi_izinabsen` VALUES ('IA25020001', '2025-02-02', '2025-02-02', '2025-02-03', '12.44.544', 'test', NULL, '1', '2025-02-01 22:23:45', '2025-02-01 22:46:39');
INSERT INTO `presensi_izinabsen` VALUES ('IA25020002', '2025-02-05', '2025-02-05', '2025-02-06', '12.34.567', 'test', NULL, '0', '2025-02-01 22:45:04', '2025-02-03 20:50:30');
INSERT INTO `presensi_izinabsen` VALUES ('IA25020003', '2025-02-11', '2025-02-11', '2025-02-12', '12.44.544', 'test', NULL, '0', '2025-02-11 22:57:51', '2025-02-11 22:57:51');

-- ----------------------------
-- Table structure for presensi_izinabsen_approve
-- ----------------------------
DROP TABLE IF EXISTS `presensi_izinabsen_approve`;
CREATE TABLE `presensi_izinabsen_approve`  (
  `id_presensi` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_izin` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi`) USING BTREE,
  INDEX `presensi_izinabsen_approve_kode_izin_foreign`(`kode_izin` ASC) USING BTREE,
  CONSTRAINT `presensi_izinabsen_approve_id_presensi_foreign` FOREIGN KEY (`id_presensi`) REFERENCES `presensi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `presensi_izinabsen_approve_kode_izin_foreign` FOREIGN KEY (`kode_izin`) REFERENCES `presensi_izinabsen` (`kode_izin`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_izinabsen_approve
-- ----------------------------
INSERT INTO `presensi_izinabsen_approve` VALUES (25, 'IA25020001', '2025-02-01 22:46:39', '2025-02-01 22:46:39');
INSERT INTO `presensi_izinabsen_approve` VALUES (26, 'IA25020001', '2025-02-01 22:46:39', '2025-02-01 22:46:39');

-- ----------------------------
-- Table structure for presensi_izincuti
-- ----------------------------
DROP TABLE IF EXISTS `presensi_izincuti`;
CREATE TABLE `presensi_izincuti`  (
  `kode_izin_cuti` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `dari` date NOT NULL,
  `sampai` date NOT NULL,
  `kode_cuti` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_hrd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_izin_cuti`) USING BTREE,
  INDEX `presensi_izincuti_nik_foreign`(`nik` ASC) USING BTREE,
  INDEX `presensi_izincuti_kode_cuti_foreign`(`kode_cuti` ASC) USING BTREE,
  CONSTRAINT `presensi_izincuti_kode_cuti_foreign` FOREIGN KEY (`kode_cuti`) REFERENCES `cuti` (`kode_cuti`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `presensi_izincuti_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_izincuti
-- ----------------------------
INSERT INTO `presensi_izincuti` VALUES ('IC25020001', '12.44.544', '2025-02-03', '2025-02-03', '2025-02-03', 'C01', 'test', NULL, '0', 1, '2025-02-03 20:44:49', '2025-02-03 20:44:49');
INSERT INTO `presensi_izincuti` VALUES ('IC25020002', '12.34.567', '2025-02-19', '2025-02-19', '2025-02-19', 'C01', 'test', NULL, '0', 1, '2025-02-03 21:44:04', '2025-02-03 21:44:04');
INSERT INTO `presensi_izincuti` VALUES ('IC25020003', '12.44.544', '2025-02-22', '2025-02-22', '2025-02-22', 'C01', 'test', NULL, '0', 3, '2025-02-19 23:03:02', '2025-02-19 23:03:02');

-- ----------------------------
-- Table structure for presensi_izincuti_approve
-- ----------------------------
DROP TABLE IF EXISTS `presensi_izincuti_approve`;
CREATE TABLE `presensi_izincuti_approve`  (
  `id_presensi` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_izin_cuti` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi`) USING BTREE,
  INDEX `presensi_izincuti_approve_kode_izin_cuti_foreign`(`kode_izin_cuti` ASC) USING BTREE,
  CONSTRAINT `presensi_izincuti_approve_id_presensi_foreign` FOREIGN KEY (`id_presensi`) REFERENCES `presensi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `presensi_izincuti_approve_kode_izin_cuti_foreign` FOREIGN KEY (`kode_izin_cuti`) REFERENCES `presensi_izincuti` (`kode_izin_cuti`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_izincuti_approve
-- ----------------------------

-- ----------------------------
-- Table structure for presensi_izinsakit
-- ----------------------------
DROP TABLE IF EXISTS `presensi_izinsakit`;
CREATE TABLE `presensi_izinsakit`  (
  `kode_izin_sakit` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `dari` date NOT NULL,
  `sampai` date NOT NULL,
  `doc_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_hrd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_izin_sakit`) USING BTREE,
  INDEX `presensi_izinsakit_nik_foreign`(`nik` ASC) USING BTREE,
  CONSTRAINT `presensi_izinsakit_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_izinsakit
-- ----------------------------
INSERT INTO `presensi_izinsakit` VALUES ('IS25020001', '12.34.567', '2025-02-07', '2025-02-07', '2025-02-07', 'IS25020001.jpg', 'test', NULL, '0', 1, '2025-02-01 23:03:49', '2025-02-03 20:42:25');
INSERT INTO `presensi_izinsakit` VALUES ('IS25020002', '12.44.544', '2025-02-20', '2025-02-20', '2025-02-20', NULL, 'test', NULL, '0', 3, '2025-02-19 23:15:10', '2025-02-19 23:15:10');

-- ----------------------------
-- Table structure for presensi_izinsakit_approve
-- ----------------------------
DROP TABLE IF EXISTS `presensi_izinsakit_approve`;
CREATE TABLE `presensi_izinsakit_approve`  (
  `id_presensi` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_izin_sakit` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi`) USING BTREE,
  INDEX `presensi_izinsakit_approve_kode_izin_sakit_foreign`(`kode_izin_sakit` ASC) USING BTREE,
  CONSTRAINT `presensi_izinsakit_approve_id_presensi_foreign` FOREIGN KEY (`id_presensi`) REFERENCES `presensi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `presensi_izinsakit_approve_kode_izin_sakit_foreign` FOREIGN KEY (`kode_izin_sakit`) REFERENCES `presensi_izinsakit` (`kode_izin_sakit`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_izinsakit_approve
-- ----------------------------

-- ----------------------------
-- Table structure for presensi_jamkerja
-- ----------------------------
DROP TABLE IF EXISTS `presensi_jamkerja`;
CREATE TABLE `presensi_jamkerja`  (
  `kode_jam_kerja` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_jam_kerja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL,
  `istirahat` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_awal_istirahat` time NULL DEFAULT NULL,
  `jam_akhir_istirahat` time NULL DEFAULT NULL,
  `total_jam` smallint NOT NULL,
  `lintashari` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_jam_kerja`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presensi_jamkerja
-- ----------------------------
INSERT INTO `presensi_jamkerja` VALUES ('JK01', 'NON SHIFT', '08:00:00', '16:00:00', '1', '11:30:00', '12:30:00', 7, '0', 'NORMAL', NULL, '2025-01-27 08:19:07');
INSERT INTO `presensi_jamkerja` VALUES ('JK02', 'SHIFT 1', '07:00:00', '15:00:00', '1', '11:30:00', '12:30:00', 7, '0', 'Mantap', '2024-12-17 22:11:39', '2024-12-17 22:21:00');

-- ----------------------------
-- Table structure for presensi_jamkerja_bydate
-- ----------------------------
DROP TABLE IF EXISTS `presensi_jamkerja_bydate`;
CREATE TABLE `presensi_jamkerja_bydate`  (
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `presensi_jamkerja_bydate_nik_foreign`(`nik` ASC) USING BTREE,
  INDEX `presensi_jamkerja_bydate_kode_jam_kerja_foreign`(`kode_jam_kerja` ASC) USING BTREE,
  CONSTRAINT `presensi_jamkerja_bydate_kode_jam_kerja_foreign` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `presensi_jamkerja` (`kode_jam_kerja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `presensi_jamkerja_bydate_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presensi_jamkerja_bydate
-- ----------------------------
INSERT INTO `presensi_jamkerja_bydate` VALUES ('12.34.567', '2025-01-17', 'JK01', '2025-01-17 23:03:09', '2025-01-17 23:03:09');
INSERT INTO `presensi_jamkerja_bydate` VALUES ('12.34.567', '2025-01-18', 'JK01', '2025-01-17 23:04:36', '2025-01-17 23:04:36');

-- ----------------------------
-- Table structure for presensi_jamkerja_byday
-- ----------------------------
DROP TABLE IF EXISTS `presensi_jamkerja_byday`;
CREATE TABLE `presensi_jamkerja_byday`  (
  `nik` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `presensi_jamkerja_byday_nik_foreign`(`nik` ASC) USING BTREE,
  INDEX `presensi_jamkerja_byday_kode_jam_kerja_foreign`(`kode_jam_kerja` ASC) USING BTREE,
  CONSTRAINT `presensi_jamkerja_byday_kode_jam_kerja_foreign` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `presensi_jamkerja` (`kode_jam_kerja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `presensi_jamkerja_byday_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presensi_jamkerja_byday
-- ----------------------------
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.34.567', 'Senin', 'JK02', '2025-01-13 22:10:43', '2025-01-13 22:10:43');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.34.567', 'Selasa', 'JK02', '2025-01-13 22:10:43', '2025-01-13 22:10:43');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.34.567', 'Rabu', 'JK01', '2025-01-13 22:10:43', '2025-01-13 22:10:43');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.34.567', 'Kamis', 'JK02', '2025-01-13 22:10:43', '2025-01-13 22:10:43');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.34.567', 'Jumat', 'JK02', '2025-01-13 22:10:43', '2025-01-13 22:10:43');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Senin', 'JK01', '2025-01-25 20:40:14', '2025-01-25 20:40:14');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Selasa', 'JK01', '2025-01-25 20:40:15', '2025-01-25 20:40:15');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Rabu', 'JK01', '2025-01-25 20:40:15', '2025-01-25 20:40:15');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Kamis', 'JK01', '2025-01-25 20:40:15', '2025-01-25 20:40:15');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Jumat', 'JK01', '2025-01-25 20:40:15', '2025-01-25 20:40:15');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Sabtu', 'JK01', '2025-01-25 20:40:15', '2025-01-25 20:40:15');
INSERT INTO `presensi_jamkerja_byday` VALUES ('12.44.544', 'Minggu', 'JK01', '2025-01-25 20:40:15', '2025-01-25 20:40:15');

-- ----------------------------
-- Table structure for presensi_jamkerja_bydept
-- ----------------------------
DROP TABLE IF EXISTS `presensi_jamkerja_bydept`;
CREATE TABLE `presensi_jamkerja_bydept`  (
  `kode_jk_dept` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_cabang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_dept` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_jk_dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presensi_jamkerja_bydept
-- ----------------------------
INSERT INTO `presensi_jamkerja_bydept` VALUES ('JBGRAKT', 'BGR', 'AKT', '2025-01-23 21:02:24', '2025-01-23 21:02:24');

-- ----------------------------
-- Table structure for presensi_jamkerja_bydept_detail
-- ----------------------------
DROP TABLE IF EXISTS `presensi_jamkerja_bydept_detail`;
CREATE TABLE `presensi_jamkerja_bydept_detail`  (
  `kode_jk_dept` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `presensi_jamkerja_bydate_detail_kode_jam_kerja_foreign`(`kode_jam_kerja` ASC) USING BTREE,
  INDEX `presensi_jamkerja_bydate_detail_kode_jk_dept_foreign`(`kode_jk_dept` ASC) USING BTREE,
  CONSTRAINT `presensi_jamkerja_bydate_detail_kode_jam_kerja_foreign` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `presensi_jamkerja` (`kode_jam_kerja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `presensi_jamkerja_bydate_detail_kode_jk_dept_foreign` FOREIGN KEY (`kode_jk_dept`) REFERENCES `presensi_jamkerja_bydept` (`kode_jk_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of presensi_jamkerja_bydept_detail
-- ----------------------------
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Senin', 'JK02', '2025-01-23 21:28:00', '2025-01-23 21:28:00');
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Selasa', 'JK01', '2025-01-23 21:28:00', '2025-01-23 21:28:00');
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Rabu', 'JK01', '2025-01-23 21:28:00', '2025-01-23 21:28:00');
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Kamis', 'JK01', '2025-01-23 21:28:00', '2025-01-23 21:28:00');
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Jumat', 'JK01', '2025-01-23 21:28:00', '2025-01-23 21:28:00');
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Sabtu', 'JK01', '2025-01-23 21:28:00', '2025-01-23 21:28:00');
INSERT INTO `presensi_jamkerja_bydept_detail` VALUES ('JBGRAKT', 'Minggu', 'JK02', '2025-01-23 21:28:00', '2025-01-23 21:28:00');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (29, 1);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (35, 1);
INSERT INTO `role_has_permissions` VALUES (36, 1);
INSERT INTO `role_has_permissions` VALUES (37, 1);
INSERT INTO `role_has_permissions` VALUES (38, 1);
INSERT INTO `role_has_permissions` VALUES (39, 1);
INSERT INTO `role_has_permissions` VALUES (40, 1);
INSERT INTO `role_has_permissions` VALUES (41, 1);
INSERT INTO `role_has_permissions` VALUES (42, 1);
INSERT INTO `role_has_permissions` VALUES (43, 1);
INSERT INTO `role_has_permissions` VALUES (44, 1);
INSERT INTO `role_has_permissions` VALUES (45, 1);
INSERT INTO `role_has_permissions` VALUES (46, 1);
INSERT INTO `role_has_permissions` VALUES (47, 1);
INSERT INTO `role_has_permissions` VALUES (48, 1);
INSERT INTO `role_has_permissions` VALUES (49, 1);
INSERT INTO `role_has_permissions` VALUES (50, 1);
INSERT INTO `role_has_permissions` VALUES (51, 1);
INSERT INTO `role_has_permissions` VALUES (52, 1);
INSERT INTO `role_has_permissions` VALUES (53, 1);
INSERT INTO `role_has_permissions` VALUES (54, 1);
INSERT INTO `role_has_permissions` VALUES (55, 1);
INSERT INTO `role_has_permissions` VALUES (56, 1);
INSERT INTO `role_has_permissions` VALUES (57, 1);
INSERT INTO `role_has_permissions` VALUES (58, 1);
INSERT INTO `role_has_permissions` VALUES (59, 1);
INSERT INTO `role_has_permissions` VALUES (18, 3);
INSERT INTO `role_has_permissions` VALUES (38, 3);
INSERT INTO `role_has_permissions` VALUES (39, 3);
INSERT INTO `role_has_permissions` VALUES (40, 3);
INSERT INTO `role_has_permissions` VALUES (45, 3);
INSERT INTO `role_has_permissions` VALUES (46, 3);
INSERT INTO `role_has_permissions` VALUES (47, 3);
INSERT INTO `role_has_permissions` VALUES (48, 3);
INSERT INTO `role_has_permissions` VALUES (49, 3);
INSERT INTO `role_has_permissions` VALUES (50, 3);
INSERT INTO `role_has_permissions` VALUES (51, 3);
INSERT INTO `role_has_permissions` VALUES (52, 3);
INSERT INTO `role_has_permissions` VALUES (54, 3);
INSERT INTO `role_has_permissions` VALUES (55, 3);
INSERT INTO `role_has_permissions` VALUES (56, 3);
INSERT INTO `role_has_permissions` VALUES (57, 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'super admin', 'web', '2024-03-14 16:31:06', '2024-03-14 16:31:06');
INSERT INTO `roles` VALUES (2, 'admin departemen', 'web', '2024-03-14 16:51:49', '2024-03-14 16:51:49');
INSERT INTO `roles` VALUES (3, 'karyawan', 'web', '2025-01-21 14:42:30', '2025-01-21 14:42:30');

-- ----------------------------
-- Table structure for status_kawin
-- ----------------------------
DROP TABLE IF EXISTS `status_kawin`;
CREATE TABLE `status_kawin`  (
  `kode_status_kawin` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_kawin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kode_status_kawin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_kawin
-- ----------------------------
INSERT INTO `status_kawin` VALUES ('HB', 'Telah Berpisah Secara Hukum / Janda / Duda', '2024-04-27 21:20:47', '2024-04-27 21:20:47');
INSERT INTO `status_kawin` VALUES ('K0', 'Kawin Belum Punya Tanggungan', '2024-04-27 21:20:47', '2024-04-27 21:20:47');
INSERT INTO `status_kawin` VALUES ('K1', 'Kawin Punya Tanggungan 1', '2024-04-27 21:20:47', '2024-04-27 21:20:47');
INSERT INTO `status_kawin` VALUES ('K2', 'Kawin PUnya Tanggungan 2', '2024-04-27 21:20:47', '2024-04-27 21:20:47');
INSERT INTO `status_kawin` VALUES ('K3', 'Kawin PUnya Tanggungan 3', '2024-04-27 21:20:47', '2024-04-27 21:20:47');
INSERT INTO `status_kawin` VALUES ('TK', 'Tidak Kawin', '2024-04-27 21:20:47', '2024-04-27 21:20:47');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Adam Abdi Al Ala', 'adam', 'adamabdi.al.a@gmail.com', NULL, '$2y$12$7f.rOofB1/CU8PtbCJ25Ge04gv1wsF3S74w4ppq5XH9dmfRAjf.yO', NULL, NULL, '2024-03-14 16:31:24');
INSERT INTO `users` VALUES (2, 'Adam Abdi Al Ala', '12.34.567', 'adam@persisalamin.com', NULL, '$2y$12$7f.rOofB1/CU8PtbCJ25Ge04gv1wsF3S74w4ppq5XH9dmfRAjf.yO', NULL, '2025-01-21 15:16:37', '2025-01-21 15:16:37');
INSERT INTO `users` VALUES (3, 'Qiana Aqila Qanita Nadhria', '12.44.544', 'qiana@persisalamin.com', NULL, '$2y$12$7f.rOofB1/CU8PtbCJ25Ge04gv1wsF3S74w4ppq5XH9dmfRAjf.yO', NULL, '2025-01-21 15:17:25', '2025-01-21 15:17:25');
INSERT INTO `users` VALUES (4, 'Adam Adifa', '23.00.110', '2300110@persisalamin.com', NULL, '$2y$12$MG3z3kaAy/0V0MOO8fVdL.jWvwL/OuglmR7.q.04GImjgT07zWRDa', NULL, '2025-02-01 22:37:25', '2025-02-01 22:37:25');

-- ----------------------------
-- Table structure for users_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `users_karyawan`;
CREATE TABLE `users_karyawan`  (
  `nik` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `users_karyawan_nik_foreign`(`nik` ASC) USING BTREE,
  CONSTRAINT `users_karyawan_nik_foreign` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_karyawan
-- ----------------------------
INSERT INTO `users_karyawan` VALUES ('12.34.567', 2, '2025-01-21 15:16:37', '2025-01-21 15:16:37');
INSERT INTO `users_karyawan` VALUES ('12.44.544', 3, '2025-01-21 15:17:25', '2025-01-21 15:17:25');
INSERT INTO `users_karyawan` VALUES ('23.00.110', 4, '2025-02-01 22:37:25', '2025-02-01 22:37:25');

SET FOREIGN_KEY_CHECKS = 1;
