# REV_DERIVED_AUDIT — 审方点评派生表

> 原子层 → 派生层 | 来源: 3张原子表 | 目标: 1张派生表（14个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| REV_RX_OUTP_AUDIT_REVIEW | 门急诊处方审核点评表 | 处方点评域 | presc_id, visit_type, review_type_name, review_result_name |
| REV_ORD_INP_AUDIT | 住院医嘱审核表 | 处方点评域 | order_id, review_type_name |
| REV_MR_DISCHARGE_REVIEW | 出院病历点评表 | 处方点评域 | discharge_record_id, admission_id, review_result_name, is_key_monitor_drug_flag |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **audited_outpatient_prescriptions_before_charge** | VARCHAR2(64) | 药品收费前药师审核的门诊处方数 |
| **audited_emergency_prescriptions_before_charge** | VARCHAR2(64) | 药品收费前药师审核的急诊处方数 |
| **audited_inpatient_medication_orders_before_charge** | VARCHAR2(64) | 收费前审核的住院患者用药医嘱条目数 |
| **reviewed_outpatient_prescriptions** | VARCHAR2(64) | 实施点评的门诊处方数 |
| **reviewed_emergency_prescriptions** | VARCHAR2(64) | 实施点评的急诊处方数 |
| **reviewed_prescriptions_total** | VARCHAR2(64) | 实施点评的处方数 |
| **reviewed_discharge_records** | VARCHAR2(64) | 实施点评的出院病历数 |
| **total_discharge_records** | VARCHAR2(64) | 出院病历总数 |
| **reviewed_discharge_records_key_monitored_drugs** | VARCHAR2(64) | 实施点评的使用重点监控药品的出院病历数 |
| **total_discharge_records_key_monitored_drugs** | VARCHAR2(64) | 使用重点监控药品的出院病历总数 |
| **rational_outpatient_prescriptions** | VARCHAR2(64) | 点评为合理的门诊处方数 |
| **rational_emergency_prescriptions** | VARCHAR2(64) | 点评为合理的急诊处方数 |
| **rational_discharge_records** | VARCHAR2(64) | 点评为合理的出院病历数 |
| **rational_discharge_records_key_monitored_drugs** | VARCHAR2(64) | 点评为合理的使用重点监控合理用药药品的出院病历数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** FULL JOIN 三路子查询

**筛选规则:**
- `review_type_name LIKE '%审核%'` → 审核类型
- `review_type_name LIKE '%点评%'` → 点评类型
- `review_result_name LIKE '%合理%'` → 合理结果

### 字段计算明细

| 目标字段 | 来源表 | 去重键 | 条件 |
|---|---|---|---|
| audited_outpatient_prescriptions_before_charge | REV_RX_OUTP_AUDIT_REVIEW | presc_id | 审核+门诊 |
| audited_emergency_prescriptions_before_charge | REV_RX_OUTP_AUDIT_REVIEW | presc_id | 审核+急诊 |
| audited_inpatient_medication_orders_before_charge | REV_ORD_INP_AUDIT | order_id | 审核 |
| reviewed_outpatient_prescriptions | REV_RX_OUTP_AUDIT_REVIEW | presc_id | 点评+门诊 |
| reviewed_emergency_prescriptions | REV_RX_OUTP_AUDIT_REVIEW | presc_id | 点评+急诊 |
| reviewed_prescriptions_total | — | — | 门诊点评+急诊点评 |
| reviewed_discharge_records | REV_MR_DISCHARGE_REVIEW | discharge_record_id | 全部 |
| total_discharge_records | REV_MR_DISCHARGE_REVIEW | admission_id | 全部 |
| reviewed_discharge_records_key_monitored_drugs | REV_MR_DISCHARGE_REVIEW | discharge_record_id | is_key_monitor_drug='1' |
| total_discharge_records_key_monitored_drugs | REV_MR_DISCHARGE_REVIEW | admission_id | is_key_monitor_drug='1' |
| rational_outpatient_prescriptions | REV_RX_OUTP_AUDIT_REVIEW | presc_id | 点评+门诊+合理 |
| rational_emergency_prescriptions | REV_RX_OUTP_AUDIT_REVIEW | presc_id | 点评+急诊+合理 |
| rational_discharge_records | REV_MR_DISCHARGE_REVIEW | discharge_record_id | 合理 |
| rational_discharge_records_key_monitored_drugs | REV_MR_DISCHARGE_REVIEW | discharge_record_id | 重点+合理 |

---

## 四、已知问题

无。
