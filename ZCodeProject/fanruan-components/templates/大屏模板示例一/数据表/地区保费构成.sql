/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:14:27
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 地区保费构成
-- ----------------------------
DROP TABLE IF EXISTS "地区保费构成";
CREATE TABLE "地区保费构成" (
  "地区名称" TEXT,
  "分类" TEXT,
  "金额" TEXT,
  "flag" TEXT
);

-- ----------------------------
-- Records of 地区保费构成
-- ----------------------------
INSERT INTO "地区保费构成" VALUES ('广东', '营销标保', 600, 1);
INSERT INTO "地区保费构成" VALUES ('广东', '中介标保', 400, 1);
INSERT INTO "地区保费构成" VALUES ('广东', '银保期交', 300, 1);
INSERT INTO "地区保费构成" VALUES ('广东', '银保趸交', 700, 1);
INSERT INTO "地区保费构成" VALUES ('江苏', '营销标保', 400, 1);
INSERT INTO "地区保费构成" VALUES ('江苏', '中介标保', 450, 1);
INSERT INTO "地区保费构成" VALUES ('江苏', '银保期交', 550, 1);
INSERT INTO "地区保费构成" VALUES ('江苏', '银保趸交', 300, 1);
INSERT INTO "地区保费构成" VALUES ('浙江', '营销标保', 400, 1);
INSERT INTO "地区保费构成" VALUES ('浙江', '中介标保', 400, 1);
INSERT INTO "地区保费构成" VALUES ('浙江', '银保期交', 360, 1);
INSERT INTO "地区保费构成" VALUES ('浙江', '银保趸交', 400, 1);
INSERT INTO "地区保费构成" VALUES ('安徽', '营销标保', 250, 1);
INSERT INTO "地区保费构成" VALUES ('安徽', '中介标保', 350, 1);
INSERT INTO "地区保费构成" VALUES ('安徽', '银保期交', 470, 1);
INSERT INTO "地区保费构成" VALUES ('安徽', '银保趸交', 330, 1);
INSERT INTO "地区保费构成" VALUES ('河南', '营销标保', 300, 1);
INSERT INTO "地区保费构成" VALUES ('河南', '中介标保', 200, 1);
INSERT INTO "地区保费构成" VALUES ('河南', '银保期交', 400, 1);
INSERT INTO "地区保费构成" VALUES ('河南', '银保趸交', 200, 1);
INSERT INTO "地区保费构成" VALUES ('河北', '营销标保', 100, 1);
INSERT INTO "地区保费构成" VALUES ('河北', '中介标保', 200, 1);
INSERT INTO "地区保费构成" VALUES ('河北', '银保期交', 100, 1);
INSERT INTO "地区保费构成" VALUES ('河北', '银保趸交', 300, 1);

PRAGMA foreign_keys = true;
