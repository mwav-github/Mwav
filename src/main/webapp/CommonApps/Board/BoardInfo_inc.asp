<%
	dim bID,bName,bDesc,bType,bBottom,pagesize,block,use_tag,use_Amail,use_mail,use_rcmd,use_comment,use_Anti,view_ip,bEnable,newPostings,relPostings,l_level,r_level,w_level,cw_level,nw_level,rw_level
	dim uploadType,upFormCnt,maxsize,previewImage,preplay_multi,progressBar
	dim bTitleName,bWidth,titleLength,bgcolor,tb_bgcolor,tr_chcolor,np_img,np_bgcolor

	dim admin_name,SQL,bRS,starttime

	if Session("level4")="" then Session("level4") = -1 '비회원처리

	'관리자 아이디 입력부분
	admin_name="admin"


	'테이블정의 아이디
	if bID="" then bID = Request("bID")
	if bID <> "" then
		'테이블정보 가져오기
		SQL = "Select * From vBoardInfo Where bID='" & bID & "'"
		RSresult = Fn_OpenSimpleRS(bRS,SQL)

		if RSresult <> "Empty" then
			'베이스
			bID = Trim(bRS("bID"))
			bName = Trim(bRS("bName"))
			bDesc = Trim(bRS("bDesc"))
			bType = Trim(bRS("bType"))
			pagesize = Trim(bRS("pagesize"))
			block = Trim(bRS("block"))
			use_tag = Trim(bRS("use_tag"))
			use_Amail = Trim(bRS("use_Amail"))
			use_mail = Trim(bRS("use_mail"))
			use_rcmd = Trim(bRS("use_rcmd"))
			use_comment = Trim(bRS("use_comment"))
			use_Anti = Trim(bRS("use_Anti"))
			view_ip = Trim(bRS("view_ip"))
			bEnable = Trim(bRS("bEnable"))
			newPostings = Trim(bRS("newPostings"))
			relPostings = Trim(bRS("relPostings"))
			l_level = Trim(bRS("l_level"))
			r_level = Trim(bRS("r_level"))
			w_level = Trim(bRS("w_level"))
			cw_level = Trim(bRS("cw_level"))
			nw_level = Trim(bRS("nw_level"))
			rw_level = Trim(bRS("rw_level"))
			'파일
			uploadType = Trim(bRS("uploadType"))
			upFormCnt = Trim(bRS("upFormCnt"))
			maxsize = Trim(bRS("maxsize"))
			viewImage = Trim(bRS("viewImage"))
			playMultimedia = Trim(bRS("playMultimedia"))
			progressBar = Trim(bRS("progressBar"))
			'스타일
			bAlign = Trim(bRS("bAlign"))
			bTopFilePath = Trim(bRS("bTopFilePath"))
			bTop1FilePath = Trim(bRS("bTop1FilePath"))
			bTop2FilePath = Trim(bRS("bTop2FilePath"))
			bBottomFilePath = Trim(bRS("bBottomFilePath"))
			bLeftFilePath = Trim(bRS("bLeftFilePath"))
			bRightFilePath = Trim(bRS("bRightFilePath"))
			bTitleName = Trim(bRS("bTitleName"))
			bWidth = Trim(bRS("bWidth"))
			titleLength = Trim(bRS("titleLength"))
			bgcolor = Trim(bRS("bgcolor"))
			bigTB_img = Trim(bRS("bigTB_img"))
			tb_bgcolor = Trim(bRS("tb_bgcolor"))
			tr_chcolor = Trim(bRS("tr_chcolor"))
			np_bgcolor = Trim(bRS("np_bgcolor"))
			bBottomMsg = Trim(bRS("bBottomMsg"))

			Call CloseRS(bRS)
			'해당 테이블 이름
			bCmtTable = "vB_" & bID & "_Cmt"
			bBodyTable = "vB_" & bID
			bFilesTable = "vB_" & bID & "_files"
		else
			Call Sub_ShowAlertMsg("게시판ID가 존재하지 않습니다.")
		end if
	else
		Call Sub_ShowAlertMsg("게시판ID가 존재하지 않습니다.")
		'Response.Redirect "list_error.asp"
	end if

	Set Rs = Server.CreateObject("ADODB.Recordset")
%>