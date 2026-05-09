-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.MDM_DERIVED_STAFF (人员派生表)
-- 来源: atomic.MDM_STAFF
-- ===================================================================

TRUNCATE TABLE derived.MDM_DERIVED_STAFF;

INSERT INTO derived.MDM_DERIVED_STAFF (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    pharmacist_count, clinical_pharmacist_count,
    physician_count, pharmacy_technicians_count, health_professionals_count
)
SELECT
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    -- 药师人数：人员类型含"药师"或类型码为"药师"/"03"的 staff_id 去重计数
        COUNT(DISTINCT CASE WHEN staff_type_name LIKE '%药师%' OR staff_type_code IN ('药师','03') THEN staff_id END) AS pharmacist_count,
    -- 临床药师人数：资质含"临床药师"或资质码为"临床药师"/"01"的 staff_id 去重计数
        COUNT(DISTINCT CASE WHEN qualification_name LIKE '%临床药师%' OR qualification_code IN ('临床药师','01') THEN staff_id END) AS clinical_pharmacist_count,
    -- 医师人数：人员类型含"医师"或类型码为"医师"/"01"的 staff_id 去重计数
        COUNT(DISTINCT CASE WHEN staff_type_name LIKE '%医师%' OR staff_type_code IN ('医师','01') THEN staff_id END) AS physician_count,
    -- 药学专业技术人员数：人员类型含"药学"或类型码为"药学"/"03"的 staff_id 去重计数
        COUNT(DISTINCT CASE WHEN staff_type_name LIKE '%药学%' OR staff_type_code IN ('药学','03') THEN staff_id END) AS pharmacy_technicians_count,
    -- 卫生专业技术人员数：人员类型含"卫生"或类型码为"卫生"/"04"的 staff_id 去重计数
        COUNT(DISTINCT CASE WHEN staff_type_name LIKE '%卫生%' OR staff_type_code IN ('卫生','04') THEN staff_id END) AS health_professionals_count
FROM atomic.MDM_STAFF
GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name;

COMMIT;
