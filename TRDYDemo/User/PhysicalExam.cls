/// RECORDMAP: Modified during compilation of RecordMap 'User.PhysicalExam'
/// on 2018-09-02 at 18:43:10.799 [2018-09-02 10:43:10.799 UTC]
/// by user _SYSTEM
Class User.PhysicalExam Extends EnsLib.RecordMap.RecordMap
{

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd && (""=pLookAhead) {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

Parameter OBJECTNAME = "User.PhysicalExam.Record";

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, "")
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tCurrString = ""
	Set tSeps = $listbuild($char(64))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ExamNumber = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Gender = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.DOB = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Dept1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.EmpNumber = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Age = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ExamStTime = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BranchNumber = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.CertNumber = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.MaritalStatus = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.MobileNumber = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Dept2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Height = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.SBP = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.DBP = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Weight = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BMI = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.HipLine = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.WaistLine = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BMIText = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.DiseaseHistory = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.FamilyHis = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.HRText = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.LungExam = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Belly = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.PersonalHis = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ShallowReflex = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Anus = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Spine = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Thyroid = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Skin = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Lymph = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Mammary = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Limbs = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.SurgeryOthers = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Edea = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.SurgerySummary = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ColorSense = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.RightAltered = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.RightEye = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.LeftAltered = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.LeftEye = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.conjunctiva1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Eyelid = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Iris = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Corneal = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.conjunctiva2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Crystal = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Atria = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.EyeSummary = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ECGSummary = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ECGDesc = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BellyCaichao = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.JiazhuangxianCaichao = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.XRayChestDesc = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.XRayChestSummary = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.UBadguanxing = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uelect = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Ujiaomu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.UWBC = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uweight = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uchenzha = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Udanhongsu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Bbil = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uprotein = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uguanxing = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.URBC = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.URBCOb = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.UCrystal = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uglu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.UVitC = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uyaxiaosuan = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.UPH = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Utongti = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Ublood = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.USkinCell = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Ubacteria = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uyuanshangpi = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Unianye = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BUN = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Uniaosuan = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Bjigan = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.EBVCAIgA = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AiPeiIg = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.JiataiDanbai = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.QianliexianIg = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.TG = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BloodSugar = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.LDL = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.WBC = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.TCHO = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.LympPer = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.HDL = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.BigXuexiaoban = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.DanhePer = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.Danhe = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.RBCKuandu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.RBCDW = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.RBCYJ = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.LYMPCount = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AvgRBCRJ = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AvgHGB = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AvgHGBNongdu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AvgXxbKuandu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AvgXxbTj = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ShijianxingPer = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ShijianxingCount = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ShisuanxingPer = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ShixuanxingCount = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.HGBNongdu = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.HGBCount = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.XxbBirong = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.XxbCount = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ZhongxingPer = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ZhongxingCount = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.TanghuaHGB = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.CA125 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.ALT = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.AST = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.yGT = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.jianxingmei = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.TBIL = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.TP = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.DBIL = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(64), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(64), .tTopPiece)
	If pGetTopFields {
		Set pObject.IBIL = tCurrString
	}
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Do pStream.Write($select(pHasTopFields: pObject.ExamNumber,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Gender,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.DOB,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Dept1,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.EmpNumber,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Age,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ExamStTime,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BranchNumber,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.CertNumber,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.MaritalStatus,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.MobileNumber,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Dept2,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Height,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.SBP,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.DBP,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Weight,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BMI,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.HipLine,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.WaistLine,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BMIText,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.DiseaseHistory,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.FamilyHis,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.HRText,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.LungExam,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Belly,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.PersonalHis,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ShallowReflex,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Anus,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Spine,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Thyroid,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Skin,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Lymph,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Mammary,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Limbs,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.SurgeryOthers,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Edea,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.SurgerySummary,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ColorSense,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.RightAltered,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.RightEye,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.LeftAltered,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.LeftEye,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.conjunctiva1,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Eyelid,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Iris,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Corneal,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.conjunctiva2,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Crystal,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Atria,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.EyeSummary,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ECGSummary,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ECGDesc,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BellyCaichao,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.JiazhuangxianCaichao,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.XRayChestDesc,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.XRayChestSummary,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.UBadguanxing,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uelect,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Ujiaomu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.UWBC,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uweight,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uchenzha,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Udanhongsu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Bbil,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uprotein,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uguanxing,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.URBC,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.URBCOb,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.UCrystal,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uglu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.UVitC,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uyaxiaosuan,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.UPH,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Utongti,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Ublood,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.USkinCell,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Ubacteria,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uyuanshangpi,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Unianye,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BUN,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Uniaosuan,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Bjigan,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.EBVCAIgA,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AiPeiIg,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.JiataiDanbai,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.QianliexianIg,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.TG,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BloodSugar,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.LDL,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.WBC,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.TCHO,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.LympPer,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.HDL,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.BigXuexiaoban,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.DanhePer,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.Danhe,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.RBCKuandu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.RBCDW,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.RBCYJ,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.LYMPCount,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AvgRBCRJ,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AvgHGB,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AvgHGBNongdu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AvgXxbKuandu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AvgXxbTj,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ShijianxingPer,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ShijianxingCount,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ShisuanxingPer,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ShixuanxingCount,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.HGBNongdu,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.HGBCount,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.XxbBirong,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.XxbCount,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ZhongxingPer,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ZhongxingCount,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.TanghuaHGB,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.CA125,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.ALT,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.AST,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.yGT,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.jianxingmei,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.TBIL,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.TP,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.DBIL,1: ""),0)
	Do pStream.Write($char(64) _ $select(pHasTopFields: pObject.IBIL,1: ""),0)
	Do pStream.Write($char(13,10), 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("User.PhysicalExam.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="User.PhysicalExam" type="delimited" char_encoding="UTF-8" targetClassname="User.PhysicalExam.Record" recordTerminator="\x0d\x0a">
  <Separators>
    <Separator>@</Separator>
  </Separators>
  <Field name="ExamNumber" required="0" ignored="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Gender" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="DOB" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Dept1" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="EmpNumber" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Age" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ExamStTime" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BranchNumber" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="CertNumber" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="MaritalStatus" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="MobileNumber" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Dept2" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Height" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="SBP" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="DBP" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Weight" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BMI" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="HipLine" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="WaistLine" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BMIText" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="DiseaseHistory" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="FamilyHis" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="HRText" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LungExam" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Belly" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="PersonalHis" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ShallowReflex" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Anus" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Spine" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Thyroid" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Skin" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Lymph" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Mammary" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Limbs" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="SurgeryOthers" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Edea" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="SurgerySummary" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ColorSense" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="RightAltered" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="RightEye" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LeftAltered" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LeftEye" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="conjunctiva1" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Eyelid" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Iris" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Corneal" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="conjunctiva2" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Crystal" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Atria" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="EyeSummary" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ECGSummary" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ECGDesc" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BellyCaichao" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="JiazhuangxianCaichao" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="XRayChestDesc" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="XRayChestSummary" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="UBadguanxing" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uelect" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Ujiaomu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="UWBC" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uweight" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uchenzha" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Udanhongsu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Bbil" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uprotein" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uguanxing" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="URBC" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="URBCOb" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="UCrystal" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uglu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="UVitC" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uyaxiaosuan" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="UPH" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Utongti" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Ublood" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="USkinCell" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Ubacteria" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uyuanshangpi" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Unianye" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BUN" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Uniaosuan" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Bjigan" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="EBVCAIgA" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AiPeiIg" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="JiataiDanbai" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="QianliexianIg" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="TG" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BloodSugar" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LDL" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="WBC" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="TCHO" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LympPer" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="HDL" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="BigXuexiaoban" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="DanhePer" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Danhe" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="RBCKuandu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="RBCDW" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="RBCYJ" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LYMPCount" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AvgRBCRJ" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AvgHGB" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AvgHGBNongdu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AvgXxbKuandu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AvgXxbTj" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ShijianxingPer" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ShijianxingCount" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ShisuanxingPer" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ShixuanxingCount" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="HGBNongdu" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="HGBCount" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="XxbBirong" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="XxbCount" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ZhongxingPer" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ZhongxingCount" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="TanghuaHGB" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="CA125" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="ALT" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="AST" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="yGT" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="jianxingmei" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="TBIL" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="TP" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="DBIL" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="IBIL" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
</Record>
}

}
