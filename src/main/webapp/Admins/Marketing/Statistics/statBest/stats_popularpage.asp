<html>
<head>
<!-- #INCLUDE FILE="shared_styles.inc" -->
<title>Visit Statistics</title>
</head>
<body bgcolor='white' text='black' background="images/bkg_fade2right.gif" link="darkviolet" alink="darkviolet" vlink="darkviolet">

<table border=0 align=center width="100%">

<TR><TD valign=top align=center>
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
Set rsLog = server.createObject("ADODB.recordset")

sSQL="SELECT PageName, Count(PageName) as Hits "
sSQL = sSQL & "FROM tbl_Log_PageHit "
sSQL = sSQL & "GROUP BY PageName "
'sSQL = sSQL & "HAVING hitDate between #" & DateFrom & "# and #" & DateTo & "# "
sSQL = sSQL & "ORDER BY Count(PageName) DESC, PageName"

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
	response.write "<Table>"
	response.write "<TR>"
	response.write "<TD>"
	response.write "<HR size=4>"
	response.write "Sorry, there are no visits to these<BR>"
	response.write "pages showing in the database.<BR>"
	response.write "<HR size=4>"
	response.write "</TD>"
	response.write "</TR>"
	response.write "</TABLE>"
ELSE
	'find max hits, min hits, and how many records
	NumberRows=0
	MaxHits=0
	MinHits=999999
	DO WHILE not(rsLog.EOF)
		'print a row
		NumberRows=NumberRows+1
		Hits=rsLog("Hits")
		if Hits>MaxHits then MaxHits=Hits
		If Hits<MinHits then MinHits=Hits
		rsLog.MOVENEXT
		IF rsLog.EOF then EXIT DO
	LOOP

	TableWidth=10
	Divider=MaxHits/TableWidth
	if Divider<1 then Divider=1

	'=================================
	' GRAPH!
	'=================================
	
	RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR=" & "ghostwhite" & ">"
	RESPONSE.WRITE "<TR><TH colspan=" & TableWidth+1 & " BGCOLOR='mediumslateblue'><font color='white'>Page Popularity Within This Site</TH></TR>"
	response.Write "<TD></TD>"
	For Column=1 to TableWidth
		Response.Write "<TD BGCOLOR='darkblue'><font color='white'>" & trim(int(Column*Divider)) & "</font></TD>"
	Next
	
	rsLog.movefirst
	For CurrentRow=1 to NumberRows

		RESPONSE.write "<TR>"
		RESPONSE.write "<TD bgcolor='darkblue'><FONT COLOR='white'>" & rsLog("PageName") & "</font></TD>"
		RowData=rsLog("Hits")
		For Column=1 to TableWidth
			iCompare=int(Column*Divider)
			OFForON="ghostwhite"
			if (RowData = iCompare or RowData > iCompare or Column=1) then
			RESPONSE.write "<TD bgcolor='ghostwhite'><IMG SRC='images/Dolphin_tiny.jpg' ALT='" & RowData & "'></TD>"
			else
				RESPONSE.write "<TD bgcolor='ghostwhite'><font color='ghostwhite'>-" & "</font></TD>"
			end if

		Next
		RESPONSE.write "</TR>"
		rsLog.movenext
	Next
	rsLog.close
	set rsLog=nothing
	conn.close
	set conn=nothing
	response.write "</TABLE>"
END IF
%>
</TD></TR>

</table>
</body>
</html>
