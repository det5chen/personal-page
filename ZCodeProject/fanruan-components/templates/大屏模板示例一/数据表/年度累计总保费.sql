/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:14:55
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 年度累计总保费
-- ----------------------------
DROP TABLE IF EXISTS "年度累计总保费";
CREATE TABLE "年度累计总保费" (
  "年份" TEXT,
  "其他业务" TEXT,
  "业务价值" TEXT
);

-- ----------------------------
-- Records of 年度累计总保费
-- ----------------------------
INSERT INTO "年度累计总保费" VALUES (2012, 600, 280);
INSERT INTO "年度累计总保费" VALUES (2013, 660, 280);
INSERT INTO "年度累计总保费" VALUES (2014, 610, 340);
INSERT INTO "年度累计总保费" VALUES (2015, 700, 310);

PRAGMA foreign_keys = true;
