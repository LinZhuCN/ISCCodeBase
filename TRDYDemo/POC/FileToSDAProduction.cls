Class POC.FileToSDAProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="POC.FileToSDAProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="FileInService" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">PhysicalExam</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\TRDYPOC\achieve\</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\TRDYPOC\in\</Setting>
    <Setting Target="Adapter" Name="FileSpec">case*.csv</Setting>
    <Setting Target="Host" Name="TargetConfigNames">POC.BP.POCProcess</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
  </Item>
  <Item Name="POC.BP.POCProcess" Category="" ClassName="POC.BP.POCProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EnsLib.XML.Object.Operation.FileOperation" Category="" ClassName="EnsLib.XML.Object.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RootElementName">Container</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HealthShare\Data\HSEDGE1\SDAIn\</Setting>
    <Setting Target="Host" Name="Charset">UTF-8</Setting>
    <Setting Target="Host" Name="NoXMLDeclaration">0</Setting>
  </Item>
  <Item Name="TestFile" Category="" ClassName="EnsLib.XML.Object.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\TRDYPOC\out\</Setting>
    <Setting Target="Host" Name="Charset">UTF-8</Setting>
    <Setting Target="Host" Name="NoXMLDeclaration">1</Setting>
    <Setting Target="Host" Name="RootElementName">Record</Setting>
  </Item>
</Production>
}

}
