-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.SURG_DERIVED (手术派生表)
-- 来源: atomic.SURG_RECORD, atomic.ORD_MED_INP_USAGE
-- ===================================================================

TRUNCATE TABLE derived.SURG_DERIVED;

INSERT INTO derived.SURG_DERIVED (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    total_type_i_incision_surgeries,
    type_1_incision_prophylactic_antibiotic_cases,
    type_1_incision_iv_antibiotic_leq_24h_cases,
    type_2_incision_prophylactic_antibiotic_cases,
    type_2_incision_iv_antibiotic_leq_24h_cases
)
SELECT
    s.stat_date, s.hospital_code, s.hospital_name,
    s.dept_code, s.dept_name, s.ward_code, s.ward_name,
    -- Ⅰ类切口手术总台数：切口等级为"Ⅰ类"的 sur_procedure_id 去重计数
        COUNT(DISTINCT CASE WHEN incision_level_name LIKE '%Ⅰ%' OR incision_level_code IN ('1','01','I') THEN sur_procedure_id END)
        AS total_type_i_incision_surgeries,
    COUNT(DISTINCT CASE WHEN (incision_level_name LIKE '%Ⅰ%' OR incision_level_code IN ('1','01','I'))
                        AND mi.patient_id IS NOT NULL THEN s.sur_procedure_id END)
        AS type_1_incision_prophylactic_antibiotic_cases,
    -- ⚠️ BUG: 下面这个 CASE WHEN 和上面的 `type_1_incision_prophylactic_antibiotic_cases` 完全一样
    --     缺少 `AND 用药时长<=24小时` 的条件过滤，导致分子分母始终相同
    --     修正需在 mi 子查询中加入持续时间过滤，或改用其他字段识别 ≤24h 的用例
    COUNT(DISTINCT CASE WHEN (incision_level_name LIKE '%Ⅰ%' OR incision_level_code IN ('1','01','I'))
                        AND mi.patient_id IS NOT NULL THEN s.sur_procedure_id END)
        AS type_1_incision_iv_antibiotic_leq_24h_cases,
    COUNT(DISTINCT CASE WHEN (incision_level_name LIKE '%Ⅱ%' OR incision_level_code IN ('2','02','II'))
                        AND mi.patient_id IS NOT NULL THEN s.sur_procedure_id END)
        AS type_2_incision_prophylactic_antibiotic_cases,
    -- ⚠️ BUG: 和上面的 `type_2_incision_prophylactic_antibiotic_cases` 完全一样
    --     缺少 ≤24h 过滤条件
    COUNT(DISTINCT CASE WHEN (incision_level_name LIKE '%Ⅱ%' OR incision_level_code IN ('2','02','II'))
                        AND mi.patient_id IS NOT NULL THEN s.sur_procedure_id END)
        AS type_2_incision_iv_antibiotic_leq_24h_cases
FROM atomic.SURG_RECORD s
LEFT JOIN (
    SELECT DISTINCT patient_id, admission_id, inp_no
    FROM atomic.ORD_MED_INP_USAGE
    WHERE is_antibacterial_flag = '1'
) mi
ON s.patient_id = mi.patient_id AND s.hosp_no = mi.inp_no
GROUP BY s.stat_date, s.hospital_code, s.hospital_name,
         s.dept_code, s.dept_name, s.ward_code, s.ward_name;

COMMIT;
