<%@ Page Language="C#" MasterPageFile="~/CompanyItems/CIMasterPage.master" AutoEventWireup="true" CodeFile="CellList.aspx.cs" Inherits="SHOP.Shop_GdsList_CellList" %>
<%@ Register src="~/MessageView/ClientMessage.ascx" tagname="ClientMessage" tagprefix="uc1" %>
<%@ MasterType VirtualPath="~/CompanyItems/CIMasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CompanyItemsPlaceHolder" Runat="Server">
  <table width="620" border="0" align="left" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="26" valign="bottom">
            <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td><img src="/Shop/Images/shop_titlebar.gif" width="28" height="22" /></td>
                <td><asp:Image ID="imgTitle" ImageUrl="/Shop/GdsList/Images/title_sp.gif" runat="server" /></td>
            </tr>
            </table>            
           </td>
            <td width="50%" align="right" style="padding-right:10px">:: HOME &gt;&gt;휴대폰&gt;&gt;리스트</td>
          </tr>
          <tr>
            <td width="26" colspan="2"><img src="/Shop/Images/shop_line.gif" width="640" height="2"></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="10" colspan="2"></td>
    </tr>
    <tr>
      <td height="50" colspan="2"><img src="/Shop/Images/shop_img.jpg"></td>
    </tr>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                  <td width="2" height="30"></td>
                  <td valign="middle" align="left">
                    <asp:DropDownList id="ddlSearch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                      <asp:ListItem Value="modelNbr" Selected="True">모델번호</asp:ListItem>
                      <asp:ListItem Value="gName">상품명</asp:ListItem>
                      <asp:ListItem Value="Mfger">제조사</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Literal id="litSearchResult" runat="server" Visible="True">값으로 정렬되었습니다.</asp:Literal>
                  </td>
                  <td valign="bottom" align="right">
                    <asp:Literal id="litListBrief" runat="server"></asp:Literal>
                  </td>
                </tr>
              </table>
              <asp:DataList id="dataList" runat="server" OnItemDataBound="dataList_ItemDataBound" OnItemCommand="dataList_ItemCommand" Width="640px" BorderWidth="0">
                <HeaderStyle ForeColor="White"/>
                <ItemStyle BackColor="#F7F7F7" ForeColor="#4A3C8C" />
                <alternatingitemstyle BackColor="#FFFFFF"/>
                <HeaderTemplate>
                  <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr align="center">
                      <td width="6"><img src="/Shop/Images/shop_t_bg01.gif"></td>
                      <td width="93" height="30" background="/Shop/Images/shop_t_bg02.gif"><b>상품이미지</b></td>
                      <td width="1" background="/Shop/Images/shop_t_bg02.gif"><img src="/Shop/Images/shop_t_bar.gif"></td>
                      <td background="/Shop/Images/shop_t_bg02.gif"><b>모델명 / 상품명</b></td>
                      <td width="1" background="/Shop/Images/shop_t_bg02.gif"><img src="/Shop/Images/shop_t_bar.gif"></td>
                      <td width="89" background="/Shop/Images/shop_t_bg02.gif"><b>제조사</b></td>
                      <td width="1" background="/Shop/Images/shop_t_bg02.gif"><img src="/Shop/Images/shop_t_bar.gif"></td>
                      <td width="79" background="/Shop/Images/shop_t_bg02.gif"><b>소비자가</b></td>
                      <td width="1" background="/Shop/Images/shop_t_bg02.gif"><img src="/Shop/Images/shop_t_bar.gif"></td>
                      <td width="79" background="/Shop/Images/shop_t_bg02.gif"><b>신규입금가</b></td>
                      <td width="1" background="/Shop/Images/shop_t_bg02.gif"><img src="/Shop/Images/shop_t_bar.gif"></td>
                      <td width="79" background="/Shop/Images/shop_t_bg02.gif"><b>번호이동가</b></td>
                      <!--td width="80" class="Bwhite">가입비</td>
                      <td width="80" class="Bwhite">U-Simm</td>
                      <td width="40" class="Bwhite">메뉴</td-->
                      <td width="6"><img src="/Shop/Images/shop_t_bg03.gif"></td>
                    </tr>
                  </table>
                  <!-- 회원기본정보, 회원부가정보, 회원평가치, 회원가입작성 -->
                </HeaderTemplate>
                <HeaderStyle ForeColor="White" />
                <itemtemplate>
                  <table width="100%" cellpadding="2" cellspacing="1">
                    <tr>
                      <td width="100" height="20" align="center">
                        <asp:HyperLink ID="hlGdsSmallPic" runat="server">
                          <asp:Image ID="imgGdsSmallPic" runat="server" />
                        </asp:HyperLink>
                      </td>
                      <td align="center">
                        <asp:HyperLink ID="hlGdsTitle" runat="server"><%# DataBinder.Eval(Container.DataItem, "modelNbr")%><br/>
                          <%# DataBinder.Eval(Container.DataItem, "gName")%></asp:HyperLink>
                      </td>
                      <td width="90" align="center"><%# DataBinder.Eval(Container.DataItem, "Mfger", "{0:n0}") %>원</td>
                      <td width="80" align="center"><span class="lineThrough"><%# DataBinder.Eval(Container.DataItem, "custPrice", "{0:n0}")%></span>원</td>
                      <td width="80" align="center"><%# DataBinder.Eval(Container.DataItem, "newPrice", "{0:n0}")%>원</td>
                      <td width="80" align="center"><%# DataBinder.Eval(Container.DataItem, "transPrice", "{0:n0}")%>원</td>
                      <!--td width="80" align="center"><%# DataBinder.Eval(Container.DataItem, "joinPrice", "{0:n0}")%>원</td>
                      <td width="80" align="center"><%# DataBinder.Eval(Container.DataItem, "USimmPrice", "{0:n0}")%>원</td>
                      <td width="40" align="center">
                      <asp:HyperLink ID="hlView" ImageUrl="../zImages/btn_admin_view.gif" Visible="False" Runat="server"></asp:HyperLink>
                      </td-->
                    </tr>
                  </table>
                </itemtemplate>
                <SeparatorTemplate>
                  <table width="100%" cellpadding="0" cellspacing="0" height="1" bgcolor="#cccccc">
                    <tr>
                      <td height="1"></td>
                    </tr>
                  </table>
                </SeparatorTemplate>
              </asp:DataList>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td bgcolor="#e9e9e9" height="3"></td>
                </tr>
                <tr>
                  <td bgcolor="#d0d0d0" height="1"></td>
                </tr>
              </table>
              <br />
              <table cellspacing="0" width="100%" cellpadding="0" border="0">
                <tr>
                  <td width="80" align="center">&nbsp;</td>
                  <td align="center">
                    <asp:literal id="litPaging" runat="server"></asp:literal>
                  </td>
                  <td width="10" align="center">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
