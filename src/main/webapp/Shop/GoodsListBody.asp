<!-- ShopSetting Start -->
	<!--#include File = "../SiteSetting.asp" -->
<!-- ShopSetting End -->
<html>
<head>
<title>[ <%= Request.Cookies("siteTitle") %> ] - 환영합니다.</title>
	<meta name="keywords" content="캠코더 카메라 메모리">
	<meta name="description" content="최고의 캠코더 전문사이트">
	<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
	<meta http-equiv="refresh" content="<%= refl %>">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

	<link href="../Include_css/Style.css" rel="stylesheet" type="text/css">
	<link href="../Include_css/Object.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="../Include_js/CommonFunctions.js"></script>
	<script language="JavaScript" src="../Include_js/Function.js"></script>
</head>

<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<!-- FrontHeader Start -->
     <!--#include File = "../SiteHeader/FrontHeader.asp" -->
    <!-- FrontHeader End -->
	</td>
  </tr>
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2">
	<!-- FrontHeader Start -->
     <!--#include File = "../ShopComponents/MainMenu/MainMenuBar.asp" -->
    <!-- FrontHeader End -->
		  </td>
        </tr>
        <tr>
          <td colspan="2">
	<!-- FlashDisplay Start -->
     <!--#include File = "../ShopComponents/FlashDisplay/FlashDisplay.asp" -->
    <!-- FlashDisplay End -->
		  </td>
        </tr>
        <tr bgcolor="#E9FEFE">
          <td width="160" bgcolor="#E9FEFE">
            <!-- SelectedCategory Start -->
            <!--#include File = "../ShopComponents/SelectedCategory/SelectedCategory.asp" -->
			<!-- SelectedCategory End -->		  </td>
          <td width="640">
            <!-- LocationBar Start -->
            <!--#include File = "../ShopComponents/LocationBar/LocationBar.asp" -->
			<!-- LocationBar End -->
          </td>
        </tr>
        <tr>
          <td height="500" valign="top">
            <!-- SubMenu Start -->
            <!--#include File = "../ShopComponents/SubMenu/SubMenu.asp" -->
            <!-- MainMenu End -->
            <br> <br>
            <!-- GoodsClass Start -->
            <!--#include File = "../ShopComponents/ClassifiedGoods/GoodsClass.asp" -->
            <!-- GoodsClass End -->
            <br><br>
            <!-- SetGoods Start -->
            <!--#include File = "../ShopComponents/ClassifiedGoods/SetGoods/SetGoods.asp" -->
            <!-- SetGoods End -->
            <br><br>

		  </td>
          <td valign="top">
<base href="<%= Application("SiteURLDir") %>ShopBody/" target="_self">
<%
	c = Request.QueryString("c")
	cc = Request.QueryString("cc")
	'''''''''''''		
	if SearchString = "" then			'검색하지 않은 경우 
		SQL = "SELECT Top 3 * From vClassifiedGoodsInCategory "
		if c <> "" then 
			SQL = SQL & " Where cCode =" & c
		end if
		RSresult = OpenRS(cgRS, SQL, 3)

		if RSresult <> "Empty" then
%>
		  <table width="100%" height="200" border="0" cellpadding="0" cellspacing="0">
		  <tr>
				<td height="40" valign="bottom" colspan="3">특별상품---------------------------------------------------------------------------------</td>
			</tr>
            <tr>
<%
			Do until cgRS.EOF
				gCode = trim(cgRS("gCode"))
				gMnum = trim(cgRS("gMnum"))
				gName = trim(cgRS("gName"))
				SMprice = trim(cgRS("SMprice"))
				Sprice = trim(cgRS("Sprice"))
				reserveFund = trim(cgRS("reserveFund"))
				'displayOnly  = trim(cgRS("displayOnly"))
				'중간 이미지 구하기
				middleImage = PickUpValue("vMasterImages", "pName", "gCode = '" & gCode & "' And imgSize = 'M'")
				if middleImage = "NoPickUp" then middleImage ="iMdefault.gif"

%>
                <td align="center" valign="top">
                  <table width="98%" border="0" cellpadding="3" cellspacing="3">
                    <tr>
                      <td><a href="GoodsDetailBody.asp?c=<%= c %>&cc=<%= cc %>&g=<%= gCode %>"><img src="../Images/Goods_Images/<%= middleImage %>" border="0"></a></td>
                    </tr>
                    <tr>
                      <td>
					  <b><%= gName %>(<%= gMnum %>)</b><br>
					  - 회원가 : <%= FormatCurrency(SMprice) %><br>
					  - 일반가 : <%= FormatCurrency(Sprice) %><br>
					  - 적립금 : <%= FormatCurrency(reserveFund) %></td>
                    </tr>
                  </table>
				</td>
<%
				cgRS.MoveNext
			Loop

			Call CloseRS(cgRS)
%>
     </tr>
</table>
<%
		else
			'Response.Write("특별상품을 준비중입니다.")
		end if  'if RSresult <> "Empty" then
	end if 	'if SearchString = "" then			'검색하지 않은 경우 		
%>
		<table>
              <tr>
                <td height="40" valign="bottom" colspan="4">
				 <!--일반상품리스트 -->

				 상품리스트---------------------------------------------------------------------------------------------</td>
              </tr>
			  <tr>
			    <td colspan="4">
	<%	'카테고리 매핑
		if c <> "" and cc <> "" then 
			viewTable = "[vGoodsList_c-c2]"
			SQLwhere = " Where cCode = " & c
			SQLwhere = SQLwhere & " And c2Code = " & cc
		elseif c <> "" then 
			viewTable = "vGoodsList_c"
			SQLwhere = " Where cCode = " & c
		elseif SearchString <> "" then			'검색한 경우 
			viewTable = "vGoodsSearch"
			SQLwhere = " Where gName like '%" & SearchString & "%' "
			SQLwhere =  SQLwhere & " Or gMnum like '%" & SearchString & "%' "
			SQLwhere =  SQLwhere & " Or gGname like '%" & SearchString & "%' "
			'SQLwhere = " Where " & arry_search(0) & " like '%" & SearchString & "%' "
			SearchMsg = "상품명, 모델번호, 일반상품명에서 """ & SearchString & """(으)로 검색한 결과 " 			
		end if
		SQL = "SELECT * From " & viewTable
		SQL = SQL &  SQLwhere
		RSresult = OpenAdvRS(gListRs, SQL, 12, 3, 1)
		if RSresult <> "Empty" then
			recordcnt = gListRs.RecordCount
			'페이지
 		   	if request("page")="" then
				page=1
			else
				page=request("page")
			end if
			totalpage = gListRs.pagecount
			gListRs.absolutepage = page
%>
	<font color="#6699CC"><%= SearchMsg %><%= recordcnt %>개의 상품이 존재합니다.</font>
  </td>
			  </tr>
              <tr>
                <td align="center" valign="top" colspan="4">
				<table width="100%" border="0" cellspacing="1" cellpadding="2">
                  <tr >
	<%
			i = 1
			j = 0
			Do until gListRs.EOF Or i> gListRs.PageSize
				gCode = trim(gListRs("gCode"))
				gMnum = trim(gListRs("gMnum"))
				gName = trim(gListRs("gName"))
				SMprice = trim(gListRs("SMprice"))
				Sprice = trim(gListRs("Sprice"))
				reserveFund = trim(gListRs("reserveFund"))
				'displayOnly  = trim(gListRs("displayOnly"))
				
				if SearchString = "" then
					'작은 이미지 구하기
					goodsImage = PickUpValue("vMasterImages", "pName", "gCode = '" & gCode & "' And imgSize = 'S'")
					if goodsImage = "NoPickUp" then goodsImage ="iSdefault.gif"
				else
					'검색시 큰 이미지 구하기
					goodsImage = PickUpValue("vMasterImages", "pName", "gCode = '" & gCode & "' And imgSize = 'M'")
					if goodsImage = "NoPickUp" then goodsImage ="iMdefault.gif"
				end if
				
				
	%>
                    <td><table width="100%" height="190" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="middle"><a href="GoodsDetailBody.asp?c=<%= c %>&cc=<%= cc %>&g=<%= gCode %>"><img src="../Images/Goods_Images/<%= goodsImage %>" border="0"></a></td>
                      </tr>
                      <tr>
                        <td valign="top"> <b><%= gName %>(<%= gMnum %>)</b><br>
      - 회원가 : <%= FormatCurrency(SMprice) %><br>
      - 일반가 : <%= FormatCurrency(Sprice) %><br>
      - 적립금 : <%= FormatCurrency(reserveFund) %></td>
                      </tr>
                    </table></td>
<%

	   		if ((j+1) mod 4) = 0 then
				Response.write("</TR><TR>")
			end if
				i = i + 1
				j = j + 1
				gListRs.MoveNext
			Loop

			Call CloseRS(gListRs)
%>
              </tr>
	  <tr>
             <td height="25" valign="bottom" colspan="4">
	<font face="돋움" size="2" color="#000000">
        <%= SpacePrn(8) %> <%=page%> page / <%=totalpage%> pages <%= SpacePrn(4) %>
        <% if page <> 1 then%>
        <a href="GoodsListBody.asp?page=<%=page-1%>&c=<%= c %>&cc=<%= cc %>">< 이전상품 ></a>
        <%end if%>
        <% if Cint(page) <> Cint(totalpage) then%>
		<a href="GoodsListBody.asp?page=<%=page+1%>&c=<%= c %>&cc=<%= cc %>">< 다음상품 ></a>
        <% end if%>
     </font>

              </td>
     </tr>
<%
			
		else
			if SearchString <> "" then
				Response.Write("<br><br>*" & SearchMsg & " 상품이 존재하지 않습니다.")
			else
				Response.Write("<br><br>* 상품을 준비중입니다.")
			end if
		end if  'if RSresult <> "Empty" then
%>

                </table></td>
              </tr>
            </table>

	      </td>
        </tr>
        <tr>
          <td colspan="2">
            <!-- FrontFooter Start -->
            <!--#include File = "../SiteFooter/FrontFooter.asp" -->
            <!-- FrontFooter End -->
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>