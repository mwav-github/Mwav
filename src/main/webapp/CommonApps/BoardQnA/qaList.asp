<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%
	'인증
	if  CInt(Session("sLevel4")) < 2  And Session("MbrID") = ""  And  Session("userEmail") = "" then
		Response.Redirect(pageName & "?qaMode=vali")
	end if

	'''''''''''''''''''''''''''''''''''''''''''''
	page = Request("page")
	if page <> "" And IsNumeric(page) then
		page = CInt(page)
	else
		page = 1
	end if
	'''''''''''''''''''''''''''''''''''''''''''''''
		pgScope = 10 	'한페이지에 표시되는 페이지범위  갯수
		pgStartNbr = Int(page / pgScope) + 1	'현재페이지 /  페이지스코프  + 1	 >>	페이지스코프의 시작번호
		If (page MOD pgScope = 0) Then pgStartNbr = pgStartNbr - 1	'현재페이지와 페이지스코프을 나눈 몫이 0 이면, 시작페이지의 1을 뺀다.
		pgStartNbr = (pgStartNbr - 1) * pgScope + 1	'다음 페이지스코프의 시작번호

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''
		if pgSize = "" then pgSize = 12	' 한페이지에 표시되는 행수
		topCnt = page * pgSize	' "100 Percent" '출력되는 리스트 수 (레코드에서 보여지는 리스트 수만을 뽑기 위해서...) 'Top topCnt
		selectedFields = "QAidx,MbrID,userName,qGroup,qTitle,writeOutDT"

		if Session("sID") = "" then
			if Session("MbrID") <>  "" then
				whereClause = "MbrID='" & Session("MbrID") & "'"
			elseif Session("userEmail") <> "" then
				whereClause = "userEmail='" & Session("userEmail") & "' And userPW='" & Session("userPW") & "'"
			else
				whereClause = ""
			end if
		else
			whereClause = ""
		end if			'if Session("sID") = "" then

		orderBy = "QAidx DESC, writeOutDT DESC"


		RSresult = SelectRecord(qaRS, pgSize, topCnt, selectedFields, "vQuestion", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>

<style type="text/css">
<!--
.style1 {color: #006600}
-->
</style>
<br>
<table width="500" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
                      <td width="70" height="25"><span class="style1">그룹</span></td>
                      <td><span class="style1">제목</span></td>
                      <td><span class="style1">문의자</span></td>
                      <td><span class="style1">작성일</span></td>
                      <td><span class="style1">상태</span></td>
                    </tr>
                    <tr>
                      <td height="5" colspan="5" background="Images/notice_line1.gif"></td>
                    </tr>
<%

	If RSresult = "NotEmpty" Then
		qaRS.AbsolutePage = page
		'Response.Write(qaRS.PageSize)
		'Response.write qaRS.RecordCount & "  " & totRC

		Dim totRC, virNbr
		totRC = GetRecordCount("vQuestion", whereClause)		'글번호
		virNbr = totRC - ((page - 1) * pgSize)	' 게시물 번호를 구하는 것이라오~

		'임의의 페이지로 조작해서 접속할 경우
		if CInt(page) > CInt(totRC/pgSize+1) then  Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")




		'Do Until qaRS.EOF  Or i > qaRS.PageSize = pgSize			'조건이 거짓이면 수행하고, 참이면 벗어난다. Do While과 반대.
		for i = 1 to qaRS.PageSize
			if (qaRS.EOF) then Exit for
			QAidx = qaRS("QAidx")
			MbrID = qaRS("MbrID")
			userName = qaRS("userName")
			qGroup = qaRS("qGroup")
			qTitle = qaRS("qTitle")
			writeOutDT = qaRS("writeOutDT")
			'맵핑
			if MbrID <> "" then
				inquirer = userName & "(" & MbrID & ")"
			else
				inquirer = userName
			end if

			if PickUpValue("vAnswer", "QAidx", "QAidx = " & QAidx)  <> "NoPickUp"  then
				qaStatus =  "답변완료" : qaStatusBit = 1
			else
				qaStatus =  "질문접수" : qaStatusBit = 0
			end if

%>
		<tr class="body16" onmouseover="this.style.background='#FAFAFA'"  onmouseout="this.style.background='#ffffff'">
		  <td height="18"><div align="center"><%= qGroup %></div></td>
		  <td><A HREF="<%=pageName%>?qaMode=qav&QAidx=<%=QAidx%>&virNbr=<%=virNbr%>&page=<%=page%>&qaStatusBit=<%=qaStatusBit %>">
		  <%= ReplaceTo(ShortenString(qTitle, 23), "toHTML") %></A>
		  </td>
		  <td><div align="center"><%= inquirer %></div></td>
		  <td><div align="center"><%= DateValue(writeOutDT) %></div></td>
		  <td align="center"><%= qaStatus %></td>
		</tr>
		<tr>
		  <td height="5" colspan="5" background="Images/notice_dot1.gif"></td>
		</tr>
<%
			virNbr = virNbr - 1
			qaRS.MoveNext
		Next
		'Loop
		CloseRS(qaRS)
%>

  <tr align="center">
    <td height="50" colspan="5">
	<%  Call MakePageScope(pgStartNbr, pageName & "?qaMode=li", pgScope, pgSize, page, totRC) %>	</td>
  </tr>

<%
	Else			'''''''''''''''''''''''''''''''''''''''''''''''''
%>
  <TR>
    <TD Colspan="5" Align="center" Height="100">등록된 문의내용이 없습니다.</TD>
  </TR>
  <TR>
    <TD Colspan="5" background="Images/dotline.gif"></TD>
  </TR>
<% End If %>
                    <tr bgcolor="#FAFAFA" class="body16">
                      <td height="18" align="center">
					  <% If Session("userEmail") <> "" Then %>
					  <a href="javascript:ConfirmJ('비회원 로그아웃하시겠습니까?', '<%= Application("SiteURLDir") %>CommonAccessories/BoardQnA/qaLogin_ok.asp?gotoURL=<%= pageName %>')">비회원<br>
                      로그아웃</a>
					   <% end if %></td>
                      <td><A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>CommonAccessories/BoardNotice/bnForm.asp?qaMode=i&bnGroup=<%=SelBnGrp%>','bnPopup','scrollbars=yes,resizable=no,width=600,height=470')">
					  </A><a href="<%= pageName %>?qaMode=qi"><img src="Images/qaCancle.gif" width="55" height="22" border="0"></a></td>
                      <td><div align="center"></div></td>
                      <td><div align="center">
		<A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>CommonAccessories/BoardNotice/bnForm.asp?qaMode=i&bnGroup=<%=SelBnGrp%>','bnPopup','scrollbars=yes,resizable=no,width=600,height=470')">	  </A>
	  <% If Session("sLevel4") <> "" Then %>
	  <a href="../../Admin/Staffs/StfExit.asp?qaMode=logout"><img src="Images/qaLogout.gif" width="22" height="22" border="0"></a>
	  <% end if %>
	  	</div></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="5" colspan="5" background="Images/notice_line2.gif"></td>
                    </tr>
</table>
