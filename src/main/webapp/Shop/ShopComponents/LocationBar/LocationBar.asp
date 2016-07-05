<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%
	if Request("fristLevel") <> "" then fristLevel = Request("fristLevel")
	if Request("secondLevel") <> "" then secondLevel = Request("secondLevel")
	'상품클릭
	if Request.QueryString("c") <> "" then
		fristLevel = " &gt; " & PickUpValue("vCategories", "cName", "cCode = " & Request.QueryString("c") )
	end if
	if Request.QueryString("cc") <> "" then
		if secondLevel = "" then
			secondLevel = "&gt; " & PickUpValue("vCategSecond", "c2Name", "c2Code = " & Request.QueryString("cc") )
		else
			secondLevel = "&gt; " & PickUpValue("vCategSecond", "c2Name", "c2Code = " & Request.QueryString("cc") ) & secondLevel
		end if
	end if

	LocationBar = fristLevel & secondLevel
%>
<base href="<%= Application("SiteURLDir") %>ShopComponents/LocationBar/" target="_self">
<table width="640" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;<img src="Images/icoLBar.gif" width="11" height="11"> 현재위치:
      Home <%= LocationBar %></td>
  </tr>
</table>
