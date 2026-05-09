-- ===================================================================
-- ETL: 派生 → 复合
-- 表: composite.MDM_DERIVED_IDX (主数据域指标表)
-- 来源: derived.MDM_DERIVED_STAFF, derived.ENC_DERIVED
-- ===================================================================

TRUNCATE TABLE composite.MDM_DERIVED_IDX;

INSERT INTO composite.MDM_DERIVED_IDX (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    pharmacists_per_100_beds,
    clinical_pharmacists_per_100_beds,
    physician_to_pharmacist_ratio,
    pharmacy_tech_to_health_professional_ratio,
    third_party_pharmacy_staff_count
)
SELECT
    s.stat_date, s.hospital_code, s.hospital_name,
    s.dept_code, s.dept_name, s.ward_code, s.ward_name,
    -- [每百张病床药师人数] 药师人数 / 实际开放床位数 * 100
    CASE WHEN TO_NUMBER(NVL(e.actual_open_beds,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(s.pharmacist_count,'0'))
                      / TO_NUMBER(e.actual_open_beds) * 100, 2))
         ELSE '0' END AS pharmacists_per_100_beds,
    -- [每百张床位临床药师人数] 临床药师人数 / 实际开放床位数 * 100
    CASE WHEN TO_NUMBER(NVL(e.actual_open_beds,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(s.clinical_pharmacist_count,'0'))
                      / TO_NUMBER(e.actual_open_beds) * 100, 2))
         ELSE '0' END AS clinical_pharmacists_per_100_beds,
    -- [医师人数与药师人数之比] 医师人数 / 药师人数
    CASE WHEN TO_NUMBER(NVL(s.pharmacist_count,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(s.physician_count,'0'))
                      / NULLIF(TO_NUMBER(s.pharmacist_count),0), 2))
         ELSE '0' END AS physician_to_pharmacist_ratio,
    -- [药学专业技术人员数与卫生技术人员数比] 药学专业技术人员数 / 卫生专业技术人员数
    CASE WHEN TO_NUMBER(NVL(s.health_professionals_count,'0')) > 0
         THEN TO_CHAR(ROUND(TO_NUMBER(NVL(s.pharmacy_technicians_count,'0'))
                      / NULLIF(TO_NUMBER(s.health_professionals_count),0), 2))
         ELSE '0' END AS pharmacy_tech_to_health_professional_ratio,
    -- 第三方派遣药学人员数（暂无数据源，返回0）
    '0' AS third_party_pharmacy_staff_count
FROM derived.MDM_DERIVED_STAFF s
LEFT JOIN derived.ENC_DERIVED e
ON s.stat_date = e.stat_date AND s.hospital_code = e.hospital_code
   AND s.dept_code = e.dept_code AND NVL(s.ward_code,'-') = NVL(e.ward_code,'-');

COMMIT;
