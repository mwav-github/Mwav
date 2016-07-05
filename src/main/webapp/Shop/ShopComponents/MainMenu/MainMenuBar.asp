<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>ShopComponents/MainMenu/" target="_self">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
<%
	SQL = "SELECT cCode, cName From vCategoryRel "
	SQL = SQL & " Order By cOrder DESC"

	RSresult = OpenSimpleRS(CRrs, SQL)

	if RSresult <> "Empty" then

		Do until CRrs.EOF
			cCode = trim(CRrs("cCode"))
			cName = trim(CRrs("cName"))
			MMBarName = "MMBar" & cCode & ".gif"
%>


    <td><a href="../../ShopBody/GoodsListBody.asp?c=<%= cCode %>"><img src="BarImages/<%= MMBarName %>" alt="<%= cName %>" border="0"></a></td>
<%
			CRrs.MoveNext
		Loop
		Call CloseRS(CRrs)
	else
		Response.Write("메인카테고리를 설정하세요")
	end if  'if RSresult <> "Empty" then
%>
    <td><img src="BarImages/MMBar22.gif" width="100" height="35"></td>	
  </tr>
</table>
