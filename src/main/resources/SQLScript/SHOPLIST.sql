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

 Date: 03/11/2017 17:41:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for SHOPLIST
-- ----------------------------
DROP TABLE IF EXISTS `SHOPLIST`;
CREATE TABLE `SHOPLIST` (
  `SHOPLIST_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '清单序号',
  `ITEM_ID` varchar(80) NOT NULL COMMENT '条码',
  PRIMARY KEY (`SHOPLIST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SHOPLIST
-- ----------------------------
BEGIN;
INSERT INTO `SHOPLIST` VALUES (1, 'ITEM000001');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
