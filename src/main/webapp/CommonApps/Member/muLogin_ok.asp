<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<%
	MbrID = trim(request("MbrID"))
	MbrPW = trim(request("MbrPW"))
	GotoURL = trim(request("GotoURL"))
	if Len(MbrID) < 3 Or Len(MbrPW) < 4 then Call ShowAlertMsg("아이디와 패스워드를 확인하세요")

	SQL = "select MbrID,MbrPW,MbrName,MbrEmail FROM vMember "
	SQL = SQL & " WHERE MbrID='" & MbrID & "'"
	RSresult = OpenRS(logRS,SQL,1)

	if RSresult = "Empty" then
		Call ShowAlertMsg("등록되지 않은 아이디입니다.")
	else

		if Trim(logRS("MbrPW")) <> Trim(request("MbrPW")) then
			Call ShowAlertMsg("- 비밀번호가 일치하지 않습니다.\n  확인 후 다시 시도해 주십시요")
  		else

			'MbrHiddenValue 가져오기
			SQL = "select level4,joinDT,recentLogin,missYouDT FROM vMbrHiddenValue "
			SQL = SQL & " where MbrID='" & MbrID & "'"
			'SQL = SQL & " and missYouDT not is null "
			RSresult = OpenRS(valRS,SQL,1)

			if RSresult = "Empty" then Call ShowAlertMsg("사이트개발사에 연락하세요.")
			if valRS("missYouDT") <> "" then Call ShowAlertMsg(Left(valRS("missYouDT"),12) & "일에 탈퇴하셨습니다.")

			'회원레벨 레이블링
			level4 = valRS("level4")

			Select Case level4
			 Case 0
				'levelLabel = "불량회원"
				Call ShowAlertMsg("회원보류로 처리되었습니다.")
			 Case 1
				levelLabel = "정회원"
			 Case 2
				levelLabel = "우수회원"
			 Case 3
				levelLabel = "최우수회원"
			 Case 4
				levelLabel = "주주"
			 Case 5
				levelLabel = "대주주"
			 Case Else
				Call ShowAlertMsg("누구십니까?")
			End Select



			session("MbrID") = trim(logRS("MbrID"))
			session("MbrName") = trim(logRS("MbrName"))
			session("MbrEmail") = trim(logRS("MbrEmail"))
			Call CloseRS(logRS)
			session("levelLabel") = levelLabel
			session("joinDT") = trim(valRS("joinDT"))
			session("recentLogin") = trim(valRS("recentLogin"))
			Call CloseRS(valRS)
			'접속IP 및 최근시간 갱신
			Call updateIPDT("vMbrHiddenValue", "IPaddress", "recentLogin", "MbrID = '" & session("MbrID") & "'")

			'쿠키를 사용해야 세션이 끝겨도 접속했던 아이디를 확인 가능하다.
			Response.Cookies("MbrID") = session("MbrID")

			'어디로 보낼것인가?
			if GotoURL <> "" then
				Response.redirect(GotoURL)
			else
				Response.redirect Application("SiteRoot")
			end if
	     end if

	end if
%>

<%
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp")
	Call CloseDB()
%>

