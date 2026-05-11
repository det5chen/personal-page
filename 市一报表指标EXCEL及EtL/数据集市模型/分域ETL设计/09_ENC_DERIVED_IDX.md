# ENC_DERIVED_IDX — 就诊域指标表

> 派生层 → 复合层 | 来源: 2张派生表 | 目标: 1张指标表（6个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| ENC_DERIVED | 就诊派生表 | outpatient_visits, emergency_visits, discharges, admissions, actual_open_beds |
| REV_DERIVED_RX_ORD | 处方医嘱派生表 | outpatient_essential_drug_visits, outpatient_essential_drug_prescriptions, total_outpatient_prescriptions, inpatients_using_essential_drugs |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| outpatient_visits | VARCHAR2(64) | 门诊就诊人次数 |
| emergency_visits | VARCHAR2(64) | 急诊就诊人次数 |
| outpatient_emergency_visits | VARCHAR2(64) | 门急诊人次数 |
| discharges | VARCHAR2(64) | 出院人数 |
| admissions | VARCHAR2(64) | 入院人数 |
| **total_visits** | VARCHAR2(64) | 总诊疗人次数 |
| actual_open_beds | VARCHAR2(64) | 实际开放床位数 |
| **outpatient_essential_drug_visits_ratio** | VARCHAR2(64) | 门诊使用基本药物人次比 |
| **outpatient_essential_drug_prescription_ratio** | VARCHAR2(64) | 门诊患者基本药物处方占比 |
| **outpatient_essential_drug_usage_ratio** | VARCHAR2(64) | 门诊患者基本药物处方使用占比 |
| **inpatient_essential_drug_usage_rate** | VARCHAR2(64) | 住院患者基本药物使用率 |
| **inpatient_essential_drug_usage_ratio** | VARCHAR2(64) | 住院患者基本药物使用占比 |

---

## 三、ETL 加工逻辑

**JOIN方式:** ENC_DERIVED LEFT JOIN REV_DERIVED_RX_ORD

**JOIN键:** stat_date + hospital_code + dept_code + NVL(ward_code,'-')

### 复合指标计算公式

| 指标字段 | 公式 | 分子来源 | 分母来源 |
|---|---|---|---|
| total_visits | 门诊人次 + 急诊人次 + 入院人次 | ENC_DERIVED | — |
| outpatient_essential_drug_visits_ratio | 门诊基本药物人次 / 门诊人次 × 100 | REV_DERIVED_RX_ORD.outpatient_essential_drug_visits | ENC_DERIVED.outpatient_visits |
| outpatient_essential_drug_prescription_ratio | 门诊基本药物处方数 / 门诊处方总数 × 100 | REV_DERIVED_RX_ORD.outpatient_essential_drug_prescriptions | REV_DERIVED_RX_ORD.total_outpatient_prescriptions |
| outpatient_essential_drug_usage_ratio | 门诊基本药物处方人次 / 门诊人次 × 100 | REV_DERIVED_RX_ORD.outpatient_essential_drug_visits | ENC_DERIVED.outpatient_visits |
| inpatient_essential_drug_usage_rate | 住院使用基本药物人数 / 出院人数 × 100 | REV_DERIVED_RX_ORD.inpatients_using_essential_drugs | ENC_DERIVED.discharges |
| inpatient_essential_drug_usage_ratio | 出院使用基本药物人数 / 出院人数 × 100 | REV_DERIVED_RX_ORD.inpatients_using_essential_drugs | ENC_DERIVED.discharges |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| NOTE-1 | 🟢 低 | outpatient_essential_drug_usage_ratio 与 outpatient_essential_drug_visits_ratio 分子相同（均用 outpatient_essential_drug_visits），业务上需区分"人次比"和"处方使用占比"的分子差异 |
| NOTE-2 | 🟢 低 | inpatient_essential_drug_usage_ratio 与 inpatient_essential_drug_usage_rate 公式完全相同 |
