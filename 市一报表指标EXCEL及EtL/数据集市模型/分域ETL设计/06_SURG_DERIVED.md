# SURG_DERIVED — 手术派生表

> 原子层 → 派生层 | 来源: 2张原子表 | 目标: 1张派生表（5个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| SURG_RECORD | 手术记录表 | 手术用药域 | sur_procedure_id, incision_level_code/name, patient_id, hosp_no |
| ORD_MED_INP_USAGE | 住院药品使用表 | 处方医嘱域 | patient_id, inp_no, is_antibacterial_flag |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **total_type_i_incision_surgeries** | VARCHAR2(64) | Ⅰ类切口手术总台数 |
| **type_1_incision_prophylactic_antibiotic_cases** | VARCHAR2(64) | Ⅰ类切口手术预防使用抗菌药物台数 |
| **type_1_incision_iv_antibiotic_leq_24h_cases** | VARCHAR2(64) | Ⅰ类切口手术静脉预防使用抗菌药物时长≤24小时台数 |
| **type_2_incision_prophylactic_antibiotic_cases** | VARCHAR2(64) | 2类切口手术预防使用抗菌药物台数 |
| **type_2_incision_iv_antibiotic_leq_24h_cases** | VARCHAR2(64) | 2类切口手术静脉预防使用抗菌药物时长≤24小时台数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** SURG_RECORD LEFT JOIN ORD_MED_INP_USAGE

**JOIN条件:** `s.patient_id = m.patient_id AND s.hosp_no = m.inp_no AND m.is_antibacterial_flag = '1'`

### 字段计算明细

| 目标字段 | 去重键 | 条件 |
|---|---|---|
| total_type_i_incision_surgeries | sur_procedure_id | incision_level_name LIKE '%Ⅰ%' OR incision_level_code='1' |
| type_1_incision_prophylactic_antibiotic_cases | sur_procedure_id | Ⅰ类 + 有抗菌药关联记录(m.patient_id IS NOT NULL) |
| type_1_incision_iv_antibiotic_leq_24h_cases | sur_procedure_id | ⚠ **同上，缺≤24h时间过滤** |
| type_2_incision_prophylactic_antibiotic_cases | sur_procedure_id | incision_level_name LIKE '%Ⅱ%' + 有抗菌药关联 |
| type_2_incision_iv_antibiotic_leq_24h_cases | sur_procedure_id | ⚠ **同上，缺≤24h时间过滤** |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| BUG-1 | 🔴 高 | type_1_incision_iv_antibiotic_leq_24h_cases 与 prophylactic 字段逻辑完全相同，缺少对抗菌药物使用时长≤24h的时间过滤条件，导致分子=分母，比例永远=100% |
| BUG-2 | 🔴 高 | type_2_incision_iv_antibiotic_leq_24h_cases 同样缺≤24h过滤 |
