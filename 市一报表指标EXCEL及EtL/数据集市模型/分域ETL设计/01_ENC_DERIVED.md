# ENC_DERIVED — 就诊派生表

> 原子层 → 派生层 | 来源: 3张原子表 | 目标: 1张派生表（9个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| ENC_EMER_OUTP_VISIT | 门急诊就诊表 | 就诊域 | register_id, visit_type_code/name |
| ENC_INP_VISIT | 住院就诊表 | 就诊域 | admission_id, discharge_way_code, surgery_flag |
| ENC_BED_RECORD | 床位表 | 就诊域 | bed_id, open_flag, occupy_flag, bed_day |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date | VARCHAR2(64) | 统计日期 |
| hospital_code | VARCHAR2(64) | 院区编码 |
| hospital_name | VARCHAR2(64) | 院区名称 |
| dept_code | VARCHAR2(64) | 科室编码 |
| dept_name | VARCHAR2(64) | 科室名称 |
| ward_code | VARCHAR2(64) | 病区编码 |
| ward_name | VARCHAR2(64) | 病区名称 |
| **outpatient_visits** | VARCHAR2(64) | 门诊就诊人次数 |
| **emergency_visits** | VARCHAR2(64) | 急诊就诊人次数 |
| **outpatient_emergency_visits** | VARCHAR2(64) | 门急诊人次数 |
| **discharges** | VARCHAR2(64) | 出院人数 |
| **admissions** | VARCHAR2(64) | 入院人数 |
| **actual_open_beds** | VARCHAR2(64) | 实际开放床位数 |
| **discharge_count** | VARCHAR2(64) | 出院人次数 |
| **non_surgical_inpatients** | VARCHAR2(64) | 非手术住院患者人数 |
| **total_inpatient_occupied_bed_days** | VARCHAR2(64) | 住院患者实际占用总床日 |

---

## 三、ETL 加工逻辑

**JOIN方式:** FULL JOIN 三路子查询

**JOIN键:** `stat_date + hospital_code + dept_code + NVL(ward_code, '-')`

### 子查询 e (门急诊)
```sql
SELECT stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name,
    COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%门诊%' OR visit_type_code IN('1','01')
        THEN register_id END) AS outpatient_cnt,
    COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%急诊%' OR visit_type_code IN('2','02')
        THEN register_id END) AS emergency_cnt
FROM atomic.ENC_EMER_OUTP_VISIT
GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
```

### 子查询 i (住院)
```sql
SELECT stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name,
    COUNT(DISTINCT CASE WHEN discharge_way_code IS NOT NULL AND discharge_way_code<>''
        THEN admission_id END) AS discharges,
    COUNT(DISTINCT admission_id) AS admissions,
    COUNT(DISTINCT CASE WHEN NVL(surgery_flag,'0')='0' THEN admission_id END) AS non_surgical
FROM atomic.ENC_INP_VISIT
GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
```

### 子查询 b (床位)
```sql
SELECT stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name,
    COUNT(DISTINCT CASE WHEN open_flag='1' THEN bed_id END) AS actual_open_beds,
    SUM(CASE WHEN NVL(occupy_flag,'0')='1' THEN TO_NUMBER(NVL(bed_day,'0')) ELSE 0 END) AS occupied_bed_days
FROM atomic.ENC_BED_RECORD
GROUP BY stat_date, hospital_code, hospital_name, dept_code, dept_name, ward_code, ward_name
```

### 字段计算

| 目标字段 | 计算公式 |
|---|---|
| outpatient_visits | NVL(e.outpatient_cnt, 0) |
| emergency_visits | NVL(e.emergency_cnt, 0) |
| outpatient_emergency_visits | outpatient_visits + emergency_visits |
| discharges | NVL(i.discharges, 0) |
| admissions | NVL(i.admissions, 0) |
| actual_open_beds | NVL(b.actual_open_beds, 0) |
| discharge_count | NVL(i.discharges, 0)（冗余副本） |
| non_surgical_inpatients | NVL(i.non_surgical, 0) |
| total_inpatient_occupied_bed_days | NVL(b.occupied_bed_days, 0) |

---

## 四、已知问题

无。
