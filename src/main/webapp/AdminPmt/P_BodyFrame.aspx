<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_BodyFrame.aspx.cs" Inherits="PARTNER.Adminp_BodyFrame" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta name="robots" content="noindex,nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
<link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<title>The Body Frame</title>
<script type="text/javascript">
<!-- 
    document.write('<div id="loading"><br><br>Please wait...</div>');
    window.onload=function(){
	    document.getElementById("loading").style.display="none";
    }
//-->
</script>
<style type="text/css">
#loading {
	MARGIN-TOP: -50px;
	LEFT: 50%;
	MARGIN-LEFT: -100px;
	WIDTH: 200px;
	POSITION: absolute;
	TOP: 50%;
	HEIGHT: 100px;
	BACKGROUND-COLOR: #c0c0c0;
	TEXT-ALIGN: center
}
</style>
</head>
<body>
<form id="frmBody" runat="server">
<table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="360" align="left" valign="top">&nbsp; </td>
            <td align="left" vAlign="top">&nbsp;</td>
          </tr>
          <tr>
            <td width="360" align="left" valign="top">&nbsp;</td>
            <td height="100" align="left" vAlign="top">관리자사이트에 오신 것을 환영합니다.</td>
          </tr>
          <tr>
            <td align="left" valign="middle">
              <p>&nbsp;</p>
            </td>
            <td align="left" vAlign="top">&nbsp;</td>
          </tr>
        </table>
  </table>
  <!--div style="text-align: center">
<table style="width: 70%; height: 20%">
                <tr>
                    <td colspan="2">
                        상태값 변화에 따른 진행순서</td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Height="31px"
                            Text="Label" Width="157px"></asp:Label></td>
                    <td style="width: 100px">
                        <asp:DropDownList ID="ddlProceed" runat="server" OnSelectedIndexChanged="ddlProceed_SelectedIndexChanged">
                            <asp:ListItem Selected="True">8~선택하세요~8</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
            </table>
        </div-->
</form>
</body>
</html>
