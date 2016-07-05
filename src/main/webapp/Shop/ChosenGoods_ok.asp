<!-- ShopSetting Start -->
	<!--#include File = "../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- fsShop_inc Start -->
	<!--#include File = "../Include_asp/fsShop_inc.asp" -->
<!-- fsShop_inc End -->

<%
	'상품코드
	c = Request.QueryString("c")
	g = Request.QueryString("g")
	'c,g 값이 안넘어 오면
	if c = "" or g = "" then
		Call GotoThePage("비정상적인 접속입니다!!", UrlRootDir)
	end if
	'메인카테고리에 상품이름이 존재하지 않으면 에러
	gName = PickUpValue("vGoodsList_c", "gName", "gCode = '" & g & "'")
	if gName = "NoPickUp" then
		Call GotoThePage("해당 메인카테고리가 존재하지 않습니다!!", UrlRootDir)
	end if

	if Session("MbrID") <> "" then 		'로그인되어 있으면
		'vPopularity의 clicksFigure수 1증가.
		PopGoods = gPopularity(g, "choiceFigure")

		'5개 이상이면 더이상 추가안됨.
		SQL = "SELECT COUNT(gCode) AS Cnt FROM vChosenGoods "
		SQL = SQL & " Where MbrID = '" & Session("MbrID") & "'"
		RSresult = OpenSimpleRS(rsCnt, SQL)
		if RSresult <> "Empty" then
			if rsCnt(0) > 5 then
				Call CloseRS(rsCnt)
				Call GotoThePage("5개까지만 상품을 장기보관하실 수 있습니다.", "GoodsDetailBody.asp?c=" & c & "&g=" & g)
			end if
		end if
		''''''''''''''''''''''''End''''''''''''''''''''''''


		'찜한 상품 DB입력
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			dbConn.BeginTrans
			.ActiveConnection = dbConn
			.CommandType = adCmdText

			SQL = "DELETE FROM vChosenGoods"
			SQL = SQL & " WHERE MbrID = ? and gCode = ?"
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, Session("MbrID"))
			.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
			.Execute ,,adExecuteNoRecords
			.Parameters.Delete("@MbrID")
			.Parameters.Delete("@gCode")

			SQL = "INSERT INTO vChosenGoods(MbrID,cCode,gCode)"
			SQL = SQL & " VALUES(?,?,?)"
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, Session("MbrID"))
			.Parameters.Append Cmd.CreateParameter("@cCode", adUnsignedTinyInt, adParamInput, 1, c)
			.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, g)
			.Execute ,,adExecuteNoRecords
			dbConn.CommitTrans

		end With
		Set Cmd = nothing
		Call GotoThePage(gName & "을(를) 찜하셨습니다.", "GoodsDetailBody.asp?c=" & c & "&g=" & g)
	else

		tempURL = "../CommonAccessories/MbrUsers/muLoginDisplay.asp?gtu="
		tempURL = tempURL & Application("SiteRoot") & "ShopBody/ChosenGoods_ok.asp?c=" & c & "%26g=" & g
		Response.Redirect(tempURL)	'Server.URLEncode(
	end if
%>


<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

