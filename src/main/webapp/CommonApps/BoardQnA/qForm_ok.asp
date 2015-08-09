<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- caSetting Start -->
	<!--#include File = "../caSetting.asp" -->
<!-- caSetting  End -->
<script language="JavaScript" src="../../Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="../../Include_js/Function.js"></script>

<%

	'qaMode 수정인지 새입력인지 확인(이건 독립적인 파일)
	qaMode = Request("qaMode")
	qTitle =trim(Request("qTitle"))
	pageName = Request("pageName")
	if qaMode = "" then Call ShowAlertMsg("잘못된 경로로 접속였습니다.")
	if Len(qTitle) < 2 then Call ShowAlertMsg("제목이 짧습니다.")


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
		userName = ReplaceTo(Request("userName"), "toDB")
		userPW = ReplaceTo(Request("userPW"), "toDB")
		userPhone = ReplaceTo(Request("userPhone"), "toDB")
		userEmail = ReplaceTo(Request("userEmail"), "toDB")
		qGroup = Request("qGroup")
		qService = ReplaceTo(Request("qService"), "toDB")
		qTitle = ReplaceTo(Request("qTitle"), "toDB")
		qContent = ReplaceTo(Request("qContent"), "toDB")

		'변수 재매핑
		'if Session("sID") <> "" then SvcStaff = Session("sName")& "(" & Session("sID") & ")"
        'if active <> "Y" then active = "N"

		'서버관련 변수
		IPaddress = Request.Servervariables("REMOTE_ADDR")
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	if qaMode = "qi" then		'데이터입력

		QAidxNext = NextNumber("vQuestion", "QAidx", "", 0)
		'DB에 질문사항등록

		SQL = "INSERT INTO vQuestion(QAidx,MbrID,userName,userPW,userPhone,userEmail,qGroup,qService,qTitle,qContent,writeOutDT,IPaddress) "
		SQL = SQL & " VALUES(?,?,?,?,?,?,?,?,?,?,GetDate(),?)"
		'dbConn.BeginTrans
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
			.Parameters.Append Cmd.CreateParameter("@QAidx", adInteger, adParamInput, 4, QAidxNext)
			.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, Session("MbrID"))
			.Parameters.Append Cmd.CreateParameter("@userName", adVarChar, adParamInput, 20, userName)
			.Parameters.Append Cmd.CreateParameter("@userPW", adVarChar, adParamInput, 15, userPW)
			.Parameters.Append Cmd.CreateParameter("@userPhone", adVarChar, adParamInput, 50, userPhone)
			.Parameters.Append Cmd.CreateParameter("@userEmail", adVarChar, adParamInput, 50, userEmail)
			.Parameters.Append Cmd.CreateParameter("@qGroup", adVarChar, adParamInput, 50, qGroup)
			.Parameters.Append Cmd.CreateParameter("@qService", adVarChar, adParamInput, 50, qService)
			.Parameters.Append Cmd.CreateParameter("@qTitle", adVarChar, adParamInput, 200, qTitle)
			.Parameters.Append Cmd.CreateParameter("@qContent", adVarChar, adParamInput, 5000, qContent)
			.Parameters.Append Cmd.CreateParameter("@IPaddress", adVarChar, adParamInput, 15, IPaddress)
			'.Parameters.Append Cmd.CreateParameter("@bnOrder", adUnsignedSmallInt, adParamInput, 2, bnOrder)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
		'dbConn.CommitTrans
		alertMsg = "질문사항이 접수되었습니다."
		pageName = pageName & "?qaMode=qv&QAidx=" & QAidxNext

	elseif qaMode = "qu" then	'데이터 수정
		if CInt(Session("sLevel4")) < 2  And  Session("MbrID") = "" And Session("userEmail") = "" then
			Call ShowAlertMsg("권한이 없습니다.")
		end if
		QAidx = Request("QAidx")
		if QAidx = "" then Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
		qaStatusBit = Request("qaStatusBit")
		'회원이 답변이 있는 글을 삭제 할 때는 삭제하지 못하게 한다.
		if PickUpValue("vAnswer", "QAidx", "QAidx = " & QAidx) <> "NoPickUp" then Call ShowAlertMsg("답변있는 글은 수정할 수 없습니다.")

		'DB에 해당사항 수정.
		SQL = "UPDATE vQuestion Set userPW=?,userPhone=?,userEmail=?,qGroup=?,qService=?"
		SQL = SQL & " ,qTitle=?,qContent=?,IPaddress=? "
		SQL = SQL & " WHERE QAidx=? "
		'dbConn.BeginTrans
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			.ActiveConnection = dbConn
			.CommandText = SQL
			.CommandType = adCmdText
			'.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, Session("MbrID"))
			'.Parameters.Append Cmd.CreateParameter("@userName", adVarChar, adParamInput, 20, userName)
			.Parameters.Append Cmd.CreateParameter("@userPW", adVarChar, adParamInput, 15, userPW)
			.Parameters.Append Cmd.CreateParameter("@userPhone", adVarChar, adParamInput, 50, userPhone)
			.Parameters.Append Cmd.CreateParameter("@userEmail", adVarChar, adParamInput, 50, userEmail)
			.Parameters.Append Cmd.CreateParameter("@qGroup", adVarChar, adParamInput, 50, qGroup)
			.Parameters.Append Cmd.CreateParameter("@qService", adVarChar, adParamInput, 50, qService)
			.Parameters.Append Cmd.CreateParameter("@qTitle", adVarChar, adParamInput, 200, qTitle)
			.Parameters.Append Cmd.CreateParameter("@qContent", adVarChar, adParamInput, 5000, qContent)
			.Parameters.Append Cmd.CreateParameter("@IPaddress", adVarChar, adParamInput, 15, IPaddress)
			.Parameters.Append Cmd.CreateParameter("@QAidx", adInteger, adParamInput, 4, QAidx)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
		'dbConn.CommitTrans

		alertMsg = "질문사항이 수정되었습니다"
		pageName = pageName & "?qaMode=qav&qaStatusBit=" & qaStatusBit & "&QAidx=" & QAidx

	else
		ShowAlertMsg("시스템장애 입니다.")
	end if

	'메세지보여주고 페이지이동
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
