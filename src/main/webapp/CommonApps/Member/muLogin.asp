<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 	
<table width="280" border="0" cellpadding="0" cellspacing="0">
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
    <input name="sMode" type=hidden id="sMode" value="<%= Request("sMode") %>">
	<input name="gotoURL" type="hidden" value="<%= gotoURL %>">
    <tr>
      <td width="70" height="36"><div align="right">
        <img src="Images/MbrID.gif" width="70" height="15"></div></td>
      <td><div align="center">
          <input  name="MbrID" type="text" class="body16" id="MbrID" style="border:1 solid #cccccc;background-color:#FFFFFF" tabindex="10" value="<%= Session("MbrID") %>" size="15" maxlength="15" 
		  <% if Session("MbrID") <> "" then %>readonly="Yes"<% end if %>>
      </div></td>
      <td width="90" rowspan="2"><div align="center"><input type="image" tabindex="12" src="Images/btnLogin.gif" width="38" height="52" border="0">
      </div></td>
    </tr>
    <tr>
      <td height="36" class="body18"><div align="right"><img src="Images/MbrPW.gif" width="70" height="15"></div></td>
      <td class="body18"><div align="center">
          <input  name="MbrPW" type="password" class="body16" id="MbrPW" style="border:1 solid #cccccc;background-color:#FFFFFF" tabindex="11" size="15" maxlength="15">
      </div></td>
    </tr>
  </form>
</table>

