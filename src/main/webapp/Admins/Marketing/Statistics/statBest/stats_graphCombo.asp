<HTML>
<head>
<!-- #INCLUDE FILE="shared_styles.inc" -->

<SCRIPT LANGUAGE="JavaScript">
<!--
function SubmitMe(theForm)
	{
	theForm.submit();
	}
//-->
</SCRIPT>

</head>

<body background="images/bkg_fade2right.gif">
<BR>
<table border="0" width="100%">

<TR>
	<td align=center>
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
Set rsLog = server.createObject("ADODB.recordset")
'==================
'    TOTAL SITE VISITS    
'==================

sSQL="SELECT Min(hitDate) AS FirstHitDate "
sSQL = sSQL & "FROM tbl_Log_Visits"

rsLog.open sSQL, conn, 3, 3
HowManyMonthsBack=DateDiff("m",rsLog("FirstHitDate"),Date)
'response.write "<BR><BR>"
'response.write "FirstHitDate: " & rsLog("FirstHitDate")
'response.write "Date: " & Date
'response.write "How Many Months Back: " & HowManyMonthsBack
'response.write "<BR><BR>"
rsLog.close
set rsLog=nothing
conn.close
set conn=nothing
Session("Custom")=1
%>

<form name="form" METHOD="POST" action="stats_graph.asp">
<table border=0 cellSpacing=0>
  <tr valign=top>
	<td class=small align=center>

<select SIZE=5 NAME='txtDateFrom' onChange='SubmitMe(this.form);'>

<%
if HowManyMonthsBack=1 then
	DateFrom=DateAdd("d", -31, Date)
	DateTo=Date
	response.write "<option SELECTED value='" &  cDate(DateFrom) & "'> " & cDate(DateFrom) & " to " & cDate(DateTo) & "</option>"

else

	For X=0 to HowManyMonthsBack
		DateFrom=DateAdd("m", -X, Date)
		TheYear=DatePart("yyyy",DateFrom)
		TheMonth=DatePart("m",DateFrom)
		s_LongDate=FormatDateTime(DateFrom,1)
		i=instr(s_LongDate,",")
		s_Month=mid(s_LongDate,i+1,4)
		if X=0 then
			response.write "<option SELECTED value='" &  trim(TheMonth) & "/1/" & trim(TheYear) & "'> " & s_Month & " " & TheYear & "</option>"
		else
			response.write "<option value='" &  trim(TheMonth) & "/1/" & trim(TheYear) & "'> " & s_Month & " " & TheYear & "</option>"
		end if
	Next
end if
%>
	</select><BR>
	<b>Date Range<BR>to Display</b>
	</td>
	</tr>

	<TR><TD align=center>&nbsp;</TD></TR>
	<TR><TD align=center><input type="submit" value=" Graph! "></TD></TR>

</table>	
	</td>

</TR>
</TABLE>

</body>
</HTML>
