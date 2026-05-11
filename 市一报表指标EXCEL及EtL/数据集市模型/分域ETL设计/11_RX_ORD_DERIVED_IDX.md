# RX_ORD_DERIVED_IDX — 处方医嘱域指标表

> 派生层 → 复合层 | 来源: 4张派生表 | 目标: 1张指标表（19个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| REV_DERIVED_RX_ORD | 处方医嘱派生表 | 各类药品使用人数、抗菌DDD |
| FEE_DERIVED | 费用派生表 | 药品/医疗/材料收入 |
| ENC_DERIVED | 就诊派生表 | discharges, total_inpatient_occupied_bed_days |
| NUR_DERIVED | 护理派生表 | emergency_patients_with_glucocorticoid_iv |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **outpatient_emergency_drug_ratio** | VARCHAR2(64) | 门急诊药占比 |
| **inpatient_drug_ratio** | VARCHAR2(64) | 住院药占比 |
| **drug_ratio** | VARCHAR2(64) | 药占比 |
| **supplies_ratio** | VARCHAR2(64) | 耗占比 |
| **drug_and_supplies_ratio** | VARCHAR2(64) | 药耗占比 |
| **inpatient_tcm_injection_usage_rate** | VARCHAR2(64) | 住院患者中药注射剂使用率 |
| **inpatient_ppi_injection_usage_rate** | VARCHAR2(64) | 住院患者质子泵抑制药注射剂使用率 |
| **inpatient_acid_suppressant_injection_usage_rate** | VARCHAR2(64) | 住院患者抑酸类药物注射剂使用率 |
| **inpatient_antibiotic_injection_usage_rate** | VARCHAR2(64) | 住院患者抗菌药物注射剂静脉输液使用率 |
| **inpatient_antiemetic_injection_usage_rate** | VARCHAR2(64) | 住院患者止吐药注射剂静脉输液使用率 |
| **inpatient_parenteral_nutrition_usage_rate** | VARCHAR2(64) | 住院患者肠外营养静脉输液使用率 |
| **inpatient_single_bottle_pn_usage_ratio** | VARCHAR2(64) | 住院患者单瓶输注肠外营养使用占比 |
| **inpatient_multi_chamber_bag_pn_usage_rate** | VARCHAR2(64) | 住院患者工业化多腔袋肠外营养使用率 |
| **inpatient_all_in_one_pn_usage_rate** | VARCHAR2(64) | 住院患者全合一肠外营养使用率 |
| **emergency_glucocorticoid_iv_usage_rate** | VARCHAR2(64) | 急诊患者糖皮质激素静脉输液使用率 |
| **inpatient_antibiotic_usage_rate** | VARCHAR2(64) | 住院患者抗菌药物使用率 |
| **inpatient_antibiotic_usage_intensity** | VARCHAR2(64) | 住院患者抗菌药物使用强度 |
| **inpatient_special_grade_antibiotic_intensity** | VARCHAR2(64) | 住院患者特殊使用级抗菌药物使用强度 |
| **inpatient_special_grade_antibiotic_usage_ratio** | VARCHAR2(64) | 住院患者特殊使用级抗菌药物使用量占比 |

---

## 三、ETL 加工逻辑

**JOIN方式:** REV_DERIVED_RX_ORD LEFT JOIN FEE_DERIVED LEFT JOIN ENC_DERIVED LEFT JOIN NUR_DERIVED

### 复合指标计算公式

| 指标字段 | 公式 | 分子 | 分母 |
|---|---|---|---|
| outpatient_emergency_drug_ratio | 门急诊药品收入/(门急诊药品+医疗)×100 | FEE.outpatient_emergency_drug_revenue | FEE.outpatient_emergency_drug_revenue + FEE.outpatient_emergency_medical_revenue |
| inpatient_drug_ratio | 住院药品收入/(住院药品+医疗)×100 | FEE.inpatient_drug_revenue | FEE.inpatient_drug_revenue + FEE.inpatient_medical_revenue |
| drug_ratio | 全院药品收入/全院医疗总收入×100 | 门急诊药品+住院药品 | 全部收入合计 |
| supplies_ratio | 卫生材料收入/医疗总收入×100 | 门急诊材料+住院材料 | 全部收入合计 |
| drug_and_supplies_ratio | (药品+材料)/医疗总收入×100 | 药品+材料 | 全部收入合计 |
| inpatient_tcm_injection_usage_rate | 中药注射剂人数/出院人数×100 | RX_ORD.inpatients_using_tcm_injection | ENC.discharges |
| inpatient_ppi_injection_usage_rate | PPI注射剂人数/出院人数×100 | RX_ORD.inpatients_using_ppi_injection | ENC.discharges |
| inpatient_acid_suppressant_injection_usage_rate | 抑酸注射剂人数/出院人数×100 | RX_ORD.inpatients_using_acid_suppressant_injection | ENC.discharges |
| inpatient_antibiotic_injection_usage_rate | 抗菌注射剂人数/出院人数×100 | RX_ORD.inpatients_using_antibiotic_injection | ENC.discharges |
| inpatient_antiemetic_injection_usage_rate | 止吐药注射剂人数/出院人数×100 | RX_ORD.inpatients_using_antiemetic_injection | ENC.discharges |
| inpatient_parenteral_nutrition_usage_rate | 肠外营养人数/出院人数×100 | RX_ORD.inpatients_using_parenteral_nutrition | ENC.discharges |
| inpatient_single_bottle_pn_usage_ratio | 单瓶PN人数/肠外营养人数×100 | RX_ORD.inpatients_using_single_bottle_pn | RX_ORD.inpatients_using_parenteral_nutrition |
| inpatient_multi_chamber_bag_pn_usage_rate | 多腔袋人数/肠外营养人数×100 | RX_ORD.inpatients_using_multi_chamber_bag_pn | RX_ORD.inpatients_using_parenteral_nutrition |
| inpatient_all_in_one_pn_usage_rate | 全合一PN人数/肠外营养人数×100 | RX_ORD.inpatients_using_all_in_one_pn | RX_ORD.inpatients_using_parenteral_nutrition |
| emergency_glucocorticoid_iv_usage_rate | 急诊糖皮质激素输液人数/急诊人次×100 | NUR.emergency_patients_with_glucocorticoid_iv | ENC.emergency_visits |
| inpatient_antibiotic_usage_rate | 抗菌药人数/出院人数×100 | RX_ORD.inpatients_using_antibiotics | ENC.discharges |
| inpatient_antibiotic_usage_intensity | 抗菌DDD×100/占用总床日 | RX_ORD.total_inpatient_antibiotic_ddd×100 | ENC.total_inpatient_occupied_bed_days |
| inpatient_special_grade_antibiotic_intensity | 特殊级DDD×100/占用总床日 | RX_ORD.total_inpatient_special_grade_antibiotic_ddd×100 | ENC.total_inpatient_occupied_bed_days |
| inpatient_special_grade_antibiotic_usage_ratio | 特殊级DDD/抗菌DDD×100 | RX_ORD.total_inpatient_special_grade_antibiotic_ddd | RX_ORD.total_inpatient_antibiotic_ddd |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| 上游BUG-3 | 🔴 高 | emergency_glucocorticoid_iv_usage_rate 依赖 NUR_DERIVED 的糖皮质激素字段，该字段上游存在BUG（缺过滤条件） |
| 上游MIS-5 | 🟢 低 | 抗菌DDD使用 SUM(1) 近似，影响使用强度指标精度 |
