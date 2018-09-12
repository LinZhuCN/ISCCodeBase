Class POC.DT.RadioReports Extends Ens.DataTransformDTL [ DependsOn = (User.PhysicalExam.Record, POC.SDA.Container) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='User.PhysicalExam.Record' targetClass='POC.SDA.Container' create='existing' language='objectscript' >
<assign value='source.CertNumber' property='target.RadOrders.(1).EncounterNumber' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(1).PlacerId' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(1).FillerId' action='set' />
<assign value='"ECG"' property='target.RadOrders.(1).OrderItem.Code' action='set' />
<assign value='"心电图"' property='target.RadOrders.(1).OrderItem.Description' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(1).OrderedBy.Code' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(1).EnteringOrganization.Code' action='set' />
<assign value='"同人大友"' property='target.RadOrders.(1).EnteringOrganization.Description' action='set' />
<assign value='"R"' property='target.RadOrders.(1).Priority.Code' action='set' />
<assign value='"常规"' property='target.RadOrders.(1).Priority.Description' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(1).EnteredBy.Code' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(1).EnteredAt.Code' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(1).EnteredOn' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(1).FromTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(1).ToTime' action='set' />
<assign value='"RadOrders_"_source.ExamNumber_"_"_1' property='target.RadOrders.(1).ExternalId' action='set' />
<assign value='"IM"' property='target.RadOrders.(1).Result.ResultType' action='set' />
<assign value='source.ECGDesc' property='target.RadOrders.(1).Result.ResultText' action='set' />
<assign value='source.CertNumber' property='target.RadOrders.(1).Result.ResultItems.(1).EncounterNumber' action='set' />
<assign value='"ECG"' property='target.RadOrders.(1).Result.ResultItems.(1).TestItemCode.Code' action='set' />
<assign value='"心电图"' property='target.RadOrders.(1).Result.ResultItems.(1).TestItemCode.Description' action='set' />
<assign value='source.ECGSummary' property='target.RadOrders.(1).Result.ResultItems.(1).ResultValue' action='set' />
<assign value='source.CertNumber' property='target.RadOrders.(2).EncounterNumber' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(2).PlacerId' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(2).FillerId' action='set' />
<assign value='"Fubucaichao"' property='target.RadOrders.(2).OrderItem.Code' action='set' />
<assign value='"肝胆胰彩超"' property='target.RadOrders.(2).OrderItem.Description' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(2).OrderedBy.Code' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(2).EnteringOrganization.Code' action='set' />
<assign value='"同人大友"' property='target.RadOrders.(2).EnteringOrganization.Description' action='set' />
<assign value='"R"' property='target.RadOrders.(2).Priority.Code' action='set' />
<assign value='"常规"' property='target.RadOrders.(2).Priority.Description' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(2).EnteredBy.Code' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(2).EnteredAt.Code' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(2).EnteredOn' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(2).FromTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(2).ToTime' action='set' />
<assign value='"RadOrders_"_source.ExamNumber_"_"_2' property='target.RadOrders.(2).ExternalId' action='set' />
<assign value='"IM"' property='target.RadOrders.(2).Result.ResultType' action='set' />
<assign value='source.BellyCaichao' property='target.RadOrders.(2).Result.ResultText' action='set' />
<assign value='source.CertNumber' property='target.RadOrders.(3).EncounterNumber' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(3).PlacerId' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(3).FillerId' action='set' />
<assign value='"JiazhuangxianCaichao"' property='target.RadOrders.(3).OrderItem.Code' action='set' />
<assign value='"甲状腺彩超"' property='target.RadOrders.(3).OrderItem.Description' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(3).OrderedBy.Code' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(3).EnteringOrganization.Code' action='set' />
<assign value='"同人大友"' property='target.RadOrders.(3).EnteringOrganization.Description' action='set' />
<assign value='"R"' property='target.RadOrders.(3).Priority.Code' action='set' />
<assign value='"常规"' property='target.RadOrders.(3).Priority.Description' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(3).EnteredBy.Code' action='set' />
<assign value='"TRDY"' property='target.RadOrders.(3).EnteredAt.Code' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(3).EnteredOn' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(3).FromTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.RadOrders.(3).ToTime' action='set' />
<assign value='"RadOrders_"_source.ExamNumber_"_"_3' property='target.RadOrders.(3).ExternalId' action='set' />
<assign value='"IM"' property='target.RadOrders.(3).Result.ResultType' action='set' />
<assign value='source.JiazhuangxianCaichao' property='target.RadOrders.(3).Result.ResultText' action='set' />
</transform>
}

}
