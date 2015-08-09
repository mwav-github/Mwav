<%@ Page language="c#" Codebehind="ForumCmt_edit.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.Boards.Forum.ForumCmt_edit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>코멘트 수정</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="/StyleSheets/Objects.css" type="text/css" rel="stylesheet">
		<LINK href="/StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<!--LINK href="../../style.css" type="text/css" rel="stylesheet"-->
		<LINK href="board.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body leftMargin="0" topMargin="0" MS_POSITIONING="FlowLayout">
		<form id="CommentEditForm" method="post" runat="server">
			<table height="100%" width="100%" align="center" border="0">
				<tr align="center">
					<td><asp:textbox id="Comment" runat="server" TextMode="MultiLine" Rows="8" Width="360px" CssClass="textbox"></asp:textbox><FONT face="굴림"><BR>
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="코멘트를 입력하세요." ControlToValidate="Comment"></asp:RequiredFieldValidator></FONT></td>
				</tr>
				<tr align="center" height="40">
					<td><asp:imagebutton id="EditButton" runat="server" ImageUrl="Images/img/edit.gif"></asp:imagebutton>&nbsp;
						<A href="Javascript:window.close();"><IMG src="Images/img/cancel.gif" border="0"></A>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>