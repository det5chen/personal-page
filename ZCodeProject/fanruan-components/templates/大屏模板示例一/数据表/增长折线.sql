/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:24:21
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 增长折线
-- ----------------------------
DROP TABLE IF EXISTS "增长折线";
CREATE TABLE "增长折线" (
  "季度",
  "增长数"
);

-- ----------------------------
-- Records of 增长折线
-- ----------------------------
INSERT INTO "增长折线" VALUES ('一季度', 1);
INSERT INTO "增长折线" VALUES ('二季度', 2);
INSERT INTO "增长折线" VALUES ('三季度', 1);
INSERT INTO "增长折线" VALUES ('四季度', 2);

PRAGMA foreign_keys = true;
