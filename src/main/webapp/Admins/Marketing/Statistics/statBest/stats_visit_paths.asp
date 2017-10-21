<html>
<head>
<!-- #INCLUDE FILE="shared_styles.inc" -->
<title>Visit Statistics</title>
<!--meta http-equiv="refresh" content="360"-->
<%
on error resume next
DaysAgo=request.form("DaysAgo")
if DaysAgo="" then DaysAgo=0
%>
</head>
<body bgcolor='white' text='black' background="images/bkg_fade2right.gif" link="darkviolet" alink="darkviolet" vlink="darkviolet">
<BR>
<center>
	<form action="stats_visit_paths.asp" method="post" id=form1 name=form1>
	<input type="text" name="DaysAgo" value="<%=DaysAgo%>" size="3" maxlength='2'>
	<input type="submit" value="Days Ago" id=submit1 name=submit1>
	</form>
</center>

<table border=0 align=center width="100%">

<TR><TD valign=top align=center>
<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
'on error resume next

ThisDay=left(MonthName(Month(Date)),3) & " " & Day(Date)-DaysAgo & " " & Year(Date)

Set rsLog = server.createObject("ADODB.recordset")
sSQL = "SELECT"
'sSQL = sSQL & " Right(str(tbl_Log_PageHit.intSessionID),4) as Sesh"
'sSQL = sSQL & " tbl_Log_PageHit.Remote_Addr,"
sSQL = sSQL & " tbl_Log_Visits.IP_Came_From as WhereFrom"
sSQL = sSQL & ",tbl_Log_Visits.BrowserBrand"
sSQL = sSQL & ",tbl_Log_Visits.BrowserVersion"
'sSQL = sSQL & ", tbl_Log_PageHit.HitDate"
sSQL = sSQL & ", tbl_Log_PageHit.HitTime"
sSQL = sSQL & ", tbl_Log_PageHit.PageName"
sSQL = sSQL & " FROM tbl_Log_Visits"
sSQL = sSQL & " RIGHT JOIN tbl_Log_PageHit ON tbl_Log_Visits.intSessionID = tbl_Log_PageHit.intSessionID"

'sSQL = sSQL & " WHERE (((tbl_Log_PageHit.HitDate) LIKE '" & ThisDay & "%') AND tbl_Log_PageHit.Remote_Addr NOT LIKE '209.39.229.100') "
'for SQL Server: sSQL = sSQL & " WHERE tbl_Log_PageHit.HitDate = '" & ThisDay & " 12:00AM' "

sSQL = sSQL & " WHERE tbl_Log_PageHit.HitDate = #" & ThisDay & "#"

'sSQL = sSQL & " ORDER BY tbl_Log_PageHit.intSessionID Desc"
sSQL = sSQL & " ORDER BY tbl_Log_PageHit.HitTime Desc"

'response.write sSQL & "<P><BR>"
rsLog.open sSQL, conn, 3, 3

if err.number<>0 then
	RESPONSE.WRITE "<p>"
	RESPONSE.WRITE "SQL: " & sSQL & "<P>" 
	RESPONSE.WRITE "Error: " & err.description & "<P>"
end if

IF (rsLog.BOF and rsLog.EOF) THEN
	rsLog.close
	set rsLog=nothing
	'none in table
	response.write "<Table>"
	response.write "<TR>"
	response.write "<TD>"
	response.write "<HR size=4>"
	response.write ThisDay & "<BR>"
	response.write "Sorry, there are no visits to these<BR>"
	response.write "pages showing in the database.<BR>"
	response.write "<HR size=4>"
	response.write "</TD>"
	response.write "</TR>"
	response.write "</TABLE>"
ELSE
	rsLog.movelast
	Rows=rsLog.recordcount
	rsLog.movefirst

	dim Who()
	dim Wo()
		
	redim Wo(Rows,20)
	
	'loop thru recordset to fill up array
	RowCounter=0
	TableWidth=0
	ColMax=0
	DO WHILE not(rsLog.EOF)
		Browser=trim(rsLog("BrowserBrand"))
		if isnull(Browser) then Browser="??"
		Version=trim(cstr(rsLog("BrowserVersion")))
		Browser=Browser & Version
		if (isnull(rsLog("WhereFrom")) or len(rsLog("WhereFrom"))=0) then
			WhoSurf=Browser
		else
			WhereFrom=rsLog("WhereFrom")
			WhoSurf=Browser & " from<BR>" & WhereFrom
		end if

		'remove date and seconds from hit time
		HitTime=rsLog("HitTime")

		'for MS Access:
		'========================
		ampm=right(HitTime,2)
		size=len(HitTime)
		HitTime=left(HitTime,size-6) & ampm
		'========================

		'for SQL Server:
		'========================
		'spayce=instr(1,HitTime," ")
		'size=len(HitTime)
		'HitTime=right(HitTime,size-spayce)
		'ampm=right(HitTime,2)
		'size=len(HitTime)
		'HitTime=left(HitTime,size-6) & ampm
		'========================

		if RowCounter=0 then
			RowCounter=1
			redim preserve Who(RowCounter)
			Who(RowCounter)=WhoSurf
				
			Col=Col+1
			'if Col>ColMax then ColMax=Col
			'redim Preserve Wo(100,ColMax+1)
			Wo(RowCounter,Col)=rsLog("PageName") & "<BR>" & HitTime
			lastone=rsLog("PageName")
		else
			if  WhoSurf=Who(RowCounter) then
				if (lastone=rsLog("PageName") or Col>19) then
					'they hit same page twice in row... ignore
				else
					Col=Col+1
					'if Col>ColMax then ColMax=Col
					'redim preserve Wo(250,ColMax+1)
					Wo(RowCounter,Col)=rsLog("PageName") & "<BR>" & HitTime
					lastone=rsLog("PageName")
				end if
			else
				RowCounter=RowCounter+1
				redim preserve Who(RowCounter)
				'redim preserve Wo(250,ColMax+1)
				Who(RowCounter)=WhoSurf
				Col=1
				Wo(RowCounter,Col)=rsLog("PageName") & "<BR>" & HitTime
				lastone=rsLog("PageName")
			end if
		end if
		rsLog.MOVENEXT
		IF rsLog.EOF then EXIT DO
		if Col>TableWidth then TableWidth=Col
	LOOP
	rsLog.CLOSE
	set rsLog=nothing
	conn.close
	set conn=nothing
	NumRows=RowCounter
	If TableWidth>10 then TableWidth=10
	RESPONSE.WRITE "<TABLE BORDER=1 BGCOLOR='ghostwhite'>"
	RESPONSE.WRITE "<TR><TH colspan=" & TableWidth+1 & " BGCOLOR='mediumslateblue'><font color='white'>Paths Taken By Today's Visitors</TH></TR>"
	RESPONSE.WRITE "<TR><TH colspan=" & TableWidth+1 & " BGCOLOR='mediumslateblue'><font color='black'>Pacific Standard Time</TH></TR>"
	response.Write "<TD></TD>"

	For RowCounter=1 to NumRows
		RESPONSE.write "<TR>"
		RESPONSE.write "<TD bgcolor=" & "darkblue" & "><FONT COLOR=white>" & Who(RowCounter) & "</font></TD>"
		For Column=1 to TableWidth
			if len(Wo(RowCounter,Column))>0 then
				RESPONSE.write "<TD class='x08' bgcolor='ghostwhite'><small>" & Wo(RowCounter,Column) & "</small></TD>"
			else
				RESPONSE.write "<TD bgcolor='ghostwhite'><font color='ghostwhite'>-" & "</font></TD>"
			end if
		Next
		RESPONSE.write "</TR>"
	Next
	response.write "</TABLE>"
END IF

redim Who(0)
redim Wo(0,0)
%>
</TD></TR>

</table>
</body>
</html>
