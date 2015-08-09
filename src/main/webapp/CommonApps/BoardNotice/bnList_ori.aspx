<%@ Page language="c#" Codebehind="bnList.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.BoardNotice.bnList" trace=false%>
<%@ Register TagPrefix="uc1" TagName="ImageMaking" Src="../../ContentsParts/CenterFocus/ImageMaking.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ImageLinking" Src="../../ContentsParts/CenterFocus/ImageLinking.ascx" %>
<%@ Register TagPrefix="uc1" TagName="TrustBanner" Src="../../ContentsParts/Banners/TrustBanner.ascx" %>
<%@ Register TagPrefix="uc1" TagName="QuickSearch" Src="../../ContentsParts/ProductSearch/QuickSearch.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMainMenu" Src="../../ContentsParts/LeftMainMenu/LeftMainMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontFlash" Src="../../ContentsParts/BodyTopFlashMovies/FrontFlash.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontFooter" Src="../../SiteFooter/FrontFooter.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontHeader" Src="../../SiteHeader/FrontHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontNoticeList" Src="../../CommonApps/BoardNotice/FrontNoticeList.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MajorCompany" Src="../../ContentsParts/Banners/MajorCompany.ascx" %>
<%@ Register TagPrefix="uc1" TagName="QuickLinks" Src="../../CommonApps/QuickLinks/QuickLinks.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MemberPoll" Src="../../CommonApps/MemberPoll/MemberPoll.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PopupGoQnA" Src="../../ContentsParts/PopupGoQnA/PopupGoQnA.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontNewsList" Src="../../CommonApps/BoardNews/FrontNewsList.ascx" %>
<%@ Import namespace="JinsLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
	<HEAD>
		<title>KISTEL - The Key System for The Telecommunication</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<LINK href="../../StyleSheets/Objects.css" type="text/css" rel="stylesheet">
		<LINK href="../../StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"></script>
	</HEAD>
	<body>
		<form id="frmBody" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" border="0">
				<tr>
					<td bgColor="#33ffff"><uc1:frontheader id="FrontHeader1" runat="server"></uc1:frontheader></td>
				</tr>
				<tr>
					<td>
						<table id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr vAlign="top">
								<td width="165" height="300">
									<table id="Table3" cellSpacing="0" cellPadding="0" width="100%" bgColor="#cccccc" border="0">
										<tr>
											<td><uc1:leftmainmenu id="LeftMainMenu1" runat="server"></uc1:leftmainmenu></td>
										</tr>
										<tr>
											<td><uc1:quicksearch id="QuickSearch1" runat="server"></uc1:quicksearch></td>
										</tr>
										<tr>
											<td><uc1:trustbanner id="TrustBanner1" runat="server"></uc1:trustbanner></td>
										</tr>
									</table>
								</td>
								<td>
									<base href='<%= Application["BaseHref"] %>CommonApps/BoardNotice/' target="_self">
									<table id="Table4" cellSpacing="0" cellPadding="0" width="100%" bgColor="#e8f4f1" border="0">
										<tr>
											<td colSpan="2"><uc1:frontflash id="FrontFlash1" runat="server"></uc1:frontflash></td>
										</tr>
										<tr>
											<td>
												<table id="Table5" cellSpacing="0" cellPadding="0" width="100%" bgColor="#ffffff" border="1">
													<tr>
														<td height="300" align="center" vAlign="top">
															<table width="95%" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td height="25" align="right" valign="bottom"><asp:label id="lbListBrief" runat="server"></asp:label></td>
																</tr>
															</table>
															<asp:datalist id="dlNoticeList" runat="server">
																<HeaderTemplate>
																	<table width="460" border="0" cellspacing="2" cellpadding="1">
																		<tr align="center" bgcolor="#66ffcc">
																			<td width="25%">공지번호</td>
																			<td width="25%">분류</td>
																			<td width="25%">제목</td>
																			<td width="25%">기록일</td>
																		</tr>
																	</table>
																</HeaderTemplate>
																<ItemTemplate>
																	<table width="450">
																		<TR align="center">
																			<TD>
																				<%# DataBinder.Eval(Container.DataItem, "bNotice_id") %>
																			</TD>
																			<TD>
																				<%# DataBinder.Eval(Container.DataItem, "bnGroup") %>
																			</TD>
																			<TD>
																				<a href='bnView.aspx?cp=<%# WebUtil.CurrentRequest["cp"] %>&bnID=<%# DataBinder.Eval(Container.DataItem, "bNotice_id") %>&bnG=<%# DataBinder.Eval(Container.DataItem, "bnGroup") %>'>
																					<%# DataBinder.Eval(Container.DataItem, "bnTitle") 	%>
																				</a>
																			</TD>
																			<TD>
																				<%# DataBinder.Eval(Container.DataItem, "noticeDay", "{0:d}") %>
																			</TD>
																		</TR>
																	</table>
																</ItemTemplate>
																<AlternatingItemStyle BackColor="#ccffff"></AlternatingItemStyle>
															</asp:datalist>
															<asp:label id="lbNotice" runat="server" Visible="False" Height="50px">공지사항이 없습니다.</asp:label>
															<br>
															<asp:label id="lbPaging" runat="server"></asp:label>
														</td>
													</tr>
												</table>
											</td>
											<td vAlign="top" width="180">
												<table cellSpacing="0" cellPadding="0" width="100%" border="0">
													<tr>
														<td><uc1:quicklinks id="QuickLinks1" runat="server"></uc1:quicklinks></td>
													</tr>
													<tr>
														<td><uc1:majorcompany id="MajorCompany1" runat="server"></uc1:majorcompany></td>
													</tr>
													<tr>
														<td><uc1:memberpoll id="MemberPoll1" runat="server"></uc1:memberpoll></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgColor="#33ffff"><uc1:frontfooter id="FrontFooter1" runat="server"></uc1:frontfooter></td>
				</tr>
			</table>
			</TR></TABLE></TR></TABLE></TR></TABLE>
		</form>
	</body>
</HTML>
