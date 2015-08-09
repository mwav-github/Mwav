<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더

%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->



<%
	dim bNbr,userPW,mode
	bNbr = Request.Form("bNbr")
	page = Request.Form("page")
	mode = Request.Form("mode")

	if Session("MbrID") <> "" then
		userPW = PickUpValue("vMember", "MbrID", "MbrID = '" & Session("MbrID") & "'")
	else
		userPW = Request.Form("userPW")
		if Trim(userPW)="" then	Response.Redirect "inc/error.asp?no=11"
	end if	'if Session("MbrID") <> "" then


%>
<script LANGUAGE="VBScript" RUNAT="Server">

Function CheckWord(CheckValue)
	CheckValue = replace(CheckValue, "&" , "&amp;")
	CheckValue = replace(CheckValue, "<", "&lt;")
	CheckValue = replace(CheckValue, ">", "&gt;")
	CheckValue = replace(CheckValue, "'", "''")
	CheckWord=CheckValue
End Function

</script>

<%
	dim userName,bTitle,userEmail,homepage,secretPW,link1,link2,IPaddress,notice,tag,secret,replyEmail,writeday,filename1,filesize1,filename2,filesize2,filename3,filesize3,filename4,filesize4,mem_auth

	userName = ReplaceTo(request("userName"), "toDB")

	bTitle = ReplaceTo(request("bTitle"), "toDB")
	if bTitle = "" then bTitle = "제목이 없습니다."

	userEmail = ReplaceTo(request("userEmail"), "toDB")


	homepage = Trim(request("homepage"))
	if left(homepage,7) = "http://" then
		homepage = mid(homepage,8)
	end if

	link1 = Trim(request("link1"))
	if left(link1,7) = "http://" then
		link1 = mid(link1,8)
	end if
	link2 = Trim(request("link2"))
	if left(link2,7) = "http://" then
		link2 = mid(link2,8)
	end if

	bContent = checkword(request("bContent"))

	IPaddress = request.ServerVariables("REMOTE_HOST")

	'notice = request("notice")



	if mode <> "edit" then
		if notice = 1 then
			'공지사항
			'SQL="SELECT MAX(bNbr) FROM "& bBodyTable &" where bNbr > 100000000"
			'Set rs = dbConn.Execute(SQL)
               '
			'if IsNULL(rs(0)) then
			'	bNbr = 100000001
			'else
			'	bNbr = rs(0)+1
			'end if
		else
			SQL="SELECT MAX(bNbr) FROM "& bBodyTable &" where bNbr < 100000000"
			Set rs = dbConn.Execute(SQL)

			if IsNULL(rs(0)) then
				bNbr = 1
			else
				bNbr = rs(0)+1
			end if

		end if
		Call CloseRS(Rs)
	end if

	tag = request("tag")
	secret = request("secret")
	if secret = 1 then
		secretPW = request("secretPW")
	elseif secret = 2 then
		secretPW = userPW
	end if

	replyEmail = request("replyEmail")

	'if left(now,2) = "20" then
	'	writeday = mid(now,3)
	'else
	'	writeday = now
	'end if

	'filename1=""
	'filesize1=""
	'filename2=""
	'filesize2=""
	'filename3=""
	'filesize3=""
	'filename4=""
	'filesize4=""
	'i_w1 = 0
	'i_h1 = 0
	'i_w2 = 0
	'i_h2 = 0
	'i_w3 = 0
	'i_h3 = 0
	'i_w4 = 0
	'i_h4 = 0





	'답변처리부분
  	dim o_email,o_title,replyGrp,reSame,reID,reID2,newreid,newreSame

  	if mode = "reply" then

		SQL = "SELECT userEmail,bTitle,replyGrp,reSame,reID,replyEmail FROM "&bBodyTable&" where bNbr="&Request.Form("bNbr")
		Set rs = dbConn.Execute(SQL)

		o_email = rs("userEmail")
		o_title = rs("bTitle")
		replyGrp = rs("replyGrp")
	    	reSame = rs("reSame")
	    	reID = rs("reID")
	    	replyEmail = rs("replyEmail")

		SQL = "SELECT * FROM "&bBodyTable&" where replyGrp="& replyGrp &" and reID>"& reID &" and reSame <= "& reSame &" order by reID"
		Set rs = dbConn.Execute(SQL)

		if rs.BOF or rs.EOF then
			SQL = "SELECT * FROM "&bBodyTable&" where replyGrp="& replyGrp &" and reID > "& reID &" and reSame > "& reSame &" order by reID DESC"
		else
			reID2 = rs("reID")

			SQL = "SELECT * FROM "&bBodyTable&" where replyGrp="& replyGrp &" and reID > "& reID &" and reID< " & reID2 & " and reSame > " & reSame & " order by reID DESC"
	    	end if

		Set rs = dbConn.Execute(SQL)

		if not (rs.BOF or rs.EOF) then
			reID= rs("reID")
	    	end if

	    	SQL="UPDATE "&bBodyTable&" SET reID = reID + 1 where replyGrp = "& replyGrp & " and reID > " & reID
		dbConn.Execute(SQL)

		newreid = reID + 1
		newreSame = reSame + 1

		if replyEmail = "True" then
			call reply_email()
		end if

	else

		replyGrp = bNbr
		newreSame = 0
		newreid = 0

	end if


	'답변처리부분 끝
	call process_write()


	if Request.Form("sw") <> "" then
		Response.Redirect "bList.asp?bID="&bID&"&page="&page&"&st="&Request.Form("st")&"&sc="&Request.Form("sc")&"&sn="&Request.Form("sn")&"&sw="&Request.Form("sw")
	else
		Response.Redirect "bList.asp?bID="&bID&"&page="&page
	end if
%>