<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'약관동의 확인
	if Request.Form("agreement") <> "Y" then Call GotoThePage("약관에 동의하세요.", "muAgreement.asp")

	'아이디의 유무로 수정인지 새입력인지 확인
	sMode =trim(Request.Form("sMode"))
	if sMode = ""  then Call ShowAlertMsg("당신이 정말 밉당.")

	if sMode = "i" then
		TopMsg = "회원으로 가입합니다."
		'submitMSG = "새로운 회원으로 등록하시겠습니까?"
		
	elseif sMode = "u" then
		TopMsg =  MbrID & "에 대한 변경사항을 입력하세요."
		submitMSG = "변경사항을 적용 하시겠습니까?"

		MbrID =trim(Request.Form("MbrID"))
		if MbrID <> "" then
			SQL = "SELECT * FROM vMemberValues "
			SQL = SQL + " WHERE MbrID='" & MbrID & "'"
			RSresult = OpenRS(rs,SQL,1)
			'Response.Write("RSresult=" + RSresult)
			if RSresult = "Empty" then
				Call ShowAlertMsg("해당사용자는 없습니다.")
			end if
			'set rs = db.Execute(sql)
		else
			Call ShowAlertMsg("아이디를 입력하세요")
		end if

		MbrID = trim(rs("MbrID"))
		MbrPW = trim(rs("MbrPW"))
		MbrName = trim(rs("MbrName"))
		phone = trim(rs("phone"))
		cellularP = trim(rs("cellularP"))
		MbrEmail = trim(rs("MbrEmail"))
		sex = trim(rs("sex"))
		AddrZip = trim(rs("AddrZip"))
		AddrCity = trim(rs("AddrCity"))
		AddrStt = trim(rs("AddrStt"))
		findingID = trim(rs("findingID"))
		'Question = trim(rs("Question"))
		findingA = trim(rs("findingA"))
		SSN1 = trim(rs("SSN1"))
		SSN2 = trim(rs("SSN2"))
		birthSL = trim(rs("birthSL"))
		birthDate = trim(rs("birthDate"))
		wedSL = trim(rs("wedSL"))
		wedDate = trim(rs("wedDate"))
		buyable = trim(rs("buyable"))
		hobbies = trim(rs("hobbies"))
		homepage = trim(rs("homepage"))
		mark = trim(rs("mark"))
		avataImage = trim(rs("avataImage"))
		rcmderID = trim(rs("rcmderID"))
		mailing = trim(rs("mailing"))
		level4 = trim(rs("level4"))
		HowMuch = trim(rs("HowMuch"))
		HowMany = trim(rs("HowMany"))
		RFund = trim(rs("RFund"))
		RFundAC = trim(rs("RFundAC"))
		unpaid = trim(rs("unpaid"))
		unpaidAC = trim(rs("unpaidAC"))
		joinDT = trim(rs("joinDT"))
		recentLogin = trim(rs("recentLogin"))
		missYouDT = trim(rs("missYouDT"))
		IPaddress = trim(rs("IPaddress"))
		'직업정보
		company = trim(rs("company"))
		DeptName = trim(rs("DeptName"))
		MbrClass = trim(rs("MbrClass"))
		jobID = trim(rs("jobID"))
		officeP = trim(rs("officeP"))
		faxNbr = trim(rs("faxNbr"))
		officeZip = trim(rs("officeZip"))
		officeCity = trim(rs("officeCity"))
		officeStt = trim(rs("officeStt"))
		salaryID = trim(rs("salaryID"))
		Call CloseRS(rs)
		if SalaryID <> "" then
			Salary = PickUpValue("vSalary", "sRange", "SalaryID = " & SalaryID )
		else
			Salary = "-"
		end if
	


		if IsNumeric(SSN1) then
			if CInt(Left(SSN1, 2)) <= 99 then
				age = Year(now) - CInt(19&Left(SSN1, 2)) + 1
			else
				age = Year(now) - CInt(20&Left(SSN1, 2)) + 1
			end if
		else
			age = "?"
		end if
	end if 		'if sMode = "i" then

%>
<html>
<head>
<title>[<%= Request.Cookies("siteTitle") %>] - 회원가입</title>
<meta name="keywords" content="캠코더 카메라 메모리">
<meta name="description" content="최고의 캠코더 전문사이트">
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
<meta http-equiv="refresh" content="<%= refl %>">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>" target="_self">
<link href="Include_css/Style.css" rel="stylesheet" type="text/css">
<link href="Include_css/Object.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="Include_js/Function.js"></script>
</head>
<body> 
<table width="800" border="0" cellspacing="0" cellpadding="0"> 
  <tr> 
    <td> <!-- FrontHeader Start --> 
      <!--#include File = "../../SiteHeader/FrontHeader.asp" --> 
      <!-- FrontHeader End --> </td> 
  </tr> 
  <tr> 
    <td><table width="800" border="0" cellspacing="0" cellpadding="0"> 
        <tr> 
          <td> <base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 
		  <!-- FrontHeader Start --> 
            <img src="Images/JoinDisplay.gif" width="800" height="125">
			 <!-- FrontHeader End --> </td> 
        </tr> 
        <tr> 
          <td> 
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 		  
	<!-- MemberUserDisplay Start --> 
	        <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="170"><img src="Images/JoinNametag.gif" width="171" height="31"></td>
                <td><%
						secondLevel =" > 회원가입"
					%>
                    <!-- LocationBar Start -->
                    <!--#include File = "../../ShopComponents/LocationBar/LocationBar.asp" -->
                    <!-- LocationBar End -->
                </td>
              </tr>
            </table>
	        <!-- MemberUserDisplay End --> </td> 
        </tr> 
        <tr> 
          <td height="300" align="center"> 
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self"> 	
<script language="JavaScript" src="mu_inc.js"></script>
<SCRIPT language=JavaScript>
<!--
function whereToGo(flag) {  		 
	if( flag == "IDSeek") {
		if (CheckID(document.frmMbr.MbrID, 4, 15, '회원아이디')) {
			NewWindow('../../CommonAccessories/IDSeek/IDSeek.asp',  document.frmMbr, frmMbr.MbrID, 418, 300);
			return;  		 
		}
	} 
	if( flag == "zipCode") {
		NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', document.frmMbr, frmMbr.AddrZip, 426, 400);
		return;  		 
	}
	return;
} 
 
-->
</SCRIPT>
<table width="750" border="0" cellspacing="0" cellpadding="0">
<form method="post" name="frmMbr" onSubmit="return SubmitMbr(this)" action="muInput_ok.asp">
<input name="sMode" type="hidden" id="sMode" value="<%= sMode %>">
                <tr> 
                  <td align="center"> <table width="100%" border="0" cellpadding="1" cellspacing="0">
                      <tr> 
                        <td height="25" colspan="4">
                          <input name="sMode" type="hidden" id="sMode" value="<%= sMode %>">                        
                        <input name="MbrInfo" type="hidden" id="MbrInfo" value="basic"> </td>
                      </tr>
                      <tr> 
                        <td height="50" colspan="4"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"><img src="Images/muBasicInfo.gif" width="114" height="18" align="absmiddle"> 
                          | <img src="Images/muBasicStar.gif" width="12" height="12"> 
                          <font size="1">표시는 필수입력 항목입니다. 회원가입을 위해 반드시 기입해 주십시오. 
                          </font></td>
                      </tr>
                      <!--  여기가 직장 정보 끝 -->
                      <% if session("level4") >= 2 then %>
                      <% end if %>
                    </table>
                    <table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="#dfdfdf">
                      <tr> 
                        <td> 
                          <table width="100%" border="0" cellpadding="1" cellspacing="1">
                            <tr> 
                              <th width="120" height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">아이디<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td width="260" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"> 
                                <input name="MbrID" type="text" id="MbrID" size="15" maxlength="15"> 
                                <a href="javascript:whereToGo('IDSeek');"><img src="Images/IdentifyID.gif" alt="중복아이디찾기" border="0" align="absmiddle"></a> 
                              </td>
                              <th width="120" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">이름(성별)<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td width="200" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="MbrName" type="text" id="MbrName" size="8" maxlength="8" style="ime-mode:active"> 
                                <img src="../../Images/TransparentImage.gif" width="10" height="10">( 
                                <select name="sex" id="sex">
                                  <option value="남" <%= WriteSelected(sex, "남") %>>남</option>
                                  <option value="여" <%= WriteSelected(sex, "여") %>>여</option>
                                </select>
                                ) </td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">일반전화번호<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <INPUT name=HTEL1 
                              class=form30 size=4 maxlength="4">
                                - 
                                <INPUT name=HTEL2 
                              class=form30 size=4 maxlength="4">
                                - 
                                <INPUT name=HTEL3 
                              class=form30 size=4 maxlength="4"> </td>
                              <th align="left" bgcolor="#f2f2f2"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">핸드폰</th>
                              <td bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <INPUT name=MTEL1 
                              class=form30 size=4 maxlength="4">
                                - 
                                <INPUT name=MTEL2 
                              class=form30 size=4 maxlength="4">
                                - 
                                <INPUT 
                        name=MTEL3 
                              class=form30 size=4 maxlength="4"></td>
                            </tr>
                            <tr> 
                              <th rowspan="3" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">자택주소<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td height="30" colspan="3" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"> 
                                <input name="AddrZip" type="text" id="AddrZip" style="CURSOR: default;" value="<%= AddrZip %>" size="7" maxlength="7" readonly> 
                                <a href="javascript:whereToGo('zipCode');"> <img src="Images/muPostSeek.gif" alt="우편번호찾기" width="94" height="19" border=0 align="absmiddle" usemap="#zipCode"> 
                                </a> </td>
                            </tr>
                            <tr> 
                              <td height="30" colspan="3" bgcolor="#FFFFFF"><a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.AddrZip, 426, 400);"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"></a> 
                                <input name="AddrCity" type="text" id="AddrCity" value="<%= AddrCity %>" size="50" maxlength="50" readonly></td>
                            </tr>
                            <tr> 
                              <td height="30" colspan="3" bgcolor="#FFFFFF"><a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.AddrZip, 426, 400);"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"></a> 
                                <input name="AddrStt" type="text" id="AddrStt" value="<%= AddrStt %>" size="20" maxlength="20" style="ime-mode:active"></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">비밀번호<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="MbrPW" type="text" id="MbrPW3" size="12" maxlength="12" style="ime-mode:inactive"> 
                              </td>
                              <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">확인재입력<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="MbrPW1" type="text" id="MbrPW4" size="12" maxlength="12" style="ime-mode:inactive"></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">비밀번호힌트<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <select name="findingID" id="findingID">
                                  <% Call SelectOption("vFindingUserInfo", "findingID", findingID) %>
                                </select></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">비밀번호답변<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="findingA" type="text" id="findingA4" value="<%= findingA %>" size="20" maxlength="20" style="ime-mode:active"></td>
                              <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">메일링수신<IMG height=12 
                        src="Images/muBasicStar.gif" width=12></th>
                              <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                신청 
                                <input name="mailing" type="checkbox" id="mailing23" value="1" checked <%= WriteRadioChecked(mailing, "True") %>></td>
                            </tr>
                            <tr> 
                              <th height="70" rowspan="2" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">이메일주소<IMG height=12 
                        src="Images/muBasicStar.gif" width=12> </th>
                              <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <INPUT name="MbrEmail" type=hidden id="MbrEmail"> 
                                <INPUT name="MbrEmail1" size=25 maxlength="50" onblur="mailAddr(this.form);">
                                @ 
                                <SELECT name="MbrEmail2" onchange="mailAddr(this.form);">
                                  <OPTION value="" selected>선택하세요</OPTION>
                                  <OPTION value=etc>직접입력</OPTION>
                                  <OPTION value=dreamwiz.com>dreamwiz.com</OPTION>
                                  <OPTION value=empal.com>empal.com</OPTION>
                                  <OPTION value=hanmail.net>hanmail.net</OPTION>
                                  <OPTION value=hanmir.com>hanmir.com</OPTION>
                                  <OPTION value=hanafos.com>hanafos.com</OPTION>
                                  <OPTION value=hotmail.com>hotmail.com</OPTION>
                                  <OPTION value=lycos.co.kr>lycos.co.kr</OPTION>
                                  <OPTION value=nate.com>nate.com</OPTION>
                                  <OPTION value=naver.com>naver.com</OPTION>
                                  <OPTION value=netian.com>netian.com</OPTION>
                                  <OPTION value=yahoo.co.kr>yahoo.co.kr</OPTION>
                                </SELECT> <SPAN class=text>(본인의 정확한 이메일) </SPAN> 
                                <input type=hidden name=INPARKEML></td>
                            </tr>
                            <tr> 
                              <td colspan="3" bgcolor="#FFFFFF"><SPAN class=text><img src="../../Images/TransparentImage.gif" width="10" height="10">새로운 
                                이메일 계정은 아래의 사이트에서 만들 수 있습니다.<BR>
                                <img src="../../Images/TransparentImage.gif" width="10" height="10"><A 
                        href="http://id.naver.com/newid/register/inputNameSocno.php" 
                        target=_blank>네이버</A> / <A 
                        href="http://member.nate.com/sccustomer/join/nate/index.jsp" 
                        target=_blank>네이트</A> / <A 
                        href="http://www.dreamwiz.com/re/agreement.html" 
                        target=_blank>드림위즈</A> / <A 
                        href="http://mail.yahoo.co.kr/" target=_blank>야후</A> / 
                                <A 
                        href="http://login.empas.com/join/join_agr.html?es=http://empal.empas.com" 
                        target=_blank>엠파스</A> </SPAN></td>
                            </tr>
                            <tr> 
                              <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">주민등록번호</th>
                              <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"> 
                                <input name="SSN1" type="text" id="SSN1" value="<%= SSN1 %>" size="6" maxlength="6">
                                - 
                                <input name="SSN2" type="text" id="SSN2" value="<%= SSN2 %>" size="7" maxlength="7">
                                (본인의 주민등록번호나 외국인등록번호 기입)</td>
                            </tr>
                            <!--  여기가 직장 정보 끝 -->
                          </table></td>
                </tr>
              </table>
			<TABLE height=120 cellSpacing=0 cellPadding=10 width="100%" border=0>
			<TR> 
			  <TD width="50%" align="right">
			  <INPUT name="image" type=image src="Images/muJoin.gif" width=76 height=19>
			  </TD>
			  <TD width="50%">
			  <A href="javascript:history.back();"><IMG src="Images/mu_cancel.gif" width=110 border=0></A>
			  </TD>
			</TR>
		</TABLE>
                    <p> 
                      <% if sMode = "i" then %>
                      <input name="btnMbrJoin" type="button" id="btnMbrJoin" onClick="SubmitJ('<%= submitMSG %>',this.form, 'MbrInput_ok.asp?sMode=i');" value="회원가입">
                      <% end if %>
                      <% if sMode = "u" then %>
                      <input name="btnUpdate" type="button" id="btnUpdate" onClick="JavaScript:SubmitJ('정보를 수정합니까?', this.form, 'MbrInput_ok.asp?sMode=u')" value="수정확인">
                      <% end if %>
                      <input type="button" name="Button" value="뒤로" onClick="history.back();">
                    </p>
                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">생년월일</td>
                        <td> <input name="birthDate" type="text" id="birthDate2" value="<%= birthDate %>" size="10" maxlength="10"> 
                          <select name="birthSL" id="select3">
                            <option value="양" <%= WriteSelected(birthSL, "양") %>>양력</option>
                            <option value="음" <%= WriteSelected(birthSL, "음") %>>음력</option>
                          </select></td>
                        <td bgcolor="#F7FFF0">결혼기념일</td>
                        <td><input name="wedDate" type="text" id="wedDate2" value="<%= wedDate %>" size="10" maxlength="10"> 
                          <select name="wedSL" id="select4">
                            <option value="양" <%= WriteSelected(wedSL, "양") %>>양력</option>
                            <option value="음" <%= WriteSelected(wedSL, "음") %>>음력</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">마켓팅제품</td>
                        <td colspan="3"> 
                          <% Call CheckDetailOption("vBuyableItems", "bwText", "bwText", "bIDX", Split(buyable,"&nbsp;")) %>
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">취미</td>
                        <td colspan="3"> <input name="hobbies" type="text" id="hobbies2" value="<%= hobbies %>" size="50" maxlength="70"></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">홈페이지</td>
                        <td colspan="3">http:// 
                          <input name="homepage" type="text" id="homepage2" value="<%= homepage %>" size="40" maxlength="50" style="ime-mode:inactive"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">메일링신청</td>
                        <td colspan="3"> <input name="mailing" type="checkbox" id="mailing3" value="1" <%= WriteRadioChecked(mailing, "True") %>>
                          신청 </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">하고싶은 말</td>
                        <td colspan="3"><textarea name="mark" cols="70" rows="5" wrap="hard" id="textarea2" style="ime-mode:active"><%= mark %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">찾기질의</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">찾기답</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">가입일</td>
                        <td> <%= joinDT %> </td>
                        <td bgcolor="#F7FFF0">추천아이디</td>
                        <td> <input name="rcmderID" type="text" id="rcmderID2" value="<%= rcmderID%>" size="12" maxlength="12" style="ime-mode:inactive"></td>
                      </tr>
                      <% if sMode = "i" or company <> "" then %>
                      <tr bgcolor="#E0FFC1"> 
                        <td height="20">&nbsp;</td>
                        <td colspan="3" bgcolor="#E0FFC1">직장정보</td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">회사명</td>
                        <td colspan="3"> <input name="company" type="text" id="company2" value="<%= company %>" size="20" maxlength="20" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">부서/직위</td>
                        <td colspan="3"> <input name="DeptName" type="text" id="DeptName" value="<%= DeptName %>" size="20" maxlength="20" style="ime-mode:active">
                          / 
                          <input name="MbrClass" type="text" id="MbrClass2" value="<%= MbrClass %>" size="10" maxlength="10" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">업무(직종)</td>
                        <td colspan="3"> <select name="jobID" id="select5">
                            <% Call SelectOption("vJobs", "jobID", jobID) %>
                            <%= jobID %> </select></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">전화번호</td>
                        <td> <input name="officeP" type="text" id="officeP2" value="<%= officeP %>" size="18" maxlength="18"></td>
                        <td height="20" bgcolor="#F7FFF0">팩스번호</td>
                        <td> <input name="faxNbr" type="text" id="faxNbr2" value="<%= faxNbr %>" size="18" maxlength="18"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">우편번호</td>
                        <td colspan="3"> <a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.officeZip, 426, 400);"> 
                          <input name="officeZip" type="text" id="officeZip" style="CURSOR: default;" value="<%= officeZip %>" size="7" maxlength="7" readonly>
                          <img src="../../CommonAccessories/PostSeek/Images/search1.gif" width="24" height="24" border=0> 
                          </a></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">주소</td>
                        <td colspan="3"> <input name="officeCity" type="text" id="officeCity2" value="<%= officeCity %>" size="50" maxlength="50"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">상세주소</td>
                        <td colspan="3"> <input name="officeStt" type="text" id="officeStt2" value="<%= officeStt %>" size="20" maxlength="20" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">월급</td>
                        <td colspan="3"> <select name="salaryID" id="select6">
                            <% Call SelectOption("vSalary", "salaryID", salaryID) %>
                          </select>
                          (단위:만원) <%= salaryID %> </td>
                      </tr>
                      <% end if %>
                      <!--  여기가 직장 정보 끝 -->
                      <% if session("level4") >= 2 then %>
                      <tr> 
                        <td height="100" bgcolor="#E0FFC1">주위상기항목</td>
                        <td colspan="3" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0"> 
                              <th width="33%">비밀번호</th>
                              <th width="33%">회원등급</th>
                              <th width="33%">주민번호</th>
                            </tr>
                            <tr align="center"> 
                              <td height="30">&nbsp; </td>
                              <td> <select name="level4" id="select7">
                                  <option value="0" <%= WriteSelected(Cint(level4), 0) %>>0</option>
                                  <option value="1" <%= WriteSelected(Cint(level4), 1) %>>1</option>
                                  <option value="2" <%= WriteSelected(Cint(level4), 2) %>>2</option>
                                  <option value="3" <%= WriteSelected(Cint(level4), 3) %>>3</option>
                                  <option value="4" <%= WriteSelected(Cint(level4), 4) %>>4</option>
                                  <% if session("level4") >= 5 then %>
                                  <option value="5" <%= WriteSelected(Cint(level4), 5) %>>5</option>
                                  <% end if %>
                                </select>
                                (0~4)</td>
                              <td> <input name="SSN1" type="text" id="SSN12" value="<%= SSN1 %>" size="6" maxlength="6">
                                - 
                                <input name="SSN2" type="text" id="SSN22" value="<%= SSN2 %>" size="7" maxlength="7"> 
                              </td>
                            </tr>
                          </table>
                          <% if sMode = "u" then %>
                          <table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0"> 
                              <th width="33%">구입총액/횟수</th>
                              <th width="33%">현/누적포인트</th>
                              <th width="33%">현/누적미납액</th>
                            </tr>
                            <tr align="center"> 
                              <td height="30"><font face="돋움" size="2" color="#000000"> 
                                <%= HowMuch %> / <%= HowMany %> </font></td>
                              <td><font face="돋움" size="2" color="#000000"> <%= RFund %> 
                                / <%= RFundAC %> </font></td>
                              <td><font face="돋움" size="2" color="#000000"> <%= unpaid %> 
                                / <%= unpaidAC %> </font></td>
                            </tr>
                          </table>
                          <table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0"> 
                              <th width="33%">최근로그인</th>
                              <th width="33%">최근IP</th>
                              <th width="33%">탈퇴일</th>
                            </tr>
                            <tr align="center"> 
                              <td height="30"> <%= recentLogin %> </td>
                              <td> <%= IPaddress %> </td>
                              <td> <%= missYouDT %> </td>
                            </tr>
                          </table>
                          <% end if %>
                        </td>
                      </tr>
                      <% end if %>
                    </table></td>
  </tr>
</form>
</table>




          </td>
        </tr> 
        <tr> 
          <td width="100" valign="top"> </td> 
        </tr> 
        <tr> 
          <td> <!-- FrontFooter Start --> 
            <!--#include File = "../../SiteFooter/FrontFooter.asp" -->            
            <!-- FrontFooter End --> </td> 
        </tr> 
      </table></td> 
  </tr> 
</table> 
</body>
</html>
