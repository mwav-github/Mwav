<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_BottomFrame.aspx.cs" Inherits="PARTNER.Adminp_BottomFrame" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="robots" content="noindex,nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
<link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<title>The Bottom Frame</title>
</head>
<body>
<form id="frmBottom" runat="server">
  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="150" height="55" align="center" background="/Adminp/zImages/A_bottom_bg02.gif"><a href="/" target="_blank"><img src="zImages/A_bottom_logo.gif"/></a></td>
      <td width="10" valign="top" background="/Adminp/zImages/A_bottom_bg02.gif"></td>
      <td height="55" background="/Adminp/zImages/A_bottom_bg02.gif">
        <asp:Label ID="firmName" runat="server">firmName</asp:Label>
        / 사업자번호:&nbsp;
        <asp:Label id="businessID" runat="server">businessID</asp:Label>
        &nbsp;&nbsp;|&nbsp;TEL:
        <asp:Label id="firmPhone" runat="server">firmPhone</asp:Label>
        &nbsp;/ FAX:
        <asp:Label id="firmFax" runat="server">firmFax</asp:Label>
        <BR>
        <asp:Label id="firmAddr" runat="server">firmAddr</asp:Label>
        <br>
      <asp:Label id="copyright" runat="server">copyright</asp:Label></td>
    </tr>
  </table>
</form>
</body>
</html>
