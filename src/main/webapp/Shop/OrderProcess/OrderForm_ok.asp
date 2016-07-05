<%@ TRANSACTION="Required" LANGUAGE="VBScript" CODEPAGE="949" %>
<!-- shopConfig Start -->
	<!--#include File = "../../Config/Config.asp" -->
<!-- shopConfig End -->
<!-- DB Connection -->
	<!--#include File = "../../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->
<!-- Function Start -->
	<!--#include File= "../../Include_asp/CommonFunctions.asp"-->
	<!--#include File="../../Include_asp/Functions.asp"-->
<!-- Function End -->
<!-- fsShop_inc Start -->
	<!--#include File= "../../Include_asp/fsShop_inc.asp"-->
<!-- fsShop_inc End -->
<%
	'회원, 비회원 재확인.
	NMLoggedin = Request("NMLoggedin")
	if (session("MbrID") = "" and NMLoggedin <> "Y") Or (session("MbrID") <> "" and NMLoggedin = "Y") then
		Call GotoThePage("장시간 주문상태로 유지하면 위험합나다. 안전을 위해 로그아웃합니다.\n재주문하세요. ", Application("SiteURLDir") & "CommonAccessories/MbrUsers/muExit.asp")
	end if

	'적당히 값을 DB에 맞게 수정하여 변수에 대입한다.
	cName = ReplaceTo(Request("cName"), "toDB")
	MbrID = Request("MbrID")
	cTEL1 = ReplaceTo(Request("cTEL1"), "toDB")
	cTEL2 = ReplaceTo(Request("cTEL2"), "toDB")
	cTEL3 = ReplaceTo(Request("cTEL3"), "toDB")
	cMTEL1 = ReplaceTo(Request("cMTEL1"), "toDB")
	cMTEL2 = ReplaceTo(Request("cMTEL2"), "toDB")
	cMTEL3 = ReplaceTo(Request("cMTEL3"), "toDB")
	cEmail = ReplaceTo(Request("cEmail"), "toDB")
	cAddrZip = ReplaceTo(Request("cAddrZip"), "toDB")
	cAddrCity = ReplaceTo(Request("cAddrCity"), "toDB")
	cAddrStt = ReplaceTo(Request("cAddrStt"), "toDB")
	''
	rAddrZip = ReplaceTo(Request("rAddrZip"), "toDB")
	rAddrCity = ReplaceTo(Request("rAddrCity"), "toDB")
	rAddrStt = ReplaceTo(Request("rAddrStt"), "toDB")
	rName = ReplaceTo(Request("rName"), "toDB")
	rTEL1 = ReplaceTo(Request("rTEL1"), "toDB")
	rTEL2 = ReplaceTo(Request("rTEL2"), "toDB")
	rTEL3 = ReplaceTo(Request("rTEL3"), "toDB")
	rMTEL1 = ReplaceTo(Request("rMTEL1"), "toDB")
	rMTEL2 = ReplaceTo(Request("rMTEL2"), "toDB")
	rMTEL3 = ReplaceTo(Request("rMTEL3"), "toDB")
	note = ReplaceTo(Request("note"), "toDB")

	'변수 재매핑
	cPhone = cTEL1 & "-" & cTEL2 & "-" & cTEL3
	cCellularP = cMTEL1 & "-" & cMTEL2 & "-" & cMTEL3
	rPhone = rTEL1 & "-" & rTEL2 & "-" & rTEL3
	rCellularP = rMTEL1 & "-" & rMTEL2 & "-" & rMTEL3
	cbNbr = Null	'공동구매코드

	'howToPay 설정
	bankInfo = Request("bankInfo")
	if bankInfo <> "" then
		onlinePayer = ReplaceTo(Request("onlinePayer"), "toDB")
		if onlinePayer = "" then Call ShowAlertMsg("입금자명을 입력하세요.")
		howToPay = "무통장입금"
		payInfoDetail = onlinePayer & "-" & bankInfo
		orderStatus = "입금확인중"
		comment = "입금이 확인되면 바로 배송하겠습니다."
	else
		howToPay = "신용카드"
		orderStatus = "주문접수"
		comment = "상품배송 준비중입니다."
	end if

	'배송료 정하기 (30000원 이상 구입시 배송료 3500원 지원, 차후 XML로 만들것)
	deliCharge = Request("deliCharge")
	if CLng(deliCharge) = 0 then
		supportCost = 3500
	else
		'deliCharge = 3500
		supportCost = 0
	end if

	'주문번호만들기
	orderNbr = NextOrderNbr()

	'vOrderInfo 입력
	SQL = "INSERT INTO vOrderInfo(orderNbr,note,howToPay,payInfoDetail,deliCharge,supportCost) VALUES"
	SQL = SQL &"('" & orderNbr & "'"
	SQL = SQL &",'" & note & "'"
	SQL = SQL &",'" & howToPay & "'"
	SQL = SQL &",'" & payInfoDetail & "'"
	SQL = SQL &"," & deliCharge
	SQL = SQL &"," & supportCost & ")"
	dbConn.Execute SQL
'Call ShowMeTheValues(orderNbr)

	''
	cCode = Request("cCode")
	gCode = Request("gCode")
	gSize = Request("gSize")
	gColor = Request("gColor")
	amount = Trim(Request("amount"))

	if cCode <> "" And gCode <> "" And amount <> "" Then  	'직접구매선택시
		stockID = GetStockID(gCode,gSize,gColor)
		'재고 체크 및 재고변화량 반영
		Call TakeStock(stockID,gCode,gSize,gColor,"판매",-CInt(amount))
		dSQL = "INSERT INTO vCurrentOrder(orderNbr,subNbr,gCode,gMnum,gName,stockID,amount,gPrice,gClass,cbNbr,reserveFund) "
		dSQL = dSQL & "SELECT '" & orderNbr & "',1,gCode,gMnum,gName,'" & stockID & "'," & amount
		if Request.Cookies("MbrID") <> "" then
			dSQL = dSQL & ",SMprice as gPrice"
		else
			dSQL = dSQL & ",Sprice as gPrice"
		end if
		dSQL = dSQL & ",'" & GoodsClass(gCode) & "'"
		if IsNull(cbNbr) then
			dSQL = dSQL & ",Null,reserveFund FROM vGoodsList_c "
		else
			dSQL = dSQL & "," & cbNbr & ",reserveFund FROM vGoodsList_c "
		end if
		dSQL = dSQL & " WHERE cCode = " & cCode
		dSQL = dSQL & " And gCode = '" & gCode & "'"
		dbConn.Execute dSQL

	else 	'쇼핑카트를 통해서 구입시
		SQL = "SELECT gCode,gMnum,gName,stockID,amount"
		if Request.Cookies("MbrID") <> "" then
			SQL = SQL & ",SMprice as gPrice"
		else
			SQL = SQL & ",Sprice as gPrice"
		end if
		SQL = SQL &  ",reserveFund FROM vCart "
		SQL = SQL & " WHERE tOrderNbr = '" & Request.Cookies("tempOrderID") & "'"
		SQL = SQL & " Order by choiceDT"
'Call ShowMeTheValues("하하하=" & SQL)
		RSresult = OpenSimpleRS(rsCart, SQL)
		if RSresult <> "Empty" then
			subNbr = 1
			Do until rsCart.EOF
				'orderNbr = orderNbr
				'subNbr = subNbr
				gCode = rsCart("gCode")
				gMnum = rsCart("gMnum")
				gName = rsCart("gName")
				stockID = rsCart("stockID")
				amount = rsCart("amount")
				gPrice = rsCart("gPrice")
				gClass = GoodsClass(gCode)
				if cbNbr = "" then  cbNbr = Null
				reserveFund = trim(rsCart("reserveFund"))

				'재고 체크 및 재고변화량 반영
				Call TakeStock(stockID,gCode,gSize,gColor,"판매",-CInt(amount))

			'vCurrentOrder에 개개 구입희망 상품입력
			SQL = "INSERT INTO vCurrentOrder(orderNbr,subNbr,gCode,gMnum,gName,stockID,amount,gPrice,gClass,cbNbr,reserveFund) VALUES"
			SQL = SQL &"('" & orderNbr & "'"
			SQL = SQL &"," & subNbr
			SQL = SQL &",'" & gCode & "'"
			SQL = SQL &",'" & gMnum & "'"
			SQL = SQL &",'" & gName & "'"
			if stockID <> "" then
				SQL = SQL &",'" & stockID & "'"
			else
				SQL = SQL &",NULL"
			end if
			SQL = SQL &"," & amount
			SQL = SQL &"," & gPrice
			SQL = SQL &",'" & gClass & "'"
			SQL = SQL &",'" & cbNbr & "'"
			SQL = SQL &"," & reserveFund & ")"
			dbConn.Execute SQL

				rsCart.MoveNext
				subNbr = subNbr +1
			loop
			Call CloseRS(rsCart)
		else
			Response.Redirect(Application("SiteURLDir"))
		end if

		'쇼핑카드를 이용한 경우 쇼핑카드 삭제
		Call DeleteRecord("vTempOrder", "tOrderNbr = '" & Request.Cookies("tempOrderID") & "'")

	end if		'if cCode <> "" And gCode <> "" And amount <> "" Then  	'직접구매선택시

	'vClientServices 입력
	SQL = "INSERT INTO vClientServices(orderNbr,orderStatus,comment,stat_Key) VALUES"
	SQL = SQL &"('" & orderNbr & "'"
	SQL = SQL &",'" & orderStatus & "'"
	SQL = SQL &",'" & comment & "'"
	SQL = SQL &"," & Request.Cookies("stat_Key") & ")"
	dbConn.Execute SQL

	'주문자정보입력
	SQL = "INSERT INTO vClients(orderNbr,MbrID,cName,cPhone,cCellularP,cEmail,cAddrZip,cAddrCity,cAddrStt) VALUES"
	SQL = SQL &"('" & orderNbr & "'"
	SQL = SQL &",'" & Request.Cookies("MbrID") & "'"
	SQL = SQL &",'" & cName & "'"
	SQL = SQL &",'" & cPhone & "'"
	SQL = SQL &",'" & cCellularP & "'"
	SQL = SQL &",'" & cEmail & "'"
	SQL = SQL &",'" & cAddrZip & "'"
	SQL = SQL &",'" & cAddrCity & "'"
	SQL = SQL &",'" & cAddrStt & "')"
	dbConn.Execute SQL

	'배송지정보입력
	SQL = "INSERT INTO vRecipients(orderNbr,rName,rPhone,rCellularP,rAddrZip,rAddrCity,rAddrStt) VALUES"
	SQL = SQL &"('" & orderNbr & "'"
	SQL = SQL &",'" & rName & "'"
	SQL = SQL &",'" & rPhone & "'"
	SQL = SQL &",'" & rCellularP & "'"
	SQL = SQL &",'" & rAddrZip & "'"
	SQL = SQL &",'" & rAddrCity & "'"
	SQL = SQL &",'" & rAddrStt & "')"
	dbConn.Execute SQL


	'페이지이동
	Response.Redirect("OrderProcess.asp?opMode=d&orderNbr=" & orderNbr)


''''''''''''''''''''''''''''''''''''''''''''
'주문번호 시리얼 생성
Function NextOrderNbr()
	orderNbrTemp = Replace(Date(),"-","")
	if Hour(Now()) < 10 then
		orderNbrTemp = orderNbrTemp & "0" & Hour(Now()) & "-"
	else
		orderNbrTemp = orderNbrTemp & Hour(Now()) & "-"
	end if

	nosn = NextNumber("vCounters", "ordSerialNbr", "", 1000000)
	if nosn = 1000000 then '첫번호 부여
		Set Cmd = Server.CreateObject("ADODB.Command")
		With Cmd
			'dbConn.BeginTrans
			'dbConn.CommitTrans
			.ActiveConnection = dbConn
			.CommandType = adCmdText

		SQL = "INSERT INTO vCounters(ordSerialNbr) Values(?) "
			.CommandText = SQL
			.Parameters.Append Cmd.CreateParameter("ordSerialNbr", adUnsignedInt, adParamInput, 2, 1000000)
			.Execute ,,adExecuteNoRecords
		end With
		Set Cmd = nothing
	elseif nosn= 10000000 then '번호가 끝까지 돌았어용.......
		nosn = 1000000
	end if
	'다음 nosn로 업데이트
	SQL = "UPDATE [vCounters] SET ordSerialNbr = " & nosn
	dbConn.Execute SQL

	NextOrderNbr = orderNbrTemp & nosn
End Function

Function GoodsClass(gCode)
'vGoodsClass 및 인기상품 확인
	gc=""
	SQL = "SELECT gSpecial,gBest,gReCMD FROM vGoodsClass "
	SQL = SQL & " WHERE gCode = '" & gCode & "'"
	RSresult = OpenSimpleRS(rsGC, SQL)
	if RSresult <> "Empty" then
		gSpecial = Trim(rsGC("gSpecial"))
		gBest = Trim(rsGC("gBest"))
		gReCMD = Trim(rsGC("gReCMD"))
		if gSpecial = "Y" And gBest = "Y" And gReCMD = "Y"  then
			gc = "스페셜:기획:추천"
		elseif gSpecial = "Y" And gBest = "Y" then
			gc = "스페셜:기획"
		elseif gSpecial = "Y" And gReCMD = "Y"  then
			gc = "스페셜:추천"
		elseif gSpecial = "Y" then
			gc = "스페셜"
		elseif gBest = "Y" And gReCMD = "Y"  then
			gc = "기획:추천"
		elseif gBest = "Y" then
			gc = "기획"
		elseif gReCMD = "Y" then
			gc = "추천"
		end if
	end if
	'vPopularity의 clicksFigure수 1증가.
	PopGoods = gPopularity(gCode, "salesFigure")
	if gc <> "" then gc = gc & ":"
	if PopGoods = "Y" then gc = gc & "인기"
	GoodsClass = gc
End Function
%>


<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

<%
    ' The Transacted Script Commit Handler.  This sub-routine
    ' will be called if the transacted script commits.
    Sub OnTransactionCommit()
		Response.Write "<P><B>업데이트가 성공적으로 이루어졌습니다</B>."
    End Sub


    ' The Transacted Script Abort Handler.  This sub-routine
    ' will be called if the script transacted aborts
    Sub OnTransactionAbort()
    	'Call goMsgPage("DBerr")
		'Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>