<%@ Page language="c#" Codebehind="Calendar.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.Calendar.Calendar" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<!--LINK href="../../StyleSheets/Objects.css" type="text/css" rel="stylesheet"--><LINK href="../../StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../../CommonLibrary/CommonLibrary.js"></script>
	</HEAD>
	<body bottomMargin="0" bgColor="#ffffff" leftMargin="0" topMargin="0" rightMargin="0"
		MS_POSITIONING="FlowLayout">
		<form id="frmCal" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td><asp:calendar id="calBasic" runat="server" Width="384px" Height="296px" BorderStyle="Solid" NextPrevFormat="ShortMonth"
							BackColor="White" ForeColor="Black" CellSpacing="1" Font-Size="9pt" Font-Names="Verdana" BorderColor="Black">
							<TodayDayStyle ForeColor="White" BackColor="#999999"></TodayDayStyle>
							<DayStyle BackColor="#eeeeee"></DayStyle>
							<NextPrevStyle Font-Size="8pt" Font-Bold="True" ForeColor="White"></NextPrevStyle>
							<DayHeaderStyle Font-Size="8pt" Font-Bold="True" Height="8pt" ForeColor="#333333"></DayHeaderStyle>
							<SelectedDayStyle ForeColor="White" BackColor="#005780"></SelectedDayStyle>
							<TitleStyle Font-Size="12pt" Font-Bold="True" Height="12pt" ForeColor="White" BackColor="#005780"></TitleStyle>
							<OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>
						</asp:calendar></td>
				</tr>
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td width="10">&nbsp;</td>
								<td height="50">&nbsp;
									<asp:label id="lbCalDisplay" runat="server" CssClass="Bbluetitle">시작일을 클릭하세요.</asp:label></td>
								<td width="10">&nbsp;</td>
							</tr>
							<tr>
								<td style="HEIGHT: 25px">&nbsp;</td>
								<td style="HEIGHT: 25px"><span style="font-size:9pt">시작일:
										<asp:textbox id="BeginTime" runat="server" Width="80px" MaxLength="10" ReadOnly="True"></asp:textbox>
										<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="BeginTime"
											Display="Dynamic"></asp:RequiredFieldValidator>~종료일:
										<asp:textbox id="EndTime" runat="server" Width="80px" MaxLength="10" ReadOnly="True"></asp:textbox>&nbsp;</span></td>
								<td style="HEIGHT: 27px"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">&nbsp;
									<asp:ImageButton id="ibCalDone" runat="server" AlternateText="설정완료" ImageUrl="../../Admins/zImages/admin_btn_enter.gif"></asp:ImageButton>&nbsp;
									<asp:HyperLink id="hlReset" runat="server" NavigateUrl="Calendar.aspx">
										<img src="../../Admins/zImages/btn_admin_reset.gif" border="0"></asp:HyperLink>&nbsp;
									<asp:HyperLink id="hlClose" runat="server" NavigateUrl="javascript:window.close();">
										<img src="../../Admins/zImages/btn_admin_close.gif" border="0"></asp:HyperLink></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
