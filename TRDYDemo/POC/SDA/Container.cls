Class POC.SDA.Container Extends (%Persistent, %XML.Adaptor, HS.SDA3.Container)
{

/// HL7:  ORC,OBR,NTE,TQ1,MSH<br>
/// VIEWERLIB: see HS.SDA3.LabOrder
Property LabOrders As list Of POC.SDA.LabOrder;

/// HL7:  ORC,OBR,NTE,TQ1,MSH<br>
/// VIEWERLIB: see HS.SDA3.RadOrder
Property RadOrders As list Of POC.SDA.RadOrder;

Storage Default
{
<Data name="AdditionalInfo">
<Attribute>AdditionalInfo</Attribute>
<Structure>subnode</Structure>
<Subscript>"AdditionalInfo"</Subscript>
</Data>
<Data name="ContainerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Patient</Value>
</Value>
<Value name="3">
<Value>Encounters</Value>
</Value>
<Value name="4">
<Value>Alerts</Value>
</Value>
<Value name="5">
<Value>AdvanceDirectives</Value>
</Value>
<Value name="6">
<Value>Allergies</Value>
</Value>
<Value name="7">
<Value>IllnessHistories</Value>
</Value>
<Value name="8">
<Value>SocialHistories</Value>
</Value>
<Value name="9">
<Value>FamilyHistories</Value>
</Value>
<Value name="10">
<Value>Guarantors</Value>
</Value>
<Value name="11">
<Value>Diagnoses</Value>
</Value>
<Value name="12">
<Value>Observations</Value>
</Value>
<Value name="13">
<Value>Problems</Value>
</Value>
<Value name="14">
<Value>PhysicalExams</Value>
</Value>
<Value name="15">
<Value>Procedures</Value>
</Value>
<Value name="16">
<Value>Documents</Value>
</Value>
<Value name="17">
<Value>LabOrders</Value>
</Value>
<Value name="18">
<Value>RadOrders</Value>
</Value>
<Value name="19">
<Value>OtherOrders</Value>
</Value>
<Value name="20">
<Value>Medications</Value>
</Value>
<Value name="21">
<Value>Vaccinations</Value>
</Value>
<Value name="22">
<Value>Appointments</Value>
</Value>
<Value name="23">
<Value>Referrals</Value>
</Value>
<Value name="24">
<Value>ClinicalRelationships</Value>
</Value>
<Value name="25">
<Value>ProgramMemberships</Value>
</Value>
<Value name="26">
<Value>MemberEnrollments</Value>
</Value>
<Value name="27">
<Value>MedicalClaims</Value>
</Value>
<Value name="28">
<Value>CustomObjects</Value>
</Value>
<Value name="29">
<Value>GenomicsOrders</Value>
</Value>
<Value name="30">
<Value>CarePlans</Value>
</Value>
<Value name="31">
<Value>HealthConcerns</Value>
</Value>
<Value name="32">
<Value>Goals</Value>
</Value>
<Value name="33">
<Value>SessionId</Value>
</Value>
<Value name="34">
<Value>ControlId</Value>
</Value>
<Value name="35">
<Value>Action</Value>
</Value>
<Value name="36">
<Value>EventDescription</Value>
</Value>
<Value name="37">
<Value>UpdateECRDemographics</Value>
</Value>
<Value name="38">
<Value>SendingFacility</Value>
</Value>
</Data>
<DataLocation>^POC.SDA.ContainerD</DataLocation>
<DefaultData>ContainerDefaultData</DefaultData>
<IdLocation>^POC.SDA.ContainerD</IdLocation>
<IndexLocation>^POC.SDA.ContainerI</IndexLocation>
<StreamLocation>^POC.SDA.ContainerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
