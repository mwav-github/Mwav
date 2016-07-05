<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LargeImageView.aspx.cs" Inherits="ADMIN.Shop_LargeImageView_LargeImageView" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="robots" content="index,follow"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
<link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<title>큰 이미지보기</title>
</head>
<body>
<form id="frmShop" runat="server">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
      <tr>
        <td colspan="3">
          <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
              <tr>
                <td	align="right" colspan="3" height="41">
                  <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
					  <tr>
                        <td	align="left" background="Images/title_bg.gif"><img src="Images/title.gif" width="751" height="41" /></td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td valign="top" align="center" style="padding:5px">
          <table width="100%" height="500" border="1" cellpadding="0" cellspacing="0" bordercolor="#d7e5f1">
            <tbody>
              <tr>
                <td align="center">
                  <asp:image id="imgLIV" runat="server" ImageUrl="/xUpload/GdsData/GdsPic_default.gif"></asp:image>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
        <td valign="top" width="1" bgcolor="#ffffff"></td>
        <td valign="top" align="center" width="160" height="100%">
          <div id="Layer1" style="OVERFLOW-Y: scroll; VISIBILITY: visible; OVERFLOW-X: hidden; WIDTH: 100%; HEIGHT: 580px">
            <asp:repeater id="rptThumbImg" runat="server" onitemdatabound="rptThumbImg_ItemDataBound">
              <ItemTemplate>
                <table width="100%" border="0" cellpadding="5" cellspacing="0" align="center">
                  <tr>
                    <td width="100" height="100">
                      <asp:Image ID="imgThumb" runat="server"></asp:Image>
                    </td>
                  </tr>
                </table>
              </ItemTemplate>
            </asp:repeater>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <table cellspacing="0" cellpadding="0" width="90%" border="0">
            <tbody>
              <tr>
                <td valign="bottom" align="right" height="30">
                  <asp:hyperlink id="hlClose" runat="server" ImageUrl="Images/btn_Close.gif" NavigateUrl="javascript:self.close();">닫기버튼</asp:hyperlink>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </tbody>
  </table>
</form>
</body>
</html>
