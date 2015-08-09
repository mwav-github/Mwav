<%@ Page Language="c#" AutoEventWireup="false" Codebehind="UseDateSelector.aspx.cs" Inherits="KistelSite.CommonApps.Calendar.DateSelector.UseDateSelector" %>
<%@Register TagPrefix="SControls" TagName="DateSelector" src="DateSelector.ascx" %>
<HTML>
	<HEAD>
		<title>UseDateSelector</title>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<SCONTROLS:DATESELECTOR id="useDateCal" runat="server" Text="Start Date:"></SCONTROLS:DATESELECTOR><br>
			<SCONTROLS:DATESELECTOR id="DtCal" runat="server" Text="End Date:"></SCONTROLS:DATESELECTOR><br>
			<hr>
			<asp:button id="bt_Submit" runat="server" Text="Submit"></asp:button></form>
	</body>
</HTML>
