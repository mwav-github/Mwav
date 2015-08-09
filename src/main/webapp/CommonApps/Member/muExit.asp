<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<%
	Response.Buffer=true
	Response.Expires=0

	'쇼핑카트관련자료 삭제 
	if Request.Cookies("tempOrderID") <> "" then
		Call DeleteRecord("vTempOrder", "tOrderNbr = '" & Request.Cookies("tempOrderID") & "'")
	end if
	
	if session("MbrID") <> "" then 
		Call ClrAllCookies()
		session("MbrID") = ""
		session("MbrName") = ""
		session("MbrEmail") = ""
		session("levelLabel") = ""
		session("joinDT") = ""
		session("recentLogin") = ""
	end if
	session.Abandon

	Response.Cookies("tempOrderID").expires = date-1
	Response.Cookies("MbrID").expires = date-1
	
	'메인페이지로 이동
	Response.redirect("muLogoutDisplay.asp") 
%>

<% 
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp") 
	Call CloseDB()
%>
