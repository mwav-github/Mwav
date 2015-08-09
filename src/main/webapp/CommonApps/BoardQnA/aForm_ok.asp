<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- caSetting Start -->
	<!--#include File = "../caSetting.asp" -->
<!-- caSetting  End -->
<script language="JavaScript" src="../../Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="../../Include_js/Function.js"></script>

<%

	if CInt(Session("sLevel4")) < 2 then
		Call ShowAlertMsg("권한이 없습니다.")
	end if


	'qaMode 수정인지 새입력인지 확인(이건 독립적인 파일)
	qaMode = Request("qaMode")
	QAidx = Request("QAidx")
	aTitle =trim(Request("aTitle"))
	pageName = Request("pageName")

	if qaMode = "" Or QAidx = "" then Call ShowAlertMsg("잘못된 경로로 접속였습니다.")
	if Len(aTitle) < 2 then Call ShowAlertMsg("제목이 짧습니다.")


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
		'qaMode = ReplaceTo(Request("qaMode"), "toDB")
		SvcStaff = Request("SvcStaff")
		aTitle = ReplaceTo(Request("aTitle"), "toDB")
		aContent = ReplaceTo(Request("aContent"), "toDB")

		'변수 재매핑
		'if Session("sID") <> "" then SvcStaff = Session("sName")& "(" & Session("sID") & ")"

		'서버관련 변수
		IPaddress = Request.Servervariables("REMOTE_ADDR")
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	if qaMode = "ai" then		'데이터입력

		'DB에 답변사항등록
		SQL = "INSERT INTO vAnswer(QAidx,SvcStaff,aTitle,aContent,writeOutDT,IPaddress) "
		SQL = SQL & " VALUES(?,?,?,?,GetDate(),?)"
		'dbConn.BeginTrans
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
			.Parameters.Append Cmd.CreateParameter("@QAidx", adInteger, adParamInput, 4, QAidx)
			.Parameters.Append Cmd.CreateParameter("@SvcStaff", adVarChar, adParamInput, 50, SvcStaff)
			.Parameters.Append Cmd.CreateParameter("@aTitle", adVarChar, adParamInput, 200, aTitle)
			.Parameters.Append Cmd.CreateParameter("@aContent", adVarChar, adParamInput, 5000, aContent)
			.Parameters.Append Cmd.CreateParameter("@IPaddress", adVarChar, adParamInput, 15, IPaddress)
			'.Parameters.Append Cmd.CreateParameter("@bnOrder", adUnsignedSmallInt, adParamInput, 2, bnOrder)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
		'dbConn.CommitTrans
		alertMsg = "답변내용이 입력되었습니다."
		'pageName = pageName & "?qaMode=qav&QAidx=" & QAidx

	elseif qaMode = "au" then	'데이터 수정

		'DB에 해당사항 수정.
		SQL = "UPDATE vAnswer Set SvcStaff=?,aTitle=?,aContent=?,IPaddress=? "
		SQL = SQL & " WHERE QAidx=? "
		'dbConn.BeginTrans
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
			.Parameters.Append Cmd.CreateParameter("@SvcStaff", adVarChar, adParamInput, 50, SvcStaff)
			.Parameters.Append Cmd.CreateParameter("@aTitle", adVarChar, adParamInput, 200, aTitle)
			.Parameters.Append Cmd.CreateParameter("@aContent", adVarChar, adParamInput, 5000, aContent)
			.Parameters.Append Cmd.CreateParameter("@IPaddress", adVarChar, adParamInput, 15, IPaddress)
			.Parameters.Append Cmd.CreateParameter("@QAidx", adInteger, adParamInput, 4, QAidx)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
		'dbConn.CommitTrans

		alertMsg = "답변내용이 수정되었습니다"


	else
		ShowAlertMsg("시스템장애 입니다.")
	end if

	'메세지보여주고 페이지이동
	pageName = pageName & "?qaMode=qav&qaStatusBit=1&QAidx=" & QAidx
	Call GotoThePage(alertMsg, pageName)

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
