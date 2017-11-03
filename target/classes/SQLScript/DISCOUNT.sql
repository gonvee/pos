/*
 Navicat Premium Data Transfer

 Source Server         : ubuntu
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 192.168.31.120:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 03/11/2017 17:41:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for DISCOUNT
-- ----------------------------
DROP TABLE IF EXISTS `DISCOUNT`;
CREATE TABLE `DISCOUNT` (
  `DISCOUNT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DISCOUNT_LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`DISCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品折扣表';

-- ----------------------------
-- Records of DISCOUNT
-- ----------------------------
BEGIN;
INSERT INTO `DISCOUNT` VALUES (0, 100);
INSERT INTO `DISCOUNT` VALUES (1, 98);
INSERT INTO `DISCOUNT` VALUES (2, 95);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
