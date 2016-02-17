<!-- Header Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- Header End -->
<base href="<%= MainDomain %>/Admin/Staffs/" target="_self">
<!-- Footer Start -->
	<!--#include File="../AdminFooter.asp"-->
<!-- Footer End -->


<%

	Response.Buffer=true
	Response.Expires=0

	Call ClrAllCookies()

	session("Sid") = ""
	session("StaffID") = ""
	session("sName") = ""
	session("class") = ""
	session("deptName") = ""
	session("sEmail") = ""
	Session("sLevel4") = ""
	session("Pnumber") = ""
	session("Presults") = ""

	session.Abandon

		Response.redirect Application("SiteRoot") & "admin/Alogin.asp"
%>