<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
'FIND ALL YEARS
Set RS = server.createObject("ADODB.recordset")
sSQL="SELECT"
'============================
'SQL Server Syntax:
'============================
'sSQL=sSQL & " DatePart(year,HitDate) as dYear"
'sSQL=sSQL & " FROM tbl_Log_Visits"
'sSQL=sSQL & " GROUP BY DatePart(year,HitDate)"
'sSQL=sSQL & " ORDER BY DatePart(year,HitDate)"
'============================
'MS Access Syntax:
'============================
sSQL=sSQL & " Year(HitDate) as dYear"
sSQL=sSQL & " FROM tbl_Log_Visits"
sSQL=sSQL & " GROUP BY Year(HitDate)"
sSQL=sSQL & " ORDER BY Year(HitDate)"

RS.open sSQL, conn, 3, 3 'read
RS.movelast
TotalYears=RS.recordcount
RS.movefirst

If TotalYears=1 then
	dYear=RS("dYear")
	RS.close
	set RS=nothing
	response.redirect "stats_page_over_time_get_month.asp?dYear=" & dYear
else
	'need to select a year
	if TotalYears>9 then TotalYears=9
%>
<HTML>
<HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!--
function SubmitMe(theForm)
	{
	theForm.submit();
	}
//-->
</SCRIPT>
<!-- #INCLUDE FILE="shared_styles.inc" -->
</HEAD>
<BODY text='black' background="images/bkg_fade2right.gif">
<BR>
<center>
<table border=0>
<TR>
<TD class='x10' align='center' bgcolor='mediumslateblue'><font color='white'>
<B>Select a Year</B>
</font>
</TD>
</TR>

<TR>
<FORM ACTION='stats_page_over_time_get_month.asp?dYear=0' METHOD='post' id=form1 name=form1>
<TD bgcolor='black' align='center'>
<% if HandlesJScript=true then %>
	<SELECT SIZE='<%=TotalYears%>' NAME='dYear' onChange='SubmitMe(this.form);'>
<% else %>
	<SELECT SIZE='<%=TotalYears%>' NAME='dYear'>
<% end if %>
<%
	do while not (RS.EOF)
		dYear=RS("dYear")
		response.write "<OPTION VALUE='" & dYear & "'> " & dYear & " </OPTION>"
		RS.movenext
	loop
%>
</Select>
</TD>
</TR>

<TR>
<TD align='center' bgcolor='mediumslateblue'>
<INPUT TYPE='submit' value='Next'>
</TD>
</FORM>
</TR>
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
