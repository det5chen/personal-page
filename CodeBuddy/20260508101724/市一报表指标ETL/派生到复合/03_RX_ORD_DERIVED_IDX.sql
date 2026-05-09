-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.RX_ORD_DERIVED_IDX (处方医嘱域指标表)
-- 来源: derived.REV_DERIVED_RX_ORD, derived.FEE_DERIVED, derived.ENC_DERIVED
-- ===================================================================

TRUNCATE TABLE composite.RX_ORD_DERIVED_IDX;

INSERT INTO composite.RX_ORD_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    outpatient_emergency_drug_ratio, inpatient_drug_ratio, drug_ratio,
    supplies_ratio, drug_and_supplies_ratio,
    inpatient_tcm_injection_usage_rate, inpatient_ppi_injection_usage_rate,
    inpatient_acid_suppressant_injection_usage_rate,
    inpatient_antibiotic_injection_usage_rate,
    inpatient_antiemetic_injection_usage_rate,
    inpatient_parenteral_nutrition_usage_rate,
    inpatient_single_bottle_pn_usage_ratio,
    inpatient_multi_chamber_bag_pn_usage_rate,
    inpatient_all_in_one_pn_usage_rate,
    emergency_glucocorticoid_iv_usage_rate,
    inpatient_antibiotic_usage_rate, inpatient_antibiotic_usage_intensity,
    inpatient_special_grade_antibiotic_intensity,
    inpatient_special_grade_antibiotic_usage_ratio
)
SELECT
    COALESCE(rx.stat_date, f.stat_date, e.stat_date, n.stat_date) AS stat_date,
    COALESCE(rx.hospital_code, f.hospital_code, e.hospital_code, n.hospital_code) AS hospital_code,
    COALESCE(rx.hospital_name, f.hospital_name, e.hospital_name, n.hospital_name) AS hospital_name,
    COALESCE(rx.dept_code, f.dept_code, e.dept_code, n.dept_code) AS dept_code,
    COALESCE(rx.dept_name, f.dept_name, e.dept_name, n.dept_name) AS dept_name,
    COALESCE(rx.ward_code, f.ward_code, e.ward_code, n.ward_code) AS ward_code,
    COALESCE(rx.ward_name, f.ward_name, e.ward_name, n.ward_name) AS ward_name,
    -- [门急诊药占比] 门急诊药品收入 / 门急诊医疗收入 × 100%
    -- (注：医疗收入已包含药品收入，分母不加药品收入)
    CASE WHEN TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
                      / TO_NUMBER(f.outpatient_emergency_medical_revenue) * 100, 2))
         ELSE '0' END AS outpatient_emergency_drug_ratio,
    -- [住院药占比] 住院药品收入 / 住院医疗收入 × 100%
    CASE WHEN TO_NUMBER(NVL(f.inpatient_medical_revenue,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))
                      / TO_NUMBER(f.inpatient_medical_revenue) * 100, 2))
         ELSE '0' END AS inpatient_drug_ratio,
    -- [药占比-综合] (门急诊药品收入+住院药品收入) / (门急诊医疗收入+住院医疗收入) × 100%
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0')))
            / (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) * 100, 2))
         ELSE '0' END AS drug_ratio,
    -- [耗占比] (门急诊卫生材料收入+住院卫生材料收入) / 医疗总收入 × 100%
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_supplies_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_supplies_revenue,'0')))
            / (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) * 100, 2))
         ELSE '0' END AS supplies_ratio,
    -- [药耗占比] (药品总收入+卫生材料总收入) / 医疗总收入 × 100%
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))
            + TO_NUMBER(NVL(f.outpatient_emergency_supplies_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_supplies_revenue,'0')))
            / (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0')) + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) * 100, 2))
         ELSE '0' END AS drug_and_supplies_ratio,
    -- [住院患者中药注射剂使用率] 使用中药注射剂人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_tcm_injection,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_tcm_injection_usage_rate,
    -- [住院患者PPI注射剂使用率] 使用PPI注射剂人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_ppi_injection,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_ppi_injection_usage_rate,
    -- [住院患者抑酸注射剂使用率] 使用抑酸注射剂人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_acid_suppressant_injection,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_acid_suppressant_injection_usage_rate,
    -- [住院患者抗菌药物注射剂使用率] 使用抗菌药物注射剂人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_antibiotic_injection,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_antibiotic_injection_usage_rate,
    -- [住院患者止吐药注射剂使用率] 使用止吐药注射剂人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_antiemetic_injection,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_antiemetic_injection_usage_rate,
    -- [住院患者肠外营养使用率] 使用肠外营养人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_parenteral_nutrition,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_parenteral_nutrition_usage_rate,
    -- [住院患者单瓶输注肠外营养使用占比] 单瓶PN人数 / 肠外营养总人数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.inpatients_using_parenteral_nutrition,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_single_bottle_pn,'0')) / TO_NUMBER(rx.inpatients_using_parenteral_nutrition) * 100, 2))
         ELSE '0' END AS inpatient_single_bottle_pn_usage_ratio,
    -- [住院患者工业化多腔袋肠外营养使用率] 多腔袋人数 / 肠外营养人数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.inpatients_using_parenteral_nutrition,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_multi_chamber_bag_pn,'0')) / TO_NUMBER(rx.inpatients_using_parenteral_nutrition) * 100, 2))
         ELSE '0' END AS inpatient_multi_chamber_bag_pn_usage_rate,
    -- [住院患者全合一肠外营养使用率] 全合一PN人数 / 肠外营养人数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.inpatients_using_parenteral_nutrition,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_all_in_one_pn,'0')) / TO_NUMBER(rx.inpatients_using_parenteral_nutrition) * 100, 2))
         ELSE '0' END AS inpatient_all_in_one_pn_usage_rate,
    -- [急诊患者糖皮质激素静脉输液使用率] 使用糖皮质激素IV人数 / 急诊人次数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.emergency_visits,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(n.emergency_patients_with_glucocorticoid_iv,'0')) / TO_NUMBER(e.emergency_visits) * 100, 2))
         ELSE '0' END AS emergency_glucocorticoid_iv_usage_rate,
    -- [住院患者抗菌药物使用率] 使用抗菌药物人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_antibiotics,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_antibiotic_usage_rate,
    -- [住院患者抗菌药物使用强度] 抗菌药物DDD消耗总数 / 住院总床日 × 100
    CASE WHEN TO_NUMBER(NVL(e.total_inpatient_occupied_bed_days,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.total_inpatient_antibiotic_ddd,'0'))
                      / TO_NUMBER(e.total_inpatient_occupied_bed_days) * 100, 2))
         ELSE '0' END AS inpatient_antibiotic_usage_intensity,
    -- [住院患者特殊使用级抗菌药物使用强度] 特殊使用级抗菌药物DDD / 住院总床日 × 100
    CASE WHEN TO_NUMBER(NVL(e.total_inpatient_occupied_bed_days,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.total_inpatient_special_grade_antibiotic_ddd,'0'))
                      / TO_NUMBER(e.total_inpatient_occupied_bed_days) * 100, 2))
         ELSE '0' END AS inpatient_special_grade_antibiotic_intensity,
    -- [住院患者特殊使用级抗菌药物使用量占比] 特殊使用级抗菌药物金额 / 抗菌药物总金额 × 100%
    CASE WHEN TO_NUMBER(NVL(f.total_inpatient_antibiotic_cost,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.inpatient_special_grade_antibiotic_cost,'0'))
                      / TO_NUMBER(f.total_inpatient_antibiotic_cost) * 100, 2))
         ELSE '0' END AS inpatient_special_grade_antibiotic_usage_ratio
FROM derived.REV_DERIVED_RX_ORD rx
FULL JOIN derived.FEE_DERIVED f
ON rx.stat_date = f.stat_date AND rx.hospital_code = f.hospital_code
   AND rx.dept_code = f.dept_code AND NVL(rx.ward_code,'-') = NVL(f.ward_code,'-')
FULL JOIN derived.ENC_DERIVED e
ON COALESCE(rx.stat_date,f.stat_date) = e.stat_date
   AND COALESCE(rx.hospital_code,f.hospital_code) = e.hospital_code
   AND COALESCE(rx.dept_code,f.dept_code) = e.dept_code
   AND NVL(COALESCE(rx.ward_code,f.ward_code),'-') = NVL(e.ward_code,'-')
LEFT JOIN derived.NUR_DERIVED n
ON COALESCE(rx.stat_date,f.stat_date,e.stat_date) = n.stat_date
   AND COALESCE(rx.hospital_code,f.hospital_code,e.hospital_code) = n.hospital_code
   AND COALESCE(rx.dept_code,f.dept_code,e.dept_code) = n.dept_code
   AND NVL(COALESCE(rx.ward_code,f.ward_code,e.ward_code),'-') = NVL(n.ward_code,'-')
WHERE COALESCE(rx.stat_date,f.stat_date,e.stat_date,n.stat_date) IS NOT NULL;

COMMIT;
