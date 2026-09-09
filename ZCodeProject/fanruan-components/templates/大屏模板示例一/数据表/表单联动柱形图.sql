/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:13:15
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 表单联动柱形图
-- ----------------------------
DROP TABLE IF EXISTS "表单联动柱形图";
CREATE TABLE "表单联动柱形图" (
  "地区" TEXT(255),
  "金额" TEXT(255)
);

-- ----------------------------
-- Records of 表单联动柱形图
-- ----------------------------
INSERT INTO "表单联动柱形图" VALUES ('江苏省', 25);
INSERT INTO "表单联动柱形图" VALUES ('浙江省', 35);
INSERT INTO "表单联动柱形图" VALUES ('安徽省', 14);
INSERT INTO "表单联动柱形图" VALUES ('广东省', 20);
INSERT INTO "表单联动柱形图" VALUES ('云南省', 16);
INSERT INTO "表单联动柱形图" VALUES ('山东省', 25);

PRAGMA foreign_keys = true;
