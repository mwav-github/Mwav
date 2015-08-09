<%
	Session.Timeout = 20
	'On Error Resume Next
	'Option Explicit
	Response.Buffer = true
%>
<!-- ShopConfig Start -->
	<!--#include File = "../Config/Config.asp" -->
<!-- ShopConfig End -->

<!-- DB Connection -->
	<!--#include File = "../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->

<!-- Function Start -->
<!--#include File= "../Include_asp/CommonFunctions.asp"-->
<!--#include File= "../Include_asp/Functions.asp"-->
<!--#include File= "../Include_asp/fsShop_inc.asp"-->
<!--#include File= "../Include_asp/fsBoard_inc.asp"-->
<!-- Function End -->
<%
	'프락시 서버 캐싱방지
	'서버에 존재하는 프록시로 부터 페이지를 전혀 캐싱하지 못하게 함.
	Call NoCache()
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<LINK href="<%= Application("SiteURLDir") %>companyLogo.ico" rel="SHORTCUT ICON">