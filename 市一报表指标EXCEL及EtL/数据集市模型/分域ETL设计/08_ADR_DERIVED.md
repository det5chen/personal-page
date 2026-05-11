# ADR_DERIVED — 药品不良反应派生表

> 原子层 → 派生层 | 来源: 1张原子表 | 目标: 1张派生表（3个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| ADR_RECORD | 药品不良反应表 | 不良反应域 | ar_id, critical_level_code/name, ar_report_code/name |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **serious_or_new_adr_reports** | VARCHAR2(64) | 严重或新的药品不良反应上报数 |
| **total_adr_reports** | VARCHAR2(64) | 药品不良反应总上报数 |
| **medication_error_reports** | VARCHAR2(64) | 用药错误报告数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** 单表聚合 ADR_RECORD

### 字段计算明细

| 目标字段 | 去重键 | 条件 |
|---|---|---|
| serious_or_new_adr_reports | ar_id | critical_level_name LIKE '%严重%' OR LIKE '%新%' |
| total_adr_reports | ar_id | 无额外条件（全部计数） |
| medication_error_reports | ar_id | ar_report_name LIKE '%用药错误%' |

---

## 四、已知问题

无。
