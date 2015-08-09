<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->

<%
	if bType = 1 and uploadType = "dext" then
		dim objMon
		Set objMon = Server.CreateObject("DEXT.FileUploadMonitor")
		objMon.UseMonitor(True)
		'Set objMon = Nothing
	end if
%>


<%
	dim bNbr,mode,userName,userPW,secretPW,userEmail,homepage,link1,link2,tagHTML,secret,replyEmail,bTitle,reSame,reID,link,filename1,filesize1,filename2,filesize2,filename3,filesize3,filename4,filesize4

	bNbr = Request.QueryString("bNbr")
	page = Request.QueryString("page")
	mode = Request.QueryString("mode")


	if mode = "" and w_level < session("level") then Response.Redirect "inc/error.asp?no=4"

	If mode = "reply" Then
		if rw_level < session("level") then Response.Redirect "inc/error.asp?no=4"
		SQL = "Select userName,bTitle,bContent,reSame,reID From "&bBodyTable&" Where bNbr="&bNbr
		Set rs = dbConn.Execute(SQL)
		userName = rs("userName")
		bTitle = rs("bTitle")
		bContent = rs("bContent")
		reSame = rs("reSame")
		reID  = rs("reID")
		bContent = Chr(62)&Chr(62)& userName&"님이 작성하신 글입니다."&Chr(10)&Chr(10) & bContent
	elseif mode = "edit" Then
		'글번호와 페이지번호가 없으면
		if bNbr = "" then Response.Redirect("bList.asp?bID=" & Request("bID"))

		dim form_pin
		if Session("MbrID") <> "" and Request.QueryString("mem") = "ok" then
			SQL="SELECT MbrID,userPW FROM "&bBodyTable&" where bNbr="&bNbr
			Set rs = dbConn.Execute(SQL)
			if Session("MbrID") <> rs(0) Or (Session("sLevel4") <> "" And CInt(Session("sLevel4")) < 2) then
				'Response.end
				Response.Redirect "inc/error.asp?no=4"
			end if
			form_pin = rs(1)
		else
			form_pin = Request.Form("form_pin")
		end if

		'게시물 내용 가져오기.
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		selectedFields = "*"
		whereClause = "bNbr=" & bNbr
		if (CInt(Session("sLevel4")) < 2) then
			whereClause = whereClause & " and userPW='" & form_pin & "'"
		end if
		orderBy = ""
		RSresult = SelectSimpleRecord(rs, selectedFields, bBodyTable, whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		if RSresult = "NotEmpty" then
			userName = rs("userName")
			userPW = rs("userPW")
			secretPW = rs("secretPW")
			userEmail = rs("userEmail")
			homepage = rs("homepage")
			link1 = rs("link1")
			link2 = rs("link2")
			'notice = rs("notice")
			tagHTML = rs("tagHTML")
			'secret= rs("secret")
			replyEmail= rs("replyEmail")
			bTitle = rs("bTitle")
			bContent = rs("bContent")
			reSame = rs("reSame")
			reID  = rs("reID")
			link = link1&link2

			if bType > 0 and mode = "edit" then
				'filename1 = rs("filename1")
				'filesize1 = rs("filesize1")
				'filename2 = rs("filename2")
				'filesize2 = rs("filesize2")
				'filename3 = rs("filename3")
				'filesize3 = rs("filesize3")
				'filename4 = rs("filename4")
				'filesize4 = rs("filesize4")
				'i_width1 = rs("i_width1")
				'i_height1 = rs("i_height1")
				'i_width2 = rs("i_width2")
				'i_height2 = rs("i_height2")
				'i_width3 = rs("i_width3")
				'i_height3 = rs("i_height3")
				'i_width4 = rs("i_width4")
				'i_height4 = rs("i_height4")

				'파일관련 내용 가져오기.
				''''''''''''''''''''''''''''''''''''''''''''''''''''''''
					selectedFields = "fOrder,fName,fSize,fOldName,fDLcount"
					whereClause = "bNbr=" & bNbr
					orderBy = "fOrder"
					RSresult = SelectSimpleRecord(fRS, " Top 100 percent " & selectedFields, bFilesTable, whereClause, orderBy)
				''''''''''''''''''''''''''''''''''''''''''''''''''''''''
				if RSresult <> "Empty" then
					idx = 0
					file = 1	'파일 있음.
					fRScnt = GetRecordCount(bFilesTable, whereClause)
					Dim fOrderArray(),fNameArray(),fSizeArray(),fDLcountArray()

					ReDim fOrderArray(fRScnt),fNameArray(fRScnt),fSizeArray(fRScnt),fDLcountArray(fRScnt)
					Do until fRS.EOF
						fOrderArray(idx) = fRS("fOrder")
						fNameArray(idx) = fRS("fName")
						fSizeArray(idx) = GetFileSizeUnit(fRS("fSize"))
						fDLcountArray(idx) = fRS("fDLcount")
						idx = idx + 1
						fRS.MoveNext
			  		Loop
				else
					file=0	'파일없음.
				end if
			end if	'if bType > 0 and mode = "edit" then

		else
			Response.Redirect "inc/error.asp?no=2" 'if rs.eof or rs.bof then
		end if	'if RSresult = "NotEmpty" then
	else
		'로그인 되어 있을 경우 홈페이지주소 가져오기.(지금 구현 필요없음)

	End If	'If mode = "reply" Then
%>

<html>
<head>
<title><%=bTitleName%></title>

<LINK rel="stylesheet" type="text/css" href="IncTemplates/style.css">

<script language="javascript">
<!--
	function check_use_html(obj) {
		if(!obj.checked) {
			obj.value=0;
		} else {
			obj.value=1;
		}
	}

	function secretEnable(obj) {

		if(!obj.checked) {
			obj.value=1;
			document.all.secretEnable.style.display = "none"
			document.all.secretEnable1.style.display = "none"
		} else {

			obj.value=1;
			document.all.secretEnable.style.display = ""
			document.all.secretEnable1.style.display = ""
		}
	}


function submit()
{
<% if Session("MbrID") = "" then %>
	if (document.bFrm.userName.value == "") {
		alert("이름을 입력해 주세요.");
		document.bFrm.userName.focus();
		return;
	}
	if (document.bFrm.userPW.value =="") {
		alert("비밀번호를 입력해 주세요.");
		document.bFrm.userPW.focus();
		return;
	}

	if (document.bFrm.userEmail.value.length > 1 )  {

	str = document.bFrm.userEmail.value;
	if(	(str.indexOf("@")==-1) || (str.indexOf(".")==-1)){
		alert("전자우편 주소형식이 맞지않습니다")
		document.bFrm.userEmail.focus();
		return;
	}
	}
	<% end if %>
	if (document.bFrm.bTitle.value =="") {
		alert("제목을 입력해 주세요.");
		document.bFrm.bTitle.focus();
		return;
	}

	if (document.bFrm.bContent.value =="") {
		alert("내용을 입력해 주세요.");
		document.bFrm.bContent.focus();
		return;
	}

	if (document.bFrm.replyEmail == "object" && document.bFrm.replyEmail.checked == true) {
		if (document.bFrm.userEmail.value =="") {
			alert("전자우편을 입력해 주세요.");
			document.bFrm.userEmail.focus();
			return;
		}
	}

	//패스워드 encryption
	/*
	var letters = 'ghijklabvwxyzABCDEFef)_+|<>?:mnQRSTU~!@#$%^VWXYZ`1234567opGHIJKLu./;'+"'"+'[]MNOP890-='+'\\'+'&*("{},cdqrst '+"\n";
	var split = letters.split("");var bNbr = '';var c = '';
	var encrypted = '';
	var it = document.bFrm.userPW.value;
	var b = '0';var chars = it.split("");while(b<it.length){c = '0';while(c<letters.length){if(split[c] == chars[b]){if(c == "0") { c = ""; }if(eval(c+10) >= letters.length){bNbr = eval(10-(letters.length-c));encrypted += split[bNbr];}else{bNbr = eval(c+10);encrypted += split[bNbr];}}c++;}b++;}document.bFrm.userPW.value = encrypted;encrypted = '';
	*/

	<% if bType > 0 and uploadType="dext" and progressBar="True" then %>
		ShowProgress();
	<% elseif bType > 0 and uploadType="abc" and progressBar="True"then %>
		DoUpload();
	<% end if %>

	document.bFrm.submit();
}
function reset() {
	document.bFrm.reset();
}

function linkEable() {
   if (document.all.link_1.style.display != "none") {
		   document.all.link_1.style.display = "none"
		   document.all.link_11.style.display = "none"
		   document.all.link_2.style.display = "none"
		   document.all.link_22.style.display = "none"
   }
   else {
	   document.all.link_1.style.display = ""
	   document.all.link_11.style.display = ""
	   document.all.link_2.style.display = ""
	   document.all.link_22.style.display = ""
   }
}

function box1() {
   if (document.all.re_content.style.display != "none") {
			document.all.re_content.style.display = "none"
			document.all.re_content1.style.display = "none"
	   }
	   else {
			document.all.re_content.style.display = ""
			document.all.re_content1.style.display = ""
	   }
}

function ShowProgress() {
   for(i=0;i<=document.bFrm.upLoadFiles.length;i++) {
	//alert(document.bFrm.upLoadFiles[i].value);
	   if (document.bFrm.upLoadFiles[i].value != "") {
	   	  strAppVersion = navigator.appVersion;
		  if (strAppVersion.indexOf('MSIE')!=-1 &&
			  strAppVersion.substr(strAppVersion.indexOf('MSIE')+5,1) > 4) {
			  winstyle = "dialogWidth=385px; dialogHeight:150px; center:yes";
			  window.showModelessDialog("show_progress.asp?nav=ie", null, winstyle);
		  }
		  else {
			  winpos = "left=" + ((window.screen.width-380)/2)+",top="+((window.screen.height-110)/2);
			  winstyle="width=380,height=110,status=no,toolbar=no,menubar=no," + "location=no, resizable=no,scrollbars=no,copyhistory=no," + winpos;
			  window.open("show_progress.asp?nav=ns",null,winstyle);
		  }
	   }
	   return true;
   }
}

function DoUpload() { // ABC
  theFeats =   "height=120,width=500,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no";
  theUniqueID = (new Date()).getTime() % 1000000000;
  if (document.bFrm.allfile1.value != ""<% if upFormCnt > 1 then %> || document.bFrm.allfile2.value != ""<% end if %><% if upFormCnt > 2 then %> || document.bFrm.allfile3.value != ""<% end if %><% if upFormCnt > 3 then %> || document.bFrm.allfile4.value != ""<% end if %>) {
  window.open("progressbar.asp?ID=" + theUniqueID, theUniqueID, theFeats);
  }
  document.bFrm.action = "abc_form_ok.asp?ID=" + theUniqueID;
}

function ShowProgress1() {	// To be deleted
   strAppVersion = navigator.appVersion;
   if (document.bFrm.allfile1.value != ""<% if upFormCnt > 1 then %> || document.bFrm.allfile2.value != ""<% end if %><% if upFormCnt > 2 then %> || document.bFrm.allfile3.value != ""<% end if %><% if upFormCnt > 3 then %> || document.bFrm.allfile4.value != ""<% end if %>) {
      if (strAppVersion.indexOf('MSIE')!=-1 &&
          strAppVersion.substr(strAppVersion.indexOf('MSIE')+5,1) > 4) {
          winstyle = "dialogWidth=385px; dialogHeight:150px; center:yes";
          window.showModelessDialog("show_progress.asp?nav=ie", null, winstyle);
      }
      else {
          winpos = "left=" + ((window.screen.width-380)/2)+",top="+((window.screen.height-110)/2);
          winstyle="width=380,height=110,status=no,toolbar=no,menubar=no," + "location=no, resizable=no,scrollbars=no,copyhistory=no," + winpos;
          window.open("show_progress.asp",null,winstyle);
      }
   }
   return true;
}

function OpenWindow(url,intWidth,intHeight) {
      window.open(url, "joins", "width="+intWidth+",height="+intHeight+",resizable=0,scrollbars=1");
}
//-->
</script>

</head>
<body bgcolor="<%=tb_bgcolor%>" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" onload="document.bFrm.<% if Session("MbrID") <> "" then %>bTitle<% else %>userName<% end if %>.focus();">


<%
	'최상단
	if bTopFilePath <> "" then Server.Execute(Application("SiteRoot") & bTopFilePath)
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%= Application("SiteRoot") & bigTB_img %>">
  <tr>
    <td>

<table border="0" cellpadding="0" cellspacing="0" align="<%= bAlign %>" bgcolor="<%= tb_bgcolor %>">
  <tr>
    <td align="left" colspan="3">
<%
	'둘째상단
	if bTop1FilePath <> "" then Server.Execute(Application("SiteRoot") & bTop1FilePath)
%>
</td>
  </tr>
  <tr>
    <td align="left" valign="top">
<%
	'좌측메뉴
	if bLeftFilePath <> "" then Server.Execute(Application("SiteRoot") & bLeftFilePath)
%>
</td>
    <td valign="top">

    	<table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="left">
<%
	'게시판 바로 위 상단
	if bTop2FilePath <> "" then Server.Execute(Application("SiteRoot") & bTop2FilePath)

%>
        </td>
        </tr>
      <tr>
        <td width="<%=bWidth+12%>" align="center">
<base href="<%= Application("SiteURLDir") & "CommonAccessories/Board/" %>" target="_self">
<!-------------------- 여기부터가 게시판 내용 ----------------->

<table cellpadding="0" cellspacing="0" border="0" width="<%=bWidth%>" ID="Table1">
  <tr>
	<td class="font" align="right"><% call memberForm %> &nbsp; </td>
  </tr>
</table>
<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<form name="bFrm" method="POST" action="<% if bType > 0 then %><%=uploadType%>_<% end if %>form_ok.asp"<% if bType > 0 then %> enctype="MULTIPART/FORM-DATA"<% end if %>>
<tr>
    <td colspan="4" background="Images/line2.gif" height="5"></td>
</tr>
<% if Session("MbrID") = "" then %>
<tr bgcolor="F7F7F7" height="25">
	<td width="110" class="form_title" align="right"><b>이 &nbsp; &nbsp; 름 &nbsp;</b></td>
	<td width="175"><input type="text" name="userName" size="15" class="form_input" maxlength="30" value="<% if Session("MbrID") = "" and mode="edit" then %><%=userName%><% else %><%=session("userName")%><% end if %>"></td>
	<td width="110" class="form_title" align="right"><b>비밀번호 &nbsp;</b></td>
	<td width="175"><input type="password" name="userPW" size="15" maxlength="20" class="form_input" value="<% if Session("MbrID") = "" and mode="edit" then %><%=userPW%><% else %><%=session("userPW")%><% end if %>"></td>
</tr>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr bgcolor="F7F7F7" height="25">
	<td width="110" class="form_title" align="right">전자우편 &nbsp;</td>
	<td width="460" colspan="3"><input type="text" name="userEmail" size="30" class="form_input" maxlength="50" value="<% if Session("MbrID") = "" and mode="edit" then %><%=userEmail%><% else %><%=session("userEmail")%><% end if %>"></td>
</tr>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<% else %>
	<% if mode<>"edit" then %>
		<input type="hidden" name="userName" value="<%=session("MbrName")%>">
		<input type="hidden" name="userEmail" value="<%=session("MbrEmail")%>">
	<% else %>
		<input type="hidden" name="userName" value="<%=userName%>">
		<input type="hidden" name="userPW" value="<%=userPW%>">
		<input type="hidden" name="userEmail" value="<%=userEmail%>">
	<% end if %>
<% end if %>
<tr bgcolor="F7F7F7" height="25">
	<td width="110" class="form_title" align="right">홈페이지 &nbsp;</td>
	<td width="460" colspan="3">
	http://<input type="text" name="homepage" size="30" class="form_input" maxlength="240" value="<%= homepage %>"></td>
</tr>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>

<tr bgcolor="F7F7F7" height="25">
	<td width="110" class="form_title" align="right">부가기능 &nbsp;</td>
	<td width="460" colspan="3" class="form_title">

	<%if nw_level >= session("level") then%>
	<!--input type="checkbox" name="notice" value="1"<% if notice = 1 then %> checked<% end if%>>
		공지사항 -->
	<% end if %>

	<% if use_tag = "True" then %>
		<input type="checkbox" name="tagHTML" value="<% if tagHTML = 1  then %>1<% elseif tagHTML = 2 then %>2<% else %>1<% end if %>"<% if tagHTML = "True" then %> checked<% end if%> onclick="check_use_html(this)">HTML 적용
	<% end if %>

	<input type="checkbox" name="secret" value="<% if secret = 1 then %>1<% elseif secret = 2 then %>2<% else %>1<% end if %>"<% if secret > 0 then %> checked<% end if%> onclick="secretEnable(this)">비밀글
	<% if use_mail = "True" then %>
		<input type="checkbox" name="replyEmail" value="1"<% if replyEmail = "True"  then %> checked<% end if%>>메일로 답변글 받기
	<% end if %>
	<input type="checkbox" name="link" value="1"<% if link <> "" then %> checked<% end if%> onclick="javascript:linkEable()">관련 링크


	</td>
</tr>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr bgcolor="F7F7F7" height="25" id="secretEnable" style="display:<% if secret <> 1 then %>none<% end if%>">
	<td width="110" class="form_title" align="right">글읽기 비밀번호 &nbsp;</td>
	<td width="460" colspan="3" class="form_title">
	<input type="password" name="secretPW" size="15" class="form_input" value="<%=secretPW%>">
	</td>
</tr>
<tr id="secretEnable1" style="display:<% if secret <> 1 then %>none<% end if%>">
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr bgcolor="F7F7F7" height="25" id="link_1" style="display:<% if link = "" then %>none<% end if%>">
	<td width="110" class="form_title" align="right">관련링크 #1 &nbsp;</td>
	<td width="460" colspan="3"><input type="text" name="link1" size="60" class="form_input" maxlength="240" value="<%=link1%>"></td>
</tr>
<tr id="link_11" style="display:<% if link = "" then %>none<% end if%>">
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr bgcolor="F7F7F7" height="25" id="link_2" style="display:<% if link = "" then %>none<% end if%>">
	<td width="110" class="form_title" align="right">관련링크 #2 &nbsp;</td>
	<td width="460" colspan="3"><input type="text" name="link2" size="60" class="form_input" maxlength="240" value="<%=link2%>"></td>
</tr>
<tr id="link_22" style="display:<% if link = "" then %>none<% end if%>">
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr bgcolor="F7F7F7" height="25">
	<td width="110" class="form_title" align="right"><b>제 &nbsp; &nbsp; 목 &nbsp;</b></td>
	<td width="460" colspan="3" class="font1" valign="center"><input type="text" name="bTitle" size="60" maxlength="240" class="form_input" value="<%=bTitle%>"><% if mode="reply" then %> &nbsp; &nbsp; <a href="javascript:box1()" style="text-align:center"><img src="Images/but_re_con.gif" border="0"></a><% end if %></td>
</tr>
<% if mode="reply" then %>
<tr id="re_content" style="display:">
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr id="re_content1" style="display:">
	<td colspan="4" align="center" bgcolor="F7F7F7"><br><textarea name="reply_content" cols="105" rows="12" class="form_textarea" readonly><%=bContent%></textarea><br><br></td>
</tr>
<% end if %>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<tr>
	<td colspan="4" align="center" bgcolor="F7F7F7"><br><textarea name="bContent" cols="105" rows="12" class="form_textarea"><% if mode = "edit" then %><%=bContent%><% end if %></textarea><br><br></td>
</tr>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<%
	if bType > 0 then
		for i = 1 to upFormCnt

%>
<tr bgcolor="#F7F7F7" height="25">
	<td width="110" class="form_title" align="right">파일첨부 #<%= i %> &nbsp;</td>
	<td width="460" colspan="3" class="font1">
		<!-- To be deleted  input type=file name="allfile<%= i %>" size="30" class="form_input"-->
		<input type=file name="upLoadFiles" size="30" class="form_input"> &nbsp; &nbsp; <%=maxsize%>MB 까지 가능
	</td>
</tr>
<%
		'수정시에 업로드된 파일이 있으면 표시함.
		if mode = "edit" And file = 1 then
			if i <= Ubound(fNameArray) then
				fOrder = fOrderArray(i-1)
				fName = fNameArray(i-1)
				fSize = fSizeArray(i-1)
				fDLcount = fDLcountArray(i-1)
		%>
		<tr>
			<td colspan="4" class="font1" bgcolor="#F7F7F7" style="padding-left:30px;color:#999999;"><%=fName%>(<%=fSize%>) 이 등록되어있습니다.
			<input type="checkbox" name="del_file<%= fOrder %>" value="1">삭제
			<input type="hidden" name="oldfilename<%=fOrder %>" value="<%= fName %>">
			<input type="hidden" name="oldfilesize<%= fOrder %>" value="<%=fSize%>">
			</td>
		</tr>
		<%
			end if
		end if	'if mode = "edit" And file = 1 then
%>
<tr>
	<td colspan="4" height="1" bgcolor="#cccccc"></td>
</tr>
<%
		next
	end if	'if bType > 0 then
%>

<tr>
	<td colspan="4">
	<table width="570" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#333333"></td>
	</tr>
	</table>
	</td>
</tr>
	<input type="hidden" name="bID" value="<%=bID%>">
	<input type="hidden" name="bNbr" value="<%=bNbr%>">
	<input type="hidden" name="page" value="<%=page%>">
	<input type="hidden" name="mode" value="<%=mode%>">
	<input type="hidden" name="st" value="<%=Request.QueryString("st")%>">
	<input type="hidden" name="sc" value="<%=Request.QueryString("sc")%>">
	<input type="hidden" name="sn" value="<%=Request.QueryString("sn")%>">
	<input type="hidden" name="sw" value="<%=Request.QueryString("sw")%>">
</form>
</table>
<table width="570" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td align="right" style="word-break:break-all;padding:5px;">
	<a href="javascript:submit();">
		<img src="Images/but_<% if mode = "edit" then %>edit<% else %>save<% end if %>.gif" border="0">
	</a>
	<a href="javascript:reset();"><img src="Images/but_again.gif" border="0"></a>

	<a href="javascript:history.go(-<% if mode = "edit" then %>2<% else %>1<% end if %>);">
	<img src="Images/but_join_cancel.gif" border="0"></a></td>
</tr>
</table>
<!-------------------- 여기부터가 게시판 내용 끝----------------->
	</td>
        </tr>
      <tr>
        <td align="left"><!-- #include File="IncTemplates/bIncludeBottomMsgTemplate.asp" --></td>
        </tr>
    </table>

    </td>
    <td align="left" valign="top">
<%
	'우측메뉴
	if bRightFilePath <> "" then Server.Execute(Application("SiteRoot") & bRightFilePath)
%>
</td>
  </tr>
</table>
    	</td>
  </tr>
</table>

<%
	'최하단
	if bBottomFilePath <> "" then Server.Execute(Application("SiteRoot") & bBottomFilePath)
%>



</body>
</html>
<%
	If mode <> "" Then
		Call CloseRS(Rs)
	end if
%>


