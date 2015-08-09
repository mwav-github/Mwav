<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>

<!-- Header Start -->
	<!--#include File="../AdminHeader.asp"-->
<!-- Header End -->

<script language="JavaScript" src="<%= Application("SiteRoot") %>Include_js/CommonFunctions.js"></script>


<%
	'페이지 권한 체크
	if session("Level4") < 2 then Call goMsgPage("NoWay")

	'SelMode로 수정인지 새입력인지 확인
	SelMode =trim(Request.Form("SelMode"))
	MbrID =trim(Request("MbrID"))
	if SelMode = "" then Call goMsgPage("NoWay")
	if Len(MbrID) < 3 then Call ShowAlertMsg("회원아이디는 3자이상입니다.")

		'폼값 테스트
		For Each item IN Request.Form
			Response.Write(item)
			Response.Write(" = ")
			Response.Write("ReplaceTo(Request(""") & item & """), ""toDB"")"
			Response.Write(" --> " &Request.Form(item))
			Response.Write("<br>")
		Next

		'적당히 값을 DB에 맞게 수정하여 변수에 대입한다.
		MbrPW = ReplaceTo(Request("MbrPW"), "toDB")
		MbrName = ReplaceTo(Request("MbrName"), "toDB")
		phone = ReplaceTo(Request("phone"), "toDB")
		cellularP = ReplaceTo(Request("cellularP"), "toDB")
		MbrEmail = ReplaceTo(Request("MbrEmail"), "toDB")
		sex = ReplaceTo(Request("sex"), "toDB")
		AddrZip = ReplaceTo(Request("AddrZip"), "toDB")
		AddrCity = ReplaceTo(Request("AddrCity"), "toDB")
		AddrStt = ReplaceTo(Request("AddrStt"), "toDB")
		findingID = ReplaceTo(Request("findingID"), "toDB")
		findingA	 = ReplaceTo(Request("findingA"), "toDB")

		SSN1 = ReplaceTo(Request("SSN1"), "toDB")
		SSN2 = ReplaceTo(Request("SSN2"), "toDB")
		birthSL = ReplaceTo(Request("birthSL"), "toDB")
		birthDate = ReplaceTo(Request("birthDate"), "toDB")
		wedSL = ReplaceTo(Request("wedSL"), "toDB")
		wedDate = ReplaceTo(Request("wedDate"), "toDB")
		buyable = ReplaceTo(Request("vBuyableItems"), "toDB")
		hobbies = ReplaceTo(Request("hobbies"), "toDB")
		homepage = ReplaceTo(Request("homepage"), "toDB")
		mark = ReplaceTo(Request("mark"), "toDB")
		rcmderID = ReplaceTo(Request("rcmderID"), "toDB")
		mailing = ReplaceTo(Request("mailing"), "toDB")

		level4 = ReplaceTo(Request("level4"), "toDB")

		'직무
		company = ReplaceTo(Request("company"), "toDB")
		DeptName = ReplaceTo(Request("DeptName"), "toDB")
		MbrClass = ReplaceTo(Request("MbrClass"), "toDB")
		jobID = ReplaceTo(Request("jobID"), "toDB")
		officeP = ReplaceTo(Request("officeP"), "toDB")
		faxNbr = ReplaceTo(Request("faxNbr"), "toDB")
		officeZip = ReplaceTo(Request("officeZip"), "toDB")
		officeCity = ReplaceTo(Request("officeCity"), "toDB")
		officeStt = ReplaceTo(Request("officeStt"), "toDB")
		salaryID = ReplaceTo(Request("salaryID"), "toDB")

		'변수 재매핑
		buyable = Replace(buyable, ", ", "&nbsp;")
          if mailing <> "1" then mailing = 0

		if rcmderID <> "" then
	          puv = PickUpValue("vMember1", "rcmderID", "rcmderID= '" & rcmderID & "'")
	          if puv = "NoPickUp" then Call ShowAlertMsg("추천인 아이디가 존재하지 않습니다.")
		end if

	if SelMode = "i" then		'데이터입력

		if PickUpValue("vMember", "MbrID", "MbrID = '" & MbrID & "'") <> "NoPickUp" then Call ShowAlertMsg("동일한 아이디가 존재합니다.")

		'서버관련 변수
		IPaddress = Request.Servervariables("REMOTE_ADDR")

		'회원등록
		SQL = "INSERT INTO vMember(MbrID,MbrPW,MbrName,phone,cellularP,MbrEmail,sex,AddrZip,AddrCity,AddrStt,findingID,findingA) VALUES"
		SQL = SQL &"('" & MbrID & "'"
		SQL = SQL &",'" & MbrPW & "'"
		SQL = SQL &",'" & MbrName & "'"
		SQL = SQL &",'" & phone & "'"
		SQL = SQL &",'" & cellularP & "'"
		SQL = SQL &",'" & MbrEmail & "'"
		SQL = SQL &",'" & sex & "'"
		SQL = SQL &",'" & AddrZip & "'"
		SQL = SQL &",'" & AddrCity & "'"
		SQL = SQL &",'" & AddrStt & "'"
		SQL = SQL &"," & findingID
		SQL = SQL &",'" & findingA & "')"
		dbConn.Execute SQL

		SQL = "INSERT INTO vMember1(MbrID,SSN1,SSN2,birthSL,birthDate,wedSL,wedDate,buyable,hobbies,homepage,mark,avataImage,rcmderID,mailing) VALUES"
		SQL = SQL &"('" & MbrID & "'"
		SQL = SQL &",'" & SSN1 & "'"
		SQL = SQL &",'" & SSN2 & "'"
		SQL = SQL &",'" & birthSL & "'"
		SQL = SQL &",'" & birthDate & "'"
		SQL = SQL &",'" & wedSL & "'"
		SQL = SQL &",'" & wedDate & "'"
		SQL = SQL &",'" & buyable & "'"
		SQL = SQL &",'" & hobbies & "'"
		SQL = SQL &",'" & homepage & "'"
		SQL = SQL &",'" & mark & "'"
		SQL = SQL &",'" & avataImage & "'"
		SQL = SQL &",'" & rcmderID & "'"
		SQL = SQL &"," & mailing & ")"
		dbConn.Execute SQL

		SQL = "INSERT INTO vMbrHiddenValue(MbrID,level4,HowMuch,HowMany,RFund,RFundAC,unpaid,unpaidAC,joinDT,IPaddress) VALUES"
		SQL = SQL &"('" & MbrID & "'"
		SQL = SQL &"," & level4
		SQL = SQL &",0"
		SQL = SQL &",0"
		SQL = SQL &",0"
		SQL = SQL &",0"
		SQL = SQL &",0"
		SQL = SQL &",0"
		SQL = SQL &",getdate()"
		SQL = SQL &",'" & IPaddress & "')"
		dbConn.Execute SQL

		alertMsg = "새로운 회원을 맞이하였습니다."
	elseif SelMode = "u" then	'데이터 수정

		'회원DB입력
		SQL = "UPDATE [vMember] SET MbrPW  = '" & MbrPW  & "'"
		SQL = SQL & ", MbrName = '" & MbrName & "'"
		SQL = SQL & ", phone = '" & phone & "'"
		SQL = SQL & ", cellularP = '" & cellularP & "'"
		SQL = SQL & ", MbrEmail = '" & MbrEmail & "'"
		SQL = SQL & ", sex = '" & sex & "'"
		SQL = SQL & ", AddrZip = '" & AddrZip & "'"
		SQL = SQL & ", AddrCity = '" & AddrCity & "'"
		SQL = SQL & ", AddrStt = '" & AddrStt & "'"
		SQL = SQL & ", findingID = " & findingID
		SQL = SQL & ", findingA = '" & findingA & "'"
		SQL = SQL & " where MbrID = '" & MbrID & "'"
		dbConn.Execute SQL

		SQL = "UPDATE [vMember1] SET SSN1  = '" & SSN1  & "'"
		SQL = SQL & ", SSN2= '" & SSN2 & "'"
		SQL = SQL & ", birthSL = '" & birthSL & "'"
		SQL = SQL & ", birthDate = '" & birthDate & "'"
		SQL = SQL & ", wedSL = '" & wedSL & "'"
		SQL = SQL & ", wedDate = '" & wedDate & "'"
		SQL = SQL & ", buyable = '" & buyable & "'"
		SQL = SQL & ", hobbies = '" & hobbies & "'"
		SQL = SQL & ", homepage = '" & homepage & "'"
		SQL = SQL & ", mark = '" & mark & "'"
		SQL = SQL & ", rcmderID = '" & rcmderID & "'"
		SQL = SQL & ", mailing = "& mailing
		SQL = SQL & " where MbrID = '" & MbrID & "'"
		dbConn.Execute SQL

		if (session("Level4") >= 3) then
			SQL = "UPDATE [vMbrHiddenValue] SET "
			SQL = SQL & " level4 = " & level4
			SQL = SQL & " where MbrID = '" & MbrID & "'"
			dbConn.Execute SQL
		end if

		alertMsg = "회원데이터가 수정되었습니다"

	else
		Call goMsgPage("NoWay")
	end if


	'업데이트, 인서트와 상관없이 작동 시켜야 함.
	puv = PickUpValue("vMemberJob", "MbrID", "MbrID= '" & MbrID & "'")
	if puv = "NoPickUp" then
		SQL = "INSERT INTO vMemberJob(MbrID,company,DeptName,MbrClass,jobID,officeP,faxNbr,officeZip,officeCity,officeStt,salaryID) VALUES"
		SQL = SQL &"('" & MbrID & "'"
		SQL = SQL &",'" & company & "'"
		SQL = SQL &",'" & DeptName & "'"
		SQL = SQL &",'" & MbrClass & "'"
		SQL = SQL &",'" & jobID & "'"
		SQL = SQL &",'" & officeP & "'"
		SQL = SQL &",'" & faxNbr & "'"
		SQL = SQL &",'" & officeZip & "'"
		SQL = SQL &",'" & officeCity & "'"
		SQL = SQL &",'" & officeStt & "'"
		SQL = SQL &"," & salaryID & ")"
		dbConn.Execute SQL
	else
		SQL = "UPDATE [vMemberJob] SET company = '" & company & "'"
		SQL = SQL & ", DeptName= '" & DeptName & "'"
		SQL = SQL & ", MbrClass= '" & MbrClass & "'"
		SQL = SQL & ", jobID = " & jobID
		SQL = SQL & ", officeP = '" & officeP & "'"
		SQL = SQL & ", faxNbr = '" & faxNbr & "'"
		SQL = SQL & ", officeZip = '" & officeZip & "'"
		SQL = SQL & ", officeCity = '" & officeCity & "'"
		SQL = SQL & ", officeStt = '" & officeStt & "'"
		SQL = SQL & ", salaryID = " & salaryID
		SQL = SQL & " where MbrID = '" & MbrID & "'"
		dbConn.Execute SQL
	end if

	Call GotoThePage(alertMsg, "MbrList.asp?refl=600")

%>

<%
    ' The Transacted Script Commit Handler.  This sub-routine
    ' will be called if the transacted script commits.
    Sub OnTransactionCommit()
		Response.Write "<P><B>업데이트가 성공적으로 이루어졌습니다</B>."
    End Sub


    ' The Transacted Script Abort Handler.  This sub-routine
    ' will be called if the script transacted aborts
    Sub OnTransactionAbort()
    		Call goMsgPage("DBerr")
		'Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>

<!-- Footer Start -->
	<!--#include File="../AdminFooter.asp"-->
<!-- Footer End -->
