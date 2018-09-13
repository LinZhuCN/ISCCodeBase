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
	
	
	///Build query params, BLOB->CType=2004, CLOB->CType=2005
	Set TestParams=2
	Set TestParams(1) = pInput.idx
	Set TestParams(2) = tmpstream
	Set TestParams(2,"IOType")=1
	Set TestParams(2,"CType")=2005
	
	///Execute the query
	Set QueryStatement = "INSERT INTO CLOBDEMO c (c.ID,c.CLOBCOL) VALUES(?,?)"
	Set tSC = ..Adapter.ExecuteUpdateParmArray(.rowCount, QueryStatement, .TestParams)
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