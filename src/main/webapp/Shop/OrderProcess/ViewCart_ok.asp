<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- fsShop_inc Start -->
	<!--#include File= "../../Include_asp/fsShop_inc.asp"-->
<!-- fsShop_inc End -->

<%
	'폼값 테스트
	'For Each item IN Request.Form
	'	Response.Write(item)
	'	Response.Write(" = ")
	'	Response.Write("ReplaceTo(Request(""") & item & """), ""toDB"")"
	'	'Response.Write(Request.Form(item))
	'	Response.Write("<br>")
	'Next
	'쿼리값 테스트
	'For Each item IN Request.QueryString
	'	Response.Write(item)
	'	Response.Write(" = ")
	'	Response.Write("ReplaceTo(Request(""") & item & """), ""toDB"")"
	'	'Response.Write(Request.Form(item))
	'	Response.Write("<br>")
	'Next
	'OrdChange = trim(request("OrdChange.x"))
	'OrdCancel = trim(request("OrdCancel.x"))
	'OrdBuy = trim(request("OrdBuy.x"))

	g = request("g")
	mode = request("mode")
	stockID = request("stockID")
	amount = request("amount")

	'인증
	if mode = "" Or g = "" then Call ShowAlertMsg("당신이 정말 밉다.")

	if mode = "a" then	' Amount Adjusting

		'구입수량 및 재고량 체크
		if amount > 100 then ShowAlertMsg("대량구입은 개별적으로 연락주세요.")
		if stockID <> "" then Call CheckStock(GetCurrStock1(stockID),-amount,"")

		'쇼핑카트 숫자재조정
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			'dbConn.BeginTrans
			'dbConn.CommitTrans
			.ActiveConnection = dbConn
			.CommandType = adCmdText

			SQL = "UPDATE vTempOrder Set amount = ?"
			SQL = SQL & " WHERE tOrderNbr = ? And gCode = ? And stockID = ?"
			SQL = SQL & " And DATEPART(dayofyear , choiceDT) = DATEPART(dayofyear , Getdate())"
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("@amount", adUnsignedTinyInt, adParamInput, 1, amount)
			.Parameters.Append Cmd.CreateParameter("@tOrderNbr", adChar, adParamInput, 10, Request.Cookies("tempOrderID"))
			.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
			.Parameters.Append Cmd.CreateParameter("@stockID", adVarChar, adParamInput, 80, stockID)
			'.Parameters.Append Cmd.CreateParameter("@stockID", adGUID, adParamInput, 72, stockID)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing

	elseif mode = "c" then
		'쇼핑카트 삭제
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			'dbConn.BeginTrans
			'dbConn.CommitTrans
			.ActiveConnection = dbConn
			.CommandType = adCmdText

			SQL = "DELETE FROM vTempOrder "
			SQL = SQL & " WHERE tOrderNbr = ? And gCode = ? And stockID = ?"
			SQL = SQL & " And DATEPART(dayofyear , choiceDT) = DATEPART(dayofyear , Getdate())"
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("tOrderNbr", adChar, adParamInput, 10, Request.Cookies("tempOrderID"))
			.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
			.Parameters.Append Cmd.CreateParameter("@stockID", adVarChar, adParamInput, 80, stockID)
			'.Parameters.Append Cmd.CreateParameter("@stockID", adGUID, adParamInput, 72, stockID)

			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
	elseif mode = "b" then

		arrG = Split(g, ", ")
		arrStockID = Split(stockID, ", ")
		arrAmount = Split(amount, ", ")
		'카트업데이트하고 결제방식으로 진행
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			'dbConn.BeginTrans
			'dbConn.CommitTrans
			.ActiveConnection = dbConn
			.CommandType = adCmdText
			for i = 0 to Ubound(arrG) - 1
				if arrG(i) = "" then Call ShowAlertMsg("당신이 정말 밉다.")
				'구입수량 및 재고량 체크
				if arrAmount(i) > 100 then ShowAlertMsg("대량구입은 개별적으로 연락주세요.")
				info = PickUpValue("vMaster", "gName", "gCode='" & arrG(i) & "'")
				if arrStockID(i) <> "" then Call CheckStock(GetCurrStock1(arrStockID(i)),-arrAmount(i),"* " & info & " *")

				SQL = "UPDATE vTempOrder Set amount = ?"
				SQL = SQL & " WHERE tOrderNbr = ? And gCode = ? And stockID = ?"
				SQL = SQL & " And DATEPART(dayofyear , choiceDT) = DATEPART(dayofyear , Getdate())"
				.CommandText = SQL
				.Parameters.Append Cmd.CreateParameter("@amount", adUnsignedTinyInt, adParamInput, 1, arrAmount(i))
				.Parameters.Append Cmd.CreateParameter("@tOrderNbr", adChar, adParamInput, 10, Request.Cookies("tempOrderID"))
				.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, arrG(i))
				.Parameters.Append Cmd.CreateParameter("@stockID", adVarChar, adParamInput, 80, arrStockID(i))
				'.Parameters.Append Cmd.CreateParameter("@stockID", adGUID, adParamInput, 72, arrStockID(i))
				.Execute ,,adExecuteNoRecords

				'매개변수초기화
				.Parameters.Delete("@amount")
				.Parameters.Delete("@tOrderNbr")
				.Parameters.Delete("@gCode")
				.Parameters.Delete("@stockID")
			next
		end With
		Set Cmd = nothing

		if session("MbrID") <> "" then
			Response.Redirect("OrderProcess.asp?opMode=p" )
		else
			Response.Redirect("../../CommonAccessories/MbrUsers/muLoginDisplay.asp?NMLogin=Y&gtu=" & Application("SiteRoot") & "ShopBody/OrderProcess/OrderProcess.asp?opMode=p" )
		end if
	end if


	Response.Redirect("OrderProcess.asp?opMode=c" )


%>
<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

