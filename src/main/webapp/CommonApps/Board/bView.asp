<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더
%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->


<%
	'dim page,bNbr,sql,rs,mode,form_pin

	bID = Request.QueryString("bID")
	page = Request.QueryString("page")
	bNbr = Request.QueryString("bNbr")
	mode = Request.QueryString("mode")
	form_pin = Request.Form("form_pin")

	if CInt(Session("sLevel4")) > 1 then
		session("read") = "ok"
	else
		session("read") = ""
	end if

	if mode = "secret" then
		'Response.write CInt(Session("sLevel4")) & "----------" & Session("sID")
		'response.end
		if form_pin = "" then Response.Redirect "pin.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr&"&mode=secret"

		SQL="SELECT secretPW from "&bBodyTable
		SQL = SQL &" Where bNbr=" & bNbr & " And (secretPW='"& form_pin &"')"
		Set rs = dbConn.Execute(SQL)

		if rs.eof or rs.bof then Response.Redirect "inc/error.asp?no=2"
		session("read") = rs(0)
	end if

	if mode = "rcmd" then
		SQL = "Update "&bBodyTable&" set rcmdCount=rcmdCount+1 where bNbr="&bNbr
	else
		SQL = "Update "&bBodyTable&" set viewCount=viewCount+1 where bNbr="&bNbr
	end if

	dbConn.Execute(SQL)

	if Request.QueryString("sw") <> "" then
		Response.Redirect "bContent.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr&"&st="&Request.QueryString("st")&"&sc="&Request.QueryString("sc")&"&sn="&Request.QueryString("sn")&"&sw="&Request.QueryString("sw")
	else
		Response.Redirect "bContent.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr
	end if
%>
