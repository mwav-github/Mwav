<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<%
	frm = Trim(Request("frm"))
	whereTo = Trim(Request("whereTo"))
	id = Trim(Request("id"))
	frmWhereTo = frm & "." & whereTo
%>

<html>
<head>
<title>아이디 중복검사</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script language="Javascript" src="<%= Application("SiteURLDir") %>Include_js/Function.js"></script>
<script language="JavaScript" src="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/mu_inc.js"></script>
</head>
<body topmargin="0" leftmargin="0" style="width:100%;overflow-x:hidden;overflow-y:scroll">
<%
	Select Case whereTo
		Case "sID"
			SQL = "SELECT sID FROM vStaffs "
			returnCheckID = "return CheckID(chkID.id,3,15,'직원아이디');"
					'if Len(id) < 3 then Call ShowAlertMsg("직원아이디는 3자 이상입니다.")
		Case "MbrID"
			SQL = "SELECT MbrID FROM vMember "
			returnCheckID = "return CheckID(chkID.id,4,15,'회원아이디');"
				'if Len(id) < 4 then Call ShowAlertMsg("회원아이디는 4자 이상입니다.")
		Case else
			Call ShowAlertMsgClose("비정상적인 접속입니다.")
	End Select
	SQL = SQL & " Where " & whereTo & " ='"  & id & "' "
	'SQL = SQL & " ORDER BY Sname DESC"
	RSresult = OpenRS(rs,SQL,1)


%>

<table width="400" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="400" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/idseek_upimage.gif" width="400" height="50"></td>
        </tr>
      </table>
      <table width="400" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="80" align="center" valign="middle" bgcolor="#9ACDDA"><font color="#000000" size="2">
            <% if RSresult = "Empty" then %>
            "<%= id %>"는(은) 사용이 가능한 아이디 입니다.<br>
            아이디를 사용하시려면 버튼을 눌러주세요.<br>
            <% else %>
            "<%= id %>"는(은) 사용이 불가능한 아이디 입니다.<br>
            다시한번 ID를 입력해주세요 <br>
            <%
				CloseRS(rs)
			end if
		%>
            </font></td>
        </tr>
        <tr>
          <td align="center" valign="middle" bgcolor="#9ACDDA">
		<table width="400" border="0" cellspacing="0" cellpadding="0">
              <form action="IDseek.asp" method="post" name="chkID" onSubmit="<%= returnCheckID %>">
                <tr bgcolor="#B6DEE8">
                  <td width="250" height="80" align="right">
				   <input name="id" id="id" type="text" size="15" maxlength="15" value=<%= id %> onkeydown="if (event.keyCode == 13) ReturnID('<%= frmWhereTo %>', '<%= id %>');">
                    <input name="frm" type="hidden" id="frm" value="<%= frm %>">
                    <input name="whereTo" type="hidden" id="whereTo" value="<%= whereTo %>">
                  </td>
                  <td width="10" align="center">&nbsp;</td>
                  <td><input type="image" src="images/overlap_bt.gif" width="80" height="20" border="0"></td>
                </tr>
              </form>
            </table></td>
        </tr>
        <tr>
          <td height="30" align="center" valign="middle" bgcolor="#9ACDDA">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>

<table width="400" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" align="center" valign="middle">
      <% if RSresult = "Empty" then %>
      <a href="#" Onclick="ReturnID('<%= frmWhereTo %>', '<%= id %>')"> <img src="images/idok_bt.gif" width="80" height="20" border="0">
      </a>
      <% end if %>
      <input name="btnClose" type="button" id="btnClose3" onClick="window.close();" value="닫기"></td>
  </tr>
</table>
<%
	Call CloseDB()
%>
</body>
</html>
