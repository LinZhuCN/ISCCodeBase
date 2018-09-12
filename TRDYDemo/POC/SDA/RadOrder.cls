Class POC.SDA.RadOrder Extends (%Persistent, %XML.Adaptor, HS.SDA3.RadOrder)
{

Storage Default
{
<Data name="RadOrderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Extension</Value>
</Value>
<Value name="3">
<Value>PlacerId</Value>
</Value>
<Value name="4">
<Value>ClinicalInformation</Value>
</Value>
<Value name="5">
<Value>FillerId</Value>
</Value>
<Value name="6">
<Value>FillerAssigningAuthority</Value>
</Value>
<Value name="7">
<Value>OrderItem</Value>
</Value>
<Value name="8">
<Value>OrderCategory</Value>
</Value>
<Value name="9">
<Value>OrderQuantity</Value>
</Value>
<Value name="10">
<Value>ExternalId</Value>
</Value>
<Value name="11">
<Value>EncounterNumber</Value>
</Value>
<Value name="12">
<Value>CustomPairs</Value>
</Value>
<Value name="13">
<Value>CallbackNumber</Value>
</Value>
<Value name="14">
<Value>Specimen</Value>
</Value>
<Value name="15">
<Value>SpecimenCollectedTime</Value>
</Value>
<Value name="16">
<Value>SpecimenReceivedTime</Value>
</Value>
<Value name="17">
<Value>ReassessmentTime</Value>
</Value>
<Value name="18">
<Value>Frequency</Value>
</Value>
<Value name="19">
<Value>Duration</Value>
</Value>
<Value name="20">
<Value>Status</Value>
</Value>
<Value name="21">
<Value>Priority</Value>
</Value>
<Value name="22">
<Value>ConfidentialityCode</Value>
</Value>
<Value name="23">
<Value>Condition</Value>
</Value>
<Value name="24">
<Value>TextInstruction</Value>
</Value>
<Value name="25">
<Value>OrderGroup</Value>
</Value>
<Value name="26">
<Value>Comments</Value>
</Value>
<Value name="27">
<Value>ConsultationDepartment</Value>
</Value>
<Value name="28">
<Value>AuthorizationTime</Value>
</Value>
<Value name="29">
<Value>ReceivingLocation</Value>
</Value>
<Value name="30">
<Value>VerifiedComments</Value>
</Value>
<Value name="31">
<Value>ResultCopiesTo</Value>
</Value>
<Value name="32">
<Value>GroupId</Value>
</Value>
<Value name="33">
<Value>GroupAssigningAuthority</Value>
</Value>
<Value name="34">
<Value>ActionCode</Value>
</Value>
<Value name="35">
<Value>ActionScope</Value>
</Value>
<Value name="36">
<Value>EnteredBy</Value>
</Value>
<Value name="37">
<Value>EnteredAt</Value>
</Value>
<Value name="38">
<Value>EnteredOn</Value>
</Value>
<Value name="39">
<Value>FromTime</Value>
</Value>
<Value name="40">
<Value>ToTime</Value>
</Value>
<Value name="41">
<Value>EnteringOrganization</Value>
</Value>
<Value name="42">
<Value>OrderedBy</Value>
</Value>
<Value name="43">
<Value>ParentFillerAssigningAuthority</Value>
</Value>
<Value name="44">
<Value>ParentFillerId</Value>
</Value>
<Value name="45">
<Value>ParentPlacerAssigningAuthority</Value>
</Value>
<Value name="46">
<Value>ParentPlacerId</Value>
</Value>
<Value name="47">
<Value>ParentResultObservation</Value>
</Value>
<Value name="48">
<Value>ParentResultObservationSubId</Value>
</Value>
<Value name="49">
<Value>ParentResultObservationText</Value>
</Value>
<Value name="50">
<Value>PlacerAssigningAuthority</Value>
</Value>
<Value name="51">
<Value>ReasonForStudy</Value>
</Value>
<Value name="52">
<Value>Result</Value>
</Value>
<Value name="53">
<Value>Specimens</Value>
</Value>
<Value name="54">
<Value>UpdatedOn</Value>
</Value>
<Value name="55">
<Value>VerifiedBy</Value>
</Value>
</Data>
<DataLocation>^POC.SDA.RadOrderD</DataLocation>
<DefaultData>RadOrderDefaultData</DefaultData>
<IdLocation>^POC.SDA.RadOrderD</IdLocation>
<IndexLocation>^POC.SDA.RadOrderI</IndexLocation>
<StreamLocation>^POC.SDA.RadOrderS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
