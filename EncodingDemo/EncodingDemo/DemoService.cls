Class EncodingDemo.DemoService Extends %CSP.REST
{

	ClassMethod GetEncoded() As %Status
	{
	//encoded
	Set %response.ContentType="application/json;charset=gbk"
	Set rtn = {}
	Set rtn.Content = $ZCVT("什么","O","GB18030")
    #; Output the JSON 
    w rtn.%ToJSON()
    
    //w 111
	
	quit $$$OK
	}
	
	
	XData UrlMap
{
<Routes>
	<Route Url="/Encoding" Method="GET" Call="GetEncoded"  />
</Routes>
}
	
	
}