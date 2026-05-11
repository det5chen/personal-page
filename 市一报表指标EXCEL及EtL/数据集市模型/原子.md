
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
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.stat_date IS '统计日期'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.hospital_code IS '院区编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.hospital_name IS '院区名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.dept_code IS '科室编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.dept_name IS '科室名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.ward_code IS '病区编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.ward_name IS '病区名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.doctor_code IS '医生编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.doctor_name IS '医生名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.register_type_code IS '挂号类别编码'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.register_type_name IS '挂号类别名称'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.register_id IS '挂号id'
COMMENT ON COLUMN ENC_EMER_OUTP_VISIT.patient_id IS '患者id'
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
COMMENT ON COLUMN ENC_INP_VISIT.stat_date IS '统计日期'
COMMENT ON COLUMN ENC_INP_VISIT.hospital_code IS '院区编码'
COMMENT ON COLUMN ENC_INP_VISIT.hospital_name IS '院区名称'
COMMENT ON COLUMN ENC_INP_VISIT.dept_code IS '科室编码'
COMMENT ON COLUMN ENC_INP_VISIT.dept_name IS '科室名称'
COMMENT ON COLUMN ENC_INP_VISIT.ward_code IS '病区编码'
COMMENT ON COLUMN ENC_INP_VISIT.ward_name IS '病区名称'
COMMENT ON COLUMN ENC_INP_VISIT.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ENC_INP_VISIT.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ENC_INP_VISIT.doctor_code IS '医生编码'
COMMENT ON COLUMN ENC_INP_VISIT.doctor_name IS '医生名称'
COMMENT ON COLUMN ENC_INP_VISIT.treat_group_code IS '医疗组编码'
COMMENT ON COLUMN ENC_INP_VISIT.treat_group_name IS '医疗组名称'
COMMENT ON COLUMN ENC_INP_VISIT.adm_route_code IS '入院途径编码'
COMMENT ON COLUMN ENC_INP_VISIT.adm_route_name IS '入院途径名称'
COMMENT ON COLUMN ENC_INP_VISIT.discharge_way_code IS '出院方式编码'
COMMENT ON COLUMN ENC_INP_VISIT.discharge_way_name IS '出院方式名称'
COMMENT ON COLUMN ENC_INP_VISIT.surgery_flag IS '是否手术'
COMMENT ON COLUMN ENC_INP_VISIT.admission_id IS '入院记录ID'
COMMENT ON COLUMN ENC_INP_VISIT.inp_no IS '住院号'
COMMENT ON COLUMN ENC_INP_VISIT.patient_id IS '患者ID'
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
COMMENT ON COLUMN ENC_BED_RECORD.stat_date IS '统计日期'
COMMENT ON COLUMN ENC_BED_RECORD.hospital_code IS '院区编码'
COMMENT ON COLUMN ENC_BED_RECORD.hospital_name IS '院区名称'
COMMENT ON COLUMN ENC_BED_RECORD.dept_code IS '科室编码'
COMMENT ON COLUMN ENC_BED_RECORD.dept_name IS '科室名称'
COMMENT ON COLUMN ENC_BED_RECORD.ward_code IS '病区编码'
COMMENT ON COLUMN ENC_BED_RECORD.ward_name IS '病区名称'
COMMENT ON COLUMN ENC_BED_RECORD.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ENC_BED_RECORD.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ENC_BED_RECORD.bed_id IS '床位ID'
COMMENT ON COLUMN ENC_BED_RECORD.bed_code IS '床位编码'
COMMENT ON COLUMN ENC_BED_RECORD.bed_status_code IS '床位状态编码'
COMMENT ON COLUMN ENC_BED_RECORD.bed_status_name IS '床位状态名称'
COMMENT ON COLUMN ENC_BED_RECORD.open_flag IS '是否开放床位'
COMMENT ON COLUMN ENC_BED_RECORD.occupy_flag IS '是否占床'
COMMENT ON COLUMN ENC_BED_RECORD.occupy_patient_id IS '占床患者ID'
COMMENT ON COLUMN ENC_BED_RECORD.occupy_inp_no IS '占床住院号'
COMMENT ON COLUMN ENC_BED_RECORD.bed_day IS '当日占床天数'
COMMENT ON COLUMN ENC_BED_RECORD.open_bed_day IS '当日开放床日数'
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
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.stat_date IS '统计日期'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.hospital_code IS '院区编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.hospital_name IS '院区名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.dept_code IS '科室编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.dept_name IS '科室名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.ward_code IS '病区编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.ward_name IS '病区名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.doctor_code IS '医生编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.doctor_name IS '医生名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_type_code IS '处方类别编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_type_name IS '处方类别名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.register_type_code IS '挂号类别编码'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.register_type_name IS '挂号类别名称'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_id IS '处方ID'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.presc_no IS '处方号'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.patient_id IS '患者ID'
COMMENT ON COLUMN ORD_RX_OUTP_PRESCRIPTION.register_id IS '挂号ID'
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
COMMENT ON COLUMN ORD_INP_ORDER.stat_date IS '统计日期'
COMMENT ON COLUMN ORD_INP_ORDER.hospital_code IS '院区编码'
COMMENT ON COLUMN ORD_INP_ORDER.hospital_name IS '院区名称'
COMMENT ON COLUMN ORD_INP_ORDER.dept_code IS '科室编码'
COMMENT ON COLUMN ORD_INP_ORDER.dept_name IS '科室名称'
COMMENT ON COLUMN ORD_INP_ORDER.ward_code IS '病区编码'
COMMENT ON COLUMN ORD_INP_ORDER.ward_name IS '病区名称'
COMMENT ON COLUMN ORD_INP_ORDER.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ORD_INP_ORDER.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ORD_INP_ORDER.doctor_code IS '医生编码'
COMMENT ON COLUMN ORD_INP_ORDER.doctor_name IS '医生名称'
COMMENT ON COLUMN ORD_INP_ORDER.treat_group_code IS '医疗组编码'
COMMENT ON COLUMN ORD_INP_ORDER.treat_group_name IS '医疗组名称'
COMMENT ON COLUMN ORD_INP_ORDER.order_type_code IS '医嘱类型编码'
COMMENT ON COLUMN ORD_INP_ORDER.order_type_name IS '医嘱类型名称'
COMMENT ON COLUMN ORD_INP_ORDER.order_id IS '医嘱ID'
COMMENT ON COLUMN ORD_INP_ORDER.order_no IS '医嘱号'
COMMENT ON COLUMN ORD_INP_ORDER.admission_id IS '入院记录ID'
COMMENT ON COLUMN ORD_INP_ORDER.inp_no IS '住院号'
COMMENT ON COLUMN ORD_INP_ORDER.patient_id IS '患者ID'
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
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.stat_date IS '统计日期'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.hospital_code IS '院区编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.hospital_name IS '院区名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dept_code IS '科室编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dept_name IS '科室名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.ward_code IS '病区编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.ward_name IS '病区名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.doctor_code IS '医生编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.doctor_name IS '医生名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_code IS '药品编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_name IS '药品名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_type_code IS '药品类型编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.register_type_code IS '挂号类别编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.register_type_name IS '挂号类别名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_type_name IS '药品类型名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dosage_route_code IS '给药途径编码'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.dosage_route_name IS '给药途径名称'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.is_basic_drug_flag IS '是否基本药物'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.presc_id IS '处方ID'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.presc_no IS '处方号'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.patient_id IS '患者ID'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.register_id IS '挂号ID'
COMMENT ON COLUMN ORD_MED_OUTP_USAGE.drug_item_id IS '药品明细ID'
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
    drug_item_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN ORD_MED_INP_USAGE.stat_date IS '统计日期'
COMMENT ON COLUMN ORD_MED_INP_USAGE.hospital_code IS '院区编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.hospital_name IS '院区名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.dept_code IS '科室编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.dept_name IS '科室名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.ward_code IS '病区编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.ward_name IS '病区名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.doctor_code IS '医生编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.doctor_name IS '医生名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.treat_group_code IS '医疗组编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.treat_group_name IS '医疗组名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_type_code IS '医嘱类型编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_type_name IS '医嘱类型名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_code IS '药品编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_name IS '药品名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_type_code IS '药品类型编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_type_name IS '药品类型名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.dosage_route_code IS '给药途径编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.dosage_route_name IS '给药途径名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.iv_type_code IS '输液类型编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.iv_type_name IS '输液类型名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.mix_mode_code IS '调配方式编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.mix_mode_name IS '调配方式名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_tcm_herb_flag IS '是否中药饮片'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_tcm_inj_flag IS '是否中药注射剂'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_ppi_inj_flag IS '是否PPI注射剂'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_acid_suppress_inj_flag IS '是否抑酸注射剂'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_antibacterial_flag IS '是否抗菌药物'
COMMENT ON COLUMN ORD_MED_INP_USAGE.anti_level_code IS '抗菌药级别编码'
COMMENT ON COLUMN ORD_MED_INP_USAGE.anti_level_name IS '抗菌药级别名称'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_antibacterial_inj_flag IS '是否抗菌药物注射剂'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_antiemetic_flag IS '是否止吐药注射剂'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_pn_flag IS '是否肠外营养'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_single_bottle_pn_flag IS '是否单瓶输注肠外营养'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_multi_chamber_bag_flag IS '是否工业化多腔袋'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_all_in_one_pn_flag IS '是否全合一肠外营养'
COMMENT ON COLUMN ORD_MED_INP_USAGE.is_basic_drug_flag IS '是否基本药物'
COMMENT ON COLUMN ORD_MED_INP_USAGE.surgery_flag IS '是否手术'
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_id IS '医嘱ID'
COMMENT ON COLUMN ORD_MED_INP_USAGE.order_no IS '医嘱号'
COMMENT ON COLUMN ORD_MED_INP_USAGE.admission_id IS '入院记录ID'
COMMENT ON COLUMN ORD_MED_INP_USAGE.inp_no IS '住院号'
COMMENT ON COLUMN ORD_MED_INP_USAGE.patient_id IS '患者ID'
COMMENT ON COLUMN ORD_MED_INP_USAGE.drug_item_id IS '药品明细ID'
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
    charge_record_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN FEE_OUTP_VISIT.stat_date IS '统计日期'
COMMENT ON COLUMN FEE_OUTP_VISIT.hospital_code IS '院区编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.hospital_name IS '院区名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.dept_code IS '科室编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.dept_name IS '科室名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.ward_code IS '病区编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.ward_name IS '病区名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.doctor_code IS '医生编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.doctor_name IS '医生名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.charge_type_code IS '费用类别编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.charge_type_name IS '费用类别名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.drug_type_code IS '药品类型编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.drug_type_name IS '药品类型名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.is_assist_drug_flag IS '是否辅助用药'
COMMENT ON COLUMN FEE_OUTP_VISIT.is_key_monitor_drug_flag IS '是否重点监控药品'
COMMENT ON COLUMN FEE_OUTP_VISIT.is_self_pay_drug_flag IS '是否自费药品'
COMMENT ON COLUMN FEE_OUTP_VISIT.register_type_code IS '挂号类别编码'
COMMENT ON COLUMN FEE_OUTP_VISIT.register_type_name IS '挂号类别名称'
COMMENT ON COLUMN FEE_OUTP_VISIT.register_id IS '挂号ID'
COMMENT ON COLUMN FEE_OUTP_VISIT.patient_id IS '患者ID'
COMMENT ON COLUMN FEE_OUTP_VISIT.charge_record_id IS '费用记录ID'
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
    charge_record_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN FEE_INP_VISIT.stat_date IS '统计日期'
COMMENT ON COLUMN FEE_INP_VISIT.hospital_code IS '院区编码'
COMMENT ON COLUMN FEE_INP_VISIT.hospital_name IS '院区名称'
COMMENT ON COLUMN FEE_INP_VISIT.dept_code IS '科室编码'
COMMENT ON COLUMN FEE_INP_VISIT.dept_name IS '科室名称'
COMMENT ON COLUMN FEE_INP_VISIT.ward_code IS '病区编码'
COMMENT ON COLUMN FEE_INP_VISIT.ward_name IS '病区名称'
COMMENT ON COLUMN FEE_INP_VISIT.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN FEE_INP_VISIT.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN FEE_INP_VISIT.doctor_code IS '医生编码'
COMMENT ON COLUMN FEE_INP_VISIT.doctor_name IS '医生名称'
COMMENT ON COLUMN FEE_INP_VISIT.treat_group_code IS '医疗组编码'
COMMENT ON COLUMN FEE_INP_VISIT.treat_group_name IS '医疗组名称'
COMMENT ON COLUMN FEE_INP_VISIT.charge_type_code IS '费用类别编码'
COMMENT ON COLUMN FEE_INP_VISIT.charge_type_name IS '费用类别名称'
COMMENT ON COLUMN FEE_INP_VISIT.drug_type_code IS '药品类型编码'
COMMENT ON COLUMN FEE_INP_VISIT.drug_type_name IS '药品类型名称'
COMMENT ON COLUMN FEE_INP_VISIT.anti_level_code IS '抗菌药级别编码'
COMMENT ON COLUMN FEE_INP_VISIT.anti_level_name IS '抗菌药级别名称'
COMMENT ON COLUMN FEE_INP_VISIT.is_assist_drug_flag IS '是否辅助用药'
COMMENT ON COLUMN FEE_INP_VISIT.is_key_monitor_drug_flag IS '是否重点监控药品'
COMMENT ON COLUMN FEE_INP_VISIT.is_antibacterial_flag IS '是否抗菌药物'
COMMENT ON COLUMN FEE_INP_VISIT.is_self_pay_drug_flag IS '是否自费'
COMMENT ON COLUMN FEE_INP_VISIT.admission_id IS '入院记录ID'
COMMENT ON COLUMN FEE_INP_VISIT.inp_no IS '住院号'
COMMENT ON COLUMN FEE_INP_VISIT.patient_id IS '患者ID'
COMMENT ON COLUMN FEE_INP_VISIT.charge_record_id IS '费用记录ID'
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
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.stat_date IS '统计日期'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.hospital_code IS '院区编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.hospital_name IS '院区名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.dept_code IS '科室编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.dept_name IS '科室名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.ward_code IS '病区编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.ward_name IS '病区名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.doctor_code IS '医生编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.doctor_name IS '医生名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_type_code IS '处方类别编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_type_name IS '处方类别名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_type_code IS '审核点评类型编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_type_name IS '审核点评类型名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_result_code IS '审核点评结果编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_result_name IS '审核点评结果名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.pharmacist_code IS '药师编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.pharmacist_name IS '药师名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.register_type_code IS '挂号类别编码'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.register_type_name IS '挂号类别名称'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_id IS '处方ID'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.presc_no IS '处方号'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.patient_id IS '患者ID'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.register_id IS '挂号ID'
COMMENT ON COLUMN REV_RX_OUTP_AUDIT_REVIEW.review_record_id IS '审核点评记录ID'
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
COMMENT ON COLUMN REV_ORD_INP_AUDIT.stat_date IS '统计日期'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.hospital_code IS '院区编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.hospital_name IS '院区名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.dept_code IS '科室编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.dept_name IS '科室名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.ward_code IS '病区编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.ward_name IS '病区名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.doctor_code IS '医生编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.doctor_name IS '医生名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.treat_group_code IS '医疗组编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.treat_group_name IS '医疗组名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_type_code IS '医嘱类型编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_type_name IS '医嘱类型名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_type_code IS '审核类型编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_type_name IS '审核类型名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_result_code IS '审核结果编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_result_name IS '审核结果名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.pharmacist_code IS '药师编码'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.pharmacist_name IS '药师名称'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_id IS '医嘱ID'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.order_no IS '医嘱号'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.admission_id IS '入院记录ID'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.inp_no IS '住院号'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.patient_id IS '患者ID'
COMMENT ON COLUMN REV_ORD_INP_AUDIT.review_record_id IS '审核记录ID'
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
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.stat_date IS '统计日期'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.hospital_code IS '院区编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.hospital_name IS '院区名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.dept_code IS '科室编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.dept_name IS '科室名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.ward_code IS '病区编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.ward_name IS '病区名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.doctor_code IS '医生编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.doctor_name IS '医生名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.treat_group_code IS '医疗组编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.treat_group_name IS '医疗组名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.discharge_type_code IS '出院病历类型编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.discharge_type_name IS '出院病历类型名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.review_result_code IS '点评结果编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.review_result_name IS '点评结果名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.is_key_monitor_drug_flag IS '是否使用重点监控药品'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.pharmacist_code IS '药师编码'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.pharmacist_name IS '药师名称'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.admission_id IS '入院记录ID'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.inp_no IS '住院号'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.patient_id IS '患者ID'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.discharge_record_id IS '出院病历记录ID'
COMMENT ON COLUMN REV_MR_DISCHARGE_REVIEW.review_record_id IS '点评记录ID'
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
COMMENT ON COLUMN MDM_STAFF.stat_date IS '统计日期'
COMMENT ON COLUMN MDM_STAFF.hospital_code IS '院区编码'
COMMENT ON COLUMN MDM_STAFF.hospital_name IS '院区名称'
COMMENT ON COLUMN MDM_STAFF.dept_code IS '科室编码'
COMMENT ON COLUMN MDM_STAFF.dept_name IS '科室名称'
COMMENT ON COLUMN MDM_STAFF.ward_code IS '病区编码'
COMMENT ON COLUMN MDM_STAFF.ward_name IS '病区名称'
COMMENT ON COLUMN MDM_STAFF.staff_type_code IS '人员类别编码'
COMMENT ON COLUMN MDM_STAFF.staff_type_name IS '人员类别名称'
COMMENT ON COLUMN MDM_STAFF.qualification_code IS '资质编码'
COMMENT ON COLUMN MDM_STAFF.qualification_name IS '资质名称'
COMMENT ON COLUMN MDM_STAFF.position_code IS '岗位编码'
COMMENT ON COLUMN MDM_STAFF.position_name IS '岗位名称'
COMMENT ON COLUMN MDM_STAFF.staff_id IS '人员ID'
COMMENT ON COLUMN MDM_STAFF.employee_no IS '工号'
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
    bed_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.stat_date IS '统计日期'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.hospital_code IS '院区编码'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.hospital_name IS '院区名称'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dept_code IS '科室编码'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dept_name IS '科室名称'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.ward_code IS '病区编码'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.ward_name IS '病区名称'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_type_code IS '医嘱类型编码'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_type_name IS '医嘱类型名称'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_surgery_flag IS '是否手术患者'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dosage_route_code IS '给药途径编码'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.dosage_route_name IS '给药途径名称'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_tcm_inj_flag IS '是否中药注射剂'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_antibacterial_inj_flag IS '是否抗菌药物注射剂'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_pn_flag IS '是否肠外营养'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_single_bottle_pn_flag IS '是否单瓶输注肠外营养'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_multi_chamber_bag_flag IS '是否工业化多腔袋'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.is_all_in_one_pn_flag IS '是否全合一肠外营养'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_id IS '医嘱ID'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_no IS '医嘱号'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.admission_id IS '入院记录ID'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.inp_no IS '住院号'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.patient_id IS '患者ID'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.order_item_id IS '医嘱明细ID'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.drug_item_id IS '药品明细ID'
COMMENT ON COLUMN NUR_INFUSION_INP_RECORD.bed_id IS '床位id'
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
    drug_item_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.stat_date IS '统计日期'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.hospital_code IS '院区编码'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.hospital_name IS '院区名称'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dept_code IS '科室编码'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dept_name IS '科室名称'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.register_type_code IS '挂号类别编码'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.register_type_name IS '挂号类别名称'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dosage_route_code IS '给药途径编码'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.dosage_route_name IS '给药途径名称'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_tcm_inj_flag IS '是否中药注射剂'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_antibacterial_inj_flag IS '是否抗菌药物注射剂'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.is_pn_flag IS '是否肠外营养'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.presc_id IS '处方ID'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.presc_no IS '处方号'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.register_id IS '挂号ID'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.patient_id IS '患者ID'
COMMENT ON COLUMN NUR_INFUSION_OUTP_RECORD.drug_item_id IS '处方明细ID'
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
    drug_item_id VARCHAR2(64) NULL
);
COMMENT ON COLUMN NUR_IVADMIX_RECORD.stat_date IS '统计日期'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.hospital_code IS '院区编码'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.hospital_name IS '院区名称'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.dept_code IS '科室编码'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.dept_name IS '科室名称'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.ward_code IS '病区编码'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.ward_name IS '病区名称'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.order_type_code IS '医嘱类型编码'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.order_type_name IS '医嘱类型名称'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_iv_audit_flag IS '是否审核通过静配'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_iv_intervene_flag IS '是否发生静配干预'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_tcm_inj_flag IS '是否中药注射剂'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_antibacterial_inj_flag IS '是否抗菌药物注射剂'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_ppi_inj_flag IS '是否PPI注射剂'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_acid_suppress_inj_flag IS '是否抑酸注射剂'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_antiemetic_flag IS '是否止吐药'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_pn_flag IS '是否肠外营养'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_single_bottle_pn_flag IS '是否单瓶输注肠外营养'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_multi_chamber_bag_flag IS '是否工业化多腔袋'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.is_all_in_one_pn_flag IS '是否全合一肠外营养'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.presc_id IS '处方ID'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.order_id IS '医嘱ID'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.register_id IS '挂号ID'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.admission_id IS '入院记录ID'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.patient_id IS '患者ID'
COMMENT ON COLUMN NUR_IVADMIX_RECORD.drug_item_id IS '药品明细ID'
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
COMMENT ON COLUMN ADR_RECORD.stat_date IS '统计日期'
COMMENT ON COLUMN ADR_RECORD.hospital_code IS '院区编码'
COMMENT ON COLUMN ADR_RECORD.hospital_name IS '院区名称'
COMMENT ON COLUMN ADR_RECORD.dept_code IS '科室编码'
COMMENT ON COLUMN ADR_RECORD.dept_name IS '科室名称'
COMMENT ON COLUMN ADR_RECORD.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN ADR_RECORD.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN ADR_RECORD.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN ADR_RECORD.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN ADR_RECORD.ar_report_code IS '报告类型代码'
COMMENT ON COLUMN ADR_RECORD.ar_report_name IS '报告类型名称'
COMMENT ON COLUMN ADR_RECORD.ar_drug_result_flag IS '结果代码'
COMMENT ON COLUMN ADR_RECORD.ar_drug_result_name IS '结果名称'
COMMENT ON COLUMN ADR_RECORD.critical_level_code IS '危重等级代码'
COMMENT ON COLUMN ADR_RECORD.critical_level_name IS '危重等级名称'
COMMENT ON COLUMN ADR_RECORD.ar_id IS '药品不良反应主键'
COMMENT ON COLUMN ADR_RECORD.report_no IS '报告编号'
COMMENT ON COLUMN ADR_RECORD.patient_id IS '患者ID'
COMMENT ON COLUMN ADR_RECORD.treat_ser_no IS '就诊流水号'
COMMENT ON COLUMN ADR_RECORD.hosp_no IS '住院号'
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
    implant_amount VARCHAR2(64) NULL
);
COMMENT ON COLUMN SURG_RECORD.stat_date IS '统计日期'
COMMENT ON COLUMN SURG_RECORD.hospital_code IS '院区编码'
COMMENT ON COLUMN SURG_RECORD.hospital_name IS '院区名称'
COMMENT ON COLUMN SURG_RECORD.dept_code IS '科室编码'
COMMENT ON COLUMN SURG_RECORD.dept_name IS '科室名称'
COMMENT ON COLUMN SURG_RECORD.ward_code IS '病区编码'
COMMENT ON COLUMN SURG_RECORD.ward_name IS '病区名称'
COMMENT ON COLUMN SURG_RECORD.patient_type_code IS '患者类型编码'
COMMENT ON COLUMN SURG_RECORD.patient_type_name IS '患者类型名称'
COMMENT ON COLUMN SURG_RECORD.visit_type_code IS '就诊类型编码'
COMMENT ON COLUMN SURG_RECORD.visit_type_name IS '就诊类型名称'
COMMENT ON COLUMN SURG_RECORD.sur_code IS '手术及操作编码（ICD9）'
COMMENT ON COLUMN SURG_RECORD.sur_name IS '手术及操作名称'
COMMENT ON COLUMN SURG_RECORD.sur_level_code IS '手术级别代码'
COMMENT ON COLUMN SURG_RECORD.sur_level_name IS '手术级别名称'
COMMENT ON COLUMN SURG_RECORD.incision_level_code IS '切口等级代码'
COMMENT ON COLUMN SURG_RECORD.incision_level_name IS '切口等级名称'
COMMENT ON COLUMN SURG_RECORD.emergency_sur_code IS '是否紧急手术'
COMMENT ON COLUMN SURG_RECORD.anes_method_code IS '麻醉方法代码'
COMMENT ON COLUMN SURG_RECORD.anes_method_name IS '麻醉方法名称'
COMMENT ON COLUMN SURG_RECORD.sur_doctor_code IS '主刀医生工号'
COMMENT ON COLUMN SURG_RECORD.sur_doctor_name IS '主刀医生姓名'
COMMENT ON COLUMN SURG_RECORD.room_code IS '手术室代码'
COMMENT ON COLUMN SURG_RECORD.room_name IS '手术室名称'
COMMENT ON COLUMN SURG_RECORD.surgery_status IS '手术状态'
COMMENT ON COLUMN SURG_RECORD.heal_grade_code IS '愈合等级代码'
COMMENT ON COLUMN SURG_RECORD.heal_grade_name IS '愈合等级名称'
COMMENT ON COLUMN SURG_RECORD.is_infected IS '是否感染'
COMMENT ON COLUMN SURG_RECORD.sur_procedure_id IS '手术及操作流水号'
COMMENT ON COLUMN SURG_RECORD.patient_id IS '患者ID'
COMMENT ON COLUMN SURG_RECORD.treat_ser_no IS '就诊流水号'
COMMENT ON COLUMN SURG_RECORD.hosp_no IS '住院号'
COMMENT ON COLUMN SURG_RECORD.sur_start_at IS '手术开始时间'
COMMENT ON COLUMN SURG_RECORD.sur_end_at IS '手术结束时间'
COMMENT ON COLUMN SURG_RECORD.duration_value IS '手术时长（分钟）'
COMMENT ON COLUMN SURG_RECORD.blood_tran_amount IS '用血量（ml）'
COMMENT ON COLUMN SURG_RECORD.implant_amount IS '植入物费用'
COMMENT ON TABLE SURG_RECORD IS '手术记录表;手术用药域';

---
---

# 市一医院 — 就诊主题指标体系设计

> 基于就诊域3张原子表（`ENC_EMER_OUTP_VISIT`、`ENC_INP_VISIT`、`ENC_BED_RECORD`），定义 **原子指标 → 派生指标 → 复合指标** 的完整口径与加工逻辑。

---

## 一、指标体系架构

```
原子表 (3张)               原子指标(度量)             派生宽表                  复合指标
───────────────────────────────────────────────────────────────────────────────────
ENC_EMER_OUTP_VISIT  ───→ A01~A05(门急诊)    ┐
ENC_INP_VISIT        ───→ A06~A10(住院)      ├─ FULL JOIN ──→ ENC_DERIVED ──→ ENC_DERIVED_IDX
ENC_BED_RECORD       ───→ A11~A13(床位)      ┘               (9个派生字段)   (6个复合指标)
```

---

## 二、原子指标定义

> **原子指标** = 来源表 + 聚合口径（不可再分的业务度量）

### 2.1 门急诊域原子指标（来源: ENC_EMER_OUTP_VISIT）

| 编号 | 名称 | 度量口径 | 单位 |
|---|---|---|---|
| A01 | 门诊就诊人次数 | `COUNT(DISTINCT register_id)` WHERE visit_type_name LIKE '%门诊%' OR visit_type_code IN('1','01') | 人次 |
| A02 | 急诊就诊人次数 | `COUNT(DISTINCT register_id)` WHERE visit_type_name LIKE '%急诊%' OR visit_type_code IN('2','02') | 人次 |
| A03 | 门急诊就诊总人次数 | A01 + A02 | 人次 |
| A04 | 门诊就诊患者数 | `COUNT(DISTINCT patient_id)` WHERE visit_type=门诊 | 人 |
| A05 | 急诊就诊患者数 | `COUNT(DISTINCT patient_id)` WHERE visit_type=急诊 | 人 |

### 2.2 住院域原子指标（来源: ENC_INP_VISIT）

| 编号 | 名称 | 度量口径 | 单位 |
|---|---|---|---|
| A06 | 入院人次数 | `COUNT(DISTINCT admission_id)` | 人次 |
| A07 | 出院人次数 | `COUNT(DISTINCT admission_id)` WHERE discharge_way_code IS NOT NULL AND <> '' | 人次 |
| A08 | 住院手术人次数 | `COUNT(DISTINCT admission_id)` WHERE surgery_flag='1' | 人次 |
| A09 | 非手术住院人次数 | `COUNT(DISTINCT admission_id)` WHERE NVL(surgery_flag,'0')='0' | 人次 |
| A10 | 住院患者数 | `COUNT(DISTINCT patient_id)` | 人 |

### 2.3 床位域原子指标（来源: ENC_BED_RECORD）

| 编号 | 名称 | 度量口径 | 单位 |
|---|---|---|---|
| A11 | 实际开放床位数 | `COUNT(DISTINCT bed_id)` WHERE open_flag='1' | 张 |
| A12 | 实际占用总床日数 | `SUM(bed_day)` WHERE occupy_flag='1' | 床日 |
| A13 | 实际开放总床日数 | `SUM(open_bed_day)` | 床日 |

### 2.4 通用维度体系

| 维度 | 字段 | 适用域 |
|---|---|---|
| D01 统计日期 | stat_date | 全域 |
| D02 院区 | hospital_code/name | 全域 |
| D03 科室 | dept_code/name | 全域 |
| D04 病区 | ward_code/name | 全域 |
| D05 患者类型 | patient_type_code/name | 全域 |
| D06 医生 | doctor_code/name | 门急诊+住院 |
| D07 医疗组 | treat_group_code/name | 住院 |
| D08 就诊类型 | visit_type_code/name | 门急诊 |
| D09 挂号类别 | register_type_code/name | 门急诊 |
| D10 入院途径 | adm_route_code/name | 住院 |
| D11 出院方式 | discharge_way_code/name | 住院 |
| D12 是否手术 | surgery_flag | 住院 |

---

## 三、派生指标定义

> **派生指标** = 原子指标 + 统计粒度(stat_date×hospital×dept×ward)

### 3.1 派生宽表 derived.ENC_DERIVED 字段

| 编号 | 字段名 | 原子来源 | 业务含义 |
|---|---|---|---|
| P01 | outpatient_visits | A01 | 门诊就诊人次数 |
| P02 | emergency_visits | A02 | 急诊就诊人次数 |
| P03 | outpatient_emergency_visits | A03 | 门急诊总人次数 |
| P04 | discharges | A07 | 出院人次数 |
| P05 | admissions | A06 | 入院人次数 |
| P06 | actual_open_beds | A11 | 实际开放床位数 |
| P07 | discharge_count | A07 | 出院人次(冗余,供复合表关联) |
| P08 | non_surgical_inpatients | A09 | 非手术住院人次数 |
| P09 | total_inpatient_occupied_bed_days | A12 | 实际占用总床日数 |

### 3.2 派生指标业务口径明细

**P01 门诊就诊人次数:** 按register_id去重，筛选门诊挂号类型。一个挂号ID算1人次。
**P02 急诊就诊人次数:** 按register_id去重，筛选急诊挂号类型。
**P03 门急诊总人次:** P01+P02。
**P04 出院人次数:** 按admission_id去重，筛选有出院方式记录的患者。
**P05 入院人次数:** 按admission_id去重计数。
**P06 实际开放床位数:** 按bed_id去重，筛选open_flag='1'。
**P08 非手术住院人次:** 按admission_id去重，surgery_flag为0。
**P09 占用总床日:** 占床床位的bed_day求和。可用于计算床位使用率(=P09/P13×100%)。

---

## 四、派生层ETL加工SQL

### 4.1 派生宽表DDL

```sql
DROP TABLE IF EXISTS derived.ENC_DERIVED;
CREATE TABLE derived.ENC_DERIVED (
    stat_date                         VARCHAR2(64),
    hospital_code                     VARCHAR2(64),
    hospital_name                     VARCHAR2(64),
    dept_code                         VARCHAR2(64),
    dept_name                         VARCHAR2(64),
    ward_code                         VARCHAR2(64),
    ward_name                         VARCHAR2(64),
    outpatient_visits                 VARCHAR2(64),  -- P01 A01
    emergency_visits                  VARCHAR2(64),  -- P02 A02
    outpatient_emergency_visits       VARCHAR2(64),  -- P03 A03
    discharges                        VARCHAR2(64),  -- P04 A07
    admissions                        VARCHAR2(64),  -- P05 A06
    actual_open_beds                  VARCHAR2(64),  -- P06 A11
    discharge_count                   VARCHAR2(64),  -- P07 A07(副本)
    non_surgical_inpatients           VARCHAR2(64),  -- P08 A09
    total_inpatient_occupied_bed_days VARCHAR2(64)   -- P09 A12
);
COMMENT ON TABLE derived.ENC_DERIVED IS '就诊派生宽表;原子指标汇总';
```

### 4.2 INSER INTO加工SQL

```sql
TRUNCATE TABLE derived.ENC_DERIVED;
INSERT INTO derived.ENC_DERIVED (
    stat_date, hospital_code, hospital_name,
    dept_code, dept_name, ward_code, ward_name,
    outpatient_visits, emergency_visits, outpatient_emergency_visits,
    discharges, admissions, actual_open_beds,
    discharge_count, non_surgical_inpatients,
    total_inpatient_occupied_bed_days
)
SELECT
    COALESCE(e.stat_date,i.stat_date,b.stat_date) AS stat_date,
    COALESCE(e.hospital_code,i.hospital_code,b.hospital_code) AS hospital_code,
    COALESCE(e.hospital_name,i.hospital_name,b.hospital_name) AS hospital_name,
    COALESCE(e.dept_code,i.dept_code,b.dept_code) AS dept_code,
    COALESCE(e.dept_name,i.dept_name,b.dept_name) AS dept_name,
    COALESCE(e.ward_code,i.ward_code,b.ward_code) AS ward_code,
    COALESCE(e.ward_name,i.ward_name,b.ward_name) AS ward_name,
    -- P01 A01: 门诊就诊人次数
    NVL(e.outpatient_cnt,0),
    -- P02 A02: 急诊就诊人次数
    NVL(e.emergency_cnt,0),
    -- P03 A03: 门急诊总人次
    NVL(e.outpatient_cnt,0)+NVL(e.emergency_cnt,0),
    -- P04 A07: 出院人次数
    NVL(i.discharges,0),
    -- P05 A06: 入院人次数
    NVL(i.admissions,0),
    -- P06 A11: 实际开放床位数
    NVL(b.actual_open_beds,0),
    -- P07 A07: 出院人次(副本)
    NVL(i.discharges,0),
    -- P08 A09: 非手术住院人次数
    NVL(i.non_surgical,0),
    -- P09 A12: 实际占用总床日数
    NVL(b.occupied_bed_days,0)
FROM (
    -- 子查询e: 门急诊原子指标
    SELECT stat_date, hospital_code, hospital_name,
           dept_code, dept_name, ward_code, ward_name,
           COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%门诊%'
                    OR visit_type_code IN('1','01') THEN register_id END) AS outpatient_cnt,
           COUNT(DISTINCT CASE WHEN visit_type_name LIKE '%急诊%'
                    OR visit_type_code IN('2','02') THEN register_id END) AS emergency_cnt
    FROM atomic.ENC_EMER_OUTP_VISIT
    GROUP BY stat_date, hospital_code, hospital_name,
             dept_code, dept_name, ward_code, ward_name
) e
FULL JOIN (
    -- 子查询i: 住院原子指标
    SELECT stat_date, hospital_code, hospital_name,
           dept_code, dept_name, ward_code, ward_name,
           COUNT(DISTINCT CASE WHEN discharge_way_code IS NOT NULL
                    AND discharge_way_code<>'' THEN admission_id END) AS discharges,
           COUNT(DISTINCT admission_id) AS admissions,
           COUNT(DISTINCT CASE WHEN NVL(surgery_flag,'0')='0'
                    THEN admission_id END) AS non_surgical
    FROM atomic.ENC_INP_VISIT
    GROUP BY stat_date, hospital_code, hospital_name,
             dept_code, dept_name, ward_code, ward_name
) i ON e.stat_date=i.stat_date AND e.hospital_code=i.hospital_code
     AND e.dept_code=i.dept_code AND NVL(e.ward_code,'-')=NVL(i.ward_code,'-')
FULL JOIN (
    -- 子查询b: 床位原子指标
    SELECT stat_date, hospital_code, hospital_name,
           dept_code, dept_name, ward_code, ward_name,
           COUNT(DISTINCT CASE WHEN open_flag='1' THEN bed_id END) AS actual_open_beds,
           SUM(CASE WHEN NVL(occupy_flag,'0')='1'
                THEN TO_NUMBER(NVL(bed_day,'0')) ELSE 0 END) AS occupied_bed_days
    FROM atomic.ENC_BED_RECORD
    GROUP BY stat_date, hospital_code, hospital_name,
             dept_code, dept_name, ward_code, ward_name
) b ON COALESCE(e.stat_date,i.stat_date)=b.stat_date
     AND COALESCE(e.hospital_code,i.hospital_code)=b.hospital_code
     AND COALESCE(e.dept_code,i.dept_code)=b.dept_code
     AND NVL(COALESCE(e.ward_code,i.ward_code),'-')=NVL(b.ward_code,'-')
WHERE COALESCE(e.stat_date,i.stat_date,b.stat_date) IS NOT NULL;
COMMIT;
```

---

## 五、复合指标（跨域关联）

复合表 `composite.ENC_DERIVED_IDX` 在 `derived.ENC_DERIVED` 基础上 LEFT JOIN `derived.REV_DERIVED_RX_ORD`（处方医嘱派生表），生成以下6个复合指标：

| 编号 | 指标名称 | 计算公式 |
|---|---|---|
| C01 | 总诊疗人次数 | 门诊人次 + 急诊人次 + 入院人次 |
| C02 | 门诊使用基本药物人次比(%) | 门诊基本药物人次 / 门诊人次 × 100 |
| C03 | 门诊基本药物处方占比(%) | 门诊基本药物处方数 / 门诊处方总数 × 100 |
| C04 | 门诊基本药物处方使用占比(%) | 门诊基本药物处方人次 / 门诊人次 × 100 |
| C05 | 住院基本药物使用率(%) | 住院使用基本药物人数 / 出院人数 × 100 |
| C06 | 住院基本药物使用占比(%) | 出院患者使用基本药物人数 / 出院人数 × 100 |

> **注意:** C04与C02当前分子相同(均用outpatient_essential_drug_visits)，C06与C05分母相同，实际业务中需区分"人次比"/"处方占比"/"使用率"的分子差异。

---

## 六、数据血缘图

```
┌─────────────────────────────────────────────────────────┐
│ 原子层: ENC_EMER_OUTP_VISIT  ENC_INP_VISIT  ENC_BED_RECORD │
│         A01~A05                A06~A10        A11~A13      │
└──────────┬──────────────────────┬────────────────┬────────┘
           │         FULL JOIN    │   FULL JOIN    │
           └──────────────────────┼────────────────┘
                                  ▼
┌─────────────────────────────────────────────────────────┐
│ 派生层: derived.ENC_DERIVED  (P01~P09, 9字段)            │
└──────────────────────┬──────────────────────────────────┘
                       │ LEFT JOIN REV_DERIVED_RX_ORD
                       ▼
┌─────────────────────────────────────────────────────────┐
│ 复合层: composite.ENC_DERIVED_IDX  (C01~C06, 6指标)     │
└─────────────────────────────────────────────────────────┘
```

---

## 七、指标字典速查

### 原子指标速查

| 编号 | 名称 | 来源 | 口径 | 单位 |
|---|---|---|---|---|
| A01 | 门诊就诊人次数 | ENC_EMER_OUTP_VISIT | COUNT DISTINCT register_id WHERE 门诊 | 人次 |
| A02 | 急诊就诊人次数 | ENC_EMER_OUTP_VISIT | COUNT DISTINCT register_id WHERE 急诊 | 人次 |
| A03 | 门急诊总人次数 | ENC_EMER_OUTP_VISIT | A01+A02 | 人次 |
| A06 | 入院人次数 | ENC_INP_VISIT | COUNT DISTINCT admission_id | 人次 |
| A07 | 出院人次数 | ENC_INP_VISIT | COUNT DISTINCT admission_id WHERE discharge_way NOT NULL | 人次 |
| A08 | 住院手术人次数 | ENC_INP_VISIT | COUNT DISTINCT admission_id WHERE surgery_flag=1 | 人次 |
| A09 | 非手术住院人次数 | ENC_INP_VISIT | COUNT DISTINCT admission_id WHERE surgery_flag=0 | 人次 |
| A11 | 实际开放床位数 | ENC_BED_RECORD | COUNT DISTINCT bed_id WHERE open_flag=1 | 张 |
| A12 | 实际占用总床日数 | ENC_BED_RECORD | SUM bed_day WHERE occupy_flag=1 | 床日 |
| A13 | 实际开放总床日数 | ENC_BED_RECORD | SUM open_bed_day | 床日 |

### 派生指标速查 (derived.ENC_DERIVED)

| 编号 | 字段 | 原子源 | 含义 |
|---|---|---|---|
| P01 | outpatient_visits | A01 | 门诊人次 |
| P02 | emergency_visits | A02 | 急诊人次 |
| P03 | outpatient_emergency_visits | A03 | 门急诊总人次 |
| P04 | discharges | A07 | 出院人次 |
| P05 | admissions | A06 | 入院人次 |
| P06 | actual_open_beds | A11 | 开放床位数 |
| P07 | discharge_count | A07 | 出院人次(副本) |
| P08 | non_surgical_inpatients | A09 | 非手术住院人次 |
| P09 | total_inpatient_occupied_bed_days | A12 | 占用总床日 |

### 复合指标速查 (composite.ENC_DERIVED_IDX)

| 编号 | 指标 | 公式 |
|---|---|---|
| C01 | 总诊疗人次数 | 门诊+急诊+入院 |
| C02 | 门诊基本药物人次比 | 基本药物人次/门诊人次×100% |
| C03 | 门诊基本药物处方占比 | 基本药物处方数/处方总数×100% |
| C04 | 门诊基本药物处方使用占比 | 基本药物处方人次/门诊人次×100% |
| C05 | 住院基本药物使用率 | 基本药物人数/出院人数×100% |
| C06 | 住院基本药物使用占比 | 基本药物人数/出院人数×100% |



