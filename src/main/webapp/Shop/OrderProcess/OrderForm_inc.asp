<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<% if opMode = "f" then %>
<script language="JavaScript" src="of_inc.js"></script>
<%
	'회원, 비회원 재확인.
	NMLoggedin = trim(request("NMLoggedin"))
	if (session("MbrID") = "" and NMLoggedin <> "Y") Or (session("MbrID") <> "" and NMLoggedin = "Y") then
		Call GotoThePage("장시간 주문상태로 유지하면 위험합나다. 안전을 위해 로그아웃합니다.\n재주문하세요. ", Application("SiteURLDir") & "CommonAccessories/MbrUsers/muExit.asp")
	end if

	cCode = Request("cCode")
	gCode = Request("gCode")
	gSize = Request("gSize")
	gColor = Request("gColor")
	amount = Trim(Request("amount"))
	if cCode <> "" And gCode <> "" And amount <> "" Then directBuy = "Y"	'직접구매선택시
%>
<form name="frmOrderForm" action="OrderForm_ok.asp" method="post" onSubmit="return SubmitOrderForm(this)">
<!-- 직접구매시 넘어오는 값들 -->
<input name="cCode" type="hidden" id="cCode" value="<%= cCode %>">
<input name="gCode" type="hidden" id="gCode" value="<%= gCode %>">
<input name="gSize" type="hidden" id="gSize" value="<%= gSize %>">
<input name="gColor" type="hidden" id="gColor" value="<%= gColor %>">
<input name="amount" type="hidden" id="amount" value="<%= amount %>">
<input name="NMLoggedin" type="hidden" id="NMLoggedin" value="<%= NMLoggedin %>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><TABLE width=750 border=0 cellPadding=0 cellSpacing=0>
          <TR>
          <TD><IMG height=28 src="Images/icoOrderForm_item.gif" width=121></TD>
        </TR>
      </TABLE></td>
  </tr>
  <tr>
    <td>
<%
	if cCode <> "" And gCode <> "" And amount <> "" Then  	'직접구매선택시
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
		'결제방식확인
		howToPay = trim(request("howToPay"))
		if howToPay = "cash" then htpName ="무통장입금"
		if howToPay = "card1" then htpName ="신용카드"

		'회원정보 갖고 오기
		if session("MbrID") <> "" then
			SQL = "SELECT * FROM vMember "
			SQL = SQL + " WHERE MbrID='" & session("MbrID") & "'"
			RSresult = OpenRS(rs,SQL,1)
			'Response.Write("RSresult=" + RSresult)
			if RSresult <> "Empty" then
				MbrID = trim(rs("MbrID"))
				MbrName = trim(rs("MbrName"))
				phone = trim(rs("phone"))
				cellularP = trim(rs("cellularP"))
				MbrEmail = trim(rs("MbrEmail"))
				AddrZip = trim(rs("AddrZip"))
				AddrCity = trim(rs("AddrCity"))
				AddrStt = trim(rs("AddrStt"))
				Call CloseRS(rs)
				'재매핑
				phoneArray = Split(phone,"-")
				cTEL1 = phoneArray(0)
				cTEL2 = phoneArray(1)
				cTEL3 = phoneArray(2)
				cellularPArray = Split(cellularP,"-")
				cMTEL1 = cellularPArray(0)
				cMTEL2 = cellularPArray(1)
				cMTEL3 = cellularPArray(2)
			end if
		end if 	'if session("MbrID") <> "" then


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
          <TD> <TABLE width="100%" align="center" cellSpacing=0 cellPadding=0 border=0>
              <TR align="center" bgColor=#f2f2f2>
                <TD height=30>순번</TD>
                <TD>모델명</TD>
                <TD>상품명</TD>
                <TD>크기</TD>
                <TD>색상</TD>
                <TD> 수량</TD>
				<TD>
                <% if session("MbrID") <> "" then %>판매회원가
				<% else %>판매일반가<% end if %></TD>
                <TD>
				<% if session("MbrID") <> "" then %>소계회원가
                <% else %>소계일반가<% end if %>				</TD>
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

			if directBuy = "Y" Then  	'직접구매선택시
				'구입수량 및 재고량 체크
				Call CheckStock(GetCurrStock(gCode,gSize,gColor),-amount,"")
			else 	'쇼핑카드를 통해서 구입시
				stockID = rsCart("stockID")
				if stockID <> "" then
					'구입수량 및 재고량 체크
					info = PickUpValue("vMaster", "gName", "gCode='" & gCode & "'")
					Call CheckStock(GetCurrStock1(stockID),-amount,"* " & info & " *")
					'stockID를 통해서 gCode, 크기와 색상값 구하기
					ArrGetGPs = GetGoodsProperties(stockID)
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
              <TR align="center">
                <TD height=25 class=order><%= i %></TD>
                <TD><a href="../GoodsDetailBody.asp?c=<%= cCode %>&g=<%= gCode %>"><%= gMnum %></a></TD>
                <TD><IMG height=10 src="../../Images/TransparentImage.gif" width=10><%= gName %></TD>
                <TD><%= gSize %></TD>
                <TD><%= gColor %></TD>
                <TD valign="middle"><%= FormatNumber(amount,0) %></TD>
                <TD><%= FormatNumber(gPrice,0) %>원</TD>
                <TD><%= FormatNumber(SubSumPrice,0) %>원</TD>
                <TD><%= FormatNumber((reserveFund*amount),0) %>원</TD>
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
                  <TD align="center" bgcolor="#FFFFFF"><%= FormatNumber(TotSumPrice,0) %>원
                    <% if TotSumPrice < 30000 then
						'배송료
						deliCharge = 3500
					else
						deliCharge = 0
				  	end if
				  %>
                    + 배송료(<%= FormatNumber(deliCharge,0) %>원) </TD>
                  <TD align="center">= <%= FormatNumber(TotSumPrice + deliCharge ,0) %>원</TD>
                </TR>
            </TABLE>
<%
		Call CloseRS(rsCart)
	else
		Response.Redirect(Application("SiteURLDir"))
 	end if	'if RSresult <> "Empty" then
%>
<input name="TotSumPrice" type="hidden" id="TotSumPrice" value="<%= TotSumPrice %>">
<input name="deliCharge" type="hidden" id="deliCharge" value="<%= deliCharge %>">
            </TD>
        </TR>
      </TABLE></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/icoOrderForm_client.gif" width="99" height="28"></td>
  </tr>
  <tr>
    <td><table width="750" border="0" align="center" cellpadding="1" cellspacing="0" bgcolor="#DFDFDF">
        <tr>
          <td><table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr bgcolor="#F2F2F2">
                <td width="110" height="30"> <div align="center"><span class="ordertext1">이름</span></div></td>
                <td width="264" height="30" bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
                  <input name="cName" type="text" id="MbrName" value="<%= MbrName %>" size="16" maxlength="25" style="ime-mode:active">
                  <input name="MbrID" type="hidden" id="MbrID" value="<%= MbrID %>">
                </td>
                <td width="110" height="30" bgcolor="#F2F2F2"> <div align="center"><span class="ordertext1">전화번호</span></div></td>
                <td width="266" height="30" bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
                  <INPUT name="cTEL1" id="cTEL1" value="<%= cTEL1 %>" size="4" maxlength="4">
                  -
                  <INPUT name="cTEL2" id="cTEL2" value="<%= cTEL2 %>" size="4" maxlength="4">
                  -
                  <INPUT name="cTEL3" id="cTEL3" value="<%= cTEL3 %>" size="4" maxlength="4"> </td>
              </tr>
              <tr bgcolor="#DFDFDF">
                <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
              </tr>
              <tr bgcolor="#F2F2F2">
                <td width="110" height="30"> <div align="center"><span class="ordertext1">이메일</span></div></td>
                <td height="30" bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
                  <input name="cEmail" type="text" id="cEmail" value="<%= MbrEmail %>" size="30" maxlength="50">
                </td>
                <td width="110"> <div align="center"><span class="ordertext1">핸드폰번호</span></div></td>
                <td bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
                  <INPUT name=cMTEL1 id="cMTEL1" value="<%= cMTEL1 %>" size=4 maxlength="4">
                  -
                  <INPUT name=cMTEL2 id="cMTEL2" value="<%= cMTEL2 %>" size=4 maxlength="4">
                  -
                  <INPUT name=cMTEL3 id="cMTEL3" value="<%= cMTEL3 %>" size=4 maxlength="4"></td>
              </tr>
              <tr bgcolor="#DFDFDF">
                <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
              </tr>
              <tr>
                <td rowspan="3" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">발송지주소</td>
                <td height="30" colspan="3" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                  <input name="cAddrZip" type="text" id="cAddrZip" style="CURSOR: default;" value="<%= AddrZip %>" size="7" maxlength="7" readonly>
                  <a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', frmOrderForm, frmOrderForm.cAddrZip, 426, 400);">
				  <img src="Images/icoOrderForm_addressFind.gif" width="81" height="20" border="0" align="absmiddle"></a></td>
              </tr>
              <tr>
                <td height="30" colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                  <input name="cAddrCity" type="text" id="cAddrCity" value="<%= AddrCity %>" size="50" maxlength="50" readonly></td>
              </tr>
              <tr>
                <td height="30" colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                  <input name="cAddrStt" type="text" id="cAddrStt" value="<%= AddrStt %>" size="20" maxlength="20" style="ime-mode:active"></td>
              </tr>
              <tr bgcolor="#FFFFFF">
                <td height="30" colspan="4">
                  <!--img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="8">
                  ※ 주문하신 상품 출고시 핸드폰으로 안내 메시지(SMS) 보내드립니다. <br> <img src="https://image.interpark.com/ssl/template/blank.gif" width="25" height="1">
                  SMS는 상품군별로 발송됩니다. <img src="https://image.interpark.com/ssl/template/blank.gif" width="20" height="1">
                  <input type=radio name=SMSCHK checked>
                  받겠습니다.
                  <input type=radio name=SMSCHK >
                  받지 않겠습니다. -->
                </td>
              <tr bgcolor="#DFDFDF">
                <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/icoOrderForm_toWhere.gif" width="99" height="28"></td>
  </tr>
  <tr>
    <td><table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="35">
          <input name="cbSameData" type="checkbox" id="cbSameData" value="" onclick="javascript:sameData(this.form);">
            주문자정보와 일치하면 체크하세요.<br>
           <!-- 고객님의 지난 배송지 목록을 이용할 수 있습니다. <img src="Images/icoOrderForm_previousAddress.gif" width="81" height="20" align="absmiddle" --></td>
        </tr>
      </table>
      <table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="#DFDFDF">
          <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
        </tr>
        <tr>
          <td width="110" rowspan="3" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">배송지주소</td>
          <td height="30" colspan="3" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
            <input name="rAddrZip" type="text" id="rAddrZip" style="CURSOR: default;" size="7" maxlength="7" readonly>
            <a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', frmOrderForm, frmOrderForm.rAddrZip, 426, 400);">
			<img src="Images/icoOrderForm_addressFind.gif" width="81" height="20" border="0" align="absmiddle">
            </a>(동/읍/면 이름 입력) </td>
        </tr>
        <tr>
          <td height="30" colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
            <input name="rAddrCity" type="text" id="rAddrCity" size="50" maxlength="50" readonly></td>
        </tr>
        <tr>
          <td height="30" colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
            <input name="rAddrStt" type="text" id="rAddrStt" size="20" maxlength="20" style="ime-mode:active"></td>
        </tr>
        <tr bgcolor="#DFDFDF">
          <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
        </tr>
      </table>
      <table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="#F2F2F2">
          <td width="110" height="30"> <div align="center"> <span class="ordertext1">받으실
              분</span> </div></td>
          <td width="264" height="30" colspan="3" bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
            <input name="rName" type="text" id="MbrName3" size="16" maxlength="25" style="ime-mode:active">
          </td>
        </tr>
        <tr bgcolor="#DFDFDF">
          <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
        </tr>
        <tr bgcolor="#F2F2F2">
          <td height="30"> <div align="center"> <span class="ordertext1">전화번호</span>
            </div></td>
          <td height="30" bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
            <INPUT name="rTEL1" id="rTEL1" size=4 maxlength="4">
            -
            <INPUT name="rTEL2" id="rTEL2" size=4 maxlength="4">
            -
            <INPUT name="rTEL3" id="rTEL3" size=4 maxlength="4"></td>
          <td width="110"> <div align="center"> <span class="ordertext1">핸드폰 번호</span>
            </div></td>
          <td width="266" bgcolor="#FFFFFF"> <IMG height=10 src="../../Images/TransparentImage.gif" width=10>
            <INPUT name="rMTEL1" id="rMTEL1" size=4 maxlength="4">
            -
            <INPUT name="rMTEL2" id="rMTEL2" size=4 maxlength="4">
            -
            <INPUT name="rMTEL3" id="rMTEL3" size=4 maxlength="4"></td>
        </tr>
        <tr bgcolor="#DFDFDF">
          <td height="1" colspan="4"><img src="https://image.interpark.com/ssl/template/blank.gif" width="10" height="1"></td>
        </tr>
        <tr bgcolor="#F2F2F2">
          <td width="110" height="30"> <div align="center"> <span class="ordertext1">배송시
              유의사항</span> </div></td>
          <td width="640" colspan="3" height="30" bgcolor="#FFFFFF" class="textsmall">
            <IMG height=10 src="../../Images/TransparentImage.gif" width=10> <input name="note" type="text" class="form350" id="note" size="30" maxlength="30">
            30자 이내로 작성 (예: 경비실에 맡겨 주세요.) </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/icoOrderForm_payInfo.gif" width="83" height="28"></td>
  </tr>
  <tr>
    <td align="center"><table width="750" cellpadding="1" cellspacing="0">
        <tr>
          <td bgcolor="#dfdfdf"> <table width="750" cellpadding="0" cellspacing="0">
              <tr bgcolor="#FFFFFF">
                <td colspan="2">조남진 고객님 의 결제정보입니다.</span></td>
              </tr>
              <tr>
                <td colspan="2"><img height="1" src="file:///D|/Projects/MwavShop/blank.gif" width="10"></td>
              </tr>
              <tr>
                <td width="110">결제방법 </td>
                <td width="640" bgcolor="#ffffff" class="price"><IMG height=10 src="../../Images/TransparentImage.gif" width=10><%= htpName %></td>
              </tr>
              <tr>
                <td>결제금액 </td>
                <td class="price" bgcolor="#ffffff"><IMG height=10 src="../../Images/TransparentImage.gif" width=10>
				<%= FormatNumber(TotSumPrice,0) %>원
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
<% if howToPay = "cash" then %>
      <table width="750" cellpadding="1" cellspacing="0">
        <tr>
          <td>입금은행 정보 를 입력해주세요. </td>
        </tr>
        <tr>
          <td bgcolor="#dfdfdf"><table cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="2"><img height="1" src="file:///D|/Projects/MwavShop/blank.gif" width="10"></td>
              </tr>
              <tr>
                <td width="110">입금하실 은행 </td>
                <td width="640" bgcolor="#ffffff" class="textsmall"><IMG height=10 src="../../Images/TransparentImage.gif" width=10>
                  <select name="bankInfo" class="bankInfo">
<%
	SQL = "SELECT bankInfo FROM vBankAccounts "
	SQL = SQL & " Where usable = 'Y' "
	SQL = SQL & " ORDER BY bankInfo"
	RSresult = OpenSimpleRS(rsOption,SQL)
	'rsOption.PageSize = rsOption.RecordCount
	if RSresult <> "Empty" then
		Response.write(vbTab & vbTab & "<option value="""" selected>8~ 입금하실 은행을 선택하세요. ~8</option>") & vbCRLF
		Do While Not rsOption.EOF
			Response.write(vbTab & vbTab & "<option value=""" & rsOption(0) & """>" & rsOption(0) & "</option>") & vbCRLF
			rsOption.MoveNext
		Loop
		call CloseRS(rsOption)
	else
		Response.write(vbTab & vbTab & "<option value="""">8~입력된 은행계좌정보가 없습니다.~8</option>") & vbCRLF
	end if	'if RSresult <> "Empty" then
%>
                  </select></td>
              </tr>
              <tr>
                <td>입금자명 </td>
                <td class="textsmall" bgcolor="#ffffff"><IMG height=10 src="../../Images/TransparentImage.gif" width=10>
                  <input name="onlinePayer" type="text" size="20" maxlength="30">
                  (실제 입금하실 때의 이름을 적어 주세요) </td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br> <table width="750" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="Images/opBullet.gif" width="11" height="11"></td>
          <td class="textpoint">무통장 입금시 주의사항 </td>
        </tr>
        <tr>
          <td></td>
          <td class="textsmall">- 입금자명과 실제 입금자의 이름이 다른 경우에는 상품 배송을 할 수 없습니다. <br>
            - 입금자명을 주의해 주세요. <br>
            ... 잘못된 입급자명&gt;&gt;상품이름,전화번호,핸드폰번호,(주)인터파크,34000원,계좌번호,○○대금값,배송빨리부탁
            등 </td>
        </tr>
        <tr>
          <td width="18"></td>
          <td width="732"><img src="Images/opDetail.gif" width="77" height="20"></td>
        </tr>
      </table>
<% else %>
신용카드로직
<% end if %>

	  </td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TBODY>
          <TR>
            <TD width="50%" align="center"><Input type="image" img src="Images/icoOrderForm_order.gif" width="110" height="34"></TD>
          </TR>
          <TR>
            <TD align="center"><span class="textopinion">[주의] 두 번 클릭하시면 중복되어 주문
              처리 되오니 딱 한 번만 클릭하세요.</span></TD>
          </TR>
        </TBODY>
      </TABLE></td>
  </tr>
</table>
</form>
<% end if %>
