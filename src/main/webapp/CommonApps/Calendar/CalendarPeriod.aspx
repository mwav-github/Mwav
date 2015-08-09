<%@ Page language="c#" Codebehind="CalendarPeriod.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.Calendar.CalendarPeriod" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
<meta content="Microsoft Visual Studio .NET 7.1" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
<meta content=JavaScript name=vs_defaultClientScript>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
		<!--LINK href="../../StyleSheets/Objects.css" type="text/css" rel="stylesheet"--><LINK href="../../StyleSheets/OverallPage.css" type=text/css rel=stylesheet >
<script language=JavaScript src="../../CommonLibrary/CommonLibrary.js"></script>
</HEAD>
<body bottomMargin=0 bgColor=#ffffff leftMargin=0 topMargin=0 rightMargin=0 MS_POSITIONING="FlowLayout">
<form id=frmCal method=post runat="server">
<table cellSpacing=0 cellPadding=0 width="100%" border=0>
  <tr>
    <td><asp:calendar id=calBasic runat="server" CellPadding="1" Width="384px" Height="296px" BorderStyle="Solid" NextPrevFormat="ShortMonth" BackColor="White" ForeColor="Black" CellSpacing="1" Font-Size="9pt" Font-Names="Verdana" BorderColor="Black"> <todaydaystyle forecolor="White" backcolor="#999999"></todaydaystyle> <daystyle backcolor="#eeeeee"></daystyle> <nextprevstyle font-size="8pt" font-bold="True" forecolor="White"></nextprevstyle> <dayheaderstyle font-size="8pt" font-bold="True" height="8pt" forecolor="#333333"></dayheaderstyle> <selecteddaystyle forecolor="White" backcolor="#005780"></selecteddaystyle> <titlestyle font-size="12pt" font-bold="True" height="12pt" forecolor="White" backcolor="#005780"></titlestyle> <othermonthdaystyle forecolor="#999999"></othermonthdaystyle> </asp:calendar></TD></TR>
  <tr>
    <td>
      <table cellSpacing=0 cellPadding=0 width="100%" border=0 
      >
        <tr>
          <td width=10>&nbsp;</TD>
          <td height=50>&nbsp; <asp:label id=lbCalDisplay runat="server" CssClass="Bbluetitle">시작일을 클릭하세요.</asp:label></TD>
          <td width=10>&nbsp;</TD></TR>
        <tr>
          <td style="HEIGHT: 25px">&nbsp;</TD>
          <td><span style="FONT-SIZE: 9pt" 
            >시작일: <asp:textbox id=BeginTime runat="server" Width="80px" MaxLength="10"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator1 runat="server" ErrorMessage="*" ControlToValidate="BeginTime" Display="Dynamic"></asp:requiredfieldvalidator>~종료일: 
<asp:textbox id=EndTime runat="server" Width="80px" MaxLength="10"></asp:textbox>&nbsp;</SPAN> 
          </TD>
          <td style="HEIGHT: 27px"></TD></TR>
        <tr>
          <td>&nbsp;</TD>
          <td align=center height=50><asp:imagebutton id=ibCalDone runat="server" ImageUrl="../../Admins/zImages/admin_btn_enter.gif" AlternateText="설정완료"></asp:imagebutton>&nbsp; 
<asp:hyperlink id=hlReset runat="server" NavigateUrl="CalendarPeriod.aspx"><img src="../../Admins/zImages/btn_admin_reset.gif" border="0"></asp:hyperlink>&nbsp; 
<asp:hyperlink id=hlClose runat="server" NavigateUrl="javascript:window.close();"><img src="../../Admins/zImages/btn_admin_close.gif" border="0"></asp:hyperlink></TD>
          <td></TD></TR></TABLE></TD></TR></TABLE></FORM>
	</body>
</HTML>
