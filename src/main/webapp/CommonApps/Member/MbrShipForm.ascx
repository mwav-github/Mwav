<%@ Register TagPrefix="uc1" TagName="DateSelector" Src="/CommonApps/Calendar/DateSelector/DateSelector.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MbrShipForm.ascx.cs" Inherits="KistelSite.CommonApps.MemberShip.MbrShipForm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>


<LINK href="/CommonApps/Calendar/DateSelector/popcalendar.css" type=text/css rel=stylesheet >
<script language=JavaScript src="/CommonLibrary/Function.js"></script>

<script language=JavaScript src="/CommonApps/MemberShip/MemberShip.js"></script>

<script language=JavaScript src="/CommonLibrary/Objects/radio.js"></script>

<script language=javascript 
src="/CommonApps/Calendar/DateSelector/popcalendar.js"></script>
<base href='<%= Application["BaseHref"] %>CommonApps/MemberShip/' target=_self>
<P></P><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face=굴림></FONT><FONT 
face=굴림></FONT><FONT face=굴림></FONT><FONT face="굴림"></FONT>
<table cellSpacing=0 cellPadding=0 width=700 border=0>
  <tr>
    <td>
      <P>member_id <asp:label id=member_id runat="server"></asp:label><BR 
      >loginID <asp:textbox id=loginID runat="server" CssClass="box003" MaxLength="15" Columns="12"></asp:textbox><INPUT class=box003 id=bnLoginID type=button value=검사 name=Button1 runat="server"> 
<asp:requiredfieldvalidator id=RequiredFieldValidator11 runat="server" ErrorMessage="아이디를 넣으세요." ControlToValidate="loginID" Display="Dynamic">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id=revLoginID runat="server" ErrorMessage="아이디는 영문자로 시작하여 3자 이상 15자 까지입니다." ControlToValidate="loginID" ValidationExpression="[A-z]\w{2,15}">*</asp:regularexpressionvalidator></P>
      <P>
      <MARQUEE id=marqeeIdCheckWaitMag 
      style="BORDER-TOP-WIDTH: 0px; DISPLAY: none" scrollAmount=5 
      behavior=alternate width=50><FONT color=blue 
      >조사중..</FONT></MARQUEE></P>
      <P><BR 
      >loginPW <asp:textbox id=loginPW runat="server" CssClass="box003" MaxLength="15" Columns="12"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator12 runat="server" ErrorMessage="패스워드를 넣으세요." ControlToValidate="loginPW">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id=Regularexpressionvalidator4 runat="server" ErrorMessage="암호는 공백없이 4자 이상 입력하세요." ControlToValidate="loginPW" ValidationExpression="\w{4,14}">*</asp:regularexpressionvalidator><BR 
      >MbrName <asp:textbox id=MbrName runat="server" CssClass="box003" MaxLength="20" Columns="12"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator2 runat="server" ErrorMessage="이름을 입력하세요." ControlToValidate="MbrName">*</asp:requiredfieldvalidator><BR 
      >MbrEmail <asp:textbox id=MbrEmail runat="server" CssClass="box003" MaxLength="50" Width="200px"></asp:textbox><asp:requiredfieldvalidator id=Requiredfieldvalidator4 runat="server" ErrorMessage="이메일을 입력하세요." ControlToValidate="MbrEmail">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id=RegularExpressionValidator3 runat="server" ErrorMessage="이메일을 정확히 입력하세요." ControlToValidate="MbrEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:regularexpressionvalidator><BR 
      >phone <asp:textbox id=phone runat="server" Columns="50" Width="140px"></asp:textbox><BR 
      >cellularP <asp:dropdownlist id=cellularP1 runat="server" CssClass="box003">
													<asp:ListItem Selected="True" Value="">선택</asp:ListItem>
												</asp:dropdownlist>- <asp:textbox id=cellularP2 runat="server" CssClass="box003" MaxLength="4" Width="50px"></asp:textbox>- 
<asp:textbox id=cellularP3 runat="server" CssClass="box003" MaxLength="12" Width="70px"></asp:textbox><BR 
      >zipcode <asp:textbox id=mZipcode runat="server" Columns="6" ReadOnly="True"></asp:textbox><asp:hyperlink id=hlSeekAddr runat="server">주소찾기</asp:hyperlink><BR 
      >address <asp:textbox id=mAddress1 runat="server" CssClass="box003" MaxLength="200" Width="300px" ReadOnly="True"></asp:textbox><asp:textbox id=mAddress2 runat="server" CssClass="box003" MaxLength="200" Width="300px"></asp:textbox><BR 
      >findingID <asp:dropdownlist id=findingID runat="server">
														<asp:ListItem Value="0" Selected="True">8~선택하세요~8</asp:ListItem>
													</asp:dropdownlist><BR>findingA <asp:textbox id=findingA runat="server"></asp:textbox><BR 
      >SSN <asp:textbox id=SSN1 runat="server" CssClass="box003" MaxLength="6" Columns="6"></asp:textbox>- 
<asp:textbox id=SSN2 runat="server" CssClass="box003" MaxLength="7" Columns="7"></asp:textbox><asp:requiredfieldvalidator id=RequiredFieldValidator5 runat="server" ErrorMessage="앞자리 주민번호를 입력하세요." ControlToValidate="SSN1" Display="None">*</asp:requiredfieldvalidator><asp:requiredfieldvalidator id=RequiredFieldValidator6 runat="server" ErrorMessage="뒷자리 주민번호를 입력하세요." ControlToValidate="SSN2" Display="Dynamic">*</asp:requiredfieldvalidator>&nbsp;<INPUT class=box003 id=btnSSN style="WIDTH: 86px; HEIGHT: 17px" type=button value=주민번호확인 name=Button1 runat="server"><BR 
      >newsLetter <asp:checkbox id=newsLetter runat="server" Text="뉴스레더를 신청합니다." Checked="True"></asp:checkbox><BR 
      ><FONT face=굴림>- - - - - - - - - 
      - - - - - - - - - -</FONT><BR><FONT face=굴림 
      >rcmderID <asp:textbox id=rcmderID runat="server" CssClass="box003" MaxLength="15" Columns="12"></asp:textbox><INPUT class=box003 id=bnRcmderID type=button value=검사 name=bnRcmderID runat="server"><asp:regularexpressionvalidator id=revRcmderID runat="server" ErrorMessage="아이디는 영문자로 시작하여 3자 이상 15자 까지입니다." ControlToValidate="rcmderID" ValidationExpression="[A-z]\w{2,15}">*</asp:regularexpressionvalidator> 
      </P>
      <P> 

      <MARQUEE id=marqeeIdCheckWaitMag1 
      style="BORDER-TOP-WIDTH: 0px; DISPLAY: none" scrollAmount=5 
      behavior=alternate width=70><FONT color=blue 
      >조사중..</FONT></MARQUEE></P></FONT>
      <P><BR 
      ><FONT face=굴림>- - - - - - - - - 
      - - - - - - - - - -<BR></FONT>homepage <asp:textbox id=homepage runat="server" CssClass="box003" MaxLength="50" Width="176px"></asp:textbox><BR 
      >messenger <asp:textbox id=MsgName runat="server" CssClass="box003" MaxLength="50" Columns="20"></asp:textbox><asp:textbox id=MsgID runat="server" CssClass="box003" MaxLength="50" Columns="20"></asp:textbox><BR 
      >hobbies </P>
      <P> <asp:checkboxlist id=hobbies runat="server" Width="400" RepeatColumns="4"></asp:checkboxlist></P>
      <P><BR 
      >carInfo <asp:dropdownlist id=carInfo runat="server">
																					<asp:ListItem Selected="True" Value="">8~선택하세요~8</asp:ListItem>
																				</asp:dropdownlist><BR>children <asp:textbox id=children runat="server" CssClass="box003" MaxLength="3" Columns="3"></asp:textbox><asp:rangevalidator id=RangeValidator1 runat="server" ErrorMessage="0~99 숫자 안에서 입력하세요." ControlToValidate="children" Type="Integer" MaximumValue="99" MinimumValue="0">*</asp:rangevalidator><BR 
      >avataImage <asp:image id=avataImage runat="server" ImageUrl="../../xUpload/MbrData/Avata/AvaPic_default.gif"></asp:image><INPUT 
      language=C# class=box003 id=bnAvataImage type=file size=22 name=file 
       runat="server"> <asp:checkbox id=cbDeleteAI runat="server" Text="파일삭제" Visible="False"></asp:checkbox><BR 
      >monthlyPay <asp:dropdownlist id=monthlyPay runat="server">
																					<asp:ListItem Selected="True" Value="">8~선택하세요~8</asp:ListItem>
																				</asp:dropdownlist><BR>mark <asp:textbox id=mark runat="server"></asp:textbox><BR 
      ><FONT face=굴림>birthday </FONT><asp:radiobuttonlist id=rblSLBirth runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
																				<asp:ListItem Value="양">양력</asp:ListItem>
																				<asp:ListItem Value="음">음력</asp:ListItem>
																			</asp:radiobuttonlist><asp:textbox id=tbBirthDay runat="server" CssClass="box003" MaxLength="10" Columns="9" ReadOnly="True"></asp:textbox><uc1:dateselector id=DateSelector1 runat="server"></uc1:dateselector><FONT 
      face=굴림><BR>aniversity <asp:radiobuttonlist id=rblMarried runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
																				<asp:ListItem Value="미">미혼</asp:ListItem>
																				<asp:ListItem Value="기">기혼</asp:ListItem>
																			</asp:radiobuttonlist><asp:textbox id=tbWeddingDay runat="server" CssClass="box003" MaxLength="10" Columns="9" ReadOnly="True"></asp:textbox><uc1:dateselector id=DateSelector2 runat="server"></uc1:dateselector></FONT><BR 
      ><FONT face=굴림>- - - - - - - - - 
      - - - - - - - - - -<BR></FONT>company <asp:textbox id=company runat="server"></asp:textbox><BR 
      >jobType <asp:dropdownlist id=jobType runat="server">
																				<asp:ListItem Selected="True" Value="">8~선택하세요~8</asp:ListItem>
																			</asp:dropdownlist><BR>officeP <asp:textbox id=officeP runat="server"></asp:textbox><BR 
      >jobZipcode <asp:textbox id=oZipcode runat="server" Columns="6" ReadOnly="True"></asp:textbox><asp:hyperlink id=hlSeekOAddr runat="server">주소찾기</asp:hyperlink><BR 
      >jobAddress <asp:textbox id=oAddress1 runat="server" MaxLength="200" Width="300px" ReadOnly="True"></asp:textbox><asp:textbox id=oAddress2 runat="server" MaxLength="200" Width="300px"></asp:textbox><BR><FONT 
      face="굴림">- - - - - - - - - - - - - - - - - - -Member 
      values<BR></FONT>mLevel <asp:literal id="mLevel" runat="server"></asp:literal><BR>howMuch / howMany&nbsp;<asp:literal id="howMuch" runat="server"></asp:literal>&nbsp;/ <asp:literal id="howMany" runat="server"></asp:literal><BR>RFund&nbsp;/ 
      RFundAC&nbsp;&nbsp;<asp:literal id="RFund" runat="server"></asp:literal>&nbsp;/ <asp:literal id="RFundAC" runat="server"></asp:literal><BR>point / pointAC&nbsp;<asp:literal id="point" runat="server"></asp:literal>&nbsp;/ <asp:literal id="pointAC" runat="server"></asp:literal><BR>&nbsp;unpaid&nbsp; <asp:literal id="unpaid" runat="server"></asp:literal><BR>unpaidAC <asp:literal id="unpaidAC" runat="server"></asp:literal><BR>joinDT <asp:literal id="joinDT" runat="server"></asp:literal><BR>modifyDT <asp:literal id="modifyDT" runat="server"></asp:literal><FONT 
      face="굴림"><BR></FONT>leaveDT&nbsp;<asp:literal id="leaveDT" runat="server"></asp:literal><BR><FONT 
      face="굴림">IPaddress&nbsp;</FONT><asp:literal id="IPaddress" runat="server"></asp:literal><FONT face="굴림"><BR></FONT>recentLogin 
      <asp:literal id="recentLogin" runat="server"></asp:literal></P>
      <P><FONT face="굴림"></FONT><FONT face="굴림"></FONT><FONT face="굴림"></FONT><FONT 
      face="굴림"></FONT><BR><BR>&nbsp;</P><FONT face="굴림"></FONT><FONT 
    face="굴림"></FONT></td></tr></table>
<table cellSpacing=0 cellPadding=0 width=700 border=0>
  <tr>
    <td align=center height=50>&nbsp; <asp:hyperlink id=hlList runat="server">목록</asp:hyperlink><FONT 
      face=굴림>&nbsp;</FONT><asp:hyperlink id=hlBack runat="server">뒤로</asp:hyperlink><FONT 
      face=굴림>&nbsp;</FONT><asp:imagebutton id=ibInsert runat="server"></asp:imagebutton><FONT 
      face=굴림>&nbsp;</FONT><asp:imagebutton id=ibUpdate runat="server"></asp:imagebutton></td></tr></table>
