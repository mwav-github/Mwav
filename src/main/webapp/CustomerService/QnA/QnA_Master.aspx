<%@ Page Language="C#" MasterPageFile="~/CustomerServices/CSMasterPage.master" AutoEventWireup="true" CodeFile="QnA_Master.aspx.cs" Inherits="CustomerServices_QnA_QnA_Master"%>
<%@ MasterType VirtualPath="~/CustomerServices/CSMasterPage.master" %>
<%@ Reference Control="~/CommonApps/QnA_System/QnA_Login.ascx" %>
<%@ Reference Control="~/CommonApps/QnA_System/QnA_Form.ascx" %>
<%@ Reference Control="~/CommonApps/QnA_System/QnA_List.ascx" %>
<%@ Reference Control="~/CommonApps/QnA_System/QnA_View.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CompanyContentPlaceHolder" Runat="Server">
    <table width="640" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="bottom" height="22"><asp:image id="imgQTitle" runat="server" ImageUrl="Images/qna_gds_title.gif"></asp:image></td>
      <td width="60%" align="right" style="padding-right:10px">:: HOME &gt;&gt;고객지원센터&gt;&gt;묻고 답하기 &gt;&gt;
        <asp:Label ID="lbNaviMenu" runat="server"></asp:Label>
      </td>
    </tr>
    <tr>
      <td colspan="2"><img src="/CustomerServices/zImages/Customer_title_line.gif"></td>
    </tr>
    <tr>
      <td colspan="2" style="padding:20px 10px 10px 10px">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>
              <asp:PlaceHolder runat="server" ID="PlaceHolder1" />
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
