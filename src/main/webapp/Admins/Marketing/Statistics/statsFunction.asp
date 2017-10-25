<%
''''''''''''''''''''''' 변수 실제값과 매핑  '''''''''''''''
Function GetPCWvalue(pcw)
    pcwArray = split(pcw, ";")

    Dim PCWvalue(4)
    PCWvalue(0) = pcwArray(0)

    'PmoterID
    'rocktry, s1free2, yousayok
    	Select Case pcwArray(0)
    		Case "rocktry"
                stat_Pname = "팬도르"
    		Case "s1free2"
                stat_Pname = "조남진"
    		Case "yousayok"
                stat_Pname = "왕총무"
    	  	Case Else
    	  	    'PmoterID = "SiteRoot"
    	  	    stat_Pname = Application("shopName")
    	End Select
     PCWvalue(1) = stat_Pname

    'CameFromPage
    '없으면 NoName
    	Select Case pcwArray(1)
    		Case "100"
                CameFromPage = "스팸이메일"
    		Case "200"
                CameFromPage = "게시판"
    		Case "300"
    			CameFromPage = "회원이메일"
    	  	Case Else
    	  	    CameFromPage = "관련정보없음"
    	End Select
    	PCWvalue(2) = CameFromPage

    'WhatsAbout
    	Select Case pcwArray(2)
    		Case "10000"
                WhatsAbout = "사이트 오픈 기념으로 이벤트"
    		Case "10001"
                WhatsAbout = "파격 이벤트1"
    		Case "10002"
                WhatsAbout = "파격 이벤트2"
    	  	Case Else
    	  	    WhatsAbout = "관련정보없음"
    	End Select
    	PCWvalue(3) = WhatsAbout

    GetPCWvalue = PCWvalue
End Function


'pINFO정보를 간단하게 얻는다. 뒤로 부터 바로 부모 디렉토리까지.
Function GetpINFOshort(pINFO)
    'startIndex = InStrRev(pINFO,"/")
    'pINFOshort = Mid(pINFO, startIndex)
    jj = 0
    pINFOrev = StrReverse(pINFO)
    'Response.write pINFOrev
    for ii = 1 to Len(pINFOrev)
        if Mid(pINFOrev,ii,1) = "/" then
            jj = jj + 1
            if jj = 2 then Exit for
        end if
    next
    if jj >= 2 then
        pINFOshort = "..." & StrReverse(Left(pINFOrev, ii))
    else
        pINFOshort = StrReverse(Left(pINFOrev, ii))
    end if
    GetpINFOshort = pINFOshort
End Function




'지정한 날의 카운트수를 구한다.
Function GetDayCount(whichDay)          'GetDayCount(#2003-01-03#),GetDayCount("2003-01-03")
    SQL = "SELECT COUNT(*) AS dayCount FROM vStatistics "
    SQL = SQL & " WHERE YEAR(stat_date) = '" & YEAR(whichDay) & "'"
    SQL = SQL & " and MONTH(stat_date) = '" & MONTH(whichDay) & "'"
    SQL = SQL & " and DAY(stat_date) = '" & DAY(whichDay) & "'"
	RSresult = OpenSimpleRS(rsWD,SQL)
    if RSresult <> "Empty" then
		dayCount = trim(rsWD("dayCount"))
		Call CloseRS(rsWD)
	end if

	GetDayCount = dayCount
End Function


'페이지이름이 바뀌었으면 업데이트 한다.
Sub UpdatePageName(PATH_INFO,CameToThePage)          'Call UpdatePageName(PATH_INFO,CameToThePage)
    SQL = "SELECT log_CameToThePage "
    SQL = SQL & " FROM vStat_Log "
    SQL = SQL & " WHERE log_pINFO = '" & PATH_INFO & "'"

	RSresult = OpenSimpleRS(rsPN,SQL)
    if RSresult <> "Empty" then
	    log_CameToThePage = trim(rsPN("log_CameToThePage"))
		Call CloseRS(rsPN)
	end if

    if stat_CameToThePage <> CameToThePage then
        SQL = "Update vStatistics set stat_CameToThePage = '" & CameToThePage & "'"
        SQL = SQL & " WHERE stat_pINFO = '" & PATH_INFO & "'"
        dbConn.Execute SQL

        SQL = "Update vStat_Log set log_CameToThePage = '" & CameToThePage & "'"
        SQL = SQL & " WHERE log_pINFO = '" & PATH_INFO & "'"
        dbConn.Execute SQL
    end if
'response.write sql
End Sub

%>