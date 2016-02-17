<!-- Header Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- Header End -->
<%
	'페이지 권한 체크
	if Session("sLevel4") < 2 then Call goMsgPage("NoWay")

	SelMode =trim(Request("SelMode")) '2가지 모드 view와 Update후에 confirm
	MbrID =trim(Request("MbrID"))
	if MbrID = "" then Call ShowAlertMsg("아이디를 입력하세요")

	if SelMode = "c" then
		topMsg = "아래와 같이 등록되었습니다."

	elseif SelMode = "v" then
		topMsg = MbrID + "님에 대한 정보입니다."

		SQL = "SELECT * FROM vMemberValues "
		SQL = SQL + " WHERE MbrID='" & MbrID & "'"
		RSresult = OpenRS(rs,SQL,1)
		'Response.Write("RSresult=" + RSresult)
													'set rs = db.Execute(sql)
		if RSresult = "Empty" then
			Call ShowAlertMsg("해당사용자는 없습니다.")
		else
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
			Call CloseRS(rs)

			if IsNumeric(SSN1) then
				if CInt(Left(SSN1, 2)) <= 99 then
					age = Year(now) - CInt(19&Left(SSN1, 2)) + 1
				else
					age = Year(now) - CInt(20&Left(SSN1, 2)) + 1
				end if
			else
				age = "?"
			end if
			if birthDate <> "" then birthDay = birthDate & " (" & birthSL & ")"
			if wedDate <> "" then weddingDay = wedDate & " (" & wedSL & ")"


		end if	'if RSresult = "Empty" then



		'vMemberJob을 갖아온다.
		SQL = "SELECT * FROM vMemberJob "
		SQL = SQL + "WHERE MbrID='" & MbrID & "'"
		RSresult = OpenRS(rs,SQL,1)
		if RSresult = "Empty" then
		elseif RSresult = "NotEmpty" then
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

			'변수매핑
			if jobID <> "" then
				jobName = PickUpValue("vJobs", "jobName", "jobID = " & jobID )
			end if

			if SalaryID <> "" then
				Salary = PickUpValue("vSalary", "sRange", "SalaryID = " & SalaryID )
			else
				Salary = "-"
			end if

			Call CloseRS(rs)
		else
			Call goMsgPage("DBerr")
		end if



	else
		Call goMsgPage("NoCFG")
	end if 			'if SelMode = "c" then
%>
<base href="<%= Application("SiteURLDir") %>Admin/Members/" target="_self">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>

      <div id="Layer1" style="position:absolute; left:519px; top:110px; width:156px; height:94px; z-index:1; overflow: auto;"><% if avataImage <> "" then %><img src="<%= avataImage %>"><% end if %></div>
      <table width="750" border="0" cellspacing="0" cellpadding="0">
        <form name="StfJoin" method="post"  action="">
          <tr>
            <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="600" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td colspan="4"> <% Call TopMsgHtml(topMsg,120) %> </td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">아이디</td>
                        <td colspan="3"><%= MbrID %> <input name="MbrID" type="hidden" id="MbrID" value="<%= MbrID %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">이름</td>
                        <td colspan="3"><%= MbrName %> <input name="MbrName" type="hidden" id="MbrName" value="<%= MbrName %>">
                          (<%= sex %>:<%= age %>) </td>
                      </tr>
                      <tr>
                        <td width="120" height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">전화번호</td>
                        <td colspan="3"><%= phone %> <input name="phone" type="hidden" id="StaffID9" value="<%= phone %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">핸드폰</td>
                        <td colspan="3"><%= cellularP %> <input name="cellularP" type="hidden" id="cellularP" value="<%= cellularP %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">메일</td>
                        <td colspan="3"><%= MbrEmail %> <input name="MbrEmail" type="hidden" id="MbrEmail" value="<%= MbrEmail %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">우편번호</td>
                        <td colspan="3"><%= AddrZip %> <input name="AddrZip" type="hidden" id="AddrZip" value="<%= AddrZip %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">주소</td>
                        <td colspan="3"><%= AddrCity %> <input name="AddrCity" type="hidden" id="AddrCity" value="<%= AddrCity %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">상세주소</td>
                        <td colspan="3"><%= AddrStt %> <input name="AddrStt" type="hidden" id="StaffID14" value="<%= AddrStt %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr>
                        <td bgcolor="#F7FFF0">생년월일</td>
                        <td><%= birthDay %> <input name="birthDay" type="hidden" id="birthDay" value="<%= birthDay %>"></td>
                        <td width="120" bgcolor="#F7FFF0">결혼기념일</td>
                        <td><%= weddingDay %> <input name="weddingDay" type="hidden" id="weddingDay" value="<%= weddingDay %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">마켓팅제품</td>
                        <td colspan="3"><%= buyable %> </td>
                      </tr>
                      <tr>
                        <td bgcolor="#F7FFF0">취미</td>
                        <td colspan="3"><%= hobbies %> <input name="Hobbies" type="hidden" id="Hobbies" value="<%= Hobbies %>"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">홈페이지</td>
                        <td>http://<%= homepage %> <input name="homepage" type="hidden" id="StaffID11" value="<%= homepage %>"></td>
                        <td width="120" bgcolor="#F7FFF0">메일링신청</td>
                        <td><%= mailing %> <input name="mailing" type="hidden" id="mailing" value="<%= mailing %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">하고싶은 말</td>
                        <td colspan="3"><%= mark %> <input name="mark" type="hidden" id="StaffID16" value="<%= mark %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">&nbsp;</td>
                        <td colspan="3">&nbsp; </td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">찾기질의</td>
                        <td colspan="3"><%= PickUpValue("vFindingUserInfo", "Question", "findingID = " & findingID ) %></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">찾기답</td>
                        <td colspan="3"><%= findingA %> <input name="findingA" type="hidden" id="findingA" value="<%= findingA %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">가입일</td>
                        <td><%= joinDT %> <input name="joinDT" type="hidden" id="StaffID15" value="<%= joinDT %>"></td>
                        <td width="120" bgcolor="#F7FFF0">추천아이디</td>
                        <td><%= rcmderID %> <input name="rcmderID" type="hidden" id="rcmderID2" value="<%= rcmderID %>"></td>
                      </tr>
                      <% if company <> "" then %>
                      <tr bgcolor="#E0FFC1">
                        <td height="20">&nbsp;</td>
                        <td colspan="3" bgcolor="#E0FFC1">직장정보</td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">회사명</td>
                        <td colspan="3"><%= company %> <input name="company" type="hidden" id="company" value="<%= company %>"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#F7FFF0">부서/직위</td>
                        <td colspan="3"> <%= DeptName %> <input name="DeptName" type="hidden" id="DeptName" value="<%= DeptName %>">
                          / <%= MbrClass %> <input name="MbrClass" type="hidden" id="MbrClass" value="<%= MbrClass %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">업무</td>
                        <td colspan="3"><%= jobName %> <input name="jobName" type="hidden" id="jobName" value="<%= jobName %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">전화번호</td>
                        <td><%= officeP %> <input name="officeP" type="hidden" id="officeP" value="<%= officeP %>"></td>
                        <td width="120" height="20" bgcolor="#F7FFF0">팩스번호</td>
                        <td><%= faxNbr %> <input name="faxNbr" type="hidden" id="faxNbr2" value="<%= faxNbr %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">우편번호</td>
                        <td colspan="3"><%= officeZip %> <input name="officeZip" type="hidden" id="officeZip" value="<%= officeZip %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">주소</td>
                        <td colspan="3"><%= officeCity %> <input name="officeCity" type="hidden" id="officeCity" value="<%= officeCity %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">상세주소</td>
                        <td colspan="3"><%= officeStt %> <input name="officeStt" type="hidden" id="officeStt" value="<%= officeStt %>"></td>
                      </tr>
                      <tr>
                        <td height="20" bgcolor="#F7FFF0">월급</td>
                        <td colspan="3"><%= Salary %> (단위:만원)</td>
                      </tr>
                      <% end if %>
                      <!--  여기가 직장 정보 끝 -->
                      <% if Session("sLevel4") >= 2 then %>
                      <tr>
                        <td height="100" bgcolor="#E0FFC1">주위상기항목</td>
                        <td colspan="3"><table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0">
                              <th width="33%">비밀번호</th>
                              <th width="33%">회원등급</th>
                              <th width="33%">주민번호</th>
                            </tr>
                            <tr align="center">
                              <td height="30"><%= MbrPW %> <input name="MbrPW" type="hidden" id="MbrPW" value="<%= MbrPW %>"></td>
                              <td><%= level4 %> <input name="level4" type="hidden" id="level4" value="<%= level4 %>">
                                (0~4)</td>
                              <td><%= SSN1 %> <input name="SSN1" type="hidden" id="SSN1" value="<%= SSN1 %>">
                                -<%= SSN2 %> <input name="SSN2" type="hidden" id="SSN2" value="<%= SSN2 %>"></td>
                            </tr>
                          </table>
                          <table width="100%" border="0" cellspacing="2" cellpadding="1">
                            <tr bgcolor="#F7FFF0">
                              <th width="33%">구입총액/횟수</th>
                              <th width="33%">현/누적적립금</th>
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
                              <td height="30"><%= recentLogin %> <input name="recentLogin" type="hidden" id="recentLogin" value="<%= recentLogin %>"></td>
                              <td><%= IPaddress %> <input name="IPaddress" type="hidden" id="IPaddress" value="<%= IPaddress %>"></td>
                              <td><%= missYouDT %> <input name="missYouDT" type="hidden" id="missYouDT" value="<%= missYouDT %>"></td>
                            </tr>
                          </table></td>
                      </tr>
                      <% end if %>
                      <tr>
                        <td bgcolor="#F7FFF0">&nbsp;</td>
                        <td height="120" colspan="3"> <% if SelMode = "c" then %> <input type="button" name="Button2" value="가입확인" onClick="history.back();">
                          <% elseif SelMode = "v" then %> <input type="button" name="Button" value="확인" onClick="history.back();">
                          <% end if %> <% if Session("sLevel4")>2 then %> <input name="btnUpdate" type="button" id="btnUpdate" onClick="JavaScript:location.href='MbrInput.asp?MbrID=<%= MbrID %>&SelMode=u'" value="수정">
                          <% end if %> <% if Session("sLevel4")>3 then %> <input name="btnDelete" type="button" id="btnDelete" onClick="JavaScript:SubmitJ('정보를 영구히 삭제합니까?', this.form, 'MbrDeleteMember_ok.asp?MbrID=<%= MbrID %>')" value="삭제확인">
                          <% end if %> </td>
                      </tr>
                    </table></td>
                </tr>
              </table>

            </td>
          </tr>
        </form>
      </table>
      <!-- Footer Start -->
      <!--#include File="../AdminFooter.asp"-->
<!-- Footer End -->
