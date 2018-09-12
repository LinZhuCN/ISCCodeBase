Class CLOBDemo.MSG.StreamedRequest Extends Ens.Request
{
	property idx as %Integer;
	
	property content As %String(MAXLEN=4096);

Storage Default
{
<Data name="StreamedRequestDefaultData">
<Subscript>"StreamedRequest"</Subscript>
<Value name="1">
<Value>idx</Value>
</Value>
<Value name="2">
<Value>content</Value>
</Value>
</Data>
<DefaultData>StreamedRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}