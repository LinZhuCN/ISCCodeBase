Class Utility.XML2JSONUtil Extends %RegisteredObject
{

/// An utility method to transfer an xml into json without schema
/// Known limitations:
/// 1. Can not handle XML attributes yes since the json representation of them are json nodes, which is ambiguous to those of xml properties
/// 2. Array or List XML nodes can be ambiguous to xml properties when there is only one member in the array/list.
/// Since without schema, when there is only one child node in the xml, we can not decide whether it is a single node or a member of an array/list
ClassMethod NodeToDynObj(Node As %XML.Node) As %DynamicObject
{
	d Node.MoveToFirstChild(1)
	i (Node.NodeType = $$$xmlTEXTNODE) {
		s res = Node.NodeData
		d Node.MoveToParent(1)
		q res
	}
	#dim res As %DynamicObject = {}
	do  {
	s propertyName = $TR(Node.LocalName,"-_","")
	continue:propertyName=""

	i ( (Node.HasChildNodes(1)) && (Node.NodeType '= $$$xmlWHITESPACENODE ) && (Node.NodeType '= $$$xmlTEXTNODE) ) {
		s value = ..NodeToDynObj(Node)
	}
	else{
		s value = ""
		d Node.GetText(.value)
		Set value = $ZSTRIP(value,"*C")
	}
	//Remove control characters such as  \r\n etc.
	if ("string" = [(value)].%GetTypeOf(0)){
		Set value = $ZSTRIP(value,"*C")
	}
	//w $LENGTH(value)_":"_value_":"_[(value)].%GetTypeOf(0),!
	if "" '= value{
		Set exNode = res.%Get(propertyName)
		if ("" '= exNode){
			//Named object already exists as an object
			//Change the existing object ref to an array
			if exNode.%IsA("%DynamicObject") {
				#dim newArray As %DynamicArray = []
				Do newArray.%Push(exNode)
				Do newArray.%Push(value)
				Do res.%Set(propertyName,newArray)
			}
			//Otherwise it should be an existing array
			//insert the new member into it
			else{
				if exNode.%IsA("%DynamicArray"){
					#dim exArray As %DynamicArray = exNode
					Do exArray.%Push(value)
					Do res.%Set(propertyName,exArray)
				}
			}
		}else{
			d res.%Set(propertyName,value)
		}
	}
} while Node.MoveToNextSibling(1)

	d Node.MoveToParent(1)
	q res
}

ClassMethod Test()
{
	set reader=##class(%XML.Reader).%New()

    set status=reader.OpenFile("C:\Temp\sample1.xml")
    if $$$ISERR(status) {do $System.Status.DisplayError(status) quit $$$NULLOREF}
	
    #dim document As %XML.Document =reader.Document
    #dim obj AS %DynamicObject = ##class(Utility.XML2JSONUtil).NodeToDynObj(document.GetNode(1))
    w obj.%ToJSON()
}

}
