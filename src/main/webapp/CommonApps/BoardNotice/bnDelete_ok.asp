<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- caSetting Start -->
	<!--#include File = "../caSetting.asp" -->
<!-- caSetting  End -->

<%
	
	'Validation Check
	if CInt(Session("sLevel4")) < 3 then  
		Call GotoThePage("권한이 작습니다. 다시 로그인하세요.", "../../Admins/Staff/LoginBoxForStaff/LoginBoxForStaff.asp?gotoURL=" & gotoURL)
	end if
	
	bnIdx = CInt(request("bnIdx"))


	'데이타삭제
	Call DeleteRecord("vBoardNotice", "bnIdx = " & bnIdx)

	'메세지보여주공/부모페이지리로드/자기자신창닫기
	Call ShowAlertMsgClose("해당데이터가 정상적으로 삭제됐습니다.")


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

