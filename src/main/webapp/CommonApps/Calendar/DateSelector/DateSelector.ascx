<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DateSelector.ascx.cs" Inherits="KistelSite.CommonApps.Calendar.DateSelector.DateSelector" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<!--LINK href="/CommonApps/Calendar/DateSelector/popcalendar.css" type="text/css" rel="stylesheet">
<script language="javascript" src="/CommonApps/Calendar/DateSelector/popcalendar.js"></script-->
<asp:image id="imgCalendar" runat="server" ImageUrl="/CommonApps/Calendar/DateSelector/Images/btnSelect.gif" ImageAlign="AbsMiddle"
	AlternateText="날짜를 선택하세요."></asp:image>
<asp:image id="imgReset" runat="server" ImageUrl="/CommonApps/Calendar/DateSelector/Images/btnReset.gif" AlternateText="리셋합니다."
	ImageAlign="AbsMiddle"></asp:image>
<asp:label id="lbl_Date" Font-Bold="true" runat="server" Visible="False">Date:</asp:label>
<asp:textbox id="tbDate" runat="server" Columns="10" Visible="False"></asp:textbox>
