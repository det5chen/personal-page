# REV_DERIVED_RX_ORD — 处方医嘱派生表

> 原子层 → 派生层 | 来源: 4张原子表 | 目标: 1张派生表（20个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| ORD_RX_OUTP_PRESCRIPTION | 门急诊处方表 | 处方医嘱域 | presc_id, visit_type_code |
| ORD_INP_ORDER | 住院医嘱表 | 处方医嘱域 | order_id |
| ORD_MED_OUTP_USAGE | 门急诊药品使用表 | 处方医嘱域 | register_id, presc_id, is_basic_drug_flag |
| ORD_MED_INP_USAGE | 住院药品使用表 | 处方医嘱域 | patient_id, admission_id, 20+标志位 |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date | VARCHAR2(64) | 统计日期 |
| hospital_code | VARCHAR2(64) | 院区编码 |
| hospital_name | VARCHAR2(64) | 院区名称 |
| dept_code | VARCHAR2(64) | 科室编码 |
| dept_name | VARCHAR2(64) | 科室名称 |
| ward_code | VARCHAR2(64) | 病区编码 |
| ward_name | VARCHAR2(64) | 病区名称 |
| **total_outpatient_prescriptions** | VARCHAR2(64) | 门诊处方总数 |
| **total_emergency_prescriptions** | VARCHAR2(64) | 急诊处方总数 |
| **total_inpatient_medication_orders** | VARCHAR2(64) | 住院患者用药医嘱总条目数 |
| **total_prescriptions** | VARCHAR2(64) | 处方总数 |
| **discharges_with_tcm_decoction** | VARCHAR2(64) | 使用中药饮片的出院人数 |
| **inpatients_using_tcm_injection** | VARCHAR2(64) | 住院患者使用中药注射剂人数 |
| **inpatients_using_ppi_injection** | VARCHAR2(64) | 住院患者使用PPI注射剂人数 |
| **inpatients_using_acid_suppressant_injection** | VARCHAR2(64) | 住院患者使用抑酸注射剂人数 |
| **inpatients_using_antibiotic_injection** | VARCHAR2(64) | 住院患者使用抗菌药物注射剂人数 |
| **inpatients_using_antiemetic_injection** | VARCHAR2(64) | 住院患者使用止吐药注射剂人数 |
| **inpatients_using_parenteral_nutrition** | VARCHAR2(64) | 住院患者使用肠外营养人数 |
| **inpatients_using_single_bottle_pn** | VARCHAR2(64) | 住院患者使用单瓶输注肠外营养人数 |
| **inpatients_using_multi_chamber_bag_pn** | VARCHAR2(64) | 住院患者使用工业化多腔袋人数 |
| **inpatients_using_all_in_one_pn** | VARCHAR2(64) | 住院患者使用全合一肠外营养人数 |
| **inpatients_using_antibiotics** | VARCHAR2(64) | 住院患者使用抗菌药物人数 |
| **total_inpatient_antibiotic_ddd** | VARCHAR2(64) | 住院患者抗菌药物DDD消耗总数 |
| **total_inpatient_special_grade_antibiotic_ddd** | VARCHAR2(64) | 住院患者特殊使用级抗菌药物DDD消耗总数 |
| **outpatient_essential_drug_visits** | VARCHAR2(64) | 门诊使用基本药物人次 |
| **outpatient_essential_drug_prescriptions** | VARCHAR2(64) | 门诊患者基本药物处方数 |
| **inpatients_using_essential_drugs** | VARCHAR2(64) | 住院患者使用基本药物人数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** FULL JOIN 四路子查询

### 字段计算明细

| 目标字段 | 来源表 | 计算逻辑 |
|---|---|---|
| total_outpatient_prescriptions | ORD_RX_OUTP_PRESCRIPTION | COUNT(DISTINCT presc_id) WHERE 门诊 |
| total_emergency_prescriptions | ORD_RX_OUTP_PRESCRIPTION | COUNT(DISTINCT presc_id) WHERE 急诊 |
| total_inpatient_medication_orders | ORD_INP_ORDER | COUNT(DISTINCT order_id) |
| total_prescriptions | — | 门诊处方数 + 急诊处方数 |
| discharges_with_tcm_decoction | ORD_MED_INP_USAGE | COUNT(DISTINCT admission_id) WHERE is_tcm_herb_flag='1' |
| inpatients_using_tcm_injection | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_tcm_inj_flag='1' |
| inpatients_using_ppi_injection | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_ppi_inj_flag='1' |
| inpatients_using_acid_suppressant_injection | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_acid_suppress_inj_flag='1' |
| inpatients_using_antibiotic_injection | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_antibacterial_inj_flag='1' |
| inpatients_using_antiemetic_injection | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_antiemetic_flag='1' |
| inpatients_using_parenteral_nutrition | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_pn_flag='1' |
| inpatients_using_single_bottle_pn | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_single_bottle_pn_flag='1' |
| inpatients_using_multi_chamber_bag_pn | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_multi_chamber_bag_flag='1' |
| inpatients_using_all_in_one_pn | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_all_in_one_pn_flag='1' |
| inpatients_using_antibiotics | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_antibacterial_flag='1' |
| total_inpatient_antibiotic_ddd | ORD_MED_INP_USAGE | ⚠ SUM(1) WHERE is_antibacterial='1'（近似） |
| total_inpatient_special_grade_antibiotic_ddd | ORD_MED_INP_USAGE | ⚠ SUM(1) WHERE anti_level=特殊级（近似） |
| outpatient_essential_drug_visits | ORD_MED_OUTP_USAGE | COUNT(DISTINCT register_id) WHERE is_basic_drug='1' |
| outpatient_essential_drug_prescriptions | ORD_MED_OUTP_USAGE | COUNT(DISTINCT presc_id) WHERE is_basic_drug='1' |
| inpatients_using_essential_drugs | ORD_MED_INP_USAGE | COUNT(DISTINCT patient_id) WHERE is_basic_drug='1' |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-5 | 🟢 低 | DDD使用 SUM(1) 近似计算，应使用实际 ddd_value 字段求和 |
