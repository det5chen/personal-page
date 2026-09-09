/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:28:10
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 保费地区排名
-- ----------------------------
DROP TABLE IF EXISTS "保费地区排名";
CREATE TABLE "保费地区排名" (
  "地区" TEXT,
  "保费" TEXT,
  "flag" TEXT
);

-- ----------------------------
-- Records of 保费地区排名
-- ----------------------------
INSERT INTO "保费地区排名" VALUES ('广东', 2000, 1);
INSERT INTO "保费地区排名" VALUES ('江苏', 1700, 1);
INSERT INTO "保费地区排名" VALUES ('浙江', 1560, 1);
INSERT INTO "保费地区排名" VALUES ('安徽', 1400, 1);
INSERT INTO "保费地区排名" VALUES ('河南', 1100, 1);
INSERT INTO "保费地区排名" VALUES ('河北', 700, 1);

PRAGMA foreign_keys = true;
