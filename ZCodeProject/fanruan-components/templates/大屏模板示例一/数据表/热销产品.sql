/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:15:08
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 热销产品
-- ----------------------------
DROP TABLE IF EXISTS "热销产品";
CREATE TABLE "热销产品" (
  "名称" TEXT,
  "承保数量" TEXT
);

-- ----------------------------
-- Records of 热销产品
-- ----------------------------
INSERT INTO "热销产品" VALUES ('热销产品1', 1500);
INSERT INTO "热销产品" VALUES ('热销产品2', 2000);
INSERT INTO "热销产品" VALUES ('热销产品3', 800);
INSERT INTO "热销产品" VALUES ('热销产品4', 1500);

PRAGMA foreign_keys = true;
