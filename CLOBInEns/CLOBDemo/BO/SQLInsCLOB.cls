include EnsSQLTypes

Class CLOBDemo.BO.SQLInsCLOB extends Ens.BusinessOperation {

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method InsertCLOB(pInput As CLOBDemo.MSG.StreamedRequest, Output pOutput As Ens.Response) As %Status
{
	///Compose a stream object	
	Set tmpstream = ##class(%Stream.GlobalCharacter).%New()
    Do tmpstream.Write(pInput.content)
	
	Set TestParams=2
	Set TestParams(1) = pInput.idx
	Set TestParams(2) = tmpstream
	Set TestParams(2,"SqlType")=$$$SqlLongVarchar //EnsSQLTypes.inc
	Set TestParams(2,"LOB")=1
	
	Set QueryStatement = "CALL DEMO.PUTSTREAM(?,?)"
	
	Set tSC = ..Adapter.ExecuteProcedureParmArray(.ResultSnapshots, .OutputParams, QueryStatement, , .TestParams)

	Quit tSC
}

XData MessageMap {
<MapItems>
    <MapItem MessageType="CLOBDemo.MSG.StreamedRequest">
        <Method>InsertCLOB</Method>
    </MapItem>
</MapItems>
}

}