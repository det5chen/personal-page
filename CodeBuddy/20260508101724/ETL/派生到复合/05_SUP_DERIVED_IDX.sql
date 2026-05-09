-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.SUP_DERIVED_IDX (供应链域指标表)
-- 来源：数据来源于外部供应链系统，此处提供参考结构
-- 说明：本表数据通常来源于药品采购/库存系统，非临床数据直接派生
--       以下为占位SQL，需根据实际供应链数据源补充
-- ===================================================================

TRUNCATE TABLE composite.SUP_DERIVED_IDX;

INSERT INTO composite.SUP_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    volume_based_procurement_drug_usage_ratio,
    volume_based_procurement_completion_rate,
    national_negotiated_drug_varieties_count,
    national_negotiated_drug_total_cost,
    local_negotiated_innovative_drug_varieties_count,
    essential_drug_equipped_varieties_ratio,
    essential_drug_cost_ratio,
    essential_drug_procured_varieties_ratio,
    national_essential_drug_list_varieties_count
)
SELECT
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    '0' AS volume_based_procurement_drug_usage_ratio,
    '0' AS volume_based_procurement_completion_rate,
    '0' AS national_negotiated_drug_varieties_count,
    '0' AS national_negotiated_drug_total_cost,
    '0' AS local_negotiated_innovative_drug_varieties_count,
    '0' AS essential_drug_equipped_varieties_ratio,
    '0' AS essential_drug_cost_ratio,
    '0' AS essential_drug_procured_varieties_ratio,
    '0' AS national_essential_drug_list_varieties_count
FROM derived.ENC_DERIVED
WHERE 1=0;  -- 需替换为实际供应链数据源

-- 实际使用时，需将上述占位SQL替换为：
-- INSERT INTO composite.SUP_DERIVED_IDX (...)
-- SELECT
--     s.stat_date, s.hospital_code, ...
--     -- 集采药品使用比例
--     ROUND(集采药品使用量 / 总药品使用量 * 100, 2) AS volume_based_procurement_drug_usage_ratio,
--     ...
-- FROM 供应链源表 s
-- GROUP BY s.stat_date, s.hospital_code, ...;
COMMIT;
