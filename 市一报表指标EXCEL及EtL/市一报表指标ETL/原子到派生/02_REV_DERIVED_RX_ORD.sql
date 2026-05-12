-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.REV_DERIVED_RX_ORD (处方医嘱派生表)
-- 来源: atomic.ORD_RX_OUTP_PRESCRIPTION, atomic.ORD_INP_ORDER, atomic.ORD_MED_OUTP_USAGE, atomic.ORD_MED_INP_USAGE
-- ===================================================================

TRUNCATE TABLE derived.REV_DERIVED_RX_ORD;

INSERT INTO derived.REV_DERIVED_RX_ORD (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    total_outpatient_prescriptions, total_emergency_prescriptions,
    total_inpatient_medication_orders, total_prescriptions,
    discharges_with_tcm_decoction, inpatients_using_tcm_injection,
    inpatients_using_ppi_injection, inpatients_using_acid_suppressant_injection,
    inpatients_using_antibiotic_injection, inpatients_using_antiemetic_injection,
    inpatients_using_parenteral_nutrition, inpatients_using_single_bottle_pn,
    inpatients_using_multi_chamber_bag_pn, inpatients_using_all_in_one_pn,
    inpatients_using_antibiotics, total_inpatient_antibiotic_ddd,
    total_inpatient_special_grade_antibiotic_ddd,
    outpatient_essential_drug_visits, outpatient_essential_drug_prescriptions,
    inpatients_using_essential_drugs
)
SELECT
    COALESCE(p.stat_date, o.stat_date, mip.stat_date) AS stat_date,
    COALESCE(p.hospital_code, o.hospital_code, mip.hospital_code) AS hospital_code,
    COALESCE(p.hospital_name, o.hospital_name, mip.hospital_name) AS hospital_name,
    COALESCE(p.dept_code, o.dept_code, mip.dept_code) AS dept_code,
    COALESCE(p.dept_name, o.dept_name, mip.dept_name) AS dept_name,
    COALESCE(p.ward_code, o.ward_code, mip.ward_code) AS ward_code,
    COALESCE(p.ward_name, o.ward_name, mip.ward_name) AS ward_name,
    NVL(p.outpatient_presc, 0) AS total_outpatient_prescriptions,
    NVL(p.emergency_presc, 0) AS total_emergency_prescriptions,
    NVL(o.total_orders, 0) AS total_inpatient_medication_orders,
    NVL(p.outpatient_presc, 0) + NVL(p.emergency_presc, 0) AS total_prescriptions,
    NVL(mip.tcm_decoction, 0) AS discharges_with_tcm_decoction,
    NVL(mip.tcm_inj, 0) AS inpatients_using_tcm_injection,
    NVL(mip.ppi_inj, 0) AS inpatients_using_ppi_injection,
    NVL(mip.acid_suppress, 0) AS inpatients_using_acid_suppressant_injection,
    NVL(mip.abx_inj, 0) AS inpatients_using_antibiotic_injection,
    NVL(mip.antiemetic, 0) AS inpatients_using_antiemetic_injection,
    NVL(mip.pn, 0) AS inpatients_using_parenteral_nutrition,
    NVL(mip.single_pn, 0) AS inpatients_using_single_bottle_pn,
    NVL(mip.multi_pn, 0) AS inpatients_using_multi_chamber_bag_pn,
    NVL(mip.all_in_one_pn, 0) AS inpatients_using_all_in_one_pn,
    NVL(mip.abx_usage, 0) AS inpatients_using_antibiotics,
    NVL(mip.abx_ddd, 0) AS total_inpatient_antibiotic_ddd,
    NVL(mip.special_abx_ddd, 0) AS total_inpatient_special_grade_antibiotic_ddd,
    NVL(mop.essential_drug_visits, 0) AS outpatient_essential_drug_visits,
    NVL(mop.essential_drug_presc, 0) AS outpatient_essential_drug_prescriptions,
    NVL(mip.essential_drug, 0) AS inpatients_using_essential_drugs
FROM (
    -- 处方分类统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 门诊处方总数：挂号类型为"门诊"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01') THEN presc_id END) AS outpatient_presc,
        -- 急诊处方总数：挂号类型为"急诊"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02') THEN presc_id END) AS emergency_presc
    FROM atomic.ORD_RX_OUTP_PRESCRIPTION
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) p
FULL JOIN (
    -- 住院医嘱总数
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 住院患者用药医嘱总条目数：order_id 去重计数
        COUNT(DISTINCT order_id) AS total_orders
    FROM atomic.ORD_INP_ORDER
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) o
ON p.stat_date = o.stat_date AND p.hospital_code = o.hospital_code
   AND p.dept_code = o.dept_code AND NVL(p.ward_code,'-') = NVL(o.ward_code,'-')
FULL JOIN (
    -- 门诊药品使用统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 门诊使用基本药物人次：基本药物标志为"1"的 register_id 去重计数
        COUNT(DISTINCT CASE WHEN is_basic_drug_flag = '1' THEN register_id END) AS essential_drug_visits,
        -- 门诊基本药物处方数：基本药物标志为"1"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN is_basic_drug_flag = '1' THEN presc_id END) AS essential_drug_presc
    FROM atomic.ORD_MED_OUTP_USAGE
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) mop
ON COALESCE(p.stat_date,o.stat_date) = mop.stat_date
   AND COALESCE(p.hospital_code,o.hospital_code) = mop.hospital_code
   AND COALESCE(p.dept_code,o.dept_code) = mop.dept_code
   AND NVL(COALESCE(p.ward_code,o.ward_code),'-') = NVL(mop.ward_code,'-')
FULL JOIN (
    -- 住院药品使用统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 使用中药饮片的出院人数：中药饮片标志为"1"的 admission_id 去重计数
        COUNT(DISTINCT CASE WHEN is_tcm_herb_flag = '1' THEN admission_id END) AS tcm_decoction,
        -- 住院患者使用中药注射剂人数：中药注射剂标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_tcm_inj_flag = '1' THEN patient_id END) AS tcm_inj,
        -- 住院患者使用PPI注射剂人数：PPI标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_ppi_inj_flag = '1' THEN patient_id END) AS ppi_inj,
        -- 住院患者使用抑酸注射剂人数：抑酸注射剂标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_acid_suppress_inj_flag = '1' THEN patient_id END) AS acid_suppress,
        -- 住院患者使用抗菌药物注射剂人数：抗菌注射剂标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_antibacterial_inj_flag = '1' THEN patient_id END) AS abx_inj,
        -- 住院患者使用止吐药注射剂人数：止吐药标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_antiemetic_flag = '1' THEN patient_id END) AS antiemetic,
        -- 住院患者使用肠外营养人数：肠外营养标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_pn_flag = '1' THEN patient_id END) AS pn,
        -- 住院患者使用单瓶输注肠外营养人数：单瓶PN标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_single_bottle_pn_flag = '1' THEN patient_id END) AS single_pn,
        -- 住院患者使用工业化多腔袋肠外营养人数：多腔袋标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_multi_chamber_bag_flag = '1' THEN patient_id END) AS multi_pn,
        -- 住院患者使用全合一肠外营养人数：全合一PN标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_all_in_one_pn_flag = '1' THEN patient_id END) AS all_in_one_pn,
        -- 住院患者使用抗菌药物人数：抗菌药物标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_antibacterial_flag = '1' THEN patient_id END) AS abx_usage,
        -- 住院患者抗菌药物DDD消耗总数：抗菌药条目 ddd_value 求和
        SUM(CASE WHEN is_antibacterial_flag = '1' THEN CAST(ddd_value AS NUMERIC) ELSE 0 END) AS abx_ddd,
        -- 住院患者特殊使用级抗菌药物DDD消耗总数：使用等级为特殊使用级的条目 ddd_value 求和
        SUM(CASE WHEN anti_level_code IN ('特殊使用级','3','03') THEN CAST(ddd_value AS NUMERIC) ELSE 0 END) AS special_abx_ddd,
        -- 住院患者使用基本药物人数：基本药物标志为"1"的 patient_id 去重计数
        COUNT(DISTINCT CASE WHEN is_basic_drug_flag = '1' THEN patient_id END) AS essential_drug
    FROM atomic.ORD_MED_INP_USAGE
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) mip
ON COALESCE(p.stat_date,o.stat_date,mop.stat_date) = mip.stat_date
   AND COALESCE(p.hospital_code,o.hospital_code,mop.hospital_code) = mip.hospital_code
   AND COALESCE(p.dept_code,o.dept_code,mop.dept_code) = mip.dept_code
   AND NVL(COALESCE(p.ward_code,o.ward_code,mop.ward_code),'-') = NVL(mip.ward_code,'-')
WHERE COALESCE(p.stat_date,o.stat_date,mop.stat_date,mip.stat_date) IS NOT NULL;

COMMIT;
