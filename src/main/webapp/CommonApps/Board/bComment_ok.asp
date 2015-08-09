<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더
%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->

<%

	Dim cmtOrder,bNbr,userName,cmtMemo,userPW,IPaddress,writeday,mode,com_mem_auth,MbrID,po_write,po_comment

	bNbr = request("bNbr")
	page = Request("page")
	mode = Request("mode")
	MbrID = Request.Form("MbrID")

	if mode = "com_del" then
		dim com_sql,com_rs,sql2,com_writeday,form_pin
		cmtOrder = Request.QueryString("cmtOrder")
		form_pin = Request.Form("form_pin")

		SQL="SELECT MbrID,userPW FROM " & bCmtTable
		SQL = SQL & " where bNbr = " & bNbr &" and cmtOrder="& cmtOrder
		Set rs = dbConn.Execute(SQL)
		MbrID = rs("MbrID")
		userPW = rs("userPW")
		CloseRS(rs)

		'회원으로 로그온된 아이디가 같던지, 입력한 암호가 같던지, 어드민권한이 있던지..
		if (Session("MbrID") = MbrID And MbrID <> "") Or (form_pin = userPW) Or (CInt(Session("sLevel4")) > 1) then
			Call DeleteRecord(bCmtTable, "bNbr = " & bNbr & " And cmtOrder = " & cmtOrder)
		else
			Response.Redirect "inc/error.asp?no=2"
		end if
		'페이지이동
		if Request.QueryString("sw") <> "" then
			Response.Redirect "bContent.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr&"&st="&Request.QueryString("st")&"&sc="&Request.QueryString("sc")&"&sn="&Request.QueryString("sn")&"&sw="&Request.QueryString("sw")
		else
			Response.Redirect "bContent.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr
		end if


		'if Session("MbrID") <> "" and Request.QueryString("mem") = "ok" then	'회원인 경우
		'	SQL="SELECT MbrID,userPW FROM " & bCmtTable
		'	SQL = SQL & " where bNbr = " & bNbr &" and cmtOrder="& cmtOrder
		'	Set rs = dbConn.Execute(SQL)
          '
		'	if Session("MbrID") <> rs(0) and session("admin") <> admin_name then Response.Redirect "inc/error.asp?no=4"
		'	form_pin = rs(1)
		'else
		'	form_pin = Request.Form("form_pin")
		'end if

		'com_SQL = "SELECT MbrID FROM " & bCmtTable
		'com_SQL =	com_SQL &	" where bNbr = " & bNbr & " and cmtOrder="& cmtOrder &" and userPW ='" & form_pin & "'"
	    	'Set com_rs = dbConn.Execute(com_SQL)
		'if com_rs.EOF or com_rs.BOF then Response.Redirect "inc/error.asp?no=2"


	else		'if mode = "com_del" then

		MbrID = Request.Form("MbrID")
		if MbrID <> "" then
			'실제값인지 DB인증
			Dim idRS, RSresult
			selectedFields = "MbrID,MbrName,MbrPW"
			whereClause = "MbrID = '" & MbrID & "'"
			'orderBy = "MbrID DESC"
			RSresult = SelectSimpleRecord(idRS, selectedFields, "vMember", whereClause, orderBy)
			if RSresult = "NotEmpty" then
				MbrID = idRS("MbrID")
				userName = idRS("MbrName")
				userPW = idRS("MbrPW")
				CloseRS(idRS)
			else
				Call ShowAlertMsg("아이디에 문제가 있습니다.")
			end if
		else
			userName = trim(Request.Form("userName"))
			userPW = trim(Request.Form("userPW"))
			if userName="" then Call ShowAlertMsg("이름을 입력해 주세요.")
			if userPW="" then Call ShowAlertMsg("비밀번호를 입력해 주세요.")
		end if	'if MbrID <> "" then

		cmtMemo = trim(Request.Form("cmtMemo"))
		if cmtMemo="" then Call ShowAlertMsg("내용을 입력해 주세요.")


%>

<script LANGUAGE="VBScript" RUNAT="Server">
	Function CheckWord(CheckValue)
		CheckValue = replace(CheckValue, "&" , "&amp;")
		CheckValue = replace(CheckValue, "<", "&lt;")
		CheckValue = replace(CheckValue, ">", "&gt;")
		CheckValue = replace(CheckValue, "'", "''")
		CheckWord=CheckValue
	End Function
</script>

<%
	'SQL="SELECT MAX(cmtOrder) FROM bCmtTable where bNbr=" & bNbr
	'Set rs = dbConn.Execute(SQL)
	'if IsNULL(rs(0)) then
	'	cmtOrder = 1
	'else
	'	cmtOrder = rs(0)+1
	'end if
	'rs.close
	'Set rs = nothing

	cmtOrder = NextNumber(bCmtTable, "cmtOrder", "bNbr=" & bNbr, 0)
	IPaddress = request.ServerVariables("REMOTE_HOST")

	'커멘트입력
	SQL = "INSERT INTO " & bCmtTable
	SQL = SQL & "(bNbr,cmtOrder,MbrID,userName,userPW,cmtMemo,cmtWriteDT,IPaddress) VALUES "
	SQL = SQL & "(" & bNbr
	SQL = SQL & "," & cmtOrder
	SQL = SQL & ",'" & MbrID & "'"
	SQL = SQL & ",'" & userName & "'"
	SQL = SQL & ",'" & userPW & "'"
	SQL = SQL & ",'" & cmtMemo & "'"
	SQL = SQL & ",GetDate()"
	SQL = SQL & ",'" & IPaddress & "')"
	dbConn.Execute SQL


	'포인트주기
	if Session("MbrID") <> "" then
		'SQL = "Update member set po_comment=po_comment+1,point=point+5 where id='"&Session("MbrID")&"'"
		'db.execute SQL
	end if


	if Request.Form("sw") <> "" then
		Response.Redirect "bContent.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr&"&st="&Request.Form("st")&"&sc="&Request.Form("sc")&"&sn="&Request.Form("sn")&"&sw="&Request.Form("sw")
	else
		Response.Redirect "bContent.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr
	end if
%>

<% end if  	'if mode = "com_del" then %>

