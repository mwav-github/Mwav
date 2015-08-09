<%@ Page language="c#" Codebehind="PollView.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.MemberPoll.PollView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>PollView</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../StyleSheets/Objects.css" type="text/css" rel="stylesheet">
		<LINK href="../../../StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"></script>
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="frmPoll" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="98%" align="center" border="0">
				<TBODY>
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="23"><img src="Images/poll_005.gif" width="23" height="48"></td>
									<td background="Images/poll_007.gif"><img src="Images/poll_006.gif" width="71" height="48"></td>
									<td width="32" align="right"><img src="Images/poll_008.gif" width="32" height="48"></td>
								</tr>
								<tr>
									<td><img src="Images/poll_009.gif" width="23" height="24"></td>
									<td>제 목 :
										<asp:label id="pTopic" runat="server"></asp:label></td>
									<td><img src="Images/poll_010.gif" width="32" height="24"></td>
								</tr>
								<tr>
									<td><img src="Images/poll_011.gif" width="23" height="5"></td>
									<td background="Images/poll_012.gif"><img src="Images/poll_012.gif" width="1" height="5"></td>
									<td><img src="Images/poll_013.gif" width="32" height="5"></td>
								</tr>
								<tr>
									<td><img src="Images/poll_009.gif" width="23" height="24"></td>
									<td>기 간 :
										<asp:label id="period" runat="server"></asp:label></td>
									<td><img src="Images/poll_010.gif" width="32" height="24"></td>
								</tr>
								<tr>
									<td><img src="Images/poll_011.gif" width="23" height="5"></td>
									<td background="Images/poll_012.gif"><img src="Images/poll_012.gif" width="1" height="5"></td>
									<td><img src="Images/poll_013.gif" width="32" height="5"></td>
								</tr>
								<tr>
									<td valign="top" background="Images/poll_015.gif"><img src="Images/poll_014.gif" width="23" height="167"></td>
									<td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr bgcolor="#5095e0">
												<td height="2"></td>
											</tr>
											<tr bgcolor="#f0f0f0">
												<td height="26">&nbsp;</td>
											</tr>
											<tr>
												<td><asp:placeholder id="phViewResult" runat="server"></asp:placeholder></td>
											</tr>
										</table>
									</td>
									<td valign="top" background="Images/poll_017.gif"><img src="Images/poll_016.gif" width="32" height="167"></td>
								</tr>
								<tr>
									<td><img src="Images/poll_018.gif" width="23" height="37"></td>
									<td background="Images/poll_019.gif">&nbsp;</td>
									<td><img src="Images/poll_020.gif" width="32" height="37"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td height="30" align="center"><A href="javascript:window.close();"><img src="Images/poll_022.gif" width="108" height="34" border="0"></A></td>
									<td>&nbsp;</td>
								</tr>
							</table>
		</form>
		</TR></TBODY></TABLE>
	</body>
</HTML>
