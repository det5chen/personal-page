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
    -- ⚠️ 上游BUG-1: type_1_incision_iv_antibiotic_leq_24h_cases 与 type_1_incision_prophylactic_antibiotic_cases 逻辑相同
    --    SURG_DERIVED中缺少对抗菌药物使用时长≤24h的时间过滤，导致分子=分母，该比率恒=100%
    CASE WHEN TO_NUMBER(NVL(type_1_incision_prophylactic_antibiotic_cases,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(type_1_incision_iv_antibiotic_leq_24h_cases,'0'))
                      / TO_NUMBER(type_1_incision_prophylactic_antibiotic_cases) * 100, 2))
         ELSE '0' END AS type_1_incision_iv_antibiotic_leq_24h_rate,
    -- Ⅱ类切口手术静脉预防使用抗菌药物时长≤24小时比例
    -- ⚠️ 上游BUG-2: type_2_incision_iv_antibiotic_leq_24h_cases 同样缺少≤24h过滤，该比率恒=100%
    CASE WHEN TO_NUMBER(NVL(type_2_incision_prophylactic_antibiotic_cases,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(type_2_incision_iv_antibiotic_leq_24h_cases,'0'))
                      / TO_NUMBER(type_2_incision_prophylactic_antibiotic_cases) * 100, 2))
         ELSE '0' END AS type_2_incision_iv_antibiotic_leq_24h_rate
FROM derived.SURG_DERIVED;

COMMIT;
