<!-- #INCLUDE FILE="shared_styles.inc" -->
<html>
<head>
<title>Blue Sea Homes Visit Statistics</title>
<!--
<SCRIPT RUNAT=Server LANGUAGE="VBSCRIPT">
Function Fiks(FixWhat)
	if isnull(FixWhat) then
		Fiks="<CENTER>-</CENTER>"
	else
		Fiks=trim(FixWhat)
		if Fiks="IE" then Fiks="Internet Explorer"
		if Fiks="NS" then Fiks="Netscape"
	end if
End Function
</SCRIPT>
-->
</head>
<body bgcolor='white' text='black' background="images/bkg_fade2right.gif" link="darkviolet" alink="darkviolet" vlink="darkviolet">

<table border="0" width="100%">

<TR><TD valign=top align=center>

<TABLE width="370" border="0">
<TR>
<TD>
	<TABLE width="100%" border=0>
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%

	Set rsLog = server.createObject("ADODB.recordset")

'==================
' TOTAL SITE VISITS    
'==================

	sSQL="SELECT Min(hitDate) AS FirstHitDate "
	sSQL = sSQL & "FROM tbl_Log_Visits"
	rsLog.open sSQL, conn, 3, 3
	
	IF (rsLog.BOF and rsLog.EOF) THEN
		FirstHitDate="[No Recorded Visits]"
	else
		FirstHitDate=rsLog("FirstHitDate")
	end if

	rsLog.close

	sSQL="SELECT BrowserBrand, Count(BrowserBrand) AS CountOfBrowserBrand "
	sSQL = sSQL & "FROM tbl_Log_Visits "
	sSQL = sSQL & "GROUP BY BrowserBrand"

	rsLog.open sSQL, conn, 3, 3

		if err then
			RESPONSE.WRITE "<p>"
			RESPONSE.WRITE "SQL: " & sSQL & "<P>" 
			RESPONSE.WRITE "Error: " & err.description & "<P>"
		end if
	
		IF (rsLog.BOF and rsLog.EOF) THEN
			rsLog.close
			'set rsLog=nothing
			'none in table
		ELSE
			'loop thru recordset
			response.write "<TR>"
			response.write "<TD align=center>"
			RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR='ghostwhite'>"
			RESPONSE.WRITE "<TR><TH colspan=2 BGCOLOR='mediumslateblue'><font color='white'>Total Site Visits Since " & FirstHitDate & "</font></TH></TR>"
			'RESPONSE.WRITE "<TR><TH><font color='black'>Browser Brand</font></TH><TH><font color='black'>Hits</font></TH></TR>"
			DO WHILE not(rsLog.EOF)
				'print a row
				RESPONSE.write "<TR>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & Fiks(rsLog("BrowserBrand")) & "</font></TH>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & rsLog("CountOfBrowserBrand") & "</font></TH>"
				RESPONSE.write "</TR>"
				rsLog.MOVENEXT
				IF rsLog.EOF then EXIT DO
			LOOP
			response.write "</TABLE>"
			response.write "</TD>"
			response.write "</TR>"
			rsLog.CLOSE
			'set rsLog=nothing
		END IF

		response.write "<TR>"
			response.write "<TD>&nbsp;"
			response.write "</TD>"
		response.write "</TR>"

'=================================
' BROWSER HITS BETWEEN 7am AND 7pm 
'=================================


sSQL="SELECT BrowserBrand, Count(BrowserBrand) AS BrowserCount "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "WHERE (LogKey In (SELECT LogKey "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "WHERE (hitTime > #6:59:00# And hitTime < #19:00:00#))) "
sSQL = sSQL & "GROUP BY BrowserBrand"

	rsLog.open sSQL, conn, 3, 3

		if err then
			RESPONSE.WRITE "<p>"
			RESPONSE.WRITE "SQL: " & sSQL & "<P>" 
			RESPONSE.WRITE "Error: " & err.description & "<P>"
		end if
	
		IF (rsLog.BOF and rsLog.EOF) THEN
			rsLog.close
			'set rsLog=nothing
			'none in table
		ELSE
			'loop thru recordset
			response.write "<TR>"
			response.write "<TD align=center>"
			RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR='ghostwhite'>"
			RESPONSE.WRITE "<TR><TH colspan=2 BGCOLOR='mediumslateblue'><font color='white'>Hits between 7am and 7pm CST</font></TH></TR>"
			'RESPONSE.WRITE "<TR><TH><font color='black'>Browser Brand</font></TH><TH><font color='black'>Hits</font></TH></TR>"
			DO WHILE not(rsLog.EOF)
				'print a row
				RESPONSE.write "<TR>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & Fiks(rsLog("BrowserBrand")) & "</font></TH>"
				response.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & rsLog("BrowserCount") & "</font></TH>"
				RESPONSE.write "</TR>"
				rsLog.MOVENEXT
				IF rsLog.EOF then EXIT DO
			LOOP
			response.write "</TABLE>"
			response.write "</TD>"
			response.write "</TR>"

			rsLog.CLOSE
			'set rsLog=nothing
		END IF

		response.write "<TR>"
			response.write "<TD>&nbsp;"
			response.write "</TD>"
		response.write "</TR>"

'=================================
' BROWSER HITS BETWEEN 7pm AND Midnight
'=================================


sSQL="SELECT BrowserBrand, Count(BrowserBrand) AS BrowserCount "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "WHERE (LogKey In (SELECT LogKey "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "WHERE (hitTime > #18:59:59# And hitTime < #23:59:59#))) "
sSQL = sSQL & "GROUP BY BrowserBrand"

	rsLog.open sSQL, conn, 3, 3

		if err then
			RESPONSE.WRITE "<p>"
			RESPONSE.WRITE "SQL: " & sSQL & "<P>" 
			RESPONSE.WRITE "Error: " & err.description & "<P>"
		end if
	
		IF (rsLog.BOF and rsLog.EOF) THEN
			rsLog.close
			'none in table
		ELSE
			'loop thru recordset

			response.write "<TR>"
			response.write "<TD align=center>"
			RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR='ghostwhite'>"
			RESPONSE.WRITE "<TR><TH colspan=2 BGCOLOR='mediumslateblue'><font color='white'>Hits between 7pm and Midnight CST</font></TH></TR>"
			'RESPONSE.WRITE "<TR><TH><font color='black'>Browser Brand" & "</font></TH>" & "<TH><font color='black'>" & "Hits</font></TH></TR>"
			DO WHILE not(rsLog.EOF)
				'print a row
				RESPONSE.write "<TR>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & Fiks(rsLog("BrowserBrand")) & "</font></TH>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & rsLog("BrowserCount") & "</font></TH>"
				RESPONSE.write "</TR>"
				rsLog.MOVENEXT
				IF rsLog.EOF then EXIT DO
			LOOP
			response.write "</TABLE>"
			response.write "</TD>"
			response.write "</TR>"
			rsLog.CLOSE
		END IF


		response.write "<TR>"
			response.write "<TD>&nbsp;"
			response.write "</TD>"
		response.write "</TR>"


'=================================
' BROWSER HITS BETWEEN Midnight AND 6am
'=================================

sSQL="SELECT BrowserBrand, Count(BrowserBrand) AS BrowserCount "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "WHERE (LogKey In (SELECT LogKey "
sSQL = sSQL & "FROM tbl_Log_Visits "
sSQL = sSQL & "WHERE (hitTime > #00:00:01# And hitTime < #07:00:00#))) "
sSQL = sSQL & "GROUP BY BrowserBrand"

	rsLog.open sSQL, conn, 3, 3

		if err then
			RESPONSE.WRITE "<p>"
			RESPONSE.WRITE "SQL: " & sSQL & "<P>" 
			RESPONSE.WRITE "Error: " & err.description & "<P>"
		end if
	
		IF (rsLog.BOF and rsLog.EOF) THEN
			rsLog.close
			'none in table
		ELSE
			'loop thru recordset

			response.write "<TR>"
			response.write "<TD align=center>"
			RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR='ghostwhite'>"
			RESPONSE.WRITE "<TR><TH colspan=2 BGCOLOR='mediumslateblue'><font color='white'>Hits between Midnight and 7am CST" & "</font></TH>" & "</TR>"
			'RESPONSE.WRITE "<TR>" & sTH & "Browser Brand</font></TH><TH><font color='black'>Hits</font></TH></TR>"
			DO WHILE not(rsLog.EOF)
				'print a row
				RESPONSE.write "<TR>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & Fiks(rsLog("BrowserBrand")) & "</font></TH>"
				RESPONSE.write "<TH BGCOLOR='ghostwhite'><font color='black'>" & rsLog("BrowserCount") & "</font></TH>"
				RESPONSE.write "</TR>"
				rsLog.MOVENEXT
				IF rsLog.EOF then EXIT DO
			LOOP
			response.write "</TABLE>"
			response.write "</TD>"
			response.write "</TR>"
			rsLog.CLOSE
		END IF
set rsLog=nothing
conn.close
set conn=nothing
%>
		</TD>
	</TR>
	</TABLE>
</TD>
</TR>
</TABLE>
</TD></TR>

</table>
</body>
</html>
