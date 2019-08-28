select
e2.EncounterMRNAA,e1.EncounterMRNAA,
e2.Patient->HSAAID,
e1.Patient, e1.Patient->Name_GivenName, 
e1.id,e1.EncounterType,e1.EncounterNumber, d1.Diagnosis_Code, d1.Diagnosis_Description, e1.EndTime,
e2.StartTime, e2.id,e2.EncounterType,e2.EncounterNumber, d2.Diagnosis_Code, d2.Diagnosis_Description, 
e2.ReadmitForEncounter
--select count(*)
--select DISTINCT e2.HealthCareFacility
from  HSAA.Encounter e1,HSAA.Encounter e2, HSAA.Diagnosis d1,HSAA.Diagnosis d2
where e1.EncounterType = 'Inpatient' and e2.EncounterType = 'Inpatient'
and e1.Patient = e2.Patient
--and e1.EncounterMRNAA = e2.EncounterMRNAA
and e1.EncounterNumber != e2.EncounterNumber
and DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24
--and d1.Encounter = e1.ID
--and d2.Encounter = e2.ID
--and d1.DiagnosisType_Description in ('主要诊断')
--and d2.DiagnosisType_Description in ('主要诊断')
and (d1.DiagnosisGroup = d2.DiagnosisGroup or d1.DiagnosisGroup = '' or d2.DiagnosisGroup = '')
and e2.EncounterMRNAA='401354416' and e1.EncounterMRNAA='401354416'

and 

select Patient,EncounterNumber,FromTime,totime from HSAA.Encounter
where EncounterMRNAA='401354416' 
--and EncounterType = 'Inpatient' 
and id='1194576'

select DISTINCT Encounter
--distinct DiagnosisType_Description 
from HSAA.Diagnosis where TagFacility = '401354416'

and FromTime > Totime