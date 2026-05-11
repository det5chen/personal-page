# MDM_DERIVED_STAFF — 人员派生表

> 原子层 → 派生层 | 来源: 1张原子表 | 目标: 1张派生表（5个指标字段）

---

## 一、来源原子表

| 原子表 | 中文名 | 域 | 关键字段 |
|---|---|---|---|
| MDM_STAFF | 人员表 | 主数据域 | staff_id, staff_type_code/name, qualification_code/name |

---

## 二、目标表 DDL

| 字段名 | 类型 | 中文名 |
|---|---|---|
| stat_date ~ ward_name | VARCHAR2(64) | 通用维度（7字段） |
| **pharmacist_count** | VARCHAR2(64) | 药师人数 |
| **clinical_pharmacist_count** | VARCHAR2(64) | 临床药师人数 |
| **physician_count** | VARCHAR2(64) | 医师人数 |
| **pharmacy_technicians_count** | VARCHAR2(64) | 药学专业技术人员数 |
| **health_professionals_count** | VARCHAR2(64) | 卫生专业技术人员数 |

---

## 三、ETL 加工逻辑

**JOIN方式:** 单表聚合 MDM_STAFF

全部使用 `COUNT(DISTINCT staff_id)` + 不同条件:

| 目标字段 | 筛选条件 |
|---|---|
| pharmacist_count | staff_type_name LIKE '%药师%' OR staff_type_code IN('药师','03') |
| clinical_pharmacist_count | qualification_name LIKE '%临床药师%' OR qualification_code IN('临床药师','01') |
| physician_count | staff_type_name LIKE '%医师%' OR staff_type_code IN('医师','01') |
| pharmacy_technicians_count | staff_type_name LIKE '%药学%' OR staff_type_code IN('药学','03') |
| health_professionals_count | staff_type_name LIKE '%卫生%' OR staff_type_code IN('卫生','04') |

---

## 四、已知问题

| 编号 | 严重程度 | 描述 |
|---|---|---|
| MIS-6 | 🟢 低 | pharmacist_count 与 pharmacy_technicians_count 使用相同 code='03'，需核实区分逻辑 |
