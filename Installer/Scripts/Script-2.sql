SELECT TOP 100 head.ID As ID, {fn RIGHT(%EXTERNAL(head.TimeCreated),12 )} As TimeCreated, 
head.SessionId As Session, head.Status As Status, 
CASE head.IsError WHEN 1 THEN 'Error' ELSE 'OK' END As Error, 
head.SourceConfigName As Source, head.TargetConfigName As Target, 
head.SourceConfigName, head.TargetConfigName 
FROM Ens.MessageHeader head 
WHERE ((head.SourceConfigName = 'LabOrder服务' OR head.TargetConfigName = 'LabOrder服务')) ORDER BY head.ID


SELECT * FROM hsaa.Patient p where p.PatientNumbers like '%ZY001356506000%'  

ExternalId = 'ZY001356506000'


select pn.Patient->ID,Patient->Name_GivenName from hsaa.PatientNumber pn where pn."Number" = 'ZY001356506000'
6936396

select ReadmitForEncounter,* from hsaa.Encounter where Patient='6936396'

1079152
1079153

select * from hsaa.Diagnosis where Encounter='1079153'


UPDATE HSAA.Encounter e2 SET e2.ReadmitForEncounter =
(SELECT e1.ID from HSAA.Encounter e1
WHERE e1.id != e2.id AND
e1.VisitDescription  = e2.VisitDescription AND
e1.EncounterType = 'Inpatient' 
and e1.TagFacility='401288615'
AND (DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24 ))
WHERE e2.EncounterType = 'Inpatient'
and e2.TagFacility='401288615'

select * from hsaa.Encounter where VisitDescription is not null


UPDATE HSAA.Encounter e2 SET e2.ReadmitForEncounter = </br>

select VisitDescription from hsaa.Encounter
where TagFacility='401288615' and VisitDescription is not NULL


select * from HSAA.Encounter e2, HSAA.Encounter e1
WHERE e1.id != e2.id AND
e1.VisitDescription  = e2.VisitDescription AND
e1.EncounterType = 'Inpatient' 
and e1.TagFacility='401288615'
AND (DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24 )
and e2.EncounterType = 'Inpatient'
and e2.TagFacility='401288615'

UPDATE HSAA.Encounter e SET e.VisitDescription =
(
select pn."Number" from hsaa.PatientNumber pn
left join hsaa.Patient p on pn.Patient = p.ID
where pn.NumberType = 'SSN'
and e.Patient = p.ID
)
where e.TagFacility='401288615'
and e.EncounterType = 'Inpatient'

select e.VisitDescription from hsaa.Encounter e where e.VisitDescription is not null

select e1.ID,e2.ReadmitForEncounter,e1.EndTime,e2.StartTime,e1.VisitDescription,e2.VisitDescription from hsaa.Encounter e2,hsaa.Patient p2,hsaa.PatientNumber pn2,
HSAA.Encounter e1,hsaa.Patient p1,hsaa.PatientNumber pn1
WHERE e1.id != e2.id
--AND e1.Patient  = e2.Patient
AND e1.EncounterType = 'Inpatient'
AND  (DATEDIFF( 'hh', e1.EndTime, e2.StartTime) BETWEEN 1 and 30*24 )
and e2.EncounterType = 'Inpatient'
and e1.TagFacility='401288615'
and e2.TagFacility='401288615'
and e1.Patient=p1.ID
and p1.ID = pn1.Patient
and pn1.NumberType='SSN'
and e2.Patient=p2.ID
and p2.ID = pn2.Patient
and pn2.NumberType='SSN'
and pn1."Number" = pn2."Number"

select count(*) from hsaa.Encounter where TagFacility='401288615' and EncounterType='Inpatient'

select * from hsaa.PatientNumber where NumberType='SSN'

select p.ID,pn.Patient,pn."Number" from hsaa.Patient p
left join hsaa.PatientNumber pn on pn.Patient=p.ID
where pn.NumberType='SSN'

select p.ID,pn."Number" As IdNum,e.EncounterNumber from hsaa.Encounter e,hsaa.Patient p,hsaa.PatientNumber pn
where e.Patient=p.ID
and p.ID = pn.Patient
and pn.NumberType='SSN'


