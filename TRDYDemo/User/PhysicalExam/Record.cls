/// RECORDMAP: Generated from RecordMap 'User.PhysicalExam'
/// on 2018-09-02 at 18:43:10.562 [2018-09-02 10:43:10.562 UTC]
/// by user _SYSTEM
Class User.PhysicalExam.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property ExamNumber As %String(MAXLEN = 1024);

Property Gender As %String(MAXLEN = 1024);

Property DOB As %String(MAXLEN = 1024);

Property Dept1 As %String(MAXLEN = 1024);

Property EmpNumber As %String(MAXLEN = 1024);

Property Age As %String(MAXLEN = 1024);

Property ExamStTime As %String(MAXLEN = 1024);

Property BranchNumber As %String(MAXLEN = 1024);

Property CertNumber As %String(MAXLEN = 1024);

Property MaritalStatus As %String(MAXLEN = 1024);

Property MobileNumber As %String(MAXLEN = 1024);

Property Dept2 As %String(MAXLEN = 1024);

Property Height As %String(MAXLEN = 1024);

Property SBP As %String(MAXLEN = 1024);

Property DBP As %String(MAXLEN = 1024);

Property Weight As %String(MAXLEN = 1024);

Property BMI As %String(MAXLEN = 1024);

Property HipLine As %String(MAXLEN = 1024);

Property WaistLine As %String(MAXLEN = 1024);

Property BMIText As %String(MAXLEN = 1024);

Property DiseaseHistory As %String(MAXLEN = 1024);

Property FamilyHis As %String(MAXLEN = 1024);

Property HRText As %String(MAXLEN = 1024);

Property LungExam As %String(MAXLEN = 1024);

Property Belly As %String(MAXLEN = 1024);

Property PersonalHis As %String(MAXLEN = 1024);

Property ShallowReflex As %String(MAXLEN = 1024);

Property Anus As %String(MAXLEN = 1024);

Property Spine As %String(MAXLEN = 1024);

Property Thyroid As %String(MAXLEN = 1024);

Property Skin As %String(MAXLEN = 1024);

Property Lymph As %String(MAXLEN = 1024);

Property Mammary As %String(MAXLEN = 1024);

Property Limbs As %String(MAXLEN = 1024);

Property SurgeryOthers As %String(MAXLEN = 1024);

Property Edea As %String(MAXLEN = 1024);

Property SurgerySummary As %String(MAXLEN = 1024);

Property ColorSense As %String(MAXLEN = 1024);

Property RightAltered As %String(MAXLEN = 1024);

Property RightEye As %String(MAXLEN = 1024);

Property LeftAltered As %String(MAXLEN = 1024);

Property LeftEye As %String(MAXLEN = 1024);

Property conjunctiva1 As %String(MAXLEN = 1024);

Property Eyelid As %String(MAXLEN = 1024);

Property Iris As %String(MAXLEN = 1024);

Property Corneal As %String(MAXLEN = 1024);

Property conjunctiva2 As %String(MAXLEN = 1024);

Property Crystal As %String(MAXLEN = 1024);

Property Atria As %String(MAXLEN = 1024);

Property EyeSummary As %String(MAXLEN = 1024);

Property ECGSummary As %String(MAXLEN = 1024);

Property ECGDesc As %String(MAXLEN = 1024);

Property BellyCaichao As %String(MAXLEN = 1024);

Property JiazhuangxianCaichao As %String(MAXLEN = 1024);

Property XRayChestDesc As %String(MAXLEN = 1024);

Property XRayChestSummary As %String(MAXLEN = 1024);

Property UBadguanxing As %String(MAXLEN = 1024);

Property Uelect As %String(MAXLEN = 1024);

Property Ujiaomu As %String(MAXLEN = 1024);

Property UWBC As %String(MAXLEN = 1024);

Property Uweight As %String(MAXLEN = 1024);

Property Uchenzha As %String(MAXLEN = 1024);

Property Udanhongsu As %String(MAXLEN = 1024);

Property Bbil As %String(MAXLEN = 1024);

Property Uprotein As %String(MAXLEN = 1024);

Property Uguanxing As %String(MAXLEN = 1024);

Property URBC As %String(MAXLEN = 1024);

Property URBCOb As %String(MAXLEN = 1024);

Property UCrystal As %String(MAXLEN = 1024);

Property Uglu As %String(MAXLEN = 1024);

Property UVitC As %String(MAXLEN = 1024);

Property Uyaxiaosuan As %String(MAXLEN = 1024);

Property UPH As %String(MAXLEN = 1024);

Property Utongti As %String(MAXLEN = 1024);

Property Ublood As %String(MAXLEN = 1024);

Property USkinCell As %String(MAXLEN = 1024);

Property Ubacteria As %String(MAXLEN = 1024);

Property Uyuanshangpi As %String(MAXLEN = 1024);

Property Unianye As %String(MAXLEN = 1024);

Property BUN As %String(MAXLEN = 1024);

Property Uniaosuan As %String(MAXLEN = 1024);

Property Bjigan As %String(MAXLEN = 1024);

Property EBVCAIgA As %String(MAXLEN = 1024);

Property AiPeiIg As %String(MAXLEN = 1024);

Property JiataiDanbai As %String(MAXLEN = 1024);

Property QianliexianIg As %String(MAXLEN = 1024);

Property TG As %String(MAXLEN = 1024);

Property BloodSugar As %String(MAXLEN = 1024);

Property LDL As %String(MAXLEN = 1024);

Property WBC As %String(MAXLEN = 1024);

Property TCHO As %String(MAXLEN = 1024);

Property LympPer As %String(MAXLEN = 1024);

Property HDL As %String(MAXLEN = 1024);

Property BigXuexiaoban As %String(MAXLEN = 1024);

Property DanhePer As %String(MAXLEN = 1024);

Property Danhe As %String(MAXLEN = 1024);

Property RBCKuandu As %String(MAXLEN = 1024);

Property RBCDW As %String(MAXLEN = 1024);

Property RBCYJ As %String(MAXLEN = 1024);

Property LYMPCount As %String(MAXLEN = 1024);

Property AvgRBCRJ As %String(MAXLEN = 1024);

Property AvgHGB As %String(MAXLEN = 1024);

Property AvgHGBNongdu As %String(MAXLEN = 1024);

Property AvgXxbKuandu As %String(MAXLEN = 1024);

Property AvgXxbTj As %String(MAXLEN = 1024);

Property ShijianxingPer As %String(MAXLEN = 1024);

Property ShijianxingCount As %String(MAXLEN = 1024);

Property ShisuanxingPer As %String(MAXLEN = 1024);

Property ShixuanxingCount As %String(MAXLEN = 1024);

Property HGBNongdu As %String(MAXLEN = 1024);

Property HGBCount As %String(MAXLEN = 1024);

Property XxbBirong As %String(MAXLEN = 1024);

Property XxbCount As %String(MAXLEN = 1024);

Property ZhongxingPer As %String(MAXLEN = 1024);

Property ZhongxingCount As %String(MAXLEN = 1024);

Property TanghuaHGB As %String(MAXLEN = 1024);

Property CA125 As %String(MAXLEN = 1024);

Property ALT As %String(MAXLEN = 1024);

Property AST As %String(MAXLEN = 1024);

Property yGT As %String(MAXLEN = 1024);

Property jianxingmei As %String(MAXLEN = 1024);

Property TBIL As %String(MAXLEN = 1024);

Property TP As %String(MAXLEN = 1024);

Property DBIL As %String(MAXLEN = 1024);

Property IBIL As %String(MAXLEN = 1024);

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ExamNumber</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>Dept1</Value>
</Value>
<Value name="6">
<Value>EmpNumber</Value>
</Value>
<Value name="7">
<Value>Age</Value>
</Value>
<Value name="8">
<Value>ExamStTime</Value>
</Value>
<Value name="9">
<Value>BranchNumber</Value>
</Value>
<Value name="10">
<Value>CertNumber</Value>
</Value>
<Value name="11">
<Value>MaritalStatus</Value>
</Value>
<Value name="12">
<Value>MobileNumber</Value>
</Value>
<Value name="13">
<Value>Dept2</Value>
</Value>
<Value name="14">
<Value>Height</Value>
</Value>
<Value name="15">
<Value>SBP</Value>
</Value>
<Value name="16">
<Value>DBP</Value>
</Value>
<Value name="17">
<Value>Weight</Value>
</Value>
<Value name="18">
<Value>BMI</Value>
</Value>
<Value name="19">
<Value>HipLine</Value>
</Value>
<Value name="20">
<Value>WaistLine</Value>
</Value>
<Value name="21">
<Value>BMIText</Value>
</Value>
<Value name="22">
<Value>DiseaseHistory</Value>
</Value>
<Value name="23">
<Value>FamilyHis</Value>
</Value>
<Value name="24">
<Value>HRText</Value>
</Value>
<Value name="25">
<Value>LungExam</Value>
</Value>
<Value name="26">
<Value>Belly</Value>
</Value>
<Value name="27">
<Value>PersonalHis</Value>
</Value>
<Value name="28">
<Value>ShallowReflex</Value>
</Value>
<Value name="29">
<Value>Anus</Value>
</Value>
<Value name="30">
<Value>Spine</Value>
</Value>
<Value name="31">
<Value>Thyroid</Value>
</Value>
<Value name="32">
<Value>Skin</Value>
</Value>
<Value name="33">
<Value>Lymph</Value>
</Value>
<Value name="34">
<Value>Mammary</Value>
</Value>
<Value name="35">
<Value>Limbs</Value>
</Value>
<Value name="36">
<Value>SurgeryOthers</Value>
</Value>
<Value name="37">
<Value>Edea</Value>
</Value>
<Value name="38">
<Value>SurgerySummary</Value>
</Value>
<Value name="39">
<Value>ColorSense</Value>
</Value>
<Value name="40">
<Value>RightAltered</Value>
</Value>
<Value name="41">
<Value>RightEye</Value>
</Value>
<Value name="42">
<Value>LeftAltered</Value>
</Value>
<Value name="43">
<Value>LeftEye</Value>
</Value>
<Value name="44">
<Value>conjunctiva1</Value>
</Value>
<Value name="45">
<Value>Eyelid</Value>
</Value>
<Value name="46">
<Value>Iris</Value>
</Value>
<Value name="47">
<Value>Corneal</Value>
</Value>
<Value name="48">
<Value>conjunctiva2</Value>
</Value>
<Value name="49">
<Value>Crystal</Value>
</Value>
<Value name="50">
<Value>Atria</Value>
</Value>
<Value name="51">
<Value>EyeSummary</Value>
</Value>
<Value name="52">
<Value>ECGSummary</Value>
</Value>
<Value name="53">
<Value>ECGDesc</Value>
</Value>
<Value name="54">
<Value>BellyCaichao</Value>
</Value>
<Value name="55">
<Value>JiazhuangxianCaichao</Value>
</Value>
<Value name="56">
<Value>XRayChestDesc</Value>
</Value>
<Value name="57">
<Value>XRayChestSummary</Value>
</Value>
<Value name="58">
<Value>UBadguanxing</Value>
</Value>
<Value name="59">
<Value>Uelect</Value>
</Value>
<Value name="60">
<Value>Ujiaomu</Value>
</Value>
<Value name="61">
<Value>UWBC</Value>
</Value>
<Value name="62">
<Value>Uweight</Value>
</Value>
<Value name="63">
<Value>Uchenzha</Value>
</Value>
<Value name="64">
<Value>Udanhongsu</Value>
</Value>
<Value name="65">
<Value>Bbil</Value>
</Value>
<Value name="66">
<Value>Uprotein</Value>
</Value>
<Value name="67">
<Value>Uguanxing</Value>
</Value>
<Value name="68">
<Value>URBC</Value>
</Value>
<Value name="69">
<Value>URBCOb</Value>
</Value>
<Value name="70">
<Value>UCrystal</Value>
</Value>
<Value name="71">
<Value>Uglu</Value>
</Value>
<Value name="72">
<Value>UVitC</Value>
</Value>
<Value name="73">
<Value>Uyaxiaosuan</Value>
</Value>
<Value name="74">
<Value>UPH</Value>
</Value>
<Value name="75">
<Value>Utongti</Value>
</Value>
<Value name="76">
<Value>Ublood</Value>
</Value>
<Value name="77">
<Value>USkinCell</Value>
</Value>
<Value name="78">
<Value>Ubacteria</Value>
</Value>
<Value name="79">
<Value>Uyuanshangpi</Value>
</Value>
<Value name="80">
<Value>Unianye</Value>
</Value>
<Value name="81">
<Value>BUN</Value>
</Value>
<Value name="82">
<Value>Uniaosuan</Value>
</Value>
<Value name="83">
<Value>Bjigan</Value>
</Value>
<Value name="84">
<Value>EBVCAIgA</Value>
</Value>
<Value name="85">
<Value>AiPeiIg</Value>
</Value>
<Value name="86">
<Value>JiataiDanbai</Value>
</Value>
<Value name="87">
<Value>QianliexianIg</Value>
</Value>
<Value name="88">
<Value>TG</Value>
</Value>
<Value name="89">
<Value>BloodSugar</Value>
</Value>
<Value name="90">
<Value>LDL</Value>
</Value>
<Value name="91">
<Value>WBC</Value>
</Value>
<Value name="92">
<Value>TCHO</Value>
</Value>
<Value name="93">
<Value>LympPer</Value>
</Value>
<Value name="94">
<Value>HDL</Value>
</Value>
<Value name="95">
<Value>BigXuexiaoban</Value>
</Value>
<Value name="96">
<Value>DanhePer</Value>
</Value>
<Value name="97">
<Value>Danhe</Value>
</Value>
<Value name="98">
<Value>RBCKuandu</Value>
</Value>
<Value name="99">
<Value>RBCDW</Value>
</Value>
<Value name="100">
<Value>RBCYJ</Value>
</Value>
<Value name="101">
<Value>LYMPCount</Value>
</Value>
<Value name="102">
<Value>AvgRBCRJ</Value>
</Value>
<Value name="103">
<Value>AvgHGB</Value>
</Value>
<Value name="104">
<Value>AvgHGBNongdu</Value>
</Value>
<Value name="105">
<Value>AvgXxbKuandu</Value>
</Value>
<Value name="106">
<Value>AvgXxbTj</Value>
</Value>
<Value name="107">
<Value>ShijianxingPer</Value>
</Value>
<Value name="108">
<Value>ShijianxingCount</Value>
</Value>
<Value name="109">
<Value>ShisuanxingPer</Value>
</Value>
<Value name="110">
<Value>ShixuanxingCount</Value>
</Value>
<Value name="111">
<Value>HGBNongdu</Value>
</Value>
<Value name="112">
<Value>HGBCount</Value>
</Value>
<Value name="113">
<Value>XxbBirong</Value>
</Value>
<Value name="114">
<Value>XxbCount</Value>
</Value>
<Value name="115">
<Value>ZhongxingPer</Value>
</Value>
<Value name="116">
<Value>ZhongxingCount</Value>
</Value>
<Value name="117">
<Value>TanghuaHGB</Value>
</Value>
<Value name="118">
<Value>CA125</Value>
</Value>
<Value name="119">
<Value>ALT</Value>
</Value>
<Value name="120">
<Value>AST</Value>
</Value>
<Value name="121">
<Value>yGT</Value>
</Value>
<Value name="122">
<Value>jianxingmei</Value>
</Value>
<Value name="123">
<Value>TBIL</Value>
</Value>
<Value name="124">
<Value>TP</Value>
</Value>
<Value name="125">
<Value>DBIL</Value>
</Value>
<Value name="126">
<Value>IBIL</Value>
</Value>
<Value name="127">
<Value>Gender</Value>
</Value>
</Data>
<DataLocation>^User.PhysicalExam.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^User.PhysicalExam.RecordD</IdLocation>
<IndexLocation>^User.PhysicalExam.RecordI</IndexLocation>
<StreamLocation>^User.PhysicalExam.RecordS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
