-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.ADR_DERIVED (药品不良反应派生表)
-- 来源: atomic.ADR_RECORD
-- ===================================================================

TRUNCATE TABLE derived.ADR_DERIVED;

INSERT INTO derived.ADR_DERIVED (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    serious_or_new_adr_reports, total_adr_reports, medication_error_reports
)
SELECT
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name,
    NULL AS ward_code,
    NULL AS ward_name,
    -- 严重或新的药品不良反应上报数：严重级别为"严重"或"新"的 ar_id 去重计数
        COUNT(DISTINCT CASE WHEN critical_level_code IN ('严重','1','01','新的一般','2','02','新的严重','3','03')
                   OR critical_level_name LIKE '%严重%' OR critical_level_name LIKE '%新%' THEN ar_id END)
        AS serious_or_new_adr_reports,
    -- 药品不良反应总上报数：ar_id 去重计数
        COUNT(DISTINCT ar_id) AS total_adr_reports,
    -- 用药错误报告数：报告类型为"用药错误"的 ar_id 去重计数
        COUNT(DISTINCT CASE WHEN ar_report_code IN ('用药错误','4','04') OR ar_report_name LIKE '%用药错误%' THEN ar_id END)
        AS medication_error_reports
FROM atomic.ADR_RECORD
GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name;

COMMIT;
