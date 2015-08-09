<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- caSetting Start -->
	<!--#include File = "../caSetting.asp" -->
<!-- caSetting  End -->

<%
	
	'Validation Check			
	qaMode = Request("qaMode")
	QAidx = Request("QAidx")
	gotoURL = Request.QueryString("gotoURL")
	'인증부분
	if qaMode = "" Or QAidx = "" Or gotoURL = "" then Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
	

	
	if qaMode = "qd" then	'질문삭제
		'인증
		'if  CInt(Session("sLevel4")) < 2  And Session("MbrID") = ""  And  Session("userEmail") = "" then
		'	Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
		'end if
		if CInt(Session("sLevel4")) > 1 then		'관리자이므로 무조건 삭제한다.
			'해당질문에 답변이 있다면 삭제
			Call DeleteRecord("vAnswer", "QAidx = " & QAidx)
			Call DeleteRecord("vQuestion", "QAidx = " & QAidx)
			alertMsg = "해당질문과 답변을 삭제하였습니다."
		elseif Session("MbrID") <> "" Or Session("userEmail") <> "" then
			'회원이 답변이 있는 글을 삭제 할 때는 삭제하지 못하게 한다.
			if PickUpValue("vAnswer", "QAidx", "QAidx = " & QAidx) <> "NoPickUp" then ShowAlertMsg("답변있는 글은 삭제할 수 없습니다.")
			Call DeleteRecord("vQuestion", "QAidx = " & QAidx)
			alertMsg = "해당질문을 삭제하였습니다."
		else 
			Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
		end if		'if CInt(Session("sLevel4")) < 2 then

		gotoURL = gotoURL & "?qaMode=li"
	elseif qaMode = "ad" then	'답변삭제
		'인증
		if CInt(Session("sLevel4")) < 2 then  
			Call ShowAlertMsg("삭제할 수 있는 권한이 작습니다.")
		end if
		Call DeleteRecord("vAnswer", "QAidx = " & QAidx)
		alertMsg = "답변을 삭제하였습니다."

		gotoURL = gotoURL & "?qaMode=qav&qaStatusBit=0&QAidx=" & QAidx
	else
		Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
	end if		'if qaMode = "qd" then

	'메세지보여주고 페이지이동
	
	Call GotoThePage(alertMsg, gotoURL)

%>

<%
    ' The Transacted Script Commit Handler.  This sub-routine
    ' will be called if the transacted script commits.
    Sub OnTransactionCommit()
		Response.Write "<P><B>업데이트가 성공적으로 이루어졌습니다</B>."
    End Sub


    ' The Transacted Script Abort Handler.  This sub-routine
    ' will be called if the script transacted aborts
    Sub OnTransactionAbort()
    	'Call goMsgPage("DBerr")
		'Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>

