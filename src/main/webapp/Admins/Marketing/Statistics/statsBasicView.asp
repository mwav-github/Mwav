<!-- Header Start -->
<!--#include virtual="/admin/AdminHeader.asp"-->
<!-- Header End -->

<!-- stats_function -Start -->
	<!--#include virtual="/admin/Statistics/statsFunction.asp"-->
<!-- stats_function -End -->

<%
	Response.Buffer=True

	'프락시 서버 캐싱방지
	'서버에 존재하는 프록시로 부터 페이지를 전혀 캐싱하지 못하게 함.
	Response.Expires = -1
	Response.Expiresabsolute = Now()
	Response.CacheControl = "private"
	Response.AddHeader "pragma", "no-cache"
	Response.AddHeader "cache-control", "private"

	Server.ScriptTimeout = 1000000000

    '조회기간을 받는다.
    sYear = Trim(Request.form("sYear"))
    sMonth = Trim(Request.form("sMonth"))
    sDay = Trim(Request.form("sDay"))
    eYear = Trim(Request.form("eYear"))
    eMonth = Trim(Request.form("eMonth"))
    eDay = Trim(Request.form("eDay"))
    if sYear = "" or sMonth = "" or sDay = "" then
        sYear = 0
        sMonth = 0
        sDay = 0
        eYear = Year(now())
        eMonth = Month(now())
        eDay = Day(now())
        response.write "aaaaaaaaaaaaaa"
        SQLr = " stat_date is not null "
    elseif sYear = "0" or sMonth = "0" or sDay = "0" then
        sYear = 0
        sMonth = 0
        sDay = 0
        response.write "bbbbbbbbbbbbbb"
        eYMD = eYear & "-" & eMonth & "-" & eDay
        SQLr = " stat_date <= '" & eYMD & "'"
        'SQLr = SQLr & ""
    else
        sYMD = sYear & "-" & sMonth & "-" & sDay
        eYMD = eYear & "-" & eMonth & "-" & eDay
        SQLr = " stat_date BETWEEN '" & sYMD & "' AND '" & eYMD & "'"
    end if


    '오늘, 어제 접속자수
    todayCount = GetDayCount(DATE())
    yesterdayCount = GetDayCount(DATE() - 1)

    '일 총, 평균, 최소, 최대 접속자수 계산
    SQL = "SELECT DATEPART([day], stat_date) AS eachDay,"
    SQL = SQL & " COUNT(DATEPART([day], stat_date)) AS eachCount "
    SQL = SQL & " FROM dbo.vStatistics "
    SQL = SQL & " WHERE " & SQLr
    SQL = SQL & " GROUP BY DATEPART([day], stat_date) "
    Set rsMMA = Server.CreateObject("ADODB.Recordset")
    rsMMA.Open SQL,db,1

    i = 0
    eachMax = 0
    eachCountHAB = 0
    eachAvg = 0

    if not rsMMA.BOF or not rsMMA.EOF then
        recordcnt = rsMMA.RecordCount
        Do until rsMMA.EOF
            i=i+1
            eachCount = trim(rsMMA("eachCount"))
            eachCountHAB = eachCountHAB + Cint(eachCount)
            if eachCount > eachMax then eachMax = eachCount '최대값
            if i = 1 then eachMin = eachCount   '첫번째 값으로 최소값초기화
            if eachCount < eachMin then eachMin = eachCount '최소값
            rsMMA.MoveNext
        loop
        eachAvg = eachCountHAB / recordcnt
    else
        eachMin = 0
    end if
    rsMMA.Close
    Set rsMMA = Nothing
    '일 총, 평균, 최소, 최대 접속자수 계산 -End


    '자주접속한 고객
    SQL = "SELECT TOP 10 stat_MemID, COUNT(stat_MemID) AS MemIDcnt "
    SQL = SQL & " FROM vStatistics "
    SQL = SQL & " WHERE (stat_MemID IS NOT NULL) "
    SQL = SQL & " AND " & SQLr
    SQL = SQL & " GROUP BY stat_MemID "
    SQL = SQL & " ORDER BY COUNT(stat_MemID) DESC "
    Set rsFid = Server.CreateObject("ADODB.Recordset")
    rsFid.Open SQL,db,1
    i = 0
    dim stat_MemID(6)
    dim MemIDcnt(6)
    if not rsFid.BOF or not rsFid.EOF then
        Do until rsFid.EOF
            stat_MemID(i) = trim(rsFid("stat_MemID"))
            MemIDcnt(i) = trim(rsFid("MemIDcnt"))
            if i > 5 then EXIT Do '상위 6개만 필요
            i = i + 1
            rsFid.MoveNext
        loop
    end if
    rsFid.Close
    Set rsFid = Nothing
    '자주접속한 고객 -End

    '자주접속한 페이지
    SQL = "SELECT TOP 10 log_pINFO,log_CameToThePage AS PageTitleName, COUNT(log_pINFO) AS pINFOcnt "
    SQL = SQL & " FROM vStat_Log "
    SQL = SQL & " WHERE (log_pINFO IS NOT NULL) "
    SQL = SQL & " AND " & replace(SQLr,"stat_date","log_date")
    SQL = SQL & " GROUP BY log_pINFO, log_CameToThePage "
    SQL = SQL & " ORDER BY COUNT(log_pINFO) DESC "
    Set rsPg = Server.CreateObject("ADODB.Recordset")
    rsPg.Open SQL,db,1
'response.write sql
    i = 0
    dim log_pINFO(6)
    dim PageTitleName(6)
    dim pINFOcnt(6)
    if not rsPg.BOF or not rsPg.EOF then
        Do until rsPg.EOF
            log_pINFOtemp = trim(rsPg("log_pINFO"))
            startIndex = InStrRev(log_pINFOtemp,"/")
            log_pINFO(i) = Mid(log_pINFOtemp, startIndex + 1)
            PageTitleName(i) = trim(rsPg("PageTitleName"))
            if PageTitleName(i) = "" then PageTitleName(i) = "NoPageName"
            pINFOcnt(i) = trim(rsPg("pINFOcnt"))
            if i > 5 then EXIT Do '상위 6개만 필요
            i = i + 1
            rsPg.MoveNext
        loop
    end if
    rsPg.Close
    Set rsPg = Nothing
    '자주접속한 페이지 -End


    '프로모터 순위
    SQL = "SELECT TOP 10 stat_PmoterID, stat_Pname, COUNT(stat_PmoterID) AS PIDcnt "
    SQL = SQL & " FROM vStatistics "
    SQL = SQL & " WHERE (stat_PmoterID IS NOT NULL) "
    SQL = SQL & " AND " & SQLr
    SQL = SQL & " GROUP BY stat_PmoterID, stat_Pname "
    SQL = SQL & " ORDER BY COUNT(stat_PmoterID) DESC "
    Set rsPid = Server.CreateObject("ADODB.Recordset")
    rsPid.Open SQL,db,1
'response.write sql
    i = 0
    dim stat_PmoterID(6)
    dim stat_Pname(6)
    dim PIDcnt(6)
    if not rsPid.BOF or not rsPid.EOF then
        Do until rsPid.EOF
            stat_PmoterID(i) = trim(rsPid("stat_PmoterID"))
            stat_Pname(i) = trim(rsPid("stat_Pname"))
            PIDcnt(i) = trim(rsPid("PIDcnt"))
            if i > 5 then EXIT Do '상위 6개만 필요
            i = i + 1
            rsPid.MoveNext
        loop
    end if
    rsPid.Close
    Set rsPid = Nothing
    '프로모터 순위 -End








%>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= MainDomain %>/admin/Statistics/" target="_self">
<table width="100%" border="0" cellspacing="2" cellpadding="1">
        <tr align="right">
          <td colspan="5"><table width="600" border="0" cellpadding="1" cellspacing="2">
              <tr>
                <td align="right" bgcolor="#CCFFFF">적용 기간 </td>
                <form name="periodFrm" method="post" action="stats_summaryView.asp">
                  <td colspan="2" align="right" bgcolor="#CCFFFF"> <select name="sYear">
                      <option value=0 <% if sYear = "" or sYear = 0 then %>selected<% end if %>>All</option>
                      <% for i = 2000 to Year(now()) %>
                      <option value="<%= i %>" <% if i = Cint(sYear) then %>selected<% end if %>><%= i %></option>
                      <% Next %>
                    </select>
                    년
                    <select name="sMonth">
                      <option value=0 <% if sMonth = "" or sMonth = 0 then %>selected<% end if %>>All</option>
                      <% for i = 1 to 12 %>
                      <option value="<%= i %>" <% if i = Cint(sMonth) then %>selected<% end if %>><%= i %></option>
                      <% Next %>
                    </select>
                    월
                    <select name="sDay">
                      <option value=0 <% if sDay = "" or sDay = 0 then %>selected<% end if %>>All</option>
                      <% for i = 1 to 31 %>
                      <option value="<%= i %>" <% if i = Cint(sDay) then %>selected<% end if %>><%= i %></option>
                      <% Next %>
                    </select>
                    일~
                    <select name="eYear">
                      <% for i = 2000 to Year(now()) %>
                      <option value="<%= i %>" <% if i = Cint(eYear) then %>selected<% end if %>><%= i %></option>
                      <% Next %>
                    </select>
                    년
                    <select name="eMonth">
                      <% for i = 1 to 12 %>
                      <option value="<%= i %>" <% if i = Cint(eMonth) then %>selected<% end if %>><%= i %></option>
                      <% Next %>
                    </select>
                    월
                    <select name="eDay">
                      <% for i = 1 to 31 %>
                      <option value="<%= i %>" <% if i = Cint(eDay) then %>selected<% end if %>><%= i %></option>
                      <% Next %>
                    </select>
                    일
                    <input type="submit" name="Submit" value="해당기간조회"> </td>
                </form>
              </tr>
            </table> </td>
          <form name="periodFrm" method="post" action="stats_summaryView.asp">
          </form>
        </tr>
        <tr>
          <td colspan="5"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
              <tr align="center">
                <td width="20%">기본통계(년,월,일,시,요일)</td>
                <td width="20%">프로모션통계</td>
                <td width="20%">로그데이타분석</td>
                <td width="20%">기타 사용자환경</td>
              </tr>
            </table></td>
        </tr>
        <tr align="center">
          <td height="30" colspan="5"><font color="#0033CC" size="2"><strong>요약보기</strong></font></td>
        </tr>
        <tr align="center" bgcolor="#0033CC">
          <td height="20" bgcolor="#0033CC"><font color="#FFFFFF">기본 일단위 카운터</font></td>
          <td height="20"><font color="#FFFFFF">페이지 인기도</font></td>
          <td height="20"><font color="#FFFFFF">회원이용순위&nbsp;</font></td>
          <td height="20"><font color="#FFFFFF">&nbsp;프로모터순위</font></td>
          <td><font color="#FFFFFF">URL교환협력업체</font></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center">
                <td height="20" bgcolor="#D2DEFF">오늘접속자수수</td>
                <td width="30%"><p><%= todayCount %>명</p></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#D2DEFF">어제접속자수수</td>
                <td><%= yesterdayCount %>명</td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">평균접속자수수</td>
                <td><%= Round(eachAvg,2) %>명</td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">최대접속자수수</td>
                <td><%= eachMax %>명</td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">최소접속자수수</td>
                <td><%= eachMin %>명</td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">총 접속자수수</td>
                <td><%= eachCountHAB %>명</td>
              </tr>
            </table></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if log_pINFO(0) <> "" then %>
                  <%= log_pINFO(0) %>(<%= PageTitleName(0) %>)
                  <% end if %>
                </td>
                <td width="30%"><%= pINFOcnt(0) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if log_pINFO(1) <> "" then %>
                  <%= log_pINFO(1) %>(<%= PageTitleName(1) %>)
                  <% end if %>
                </td>
                <td><%= pINFOcnt(1) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if log_pINFO(2) <> "" then %>
                  <%= log_pINFO(2) %>(<%= PageTitleName(2) %>)
                  <% end if %>
                </td>
                <td><%= pINFOcnt(2) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if log_pINFO(3) <> "" then %>
                  <%= log_pINFO(3) %>(<%= PageTitleName(3) %>)
                  <% end if %>
                </td>
                <td><%= pINFOcnt(3) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if log_pINFO(4) <> "" then %>
                  <%= log_pINFO(4) %>(<%= PageTitleName(4) %>)
                  <% end if %>
                </td>
                <td><%= pINFOcnt(4) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if log_pINFO(5) <> "" then %>
                  <%= log_pINFO(5) %>(<%= PageTitleName(5) %>)
                  <% end if %>
                </td>
                <td><%= pINFOcnt(5) %></td>
              </tr>
            </table></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if stat_MemID(0) <> "" then %>
                  <%= stat_MemID(0) %>
                  <% end if %>
                </td>
                <td width="30%"><%= MemIDcnt(0) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if stat_MemID(1) <> "" then %>
                  <%= stat_MemID(1) %>
                  <% end if %>
                </td>
                <td><%= MemIDcnt(1) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if stat_MemID(2) <> "" then %>
                  <%= stat_MemID(2) %>
                  <% end if %>
                </td>
                <td><%= MemIDcnt(2) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if stat_MemID(3) <> "" then %>
                  <%= stat_MemID(3) %>
                  <% end if %>
                </td>
                <td><%= MemIDcnt(3) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if stat_MemID(4) <> "" then %>
                  <%= stat_MemID(4) %>
                  <% end if %>
                </td>
                <td><%= MemIDcnt(4) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF">
                  <% if stat_MemID(5) <> "" then %>
                  <%= stat_MemID(5) %>
                  <% end if %>
                </td>
                <td><%= MemIDcnt(5) %></td>
              </tr>
            </table></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"> <% if stat_PmoterID (0) <> "" then %> <%= stat_Pname(0) %>(<%= stat_PmoterID(0) %>)
                  <% end if %> </td>
                <td><%= PIDcnt(0) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"> <% if stat_PmoterID (1) <> "" then %> <%= stat_Pname(1) %>(<%= stat_PmoterID(1) %>)
                  <% end if %> </td>
                <td><%= PIDcnt(1) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"> <% if stat_PmoterID (2) <> "" then %> <%= stat_Pname(2) %>(<%= stat_PmoterID(2) %>)
                  <% end if %> </td>
                <td><%= PIDcnt(2) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"> <% if stat_PmoterID (3) <> "" then %> <%= stat_Pname(3) %>(<%= stat_PmoterID(3) %>)
                  <% end if %> </td>
                <td><%= PIDcnt(3) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"> <% if stat_PmoterID (4) <> "" then %> <%= stat_Pname(4) %>(<%= stat_PmoterID(4) %>)
                  <% end if %> </td>
                <td><%= PIDcnt(4) %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"> <% if stat_PmoterID (5) <> "" then %> <%= stat_Pname(5) %>(<%= stat_PmoterID(5) %>)
                  <% end if %> </td>
                <td><%= PIDcnt(5) %></td>
              </tr>
            </table></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"><%= subNo %></td>
                <td><%= subNo %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"><%= subNo %></td>
                <td><%= subNo %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"><%= subNo %></td>
                <td><%= subNo %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"><%= subNo %></td>
                <td><%= subNo %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"><%= subNo %></td>
                <td><%= subNo %></td>
              </tr>
              <tr align="center">
                <td height="20" bgcolor="#E6ECFF"><%= subNo %></td>
                <td><%= subNo %></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="5"> <%
   if request("page")="" then
      page=1
   else
      page=request("page")
   end if

	SQL = "SELECT stat_Key,stat_sNAME,stat_hHOST,stat_sPORT,stat_pINFO,stat_ADDR,stat_HOST,stat_uAGENT,stat_hREFERER,stat_PmoterID,stat_Pname"
    SQL = SQL & ",stat_CameFromPage,stat_CameToThePage,stat_WhatsAbout,stat_MemID,stat_SessionID,stat_date "
	SQL = SQL & " FROM vStatistics "
	SQL = SQL & " WHERE " & SQLr
	SQL = SQL & " ORDER BY stat_Key DESC "
    Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL,db,1
	response.write sql
%>
            <%  if rs.BOF or rs.EOF then %> <p> </p>
            <p> </p>
            <p> </p>
            <center>
              아무 데이타가 없슴다
            </center>
            <p> </p>
            <%
else
'페이지
    rs.PageSize = 70
    totalpage = rs.pagecount
    rs.absolutepage = page

	AllRec = RS.GetString(2, rs.PageSize) 	'(adClipString=2, RS.PageSize)
	rows = split(AllRec,chr(13))

%> <table width="90%" height="50" border="0" align="center" cellspacing="0">
              <form method="POST" action="Ms_result.asp">
                <tr>
                  <td><font color="#0033CC" size="2"><strong>요약 상위 70리스트 </strong></font>
                  </td>
                  <td align="right"><font color="#004080" face="Century Gothic"><small><strong>Search
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></small></font> <select name="search" size="1" style="font-family: 돋움체">
                      <option value="Mid">아이디</option>
                      <option value="MFname">이름</option>
                      <option value="HmPhone">연락처</option>
                      <option value="Email">메일</option>
                    </select> &nbsp;&nbsp;&nbsp; <input type="text" name="SearchString" size="20" style="border: 1px dashed">
                    <input type="submit" value=" 검 색 " name="btn" style="background-color: rgb(238,238,238); color: rgb(0,47,94); font-weight: bolder"></td>
                </tr>
              </form>
            </table>
            <table width="100%" border="0" align="center" cellspacing="2">
              <tr>
                <td bgcolor="#000080" align="center" height="25"><strong><font face="돋움" size="2" color="#FFFFFF">Key</font></strong></td>
                <td bgcolor="#000080" align="center" height="25"><strong><font face="돋움" size="2" color="#FFFFFF">hHOST:sPORT</font></strong></td>
                <td bgcolor="#000080" align="center" height="25"><strong><font face="돋움" size="2" color="#FFFFFF">pINFO</font></strong></td>
                <td bgcolor="#000080" align="center" height="25"><strong><font face="돋움" size="2" color="#FFFFFF">HOST</font></strong></td>
                <td bgcolor="#000080" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">uAGENT</font></strong></td>
                <td bgcolor="#000080" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">hREFERER</font></strong></td>
                <td bgcolor="#000080" align="center" height="25"><strong><font face="돋움" size="2" color="#FFFFFF">Pmoter</font></strong></td>
                <td bgcolor="#000080" align="center"><strong><font color="#FFFFFF" size="2" face="돋움">접속경로</font></strong></td>
                <td bgcolor="#000080" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">WhatsAbout</font></strong></td>
                <td bgcolor="#000080" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">MemID</font></strong></td>
                <td bgcolor="#000080" align="center" height="25"><strong><font face="돋움" size="2" color="#FFFFFF">Date</font></strong></td>
              </tr>
              <%
'i = 1
'Do until rs.EOF Or i>rs.PageSize
	 for j=0 to Ubound(rows)-1
	     cols = split(rows(j),chr(9))
			'Response.Write(rows(j))

            st_Key = trim(cols(0))
            's_sNAME = trim(cols(1))
            st_hHOST = trim(cols(2))
            st_sPORT = trim(cols(3))
            st_pINFO = GetpINFOshort(trim(cols(4)))
            'st_ADDR = trim(cols(5))
            st_HOST = trim(cols(6))
            st_uAGENT = trim(cols(7))
            st_hREFERER = Left(trim(cols(8)),40)
            st_PmoterID = trim(cols(9))
            st_Pname = trim(cols(10))
            st_CameFromPage = trim(cols(11))
            st_CameToThePage = trim(cols(12))
            st_WhatsAbout = trim(cols(13))
            st_MemID = trim(cols(14))
            'st_SessionID = trim(cols(15))
            st_date = trim(cols(16))
%>
              <tr <% if (j mod 2) = 0 then %>bgcolor="#F0F0FF"<% else %>bgcolor="#FFFFFF"<% end if %>>
                <td height="25" align="center"><font face="돋움" size="2" color="#000000"><a href="#?st_Key=<%= st_Key %>"><%= st_Key %></a></font></td>
                <td height="25" align="center"><font face="돋움" size="2" color="#000000"><a href="mailto:<%= Email %>"><%= st_hHOST %></a>:<a href="mailto:<%= Email %>"><%= st_sPORT %></a></font></td>
                <td height="25" align="center"><font face="돋움" size="2" color="#000000"><%= st_pINFO %></font></td>
                <td height="25" align="center"><font face="돋움" size="2" color="#000000"><%= st_HOST %></font></td>
                <td align="center"><font face="돋움" size="1" color="#000000"><%= st_uAGENT %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= st_hREFERER %></font></td>
                <td height="25" align="center"> <% if st_PmoterID <> "" then %> <%= st_Pname %>(<%= st_PmoterID %>)
                  <% end if %> </td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= st_CameFromPage %><br>
                  -&gt;<%= st_CameToThePage %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= st_WhatsAbout %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= st_MemID %></font></td>
                <td height="25" align="center"><font face="돋움" size="2" color="#000000">
                  <%= st_date %></font> </td>
              </tr>
              <%
	    next
'rs.MoveNext
'i=i+1
'loop
%>
            </table></center></div>
            <center>
              <hr width="98%">
            </center>
            <center>
              <font face="돋움" size="2" color="#000000">
              <% if page <> 1 then%>
              &lt; <a href="Mlist.asp?page=<%=page-1%>">이전페이지</a>
              &gt;
              <%end if%>
              <% if Cint(page) <> Cint(totalpage) then%>
              &lt; <a href="Mlist.asp?page=<%=page+1%>">다음페이지</a>
              &gt;
              <% end if%>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=page%> page / <%=totalpage%> pages </font>
            </center>
            <% end if

   rs.Close
   Set rs = Nothing
   db.Close
   Set db = Nothing
%> </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
<!-- Footer Start -->
	<!--#include virtual="/admin/AdminFooter.asp"-->
<!-- Footer End -->
