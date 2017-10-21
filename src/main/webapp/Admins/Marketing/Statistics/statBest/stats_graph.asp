<html>

<head>
<title>Visit Statistics</title>
<!-- #INCLUDE FILE="shared_styles.inc" -->
<%
TableWidth=request.form("TableWidth")
if TableWidth=0 or TableWidth="" then TableWidth=14
%>
</head>

<body background="images/bkg_fade2right.gif" link="darkviolet" alink="darkviolet" vlink="darkviolet">

<table border="0" width="100%">

<% if Session("Custom")=0 then %>
<TR>
	<TD colspan=2 align=center>
	<form action="stats_graph.asp" method="post">
	<input type="text" name="TableWidth" value="<%=TableWidth%>" size="4">
	<input type="submit" value="Change Width">
	</form>
	</TD>
</TR>
<% end if %>

<TR>
	<TD align=center>
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
dim Row()
dim ActualDate()

redim Row(33)
redim ActualDate(33)

Set rsLog = server.createObject("ADODB.recordset")
if Session("Custom")=1 then
	sSQL="SELECT Min(hitDate) AS FirstHitDate "
	sSQL = sSQL & "FROM tbl_Log_Visits"
	rsLog.open sSQL, conn, 3, 3
	HowManyMonthsBack=DateDiff("m",rsLog("FirstHitDate"),Date)
	rsLog.close
else
	HowManyMonthsBack=1
end if

Session("Custom")=0

if HowManyMonthsBack=1 then
	DateFrom=DateAdd("d", -30, Date)
	'DateTo=DateAdd("d", 1, Date)
	DateTo=Date
	'DateTo=DateAdd("d",1,Date)
else
	DateFrom=cDate(request.form("txtDateFrom"))
	DateTo=DateAdd("m",1, DateFrom)
	DateTo=DateAdd("d",-1,DateTo)
end if

'=================================
'FILL ARRAY: Row(NumberRows)
'=================================

sSQL="SELECT hitDate, Count(hitDate) as Hits "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "GROUP BY hitDate "
sSQL = sSQL & "HAVING hitDate between #" & DateFrom & "# and #" & DateTo & "# "
sSQL = sSQL & "ORDER BY hitDate"

'response.write sSQL & "<P><BR>"

rsLog.open sSQL, conn, 3, 3

if err then
	RESPONSE.WRITE "<p>"
	'RESPONSE.WRITE "SQL: " & sSQL & "<P>" 
	RESPONSE.WRITE "Error: " & err.description & "<P>"
end if

IF (rsLog.BOF and rsLog.EOF) THEN
	rsLog.close
	'none in table
	%><!-- #INCLUDE FILE="shared_no_records.inc" --><%

ELSE
	'loop thru recordset to fill up array
	NumberRows=0
	MaxHits=0
	MinHits=999999
	TotalHits=0
	rsLog.movelast
	'NumberRows=rsLog.recordcount
	DO WHILE not(rsLog.BOF)
		'print a row
		NumberRows=NumberRows+1
		Hits=rsLog("Hits")
		Row(NumberRows)=Hits
		TotalHits=TotalHits+Hits
		ActualDate(NumberRows)=cDate(rsLog("hitDate"))
		'Response.write ""
		if Hits>MaxHits then MaxHits=Hits
		If Hits<MinHits then MinHits=Hits
		rsLog.MOVEPREVIOUS
		IF rsLog.BOF then EXIT DO
	LOOP
	rsLog.CLOSE

	'n=len(MaxHits)-1	'n=2 (digits)
		Divider=MaxHits/TableWidth
	'OLD            Divider=10^n / (TableWidth/5)
	AvgHits=int(TotalHits/NumberRows)

	'=================================
	' GRAPH!
	'=================================
	'IF int(sAppVer)<3.2 then response.write "<BR><BR>"
	RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR='ghostwhite'>"
	RESPONSE.WRITE "<TR><TD align='center' colspan=" & TableWidth+2 & " BGCOLOR='mediumslateblue'><font color='white'><b>Visits between " & ActualDate(NumberRows) & " and " & DateTo & "</b></font></TD></TR>"
	RESPONSE.WRITE "<TR><TD align='center' colspan=" & TableWidth+2 & " BGCOLOR='black'><font color='white'>Total Hits This Month: " & TotalHits & "&nbsp;&nbsp;&nbsp;&nbsp;Avg/Day: " & AvgHits &"</font></TD></TR>"
	response.Write "<TR><TD align=center bgcolor='darkblue' colspan=2><font color='white'>Date</font></TD>"
	For Column=1 to TableWidth
		Response.Write "<TD BGCOLOR='darkblue'><font color='white'>" & trim(int(Column*Divider)) & "</font></TD>"
	Next
	Response.Write "</TR>"
	For CurrentRow=1 to NumberRows
		RESPONSE.write "<TR>"
		RESPONSE.write "<TD bgcolor='darkblue'><FONT COLOR='white'>" & left(FormatDateTime(ActualDate(CurrentRow),1),3) & "</FONT></TD>" '1=vbLongDate
		RESPONSE.write "<TD bgcolor='darkblue'><FONT COLOR='white'>" & DatePart("m",ActualDate(CurrentRow)) & "/" & Day(ActualDate(CurrentRow)) & "</FONT></TD>" 'm=month

		For Column=1 to TableWidth
			iCompare=int(Column*Divider)
			OFForON="ghostwhite"
			if (Row(CurrentRow) >= iCompare) then
				RESPONSE.write "<TD bgcolor='ghostwhite'><IMG SRC='images/dolphin_tiny.jpg' ALT='" & Row(CurrentRow) & " visits on this day'></TD>"
			else
				RESPONSE.write "<TD bgcolor='ghostwhite'><font color='ghostwhite'>-" & "</font></TD>"
			end if

		Next
		RESPONSE.write "</TR>"
	Next
	response.write "</TABLE>"
END IF

set rsLog=nothing
conn.close
set conn=nothing
redim Row(0)
redim ActualDate(0)
%>	
	</TD>

</TR>
</TABLE>

</body>
</html>
