<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더
%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->



<%

	dim bNbr,mode,form_pin,MbrID,replyGrp,reSame,reID,updatesql,sql2,mem_auth,reply_ok
	dim fName,filename2,filename3,filename4,fs,po_write,po_comment

	page = Request.QueryString("page")
	mode = Request.QueryString("mode")


	dim cart_num	'대량삭제

	if mode="del_cart" and Request.Form("cart")="" then Response.Redirect "inc/error.asp?no=3"
	if mode="del_cart" then
		if CInt(Session("sLevel4")) < 2 then Response.Redirect "inc/error.asp?no=4"
		cart_num = Request.Form("cart").count
	else
		cart_num = 1
	end if

	i=1
	Do until i > cart_num

	if mode="del_cart" then
		bNbr = Request.Form("cart")(i)

		SQL="SELECT userPW FROM "&bBodyTable&" where bNbr="&bNbr
		Set rs = dbConn.Execute(SQL)

		form_pin = rs(0)
	else
		bNbr = Request.QueryString("bNbr")

		if Session("MbrID") <> "" and Request.QueryString("mem") = "ok" then
			SQL="SELECT MbrID,userPW FROM "&bBodyTable&" where bNbr="&bNbr
			Set rs = dbConn.Execute(SQL)

			if Session("MbrID") <> rs(0) and CInt(Session("sLevel4")) > 1 then
				Response.Redirect "inc/error.asp?no=4"
			end if
			form_pin = rs(1)
		else
			form_pin = Request.Form("form_pin")
		end if
	end if



	'게시물 내용 가져오기.
	''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	selectedFields = "MbrID,replyGrp,reSame,reID"
	whereClause = "bNbr=" & bNbr
	if (CInt(Session("sLevel4")) < 2) then
		whereClause = whereClause & " and userPW='" & form_pin & "'"
	end if
	orderBy = ""
	RSresult = SelectSimpleRecord(rs, selectedFields, bBodyTable, whereClause, orderBy)
	''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	if RSresult = "NotEmpty" then
		MbrID = rs("MbrID")
		replyGrp = rs("replyGrp")
		reSame = rs("reSame")
		reID = rs("reID")
	else
		Response.Redirect "inc/error.asp?no=2" 'if rs.eof or rs.bof then
	end if	'if RSresult = "NotEmpty" then


	'등록글 삭제시 관련파일제거
	SQL = "Select fName From " & bFilesTable & " Where bNbr=" & bNbr
	SQL = SQL & " Order by fOrder "
	RSresult = OpenSimpleRS(fRS,SQL)
	if RSresult <> "Empty" then
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
		Do until fRS.EOF
			fName = fRS("fName")
			If fName <> "" Then
				fName = Server.MapPath("FileData")&"\"&bID&"\"& fName
				fs.DeleteFile(fName)
			End If
		    	fRS.Movenext
	    		'fNum = fNum + 1
  		Loop
  		set fs = Nothing
  		Call CloseRS(fRS)
  		'해당파일관련 테이블레코드 삭제
  		Call DeleteRecord(bFilesTable, "bNbr = " & bNbr)
	end if	'if RSresult <> "Empty" then




	SQL="SELECT * FROM "&bBodyTable&" where replyGrp="&replyGrp&" and reSame > "&reSame&" and reID > "&reID
	Set rs = dbConn.Execute(SQL)

	if not rs.EOF then '현재 지우려는 글에 답변글이 있을경우..

		SQL="SELECT * FROM "&bBodyTable&" where replyGrp="&replyGrp&" and reSame > "&reSame&" and reID = "&reID+1
		Set rs=dbConn.Execute(SQL)

		if not rs.EOF then
			dim del_name
			if Session("MbrID")="admin" then
				del_name="관리자"
			else
				del_name="작성자"
			end if

			UPDATESQL = "UPDATE "&bBodyTable&" set userPW = ''"
			UPDATESQL = UPDATESQL & ", userEmail = ''"
			UPDATESQL = UPDATESQL & ", homepage = ''"
			UPDATESQL = UPDATESQL & ", bTitle = '" & del_name & "에 의해 글이 삭제되었습니다.'"
			UPDATESQL = UPDATESQL & ", link1 = ''"
			UPDATESQL = UPDATESQL & ", link2 = ''"
			UPDATESQL = UPDATESQL & ", bContent = '이 글은 "&del_name&"에 의해 글이 삭제되었습니다." & vbCrLf & "아래에 답변글이 있었기 때문에 완전삭제가 되지 않았음을 알려드립니다." & vbCrLf & vbCrLf & "'"
			UPDATESQL = UPDATESQL & " where bNbr =  " & bNbr
			dbConn.Execute UPDATESQL
			reply_ok=1
		end if

	else 	'현재 지우려는 글에 답변글이 없을경우..
		reply_ok=0

		'해당게시물과 관련된 커멘트테이블레코드 삭제
		Call DeleteRecord(bCmtTable, "bNbr = " & bNbr)

		UPDATESQL = "Update " & bBodyTable & " Set reID = reID-1 where  replyGrp = " & replyGrp & " and reID > " & reID
		dbConn.Execute UPDATESQL

		SQL2 = "DELETE FROM " & bBodyTable & " where bNbr ="&bNbr
		dbConn.Execute SQL2
	end if


	'멤버 삭제시 포인트 삭감
	'if mem_auth > 0 then
	'	sql = "select po_write,po_comment from member where MbrID='"&MbrID&"'"
	'	Set rs= dbConn.Execute(SQL)
     '
	'	po_write=rs(0)
	'	po_comment=rs(1)
     '
	'	if reply_ok <> 1 and po_write > 0 then
	'		SQL = "Update member set po_write=po_write-1,point=point-10 where MbrID='"&MbrID&"'"
	'		db.execute SQL
	'	end if
	'end if

	'	dim j,com_count,com_name,rs2
	'	sql = "select count(com_num) from inno_comment where com_num=" & bNbr
	'	Set rs= dbConn.Execute(SQL)
     '
	'	com_count=rs(0)
     '
     '
	'	j=1
	'	Do until j > com_count
     '
	'	SQL2 = "SELECT com_mem_id FROM inno_comment where com_num=" & bNbr &" and com_id="&j
	'		Set rs2= dbConn.Execute(sql2)
	'		if rs2(0) <> "" and po_comment > 0 then
	'			SQL = "Update member set po_comment=po_comment-1,point=point-5 where MbrID='"&rs2(0)&"'"
	'			db.execute SQL
	'		end if
	'		j=j+1
	'	loop

		'해당게시물과 관련된 커멘트테이블레코드 삭제
		Call DeleteRecord(bCmtTable, "bNbr = " & bNbr)

		i=i+1
	loop

	Call CloseRS(Rs)

	Response.Redirect "bList.asp?bID="&bID
%>