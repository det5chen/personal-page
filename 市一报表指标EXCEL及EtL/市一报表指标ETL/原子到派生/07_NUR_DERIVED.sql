-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.NUR_DERIVED (护理派生表)
-- 来源: atomic.NUR_INFUSION_INP_RECORD, atomic.NUR_INFUSION_OUTP_RECORD, atomic.NUR_IVADMIX_RECORD
-- ===================================================================

TRUNCATE TABLE derived.NUR_DERIVED;

INSERT INTO derived.NUR_DERIVED (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    emergency_patients_with_iv_infusion,
    inpatient_patients_with_iv_infusion,
    non_surgical_inpatients_with_iv_infusion,
    total_inpatient_infusion_bed_days,
    total_inpatient_iv_volume_ml,
    total_inpatient_iv_bags_bottles,
    total_inpatient_iv_drug_types,
    total_civs_preparations,
    total_civs_additive_preparations,
    civs_intervened_orders,
    civs_total_reviewed_orders,
    emergency_patients_with_glucocorticoid_iv
)
SELECT
    COALESCE(ir.stat_date, or_.stat_date, iv.stat_date) AS stat_date,
    COALESCE(ir.hospital_code, or_.hospital_code, iv.hospital_code) AS hospital_code,
    COALESCE(ir.hospital_name, or_.hospital_name, iv.hospital_name) AS hospital_name,
    COALESCE(ir.dept_code, or_.dept_code, iv.dept_code) AS dept_code,
    COALESCE(ir.dept_name, or_.dept_name, iv.dept_name) AS dept_name,
    COALESCE(ir.ward_code, or_.ward_code, iv.ward_code) AS ward_code,
    COALESCE(ir.ward_name, or_.ward_name, iv.ward_name) AS ward_name,
    NVL(or_.emergency_iv, 0) AS emergency_patients_with_iv_infusion,
    NVL(ir.inpatient_iv, 0) AS inpatient_patients_with_iv_infusion,
    NVL(ir.non_surgical_iv, 0) AS non_surgical_inpatients_with_iv_infusion,
    NVL(ir.infusion_bed_days, 0) AS total_inpatient_infusion_bed_days,
    NVL(ir.iv_volume, 0) AS total_inpatient_iv_volume_ml,
    NVL(ir.iv_bags, 0) AS total_inpatient_iv_bags_bottles,
    NVL(ir.iv_drug_types, 0) AS total_inpatient_iv_drug_types,
    NVL(iv.total_preps, 0) AS total_civs_preparations,
    NVL(iv.total_additive, 0) AS total_civs_additive_preparations,
    NVL(iv.intervened, 0) AS civs_intervened_orders,
    NVL(iv.total_reviewed, 0) AS civs_total_reviewed_orders,
    NVL(or_.glucocorticoid_iv, 0) AS emergency_patients_with_glucocorticoid_iv
FROM (
    -- 住院输液统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 住院患者静脉输液人数：patient_id 去重计数
        COUNT(DISTINCT patient_id) AS inpatient_iv,
        -- 非手术住院患者静脉输液人数：手术标志为空或"0"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_surgery_flag IS NULL OR is_surgery_flag = '0' THEN patient_id END) AS non_surgical_iv,
        -- 住院患者输液总床日：bed_id 与日期拼接后去重计数
        COUNT(DISTINCT bed_id || stat_date) AS infusion_bed_days,
        SUM(CAST(actual_volume_ml AS NUMERIC)) AS iv_volume,
        SUM(CAST(actual_bag_count AS NUMERIC)) AS iv_bags,
        COUNT(DISTINCT drug_item_id) AS iv_drug_types
    FROM atomic.NUR_INFUSION_INP_RECORD
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) ir
FULL JOIN (
    -- 门急诊输液统计 (NUR_INFUSION_OUTP_RECORD 无 ward_code/ward_name 列，输出 NULL)
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name,
        NULL AS ward_code,
        NULL AS ward_name,
        -- 急诊患者静脉输液人数：挂号类型为"急诊"的 register_id 去重计数
        COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02') THEN register_id END) AS emergency_iv,
        -- 急诊患者使用糖皮质激素静脉输液人数：急诊 + 糖皮质激素标志为"1"的 register_id 去重计数
        COUNT(DISTINCT CASE WHEN (visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02')) AND is_glucocorticoid_flag = '1' THEN register_id END) AS glucocorticoid_iv
    FROM atomic.NUR_INFUSION_OUTP_RECORD
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name
) or_
ON ir.stat_date = or_.stat_date AND ir.hospital_code = or_.hospital_code
   AND ir.dept_code = or_.dept_code AND NVL(ir.ward_code,'-') = NVL(or_.ward_code,'-')
FULL JOIN (
    -- 静配统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        COUNT(DISTINCT drug_item_id) AS total_preps,
        -- 加药配制数量：is_additive_flag 为"1"的药品明细去重计数
        COUNT(DISTINCT CASE WHEN is_additive_flag = '1' THEN drug_item_id END) AS total_additive,
        -- 静脉用药集中调配干预医嘱数：静配干预标志为"1"的 order_id 去重计数
        COUNT(DISTINCT CASE WHEN is_iv_intervene_flag = '1' THEN order_id END) AS intervened,
        -- 静脉用药集中调配总审核医嘱数：静配审核标志为"1"的 order_id 去重计数
        COUNT(DISTINCT CASE WHEN is_iv_audit_flag = '1' THEN order_id END) AS total_reviewed
    FROM atomic.NUR_IVADMIX_RECORD
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) iv
ON COALESCE(ir.stat_date,or_.stat_date) = iv.stat_date
   AND COALESCE(ir.hospital_code,or_.hospital_code) = iv.hospital_code
   AND COALESCE(ir.dept_code,or_.dept_code) = iv.dept_code
   AND NVL(COALESCE(ir.ward_code,or_.ward_code),'-') = NVL(iv.ward_code,'-')
WHERE COALESCE(ir.stat_date,or_.stat_date,iv.stat_date) IS NOT NULL;

COMMIT;
