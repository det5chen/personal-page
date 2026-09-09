/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:24:45
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 最新交易数据
-- ----------------------------
DROP TABLE IF EXISTS "最新交易数据";
CREATE TABLE "最新交易数据" (
  "地区" TEXT,
  "渠道" TEXT,
  "成交信息" TEXT,
  "费用" TEXT
);

-- ----------------------------
-- Records of 最新交易数据
-- ----------------------------
INSERT INTO "最新交易数据" VALUES ('上海', '淘宝', '王女士购买了A产品', 1000);
INSERT INTO "最新交易数据" VALUES ('南京', '京东', '陈先生购买了B产品', 1200);
INSERT INTO "最新交易数据" VALUES ('无锡', '天猫', '刘女士购买了C产品', 800);
INSERT INTO "最新交易数据" VALUES ('苏州', '淘宝', '张先生购买了A产品', 1600);
INSERT INTO "最新交易数据" VALUES ('南昌', '京东', '杨女士购买了B产品', 500);
INSERT INTO "最新交易数据" VALUES ('北京', '天猫', '徐先生购买了C产品', 1800);
INSERT INTO "最新交易数据" VALUES ('广州', '淘宝', '周女士购买了A产品', 1400);
INSERT INTO "最新交易数据" VALUES ('西安', '线下', '王先生购买了B产品', 800);
INSERT INTO "最新交易数据" VALUES ('深圳', '天猫', '徐先生购买了C产品', 700);
INSERT INTO "最新交易数据" VALUES ('成都', '京东', '陶女士购买了A产品', 900);
INSERT INTO "最新交易数据" VALUES ('杭州', '线下', '许先生购买了B产品', 1300);
INSERT INTO "最新交易数据" VALUES ('上海', '天猫', '杨女士购买了A产品', 1400);
INSERT INTO "最新交易数据" VALUES ('南京', '京东', '周女士购买了B产品', 500);
INSERT INTO "最新交易数据" VALUES ('深圳', '天猫', '陈先生购买了C产品', 1800);

PRAGMA foreign_keys = true;
