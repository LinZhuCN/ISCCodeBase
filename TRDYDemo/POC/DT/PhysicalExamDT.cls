Class POC.DT.PhysicalExamDT Extends Ens.DataTransformDTL [ DependsOn = (User.PhysicalExam.Record, POC.SDA.Container) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='User.PhysicalExam.Record' targetClass='POC.SDA.Container' create='existing' language='objectscript' >
<assign value='source.CertNumber' property='target.PhysicalExams.(1).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"Height"' property='target.PhysicalExams.(1).PhysExamCode.Code' action='set' />
<assign value='"身高"' property='target.PhysicalExams.(1).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(1).PhysExamTime' action='set' />
<assign value='"身高"' property='target.PhysicalExams.(1).PhysExamObs' action='set' />
<assign value='"身高"' property='target.PhysicalExams.(1).PhysExamObs.Description' action='set' />
<assign value='source.Height' property='target.PhysicalExams.(1).PhysExamObsValue.Description' action='set' />
<assign value='"cm"' property='target.PhysicalExams.(1).PhysExamObsQualifier.Description' action='set' />

<assign value='source.CertNumber' property='target.PhysicalExams.(2).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"Weight"' property='target.PhysicalExams.(2).PhysExamCode.Code' action='set' />
<assign value='"体重"' property='target.PhysicalExams.(2).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(2).PhysExamTime' action='set' />
<assign value='"体重"' property='target.PhysicalExams.(2).PhysExamObs' action='set' />
<assign value='"体重"' property='target.PhysicalExams.(2).PhysExamObs.Description' action='set' />
<assign value='source.Weight' property='target.PhysicalExams.(2).PhysExamObsValue.Description' action='set' />
<assign value='"kg"' property='target.PhysicalExams.(2).PhysExamObsQualifier.Description' action='set' />

<assign value='source.CertNumber' property='target.PhysicalExams.(3).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"BMI"' property='target.PhysicalExams.(3).PhysExamCode.Code' action='set' />
<assign value='"BMI"' property='target.PhysicalExams.(3).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(3).PhysExamTime' action='set' />
<assign value='"BMI"' property='target.PhysicalExams.(3).PhysExamObs' action='set' />
<assign value='"BMI"' property='target.PhysicalExams.(3).PhysExamObs.Description' action='set' />
<assign value='source.BMI' property='target.PhysicalExams.(3).PhysExamObsValue.Description' action='set' />
<assign value='source.BMIText' property='target.PhysicalExams.(3).NoteText' action='set' />
<assign value='"BMI"' property='target.PhysicalExams.(3).PhysExamObsQualifier.Description' action='set' />

<assign value='source.CertNumber' property='target.PhysicalExams.(4).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"HipLine"' property='target.PhysicalExams.(4).PhysExamCode.Code' action='set' />
<assign value='"臀围"' property='target.PhysicalExams.(4).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(4).PhysExamTime' action='set' />
<assign value='"臀围"' property='target.PhysicalExams.(4).PhysExamObs' action='set' />
<assign value='"臀围"' property='target.PhysicalExams.(4).PhysExamObs.Description' action='set' />
<assign value='source.HipLine' property='target.PhysicalExams.(4).PhysExamObsValue.Description' action='set' />
<assign value='"cm"' property='target.PhysicalExams.(4).PhysExamObsQualifier.Description' action='set' />

<assign value='source.CertNumber' property='target.PhysicalExams.(5).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"WaistLine"' property='target.PhysicalExams.(5).PhysExamCode.Code' action='set' />
<assign value='"腰围"' property='target.PhysicalExams.(5).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(5).PhysExamTime' action='set' />
<assign value='"腰围"' property='target.PhysicalExams.(5).PhysExamObs' action='set' />
<assign value='"腰围"' property='target.PhysicalExams.(5).PhysExamObs.Description' action='set' />
<assign value='source.WaistLine' property='target.PhysicalExams.(5).PhysExamObsValue.Description' action='set' />
<assign value='"cm"' property='target.PhysicalExams.(5).PhysExamObsQualifier.Description' action='set' />

<assign value='source.CertNumber' property='target.PhysicalExams.(6).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"LungExam"' property='target.PhysicalExams.(6).PhysExamCode.Code' action='set' />
<assign value='"胸部检查"' property='target.PhysicalExams.(6).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(6).PhysExamTime' action='set' />
<assign value='"胸部检查"' property='target.PhysicalExams.(6).PhysExamObs' action='set' />
<assign value='source.LungExam' property='target.PhysicalExams.(6).PhysExamObs.Description' action='set' />
<assign value='source.LungExam' property='target.PhysicalExams.(6).PhysExamObsValue.Description' action='set' />

<assign value='source.CertNumber' property='target.PhysicalExams.(6).EncounterNumber' action='set' />
<assign value='source.ExamNumber_"LungExam"' property='target.PhysicalExams.(6).PhysExamCode.Code' action='set' />
<assign value='"胸部检查"' property='target.PhysicalExams.(6).PhysExamCode.Description' action='set' />
<assign value='source.ExamStTime_" 00:00:00"' property='target.PhysicalExams.(6).PhysExamTime' action='set' />
<assign value='"胸部检查"' property='target.PhysicalExams.(6).PhysExamObs' action='set' />
<assign value='source.LungExam' property='target.PhysicalExams.(6).PhysExamObs.Description' action='set' />
<assign value='source.LungExam' property='target.PhysicalExams.(6).PhysExamObsValue.Description' action='set' />

</transform>
}

}
