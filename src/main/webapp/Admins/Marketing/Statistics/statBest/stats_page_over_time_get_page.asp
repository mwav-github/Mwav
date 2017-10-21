<HTML>
<HEAD>
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<SCRIPT LANGUAGE="JavaScript">
<!--
function SubmitMe(theForm)
	{
	theForm.submit();
	}
//-->
</SCRIPT>
<!-- #INCLUDE FILE="shared_styles.inc" -->
<%
dMonth=request.querystring("dMonth")
if dMonth=0 then
	session("dMonth_start")=request.form("dMonth_start")
	session("dMonth_end")=request.form("dMonth_end")
else
	session("dMonth_start")=dMonth
	session("dMonth_end")=dMonth
end if

'show pages avail
Set RS = server.createObject("ADODB.recordset")
sSQL="SELECT"
sSQL=sSQL & " PageName"
sSQL=sSQL & " FROM tbl_Log_PageHit"
sSQL=sSQL & " GROUP BY PageName"
sSQL=sSQL & " ORDER BY PageName"
RS.open sSQL, conn, 3, 3 'read
RS.movelast
TotalPages=RS.recordcount
RS.movefirst

If TotalPages=1 then
	session("PageName")=RS("PageName")
	RS.close
	set RS=nothing
	response.redirect "stats_page_over_time_show.asp"
else
	session("PageName")=0
	'need to select a year
%>
</HEAD>
<BODY text='black' background="images/bkg_fade2right.gif" link="darkviolet" alink="darkviolet" vlink="darkviolet">
<BR>
<center>
<table border=0>
<TR>
<TD class='x10' align='center' bgcolor='mediumslateblue'><font color='white'>
<B>Select a Page to track over selected time period</B>
</font>
</TD>
</TR>

<TR>
<FORM ACTION='stats_page_over_time_show.asp' METHOD='post' id=form1 name=form1>
<TD align='center' bgcolor='black'>
<%
if TotalPages>9 then TotalPages=9
	Response.Write "<SELECT SIZE='" & TotalPages & "' NAME='PageName' onChange='SubmitMe(this.form);'>"
	do while not (RS.EOF)
		PageName=RS("PageName")
		response.write "<OPTION VALUE='" & PageName & "'> " & PageName & " </OPTION>"
		RS.movenext
	loop
%>
</Select>
</TD>
</TR>
<TR>
<TD align='center' bgcolor='mediumslateblue'>
<INPUT TYPE='submit' value='&nbsp;&nbsp;&nbsp;&nbsp;Finish&nbsp;&nbsp;&nbsp;&nbsp;'>
</TD>
</TR>
</FORM>
</Table>
</center>
<%
end if
RS.close
set RS=nothing
conn.close
set conn=nothing
%>
</BODY>
</HTML>
