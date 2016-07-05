<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- fsShop_inc Start -->
	<!--#include File= "../../Include_asp/fsShop_inc.asp"-->
<!-- fsShop_inc End -->

<%
	'직접구매를 클릭한 상품이 넘어 온다.
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

Response.write "aaaaaaaaaaaaaaaa"
	'vPopularity의 clicksFigure수 1증가. --> 장바구니, 바로구매 모두해당.
	PopGoods = gPopularity(g, "choiceFigure")


	'p -> f -> d ; 바로 구입을 선택한 경우
	if session("MbrID") <> "" then
		Response.Redirect("OrderProcess.asp?opMode=p&c=" & c & "&g=" & g & "&amount=" & amount & "&gSize=" & gSize & "&gColor=" & gColor)
	else
		Response.Redirect("../../CommonAccessories/MbrUsers/muLoginDisplay.asp?NMLogin=Y&gtu=" & Server.URLEncode(Application("SiteRoot") & "ShopBody/OrderProcess/OrderProcess.asp?opMode=p&c=" & c & "&g=" & g & "&amount=" & amount))
	end if


	'Call GotoThePage(gName & "을(를) 쇼핑카트에 " & amount & "개 넣었습니다.", "../GoodsDetailBody.asp?c=" & c & "&g=" & g)
%>

<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

