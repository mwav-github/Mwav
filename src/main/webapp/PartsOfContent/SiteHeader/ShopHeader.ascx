<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShopHeader.ascx.cs" Inherits="WebRoot.PartsOfContents.SiteHeader.ShopHeader" %>
<%@ Register src="~/PartsOfContents/Menu/MainMenu.ascx" tagname="MainMenu" tagprefix="uc1" %>
<%@ Register src="~/PartsOfContents/HomeLanguages/HomeLanguages.ascx" tagname="HomeLanguages" tagprefix="uc2" %>
<%@ Register src="../HomeLanguages/CompanyLogoHomeLink.ascx" tagname="CompanyLogoHomeLink" tagprefix="uc3" %>
<table width="900" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10">&nbsp;</td>
    <td height="30" align="right">
    <table width="100%">
    <tr>
    <td align="left"><uc3:CompanyLogoHomeLink ID="CompanyLogoHomeLink1" runat="server" /></td>
    <td align="right"><uc2:HomeLanguages ID="HomeLanguages1" runat="server" /></td>
    </tr>
    </table>
        
        
        <asp:PlaceHolder ID="phWhenOff" runat="server">
            <asp:HyperLink ID="hlMbrLogin" runat="server" NavigateUrl="/CustomerServices/MemberShip/MemberLogin.aspx">로그인</asp:HyperLink> | 
            <asp:HyperLink ID="hlMbrJoin" runat="server" NavigateUrl="/CustomerServices/MemberShip/MemberAgreements.aspx">회원가입</asp:HyperLink> | 
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="phWhenOn" runat="server">
          --&gt; 
        <asp:ImageButton ID="ibMbrLogout" runat="server" AlternateText="로그아웃" onclick="ibMbrLogout_Click"  ImageUrl="/Images/ImgButtons/logout.gif" /> | 
        <asp:HyperLink ID="hlMemberInfo" runat="server" Text="회원정보"/> | 
        <asp:HyperLink ID="hlMyPage" runat="server" Text="나의페이지"/> | 
        </asp:PlaceHolder>
        <asp:HyperLink ID="hlShoppingCart" runat="server" Text="장바구니"/> | 
        <asp:HyperLink ID="hlCsCenter" runat="server" Text="고객지원센터"/>
        </td>
    <td width="10">&nbsp;</td>
  </tr>
  <tr>
    <td height="100">&nbsp;</td>
    <td><img src="/PartsOfContents/SiteHeader/Images/header.png" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
    <td align="center" bgcolor="#3399FF">
        <uc1:MainMenu ID="MainMenu1" runat="server" />
      </td>
    <td>&nbsp;</td>
  </tr>
</table>