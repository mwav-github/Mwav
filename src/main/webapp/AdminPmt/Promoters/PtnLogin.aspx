<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PtnLogin.aspx.cs" Inherits="PARTNER.Adminp_Partners_PtnLogin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="robots" content="noindex,nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
<link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<title>The Admin Control Center</title>
<style type="text/css">
<!--
body {
	background-color: #fcfcfc;
}
-->
</style>
</head>
<body>
<form id="frmLogin" runat="server">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td style="background-image:url(/Adminp/Partners/Images/adminp_bg.gif); background-position:top; background-repeat:repeat-x;">
        <table width="1017" height="650" border="0" align="center" cellpadding="0" cellspacing="0" background="/Adminp/Partners/Images/adminp_login_bg.jpg">
          <tr>
            <td align="center" colspan="2">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <asp:validationsummary id="vsLogin" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td width="606" valign="top">&nbsp;</td>
            <td valign="top" style="padding-top:105px">
              <table width="300" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="300" height="26" align="center"><img src="/Adminp/Partners/Images/adminp_title.gif" width="252" height="62" /></td>
                </tr>
                <tr>
                  <td align="center" valign="top">
                    <table width="274" height="148" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td colspan="3" align="center"><img src="/Adminp/Partners/Images/adminp_login_bg01.gif" width="274" height="9" /></td>
                      </tr>
                      <tr>
                        <td valign="top"><img src="/Adminp/Partners/Images/adminp_login_bg02.gif" width="1" height="137" /></td>
                        <td align="center" bgcolor="#FFFFFF">
                          <table width="250" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="50" colspan="3">
                                <asp:Literal ID="litSiteName" runat="server"></asp:Literal>
                                의 Parthers 페이지입니다.<br />
                                아이디와 패스워드를 입력해주십시오</td>
                            </tr>
                            <tr>
                              <td height="5" colspan="3"></td>
                            </tr>
                            <tr>
                              <td width="68" align="left"><img src="/Adminp/Partners/Images/A_icon005.gif" width="11" height="11" align="absmiddle" /> 아이디 </td>
                              <td width="117" align="left">
                                <asp:textbox id="sLoginID" accessKey="1" tabIndex="1" autocomplete="off" runat="server" Columns="10"
																				TextMode="SingleLine" ToolTip="아이디를 넣으세요" MaxLength="15" EnableViewState="False" Width="90px"></asp:textbox>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="아이디를 넣으세요." ControlToValidate="sLoginID"
																				Display="Dynamic">*</asp:requiredfieldvalidator>
                                <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="아이디가 바르게 입력하세요." ControlToValidate="sLoginID"
																				ValidationExpression="[A-z]\w{2,15}">*</asp:RegularExpressionValidator>
                              </td>
                              <td width="65" rowspan="2" align="center">
                                <asp:imagebutton id="smtLogin" tabIndex="3" runat="server" BorderWidth="0" ImageUrl="/Adminp/Partners/Images/A_logon016.gif" OnClick="smtLogin_Click"></asp:imagebutton>
                              </td>
                            </tr>
                            <tr>
                              <td align="left"><img src="/Adminp/Partners/Images/A_icon005.gif" width="11" height="11" align="absmiddle" /> 패스워드 </td>
                              <td align="left">
                                <asp:textbox id="sLoginPW" accessKey="2" tabIndex="2" runat="server" Columns="10" TextMode="Password"
																				ToolTip="패스워드를 넣으세요" MaxLength="15" EnableViewState="False" Width="90px"></asp:textbox>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="암호를 넣으세요." ControlToValidate="sLoginPW">*</asp:requiredfieldvalidator>
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2" align="right">아이디저장
                                <asp:checkbox id="cbStorePid" runat="server" EnableViewState="False"></asp:checkbox>
                              </td>
                              <td>&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                        <td valign="top"><img src="/Adminp/Partners/Images/adminp_login_bg02.gif" width="1" height="137" /></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td align="center" valign="top">
                    <table width="300" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="27" class="int01">
                          <asp:Label ID="recentPLogin" runat="server"></asp:Label>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
