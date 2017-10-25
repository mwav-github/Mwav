<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%

if session("VisitLogged")=0 then
	%><!-- #INCLUDE FILE="shared_log_visit.inc" --><%
end if

if len(sPageName)>0 then
	sRemote_Addr=request.serverVariables("REMOTE_ADDR")
	sSQL="INSERT INTO tbl_Log_PageHit ("
	sSQL=sSQL & "PageName,"
	sSQL=sSQL & "Remote_Addr,"
	sSQL=sSQL & "hitDate,"
	sSQL=sSQL & "hitTime,"
	sSQL=sSQL & "intSessionID"
	sSQL=sSQL & ") "
	sSQL=sSQL & "Values ("
	sSQL=sSQL & "'" & sPageName & "',"
	sSQL=sSQL & "'" & sRemote_Addr & "',"
	sSQL=sSQL & "#" & date & "#,"
	sSQL=sSQL & "#" & time & "#,"
	sSQL=sSQL & Session.SessionID
	sSQL=sSQL & ")"
	conn.execute(sSQL)
end if
%>
