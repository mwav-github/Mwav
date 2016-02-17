<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MbrList.aspx.cs" Inherits="ADMIN.Admins_Members_MbrList" %>
<%@ Register TagPrefix="uc1" TagName="AdminMessage" Src="~/MessageView/AdminMessage.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex,nofollow"/>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script> 
    <title>The Members Management</title>
</head>
<body>
    <form id="frmMbr" method="post" runat="server">
    <table cellspacing="0" cellpadding="0" width="815" border="0">
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td width="22"><img height="27" src="../zImages/admin_top009.gif" width="26" /></td>
                        <td bgcolor="#f4f4f4">현재위치 : <asp:Literal ID="litPageTitle" runat="server" /></td>
                        <td width="10"><img height="27" src="../zImages/admin_top010.gif" width="10" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="20">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;
                
            </td>
            <td>
                <table id="Table5" cellspacing="0" cellpadding="0" width="100%" bgcolor="#ffffff"
                    border="0">
                    <tr>
                        <td valign="top" align="center" height="300">
                            <table height="49" cellspacing="0" cellpadding="0" width="800" border="0">
                                <tr>
                                    <td width="204"><img height="49" src="Images/member_001.gif" width="204" /></td>
                                    <td background="Images/member_002.gif">
                                        <table id="Table1" cellspacing="0" cellpadding="0" width="98%" border="0">
                                            <tr>
                                                <td valign="bottom" align="left" colspan="3" height="25">
                                                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ddlSearch" runat="server">
                                                                    <asp:ListItem Value="MbrName">회원명</asp:ListItem>
                                                                    <asp:ListItem Value="loginID">아이디</asp:ListItem>
                                                                    <asp:ListItem Value="phone">연락번호</asp:ListItem>
                                                                    <asp:ListItem Value="cellularP">모바일폰</asp:ListItem>
                                                                    <asp:ListItem Value="member_id" Selected="True">member_id</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:TextBox ID="tbSearchString" runat="server" Height="15px" ToolTip="검색 키워드를 넣으세요."
                                                                    MaxLength="8" Width="100px" OnTextChanged="tbSearchString_TextChanged"></asp:TextBox>
                                                                <asp:Button ID="btnSearch" runat="server" Height="23px" Text="검색" EnableViewState="False"
                                                                    OnClick="btnSearch_Click"></asp:Button>
                                                            </td>
                                                            <td align="right">
                                                                <asp:DropDownList ID="ddlSelMenu" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSelMenu_SelectedIndexChanged">
                                                                    <asp:ListItem Value="255" Selected="True">전회원</asp:ListItem>
                                                                    <asp:ListItem Value="101">주주</asp:ListItem>
                                                                    <asp:ListItem Value="5">최우수(플래티늄)</asp:ListItem>
                                                                    <asp:ListItem Value="4">최우수(골드)</asp:ListItem>
                                                                    <asp:ListItem Value="3">최우수(실버)</asp:ListItem>
                                                                    <asp:ListItem Value="2">우수회원</asp:ListItem>
                                                                    <asp:ListItem Value="1">정회원</asp:ListItem>
                                                                    <asp:ListItem Value="0">불량회원</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableViewState="False"
                                                        ControlToValidate="tbSearchString" ErrorMessage="*" ValidationExpression="[0-9A-Za-z\uac00-\ud7a3]{2,10}"
                                                        Display="Dynamic">*공백,특수문자를 제외한 두글자 이상을 입력하세요.</asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="8"><img height="49" src="Images/member_003.gif" width="8" /></td>
                                </tr>
                            </table>
                            <asp:DataList ID="dataList" runat="server" onitemcommand="dataList_ItemCommand" 
                                onitemdatabound="dataList_ItemDataBound">
                                <HeaderTemplate>
                                    <table cellspacing="0" cellpadding="0" width="800" height="30" border="0">
                                        <tr>
                                            <td height="20">
                                            </td>
                                            <td valign="bottom" align="left">
                                                <asp:Literal ID="litSearchResult" runat="server"></asp:Literal>
                                                &nbsp;
                                            </td>
                                            <td valign="bottom" align="right">
                                                <asp:Literal ID="litListBrief" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellspacing="1" cellpadding="2" width="800" border="0" bgcolor="#eeeeee">
                                        <tr align="center" bgcolor="#3a8bb1">
                                            <td width="55" height="25" bgcolor="#3a8bb1" class="Bwhite">
                                                회원번호
                                            </td>
                                            <td class="Bwhite">
                                                회원명(아이디)
                                            </td>
                                            <td width="100" class="Bwhite">
                                                연락번호
                                            </td>
                                            <td width="100" class="Bwhite">
                                                모바일폰
                                            </td>
                                            <td width="100" class="Bwhite">
                                                등 급
                                            </td>
                                            <td width="95" class="Bwhite">
                                                구매액/횟수
                                            </td>
                                            <td width="75" class="Bwhite">
                                                최근방문일
                                            </td>
                                            <td width="100" class="Bwhite">
                                                관리메뉴
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- 회원기본정보, 회원부가정보, 회원평가치, 회원가입작성 -->
                                </HeaderTemplate>
                                <AlternatingItemStyle BackColor="#e9e9e9"></AlternatingItemStyle>
                                <ItemTemplate>
                                    <table width="800" cellpadding="2" cellspacing="1">
                                        <tr align="center">
                                            <td width="55" height="20" align="center">
                                                <%# DataBinder.Eval(Container.DataItem, "member_id") %>
                                            </td>
                                            <td align="center">
                                                <asp:HyperLink ID="hlEmail" runat="server"></asp:HyperLink>
                                            </td>
                                            <td width="100" align="center">
                                                <%# DataBinder.Eval(Container.DataItem, "phone") %>
                                            </td>
                                            <td width="100" align="center">
                                                <%# DataBinder.Eval(Container.DataItem, "cellularP") %>
                                            </td>
                                            <td width="100" align="center">
                                                <asp:Literal ID="litStatusText" runat="server"/>
                                            </td>
                                            <td width="95" align="center">
                                                <%# DataBinder.Eval(Container.DataItem, "HowMuch", "{0:n0}") %>
                                                /<%# DataBinder.Eval(Container.DataItem, "HowMany", "{0:n0}") %>
                                            </td>
                                            <td width="75" align="center">
                                                <asp:Label ID="recentLogin" runat="server" />
                                            </td>
                                            <td width="100" align="center">
                                                <asp:HyperLink ID="hlView" ImageUrl="../zImages/btn_admin_view.gif" Visible="False" runat="server" />
                                                <asp:ImageButton ID="ibModfy" runat="server" ImageUrl="../zImages/btn_admin_modify.gif" CausesValidation="False" Visible="False" />
                                                <asp:Literal ID="displayNone" Text="없음" Visible="False" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <table width="800" cellpadding="0" cellspacing="0" height="1" bgcolor="#cccccc">
                                        <tr>
                                            <td height="1">
                                            </td>
                                        </tr>
                                    </table>
                                </SeparatorTemplate>
                            </asp:DataList>
                            <uc1:AdminMessage ID="ucMessage" runat="server"></uc1:AdminMessage>
                            <br />
                            <table cellspacing="0" cellpadding="0" width="800" border="0">
                                <tr>
                                    <td align="center">&nbsp;
                                        
                                    </td>
                                    <td align="center">
                                        <asp:Literal ID="litPaging" runat="server"></asp:Literal>
                                    </td>
                                    <td align="center">
                                        <asp:HyperLink ID="hlAllList" runat="server" NavigateUrl="MbrList.aspx" ImageUrl="../zImages/btn_view_list.gif"/>
                                        <asp:HyperLink ID="hlInsert" runat="server" NavigateUrl="MbrForm.aspx" ImageUrl="../zImages/btn_member_write.gif"/>
                                        <asp:ImageButton ID="ibSendMail" runat="server" ImageUrl="../zImages/btn_send_mail.gif" AlternateText="메일발송"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
