<%@ Page language="c#" Codebehind="Sample.aspx.cs" AutoEventWireup="false" Inherits="KistelSite.CommonApps.BoardPR.WebForm1" %>
<%@ Register TagPrefix="uc1" TagName="BoardPR" Src="BoardPR.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>KISTEL - The Key System for The Telecommunication</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<LINK href="../../StyleSheets/Objects.css" type="text/css" rel="stylesheet">
		<LINK href="../../StyleSheets/OverallPage.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"></script>
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<uc1:BoardPR id="BoardPR1" runat="server"></uc1:BoardPR>
		</form>
	</body>
</HTML>
