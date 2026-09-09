/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:23:28
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 新老用户对比
-- ----------------------------
DROP TABLE IF EXISTS "新老用户对比";
CREATE TABLE "新老用户对比" (
  "用户" TEXT,
  "数量" TEXT
);

-- ----------------------------
-- Records of 新老用户对比
-- ----------------------------
INSERT INTO "新老用户对比" VALUES ('新客户', 6666);
INSERT INTO "新老用户对比" VALUES ('旧客户', 3334);

PRAGMA foreign_keys = true;
