Class POC.DT.LabOrderDT Extends Ens.DataTransformDTL [ DependsOn = (User.PhysicalExam.Record, POC.SDA.Container) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='User.PhysicalExam.Record' targetClass='POC.SDA.Container' create='existing' language='objectscript' >
<assign value='"TRDY"' property='target.LabOrders.(1).PlacerId' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(1).FillerId' action='set' />
<assign value='"Urine"' property='target.LabOrders.(1).OrderItem.Code' action='set' />
<assign value='"尿常规"' property='target.LabOrders.(1).OrderItem.Description' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(1).OrderedBy.Code' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(1).EnteringOrganization.Code' action='set' />
<assign value='"同人大友"' property='target.LabOrders.(1).EnteringOrganization.Description' action='set' />
<assign value='"Urine"' property='target.LabOrders.(1).Specimen' action='set' />
<assign value='"R"' property='target.LabOrders.(1).Priority.Code' action='set' />
<assign value='"常规"' property='target.LabOrders.(1).Priority.Description' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(1).EnteredBy.Code' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(1).EnteredAt.Code' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).EnteredOn' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).FromTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).ToTime' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1' property='target.LabOrders.(1).ExternalId' action='set' />
<assign value='"IM"' property='target.LabOrders.(1).Result.ResultType' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(1).EnteredOn' action='set' />
<assign value='"Bingliguanxing"' property='target.LabOrders.(1).Result.ResultItems.(1).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(1).Result.ResultItems.(1).TestItemCode.IsNumeric' action='set' />
<assign value='"病理管型"' property='target.LabOrders.(1).Result.ResultItems.(1).TestItemCode.Description' action='set' />
<assign value='source.UBadguanxing' property='target.LabOrders.(1).Result.ResultItems.(1).ResultValue' action='set' />
<assign value='"个"' property='target.LabOrders.(1).Result.ResultItems.(1).ResultValueUnits' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_1' property='target.LabOrders.(1).Result.ResultItems.(1).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(2).EnteredOn' action='set' />
<assign value='"UElect"' property='target.LabOrders.(1).Result.ResultItems.(2).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(1).Result.ResultItems.(2).TestItemCode.IsNumeric' action='set' />
<assign value='"电导率"' property='target.LabOrders.(1).Result.ResultItems.(2).TestItemCode.Description' action='set' />
<assign value='source.Uelect' property='target.LabOrders.(1).Result.ResultItems.(2).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_2' property='target.LabOrders.(1).Result.ResultItems.(2).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(3).EnteredOn' action='set' />
<assign value='"Ujiaomu"' property='target.LabOrders.(1).Result.ResultItems.(3).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(1).Result.ResultItems.(3).TestItemCode.IsNumeric' action='set' />
<assign value='"酵母样细胞"' property='target.LabOrders.(1).Result.ResultItems.(3).TestItemCode.Description' action='set' />
<assign value='source.Ujiaomu' property='target.LabOrders.(1).Result.ResultItems.(3).ResultValue' action='set' />
<assign value='"个"' property='target.LabOrders.(1).Result.ResultItems.(3).ResultValueUnits' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_3' property='target.LabOrders.(1).Result.ResultItems.(3).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(4).EnteredOn' action='set' />
<assign value='"UWBC"' property='target.LabOrders.(1).Result.ResultItems.(4).TestItemCode.Code' action='set' />
<assign value='0' property='target.LabOrders.(1).Result.ResultItems.(4).TestItemCode.IsNumeric' action='set' />
<assign value='"尿白细胞计数"' property='target.LabOrders.(1).Result.ResultItems.(4).TestItemCode.Description' action='set' />
<assign value='source.UWBC' property='target.LabOrders.(1).Result.ResultItems.(4).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_4' property='target.LabOrders.(1).Result.ResultItems.(4).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(5).EnteredOn' action='set' />
<assign value='"Uweight"' property='target.LabOrders.(1).Result.ResultItems.(5).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(1).Result.ResultItems.(5).TestItemCode.IsNumeric' action='set' />
<assign value='"尿比重测定"' property='target.LabOrders.(1).Result.ResultItems.(5).TestItemCode.Description' action='set' />
<assign value='source.Uweight' property='target.LabOrders.(1).Result.ResultItems.(5).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_5' property='target.LabOrders.(1).Result.ResultItems.(5).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(6).EnteredOn' action='set' />
<assign value='"Uchenzha"' property='target.LabOrders.(1).Result.ResultItems.(6).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(1).Result.ResultItems.(6).TestItemCode.IsNumeric' action='set' />
<assign value='"尿沉渣细胞计数"' property='target.LabOrders.(1).Result.ResultItems.(6).TestItemCode.Description' action='set' />
<assign value='source.Uchenzha' property='target.LabOrders.(1).Result.ResultItems.(6).ResultValue' action='set' />
<assign value='"个"' property='target.LabOrders.(1).Result.ResultItems.(6).ResultValueUnits' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_6' property='target.LabOrders.(1).Result.ResultItems.(6).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(7).EnteredOn' action='set' />
<assign value='"Udanhongsu"' property='target.LabOrders.(1).Result.ResultItems.(7).TestItemCode.Code' action='set' />
<assign value='0' property='target.LabOrders.(1).Result.ResultItems.(7).TestItemCode.IsNumeric' action='set' />
<assign value='"尿胆红素测定"' property='target.LabOrders.(1).Result.ResultItems.(7).TestItemCode.Description' action='set' />
<assign value='source.Udanhongsu' property='target.LabOrders.(1).Result.ResultItems.(7).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_7' property='target.LabOrders.(1).Result.ResultItems.(7).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(1).Result.ResultItems.(8).EnteredOn' action='set' />
<assign value='"Bbil"' property='target.LabOrders.(1).Result.ResultItems.(8).TestItemCode.Code' action='set' />
<assign value='0' property='target.LabOrders.(1).Result.ResultItems.(8).TestItemCode.IsNumeric' action='set' />
<assign value='"尿胆原"' property='target.LabOrders.(1).Result.ResultItems.(8).TestItemCode.Description' action='set' />
<assign value='source.Bbil' property='target.LabOrders.(1).Result.ResultItems.(8).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_1_"_"_8' property='target.LabOrders.(1).Result.ResultItems.(8).ExternalId' action='set' />

<assign value='"TRDY"' property='target.LabOrders.(2).PlacerId' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(2).FillerId' action='set' />
<assign value='"Blood"' property='target.LabOrders.(2).OrderItem.Code' action='set' />
<assign value='"血生化"' property='target.LabOrders.(2).OrderItem.Description' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(2).OrderedBy.Code' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(2).EnteringOrganization.Code' action='set' />
<assign value='"同人大友"' property='target.LabOrders.(2).EnteringOrganization.Description' action='set' />
<assign value='"Blood"' property='target.LabOrders.(2).Specimen' action='set' />
<assign value='"R"' property='target.LabOrders.(2).Priority.Code' action='set' />
<assign value='"常规"' property='target.LabOrders.(2).Priority.Description' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(2).EnteredBy.Code' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(2).EnteredAt.Code' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).EnteredOn' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).FromTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).ToTime' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_2' property='target.LabOrders.(2).ExternalId' action='set' />
<assign value='"IM"' property='target.LabOrders.(2).Result.ResultType' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).Result.ResultItems.(1).EnteredOn' action='set' />
<assign value='"BUN"' property='target.LabOrders.(2).Result.ResultItems.(1).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(2).Result.ResultItems.(1).TestItemCode.IsNumeric' action='set' />
<assign value='"血尿素氮测定"' property='target.LabOrders.(2).Result.ResultItems.(1).TestItemCode.Description' action='set' />
<assign value='source.BUN' property='target.LabOrders.(2).Result.ResultItems.(1).ResultValue' action='set' />
<assign value='"mmol/L"' property='target.LabOrders.(2).Result.ResultItems.(1).ResultValueUnits' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_2_"_"_1' property='target.LabOrders.(2).Result.ResultItems.(1).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).Result.ResultItems.(2).EnteredOn' action='set' />
<assign value='"Uniaosuan"' property='target.LabOrders.(2).Result.ResultItems.(2).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(2).Result.ResultItems.(2).TestItemCode.IsNumeric' action='set' />
<assign value='"血尿酸测定"' property='target.LabOrders.(2).Result.ResultItems.(2).TestItemCode.Description' action='set' />
<assign value='source.Uniaosuan' property='target.LabOrders.(2).Result.ResultItems.(2).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_2_"_"_2' property='target.LabOrders.(2).Result.ResultItems.(2).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).Result.ResultItems.(3).EnteredOn' action='set' />
<assign value='"Bjigan"' property='target.LabOrders.(2).Result.ResultItems.(3).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(2).Result.ResultItems.(3).TestItemCode.IsNumeric' action='set' />
<assign value='"血清肌酐测定"' property='target.LabOrders.(2).Result.ResultItems.(3).TestItemCode.Description' action='set' />
<assign value='source.Bjigan' property='target.LabOrders.(2).Result.ResultItems.(3).ResultValue' action='set' />
<assign value='"%"' property='target.LabOrders.(2).Result.ResultItems.(3).ResultValueUnits' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_2_"_"_3' property='target.LabOrders.(2).Result.ResultItems.(3).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).Result.ResultItems.(4).EnteredOn' action='set' />
<assign value='"EBVCAIgA"' property='target.LabOrders.(2).Result.ResultItems.(4).TestItemCode.Code' action='set' />
<assign value='0' property='target.LabOrders.(2).Result.ResultItems.(4).TestItemCode.IsNumeric' action='set' />
<assign value='"EB病毒壳抗原IgA抗体(EB-VCA-IgA)．EB病毒壳抗原IgA抗体测定"' property='target.LabOrders.(2).Result.ResultItems.(4).TestItemCode.Description' action='set' />
<assign value='source.EBVCAIgA' property='target.LabOrders.(2).Result.ResultItems.(4).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_2_"_"_4' property='target.LabOrders.(2).Result.ResultItems.(4).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(2).Result.ResultItems.(5).EnteredOn' action='set' />
<assign value='"TG"' property='target.LabOrders.(2).Result.ResultItems.(5).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(2).Result.ResultItems.(5).TestItemCode.IsNumeric' action='set' />
<assign value='"甘油三酯（TG）"' property='target.LabOrders.(2).Result.ResultItems.(5).TestItemCode.Description' action='set' />
<assign value='source.TG' property='target.LabOrders.(2).Result.ResultItems.(5).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_2_"_"_5' property='target.LabOrders.(2).Result.ResultItems.(5).ExternalId' action='set' />

<assign value='"TRDY"' property='target.LabOrders.(3).PlacerId' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(3).FillerId' action='set' />
<assign value='"Blood"' property='target.LabOrders.(3).OrderItem.Code' action='set' />
<assign value='"肝肾功"' property='target.LabOrders.(3).OrderItem.Description' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(3).OrderedBy.Code' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(3).EnteringOrganization.Code' action='set' />
<assign value='"同人大友"' property='target.LabOrders.(3).EnteringOrganization.Description' action='set' />
<assign value='"Blood"' property='target.LabOrders.(3).Specimen' action='set' />
<assign value='"R"' property='target.LabOrders.(3).Priority.Code' action='set' />
<assign value='"常规"' property='target.LabOrders.(3).Priority.Description' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(3).EnteredBy.Code' action='set' />
<assign value='"TRDY"' property='target.LabOrders.(3).EnteredAt.Code' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).EnteredOn' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).FromTime' action='set' />
<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).ToTime' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3' property='target.LabOrders.(3).ExternalId' action='set' />
<assign value='"IM"' property='target.LabOrders.(3).Result.ResultType' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(1).EnteredOn' action='set' />
<assign value='"ALT"' property='target.LabOrders.(3).Result.ResultItems.(1).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(1).TestItemCode.IsNumeric' action='set' />
<assign value='"谷丙转氨酶（ALT）"' property='target.LabOrders.(3).Result.ResultItems.(1).TestItemCode.Description' action='set' />
<assign value='source.ALT' property='target.LabOrders.(3).Result.ResultItems.(1).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_1' property='target.LabOrders.(3).Result.ResultItems.(1).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(2).EnteredOn' action='set' />
<assign value='"AST"' property='target.LabOrders.(3).Result.ResultItems.(2).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(2).TestItemCode.IsNumeric' action='set' />
<assign value='"谷草转氨酶（AST）"' property='target.LabOrders.(3).Result.ResultItems.(2).TestItemCode.Description' action='set' />
<assign value='source.AST' property='target.LabOrders.(3).Result.ResultItems.(2).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_2' property='target.LabOrders.(3).Result.ResultItems.(2).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(3).EnteredOn' action='set' />
<assign value='"yGT"' property='target.LabOrders.(3).Result.ResultItems.(3).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(3).TestItemCode.IsNumeric' action='set' />
<assign value='"γ-谷氨酰转肽酶（γ-GT）"' property='target.LabOrders.(3).Result.ResultItems.(3).TestItemCode.Description' action='set' />
<assign value='source.yGT' property='target.LabOrders.(3).Result.ResultItems.(3).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_3' property='target.LabOrders.(3).Result.ResultItems.(3).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(4).EnteredOn' action='set' />
<assign value='"jianxingmei"' property='target.LabOrders.(3).Result.ResultItems.(4).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(4).TestItemCode.IsNumeric' action='set' />
<assign value='"碱性磷酸酶（一）"' property='target.LabOrders.(3).Result.ResultItems.(4).TestItemCode.Description' action='set' />
<assign value='source.jianxingmei' property='target.LabOrders.(3).Result.ResultItems.(4).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_4' property='target.LabOrders.(3).Result.ResultItems.(4).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(5).EnteredOn' action='set' />
<assign value='"TBIL"' property='target.LabOrders.(3).Result.ResultItems.(5).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(5).TestItemCode.IsNumeric' action='set' />
<assign value='"总胆红素（TBIL）"' property='target.LabOrders.(3).Result.ResultItems.(5).TestItemCode.Description' action='set' />
<assign value='source.TBIL' property='target.LabOrders.(3).Result.ResultItems.(5).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_5' property='target.LabOrders.(3).Result.ResultItems.(5).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(6).EnteredOn' action='set' />
<assign value='"DBIL"' property='target.LabOrders.(3).Result.ResultItems.(6).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(6).TestItemCode.IsNumeric' action='set' />
<assign value='"直接胆红素（DBIL）"' property='target.LabOrders.(3).Result.ResultItems.(6).TestItemCode.Description' action='set' />
<assign value='source.DBIL' property='target.LabOrders.(3).Result.ResultItems.(6).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_6' property='target.LabOrders.(3).Result.ResultItems.(6).ExternalId' action='set' />

<assign value='source.ExamStTime_"T"_"03:00:00"' property='target.LabOrders.(3).Result.ResultItems.(7).EnteredOn' action='set' />
<assign value='"IBIL"' property='target.LabOrders.(3).Result.ResultItems.(7).TestItemCode.Code' action='set' />
<assign value='1' property='target.LabOrders.(3).Result.ResultItems.(7).TestItemCode.IsNumeric' action='set' />
<assign value='"间接胆红素（IBIL）"' property='target.LabOrders.(3).Result.ResultItems.(7).TestItemCode.Description' action='set' />
<assign value='source.IBIL' property='target.LabOrders.(3).Result.ResultItems.(7).ResultValue' action='set' />
<assign value='"LabOrders_"_source.ExamNumber_"_"_3_"_"_7' property='target.LabOrders.(3).Result.ResultItems.(7).ExternalId' action='set' />

</transform>
}

}
