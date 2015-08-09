<!-- caSetting Start -->
	<!--#include File = "../caSetting.asp" -->
<!-- caSetting  End -->
<%
	qaMode = Request.Form("qaMode")
	gotoURL = Request("gotoURL")
	
	if qaMode = "nmLogin" then
	
		userEmail = trim(Request.Form("userEmail"))
		userPW = trim(Request.Form("userPW"))
		
		if Len(userEmail) < 3 Or Len(userPW) < 1 then Call ShowAlertMsg("메일주소와 패스워드를 확인하세요")
			
		if PickUpValue("vQuestion", "QAidx", "userEmail = '" & userEmail & "' And userPW='" & userPW & "'") = "NoPickUp" then 
			Call ShowAlertMsg("문의한 내용이 없습니다.")
		end if
		''''''''''''''''''''''''''''''''''''''''성공'''''''''''''''''''''''''''''''''''''
		Session("userEmail") = userEmail
		Session("userPW") = userPW
		gotoURL	= gotoURL & "?qaMode=li"

	else
		Session("userEmail") = ""
		Session("userPW") = ""
		gotoURL	= gotoURL & "?qaMode=vali"
	end if	'if qaMode = "nmLogin" then

		'어디로 보낼것인가?
		Response.Redirect(gotoURL)
	
%>

<% 
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp") 
	Call CloseDB()
%>

