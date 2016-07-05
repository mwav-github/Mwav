<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%
	SQL = "SELECT Top 4 * From vClassifiedGoods "
	SQL = SQL & " Where gSpecial ='Y' "

	RSresult = OpenAdvRS(SpRS, SQL, 5, 1, 3)

	if RSresult <> "Empty" then
		c = Request.QueryString("c")
%>

<base href="<%= Application("SiteURLDir") %>ShopComponents/ClassifiedGoods/BestGoods/" target="_self">
<table width="640" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4"><img src="../Images/gBestTitle.gif" width="286" height="42"></td>
  </tr>
  <tr>
<%  
		Do until SpRS.EOF
			gCode = trim(SpRS("gCode"))
			gMnum = trim(SpRS("gMnum"))
			gName = trim(SpRS("gName"))
			SMprice = trim(SpRS("SMprice"))
			Sprice = trim(SpRS("Sprice"))
			displayOnly  = trim(SpRS("displayOnly"))
			'작은 이미지 구하기
			smallImage = PickUpValue("vMasterImages", "pName", "gCode = '" & gCode & "' And imgSize = 'S'")
			if smallImage = "NoPickUp" then smallImage ="iSdefault.gif"
			
			if c = "" then 
				c = PickUpValue("vGoodsList_c", "cCode", "gCode = '" & gCode & "'")
			end if
%>
	<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="120"><a href="../../../ShopBody/GoodsDetailBody.asp?c=<%= c %>&cc=<%= cc %>&g=<%= gCode %>"><img src="<%= Application("SiteURLDir") %>Images/Goods_Images/<%= smallImage %>" border="0"></a></td>
        </tr>
        <tr>
          <td height="30">
		  <%= gName %>(<%= gMnum %>)<br>
		  회원가 : <%= FormatCurrency(SMprice) %><br>
		  일반가 : <%= FormatCurrency(Sprice) %>
		
		  </td>
        </tr>
      </table></td>

<%
			SpRS.MoveNext
		Loop
%>
   </tr>
</table>
<%
		Call CloseRS(SpRS)
	end if  'if RSresult <> "Empty" then
%>	
