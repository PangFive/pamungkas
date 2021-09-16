/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : pamungkas

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 15/09/2021 21:02:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `kelola_akun` tinyint(1) NOT NULL,
  `penilaian` tinyint(1) NOT NULL,
  `struktur_proses` tinyint(1) NOT NULL,
  `pencapaian_tujuan` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of access
-- ----------------------------
BEGIN;
INSERT INTO `access` VALUES (1, 1, 1, 1, 1, 1, '2021-05-31 16:00:37', '2021-09-12 17:02:56');
INSERT INTO `access` VALUES (2, 2, 0, 1, 1, 1, '2021-06-02 00:20:32', '2021-06-21 21:00:36');
INSERT INTO `access` VALUES (3, 3, 0, 1, 1, 1, '2021-06-02 10:49:02', '2021-06-14 20:49:26');
INSERT INTO `access` VALUES (4, 4, 1, 1, 1, 1, '2021-05-31 16:00:37', '2021-09-12 18:04:56');
INSERT INTO `access` VALUES (5, 5, 1, 1, 1, 1, '2021-06-05 17:08:24', '2021-06-05 17:08:24');
INSERT INTO `access` VALUES (6, 6, 0, 1, 1, 1, '2021-06-05 17:15:00', '2021-06-05 17:15:00');
INSERT INTO `access` VALUES (7, 13, 0, 1, 1, 1, '2021-09-12 18:02:30', '2021-09-12 18:02:30');
INSERT INTO `access` VALUES (8, 14, 0, 1, 1, 1, '2021-09-12 18:02:39', '2021-09-12 18:02:39');
INSERT INTO `access` VALUES (9, 15, 1, 1, 1, 1, '2021-09-12 18:03:16', '2021-09-12 18:03:16');
COMMIT;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of activities
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ikk_targets
-- ----------------------------
DROP TABLE IF EXISTS `ikk_targets`;
CREATE TABLE `ikk_targets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `sasaran_id` bigint(20) unsigned NOT NULL,
  `ikk` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ikk_targets_sasaran_id_foreign` (`sasaran_id`),
  CONSTRAINT `ikk_targets_sasaran_id_foreign` FOREIGN KEY (`sasaran_id`) REFERENCES `sasarans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ikk_targets
-- ----------------------------
BEGIN;
INSERT INTO `ikk_targets` VALUES (98, 2020, 0, 1, 54, 'Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep Quia assumenda excep', '40', 'Iste voluptas earum', '2021-09-11 13:39:24', '2021-09-11 14:20:43');
INSERT INTO `ikk_targets` VALUES (100, 2020, 0, 1, 55, 'In ullamco voluptate', '9', 'Quo nostrum quia vol', '2021-09-11 13:54:02', '2021-09-11 13:54:02');
INSERT INTO `ikk_targets` VALUES (101, 2020, 0, 1, 55, 'Et modi voluptatibus', '28', 'Voluptatem Quaerat', '2021-09-11 13:54:08', '2021-09-11 13:54:08');
INSERT INTO `ikk_targets` VALUES (102, 2020, 0, 1, 54, 'Reprehenderit labor', '11', 'Vel asperiores sed p', '2021-09-11 13:54:15', '2021-09-11 13:54:15');
INSERT INTO `ikk_targets` VALUES (103, 2020, 0, 1, 55, 'Accusantium vel dese', '40', 'Aute ad incididunt a', '2021-09-11 13:54:40', '2021-09-11 13:54:40');
INSERT INTO `ikk_targets` VALUES (104, 2020, 0, 1, 56, 'Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e Qui non ea debitis e', '47', 'Id est dolores harum', '2021-09-11 14:32:56', '2021-09-11 14:33:14');
INSERT INTO `ikk_targets` VALUES (105, 2020, 0, 1, 56, 'Quis dolore ut sunt', '39', 'Magni modi cillum ea', '2021-09-11 14:33:02', '2021-09-11 14:33:02');
INSERT INTO `ikk_targets` VALUES (106, 2021, 0, 1, 57, 'Quis deleniti sed te', '15', 'Consequatur delectu', '2021-09-12 15:58:09', '2021-09-12 15:58:09');
INSERT INTO `ikk_targets` VALUES (107, 2021, 0, 1, 57, 'Pariatur Quam corpo', '37', 'Omnis delectus aper', '2021-09-12 15:58:15', '2021-09-12 15:58:15');
INSERT INTO `ikk_targets` VALUES (108, 2021, 1, 4, 58, 'berapa banyak', '15', 'hari', '2021-09-12 17:11:21', '2021-09-12 17:11:21');
INSERT INTO `ikk_targets` VALUES (113, 2020, 1, 4, 61, 'Voluptas ut dolores', '23', 'Natus pariatur Inci', '2021-09-12 17:17:30', '2021-09-12 17:17:30');
INSERT INTO `ikk_targets` VALUES (114, 2020, 1, 4, 62, 'Voluptas et autem as', '72', 'Dolor ducimus sunt', '2021-09-12 17:17:43', '2021-09-12 17:17:43');
INSERT INTO `ikk_targets` VALUES (115, 2020, 1, 4, 61, 'Molestias eos aliqu', '20', 'Eos et voluptas magn', '2021-09-12 17:19:12', '2021-09-12 17:19:12');
INSERT INTO `ikk_targets` VALUES (118, 2021, 1, 4, 64, 'Est et vel nesciunt', '64', 'Natus saepe tempor r', '2021-09-14 17:45:31', '2021-09-14 17:45:31');
INSERT INTO `ikk_targets` VALUES (120, 2020, 1, 4, 62, 'Illum fugiat ad es', '51', 'Quis veniam non dol', '2021-09-14 19:19:05', '2021-09-14 19:19:05');
INSERT INTO `ikk_targets` VALUES (121, 2020, 1, 4, 62, 'Quam voluptatem sus', '27', 'Qui aliqua Vel dolo', '2021-09-14 19:19:20', '2021-09-14 19:19:20');
INSERT INTO `ikk_targets` VALUES (122, 2021, 1, 4, 64, 'Exercitation debitis', '2', 'Ut tenetur quaerat o', '2021-09-14 21:36:43', '2021-09-14 21:36:43');
INSERT INTO `ikk_targets` VALUES (123, 2021, 1, 4, 64, 'Vitae molestiae ulla', '43', 'Fugiat aliqua Et a', '2021-09-14 23:39:50', '2021-09-14 23:39:50');
INSERT INTO `ikk_targets` VALUES (124, 2021, 1, 4, 65, 'Odio est et consequ', '71', 'Proident nulla magn', '2021-09-14 23:45:31', '2021-09-14 23:45:31');
COMMIT;

-- ----------------------------
-- Table structure for jawaban_outputs
-- ----------------------------
DROP TABLE IF EXISTS `jawaban_outputs`;
CREATE TABLE `jawaban_outputs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `sasaran_id` bigint(20) unsigned NOT NULL,
  `ikk_target_id` bigint(20) unsigned NOT NULL,
  `j_sasaran_id` bigint(20) unsigned NOT NULL,
  `j_ikk` int(11) DEFAULT NULL,
  `j_target` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jawaban_outputs_sasaran_id_foreign` (`sasaran_id`),
  KEY `jawaban_outputs_ikk_target_id_foreign` (`ikk_target_id`),
  KEY `jawaban_outputs_j_sasaran_id_foreign` (`j_sasaran_id`),
  CONSTRAINT `jawaban_outputs_ikk_target_id_foreign` FOREIGN KEY (`ikk_target_id`) REFERENCES `ikk_targets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jawaban_outputs_j_sasaran_id_foreign` FOREIGN KEY (`j_sasaran_id`) REFERENCES `jawaban_sasarans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jawaban_outputs_sasaran_id_foreign` FOREIGN KEY (`sasaran_id`) REFERENCES `sasarans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jawaban_outputs
-- ----------------------------
BEGIN;
INSERT INTO `jawaban_outputs` VALUES (1, 2021, 1, 4, 58, 108, 1, 0, 1, '2021-09-12 17:13:57', '2021-09-14 23:50:06');
INSERT INTO `jawaban_outputs` VALUES (6, 2021, 1, 4, 64, 118, 3, 1, 0, '2021-09-14 19:06:25', '2021-09-14 23:50:06');
INSERT INTO `jawaban_outputs` VALUES (7, 2021, 1, 4, 64, 122, 3, 1, 1, '2021-09-14 23:50:07', '2021-09-14 23:50:07');
INSERT INTO `jawaban_outputs` VALUES (8, 2021, 1, 4, 64, 123, 3, 1, 1, '2021-09-14 23:50:07', '2021-09-14 23:59:56');
COMMIT;

-- ----------------------------
-- Table structure for jawaban_sasarans
-- ----------------------------
DROP TABLE IF EXISTS `jawaban_sasarans`;
CREATE TABLE `jawaban_sasarans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `sasaran_id` bigint(20) unsigned NOT NULL,
  `j_sasaran_t` int(11) DEFAULT NULL,
  `j_sasaran_b` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jawaban_sasarans_sasaran_id_foreign` (`sasaran_id`),
  CONSTRAINT `jawaban_sasarans_sasaran_id_foreign` FOREIGN KEY (`sasaran_id`) REFERENCES `sasarans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jawaban_sasarans
-- ----------------------------
BEGIN;
INSERT INTO `jawaban_sasarans` VALUES (1, 2021, 1, 4, 58, 1, 0, '2021-09-12 17:13:57', '2021-09-14 23:59:56');
INSERT INTO `jawaban_sasarans` VALUES (3, 2021, 1, 4, 64, 1, 1, '2021-09-14 19:01:42', '2021-09-14 23:59:56');
COMMIT;

-- ----------------------------
-- Table structure for jawaban_struktur_proses
-- ----------------------------
DROP TABLE IF EXISTS `jawaban_struktur_proses`;
CREATE TABLE `jawaban_struktur_proses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `unsur_id` bigint(20) unsigned NOT NULL,
  `sub_unsur_id` bigint(20) unsigned NOT NULL,
  `parameter_id` bigint(20) unsigned NOT NULL,
  `kriteria_id` bigint(20) unsigned NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapping_id` bigint(20) unsigned NOT NULL,
  `tipe_kuesioner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `to_mapping` (`mapping_id`) USING BTREE,
  CONSTRAINT `to_mapping` FOREIGN KEY (`mapping_id`) REFERENCES `mapping_respondens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jawaban_struktur_proses
-- ----------------------------
BEGIN;
INSERT INTO `jawaban_struktur_proses` VALUES (635, 2021, 1, 4, 1, 1, 1, 1, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (636, 2021, 1, 4, 1, 2, 9, 9, '1', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (637, 2021, 1, 4, 1, 3, 10, 10, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (638, 2021, 1, 4, 1, 3, 11, 11, '4', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (639, 2021, 1, 4, 1, 3, 12, 12, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (640, 2021, 1, 4, 1, 3, 13, 13, '4', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (641, 2021, 1, 4, 1, 4, 17, 17, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (642, 2021, 1, 4, 1, 5, 18, 18, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (643, 2021, 1, 4, 1, 6, 19, 19, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (644, 2021, 1, 4, 1, 6, 20, 20, '1', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (645, 2021, 1, 4, 1, 6, 21, 21, '1', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (646, 2021, 1, 4, 1, 7, 22, 22, '1', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (647, 2021, 1, 4, 1, 8, 23, 23, '1', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (648, 2021, 1, 4, 1, 8, 24, 24, '4', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (649, 2021, 1, 4, 2, 9, 25, 25, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (650, 2021, 1, 4, 2, 9, 26, 26, '1', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (651, 2021, 1, 4, 2, 9, 27, 27, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (652, 2021, 1, 4, 2, 10, 28, 28, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (653, 2021, 1, 4, 2, 10, 29, 29, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (654, 2021, 1, 4, 2, 10, 30, 30, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (655, 2021, 1, 4, 2, 10, 31, 31, '4', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (656, 2021, 1, 4, 2, 10, 32, 32, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (657, 2021, 1, 4, 3, 11, 34, 34, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (658, 2021, 1, 4, 3, 12, 35, 35, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (659, 2021, 1, 4, 3, 13, 36, 36, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (660, 2021, 1, 4, 3, 14, 37, 37, '4', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (661, 2021, 1, 4, 3, 15, 38, 38, '4', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (662, 2021, 1, 4, 3, 16, 39, 39, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (663, 2021, 1, 4, 3, 17, 40, 40, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (664, 2021, 1, 4, 3, 18, 41, 41, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (665, 2021, 1, 4, 3, 19, 42, 42, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (666, 2021, 1, 4, 3, 20, 43, 43, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (667, 2021, 1, 4, 3, 21, 44, 44, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (668, 2021, 1, 4, 4, 22, 45, 45, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (669, 2021, 1, 4, 4, 22, 46, 46, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (670, 2021, 1, 4, 4, 22, 47, 47, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (671, 2021, 1, 4, 4, 22, 48, 48, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (672, 2021, 1, 4, 4, 23, 50, 50, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (673, 2021, 1, 4, 5, 24, 51, 51, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (674, 2021, 1, 4, 5, 24, 52, 52, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (675, 2021, 1, 4, 5, 24, 53, 53, '2', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (676, 2021, 1, 4, 5, 25, 54, 54, '3', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (677, 2021, 1, 4, 5, 25, 55, 55, '5', 1, 't1', '2021-09-14 11:21:53', '2021-09-14 11:21:53');
INSERT INTO `jawaban_struktur_proses` VALUES (678, 2021, 1, 4, 1, 1, 1, 1, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (679, 2021, 1, 4, 1, 2, 9, 9, '3', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (680, 2021, 1, 4, 1, 3, 10, 10, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (681, 2021, 1, 4, 1, 3, 11, 11, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (682, 2021, 1, 4, 1, 3, 12, 12, '3', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (683, 2021, 1, 4, 1, 3, 13, 13, '3', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (684, 2021, 1, 4, 1, 4, 17, 17, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (685, 2021, 1, 4, 1, 5, 18, 18, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (686, 2021, 1, 4, 1, 6, 19, 19, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (687, 2021, 1, 4, 1, 6, 20, 20, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (688, 2021, 1, 4, 1, 6, 21, 21, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (689, 2021, 1, 4, 1, 7, 22, 22, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (690, 2021, 1, 4, 1, 8, 23, 23, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (691, 2021, 1, 4, 1, 8, 24, 24, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (692, 2021, 1, 4, 2, 9, 25, 25, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (693, 2021, 1, 4, 2, 9, 26, 26, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (694, 2021, 1, 4, 2, 9, 27, 27, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (695, 2021, 1, 4, 2, 10, 28, 28, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (696, 2021, 1, 4, 2, 10, 29, 29, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (697, 2021, 1, 4, 2, 10, 30, 30, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (698, 2021, 1, 4, 2, 10, 31, 31, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (699, 2021, 1, 4, 2, 10, 32, 32, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (700, 2021, 1, 4, 3, 11, 34, 34, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (701, 2021, 1, 4, 3, 12, 35, 35, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (702, 2021, 1, 4, 3, 13, 36, 36, '3', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (703, 2021, 1, 4, 3, 14, 37, 37, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (704, 2021, 1, 4, 3, 15, 38, 38, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (705, 2021, 1, 4, 3, 16, 39, 39, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (706, 2021, 1, 4, 3, 17, 40, 40, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (707, 2021, 1, 4, 3, 18, 41, 41, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (708, 2021, 1, 4, 3, 19, 42, 42, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (709, 2021, 1, 4, 3, 20, 43, 43, '3', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (710, 2021, 1, 4, 3, 21, 44, 44, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (711, 2021, 1, 4, 4, 22, 45, 45, '3', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (712, 2021, 1, 4, 4, 22, 46, 46, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (713, 2021, 1, 4, 4, 22, 47, 47, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (714, 2021, 1, 4, 4, 22, 48, 48, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (715, 2021, 1, 4, 4, 23, 50, 50, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (716, 2021, 1, 4, 5, 24, 51, 51, '4', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (717, 2021, 1, 4, 5, 24, 52, 52, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (718, 2021, 1, 4, 5, 24, 53, 53, '5', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (719, 2021, 1, 4, 5, 25, 54, 54, '1', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (720, 2021, 1, 4, 5, 25, 55, 55, '2', 2, 't2', '2021-09-15 03:02:57', '2021-09-15 03:02:57');
INSERT INTO `jawaban_struktur_proses` VALUES (721, 2021, 1, 4, 1, 1, 1, 1, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (722, 2021, 1, 4, 1, 2, 9, 9, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (723, 2021, 1, 4, 1, 3, 10, 10, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (724, 2021, 1, 4, 1, 3, 11, 11, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (725, 2021, 1, 4, 1, 3, 12, 12, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (726, 2021, 1, 4, 1, 3, 13, 13, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (727, 2021, 1, 4, 1, 4, 17, 17, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (728, 2021, 1, 4, 1, 5, 18, 18, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (729, 2021, 1, 4, 1, 6, 19, 19, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (730, 2021, 1, 4, 1, 6, 20, 20, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (731, 2021, 1, 4, 1, 6, 21, 21, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (732, 2021, 1, 4, 1, 7, 22, 22, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (733, 2021, 1, 4, 1, 8, 23, 23, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (734, 2021, 1, 4, 1, 8, 24, 24, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (735, 2021, 1, 4, 2, 9, 25, 25, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (736, 2021, 1, 4, 2, 9, 26, 26, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (737, 2021, 1, 4, 2, 9, 27, 27, '5', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (738, 2021, 1, 4, 2, 10, 28, 28, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (739, 2021, 1, 4, 2, 10, 29, 29, '5', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (740, 2021, 1, 4, 2, 10, 30, 30, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (741, 2021, 1, 4, 2, 10, 31, 31, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (742, 2021, 1, 4, 2, 10, 32, 32, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (743, 2021, 1, 4, 3, 11, 34, 34, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (744, 2021, 1, 4, 3, 12, 35, 35, '5', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (745, 2021, 1, 4, 3, 13, 36, 36, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (746, 2021, 1, 4, 3, 14, 37, 37, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (747, 2021, 1, 4, 3, 15, 38, 38, '5', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (748, 2021, 1, 4, 3, 16, 39, 39, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (749, 2021, 1, 4, 3, 17, 40, 40, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (750, 2021, 1, 4, 3, 18, 41, 41, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (751, 2021, 1, 4, 3, 19, 42, 42, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (752, 2021, 1, 4, 3, 20, 43, 43, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (753, 2021, 1, 4, 3, 21, 44, 44, '5', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (754, 2021, 1, 4, 4, 22, 45, 45, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (755, 2021, 1, 4, 4, 22, 46, 46, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (756, 2021, 1, 4, 4, 22, 47, 47, '5', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (757, 2021, 1, 4, 4, 22, 48, 48, '4', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (758, 2021, 1, 4, 4, 23, 50, 50, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (759, 2021, 1, 4, 5, 24, 51, 51, '3', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (760, 2021, 1, 4, 5, 24, 52, 52, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (761, 2021, 1, 4, 5, 24, 53, 53, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (762, 2021, 1, 4, 5, 25, 54, 54, '2', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (763, 2021, 1, 4, 5, 25, 55, 55, '1', 3, 't3', '2021-09-15 03:03:12', '2021-09-15 03:03:12');
INSERT INTO `jawaban_struktur_proses` VALUES (764, 2021, 1, 4, 1, 1, 1, 1, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (765, 2021, 1, 4, 1, 1, 2, 2, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (766, 2021, 1, 4, 1, 1, 3, 3, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (767, 2021, 1, 4, 1, 1, 4, 4, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (768, 2021, 1, 4, 1, 1, 5, 5, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (769, 2021, 1, 4, 1, 1, 6, 6, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (770, 2021, 1, 4, 1, 1, 7, 7, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (771, 2021, 1, 4, 1, 1, 8, 8, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (772, 2021, 1, 4, 1, 2, 9, 9, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (773, 2021, 1, 4, 1, 3, 10, 10, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (774, 2021, 1, 4, 1, 3, 11, 11, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (775, 2021, 1, 4, 1, 3, 12, 12, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (776, 2021, 1, 4, 1, 3, 13, 13, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (777, 2021, 1, 4, 1, 3, 14, 14, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (778, 2021, 1, 4, 1, 3, 15, 15, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (779, 2021, 1, 4, 1, 3, 16, 16, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (780, 2021, 1, 4, 1, 4, 17, 17, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (781, 2021, 1, 4, 1, 5, 18, 18, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (782, 2021, 1, 4, 1, 6, 19, 19, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (783, 2021, 1, 4, 1, 6, 20, 20, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (784, 2021, 1, 4, 1, 6, 21, 21, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (785, 2021, 1, 4, 1, 7, 22, 22, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (786, 2021, 1, 4, 1, 8, 23, 23, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (787, 2021, 1, 4, 1, 8, 24, 24, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (788, 2021, 1, 4, 2, 9, 25, 25, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (789, 2021, 1, 4, 2, 9, 26, 26, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (790, 2021, 1, 4, 2, 9, 27, 27, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (791, 2021, 1, 4, 2, 10, 28, 28, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (792, 2021, 1, 4, 2, 10, 29, 29, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (793, 2021, 1, 4, 2, 10, 30, 30, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (794, 2021, 1, 4, 2, 10, 31, 31, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (795, 2021, 1, 4, 2, 10, 32, 32, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (796, 2021, 1, 4, 2, 10, 33, 33, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (797, 2021, 1, 4, 3, 11, 34, 34, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (798, 2021, 1, 4, 3, 12, 35, 35, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (799, 2021, 1, 4, 3, 13, 36, 36, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (800, 2021, 1, 4, 3, 14, 37, 37, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (801, 2021, 1, 4, 3, 15, 38, 38, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (802, 2021, 1, 4, 3, 16, 39, 39, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (803, 2021, 1, 4, 3, 17, 40, 40, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (804, 2021, 1, 4, 3, 18, 41, 41, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (805, 2021, 1, 4, 3, 19, 42, 42, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (806, 2021, 1, 4, 3, 20, 43, 43, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (807, 2021, 1, 4, 3, 21, 44, 44, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (808, 2021, 1, 4, 4, 22, 45, 45, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (809, 2021, 1, 4, 4, 22, 46, 46, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (810, 2021, 1, 4, 4, 22, 47, 47, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (811, 2021, 1, 4, 4, 22, 48, 48, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (812, 2021, 1, 4, 4, 22, 49, 49, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (813, 2021, 1, 4, 4, 23, 50, 50, '1', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (814, 2021, 1, 4, 5, 24, 51, 51, '3', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (815, 2021, 1, 4, 5, 24, 52, 52, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (816, 2021, 1, 4, 5, 24, 53, 53, '5', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (817, 2021, 1, 4, 5, 25, 54, 54, '2', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
INSERT INTO `jawaban_struktur_proses` VALUES (818, 2021, 1, 4, 5, 25, 55, 55, '4', 4, 't4', '2021-09-15 03:03:30', '2021-09-15 03:03:30');
COMMIT;

-- ----------------------------
-- Table structure for mapping_respondens
-- ----------------------------
DROP TABLE IF EXISTS `mapping_respondens`;
CREATE TABLE `mapping_respondens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `kuesioner_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mapping_respondens_users_id_foreign` (`users_id`) USING BTREE,
  KEY `mapping_respondens_kuesioner_id_foreign` (`kuesioner_id`) USING BTREE,
  CONSTRAINT `mapping_respondens_kuesioner_id_foreign` FOREIGN KEY (`kuesioner_id`) REFERENCES `ref_tipe_kuesioners` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mapping_respondens_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mapping_respondens
-- ----------------------------
BEGIN;
INSERT INTO `mapping_respondens` VALUES (1, 2021, 1, 4, 1, '2021-06-04 15:23:14', '2021-06-04 15:23:14');
INSERT INTO `mapping_respondens` VALUES (2, 2021, 1, 4, 2, '2021-06-04 15:23:23', '2021-06-04 15:23:23');
INSERT INTO `mapping_respondens` VALUES (3, 2021, 1, 4, 3, '2021-06-04 15:23:33', '2021-06-04 15:23:33');
INSERT INTO `mapping_respondens` VALUES (4, 2021, 1, 4, 4, '2021-06-05 17:09:43', '2021-06-05 17:09:43');
INSERT INTO `mapping_respondens` VALUES (7, 2021, 1, 2, 1, '2021-06-04 15:23:14', '2021-06-04 15:23:14');
INSERT INTO `mapping_respondens` VALUES (8, 2021, 1, 2, 2, '2021-06-04 15:23:23', '2021-06-04 15:23:23');
INSERT INTO `mapping_respondens` VALUES (9, 2021, 1, 2, 3, '2021-06-04 15:23:33', '2021-06-04 15:23:33');
INSERT INTO `mapping_respondens` VALUES (10, 2021, 1, 2, 4, '2021-06-05 17:09:43', '2021-06-05 17:09:43');
INSERT INTO `mapping_respondens` VALUES (16, 2021, 1, 6, 4, '2021-06-06 01:49:50', '2021-06-06 01:49:50');
COMMIT;

-- ----------------------------
-- Table structure for markets
-- ----------------------------
DROP TABLE IF EXISTS `markets`;
CREATE TABLE `markets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of markets
-- ----------------------------
BEGIN;
INSERT INTO `markets` VALUES (1, 'Toko Pratama', '087878787878', 'Jl. Mawar no.86, Bogors', '2021-05-31 15:52:34', '2021-06-01 18:50:17');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_05_22_230351_create_product_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_05_26_114219_create_supply_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_05_26_123200_create_trigger_supply', 1);
INSERT INTO `migrations` VALUES (7, '2020_06_03_202123_create_supply_system', 1);
INSERT INTO `migrations` VALUES (8, '2020_06_03_202129_create_transaction_table', 1);
INSERT INTO `migrations` VALUES (9, '2020_06_10_225325_create_access_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_06_12_133440_create_activity_table', 1);
INSERT INTO `migrations` VALUES (11, '2020_06_15_205927_create_market_table', 1);
INSERT INTO `migrations` VALUES (19, '2021_06_01_231443_add_id_satker_to_users_table', 2);
INSERT INTO `migrations` VALUES (20, '2021_06_01_233029_create_satkers_table', 2);
INSERT INTO `migrations` VALUES (21, '2021_06_02_143202_create_ref_tipe_kuesioners_table', 3);
INSERT INTO `migrations` VALUES (27, '2021_06_02_151153_create_mapping_respondens_table', 4);
INSERT INTO `migrations` VALUES (28, '2021_06_04_114027_create_ref_form_s_unsurs_table', 5);
INSERT INTO `migrations` VALUES (29, '2021_06_04_114042_create_ref_form_s_sub_unsurs_table', 5);
INSERT INTO `migrations` VALUES (30, '2021_06_04_114058_create_ref_form_s_parameters_table', 5);
INSERT INTO `migrations` VALUES (31, '2021_06_04_114114_create_ref_form_s_kriterias_table', 5);
INSERT INTO `migrations` VALUES (32, '2021_06_04_150553_add_tahun_to_mapping_respondens_table', 6);
INSERT INTO `migrations` VALUES (34, '2021_06_05_120901_create_jawaban_struktur_proses_table', 7);
INSERT INTO `migrations` VALUES (35, '2021_09_06_171428_create_sasarans_table', 8);
INSERT INTO `migrations` VALUES (36, '2021_09_06_171454_create_ikk_targets_table', 8);
INSERT INTO `migrations` VALUES (43, '2021_09_07_162114_create_programs_table', 9);
INSERT INTO `migrations` VALUES (44, '2021_09_07_162838_add_program_id_to_sasarans_table', 9);
INSERT INTO `migrations` VALUES (45, '2021_09_07_163739_add_foreign_to_sasarans_table', 10);
INSERT INTO `migrations` VALUES (50, '2021_09_11_013623_create_jawaban_sasarans_table', 11);
INSERT INTO `migrations` VALUES (51, '2021_09_11_013633_create_jawaban_outputs_table', 11);
INSERT INTO `migrations` VALUES (57, '2021_09_11_112012_add_tahun_to_sasarans_table', 12);
INSERT INTO `migrations` VALUES (58, '2021_09_11_112030_add_tahun_to_ikk_targets_table', 12);
INSERT INTO `migrations` VALUES (59, '2021_09_11_151703_create_realisasi_outputs_table', 13);
INSERT INTO `migrations` VALUES (60, '2021_09_13_225758_add_foto_to_ref_satkers_table', 14);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `berat_barang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merek` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT '15',
  `harga` bigint(20) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tersedia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (1, '1', 'Produksi', 'Wijen', '10 kg', 'Apa', 15, 20000, 'Tersedia', '2021-05-31 15:38:10', '2021-05-31 16:03:15');
COMMIT;

-- ----------------------------
-- Table structure for programs
-- ----------------------------
DROP TABLE IF EXISTS `programs`;
CREATE TABLE `programs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_sasaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sasaran_program` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of programs
-- ----------------------------
BEGIN;
INSERT INTO `programs` VALUES (1, 'SS1SP7', 'Meningkatnya Pengawasan Pembangunan atas Akuntabilitas Keuangan dan Kinerja Daerah', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (2, 'SS1SP10', 'Meningkatnya Pengawasan Pembangunan atas Akuntabilitas Keuangan Negara dan Daerah Bidang Investigasi', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (3, 'SS1SP15', 'Meningkatnya Pengawasan Pembangunan atas Akuntabilitas Pembangunan Nasional', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (4, 'SS3SP11', 'Meningkatnya Pengawasan Pembangunan atas kelancaran pelaksanaan pembangunan nasional', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (5, 'SS6SP2', 'Meningkatnya Pengawasan Pembangunan atas Kualitas Tata Kelola BUMN/D/ BLUD', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (6, 'SS3SP11', 'Meningkatnya Pengawasan Pembangunan atas efektivitas hasil pengawasan keinvestigasian', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (7, 'SS3SP11', 'Meningkatnya Pengawasan Pembangunan atas Efektivitas Pengendalian Korupsi', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (8, 'SS3SP11', 'Meningkatnya Pengawasan Pembangunan atas Efektivitas Pengendalian Korupsi pada badan usaha', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (9, 'SS6SP2', 'Meningkatnya Pengawasan Pembangunan atas Kualitas Pengendalian Intern Pemerintah Daerah', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
INSERT INTO `programs` VALUES (10, 'SS3SP14', 'Meningkatnya Pengawasan Pembangunan atas Kualitas Pengendalian Intern K/L/Badan Usaha', '2021-09-07 16:50:33', '2021-09-07 16:50:46');
COMMIT;

-- ----------------------------
-- Table structure for realisasi_outputs
-- ----------------------------
DROP TABLE IF EXISTS `realisasi_outputs`;
CREATE TABLE `realisasi_outputs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `ikk_target_id` bigint(20) unsigned NOT NULL,
  `realisasi` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `realisasi_outputs_ikk_target_id_foreign` (`ikk_target_id`),
  CONSTRAINT `realisasi_outputs_ikk_target_id_foreign` FOREIGN KEY (`ikk_target_id`) REFERENCES `ikk_targets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of realisasi_outputs
-- ----------------------------
BEGIN;
INSERT INTO `realisasi_outputs` VALUES (3, 2020, 0, 1, 98, 21, '2021-09-12 16:00:32', '2021-09-12 16:19:32');
INSERT INTO `realisasi_outputs` VALUES (4, 2020, 1, 4, 113, 5, '2021-09-12 17:18:14', '2021-09-14 12:00:38');
INSERT INTO `realisasi_outputs` VALUES (5, 2020, 1, 4, 114, 73, '2021-09-12 17:18:34', '2021-09-12 17:18:34');
INSERT INTO `realisasi_outputs` VALUES (6, 2020, 1, 4, 115, 10, '2021-09-12 17:19:31', '2021-09-12 17:19:31');
COMMIT;

-- ----------------------------
-- Table structure for ref_form_s_kriterias
-- ----------------------------
DROP TABLE IF EXISTS `ref_form_s_kriterias`;
CREATE TABLE `ref_form_s_kriterias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unsur_id` bigint(20) unsigned NOT NULL,
  `sub_unsur_id` bigint(20) unsigned NOT NULL,
  `parameter_id` bigint(20) unsigned NOT NULL,
  `kd_unsur` bigint(20) unsigned NOT NULL,
  `kd_sub_unsur` bigint(20) unsigned NOT NULL,
  `kd_parameter` bigint(20) unsigned NOT NULL,
  `kd_kriteria` bigint(20) unsigned NOT NULL,
  `kriteria_a` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kriteria_b` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kriteria_c` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kriteria_d` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kriteria_e` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t1` bigint(20) unsigned NOT NULL,
  `t2` bigint(20) unsigned NOT NULL,
  `t3` bigint(20) unsigned NOT NULL,
  `t4` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ref_form_s_kriterias
-- ----------------------------
BEGIN;
INSERT INTO `ref_form_s_kriterias` VALUES (1, 1, 1, 1, 1, 1, 1, 1, 'Penegakan integritas dan nilai etika telah diperbaiki secara berkelanjutan sehingga tercipta suasana kerja organisasi yang kondusif yang dapat mendorong kinerja para pegawai secara optimal', 'Kebijakan dan implementasi organisasi telah dievaluasi untuk meningkatkan integritas dan nilai etika para pegawai', 'Penegakan integritas dan nilai etika telah dilaksanakan oleh pegawai dalam pelaksanaan tugas dan fungsinya dalam organisasi', 'Kebijakan penegakan integritas dan nilai etika organisasi telah dipahami oleh seluruh pegawai', 'Terdapat kebijakan penegakan integritas dan nilai etika untuk seluruh pegawai dalam organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (2, 1, 1, 2, 1, 1, 2, 2, 'Kebijakan antikorupsi menjangkau semua kegiatan dan terevaluasi terus-menerus oleh struktur pengelola risiko korupsi yang bekerja efektif dengan kewenangan dan tanggung jawab yang memadai sehingga pengembangan kebijakan antikorupsi yang berkelanjutan benar-benar dilakukan.', 'Kebijakan antikorupsi telah nyata diimplementasikan pada semua kegiatan, namun belum ada reviu dan evaluasi terhadap efektivitasnya yang dilakukan secara formal dan terjadwal.', 'Kebijakan antikorupsi telah diimplementasikan, tetapi belum menjangkau semua kegiatan utama organisasi dengan wewenang dan tanggung jawab pengelolaan risiko korupsi belum ditetapkan secara permanen di dalam struktur organisasi', 'Kebijakan antikorupsi yang terwujud dalam penetapan struktur pengelolaan risiko korupsi dan standar perilaku antikorupsi baru pada tataran terdiseminasi dan masih diterapkan secara parsial saja dan terbatas lingkupnya. ', 'Kebijakan yang eksplisit untuk antikorupsi tidak ditetapkan, atau kalaupun ada, tidak berjalan sama sekali atau sekadar formalitas.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (3, 1, 1, 3, 1, 1, 3, 3, 'SOP yang mencakup prinsip cegah deteksi dan respons telah diterapkan secara konsisten pada seluruh kegiatan dan ada evaluasi terjadwal dan dilakukan perbaikan berkelanjutan sehingga membawa perubahan nyata pada organisasi.', 'Penetapan SOP mencakup proses cegah deteksi dan respons telah dilaksanakan semuanya secara konsisten, meskipun reviu dan evaluasi atas pelaksanaan SOP masih dilakukan secara insindentil.', 'Penetapan SOP mencakup proses cegah deteksi dan respons telah dilaksanakan semuanya, meskipun masih kurang konsisten dan tidak ada reviu dan evaluasi atas efektivitas kegiatannya.', 'Penetapan SOP antikorupsi belum mencakup tiga proses prinsip, atau mencakup ketiganya tetapi hanya berjalan sebagian saja, atau masih berfungsi secara terbatas lingkupnya, pelaksanaan SOP masih cenderung seremonial.', 'Tidak ada penetapan SOP antikorupsi spesifik. Kalaupun ada, tidak berfungsi sehingga formalitas belaka.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (4, 1, 1, 4, 1, 1, 4, 4, 'Kegiatan pembelajaran anti korupsi telah diberikan kepada pihak internal dan eksternal. Penyelenggaraan dilakukan dengan terencana dan terstruktur. Kegiatan tersebut dipantau pelaksanaannya dan dievaluasi efektivitasnya.', 'Kegiatan pembelajaran anti korupsi telah melibatkan pihak internal dan eksternal serta penyelenggaraan dilakukan secara terjadwal', 'Unit kerja telah melaksanakan kegiatan pembelajaran anti korupsi kepada pihak internal. Penyelenggaraan telah dilakukan secara terencana dan terstruktur', 'Unit kerja telah melaksanakan kegiatan pembelajaran anti korupsi kepada pihak internal dan penyelenggaraan bersifat insidentil dan tidak kontinyu ', 'Tidak terdapat kegiatan pembelajaran anti korupsi yang terencana, sistematis dan terstruktur. ', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (5, 1, 1, 5, 1, 1, 5, 5, 'Kondisi integritas organisasional sangat tinggi', 'Kondisi integritas organisasional pada cukup tinggi', 'Kondisi integritas organisasional pada tataran sedang', 'Kondisi integritas organisasional cenderung rendah', 'Kondisi integritas organisasional sangat rendah', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (6, 1, 1, 6, 1, 1, 6, 6, 'Iklim etis prinsip di dalam lingkungan unit kerja sangat tinggi', 'Iklim etis prinsip di dalam lingkungan unit kerja cukup tinggi', 'Iklim etis prinsip di dalam lingkungan unit kerja pada tingkatan sedang', 'Iklim etis prinsip di dalam lingkungan unit kerja cukup rendah', 'Iklim etis prinsip  di dalam lingkungan unit kerja sangat rendah', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (7, 1, 1, 7, 1, 1, 7, 7, 'Seluruh kejadian korupsi/perilaku koruptif yang ditemukan satu tahun terakhir telah selesai ditindaklanjuti oleh orang/tim yang kompeten dengan investigasi, audit, atau bentuk pengawasan lainnya dan tidak terdapat permasalahan konflik kepentingan dalam penyelesaian tindak lanjut', 'Tindaklanjut dalam bentuk investigasi, audit, atau bentuk pengawasan lainnya telah dilakukan oleh orang/tim yang kompeten dan independen terhadap sebagian besar temuan atas kejadian korupsi/perilaku koruptif', 'Kejadian korupsi/perilaku koruptif yang ditemukan satu tahun terakhir ditindaklanjuti oleh orang/tim yang kompeten namun berpotensi memiliki konflik kepentingan', 'Kejadian korupsi/perilaku koruptif yang ditemukan satu tahun terakhir ditindaklanjuti oleh orang/tim yang tidak kompeten dan berpotensi memiliki konflik kepentingan', 'Kejadian korupsi/perilaku koruptif yang ditemukan satu tahun terakhir tidak ditindaklanjuti', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (8, 1, 1, 8, 1, 1, 8, 8, 'Terhadap hasil investigasi, sanksi diberikan sepadan, ada pemulihan kerugian keuangan negara, dan perbaikan pengendalian. Terdapat bukti kejadian korupsi/perilaku koruptif tidak terulang karena penguatan pengendalian.', 'Terhadap hasil investigasi, audit, atau bentuk pengawasan lainnya ditindaklanjuti dengan upaya pemulihan kerugian keuangan negara dan perbaikan  pengendalian', 'Terhadap hasil investigasi, telah ditindaklanjuti dalam bentuk sanksi yang sesuai dengan nilai korupsi dan pemulihan kerugian keuangan negara namun belum ada perbaikan pengendalian.', 'Terhadap hasil investigasi, ada sanksi namun tidak sepadan dan tidak ada pemulihan kerugian keuangan negara serta perbaikan pengendalian.', 'Terhadap hasil investigasi, tidak ada sanksi kepada pelaku, tidak ada perbaikan pengendalian, dan tidak ada pemulihan kerugian keuangan negara atas tindakan korupsi', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (9, 1, 1, 9, 1, 1, 1, 9, 'Pengelolaan kompetensi SDM telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Standar kompetensi organisasi dan implementasi/pemanfaatannya telah dievaluasi untuk mengetahui efektivitasnya', 'Standar kompetensi telah diimplementasikan/dimanfaatkan dalam pengelolaan/pembinaan SDM organisasi', 'Standar kompetensi telah dikomunikasikan dan dipahami oleh seluruh pegawai organisasi', 'Terdapat standar kompetensi yang jelas untuk seluruh jabatan dan posisi dalam organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (10, 1, 3, 10, 1, 3, 1, 10, 'Penerapan manajemen kinerja, pengelolaan keuangan, manajemen SDM, serta manajemen risiko dapat meningkatkan efektivitas dan efisiensi kinerja seluruh level pimpinan dan pegawai', 'Pimpinan organisasi melaksanakan evaluasi berkala atas kebijakan pengendalian intern dan berupaya mengatasi permasalahan yang berkaitan dengan lingkungan pengendalian yang kondusif', 'Pimpinan organisasi melaksanakan kebijakan dan didukung dengan SDM yang bekerja sesuai dengan kebijakan yang ditetapkan', 'Pimpinan organisasi terlibat dalam penyusunan dan penetapkan kebijakan yang mendukung penciptaan lingkungan kerja yang kondusif untuk pencapaian tujuan organisasi serta memahami substansi kebijakan pengendalian intern dan mendorong penerapan kebijakan dalam berbagai interaksi kepada jajaran di bawahnya', 'Pimpinan organisasi terlibat dalam penyusunan dan penetapkan kebijakan yang mendukung penciptaan lingkungan kerja yang kondusif untuk pencapaian tujuan organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (11, 1, 3, 11, 1, 3, 2, 11, 'Sudah mengalokasikan sumber daya secara memadai untuk penerapan manajemen risiko pada tingkat operasional unit kerja, strategis unit kerja, dan strategis K/L/D\n', 'Sudah mengalokasikan sumber daya secara memadai untuk penerapan manajemen risiko pada tingkat operasional unit kerja dan strategis unit kerja namun pada tingkat srategis K/L/D belum memadai', 'Sudah mengalokasikan sumber daya secara memadai untuk penerapan manajemen risiko pada tingkat operasional unit kerja dan strategis unit kerja', 'Sudah mengalokasikan sumber daya secara memadai untuk penerapan manajemen risiko pada tingkat operasional unit kerja namun pada tingkat strategis unit kerja belum memadai', 'Sudah mengalokasikan sumber daya untuk penerapan manajemen risiko pada tingkat operasional unit kerja namun belum memadai', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (12, 1, 3, 12, 1, 3, 3, 12, 'Seluruh pengambilan keputusan strategis K/L/D, strategis unit kerja, dan operasional unit kerja telah mempertimbangkan risiko dan memberikan dampak bagi pencapaian tujuan organisasi\n', 'Seluruh pengambilan keputusan strategis K/L/D, strategis unit kerja, dan operasional unit kerja telah mempertimbangkan risiko\n', 'Seluruh pengambilan keputusan strategis unit kerja dan operasional unit kerja telah mempertimbangkan risiko\n', 'Seluruh pengambilan keputusan operasional unit kerja telah mempertimbangkan risiko\n', 'Sebagian pengambilan keputusan operasional unit kerja telah mempertimbangkan risiko\n', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (13, 1, 3, 13, 1, 3, 4, 13, 'Kinerja penerapan manajemen risiko digunakan sebagai dasar penilaian kinerja pada seluruh UPR tingkatan operasional unit kerja, seluruh UPR tingkatan strategis unit kerja, dan UPR tingkat strategis K/L/D secara memadai dan telah dievaluasi pencapaiannya', 'Kinerja penerapan manajemen risiko digunakan sebagai dasar penilaian kinerja pada seluruh UPR tingkatan operasional unit kerja, seluruh UPR tingkatan strategis unit kerja, dan UPR tingkat strategis K/L/D secara memadai', 'Kinerja penerapan manajemen risiko digunakan sebagai dasar penilaian kinerja pada seluruh UPR tingkatan operasional unit kerja dan seluruh UPR tingkatan strategis unit kerja secara memadai', 'Kinerja penerapan manajemen risiko digunakan sebagai dasar penilaian kinerja pada seluruh UPR tingkatan operasional unit kerja secara memadai', 'Kinerja penerapan manajemen risiko digunakan sebagai dasar penilaian kinerja pada sebagian UPR tingkatan operasional unit kerja secara memadai', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (14, 1, 3, 14, 1, 3, 5, 14, 'Sumber daya keuangan, SDM, dan sarana-prasarana untuk melaksanakan kegiatan pengelolaan risiko korupsi pada semua kegiatan telah tersedia dalam jumlah dan kualitas yang memadai. Tidak ada informasi yang memperlihatkan kegiatan antikorupsi terhambat karena masalah SDM, keuangan, dan sarana prasarana.', 'SDM dan anggaran untuk kegiatan pengelolaan risiko korupsi pada kegiatan utama telah tersedia dalam jumlah dan kualitas yang memadai. Tidak ditemukan informasi yang memperlihatkan kegiatan antikorupsi terhambat karena masalah SDM dan keuangan.', 'SDM untuk melaksanakan kegiatan pengelolaan risiko korupsi pada kegiatan utama telah tersedia dalam jumlah yang memadai. Tidak ditemukan informasi yang memperlihatkan kegiatan antikorupsi terhambat karena masalah SDM. ', 'Terdapat data yang mengisyaratkan kegiatan pengelolaan risiko korupsi terhambat secara signifikan karena masalah ketersediaan SDM, keuangan, atau sarpras, tetapi sudah ada upaya kompensatif untuk mengatasi permasalahan.', 'Terdapat data yang mengisyaratkan kegiatan pengelolaan risiko korupsi terhambat secara signifikan karena masalah ketersediaan SDM, keuangan, dan sarana prasarana dan tidak ada kegiatan kompensatif untuk mengatasi permasalahan tersebut.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (15, 1, 3, 15, 1, 3, 6, 15, 'Keputusan formal pimpinan dalam pelaksanaan tugas dan fungsi unit kerja secara nyata telah mempertimbangkan risiko korupsi, disusun secara partisipatif dan kegiatan yang bersifat kemitraan dan kolaboratif telah berdampak nyata pada efektivitas pengelolaan risiko korupsi. ', 'Pimpinan telah menampilkan sikap antikorupsi dalam setiap pengambilan keputusan untuk pelaksanaan tugas dan fungsi unit kerja dan terwujud dalam keputusan formal. Pimpinan selalu terbuka membahas risiko korupsi dengan bawahan dan secara aktif mengupayakan kerjasama dengan berbagai pihak dalam aktivitas cegah-deteksi-respons.', 'Pimpinan telah mempertontonkan sikap antikorupsi dalam proses pengambilan keputusan sehari-hari, dan melibatkan diri dalam kegiatan-kegiatan edukatif, serta melaksanakan upaya-upaya pengelolaan risiko korupsi yang bersifat kemitraan dan kolaboratif dan telah cukup substansial meskipun lingkupnya masih terbatas (tidak semua kegiatan) dan belum konsisten.', 'Pimpinan telah mempertontonkan sikap antikorupsi dalam proses pengambilan keputusan sehari-hari, dan melibatkan diri dalam kegiatan-kegiatan edukatif, serta melaksanakan kegiatan antikorupsi bekerjasama dengan lembaga lain tetapi banyak aktivitas masih cenderung seremonial.', 'Pimpinan tidak menggunakan kuasa dan wewenangnya untuk mendorong sikap antikorupsi dalam pengambilan keputusan, tidak menampilkan sikap untuk memberdayakan diri dan melakukan upaya yang bersifat kemitraan dan kolaboratif agar mampu mengelola risiko korupsi secara efektif.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (16, 1, 3, 16, 1, 3, 7, 16, 'Tingkat kepemimpinan etis di dalam unit organisasi sangat tinggi ', 'Tingkat kepemimpinan etis di dalam unit organisasi cukup tinggi ', 'Tingkat kepemimpinan etis di dalam unit organisasi pada tataran sedang ', 'Tingkat kepemimpinan etis di dalam unit organisasi cukup rendah ', 'Tingkat kepemimpinan etis di dalam unit organisasi sangat rendah', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (17, 1, 4, 17, 1, 4, 1, 17, 'K/L/D memiliki fleksibilitas untuk menyesuaikan struktur organisasi dalam rangka mendukung perubahan proses bisnis dan perubahan perencanaan strategis', 'Efisiensi dan efektivitas struktur organisasi dapat dilihat secara berkala melalui pengujian atas pelaksanaan proses bisnis organisasi dan ketepatannya dengan perencanaan strategis', 'Struktur organisasi dijalankan sesuai proses bisnis organisasi dengan SDM yang mencukupi', 'Proses bisnis organisasi dapat didukung dengan struktur organisasi yang ditetapkan dan personel pada setiap lini mengetahui arus data dan informasi yang diperlukan dalam melaksanaan tugas dan fungsinya', 'Terdapat penetapan struktur, tugas, dan fungsi organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (18, 1, 5, 18, 1, 5, 1, 18, 'Pimpinan organisasi memiliki akses untuk melihat proses pendelegasian wewenang dan tanggungjawab yang diberikan dan memonitor pelaksanaan tugas fungsi yang dijalankan untuk menjamin tujuan percepatan yang diharapkan dan mendukung perbaikan secara berkelanjutan.', 'Efisiensi dan efektivitas pelaksanaan wewenang dan tanggung jawab organisasi yang didelegasikan dapat dilihat melalui evaluasi berkala atas pelaksanaan wewenang dan tanggungjawab serta analisis terhadap kualitas hasil pelaksanaan tugas/fungsi yang dilaksanakan (respon stakeholder)', 'Pelaksanaan tugas dan fungsi yang didelegasikan dilaksanakan sesuai dengan kebijakan/prosedur yang ditetapkan', 'Kegiatan/prosedur yang dalam pelaksanaannya telah didelegasikan kepada struktur dibawahnya telah dipahami dan diketahui oleh pihak terkait', 'Pimpinan organisasi menetapkan kebijakan terkait wewenang dan tanggung jawab pelaksanaan kegiatan kepada struktur di bawahnya secara berjenjang', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (19, 1, 6, 19, 1, 6, 1, 19, 'Pengelolaan SDM telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait pengelolaan SDM organisasi telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Pengelolaan SDM telah dilaksanakan sejak rekrutmen sampai dengan pemberhentian pegawai sesuai kebijakan/prosedur yang ditetapkan', 'Kebijakan terkait pengelolaan SDM telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan dalam organisasi', 'Terdapat kebijakan yang mengatur pengelolaan SDM sejak rekrutmen sampai dengan pemberhentian pegawai', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (20, 1, 6, 20, 1, 6, 2, 20, 'Terdapat upaya peningkatan kompetensi dan keterampilan terkait manajemen risiko yang memadai dengan cakupan seluruh pegawai dan telah dievaluasi pencapaiannya', 'Terdapat upaya peningkatan kompetensi dan keterampilan terkait manajemen risiko yang memadai dengan cakupan seluruh pegawai', 'Terdapat upaya peningkatan kompetensi dan keterampilan terkait manajemen risikoyang memadai dengan cakupan sebagian besar pegawai', 'Terdapat upaya peningkatan kompetensi dan keterampilan terkait manajemen risiko yang memadai dengan cakupan sebagian pegawai', 'Terdapat upaya peningkatan kompetensi dan keterampilan terkait manajemen risiko namun belum memadai', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (21, 1, 6, 21, 1, 6, 3, 21, 'Seluruh pegawai telah memiliki pemahaman terkait manajemen risiko', 'Sebagian besar pegawai telah memiliki pemahaman terkait manajemen risiko', 'Sebagian pegawai telah memiliki pemahaman terkait manajemen risiko', 'Sebagian kecil pegawai telah memiliki pemahaman terkait manajemen risiko', 'Beberapa pegawai telah memiliki kesadaran pemahaman terkait manajemen risiko', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (22, 1, 7, 22, 1, 7, 1, 22, 'APIP telah menjadi unit yang terus belajar baik dari dalam maupun dari luar organisasi untuk perbaikan berkelanjutan', 'APIP telah mengintegrasikan semua informasi di seluruh organisasi untuk memperbaiki tata kelola dan manajemen risiko', 'Praktik profesional dan audit internal telah ditetapkan secara seragam', 'Proses audit dilakukan secara tetap (rutin) dan berulang', 'Tidak ada praktik yang tetap, tidak ada kapabilitas yang berulang dan tergantung pada kinerja individu', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (23, 1, 8, 23, 1, 8, 1, 23, 'Pelaksanaan hubungan kerja yang baik dengan mitra kerjasama organisasi menghasilkan efektivitas pencapaian tujuan organisasi dan efisiensi penggunaan sumberdaya masing-masing instansi', 'Pelaksanaan kebijakan kerjasama organisasi dievaluasi secara berkala', 'Masing-masing pihak melaksanakan kegiatan sesuai dengan lingkup kewenangan masing-masing sesuai kebijakan dan ukuran kinerja yang ditetapkan', 'Pubilkasi kebijakan kerjasama organisasi kepada para pihak yang berkepentingan (antara lain subjek, objek, dan penerima manfaat kerjasama)', 'Pimpinan organisasi menetapkan mekanisme hubungan kerja/tata cara kerjasama dengan instansi lain', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (24, 1, 8, 24, 1, 8, 2, 24, 'Instansi Pemerintah telah memiliki kebijakan pengelolaan risiko terkait kemitraan, penerapannya telah terintegrasi dengan proses bisnis Instansi Pemerintah, telah direviu secara berkala dan dijadikan bahan pembelajaran', 'Instansi Pemerintah telah memiliki kebijakan pengelolaan risiko terkait kemitraan dan penerapannya telah terintegrasi dengan proses bisnis Instansi Pemerintah', 'Instansi Pemerintah telah memiliki kebijakan pengelolaan risiko terkait kemitraan dan telah diterapkan dengan memadai', 'Instansi Pemerintah telah memiliki kebijakan pengelolaan risiko terkait kemitraan namun belum diterapkan dengan memadai', 'Instansi Pemerintah telah memiliki kebijakan pengelolaan risiko terkait kemitraan namun belum diterapkan sama sekali', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (25, 2, 9, 25, 2, 1, 1, 25, 'K/L/D telah memiliki Kebijakan Manajemen Risiko yang memadai, terintegrasi serta telah direviu secara berkala', 'K/L/D telah memiliki Kebijakan Manajemen Risiko yang memadai dan terintegrasi', 'K/L/D telah memiliki Kebijakan Manajemen Risiko yang memadai', 'K/L/D telah memiliki Kebijakan Manajemen Risiko namun belum memadai', 'K/L/D telah memiliki Kebijakan Manajemen Risiko namun sama sekali belum memuat persyaratan dalam kriteria memadai', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (26, 2, 9, 26, 2, 1, 2, 26, 'Kualitas identifikasi risiko dan register risiko memadai, serta telah mengidentifikasi peluang', 'Kualitas identifikasi risiko dan register risiko memadai', 'Kualitas identifikasi risiko dan register risiko cukup memadai', 'Kualitas identifikasi risiko dan register risiko belum memadai', 'Register risiko telah disusun', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (27, 2, 9, 27, 2, 1, 3, 27, 'Proses manajemen risiko mendukung inovasi, diidentifikasi untuk memaksimalkan peluang dan dijadikan bahan pembelajaran', 'Proses manajemen risiko telah diterapkan secara konsisten, terintegrasi dengan proses bisnis dan proses perencanaan tingkat operasional unit kerja, strategis unit kerja, dan strategis K/L/D', 'Proses manajemen risiko telah diterapkan secara konsisten, terintegrasi dengan proses bisnis dan proses perencanaan tingkat operasional unit kerja dan strategis unit kerja', 'Proses manajemen risiko telah terintegrasi dengan dengan proses bisnis dan proses perencanaan tingkat operasional unit kerja serta telah diterapkan secara konsisten', 'Proses manajemen risiko mulai dihubungkan dengan dengan proses bisnis dan proses perencanaan tingkat operasional unit kerja namun belum diterapkan secara konsisten', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (28, 2, 10, 28, 2, 2, 1, 28, 'Analisis risiko telah dilakukan secara memadai terhadap risiko operasional unit kerja, risiko strategis unit kerja, dan risiko strategis K/L/D', 'Analisis risiko telah dilakukan secara memadai terhadap risiko operasional unit kerja dan risiko strategis unit kerja', 'Analisis risiko telah dilakukan secara memadai terhadap risiko operasional unit kerja', 'Analisis risiko telah dilakukan terhadap seluruh risiko operasional yang teridentifikasi namun belum memadai', 'Analisis risiko telah dilakukan terhadap sebagian risiko operasional yang teridentifikasi.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (29, 2, 10, 29, 2, 2, 2, 29, 'Instansi Pemerintah telah menentukan prioritas risiko pada seluruh risiko operasional unit kerja, strategis unit kerja, strategis K/L/D', 'Instansi Pemerintah telah menentukan prioritas risiko pada seluruh risiko operasional unit kerja dan strategis unit kerja', 'Instansi Pemerintah telah menentukan prioritas risiko pada seluruh risiko operasional unit kerja dan sebagian risiko strategis unit kerja', 'Instansi Pemerintah telah menentukan prioritas risiko pada seluruh risiko operasional unit kerja', 'Instansi Pemerintah telah menentukan prioritas risiko pada sebagian risiko operasional unit kerja', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (30, 2, 10, 30, 2, 2, 3, 30, 'Instansi Pemerintah telah menentukan rencana tindak pengendalian terhadap risiko operasional unit kerja, strategis unit kerja, dan strategis K/L/D secara memadai', 'Instansi Pemerintah telah menentukan rencana tindak pengendalian terhadap risiko operasional unit kerja dan strategis unit kerja secara memadai', 'Instansi Pemerintah telah menentukan rencana tindak pengendalian terhadap seluruh risiko operasional unit kerja dan sebagian risiko strategis unit kerja yang telah diprioritaskan', 'Instansi Pemerintah telah menentukan rencana tindak pengendalian terhadap seluruh risiko operasional unit kerja yang telah diprioritaskan', 'Instansi Pemerintah telah menentukan rencana tindak pengendalian terhadap sebagian risiko operasional unit kerja yang telah diprioritaskan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (31, 2, 10, 31, 2, 2, 4, 31, 'Tindak pengendalian terhadap seluruh risiko operasional unit kerja, risiko strategis unit kerja, dan risiko strategis K/L/D telah diimplementasikan', 'Tindak pengendalian terhadap seluruh risiko operasional unit kerja dan risiko strategis unit kerja telah diimplementasikan', 'Tindak pengendalian terhadap seluruh risiko operasional unit kerja dan sebagian risiko strategis unit kerja telah diimplementasikan', 'Tindak pengendalian terhadap seluruh risiko operasional unit kerja telah diimplementasikan', 'Tindak pengendalian terhadap sebagian risiko operasional unit kerja telah diimplementasikan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (32, 2, 10, 32, 2, 2, 5, 32, 'Tindak pengendalian telah efektif menurunkan risiko operasional unit kerja, strategis unit kerja, dan strategis K/L/D', 'Tindak pengendalian telah efektif menurunkan risiko operasional unit kerja dan strategis unit kerja', 'Tindak pengendalian efektif menurunkan seluruh risiko operasional unit kerja dan sebagian risiko strategis unit kerja', 'Tindak pengendalian efektif menurunkan seluruh risiko operasional unit kerja', 'Tindak pengendalian efektif menurunkan sebagian risiko operasional unit kerja', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (33, 2, 10, 33, 2, 2, 6, 33, 'Rencana tindak pengendalian hasil asesmen risiko korupsi baik pada kegiatan utama maupun kegiatan pendukung telah dilaksanakan dan updating register risiko korupsi dilakukan secara periodik dan konsisten', 'Asesmen risiko korupsi pada kegiatan utama telah menghasilkan peta risiko korupsi dan rencana tindak pengendalian dan terjadwal. Ada bukti RTP dilaksanakan.', 'Asesmen risiko korupsi pada beberapa kegiatan utama telah menghasilkan peta risiko korupsi dan rencana tindak pengendalian dan terjadwal', 'Unit kerja telah melakukan identifikasi skenario/modus dan penyebab korupsi namun belum dilakukan penilaian atas risiko korupsi yang teridentifikasi', 'Penilaian risiko korupsi tidak berjalan', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (34, 3, 11, 34, 3, 1, 1, 34, 'Pelaksanaan reviu kinerja mendukung pencapaian kinerja organisasi', 'Kebijakan dan pelaksanaan reviu kinerja organisasi oleh masing-masing jenjang pimpinan telah dievaluasi secara berkala', 'Reviu kinerja organisasi dilaksanakan dan didokumentasikan dengan baik untuk dibandingkan pengaruhnya terhadap capaian kinerja periode berikutnya', 'Kewajiban pelaksanaan reviu kinerja diketahui oleh seluruh pimpinan unit dan pegawai', 'Pimpinan organisasi dan jajaran di bawahnya secara berjenjang memiliki tanggungjawab/kewajiban untuk melaksanakan reviu kinerja secara berkala', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (35, 3, 12, 35, 3, 2, 1, 35, 'Pembinaan SDM organisasi telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait pembinaan SDM organisasi telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Pembinaan SDM telah dilaksanakan sesuai kebijakan/prosedur yang ditetapkan organisasi', 'Kebijakan terkait pembinaan SDM telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur pembinaan SDM untuk mendukung pelaksanaan tugas dan fungsi organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (36, 3, 13, 36, 3, 3, 1, 36, 'Perbaikan terkait pengelolaan sistem informasi organisasi dilakukan secara berkelanjutan.', 'Kebijakan pengendalian atas pengelolaan sistem informasi organisasi telah dievaluasi secara berkala.', 'Kebijakan pengelolaan sistem informasi organisasi digunakan dalam analisis kebutuhan dukungan sistem informasi, kemanfaatan sistem informasi existing, serta struktur pengelola dan pengguna sistem informasi beserta wewenang dan tanggungjawabnya.', 'Unit pengelola sistem informasi organisasi dan pengguna mengetahui kebijakan pengelolaan sistem informasi.', 'Pimpinan organisasi menetapkan kebijakan/grand design pengelolaan sistem informasi.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (37, 3, 14, 37, 3, 4, 1, 37, 'Perbaikan berkelanjutan atas pengelolaan aset organisasi', 'Kebijakan/prosedur pengelolaan atas aset organisasi termasuk pengamanan fisik atas aset dievaluasi secara berkala', 'Kebijakan/prosedur pengelolaan atas aset organisasi termasuk pengamanan fisik atas aset diimplementasikan secara memadai', 'Kebijakan pengelolaan aset organisasi dipahami oleh pengelola aset dan pengguna aset', 'Pimpinan organisasi menetapkan kebijakan/prosedur pengelolaan BMN/D', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (38, 3, 15, 38, 3, 5, 1, 38, 'Perbaikan berkelanjutan atas penetapan dan reviu atas indikator dan ukuran kinerja organisasi', 'Kebijakan/prosedur penetapan dan reviu atas indikator dan ukuran kinerja organisasi dievaluasi secara berkala', 'Kebijakan/prosedur penetapan dan reviu atas indikator dan ukuran kinerja organisasi dilaksanakan secara memadai.', 'Kebijakan/prosedur penetapan dan reviu atas indikator dan ukuran kinerja organisasi dipahami namun belum sepenuhnya diimplementasikan.', 'Pimpinan organisasi menetapkan kebijakan/prosedur penetapan dan reviu atas indikator dan ukuran kinerja.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (39, 3, 16, 39, 3, 6, 1, 39, 'Pemisahan fungsi telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait pemisahan fungsi dalam proses transaksi dan kejadian telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Pemisahan fungsi dalam proses transaksi dan kejadian telah dilaksanakan sesuai kebijakan/prosedur yang ditetapkan', 'Kebijakan terkait pemisahan fungsi dalam proses transaksi dan kejadian telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur pemisahan fungsi dalam proses transaksi dan kejadian', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (40, 3, 17, 40, 3, 7, 1, 40, 'Proses otorisasi atas transaksi dan kejadian telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait otorisasi atas transaksi dan kejadian telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Otorisasi atas transaksi dan kejadian telah dilaksanakan sesuai kebijakan/prosedur yang ditetapkan', 'Kebijakan terkait otorisasi atas transaksi dan kejadian telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur prosedur otorisasi atas transaksi dan kejadian', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (41, 3, 18, 41, 3, 8, 1, 41, 'Pencatatan atas transaksi dan kejadian telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait pencatatan atas transaksi dan kejadian telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Pencatatan atas transaksi dan kejadian telah dilaksanakan sesuai kebijakan/prosedur yang ditetapkan', 'Kebijakan terkait pencatatan atas transaksi dan kejadian telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur prosedur pencatatan atas transaksi dan kejadian', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (42, 3, 19, 42, 3, 9, 1, 42, 'Pembatasan akses terhadap sumber daya dan pencatatannya telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait pembatasan akses terhadap sumber daya dan pencatatannya telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Terhadap sumber daya dan pencatatannya telah dilakukan pembatasan akses sesuai dengan ketentuan', 'Kebijakan terkait pembatasan akses terhadap sumber daya dan pencatatannya telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur prosedur pembatasan akses terhadap sumber daya yang dimiliki organisasi beserta pencatatannya', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (43, 3, 20, 43, 3, 10, 1, 43, 'Pertanggungjawaban terhadap sumber daya dan pencatatannya telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Kebijakan dan implementasi terkait akuntabilitas sumber daya dan pencatatannya telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Sumber daya dan pencatatannya telah dipertanggungjawabkan oleh pihak/pegawai yang ditetapkan sesuai kebijakan/prosedur yang ditetapkan', 'Kebijakan terkait pertanggungjawaban sumber daya dan pencatatannya telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur prosedur pertanggungjawaban sumber daya dan pencatatannya', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (44, 3, 21, 44, 3, 11, 1, 44, 'Pendokumentasian atas SPI serta transaksi dan kejadian penting telah diperbaiki secara berkelanjutan dan secara optimal mampu mendukung pencapaian tujuan organisasi', 'Pendokumentasian atas SPI serta transaksi dan kejadian penting telah dievaluasi sehingga dapat diketahui efektivitasnya', 'Pendokumentasian atas SPI serta transaksi dan kejadian penting telah dilaksanakan sesuai kebijakan/prosedur yang ditetapkan', 'Kebijakan terkait prosedur pendokumentasian atas SPI serta transaksi dan kejadian penting telah dikomunikasikan dan dipahami oleh pihak yang berkepentingan', 'Terdapat kebijakan yang mengatur prosedur pendokumentasian atas SPI serta transaksi dan kejadian penting', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (45, 4, 22, 45, 4, 1, 1, 45, 'Informasi yang disajikan relevan dan memenuhi ekspektasi stakeholder', 'Klasifikasi informasi telah dievaluasi dan ditindaklanjuti sehingga dapat disajikan dengan tepat waktu, andal, dan relevan', 'Informasi yang relevan untuk mendukung pengendalian intern tersedia secara lengkap dan mudah untuk diperoleh', 'Informasi yang relevan untuk mendukung pengendalian intern tersedia secara lengkap namun tidak mudah diperoleh/akses terbatas', 'Ketersediaan informasi yang relevan untuk mendukung pengendalian intern tidak lengkap', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (46, 4, 22, 46, 4, 1, 2, 46, 'Sistem pengaduan berdampak pada perbaikan berkelanjutan', 'Sistem pengaduan telah dievaluasi', 'Sistem pengaduan telah diterapkan dan ditindaklanjuti sesuai Kebijakan/SOP', 'Keberadaan sistem pengaduan telah disosialisasikan kepada masyarakat/stakeholder', 'Telah terdapat kebijakan penerapan sistem pengaduan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (47, 4, 22, 47, 4, 1, 3, 47, 'Strategi dan kebijakan manajemen risiko telah dikomunikasikan pada seluruh pegawai pada tingkat operasional unit kerja, tingkat strategis unit kerja, dan tingkat strategis K/L/D', 'Strategi dan kebijakan manajemen risiko telah dikomunikasikan pada seluruh pegawai pada tingkat operasional unit kerja dan tingkat strategis unit kerja', 'Strategi dan kebijakan manajemen risiko telah dikomunikasikan pada seluruh pegawai pada tingkat operasional unit kerja dan sebagian pegawai pada tingkat strategis unit kerja', 'Strategi dan kebijakan manajemen risiko telah dikomunikasikan pada seluruh pegawai pada tingkat operasional unit kerja', 'Strategi dan kebijakan manajemen risiko telah dikomunikasikan pada sebagian pegawai pada tingkat operasional unit kerja', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (48, 4, 22, 48, 4, 1, 4, 48, 'Register risiko dan rencana tindak pengendalian tingkat operasional Unit Kerja/OPD, strategis Unit Kerja/OPD dan Strategis K/L/D telah dikomunikasikan kepada seluruh pihak terkait dan dijadikan bahan dalam pengambilan keputusan  serta menjadi bahan pembelajaran dan inovasi', 'Register risiko dan rencana tindak pengendalian tingkat operasional Unit Kerja/OPD, strategis Unit Kerja/OPD dan Strategis K/L/D telah dikomunikasikan kepada seluruh pihak terkait dan dijadikan bahan dalam pengambilan keputusan', 'Register risiko dan rencana tindak pengendalian operasional Unit Kerja/OPD, strategis Unit Kerja/OPD dan Strategis K/L/D telah dikomunikasikan kepada seluruh pihak terkait', 'Register risiko dan rencana tindak pengendalian tingkat operasional unit kerja/OPD dan strategis unit kerja/OPD telah dikomunikasikan kepada seluruh pihak terkait', 'Register risiko dan rencana tindak pengendalian tingkat operasional unit kerja telah dikomunikasikan kepada sebagian pihak terkait', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (49, 4, 22, 49, 4, 1, 5, 49, 'Unit kerja menyelenggarakan sistem whistleblowing secara mandiri dan telah dimanfaatkan secara konstruktif oleh pegawai dan stakeholder. Informasi whistleblowing ditangani sesuai prosedur dan keandalan sistem whistleblowing dipantau dan dievaluasi efektivitasnya sebagai bahan perbaikan yang berkelanjutan', 'Unit kerja menyelenggarakan sistem whistleblowing internal secara mandiri, telah dimanfaatkan secara konstruktif oleh pegawai dengan tumbuhnya intensi whistleblowing yang cukup tinggi dan sikap positif kepada pelapor, serta mekanisme perlindungan kepada pelapor berfungsi.', 'Unit kerja menyelenggarakan sistem whistleblowing internal dan cukup berfungsi, secara umum sikap terhadap pelapor cukup positif dan niat whistleblowing pada tataran sedang. Pegawai tidak memanfaatkan saluran whistleblowing karena masih tidak percaya mekanisme perlindungan pelapor berjalan.', 'Unit kerja menyelenggarakan sistem whistleblowing internal namun tidak ada bukti saluran pelaporan berfungsi dan dimanfaatkan, dan sikap terhadap pelapor masih cenderung negatif dan niat whistleblowing cenderung rendah.', 'Unit kerja tidak menyelenggarakan sistem whistleblowing dan adanya sikap negatif terhadap pelapor', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (50, 4, 23, 50, 4, 2, 1, 50, 'Perbaikan berkelanjutan atas metodologi komunikasi yang efektif', 'Komunikasi yang efektif telah dilakukan kepada internal dan eksternal secara terstruktur dan berkala dan telah dievaluasi', 'Komunikasi yang efektif telah dilakukan kepada internal dan eksternal secara terstruktur dan berkala', 'Komunikasi yang efektif telah dilakukan kepada internal dan eksternal namun belum terstruktur dan berkala', 'Komunikasi yang efektif dengan eksternal belum dilakukan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (51, 5, 24, 51, 5, 1, 1, 51, 'Perbaikan berkelanjutan atas pemantauan pengendalian intern dilaksanakan dan berdampak pada kualitas pengendalian intern', 'Seluruh hasil pemantauan berkelanjutan dikelola dan ditindaklanjuti', 'Pemantauan pelaksanaan pengendalian telah dilaksanakan pada seluruh aktivitas pengendalian dan terkait pemantauan kinerja telah dilaksanakan pada level program, kegiatan, unit kerja level dibawahnya sampai dengan pemantauan kinerja individu, namun hasil pemantauan belum dikelola (tidak lanjut tidak termonitor)', 'Pemantauan pelaksanaan pengendalian telah dilaksanakan pada sebagian aktivitas pengendalian dan terkait pemantauan kinerja telah dilaksanakan pada level program dan kegiatan', 'Pemantauan pelaksanaan pengendalian telah dilaksanakan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (52, 5, 24, 52, 5, 1, 2, 52, 'Sudah dilakukan reviu atas seluruh risiko operasional unit kerja, strategis unit kerja, dan strategis K/L/D dan hasil reviu dijadikan bahan perbaikan organisasi', 'Sudah dilakukan reviu atas seluruh risiko operasional unit kerja, strategis unit kerja, dan strategis K/L/D', 'Sudah dilakukan reviu atas seluruh risiko operasional unit kerja dan strategis unit kerja', 'Sudah dilakukan reviu atas seluruh risiko operasional unit kerja', 'Sudah dilakukan reviu atas sebagian risiko operasional unit kerja', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (53, 5, 24, 53, 5, 1, 3, 53, 'Monitoring terhadap risiko dan tindak pengendalian dilakukan terhadap risiko operasional unit kerja, strategis unit kerja, dan strategis K/L/D secara memadai dan menjadi bahan pembelajaran bagi unit kerja', 'Monitoring terhadap risiko dan tindak pengendalian dilakukan terhadap risiko operasional unit kerja/OPD, strategis unit kerja/OPD dan strategis K/L/D secara memadai', 'Monitoring terhadap risiko dan tindak pengendalian dilakukan terhadap risiko operasional unit kerja/OPD dan strategis unit kerja/OPD secara memadai', 'Monitoring terhadap risiko dan tindak pengendalian dilakukan terhadap risiko operasional unit kerja/OPD secara memadai', 'Monitoring terhadap risiko dan tindak pengendalian dilakukan terhadap risiko operasional unit kerja/OPD namun belum memadai', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (54, 5, 25, 54, 5, 2, 1, 54, 'Perbaikan berkelanjutan atas pelaksanaan evaluasi terpisah berdampak pada peningkatan kualitas pengendalian intern dan pencapaian tujuan organisasi', 'Seluruh hasil evaluasi terpisah dikelola dan ditindaklanjuti', 'Evaluasi terpisah telah dilaksanakan pada seluruh aktivitas pengendalian dan seluruh program dan kegiatan serta dilaksanakan oleh pihak yang kompeten dan dengan metodologi yang tepat, namun hasil evaluasi terpisah belum ditindaklanjuti seluruhnya', 'Evaluasi terpisah telah dilaksanakan pada sebagian aktivitas pengendalian dan seluruh program dan kegiatan serta dilaksanakan oleh pihak yang kompeten dengan metodologi yang tepat', 'Evaluasi terpisah atas pengendalian intern dan pelaksanaan program/kegiatan telah dilaksanakan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_kriterias` VALUES (55, 5, 25, 55, 5, 2, 2, 55, 'Reviu terhadap proses tindak pengendalian risiko tingkat operasional unit kerja/OPD, strategis unit kerja/OPD, dan strategis K/L/D sangat memadai', 'Reviu terhadap proses tindak pengendalian untuk risiko tingkat operasional unit kerja/OPD, strategis unit kerja/OPD, dan strategis K/L/D memadai', 'Reviu terhadap proses tindak pengendalian untuk risiko tingkat operasional unit kerja/OPD dan strategis unit kerja/OPD memadai', 'Reviu terhadap proses tindak pengendalian untuk risiko tingkat operasional unit kerja/OPD cukup memadai', 'Reviu terhadap proses tindak pengendalian untuk risiko tingkat operasional unit kerja/OPD belum memadai', 1, 1, 1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ref_form_s_parameters
-- ----------------------------
DROP TABLE IF EXISTS `ref_form_s_parameters`;
CREATE TABLE `ref_form_s_parameters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unsur_id` bigint(20) unsigned NOT NULL,
  `sub_unsur_id` bigint(20) unsigned NOT NULL,
  `kd_unsur` bigint(20) unsigned NOT NULL,
  `kd_sub_unsur` bigint(20) unsigned NOT NULL,
  `kd_parameter` bigint(20) unsigned NOT NULL,
  `uraian_parameter` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t1` bigint(20) unsigned NOT NULL,
  `t2` bigint(20) unsigned NOT NULL,
  `t3` bigint(20) unsigned NOT NULL,
  `t4` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ref_form_s_parameters
-- ----------------------------
BEGIN;
INSERT INTO `ref_form_s_parameters` VALUES (1, 1, 1, 1, 1, 1, 'K/L/D menegakkan integritas dan nilai etika dalam  pengelolaan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (2, 1, 1, 1, 1, 2, 'Kebijakan eksplisit atas  pengendalian korupsi yang mencakup pernyataan kebijakan, penetapan struktur pengelola risiko korupsi, serta standar perilaku antikorupsi ', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (3, 1, 1, 1, 1, 3, 'Organisasi menetapkan dan melaksanakan SOP antikorupsi yang mencakup tiga proses prinsip dalam pengelolaan risiko korupsi, yakni cegah, deteksi, dan respons', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (4, 1, 1, 1, 1, 4, 'Tentang proses unit kerja sebagai lingkungan belajar dikelola untuk memungkinkan pegawai di semua level berpartisipasi dalam program antikorupsi dengan menghindari perilaku koruptif dan menunjukkan sikap lugas ketika berhadapan dengan situasi yang memicu perilaku korupsi.  Proses belajar juga harus menjangkau stakeholders (penyedia dan pengguna layanan) untuk mendapatkan komitmen kerjasama untuk berjalannya program antikorupsi.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (5, 1, 1, 1, 1, 5, 'Integritas adalah keutamaan-keutamaan (virtues) seperti kejujuran, hal dapat dipercaya (trustworthiness), komitmen terhadap standar etis, atau keteguhan sikap & perilaku sesuai prinsip moral/etika.  Berintegritas berarti apa yang diucapkan utuh, lengkap, takbercacat, taklebih dan takkurang. Pada konteks organisasi, integritas berarti apa yang dinyatakan dalam kebijakan, SOP, peraturan, atau standar, itu pula yang dilaksanakan: utuh, tidak kurang dan tidak lebih. Transparansi dan akuntabilitas, itulah wujud nilai integritas organisasional. Integritas organisasional adalah tingkat kesesuaian kegiatan dengan peraturan/kebijakan secara keseluruhan, yang berarti bukan sekadar kesesuaian secara formal, tetapi juga kesesuaian dengan nilai prinsip yang melandasi terbitnya peraturan/ kebijakan.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (6, 1, 1, 1, 1, 6, 'Terdapat persepsi bersama oleh semua pegawai secara umum bahwa yang dijadikan acuan utama sebagai perilaku etis adalah peraturan, SOP, hukum, atau standar profesional', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (7, 1, 1, 1, 1, 7, 'Mencakup semua langkah tindak lanjut atas indikasi korupsi yang terdeteksi, mulai dari sebatas klarifikasi hingga audit investigatif. ', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (8, 1, 1, 1, 1, 8, 'Semua langkah yang diambil dalam rangka memperbaiki kerusakan yang ditimbulkan oleh praktik korupsi di dalam organisasi berupa pemastian perilaku dihentikan melalui pengenaan sanksi dan perbaikan melalui pemulihan kerugian dan peningkatan pengendalian.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (9, 1, 2, 1, 2, 1, 'Tugas dan jabatan dalam struktur pengelolaan keuangan dilaksanakan dan diisi oleh SDM yang kompeten', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (10, 1, 3, 1, 3, 1, 'Pimpinan K/L/D menciptakan lingkungan kerja yang kondusif dalam pengelolaan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (11, 1, 3, 1, 3, 2, 'Pimpinan K/L/D mengalokasikan sumber daya untuk penerapan manajemen risiko', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (12, 1, 3, 1, 3, 3, 'Pimpinan K/L/D menggunakan informasi terkait risiko dalam pengambilan keputusan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (13, 1, 3, 1, 3, 4, 'Pimpinan K/L/D mendorong penerapan manajemen risiko, melalui penggunaan kinerja penerapan manajemen risiko sebagai indikator penilaian kinerja', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (14, 1, 3, 1, 3, 5, 'Program antikorupsi didukung dengan penyediaan alokasi sumberdaya secara eksplisit dan memadai, baik anggaran, personil, dan sarana prasarana', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (15, 1, 3, 1, 3, 6, 'Faktor kekuasaan dan wewenang yang melekat pada pimpinan unit kerja dipakai untuk tujuan mengelola risiko korupsi secara efektif (tidak membiarkan/ mengabaikan)', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (16, 1, 3, 1, 3, 7, 'Pemimpin adalah penerap kaidah perilaku etis sekaligus menerapkannya dalam manajemen, artinya menjadikan nilai-nilai etis sebagai norma yang harus dipatuhi bawahan. Pimpinan mendorong bawahan untuk mengikutinya melalui atensi yang diberikan di berbagai kesempatan, keterbukaan dan transparansi, reinforcement, perlakuan adil, dan pengambilan keputusan yang menyertakan pertimbangan etis.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (17, 1, 4, 1, 4, 1, 'Struktur organisasi dibentuk dalam rangka mendukung pencapaian keandalan laporan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (18, 1, 5, 1, 5, 1, 'Wewenang dan tanggung jawab pengelolaan keuangan diberikan kepada pegawai yang tepat sesuai tingkatannya untuk mendukung efektivitas dan efisiensi pelaksanaan kegiatan dan memperhatikan benturan kepentingan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (19, 1, 6, 1, 6, 1, 'Penerapan kebijakan manajemen dan praktik pembinaan SDM sehingga dapat digunakan secara maksimal untuk mengelola keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (20, 1, 6, 1, 6, 2, 'Pegawai telah mendapatkan fasilitas untuk meningkatkan kompetensi dan keterampilan terkait manajemen risiko ', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (21, 1, 6, 1, 6, 3, 'Pegawai memiliki kesadaran terkait manajemen risiko', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (22, 1, 7, 1, 7, 1, 'Pengawasan APIP telah dapat memberikan nilai tambah pada perbaikan pengendalian organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (23, 1, 8, 1, 8, 1, 'Pimpinan K/L/D menjalin hubungan kerja yang baik (kemitraan) dengan instansi lain terkait dengan pengelolaan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (24, 1, 8, 1, 8, 2, 'Dalam rangka menciptakan hubungan kerja yang baik, K/L/D telah mengidentifikasi, menilai, dan mengelola risiko (termasuk implikasi dari transfer risiko) terkait kemitraan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (25, 2, 9, 2, 1, 1, 'K/L/D telah memiliki Kebijakan Manajemen Risiko', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (26, 2, 9, 2, 1, 2, 'Risiko telah teridentifikasi dan  dituangkan dalam register risiko\n', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (27, 2, 9, 2, 1, 3, 'Proses manajemen risiko telah melekat pada proses bisnis K/L/D', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (28, 2, 10, 2, 2, 1, 'Seluruh risiko telah dianalisis dampak dan tingkat keterjadiannya', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (29, 2, 10, 2, 2, 2, 'K/L/D telah menentukan prioritas risiko', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (30, 2, 10, 2, 2, 3, 'K/L/D telah menentukan rencana tindak pengendalian\n', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (31, 2, 10, 2, 2, 4, 'Tindak pengendalian telah diimplementasikan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (32, 2, 10, 2, 2, 5, 'Tindak pengendalian efektif menurunkan risiko', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (33, 2, 10, 2, 2, 6, 'Merupakan kegiatan yang terstruktur dan sistematis dalam mengidentifikasi, menganalisis probabilitas dan signifikansi dampak bila suatu praktik korupsi terjadi dan mengevaluasinya dalam rangka menentukan respons yang tepat terhadapnya, yang menjangkau seluruh kegiatan utama organisasi dan menghasilkan rancangan tindak pengendalian memitigasi risiko korupsi yang sudah terpetakan', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (34, 3, 11, 3, 1, 1, 'Pimpinan K/L/D membandingkan tolok ukur keuangan dengan capaian kinerja secara berkala untuk mengatasi hambatan kinerja, menetapkan strategi perbaikan, dan menilai kinerja suatu unit sampai dengan periode tertentu dalam rangka mengawal pencapaian tujuan organisasi.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (35, 3, 12, 3, 2, 1, 'Pembinaan SDM terkait pengelolaan keuangan dilakukan sehingga setiap pegawai dapat memberikan manfaat optimal dalam pencapaian tujuan organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (36, 3, 13, 3, 3, 1, 'Pengendalian atas pengelolaan sistem informasi keuangan dilakukan untuk memastikan sistem informasi dapat menyajikan data yang akurat dan tepat waktu untuk digunakan oleh pengguna.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (37, 3, 14, 3, 4, 1, 'Pengelolaan BMN/D dilakukan untuk menjamin aset tersedia dan dapat digunakan dengan baik oleh pengguna dalam rangka melakukan pengelolaan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (38, 3, 15, 3, 5, 1, 'Kegiatan pengendalian atas penetapan dan reviu atas indikator dan ukuran kinerja keuangan dilakukan untuk menjamin keandalan ukuran dan ketepatan penetapan indikator masing-masing unit secara berjenjang dibandingkan dengan IKU organisasi.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (39, 3, 16, 3, 6, 1, 'Terdapat pemisahan fungsi dalam pengelolaan keuangan sehingga seluruh aspek utama transaksi dan kejadian tidak dikendalikan hanya oleh satu orang', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (40, 3, 17, 3, 7, 1, 'Terdapat proses untuk memastikan transaksi keuangan dan kejadian penting hanya dapat diotorisasi ketika memenuhi persyaratan dan dilakukan oleh pihak yang memiliki kewenangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (41, 3, 18, 3, 8, 1, 'Terdapat proses untuk memastikan transaksi keuangan telah diklasifikasikan dengan layak dan dikelompokkan dengan benar serta dicatat dengan segera sehingga relevan, bernilai, dan berguna bagi manajemen', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (42, 3, 19, 3, 9, 1, 'Terdapat pembatasan atas kesempatan dan hak untuk menggunakan, atau memperoleh sumber daya dan mengakses pencatatan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (43, 3, 20, 3, 10, 1, 'Terdapat pertanggungjawaban seseorang atau unit organisasi dalam mengelola sumber daya keuangan yang diberikan/dikuasakan kepadanya dalam rangka pencapaian tujuan organisasi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (44, 3, 21, 3, 11, 1, 'Terdapat pengelolaan, pemeliharaan, dan pendokumentasian secara berkala yang mencakup seluruh SPI serta transaksi keuangan dan kejadian penting yang dilaksanakan secara lengkap dan akurat untuk memfasilitasi penelusuran transaksi, kejadian, dan informasi terkait', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (45, 4, 22, 4, 1, 1, 'Tersedianya informasi keuangan yang relevan untuk kebutuhan internal dan eksternal', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (46, 4, 22, 4, 1, 2, 'Pimpinan K/L/D membangun sistem pengaduan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (47, 4, 22, 4, 1, 3, 'Strategi dan kebijakan manajemen risiko telah dikomunikasikan.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (48, 4, 22, 4, 1, 4, 'Register risiko dan rencana tindak pengendalian telah dikomunikasikan ke pihak terkait', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (49, 4, 22, 4, 1, 5, 'Saluran pelaporan internal yang dikelola secara kredibel dalam menerima pelaporan dan memberikan perlindungan kepada pelapor sehingga kepedulian meningkat dan memberikan efek penggentar yang efektif.', 0, 0, 0, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (50, 4, 23, 4, 2, 1, 'Terlaksananya komunikasi yang efektif dengan internal dan eksternal terkait pengelolaan keuangan', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (51, 5, 24, 5, 1, 1, 'Pimpinan organisasi/penanggungjawab program dan kegiatan/penanggungjawab operasional mengevaluasi secara berkala pengendalian intern pengelolaan keuangan yang telah dilakukan dalam rangka mencapai tujuan organisasi.', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (52, 5, 24, 5, 1, 2, 'Proses manajemen risiko telah direviu ', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (53, 5, 24, 5, 1, 3, 'Pemantauan/monitoring terhadap risiko telah dilakukan ', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (54, 5, 25, 5, 2, 1, 'Evaluasi terpisah dilakukan oleh pegawai dengan keahlian tertentu yang disyaratkan dan dapat melibatkan APIP atau auditor eksternal untuk menilai kinerja sistem pengendalian intern, mengidentifikasi kelemahan pengendalian, menentukan penyebab dari kegagalan aktivitas pengendalian terkait pengelolaan keuangan, serta pengaruhnya terhadap pencapaian tujuan instansi', 1, 1, 1, 1, NULL, NULL);
INSERT INTO `ref_form_s_parameters` VALUES (55, 5, 25, 5, 2, 2, 'Terdapat reviu independen terhadap proses manajemen risiko', 1, 1, 1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ref_form_s_sub_unsurs
-- ----------------------------
DROP TABLE IF EXISTS `ref_form_s_sub_unsurs`;
CREATE TABLE `ref_form_s_sub_unsurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unsur_id` bigint(20) unsigned NOT NULL,
  `kd_unsur` bigint(20) unsigned NOT NULL,
  `kd_sub_unsur` bigint(20) unsigned NOT NULL,
  `uraian_sub_unsur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ref_form_s_sub_unsurs
-- ----------------------------
BEGIN;
INSERT INTO `ref_form_s_sub_unsurs` VALUES (1, 1, 1, 1, 'Penegakan Integritas dan Nilai Etika', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (2, 1, 1, 2, 'Komitmen terhadap Kompetensi', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (3, 1, 1, 3, 'Kepemimpinan yang Kondusif', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (4, 1, 1, 4, 'Pembentukan Struktur Organisasi yang Sesuai dengan Kebutuhan', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (5, 1, 1, 5, 'Pendelegasian Wewenang dan Tanggung Jawab yang Tepat', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (6, 1, 1, 6, 'Penyusunan dan Penerapan Kebijakan yang Sehat tentang Pembinaan SDM', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (7, 1, 1, 7, 'Perwujudan Peran APIP yang Efektf', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (8, 1, 1, 8, 'Hubungan Kerja yang Baik dengan Instansi Pemerintah Terkait', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (9, 2, 2, 1, 'Identifikasi Risiko', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (10, 2, 2, 2, 'Analisis Risiko', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (11, 3, 3, 1, 'Reviu atas Kinerja Instansi Pemerintah', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (12, 3, 3, 2, 'Pembinaan SDM', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (13, 3, 3, 3, 'Pengendalian atas Pengelolaan Sistem Informasi', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (14, 3, 3, 4, 'Pengendalian Fisik atas Aset', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (15, 3, 3, 5, 'Penetapan dan Reviu atas Indikator dan Ukuran Kinerja', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (16, 3, 3, 6, 'Pemisahan Fungsi', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (17, 3, 3, 7, 'Otorisasi atas Transaksi dan Kejadian yang Penting', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (18, 3, 3, 8, 'Pencatatan yang Akurat dan Tepat Waktu atas Transaksi dan Kejadian', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (19, 3, 3, 9, 'Pembatasan Akses atas Sumber Daya dan Pencatatannya', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (20, 3, 3, 10, 'Akuntabilitas terhadap Sumber Daya dan Pencatatannya', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (21, 3, 3, 11, 'Dokumentasi yang Baik atas SPI serta Transaksi dan Kejadian Penting', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (22, 4, 4, 1, 'Informasi yang Relevan', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (23, 4, 4, 2, 'Komunikasi yang Efektif', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (24, 5, 5, 1, 'Pemantauan Berkelanjutan', NULL, NULL);
INSERT INTO `ref_form_s_sub_unsurs` VALUES (25, 5, 5, 2, 'Evaluasi Terpisah', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ref_form_s_unsurs
-- ----------------------------
DROP TABLE IF EXISTS `ref_form_s_unsurs`;
CREATE TABLE `ref_form_s_unsurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kd_unsur` bigint(20) unsigned NOT NULL,
  `uraian_unsur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ref_form_s_unsurs
-- ----------------------------
BEGIN;
INSERT INTO `ref_form_s_unsurs` VALUES (1, 1, 'Lingkungan Pengendalian', NULL, NULL);
INSERT INTO `ref_form_s_unsurs` VALUES (2, 2, 'Manajemen risiko', NULL, NULL);
INSERT INTO `ref_form_s_unsurs` VALUES (3, 3, 'Kegiatan Pengendalian', NULL, NULL);
INSERT INTO `ref_form_s_unsurs` VALUES (4, 4, 'Komunikasi dan Informasi', NULL, NULL);
INSERT INTO `ref_form_s_unsurs` VALUES (5, 5, 'Monitoring dan Evaluasi', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ref_satkers
-- ----------------------------
DROP TABLE IF EXISTS `ref_satkers`;
CREATE TABLE `ref_satkers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kementrian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_satker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname_satker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_satker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_satker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ref_satkers
-- ----------------------------
BEGIN;
INSERT INTO `ref_satkers` VALUES (1, 'Badan Pengawasan Keuangan dan Pembangunan', 'Perwakilan BPKP Provinsi Kepulauan Riau', 'BPKP Kepri', 'Jl. RE Martadinata, Tj. Pinggir, Kec. Sekupang, Kota Batam, Kepulauan Riau', 'njnjnj@gmail.com', 'Enscape_2021-05-25-05-04-08.png', '2021-06-02 11:50:19', '2021-06-02 11:50:21');
INSERT INTO `ref_satkers` VALUES (2, 'Kementrian Agama', 'Perwakilan BPKP Provinsi Kepulauan Riau', 'BPKP Kepri', 'Jl. RE Martadinata, Tj. Pinggir, Kec. Sekupang, Kota Batam, Kepulauan Riau', 'kemenag@gmail.com', '', '2021-06-06 13:40:23', '2021-06-06 13:40:26');
COMMIT;

-- ----------------------------
-- Table structure for ref_tipe_kuesioners
-- ----------------------------
DROP TABLE IF EXISTS `ref_tipe_kuesioners`;
CREATE TABLE `ref_tipe_kuesioners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipe_kuesioner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uraian_tipe_kuesioner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ref_tipe_kuesioners
-- ----------------------------
BEGIN;
INSERT INTO `ref_tipe_kuesioners` VALUES (1, 'T.1', 'Efektivitas Dan Efisiensi Pencapaian Tujuan Organisasi', '2021-06-02 14:35:15', '2021-06-02 14:35:18');
INSERT INTO `ref_tipe_kuesioners` VALUES (2, 'T.2', 'Keandalan Pelaporan Keuangan', '2021-06-02 14:35:15', '2021-06-02 14:35:18');
INSERT INTO `ref_tipe_kuesioners` VALUES (3, 'T.3', 'Pengamanan Aset Negara/Daerah', '2021-06-02 14:35:15', '2021-06-02 14:35:18');
INSERT INTO `ref_tipe_kuesioners` VALUES (4, 'T.4', 'Ketaatan Pada Peraturan Perundang-Undangan', '2021-06-02 14:35:15', '2021-06-02 14:35:18');
COMMIT;

-- ----------------------------
-- Table structure for sasarans
-- ----------------------------
DROP TABLE IF EXISTS `sasarans`;
CREATE TABLE `sasarans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `satker_id` bigint(20) unsigned NOT NULL,
  `users_id` bigint(20) unsigned NOT NULL,
  `sasaran_program_id` bigint(20) unsigned NOT NULL,
  `sasaran` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sasarans_sasaran_program_id_foreign` (`sasaran_program_id`),
  CONSTRAINT `sasarans_sasaran_program_id_foreign` FOREIGN KEY (`sasaran_program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sasarans
-- ----------------------------
BEGIN;
INSERT INTO `sasarans` VALUES (54, 2020, 0, 1, 7, 'Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id Ut esse laborum Id', '2021-09-11 13:39:24', '2021-09-11 14:40:06');
INSERT INTO `sasarans` VALUES (55, 2020, 0, 1, 9, 'Dolor eum dolore nul', '2021-09-11 13:54:02', '2021-09-11 13:54:02');
INSERT INTO `sasarans` VALUES (56, 2020, 0, 1, 5, 'Pariatur Accusantiu', '2021-09-11 14:32:56', '2021-09-11 14:32:56');
INSERT INTO `sasarans` VALUES (57, 2021, 0, 1, 4, 'Est ut cillum qui pr', '2021-09-12 15:58:09', '2021-09-12 15:58:09');
INSERT INTO `sasarans` VALUES (58, 2021, 1, 4, 5, 'sasaran kegiatan 1 contoh', '2021-09-12 17:11:21', '2021-09-12 17:11:21');
INSERT INTO `sasarans` VALUES (61, 2020, 1, 4, 3, 'Magni ullamco qui re', '2021-09-12 17:17:30', '2021-09-12 17:17:30');
INSERT INTO `sasarans` VALUES (62, 2020, 1, 4, 6, 'Corporis aut quis in', '2021-09-12 17:17:43', '2021-09-12 17:17:43');
INSERT INTO `sasarans` VALUES (64, 2021, 1, 4, 2, 'Qui ea hic alias nat', '2021-09-14 17:45:31', '2021-09-14 17:45:31');
INSERT INTO `sasarans` VALUES (65, 2021, 1, 4, 2, 'Ad reprehenderit qui', '2021-09-14 23:45:31', '2021-09-14 23:45:31');
COMMIT;

-- ----------------------------
-- Table structure for supplies
-- ----------------------------
DROP TABLE IF EXISTS `supplies`;
CREATE TABLE `supplies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli` bigint(20) NOT NULL,
  `id_pemasok` int(11) NOT NULL,
  `pemasok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supplies
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for supply_systems
-- ----------------------------
DROP TABLE IF EXISTS `supply_systems`;
CREATE TABLE `supply_systems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of supply_systems
-- ----------------------------
BEGIN;
INSERT INTO `supply_systems` VALUES (1, 1, NULL, '2021-05-31 16:02:51');
COMMIT;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_barang` bigint(20) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `diskon` int(11) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bayar` bigint(20) NOT NULL,
  `kembali` bigint(20) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `kasir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of transactions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_satker` bigint(20) unsigned NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 0, 'Wahyu', 'superadmin', 'default.jpg', 'wahyu@gmail.com', NULL, 'wahyu', '$2y$10$/pLX4TOWgeGxOUa6rXHbI.r35DWR28312We.TkGBhMXp11qRnowZ6', 'JguLYOppuIU8VXSGctAbGEnkP1tsMCQNx9bbPpzlDwk36W7cFK1GewVzi4RH', '2021-05-31 16:00:37', '2021-06-04 00:33:00');
INSERT INTO `users` VALUES (2, 1, 'Ivan Rifandi', 'responden', 'default.jpg', 'ivan@gmail.com', NULL, 'ivan', '$2y$10$/pLX4TOWgeGxOUa6rXHbI.r35DWR28312We.TkGBhMXp11qRnowZ6', 'Sa3qNlqIIONMKgmzU8Q08ELUk7Bhg1Et79ikye3uMrkZGOjWdz3CCnmtmevM', '2021-06-02 00:20:32', '2021-09-12 17:09:33');
INSERT INTO `users` VALUES (3, 1, 'Ridwan Putra Pamungkas', 'responden', 'default.jpg', 'ridwan@gmail.com', NULL, 'ridwan', '$2y$10$/pLX4TOWgeGxOUa6rXHbI.r35DWR28312We.TkGBhMXp11qRnowZ6', 'Gu49SfdnKJdEkoFn4RQUodU6gtvGReOTYDgqEGQBOc3jsUzqrHqq8mxZjbtE', '2021-06-02 10:49:02', '2021-06-02 10:49:02');
INSERT INTO `users` VALUES (4, 1, 'Heru Setiawan', 'admin', 'default.jpg', 'heru@gmail.com', NULL, 'heru', '$2y$10$/pLX4TOWgeGxOUa6rXHbI.r35DWR28312We.TkGBhMXp11qRnowZ6', 'iiihuyNRYYb5VRsLhY5wsu2kF7PrOgjEFi8PY1Wovl6fUreuwaKiwyNdQUEo', '2021-05-31 16:00:37', '2021-09-13 16:05:39');
INSERT INTO `users` VALUES (5, 1, 'AdminBWS', 'admin', 'default.jpg', 'bws_admin@gmail.com', NULL, 'admin', '$2y$10$FSoHYcgDPaUayIDId2bx/eg7hDtcjRLpMH9ZNO1n607g6xo7jbl3m', 'Av9hHnA9Ol6g0ckRyodFzYYcuIQJ095RKM0eCWQTN2M2uJpu3inNXUW2jHmr', '2021-06-05 17:08:24', '2021-06-05 17:08:24');
INSERT INTO `users` VALUES (6, 1, 'ciki', 'responden', 'default.jpg', 'ciki@gmail.com', NULL, 'ciki', '$2y$10$d6glwWlCyC9dm9s19.H.l.C0vUtjCaBdD.7XdhEXdd6VYD58tb1vG', 'Vne4BHfrEkqyPSbTctvT04cZJDX5eZuXnMOpwWcWuRXbSrMX1Yv9BsebMKeh', '2021-06-05 17:15:00', '2021-06-05 17:15:00');
INSERT INTO `users` VALUES (7, 2, 'Dedi Sinaga', 'admin', 'default.jpg', 'dedi@gmail.com', NULL, 'dedisinaga', '$2y$10$xjrwjc53Oo0CqB/57dGqAOb1zgNcMLU.dvPw5aHpFxYlMyoOFod.y', 'KknmmbnsMWSwdQ9Dh69B2nu4p7smJ2upEs74iHwmrde0vBPRH654rWkLjfGG', '2021-06-07 09:35:48', '2021-06-07 09:35:48');
INSERT INTO `users` VALUES (8, 2, 'admin bpkp', 'admin', 'default.jpg', 'admin.bpkp@mailinator.com', NULL, 'cipatew', '$2y$10$Hx.pMfuP8rSwbeazwhppJe5KSF4TgStzBu8hXjmrzbSqmx58Kfpva', 'hz5IwydatGNBs1c1L9QtUXm7YgoOJHOtRLTjTXZOwnE5tXqMnqqpgQIUWICa', '2021-09-12 17:06:33', '2021-09-12 17:06:33');
INSERT INTO `users` VALUES (9, 1, 'Obcaecati magni temp', 'admin', 'default.jpg', 'admin.bws@gmail.com', NULL, 'viqypon', '$2y$10$Pe.Uj0dBRpzllR6Lz96Gb.wc05acHL7LwMUCZQa5d9ojHfplzJ.P.', 'dWhf3ZX2W1shh57eW82m8jpEAsRnGPY4F3fvmwNVuJOEGeNKM1ASyLwnz0ac', '2021-09-12 17:07:29', '2021-09-12 17:07:29');
INSERT INTO `users` VALUES (10, 1, 'Deleniti voluptatem', 'responden', 'default.jpg', 'nido@mailinator.com', NULL, 'golefozo', '$2y$10$z7bl/RG.4I9PwxmgHwmTUeamXzf6Ra/fqph49rM4wULPy0R0G03ha', 'mQmIOVncHRG9o9dQ2t5TlEXHdFtJoea7iONmzkQ9yAHxIFXsYDFgHfhJVLko', '2021-09-12 17:54:47', '2021-09-12 17:54:47');
INSERT INTO `users` VALUES (11, 1, 'Voluptas dolores aut', 'monitor', 'default.jpg', 'qudiqydufy@mailinator.com', NULL, 'hylexobot', '$2y$10$tFLAdz2yaDCZ4uNjmspjfuTvqzxVypROjTznHZ2PWeEwDOrwvQ2Q2', 'qhgvMkx13gYpAOCYsaDxNCP197wZ7QGNwPlbNasmL6jAUmDO890Rg5ksAq5G', '2021-09-12 17:56:43', '2021-09-12 17:56:43');
INSERT INTO `users` VALUES (12, 1, 'Nobis voluptas quasi', 'admin', 'default.jpg', 'bamegisas@mailinator.com', NULL, 'nydoxegyr', '$2y$10$Ibk2TSLIOK7B3sw7fTtuPOXOs5xBoo2AdN9xkrehQ5JmEQ4qtruze', 'YblXv6GE4zagz4Q7aXnUldoNFTFQi7ORzGzVkURchbUOeQNdEjzgOZGksVPT', '2021-09-12 17:57:05', '2021-09-12 17:57:05');
INSERT INTO `users` VALUES (13, 1, 'Numquam nemo cupidat', 'monitor', 'default.jpg', 'lutani@mailinator.com', NULL, 'dawajaho', '$2y$10$.vC3cq.7ogEJJ6f5vTOdwu1OxQFSpo9xUCVFjD84MoBjKGqDiXccO', 'RZE7COYNiIkihNHR5pdtCNhVUPa4TRkC43tb2bBVBnuXgsAOq6ars7Z8MdQV', '2021-09-12 18:02:30', '2021-09-12 18:02:30');
INSERT INTO `users` VALUES (14, 1, 'Amet atque distinct', 'petugas', 'default.jpg', 'nufy@mailinator.com', NULL, 'myhyrik', '$2y$10$Y3zE6DdkL0PtF7tvRytYB.N8xESI4HhP5mIWtI8XZzzQMhQ2pm.NW', 'G7e7aSPBhwFCy1ZMGfekty1VIdEodMAKAWrWXdpJ3Rp93A25pg7ekmt4u5FV', '2021-09-12 18:02:39', '2021-09-12 18:02:39');
INSERT INTO `users` VALUES (15, 1, 'Tulad', 'responden', 'default.jpg', 'nelywi@mailinator.com', NULL, 'nucel', '$2y$10$WDM951SUWgEruZlr7D/8y.JjAMlzR42I4VN9zNk7qBxPS6HPuWqrm', '8W753qFs9PhGwaZ7tO8RKYh8ml82XmgNgIFIxowX03Wd5hBE7d2yAiebZGUe', '2021-09-12 18:03:16', '2021-09-12 18:03:43');
COMMIT;

-- ----------------------------
-- Triggers structure for table supplies
-- ----------------------------
DROP TRIGGER IF EXISTS `tg_pasok_barang`;
delimiter ;;
CREATE TRIGGER `tg_pasok_barang` AFTER INSERT ON `supplies` FOR EACH ROW BEGIN
                UPDATE products SET stok = stok + NEW.jumlah WHERE kode_barang = NEW.kode_barang;
            END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
