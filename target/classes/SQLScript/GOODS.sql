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

 Date: 03/11/2017 17:41:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for GOODS
-- ----------------------------
DROP TABLE IF EXISTS `GOODS`;
CREATE TABLE `GOODS` (
  `GOOD_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `GOOD_NAME` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '端口名称',
  `GOOD_SKU` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品单位',
  `GOOD_PRICE` decimal(10,2) unsigned DEFAULT NULL COMMENT '价格',
  `GOOD_CATEGORY` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类',
  `GOOD_ITEM` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '条码',
  `GOOD_DISCOUNT` int(10) unsigned DEFAULT NULL COMMENT '折扣',
  PRIMARY KEY (`GOOD_ID`,`GOOD_ITEM`),
  KEY `GOODS_DISCOUNT_FK_idx` (`GOOD_DISCOUNT`),
  CONSTRAINT `GOODS_DISCOUNT_FK` FOREIGN KEY (`GOOD_DISCOUNT`) REFERENCES `DISCOUNT` (`DISCOUNT_ID`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品表';

-- ----------------------------
-- Records of GOODS
-- ----------------------------
BEGIN;
INSERT INTO `GOODS` VALUES (1, '可口可乐', '瓶', 2.50, '饮料', 'ITEM000001', 1);
INSERT INTO `GOODS` VALUES (2, '雪碧', '瓶', 2.50, '饮料', 'ITEM000002', 0);
INSERT INTO `GOODS` VALUES (3, '百事可乐', '瓶', 3.00, '饮料', 'ITEM000003', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
