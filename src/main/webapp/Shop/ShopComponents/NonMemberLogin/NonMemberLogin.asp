<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<% 
NMLogin = trim(request("NMLogin"))
if NMLogin = "Y" then %>
	<base href="<%= Application("SiteURLDir") %>ShopComponents/NonMemberLogin/" target="_self">
	<img src="../../Images/TransparentImage.gif" width="50" height="30"><br>
	<TABLE cellSpacing=0 cellPadding=1 width=700 bgColor=#ffffff border=0>  
		<TR>
		  <TD>
			<TABLE cellSpacing=0 cellPadding=0 width=700 align=center border=0>          
				<TR>
				  <TD bgColor=#59ae52 height=40>
				  <FONT color=#59ae52>...</FONT>
				  <SPAN class=logintext1>비회원 로그인 </SPAN>
				  <SPAN class=logintexte1>LOGIN for Guest</SPAN>
				  </TD>
				</TR>
				<TR>
				  <TD bgColor=#ededed height=200>
					<TABLE cellSpacing=0 cellPadding=1 width=650 align=center bgColor=#59ae52 border=0>
					<FORM name="frmNonMbr" method="post" action = "<%= Request.QueryString("gtu") %>&NMLoggedin=Y"> 
					  <TR>
						<TD><TABLE width="100%" border=0 cellPadding=5 cellSpacing=0 bgcolor="#FFFFFF">
						  <TR align="left">
							<TD width="50%">							
							<INPUT name="image" type=image src="Images/icoNonMbrBuy.gif" width=109 height=33 border=0>							</TD>
							<TD width="50%">
							<A href="../../CommonAccessories/MbrUsers/muAgreement.asp"><IMG height=33 src="Images/icoMemberJoin.gif" width=109 border=0></A>
							</TD>
						  </TR>
						  <TR align="left">
								<TD>비회원님께는  적립금 적립이 되지 않습니다.</TD>
								<TD>회원 가입은<FONT color=#ff0000> 무료입니다.</FONT><BR>
		  - 구매시 결제액에 따른 <FONT 
									color=#ff0000>적립금 적립</FONT><BR>
		  - 각종 이벤트, 할인  등의<FONT color=#ff0000> 다양한 혜택</FONT><BR>
		  - 결제내역, 배송내역 등의 <FONT 
									color=#ff0000>My Page</FONT><BR>
		  - 회원님께 특화된 <FONT 
									color=#ff0000>쇼핑정보</FONT> 및 안내 메일 </TD>
						  </TR>
							</TABLE></TD>
						  </TR>
					  </FORM>
				  </TABLE></TD>
				</TR>
		  </TABLE></TD>
		</TR>
	</TABLE>
<% end if %>