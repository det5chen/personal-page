-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.FEE_DERIVED_IDX (费用域指标表)
-- 来源: derived.FEE_DERIVED, derived.ENC_DERIVED, derived.REV_DERIVED_RX_ORD
-- ===================================================================

TRUNCATE TABLE composite.FEE_DERIVED_IDX;

INSERT INTO composite.FEE_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    medical_service_revenue_ratio,
    average_outpatient_drug_cost_per_visit,
    average_drug_cost_per_capita,
    outpatient_average_drug_cost_growth_rate,
    inpatient_average_drug_cost_growth_rate,
    adjuvant_drug_revenue_ratio,
    key_monitored_drug_revenue_ratio,
    self_pay_drug_revenue_ratio,
    discharges_with_tcm_decoction_ratio,
    total_outpatient_drug_cost, total_emergency_drug_cost,
    outpatient_antibiotic_cost_ratio, inpatient_antibiotic_cost_ratio
)
SELECT
    f.stat_date, f.hospital_code, f.hospital_name,
    f.dept_code, f.dept_name, f.ward_code, f.ward_name,
    -- [医疗服务收入占比] (医疗收入 - 药品收入 - 卫生材料收入) / 医疗收入 × 100%
    -- (注：公式中还需减"检查收入"和"化验收入"，但FEE_DERIVED表中暂无对应字段)
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
           + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))
           - TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
           - TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))
           - TO_NUMBER(NVL(f.outpatient_emergency_supplies_revenue,'0'))
           - TO_NUMBER(NVL(f.inpatient_supplies_revenue,'0')))
           / (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
            + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) * 100, 2))
         ELSE '0' END AS medical_service_revenue_ratio,
    -- [门诊患者次均药费] 门诊药品总费用 / 门诊就诊人次数
    CASE WHEN TO_NUMBER(NVL(e.outpatient_visits,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.total_outpatient_drug_cost,'0'))
                      / TO_NUMBER(e.outpatient_visits), 2))
         ELSE '0' END AS average_outpatient_drug_cost_per_visit,
    -- [人均药品费用] (门急诊药品收入+住院药品收入) / (门诊人次+急诊人次+入院人数)
    CASE WHEN (TO_NUMBER(NVL(e.outpatient_visits,'0'))
             + TO_NUMBER(NVL(e.emergency_visits,'0'))
             + TO_NUMBER(NVL(e.admissions,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
           + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0')))
           / (TO_NUMBER(NVL(e.outpatient_visits,'0'))
            + TO_NUMBER(NVL(e.emergency_visits,'0'))
            + TO_NUMBER(NVL(e.admissions,'0'))), 2))
         ELSE '0' END AS average_drug_cost_per_capita,
    '0' AS outpatient_average_drug_cost_growth_rate,
    '0' AS inpatient_average_drug_cost_growth_rate,
    -- [辅助用药收入占比] (门急诊辅助用药收入+住院辅助用药收入) / 医疗总收入 × 100%
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_adjuvant_drug_revenue,'0'))
           + TO_NUMBER(NVL(f.inpatient_adjuvant_drug_revenue,'0')))
           / (TO_NUMBER(NVL(f.outpatient_emergency_medical_revenue,'0'))
            + TO_NUMBER(NVL(f.inpatient_medical_revenue,'0'))) * 100, 2))
         ELSE '0' END AS adjuvant_drug_revenue_ratio,
    -- [重点监控药品占药品收入比例] (门急诊+住院重点监控药品收入) / (门急诊+住院药品收入) × 100%
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(
            (TO_NUMBER(NVL(f.outpatient_emergency_key_monitored_drug_revenue,'0'))
           + TO_NUMBER(NVL(f.inpatient_key_monitored_drug_revenue,'0')))
           / (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
            + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))) * 100, 2))
         ELSE '0' END AS key_monitored_drug_revenue_ratio,
    -- [自费药品占药品收入比例] 自费药品收入 / (门急诊药品收入+住院药品收入) × 100%
    CASE WHEN (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
             + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.self_pay_drug_revenue,'0'))
                      / (TO_NUMBER(NVL(f.outpatient_emergency_drug_revenue,'0'))
                       + TO_NUMBER(NVL(f.inpatient_drug_revenue,'0'))) * 100, 2))
         ELSE '0' END AS self_pay_drug_revenue_ratio,
    -- [使用中药饮片的出院人数占比] 使用中药饮片的出院人数 / 出院人数 × 100%
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.discharges_with_tcm_decoction,'0'))
                      / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS discharges_with_tcm_decoction_ratio,
    f.total_outpatient_drug_cost,
    f.total_emergency_drug_cost,
    -- [门诊抗菌药物费用占比] 门诊抗菌药物费用 / 门诊药品总收入 × 100%
    CASE WHEN TO_NUMBER(NVL(f.outpatient_drug_revenue,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.outpatient_antibiotic_cost,'0'))
                      / NULLIF(TO_NUMBER(f.outpatient_drug_revenue),0) * 100, 2))
         ELSE '0' END AS outpatient_antibiotic_cost_ratio,
    -- [住院抗菌药物费用占比] 住院抗菌药物费用 / 住院药品总收入 × 100%
    CASE WHEN TO_NUMBER(NVL(f.inpatient_drug_revenue,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(f.inpatient_antibiotic_cost,'0'))
                      / NULLIF(TO_NUMBER(f.inpatient_drug_revenue),0) * 100, 2))
         ELSE '0' END AS inpatient_antibiotic_cost_ratio
FROM derived.FEE_DERIVED f
LEFT JOIN derived.ENC_DERIVED e
ON f.stat_date = e.stat_date AND f.hospital_code = e.hospital_code
   AND f.dept_code = e.dept_code AND NVL(f.ward_code,'-') = NVL(e.ward_code,'-')
LEFT JOIN derived.REV_DERIVED_RX_ORD rx
ON f.stat_date = rx.stat_date AND f.hospital_code = rx.hospital_code
   AND f.dept_code = rx.dept_code AND NVL(f.ward_code,'-') = NVL(rx.ward_code,'-');

COMMIT;
