# 原子表假数据 — 使用说明

## 文件说明

| 文件 | 内容 |
|---|---|
| `00_一键执行.sql` | 总入口，依次执行3个Part |
| `原子表_假数据_Part1.sql` | 表01~06: 就诊域3张 + 处方医嘱域3张 |
| `原子表_假数据_Part2.sql` | 表07~12: 住院药品 + 费用域2张 + 点评域3张 |
| `原子表_假数据_Part3.sql` | 表13~18: 人员 + 护理域3张 + 不良反应 + 手术 |

## 数据特征

- `stat_date` 统一: `20260511`
- 每表 10 条记录
- 每条数据设计了至少覆盖 1 个 ETL 触发条件
- 跨表 ID 关联（patient_id, admission_id, presc_id, order_id 等）保持一致

## 预期 ETL 跑通验证

| ETL | 预期产出 | 验证点 |
|---|---|---|
| `01_ENC_DERIVED` | 门诊6次、急诊4次、出院7次、入院10次 | P01=6, P02=4, P04=7, P05=10 |
| `02_REV_DERIVED_RX_ORD` | 门诊处方6张、急诊4张、基本药入次/处方 | is_basic_drug='1'的DI001/002/004/008/009 |
| `03_FEE_DERIVED` | 辅助药2笔、重点监控2笔、自费2笔 | is_assist/ key_monitor/ self_pay |
| `04_REV_DERIVED_AUDIT` | 审核+点评各门诊/急诊, 合理/不合理 | LIKE '%审核%' / '%点评%' / '%合理%' |
| `05_MDM_DERIVED_STAFF` | 药师5人(含临床药师2)、医师3人 | staff_type=药师/医师 |
| `06_SURG_DERIVED` | Ⅰ类切口5台(3抗菌)、Ⅱ类4台(4抗菌) | incision_level='Ⅰ'/'Ⅱ' + antibacterial关联 |
| `07_NUR_DERIVED` | 非手术输液、急诊输液、静配干预 | is_surgery='0'/NULL, visit_type=急诊 |
| `08_ADR_DERIVED` | 严重6条、新3条、用药错误4条 | critical_level LIKE '%严重%'/'%新%' |
