<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FrontNoticeList.ascx.cs" Inherits="KistelSite.CommonApps.BoardNotice.FrontNoticeList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="JinsLibrary" %>
<base href='<%= Application["BaseHref"] %>CommonApps/BoardNotice/' target="_self">
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<TBODY>
		<tr>
			<td bgColor="#99ccff">여기가 공지 사항</td>
		</tr>
		<tr>
			<td bgColor="#ffffff"><asp:repeater id="rptNotice" EnableViewState="False" runat="server">
					<HeaderTemplate>
						<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
					</HeaderTemplate>
					<ItemTemplate>
						<tr>
							<td height="20">
								<img src="Images/bnLogin.gif" align="absmiddle">
								<a href='bnView.aspx?bnID=<%# DataBinder.Eval(Container.DataItem, "bNotice_id") %>'>
									<%# Text.ShortenString(DataBinder.Eval(Container.DataItem, "bnTitle","{0}"), 24) %>
								</a>
							</td>
							<td width="70"><%# DataBinder.Eval(Container.DataItem, "noticeDay", "{0:d}") %></td>
						</tr>
					</ItemTemplate>
					<SeparatorTemplate>
						<tr>
							<td background="Images/dotline.gif" colspan="2" height="3"></td>
						</tr>
					</SeparatorTemplate>
					<FooterTemplate>
					<tr>
						<td align="right" colspan="2">
						<asp:HyperLink id="hlMoreList" runat="server" ImageUrl="/CommonApps/BoardNotice/Images/bnMoreList.gif" NavigateUrl="/CommonApps/BoardNotice/bnList.aspx"></asp:HyperLink>&nbsp;
						</td>
					</tr>
					</table>
					</FooterTemplate>
				</asp:repeater>
<asp:Panel id="pnlNotice" runat="server" Visible="False">공지사항이 없습니다.</asp:Panel>
</TD></TR></TBODY></TABLE>
