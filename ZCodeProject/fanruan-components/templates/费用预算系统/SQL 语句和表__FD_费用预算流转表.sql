/*
 Navicat Premium Data Transfer

 Source Server         : 测试服务器
 Source Server Type    : MySQL
 Source Server Version : 50631
 Source Host           : 121.37.182.66:3947
 Source Schema         : frdemo

 Target Server Type    : MySQL
 Target Server Version : 50631
 File Encoding         : 65001

 Date: 20/04/2022 15:17:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for FD_费用预算流转表
-- ----------------------------
DROP TABLE IF EXISTS `FD_费用预算流转表`;
CREATE TABLE `FD_费用预算流转表`  (
  `预算流程ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `创建人` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `操作时间` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `状态` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `处理人` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `操作内容` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `预算年份` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`预算流程ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of FD_费用预算流转表
-- ----------------------------
INSERT INTO `FD_费用预算流转表` VALUES ('20210417001', '20150101001', '2022-04-12 11:47:07', '结束', '', NULL, '公共职能部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417002', '20171010002', '2022-04-17 11:47:07', '结束', '', NULL, '仓储部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417003', '20171010001', '2022-04-15 11:47:07', '结束', '', NULL, '采购部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417004', '20190512001', '2022-04-16 11:47:07', '结束', '', NULL, '产品设计部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417005', '20150101003', '2022-04-14 11:47:07', '结束', '', NULL, 'IT信息部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417006', '20150830001', '2022-04-13 11:47:07', '结束', '', NULL, '生产部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417007', '20150706001', '2022-04-11 11:47:07', '结束', '', NULL, '销售部', '2021');
INSERT INTO `FD_费用预算流转表` VALUES ('20210417008', '20150101002', '2022-04-10 11:47:07', '结束', '', NULL, '研发部', '2021');

SET FOREIGN_KEY_CHECKS = 1;
