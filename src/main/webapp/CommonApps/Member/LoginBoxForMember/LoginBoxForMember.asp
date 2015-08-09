<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/LoginBoxForMember/" target="_self">
<style type="text/css">
<!--
.boxStyle {font-family: "굴림", "굴림체"; font-size: 12px; color: #767D85; }
-->
</style>
<%	
	if gotoURL = "" then gotoURL =  Request.ServerVariables("PATH_INFO")
	'gotoURL에 부가된 값을 연결함.
	if Request("bID") <> "" then gotoURL = gotoURL & "?bID=" & Request("bID")

	'''''''''''''''''''''''''''''''''''
	if Session("MbrID")  = "" then  
%>
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

<table width="182" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="Images/login_01.gif" width="182" height="50"></td>
          </tr>
          <tr>
            
    <td background="Images/login_bg.gif" style="padding-left:15;padding-top:5"><img src="Images/tit_login.gif" width="45" height="25"></td>
          </tr>
</table>
<table width="182" border="0" cellpadding="0" cellspacing="0" background="Images/login_bg.gif">
  <FORM name="frmLogin" action="../muLogin_ok.asp" method="post" onsubmit="return CheckBasicLogin(this)">
    <input name="gotoURL" type="hidden" value="<%= gotoURL %>">
  <tr>
    <td><table width="50" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50" align="right"><img src="Images/tit_id.gif" width="33" height="20"></td>
        </tr>
        <tr>
          <td align="right"><img src="Images/tit_pass.gif" width="33" height="20"></td>
        </tr>
      </table></td>
    <td>
<table width="80" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="20" align="center"> 
            <input  name="MbrID" type="text" class="body16" id="MbrID" style="border:1 solid #cccccc;background-color:#FFFFFF" tabindex="50" size="12" maxlength="15">
          </td>
        </tr>
        <tr> 
          <td height="20" align="center"> 
            <input  name="MbrPW" type="password" class="body16" id="MbrPW" style="border:1 solid #cccccc;background-color:#FFFFFF" tabindex="51" size="12" maxlength="15"></td>
        </tr>
      </table></td>
    <td width="40">
    <input name="image" type="image" tabindex="52" src="Images/botton.gif" width="23" height="23" border="0"></td>
  </tr>
</form>
</table>
<table width="182" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="Images/login_bg.gif" style="padding-left:30;padding-top:10;padding-bottom:5"><a href="../../../CustomerServices/MemberShip/Agreement.asp"><img src="Images/tit_mem.gif" width="44" height="15" border="0"></a>      </td>
  </tr>
  <tr>
    <td><img src="Images/login_02.gif" width="182" height="24"></td>
  </tr>
</table>
<% else %>
<table width="182" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="Images/login_01.gif" width="182" height="50"></td>
  </tr>
  <tr>
    <td background="Images/login_bg.gif" style="padding-left:15;padding-top:5"><img src="Images/tit_logout.gif" width="60" height="25">
	<a href="../muExit.asp?gotoURL=<%= gotoURL %>"><img src="Images/botton.gif" width="23" height="23" border="0"></a></td>
  </tr>
</table>
<table width="182" border="0" cellpadding="0" cellspacing="0" background="Images/login_bg.gif">
  <tr>
    <td><table width="50" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50" height="25" align="right"><img src="Images/tit_id.gif" width="33" height="20"></td>
        </tr>
        <tr>
          <td height="25" align="right"><img src="Images/tit_info.gif" width="33" height="20"></td>
        </tr>
    </table></td>
    <td>
      <table width="120" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="25"><span class="boxStyle"><%= Session("MbrID") %>
          </span></td>
        </tr>
        <tr>
          <td height="25"><span class="boxStyle"><%= Session("MbrName") %>(<%= Session("levelLabel") %></span>) </td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="182" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="Images/login_bg.gif" style="padding-left:30;padding-top:10;padding-bottom:5"> 
	<a href="../../../CustomerServices/MemberShip/ApplicationsFom.asp?sMode=u&gotoURL=<%= gotoURL %>">
	<img src="Images/tit_modify.gif" width="44" height="15" border="0"></a><a href="../../../CustomerServices/MemberShip/msInfoView.asp?sMode=v&gotoURL=<%= gotoURL %>"><img src="Images/tit_mem2.gif" width="66" height="15" border="0"></a></td>
  </tr>
  <tr>
    <td><img src="Images/login_02.gif" width="182" height="24"></td>
  </tr>
</table>
<% end if %>
