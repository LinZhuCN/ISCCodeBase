SELECT distinct REG_TYPE,RAW_REG_TYPE FROM INSPUR_JKS_TJ.VW_OUTPATIENT WHERE ORG_CODE='40126818X'

SELECT * FROM  INSPUR_JKS_TJ.VW_OUTPATIENT

SELECT * FROM INSPUR_JKS_TJ.VW_OUTPATIENT

SELECT distinct(P.PATIENT_ID) as ExternalId, P.PATIENT_ID AS PID,
P.Name AS NameGivenName,
P.sex_code as GenderCode, P.SEX_NAME AS GenderDescription,
P.BIRTH_DATE AS BirthTime,
P.Address AS HomeAddressStreet,
P.Tel_No AS ContactInfoMoiblePhoneNumber,
P.ID_No AS SSN,
P.Occupation_Code as OccupationCode,P.Occupation_Name AS OccupationDescription,
P.Nationality_Code AS EthnicGroupCode,P.Nationality_Name AS EthnicGroupDescription,
P2.Marriage_Code AS MaritalStatusCode, P2.Marriage_Name AS MaritalStatusDescription
FROM inspur_jks_tj.vw_cehr_patient P
LEFT JOIN inspur_jks_tj.vw_cehr_active_patient P2 on P.patient_id=P2.patient_id
WHERE p.PATIENT_ID='ZY00313674'


SELECT E.Inpat_form_no as ExternalId,
E.patient_id as PID,
E.Inpat_form_no AS EncounterNumber,
'I' as  EncounterType,
E.IN_DTime AS FromTime,
E.Discharge_Date as ToTime,
E.Std_in_Dept_code as HealthCareFacilityCode,
E.in_dept_name as HealthCareFacilityDescription,
E.Std_Out_dept_code AS  DischargeLocationCode,
E.Out_dept_name as DischargeLocationDescription,
E.in_reason_code as AdmitReasonCode, CCodeTable.Target_name as AdmitReasonDescription,
FP.IN_CHARGE_DOCTOR_ID as AdmittingClinicianCode, FP.IN_CHARGE_DOCTOR_NAME AS AdmittingClinicianName,
FP.in_dept_room AS AssignedRoom, E.in_bed as AssignedBed
From inspur_jks_tj.vw_Inpatient E
LEFT JOIN inspur_jks_tj.vw_Inpatient_FirstPage FP on FP.INPAT_FORM_NO=E.Inpat_form_no
LEFT JOIN HBD_TJ_COMM.DICT_STD_INPATIENT_CAUSE CCodeTable on CCodeTable.Target_Id=E.In_Reason_Code AND CCodeTable.Org_Code='TJ_WQRM'
where E.in_DTIME >=to_date('2018-01-01','yyyy-mm-dd hh24:mi:ss')
AND E.DISCHARGE_DATE IS NULL

SELECT e.IN_DTIME,e.DISCHARGE_DATE, (e.DISCHARGE_DATE-e.IN_DTIME) AS diff From inspur_jks_tj.vw_Inpatient E ORDER BY diff desc
AND E.ORG_CODE='401288615' AND E.PATIENT_ID = 'ZY00313674'


SELECT e.INPAT_FORM_NO FROM inspur_jks_tj.vw_inpatient e WHERE e.INPAT_FORM_NO = '0013844025001'

SELECT e.OUTPAT_FORM_NO FROM inspur_jks_tj.VW_OUTPATIENT e WHERE e.OUTPAT_FORM_NO = '0013844025001'

SELECT * FROM inspur_jks_tj.VW_LAB_SUBITEM S
LEFT JOIN inspur_jks_tj.VW_LABMASTER m ON m.REPORT_FORM_NO = s.REPORT_FORM_NO


SELECT E.INPAT_FORM_NO, E.IN_DTIME,E.DISCHARGE_DATE, E.PAT_IN_STATUS
SELECT COUNT(*)
FROM INSPUR_JKS_TJ.VW_INPATIENT E  WHERE 
E.PAT_IN_STATUS = '0' AND 
E.ORG_CODE = '40126818X' AND E.DISCHARGE_DATE<=to_date('1970-01-01','yyyy-mm-dd hh24:mi:ss') 
AND E.in_DTIME >=to_date('2018-01-01','yyyy-mm-dd hh24:mi:ss')

AND E.DISCHARGE_DATE<=to_date('1999-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss')

SELECT DISTINCT E.DISCHARGE_DATE FROM INSPUR_JKS_TJ.VW_INPATIENT E  WHERE E.PAT_IN_STATUS = '0' AND E.ORG_CODE = '40126818X'


SELECT  D.DIAGNOSIS_ID as ExternalId,
E.Patient_id as PID,
E.inpat_form_no as EncounterNumber,
D.In_Diag_code as DiagnosisCode, D.In_diag_name as DiagnosisDescription,
D.Diag_type_Code as DiagnosisTypeCode,
case 
  when D.Diag_type_code='1' then '出院诊断'
  when D.Diag_type_code='2' then '门诊诊断'
  when D.DIAG_TYPE_CODE='3' then '入院初步诊断'
  when D.DIAG_TYPE_CODE='4' then '术前诊断'
  when D.Diag_type_code='5' then '术后诊断'
  when D.Diag_type_code='6' then '尸检诊断'
  when D.DIAG_TYPE_CODE='7' then '放射诊断'
  when D.DIAG_TYPE_CODE='8' then '超声诊断'
  when D.Diag_type_code='9' then '病理诊断'
  when D.Diag_type_code='10' then '并发症诊断'
  when D.DIAG_TYPE_CODE='11' then '院内感染诊断'
  when D.DIAG_TYPE_CODE='12' then '主要诊断'
  when D.Diag_type_code='13' then '次要诊断'
  when D.Diag_type_code='14' then '初步诊断'
  when D.DIAG_TYPE_CODE='15' then '死亡诊断'
  when D.DIAG_TYPE_CODE='16' then '术中诊断'
  when D.Diag_type_code='17' then '鉴别诊断'
  when D.Diag_type_code='18' then '损伤、中毒诊断'
  when D.DIAG_TYPE_CODE='19' then '病理诊断'
  when D.DIAG_TYPE_CODE='20' then '门急诊诊断(中医诊断)'
  when D.Diag_type_code='21' then '主病'
  when D.Diag_type_code='22' then '主症'
  when D.DIAG_TYPE_CODE='23' then '目前诊断'
  when D.DIAG_TYPE_CODE='99' then '其他'
  else '' end as DiagnosisTypeDescription,
E.IN_CHARGE_DOCTOR_ID as DiagnosingClinicianCode,E.IN_CHARGE_DOCTOR_Name as DiagnosingClinicianName,
D.Confirmed_diag_date as FromTime
FROM inspur_jks_tj.vw_Inpatient_Indiag D
left join inspur_jks_tj.vw_Inpatient_firstPage E on E.inPAT_FORM_NO=D.inPAT_FORM_NO
left join (select distinct target_id, target_name from hbd_tj_comm.Dict_STD_disease_diag_type where org_code='TJ_BCYY') ddt on D.Diag_type_Code=ddt.target_id
where D.Confirmed_diag_date>=to_date('2018-01-01','yyyy-mm-dd hh24:mi:ss')
AND D.ORG_CODE='40126818X'


SELECT * 
FROM  inspur_jks_tj.vw_Inpatient e
LEFT JOIN inspur_jks_tj.vw_Inpatient_firstPage ef ON e.INPAT_FORM_NO=ef.INPAT_FORM_NO
WHERE e.INPAT_FORM_NO LIKE '%ZY%'

SELECT * 
