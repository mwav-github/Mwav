<!-- Header Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- Header End -->
<base href="<%= Application("SiteURLDir") %>Admin/Staffs/" target="_self">
<%

   if request("page")="" then
      page=1
   else
      page=request("page")
   end if

	active = request("active")

	search = request("search")
	SearchString =request("SearchString")
	arry_search = Split(search,"-")

	'response.write arry_search(0)
	'response.write arry_search(1)
	'response.end



	SQL = "SELECT * FROM vStfMarketerList "
	if search <> "" and SearchString <> "" then
		SQL = SQL & " Where " & arry_search(0) & " like '%" & SearchString & "%' "
	end if
	if search <> "" and SearchString <> "" then
		SQL = SQL & " and active='Y' "
	else
		SQL = SQL & " Where active='Y' "
	end if
	SQL = SQL & " ORDER BY sName DESC"
	staffStatus = "활성 "

	RSresult = OpenRS(rs,SQL,50)
	recordcnt = rs.RecordCount

	'페이지
	totalpage = rs.pagecount
	rs.absolutepage = page

	if search <> "" and SearchString <> "" then
		if RSresult = "Empty" then
			Call goMsgPage("NoData" & "-" & arry_search(1) & "-" & SearchString)
		end if
		TopMsg = """" & arry_search(1) & """에서 """ & SearchString & """(으)로 검색한 결과 " & recordcnt & "개의 " & staffStatus & "직원데이터를 찾았습니다."
	else
		if RSresult = "Empty" then Call goMsgPage("NoStf")
		TopMsg = recordcnt & "개의 " & staffStatus & "프로모터 데이터를 찾았습니다."
	end if


%>

	 <table width="98%" border="0" align="center" cellspacing="2">
        <tr>
          <td height="25" colspan="10" align="center"> <table width="50%" border="0" align="right" cellspacing="0">
              <form method="POST" action="">
                <tr>
                  <td align="right"> <font color="#004080" face="Century Gothic"><small><strong>Search
                    &nbsp;&nbsp; </strong></small></font> <select name="search" size="1" style="font-family: 돋움체">
                      <option value="Sname-이름" <%= writeSelected(search, "Sname-이름") %>>이름</option>
                      <option value="sID-아이디" <%= writeSelected(search, "sID-아이디") %>>아이디</option>
                      <option value="deptName-부서" <%= writeSelected(search, "deptName-부서") %>>부서</option>
                      <option value="StaffID-사번" <%= writeSelected(search, "StaffID-사번") %>>사번</option>
                      <option value="Semail-메일" <%= writeSelected(search, "Semail-메일") %>>메일</option>
                      <option value="cellularP-핸드폰"<%= writeSelected(search, "cellularP-핸드폰") %>>핸드폰</option>
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
          <td colspan="10"> <% Call topMsgHtml(TopMsg,120) %>
          </td>
        </tr>
        <tr bgcolor="#FF9D9D">
          <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">아이디</font></strong></td>
          <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">직원명</font></strong></td>
          <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">사번</font></strong></td>
          <td height="25" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">부서</font></strong></td>
          <td height="25" align="center"><strong><font face="돋움" size="2" color="#FFFFFF">직위</font></strong></td>
          <td align="center" bgcolor="#FF8686"><strong><font face="돋움" size="2" color="#FFFFFF">프로모션</font></strong></td>
          <td align="center" bgcolor="#FF8686"><strong><font face="돋움" size="2" color="#FFFFFF">평가치</font></strong></td>
          <td align="center" bgcolor="#FF8686"><strong><font face="돋움" size="2" color="#FFFFFF">소속팀장</font></strong></td>
          <td align="center" bgcolor="#FF8686"><strong><font face="돋움" size="2" color="#FFFFFF">지원일</font></strong></td>
          <td align="center"><strong><font face="돋움" size="2" color="#FFFFFF">관리메뉴</font></strong></td>
        </tr>
        <%
i = 1
Do until rs.EOF Or i>rs.PageSize
	'맵핑
	sID = trim(rs("pID"))
	pNumber = trim(rs("pNumber"))
	pResults = trim(rs("pResults"))

	if (Cint(pResults) = 0 or Cint(pNumber) = 0) then
		estimation = 0
	else
		estimation  =  Round(Csng((Cint(pResults)/Cint(pNumber)))*100.0, 3)
	end if
	belongTo = trim(rs("belongTo"))
	pVoluntaryDT = left(trim(rs("pVoluntaryDT")),10)
	staffID = trim(rs("staffID"))
	sName = trim(rs("sName"))
	sClass = trim(rs("sClass"))
	deptName = trim(rs("deptName"))


	if homepage <> "" then homepage = "<a href=""http://" & homepage & """ target=""_blank"">http://" & homepage & "</a>"


%>
        <tr>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><a href="StfView.asp?sID=<%= sID %>&SelMode=v"><%= sID %></a></font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><a href="mailto:<%= sEmail %>"><%= sName %></a></font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><%= StaffID %></font></td>
          <td height="25" align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><%= deptName %></font></td>
          <td height="25" align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><%= Sclass %></font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><%= pResults %>/<%= pNumber %></font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><%= estimation %>%</font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><a href="StfView.asp?sID=<%= belongTo %>&SelMode=v"><%= belongTo %></a></font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000"><%= pVoluntaryDT %></font></td>
          <td align="center" bgcolor="#FFFDFD"><font face="돋움" size="2" color="#000000">
            <% if Session("sLevel4")>2 then %>
            <a href="StfInput.asp?sID=<%= sID %>&SelMode=u"><b>수정</b></A>
            <a href="StfView.asp?sID=<%= sID %>&SelMode=v"><b>삭제</b></A>
            <% else %>
            <b>해당권한없음</b>
            <% end if %>
            </font></td>
        </tr>
        <%
rs.MoveNext
i=i+1
loop


  	Call CloseRS(rs)

%>
        <tr>
          <td height="25" colspan="10" align="center" bgcolor="#FFEEEE"><font face="돋움" size="2" color="#000000">
            <% if page <> 1 then%>
            &lt; <a href="StfList.asp?page=<%=page-1%>">이전페이지</a>
            &gt;
            <%end if%>
            <% if Cint(page) <> Cint(totalpage) then%>
            &lt; <a href="StfList.asp?page=<%=page+1%>">다음페이지</a>
            &gt;
            <% end if%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=page%> page / <%=totalpage%> pages </font></td>
        </tr>
      </table>



<!-- Footer Start -->
	<!--#include File="../AdminFooter.asp"-->
<!-- Footer End -->
