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
where D.Confirmed_diag_date>=to_date('2018-01-01','yyyy-mm-dd hh24:mi:ss')
AND D.ORG_CODE='401354416'

SELECT * 
FROM  inspur_jks_tj.vw_Inpatient e
LEFT JOIN inspur_jks_tj.vw_Inpatient_firstPage ef ON e.INPAT_FORM_NO=ef.INPAT_FORM_NO
WHERE e.INPAT_FORM_NO LIKE '%ZY%'

SELECT * FROM inspur_jks_tj.VW_INPATIENT_INDIAG d
LEFT JOIN inspur_jks_tj.VW_INPATIENT_FIRSTPAGE e ON d.INPAT_FORM_NO=e.INPAT_FORM_NO
WHERE e.PATIENT_ID LIKE '%ZY%'

---SELECT PATIENT_ID FROM inspur_jks_tj.VW_INPATIENT_FIRSTPAGE WHERE PATIENT_ID LIKE 'ZY'

SELECT PATIENT_ID FROM inspur_jks_tj.VW_INPATIENT_INDIAG d
LEFT JOIN inspur_jks_tj.VW_INPATIENT e ON d.INPAT_FORM_NO=e.INPAT_FORM_NO
WHERE e.PATIENT_ID LIKE '%ZY%'


-- 30 days re-admin 


SELECT d1.DIAGNOSIS_ID,d2.DIAGNOSIS_ID,
SELECT d1.IN_DIAG_CODE,d1.IN_DIAG_NAME,A.patient_id,  a.INPAT_FORM_NO as "前次就诊号", b.INPAT_FORM_NO as "后次就诊号", 
a.discharge_date as "前次出院时间" ,b.in_dtime as "后次入院时间",
D1.In_Diag_code as "前次住院诊断", D2.IN_DIAG_CODE as "后次住院诊断",
A.In_dept_name as "前次入住科室", B.In_Dept_name as "后次入住科室"
from   inspur_jks_tj.vw_Inpatient A , 
       inspur_jks_tj.vw_Inpatient B , 
       inspur_jks_tj.vw_Inpatient_Indiag D1,
       inspur_jks_tj.vw_Inpatient_Indiag D2
where 
       A.patient_id=B.patient_id 
       and A.INPAT_FORM_NO=D1.INPAT_FORM_NO 
       and B.INPAT_FORM_NO=D2.Inpat_Form_NO 
       and to_number(A.in_hospital_times)=to_number(B.in_hospital_times)-1 
       and  b.in_dtime-a.discharge_date<=30
       --AND A.ORG_CODE='401354416' and B.ORG_CODE='401354416'
       --And A.ORG_CODE='40126818X' and B.ORG_CODE='40126818X'
       --AND D1.Diag_type_code='12' 
       --And D2.Diag_type_code='12'
       AND (D1.IN_DIAG_CODE is null or D2.IN_DIAG_CODE is null or D1.IN_DIAG_CODE= D2.IN_DIAG_CODE)
       AND d1.IN_DIAG_CODE LIKE '%I63%'
       --AND b.IN_DTIME <= TO_DATE('2018-12-31')
order by b.in_dtime desc

SELECT * FROM inspur_jks_tj.VW_CEHR_PATIENT WHERE PATIENT_ID='ZY001356506000'


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
Ef.IN_CHARGE_DOCTOR_ID as DiagnosingClinicianCode,Ef.IN_CHARGE_DOCTOR_Name as DiagnosingClinicianName,
D.Confirmed_diag_date as FromTime
FROM inspur_jks_tj.vw_Inpatient_Indiag D
left join inspur_jks_tj.vw_Inpatient E on E.inPAT_FORM_NO=D.inPAT_FORM_NO
left join inspur_jks_tj.vw_Inpatient_firstPage Ef on Ef.inPAT_FORM_NO=D.inPAT_FORM_NO
where D.Confirmed_diag_date>=to_date('2018-01-01','yyyy-mm-dd hh24:mi:ss')
AND D.ORG_CODE='401354416'

AND e.PATIENT_ID='ZY001356506000'

SELECT * FROM inspur_jks_tj.vw_Inpatient_firstPage WHERE PATIENT_ID='ZY001356506000'
