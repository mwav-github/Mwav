<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_LeftFrame.aspx.cs" Inherits="PARTNER.Adminp_LeftFrame" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta name="robots" content="noindex,nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css" />
<link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<title>The Left Frame</title>
</head>
<body>
<form id="frmLeft" runat="server">
  <table width="150" height="2000" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="150" height="100%" align="left" valign="top" background="zImages/A_leftmenu_bg.gif">
        <table width="150" border="0" cellpadding="0" cellspacing="0" background="zImages/A_leftmenu_bg.gif">
          <tr>
            <td><img src="zImages/A_leftmenu_top.gif" width="150" height="10" /></td>
          </tr>
          <asp:panel id="pnLeftSubMenu" runat="server">
			<tr>
            <td><img src="zImages/A_leftmenu_top02.gif" width="150" height="25" /></td>
          </tr>
			<tr>
              <td height="26" align="center" background="zImages/A_leftmenu_title.gif" class="Bwhite">
              <asp:Literal ID="litMainMenu" runat="server">여기가 메인메뉴</asp:Literal></td>
            </tr>
			<tr>
            <td><img src="zImages/A_leftmenu_bottom.gif" width="150" height="25" /></td>
          </tr>
            <tr>
              <td align="center">
                <table cellspacing="0" cellpadding="0" width="143" border="0">
                  <tr>
                    <td height="10" align="center"></td>
                  </tr>
                  <tr>
                    <td><font color="#333333">
                      <asp:panel id="pnSubMenu" runat="server">
                        </asp:panel>
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
            </asp:panel>
          <!--  The empty left page when initializing -->
          <asp:Panel id="pnLeftDefault" runat="server">
            <tr>
              <td><img src="zImages/left_img.gif" width="150" height="562" ></td>
            </tr>
            </asp:Panel>
          <tr>
            <td height="100%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
