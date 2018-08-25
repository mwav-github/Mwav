<HTML>
<HEAD>
<meta name="description" content="We specialize in building dynamic web sites including shopping carts for online sales, custom graphics, and databases.">
<meta name="keywords" content="Austin, Web Design, Database Design, Programming, Real Estate, Automobiles, E-Commerce">
<TITLE>SeaSoft Web & Database Design</TITLE>
<% sPageName="Stats" %>
<!-- #INCLUDE FILE="shared_log_pageHit.inc" -->
<!-- #include file="shared_checkBrowser.inc" -->
<%
sAppName=left(sAppName,1)
sAppVer=left(Cstr(sAppVer),4)
width=request.querystring("width")
session("width")=width
if width=640 then
	ColWidth=150
else
	ColWidth=145
end if

'session("width")=width
%>
</HEAD>

<%
if (sAppName="I" and sAppVer>3.9) then 
%>
	<FRAMESET COLS="<%=ColWidth%>,*" BORDER="0">
	<FRAME NAME="nav" SRC="statsnav.asp" SCROLLING="AUTO" FRAMEBORDER=0 BORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0 BORDERCOLOR="#000000">
	<FRAME NAME="display" SRC="statshome.asp" SCROLLING="AUTO" FRAMEBORDER=0 BORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0 BORDERCOLOR="#000000">
	</FRAMESET>

<% else %>

	<% if sAppName="N" or sAppName="D" then %>
		<FRAMESET COLS="<%=ColWidth%>,*" BORDER="0">
		<FRAME NAME="nav" SRC="statsnav.asp" SCROLLING="AUTO" BORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0 BORDERCOLOR="#000000">
		<FRAME NAME="display" SRC="statshome.asp" SCROLLING="AUTO" BORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0 BORDERCOLOR="#000000">
		</FRAMESET>
	<% else %>
		<FRAMESET COLS="<%=ColWidth%>,*">
		<FRAME NAME="nav" SRC="statsnav.asp" SCROLLING="AUTO" FRAMEBORDER=0 BORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0 BORDERCOLOR="#000000">
		<FRAME NAME="display" SRC="statshome.asp" SCROLLING="AUTO" FRAMEBORDER=0 BORDER=0 MARGINHEIGHT=0 MARGINWIDTH="0" BORDERCOLOR="#000000">
		</FRAMESET>
	<% end if %>

<% end if %>
</HTML>