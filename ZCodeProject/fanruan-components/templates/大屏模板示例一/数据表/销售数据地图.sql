/*
 Navicat Premium Data Transfer

 Source Server         : 大屏Demo
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 09/05/2019 17:25:10
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for 销售数据地图
-- ----------------------------
DROP TABLE IF EXISTS "销售数据地图";
CREATE TABLE "销售数据地图" (
  "地区" TEXT,
  "金额" TEXT
);

-- ----------------------------
-- Records of 销售数据地图
-- ----------------------------
INSERT INTO "销售数据地图" VALUES ('四川省', 100);
INSERT INTO "销售数据地图" VALUES ('宁夏回族自治区', 110);
INSERT INTO "销售数据地图" VALUES ('吉林省', 120);
INSERT INTO "销售数据地图" VALUES ('河南省', 110);
INSERT INTO "销售数据地图" VALUES ('安徽省', 120);
INSERT INTO "销售数据地图" VALUES ('江西省', 122);
INSERT INTO "销售数据地图" VALUES ('广东省', 123);
INSERT INTO "销售数据地图" VALUES ('贵州省', 213);
INSERT INTO "销售数据地图" VALUES ('新疆维吾尔自治区', 220);
INSERT INTO "销售数据地图" VALUES ('福建省', 200);
INSERT INTO "销售数据地图" VALUES ('甘肃省', 210);
INSERT INTO "销售数据地图" VALUES ('西藏自治区', 300);
INSERT INTO "销售数据地图" VALUES ('广西壮族自治区', 310);
INSERT INTO "销售数据地图" VALUES ('陕西省', 305);
INSERT INTO "销售数据地图" VALUES ('湖南省', 313);
INSERT INTO "销售数据地图" VALUES ('山东省', 320);
INSERT INTO "销售数据地图" VALUES ('青海省', 400);
INSERT INTO "销售数据地图" VALUES ('浙江省', 410);
INSERT INTO "销售数据地图" VALUES ('辽宁省', 420);
INSERT INTO "销售数据地图" VALUES ('山西省', 405);
INSERT INTO "销售数据地图" VALUES ('云南省', 413);
INSERT INTO "销售数据地图" VALUES ('内蒙古自治区', 500);
INSERT INTO "销售数据地图" VALUES ('江苏省', 510);
INSERT INTO "销售数据地图" VALUES ('海南省', 520);
INSERT INTO "销售数据地图" VALUES ('台湾省', 513);
INSERT INTO "销售数据地图" VALUES ('四川省', 100);
INSERT INTO "销售数据地图" VALUES ('宁夏回族自治区', 110);
INSERT INTO "销售数据地图" VALUES ('吉林省', 120);
INSERT INTO "销售数据地图" VALUES ('河南省', 110);
INSERT INTO "销售数据地图" VALUES ('安徽省', 120);
INSERT INTO "销售数据地图" VALUES ('江西省', 122);
INSERT INTO "销售数据地图" VALUES ('广东省', 123);
INSERT INTO "销售数据地图" VALUES ('贵州省', 213);
INSERT INTO "销售数据地图" VALUES ('新疆维吾尔自治区', 220);
INSERT INTO "销售数据地图" VALUES ('福建省', 200);
INSERT INTO "销售数据地图" VALUES ('甘肃省', 210);
INSERT INTO "销售数据地图" VALUES ('西藏自治区', 300);
INSERT INTO "销售数据地图" VALUES ('广西壮族自治区', 310);
INSERT INTO "销售数据地图" VALUES ('陕西省', 305);
INSERT INTO "销售数据地图" VALUES ('湖南省', 313);
INSERT INTO "销售数据地图" VALUES ('山东省', 320);
INSERT INTO "销售数据地图" VALUES ('青海省', 400);
INSERT INTO "销售数据地图" VALUES ('浙江省', 410);
INSERT INTO "销售数据地图" VALUES ('辽宁省', 420);
INSERT INTO "销售数据地图" VALUES ('山西省', 405);
INSERT INTO "销售数据地图" VALUES ('云南省', 413);
INSERT INTO "销售数据地图" VALUES ('内蒙古自治区', 500);
INSERT INTO "销售数据地图" VALUES ('江苏省', 510);
INSERT INTO "销售数据地图" VALUES ('海南省', 520);
INSERT INTO "销售数据地图" VALUES ('台湾省', 513);

PRAGMA foreign_keys = true;
