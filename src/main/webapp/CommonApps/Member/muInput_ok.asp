<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- shopConfig Start -->
	<!--#include File = "../../Config/Config.asp" -->
<!-- shopConfig End -->

<!-- DB Connection -->
	<!--#include File = "../../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->

<!-- Function Start -->
<!--#include File= "../../Include_asp/CommonFunctions.asp"-->
<!--#include File="../../Include_asp/Functions.asp"-->
<!-- Function End -->
<%

	'sMode로 수정인지 새입력인지 확인
	sMode = trim(Request.Form("sMode"))
	'기본회원정보인지 추가회원정보인지 확인한다.
	MbrInfo = trim(Request.Form("MbrInfo"))
	if sMode = ""  Or MbrInfo = "" then Call ShowAlertMsg("당신이 정말 밉당.")

	if sMode = "i" then
		if MbrInfo = "basic" then 
			MbrID = trim(Request.Form("MbrID"))
			if Len(MbrID) < 4 Or Len(MbrID) > 15 then Call ShowAlertMsg("당신이 정말 밉당.")
			if PickUpValue("vMember", "MbrID", "MbrID = '" & MbrID & "'" ) <> "NoPickUp" then ShowAlertMsg("이미 등록되어 있는 아이디입니다.")
			MbrPW = trim(Request.Form("MbrPW"))
			MbrName = trim(Request.Form("MbrName"))
			phone = trim(Request.Form("HTEL1")) & "-" & trim(Request.Form("HTEL2")) & "-" & trim(Request.Form("HTEL3"))
			cellularP = trim(Request.Form("MTEL1")) & "-" & trim(Request.Form("MTEL2")) & "-" & trim(Request.Form("MTEL3"))
			MbrEmail = trim(Request.Form("MbrEmail"))
			sex = trim(Request.Form("sex"))
			AddrZip = trim(Request.Form("AddrZip"))
			AddrCity = trim(Request.Form("AddrCity"))
			AddrStt = trim(Request.Form("AddrStt"))
			findingID = trim(Request.Form("findingID"))
			'Question = trim(Request.Form("Question"))
			findingA = trim(Request.Form("findingA"))
			SSN1 = trim(Request.Form("SSN1"))
			SSN2 = trim(Request.Form("SSN2"))
			
			'vMbrHiddenValue
			mailing = trim(Request.Form("mailing"))
			if mailing <> "1" then mailing = "0"
			'서버관련 변수
			IPaddress = Request.Servervariables("REMOTE_ADDR")

			'DB에 해당사항 입력.
			SQL = "INSERT INTO vMember(MbrID,MbrPW,MbrName,phone,cellularP,MbrEmail,sex,AddrZip,AddrCity,AddrStt,findingID,findingA,SSN1,SSN2) "
			SQL = SQL & " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
			'dbConn.BeginTrans
			Set Cmd = Server.CreateObject("ADODB.Command")
			With Cmd
				.ActiveConnection = dbConn
				.CommandText = SQL
				.CommandType = adCmdText
				.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, MbrID)
				.Parameters.Append Cmd.CreateParameter("@MbrPW", adVarChar, adParamInput, 15, MbrPW)
				.Parameters.Append Cmd.CreateParameter("@MbrName", adVarChar, adParamInput, 8, MbrName)
				.Parameters.Append Cmd.CreateParameter("@phone", adVarChar, adParamInput, 22, phone)
				.Parameters.Append Cmd.CreateParameter("@cellularP", adVarChar, adParamInput, 22, cellularP)
				.Parameters.Append Cmd.CreateParameter("@MbrEmail", adVarChar, adParamInput, 50, MbrEmail)
				.Parameters.Append Cmd.CreateParameter("@sex", adVarChar, adParamInput, 2, sex)
				.Parameters.Append Cmd.CreateParameter("@AddrZip", adVarChar, adParamInput, 7, AddrZip)
				.Parameters.Append Cmd.CreateParameter("@AddrCity", adVarChar, adParamInput, 100, AddrCity)
				.Parameters.Append Cmd.CreateParameter("@AddrStt", adVarChar, adParamInput, 60, AddrStt)
				.Parameters.Append Cmd.CreateParameter("@findingID", adUnsignedTinyInt, adParamInput, 1, findingID)
				.Parameters.Append Cmd.CreateParameter("@findingA", adVarChar, adParamInput, 20, findingA)
				.Parameters.Append Cmd.CreateParameter("@SSN1", adChar, adParamInput, 6, SSN1)
				.Parameters.Append Cmd.CreateParameter("@SSN2", adChar, adParamInput, 7, SSN2)
				.Execute ,,adExecuteNoRecords
			end With
			Set Cmd = nothing
			'vMbrHiddenValue 값입력
			SQL = "INSERT INTO vMbrHiddenValue(MbrID,level4,mailing,IPaddress) VALUES"
			SQL = SQL &"('" & MbrID & "'"
			SQL = SQL &",1"
			SQL = SQL &"," & mailing
			SQL = SQL &",'" & IPaddress & "')"
			dbConn.Execute SQL
			'dbConn.CommitTrans
		'페이지 이동
		moveToUrl = "muView.asp?sMode=" & sMode & "&MbrID=" & MbrID

		else
			birthSL = trim(Request.Form("birthSL"))
			birthDate = trim(Request.Form("birthDate"))
			wedSL = trim(Request.Form("wedSL"))
			wedDate = trim(Request.Form("wedDate"))
			buyable = trim(Request.Form("buyable"))
			hobbies = trim(Request.Form("hobbies"))
			homepage = trim(Request.Form("homepage"))
			mark = trim(Request.Form("mark"))
			avataImage = trim(Request.Form("avataImage"))
			rcmderID = trim(Request.Form("rcmderID"))
			level4 = trim(Request.Form("level4"))
			HowMuch = trim(Request.Form("HowMuch"))
			HowMany = trim(Request.Form("HowMany"))
			RFund = trim(Request.Form("RFund"))
			RFundAC = trim(Request.Form("RFundAC"))
			unpaid = trim(Request.Form("unpaid"))
			unpaidAC = trim(Request.Form("unpaidAC"))
			joinDT = trim(Request.Form("joinDT"))
			recentLogin = trim(Request.Form("recentLogin"))
			missYouDT = trim(Request.Form("missYouDT"))
			IPaddress = trim(Request.Form("IPaddress"))
			'직업정보
			company = trim(Request.Form("company"))
			DeptName = trim(Request.Form("DeptName"))
			MbrClass = trim(Request.Form("MbrClass"))
			jobID = trim(Request.Form("jobID"))
			officeP = trim(Request.Form("officeP"))
			faxNbr = trim(Request.Form("faxNbr"))
			officeZip = trim(Request.Form("officeZip"))
			officeCity = trim(Request.Form("officeCity"))
			officeStt = trim(Request.Form("officeStt"))
			salaryID = trim(Request.Form("salaryID"))
		end if		'if MbrInfo = "basic" then 
	
	elseif sMode = "u" then
		if MbrInfo = "basic" then 
			'if Len(MbrID) < 4 Or Len(MbrID) > 15 then Call ShowAlertMsg("당신이 정말 밉당.")
			'if PickUpValue("vMember", "MbrID", "MbrID = '" & MbrID & "'" ) <> "NoPickUp" then ShowAlertMsg("이미 등록되어 있는 아이디입니다.")
			MbrID = trim(Request.Form("MbrID"))
			MbrPW = trim(Request.Form("MbrPW"))
			MbrName = trim(Request.Form("MbrName"))
			phone = trim(Request.Form("HTEL1")) & "-" & trim(Request.Form("HTEL2")) & "-" & trim(Request.Form("HTEL3"))
			cellularP = trim(Request.Form("MTEL1")) & "-" & trim(Request.Form("MTEL2")) & "-" & trim(Request.Form("MTEL3"))
			MbrEmail = trim(Request.Form("MbrEmail"))
			sex = trim(Request.Form("sex"))
			AddrZip = trim(Request.Form("AddrZip"))
			AddrCity = trim(Request.Form("AddrCity"))
			AddrStt = trim(Request.Form("AddrStt"))
			findingID = trim(Request.Form("findingID"))
			'Question = trim(Request.Form("Question"))
			findingA = trim(Request.Form("findingA"))
			SSN1 = trim(Request.Form("SSN1"))
			SSN2 = trim(Request.Form("SSN2"))
			
			'vMbrHiddenValue
			mailing = trim(Request.Form("mailing"))
			if mailing <> "1" then mailing = "0"
			'서버관련 변수
			IPaddress = Request.Servervariables("REMOTE_ADDR")

			'DB에 해당사항 입력.
			SQL = "UPDATE vMember Set MbrPW=?,MbrName=?,phone=?,cellularP=?,MbrEmail=?,sex=?,AddrZip=? "
			SQL = SQL & " ,AddrCity=?,AddrStt=?,findingID=?,findingA=?,SSN1=?,SSN2=? "
			SQL = SQL & " WHERE MbrID=? "
			'dbConn.BeginTrans
			Set Cmd = Server.CreateObject("ADODB.Command")
			With Cmd
				.ActiveConnection = dbConn
				.CommandText = SQL
				.CommandType = adCmdText
				.Parameters.Append Cmd.CreateParameter("@MbrPW", adVarChar, adParamInput, 15, MbrPW)
				.Parameters.Append Cmd.CreateParameter("@MbrName", adVarChar, adParamInput, 8, MbrName)
				.Parameters.Append Cmd.CreateParameter("@phone", adVarChar, adParamInput, 22, phone)
				.Parameters.Append Cmd.CreateParameter("@cellularP", adVarChar, adParamInput, 22, cellularP)
				.Parameters.Append Cmd.CreateParameter("@MbrEmail", adVarChar, adParamInput, 50, MbrEmail)
				.Parameters.Append Cmd.CreateParameter("@sex", adVarChar, adParamInput, 2, sex)
				.Parameters.Append Cmd.CreateParameter("@AddrZip", adVarChar, adParamInput, 7, AddrZip)
				.Parameters.Append Cmd.CreateParameter("@AddrCity", adVarChar, adParamInput, 100, AddrCity)
				.Parameters.Append Cmd.CreateParameter("@AddrStt", adVarChar, adParamInput, 60, AddrStt)
				.Parameters.Append Cmd.CreateParameter("@findingID", adUnsignedTinyInt, adParamInput, 1, findingID)
				.Parameters.Append Cmd.CreateParameter("@findingA", adVarChar, adParamInput, 20, findingA)
				.Parameters.Append Cmd.CreateParameter("@SSN1", adChar, adParamInput, 6, SSN1)
				.Parameters.Append Cmd.CreateParameter("@SSN2", adChar, adParamInput, 7, SSN2)
				.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, MbrID)			
				.Execute ,,adExecuteNoRecords
			end With
			Set Cmd = nothing
			'vMbrHiddenValue 값수정
			SQL = "UPDATE vMbrHiddenValue SET " 
			SQL = SQL & " mailing = " & mailing
			SQL = SQL & ", IPaddress = '" & IPaddress & "'"
			SQL = SQL & " WHERE MbrID = '" & MbrID & "'"
			dbConn.Execute SQL
			'dbConn.CommitTrans

		'페이지 이동
		moveToUrl = "muView.asp?sMode=" & sMode & "&MbrID=" & MbrID

		else


		end if		'if MbrInfo = "basic" then 

	end if 		'if sMode = "i" then


	Response.Redirect(moveToUrl)
Response.end


	
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
    	'Call goMsgPage("DBerr")
		Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>
