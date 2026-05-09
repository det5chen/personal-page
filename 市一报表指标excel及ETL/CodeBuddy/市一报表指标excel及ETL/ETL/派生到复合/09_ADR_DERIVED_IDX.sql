-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.ADR_DERIVED_IDX (不良反应域指标表)
-- 来源: derived.ADR_DERIVED
-- ===================================================================

TRUNCATE TABLE composite.ADR_DERIVED_IDX;

INSERT INTO composite.ADR_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    serious_or_new_adr_reporting_rate,
    adr_reports_per_million_population,
    medication_error_reporting_rate
)
SELECT
    a.stat_date, a.hospital_code, a.hospital_name,
    a.dept_code, a.dept_name, a.ward_code, a.ward_name,
    -- [严重或新的药品不良反应上报比例] 严重或新的ADR上报数 / ADR总上报数 × 100%
    CASE WHEN TO_NUMBER(NVL(a.total_adr_reports,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(a.serious_or_new_adr_reports,'0'))
                      / TO_NUMBER(a.total_adr_reports) * 100, 2))
         ELSE '0' END AS serious_or_new_adr_reporting_rate,
    -- 每百万人口药品不良反应报告例数（暂无人口数据源，返回0）
    '0' AS adr_reports_per_million_population,
    -- [用药错误报告率] 用药错误报告数 / 同期住院总人次 × 100%
    -- (注：用入院人数admissions作为住院总人次代理，如有更精确的住院人次字段可替换)
    CASE WHEN TO_NUMBER(NVL(e.admissions,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(a.medication_error_reports,'0'))
                      / TO_NUMBER(e.admissions) * 100, 2))
         ELSE '0' END AS medication_error_reporting_rate
FROM derived.ADR_DERIVED a
LEFT JOIN derived.ENC_DERIVED e
ON a.stat_date = e.stat_date AND a.hospital_code = e.hospital_code
   AND a.dept_code = e.dept_code AND NVL(a.ward_code,'-') = NVL(e.ward_code,'-');

COMMIT;
