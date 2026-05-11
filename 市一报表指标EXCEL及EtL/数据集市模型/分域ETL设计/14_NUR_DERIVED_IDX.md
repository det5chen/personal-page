# NUR_DERIVED_IDX — 护理域指标表

> 派生层 → 复合层 | 来源: 2张派生表 | 目标: 1张指标表（11个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| NUR_DERIVED | 护理派生表 | 输液人数、床日、体积、静配数据 |
| ENC_DERIVED | 就诊派生表 | emergency_visits, discharges, non_surgical_inpatients, total_inpatient_occupied_bed_days |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **emergency_iv_infusion_rate** | VARCHAR2(64) | 急诊患者使用静脉输液率 |
| **inpatient_iv_infusion_usage_rate** | VARCHAR2(64) | 住院患者静脉输液使用率 |
| **non_surgical_inpatient_iv_infusion_rate** | VARCHAR2(64) | 非手术住院患者静脉输液使用率 |
| **inpatient_iv_infusion_bed_days_ratio** | VARCHAR2(64) | 住院患者静脉输液床日占比 |
| **average_iv_volume_per_bed_day** | VARCHAR2(64) | 住院患者静脉输液平均每床日使用体积 |
| **average_iv_quantity_per_bed_day** | VARCHAR2(64) | 住院患者静脉输液平均每床日使用数量 |
| **average_iv_drug_varieties_per_inpatient** | VARCHAR2(64) | 住院患者人均静脉用药品种数 |
| **total_civs_preparations** | VARCHAR2(64) | 静脉用药集中调配总数量（袋/瓶） |
| **total_civs_additive_preparations** | VARCHAR2(64) | 静脉用药集中调配加药总数量（袋/瓶） |
| **inpatient_iv_pump_usage_rate** | VARCHAR2(64) | 住院患者静脉输液泵使用率 |
| **civs_order_intervention_rate** | VARCHAR2(64) | 静脉用药集中调配医嘱干预率 |

---

## 三、ETL 加工逻辑

**JOIN方式:** NUR_DERIVED LEFT JOIN ENC_DERIVED

### 复合指标计算公式

| 指标字段 | 公式 | 分子 | 分母 |
|---|---|---|---|
| emergency_iv_infusion_rate | 急诊输液人数/急诊人次×100 | NUR.emergency_patients_with_iv_infusion | ENC.emergency_visits |
| inpatient_iv_infusion_usage_rate | 住院输液人数/出院人数×100 | NUR.inpatient_patients_with_iv_infusion | ENC.discharges |
| non_surgical_inpatient_iv_infusion_rate | 非手术输液人数/非手术住院人数×100 | NUR.non_surgical_inpatients_with_iv_infusion | ENC.non_surgical_inpatients |
| inpatient_iv_infusion_bed_days_ratio | 输液总床日/占用总床日×100 | NUR.total_inpatient_infusion_bed_days | ENC.total_inpatient_occupied_bed_days |
| average_iv_volume_per_bed_day | 输液总体积/输液总床日 | NUR.total_inpatient_iv_volume_ml | NUR.total_inpatient_infusion_bed_days |
| average_iv_quantity_per_bed_day | 输液总数量/输液总床日 | NUR.total_inpatient_iv_bags_bottles | NUR.total_inpatient_infusion_bed_days |
| average_iv_drug_varieties_per_inpatient | 静脉药品种数/住院输液人数 | NUR.total_inpatient_iv_drug_types | NUR.inpatient_patients_with_iv_infusion |
| total_civs_preparations | 直接取 NUR.total_civs_preparations | — | — |
| total_civs_additive_preparations | 直接取 NUR.total_civs_additive_preparations | — | — |
| inpatient_iv_pump_usage_rate | ⚠ 当前写'0'，数据不可得 | — | — |
| civs_order_intervention_rate | 静配干预医嘱数/静配审核总医嘱数×100 | NUR.civs_intervened_orders | NUR.civs_total_reviewed_orders |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-10 | 🟡 中 | inpatient_iv_pump_usage_rate 数据当前不可得，写'0' |
| 上游MIS-3 | 🟡 中 | 输液体积/数量上游为COUNT(*)占位，影响 average_iv_volume/quantity 准确性 |
