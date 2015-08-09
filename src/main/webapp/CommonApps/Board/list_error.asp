<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더
%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->

<%

	dim id_num,recordcount,pagecount,num,count_num
	dim pagesize,block,sql,rs,bID,tb_name

	pagesize = Request("pagesize")
	if pagesize = "" then
		pagesize=10
	end if

	page = Request("page")
	if page = "" then page = 1

	block=10



	SQL = "select count(num) as recCount from inno_admin"
	Set Rs = dbConn.Execute(SQL)

	recordCount = Rs(0)
	pagecount = int((recordCount-1)/pagesize) +1
	id_num = recordCount - (Page -1) * PageSize

	SQL = "SELECT TOP " & pagesize & " * FROM inno_admin "
	SQL = SQL & " WHERE num not in "
	SQL = SQL & "(SELECT TOP " & ((page - 1) * pagesize) & " num FROM inno_admin"
	SQL = SQL & " ORDER BY num DESC) order by num desc"
	Set Rs = dbConn.Execute(SQL)
%>

<html>
<head>
<title>▒ 이노보드 에러 ▒</title>

<LINK rel="stylesheet" type="text/css" href="IncTemplates/style.css">
</head>
<body bgcolor="#FFFFFF" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0">
<%
	'최상단
	if bTopFilePath <> "" then Server.Execute(Application("SiteRoot") & bTopFilePath)
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%= Application("SiteRoot") & bigTB_img %>">
  <tr>
    <td>

<table border="0" cellpadding="0" cellspacing="0" align="<%= bAlign %>" bgcolor="<%= tb_bgcolor %>">
  <tr>
    <td align="left" colspan="3">
<%
	'둘째상단
	if bTop1FilePath <> "" then Server.Execute(Application("SiteRoot") & bTop1FilePath)
%>
</td>
  </tr>
  <tr>
    <td align="left" valign="top">
<%
	'좌측메뉴
	if bLeftFilePath <> "" then Server.Execute(Application("SiteRoot") & bLeftFilePath)
%>
</td>
    <td valign="top">

    	<table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="left"><!-- #include File="IncTemplates/bIncludeTopTemplate.asp" --></td>
        </tr>
      <tr>
        <td width="<%=bWidth+12%>" align="center">
<!-------------------- 여기부터가 게시판 내용 ----------------->


<div align="center">
<br>
<br>

<table width=90% border=1 cellspacing=0 cellpadding=0 bgcolor=#EEEEEE bordercolorlight=gray bordercolordark=#FFFFFF>
<tr>
	<td width=90% style=font-family:Arial;font-size:8pt;color:gray nowrap style="word-break:break-all;padding:10px;" align="center">
	<font color=red><b>게시판을 선택하지 않으셨군요.<br>아래의 목록에서 게시판을 선택해 주세요.</b></font></td>
</tr>
</table>
<br>
<table cellpadding="0" cellspacing="0" border="0" width="90%">
  <tr>
    <td class="font"><img src="../img/reference.gif" border="0"> <img src="../img/total.gif" border="0"> <%=recordCount%>, &nbsp; <img src="../img/pages.gif" border="0"> <%=page%> / <%=pagecount%></td>
  </tr>
</table>
<table width="90%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="4" height="22">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="18" bgcolor="#333333">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr align="center">
			<td width="50"><font color="#FFFFFF"><b>번 호</b></font></td>
			<td><font color="#FFFFFF"><b>게시판 이름</b></font></td>
			<td width="220"><font color="#FFFFFF"><b>경 로</b></font></td>
			<td width="100"><font color="#FFFFFF"><b>미리보기</b></font></td>
		</tr></table></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	</table></td>
</tr>


<%
	Do until Rs.EOF

    num = rs("num")
    bID = rs("bID")
    tb_name = rs("tb_name")

%>
<tr align="center" height="20">
	<td colspan="4">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="center">
		<td width="50"><%=num%></td>
		<td><b><%=tb_name%></b></td>
		<td width="220"><a href="../board/bList.asp?bID=<%=bID%>">../board/bList.asp?bID=<%=bID%></a></td>
		<td width="100"><a href="../board/bList.asp?bID=<%=bID%>">보 기</a></td>
		</tr></table></td>
</tr>
<tr>
	<td colspan="4" height="1" bgcolor="#999999"></td>
</tr>
<%
    Rs.Movenext
	id_num = id_num - 1
	Loop

%>
<tr>
	<td colspan="4" height="8">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#333333"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	</table></td>
</tr>

<tr>
	<td colspan="4" height="15" align="center">
		<% If Rs.BOF Then %>

	<%
		Else
		If Int(Page) <> 1 Then
	%>
		<a href="tb_bList.asp?page=<%=Page-1%>&pagesize=<%=pagesize%><% if sw<>"" then %>&ss=<%=ss%>&sw=<%=sw%><% end if %>" onfocus="this.blur()"><font color="#000000" style="font-size:8pt;">[prv]</font></a>
	<%
		end if

		First_Page = Int((Page-1)/Block)*Block+1
		If First_Page <> 1 Then
	%>
			[<a href="tb_bList.asp?page=1&pagesize=<%=pagesize%><% if sw<>"" then %>&ss=<%=ss%>&sw=<%=sw%><% end if %>" onfocus="this.blur()"><font color="#000000" style="font-size:8pt;">1</font></a>]&nbsp;..
	<%
		end if

		If PageCount - First_Page < Block Then
			End_Page = PageCount
		Else
			End_Page = First_Page + Block - 1
		End If

		For i = First_Page To End_Page
		If Int(Page) = i Then
	%>
			[<font color="#FF0000" style="font-size:8pt;"><b><%=i%></b></font>]
	<% Else %>
			[<a href="tb_bList.asp?page=<%=i%>&pagesize=<%=pagesize%><% if sw<>"" then %>&ss=<%=ss%>&sw=<%=sw%><% end if %>" onfocus="this.blur()"><font color="#000000" style="font-size:8pt;"><%=i%></font></a>]
	<%
		End If
		Next

		If End_Page <> PageCount Then
	%>
	&nbsp;..&nbsp;[<a href="tb_bList.asp?page=<%=PageCount%>&pagesize=<%=pagesize%><% if sw<>"" then %>&ss=<%=ss%>&sw=<%=sw%><% end if %>" onfocus="this.blur()"><font color="000000" style="font-size:8pt;"><%=PageCount%></font></a>]
	<%
		end if

		If Int(Page) <> PageCount Then
	%>
	&nbsp;<a href="tb_bList.asp?page=<%=page+1%>&pagesize=<%=pagesize%><% if sw<>"" then %>&ss=<%=ss%>&sw=<%=sw%><% end if %>" onfocus="this.blur()"><font color="#000000" style="font-size:8pt;">[next]</font></a>
	<%
		End If
		End If
	%>

	</td>
</tr>
</table>

<%

  Rs.close
  db.close
  Set Rs = Nothing
  Set db = Nothing
%>
</div>

<!-------------------- 여기부터가 게시판 내용 끝----------------->
	</td>
        </tr>
      <tr>
        <td align="left"><!-- #include File="IncTemplates/bIncludeBottomMsgTemplate.asp" --></td>
        </tr>
    </table>

    </td>
    <td align="left" valign="top">
<%
	'우측메뉴
	if bRightFilePath <> "" then Server.Execute(Application("SiteRoot") & bRightFilePath)
%>
</td>
  </tr>
</table>
    	</td>
  </tr>
</table>

<%
	'최하단
	if bBottomFilePath <> "" then Server.Execute(Application("SiteRoot") & bBottomFilePath)
%>


</body>
</html>
