# FEE_DERIVED_IDX — 费用域指标表

> 派生层 → 复合层 | 来源: 3张派生表 | 目标: 1张指标表（6个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| FEE_DERIVED | 费用派生表 | 各类收入/费用金额 |
| ENC_DERIVED | 就诊派生表 | outpatient_visits, emergency_visits, discharges |
| REV_DERIVED_RX_ORD | 处方医嘱派生表 | discharges_with_tcm_decoction |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **medical_service_revenue_ratio** | VARCHAR2(64) | 医疗服务收入（不含药品、耗材、检查检验收入）占医疗收入比例 |
| **average_outpatient_drug_cost_per_visit** | VARCHAR2(64) | 门诊患者次均药费 |
| **average_drug_cost_per_capita** | VARCHAR2(64) | 人均药品费用（次） |
| **outpatient_average_drug_cost_growth_rate** | VARCHAR2(64) | 门诊次均药品费用增幅 |
| **inpatient_average_drug_cost_growth_rate** | VARCHAR2(64) | 住院次均药品费用增幅 |
| **adjuvant_drug_revenue_ratio** | VARCHAR2(64) | 辅助用药收入占比 |
| **key_monitored_drug_revenue_ratio** | VARCHAR2(64) | 重点监控药品占药品收入比例 |
| **self_pay_drug_revenue_ratio** | VARCHAR2(64) | 自费药品占药品收入比例 |
| **discharges_with_tcm_decoction_ratio** | VARCHAR2(64) | 使用中药饮片的出院人数占比 |
| **total_outpatient_drug_cost** | VARCHAR2(64) | 门诊就诊患者药品总费用 |
| **total_emergency_drug_cost** | VARCHAR2(64) | 急诊就诊患者药品总费用 |
| **outpatient_antibiotic_cost_ratio** | VARCHAR2(64) | 门诊抗菌药物费用占总药费比 |
| **inpatient_antibiotic_cost_ratio** | VARCHAR2(64) | 住院抗菌药物费用占总药费比 |

---

## 三、ETL 加工逻辑

**JOIN方式:** FEE_DERIVED LEFT JOIN ENC_DERIVED LEFT JOIN REV_DERIVED_RX_ORD

### 复合指标计算公式

| 指标字段 | 公式 |
|---|---|
| medical_service_revenue_ratio | (医疗收入 - 药品 - 材料 - 检查 - 化验) / 医疗收入 × 100 ⚠缺检查/化验字段 |
| average_outpatient_drug_cost_per_visit | 门诊药品总费用 / 门诊人次 |
| average_drug_cost_per_capita | (门急诊药品收入 + 住院药品收入) / (门诊人次 + 急诊人次 + 入院人数) |
| outpatient_average_drug_cost_growth_rate | ⚠ 需同比数据，当前写'0' |
| inpatient_average_drug_cost_growth_rate | ⚠ 需同比数据，当前写'0' |
| adjuvant_drug_revenue_ratio | (门急诊+住院辅助用药收入) / (门急诊+住院医疗收入) × 100 |
| key_monitored_drug_revenue_ratio | (门急诊+住院重点监控药品收入) / (门急诊+住院药品收入) × 100 |
| self_pay_drug_revenue_ratio | 自费药品收入 / (门急诊+住院药品收入) × 100 |
| discharges_with_tcm_decoction_ratio | 使用中药饮片出院人数 / 出院人数 × 100 |
| total_outpatient_drug_cost | 直接取 FEE.total_outpatient_drug_cost |
| total_emergency_drug_cost | 直接取 FEE.total_emergency_drug_cost |
| outpatient_antibiotic_cost_ratio | 门诊抗菌费用 / 门诊药品总费用 × 100 |
| inpatient_antibiotic_cost_ratio | 住院抗菌费用 / 住院药品收入 × 100 |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-7 | 🟡 中 | medical_service_revenue_ratio 缺少"检查收入"和"化验收入"字段，无法准确计算 |
| MIS-8 | 🟡 中 | 费用增幅指标需同比数据，当前实现为'0' |
