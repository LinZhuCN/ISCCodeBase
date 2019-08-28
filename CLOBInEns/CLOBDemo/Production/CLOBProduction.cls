Class CLOBDemo.Production.CLOBProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="CLOBDemo.Production.CLOBProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="CLOBDemo.BO.SQLInsCLOB" Category="" ClassName="CLOBDemo.BO.SQLInsCLOB" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">137ORCL</Setting>
    <Setting Target="Adapter" Name="DSN">137Oracle</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc5.jar</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">oracle.jdbc.OracleDriver</Setting>
    <Setting Target="Adapter" Name="JGService">EnsLib.JavaGateway.Service</Setting>
  </Item>
  <Item Name="EnsLib.JavaGateway.Service" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="JavaHome">C:\Program Files\Java\jdk1.8.0_181\</Setting>
  </Item>
  <Item Name="CLOBDemo.BS.ReadFileService" Category="" ClassName="CLOBDemo.BS.ReadFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
