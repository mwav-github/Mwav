<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_DefaultFrameset.aspx.cs" Inherits="PARTNER.Adminp_DefaultFrameset" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<meta name="robots" content="noindex,nofollow">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
    <title></title>
</head>
	<frameset rows="130,*,55" cols="*" frameborder="NO" border="10" framespacing="0">
		<frame src="P_TopFrame.aspx" name="topFrame" scrolling="no" noresize marginwidth="0" marginheight="0" id="topFrame">
		<frameset rows="*" cols="160,*" framespacing="0" frameborder="NO" border="0">
			<frame src="P_LeftFrame.aspx" name="leftFrame" scrolling="no" noresize id="leftFrame">
			<frame src="P_BodyFrame.aspx" name="BodyFrame" id="BodyFrame">
		</frameset>
		<frame src="P_BottomFrame.aspx" name="BottomFrame" scrolling="no" noresize marginwidth="0" marginheight="0" id="BottomFrame">
	</frameset>
</html>
