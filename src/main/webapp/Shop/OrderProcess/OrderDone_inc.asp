<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<% if opMode = "d" then %>
<%
	'각 상품주문정보
	orderNbr = Request("orderNbr")
	SQL = "SELECT orderNbr,subNbr,gCode,gMnum,gName,stockID,amount,gPrice,gClass,cbNbr,reserveFund "	
	SQL = SQL & " FROM vCurrentOrder "
	SQL = SQL & " WHERE orderNbr = '" & orderNbr & "'"	
	RSresult = OpenSimpleRS(coRS, SQL)
	if RSresult = "Empty" then
		Call GotoThePage("비정상적인 접속입니다!!", Application("SiteURLDir"))
	end if
	
	'vOrderDoneInfo정보
	SQL = "SELECT note,howToPay,payInfoDetail,orderDT,rName,rPhone,rCellularP,rAddrZip,rAddrCity,rAddrStt "
	SQL = SQL & " FROM vOrderDoneInfo "
	SQL = SQL & " WHERE orderNbr = '" & orderNbr & "'"	
'Call ShowMeTheValues(SQL)		
	RSresult = OpenSimpleRS(doneRS, SQL)
	if RSresult = "Empty" then
		Call GotoThePage("비정상적인 접속입니다!!", Application("SiteURLDir"))
	end if
	note = trim(doneRS("note"))
	howToPay = trim(doneRS("howToPay"))
	payInfoDetail = trim(doneRS("payInfoDetail"))
	orderDT = trim(doneRS("orderDT"))
	rName = trim(doneRS("rName"))
	rPhone = trim(doneRS("rPhone"))
	rCellularP = trim(doneRS("rCellularP"))
	rAddrZip = trim(doneRS("rAddrZip"))
	rAddrCity = trim(doneRS("rAddrCity"))
	rAddrStt = trim(doneRS("rAddrStt"))
	Call CloseRS(doneRS)
	'매핑
	onlinePayer = Left(payInfoDetail,InStr(payInfoDetail,"-")-1)
	payInfoDetail = MID(payInfoDetail,InStr(payInfoDetail,"-")+1)
	if rCellularP <> "" then rCellularP = ", 핸드폰: " & rCellularP

%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="60" valign="top"><TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
      <TR>
        <TD width=19 height=25><IMG height=11 
                  src="Images/opBullet.gif" width=11></TD>
        <TD width=731 height=25>
          <% if session("MbrID") <> "" then %>
          <font color="#3366CC"><%= session("MbrID") %></font>님께서 주문하신
          <% end if %>
      내역은 다음과 같습니다.</TD>
      </TR>
      <TR>
        <TD height=20>&nbsp;</TD>
        <TD><FONT color=#ff0000>- 이 페이지를 프린트 해 두시면 더 편리합니다. </FONT>
            <!-- 주문 처리에 대해 궁금하신 점이 있으시면 <A 
                  href="http://www.interpark.com/gate/sos/SOSMainList.jsp?COMM_001=0000100000&amp;COMM_002=0&amp;MAJOR=SOS0102&amp;TEAM=&amp;STATUS=&amp;TY=A&amp;PS=20&amp;FROM=&amp;TO="><STRONG><FONT 
                  color=#ff0000>SOS게시판</FONT></STRONG></A>을 이용하시기 바랍니다.--></TD>
      </TR>
    </TABLE></td>
  </tr>
  <tr>
    <td><IMG height=28 src="Images/icoOrderDone_item.gif" width=123></td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=1 width=750 align=center bgColor=#dfdfdf border=0>      
        <TR>
          <TD>
            <TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
			<TR bgColor="#f2f2f2">
			  <TD width="110" height="30" align="center">주문번호 </TD>
			  <TD width=640 bgColor="#ffffff" height="30">
			  <IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= orderNbr %> 
			  </TD>
			</TR>
          </TABLE></TD>
        </TR>
      
    </TABLE></td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=1 width=750 align="center" bgColor=#dfdfdf border=0>
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
                <% else %>소계일반가<% end if %>
				</TD>
                <TD> 적립금</TD>
              </TR>
              <%
		i = 1
		Do until coRS.EOF
			subNbr = coRS("subNbr")
			gCode = coRS("gCode")
			gMnum = coRS("gMnum")
			gName = coRS("gName")
			stockID = coRS("stockID")
			amount = coRS("amount")
			gPrice = coRS("gPrice")
			gClass = coRS("gClass")
			cbNbr = coRS("cbNbr")
			reserveFund = coRS("reserveFund")
			'매핑
			'stockID를 통해서 gCode, 크기와 색상값 구하기
			if stockID <> "" then 
				ArrGetGPs = GetGoodsProperties(stockID)
				gSize = ArrGetGPs(1) 
				gColor = ArrGetGPs(2)  
			end if
			'각 값이 널일때 처리 				
			if gSize = "" then gSize = "-"
			if gColor = "" then gColor = "-"
			
			SubSumPrice = 0
			SubSumPrice = gPrice * amount
			TotSumPrice = TotSumPrice + SubSumPrice
			if Len(subNbr) < 2 then 	subNbr = "0" & subNbr
%>
              <TR align="center">
                <TD height=25 class=order><%= subNbr %></TD>
                <TD><a href="../GoodsDetailBody.asp?c=<%= cCode %>&g=<%= gCode %>"><%= gMnum %></a></TD>
                <TD><%= gName %></TD>
                <TD><%= gSize %></TD>
                <TD><%= gColor %></TD>
                <TD valign="middle"><%= FormatNumber(amount,0) %></TD>
                <TD><%= FormatNumber(gPrice,0) %>원</TD>
                <TD><%= FormatNumber(SubSumPrice,0) %>원</TD>
                <TD><%= FormatNumber((reserveFund*amount),0) %>원</TD>
              </TR>
              <%
			coRS.MoveNext
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
		Call CloseRS(coRS)
%>
	  </TD>
        </TR>
      </TABLE></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img height=28 
                  src="Images/icoOrderDone_payInfo.gif" 
                  width=123></td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=1 width=750 align=center 
            bgColor=#dfdfdf border=0>
      <FORM name=form4 action="" method=post>
        
          <TR>
            <TD><!-- 최종 결제 정보 -->
                <TABLE cellSpacing=0 cellPadding=0 width=750 align=center 
                  border=0>
                  
                    <TR bgColor=#f2f2f2>
                      <TD width=110 height=30>
                        <DIV align=center><SPAN>결제방법</DIV></TD>
                      <TD class=text width=640 bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= howToPay %></TD>
                    </TR>
                    <TR bgColor=#dfdfdf>
                      <TD colSpan=2 height=1><IMG src="../../Images/TransparentImage.gif" height="1"></TD>
                    </TR>
                    <TR bgColor=#f2f2f2>
                      <TD height=30>
                        <DIV align=center><SPAN>입금은행정보</DIV></TD>
                      <TD class=text bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= payInfoDetail %></TD>
                    </TR>
                    <TR bgColor=#dfdfdf>
                      <TD colSpan=2 height=1><IMG src="../../Images/TransparentImage.gif" height="1"></TD>
                    </TR>
                    <TR bgColor=#f2f2f2>
                      <TD width=110 height=30>
                        <DIV align=center><SPAN>결제금액</DIV></TD>
                      <TD class=price bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= FormatNumber(TotSumPrice + deliCharge ,0) %>원</TD>
                    </TR>
                    <TR bgColor=#dfdfdf>
                      <TD colSpan=2 height=1><IMG src="../../Images/TransparentImage.gif" height="1"></TD>
                    </TR>
                    <TR bgColor=#f2f2f2>
                      <TD height=30>
                        <DIV align=center><SPAN>입금자명</DIV></TD>
                      <TD bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= onlinePayer %>님</TD>
                    </TR>
                  
                </TABLE>
                <!-- 최종 결제 정보 끝--></TD>
          </TR>
      </FORM>
    </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>        
          <TR>
            <TD width=19 height=25><IMG height=11 src="Images/opBullet.gif" width=11></TD>
            <TD width=731 height=25>주의사항</TD>
          </TR>
          <TR>
            <TD height=25>&nbsp;</TD>
            <TD height=25><FONT color=#ff0000>
			- 입금자명과 실제 입금자의 이름이 다른 경우에는 상품 배송을 할 수 없습니다.<BR>
            - 고객님이 입금하실 때, 반드시 입금자 명에 &quot;<FONT color="#0066CC"><%= onlinePayer %></font>&quot;라는 입금자 명으로 입금하셔야 합니다.
			</FONT>
			</TD>
          </TR>
        
    </TABLE></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img height=28 src="Images/icoOrderDone_toWhere.gif" width=123></td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=1 width=750 align=center border=0>
        <TR>
          <TD bgColor=#dfdfdf>
            <TABLE cellSpacing=0 cellPadding=0 width=750 align=center border=0>
                <TR bgColor=#f2f2f2>
                  <TD width=110 height=30 align="center">받으실 분</TD>
                  <TD class=text width=640 bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= rName %>님</TD>
                </TR>
                <TR bgColor=#dfdfdf>
                  <TD colSpan=2 height=1></TD>
                </TR>
                <TR bgColor=#f2f2f2>
                  <TD width=110 height=30 align="center">주소</TD>
                  <TD class=text bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10>
				  [<%= rAddrZip %>]  &nbsp;<%= rAddrCity %>&nbsp; <%= rAddrStt %>
				   </TD>
                </TR>
                <TR bgColor=#dfdfdf>
                  <TD colSpan=2 height=1><IMG src="../../Images/TransparentImage.gif" height="1"></TD>
                </TR>
                <TR bgColor=#f2f2f2>
                  <TD height=30 align="center">연락번호</TD>
                  <TD class=text bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> 전화번호: <%= rPhone %> <%= rCellularP %></TD>
                </TR>
                <TR bgColor=#dfdfdf>
                  <TD colSpan=2 height=1><IMG src="../../Images/TransparentImage.gif" height="1"></TD>
                </TR>
                <TR bgColor=#f2f2f2>
                  <TD height=30 align="center">메세지 내용</TD>
                  <TD class=text bgColor=#ffffff height=30><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <%= note %></TD>
                </TR>
              
          </TABLE></TD>
        </TR>
      
    </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=750 align=center 
              border=0>
        
          <TR>
            <TD width=18 height=25><IMG height=11 src="Images/opBullet.gif" width=11></TD>
            <TD width=732 height=25>배송 안내</TD>
          </TR>
          <TR>
            <TD height=25>&nbsp;</TD>
            <TD height=25><FONT color=#ff0000><% '- 주문하신 상품은 상품 종류 별로 각각 따로 배송될 수 있습니다. %></FONT></TD>
          </TR>
        
    </TABLE></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="Images/icoOrderDone_etc.gif" width=81 height=28></td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=1 width=750 align=center 
              border=0>
      <FORM name=form4 action="" method=post>
        
          <TR>
            <TD bgColor=#dfdfdf>
              <TABLE cellSpacing=0 cellPadding=0 width=750 align=center 
                  border=0>
                  <TR bgColor=#dfdfdf>
                    <TD colSpan=2 height=1><IMG src="../../Images/TransparentImage.gif" height="1"></TD>
                  </TR>
                  <TR bgColor=#f2f2f2>
                    <TD width=110 height=55>
                      <DIV align=center><SPAN>교환/환불 문의</DIV></TD>
                    <TD width="640" height=55 bgColor=#ffffff><p><IMG height=10 src="../../Images/TransparentImage.gif" width=10> <SPAN 
                        class=text>고객서비스센터 : <%= Application("firmPhone") %><br>
                      <IMG height=10 src="../../Images/TransparentImage.gif" width=10> 이메일 : <a href="mailto:<%= Application("firmEmail") %>"><%= Application("firmEmail") %></a><BR>
                      <IMG height=10 src="../../Images/TransparentImage.gif" width=10> 팩스 : <%= Application("firmFax") %></p>                      </TD>
                  </TR>
                
            </TABLE></TD>
          </TR>
      </FORM>
    </TABLE>
      <!--TABLE cellSpacing=0 cellPadding=0 width=750 align=center 
              border=0>
        
          <TR>
            <TD width=18 height=25><IMG height=11 
                  src="Images/opBullet.gif" width=11></TD>
            <TD width=732 height=25>기타 설명</TD>
          </TR>
          <TR>
            <TD height=25>&nbsp;</TD>
            <TD height=25>- 자세한 내용은 <A 
                  href="http://www.interpark.com/gate/faq/InterparkCyberGuestCenter.jsp?COMM_001=0000100000&amp;COMM_002=1&amp;PAGE=main"><SPAN>이용안내</A>에서 확인하실 수 있습니다.<BR>
              - 거래증빙서류(세금계산서, 온라인입금증, 신용카드 매출전표)는 <A 
                  href="https://www.interpark.com/sitemap/MyPageLogin.jsp?COMM_001=0000100000&amp;COMM_002=0"><SPAN>MY PAGE</A>의 주문내역에서 신청하실 수 있습니다.<BR>
                          - <B>전자증빙(신용카드매출전표,입금증,세금계산서) 전용뷰어가 자동으로 설치되지 않을 경우 <A 
                  href="http://e-tax.interpark.com/interpark/tax/files/TopShield.exe"><FONT 
                  color=red>여기</FONT></A>를 클릭하세요.</B> </TD>
          </TR>
        
    </TABLE--></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
      
        <TR>
          <TD width="50%" align="right">
			<A href="javascript:window.print();">
			<IMG src="Images/icoOrderDone_print.gif" width=110 height=34 border=0></A>
			</TD>
          <TD width="50%"><a href="<%= Application("SiteURLDir") %>"><img src="Images/icoOrderDone_mypage.gif" width="110" height="34" border="0"></a> </TD>
        </TR>
    </TABLE></td>
  </tr>
</table>
<%		%>
<% end if %>