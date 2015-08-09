<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<% ' 이 인클루드를 포함시킨다. %>
<!-- caSetting Start -->
	<!--#include File = "../caSetting.asp" -->
<!-- caSetting  End -->

<script language="JavaScript" src="../../Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="../../Include_js/Function.js"></script>

<%


	'페이지 권한 체크
	if Session("sLevel4") < 3 then Call ShowAlertMsgClose("권한을 다시 체크하세요.")

	'bnMode 수정인지 새입력인지 확인
	bnMode = Request("bnMode")
	bnTitle =trim(Request("bnTitle"))

	if bnMode = "" then Call ShowAlertMsgClose("잘못된 경로로 접속였습니다.")
	if Len(bnTitle) < 2 then Call ShowAlertMsg("제목이 짧습니다.")
		
		'폼값 테스트
		'For Each item IN Request.Form
		'	Response.Write(item)
		'	Response.Write(" = ")
		'	Response.Write("ReplaceTo(Request(""") & item & """), ""toDB"")"
		'	'Response.Write(Request.Form(item))
		'	Response.Write("<br>")
		'Next
		'Response.end
		
		'적당히 값을 DB에 맞게 수정하여 변수에 대입한다.
		bnMode = ReplaceTo(Request("bnMode"), "toDB")
		bnIdx = ReplaceTo(Request("bnIdx"), "toDB")
		bnGroup = ReplaceTo(Request("bnGroup"), "toDB")
		bnService = ReplaceTo(Request("bnService"), "toDB")
		bnTitle = ReplaceTo(Request("bnTitle"), "toDB")
		bnSubTitle = ReplaceTo(Request("bnSubTitle"), "toDB")
		bnContent = ReplaceTo(Request("bnContent"), "toDB")
		bnOrder = Request("bnOrder")

		'변수 재매핑
		if Session("sID") <> ""	then SvcStaff = Session("sName")& "(" & Session("sID") & ")"
		if bnOrder = "" And not IsNumeric(bnOrder) then Call ShowAlertMsgClose("순서값이 잘못됐습니다.")
		'if active <> "Y" then active = "N"


	if bnMode = "i" then		'데이터입력
		
		'서버관련 변수
		'IPaddress = Request.Servervariables("REMOTE_ADDR")

		bnIdxNext = NextNumber("vBoardNotice", "bnIdx", "", 0)
		'공지사항등록
		'DB에 해당사항 입력.
		SQL = "INSERT INTO vBoardNotice(bnIdx,SvcStaff,bnGroup,bnService,bnTitle,bnSubTitle,bnContent,viewCount,noticeDT,bnOrder) "
		SQL = SQL & " VALUES(?,?,?,?,?,?,?,0,GetDate(),?)"
		'dbConn.BeginTrans
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
			.Parameters.Append Cmd.CreateParameter("@bnIdx", adInteger, adParamInput, 4, bnIdxNext)
			.Parameters.Append Cmd.CreateParameter("@SvcStaff", adVarChar, adParamInput, 40, SvcStaff)
			.Parameters.Append Cmd.CreateParameter("@bnGroup", adVarChar, adParamInput, 50, bnGroup)
			.Parameters.Append Cmd.CreateParameter("@bnService", adVarChar, adParamInput, 50, bnService)
			.Parameters.Append Cmd.CreateParameter("@bnTitle", adVarChar, adParamInput, 250, bnTitle)
			.Parameters.Append Cmd.CreateParameter("@bnSubTitle", adVarChar, adParamInput, 250, bnSubTitle)
			.Parameters.Append Cmd.CreateParameter("@bnContent", adVarChar, adParamInput, 8000, bnContent)
			.Parameters.Append Cmd.CreateParameter("@bnOrder", adUnsignedSmallInt, adParamInput, 2, bnOrder)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
		'dbConn.CommitTrans


		alertMsg = "새로운 자료를 입력하였습니다."

	elseif bnMode = "u" then	'데이터 수정

		'DB에 해당사항 수정.
		SQL = "UPDATE vBoardNotice Set SvcStaff=?,bnGroup=?,bnService=?,bnTitle=?,bnSubTitle=?,bnContent=? "
		SQL = SQL & " ,modifyDT=GetDate(),bnOrder=?"
		SQL = SQL & " WHERE bnIdx=? "
		'dbConn.BeginTrans
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
			.Parameters.Append Cmd.CreateParameter("@SvcStaff", adVarChar, adParamInput, 40, SvcStaff)
			.Parameters.Append Cmd.CreateParameter("@bnGroup", adVarChar, adParamInput, 50, bnGroup)
			.Parameters.Append Cmd.CreateParameter("@bnService", adVarChar, adParamInput, 50, bnService)
			.Parameters.Append Cmd.CreateParameter("@bnTitle", adVarChar, adParamInput, 250, bnTitle)
			.Parameters.Append Cmd.CreateParameter("@bnSubTitle", adVarChar, adParamInput, 250, bnSubTitle)
			.Parameters.Append Cmd.CreateParameter("@bnContent", adVarChar, adParamInput, 8000, bnContent)
			.Parameters.Append Cmd.CreateParameter("@bnOrder", adUnsignedSmallInt, adParamInput, 2, bnOrder)
			.Parameters.Append Cmd.CreateParameter("@bnIdx", adInteger, adParamInput, 4, bnIdx)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
		'dbConn.CommitTrans

		alertMsg = "데이터가 수정되었습니다"

	else
		Call ShowAlertMsgClose("시스템장애 입니다.")
	end if

	'메세지보여주공/부모페이지리로드/자기자신창닫기
	Call ShowAlertMsgClose(alertMsg)

%>

<%
    ' The Transacted Script Commit Handler.  This sub-routine
    ' will be called if the transacted script commits.
    Sub OnTransactionCommit()
		'Response.Write "<P><B>업데이트가 성공적으로 이루어졌습니다</B>."
    End Sub


    ' The Transacted Script Abort Handler.  This sub-routine
    ' will be called if the script transacted aborts
    Sub OnTransactionAbort()
    	'Call goMsgPage("DBerr")
		'Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>
