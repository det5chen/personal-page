# SURG_DERIVED_IDX — 手术用药域指标表

> 派生层 → 复合层 | 来源: 1张派生表 | 目标: 1张指标表（3个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| SURG_DERIVED | 手术派生表 | total_type_i_incision_surgeries, type_1/2_incision_prophylactic/iv_antibiotic_cases |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **type_1_incision_prophylactic_antibiotic_rate** | VARCHAR2(64) | Ⅰ类切口手术抗菌药物预防使用率 |
| **type_1_incision_iv_antibiotic_leq_24h_rate** | VARCHAR2(64) | 1类切口手术静脉预防使用抗菌药物时长≤24小时比例 |
| **type_2_incision_iv_antibiotic_leq_24h_rate** | VARCHAR2(64) | 2类切口手术静脉预防使用抗菌药物时长≤24小时比例 |

---

## 三、ETL 加工逻辑

**JOIN方式:** 单表 SURG_DERIVED 直接计算

### 复合指标计算公式

| 指标字段 | 公式 | 分子 | 分母 |
|---|---|---|---|
| type_1_incision_prophylactic_antibiotic_rate | Ⅰ类预防抗菌台数/Ⅰ类手术总台数×100 | SURG.type_1_incision_prophylactic_antibiotic_cases | SURG.total_type_i_incision_surgeries |
| type_1_incision_iv_antibiotic_leq_24h_rate | Ⅰ类静脉≤24h台数/Ⅰ类预防抗菌台数×100 | SURG.type_1_incision_iv_antibiotic_leq_24h_cases | SURG.type_1_incision_prophylactic_antibiotic_cases |
| type_2_incision_iv_antibiotic_leq_24h_rate | Ⅱ类静脉≤24h台数/Ⅱ类预防抗菌台数×100 | SURG.type_2_incision_iv_antibiotic_leq_24h_cases | SURG.type_2_incision_prophylactic_antibiotic_cases |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| 上游BUG-1 | 🔴 高 | type_1_incision_iv_antibiotic_leq_24h_cases 上游缺≤24h过滤，导致 leq_24h_rate 永远=100% |
| 上游BUG-2 | 🔴 高 | type_2_incision_iv_antibiotic_leq_24h_cases 同样缺≤24h过滤 |
