<!-- ShopSetting Start -->
<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<html>
<head>
<title>[<%= Request.Cookies("siteTitle") %>] - 회원 로그아웃</title>
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
          <td height="30"> <!-- FrontHeader Start --> 
            <!--#include File = "../../ShopComponents/MainMenu/MainMenuBar.asp" --> 
            <!-- FrontHeader End --> </td> 
        </tr> 
        <tr> 
          <td> <!-- FlashDisplay Start --> 
            <!--#include File = "../../ShopComponents/FlashDisplay/FlashDisplay.asp" --> 
            <!-- FlashDisplay End --> </td> 
        </tr> 
        <tr> 
          <td height="300" align="center"> <base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 
            <TABLE cellSpacing=0 cellPadding=0 width=700 align=center 
                  border=0> 
              <TR> 
                <TD><IMG height=43 src="Images/LogoutTitle.gif" width=700></TD> 
              </TR> 
              <TR> 
                <TD bgColor=#ededed height=230> <TABLE cellSpacing=0 cellPadding=0 width=650 
                        align=center border=0>  
                    <TR> 
                      <TD bgColor=#737373 height=1><IMG height=1 
                              src="회원 로그아웃.files/blank.gif" width=10></TD> 
                    </TR> 
                    <TR> 
                      <TD height=200 align="center">사이트로 부터 안전하게 로그아웃되었습니다. </TD> 
                    </TR> 
                    <TR> 
                      <TD bgColor=#737373 height=1><IMG height=1 
                              src="회원 로그아웃.files/blank.gif" width=10></TD> 
                    </TR> 
                    <TR> 
                      <TD height=1> <TABLE cellSpacing=0 cellPadding=5 width="100%" 
                              border=0> 
                          <TR> 
                            <TD align="right"> 
							<A href="<%= Application("SiteURLDir") %>"><IMG height=36 src="Images/ToHome.gif" width="111" border="0"></A>                             </TD> 
                            <TD>
					<A href="muLoginDisplay.asp"><IMG height=36 src="Images/Relogin.gif" width="111" border="0"></A>
							</TD> 
                          </TR> 
                           
                           </TABLE></TD> 
                    </TR> 
                     
                    </TABLE></TD> 
              </TR> 
               
               </TABLE></td> 
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
