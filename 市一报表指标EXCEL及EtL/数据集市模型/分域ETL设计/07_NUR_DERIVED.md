# NUR_DERIVED — 护理派生表

> 原子层 → 派生层 | 来源: 3张原子表 | 目标: 1张派生表（12个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| NUR_INFUSION_INP_RECORD | 住院患者静脉输液记录表 | 护理域 | patient_id, bed_id, drug_item_id, is_surgery_flag |
| NUR_INFUSION_OUTP_RECORD | 门急诊患者静脉输液记录表 | 护理域 | register_id, visit_type_code |
| NUR_IVADMIX_RECORD | 静配记录表 | 护理域 | drug_item_id, order_id, is_iv_audit_flag, is_iv_intervene_flag |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **emergency_patients_with_iv_infusion** | VARCHAR2(64) | 急诊患者静脉输液人数 |
| **inpatient_patients_with_iv_infusion** | VARCHAR2(64) | 住院患者静脉输液人数 |
| **non_surgical_inpatients_with_iv_infusion** | VARCHAR2(64) | 非手术住院患者静脉输液人数 |
| **total_inpatient_infusion_bed_days** | VARCHAR2(64) | 住院患者输液总床日 |
| **total_inpatient_iv_volume_ml** | VARCHAR2(64) | 住院患者静脉输液总体积(ml) |
| **total_inpatient_iv_bags_bottles** | VARCHAR2(64) | 住院患者静脉输液总数量(瓶/袋) |
| **total_inpatient_iv_drug_types** | VARCHAR2(64) | 住院患者静脉用药品种总数 |
| **total_civs_preparations** | VARCHAR2(64) | 静脉用药集中调配总数量 |
| **total_civs_additive_preparations** | VARCHAR2(64) | 静脉用药集中调配加药总数量 |
| **civs_intervened_orders** | VARCHAR2(64) | 静脉用药集中调配干预医嘱数 |
| **civs_total_reviewed_orders** | VARCHAR2(64) | 静脉用药集中调配总审核医嘱数 |
| **emergency_patients_with_glucocorticoid_iv** | VARCHAR2(64) | 急诊患者使用糖皮质激素静脉输液人数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** FULL JOIN 三路 (INP + OUTP + IVADMIX)

### 字段计算明细

| 目标字段 | 来源表 | 去重键 | 条件 | 状态 |
|---|---|---|---|---|
| emergency_patients_with_iv_infusion | NUR_INFUSION_OUTP_RECORD | register_id | visit_type=急诊 | ✅ |
| inpatient_patients_with_iv_infusion | NUR_INFUSION_INP_RECORD | patient_id | — | ✅ |
| non_surgical_inpatients_with_iv_infusion | NUR_INFUSION_INP_RECORD | patient_id | is_surgery_flag='0' | ✅ |
| total_inpatient_infusion_bed_days | NUR_INFUSION_INP_RECORD | bed_id+stat_date | — | ✅ |
| total_inpatient_iv_volume_ml | NUR_INFUSION_INP_RECORD | — | — | SUM(CAST(actual_volume_ml AS NUMERIC)) |
| total_inpatient_iv_bags_bottles | NUR_INFUSION_INP_RECORD | — | — | SUM(CAST(actual_bag_count AS NUMERIC)) |
| total_inpatient_iv_drug_types | NUR_INFUSION_INP_RECORD | drug_item_id | — | ✅ |
| total_civs_preparations | NUR_IVADMIX_RECORD | drug_item_id | — | ✅ |
| total_civs_additive_preparations | NUR_IVADMIX_RECORD | drug_item_id | is_additive_flag='1' | COUNT(DISTINCT CASE WHEN is_additive_flag='1' THEN drug_item_id END) |
| civs_intervened_orders | NUR_IVADMIX_RECORD | order_id | is_iv_intervene_flag='1' | ✅ |
| civs_total_reviewed_orders | NUR_IVADMIX_RECORD | order_id | is_iv_audit_flag='1' | ✅ |
| emergency_patients_with_glucocorticoid_iv | NUR_INFUSION_OUTP_RECORD | register_id | 急诊 + is_glucocorticoid_flag='1' | ✅ |

---

## 四、已知问题

无。
