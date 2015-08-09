<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%@ Import namespace="JinsLibrary" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FrontNewsList.ascx.cs" Inherits="KistelSite.CommonApps.BoardNews.FrontNewsList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<base href='<%= Application["BaseHref"] %>CommonApps/BoardNews/' target=_self>


<table width="344" border="0" cellspacing="0" cellpadding="0"><!--<HeaderTemplate>-->
  <tr>
    <td><asp:HyperLink id="hlMoreList" runat="server" ImageUrl="/CommonApps/BoardNews/Images/Front_news001.gif"
									NavigateUrl="/CommonApps/BoardNews/bnsList.aspx"></asp:HyperLink><!--</HeaderTemplate>--></td>
  </tr>  
  <tr>
    <td align="center" background="Images/Front_news002.gif"><table width="325" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="2"></td>
        </tr>
	  <tr>
        <td width="154" style="WIDTH: 154px"><img src="Images/Front_news_img050928.gif" width="149" height="133"></td>
        <td width="154" align="left"><SPAN id=bnsContent>
			<a href="../BoardNotice/bnView.aspx?bnID=100019">
			당사는 2005년9월 1000GIGA BYTE ( 1 TERA) 용량의 스토리지를 본격 판매를 시작 했습니다. <br>
			일본 퍼팔로사에서 공급 받아  거래처에 공급 ... </a></SPAN></td>
      </tr>
	  <tr>
        <td height="10" colspan="2"></td>
      </tr>
      <tr bgcolor="#afafaf">
        <td height="1" colspan="2"></td>
      </tr>
	  <tr>
        <td height="10" colspan="2"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" background="Images/Front_news002.gif">
    <asp:repeater id="rptNews" runat="server" EnableViewState="False"> <ItemTemplate>
    <table width="325" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="20" align="left" class="int01"><img src="Images/Front_news_icon001.gif" width="5" height="7" align="absmiddle"> <a href='bnsView.aspx?bnsID=<%# DataBinder.Eval(Container.DataItem, "bNews_id") %>'>
		<%# Text.ShortenUniString(DataBinder.Eval(Container.DataItem, "bnsTitle","{0}"), 47) %></a>
		</td>
							<!-- td width="70"><%# DataBinder.Eval(Container.DataItem, "newsDay", "{0:d}") %></td -->
      </tr>
      <tr>
        <td background="Images/Front_news_hidden01.gif"><img src="Images/Front_news_hidden01.gif" width="3" height="1"></td>
      </tr>
    </table>
    </ItemTemplate>
    </asp:repeater>
	
	<asp:panel id="pnNews" runat="server" Visible="False">
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR>
          <TD align=center height=150>뉴스 데이터가 
      없습니다.</TD></TR></TABLE>
			</asp:panel>

	
	</td>
  </tr> 
  <tr>
    <td> <!--<FooterTemplate>--><img src="Images/Front_news003.gif" width="344" height="22"><!--</FooterTemplate>--></td>
  </tr>
   <!-- <tr>
<SeparatorTemplate>
					<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td background="Images/dotline.gif" colspan="2" height="3"></td>
						</tr>
					</table>
	</SeparatorTemplate>
  </tr> -->
</table>
