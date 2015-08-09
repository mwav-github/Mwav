<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.ascx.cs" Inherits="WebRoot.PartsOfContents.Menu.MainMenu" %>
<asp:Panel ID="pnMenu" runat="server" Font-Bold="True" ForeColor="White">
    <asp:HyperLink ID="hlItem1" runat="server">패션</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem2" runat="server">뷰티</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem3" runat="server">컴퓨터/전자</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem4" runat="server">식품</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem5" runat="server">유아동/출산</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem6" runat="server" ToolTip="도서/음반">도서/음반</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem7" runat="server" ToolTip="여행">여행</asp:HyperLink> | 
    <asp:HyperLink ID="hlItem8" runat="server">스포츠</asp:HyperLink> |
    <asp:HyperLink ID="hlItem9" runat="server">OneDay상품</asp:HyperLink>
</asp:Panel>