<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- fsShop_inc Start -->
	<!--#include File= "../../Include_asp/fsShop_inc.asp"-->
<!-- fsShop_inc End -->

<%
	'opMode를 확인한다. c -> p -> f -> d
	opMode = trim(Request("opMode"))

	'초기아이콘셋팅
	icoCart = "icoCart.gif"
	icoHowToPay = "icoHowToPay.gif"
	icoOrderForm = "icoOrderForm.gif"
	icoOrderDone = "icoOrderDone.gif"

	Select Case opMode
	 Case "c"
		opTitleBar = "ShoppingCart.gif"
		icoCart = "icoCart1.gif"
		description = "고객님께서 미리 선택하신 상품을 담고 있는 장바구니입니다. 상품들을 확인하신 후, 주문하세요."
	 Case "p"
		opTitleBar = "HowToPay.gif"
		icoHowToPay = "icoHowToPay1.gif"
		description = "고객님의 예상 결제내역입니다. 적용 가능한 결제수단을 선택해 주세요."
	 Case "f"
		opTitleBar = "OrderForm.gif"
		icoOrderForm = "icoOrderForm1.gif"
		description = "고객님의 주문자 정보와 배송정보, 그리고 결제정보를 정확하게 입력해 주세요."
	 Case "d"
		opTitleBar = "OrderDone.gif"
		icoOrderDone = "icoOrderDone1.gif"
		description = "주문이 완료되었습니다. 주문내역과 결제정보, 배송정보를 다시 한번 확인해 주세요."

	 Case Else
		Call ShowAlertMsg("당신이 정말 밉당.")
	End Select

%>

<html>
<head>
<title>[<%= Request.Cookies("siteTitle") %>] - 상품구매</title>
<meta name="keywords" content="캠코더 카메라 메모리">
<meta name="description" content="최고의 캠코더 전문사이트">
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
<meta http-equiv="refresh" content="<%= refl %>">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>" target="_self">
<link href="Include_css/Style.css" rel="stylesheet" type="text/css">
<link href="Include_css/Object.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="Include_js/Function.js"></script>
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <!-- FrontHeader Start -->
      <!--#include File = "../../SiteHeader/FrontHeader.asp" -->
      <!-- FrontHeader End --> </td>
  </tr>
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td> <!-- FrontHeader Start -->
            <!--#include File = "../../ShopComponents/MainMenu/MainMenuBar.asp" -->
            <!-- FrontHeader End --> </td>
        </tr>
        <tr>
          <td align="center">

<base href="<%= Application("SiteURLDir") %>ShopBody/OrderProcess/" target="_self">

		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><TABLE cellSpacing=0 cellPadding=0 width=100% align=center bgColor=#616e5b border=0>
                <TBODY>
                  <TR>
                    <TD width="160">
                    <IMG src="Images/<%= opTitleBar %>" width="160" height="45"></TD>
                    <TD height="60" class=locationnav>&nbsp;</TD>
                    </TR>
                </TBODY>
              </TABLE></td>
            </tr>
            <tr>
              <td><TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
                <TBODY>
                  <TR>
                    <TD vAlign=middle>
                    <IMG src="Images/icoCart_bullet.gif" width="7" align=absMiddle height="20" hspace="5"><%= description %></TD>
                    <TD width=264>
                      <TABLE cellSpacing=0 cellPadding=0 width=264 align=right border=0>
                        <TBODY>
                          <TR>
                            <TD colSpan=4>&nbsp;</TD>
                          </TR>
                          <TR>
                            <TD width=66><IMG src="Images/<%= icoCart %>"></TD>
                            <TD width=66><IMG src="Images/<%= icoHowToPay %>"></TD>
                            <TD width=66><IMG src="Images/<%= icoOrderForm %>"></TD>
                            <TD width=66><IMG src="Images/<%= icoOrderDone %>"></TD>
                          </TR>
                      </TABLE></TD>
                  </TR>
                </TBODY>
              </TABLE></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>


<!----------------------------------- Body Start------------------------------------>

 <!-- ViewCart_inc Start -->
 <!--#include File = "ViewCart_inc.asp" -->
 <!-- ViewCart_inc End -->

 <!-- HowToPay_inc Start -->
 <!--#include File = "HowToPay_inc.asp" -->
 <!-- HowToPay_inc End -->

 <!-- OrderForm_inc Start -->
 <!--#include File = "OrderForm_inc.asp" -->
 <!-- OrderForm_inc End -->

 <!-- OrderDone_inc Start -->
 <!--#include File = "OrderDone_inc.asp" -->
 <!-- OrderDone_inc End -->

<!----------------------------------- Body End  ------------------------------------>



			  </td>
            </tr>
          </table>


          </td>
        </tr>
        <tr>
          <td width="100" valign="top"> </td>
        </tr>
        <tr>
          <td> <!-- FrontFooter Start -->
            <!--#include File = "../../SiteFooter/FrontFooter.asp" -->
            <!-- FrontFooter End --> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
