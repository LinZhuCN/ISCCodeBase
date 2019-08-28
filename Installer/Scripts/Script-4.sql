select
e2.TagFacility,
e2.Patient->HSAAID,
e1.Patient, e1.Patient->Name_GivenName, 
e1.id,e1.EncounterType,e1.EncounterNumber, d1.Diagnosis_Code, d1.Diagnosis_Description, e1.EndTime,
e2.StartTime, e2.id,e2.EncounterType,e2.EncounterNumber, d2.Diagnosis_Code, d2.Diagnosis_Description, 
e2.ReadmitForEncounter
select count(*)
--select DISTINCT e2.TagFacility
from  HSAA.Encounter e1,HSAA.Encounter e2, HSAA.Diagnosis d1,HSAA.Diagnosis d2
where e1.EncounterType = 'Inpatient' and e2.EncounterType = 'Inpatient'
and e1.Patient = e2.Patient
and e1.TagFacility = e2.TagFacility
and e1.EncounterNumber != e2.EncounterNumber
and DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24
and d1.Encounter = e1.ID
and d2.Encounter = e2.ID
and d1.DiagnosisType_Description in ('主要诊断')
and d2.DiagnosisType_Description in ('主要诊断')
and (d1.DiagnosisGroup = d2.DiagnosisGroup or d1.DiagnosisGroup = '' or d2.DiagnosisGroup = '')
and e2.Patient->HSAAID = 'AADIICE'


UPDATE HSAA.Encounter e2 SET e2.ReadmitForEncounter = 
(SELECT e1.ID from HSAA.Encounter e1
WHERE e1.id != e2.id AND
e1.Patient  = e2.Patient AND
e1.EncounterType = 'Inpatient' AND
(DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24 ))
WHERE e2.EncounterType = 'Inpatient'

select * from HSAA.Patient

select d.Diagnosis_Code,d.Diagnosis_Description,e.FromTime,e.EndTime 
from hsaa.Encounter e,HSAA.Diagnosis d 
where d.Encounter = e.ID 
and e.TagFacility='401354416'
and e.EndTime is not null

select count(*) from hsaa.Encounter e where e.TagFacility='401354416'
and e.ToTime is not null


e.Patient->Name_GivenName like '%张广涵%'
and 

select e.ID,e.FromTime,e.ToTime from hsaa.Encounter e where e.Patient->Name_GivenName like '%张广涵%'

select count(*) from hsaa.Diagnosis d where d.Encounter is null

select d.Encounter from hsaa.Diagnosis d where d.Encounter='1070459'

select distinct d.Encounter from HSAA.Diagnosis d where d.TagFacility = '401354416'

select * from HSAA.Diagnosis where TagFacility='401354416' and Diagnosis_Code LIKE '%I50%'

select e1.StartTime,e1.EndTime from HSAA.Encounter e2,HSAA.Encounter e1
WHERE e1.id != e2.id 
AND e1.Patient  = e2.Patient
AND e1.EncounterType = 'Inpatient'
AND (DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24 )
and e2.EncounterType = 'Inpatient'

select e.ID,e.EncounterNumber,e.Patient->Name_GivenName 
from hsaa.Encounter e--,HSAA.Diagnosis
where e.ReadmitForEncounter is not null
and e.TagFacility = '401354416'


select * from hsaa.Diagnosis where EncounterNumber='0002964538008'



order by e1.ID desc
order by e2.StartTime asc


select count(*) from hsaa.Encounter where (ReadmitForEncounter != '' or ReadmitForEncounter !=null)


select ReadmitForEncounter from hsaa.Encounter where ReadmitForEncounter != ''
