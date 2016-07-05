<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- fsShop_inc Start -->
	<!--#include File= "../../Include_asp/fsShop_inc.asp"-->
<!-- fsShop_inc End -->

<%
	'상품코드
	c = Request.Form("c")
	g = Request.Form("g")
	gSize = Request.Form("gSize")
	gColor = Request.Form("gColor")
	amount = Request.Form("amount")

	'쿠키를 사용해야 세션이 끝겨도 이용가능하다.
	if Request.Cookies("tempOrderID") = "" then
		Response.Cookies("tempOrderID") = Session.SessionID
	end if


	'c,g 값이 안넘어 오면
	if c = "" or g = "" or Not IsNumeric(amount) then
		Call GotoThePage("비정상적인 접속입니다!!", Application("SiteURLDir"))
	end if
	'메인카테고리에 상품이름이 존재하지 않으면 에러
	gName = PickUpValue("vGoodsList_c", "gName", "gCode = '" & g & "'")
	if gName = "NoPickUp" then
		Call GotoThePage("해당 메인카테고리가 존재하지 않습니다!!", Application("SiteURLDir"))
	end if

	if Right(g,1) <> "S" then
		'gSize,gColor를 이용하여 재고량을 파악한다. 재고량이 0 이하이면 구입할수 없다.
		Call CheckStock(GetCurrStock(g,gSize,gColor),-amount,"")
	end if

	'20개 이상이면 더이상 추가안됨.
	SQL = "SELECT COUNT(*) AS Cnt FROM vTempOrder "
	SQL = SQL & " Where tOrderNbr = '" & Request.Cookies("tempOrderID") & "'"
	SQL = SQL & " GROUP BY tOrderNbr, DATEPART(dayofyear , choiceDT) "
	RSresult = OpenSimpleRS(rsCnt, SQL)
	if RSresult <> "Empty" then
		if rsCnt(0) > 20 then
			Call CloseRS(rsCnt)
			Call GotoThePage("20개까지만 상품을 쇼핑카트에 보관하실 수 있습니다.", "GoodsDetailBody.asp?c=" & c & "&g=" & g)
		end if
	end if


	'장바구니에  상품 DB입력
	Set Cmd = Server.CreateObject("ADODB.Command")
	With Cmd
		'dbConn.BeginTrans
		.ActiveConnection = dbConn
		.CommandType = adCmdText
	'상품프로퍼티로 stockID구하기
	whereClause = "tOrderNbr ='" & Request.Cookies("tempOrderID") & "' And cCode =" & c & " And gCode ='" & g & "'"
	whereClause = whereClause & " And stockID ='" & GetStockID(g,gSize,gColor) & "'"
	whereClause = whereClause & " And DATEPART(dayofyear , choiceDT) = DATEPART(dayofyear , Getdate())"
	tOrderNbr = PickUpValue("vTempOrder", "tOrderNbr", whereClause)

	if tOrderNbr = "NoPickUp" then
		stat_Key = Request.Cookies("stat_Key")
		if stat_Key = "" then stat_Key = "NULL"
		sqlTorder = "INSERT INTO vTempOrder(tOrderNbr,cCode,gCode,stockID,amount,stat_Key)"
		sqlTorder = sqlTorder & " VALUES(?,?,?,?,?," & stat_Key & ")"
		.CommandText = sqlTorder
		.Parameters.Append Cmd.CreateParameter("@tOrderNbr", adChar, adParamInput, 10, Request.Cookies("tempOrderID"))
		.Parameters.Append Cmd.CreateParameter("@cCode", adUnsignedTinyInt, adParamInput, 1, c)
		.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
		.Parameters.Append Cmd.CreateParameter("@stockID", adVarChar, adParamInput, 50, GetStockID(g,gSize,gColor))
		.Parameters.Append Cmd.CreateParameter("@amount", adUnsignedTinyInt, adParamInput, 1, amount)
		.Execute ,,adExecuteNoRecords
		'dbConn.CommitTrans
	else
		sqlTorder = "UPDATE vTempOrder Set amount = amount + ?"
		sqlTorder = sqlTorder & " WHERE tOrderNbr = ? And cCode=? And gCode = ? And DATEPART(dayofyear , choiceDT) = DATEPART(dayofyear , Getdate())"
		.CommandText = sqlTorder
		.Parameters.Append Cmd.CreateParameter("@amount", adUnsignedTinyInt, adParamInput, 1, amount)
		.Parameters.Append Cmd.CreateParameter("@tOrderNbr", adChar, adParamInput, 10, Request.Cookies("tempOrderID"))
		.Parameters.Append Cmd.CreateParameter("@cCode", adUnsignedTinyInt, adParamInput, 1, c)
		.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
		.Execute ,,adExecuteNoRecords
	end if

	end With
	Set Cmd = nothing

'Response.write sql
'Response.end

	'c -> p -> f -> d
	Response.Redirect("OrderProcess.asp?opMode=c")

	'Call GotoThePage(gName & "을(를) 쇼핑카트에 " & amount & "개 넣었습니다.", "../GoodsDetailBody.asp?c=" & c & "&g=" & g)
%>

<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

