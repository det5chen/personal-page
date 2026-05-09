-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.REV_DERIVED_AUDIT (审方点评派生表)
-- 来源: atomic.REV_RX_OUTP_AUDIT_REVIEW, atomic.REV_ORD_INP_AUDIT, atomic.REV_MR_DISCHARGE_REVIEW
-- ===================================================================

TRUNCATE TABLE derived.REV_DERIVED_AUDIT;

INSERT INTO derived.REV_DERIVED_AUDIT (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    audited_outpatient_prescriptions_before_charge,
    audited_emergency_prescriptions_before_charge,
    audited_inpatient_medication_orders_before_charge,
    reviewed_outpatient_prescriptions, reviewed_emergency_prescriptions,
    reviewed_prescriptions_total,
    reviewed_discharge_records, total_discharge_records,
    reviewed_discharge_records_key_monitored_drugs,
    total_discharge_records_key_monitored_drugs,
    rational_outpatient_prescriptions, rational_emergency_prescriptions,
    rational_discharge_records, rational_discharge_records_key_monitored_drugs
)
SELECT
    COALESCE(rx.stat_date, ip.stat_date, mr.stat_date) AS stat_date,
    COALESCE(rx.hospital_code, ip.hospital_code, mr.hospital_code) AS hospital_code,
    COALESCE(rx.hospital_name, ip.hospital_name, mr.hospital_name) AS hospital_name,
    COALESCE(rx.dept_code, ip.dept_code, mr.dept_code) AS dept_code,
    COALESCE(rx.dept_name, ip.dept_name, mr.dept_name) AS dept_name,
    COALESCE(rx.ward_code, ip.ward_code, mr.ward_code) AS ward_code,
    COALESCE(rx.ward_name, ip.ward_name, mr.ward_name) AS ward_name,
    NVL(rx.audited_outp, 0) AS audited_outpatient_prescriptions_before_charge,
    NVL(rx.audited_emerg, 0) AS audited_emergency_prescriptions_before_charge,
    NVL(ip.audited_inp, 0) AS audited_inpatient_medication_orders_before_charge,
    NVL(rx.reviewed_outp, 0) AS reviewed_outpatient_prescriptions,
    NVL(rx.reviewed_emerg, 0) AS reviewed_emergency_prescriptions,
    NVL(rx.reviewed_outp, 0) + NVL(rx.reviewed_emerg, 0) AS reviewed_prescriptions_total,
    NVL(mr.reviewed_disc, 0) AS reviewed_discharge_records,
    NVL(mr.total_disc, 0) AS total_discharge_records,
    NVL(mr.reviewed_key, 0) AS reviewed_discharge_records_key_monitored_drugs,
    NVL(mr.total_key, 0) AS total_discharge_records_key_monitored_drugs,
    NVL(rx.rational_outp, 0) AS rational_outpatient_prescriptions,
    NVL(rx.rational_emerg, 0) AS rational_emergency_prescriptions,
    NVL(mr.rational_disc, 0) AS rational_discharge_records,
    NVL(mr.rational_key, 0) AS rational_discharge_records_key_monitored_drugs
FROM (
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 药品收费前药师审核的门诊处方数：审核类型含"审核"且挂号类型为"门诊"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%审核%' AND (visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01')) THEN presc_id END) AS audited_outp,
        -- 药品收费前药师审核的急诊处方数：审核类型含"审核"且挂号类型为"急诊"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%审核%' AND (visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02')) THEN presc_id END) AS audited_emerg,
        -- 实施点评的门诊处方数：点评类型含"点评"且挂号类型为"门诊"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%点评%' AND (visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01')) THEN presc_id END) AS reviewed_outp,
        -- 实施点评的急诊处方数：点评类型含"点评"且挂号类型为"急诊"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%点评%' AND (visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02')) THEN presc_id END) AS reviewed_emerg,
        -- 点评为合理的门诊处方数：点评类型为"门诊"且评审结果含"合理"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%点评%' AND (visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01')) AND review_result_name LIKE '%合理%' THEN presc_id END) AS rational_outp,
        -- 点评为合理的急诊处方数：点评类型为"急诊"且评审结果含"合理"的 presc_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%点评%' AND (visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02')) AND review_result_name LIKE '%合理%' THEN presc_id END) AS rational_emerg
    FROM atomic.REV_RX_OUTP_AUDIT_REVIEW
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) rx
FULL JOIN (
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 收费前审核的住院患者用药医嘱条目数：审核类型含"审核"的 order_id 去重计数
        COUNT(DISTINCT CASE WHEN review_type_name LIKE '%审核%' THEN order_id END) AS audited_inp
    FROM atomic.REV_ORD_INP_AUDIT
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) ip
ON rx.stat_date = ip.stat_date AND rx.hospital_code = ip.hospital_code
   AND rx.dept_code = ip.dept_code AND NVL(rx.ward_code,'-') = NVL(ip.ward_code,'-')
FULL JOIN (
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 实施点评出院病历数：discharge_record_id 去重计数
        COUNT(DISTINCT discharge_record_id) AS reviewed_disc,
        -- 出院病历总数：admission_id 去重计数
        COUNT(DISTINCT admission_id) AS total_disc,
        -- 实施点评的使用重点监控药品的出院病历数：重点监控药品标志为"1"的 discharge_record_id 去重计数
        COUNT(DISTINCT CASE WHEN is_key_monitor_drug_flag = '1' THEN discharge_record_id END) AS reviewed_key,
        -- 使用重点监控药品的出院病历总数：重点监控药品标志为"1"的 admission_id 去重计数
        COUNT(DISTINCT CASE WHEN is_key_monitor_drug_flag = '1' THEN admission_id END) AS total_key,
        -- 点评为合理的出院病历数：评审结果含"合理"的 discharge_record_id 去重计数
        COUNT(DISTINCT CASE WHEN review_result_name LIKE '%合理%' THEN discharge_record_id END) AS rational_disc,
        -- 点评为合理的使用重点监控药品的出院病历数：重点监控药品且评审含"合理"的 discharge_record_id 去重计数
        COUNT(DISTINCT CASE WHEN is_key_monitor_drug_flag = '1' AND review_result_name LIKE '%合理%' THEN discharge_record_id END) AS rational_key
    FROM atomic.REV_MR_DISCHARGE_REVIEW
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) mr
ON COALESCE(rx.stat_date,ip.stat_date) = mr.stat_date
   AND COALESCE(rx.hospital_code,ip.hospital_code) = mr.hospital_code
   AND COALESCE(rx.dept_code,ip.dept_code) = mr.dept_code
   AND NVL(COALESCE(rx.ward_code,ip.ward_code),'-') = NVL(mr.ward_code,'-')
WHERE COALESCE(rx.stat_date,ip.stat_date,mr.stat_date) IS NOT NULL;

COMMIT;
