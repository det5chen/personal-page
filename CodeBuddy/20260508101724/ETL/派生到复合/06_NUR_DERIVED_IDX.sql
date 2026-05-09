-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.NUR_DERIVED_IDX (护理域指标表)
-- 来源: derived.NUR_DERIVED, derived.ENC_DERIVED
-- ===================================================================

TRUNCATE TABLE composite.NUR_DERIVED_IDX;

INSERT INTO composite.NUR_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    emergency_iv_infusion_rate,
    inpatient_iv_infusion_usage_rate,
    non_surgical_inpatient_iv_infusion_rate,
    inpatient_iv_infusion_bed_days_ratio,
    average_iv_volume_per_bed_day,
    average_iv_quantity_per_bed_day,
    average_iv_drug_varieties_per_inpatient,
    total_civs_preparations,
    total_civs_additive_preparations,
    inpatient_iv_pump_usage_rate,
    civs_order_intervention_rate
)
SELECT
    n.stat_date, n.hospital_code, n.hospital_name,
    n.dept_code, n.dept_name, n.ward_code, n.ward_name,
    -- [急诊患者静脉输液使用率] 急诊静脉输液人数 / 急诊就诊人次数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.emergency_visits,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.emergency_patients_with_iv_infusion,'0'))
                      / TO_NUMBER(e.emergency_visits) * 100, 2))
         ELSE '0' END AS emergency_iv_infusion_rate,
    -- [住院患者静脉输液使用率] 住院患者静脉输液人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.inpatient_patients_with_iv_infusion,'0'))
                      / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_iv_infusion_usage_rate,
    -- [非手术住院患者静脉输液使用率] 非手术住院患者静脉输液人数 / 非手术住院患者人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.non_surgical_inpatients,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.non_surgical_inpatients_with_iv_infusion,'0'))
                      / TO_NUMBER(e.non_surgical_inpatients) * 100, 2))
         ELSE '0' END AS non_surgical_inpatient_iv_infusion_rate,
    -- [住院患者静脉输液床日占比] 输液总床日 / 实际占用总床日 × 100%
    CASE WHEN TO_NUMBER(NVL(e.total_inpatient_occupied_bed_days,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.total_inpatient_infusion_bed_days,'0'))
                      / TO_NUMBER(e.total_inpatient_occupied_bed_days) * 100, 2))
         ELSE '0' END AS inpatient_iv_infusion_bed_days_ratio,
    -- [住院患者静脉输液平均每床日使用体积] 输液总体积(ml) / 实际占用总床日
    CASE WHEN TO_NUMBER(NVL(e.total_inpatient_occupied_bed_days,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.total_inpatient_iv_volume_ml,'0'))
                      / TO_NUMBER(e.total_inpatient_occupied_bed_days), 2))
         ELSE '0' END AS average_iv_volume_per_bed_day,
    -- [住院患者静脉输液平均每床日使用数量] 输液总数量(瓶/袋) / 实际占用总床日
    CASE WHEN TO_NUMBER(NVL(e.total_inpatient_occupied_bed_days,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.total_inpatient_iv_bags_bottles,'0'))
                      / TO_NUMBER(e.total_inpatient_occupied_bed_days), 2))
         ELSE '0' END AS average_iv_quantity_per_bed_day,
    -- [住院患者人均静脉用药品种数] 静脉用药品种总数 / 住院患者静脉输液人数
    CASE WHEN TO_NUMBER(NVL(n.inpatient_patients_with_iv_infusion,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.total_inpatient_iv_drug_types,'0'))
                      / TO_NUMBER(n.inpatient_patients_with_iv_infusion), 2))
         ELSE '0' END AS average_iv_drug_varieties_per_inpatient,
    -- 静脉用药集中调配总数量
    n.total_civs_preparations,
    -- 静脉用药集中调配加药总数量
    n.total_civs_additive_preparations,
    -- 住院患者静脉输液泵使用率（暂无数据源，返回0）
    '0' AS inpatient_iv_pump_usage_rate,
    -- [静脉用药集中调配医嘱干预率] 干预医嘱数 / 总审核医嘱数 × 100%
    CASE WHEN TO_NUMBER(NVL(n.civs_total_reviewed_orders,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.civs_intervened_orders,'0'))
                      / NULLIF(TO_NUMBER(n.civs_total_reviewed_orders),0) * 100, 2))
         ELSE '0' END AS civs_order_intervention_rate
FROM derived.NUR_DERIVED n
LEFT JOIN derived.ENC_DERIVED e
ON n.stat_date = e.stat_date AND n.hospital_code = e.hospital_code
   AND n.dept_code = e.dept_code AND NVL(n.ward_code,'-') = NVL(e.ward_code,'-');

COMMIT;
