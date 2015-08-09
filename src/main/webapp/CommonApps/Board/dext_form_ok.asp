<%@ TRANSACTION="Required" LANGUAGE="VBScript" CODEPAGE="949" %>
<!-- Config Start -->
	<!--#include File = "../../Config/Config.asp" -->
<!-- Config End -->

<!-- DB Connection -->
	<!--#include File = "../../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->

<!-- Function Start -->
<!--#include File= "../../Include_asp/CommonFunctions.asp"-->
<!--#include File="../../Include_asp/Functions.asp"-->
<!-- Function End -->

<%
	'On Error Resume Next

	dim uploadform,bNbr,userPW,mode
	dim allfile,allfile1,allfile2,allfile3,allfile4,test
	dim userName,bTitle,userEmail,homepage,secretPW,link1,link2,IPaddress,notice,tagHTML,secret,replyEmail,writeday
	dim filesize1,filesize_ok,fs,strname,strext,strext_1,strfilename1,aname1,filename1,oldfilename1
	dim filesize2,strfilename2,aname2,filename2,oldfilename2
	dim filesize3,strfilename3,aname3,filename3,oldfilename3
	dim filesize4,strfilename4,aname4,filename4,oldfilename4
	dim i_width1,i_height1,i_width2,i_height2,i_width3,i_height3,i_width4,i_height4

	'DefaultPath로 지정된 곳은 EveryOne 읽기, 쓰기, 수정 권한이 있어야 합니다.
	'그러나 DEXTUpload 객체 생성후 DefaultPath를 지정 해주지 않으시면 C:\ 를 참조 하게 됩니다.
	'C:\에 EveryOne 권한을 주시거나 또는 DefaultPath를 지정 해주시고 그곳에 권한을 주시면 됩니다.
	Set uploadform = Server.CreateObject("DEXT.FileUpload")
	'uploadform.DefaultPath = "C:\"
	bID = uploadform.form("bID")
%>

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->

<%
	if maxsize <> "" then
		maxsize = maxsize * 1024000		'이쪽 루틴(M단위로 변환)
	else
		maxsize = 2 * 1024000	'디폴트가 2M
	end if	'if maxsize <> "" then


	uploadform.DefaultPath = Server.MapPath("FileData")&"\"&bID&"\"
	uploadform.UploadTimeout = 3600

	bNbr = uploadform("bNbr")
	page = uploadform("page")
	mode = uploadform("mode")

	if Session("MbrID") <> "" then
		userPW = PickUpValue("vMember", "MbrID", "MbrID = '" & Session("MbrID") & "'")
	else
		userPW = uploadform("userPW")
		if Trim(userPW)="" then	Call ShowAlertMsg("비밀번호를 공백으로 채우시면 안됩니다.")		'Response.Redirect "inc/error.asp?no=11"
	end if	'if Session("MbrID") <> "" then

	'set allfile1 = uploadform("allfile1")(1)
	'if upFormCnt > 1 then set allfile2 = uploadform("allfile2")(1)
	'if upFormCnt > 2 then set allfile3 = uploadform("allfile3")(1)
	'if upFormCnt > 3 then set allfile4 = uploadform("allfile4")(1)


response.write "------>" & uploadform("upLoadFiles") & "<br>"

	For i = 1 To uploadform("upLoadFiles").Count
		if uploadform("upLoadFiles")(i) <> "" then
			Set uploadfile = uploadform("upLoadFiles")(i)

			'response.write "------>" & uploadform("oldfilename" & i) & "<br>"
			'컬렉션 단위로 제약조건.
			uploadform.MaxFileLen = maxsize
			uploadform.UploadTimeout = 1200

			Call UploadingProcess(uploadfile)
		end if
		'uploadform("files")(i).Save
	Next	'for i=0 to Ubound(uploadform("upLoadFiles"))


	Response.end
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
	'DEXT 업로드 시작부분 1
Sub UploadingProcess(uploadfile)
	'vailidation
	Dim exeFileExt, imgFileExt, muiltFileExt, strFileName, strFileExt
	exeFileExt = "asp,aspx,php,php3,php4,cgi,asa"
	imgFileExt = "jpg,jpeg,gif,pcx,bmp"
	muiltFileExt = "mp3,asf,wmv,mpg,mpeg,avi,wav"

	'용량초과
	if CLng(uploadfile.FileLen) > CLng(maxsize) then
		uploadform.Flush
		Call OnTransactionAbort()
		Call ShowAlertMsg(uploadfile.FileName & "(" & GetFileSizeUnit(uploadfile.FileLen)  & ")가 용량 " & GetFileSizeUnit(maxsize) & "초과해선 안됩니다.")
		'Response.write uploadfile.FileLen & " - "& maxsize & "<br>"
	end if

	strFileName = GetFileName(uploadfile.FileName)	'파일이름only
	strFileExt = GetFileExtension(uploadfile.FileName)	'파일확장자

	'실행파일금지
	if InStr(exeFileExt, strFileExt) > 0 then
		uploadform.Flush
		Call OnTransactionAbort()
		Call ShowAlertMsg("금지된 파일종류입니다.")
	end if

	'이미지 width, height(uploadfile.ImageWidth, uploadfile.ImageHeight);이미지가 아니면 -1


	'Response.write "---------------->" & uploadfile.FileName  & "<br>"

	'Response.write "---------------->" & uploadfile.ImageWidth  & "<br>"
Set uploadfile = nothing


Exit sub


	If allfile1<>"" Then '업로드할 파일이 있다면
		filesize1=allfile1.FileLen
		if filesize1 < maxsize then
			filesize_ok = "ok"

			if uploadform("oldfilename1")<>"" then
				oldfilename1 = Server.MapPath("FileData")&"\"&bID&"\"& uploadform("oldfilename1")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename1			'그 파일을 삭제한다.
				fOldName1 = Mid(oldfilename1, instrRev(oldfilename1, "\") + 1)
			end if

			Set fs = Server.CreateObject("Scripting.FileSystemObject")
			'filename1 = allfile1.FileName								'파일이름을 구한다.
			'strname = mid(filename1, 1 , instrrev(filename1,".")-1)	'파일명을 구한다.
			'strext = Lcase(Mid(filename1, InstrRev(filename1, ".") + 1))'확장자을 구한다.

			'if Instr(exeFileExt,right(Lcase(strext),3)) > 0 then
			'	Response.Redirect "inc/error.asp?no=12&strext="&strext	'위의 확장자를 가진 파일이 업로드 될경우 에러메세지 출력.
			'End if


			'if Instr(imgFileExt,right(Lcase(strext),3)) > 0 then
			'	i_w1 = allfile1.imagewidth
			'	i_h1 = allfile1.imageheight
			'else
			'	i_w1 = 0
			'	i_h1 = 0
			'End if

			strfilename1 = uploadform.DefaultPath & filename1
			aname1=uploadform("allfile1").Saveas(strfilename1,false)
			filename1= Mid(aname1, InstrRev(aname1, "\") + 1)

			Set fs=Nothing

			if uploadform("oldfilename1")<>"" then
				SQL = "Update " & bFilesTable &" set fName = '" & filename1 & "'"
				SQL = SQL & ",fSize = " & filesize1
				SQL = SQL & ",fOldName ='" & fOldName1 & "'"
				SQL = SQL & ",fDLcount = 0 "
				SQL = SQL & " where bNbr = " & bNbr
				SQL = SQL & " And fOrder = 1"
				dbConn.Execute SQL
			end if

		else	'파일이 클경우
			uploadform.Flush
			Response.Redirect "inc/error.asp?no=10"
		end if
	else	'If allfile1<>"" Then '업로드할 파일이 없다면.
		if mode <> "edit" then
			filename1=""
			filesize1=""
			i_w1 = 0
			i_h1 = 0
		else
			if uploadform("del_file1") = "1" then
				oldfilename1 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename1")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename1										'그 파일을 삭제한다.
				filename1=""
				filesize1=""
				i_w1 = 0
				i_h1 = 0
				Call DeleteRecord(bFilesTable, "bNbr = " & bNbr & " And fOrder=1")
			else
				filename1=uploadform("oldfilename1")
				filesize1=uploadform("oldfilesize1")
				i_w1 = uploadform("i_w1")
				i_h1 = uploadform("i_h1")
			end if
		end if
	end if
	' DEXT 업로드 끝부분

End Sub 	'Sub uploadingProcess(uploadfile)


%>
















<%

Response.end



	' DEXT 업로드 시작부분 2
	If allfile2<>"" Then '업로드할 파일이 있다면
		filesize2=allfile2.FileLen
		if filesize2 < maxsize then
			filesize_ok = "ok"

			if uploadform("oldfilename2")<>"" then
				oldfilename2 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename2")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename2											'그 파일을 삭제한다.
				fOldName2 = Mid(oldfilename2, instrRev(oldfilename2, "\") + 1)
			end if

			Set fs = Server.CreateObject("Scripting.FileSystemObject")
			uploadform.DefaultPath = Server.MapPath("FileData")&"\"&bID&"\"				'파일이 저장될 경로
			filename2 = allfile2.FileName								'파일이름을 구한다.
			strname = mid(filename2, 1 , instrrev(filename2,".")-1)	'파일명을 구한다.
			strext = Lcase(Mid(filename2, InstrRev(filename2, ".") + 1))'확장자을 구한다.

			if Instr(exeFileExt,right(Lcase(strext),3)) > 0 then
				Response.Redirect "inc/error.asp?no=12&strext="&strext	'위의 확장자를 가진 파일이 업로드 될경우 에러메세지 출력.
			End if

			if Instr(imgFileExt,right(Lcase(strext),3)) > 0 then
				i_w2 = allfile2.imagewidth
				i_h2 = allfile2.imageheight
			else
				i_w2 = 0
				i_h2 = 0
			End if

			strfilename2 = uploadform.DefaultPath & filename2

			aname2=uploadform("allfile2").Saveas(strfilename2,false)

			filename2= Mid(aname2, InstrRev(aname2, "\") + 1)

			Set fs=Nothing

		if uploadform("oldfilename2")<>"" then
			SQL = "Update " & bFilesTable &" set fName = '" & filename2 & "'"
			SQL = SQL & ",fSize = " & filesize2
			SQL = SQL & ",fOldName ='" & fOldName2 & "'"
			SQL = SQL & ",fDLcount = 0 "
			SQL = SQL & " where bNbr = " & bNbr
			SQL = SQL & " And fOrder = 2"
			dbConn.Execute SQL
		end if

		else
			Response.Redirect "inc/error.asp?no=10"
		end if

	else

		if mode <> "edit" then
			filename2=""
			filesize2=""
			i_w2 = 0
			i_h2 = 0
		else
			if uploadform("del_file2") = "1" then
				if uploadform("oldfilename2") <> "" then
					oldfilename2 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename2")		'앞에서 기존 파일을 불러와서..
					uploadform.DeleteFile oldfilename2							'그 파일을 삭제한다.
					filename2=""
					filesize2=""
					i_w2 = 0
					i_h2 = 0
				end if
				Call DeleteRecord(bFilesTable, "bNbr = " & bNbr & " And fOrder=2")
			else
				filename2=uploadform("oldfilename2")
				filesize2=uploadform("oldfilesize2")
				i_w2 = uploadform("i_w2")
				i_h2 = uploadform("i_h2")
			end if
		end if
	end if

	' DEXT 업로드 끝부분
%>
<%
	' DEXT 업로드 시작부분 3
	If allfile3<>"" Then '업로드할 파일이 있다면

		filesize3=allfile3.FileLen

		if filesize3 < maxsize then

			filesize_ok = "ok"

			if uploadform("oldfilename3")<>"" then
				oldfilename3 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename3")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename3											'그 파일을 삭제한다.
				fOldName3 = Mid(oldfilename3, instrRev(oldfilename3, "\") + 1)
			end if

			Set fs = Server.CreateObject("Scripting.FileSystemObject")
			uploadform.DefaultPath = Server.MapPath("FileData")&"\"&bID&"\"				'파일이 저장될 경로
			filename3 = allfile3.FileName								'파일이름을 구한다.
			strname = mid(filename3, 1 , instrrev(filename3,".")-1)	'파일명을 구한다.
			strext = Lcase(Mid(filename3, InstrRev(filename3, ".") + 1))'확장자을 구한다.

			if Instr(exeFileExt,right(Lcase(strext),3)) > 0 then
				Response.Redirect "inc/error.asp?no=12&strext="&strext	'위의 확장자를 가진 파일이 업로드 될경우 에러메세지 출력.
			End if

			if Instr(imgFileExt,right(Lcase(strext),3)) > 0 then
				i_w3 = allfile3.imagewidth
				i_h3 = allfile3.imageheight
			else
				i_w3 = 0
				i_h3 = 0
			End if

			strfilename3 = uploadform.DefaultPath & filename3


			aname3=uploadform("allfile3").Saveas(strfilename3,false)


			filename3= Mid(aname3, InstrRev(aname3, "\") + 1)

			Set fs=Nothing

		if uploadform("oldfilename3")<>"" then
			SQL = "Update " & bFilesTable &" set fName = '" & filename3 & "'"
			SQL = SQL & ",fSize = " & filesize3
			SQL = SQL & ",fOldName ='" & fOldName3 & "'"
			SQL = SQL & ",fDLcount = 0 "
			SQL = SQL & " where bNbr = " & bNbr
			SQL = SQL & " And fOrder = 3"
			dbConn.Execute SQL
		end if


		else
			Response.Redirect "inc/error.asp?no=10"
		end if

	else
		if mode <> "edit" then
			filename3=""
			filesize3=""
			i_w3 = 0
			i_h3 = 0
		else
			if uploadform("del_file3") = "1" then
				oldfilename3 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename3")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename3										'그 파일을 삭제한다.
				filename3=""
				filesize3=""
				i_w3 = 0
				i_h3 = 0
				Call DeleteRecord(bFilesTable, "bNbr = " & bNbr & " And fOrder=3")
			else
				filename3=uploadform("oldfilename3")
				filesize3=uploadform("oldfilesize3")
				i_w3 = uploadform("i_w3")
				i_h3 = uploadform("i_h3")
			end if
		end if
	end if

	' DEXT 업로드 끝부분
%>
<%
	' DEXT 업로드 시작부분 4
	If allfile4<>"" Then '업로드할 파일이 있다면

		filesize4=allfile4.FileLen

		if filesize4 < maxsize then

			filesize_ok = "ok"

			if uploadform("oldfilename4")<>"" then
				oldfilename4 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename4")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename4											'그 파일을 삭제한다.
				fOldName4 = Mid(oldfilename4, instrRev(oldfilename4, "\") + 1)
			end if

			Set fs = Server.CreateObject("Scripting.FileSystemObject")
			uploadform.DefaultPath = Server.MapPath("FileData")&"\"&bID&"\"				'파일이 저장될 경로
			filename4 = allfile4.FileName								'파일이름을 구한다.
			strname = mid(filename4, 1 , instrrev(filename4,".")-1)	'파일명을 구한다.
			strext = Lcase(Mid(filename4, InstrRev(filename4, ".") + 1))'확장자을 구한다.

			if Instr(exeFileExt,right(Lcase(strext),3)) > 0 then
				Response.Redirect "inc/error.asp?no=12&strext="&strext	'위의 확장자를 가진 파일이 업로드 될경우 에러메세지 출력.
			End if

			if Instr(imgFileExt,right(Lcase(strext),3)) > 0 then
				i_w4 = allfile4.imagewidth
				i_h4 = allfile4.imageheight
			else
				i_w4 = 0
				i_h4 = 0
			End if

			strfilename4 = uploadform.DefaultPath & filename4


			aname4=uploadform("allfile4").Saveas(strfilename4,false)


			filename4= Mid(aname4, InstrRev(aname4, "\") + 1)

			Set fs=Nothing


			if uploadform("oldfilename4")<>"" then
				SQL = "Update " & bFilesTable &" set fName = '" & filename4 & "'"
				SQL = SQL & ",fSize = " & filesize4
				SQL = SQL & ",fOldName ='" & fOldName4 & "'"
				SQL = SQL & ",fDLcount = 0 "
				SQL = SQL & " where bNbr = " & bNbr
				SQL = SQL & " And fOrder = 4"
				dbConn.Execute SQL
			end if


		else
			Response.Redirect "inc/error.asp?no=10"
		end if

	else

		if mode <> "edit" then
			filename4=""
			filesize4=""
			i_w4 = 0
			i_h4 = 0
		else
			if uploadform("del_file4") = "1" then
				oldfilename4 = Server.MapPath("FileData")&"\"&bID&"\"&uploadform("oldfilename4")		'앞에서 기존 파일을 불러와서..
				uploadform.DeleteFile oldfilename4										'그 파일을 삭제한다.
				filename4=""
				filesize4=""
				i_w4 = 0
				i_h4 = 0
				Call DeleteRecord(bFilesTable, "bNbr = " & bNbr & " And fOrder=4")
			else
				filename4=uploadform("oldfilename4")
				filesize4=uploadform("oldfilesize4")
				i_w4 = uploadform("i_w4")
				i_h4 = uploadform("i_h4")
			end if
		end if
	end if

	' DEXT 업로드 끝부분


%>

<%
	if not(allfile1<>"") or not(allfile2<>"") or not(allfile3<>"") or not(allfile4<>"") or filesize_ok="ok" then

		userName = ReplaceTo(uploadform("userName"), "toDB")

		bTitle = ReplaceTo(uploadform("bTitle"), "toDB")
		if bTitle = "" then bTitle = "제목이 없습니다."

		userEmail = ReplaceTo(uploadform("userEmail"), "toDB")

		homepage = Trim(uploadform("homepage"))
		if left(homepage,7) = "http://" then
			homepage = mid(homepage,8)
		end if

		link1 = Trim(uploadform("link1"))
		if left(link1,7) = "http://" then
			link1 = mid(link1,8)
		end if
		link2 = Trim(uploadform("link2"))
		if left(link2,7) = "http://" then
			link2 = mid(link2,8)
		end if

	bContent = ReplaceTo(uploadform("bContent"), "toDB")
	IPaddress = request.ServerVariables("REMOTE_HOST")
	notice = ReplaceTo(uploadform("notice"), "toDB")

	if mode <> "edit" then
		if notice = "1" then	'이런 경우 발생하지 않음 나중에 지울것.
			SQL="SELECT MAX(bNbr) FROM "& bBodyTable &" where bNbr > 100000000"
			Set rs = dbConn.Execute(SQL)

			if IsNULL(rs(0)) then
				bNbr = 100000001
			else
				bNbr = rs(0)+1
			end if
		else
			SQL="SELECT MAX(bNbr) FROM "& bBodyTable &" where bNbr < 100000000"
			Set rs = dbConn.Execute(SQL)
			if IsNULL(rs(0)) then
				bNbr = 1
			else
				bNbr = rs(0)+1
			end if
		end if
		'레코드셋 종료
		Call CloseRS(rs)
	end if

	tagHTML = uploadform("tagHTML")
	secretPW = uploadform("secretPW")
	replyEmail = uploadform("replyEmail")

	'if secret = "1" then
	'	secretPW = uploadform("secretPW")
	'elseif secret = "2" then
	'	secretPW = userPW
	'end if

	if left(now,2) = "20" then
		writeday = mid(now,3)
	else
		writeday = now
	end if


	'답변처리부분
  	dim o_userEmail,o_title,re,reSame,reID,reID2,newreID,newreSame
  	if mode = "reply" then
		SQL = "SELECT userEmail,bTitle,replyGrp,reSame,reID,replyEmail FROM "&bBodyTable&" where bNbr="&uploadform("bNbr")
		Set rs = dbConn.Execute(SQL)

		o_userEmail = rs("userEmail")
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

	    	SQL = "UPDATE " & bBodyTable & " SET reID = reID + 1 where replyGrp = "& replyGrp & " and reID > " & reID
		dbConn.Execute(SQL)

		newreID = reID + 1
		newreSame = reSame + 1

		if use_mail = "True" And replyEmail = 1 then
			call reply_email()
		end if

	else
		replyGrp = bNbr
		newreSame = 0
		newreID = 0
	end if
	'답변처리부분 끝


	call process_write()


	if uploadform("sw") <> "" then
		Response.Redirect "bList.asp?bID="&bID&"&page="&page&"&st="&uploadform("st")&"&sc="&uploadform("sc")&"&sn="&uploadform("sn")&"&sw="&uploadform("sw")
	else
		Response.Redirect "bList.asp?bID="&bID&"&page="&page
	end if
	Set uploadform = nothing


end if





If Err Then
	Response.Write "Error occured : <BR>"
	Response.Write Err.Description
	' 외부 오류 발생으로 업로드 작업을 취소하고자 할 경우
	uploadform.DeleteAllSavedFiles
End If

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
    	' 외부 오류 발생으로 업로드 작업을 취소하고자 할 경우
		uploadform.DeleteAllSavedFiles
		Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>