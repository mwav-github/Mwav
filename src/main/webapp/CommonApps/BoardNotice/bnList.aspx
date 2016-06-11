<%@ Import namespace="JinsLibrary" %>
<%@ Register TagPrefix="uc1" TagName="FrontNewsList" Src="../../CommonApps/BoardNews/FrontNewsList.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PopupGoQnA" Src="../../ContentsParts/PopupGoQnA/PopupGoQnA.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MemberPoll" Src="../../CommonApps/MemberPoll/MemberPoll.ascx" %>
<%@ Register TagPrefix="uc1" TagName="QuickLinks" Src="../../CommonApps/QuickLinks/QuickLinks.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MajorCompany" Src="../../ContentsParts/Banners/MajorCompany.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontNoticeList" Src="../../CommonApps/BoardNotice/FrontNoticeList.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontHeader" Src="../../SiteHeader/FrontHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontFooter" Src="../../SiteFooter/FrontFooter.ascx" %>
<%@ Register TagPrefix="uc1" TagName="FrontFlash" Src="../../ContentsParts/BodyTopFlashMovies/FrontFlash.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMainMenu" Src="../../ContentsParts/LeftMainMenu/LeftMainMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="QuickSearch" Src="../../ContentsParts/ProductSearch/QuickSearch.ascx" %>
<%@ Register TagPrefix="uc1" TagName="TrustBanner" Src="../../ContentsParts/Banners/TrustBanner.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ImageLinking" Src="../../ContentsParts/CenterFocus/ImageLinking.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ImageMaking" Src="../../ContentsParts/CenterFocus/ImageMaking.ascx" %>
<%@ Page language="c#" Codebehind="bnList.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.BoardNotice.bnList" trace=false%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
  <HEAD>
		<title>KISTEL - The Key System for The Telecommunication; 공지사항목록</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<LINK href="../../StyleSheets/Objects.css" type="text/css" rel="stylesheet">
		<LINK href="../../StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"></script>
</HEAD>
	<body MS_POSITIONING="FlowLayout">
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
								<td height="25" align="right">:: Home &gt;&gt; 공지사항
								</td>
							</tr>
							<tr>
								<td align="center">
									<base href='<%= Application["BaseHref"] %>CommonApps/BoardNotice/' target="_self">
									<table width="620" border="0" cellpadding="0" cellspacing="0" background="Images/notice_002.gif">
										<tr>
											<td width="100"><img src="Images/notice_001.gif" width="100" height="89"></td>
											<td align="left" valign="bottom"><table width="400" height="70" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td width="110" align="center"><img src="Images/notice_004.gif" width="96" height="28"></td>
														<td align="left">키스텔(주)의 최근 소식과 공지사항입니다.</td>
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
											<td align="left"><img src="Images/notice_005.gif" width="56" height="16"></td>
											<td align="right"><asp:label id="lbListBrief" runat="server"></asp:label></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="5" align="center"></td>
							</tr>
							<tr>
								<td align="center">
									<asp:datalist id="dlNoticeList" runat="server">
										<HeaderTemplate>
											<table width="610" border="0" cellpadding="0" cellspacing="0" background="Images/notice_007.gif">
												<tr>
													<td width="7"><img src="Images/notice_006.gif" width="7" height="41"></td>
													<td width="99" align="center" class="Bbluetitle">공지번호</td>
													<td width="1" align="center" valign="bottom"><img src="Images/notice_009.gif" width="1" height="20"></td>
													<td width="99" align="center" class="Bbluetitle">분 류
													</td>
													<td width="1" align="center" valign="bottom"><img src="Images/notice_009.gif" width="1" height="20"></td>
													<td width="289" align="center" class="Bbluetitle">제 목
													</td>
													<td width="1" align="center" valign="bottom"><img src="Images/notice_009.gif" width="1" height="20"></td>
													<td align="center" class="Bbluetitle">기록일</td>
													<td width="6"><img src="Images/notice_008.gif" width="6" height="41"></td>
												</tr>
											</table>
										</HeaderTemplate>
										<ItemTemplate>
											<table width="600">
												<TR>
													<TD width="100" align="center">
														<%# DataBinder.Eval(Container.DataItem, "bNotice_id") %>
													</TD>
													<TD align="center" width="100">
														<%# DataBinder.Eval(Container.DataItem, "bnGroup") %>
													</TD>
													<TD align="left" width="290">
														<a href='bnView.aspx?cp=<%# WebUtil.CurrentRequest["cp"] %>&bnID=<%# DataBinder.Eval(Container.DataItem, "bNotice_id") %>&bnG=<%# DataBinder.Eval(Container.DataItem, "bnGroup") %>'>
															<%# DataBinder.Eval(Container.DataItem, "bnTitle") 	%>
														</a>
													</TD>
													<TD align="center" width="110">
														<%# DataBinder.Eval(Container.DataItem, "noticeDay", "{0:d}") %>
													</TD>
												</TR>
											</table>
										</ItemTemplate>
										<SeparatorTemplate>
											<table width="600">
												<tr>
													<td colspan="4" height="1"><img src="Images/notice_010.gif"></td>
												</tr>
											</table>
										</SeparatorTemplate>
										<AlternatingItemStyle BackColor="#F7FAFF"></AlternatingItemStyle>
									</asp:datalist>
									<asp:label id="lbNotice" runat="server" Visible="False" Height="50px">공지사항이 없습니다.</asp:label>
								</td>
							</tr>
							<tr>
								<td align="center">
									<table width="610" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="5" bgcolor="#a8b9d3"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="50" align="right"><asp:Label ID="lbPaging" runat="server"></asp:Label></td>
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