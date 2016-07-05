<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<% if opMode = "p" then %>
<script language="JavaScript" type="text/JavaScript">
<!--
function checkOrder() {
	var frm = document.frmPay;
	var inPT = 0;
	var i = 0;
	for(i=0; i<frm.howToPay.length; i++)
	{
		if(frm.howToPay[i].checked)
		{
			inPT = parseInt(frm.howToPay[i].value);
			break;
		}
	}

	if(i==frm.howToPay.length)
	{
		alert("결제방식을 선택해 주십시요.");
		return false;
	}
}
//alert("<%= Request("g") %>")
-->
</script>


<%
	'회원, 비회원 재확인.
	NMLoggedin = trim(request("NMLoggedin"))
	if (session("MbrID") = "" and NMLoggedin <> "Y") Or (session("MbrID") <> "" and NMLoggedin = "Y") then
		Call GotoThePage("장시간 주문상태로 유지하면 위험합나다. 안전을 위해 로그아웃합니다.\n재주문하세요. ", Application("SiteURLDir") & "CommonAccessories/MbrUsers/muExit.asp")
	end if
	
		cCode = Request.QueryString("c")
		gCode = Request.QueryString("g")
		gSize = Request.QueryString("gSize")
		gColor = Request.QueryString("gColor")	
		amount = Request.QueryString("amount")
		if cCode <> "" And gCode <> "" And amount <> "" Then directBuy = "Y"	'직접구매선택시		
%>
<form name="frmPay" action="OrderProcess.asp?opMode=f" method="post">
<input name="cCode" type="hidden" id="cCode" value="<%= cCode %>">
<input name="gCode" type="hidden" id="gCode" value="<%= gCode %>">
<input name="gSize" type="hidden" id="gSize" value="<%= gSize %>">
<input name="gColor" type="hidden" id="gColor" value="<%= gColor %>">
<input name="amount" type="hidden" id="amount" value="<%= amount %>">
<input name="NMLoggedin" type="hidden" id="NMLoggedin" value="<%= NMLoggedin %>">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <TABLE cellSpacing=0 cellPadding=5 width=750 border=0>
          <TR>
       <TD width="130" ><IMG height=28 src="Images/icoHowToPay_items.gif" width=116>
        </TD>
        <TD>
        </TD>
     </TR>
    </TABLE></td>
  </tr>
  <tr>
    <td>
<%

	'쇼핑카트에 있는 내용가져오기
	if directBuy = "Y" Then  	'직접구매선택시
		SQL = "SELECT cCode,gCode,gMnum,gName,gGname,"
		if session("MbrID") <> "" then
			SQL = SQL & "SMprice as gPrice"
		else			
			SQL = SQL & "Sprice as gPrice"
		end if
		SQL = SQL & ",reserveFund," & amount & " as amount FROM vGoodsList_c "
		SQL = SQL & " WHERE cCode = " & cCode
		SQL = SQL & " And gCode = '" & gCode & "'"

	else 	'쇼핑카트를 통해서 구입시
		SQL = "SELECT cCode,gCode,gMnum,gName,gGname,"
		if session("MbrID") <> "" then
			SQL = SQL & "SMprice as gPrice"
		else			
			SQL = SQL & "Sprice as gPrice"
		end if
		SQL = SQL & ",reserveFund,stockID,amount FROM vCart "
		SQL = SQL & " WHERE tOrderNbr = '" & Request.Cookies("tempOrderID") & "'"
		SQL = SQL & " Order by choiceDT"
	end if
	RSresult = OpenSimpleRS(rsCart, SQL)

	if RSresult <> "Empty" then
		'recordcnt = rsCart.RecordCount
		'페이지
		'totalpage = rs.pagecount
		'rs.absolutepage = page
		'GetString로 받아냄
		'AllRec = rsCart.GetString(2, rsCart.PageSize) 	'(adClipString=2, RS.PageSize)
		'rows = split(AllRec,chr(13))
%>
<TABLE cellSpacing=0 cellPadding=1 width=750 align="center" bgColor=#dfdfdf border=0>
 <TR>
  <TD>
	<TABLE width="100%" align="center" cellSpacing=0 cellPadding=0 border=0>
           <TR align="center" bgColor=#f2f2f2>
		  <TD height=30>순번</TD>
		  <TD>모델명</TD>
		  <TD>상품명</TD>
		  <TD>크기</TD>
		  <TD>색상</TD>
		  <TD> 수량</TD>
		  <TD>
		  <% if session("MbrID") <> "" then %>판매회원가<% else %>판매일반가<% end if %>
		  </TD>		  
		  <TD>
		  <% if session("MbrID") <> "" then %>소계회원가<% else %>소계일반가<% end if %>
		  </TD>
          <TD> 적립금</TD>
		  </TR>
                <%
		i = 1
		Do until rsCart.EOF
			cCode = rsCart("cCode")
			gCode = rsCart("gCode")
			gMnum = rsCart("gMnum")
			gName = rsCart("gName")
			gGname = rsCart("gGname")
			gPrice = rsCart("gPrice")
			reserveFund = rsCart("reserveFund")
			amount = rsCart("amount")
			'tOrderNbr = trim(rsCart("tOrderNbr"))
			'choiceDT = trim(rsCart("choiceDT"))
			'매핑
			if gGname <> "" then gName = gName & " (" & gGname & ")"
				
			if directBuy <> "Y" Then  	'쇼핑카드를 통해서 구입시
				'stockID를 통해서 gCode, 크기와 색상값 구하기
				stockID = rsCart("stockID")
				if stockID <> "" then 
					ArrGetGPs = GetGoodsproperties(stockID)
					gSize = ArrGetGPs(1) 
					gColor = ArrGetGPs(2)  
				end if
			end if	'if directBuy = "Y" Then  	'직접구매선택시
			'각 값이 널일때 처리 				
			if gSize = "" then gSize = "-"
			if gColor = "" then gColor = "-"
			
			SubSumPrice = 0
			SubSumPrice = gPrice * amount
			TotSumPrice = TotSumPrice + SubSumPrice
			if Len(i) < 2 then 	i = "0" & i

%>
	<TR>
	  <TD height=25 align="center" class=order><%= i %></TD>
	  <TD align="center"><a href="../GoodsDetailBody.asp?c=<%= cCode %>&g=<%= gCode %>"><%= gMnum %></a></TD>
	  <TD><IMG height=10 src="../../Images/TransparentImage.gif" width=10>
		<%= gName %></TD>
	  <TD align="center"><%= gSize %></TD>
	  <TD align="center"><%= gColor %></TD>
	  <TD align="center" valign="middle"><%= FormatNumber(amount,0) %></TD>
	  <TD align="center"><%= FormatNumber(gPrice,0) %>원</TD>
	  <TD align="center"><%= FormatNumber(SubSumPrice,0) %>원
	  </TD>
	  <TD align="center"><%= FormatNumber(reserveFund * amount,0) %>원</TD>
	  </TR>
	<%
			rsCart.MoveNext
			i=i+1
		loop
%>
                <TR bgcolor="#FFFFFF">
                  <TD height=30 class=order>&nbsp;</TD>
                  <TD>&nbsp;</TD>
                  <TD>&nbsp;</TD>
                  <TD align="center">&nbsp;</TD>
                  <TD align="center">&nbsp;</TD>
                  <TD>&nbsp;</TD>
                  <TD align="right">총계</TD>
                  <TD align="center" bgcolor="#FFFFFF">
				  <%= FormatNumber(TotSumPrice,0) %>원 
				  <% if TotSumPrice < 30000 then 		
						'배송료
						deliCharge = 3000
					else 
						deliCharge = 0	
				  	end if 
				  %>
					 + 배송료(<%= FormatNumber(deliCharge,0) %>원)
				  </TD>
				  <TD align="center"> = <%= FormatNumber(TotSumPrice + deliCharge ,0) %>원</TD>
                </TR>
              </TABLE></TD>
          </TR>
        </TABLE>
<%
		Call CloseRS(rsCart)
	else
		Response.Redirect(Application("SiteURLDir"))
 	end if	'if RSresult <> "Empty" then
%>



  </TD>
</TR>
</TABLE>
      </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=0 width=750 align="center" border=0>
        <TR>
          <TD width=18 height=25><IMG height=11 src="Images/opBullet.gif" width=11></TD>
          <TD class=textpoint height=25>적립금 안내</TD>
        </TR>
        <TR>
          <TD>&nbsp;</TD>
          <TD> 적립금은 자동적으로 적립되며 이벤트 기간 때 현금처럼 사용할 수 있습니다. <br>
            단, 적립금은 실결제부분에 대해서만 적립됩니다. 따라서 적립금으로 구입했을 경우 적립금이 쌓이지 않습니다.<BR>
          </TD>
        </TR>
        <TR>
          <TD height=25><IMG src="Images/opBullet.gif" width="11" height="11"></TD>
          <TD class=textpoint height=25>배송비 안내</TD>
        </TR>
        <TR>
          <TD height=20>&nbsp;</TD>
          <TD>3만원 이상은 배송비가 없습니다.
            <!-- a href="javascript:openPage('/sitemap/html/DelvPay.html','','488','500')">
          <img height=20 src="Images/opDetail.gif" width=77 align=absMiddle border=0></a -->
          </TD>
        </TR>
    </TABLE></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
    <TABLE cellSpacing=0 cellPadding=5 width=100% align="center" border=0>
        <TR>
          <TD><IMG height=28 src="Images/icoHowToPay_select.gif"
            width=117><SPAN class=textsmall> </SPAN></TD>
        </TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=1 width=752 align="center"
              border=0>
                <TR>
                  <TD class=text vAlign=bottom>무통장입금은 입금자명과 실제 입금자의 이름이 다른 경우에 상품 배송을 할 수 없습니다.
                  <!-- 국민/BC카드" (개인, 법인 모두) 결제는 반드시 안전결제를 선택하셔야 합니다. <A
                  href="http://www.interpark.com/card/card_bckb.html"><IMG
                  height=20 src="Images/icoHowToPay_KB.gif" width=155
                  border=0></A><BR>
                    안전결제는 10만원이상 결제시 공인인증서가 필수입니다 없으신분은 다른카드를 이용해주세요 --> </TD>
                </TR>
          </TABLE></TD>
        </TR>
        <TR>
          <TD>
          <TABLE cellSpacing=0 cellPadding=0 width=700 align="center" border=0>
              <TR bgColor=#f2f2f2>
                <TD width=20 height=30>
                    <INPUT type=radio value="cash" name="howToPay">
                </TD>
                <TD class=text width=230 height=30>
					무통장입금
                  </TD>
                <TD width=20 height=30>
                    <INPUT type=radio value="card1" name="howToPay">
                </TD>
                <TD class=text width=230 height=30>
                  신용카드</TD>
                <!-- TD class=text width=20 height=30><INPUT
                  onclick="checkRealAmt('298000.0',this.value);showLayer('N','F','Cash');hideLayer('Multi');hideLayer('Finger');hideLayer('Online');checkMember();"
                  type=radio value=26 name=howToPay>
                </TD>
                <TD class=text width=230 height=30>
                  <DIV align=left>신용카드(법인)</TD>
              </TR>
              <TR bgColor=#f2f2f2>
                <TD class=text width=20 height=30><INPUT
                  onclick="checkRealAmt('298000.0',this.value);showLayer('N','F','Cash');hideLayer('Multi');hideLayer('Finger');showDisplay('Online')"
                  type=radio value=7 name=howToPay>
                </TD>
                <TD class=text width=230 height=30>
                  <DIV align=left>국민/BC카드(안전결제)</TD>
                <TD height=30><INPUT
                  onclick="checkRealAmt('298000.0',this.value);showLayer('N','F','Cash');hideLayer('Multi');showDisplay('Finger');hideLayer('Online')"
                  type=radio value=29 name=howToPay>
                </TD>
                <TD class=text width=230 height=30>
                  <DIV align=left>통합 인터넷뱅킹</TD>
                <TD class=text height=30><INPUT disabled
                  onclick="checkRealAmt('298000.0',this.value);showLayer('N','F','Multi');hideLayer('Cash');hideLayer('Finger');hideLayer('Online')"
                  type=radio value=21 name=howToPay>
                </TD>
                <TD class=text width=230 height=30>
                  <DIV align=left>사이버캐시(0원)</TD>
              </TR -->
          </TABLE></TD>
        </TR>
    </TABLE></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
    <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
       <TR>
        <TD width="50%" align="right">
        <a href="javascript:history.go(-1);">
        <IMG height=34 src="Images/opBefore.gif" width=110 border=0></a></TD>
        <TD width="50%">
          <INPUT name="image" type=image src="Images/opNext.gif" width=110 height=34 border=0 onclick="javascript:return checkOrder();"> </TD>
        </TR>
    </TABLE></td>
  </tr>
</table>
</form>
<% end if %>