Class POC.DT.Histories Extends Ens.DataTransformDTL [ DependsOn = (User.PhysicalExam.Record, POC.SDA.Container) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='User.PhysicalExam.Record' targetClass='POC.SDA.Container' create='existing' language='objectscript' >
<assign value='source.CertNumber' property='target.SocialHistories.(1).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"SocialHis"_1' property='target.SocialHistories.(1).ExternalId' action='set' />
<assign value='"个人史"' property='target.SocialHistories.(1).SocialHabit.Code' action='set' />
<assign value='source.PersonalHis' property='target.SocialHistories.(1).SocialHabit.Description' action='set' />
<assign value='source.CertNumber' property='target.FamilyHistories.(1).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"FamilyHis"_1' property='target.FamilyHistories.(1).ExternalId' action='set' />
<assign value='source.FamilyHis' property='target.FamilyHistories.(1).NoteText' action='set' />
<assign value='"家族史"' property='target.FamilyHistories.(1).FamilyMember.Code' action='set' />
<assign value='source.FamilyHis' property='target.FamilyHistories.(1).FamilyMember.Description' action='set' />
<assign value='source.CertNumber' property='target.IllnessHistories.(1).EncounterNumber' action='set' />
<assign value='"既往史"' property='target.IllnessHistories.(1).Condition.Code' action='set' />
<assign value='source.DiseaseHistory' property='target.IllnessHistories.(1).Condition.Description' action='set' />
</transform>
}

}
