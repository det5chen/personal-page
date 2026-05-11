# ADR_DERIVED_IDX — 不良反应域指标表

> 派生层 → 复合层 | 来源: 2张派生表 | 目标: 1张指标表（3个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| ADR_DERIVED | 药品不良反应派生表 | serious_or_new_adr_reports, total_adr_reports, medication_error_reports |
| ENC_DERIVED | 就诊派生表 | admissions（用作住院总人次代理值） |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **serious_or_new_adr_reporting_rate** | VARCHAR2(64) | 严重或新的药品不良反应上报比例 |
| **adr_reports_per_million_population** | VARCHAR2(64) | 每百万人口药品不良反应报告例数 |
| **medication_error_reporting_rate** | VARCHAR2(64) | 用药错误报告率 |

---

## 三、ETL 加工逻辑

**JOIN方式:** ADR_DERIVED LEFT JOIN ENC_DERIVED

### 复合指标计算公式

| 指标字段 | 公式 | 分子 | 分母 | 说明 |
|---|---|---|---|---|
| serious_or_new_adr_reporting_rate | 严重/新ADR数/ADR总数×100 | ADR.serious_or_new_adr_reports | ADR.total_adr_reports | — |
| adr_reports_per_million_population | ADR总数/人口数×1000000 | ADR.total_adr_reports | ⚠ 缺人口数据 | 当前写'0' |
| medication_error_reporting_rate | 用药错误报告数/住院总人次×100 | ADR.medication_error_reports | ENC.admissions | 用admissions代理住院总人次 |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-12 | 🟡 中 | adr_reports_per_million_population 缺人口基数数据，当前写'0' |
| NOTE-3 | 🟢 低 | medication_error_reporting_rate 使用 admissions 作为住院总人次代理值，精度受限 |
