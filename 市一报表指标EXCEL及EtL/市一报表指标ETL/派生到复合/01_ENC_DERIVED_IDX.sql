-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.ENC_DERIVED_IDX (就诊域指标表)
-- 来源: derived.ENC_DERIVED, derived.REV_DERIVED_RX_ORD
-- ===================================================================

TRUNCATE TABLE composite.ENC_DERIVED_IDX;

INSERT INTO composite.ENC_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    outpatient_visits, emergency_visits,
    outpatient_emergency_visits, discharges, admissions,
    total_visits, actual_open_beds,
    outpatient_essential_drug_visits_ratio,
    outpatient_essential_drug_prescription_ratio,
    outpatient_essential_drug_usage_ratio,
    inpatient_essential_drug_usage_rate,
    inpatient_essential_drug_usage_ratio
)
SELECT
    e.stat_date, e.hospital_code, e.hospital_name,
    e.dept_code, e.dept_name, e.ward_code, e.ward_name,
    e.outpatient_visits, e.emergency_visits,
    e.outpatient_emergency_visits, e.discharges, e.admissions,
    -- 总诊疗人次数 = 门诊人次 + 急诊人次 + 入院人次
    TO_CHAR(TO_NUMBER(NVL(e.outpatient_visits,'0')) + TO_NUMBER(NVL(e.emergency_visits,'0')) + TO_NUMBER(NVL(e.admissions,'0'))) AS total_visits,
    e.actual_open_beds,
    -- 门诊使用基本药物人次比 = 门诊使用基本药物人次 / 门诊就诊人次数
    CASE WHEN TO_NUMBER(NVL(e.outpatient_visits,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.outpatient_essential_drug_visits,'0')) / TO_NUMBER(e.outpatient_visits) * 100, 2))
         ELSE '0' END AS outpatient_essential_drug_visits_ratio,
    -- 门诊患者基本药物处方占比 = 门诊基本药物处方数 / 门诊处方总数
    CASE WHEN TO_NUMBER(NVL(rx.total_outpatient_prescriptions,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.outpatient_essential_drug_prescriptions,'0')) / TO_NUMBER(rx.total_outpatient_prescriptions) * 100, 2))
         ELSE '0' END AS outpatient_essential_drug_prescription_ratio,
    -- 门诊患者基本药物处方使用占比
    -- ⚠️ 当前分子 `outpatient_essential_drug_visits` 和 `outpatient_essential_drug_visits_ratio` 一样
    --   公式要求 = 门诊患者使用基本药物处方人次 / 门诊就诊人次数，需与"人次比"区分
    CASE WHEN TO_NUMBER(NVL(e.outpatient_visits,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.outpatient_essential_drug_visits,'0')) / TO_NUMBER(e.outpatient_visits) * 100, 2))
         ELSE '0' END AS outpatient_essential_drug_usage_ratio,
    -- 住院患者基本药物使用率 = 住院使用基本药物人数 / 出院人数
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_essential_drugs,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_essential_drug_usage_rate,
    -- 住院患者基本药物使用占比
    -- ⚠️ 当前分子分母和 `inpatient_essential_drug_usage_rate` 完全一样，两个指标无区别
    --   公式要求 = 出院患者基本药物使用人数(或人次) / 出院人数，需确认是否需用不同分子
    CASE WHEN TO_NUMBER(NVL(e.discharges,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rx.inpatients_using_essential_drugs,'0')) / TO_NUMBER(e.discharges) * 100, 2))
         ELSE '0' END AS inpatient_essential_drug_usage_ratio
FROM derived.ENC_DERIVED e
LEFT JOIN derived.REV_DERIVED_RX_ORD rx
ON e.stat_date = rx.stat_date AND e.hospital_code = rx.hospital_code
   AND e.dept_code = rx.dept_code AND NVL(e.ward_code,'-') = NVL(rx.ward_code,'-');

COMMIT;
