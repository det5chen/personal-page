
DROP TABLE IF EXISTS ENC_EMER_OUTP_VISIT;
CREATE TABLE ENC_EMER_OUTP_VISIT(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    register_type_code VARCHAR2(64) NULL,
    register_type_name VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.stat_date IS '统计日期';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.hospital_code IS '院区编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.hospital_name IS '院区名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.dept_code IS '科室编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.dept_name IS '科室名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.ward_code IS '病区编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.ward_name IS '病区名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.doctor_code IS '医生编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.doctor_name IS '医生名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.register_type_code IS '挂号类别编码';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.register_type_name IS '挂号类别名称';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.register_id IS '挂号id';
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.patient_id IS '患者id';
COMMENT ON TABLE ENC_EMER_OUTP_VISIT IS '门急诊就诊表;就诊域';


DROP TABLE IF EXISTS ENC_INP_VISIT;
CREATE TABLE ENC_INP_VISIT(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    treat_group_code VARCHAR2(64) NULL,
    treat_group_name VARCHAR2(64) NULL,
    adm_route_code VARCHAR2(64) NULL,
    adm_route_name VARCHAR2(64) NULL,
    discharge_way_code VARCHAR2(64) NULL,
    discharge_way_name VARCHAR2(64) NULL,
    surgery_flag VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN ENC_INP_VISIT.stat_date IS '统计日期';
COMMENT ON COLUMN ENC_INP_VISIT.hospital_code IS '院区编码';
COMMENT ON COLUMN ENC_INP_VISIT.hospital_name IS '院区名称';
COMMENT ON COLUMN ENC_INP_VISIT.dept_code IS '科室编码';
COMMENT ON COLUMN ENC_INP_VISIT.dept_name IS '科室名称';
COMMENT ON COLUMN ENC_INP_VISIT.ward_code IS '病区编码';
COMMENT ON COLUMN ENC_INP_VISIT.ward_name IS '病区名称';
COMMENT ON COLUMN ENC_INP_VISIT.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ENC_INP_VISIT.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ENC_INP_VISIT.doctor_code IS '医生编码';
COMMENT ON COLUMN ENC_INP_VISIT.doctor_name IS '医生名称';
COMMENT ON COLUMN ENC_INP_VISIT.treat_group_code IS '医疗组编码';
COMMENT ON COLUMN ENC_INP_VISIT.treat_group_name IS '医疗组名称';
COMMENT ON COLUMN ENC_INP_VISIT.adm_route_code IS '入院途径编码';
COMMENT ON COLUMN ENC_INP_VISIT.adm_route_name IS '入院途径名称';
COMMENT ON COLUMN ENC_INP_VISIT.discharge_way_code IS '出院方式编码';
COMMENT ON COLUMN ENC_INP_VISIT.discharge_way_name IS '出院方式名称';
COMMENT ON COLUMN ENC_INP_VISIT.surgery_flag IS '是否手术';
COMMENT ON COLUMN ENC_INP_VISIT.admission_id IS '入院记录ID';
COMMENT ON COLUMN ENC_INP_VISIT.inp_no IS '住院号';
COMMENT ON COLUMN ENC_INP_VISIT.patient_id IS '患者ID';
COMMENT ON TABLE ENC_INP_VISIT IS '住院就诊表;就诊域';


DROP TABLE IF EXISTS ENC_BED_RECORD;
CREATE TABLE ENC_BED_RECORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    bed_id VARCHAR2(64) NULL,
    bed_code VARCHAR2(64) NULL,
    bed_status_code VARCHAR2(64) NULL,
    bed_status_name VARCHAR2(64) NULL,
    open_flag VARCHAR2(64) NULL,
    occupy_flag VARCHAR2(64) NULL,
    occupy_patient_id VARCHAR2(64) NULL,
    occupy_inp_no VARCHAR2(64) NULL,
    bed_day VARCHAR2(64) NULL,
    open_bed_day VARCHAR2(64) NULL
);
COMMENT ON COLUMN ENC_BED_RECORD.stat_date IS '统计日期';
COMMENT ON COLUMN ENC_BED_RECORD.hospital_code IS '院区编码';
COMMENT ON COLUMN ENC_BED_RECORD.hospital_name IS '院区名称';
COMMENT ON COLUMN ENC_BED_RECORD.dept_code IS '科室编码';
COMMENT ON COLUMN ENC_BED_RECORD.dept_name IS '科室名称';
COMMENT ON COLUMN ENC_BED_RECORD.ward_code IS '病区编码';
COMMENT ON COLUMN ENC_BED_RECORD.ward_name IS '病区名称';
COMMENT ON COLUMN ENC_BED_RECORD.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ENC_BED_RECORD.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ENC_BED_RECORD.bed_id IS '床位ID';
COMMENT ON COLUMN ENC_BED_RECORD.bed_code IS '床位编码';
COMMENT ON COLUMN ENC_BED_RECORD.bed_status_code IS '床位状态编码';
COMMENT ON COLUMN ENC_BED_RECORD.bed_status_name IS '床位状态名称';
COMMENT ON COLUMN ENC_BED_RECORD.open_flag IS '是否开放床位';
COMMENT ON COLUMN ENC_BED_RECORD.occupy_flag IS '是否占床';
COMMENT ON COLUMN ENC_BED_RECORD.occupy_patient_id IS '占床患者ID';
COMMENT ON COLUMN ENC_BED_RECORD.occupy_inp_no IS '占床住院号';
COMMENT ON COLUMN ENC_BED_RECORD.bed_day IS '当日占床天数';
COMMENT ON COLUMN ENC_BED_RECORD.open_bed_day IS '当日开放床日数';
COMMENT ON TABLE ENC_BED_RECORD IS '床位表;就诊域';


DROP TABLE IF EXISTS ORD_RX_OUTP_PRESCRIPTION;
CREATE TABLE ORD_RX_OUTP_PRESCRIPTION(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    presc_type_code VARCHAR2(64) NULL,
    presc_type_name VARCHAR2(64) NULL,
    register_type_code VARCHAR2(64) NULL,
    register_type_name VARCHAR2(64) NULL,
    presc_id VARCHAR2(64) NULL,
    presc_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.stat_date IS '统计日期';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.hospital_code IS '院区编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.hospital_name IS '院区名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.dept_code IS '科室编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.dept_name IS '科室名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.ward_code IS '病区编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.ward_name IS '病区名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.doctor_code IS '医生编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.doctor_name IS '医生名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_type_code IS '处方类别编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_type_name IS '处方类别名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.register_type_code IS '挂号类别编码';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.register_type_name IS '挂号类别名称';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_id IS '处方ID';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_no IS '处方号';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.patient_id IS '患者ID';
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.register_id IS '挂号ID';
COMMENT ON TABLE ORD_RX_OUTP_PRESCRIPTION IS '门急诊处方表;处方医嘱域';


DROP TABLE IF EXISTS ORD_INP_ORDER;
CREATE TABLE ORD_INP_ORDER(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    treat_group_code VARCHAR2(64) NULL,
    treat_group_name VARCHAR2(64) NULL,
    order_type_code VARCHAR2(64) NULL,
    order_type_name VARCHAR2(64) NULL,
    order_id VARCHAR2(64) NULL,
    order_no VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN ORD_INP_ORDER.stat_date IS '统计日期';
COMMENT ON COLUMN ORD_INP_ORDER.hospital_code IS '院区编码';
COMMENT ON COLUMN ORD_INP_ORDER.hospital_name IS '院区名称';
COMMENT ON COLUMN ORD_INP_ORDER.dept_code IS '科室编码';
COMMENT ON COLUMN ORD_INP_ORDER.dept_name IS '科室名称';
COMMENT ON COLUMN ORD_INP_ORDER.ward_code IS '病区编码';
COMMENT ON COLUMN ORD_INP_ORDER.ward_name IS '病区名称';
COMMENT ON COLUMN ORD_INP_ORDER.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ORD_INP_ORDER.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ORD_INP_ORDER.doctor_code IS '医生编码';
COMMENT ON COLUMN ORD_INP_ORDER.doctor_name IS '医生名称';
COMMENT ON COLUMN ORD_INP_ORDER.treat_group_code IS '医疗组编码';
COMMENT ON COLUMN ORD_INP_ORDER.treat_group_name IS '医疗组名称';
COMMENT ON COLUMN ORD_INP_ORDER.order_type_code IS '医嘱类型编码';
COMMENT ON COLUMN ORD_INP_ORDER.order_type_name IS '医嘱类型名称';
COMMENT ON COLUMN ORD_INP_ORDER.order_id IS '医嘱ID';
COMMENT ON COLUMN ORD_INP_ORDER.order_no IS '医嘱号';
COMMENT ON COLUMN ORD_INP_ORDER.admission_id IS '入院记录ID';
COMMENT ON COLUMN ORD_INP_ORDER.inp_no IS '住院号';
COMMENT ON COLUMN ORD_INP_ORDER.patient_id IS '患者ID';
COMMENT ON TABLE ORD_INP_ORDER IS '住院医嘱表;处方医嘱域';


DROP TABLE IF EXISTS ORD_MED_OUTP_USAGE;
CREATE TABLE ORD_MED_OUTP_USAGE(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    drug_code VARCHAR2(64) NULL,
    drug_name VARCHAR2(64) NULL,
    drug_type_code VARCHAR2(64) NULL,
    register_type_code VARCHAR2(64) NULL,
    register_type_name VARCHAR2(64) NULL,
    drug_type_name VARCHAR2(64) NULL,
    dosage_route_code VARCHAR2(64) NULL,
    dosage_route_name VARCHAR2(64) NULL,
    is_basic_drug_flag VARCHAR2(64) NULL,
    presc_id VARCHAR2(64) NULL,
    presc_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL,
    drug_item_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.stat_date IS '统计日期';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.hospital_code IS '院区编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.hospital_name IS '院区名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dept_code IS '科室编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dept_name IS '科室名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.ward_code IS '病区编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.ward_name IS '病区名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.doctor_code IS '医生编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.doctor_name IS '医生名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_code IS '药品编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_name IS '药品名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_type_code IS '药品类型编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.register_type_code IS '挂号类别编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.register_type_name IS '挂号类别名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_type_name IS '药品类型名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dosage_route_code IS '给药途径编码';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dosage_route_name IS '给药途径名称';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.is_basic_drug_flag IS '是否基本药物';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.presc_id IS '处方ID';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.presc_no IS '处方号';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.patient_id IS '患者ID';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.register_id IS '挂号ID';
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_item_id IS '药品明细ID';
COMMENT ON TABLE ORD_MED_OUTP_USAGE IS '门急诊药品使用表;处方医嘱域';


DROP TABLE IF EXISTS ORD_MED_INP_USAGE;
CREATE TABLE ORD_MED_INP_USAGE(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    treat_group_code VARCHAR2(64) NULL,
    treat_group_name VARCHAR2(64) NULL,
    order_type_code VARCHAR2(64) NULL,
    order_type_name VARCHAR2(64) NULL,
    drug_code VARCHAR2(64) NULL,
    drug_name VARCHAR2(64) NULL,
    drug_type_code VARCHAR2(64) NULL,
    drug_type_name VARCHAR2(64) NULL,
    dosage_route_code VARCHAR2(64) NULL,
    dosage_route_name VARCHAR2(64) NULL,
    iv_type_code VARCHAR2(64) NULL,
    iv_type_name VARCHAR2(64) NULL,
    mix_mode_code VARCHAR2(64) NULL,
    mix_mode_name VARCHAR2(64) NULL,
    is_tcm_herb_flag VARCHAR2(64) NULL,
    is_tcm_inj_flag VARCHAR2(64) NULL,
    is_ppi_inj_flag VARCHAR2(64) NULL,
    is_acid_suppress_inj_flag VARCHAR2(64) NULL,
    is_antibacterial_flag VARCHAR2(64) NULL,
    anti_level_code VARCHAR2(64) NULL,
    anti_level_name VARCHAR2(64) NULL,
    is_antibacterial_inj_flag VARCHAR2(64) NULL,
    is_antiemetic_flag VARCHAR2(64) NULL,
    is_pn_flag VARCHAR2(64) NULL,
    is_single_bottle_pn_flag VARCHAR2(64) NULL,
    is_multi_chamber_bag_flag VARCHAR2(64) NULL,
    is_all_in_one_pn_flag VARCHAR2(64) NULL,
    is_basic_drug_flag VARCHAR2(64) NULL,
    surgery_flag VARCHAR2(64) NULL,
    order_id VARCHAR2(64) NULL,
    order_no VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    drug_item_id VARCHAR2(64) NULL,
    ddd_value VARCHAR2(64) NULL
);
COMMENT ON COLUMN ORD_MED_INP_USAGE.stat_date IS '统计日期';
COMMENT ON COLUMN ORD_MED_INP_USAGE.hospital_code IS '院区编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.hospital_name IS '院区名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.dept_code IS '科室编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.dept_name IS '科室名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.ward_code IS '病区编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.ward_name IS '病区名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.doctor_code IS '医生编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.doctor_name IS '医生名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.treat_group_code IS '医疗组编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.treat_group_name IS '医疗组名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_type_code IS '医嘱类型编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_type_name IS '医嘱类型名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_code IS '药品编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_name IS '药品名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_type_code IS '药品类型编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_type_name IS '药品类型名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.dosage_route_code IS '给药途径编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.dosage_route_name IS '给药途径名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.iv_type_code IS '输液类型编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.iv_type_name IS '输液类型名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.mix_mode_code IS '调配方式编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.mix_mode_name IS '调配方式名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_tcm_herb_flag IS '是否中药饮片';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_tcm_inj_flag IS '是否中药注射剂';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_ppi_inj_flag IS '是否PPI注射剂';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_acid_suppress_inj_flag IS '是否抑酸注射剂';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_antibacterial_flag IS '是否抗菌药物';
COMMENT ON COLUMN ORD_MED_INP_USAGE.anti_level_code IS '抗菌药级别编码';
COMMENT ON COLUMN ORD_MED_INP_USAGE.anti_level_name IS '抗菌药级别名称';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_antibacterial_inj_flag IS '是否抗菌药物注射剂';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_antiemetic_flag IS '是否止吐药注射剂';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_pn_flag IS '是否肠外营养';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_single_bottle_pn_flag IS '是否单瓶输注肠外营养';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_multi_chamber_bag_flag IS '是否工业化多腔袋';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_all_in_one_pn_flag IS '是否全合一肠外营养';
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_basic_drug_flag IS '是否基本药物';
COMMENT ON COLUMN ORD_MED_INP_USAGE.surgery_flag IS '是否手术';
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_id IS '医嘱ID';
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_no IS '医嘱号';
COMMENT ON COLUMN ORD_MED_INP_USAGE.admission_id IS '入院记录ID';
COMMENT ON COLUMN ORD_MED_INP_USAGE.inp_no IS '住院号';
COMMENT ON COLUMN ORD_MED_INP_USAGE.patient_id IS '患者ID';
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_item_id IS '药品明细ID';
COMMENT ON COLUMN ORD_MED_INP_USAGE.ddd_value IS '限定日剂量（DDD值）';
COMMENT ON TABLE ORD_MED_INP_USAGE IS '住院药品使用表;处方医嘱域';


DROP TABLE IF EXISTS FEE_OUTP_VISIT;
CREATE TABLE FEE_OUTP_VISIT(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    charge_type_code VARCHAR2(64) NULL,
    charge_type_name VARCHAR2(64) NULL,
    drug_type_code VARCHAR2(64) NULL,
    drug_type_name VARCHAR2(64) NULL,
    is_assist_drug_flag VARCHAR2(64) NULL,
    is_key_monitor_drug_flag VARCHAR2(64) NULL,
    is_self_pay_drug_flag VARCHAR2(64) NULL,
    register_type_code VARCHAR2(64) NULL,
    register_type_name VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    charge_record_id VARCHAR2(64) NULL,
    amount VARCHAR2(64) NULL,
    is_basic_drug_flag VARCHAR2(64) NULL
);
COMMENT ON COLUMN FEE_OUTP_VISIT.stat_date IS '统计日期';
COMMENT ON COLUMN FEE_OUTP_VISIT.hospital_code IS '院区编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.hospital_name IS '院区名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.dept_code IS '科室编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.dept_name IS '科室名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.ward_code IS '病区编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.ward_name IS '病区名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.doctor_code IS '医生编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.doctor_name IS '医生名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.charge_type_code IS '费用类别编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.charge_type_name IS '费用类别名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.drug_type_code IS '药品类型编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.drug_type_name IS '药品类型名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.is_assist_drug_flag IS '是否辅助用药';
COMMENT ON COLUMN FEE_OUTP_VISIT.is_key_monitor_drug_flag IS '是否重点监控药品';
COMMENT ON COLUMN FEE_OUTP_VISIT.is_self_pay_drug_flag IS '是否自费药品';
COMMENT ON COLUMN FEE_OUTP_VISIT.register_type_code IS '挂号类别编码';
COMMENT ON COLUMN FEE_OUTP_VISIT.register_type_name IS '挂号类别名称';
COMMENT ON COLUMN FEE_OUTP_VISIT.register_id IS '挂号ID';
COMMENT ON COLUMN FEE_OUTP_VISIT.patient_id IS '患者ID';
COMMENT ON COLUMN FEE_OUTP_VISIT.charge_record_id IS '费用记录ID';
COMMENT ON COLUMN FEE_OUTP_VISIT.amount IS '费用金额（元）';
COMMENT ON COLUMN FEE_OUTP_VISIT.is_basic_drug_flag IS '是否基本药物（1=是）';
COMMENT ON TABLE FEE_OUTP_VISIT IS '门急诊费用表;费用域';


DROP TABLE IF EXISTS FEE_INP_VISIT;
CREATE TABLE FEE_INP_VISIT(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    treat_group_code VARCHAR2(64) NULL,
    treat_group_name VARCHAR2(64) NULL,
    charge_type_code VARCHAR2(64) NULL,
    charge_type_name VARCHAR2(64) NULL,
    drug_type_code VARCHAR2(64) NULL,
    drug_type_name VARCHAR2(64) NULL,
    anti_level_code VARCHAR2(64) NULL,
    anti_level_name VARCHAR2(64) NULL,
    is_assist_drug_flag VARCHAR2(64) NULL,
    is_key_monitor_drug_flag VARCHAR2(64) NULL,
    is_antibacterial_flag VARCHAR2(64) NULL,
    is_self_pay_drug_flag VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    charge_record_id VARCHAR2(64) NULL,
    amount VARCHAR2(64) NULL,
    is_basic_drug_flag VARCHAR2(64) NULL
);
COMMENT ON COLUMN FEE_INP_VISIT.stat_date IS '统计日期';
COMMENT ON COLUMN FEE_INP_VISIT.hospital_code IS '院区编码';
COMMENT ON COLUMN FEE_INP_VISIT.hospital_name IS '院区名称';
COMMENT ON COLUMN FEE_INP_VISIT.dept_code IS '科室编码';
COMMENT ON COLUMN FEE_INP_VISIT.dept_name IS '科室名称';
COMMENT ON COLUMN FEE_INP_VISIT.ward_code IS '病区编码';
COMMENT ON COLUMN FEE_INP_VISIT.ward_name IS '病区名称';
COMMENT ON COLUMN FEE_INP_VISIT.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN FEE_INP_VISIT.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN FEE_INP_VISIT.doctor_code IS '医生编码';
COMMENT ON COLUMN FEE_INP_VISIT.doctor_name IS '医生名称';
COMMENT ON COLUMN FEE_INP_VISIT.treat_group_code IS '医疗组编码';
COMMENT ON COLUMN FEE_INP_VISIT.treat_group_name IS '医疗组名称';
COMMENT ON COLUMN FEE_INP_VISIT.charge_type_code IS '费用类别编码';
COMMENT ON COLUMN FEE_INP_VISIT.charge_type_name IS '费用类别名称';
COMMENT ON COLUMN FEE_INP_VISIT.drug_type_code IS '药品类型编码';
COMMENT ON COLUMN FEE_INP_VISIT.drug_type_name IS '药品类型名称';
COMMENT ON COLUMN FEE_INP_VISIT.anti_level_code IS '抗菌药级别编码';
COMMENT ON COLUMN FEE_INP_VISIT.anti_level_name IS '抗菌药级别名称';
COMMENT ON COLUMN FEE_INP_VISIT.is_assist_drug_flag IS '是否辅助用药';
COMMENT ON COLUMN FEE_INP_VISIT.is_key_monitor_drug_flag IS '是否重点监控药品';
COMMENT ON COLUMN FEE_INP_VISIT.is_antibacterial_flag IS '是否抗菌药物';
COMMENT ON COLUMN FEE_INP_VISIT.is_self_pay_drug_flag IS '是否自费';
COMMENT ON COLUMN FEE_INP_VISIT.admission_id IS '入院记录ID';
COMMENT ON COLUMN FEE_INP_VISIT.inp_no IS '住院号';
COMMENT ON COLUMN FEE_INP_VISIT.patient_id IS '患者ID';
COMMENT ON COLUMN FEE_INP_VISIT.charge_record_id IS '费用记录ID';
COMMENT ON COLUMN FEE_INP_VISIT.amount IS '费用金额（元）';
COMMENT ON COLUMN FEE_INP_VISIT.is_basic_drug_flag IS '是否基本药物（1=是）';
COMMENT ON TABLE FEE_INP_VISIT IS '住院费用表;费用域';


DROP TABLE IF EXISTS REV_RX_OUTP_AUDIT_REVIEW;
CREATE TABLE REV_RX_OUTP_AUDIT_REVIEW(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    presc_type_code VARCHAR2(64) NULL,
    presc_type_name VARCHAR2(64) NULL,
    review_type_code VARCHAR2(64) NULL,
    review_type_name VARCHAR2(64) NULL,
    review_result_code VARCHAR2(64) NULL,
    review_result_name VARCHAR2(64) NULL,
    pharmacist_code VARCHAR2(64) NULL,
    pharmacist_name VARCHAR2(64) NULL,
    register_type_code VARCHAR2(64) NULL,
    register_type_name VARCHAR2(64) NULL,
    presc_id VARCHAR2(64) NULL,
    presc_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL,
    review_record_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.stat_date IS '统计日期';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.hospital_code IS '院区编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.hospital_name IS '院区名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.dept_code IS '科室编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.dept_name IS '科室名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.ward_code IS '病区编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.ward_name IS '病区名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.doctor_code IS '医生编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.doctor_name IS '医生名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_type_code IS '处方类别编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_type_name IS '处方类别名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_type_code IS '审核点评类型编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_type_name IS '审核点评类型名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_result_code IS '审核点评结果编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_result_name IS '审核点评结果名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.pharmacist_code IS '药师编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.pharmacist_name IS '药师名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.register_type_code IS '挂号类别编码';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.register_type_name IS '挂号类别名称';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_id IS '处方ID';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_no IS '处方号';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.patient_id IS '患者ID';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.register_id IS '挂号ID';
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_record_id IS '审核点评记录ID';
COMMENT ON TABLE REV_RX_OUTP_AUDIT_REVIEW IS '门急诊处方审核点评表;处方点评域';


DROP TABLE IF EXISTS REV_ORD_INP_AUDIT;
CREATE TABLE REV_ORD_INP_AUDIT(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    treat_group_code VARCHAR2(64) NULL,
    treat_group_name VARCHAR2(64) NULL,
    order_type_code VARCHAR2(64) NULL,
    order_type_name VARCHAR2(64) NULL,
    review_type_code VARCHAR2(64) NULL,
    review_type_name VARCHAR2(64) NULL,
    review_result_code VARCHAR2(64) NULL,
    review_result_name VARCHAR2(64) NULL,
    pharmacist_code VARCHAR2(64) NULL,
    pharmacist_name VARCHAR2(64) NULL,
    order_id VARCHAR2(64) NULL,
    order_no VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    review_record_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN REV_ORD_INP_AUDIT.stat_date IS '统计日期';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.hospital_code IS '院区编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.hospital_name IS '院区名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.dept_code IS '科室编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.dept_name IS '科室名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.ward_code IS '病区编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.ward_name IS '病区名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.doctor_code IS '医生编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.doctor_name IS '医生名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.treat_group_code IS '医疗组编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.treat_group_name IS '医疗组名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_type_code IS '医嘱类型编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_type_name IS '医嘱类型名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_type_code IS '审核类型编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_type_name IS '审核类型名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_result_code IS '审核结果编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_result_name IS '审核结果名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.pharmacist_code IS '药师编码';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.pharmacist_name IS '药师名称';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_id IS '医嘱ID';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_no IS '医嘱号';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.admission_id IS '入院记录ID';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.inp_no IS '住院号';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.patient_id IS '患者ID';
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_record_id IS '审核记录ID';
COMMENT ON TABLE REV_ORD_INP_AUDIT IS '住院医嘱审核表;处方点评域';


DROP TABLE IF EXISTS REV_MR_DISCHARGE_REVIEW;
CREATE TABLE REV_MR_DISCHARGE_REVIEW(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    doctor_code VARCHAR2(64) NULL,
    doctor_name VARCHAR2(64) NULL,
    treat_group_code VARCHAR2(64) NULL,
    treat_group_name VARCHAR2(64) NULL,
    discharge_type_code VARCHAR2(64) NULL,
    discharge_type_name VARCHAR2(64) NULL,
    review_result_code VARCHAR2(64) NULL,
    review_result_name VARCHAR2(64) NULL,
    is_key_monitor_drug_flag VARCHAR2(64) NULL,
    pharmacist_code VARCHAR2(64) NULL,
    pharmacist_name VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    discharge_record_id VARCHAR2(64) NULL,
    review_record_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.stat_date IS '统计日期';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.hospital_code IS '院区编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.hospital_name IS '院区名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.dept_code IS '科室编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.dept_name IS '科室名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.ward_code IS '病区编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.ward_name IS '病区名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.doctor_code IS '医生编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.doctor_name IS '医生名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.treat_group_code IS '医疗组编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.treat_group_name IS '医疗组名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.discharge_type_code IS '出院病历类型编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.discharge_type_name IS '出院病历类型名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.review_result_code IS '点评结果编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.review_result_name IS '点评结果名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.is_key_monitor_drug_flag IS '是否使用重点监控药品';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.pharmacist_code IS '药师编码';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.pharmacist_name IS '药师名称';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.admission_id IS '入院记录ID';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.inp_no IS '住院号';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.patient_id IS '患者ID';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.discharge_record_id IS '出院病历记录ID';
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.review_record_id IS '点评记录ID';
COMMENT ON TABLE REV_MR_DISCHARGE_REVIEW IS '出院病历点评表;处方点评域';


DROP TABLE IF EXISTS MDM_STAFF;
CREATE TABLE MDM_STAFF(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    staff_type_code VARCHAR2(64) NULL,
    staff_type_name VARCHAR2(64) NULL,
    qualification_code VARCHAR2(64) NULL,
    qualification_name VARCHAR2(64) NULL,
    position_code VARCHAR2(64) NULL,
    position_name VARCHAR2(64) NULL,
    staff_id VARCHAR2(64) NULL,
    employee_no VARCHAR2(64) NULL
);
COMMENT ON COLUMN MDM_STAFF.stat_date IS '统计日期';
COMMENT ON COLUMN MDM_STAFF.hospital_code IS '院区编码';
COMMENT ON COLUMN MDM_STAFF.hospital_name IS '院区名称';
COMMENT ON COLUMN MDM_STAFF.dept_code IS '科室编码';
COMMENT ON COLUMN MDM_STAFF.dept_name IS '科室名称';
COMMENT ON COLUMN MDM_STAFF.ward_code IS '病区编码';
COMMENT ON COLUMN MDM_STAFF.ward_name IS '病区名称';
COMMENT ON COLUMN MDM_STAFF.staff_type_code IS '人员类别编码';
COMMENT ON COLUMN MDM_STAFF.staff_type_name IS '人员类别名称';
COMMENT ON COLUMN MDM_STAFF.qualification_code IS '资质编码';
COMMENT ON COLUMN MDM_STAFF.qualification_name IS '资质名称';
COMMENT ON COLUMN MDM_STAFF.position_code IS '岗位编码';
COMMENT ON COLUMN MDM_STAFF.position_name IS '岗位名称';
COMMENT ON COLUMN MDM_STAFF.staff_id IS '人员ID';
COMMENT ON COLUMN MDM_STAFF.employee_no IS '工号';
COMMENT ON TABLE MDM_STAFF IS '人员表;主数据域';


DROP TABLE IF EXISTS NUR_INFUSION_INP_RECORD;
CREATE TABLE NUR_INFUSION_INP_RECORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    order_type_code VARCHAR2(64) NULL,
    order_type_name VARCHAR2(64) NULL,
    is_surgery_flag VARCHAR2(64) NULL,
    dosage_route_code VARCHAR2(64) NULL,
    dosage_route_name VARCHAR2(64) NULL,
    is_tcm_inj_flag VARCHAR2(64) NULL,
    is_antibacterial_inj_flag VARCHAR2(64) NULL,
    is_pn_flag VARCHAR2(64) NULL,
    is_single_bottle_pn_flag VARCHAR2(64) NULL,
    is_multi_chamber_bag_flag VARCHAR2(64) NULL,
    is_all_in_one_pn_flag VARCHAR2(64) NULL,
    order_id VARCHAR2(64) NULL,
    order_no VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    inp_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    order_item_id VARCHAR2(64) NULL,
    drug_item_id VARCHAR2(64) NULL,
    bed_id VARCHAR2(64) NULL,
    actual_volume_ml VARCHAR2(64) NULL,
    actual_bag_count VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.stat_date IS '统计日期';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.hospital_code IS '院区编码';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.hospital_name IS '院区名称';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dept_code IS '科室编码';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dept_name IS '科室名称';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.ward_code IS '病区编码';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.ward_name IS '病区名称';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_type_code IS '医嘱类型编码';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_type_name IS '医嘱类型名称';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_surgery_flag IS '是否手术患者';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dosage_route_code IS '给药途径编码';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dosage_route_name IS '给药途径名称';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_tcm_inj_flag IS '是否中药注射剂';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_antibacterial_inj_flag IS '是否抗菌药物注射剂';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_pn_flag IS '是否肠外营养';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_single_bottle_pn_flag IS '是否单瓶输注肠外营养';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_multi_chamber_bag_flag IS '是否工业化多腔袋';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_all_in_one_pn_flag IS '是否全合一肠外营养';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_id IS '医嘱ID';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_no IS '医嘱号';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.admission_id IS '入院记录ID';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.inp_no IS '住院号';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.patient_id IS '患者ID';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_item_id IS '医嘱明细ID';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.drug_item_id IS '药品明细ID';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.bed_id IS '床位id';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.actual_volume_ml IS '单次输液实际体积（毫升）';
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.actual_bag_count IS '单次输液瓶/袋数量';
COMMENT ON TABLE NUR_INFUSION_INP_RECORD IS '住院患者静脉输液记录表;护理域';


DROP TABLE IF EXISTS NUR_INFUSION_OUTP_RECORD;
CREATE TABLE NUR_INFUSION_OUTP_RECORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    register_type_code VARCHAR2(64) NULL,
    register_type_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    dosage_route_code VARCHAR2(64) NULL,
    dosage_route_name VARCHAR2(64) NULL,
    is_tcm_inj_flag VARCHAR2(64) NULL,
    is_antibacterial_inj_flag VARCHAR2(64) NULL,
    is_pn_flag VARCHAR2(64) NULL,
    presc_id VARCHAR2(64) NULL,
    presc_no VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    drug_item_id VARCHAR2(64) NULL,
    is_glucocorticoid_flag VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.stat_date IS '统计日期';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.hospital_code IS '院区编码';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.hospital_name IS '院区名称';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dept_code IS '科室编码';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dept_name IS '科室名称';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.register_type_code IS '挂号类别编码';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.register_type_name IS '挂号类别名称';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dosage_route_code IS '给药途径编码';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dosage_route_name IS '给药途径名称';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_tcm_inj_flag IS '是否中药注射剂';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_antibacterial_inj_flag IS '是否抗菌药物注射剂';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_pn_flag IS '是否肠外营养';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.presc_id IS '处方ID';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.presc_no IS '处方号';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.register_id IS '挂号ID';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.patient_id IS '患者ID';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.drug_item_id IS '处方明细ID';
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_glucocorticoid_flag IS '是否糖皮质激素类药品';
COMMENT ON TABLE NUR_INFUSION_OUTP_RECORD IS '门急诊患者静脉输液记录表;护理域';


DROP TABLE IF EXISTS NUR_IVADMIX_RECORD;
CREATE TABLE NUR_IVADMIX_RECORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    order_type_code VARCHAR2(64) NULL,
    order_type_name VARCHAR2(64) NULL,
    is_iv_audit_flag VARCHAR2(64) NULL,
    is_iv_intervene_flag VARCHAR2(64) NULL,
    is_tcm_inj_flag VARCHAR2(64) NULL,
    is_antibacterial_inj_flag VARCHAR2(64) NULL,
    is_ppi_inj_flag VARCHAR2(64) NULL,
    is_acid_suppress_inj_flag VARCHAR2(64) NULL,
    is_antiemetic_flag VARCHAR2(64) NULL,
    is_pn_flag VARCHAR2(64) NULL,
    is_single_bottle_pn_flag VARCHAR2(64) NULL,
    is_multi_chamber_bag_flag VARCHAR2(64) NULL,
    is_all_in_one_pn_flag VARCHAR2(64) NULL,
    presc_id VARCHAR2(64) NULL,
    order_id VARCHAR2(64) NULL,
    register_id VARCHAR2(64) NULL,
    admission_id VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    drug_item_id VARCHAR2(64) NULL,
    is_additive_flag VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_IVADMIX_RECORD.stat_date IS '统计日期';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.hospital_code IS '院区编码';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.hospital_name IS '院区名称';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.dept_code IS '科室编码';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.dept_name IS '科室名称';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.ward_code IS '病区编码';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.ward_name IS '病区名称';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.order_type_code IS '医嘱类型编码';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.order_type_name IS '医嘱类型名称';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_iv_audit_flag IS '是否审核通过静配';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_iv_intervene_flag IS '是否发生静配干预';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_tcm_inj_flag IS '是否中药注射剂';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_antibacterial_inj_flag IS '是否抗菌药物注射剂';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_ppi_inj_flag IS '是否PPI注射剂';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_acid_suppress_inj_flag IS '是否抑酸注射剂';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_antiemetic_flag IS '是否止吐药';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_pn_flag IS '是否肠外营养';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_single_bottle_pn_flag IS '是否单瓶输注肠外营养';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_multi_chamber_bag_flag IS '是否工业化多腔袋';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_all_in_one_pn_flag IS '是否全合一肠外营养';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.presc_id IS '处方ID';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.order_id IS '医嘱ID';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.register_id IS '挂号ID';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.admission_id IS '入院记录ID';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.patient_id IS '患者ID';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.drug_item_id IS '药品明细ID';
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_additive_flag IS '是否加药配制操作';
COMMENT ON TABLE NUR_IVADMIX_RECORD IS '静配记录表;护理域';


DROP TABLE IF EXISTS ADR_RECORD;
CREATE TABLE ADR_RECORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    ar_report_code VARCHAR2(64) NULL,
    ar_report_name VARCHAR2(64) NULL,
    ar_drug_result_flag VARCHAR2(64) NULL,
    ar_drug_result_name VARCHAR2(64) NULL,
    critical_level_code VARCHAR2(64) NULL,
    critical_level_name VARCHAR2(64) NULL,
    ar_id VARCHAR2(64) NULL,
    report_no VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    treat_ser_no VARCHAR2(64) NULL,
    hosp_no VARCHAR2(64) NULL
);
COMMENT ON COLUMN ADR_RECORD.stat_date IS '统计日期';
COMMENT ON COLUMN ADR_RECORD.hospital_code IS '院区编码';
COMMENT ON COLUMN ADR_RECORD.hospital_name IS '院区名称';
COMMENT ON COLUMN ADR_RECORD.dept_code IS '科室编码';
COMMENT ON COLUMN ADR_RECORD.dept_name IS '科室名称';
COMMENT ON COLUMN ADR_RECORD.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN ADR_RECORD.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN ADR_RECORD.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN ADR_RECORD.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN ADR_RECORD.ar_report_code IS '报告类型代码';
COMMENT ON COLUMN ADR_RECORD.ar_report_name IS '报告类型名称';
COMMENT ON COLUMN ADR_RECORD.ar_drug_result_flag IS '结果代码';
COMMENT ON COLUMN ADR_RECORD.ar_drug_result_name IS '结果名称';
COMMENT ON COLUMN ADR_RECORD.critical_level_code IS '危重等级代码';
COMMENT ON COLUMN ADR_RECORD.critical_level_name IS '危重等级名称';
COMMENT ON COLUMN ADR_RECORD.ar_id IS '药品不良反应主键';
COMMENT ON COLUMN ADR_RECORD.report_no IS '报告编号';
COMMENT ON COLUMN ADR_RECORD.patient_id IS '患者ID';
COMMENT ON COLUMN ADR_RECORD.treat_ser_no IS '就诊流水号';
COMMENT ON COLUMN ADR_RECORD.hosp_no IS '住院号';
COMMENT ON TABLE ADR_RECORD IS '药品不良反应表;不良反应域';


DROP TABLE IF EXISTS SURG_RECORD;
CREATE TABLE SURG_RECORD(
    stat_date VARCHAR2(64) NULL,
    hospital_code VARCHAR2(64) NULL,
    hospital_name VARCHAR2(64) NULL,
    dept_code VARCHAR2(64) NULL,
    dept_name VARCHAR2(64) NULL,
    ward_code VARCHAR2(64) NULL,
    ward_name VARCHAR2(64) NULL,
    patient_type_code VARCHAR2(64) NULL,
    patient_type_name VARCHAR2(64) NULL,
    visit_type_code VARCHAR2(64) NULL,
    visit_type_name VARCHAR2(64) NULL,
    sur_code VARCHAR2(64) NULL,
    sur_name VARCHAR2(64) NULL,
    sur_level_code VARCHAR2(64) NULL,
    sur_level_name VARCHAR2(64) NULL,
    incision_level_code VARCHAR2(64) NULL,
    incision_level_name VARCHAR2(64) NULL,
    emergency_sur_code VARCHAR2(64) NULL,
    anes_method_code VARCHAR2(64) NULL,
    anes_method_name VARCHAR2(64) NULL,
    sur_doctor_code VARCHAR2(64) NULL,
    sur_doctor_name VARCHAR2(64) NULL,
    room_code VARCHAR2(64) NULL,
    room_name VARCHAR2(64) NULL,
    surgery_status VARCHAR2(64) NULL,
    heal_grade_code VARCHAR2(64) NULL,
    heal_grade_name VARCHAR2(64) NULL,
    is_infected VARCHAR2(64) NULL,
    sur_procedure_id VARCHAR2(64) NULL,
    patient_id VARCHAR2(64) NULL,
    treat_ser_no VARCHAR2(64) NULL,
    hosp_no VARCHAR2(64) NULL,
    sur_start_at VARCHAR2(64) NULL,
    sur_end_at VARCHAR2(64) NULL,
    duration_value VARCHAR2(64) NULL,
    blood_tran_amount VARCHAR2(64) NULL,
    implant_amount VARCHAR2(64) NULL,
    antibiotic_duration_hours VARCHAR2(64) NULL
);
COMMENT ON COLUMN SURG_RECORD.stat_date IS '统计日期';
COMMENT ON COLUMN SURG_RECORD.hospital_code IS '院区编码';
COMMENT ON COLUMN SURG_RECORD.hospital_name IS '院区名称';
COMMENT ON COLUMN SURG_RECORD.dept_code IS '科室编码';
COMMENT ON COLUMN SURG_RECORD.dept_name IS '科室名称';
COMMENT ON COLUMN SURG_RECORD.ward_code IS '病区编码';
COMMENT ON COLUMN SURG_RECORD.ward_name IS '病区名称';
COMMENT ON COLUMN SURG_RECORD.patient_type_code IS '患者类型编码';
COMMENT ON COLUMN SURG_RECORD.patient_type_name IS '患者类型名称';
COMMENT ON COLUMN SURG_RECORD.visit_type_code IS '就诊类型编码';
COMMENT ON COLUMN SURG_RECORD.visit_type_name IS '就诊类型名称';
COMMENT ON COLUMN SURG_RECORD.sur_code IS '手术及操作编码（ICD9）';
COMMENT ON COLUMN SURG_RECORD.sur_name IS '手术及操作名称';
COMMENT ON COLUMN SURG_RECORD.sur_level_code IS '手术级别代码';
COMMENT ON COLUMN SURG_RECORD.sur_level_name IS '手术级别名称';
COMMENT ON COLUMN SURG_RECORD.incision_level_code IS '切口等级代码';
COMMENT ON COLUMN SURG_RECORD.incision_level_name IS '切口等级名称';
COMMENT ON COLUMN SURG_RECORD.emergency_sur_code IS '是否紧急手术';
COMMENT ON COLUMN SURG_RECORD.anes_method_code IS '麻醉方法代码';
COMMENT ON COLUMN SURG_RECORD.anes_method_name IS '麻醉方法名称';
COMMENT ON COLUMN SURG_RECORD.sur_doctor_code IS '主刀医生工号';
COMMENT ON COLUMN SURG_RECORD.sur_doctor_name IS '主刀医生姓名';
COMMENT ON COLUMN SURG_RECORD.room_code IS '手术室代码';
COMMENT ON COLUMN SURG_RECORD.room_name IS '手术室名称';
COMMENT ON COLUMN SURG_RECORD.surgery_status IS '手术状态';
COMMENT ON COLUMN SURG_RECORD.heal_grade_code IS '愈合等级代码';
COMMENT ON COLUMN SURG_RECORD.heal_grade_name IS '愈合等级名称';
COMMENT ON COLUMN SURG_RECORD.is_infected IS '是否感染';
COMMENT ON COLUMN SURG_RECORD.sur_procedure_id IS '手术及操作流水号';
COMMENT ON COLUMN SURG_RECORD.patient_id IS '患者ID';
COMMENT ON COLUMN SURG_RECORD.treat_ser_no IS '就诊流水号';
COMMENT ON COLUMN SURG_RECORD.hosp_no IS '住院号';
COMMENT ON COLUMN SURG_RECORD.sur_start_at IS '手术开始时间';
COMMENT ON COLUMN SURG_RECORD.sur_end_at IS '手术结束时间';
COMMENT ON COLUMN SURG_RECORD.duration_value IS '手术时长（分钟）';
COMMENT ON COLUMN SURG_RECORD.blood_tran_amount IS '用血量（ml）';
COMMENT ON COLUMN SURG_RECORD.implant_amount IS '植入物费用';
COMMENT ON COLUMN SURG_RECORD.antibiotic_duration_hours IS '抗菌药物使用时长（小时）';
COMMENT ON TABLE SURG_RECORD IS '手术记录表;手术用药域';

