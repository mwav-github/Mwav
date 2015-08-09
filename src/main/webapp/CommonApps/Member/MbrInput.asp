<!-- Header Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- Header End -->
<%
	'페이지 권한 체크
	if session("level4") < 3 then Call goMsgPage("NoWay")

	'아이디의 유무로 수정인지 새입력인지 확인
	SelMode =trim(Request.QueryString("SelMode"))
	MbrID =trim(Request.QueryString("MbrID"))

	if SelMode = "i" then
		TopMsg = "새 회원을 등록하세요."
		submitMSG = "새로운 회원으로 등록하시겠습니까?"
		
		MbrPW = "1234567"
		mailing = "True"
		level4 = 1
		

	elseif SelMode = "u" then
		TopMsg =  MbrID & "에 대한 변경사항을 입력하세요."
		submitMSG = "변경사항을 적용 하시겠습니까?"

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
	end if 		'if SelMode = "i" then

%>

<base href="<%= Application("SiteURLDir") %>Admin/Members/" target="_self">
<script language="Javascript" src="<%= Application("SiteURLDir") %>Include_js/Function.js"></script>

<table width="750" border="0" cellspacing="0" cellpadding="0">
<form name="MbrJoin" method="post">
<input name="SelMode" type="hidden" id="SelMode" value="<%= SelMode %>">
  <tr>
    <td align="center">
<table width="600" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><table width="600" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td colspan="4"> <% Call TopMsgHtml(topMsg,120) %> </td>
                      </tr>
                      <tr> 
                        <td width="120" height="20" bgcolor="#F7FFF0">아이디</td>
                        <td colspan="3"> <% if MbrID = "" then %> <input name="MbrID" type="text" id="MbrID" value="<%= MbrID %>" size="12" maxlength="12" style="ime-mode:inactive"> 
                          &nbsp;&nbsp; <input type="button" name="btnMbrID" value="중복확인" onClick="NewWindow('../../CommonAccessories/IDSeek/IDSeek.asp', MbrJoin.MbrID, 418, 300);"> 
                          <% else Response.Write(MbrID) %> <input name="MbrID" type="hidden" id="MbrID3" value="<%= MbrID %>"> 
                          <% end if %> </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">이름</td>
                        <td colspan="3"><input name="MbrName" type="text" id="MbrName" value="<%= MbrName %>" size="16" maxlength="16" style="ime-mode:active">
                          ( <select name="sex" id="sex">
                            <option value="남" <%= WriteSelected(sex, "남") %>>남</option>
                            <option value="여" <%= WriteSelected(sex, "여") %>>여</option>
                          </select>:<%= age %>) </td>
                      </tr>
                      <tr> 
                        <td width="120" height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">전화번호</td>
                        <td colspan="3"><input name="phone" type="text" id="phone" value="<%= phone %>" size="18" maxlength="18">
                          ex) 02-6214-7039 </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">핸드폰</td>
                        <td colspan="3"><input name="cellularP" type="text" id="cellularP" value="<%= cellularP %>" size="18" maxlength="18">
                          ex) 017-311-7039 </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">메일</td>
                        <td colspan="3"><input name="MbrEmail" type="text" id="MbrEmail" value="<%= MbrEmail %>" size="20" maxlength="50"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">우편번호</td>
                        <td colspan="3"><a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.AddrZip, 426, 400);"> 
                          <input name="AddrZip" type="text" id="AddrZip" style="CURSOR: default;" value="<%= AddrZip %>" size="7" maxlength="7" readonly>
                          <img src="../../CommonAccessories/PostSeek/Images/search1.gif" width="24" height="24" border=0> 
                          </a></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">주소</td>
                        <td colspan="3"><input name="AddrCity" type="text" id="AddrCity" value="<%= AddrCity %>" size="50" maxlength="50"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">상세주소</td>
                        <td colspan="3"><input name="AddrStt" type="text" id="AddrStt" value="<%= AddrStt %>" size="20" maxlength="20" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">생년월일</td>
                        <td> <input name="birthDate" type="text" id="birthDate" value="<%= birthDate %>" size="10" maxlength="10">
                          <select name="birthSL" id="birthSL">
                            <option value="양" <%= WriteSelected(birthSL, "양") %>>양력</option>
                            <option value="음" <%= WriteSelected(birthSL, "음") %>>음력</option>
                          </select></td>
                        <td width="120" bgcolor="#F7FFF0">결혼기념일</td>
                        <td><input name="wedDate" type="text" id="wedDate" value="<%= wedDate %>" size="10" maxlength="10">
                          <select name="wedSL" id="wedSL">
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
                        <td colspan="3"> 
                          <input name="hobbies" type="text" id="hobbies" value="<%= hobbies %>" size="50" maxlength="70"></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">홈페이지</td>
                        <td colspan="3">http:// 
                          <input name="homepage" type="text" id="homepage" value="<%= homepage %>" size="40" maxlength="50" style="ime-mode:inactive"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">메일링신청</td>
                        <td colspan="3"> 
                          <input name="mailing" type="checkbox" id="mailing" value="1" <%= WriteRadioChecked(mailing, "True") %>>
                          신청 </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">하고싶은 말</td>
                        <td colspan="3"><textarea name="mark" cols="70" rows="10" wrap="hard" id="textarea" style="ime-mode:active"><%= mark %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">찾기질의</td>
                        <td colspan="3"> 
                          <select name="findingID" id="findingID">
                            <% Call SelectOption("vFindingUserInfo", "findingID", findingID) %>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">찾기답</td>
                        <td colspan="3"> 
                          <input name="findingA" type="text" id="findingA" value="<%= findingA %>" size="20" maxlength="20" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">가입일</td>
                        <td><%= joinDT %> </td>
                        <td width="120" bgcolor="#F7FFF0">추천아이디</td>
                        <td> 
                          <input name="rcmderID" type="text" id="rcmderID" value="<%= rcmderID%>" size="12" maxlength="12" style="ime-mode:inactive"></td>
                      </tr>
                      <% if SelMode = "i" or company <> "" then %>
                      <tr bgcolor="#E0FFC1"> 
                        <td height="20">&nbsp;</td>
                        <td colspan="3" bgcolor="#E0FFC1">직장정보</td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">회사명</td>
                        <td colspan="3"> 
                          <input name="company" type="text" id="company" value="<%= company %>" size="20" maxlength="20" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#F7FFF0">부서/직위</td>
                        <td colspan="3"> 
                          <input name="DeptName" type="text" id="company3" value="<%= DeptName %>" size="20" maxlength="20" style="ime-mode:active">
                          / 
                          <input name="MbrClass" type="text" id="MbrClass" value="<%= MbrClass %>" size="10" maxlength="10" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">업무(직종)</td>
                        <td colspan="3"> 
                          <select name="jobID" id="jobID">
                            <% Call SelectOption("vJobs", "jobID", jobID) %><%= jobID %>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">전화번호</td>
                        <td>
<input name="officeP" type="text" id="officeP" value="<%= officeP %>" size="18" maxlength="18"></td>
                        <td width="120" height="20" bgcolor="#F7FFF0">팩스번호</td>
                        <td>
<input name="faxNbr" type="text" id="faxNbr" value="<%= faxNbr %>" size="18" maxlength="18"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">우편번호</td>
                        <td colspan="3"> <a href="javascript:NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', MbrJoin.officeZip, 426, 400);"> 
                          <input name="officeZip" type="text" id="AddrZip3" style="CURSOR: default;" value="<%= officeZip %>" size="7" maxlength="7" readonly>
                          <img src="../../CommonAccessories/PostSeek/Images/search1.gif" width="24" height="24" border=0> 
                          </a></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">주소</td>
                        <td colspan="3"> 
                          <input name="officeCity" type="text" id="officeCity" value="<%= officeCity %>" size="50" maxlength="50"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">상세주소</td>
                        <td colspan="3"> 
                          <input name="officeStt" type="text" id="officeStt" value="<%= officeStt %>" size="20" maxlength="20" style="ime-mode:active"></td>
                      </tr>
                      <tr> 
                        <td height="20" bgcolor="#F7FFF0">월급</td>
                        <td colspan="3"> 
                          <select name="salaryID" id="salaryID">
                            <% Call SelectOption("vSalary", "salaryID", salaryID) %>
                          </select>
                          (단위:만원)<%= salaryID %></td>
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
                              <td height="30"><input name="MbrPW" type="text" id="MbrPW" value="<%= MbrPW %>" size="12" maxlength="12" style="ime-mode:inactive">
                              </td>
                              <td> 
                                <select name="level4" id="select">
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
                              <td>
<input name="SSN1" type="text" id="SSN1" value="<%= SSN1 %>" size="6" maxlength="6">-<input name="SSN2" type="text" id="SSN2" value="<%= SSN2 %>" size="7" maxlength="7">
                              </td>
                            </tr>
                          </table>
						  
						  
						  
			<% if SelMode = "u" then %>					  
                          <table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0"> 
                              <th width="33%">구입총액/횟수</th>
                              <th width="33%">현/누적포인트</th>
                              <th width="33%">현/누적미납액</th>
                            </tr>
                            <tr align="center"> 
                              <td height="30"><font face="돋움" size="2" color="#000000"><%= HowMuch %>/<%= HowMany %></font></td>
                              <td><font face="돋움" size="2" color="#000000"><%= RFund %>/<%= RFundAC %></font></td>
                              <td><font face="돋움" size="2" color="#000000"><%= unpaid %>/<%= unpaidAC %></font></td>
                            </tr>
                          </table>
                          <table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0"> 
                              <th width="33%">최근로그인</th>
                              <th width="33%">최근IP</th>
                              <th width="33%">탈퇴일</th>
                            </tr>
                            <tr align="center"> 
                              <td height="30"><%= recentLogin %> </td>
                              <td><%= IPaddress %> </td>
                              <td><%= missYouDT %> </td>
                            </tr>
                          </table>
				<% end if %>
						  </td>
                      </tr>
                      <% end if %>
                      <tr> 
                        <td bgcolor="#F7FFF0">&nbsp;</td>
                        <td height="120" colspan="3"> 
                          <% if SelMode = "i" then %>
                          <input name="Button" type="button" id="Button" onClick="SubmitJ('<%= submitMSG %>',this.form, 'MbrInput_ok.asp?SelMode=i');" value="새회원등록"> 
                          <% end if %>
                          <% if SelMode = "u" then %>
                          <input name="btnUpdate" type="button" id="btnUpdate" onClick="JavaScript:SubmitJ('정보를 수정합니까?', this.form, 'MbrInput_ok.asp?SelMode=u')" value="수정확인"> 
                          <% end if %>
                          <input type="button" name="Button" value="뒤로" onClick="history.back();"></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
  </tr>
</form>
</table>



<!-- Footer Start -->
	<!--#include File="../AdminFooter.asp"-->
<!-- Footer End -->
