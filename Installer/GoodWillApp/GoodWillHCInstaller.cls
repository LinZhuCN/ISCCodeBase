Include %occInclude

/// %Installer Manifest GoodWillApp.GoodWillHCInstaller
Class GoodWillApp.GoodWillHCInstaller
{

/// 清单定义.
XData HCManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>
<Var Name="Namespace" Value="GoodWillNamespace"/> 
<Var Name="GlobalDatabase" Value="${Namespace}G"/> 
<Var Name="RoutineDatabase" Value="${Namespace}R"/> 
<Var Name="AppDir" Value="C:\GoodWillInst\JHSM"/> 
<Var Name="GlobalDatabaseDir" Value="${AppDir}\${GlobalDatabase}"/> 
<Var Name="RoutineDatabaseDir" Value="${AppDir}\${RoutineDatabase}"/> 
<Var Name="DBResource" Value="%DB_${Namespace}"/> 
<Var Name="Role" Value="${Namespace}"/> 
<Var Name="PrimJounDir" Value="c:\journal\primary" />
<Var Name="SecJounDir" Value="c:\journal\secondary" />
<Var Name="RepeatDays" Value="1" />
<Var Name="DaysToKeep" Value="5" />
<Var Name="DailyStartTime" Value="23:59:59" />
 
<Var Name="MirrorName" Value="TestMirrorSet" />
<Var Name="VituralIP" Value="192.168.113.160/24" />
<Var Name="PrimaryNetworkAdapter" Value="Ethernet0" />
<Var Name="MasterIP" Value="192.168.113.137" />
<Var Name="MasterPORT" Value="2188" />
<Var Name="MasterName" Value="PrimaryNode" />
<Var Name="FailoverName" Value="BackupNode" />
<Var Name="BackupNetworkAdapter" Value="本地连接" />
<Var Name="BackupIP" Value="192.168.113.135" />

<Namespace Name="${Namespace}" Create="yes" Code="${RoutineDatabase}" Data="${GlobalDatabase}" Ensemble="1" EnsemblePortalGrant="${DBResource}">
<Configuration>
<Database Name="${RoutineDatabase}" Create="yes" Dir="${RoutineDatabaseDir}" Resource="${DBResource}"/>
<Database Name="${GlobalDatabase}" Create="yes" Dir="${GlobalDatabaseDir}" Resource="${DBResource}"/>
</Configuration>
<!-- Create a CSP application for the namespace -->
<Var Name="URL" Value='/csp/#{$ZCVT("${Namespace}","L")}'/>
<Var Name="DIR" Dir='${CSPDIR}/#{$ZCVT("${Namespace}","L")}'/>

<CSPApplication Url="${URL}" Directory="${DIR}" Resource="" Grant="${DBResource}" Description="GoodWill CSP Interface" AuthenticationMethods="32"/>

<Import File="${INSTALLERDIR}/GoodWillHCInstaller.xml"/> 

<Invoke Class="GoodWillApp.GoodWillHCInstaller" Method="ConfigureInstance" CheckStatus="0">
<Arg Value="${INSTALLERDIR},${PRODDIR}"/>
</Invoke>

<Invoke Class="GoodWillApp.GoodWillHCInstaller" Method="AddMsgPurgeTask" CheckStatus="0">
<Arg Value="${Namespace},${RepeatDays},${DaysToKeep},${DailyStartTime}"/>
</Invoke>

<Invoke Class="GoodWillApp.GoodWillHCInstaller" Method="CreateMirror" CheckStatus="0">
<Arg Value="${MirrorName},${VituralIP},${PrimaryNetworkAdapter},${MasterIP},${MasterName}"/>
</Invoke>

<!--<Invoke Class="GoodWillApp.GoodWillHCInstaller" Method="JoinMirror" CheckStatus="0">
<Arg Value="${MirrorName},{MasterName},${MasterIP},${MasterPort},${BackupNetworkAdapter},${BackupIP}"/>
</Invoke>-->

</Namespace>

<Namespace Name="%SYS">

<Invoke Class="%SYS.Journal.System" Method="SetPrimaryDirectory" CheckStatus="0">
<Arg Value="${PrimJounDir},1"/>
</Invoke>

<Invoke Class="%SYS.Journal.System" Method="SetAlternateDirectory" CheckStatus="0">
<Arg Value="${SecJounDir},1"/>
</Invoke>
</Namespace>



</Manifest>
}

/// 这是一个方法生成器,其代码由 XGL 生成.
ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
 #; 让我们的 XGL 文档为此方法生成代码.
 set tSC =  ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "HCManifest")
 quit tSC
}

ClassMethod ConfigureInstance(InstallerDir As %String, ProdDir As %String) As %Status
{
	set tSC = $ZF(-1,"copy "_ InstallerDir _ "\cache.key "_ProdDir_"\mgr\cache.key")
	set tSC = ##class(%SYSTEM.License).Upgrade()
	set tSC = $ZF(-1,"net start ISCAgent")
	//do ##class()
	quit tSC
}

ClassMethod AddMsgPurgeTask(SpaceName As %String, RepeatDays As %Integer, DaysToKeep As %Integer, DailyStTime As %String) As %Status
{
	Set task=##class(%SYS.Task).%New()
	Set task.Name = "Ens.Util.Tasks.Purge"
	Set task.Description = "Periodically purge both msg headers and msg bodies in " _ SpaceName
	Set task.NameSpace=$ZCONVERT(SpaceName,"U")
	Set task.TimePeriod=0 // Daily
	Set task.TimePeriodEvery=RepeatDays // Every 1 day
	Set task.StartDate = ($p($H,",",1)+1) // Start today
	Set task.DailyStartTime = $zth(DailyStTime)
	Set task.Priority = 2
	
	Set taskdef = ##class(Ens.Util.Tasks.Purge).%New()
	Set taskdef.TypesToPurge = "all"
	Set taskdef.BodiesToo = 1
	Set taskdef.NumberOfDaysToKeep = DaysToKeep
	Set taskdef.KeepIntegrity = 1
	Do task.AssignSettings(taskdef)
	Set task.TaskClass=$classname(taskdef)
	
	Set st = task.%Save()
	Return:$$$ISERR(st) st
	Set taskId = task.%Id()
	Return ##class(%SYS.Task).Resume(taskId)
	//.RunNow(task.%Id())
}

ClassMethod CreateMirror(MirrorName As %String, VituralIP As %String, PrimaryNetworkAdapter As %String, MasterIP As %String, MasterName As %String) As %Status
{
	
	zn "%SYS"
	//Start %Service_Mirror
	Set tSC = ##class(Security.Services).Get("%Service_Mirror",.properties)
	Set properties("Enabled")=1
	Set tSC = ##class(Security.Services).Modify("%Service_Mirror",.properties)
	
	
	Set MirrorInfo("VirtualAddress") = VituralIP
	if "" '= MasterIP{
		Set MirrorInfo("ECPAddress") = MasterIP
	}
	if "" '= PrimaryNetworkAdapter{
		Set MirrorInfo("VirtualAddressInterface") = PrimaryNetworkAdapter
	}
	//if "" '= MasterName
	//Set MasterName = ##class(SYS.Mirror).DefaultSystemName()
	Set tSC = ##class(SYS.Mirror).CreateNewMirrorSet(MirrorName,MasterName,.MirrorInfo)
	
	//Create Mirror Set
	//do ##class(SYS.Mirror).
	quit tSC
}

ClassMethod JoinMirror(MirrorName As %String, MasterName As %String, MasterIP As %String, MasterPort As %Integer, BackupNetworkAdapter As %String, BackupIP As %String) As %Status
{
	
	zn "%SYS"
	//Start %Service_Mirror
	Set tSC = ##class(Security.Services).Get("%Service_Mirror",.properties)
	Set properties("Enabled")=1
	Set tSC = ##class(Security.Services).Modify("%Service_Mirror",.properties)
	
	if "" '= BackupNetworkAdapter{
		Set LocalInfo("VirtualAddressInterface") = BackupNetworkAdapter
	}
	if "" '= BackupIP{
		Set LocalInfo("ECPAddress") = BackupIP
	}
	Set SysName = ##class(SYS.Mirror).DefaultSystemName()
	Set tSC = ##class(SYS.Mirror).JoinMirrorAsFailoverMember(MirrorName,SysName,MasterName,MasterIP,MasterPort,.LocalInfo)
	quit tSC
}

}
