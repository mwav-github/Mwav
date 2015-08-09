<%@ Page language="c#" Codebehind="ForumWrite.aspx.cs" AutoEventWireup="false" validateRequest="false" Inherits="KistelSite.CommonApps.Boards.Forum.ForumWrite" %>
<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>글 작성</title>
<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
<meta content="C#" name="CODE_LANGUAGE">
<meta content="JavaScript" name="vs_defaultClientScript">
<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
<LINK href="/StyleSheets/Objects.css" type="text/css" rel="stylesheet">
<LINK href="/StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
<!--LINK href="/style.css" type="text/css" rel="stylesheet" -->
<LINK href="board.css" type="text/css" rel="stylesheet">
<script language="Javascript"><!-- // load htmlarea
			_editor_url = "../";                     // URL to htmlarea files
			var win_ie_ver = parseFloat(navigator.appVersion.split("MSIE")[1]);
			if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }
			if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }
			if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }
			if (win_ie_ver >= 5.5) {
			document.write('<scr' + 'ipt src="' +_editor_url+ 'editor.js"');
			document.write(' language="Javascript1.2"></scr' + 'ipt>');  
			} else { document.write('<scr'+'ipt>function editor_generate() { return false; }</scr'+'ipt>'); }
			// -->
		</script>
</HEAD>
<body>
<form id="WriteForm" method="post" runat="server">
  <base href='<%= Application["BaseHref"] %>CommonApps/Boards/Forum/' target=_self>
  <table cellSpacing="0" cellPadding="0" width="100%" border="0">
    <TBODY>
      <tr vAlign="top">
        <td style="PADDING-RIGHT: 30px" align="right" height="57"><IMG height="22" src="Images/tit_03.gif" width="136"></td>
      </tr>
      <tr>
        <td align="center"><table class="Board_Write" cellSpacing="0" cellPadding="3" align="center" border="0">
            <tr class="Board_ItemLine1">
              <td colSpan="2" height="1"></td>
            </tr>
            <tr class="Board_ItemLine2">
              <td colSpan="2" height="1"></td>
            </tr>
            <tr>
              <td class="Board_WriteHeader"><IMG src="Images/item_subject.gif"></td>
              <td class="Board_WriteItem"><asp:textbox id="Subject" tabIndex="0" runat="server" CssClass="textbox" maxlength="50" Columns="50"></asp:textbox>
                <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ControlToValidate="Subject" ErrorMessage="제목을 입력하여 주세요."
																	Display="Dynamic"></asp:requiredfieldvalidator>
                <asp:checkbox id="HtmlCheck" runat="server" Enabled="False" Checked="True" Text="HTML" Visible="False"></asp:checkbox>
              </td>
            </tr>
            <tr class="Board_Footer">
              <td background="Images/Img/dot1.gif" colSpan="2"></td>
            </tr>
            <tr>
              <td class="Board_WriteItem" align="center" colSpan="2"><textarea style="BORDER-RIGHT: #999999 1px solid; BORDER-TOP: #999999 1px solid; BORDER-LEFT: #999999 1px solid; WIDTH: 580px; BORDER-BOTTOM: #999999 1px solid; HEIGHT: 350px"
																	tabIndex="1" name="WebEditor"></textarea>
              </td>
            <tr class="Board_ItemLine2">
              <td colSpan="2" height="1"></td>
            </tr>
            <tr class="Board_ItemLine1">
              <td colSpan="2" height="2"></td>
            </tr>
          </table>
          <br>
          <table align="center">
            <tr>
              <td><asp:imagebutton id="RegisterButton" runat="server" ImageUrl="Images/img/register.gif"></asp:imagebutton>
                <A href="JavaScript:history.back();"><IMG src="Images/img/cancel.gif" border="0"></A><br>
              </td>
            </tr>
          </table></td>
        </td>
      </tr>
  </table>
</form>
<script language="javascript">
	editor_generate('WebEditor');
		</script>
</body>
</HTML>
