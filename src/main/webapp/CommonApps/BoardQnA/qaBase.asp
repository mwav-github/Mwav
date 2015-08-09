<% ' 이 인클루드를 템플릿 상단데 포함시킨다. %>
<!-- caSetting Start -->
	<!--# include File = "../caSetting.asp" -->
<!-- caSetting  End -->
<base href="<%= Application("SiteURLDir") %>CommonAccessories/BoardQnA/" target="_self">
<script language="JavaScript" src="qa_inc.js"></script>

<%
	'qaMode = qi, qu, qd, qv, vali, li, qav, ai, au, ad, av
	qaMode = Request("qaMode")

	'초기값
	'gotoURL = Request.ServerVariables("PATH_INFO")
	pageName = Request.ServerVariables("PATH_INFO")
	if qaMode = "" then qaMode="qi"
%>


<!--- User 입력 및 수정 폼  ---->
<%
		if qaMode = "qi" or qaMode = "qu" then
%>
<!-- qForm Start -->
	<!--#include File = "qForm.asp" -->
<!-- qForm  End -->
<%
		end if 	'if qaMode = "qi" or qaMode = "qu" then
%>
<!--- User 입력 및 수정 폼 (End) ---->




<!--- User 질문보기  ---->
<%
		if qaMode = "qv" then
%>
<!-- qView Start -->
	<!--#include File = "qView.asp" -->
<!-- qView  End -->
<%
		end if 	'if qaMode = "i" then
%>
<!--- User 질문보기 (End) ---->



<!--- User 인증하기  ---->
<%
		if qaMode = "vali" then
%>
<!-- qaValidate Start -->
	<!--#include File = "qaValidate.asp" -->
<!-- qaValidate  End -->
<%
		end if 	'if qaMode = "i" then
%>
<!--- User 인증하기 (End) ---->




<!------- QnA List ------>
<%
		if qaMode = "li" then
%>
<!-- qaList Start -->
	<!--#include File = "qaList.asp" -->
<!-- qaList  End -->
<%
		end if 	'if qaMode = "i" then
%>
<!--- QnA List (End) ---->




<!------- q/a view ------>
<%
		if qaMode = "qav" then
%>
<!-- qView Start -->
	<!--#include File = "qView.asp" -->
<!-- qView  End -->
<!-- aView Start -->
	<!--#include File = "aView.asp" -->
<!-- aView  End -->
<%
		end if 	'if qaMode = "qav" then
%>
<!--- q/a view (End) ---->



<!--- 관리자 입력 및 수정 폼  ---->
<%
		if qaMode = "ai" or qaMode = "au" then
%>
<!-- aForm Start -->
	<!--#include File = "aForm.asp" -->
<!-- aForm End -->
<%
		end if 	'if qaMode = "ai" or qaMode = "au" then
%>
<!--- 관리자 입력 및 수정 폼 (End) ---->

