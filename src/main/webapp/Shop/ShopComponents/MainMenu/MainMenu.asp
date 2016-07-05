<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%
	SQL = "SELECT cCode, cName From vCategoryRel "
	SQL = SQL & " Order By cOrder DESC"

	RSresult = OpenSimpleRS(CRrs, SQL)

	if RSresult <> "Empty" then
%>

<base href="<%= Application("SiteURLDir") %>ShopComponents/MainMenu/" target="_self">
<table width="150" border="0" cellspacing="0" cellpadding="0">
<%  
		Do until CRrs.EOF
			cCode = trim(CRrs("cCode"))
			cName = trim(CRrs("cName"))
			MMname = "MM" & cCode & ".gif"
			'gInputDT = trim(CRrs("gInputDT"))
			'작은 이미지 구하기
			'smallImage = PickUpValue("vMasterImages", "pName", "gCode = '" & gCode & "' And imgSize = 'S'")
			'if smallImage = "NoPickUp" then smallImage ="iSdefault.gif"
%>
  <tr>
    <td width="10" height="30">&nbsp;</td>
    <td><a href="../../ShopBody/GoodsListBody.asp?c=<%= cCode %>"><img src="Images/<%= MMname %>" alt="<%= cName %>" border="0"></a></td>
  </tr>
<%
			CRrs.MoveNext
		Loop
%>  
</table>
<%
		Call CloseRS(CRrs)
	else
		Response.Write("메인카테고리를 설정하세요")
	end if  'if RSresult <> "Empty" then
%>	