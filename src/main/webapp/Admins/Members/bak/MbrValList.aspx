<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MbrValList.aspx.cs" Inherits="ADMIN.Admins_Members_MbrValList" %>

<%@ Register TagPrefix="uc1" TagName="AdminMessage" Src="~/MessageView/AdminMessage.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex,nofollow" />
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css" />
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
                        <td width="22">
                            <img width="22" height="27" src="../zImages/admin_top009.gif" />
                        </td>
                        <td bgcolor="#dfdfdf">
                            현재위치 : <asp:Literal ID="litPageTitle" runat="server" />
                        </td>
                        <td>
                            <img height="27" src="../zImages/admin_top010.gif" width="10" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="20">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <table id="Table5" cellspacing="0" cellpadding="0" width="100%" bgcolor="#ffffff"
                    border="0">
                    <tr>
                        <td valign="top" align="center" height="300">
                            <table height="49" cellspacing="0" cellpadding="0" width="800" border="0">
                                <tr>
                                    <td width="191">
                                        <img width="191" height="72" src="Images/member_009.gif" />
                                    </td>
                                    <td background="Images/member_002.gif">
                                        <table id="Table1" cellspacing="0" cellpadding="0" width="98%" border="0">
                                            <tr>
                                                <td valign="bottom" align="left" colspan="3" height="25">
                                                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                        <tr>
                                                            <td height="20">
                                                                &nbsp;
                                                            </td>
                                                            <td align="right">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ddlSearch" runat="server">
                                                                    <asp:ListItem Value="MbrName" Selected="True">회원명</asp:ListItem>
                                                                    <asp:ListItem Value="loginID">아이디</asp:ListItem>
                                                                    <asp:ListItem Value="member_id">member_id</asp:ListItem>
                                                                    <asp:ListItem Value="mLevel">등급(숫자)</asp:ListItem>
                                                                    <asp:ListItem Value="howMuch">구매액(숫자)</asp:ListItem>
                                                                    <asp:ListItem Value="RFund">적립금(숫자)</asp:ListItem>
                                                                    <asp:ListItem Value="point">포인트(숫자)</asp:ListItem>
                                                                    <asp:ListItem Value="unpaid">미지불금(숫자)</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:TextBox ID="tbSearchString" runat="server" Height="20px" ToolTip="검색 키워드를 넣으세요."
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
                                    <td>
                                        <img height="72" src="Images/member_003.gif" width="10" />
                                    </td>
                                </tr>
                            </table>
                            <br />
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
                            <asp:DataGrid ID="dataGrid" runat="server" Width="800px" AutoGenerateColumns="False"
                                CellSpacing="1" PageSize="6" GridLines="None" CellPadding="1" 
                                BorderWidth="0px" onitemcommand="dataGrid_ItemCommand" 
                                onitemdatabound="dataGrid_ItemDataBound">
                                <AlternatingItemStyle BackColor="#EEEEEE"></AlternatingItemStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <HeaderStyle Wrap="False" HorizontalAlign="Center" Height="30px" VerticalAlign="Middle"
                                    BackColor="#707070"></HeaderStyle>
                                <Columns>
                                    <asp:BoundColumn DataField="member_id" HeaderText="회원번호">
                                        <HeaderStyle Width="55px" CssClass="Bwhite"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="회원명(아이디)">
                                        <HeaderStyle CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlEmail" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="등급">
                                        <HeaderStyle Width="30px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                                <asp:Label ID="mLevel" runat="server" Font-Underline="true"><%# DataBinder.Eval(Container.DataItem, "mLevel")%></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="구매액/횟수">
                                        <HeaderStyle Width="80px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "HowMuch", "{0:n0}") %>
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "HowMany", "{0:n0}") %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="적립금">
                                        <HeaderStyle Width="80px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "RFund", "{0:n0}") %>
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "RFundAC", "{0:n0}") %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="포인트">
                                        <HeaderStyle Width="80px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "point", "{0:n0}") %>
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "pointAC", "{0:n0}") %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="미지불금">
                                        <HeaderStyle Width="60px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "unpaid", "{0:n0}") %>
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "unpaidAC", "{0:n0}") %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="레터">
                                        <HeaderStyle Width="30px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <%# App_Code.Member.MbrBaseLib.Self.GetNewsLetterText(DataBinder.Eval(Container.DataItem, "newsLetter")) %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="joinDT" HeaderText="가입일" DataFormatString="{0:d}">
                                        <HeaderStyle Width="70px" CssClass="Bwhite"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="최근방문일">
                                        <HeaderStyle Width="70px" CssClass="Bwhite"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="recentLogin" ToolTip='<%# DataBinder.Eval(Container.DataItem, "recentLogin") %>'
                                                runat="server"> <%# DataBinder.Eval(Container.DataItem, "recentLogin", "{0:d}") %> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="관리메뉴">
                                        <HeaderStyle Width="100px" CssClass="Bwhite" HorizontalAlign="center"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlView" ImageUrl="../zImages/btn_admin_view.gif" Visible="False"
                                                runat="server"></asp:HyperLink>
                                            <asp:ImageButton ID="ibModfy" runat="server" ImageUrl="../zImages/btn_admin_modify.gif" CausesValidation="False" Visible="False" />
                                            <asp:Literal ID="displayNone" Text="없음" Visible="False" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" ForeColor="#000066" BackColor="White" Mode="NumericPages">
                                </PagerStyle>
                            </asp:DataGrid>
                            <uc1:AdminMessage ID="ucMessage" runat="server" />
                            <br />
                            <table cellspacing="0" cellpadding="0" width="800" border="0">
                                <tr>
                                    <td align="center">
                                        &nbsp;
                                    </td>
                                    <td align="center">
                                        <asp:Literal ID="litPaging" runat="server"></asp:Literal>
                                    </td>
                                    <td align="center">
                                        <asp:HyperLink ID="hlAllList" runat="server" NavigateUrl="MbrValList.aspx" ImageUrl="../zImages/btn_view_list.gif"></asp:HyperLink>
                                        &nbsp;
                                        <asp:HyperLink ID="hlInsert" runat="server" NavigateUrl="MbrForm.aspx" ImageUrl="../zImages/btn_member_write.gif"></asp:HyperLink>
                                        &nbsp;
                                        <asp:ImageButton ID="ibSendMail" runat="server" ImageUrl="../zImages/btn_send_mail.gif"
                                            AlternateText="메일발송"></asp:ImageButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
