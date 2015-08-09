<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<% ' 이 인클루드를 템플릿 상단데 포함시킨다. %>
<!-- caSetting Start -->
	<!--# include File = "../caSetting.asp" -->
<!-- caSetting  End -->
<script language="javascript">
<!--
	self.name="BoardNotice";
-->
</script>
	<link href="../../Include_css/Style.css" rel="stylesheet" type="text/css">
	<link href="../../Include_css/Object.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="../../Include_js/CommonFunctions.js"></script>
	<script language="JavaScript" src="../../Include_js/Function.js"></script>

<%
	Dim pageName,page,bnMode
	Dim bnRS,topCnt,selectedFields,whereClause,orderBy,RSresult
	Dim pgScope,pgStartNbr,pgSize

	pageName = Request.ServerVariables("PATH_INFO")
	'Response.Write(pageName)
	'''''''''''''''''''''''''''''''''''''''''''''
	page = Request("page")'이거 계산식이니깐..
	if page <> "" And IsNumeric(page) then
		page = CInt(page)
	else
		page = 1
	end if

	bnMode = Request("bnMode")
	if  bnMode <> "v" then
		pgScope = 10	'한페이지에 표시되는 페이지범위  갯수(바꿀 필요없음)
		pgStartNbr = Int(page / pgScope) + 1	'현재페이지 /  페이지스코프  + 1	 >>	페이지스코프의 시작번호
		If page MOD pgScope = 0 Then
			pgStartNbr = pgStartNbr - 1	'현재페이지와 페이지스코프을 나눈 몫이 0 이면, 시작페이지의 1을 뺀다.
		else
			pgStartNbr = (pgStartNbr - 1) * pgScope + 1	'다음 페이지스코프의 시작번호
		end if
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''
		if pgSize = "" then pgSize = 12	' 한페이지에 표시되는 행수
		topCnt = page * pgSize	' "100 Percent" '출력되는 리스트 수 (레코드에서 보여지는 리스트 수만을 뽑기 위해서...) 'Top topCnt
		selectedFields = "bnIdx,bnGroup,bnService,bnTitle,noticeDT"
		if SelBnGrp <> "" then
			whereClause = "bnGroup='전체' Or bnGroup = '" & SelBnGrp & "'"
		else
			whereClause = ""
		end if
		orderBy = "bnOrder DESC, bnIdx DESC"
		RSresult = SelectRecord(bnRS, pgSize, topCnt, selectedFields, "vBoardNotice", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	else  	'아래는 view모드일 경우
		bnIdx = CInt(Request("bnIdx"))
		if bnIdx = "" then Call ShowAlertMsg("게시판 유효값이 아닙니다.")
		virNbr = Request("virNbr")
		'Page = Request("Page")

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''
		pgSize = 1	' 한페이지에 표시되는 행수
		topCnt = "100 Percent" '출력되는 리스트 수 (레코드에서 보여지는 리스트 수만을 뽑기 위해서...) 'Top topCnt
		selectedFields = "bnIdx,bnGroup,bnService,bnTitle,bnSubTitle,bnContent,noticeDT,bnGroup"
		whereClause = "bnIdx = " & bnIdx
		orderBy = "" '"bnOrder DESC, bnIdx DESC"
		RSresult = SelectRecord(bnRS, pgSize, topCnt, selectedFields, "vBoardNotice", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		If RSresult = "NotEmpty" Then
			'bnIdx = bnRS("bnIdx")
			bnGroup = bnRS("bnGroup")
			bnService = bnRS("bnService")
			bnTitle = ReplaceTo(bnRS("bnTitle"), "toHTML")
			bnSubTitle = ReplaceTo(bnRS("bnSubTitle"), "toHTML")
			bnContent = ReplaceTo(bnRS("bnContent"), "toHTML")
			noticeDT = DateValue(bnRS("noticeDT"))
			bnGroup = bnRS("bnGroup")
			CloseRS(bnRS)
		else
			Response.Redirect(pageName & "?page=" & page)
		end if			'If RSresult = "NotEmpty" Then

		'해당조회수증가.
		Call ChangeFvalue("vBoardNotice","viewCount=viewCount+1","bnIdx=" & bnIdx)

		'다음, 이전 게시물 미리보기
		PLN  = PreLoadBeforeNext("plNext", "vBoardNotice", "bnIdx", "bnIdx, bnTitle")
		bnIdxNext = PLN(0)
		bnTitleNext = PLN(1)
		if bnIdxNext <> "" then IdxNextString =  "[ " & bnIdxNext  &  " ] " & bnTitleNext
		PLB  = PreLoadBeforeNext("plBefore", "vBoardNotice", "bnIdx", "bnIdx, bnTitle")
		bnIdxBefore = PLB(0)
		bnTitleBefore= PLB(1)
		if bnIdxBefore <> "" then IdxBeforeString =  "[ " & bnIdxBefore  &  " ] "  & bnTitleBefore
	end if


%>


<base href="<%= Application("SiteURLDir") %>CommonAccessories/BoardNotice/" target="_self">
<%
	'기본 디폴트로 bnMode가 널이면 무조건 리스트가 출력

	if  bnMode <> "v" then
%>

<TABLE width="100%" Border="0" Cellpadding="0" Cellspacing="1" bgColor="#FFFFFF" class="body18">
  <TR Align="center"  bgColor="#F4F4F2">
    <TD width="30" Height="30 ">번호</TD>
    <TD>공지제목</TD>
    <TD>범위</TD>
    <TD>공지일</TD>
  </TR>
<%

	If RSresult = "NotEmpty" Then

		'cursor,lockType
		'Response.Write(bnRS.cursorType)
		'Response.Write(bnRS.lockType)

		bnRS.AbsolutePage = page


		Dim totRC, virNbr
		totRC = GetRecordCount("vBoardNotice", whereClause)		'글번호
		virNbr = totRC - ((page - 1) * pgSize)	' 게시물 번호를 구하는 것이라오~

		'Do Until bnRS.EOF  Or i > bnRS.PageSize = pgSize			'조건이 거짓이면 수행하고, 참이면 벗어난다. Do While과 반대.
		for i = 1 to bnRS.PageSize
			if (bnRS.EOF) then Exit for
			bnIdx = bnRS("bnIdx")
			bnGroup = bnRS("bnGroup")
			bnService = bnRS("bnService")
			bnTitle = bnRS("bnTitle")
			noticeDT = bnRS("noticeDT")
%>
  <TR Height="25">
    <TD Align="center"><%= bnIdx %>.</TD>
    <TD>&nbsp;<A HREF="<%=pageName%>?bnMode=v&bnIdx=<%=CInt(bnIdx)%>&virNbr=<%=virNbr%>&page=<%=page%>">
	<%= ReplaceTo(ShortenString(bnTitle, 60), "toHTML") %></A></TD>
    <TD Align="center"><nobr><%= bnGroup %></nobr></TD>
    <TD Align="center"><%= DateValue(noticeDT) %></TD>
  </TR>
  <TR>
    <TD Colspan="4" background="Images/dotline.gif" height="3"></TD>
  </TR>
<%
			virNbr = virNbr - 1
			bnRS.MoveNext
		Next
		'Loop
		CloseRS(bnRS)

	Else			'''''''''''''''''''''''''''''''''''''''''''''''''

%>
  <TR>
    <TD Colspan="4" Align="center" Height="25">등록된 내용이 없습니다.</TD>
  </TR>
  <TR>
    <TD Colspan="4" background="Images/dotline.gif"></TD>
  </TR>
<% End If %>
  <TR>
    <TD colspan="4">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F2" class="body18">
        <tr>
          <td><%Call MakePageScope(pgStartNbr, pageName & "?bnMode=li&iBranch=" & iBranch, pgScope, pgSize, page, totRC)%></td>
          <td align="right">
      <A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>CommonAccessories/BoardNotice/bnForm.asp?bnMode=i&bnGroup=<%=SelBnGrp%>','bnPopup','scrollbars=yes,resizable=no,width=600,height=470')">
	  <img src="Images/bnWrite.gif" width="47" height="22" border="0" ></A>
	  <% If Session("sLevel4") <> "" Then %>
	  <a href="../../Admin/Staffs/StfExit.asp?bnMode=logout"><img src="Images/bnLogout.gif" width="22" height="22" border="0"></a> </td>
	  <% end if %>
        </tr>
      </table></TD>
  </TR>
</TABLE>

<%
	else  		'view 모드
%>

<TABLE Width="98%" Height="240" Border="0" Cellpadding="0" Cellspacing="1" class="body18">
<TR bgColor="#F4F4F2">
	<TD colspan="2">
	<TABLE Width="100%" height="60" Border="0" Cellpadding="2" Cellspacing="1" bgcolor="#FFFFFF" class="body18">
      <TR bgColor="#F4F4F2">
        <TD Height="45" Style="padding-left:5px;"><B>[<%=bnIdx%>]&nbsp;<%= bnTitle %> -<%= bnGroup %></B></TD>
        <TD Align="center"><nobr><%= noticeDT %></nobr></TD>
      </TR>
    </TABLE></TD>
  </TR>
<TR valign="top">
	<TD Colspan="2" Height="244" Style="padding:14px;"><div id="boxScroll">
		<p alin=justify><font color="8A4F41"><b><%= bnSubTitle %></b></font><br><br>
		<%= bnContent %>
	</div>	</TD>
</TR>
<TR Height="25" bgColor="#F4F4F2">
	<TD width="360" align="center"><table width="100%"  border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">
	  <tr bgcolor="#F4F4F2">
        <td width="30" align="center">다음</td>
        <td>
		<A HREF="<%= pageName %>?bnMode=v&bnIdx=<%=bnIdxNext%>&virNbr=<%=virNbr + 1%>&page=<%=page%>">
		<%=ReplaceTo(ShortenString(IdxNextString, 26),  "toHTML")%></A>
</td>
	    </tr>
          <tr bgcolor="#F4F4F2">
            <td width="30" align="center">이전</td>
            <td><A HREF="<%= pageName %>?bnMode=v&bnIdx=<%=bnIdxBefore%>&virNbr=<%=virNbr - 1%>&page=<%=page%>">
			<%=ReplaceTo(ShortenString(IdxBeforeString, 26),  "toHTML")%></A>
</td>
          </tr>
        </table>	</TD>
	<TD Align="center" bgcolor="#F4F4F2"><nobr>
	<A HREF="<%= pageName %>?Page=<%=Page%>"><IMG SRC="Images/bnList.gif" WIDTH="39" HEIGHT="22" BORDER="0"></A>
	<% If Session("sLevel4") <> "" Then %>
	<A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>CommonAccessories/BoardNotice/bnForm.asp?bnMode=u&bnIdx=<%=bnIdx%>','bnPopup','scrollbars=yes,resizable=no,width=600,height=470')"><img src="Images/bnModify.gif" width="54" height="22" border="0"></A>
	<A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>Admins/Staffs/LoginBoxForStaff/LoginBoxForStaff.asp?bnMode=d&bnIdx=<%=bnIdx%>','bnPopup','scrollbars=yes,resizable=no,width=600,height=470')"><img src="Images/bnDelete.gif" width="55" height="22" border="0"></A>
	<a href="../../Admin/Staffs/StfExit.asp?bnMode=logout"><img src="Images/bnLogout.gif" width="22" height="22" border="0"></a>
	<% else %>
	<A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>Admins/Staffs/LoginBoxForStaff/LoginBoxForStaff.asp?bnMode=login','bnPopup','scrollbars=yes,resizable=no,width=600,height=470')"><img src="Images/bnLogin.gif" width="22" height="22" border="0"></A>
	<% End If %>&nbsp;
	</nobr>	</TD>
</TR>
</TABLE>
<%
end if		'if  bnMode <> "v" then
%>





