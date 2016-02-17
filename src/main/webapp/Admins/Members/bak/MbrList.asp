<!-- AdminHeader Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- AdminHeader End -->
<base href="<%= Application("SiteURLDir") %>Admin/Members/" target="_self">
<%
   if request("page")="" then
      page=1
   else
      page=request("page")
   end if

	Mbr = request("Mbr")

	search = request("search")
	SearchString =request("SearchString")
	arry_search = Split(search,"-")

	'response.write arry_search(0)
	'response.write arry_search(1)
	'response.end



	SQL = "SELECT MbrID,MbrName,phone,cellularP,MbrEmail,SSN1,SSN2,level4,HowMuch,HowMany"
	SQL = SQL & ",RFund,RFundAC,unpaid,unpaidAC,joinDT,recentLogin,company FROM vMbrList "

	if search <> "" and SearchString <> "" then
		SQL = SQL & " Where " & arry_search(0) & " like '%" & SearchString & "%' "
	end if
	'비활성회원
	if Mbr = "miss" then
		if search <> "" and SearchString <> "" then
			SQL = SQL & " and missYouDT is not null "
		else
			SQL = SQL & " Where missYouDT is not null "
		end if
		memberStatus = "탈퇴요청 "
	elseif Mbr = "lvl0" then
		if search <> "" and SearchString <> "" then
			SQL = SQL & " and level4=0 "
		else
			SQL = SQL & " Where level4=0 "
		end if
		memberStatus = "불량 "
	else
		if search <> "" and SearchString <> "" then
			SQL = SQL & " and (missYouDT is null) and (level4>0) "
		else
			SQL = SQL & " Where (missYouDT IS NULL) and (level4>0) "
		end if
		memberStatus = "정상 "
	end if


	if Mbr = "royal" then
		SQL = SQL & " ORDER BY HowMuch DESC, RFundAC DESC "
		memberStatus = "로얄 "
	elseif Mbr ="recent" then
		SQL = SQL & " ORDER BY recentLogin DESC "
		memberStatus = "최근방문 "
	else
		SQL = SQL & " ORDER BY joinDT DESC "
	end if


	
	RSresult = OpenAdvRS(rs, SQL, 70, 1, 3)
	if RSresult <> "Empty" then
		recordcnt = rs.RecordCount
		'페이지
		totalpage = rs.pagecount
		rs.absolutepage = page
		'GetString로 받아냄
		AllRec = rs.GetString(2, rs.PageSize) 	'(adClipString=2, RS.PageSize)
        rows = split(AllRec,chr(13))
	end if
	
		

	if search <> "" and SearchString <> "" then
		if not IsArray(rows) then Call goMsgPage("NoData" & "-" & arry_search(1) & "-" & SearchString)
		TopMsg = """" & arry_search(1) & """에서 """ & SearchString & """(으)로 검색한 결과 " & recordcnt & "개의 " & memberStatus & "회원데이터를 찾았습니다."
	else
		if not IsArray(rows) then Call goMsgPage("NoMbr")
		TopMsg = recordcnt & "개의 " & memberStatus & "회원데이터를 찾았습니다."
	end if



%>
	 <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="25" align="center"> <table width="50%" border="0" align="right" cellspacing="0">
              <form method="POST" action="">
                <tr>
                  <td align="right"> <font color="#004080" face="Century Gothic"><small><strong>Search
                    &nbsp;&nbsp; </strong></small></font> <select name="search" size="1" style="font-family: 돋움체">
                      <option value="MbrName-이름" <%= writeSelected(search, "MbrName-이름") %>>이름</option>
                      <option value="MbrID-아이디" <%= writeSelected(search, "MbrID-아이디") %>>아이디</option>
                      <option value="phone-일반전화" <%= writeSelected(search, "phone-일반전화") %>>일반전화</option>
                      <option value="cellularP-핸드폰"<%= writeSelected(search, "cellularP-핸드폰") %>>핸드폰</option>
                      <option value="MbrEmail-메일" <%= writeSelected(search, "MbrEmail-메일") %>>메일</option>
                    </select> <input name="SearchString" type="text" style="border: 1px dashed" value="<%= SearchString %>" size="20">
                    <input type="submit" value=" 검 색 " name="btn" style="background-color: rgb(238,238,238); color: rgb(0,47,94); font-weight: bolder">
                  </td>
                  <td width="30" height="50">&nbsp;</td>
                </tr>
              </form>
            </table>
            <br clear="all"> </td>
        </tr>
        <tr>
          <td> <% Call topMsgHtml(TopMsg,120) %> </td>
        </tr>
        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="2">
              <tr bgcolor="#5CC765">
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">아이디</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">회원명(歲)</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">연락번호</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">핸드폰</font></strong></td>
                <td height="25" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">등급</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">구입총액/횟수</font></strong></td>
                <td align="center"><strong><font color="#FFFFFF" size="2" face="돋움">현/누적포인트</font></strong></td>
                <td align="center"><strong><font color="#FFFFFF" size="2" face="돋움">현/누적미납액</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">최근로그인</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">가입일</font></strong></td>
                <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">관리메뉴</font></strong></td>
              </tr>
              <%
'i = 1
'Do until rs.EOF Or i>rs.PageSize

	'맵핑
	 for j=0 to Ubound(rows)-1
	     cols = split(rows(j),chr(9))
			MbrID  = trim(cols(0))
			MbrName = trim(cols(1))
			phone = trim(cols(2))
			cellularP = trim(cols(3))
			MbrEmail = trim(cols(4))
			SSN1 = trim(cols(5))
			SSN2 = trim(cols(6))
			level4 = trim(cols(7))
			HowMuch = trim(cols(8))
			HowMany = trim(cols(9))
			RFund = trim(cols(10))
			RFundAC = trim(cols(11))
			unpaid = trim(cols(12))
			unpaidAC = trim(cols(13))
			joinDT = trim(cols(14))
			recentLogin = trim(cols(15))
			company = trim(cols(16))


			if IsNumeric(SSN1) then
				if CInt(Left(SSN1, 2)) <= 99 then
					age = Year(now) - CInt(19&Left(SSN1, 2)) + 1
				else
					age = Year(now) - CInt(20&Left(SSN1, 2)) + 1
				end if
			else
				age = "?"
			end if

			joinDT = left(joinDT,10)


%>
              <tr bgcolor="#FDFFFB">
                <td align="center"><font face="돋움" size="2" color="#000000"><a href="MbrView.asp?MbrID=<%= MbrID %>&SelMode=v"><%= MbrID %></a></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><a href="mailto:<%= sEmail %>"><%= MbrName %>(<%= age %>)</a></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= phone %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= cellularP %></font></td>
                <td height="25" align="center"><font face="돋움" size="2" color="#000000"><%= level4 %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= HowMuch %>/<%= HowMany %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= RFund %>/<%= RFundAC %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= unpaid %>/<%= unpaidAC %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= recentLogin %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000"><%= joinDT %></font></td>
                <td align="center"><font face="돋움" size="2" color="#000000">
                  <% if Session("sLevel4")>2 then %>
                  <a href="MbrInput.asp?MbrID=<%= MbrID %>&SelMode=u"><b>수정</b></A>
                  <a href="MbrView.asp?MbrID=<%= MbrID %>&SelMode=v"><b>삭제</b></A>
                  <% else %>
                  <b>해당권한없음</b>
                  <% end if %>
                  </font></td>
              </tr>
              <%
          next
'rs.MoveNext
'i=i+1
'loop


  	Call CloseRS(rs)

%>
              <tr bgcolor="#F7FFF0">
                <td height="25" colspan="11" align="center"><font face="돋움" size="2" color="#000000">
                  <% if page <> 1 then%>
                  &lt; <a href="MbrList.asp?page=<%=page-1%>">이전페이지</a>
                  &gt;
                  <%end if%>
                  <% if Cint(page) <> Cint(totalpage) then%>
                  &lt; <a href="MbrList.asp?page=<%=page+1%>">다음페이지</a>
                  &gt;
                  <% end if%>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=page%> page / <%=totalpage%> pages </font></td>
              </tr>
            </table></td>
        </tr>
      </table>



<!-- AdminFooter Start -->
	<!--#include File="../AdminFooter.asp"-->
<!-- AdminFooter End -->
