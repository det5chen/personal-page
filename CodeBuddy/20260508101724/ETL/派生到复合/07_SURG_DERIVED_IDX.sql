-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.SURG_DERIVED_IDX (手术用药域指标表)
-- 来源: derived.SURG_DERIVED
-- ===================================================================

TRUNCATE TABLE composite.SURG_DERIVED_IDX;

INSERT INTO composite.SURG_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    type_1_incision_prophylactic_antibiotic_rate,
    type_1_incision_iv_antibiotic_leq_24h_rate,
    type_2_incision_iv_antibiotic_leq_24h_rate
)
SELECT
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    -- Ⅰ类切口手术抗菌药物预防使用率
    CASE WHEN TO_NUMBER(NVL(total_type_i_incision_surgeries,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(type_1_incision_prophylactic_antibiotic_cases,'0'))
                      / TO_NUMBER(total_type_i_incision_surgeries) * 100, 2))
         ELSE '0' END AS type_1_incision_prophylactic_antibiotic_rate,
    -- Ⅰ类切口手术静脉预防使用抗菌药物时长≤24小时比例
    CASE WHEN TO_NUMBER(NVL(type_1_incision_prophylactic_antibiotic_cases,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(type_1_incision_iv_antibiotic_leq_24h_cases,'0'))
                      / TO_NUMBER(type_1_incision_prophylactic_antibiotic_cases) * 100, 2))
         ELSE '0' END AS type_1_incision_iv_antibiotic_leq_24h_rate,
    -- Ⅱ类切口手术静脉预防使用抗菌药物时长≤24小时比例
    CASE WHEN TO_NUMBER(NVL(type_2_incision_prophylactic_antibiotic_cases,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(type_2_incision_iv_antibiotic_leq_24h_cases,'0'))
                      / TO_NUMBER(type_2_incision_prophylactic_antibiotic_cases) * 100, 2))
         ELSE '0' END AS type_2_incision_iv_antibiotic_leq_24h_rate
FROM derived.SURG_DERIVED;

COMMIT;
