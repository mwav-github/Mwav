<!--% @ Register TagPrefix="uc1" TagName="AspNetLeftMenu" Src="../../Controls/AspNetLeftMenu.ascx" %-->
<!--% @ Register TagPrefix="uc1" TagName="HeaderMenu" Src="../../Controls/HeaderMenu.ascx" %-->
<!--%@ Register TagPrefix="uc1" TagName="Header" Src="../../Controls/Header.ascx" %-->
<!--%@ Register TagPrefix="uc1" TagName="Footer" Src="../../Controls/Footer.ascx" %-->
<!--%@ Register TagPrefix="uc1" TagName="BoardsLeftMenu" Src="../../Controls/BoardsLeftMenu.ascx" %-->
<%@ Page language="c#" Codebehind="ForumReply.aspx.cs" AutoEventWireup="false" validateRequest="false" Inherits="KistelSite.CommonApps.Boards.Forum.ForumReply" %>
<!doctype HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<title>글 작성</title>
<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
<meta content="C#" name="CODE_LANGUAGE">
<meta content="JavaScript" name="vs_defaultClientScript">
<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
<LINK href="/StyleSheets/Objects.css" type=text/css rel=stylesheet />
<LINK href="/StyleSheets/OverallPage.css" type=text/css rel=stylesheet />
<link href="board.css" type="text/css" rel="stylesheet">
<script language="Javascript1.2"><!-- // load htmlarea
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
<base href='<%= Application["BaseHref"] %>CommonApps/Boards/Forum/' target=_self>
<form id="ReplyForm" method="post" runat="server">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <TBODY>
      <tr valign="top">
        <td height="57" align="right" style="PADDING-RIGHT:30px"><img src="Images/tit_03.gif" width="136" height="22"></td>
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
              <td height="30" class="Board_WriteHeader"><IMG src="Images/item_subject.gif"> </td>
              <td class="Board_WriteItem">
			  <asp:textbox id="Subject" runat="server" maxlength="50" CssClass="textbox" size="50"></asp:textbox>
                <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ErrorMessage="제목을 입력하여 주세요." ControlToValidate="Subject"></asp:requiredfieldvalidator>
                <asp:checkbox id="HtmlCheck" runat="server" Text="HTML" Checked="True" Enabled="False" Visible="False"></asp:checkbox>
              </td>
            </tr>
            <tr class="Board_Footer">
              <td colSpan="2" background="Images/Img/dot1.gif"></td>
            </tr>
            <tr>
              <td height="30" class="Board_WriteHeader"><img src="Images/item_reply.gif"> </td>
              <td class="Board_WriteItem"><div id="open"> <a href="javascript:view_question('question','open');"><font color="#990000">클릭하면 질문글을 
                  볼 수 있습니다.</font></a></div>
                <div id="close" style="DISPLAY: none"> <a href="javascript:view_question('question','close');"><font color="#990000">클릭하면 질문글을 
                  닫습니다.</font></a><br>
                </div>
                <div id="question" style="DISPLAY: none"><%=content%></div></td>
            </tr>
            <tr class="Board_Footer">
              <td background="Images/img/dot1.gif" colSpan="2"></td>
            </tr>
            <tr>
              <td class="Board_WriteItem" colspan="2"><textarea style="WIDTH: 580px; HEIGHT: 350px" name="WebEditor"></textarea>
              </td>
            </tr>
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
                <a href="JavaScript:history.back();"><img src="Images/img/cancel.gif" border="0"></a><br>
              </td>
            </tr>
          </table></td>
        </td>
      </tr>
  </table>
</form>
<script LANGUAGE="javascript">
<!--
function view_question(id,id2) {
	if (document.all[id].style.display == "none") {
		document.all[id].style.display = "";
	}
	else {
		document.all[id].style.display = "none";
	}
	if (id2 == "open") {
		document.all['open'].style.display = "none";
		document.all['close'].style.display = "";
	}	
	else {
		document.all['open'].style.display = "";
		document.all['close'].style.display = "none";
	}	
}
//-->
		</script>
<script language="javascript1.2">
	editor_generate('WebEditor');
		</script>
</body>
</HTML>
