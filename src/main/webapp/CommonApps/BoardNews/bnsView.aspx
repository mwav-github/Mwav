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
<%@ Page language="c#" Codebehind="bnsView.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.BoardNews.bnsView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
	<HEAD>
		<title>KISTEL - The Key System for The Telecommunication; 제품동향뉴스보기</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<LINK href="../../StyleSheets/Objects.css" type="text/css" rel="stylesheet">
		<LINK href="../../StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"></script>
	</HEAD>
	<body>
		<form id="frmBody" method="post" runat="server">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><uc1:frontheader id="FrontHeader1" runat="server"></uc1:frontheader></td>
				</tr>
			</table>
			<table width="850" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="220" valign="top" background='<%= Application["BaseHref"] %>Images/leftm_back.gif'>
						<uc1:leftmainmenu id="LeftMainMenu1" runat="server"></uc1:leftmainmenu></td>
					<td rowspan="3" valign="top">
						<table width="630" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="25" align="right">:: Home &gt;&gt; 제품동향뉴스
								</td>
							</tr>
							<tr>
								<td align="center">
									<base href='<%= Application["BaseHref"] %>CommonApps/BoardNews/' target="_self">
									<table width="620" border="0" cellpadding="0" cellspacing="0" background="Images/notice_002.gif">
										<tr>
											<td width="99"><img src="Images/news_001.gif" width="99" height="89"></td>
											<td align="left" valign="bottom"><table width="400" height="70" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td width="135" align="center"><img src="Images/news_002.gif" width="123" height="28"></td>
														<td width="265" align="left">동종업계 및 제품에 관련된 최근 소식입니다.</td>
													</tr>
												</table>
										  </td>
											<td width="8"><img src="Images/notice_003.gif" width="8" height="89"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="20">&nbsp;</td>
							</tr>
							<tr>
								<td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="left"><img src="Images/notice_011.gif" width="69" height="16"></td>
											<td align="right">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="5" align="center"></td>
							</tr>
							<tr>
								<td align="center"><table id="Table5" cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr vAlign="top" align="center" bgColor="#ffffff">
											<td><table width="610" border="0" cellpadding="0" cellspacing="0" background="Images/notice_007.gif">
													<tr>
														<td width="7"><img src="Images/notice_006.gif" width="7" height="41"></td>
														<td width="70" align="center" class="Bbluetitle">제 목</td>
														<td width="7" align="left" valign="bottom"><img src="Images/notice_009.gif" width="1" height="20"></td>
														<td align="left" class="int01">
														<asp:Label ID="bnsTitle" runat="server" Font-Bold="True"></asp:Label></td>
														<td width="6"><img src="Images/notice_008.gif" width="6" height="41"></td>
													</tr>
												</table>
												<table width="610" border="0" cellpadding="0" cellspacing="1" bgcolor="#5a7aab">
													<tr>
														<td align="center" valign="top" bgcolor="#ffffff"><table width="604" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td height="2"></td>
																</tr>
																<tr>
																	<td height="40" bgcolor="#e4e8ee" class="int01">
																		<!--<asp:label id="bNews_id" runat="server"></asp:label>-->
																		분류 :
																		<asp:label id="bnsGroup" runat="server"></asp:label>
																		&nbsp;&nbsp;/&nbsp;&nbsp;작성일 :
																		<asp:label id="writeDT" runat="server"></asp:label>
																		&nbsp;&nbsp;/&nbsp;&nbsp;조회수 :
																		<asp:label id="viewCount" runat="server"></asp:label></td>
																</tr>
																<tr>
																	<td height="50" align="center"><asp:label Font-Bold="True" id="bnsSubTitle" runat="server" CssClass="ContentBreak"></asp:label>
																  </td>
																</tr>
																<tr>
																	<td align="left">
																	<div class="ContentBreak">
																	<asp:Label ID="bnsContent" runat="server"></asp:Label>
																	</div>
																  </td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
												<table width="610" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td height="30" align="right"><asp:label id="modifyDT" runat="server" Visible="False"></asp:label></td>
													</tr>
													<tr>
														<td align="right"><asp:hyperlink id="btnList" runat="server" ImageUrl="/CommonApps/BoardNotice/Images/btn_notice_list.gif"
																NavigateUrl="/CommonApps/BoardNotice/bnList.aspx"></asp:hyperlink>
															&nbsp;
															<asp:hyperlink id="btnCancle" runat="server" ImageUrl="/CommonApps/BoardNotice/Images/btn_notice_back.gif"
																NavigateUrl="javascript:history.back();"></asp:hyperlink>
															<br>
														</td>
													</tr>
												</table>
												<table width="610" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td><table width="610" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td width="7"><img src="Images/notice_006.gif" width="7" height="41"></td>
																	<td width="70" align="center" background="Images/notice_007.gif" class="Bbluetitle">이전글</td>
																	<td width="6"><img src="Images/notice_008.gif" width="6" height="41"></td>
																  <td align="left" background="Images/notice_012.gif" class="int01"><asp:hyperlink id="hlPreData" runat="server"></asp:hyperlink></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><table width="610" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td width="7"><img src="Images/notice_006.gif" width="7" height="41"></td>
																	<td width="70" align="center" background="Images/notice_007.gif" class="Bbluetitle">다음글</td>
																	<td width="6"><img src="Images/notice_008.gif" width="6" height="41"></td>
																  <td align="left" background="Images/notice_012.gif" class="int01"><asp:hyperlink id="hlNextData" runat="server"></asp:hyperlink></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td bgColor="#ffffff">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center">&nbsp;</td>
							</tr>
							<tr>
								<td height="50" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td height="40">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" background='<%= Application["BaseHref"] %>Images/leftm_back.gif'><uc1:quicksearch id="QuickSearch1" runat="server"></uc1:quicksearch></td>
				</tr>
				<tr>
					<td valign="top" background='<%= Application["BaseHref"] %>Images/leftm_back.gif'><uc1:trustbanner id="TrustBanner1" runat="server"></uc1:trustbanner></td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><uc1:FrontFooter id="FrontFooter1" runat="server"></uc1:FrontFooter></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
