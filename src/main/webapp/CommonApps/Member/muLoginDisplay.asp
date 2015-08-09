<!-- ShopSetting Start -->
<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<html>
<head>
<title>[<%= Request.Cookies("siteTitle") %>] - 회원 로그인</title>
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
<body onLoad="javascript:ToFocus(frmLogin.MbrID);"> 
<table width="800" border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td> 
<!-- FrontHeader Start --> 
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
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 		  		
          <td><img src="Images/LoginDisplay.gif" width="800" height="125"></td>
	    </tr>
		 <tr><td>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="170"><img src="Images/LoginNametag.gif" width="171" height="31"></td>
    <td><%
	secondLevel =" > 로그인"
%>
      <!-- LocationBar Start -->
      <!--#include File = "../../ShopComponents/LocationBar/LocationBar.asp" -->
	  <!-- LocationBar End -->	  </td>
  </tr>
</table> 
</td> 
        </tr> 
        <tr> 
          <td>  </td> 
        </tr>		
        <tr> 
          <td align="center"> 
  <% if Session("MbrID") <> "" then Response.Redirect(UrlRootDir & "CommonAccessories/MbrUsers/muExit.asp") %>  
	<img src="../../Images/TransparentImage.gif" width="50" height="30">
            <TABLE cellSpacing=0 cellPadding=0 width=700 
                  border=0> 
              <TR> 
                <TD height=40><base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self">
				<img src="Images/muLoginBar.gif" width="609" height="45" border="0"></TD> 
              </TR> 
              <TR> 
                <TD bgColor=#ededed height=230><TABLE cellSpacing=0 cellPadding=0 width=610 
                        align=center border=0> 
                    <TR vAlign=top> 
                      <TD class=textsmall colSpan=3 height=25>회원 아이디와 비밀번호를 입력하신 후, 확인 버튼을 눌러주세요.</TD> 
                    </TR> 
                    <TR> 
                      <TD width=300> 
					  <TABLE cellSpacing=0 cellPadding=0 width=250 border=0> 
				<SCRIPT language=JavaScript> 
				<!--
					function CheckBasicLogin(frm) {
						//idLength = parseInt(frm.MbrID.value.length)
						if(frm.MbrID.value == '' || frm.MbrID.value.length < 3) { 
							alert("회원ID를 바르게 입력하십시오."); 
							frm.MbrID.focus();
							return false; 
						} 
						if(frm.MbrPW.value == ''){ 
							alert("비밀번호를 입력하십시오."); 
							frm.MbrPW.focus(); 
							return false; 
						} 
						return true;
					}
				-->   
				</SCRIPT>
                    <FORM name="frmLogin" action="muLogin_ok.asp" method="post" onsubmit="return CheckBasicLogin(this)"> 
                    <input name="GotoURL" type="hidden" value="<%= Request("gtu") %>">
                            <TR> 
                              <TD class=logintext2 width=100 height=40> <DIV align=center>회원아이디</DIV></TD> 
                              <TD height=40><input name="MbrID" type="text" id="MbrID" size="15" maxlength="15" autocomplete="false"> </TD> 
                            </TR> 
                            <TR> 
                              <TD class=logintext2 height=40> <DIV align=center>비밀번호</DIV></TD> 
                              <TD height=40><input name="MbrPW" type="password" id="MbrPW" size="15" maxlength="15"></TD> 
                            </TR> 
                            <TR align="center"> 
                              <TD height=70 colSpan=2>
                  <INPUT name="image" type=image src="Images/mu_ok.gif" border=0>
                  </TD> 
                            </TR> 
                          </FORM> 
                        </TABLE></TD> 
                      <TD width=1 bgColor=#cecece><IMG src="Images/LoginSeparator.gif" width="3" height="149"></TD> 
                      <TD width=350> <TABLE cellSpacing=0 cellPadding=1 width=320 
                              align=center bgColor=#59ae52 border=0> 
                          <TR> 
                            <TD> <TABLE cellSpacing=0 cellPadding=0 width=320 
                                bgColor=#ffffff border=0> 
                                <TR> 
                                  <TD width=320 height=30 align="left"> <IMG height=10 src="../../Images/TransparentImage.gif" width=5> <img src="Images/ButtomIcon.gif" width="6" height="6" border="0"> 아직
                                  회원 가입을 안 하셨나요? </TD> 
                                </TR> 
                                <TR> 
                                  <TD height=30 align="left"><IMG height=10 src="../../Images/TransparentImage.gif" width=40> <A href="muAgreement.asp"><IMG src="Images/JoinMembership.gif" width=76 height=19 border=0></A> </TD> 
                                </TR> 
                                <!-- TR> 
                                  <TD height=30 align="left"> <IMG height=10 src="../../Images/TransparentImage.gif" width=5> 02.회원 아이디와 패스워드가 기억나지 않으시나요? </TD> 
                                </TR> 
                                <TR> 
                                  <TD height=30 align="left"><IMG height=10 
                                src="../../Images/TransparentImage.gif" width=40> <A 
                                href="#"> <IMG height=19 src="Images/ForgetLoginInfo.gif" width=100 border=0></A> </TD> 
                                </TR --> 
                            </TABLE></TD> 
                          </TR> 
                          </TBODY> 
                           </TABLE></TD> 
                    </TR> 
                  </TABLE>
			    </TD>
              </TR> 
	        </TABLE>
		<!-- NonMemberLogin Start --> 
        <!--#include File = "../../ShopComponents/NonMemberLogin/NonMemberLogin.asp" --> 
        <!-- NonMemberLogin End -->

		<!-- NonMemberLogin Start --> 
        <!--#include File = "../../ShopComponents/NonMbrMyPgLogin/NonMbrMyPgLogin.asp" --> 
        <!-- NonMemberLogin End -->
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
