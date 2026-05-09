-- ===================================================================
-- ETL: 原子 → 派生
-- 表: derived.ENC_DERIVED (就诊派生表)
-- 来源: atomic.ENC_EMER_OUTP_VISIT, atomic.ENC_INP_VISIT, atomic.ENC_BED_RECORD
-- ===================================================================

TRUNCATE TABLE derived.ENC_DERIVED;

INSERT INTO derived.ENC_DERIVED (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    outpatient_visits, emergency_visits, outpatient_emergency_visits,
    discharges, admissions, actual_open_beds,
    discharge_count, non_surgical_inpatients, total_inpatient_occupied_bed_days
)
SELECT
    COALESCE(e.stat_date, i.stat_date, b.stat_date) AS stat_date,
    COALESCE(e.hospital_code, i.hospital_code, b.hospital_code) AS hospital_code,
    COALESCE(e.hospital_name, i.hospital_name, b.hospital_name) AS hospital_name,
    COALESCE(e.dept_code, i.dept_code, b.dept_code) AS dept_code,
    COALESCE(e.dept_name, i.dept_name, b.dept_name) AS dept_name,
    COALESCE(e.ward_code, i.ward_code, b.ward_code) AS ward_code,
    COALESCE(e.ward_name, i.ward_name, b.ward_name) AS ward_name,
    NVL(e.outpatient_cnt, 0) AS outpatient_visits,
    NVL(e.emergency_cnt, 0) AS emergency_visits,
    NVL(e.outpatient_cnt, 0) + NVL(e.emergency_cnt, 0) AS outpatient_emergency_visits,
    NVL(i.discharges, 0) AS discharges,
    NVL(i.admissions, 0) AS admissions,
    NVL(b.actual_open_beds, 0) AS actual_open_beds,
    NVL(i.discharges, 0) AS discharge_count,
    NVL(i.non_surgical, 0) AS non_surgical_inpatients,
    NVL(b.occupied_bed_days, 0) AS total_inpatient_occupied_bed_days
FROM (
    -- 门急诊就诊人次
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 门诊就诊人次数：挂号类型为"门诊"的 register_id 去重计数
        -- 门诊就诊人次数：挂号类型为"门诊"的 register_id 去重计数
        COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%门诊%' OR visit_type_code IN ('1','01') THEN register_id END) AS outpatient_cnt,
        -- 急诊就诊人次数：挂号类型为"急诊"的 register_id 去重计数
        COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%急诊%' OR visit_type_code IN ('2','02') THEN register_id END) AS emergency_cnt
    FROM atomic.ENC_EMER_OUTP_VISIT
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) e
FULL JOIN (
    -- 住院统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 出院人数：有出院方式的 admission_id 去重计数
        COUNT(DISTINCT CASE WHEN discharge_way_code IS NOT NULL AND discharge_way_code <> '' THEN admission_id END) AS discharges,
        -- 入院人数：admission_id 去重计数
        COUNT(DISTINCT admission_id) AS admissions,
        -- 非手术住院患者人数：手术标志为"0"的 admission_id 去重计数
        COUNT(DISTINCT CASE WHEN NVL(surgery_flag,'0') = '0' THEN admission_id END) AS non_surgical
    FROM atomic.ENC_INP_VISIT
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) i
ON e.stat_date = i.stat_date AND e.hospital_code = i.hospital_code
   AND e.dept_code = i.dept_code AND NVL(e.ward_code,'-') = NVL(i.ward_code,'-')
FULL JOIN (
    -- 床位统计
    SELECT
        stat_date, hospital_code, hospital_name,
        dept_code, dept_name, ward_code, ward_name,
        -- 实际开放床位数：开放标志为"1"的 bed_id 去重计数
        COUNT(DISTINCT CASE WHEN open_flag = '1' THEN bed_id END) AS actual_open_beds,
        -- 住院患者实际占用总床日：占用标志为"1"的 bed_day 求和
        SUM(CASE WHEN NVL(occupy_flag,'0') = '1' THEN TO_NUMBER(NVL(bed_day,'0')) ELSE 0 END) AS occupied_bed_days
    FROM atomic.ENC_BED_RECORD
    GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
) b
ON COALESCE(e.stat_date,i.stat_date) = b.stat_date
   AND COALESCE(e.hospital_code,i.hospital_code) = b.hospital_code
   AND COALESCE(e.dept_code,i.dept_code) = b.dept_code
   AND NVL(COALESCE(e.ward_code,i.ward_code),'-') = NVL(b.ward_code,'-')
WHERE COALESCE(e.stat_date,i.stat_date,b.stat_date) IS NOT NULL;

COMMIT;
