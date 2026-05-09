-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.FEE_DERIVED (费用派生表)
-- 来源: atomic.FEE_OUTP_VISIT, atomic.FEE_INP_VISIT
-- ===================================================================

TRUNCATE TABLE derived.FEE_DERIVED;

INSERT INTO derived.FEE_DERIVED (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    outpatient_emergency_drug_revenue, outpatient_emergency_medical_revenue,
    inpatient_drug_revenue, inpatient_medical_revenue,
    outpatient_emergency_supplies_revenue, inpatient_supplies_revenue,
    outpatient_drug_revenue,
    outpatient_emergency_adjuvant_drug_revenue, inpatient_adjuvant_drug_revenue,
    outpatient_emergency_key_monitored_drug_revenue, inpatient_key_monitored_drug_revenue,
    self_pay_drug_revenue,
    total_outpatient_drug_cost, total_emergency_drug_cost,
    inpatient_special_grade_antibiotic_cost, total_inpatient_antibiotic_cost,
    outpatient_antibiotic_cost, inpatient_antibiotic_cost,
    outpatient_emergency_essential_drug_cost, inpatient_essential_drug_cost
)
SELECT
    COALESCE(oe.stat_date, ip.stat_date) AS stat_date,
    COALESCE(oe.hospital_code, ip.hospital_code) AS hospital_code,
    COALESCE(oe.hospital_name, ip.hospital_name) AS hospital_name,
    COALESCE(oe.dept_code, ip.dept_code) AS dept_code,
    COALESCE(oe.dept_name, ip.dept_name) AS dept_name,
    COALESCE(oe.ward_code, ip.ward_code) AS ward_code,
    COALESCE(oe.ward_name, ip.ward_name) AS ward_name,
    -- 门急诊药品收入
    NVL(oe.drug_rev, 0) AS outpatient_emergency_drug_revenue,
    -- 门急诊医疗收入
    NVL(oe.medical_rev, 0) AS outpatient_emergency_medical_revenue,
    -- 住院药品收入
    NVL(ip.drug_rev, 0) AS inpatient_drug_revenue,
    -- 住院医疗收入
    NVL(ip.medical_rev, 0) AS inpatient_medical_revenue,
    -- 门急诊卫生材料收入
    NVL(oe.supplies_rev, 0) AS outpatient_emergency_supplies_revenue,
    -- 住院卫生材料收入
    NVL(ip.supplies_rev, 0) AS inpatient_supplies_revenue,
    -- 门诊药品收入
    NVL(oe.oe_drug_rev, 0) AS outpatient_drug_revenue,
    -- 门急诊辅助用药收入
    NVL(oe.adjuvant_rev, 0) AS outpatient_emergency_adjuvant_drug_revenue,
    -- 住院辅助用药收入
    NVL(ip.adjuvant_rev, 0) AS inpatient_adjuvant_drug_revenue,
    -- 门急诊重点监控药品收入
    NVL(oe.key_monitor_rev, 0) AS outpatient_emergency_key_monitored_drug_revenue,
    -- 住院重点监控药品收入
    NVL(ip.key_monitor_rev, 0) AS inpatient_key_monitored_drug_revenue,
    -- 自费药品收入
    NVL(oe.self_pay_rev, 0) + NVL(ip.self_pay_rev, 0) AS self_pay_drug_revenue,
    -- 门诊就诊患者药品总费用
    NVL(oe.oe_drug_cost, 0) AS total_outpatient_drug_cost,
    -- 急诊就诊患者药品总费用
    NVL(oe.emergency_drug_cost, 0) AS total_emergency_drug_cost,
    -- 住院患者特殊使用级抗菌药物消耗金额
    NVL(ip.special_abx_cost, 0) AS inpatient_special_grade_antibiotic_cost,
    -- 住院患者抗菌药物总消耗金额
    NVL(ip.total_abx_cost, 0) AS total_inpatient_antibiotic_cost,
    -- 门诊抗菌药物费用
    NVL(oe.oe_abx_cost, 0) AS outpatient_antibiotic_cost,
    -- 住院抗菌药物费用
    NVL(ip.ip_abx_cost, 0) AS inpatient_antibiotic_cost,
    -- 门急诊国家基本药物费用
    NVL(oe.essential_drug_cost, 0) AS outpatient_emergency_essential_drug_cost,
    -- 住院国家基本药物费用
    NVL(ip.essential_drug_cost, 0) AS inpatient_essential_drug_cost
FROM (
    -- 门急诊费用统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- ⚠️ 以下 COUNT(*) 为占位，应替换为 SUM(实际金额字段)
        COUNT(*) AS drug_rev,                    -- 门急诊药品收入（待替换为金额求和）
        COUNT(*) AS oe_drug_rev,                 -- 门诊药品收入（待替换为金额求和）
        COUNT(*) AS medical_rev,                 -- 门急诊医疗收入（待替换为金额求和）
        COUNT(*) AS supplies_rev,                -- 门急诊卫生材料收入（待替换为金额求和）
        -- 门急诊辅助用药收入：辅助用药标志为"1"的条目计数
        COUNT(CASE WHEN is_assist_drug_flag = '1' THEN 1 END) AS adjuvant_rev,
        -- 门急诊重点监控药品收入：重点监控药品标志为"1"的条目计数
        COUNT(CASE WHEN is_key_monitor_drug_flag = '1' THEN 1 END) AS key_monitor_rev,
        -- 门急诊自费药品收入：自费药品标志为"1"的条目计数
        COUNT(CASE WHEN is_self_pay_drug_flag = '1' THEN 1 END) AS self_pay_rev,
        -- 门诊就诊患者药品总费用：挂号类型为"门诊"的条目计数
        COUNT(CASE WHEN visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01') THEN 1 END) AS oe_drug_cost,
        -- 急诊就诊患者药品总费用：挂号类型为"急诊"的条目计数
        COUNT(CASE WHEN visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02') THEN 1 END) AS emergency_drug_cost,
        -- 门诊抗菌药物费用：挂号类型为"门诊"且drug_type_code不为空的条目计数
        COUNT(CASE WHEN drug_type_code IS NOT NULL AND (visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01')) THEN 1 END) AS oe_abx_cost
    FROM atomic.FEE_OUTP_VISIT
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) oe
FULL JOIN (
    -- 住院费用统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- ⚠️ 以下 COUNT(*) 为占位，应替换为 SUM(实际金额字段)
        COUNT(*) AS drug_rev,                    -- 住院药品收入（待替换为金额求和）
        COUNT(*) AS medical_rev,                 -- 住院医疗收入（待替换为金额求和）
        COUNT(*) AS supplies_rev,                -- 住院卫生材料收入（待替换为金额求和）
        -- 住院辅助用药收入：辅助用药标志为"1"的条目计数
        COUNT(CASE WHEN is_assist_drug_flag = '1' THEN 1 END) AS adjuvant_rev,
        -- 住院重点监控药品收入：重点监控药品标志为"1"的条目计数
        COUNT(CASE WHEN is_key_monitor_drug_flag = '1' THEN 1 END) AS key_monitor_rev,
        -- 住院自费药品收入：自费药品标志为"1"的条目计数
        COUNT(CASE WHEN is_self_pay_drug_flag = '1' THEN 1 END) AS self_pay_rev,
        -- 住院患者特殊使用级抗菌药物消耗金额：抗菌等级为"特殊使用级"的条目计数
        COUNT(CASE WHEN anti_level_code IN ('特殊使用级','3','03') THEN 1 END) AS special_abx_cost,
        -- 住院患者抗菌药物总消耗金额：抗菌药物标志为"1"的条目计数
        COUNT(CASE WHEN is_antibacterial_flag = '1' THEN 1 END) AS total_abx_cost,
        -- 住院抗菌药物费用：抗菌药物标志为"1"的条目计数
        COUNT(CASE WHEN is_antibacterial_flag = '1' THEN 1 END) AS ip_abx_cost
    FROM atomic.FEE_INP_VISIT
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) ip
ON oe.stat_date = ip.stat_date AND oe.hospital_code = ip.hospital_code
   AND oe.dept_code = ip.dept_code AND NVL(oe.ward_code,'-') = NVL(ip.ward_code,'-')
WHERE COALESCE(oe.stat_date, ip.stat_date) IS NOT NULL;

COMMIT;
