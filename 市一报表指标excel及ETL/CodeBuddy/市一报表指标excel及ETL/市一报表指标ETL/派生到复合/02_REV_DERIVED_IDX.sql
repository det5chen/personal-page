-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.REV_DERIVED_IDX (处方点评域指标表)
-- 来源: derived.REV_DERIVED_AUDIT
-- ===================================================================

TRUNCATE TABLE composite.REV_DERIVED_IDX;

INSERT INTO composite.REV_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    outpatient_prescription_audit_rate,
    emergency_prescription_audit_rate,
    inpatient_medication_order_audit_rate,
    outpatient_prescription_review_rate,
    emergency_prescription_review_rate,
    reviewed_prescriptions_to_total_rate,
    inpatient_medication_order_review_rate,
    key_monitored_drug_order_review_rate,
    outpatient_prescription_rational_rate,
    emergency_prescription_rational_rate,
    inpatient_medication_order_rational_rate,
    key_monitored_drug_order_rational_rate
)
SELECT
    rev.stat_date, rev.hospital_code, rev.hospital_name,
    rev.dept_code, rev.dept_name, rev.ward_code, rev.ward_name,
    -- 门诊处方审核率 = 药品收费前药师审核的门诊处方数 / 同期门诊处方总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.total_outpatient_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.audited_outpatient_prescriptions_before_charge,'0'))
                      / TO_NUMBER(rx.total_outpatient_prescriptions) * 100, 2))
         ELSE '0' END AS outpatient_prescription_audit_rate,
    -- 急诊处方审核率 = 药品收费前药师审核的急诊处方数 / 同期急诊处方总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.total_emergency_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.audited_emergency_prescriptions_before_charge,'0'))
                      / TO_NUMBER(rx.total_emergency_prescriptions) * 100, 2))
         ELSE '0' END AS emergency_prescription_audit_rate,
    -- 住院患者用药医嘱审核率 = 收费前审核的住院患者用药医嘱条目数 / 同期住院患者用药医嘱总条目数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.total_inpatient_medication_orders, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.audited_inpatient_medication_orders_before_charge,'0'))
                      / TO_NUMBER(rx.total_inpatient_medication_orders) * 100, 2))
         ELSE '0' END AS inpatient_medication_order_audit_rate,
    -- 门诊处方点评率 = 实施点评的门诊处方数 / 同期门诊处方总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.total_outpatient_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.reviewed_outpatient_prescriptions,'0'))
                      / TO_NUMBER(rx.total_outpatient_prescriptions) * 100, 2))
         ELSE '0' END AS outpatient_prescription_review_rate,
    -- 急诊处方点评率 = 实施点评的急诊处方数 / 同期急诊处方总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rx.total_emergency_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.reviewed_emergency_prescriptions,'0'))
                      / TO_NUMBER(rx.total_emergency_prescriptions) * 100, 2))
         ELSE '0' END AS emergency_prescription_review_rate,
    -- 点评处方占处方总数的比例 = 实施点评的处方数 / 处方总数
    CASE WHEN TO_NUMBER(NVL(rx.total_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.reviewed_prescriptions_total,'0'))
                      / TO_NUMBER(rx.total_prescriptions) * 100, 2))
         ELSE '0' END AS reviewed_prescriptions_to_total_rate,
    -- 住院患者用药医嘱点评率 = (实施点评出院病历数 / 出院病历总数) × 100%
    CASE WHEN TO_NUMBER(NVL(rev.total_discharge_records, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.reviewed_discharge_records,'0'))
                      / TO_NUMBER(rev.total_discharge_records) * 100, 2))
         ELSE '0' END AS inpatient_medication_order_review_rate,
    -- 重点监控药品住院患者用药医嘱点评率 = 实施点评的使用重点监控药品的出院病历数 / 同期使用重点监控药品的出院病历总数
    CASE WHEN TO_NUMBER(NVL(rev.total_discharge_records_key_monitored_drugs, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.reviewed_discharge_records_key_monitored_drugs,'0'))
                      / TO_NUMBER(rev.total_discharge_records_key_monitored_drugs) * 100, 2))
         ELSE '0' END AS key_monitored_drug_order_review_rate,
    -- 门诊处方合理率 = 点评为合理的门诊处方数 / 同期点评门诊处方总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rev.reviewed_outpatient_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.rational_outpatient_prescriptions,'0'))
                      / TO_NUMBER(rev.reviewed_outpatient_prescriptions) * 100, 2))
         ELSE '0' END AS outpatient_prescription_rational_rate,
    -- 急诊处方合理率 = 点评为合理的急诊处方数 / 同期点评急诊处方总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rev.reviewed_emergency_prescriptions, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.rational_emergency_prescriptions,'0'))
                      / TO_NUMBER(rev.reviewed_emergency_prescriptions) * 100, 2))
         ELSE '0' END AS emergency_prescription_rational_rate,
    -- 住院患者用药医嘱合理率 = 点评为合理的出院病历数 / 同期点评出院病历总数 × 100%
    CASE WHEN TO_NUMBER(NVL(rev.reviewed_discharge_records, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.rational_discharge_records,'0'))
                      / TO_NUMBER(rev.reviewed_discharge_records) * 100, 2))
         ELSE '0' END AS inpatient_medication_order_rational_rate,
    -- 重点监控药品住院患者用药医嘱合理率
    CASE WHEN TO_NUMBER(NVL(rev.reviewed_discharge_records_key_monitored_drugs, '0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(rev.rational_discharge_records_key_monitored_drugs,'0'))
                      / TO_NUMBER(rev.reviewed_discharge_records_key_monitored_drugs) * 100, 2))
         ELSE '0' END AS key_monitored_drug_order_rational_rate
FROM derived.REV_DERIVED_AUDIT rev
LEFT JOIN derived.REV_DERIVED_RX_ORD rx
ON rev.stat_date = rx.stat_date AND rev.hospital_code = rx.hospital_code
   AND rev.dept_code = rx.dept_code AND NVL(rev.ward_code,'-') = NVL(rx.ward_code,'-');

COMMIT;
