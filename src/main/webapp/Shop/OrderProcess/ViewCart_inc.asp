<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<% 
if opMode = "c" then 

	'쿠키를 사용해야 세션이 끝겨도 이용가능하다.
	if Request.Cookies("tempOrderID") = "" then
		Response.Cookies("tempOrderID") = Session.SessionID
	end if

	'쇼핑카트에 있는 내용가져오기	
	SQL = "SELECT cCode,gCode,gMnum,gName,gGname,SMprice,Sprice,tOrderNbr,stockID,amount,choiceDT FROM vCart "
	SQL = SQL & " WHERE tOrderNbr = '" & Request.Cookies("tempOrderID") & "'"
	SQL = SQL & " Order by choiceDT"
	RSresult = OpenSimpleRS(rsCart, SQL)
%>
<script language="JavaScript" src="vc_inc.js"></script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><TABLE width=100% border=0 align=center cellPadding=5 cellSpacing=0>
        <TR> 
          <TD><IMG height=28 src="Images/icoCart_title.gif" width=152></TD>
        </TR>
        <TR> 
          <TD class=textsmall> 상품 수량을 조정하시면 각 상품별 소계 금액과 총계 금액이 자동으로 계산됩니다.<BR>
            모든 선택이 끝나셨으면 "구매" 를 클릭해 주세요<BR>
            다른 상품을 더 구매하시려면 "이전"을 클릭해 주세요.</TD>
        </TR>
      </TABLE></td>
  </tr>
  <tr> 
    <td> 
<%
	if RSresult <> "Empty" then
		'recordcnt = rsCart.RecordCount
		'페이지
		'totalpage = rs.pagecount
		'rs.absolutepage = page
		'GetString로 받아냄
		'AllRec = rsCart.GetString(2, rsCart.PageSize) 	'(adClipString=2, RS.PageSize)
		'rows = split(AllRec,chr(13))
%> 
	<form action="ViewCart_ok.asp?mode=b" method="post" name="frmCart">
        <TABLE cellSpacing=0 cellPadding=0 width=750 align="center" bgColor=#dfdfdf border=0>
          <TR> 
            <TD> <TABLE cellSpacing=2 cellPadding=1 width=100% align=center 
                  border=0>
                <TR bgColor=#f2f2f2> 
                  <TD height=20 rowspan="2">순번</TD>
                  <TD height=20 rowspan="2">모델명</TD>
                  <TD height=20 rowspan="2">상품명</TD>
                  <TD rowspan="2">크기</TD>
                  <TD rowspan="2">색상</TD>
                  <TD height="20" rowspan="2">수량</TD>
                  <TD height=20 colspan="2" align="center">판매가격</TD>
                  <TD height=20 colspan="2" align="center"> 소계금액 <%= Request.Cookies("tempOrderID") %></TD>
                  <TD height=20 rowspan="2">구매취소</TD>
                </TR>
                <TR bgColor=#f2f2f2> 
                  <TD height=20 align="center">회원가</TD>
                  <TD height="20" align="center">일반가</TD>
                  <TD height=20 align="center">회원가</TD>
                  <TD height="20" align="center">일반가</TD>
                </TR>
<%
		i = 1
		Do until rsCart.EOF
			cCode = rsCart("cCode")
			gCode = rsCart("gCode")
			gMnum = rsCart("gMnum")
			gName = rsCart("gName")
			gGname = rsCart("gGname")
			SMprice = rsCart("SMprice")
			Sprice = rsCart("Sprice")
			tOrderNbr = rsCart("tOrderNbr")
			stockID = rsCart("stockID")
			amount = rsCart("amount")
			choiceDT = rsCart("choiceDT")
			'매핑
			if gGname <> "" then gName = gName & " (" & gGname & ")"
				
				'stockID를 통해서 gCode, 크기와 색상값 구하기
			if stockID <> "" then 
				ArrGetGPs = GetGoodsproperties(stockID)
				gSize = ArrGetGPs(1) 
				gColor = ArrGetGPs(2)  
			end if
			'각 값이 널일때 처리
			if gSize = "" then gSize = "-"
			if gColor = "" then gColor = "-"
			
			
			SubSumSMprice = 0
			SubSumSprice = 0
			SubSumSMprice = SMprice * amount
			SubSumSprice = Sprice * amount
			TotSumSMprice = TotSumSMprice + SubSumSMprice
			TotSumSprice = TotSumSprice + SubSumSprice
			if Len(i) < 2 then 	i = "0" & i

%>
                <TR align="center"> 
                  <TD height=25 class=order><%= i %><INPUT name=g type=hidden id="g" value="<%= gCode  %>"></TD>
                  <TD height=25><a href="../GoodsDetailBody.asp?c=<%= cCode %>&g=<%= gCode %>"><%= gMnum %></a></TD>
                  <TD height=25><IMG height=10 src="../../Images/TransparentImage.gif" width=10> 
                    <%= gName %></TD>
                  <TD><%= gSize %><span class="order">
                    <INPUT name=stockID type=hidden id="stockID" value="<%= stockID %>">
                  </span></TD>
                  <TD><%= gColor %></TD>
                  <TD valign="middle">
				  <INPUT name="amount" id="amount" value="<%= amount %>" size="2" maxLength="2" style="TEXT-ALIGN: center" autocomplete="off">
                    <a href="javascript:alterAmount('<%= gCode %>', '<%= stockID %>', <%= CInt(i)-1 %>)";>
					<img src="Images/icoCart_change.gif" name="OrdChange" width="31" height="20" border="0" align="absmiddle" id="OrdChange">
					</a></TD>
                  <TD height=25><%= FormatNumber(SMprice,0) %>원</TD>
                  <TD height=25><%= FormatNumber(Sprice,0) %>원</TD>
                  <TD height=25> <INPUT name="SubSumSMprice" value="<%= FormatNumber(SubSumSMprice,0) %>원" size="12" maxlength="15" readOnly> 
                  </TD>
                  <TD height=25> <input name="SubSumSprice" style="BACKGROUND-COLOR: #f2f2f2;" value="<%= FormatNumber(SubSumSprice,0) %>원" size="12" maxlength="15" readonly> 
                  </TD>
                  <TD height=25> <a href="javascript:ConfirmJ('선택한 상품을 취소하기겠습니까?','ViewCart_ok.asp?mode=c&g=<%= gCode %>&stockID=<%= stockID %>')">
				  <img src="Images/icoCart_cancel.gif" name="OrdCancel" border="0" id="OrdCancel"></a>				  </TD>
                </TR>
                <%
			rsCart.MoveNext
			i=i+1
		loop
%>
                <TR bgcolor="#FFFFFF"> 
                  <TD height=25 class=order>&nbsp;</TD>
                  <TD height=25>&nbsp;</TD>
                  <TD height=25>&nbsp;</TD>
                  <TD>&nbsp;</TD>
                  <TD>&nbsp;</TD>
                  <TD>&nbsp;</TD>
                  <TD height=25 colspan="2">총계</TD>
                  <TD align="center" bgcolor="#FFFFFF"> <INPUT name="TotSumSMprice" value="<%= FormatNumber(TotSumSMprice,0) %>원" size="12" maxlength="15" readOnly> 
                  </TD>
                  <TD align="center" bgcolor="#FFFFFF"> <INPUT name="TotSumSprice" value="<%= FormatNumber(TotSumSprice,0) %>원" size="12" maxlength="15"  readOnly> 
                  </TD>
                  <TD>&nbsp;</TD>
                </TR>
              </TABLE></TD>
          </TR>
        </TABLE>
        <br>
        <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
          <TR> 
            <TD width="50%" align="right"> <a href="javascript:history.go(-1);"><img height=34 src="Images/opBefore.gif" width=110 border=0></a> 
            </TD>
            <TD width="50%"> <input name="OrdBuy" type="image" id="OrdBuy" src="Images/icoCart_buyStart.gif" align="middle" width=110 height=34 border=0></TD>
          </TR>
        </TABLE>
      </form>

<%				
	'Response.Write(sql)
	'Response.End()	
		Call CloseRS(rsCart)
	 else
%> <table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="80" align="center"><img src="Images/opBullet.gif" width="11" height="11"> 
            쇼핑카트가 비였습니다.</td>
        </tr>
        <tr> 
          <td align="center"><img src="Images/icoEmptyCart.gif" width="109" height="137"></td>
        </tr>
        <tr> 
          <td height="80" align="center"><a href="javascript:history.go(-1);"><img height=34 src="Images/opBefore.gif" width=110 border=0></a></td>
        </tr>
      </table>
      <% end if	'if RSresult <> "Empty" then %> </td>
  </tr>
</table>
<% end if 	'if opMode = "c" then %>
