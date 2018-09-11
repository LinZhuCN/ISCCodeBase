Include %occInclude

/// %Installer Manifest GoodWillApp.GoodWillHCInstallerFailover
Class GoodWillApp.GoodWillHCInstallerFailover
{

/// 清单定义.
XData HCManifest [ XMLNamespace = INSTALLER ]
{
<Manifest>
<!-- 安装参数 -->
<!-- 命名空间名称 -->
<Var Name="Namespace" Value="GoodWillNamespace"/> 
<!-- 存放Data的数据库名称 -->
<Var Name="GlobalDatabase" Value="${Namespace}G"/> 
<!-- 存放Routine的数据库名称 -->
<Var Name="RoutineDatabase" Value="${Namespace}R"/> 
<!-- 存放自定义的数据文件存放路径 -->
<Var Name="AppDir" Value="C:\GoodWillInst\JHSM"/> 
<!-- 存放Data的数据库文件路径 -->
<Var Name="GlobalDatabaseDir" Value="${AppDir}\${GlobalDatabase}"/> 
<!-- 存放Routine的数据库文件路径 -->
<Var Name="RoutineDatabaseDir" Value="${AppDir}\${RoutineDatabase}"/> 
<!-- 以上两个数据库对应的资源 -->
<Var Name="DBResource" Value="%DB_${Namespace}"/>
<!-- 命名空间专属角色 -->
<Var Name="Role" Value="${Namespace}"/>

<!-- Journal配置 -->
<!-- 主Journal路径 -->
<Var Name="PrimJounDir" Value="c:\journal\primary" />
<!-- 二级Journal路径 -->
<Var Name="SecJounDir" Value="c:\journal\secondary" />

<!-- Purge配置 -->
<!-- Purge操作执行频率：1次/n天 -->
<Var Name="RepeatDays" Value="1" />
<!-- Purge时保留多少天数据 -->
<Var Name="DaysToKeep" Value="5" />
<!-- Purge任务何时启动：hh:mm:ss -->
<Var Name="DailyStartTime" Value="23:59:59" />

<!-- 镜像配置 -->
<!-- 镜像名称 -->
<Var Name="MirrorName" Value="TestMirrorSet" />
<!-- 虚拟IP -->
<Var Name="VituralIP" Value="192.168.113.160/24" />
<!-- 主机绑定的网卡名称 -->
<Var Name="PrimaryNetworkAdapter" Value="Ethernet0" />
<!-- 主机IP -->
<Var Name="MasterIP" Value="192.168.113.137" />
<!-- 主机镜像IP -->
<Var Name="MasterPORT" Value="2188" />
<!-- 主机在镜像中的名称，可与计算机名不同 -->
<Var Name="MasterName" Value="PrimaryNode" />
<!-- 备机在镜像中的名称，可与计算机名不同 -->
<Var Name="FailoverName" Value="BackupNode" />
<!-- 备机绑定的网卡 -->
<Var Name="BackupNetworkAdapter" Value="Ethernet0" />
<!-- 备机IP -->
<Var Name="BackupIP" Value="192.168.113.149" />

<!-- 建立命名空间 -->
<Namespace Name="${Namespace}" Create="yes" Code="${RoutineDatabase}" Data="${GlobalDatabase}" Ensemble="1" EnsemblePortalGrant="${DBResource}">
<Configuration>
<!-- 建立数据库 -->
<Database Name="${RoutineDatabase}" Create="yes" Dir="${RoutineDatabaseDir}" Resource="${DBResource}"/>
<Database Name="${GlobalDatabase}" Create="yes" Dir="${GlobalDatabaseDir}" Resource="${DBResource}"/>
</Configuration>
<!-- 创建Web Application -->
<Var Name="URL" Value='/csp/#{$ZCVT("${Namespace}","L")}'/>
<Var Name="DIR" Dir='${CSPDIR}/#{$ZCVT("${Namespace}","L")}'/>
<CSPApplication Url="${URL}" Directory="${DIR}" Resource="" Grant="${DBResource}" Description="GoodWill CSP Interface" AuthenticationMethods="32"/>

<!-- 导入安装脚本以便通过函数执行配置 -->
<Import File="${INSTALLERDIR}/GoodWillHCInstallerFailover.xml"/> 


<Invoke Class="GoodWillApp.GoodWillHCInstallerFailover" Method="ConfigureInstance" CheckStatus="0">
<Arg Value="${INSTALLERDIR},${PRODDIR}"/>
</Invoke>

<Invoke Class="GoodWillApp.GoodWillHCInstallerFailover" Method="AddMsgPurgeTask" CheckStatus="0">
<Arg Value="${Namespace},${RepeatDays},${DaysToKeep},${DailyStartTime}"/>
</Invoke>

<Invoke Class="GoodWillApp.GoodWillHCInstallerFailover" Method="JoinMirror" CheckStatus="0">
<Arg Value="${MirrorName},{MasterName},${MasterIP},${MasterPort},${BackupNetworkAdapter},${BackupIP}"/>
</Invoke>

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
