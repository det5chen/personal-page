# MDM_DERIVED_IDX — 主数据域指标表

> 派生层 → 复合层 | 来源: 2张派生表 | 目标: 1张指标表（5个复合指标字段）

---

## 一、来源派生表

| 派生表 | 中文名 | 提供字段 |
|---|---|---|
| MDM_DERIVED_STAFF | 人员派生表 | pharmacist_count, clinical_pharmacist_count, physician_count, pharmacy_technicians_count, health_professionals_count |
| ENC_DERIVED | 就诊派生表 | actual_open_beds |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **pharmacists_per_100_beds** | VARCHAR2(64) | 每百张病床药师人数 |
| **clinical_pharmacists_per_100_beds** | VARCHAR2(64) | 每百张床位临床药师人数 |
| **physician_to_pharmacist_ratio** | VARCHAR2(64) | 医师人数与药师人数之比 |
| **pharmacy_tech_to_health_professional_ratio** | VARCHAR2(64) | 药学专业技术人员数与卫生专业技术人员数比 |
| **third_party_pharmacy_staff_count** | VARCHAR2(64) | 第三方派遣药学人员数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** MDM_DERIVED_STAFF LEFT JOIN ENC_DERIVED

### 复合指标计算公式

| 指标字段 | 公式 | 分子 | 分母 |
|---|---|---|---|
| pharmacists_per_100_beds | 药师人数/实际开放床位数×100 | MDM.pharmacist_count | ENC.actual_open_beds |
| clinical_pharmacists_per_100_beds | 临床药师人数/实际开放床位数×100 | MDM.clinical_pharmacist_count | ENC.actual_open_beds |
| physician_to_pharmacist_ratio | 医师人数/药师人数 | MDM.physician_count | MDM.pharmacist_count |
| pharmacy_tech_to_health_professional_ratio | 药学技术人员数/卫生技术人员数 | MDM.pharmacy_technicians_count | MDM.health_professionals_count |
| third_party_pharmacy_staff_count | ⚠ 当前写'0'，数据不可得 | — | — |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-11 | 🟡 中 | third_party_pharmacy_staff_count 数据当前不可得，写'0' |
| 上游MIS-6 | 🟢 低 | pharmacist_count 与 pharmacy_technicians_count 可能使用相同筛选条件 |
