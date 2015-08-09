<%@ Import namespace="JinsLibrary" %>
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
<%@ Page language="c#" Codebehind="bnView.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.BoardNotice.bnView"%>
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
											<td width="500">
												<table id="Table5" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<tr vAlign="top" align="center" bgColor="#ffffff">
														<td>
															<table cellSpacing="2" cellPadding="1" width="98%" border="0">
																<tr>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr align="center" bgColor="#66ffcc">
																	<td width="25%">공지번호</td>
																	<td width="25%">분류</td>
																	<td width="25%">조회수</td>
																	<td width="25%">작성일</td>
																</tr>
																<tr align="center">
																	<td><asp:label id="bNotice_id" runat="server"></asp:label></td>
																	<td><asp:label id="bnGroup" runat="server"></asp:label></td>
																	<td><asp:label id="viewCount" runat="server"></asp:label></td>
																	<td><asp:label id="writeDT" runat="server"></asp:label></td>
																</tr>
															</table>
															<br>
															<table cellSpacing="0" cellPadding="0" width="98%" border="0">
																<tr>
																	<td align="left" bgColor="#166312" height="25"><asp:label id="bnTitle" runat="server" CssClass="txt3" Font-Bold="True"></asp:label></td>
																</tr>
																<tr>
																	<td vAlign="top" align="left" height="200">
																		<div align="center" class="ContentBreak"><asp:label id="bnSubTitle" runat="server"></asp:label></div>
																		<div align="left" class="ContentBreak"><asp:Label id="bnContent" runat="server"></asp:Label></div>
																	</td>
																</tr>
																<tr>
																	<td align="right"><asp:label id="modifyDT" runat="server" Visible="False"></asp:label></td>
																</tr>
																<tr>
																	<td align="center"><asp:hyperlink id="btnList" runat="server" ImageUrl="/CommonApps/BoardNotice/Images/bnList.gif"
																			NavigateUrl="/CommonApps/BoardNotice/bnList.aspx"></asp:hyperlink>&nbsp;
																		<asp:hyperlink id="btnCancle" runat="server" ImageUrl="/CommonApps/BoardNotice/Images/bnCancle.gif"
																			NavigateUrl="javascript:history.back();"></asp:hyperlink></td>
																</tr>
																<tr>
																	<td align="center">&nbsp;</td>
																</tr>
																<tr>
																	<td align="center">
																		<table cellSpacing="1" cellPadding="4" width="100%" bgColor="#ffffff" border="0">
																			<tr bgColor="#f4f4f2">
																				<td align="center" width="50">이전</td>
																				<td align="left"><asp:hyperlink id="hlPreData" runat="server"></asp:hyperlink></td>
																			</tr>
																			<tr bgColor="#f4f4f2">
																				<td align="center" width="50">다음</td>
																				<td align="left"><asp:hyperlink id="hlNextData" runat="server"></asp:hyperlink></A></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td bgColor="#ffffff">&nbsp;
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
