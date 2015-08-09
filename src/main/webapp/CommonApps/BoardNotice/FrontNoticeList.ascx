<%@ Import namespace="JinsLibrary" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FrontNoticeList.ascx.cs" Inherits="KistelSite.CommonApps.BoardNotice.FrontNoticeList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<base href='<%= Application["BaseHref"] %>CommonApps/BoardNotice/' target="_self">
<table width="344" border="0" cellspacing="0" cellpadding="0">
	<tr> <!--<HeaderTemplate>-->
		<td><asp:HyperLink id="hlMoreList" runat="server" ImageUrl="/CommonApps/BoardNotice/Images/Front_notice001.gif"
				NavigateUrl="/CommonApps/BoardNotice/bnList.aspx"></asp:HyperLink></td>
	</tr>
	<tr>
		<td height="10" align="center" background="Images/Front_news002.gif"></td>
	</tr>
	<tr>
		<td align="center" background="Images/Front_news002.gif">
		<asp:repeater id="rptNotice" EnableViewState="False" runat="server">
				<ItemTemplate>
					<table width="325" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="250" height="20" align="left" class="int01"><img src="Images/Front_news_icon001.gif" width="5" height="7">
								<a href='bnView.aspx?bnID=<%# DataBinder.Eval(Container.DataItem, "bNotice_id") %>'>
									<%# Text.ShortenUniString(DataBinder.Eval(Container.DataItem, "bnTitle","{0}"), 35) %>
								</a>
							</td>
							<td width="75" align="center"><%# DataBinder.Eval(Container.DataItem, "noticeDay", "{0:d}") %></td>
						</tr>
						<tr>
							<td colspan="2" background="Images/Front_news_hidden01.gif"><!--<SeparatorTemplate>--><img src="Images/Front_news_hidden01.gif" width="3" height="1"></td>
						</tr>
					</table>
				</ItemTemplate>
			</asp:repeater>
			<asp:Panel id="pnlNotice" runat="server" Visible="False">공지사항이 없습니다.</asp:Panel>
			</td>
	</tr>
	<tr> <!--<FooterTemplate>-->
		<td><img src="Images/Front_news003.gif" width="344" height="22"></td>
	</tr>
</table>

