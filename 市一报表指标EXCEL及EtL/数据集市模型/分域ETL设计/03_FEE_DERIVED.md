# FEE_DERIVED — 费用派生表

> 原子层 → 派生层 | 来源: 2张原子表 | 目标: 1张派生表（19个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| FEE_OUTP_VISIT | 门急诊费用表 | 费用域 | charge_type_code, visit_type_code, is_assist/key_monitor/self_pay_drug_flag |
| FEE_INP_VISIT | 住院费用表 | 费用域 | charge_type_code, anti_level_code, is_antibacterial_flag |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **outpatient_emergency_drug_revenue** | VARCHAR2(64) | 门急诊药品收入 |
| **outpatient_emergency_medical_revenue** | VARCHAR2(64) | 门急诊医疗收入 |
| **inpatient_drug_revenue** | VARCHAR2(64) | 住院药品收入 |
| **inpatient_medical_revenue** | VARCHAR2(64) | 住院医疗收入 |
| **outpatient_emergency_supplies_revenue** | VARCHAR2(64) | 门急诊卫生材料收入 |
| **inpatient_supplies_revenue** | VARCHAR2(64) | 住院卫生材料收入 |
| **outpatient_drug_revenue** | VARCHAR2(64) | 门诊药品收入 |
| **outpatient_emergency_adjuvant_drug_revenue** | VARCHAR2(64) | 门急诊辅助用药收入 |
| **inpatient_adjuvant_drug_revenue** | VARCHAR2(64) | 住院辅助用药收入 |
| **outpatient_emergency_key_monitored_drug_revenue** | VARCHAR2(64) | 门急诊重点监控药品收入 |
| **inpatient_key_monitored_drug_revenue** | VARCHAR2(64) | 住院重点监控药品收入 |
| **self_pay_drug_revenue** | VARCHAR2(64) | 自费药品收入 |
| **total_outpatient_drug_cost** | VARCHAR2(64) | 门诊就诊患者药品总费用 |
| **total_emergency_drug_cost** | VARCHAR2(64) | 急诊就诊患者药品总费用 |
| **inpatient_special_grade_antibiotic_cost** | VARCHAR2(64) | 住院患者特殊使用级抗菌药物消耗金额 |
| **total_inpatient_antibiotic_cost** | VARCHAR2(64) | 住院患者抗菌药物总消耗金额 |
| **outpatient_antibiotic_cost** | VARCHAR2(64) | 门诊抗菌药物费用 |
| **inpatient_antibiotic_cost** | VARCHAR2(64) | 住院抗菌药物费用 |
| **outpatient_emergency_essential_drug_cost** | VARCHAR2(64) | 门急诊国家基本药物费用 |
| **inpatient_essential_drug_cost** | VARCHAR2(64) | 住院国家基本药物费用 |

---

## 三、ETL 加工逻辑

**JOIN方式:** FULL JOIN 两路 (FEE_OUTP_VISIT + FEE_INP_VISIT)

### 字段计算明细

| 目标字段 | 来源 | 条件 | 状态 |
|---|---|---|---|
| outpatient_emergency_drug_revenue | FEE_OUTP_VISIT | charge_type=药品 | ⚠ COUNT(*) 占位 |
| outpatient_emergency_medical_revenue | FEE_OUTP_VISIT | charge_type=医疗 | ⚠ COUNT(*) 占位 |
| inpatient_drug_revenue | FEE_INP_VISIT | charge_type=药品 | ⚠ COUNT(*) 占位 |
| inpatient_medical_revenue | FEE_INP_VISIT | charge_type=医疗 | ⚠ COUNT(*) 占位 |
| outpatient_emergency_supplies_revenue | FEE_OUTP_VISIT | charge_type=材料 | ⚠ COUNT(*) 占位 |
| inpatient_supplies_revenue | FEE_INP_VISIT | charge_type=材料 | ⚠ COUNT(*) 占位 |
| outpatient_drug_revenue | FEE_OUTP_VISIT | 门诊+药品 | ⚠ COUNT(*) 占位 |
| outpatient_emergency_adjuvant_drug_revenue | FEE_OUTP_VISIT | is_assist_drug_flag='1' | ✅ |
| inpatient_adjuvant_drug_revenue | FEE_INP_VISIT | is_assist_drug_flag='1' | ✅ |
| outpatient_emergency_key_monitored_drug_revenue | FEE_OUTP_VISIT | is_key_monitor_drug_flag='1' | ✅ |
| inpatient_key_monitored_drug_revenue | FEE_INP_VISIT | is_key_monitor_drug_flag='1' | ✅ |
| self_pay_drug_revenue | FEE_OUTP + FEE_INP | is_self_pay_drug_flag='1' | ✅ |
| total_outpatient_drug_cost | FEE_OUTP_VISIT | visit_type=门诊 | ✅ |
| total_emergency_drug_cost | FEE_OUTP_VISIT | visit_type=急诊 | ✅ |
| inpatient_special_grade_antibiotic_cost | FEE_INP_VISIT | anti_level=特殊级 | ✅ |
| total_inpatient_antibiotic_cost | FEE_INP_VISIT | is_antibacterial='1' | ✅ |
| outpatient_antibiotic_cost | FEE_OUTP_VISIT | 门诊 + drug_type非空 | ✅ |
| inpatient_antibiotic_cost | FEE_INP_VISIT | is_antibacterial='1' | ✅ |
| outpatient_emergency_essential_drug_cost | — | — | ⚠ 未实现 |
| inpatient_essential_drug_cost | — | — | ⚠ 未实现 |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-1 | 🟡 中 | 7个金额字段使用 COUNT(*) 占位，应替换为 SUM(amount) |
| MIS-2 | 🟡 中 | 基本药物费用字段 DDL有定义但INSERT未实现 |
