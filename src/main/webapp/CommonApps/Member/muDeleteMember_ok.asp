<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- Header Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- Header End -->

<%
	MbrID = trim(request("MbrID"))
	'Validation Check
	if MbrID="" or session("level4")<3 then Call ShowAlertMsg("권한을 확인하세요")
	
	SQL = "UPDATE [vMbrHiddenValue] SET "
	SQL = SQL & " missYouDT = getdate() "
	SQL = SQL & " where MbrID = '" & MbrID & "'"
	dbConn.Execute SQL

	
	'연관된 데이타삭제
	Call GotoThePage("정상적으로 정보를 삭제했습니다.", "MbrList.asp?refl=600")

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
   		Call goMsgPage("DBerr")
		'Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>


<!-- Footer Start -->
	<!--#include File="../AdminFooter.asp"-->
<!-- Footer End -->
