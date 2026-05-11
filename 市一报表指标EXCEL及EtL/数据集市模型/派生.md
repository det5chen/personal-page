
DROP TABLE IF EXISTS ENC_DERIVED;
CREATE TABLE ENC_DERIVED(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    outpatient_visits VARCHAR2(64) NULL,
    emergency_visits VARCHAR2(64) NULL,
    outpatient_emergency_visits VARCHAR2(64) NULL,
    discharges VARCHAR2(64) NULL,
    admissions VARCHAR2(64) NULL,
    actual_open_beds VARCHAR2(64) NULL,
    discharge_count VARCHAR2(64) NULL,
    non_surgical_inpatients VARCHAR2(64) NULL,
    total_inpatient_occupied_bed_days VARCHAR2(64) NULL
);
COMMENT ON COLUMN ENC_DERIVED.stat_date IS '统计日期'
COMMENT ON COLUMN ENC_DERIVED.hospital_code IS '院区编码'
COMMENT ON COLUMN ENC_DERIVED.hospital_name IS '院区名称'
COMMENT ON COLUMN ENC_DERIVED.dept_code IS '科室编码'
COMMENT ON COLUMN ENC_DERIVED.dept_name IS '科室名称'
COMMENT ON COLUMN ENC_DERIVED.ward_code IS '病区编码'
COMMENT ON COLUMN ENC_DERIVED.ward_name IS '病区名称'
COMMENT ON COLUMN ENC_DERIVED.outpatient_visits IS '门诊就诊人次数'
COMMENT ON COLUMN ENC_DERIVED.emergency_visits IS '急诊就诊人次数'
COMMENT ON COLUMN ENC_DERIVED.outpatient_emergency_visits IS '门急诊人次数'
COMMENT ON COLUMN ENC_DERIVED.discharges IS '出院人数'
COMMENT ON COLUMN ENC_DERIVED.admissions IS '入院人数'
COMMENT ON COLUMN ENC_DERIVED.actual_open_beds IS '实际开放床位数'
COMMENT ON COLUMN ENC_DERIVED.discharge_count IS '出院人次数'
COMMENT ON COLUMN ENC_DERIVED.non_surgical_inpatients IS '非手术住院患者人数'
COMMENT ON COLUMN ENC_DERIVED.total_inpatient_occupied_bed_days IS '住院患者实际占用总床日'
COMMENT ON TABLE ENC_DERIVED IS '就诊派生表';


DROP TABLE IF EXISTS REV_DERIVED_RX_ORD;
CREATE TABLE REV_DERIVED_RX_ORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    total_outpatient_prescriptions VARCHAR2(64) NULL,
    total_emergency_prescriptions VARCHAR2(64) NULL,
    total_inpatient_medication_orders VARCHAR2(64) NULL,
    total_prescriptions VARCHAR2(64) NULL,
    discharges_with_tcm_decoction VARCHAR2(64) NULL,
    inpatients_using_tcm_injection VARCHAR2(64) NULL,
    inpatients_using_ppi_injection VARCHAR2(64) NULL,
    inpatients_using_acid_suppressant_injection VARCHAR2(64) NULL,
    inpatients_using_antibiotic_injection VARCHAR2(64) NULL,
    inpatients_using_antiemetic_injection VARCHAR2(64) NULL,
    inpatients_using_parenteral_nutrition VARCHAR2(64) NULL,
    inpatients_using_single_bottle_pn VARCHAR2(64) NULL,
    inpatients_using_multi_chamber_bag_pn VARCHAR2(64) NULL,
    inpatients_using_all_in_one_pn VARCHAR2(64) NULL,
    inpatients_using_antibiotics VARCHAR2(64) NULL,
    total_inpatient_antibiotic_ddd VARCHAR2(64) NULL,
    total_inpatient_special_grade_antibiotic_ddd VARCHAR2(64) NULL,
    outpatient_essential_drug_visits VARCHAR2(64) NULL,
    outpatient_essential_drug_prescriptions VARCHAR2(64) NULL,
    inpatients_using_essential_drugs VARCHAR2(64) NULL
);
COMMENT ON COLUMN REV_DERIVED_RX_ORD.stat_date IS '统计日期'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.hospital_code IS '院区编码'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.hospital_name IS '院区名称'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.dept_code IS '科室编码'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.dept_name IS '科室名称'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.ward_code IS '病区编码'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.ward_name IS '病区名称'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.total_outpatient_prescriptions IS '门诊处方总数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.total_emergency_prescriptions IS '急诊处方总数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.total_inpatient_medication_orders IS '住院患者用药医嘱总条目数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.total_prescriptions IS '处方总数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.discharges_with_tcm_decoction IS '使用中药饮片的出院人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_tcm_injection IS '住院患者使用中药注射剂人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_ppi_injection IS '住院患者使用PPI注射剂人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_acid_suppressant_injection IS '住院患者使用抑酸注射剂人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_antibiotic_injection IS '住院患者使用抗菌药物注射剂人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_antiemetic_injection IS '住院患者使用止吐药注射剂人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_parenteral_nutrition IS '住院患者使用肠外营养人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_single_bottle_pn IS '住院患者使用单瓶输注肠外营养人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_multi_chamber_bag_pn IS '住院患者使用工业化多腔袋人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_all_in_one_pn IS '住院患者使用全合一肠外营养人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_antibiotics IS '住院患者使用抗菌药物人数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.total_inpatient_antibiotic_ddd IS '住院患者抗菌药物DDD消耗总数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.total_inpatient_special_grade_antibiotic_ddd IS '住院患者特殊使用级抗菌药物DDD消耗总数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.outpatient_essential_drug_visits IS '门诊使用基本药物人次'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.outpatient_essential_drug_prescriptions IS '门诊患者基本药物处方数'
COMMENT ON COLUMN REV_DERIVED_RX_ORD.inpatients_using_essential_drugs IS '住院患者使用基本药物人数'
COMMENT ON TABLE REV_DERIVED_RX_ORD IS '处方医嘱派生表';


DROP TABLE IF EXISTS FEE_DERIVED;
CREATE TABLE FEE_DERIVED(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    outpatient_emergency_drug_revenue VARCHAR2(64) NULL,
    outpatient_emergency_medical_revenue VARCHAR2(64) NULL,
    inpatient_drug_revenue VARCHAR2(64) NULL,
    inpatient_medical_revenue VARCHAR2(64) NULL,
    outpatient_emergency_supplies_revenue VARCHAR2(64) NULL,
    inpatient_supplies_revenue VARCHAR2(64) NULL,
    outpatient_drug_revenue VARCHAR2(64) NULL,
    outpatient_emergency_adjuvant_drug_revenue VARCHAR2(64) NULL,
    inpatient_adjuvant_drug_revenue VARCHAR2(64) NULL,
    outpatient_emergency_key_monitored_drug_revenue VARCHAR2(64) NULL,
    inpatient_key_monitored_drug_revenue VARCHAR2(64) NULL,
    self_pay_drug_revenue VARCHAR2(64) NULL,
    total_outpatient_drug_cost VARCHAR2(64) NULL,
    total_emergency_drug_cost VARCHAR2(64) NULL,
    inpatient_special_grade_antibiotic_cost VARCHAR2(64) NULL,
    total_inpatient_antibiotic_cost VARCHAR2(64) NULL,
    outpatient_antibiotic_cost VARCHAR2(64) NULL,
    inpatient_antibiotic_cost VARCHAR2(64) NULL,
    outpatient_emergency_essential_drug_cost VARCHAR2(64) NULL,
    inpatient_essential_drug_cost VARCHAR2(64) NULL
);
COMMENT ON COLUMN FEE_DERIVED.stat_date IS '统计日期'
COMMENT ON COLUMN FEE_DERIVED.hospital_code IS '院区编码'
COMMENT ON COLUMN FEE_DERIVED.hospital_name IS '院区名称'
COMMENT ON COLUMN FEE_DERIVED.dept_code IS '科室编码'
COMMENT ON COLUMN FEE_DERIVED.dept_name IS '科室名称'
COMMENT ON COLUMN FEE_DERIVED.ward_code IS '病区编码'
COMMENT ON COLUMN FEE_DERIVED.ward_name IS '病区名称'
COMMENT ON COLUMN FEE_DERIVED.outpatient_emergency_drug_revenue IS '门急诊药品收入'
COMMENT ON COLUMN FEE_DERIVED.outpatient_emergency_medical_revenue IS '门急诊医疗收入'
COMMENT ON COLUMN FEE_DERIVED.inpatient_drug_revenue IS '住院药品收入'
COMMENT ON COLUMN FEE_DERIVED.inpatient_medical_revenue IS '住院医疗收入'
COMMENT ON COLUMN FEE_DERIVED.outpatient_emergency_supplies_revenue IS '门急诊卫生材料收入'
COMMENT ON COLUMN FEE_DERIVED.inpatient_supplies_revenue IS '住院卫生材料收入'
COMMENT ON COLUMN FEE_DERIVED.outpatient_drug_revenue IS '门诊药品收入'
COMMENT ON COLUMN FEE_DERIVED.outpatient_emergency_adjuvant_drug_revenue IS '门急诊辅助用药收入'
COMMENT ON COLUMN FEE_DERIVED.inpatient_adjuvant_drug_revenue IS '住院诊辅助用药收入'
COMMENT ON COLUMN FEE_DERIVED.outpatient_emergency_key_monitored_drug_revenue IS '门急诊重点监控药品收入'
COMMENT ON COLUMN FEE_DERIVED.inpatient_key_monitored_drug_revenue IS '住院重点监控药品收入'
COMMENT ON COLUMN FEE_DERIVED.self_pay_drug_revenue IS '自费药品收入'
COMMENT ON COLUMN FEE_DERIVED.total_outpatient_drug_cost IS '门诊就诊患者药品总费用'
COMMENT ON COLUMN FEE_DERIVED.total_emergency_drug_cost IS '急诊就诊患者药品总费用'
COMMENT ON COLUMN FEE_DERIVED.inpatient_special_grade_antibiotic_cost IS '住院患者特殊使用级抗菌药物消耗金额'
COMMENT ON COLUMN FEE_DERIVED.total_inpatient_antibiotic_cost IS '住院患者抗菌药物总消耗金额'
COMMENT ON COLUMN FEE_DERIVED.outpatient_antibiotic_cost IS '门诊抗菌药物费用'
COMMENT ON COLUMN FEE_DERIVED.inpatient_antibiotic_cost IS '住院抗菌药物费用'
COMMENT ON COLUMN FEE_DERIVED.outpatient_emergency_essential_drug_cost IS '门急诊国家基本药物费用'
COMMENT ON COLUMN FEE_DERIVED.inpatient_essential_drug_cost IS '住院国家基本药物费用'
COMMENT ON TABLE FEE_DERIVED IS '费用派生表';


DROP TABLE IF EXISTS REV_DERIVED_AUDIT;
CREATE TABLE REV_DERIVED_AUDIT(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    audited_outpatient_prescriptions_before_charge VARCHAR2(64) NULL,
    audited_emergency_prescriptions_before_charge VARCHAR2(64) NULL,
    audited_inpatient_medication_orders_before_charge VARCHAR2(64) NULL,
    reviewed_outpatient_prescriptions VARCHAR2(64) NULL,
    reviewed_emergency_prescriptions VARCHAR2(64) NULL,
    reviewed_prescriptions_total VARCHAR2(64) NULL,
    reviewed_discharge_records VARCHAR2(64) NULL,
    total_discharge_records VARCHAR2(64) NULL,
    reviewed_discharge_records_key_monitored_drugs VARCHAR2(64) NULL,
    total_discharge_records_key_monitored_drugs VARCHAR2(64) NULL,
    rational_outpatient_prescriptions VARCHAR2(64) NULL,
    rational_emergency_prescriptions VARCHAR2(64) NULL,
    rational_discharge_records VARCHAR2(64) NULL,
    rational_discharge_records_key_monitored_drugs VARCHAR2(64) NULL
);
COMMENT ON COLUMN REV_DERIVED_AUDIT.stat_date IS '统计日期'
COMMENT ON COLUMN REV_DERIVED_AUDIT.hospital_code IS '院区编码'
COMMENT ON COLUMN REV_DERIVED_AUDIT.hospital_name IS '院区名称'
COMMENT ON COLUMN REV_DERIVED_AUDIT.dept_code IS '科室编码'
COMMENT ON COLUMN REV_DERIVED_AUDIT.dept_name IS '科室名称'
COMMENT ON COLUMN REV_DERIVED_AUDIT.ward_code IS '病区编码'
COMMENT ON COLUMN REV_DERIVED_AUDIT.ward_name IS '病区名称'
COMMENT ON COLUMN REV_DERIVED_AUDIT.audited_outpatient_prescriptions_before_charge IS '药品收费前药师审核的门诊处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.audited_emergency_prescriptions_before_charge IS '药品收费前药师审核的急诊处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.audited_inpatient_medication_orders_before_charge IS '收费前审核的住院患者用药医嘱条目数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.reviewed_outpatient_prescriptions IS '实施点评的门诊处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.reviewed_emergency_prescriptions IS '实施点评的急诊处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.reviewed_prescriptions_total IS '实施点评的处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.reviewed_discharge_records IS '实施点评的出院病历数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.total_discharge_records IS '出院病历总数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.reviewed_discharge_records_key_monitored_drugs IS '实施点评的使用重点监控药品的出院病历数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.total_discharge_records_key_monitored_drugs IS '使用重点监控药品的出院病历总数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.rational_outpatient_prescriptions IS '点评为合理的门诊处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.rational_emergency_prescriptions IS '点评为合理的急诊处方数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.rational_discharge_records IS '点评为合理的出院病历数'
COMMENT ON COLUMN REV_DERIVED_AUDIT.rational_discharge_records_key_monitored_drugs IS '点评为合理的使用重点监控合理用药药品的出院病历数'
COMMENT ON TABLE REV_DERIVED_AUDIT IS '审方点评派生表';


DROP TABLE IF EXISTS MDM_DERIVED_STAFF;
CREATE TABLE MDM_DERIVED_STAFF(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    pharmacist_count VARCHAR2(64) NULL,
    clinical_pharmacist_count VARCHAR2(64) NULL,
    physician_count VARCHAR2(64) NULL,
    pharmacy_technicians_count VARCHAR2(64) NULL,
    health_professionals_count VARCHAR2(64) NULL
);
COMMENT ON COLUMN MDM_DERIVED_STAFF.stat_date IS '统计日期'
COMMENT ON COLUMN MDM_DERIVED_STAFF.hospital_code IS '院区编码'
COMMENT ON COLUMN MDM_DERIVED_STAFF.hospital_name IS '院区名称'
COMMENT ON COLUMN MDM_DERIVED_STAFF.dept_code IS '科室编码'
COMMENT ON COLUMN MDM_DERIVED_STAFF.dept_name IS '科室名称'
COMMENT ON COLUMN MDM_DERIVED_STAFF.ward_code IS '病区编码'
COMMENT ON COLUMN MDM_DERIVED_STAFF.ward_name IS '病区名称'
COMMENT ON COLUMN MDM_DERIVED_STAFF.pharmacist_count IS '药师人数'
COMMENT ON COLUMN MDM_DERIVED_STAFF.clinical_pharmacist_count IS '临床药师人数'
COMMENT ON COLUMN MDM_DERIVED_STAFF.physician_count IS '医师人数'
COMMENT ON COLUMN MDM_DERIVED_STAFF.pharmacy_technicians_count IS '药学专业技术人员数'
COMMENT ON COLUMN MDM_DERIVED_STAFF.health_professionals_count IS '卫生专业技术人员数'
COMMENT ON TABLE MDM_DERIVED_STAFF IS '人员派生表';


DROP TABLE IF EXISTS SURG_DERIVED;
CREATE TABLE SURG_DERIVED(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    total_type_i_incision_surgeries VARCHAR2(64) NULL,
    type_1_incision_prophylactic_antibiotic_cases VARCHAR2(64) NULL,
    type_1_incision_iv_antibiotic_leq_24h_cases VARCHAR2(64) NULL,
    type_2_incision_prophylactic_antibiotic_cases VARCHAR2(64) NULL,
    type_2_incision_iv_antibiotic_leq_24h_cases VARCHAR2(64) NULL
);
COMMENT ON COLUMN SURG_DERIVED.stat_date IS '统计日期'
COMMENT ON COLUMN SURG_DERIVED.hospital_code IS '院区编码'
COMMENT ON COLUMN SURG_DERIVED.hospital_name IS '院区名称'
COMMENT ON COLUMN SURG_DERIVED.dept_code IS '科室编码'
COMMENT ON COLUMN SURG_DERIVED.dept_name IS '科室名称'
COMMENT ON COLUMN SURG_DERIVED.ward_code IS '病区编码'
COMMENT ON COLUMN SURG_DERIVED.ward_name IS '病区名称'
COMMENT ON COLUMN SURG_DERIVED.total_type_i_incision_surgeries IS 'Ⅰ类切口手术总台数'
COMMENT ON COLUMN SURG_DERIVED.type_1_incision_prophylactic_antibiotic_cases IS 'Ⅰ类切口手术预防使用抗菌药物台数'
COMMENT ON COLUMN SURG_DERIVED.type_1_incision_iv_antibiotic_leq_24h_cases IS 'Ⅰ类切口手术静脉预防使用抗菌药物时长≤24小时台数'
COMMENT ON COLUMN SURG_DERIVED.type_2_incision_prophylactic_antibiotic_cases IS '2类切口手术预防使用抗菌药物台数'
COMMENT ON COLUMN SURG_DERIVED.type_2_incision_iv_antibiotic_leq_24h_cases IS '2类切口手术静脉预防使用抗菌药物时长≤24小时台数'
COMMENT ON TABLE SURG_DERIVED IS '手术派生表';


DROP TABLE IF EXISTS NUR_DERIVED;
CREATE TABLE NUR_DERIVED(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    emergency_patients_with_iv_infusion VARCHAR2(64) NULL,
    inpatient_patients_with_iv_infusion VARCHAR2(64) NULL,
    non_surgical_inpatients_with_iv_infusion VARCHAR2(64) NULL,
    total_inpatient_infusion_bed_days VARCHAR2(64) NULL,
    total_inpatient_iv_volume_ml VARCHAR2(64) NULL,
    total_inpatient_iv_bags_bottles VARCHAR2(64) NULL,
    total_inpatient_iv_drug_types VARCHAR2(64) NULL,
    total_civs_preparations VARCHAR2(64) NULL,
    total_civs_additive_preparations VARCHAR2(64) NULL,
    civs_intervened_orders VARCHAR2(64) NULL,
    civs_total_reviewed_orders VARCHAR2(64) NULL,
    emergency_patients_with_glucocorticoid_iv VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_DERIVED.stat_date IS '统计日期'
COMMENT ON COLUMN NUR_DERIVED.hospital_code IS '院区编码'
COMMENT ON COLUMN NUR_DERIVED.hospital_name IS '院区名称'
COMMENT ON COLUMN NUR_DERIVED.dept_code IS '科室编码'
COMMENT ON COLUMN NUR_DERIVED.dept_name IS '科室名称'
COMMENT ON COLUMN NUR_DERIVED.ward_code IS '病区编码'
COMMENT ON COLUMN NUR_DERIVED.ward_name IS '病区名称'
COMMENT ON COLUMN NUR_DERIVED.emergency_patients_with_iv_infusion IS '急诊患者静脉输液人数'
COMMENT ON COLUMN NUR_DERIVED.inpatient_patients_with_iv_infusion IS '住院患者静脉输液人数'
COMMENT ON COLUMN NUR_DERIVED.non_surgical_inpatients_with_iv_infusion IS '非手术住院患者静脉输液人数'
COMMENT ON COLUMN NUR_DERIVED.total_inpatient_infusion_bed_days IS '住院患者输液总床日'
COMMENT ON COLUMN NUR_DERIVED.total_inpatient_iv_volume_ml IS '住院患者静脉输液总体积(ml)'
COMMENT ON COLUMN NUR_DERIVED.total_inpatient_iv_bags_bottles IS '住院患者静脉输液总数量(瓶/袋)'
COMMENT ON COLUMN NUR_DERIVED.total_inpatient_iv_drug_types IS '住院患者静脉用药品种总数'
COMMENT ON COLUMN NUR_DERIVED.total_civs_preparations IS '静脉用药集中调配总数量'
COMMENT ON COLUMN NUR_DERIVED.total_civs_additive_preparations IS '静脉用药集中调配加药总数量'
COMMENT ON COLUMN NUR_DERIVED.civs_intervened_orders IS '静脉用药集中调配干预医嘱数'
COMMENT ON COLUMN NUR_DERIVED.civs_total_reviewed_orders IS '静脉用药集中调配总审核医嘱数'
COMMENT ON COLUMN NUR_DERIVED.emergency_patients_with_glucocorticoid_iv IS '急诊患者使用糖皮质激素静脉输液人数'
COMMENT ON TABLE NUR_DERIVED IS '护理派生表';


DROP TABLE IF EXISTS ADR_DERIVED;
CREATE TABLE ADR_DERIVED(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    serious_or_new_adr_reports VARCHAR2(64) NULL,
    total_adr_reports VARCHAR2(64) NULL,
    medication_error_reports VARCHAR2(64) NULL
);
COMMENT ON COLUMN ADR_DERIVED.stat_date IS '统计日期'
COMMENT ON COLUMN ADR_DERIVED.hospital_code IS '院区编码'
COMMENT ON COLUMN ADR_DERIVED.hospital_name IS '院区名称'
COMMENT ON COLUMN ADR_DERIVED.dept_code IS '科室编码'
COMMENT ON COLUMN ADR_DERIVED.dept_name IS '科室名称'
COMMENT ON COLUMN ADR_DERIVED.ward_code IS '病区编码'
COMMENT ON COLUMN ADR_DERIVED.ward_name IS '病区名称'
COMMENT ON COLUMN ADR_DERIVED.serious_or_new_adr_reports IS '严重或新的药品不良反应上报数'
COMMENT ON COLUMN ADR_DERIVED.total_adr_reports IS '药品不良反应总上报数'
COMMENT ON COLUMN ADR_DERIVED.medication_error_reports IS '用药错误报告数'
COMMENT ON TABLE ADR_DERIVED IS '药品不良反应派生表';

