Class POC.DT.CSV2SDA3 Extends Ens.DataTransformDTL [ DependsOn = (User.PhysicalExam.Record, POC.SDA.Container) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='User.PhysicalExam.Record' targetClass='POC.SDA.Container' create='new' language='objectscript' >
<assign value='"AddOrUpdate"' property='target.Action' action='set' />
<assign value='"TRDY"' property='target.SendingFacility' action='set' />
<assign value='1' property='target.UpdateECRDemographics' action='set' />
<assign value='source.ExamNumber' property='target.Patient.PatientNumbers.(1).Number' action='set' />
<assign value='"TRDY"' property='target.Patient.PatientNumbers.(1).Organization.Code' action='set' />
<assign value='"同人大友"' property='target.Patient.PatientNumbers.(1).Organization.Description' action='set' />
<assign value='"MRN"' property='target.Patient.PatientNumbers.(1).NumberType' action='set' />
<assign value='source.CertNumber' property='target.Encounters.(1).EncounterNumber' action='set' />
<assign value='source.DOB_"T00:00:00"' property='target.Patient.BirthTime' action='set' />
<if condition='"男" = source.Gender' >
<true>
<assign value='"M"' property='target.Patient.Gender.Code' action='set' />
<assign value='"男"' property='target.Patient.Gender.Description' action='set' />
</true>
<false>
<assign value='"F"' property='target.Patient.Gender.Code' action='set' />
<assign value='"女"' property='target.Patient.Gender.Description' action='set' />
</false>
</if>
<assign value='source.Dept1' property='target.Patient.Organizations.(1).Organization.Description' action='set' />
<assign value='source.EmpNumber' property='target.Patient.Organizations.(1).Organization.EId' action='set' />
<assign value='source.BranchNumber' property='target.Patient.Organizations.(1).Organization.Extension' action='set' />
<assign value='source.CertNumber' property='target.Patient.MPIID' action='set' />
<assign value='source.MaritalStatus' property='target.Patient.MaritalStatus.Description' action='set' />
<assign value='source.MobileNumber' property='target.Patient.ContactInfo.MobilePhoneNumber' action='set' />
<assign value='source.ExamNumber' property='target.Patient.Name.PreferredName' action='set' />
<assign value='source.ExamNumber' property='target.Patient.Name.FamilyName' action='set' />
<assign value='source.ExamNumber' property='target.Patient.Name.GivenName' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.Encounters.(1).EndTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.Encounters.(1).ToTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.Encounters.(1).FromTime' action='set' />
<assign value='"O"' property='target.Encounters.(1).AdmissionType.Code' action='set' />
<assign value='"体检"' property='target.Encounters.(1).AdmissionType.Description' action='set' />
<subtransform class='POC.DT.PhysicalExamDT' targetObj='target' sourceObj='source' />
<subtransform class='POC.DT.LabOrderDT' targetObj='target' sourceObj='source' />
<subtransform class='POC.DT.Histories' targetObj='target' sourceObj='source' />
<subtransform class='POC.DT.RadioReports' targetObj='target' sourceObj='source' />
</transform>
}

}
