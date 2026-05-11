# SUP_DERIVED_IDX — 供应链域指标表

> 派生层 → 复合层 | 来源: 外部供应链系统 | 目标: 1张指标表（9个指标字段）

---

## 一、来源派生表

| 来源 | 说明 |
|---|---|
| 外部供应链系统 | 本表数据需从外部供应链系统获取，当前ETL为占位实现 |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **volume_based_procurement_drug_usage_ratio** | VARCHAR2(64) | 国家组织药品集中采购中标药品使用比例 |
| **volume_based_procurement_completion_rate** | VARCHAR2(64) | 国家组织药品集中采购中选药品完成比例 |
| **national_negotiated_drug_varieties_count** | VARCHAR2(64) | 医院配备使用国谈药品品种数 |
| **national_negotiated_drug_total_cost** | VARCHAR2(64) | 医院配备使用国谈药品总金额 |
| **local_negotiated_innovative_drug_varieties_count** | VARCHAR2(64) | 本市国谈地产创新药（新优药械）品种数 |
| **essential_drug_equipped_varieties_ratio** | VARCHAR2(64) | 基本药物配备品种数量占比 |
| **essential_drug_cost_ratio** | VARCHAR2(64) | 国家基本药物使用金额比例 |
| **essential_drug_procured_varieties_ratio** | VARCHAR2(64) | 基本药物采购品种数占比 |
| **national_essential_drug_list_varieties_count** | VARCHAR2(64) | 国家基本药物目录品种数 |

---

## 三、ETL 加工逻辑

**当前实现:** 所有字段均返回 '0'（占位）

```sql
INSERT INTO composite.SUP_DERIVED_IDX (...)
SELECT
    stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name,
    '0', '0', '0', '0', '0', '0', '0', '0', '0'
FROM (维度骨架)
```

**说明:** 此表数据应来自外部供应链系统（如集采平台、国谈目录管理系统等），需后续对接数据源。

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-9 | 🟡 中 | 全部9个指标字段均为占位'0'，需对接外部供应链系统数据 |
