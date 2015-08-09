<%

	if  CInt(Session("sLevel4")) > 1  Or  Session("MbrID") <> "" Or  Session("userEmail") <> "" then
		Response.Redirect(pageName & "?qaMode=li")
	end if

%>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<table width="500" border="0" cellspacing="0" cellpadding="0" style="padding-top:10; padding-left:10; padding-right:10; padding-bottom:15;">
  <tr valign="top">
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="body16" >
      <tr>
        <td width="90" height="25" align="center">&nbsp;</td>
        <td width="410"  class="body16"> * 회원로그인</td>
      </tr>
      <tr>
        <td background="Images/notice_dot1.gif" height="5" colspan="2"></td>
      </tr>
      <tr>
        <td colspan="2">
          <% gotoURL = pageName & "?qaMode=li" %>
          <!--  MbrUsers Login Start -->
          <!--#include file = "../MbrUsers/muLogin.asp" -->
          <!--  MbrUsers Login End -->
          <base href="<%= Application("SiteURLDir") %>CommonAccessories/BoardQnA/" target="_self">
        </td>
      </tr>
      <tr>
        <td background="Images/notice_dot1.gif" height="5" colspan="2"></td>
      </tr>
    </table>	</td>
  </tr>
  <tr valign="top">
    <td><br>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="body16" >
        <FORM NAME="frmNM" METHOD="post" ACTION="qaLogin_ok.asp" onSubmit="return nmFormValidate(this);">
		<INPUT TYPE="hidden" NAME="qaMode" VALUE="nmLogin">
		<INPUT TYPE="hidden" NAME="gotoURL" VALUE="<%= pageName %>">
          <tr>
            <td width="90" height="25" align="center">&nbsp;</td>
            <td height="25"  class="body16"> * 비회원로그인</td>
            <td width="210"  class="body16">&nbsp;</td>
          </tr>
          <tr>
            <td background="Images/notice_dot1.gif" height="5" colspan="3"></td>
          </tr>
          <tr>
            <td align="center"><img src="Images/tit_email.gif" width="37" height="20"></td>
            <td height="25"  class="body16" style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:15">
              <input name="userEmail" type="text" class="body16" id="userEmail3" style="border:1 solid #cccccc;background-color:#FFFFFF" tabindex="100" size="22" maxlength="50"></td>
            <td rowspan="2"  class="body16" style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:15">
			<input name="image" type="image" tabindex="102" src="../MbrUsers/Images/btnLogin.gif" width="38" height="52" border="0"></td>
          </tr>
          <tr>
            <td align="center"><img src="Images/tit_password.gif" width="59" height="15"></td>
            <td height="25"  class="body16" style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:15">
              <input name="userPW" type="password" class="body16" id="userPW" style="border:1 solid #cccccc;background-color:#FFFFFF" tabindex="101" size="15" maxlength="15"></td>
          </tr>
          <tr>
            <td background="Images/notice_dot1.gif" height="5" colspan="3"></td>
          </tr>
        </form>
    </table>      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="50"><% If Session("sLevel4") <> "" Then %>
            <a href="../../Admin/Staffs/StfExit.asp?qaMode=logout"><img src="Images/qaLogout.gif" width="22" height="22" border="0"></a>
            <% else %>
            <A HREF="javascript:OpenWindow('<%= Application("SiteURLDir") %>Admin/Staffs/LoginBoxForStaff/LoginBoxForStaff.asp?qaMode=login','qaPopup','scrollbars=yes,resizable=no,width=600,height=470')"><img src="Images/qaLogin.gif" width="22" height="22" border="0"></A>
            <% End If %></td>
          <td height="25"  class="body16" style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:15">
		    <a href="<%= pageName %>?qaMode=qi"><img src="Images/qaCancle.gif" width="55" height="22" border="0"></a></td>
        </tr>
              </table></td>
  </tr>
</table>
