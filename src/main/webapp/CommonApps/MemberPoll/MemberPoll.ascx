<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MemberPoll.ascx.cs" Inherits="KistelSite.CommonApps.MemberPoll.MemberPoll" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<base href='<%= Application["BaseHref"] %>CommonApps/MemberPoll/' 
target=_self>
<table width="252" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><img src="Images/poll_001.gif" width="252" height="41"></td>
	</tr>
	<tr>
		<td align="center" background="Images/poll_002.gif"><table width="230" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="15" align="left" valign="top" height="10"></td>
					<td align="left">
					</td>
				</tr>
				<tr>
					<td width="15" align="left" valign="top"><img src="Images/poll_004.gif"></td>
					<td align="left">
						<asp:Label ID="pTopic" runat="server">pTopic</asp:Label>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="투표값을 선택하세요." ControlToValidate="rblExamples">*</asp:RequiredFieldValidator></td>
				</tr>
				<tr>
					<td height="8" colspan="2" align="left" valign="top"></td>
				</tr>
				<tr>
					<td align="left"></td>
					<td align="left"><asp:radiobuttonlist id="rblExamples" runat="server"></asp:radiobuttonlist>
						<asp:panel id="pnViewResult" runat="server" ToolTip="결과보기" Visible="False"></asp:panel><FONT face="굴림"></FONT></td>
				</tr>
				<tr>
					<td align="center"></td>
					<td align="center">
						<asp:ImageButton id="btnVote" runat="server" ImageUrl="/CommonApps/MemberPoll/Images/btn_poll_001.gif"></asp:ImageButton>
						&nbsp;
						<asp:hyperlink id="hlView" runat="server" ImageUrl="/CommonApps/MemberPoll/Images/btn_poll_002.gif"
							Visible="False">자세히보기</asp:hyperlink></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><img src="Images/poll_003.gif" width="252" height="19"></td>
	</tr>
</table>
<asp:ValidationSummary id="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"
	DisplayMode="List"></asp:ValidationSummary>
