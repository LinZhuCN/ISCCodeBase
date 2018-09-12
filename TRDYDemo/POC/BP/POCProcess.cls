/// 
Class POC.BP.POCProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='User.PhysicalExam.Record' response='HS.SDA.Patient' height='2000' width='2000' >
<context>
<property name='o' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='p' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Patient' type='HS.SDA.Patient' instantiate='1' />
</context>
<sequence xend='200' yend='550' >
<call name='SaveCSV' target='TestFile' async='1' xpos='200' ypos='250' >
<request type='User.PhysicalExam.Record' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' />
</call>
<transform name='CSV2SDA3' class='POC.DT.CSV2SDA3' source='request' target='context.Patient' xpos='200' ypos='350' />
<call name='ExportSDA3' target='EnsLib.XML.Object.Operation.FileOperation' async='1' xpos='200' ypos='450' >
<request type='HS.SDA.Container' >
<assign property="callrequest" value="context.Patient" action="set" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

}
