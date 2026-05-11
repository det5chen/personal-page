# REV_DERIVED_IDX — 处方点评域指标表

> 派生层 → 复合层 | 来源: 2张派生表 | 目标: 1张指标表（12个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| REV_DERIVED_AUDIT | 审方点评派生表 | 审核/点评/合理处方数、出院病历数 |
| REV_DERIVED_RX_ORD | 处方医嘱派生表 | total_outpatient_prescriptions, total_emergency_prescriptions, total_inpatient_medication_orders, total_prescriptions |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **outpatient_prescription_audit_rate** | VARCHAR2(64) | 门诊处方审核率 |
| **emergency_prescription_audit_rate** | VARCHAR2(64) | 急诊处方审核率 |
| **inpatient_medication_order_audit_rate** | VARCHAR2(64) | 住院患者用药医嘱审核率 |
| **outpatient_prescription_review_rate** | VARCHAR2(64) | 门诊处方点评率 |
| **emergency_prescription_review_rate** | VARCHAR2(64) | 急诊处方点评率 |
| **reviewed_prescriptions_to_total_rate** | VARCHAR2(64) | 点评处方占处方总数的比例 |
| **inpatient_medication_order_review_rate** | VARCHAR2(64) | 住院患者用药医嘱点评率 |
| **key_monitored_drug_order_review_rate** | VARCHAR2(64) | 重点监控合理用药药品住院患者用药医嘱点评率 |
| **outpatient_prescription_rational_rate** | VARCHAR2(64) | 门诊处方合理率 |
| **emergency_prescription_rational_rate** | VARCHAR2(64) | 急诊处方合理率 |
| **inpatient_medication_order_rational_rate** | VARCHAR2(64) | 住院患者用药医嘱合理率 |
| **key_monitored_drug_order_rational_rate** | VARCHAR2(64) | 重点监控合理用药药品住院患者用药医嘱合理率 |

---

## 三、ETL 加工逻辑

**JOIN方式:** REV_DERIVED_AUDIT LEFT JOIN REV_DERIVED_RX_ORD

### 复合指标计算公式

| 指标字段 | 公式 | 分子 | 分母 |
|---|---|---|---|
| outpatient_prescription_audit_rate | 审核门诊处方数/门诊处方总数×100 | AUDIT.audited_outpatient_prescriptions_before_charge | RX_ORD.total_outpatient_prescriptions |
| emergency_prescription_audit_rate | 审核急诊处方数/急诊处方总数×100 | AUDIT.audited_emergency_prescriptions_before_charge | RX_ORD.total_emergency_prescriptions |
| inpatient_medication_order_audit_rate | 审核住院医嘱数/住院医嘱总数×100 | AUDIT.audited_inpatient_medication_orders_before_charge | RX_ORD.total_inpatient_medication_orders |
| outpatient_prescription_review_rate | 点评门诊处方数/门诊处方总数×100 | AUDIT.reviewed_outpatient_prescriptions | RX_ORD.total_outpatient_prescriptions |
| emergency_prescription_review_rate | 点评急诊处方数/急诊处方总数×100 | AUDIT.reviewed_emergency_prescriptions | RX_ORD.total_emergency_prescriptions |
| reviewed_prescriptions_to_total_rate | 点评处方总数/处方总数×100 | AUDIT.reviewed_prescriptions_total | RX_ORD.total_prescriptions |
| inpatient_medication_order_review_rate | 点评出院病历数/出院病历总数×100 | AUDIT.reviewed_discharge_records | AUDIT.total_discharge_records |
| key_monitored_drug_order_review_rate | 点评重点监控病历数/重点监控病历总数×100 | AUDIT.reviewed_discharge_records_key_monitored_drugs | AUDIT.total_discharge_records_key_monitored_drugs |
| outpatient_prescription_rational_rate | 合理门诊处方数/点评门诊处方数×100 | AUDIT.rational_outpatient_prescriptions | AUDIT.reviewed_outpatient_prescriptions |
| emergency_prescription_rational_rate | 合理急诊处方数/点评急诊处方数×100 | AUDIT.rational_emergency_prescriptions | AUDIT.reviewed_emergency_prescriptions |
| inpatient_medication_order_rational_rate | 合理出院病历数/点评出院病历数×100 | AUDIT.rational_discharge_records | AUDIT.reviewed_discharge_records |
| key_monitored_drug_order_rational_rate | 合理重点监控病历/点评重点监控病历×100 | AUDIT.rational_discharge_records_key_monitored_drugs | AUDIT.reviewed_discharge_records_key_monitored_drugs |

---

## 四、已知问题

无。
