<HTML>
<HEAD>
<!-- #INCLUDE FILE="shared_styles.inc" -->
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
dYear=request.querystring("dYear")
if dYear=0 then dYear=request.form("dYear")
session("dYear")=dYear

'show months avail for year selected
Set RS = server.createObject("ADODB.recordset")
sSQL="SELECT"
'============================
'SQL Server Syntax:
'============================
'sSQL=sSQL & " DatePart(month,HitDate) AS dMonth"
'sSQL=sSQL & " FROM tbl_Log_Visits"
'sSQL=sSQL & " WHERE DatePart(year,HitDate)=" & session("dYear")
'sSQL=sSQL & " GROUP BY DatePart(month,HitDate)"
'sSQL=sSQL & " ORDER BY DatePart(month,HitDate)"
'============================
'MS Access Syntax:
'============================
sSQL=sSQL & " Month(HitDate) AS dMonth"
sSQL=sSQL & " FROM tbl_Log_Visits"
sSQL=sSQL & " WHERE Year(HitDate)=" & session("dYear")
sSQL=sSQL & " GROUP BY Month(HitDate)"
sSQL=sSQL & " ORDER BY Month(HitDate)"

RS.open sSQL, conn, 3, 3 'read
RS.movelast
TotalMonths=RS.recordcount
RS.movefirst

If TotalMonths=1 then
	dMonth=RS("dMonth")
	RS.close
	set RS=nothing
	response.redirect "stats_page_over_time_get_page.asp?dMonth=" & dMonth
else
	'need to select a year
%>
</HEAD>
<BODY text='black' background="images/bkg_fade2right.gif" link="darkviolet" alink="darkviolet" vlink="darkviolet">
<BR>
<center>
<table border=0>
<TR>
<TD colspan='3' class='x10' align='center' bgcolor='mediumslateblue'><font color='white'>
<B>Select Date Range From the Year <%=dYear%></B>
</font>
</TD>
</TR>

<FORM ACTION='stats_page_over_time_get_page.asp?dMonth=0' METHOD='post'>

<TR>

<TD ALIGN='right' bgcolor='black'>
<SELECT SIZE='<%=TotalMonths%>' NAME='dMonth_start'>
<%
	do while not (RS.EOF)
		dMonth=RS("dMonth")
		response.write "<OPTION VALUE='" & dMonth & "'> " & MonthName(dMonth) & " </OPTION>"
		RS.movenext
	loop
%>
</Select>
</TD>

<TD bgcolor='black'><font color='white'><b>&nbsp;thru&nbsp;</b></font></TD>

<TD ALIGN='left' bgcolor='black'>
<SELECT SIZE='<%=TotalMonths%>' NAME='dMonth_end'>
<%
	RS.movefirst
	do while not (RS.EOF)
		dMonth=RS("dMonth")
		response.write "<OPTION VALUE='" & dMonth & "'> " & MonthName(dMonth) & " </OPTION>"
		RS.movenext
	loop
%>
</Select>
</TD>
</TR>

<TR>
<TD COLSPAN='3' ALIGN='center' bgcolor='mediumslateblue'>
<INPUT TYPE='submit' value='&nbsp;&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;&nbsp;'>
</TD>
</TR>
</TABLE>
</center>
</FORM>
<%
end if
RS.close
set RS=nothing
conn.close
set conn=nothing
%>
</BODY>
</HTML>
