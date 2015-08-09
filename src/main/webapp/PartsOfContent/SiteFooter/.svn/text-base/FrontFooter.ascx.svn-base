<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FrontFooter.ascx.cs" Inherits="WebRoot.PartsOfContents.SiteFooter.FrontFooter" %>
<%@ OutputCache Duration="1" VaryByParam="none" %>
<%@ Register src="../HomeBookmark/HomeBookmark.ascx" tagname="HomeBookmark" tagprefix="uc1" %>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td height="25">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" width="880">
      <tr>
        <td width="20" height="46" background="/PartsOfContent/SiteFooter/Images/footer_bg_01.gif">&nbsp;</td>
        <td width="*" align="center" background="/PartsOfContent/SiteFooter/Images/footer_bg_02.gif"> |
          <asp:HyperLink ID="hlHome" runat="server" CssClass="bb" Text="HOME"/>    
          | <a class="bb" href="/Company/Introduction/Introduction.aspx">회사소개</a> | 
          <a class="bb" href="/Company/BusinessFields/BusinessFields.aspx">사업분야</a> | 
          <a class="bb" href="/Company/LocationMap/LocationMap.aspx">회사약도</a> | 
          <a class="bb" href="/Company/Profitsharing/Profitsharing.aspx">사업제휴문의</a> | 
          <a class="bb" href="/CustomerServices/Contacts/Contacts.aspx">담당자안내</a> | 
          <a class="bb" href="/CustomerServices/SiteMap/SiteMap.aspx">사이트맵</a> | 
          <a class="bb" href="/CustomerServices/Policies/Policies.aspx?ipp=pi">개인정보취급방침</a> | 
          <a class="bb" href="/CustomerServices/Policies/Policies.aspx?ipp=ee">이메일주소수집거부</a> | 
          <a class="bb" href="/CustomerServices/Summary/Summary.aspx">고객지원센터</a> | </td>
        <td width="20" background="/">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" align="center" valign="bottom"><table border="0" cellpadding="0" cellspacing="0" height="100" width="840">
          <tr>
            <td align="center" width="250"><img src="/Company/zImages/CompanyLogo_grayedOut.png"/></td>
            <td width="15" valign="top" style="padding-top:13px"></td>
            <td align="left" valign="top" style="padding-top:13px"><table border="0" cellpadding="0" cellspacing="0" width="400">
              <tr>
                <td align="left" class="small"><p>회사상호:
                  <asp:Literal ID="litFirmName" runat="server"/>      
                  &nbsp;/ 사업자번호:
                  <asp:Literal ID="litBusinessID" runat="server"/>
                  <br />
                  TEL:
                  <asp:Literal ID="litFirmPhone" runat="server"/>
                  &nbsp;/&nbsp; FAX:
                  <asp:Literal ID="litFirmFax" runat="server"/>
                  <!-- 사이트책임자:
                      <asp:Literal ID="litChiefManager" runat="server"/>-->
                  &nbsp; <br />
                  <asp:Literal ID="litFirmAddr" runat="server"/>
                  <br />
                  대표이사:
                  <asp:Literal ID="litCeoName" runat="server"/>
                  &nbsp;/ 영업담당자:
                  <asp:Label ID="lbPromoter" runat="server">???</asp:Label>
                  &nbsp;/ 사이트담당자:
                  <asp:Literal ID="litSiteManager" runat="server"/>
                </p></td>
              </tr>
              <tr>
                <td align="left"><img height="10" src='/PartsOfContents/SiteFooter/Images/.gif' width="324"/>
                  <!--<asp:Literal id="copyright" runat="server">copyright</asp:Literal>--></td>
              </tr>
            </table></td>
            <td width="180" align="left" valign="middle" style="padding-top:13px"><uc1:HomeBookmark ID="HomeBookmark1" runat="server" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <!--
  onclick="this.style.behavior='url(#default#homepage)'; this.setHomepage('http://www.cubecorp.co.kr')"
  -->
</table>
<div id="ScrResolutionWebService" style="BEHAVIOR: url(http://<%= HttpContext.Current.Request.ServerVariables["HTTP_HOST"] %>/CommonLibrary/WebServices/webservice.htc)">
</div>
