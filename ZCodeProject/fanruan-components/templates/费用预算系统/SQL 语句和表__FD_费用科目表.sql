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

 Date: 20/04/2022 15:17:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for FD_费用科目表
-- ----------------------------
DROP TABLE IF EXISTS `FD_费用科目表`;
CREATE TABLE `FD_费用科目表`  (
  `科目大类` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `科目类别` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `科目代码` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `核算内容说明` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of FD_费用科目表
-- ----------------------------
INSERT INTO `FD_费用科目表` VALUES ('职工薪酬', '工资', '0101', '部门员工工资、年终奖等');
INSERT INTO `FD_费用科目表` VALUES ('职工薪酬', '福利补贴', '0102', '体检、包括假节日福利等');
INSERT INTO `FD_费用科目表` VALUES ('办公损耗', '水电费', '0201', '办公区域水费、电费');
INSERT INTO `FD_费用科目表` VALUES ('办公损耗', '通讯物流费', '0204', '办公区域通话、快递等费用');
INSERT INTO `FD_费用科目表` VALUES ('办公损耗', '办公费', '0202', '办公区域办公用具消耗费用');
INSERT INTO `FD_费用科目表` VALUES ('外出活动', '广告宣传费', '0301', '外出活动广告宣传花费');
INSERT INTO `FD_费用科目表` VALUES ('办公损耗', '租赁费', '0203', '办公区域租金费用及物业等费用');
INSERT INTO `FD_费用科目表` VALUES ('外出活动', '差旅费', '0305', '外出人员车费、住宿、伙食费');
INSERT INTO `FD_费用科目表` VALUES ('公关法务', '诉讼费', '0401', '公司法务诉讼费');
INSERT INTO `FD_费用科目表` VALUES ('公关法务', '招标服务费', '0404', '公司招标服务费');
INSERT INTO `FD_费用科目表` VALUES ('外出活动', '资料图纸费', '0302', '外出活动海报、打印等费用');
INSERT INTO `FD_费用科目表` VALUES ('外出活动', '招待费', '0306', '外出活动应酬等费用');
INSERT INTO `FD_费用科目表` VALUES ('外出活动', '保险费', '0303', '外出人员车程保险等费用');
INSERT INTO `FD_费用科目表` VALUES ('公关法务', '咨询代理费', '0402', '公司法务活动咨询代理费');
INSERT INTO `FD_费用科目表` VALUES ('公关法务', '技术鉴定费', '0403', '公司专利、评优报名等费用');
INSERT INTO `FD_费用科目表` VALUES ('外出活动', '会展费', '0304', '大型活动活动场所预定等费用');
INSERT INTO `FD_费用科目表` VALUES ('销售生产', '产品损耗费', '0501', '生产销售过程中的产品损耗费用');
INSERT INTO `FD_费用科目表` VALUES ('销售生产', '设备维修费', '0502', '生产过程中的设备维修费');
INSERT INTO `FD_费用科目表` VALUES ('销售生产', '物流费', '0503', '生产销售中的运输费');
INSERT INTO `FD_费用科目表` VALUES ('销售生产', '生产水电费', '0504', '生产过程中的水电费');
INSERT INTO `FD_费用科目表` VALUES ('财务费用', '汇总损益', '0601', '财务汇总损益');
INSERT INTO `FD_费用科目表` VALUES ('财务费用', '手续费', '0602', '手续费');
INSERT INTO `FD_费用科目表` VALUES ('财务费用', '利息', '0603', '借贷利息');
INSERT INTO `FD_费用科目表` VALUES ('职工薪酬', '劳务外包费', '0103', '部门外包事务花费');

SET FOREIGN_KEY_CHECKS = 1;
