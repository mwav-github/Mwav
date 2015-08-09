<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더
%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->

<%
Set objMail = Server.CreateObject("CDONTS.NewMail")

dim page,num,sw,st,sc,sn,name,email,toemail,subject,mailbody

bID = Request.Form("bID")
page = request.Form("page")
num = request.Form("num")
sw = request.Form("sw")
st = request.Form("st")
sc = request.Form("sc")
sn = request.Form("sn")

email = Request.Form("email")
toemail = Request.Form("toemail")
subject = Request("title")
mailBody = Request.Form("content")

objMail.Value("From") = email
objMail.To = toemail
objMail.Subject = subject

objMail.Body = mailBody
objMail.Send()
Set objMail = Nothing
%>
<html>
<head>
<title><%=bTitleName%></title>

<LINK rel="stylesheet" type="text/css" href="IncTemplates/style.css">
</head>
<body bgcolor="<%=bgcolor%>" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<%=bTop%>

<table width="300" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	</table>
	</td>
</tr>
<tr>
	<td style="word-break:break-all;padding:10px;" align="center" bgcolor="#eeeeee">메일이 발송 되었습니다.</td>
</tr>
<tr>
	<td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	</table>
	</td>
</tr>
</table>
<table width="300" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td align="right" style="word-break:break-all;padding:5px;"><a href="<%=Request.Form("url")%>.asp?bID=<%=bID%>&page=<%=page%><% if num<>"" then %>&num=<%=num%><% end if %><% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>"><img src="../img/but_ok.gif" border="0"></a></td>
</tr>
</table>

<%= bBottom %>
</body>
</html>


