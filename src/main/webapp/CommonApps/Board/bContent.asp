<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'여기에 헤더
%>
<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../Include_asp/fsBoard_inc.asp" -->

<% StartTime = Timer() %>
<%
	bNbr = Request("bNbr")
	page = Request("page")

	st = Request.QueryString("st")
	sc = Request.QueryString("sc")
	sn = Request.QueryString("sn")
	sw = Request.QueryString("sw")
	'글번호와 페이지번호가 없으면
	if bNbr = "" Or page = "" then Response.Redirect("bList.asp?bID=" & Request("bID"))
	if r_level < session("level") then Response.Redirect "../inc/error.asp?no=4"
%>
<html>
<head>
<title><%=bTitleName%></title>
<LINK rel="stylesheet" type="text/css" href="IncTemplates/style.css">

<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)
	CheckValue = replace(CheckValue, "&lt;", "<")
	CheckValue = replace(CheckValue, "&gt;", ">")
	CheckValue = replace(CheckValue, "&quot;","'")
	CheckValue = replace(CheckValue, "&amp;", "&" )
	CheckWord = CheckValue
End Function

</script>

<Script Language="javascript">
<!--
function OpenWindow(url,intWidth,intHeight) {
      window.open(url, "joins", "width="+intWidth+",height="+intHeight+",resizable=0,scrollbars=1");
}

function CheckImgSize() {
	//alert(isNaN(imageFile.length));
	if(typeof(imageFile) == "object") {
		if(isNaN(imageFile.length)) {
			imgWidth=eval(imageFile.width);       // 이미지의 넓이
			imgHeight=eval(imageFile.height);      // 이미지의 높이
			if(imgWidth > 100) {
				imageFile.width = 100;
			}
		} else {
			for(i=0;i<imageFile.length;i++) {
				//alert(imageFile[i].name);
				imgWidth=eval(imageFile[i].width);       // 이미지의 넓이
				imgHeight=eval(imageFile[i].height);      // 이미지의 높이
				if(imgWidth > 100) {
					imageFile[i].width = 100;
				}
			}
		}
	}
}



// Load the first image
//var im = new Image();
//im.src = bigImage.src; //"Images/Goods_Images/<%= bigImage %>";
// When it's loaded, do something else
//while (im.readyState != "complete") { // Just loop round, doing nothing
//}
//document.onload = openWin("bigImage");

//-->
</Script>

</head>
<body bgcolor="<%=bgcolor%>" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" onload="CheckImgSize();">

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
<!-------------------- 여기부터가 게시판 내용 ----------------->


<%

	SQL = "SELECT bNbr,MbrID,userName,userPW,secretPW,userEmail,homepage,link1,link2,bTitle,bContent,writeDT,IPaddress,viewCount,rcmdCount,tagHTML,replyGrp,reID from "&bBodyTable&" where bNbr="&bNbr
	'mem_auth,filename1,filesize1,filename2,filesize2,filename3,filesize3,filename4,filesize4,down1,down2,down3,down4
	Set rs = dbConn.Execute(SQL)

	Dim bNbr,MbrID,userName,userPW,secretPW,userEmail,homepage,link1,link2,bTitle,writeDT,IPaddress,viewCount,rcmdCount,notice,tagHTML,replyGrp,reID,img_check,id_num,secret,mem_auth,filename1,filesize1,filename2,filesize2,filename3,filesize3,filename4,filesize4,down1,down2,down3,down4


    bNbr = rs("bNbr")
    MbrID = rs("MbrID")
    userName = rs("userName")
    userPW = rs("userPW")
    secretPW = rs("secretPW")
    userEmail = rs("userEmail")
    homepage = rs("homepage")
    link1 = rs("link1")
    link2 = rs("link2")

    bTitle = rs("bTitle")
    bContent = rs("bContent")

    viewCount = rs("viewCount")
    rcmdCount = rs("rcmdCount")
    writeDT = rs("writeDT")
    IPaddress = rs("IPaddress")

    tagHTML = rs("tagHTML")
    replyGrp = rs("replyGrp")
    reID = rs("reID")

	if secretPW <> "" and session("read") = ""  then Response.Redirect "pin.asp?bID="&bID&"&page="&page&"&bNbr="&bNbr&"&mode=secret"

    'filename1 = rs("filename1")
    'filesize1 = rs("filesize1")
    'filename2 = rs("filename2")
    'filesize2 = rs("filesize2")
    'filename3 = rs("filename3")
    'filesize3 = rs("filesize3")
    'filename4 = rs("filename4")
    'filesize4 = rs("filesize4")
    'down1 = rs("down1")
    'down2 = rs("down2")
    'down3 = rs("down3")
    'down4 = rs("down4")

	'파일관련
    	'if i_width1 > 0 and i_height1 > 0 then
	'	if i_width1 > cint(bWidth) then
	'		i_width1 =  bWidth*90/100
	'		i_height1 = rs("i_height1") / (rs("i_width1") / i_width1)
	'	end if
    	'end if

 	'end if

    'i_width4 = rs("i_width4")
    'i_height4 = rs("i_height4")

	'if i_width4 > 0 and i_height4 > 0 then
	'	if i_width4 > cint(bWidth) then
	'		i_width4 =  bWidth*90/100
	'		i_height4 = rs("i_height4") / (rs("i_width4") / i_width4)
	'	end if
    	'end if


	'파일관련 내용 가져오기.
	''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		selectedFields = "fOrder,fName,fSize,fOldName,fDLcount"
		whereClause = "bNbr='" & bNbr & "'"
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


	dim yy,mm,dd,h,mi
	yy = year(writeDT)
   	mm = right("0" & month(writeDT),2)
   	dd = right("0" & day(writeDT),2)
    	h = right("0" & hour(writeDT),2)
    	mi = right("0" & minute(writeDT),2)
    	writeDT = yy & "년 " & mm & "월 " & dd & "일 (" & h & ":" & mi & ")"

	call search_fontcolor()

	If use_tag = "True" And tagHTML = 1 Then
		bTitle = checkword(bTitle)
		bContent = Replace(checkword(bContent), vbCrLf,"<br>")
	ElseIf use_tag = "True" And tagHTML = "True" Then
		bTitle = ReplaceTo(bTitle, "toHTML")
		bContent = ReplaceTo(bContent, "toHTML")
		bContent = AutoLink(bContent)
	Else
		bContent = ReplaceTo(bContent, "toTXT")
		bContent = AutoLink(bContent)
	End If
	'Response.write use_tag & " ---- " & tagHTML

%>
<base href="<%= Application("SiteURLDir") & "CommonAccessories/Board/" %>" target="_self">
<table cellpadding="0" cellspacing="0" border="0" width="<%=bWidth%>">
  <tr>
	<td class="font" align="right"><% call memberForm %> &nbsp; </td>
  </tr>
</table>

<table width="<%=bWidth%>" bgcolor="<%=tb_bgcolor%>" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td colspan="2" background="Images/line2.gif" height="5"></td>
</tr>
<tr height="25">
	<td width="110" bgcolor="#eeeeee" class="form_title" align="right"><b>이 &nbsp; 름 &nbsp;</b></td>
	<td align="left">&nbsp; <% if mem_auth = 0 then %><%=userName%><% else %><b><%=userName%></b><% end if %><% if userEmail <>"" then %> &nbsp; [<% if use_smtp=1 then %><a href="email.asp?bID=<%=bID%>&page=<%=page%>&userEmail=<%=userEmail%>&homepage=content&bNbr=<%=bNbr%><% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>"><% else %><a href="mailto:<%=userEmail%>"><% end if %><%=userEmail%></a>]<% end if %></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<% if homepage<>"" then %>
<tr height="25">
	<td width="110" bgcolor="#eeeeee" class="form_title" align="right"><b>홈페이지 &nbsp;</b></td>
	<td align="left" class="font1">&nbsp; <a href="http://<%=homepage%>" target="_blank">http://<%=homepage%></a></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<% end if %>
<% if link1<>"" then %>
<tr height="25">
	<td width="110" bgcolor="#eeeeee" class="form_title" align="right"><b>관련링크#1 &nbsp;</b></td>
	<td align="left" class="font1">&nbsp; <a href="http://<%=link1%>" target="_blank">http://<%=link1%></a></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<% end if %>
<% if link2<>"" then %>
<tr height="25">
	<td width="110" bgcolor="#eeeeee" class="form_title" align="right"><b>관련링크#2 &nbsp;</b></td>
	<td align="left" class="font1">&nbsp; <a href="http://<%=link2%>" target="_blank">http://<%=link2%></a></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<% end if %>


<%
	'파일관련 출력부분
	If bType > 0 And file = 1 then
		for i = 0 to Ubound(fNameArray) - 1 '파일이름이 1부터 시작이냉..
			fOrder = fOrderArray(i)
			fName = fNameArray(i)
			fSize = fSizeArray(i)
			fDLcount = fDLcountArray(i)

%>
<tr height="25">
	<td width="110" bgcolor="#eeeeee" class="form_title" align="right"><b>첨부파일#<%= i+1 %>&nbsp;</b></td>
	<td align="left" class="font1">&nbsp;
	<a href="<%=uploadType%>_down.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&fOrder=<%= fOrder %>"><%= fName %> (size : <%= fSize %>)</a>
	&nbsp; &nbsp; <span style="color:#666666;"><b>Download</b> : <%= fDLcount %></span></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<%
		next
 	end if 	'If bType > 0 And file = 1 then
 %>

<tr height="25">
	<td width="110" bgcolor="#eeeeee" class="form_title" align="right"><b>제 &nbsp; 목 &nbsp;</b></td>
	<td align="left">&nbsp; <%=bTitle%></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
</table>

<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="2" style="word-break:break-all;padding:10px;" valign="top">
<%
	if IsArray(fNameArray) then

		'#이미지파일 확장자
		Dim imgFileExt
		imgFileExt = "jpg,jpeg,gif,pcx,bmp"
		for i = 0 to Ubound(fNameArray) - 1 '파일이름이 1부터 시작이냉..
			filePath = "FileData/" & bID & "/" & fNameArray(i)

			if viewImage = "True" And (InStr(imgFileExt, GetFileExtension(fNameArray(i))) > 0) then
%>
			<A href="<%= filePath %>" target="_blank">
			<Img name="imageFile" src="<%= filePath %>" hspace="10" border="0" alt="<%= fNameArray(i) %>"></A>

<%
	   			if ((i+1) mod 6) = 0 then Response.write("<br>")
 			end if	'if viewImage = "True" And (InStr(imgFileExt, GetFileExtension(fNameArray(i))) > 0) then
		next

		'#동영상파일 확장자
		Dim muiltFileExt
		muiltFileExt = "mp3,asf,wmv,mpg,mpeg,avi,wav"
		for i = 0 to Ubound(fNameArray) - 1 '파일이름이 1부터 시작이냉..
			filePath = "FileData/" & bID & "/" & fNameArray(i)

			if playMultimedia = "True" And (InStr(muiltFileExt, GetFileExtension(fNameArray(i))) > 0) then
%>
	 		<br><br>첨부파일 #<%= i+1 %> : <%=fNameArray(i)%><br>
	 		<embed src="<%= Application("SiteURLDir") %>CommonAccessories/Board/<%= filePath %>" autostart="false">
	 		</embed><br>
	 		*플레이를 원하시면 시작버튼을 누르세요.
<%
	   			Response.write("<br>")
 			end if	'if playMultimedia = "True" And (InStr(muiltFileExt, GetFileExtension(fNameArray(i))) > 0) then
		next

		Response.write("<p><br>")
 	end if 	'if IsArray(fNameArray(i)) then
%>

	<%=bContent%>
	<br><br>
	<div align="right" style="font-family:굴림,verdana;font-size:7.9pt;text-align:right;color:#666666;">
	(<b>작성일 : </b><%=writeDT%>, &nbsp; <b>조회수 : </b><%=viewCount%>
	<% if use_rcmd = "True" then %>, &nbsp; <b>추천수 : </b><%=rcmdCount%><% end if %>
	<% if view_ip = "True" then %>, &nbsp; <b>IP : </b><%=IPaddress%><% end if %>)
	</div></td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>

<%
	if use_comment = "True" then

	dim com_sql,cmtRS	',cmtOrder,com_num,userName,cmtWriteDT,cmtMemo,userPW,IPaddress,com_mem_auth,MbrID
	'Dim bNbr,cmtOrder,MbrID,userName,userPW,cmtMemo,cmtWriteDT,IPaddress



	SQL = "SELECT cmtOrder,MbrID,userName,userPW,cmtWriteDT,cmtMemo,IPaddress FROM " & bCmtTable
	SQL = SQL & " where bNbr = " & request("bNbr")
	SQL = SQL & " order by cmtOrder asc"
	Set cmtRS = dbConn.Execute(SQL)

	i=1
	Do until cmtRS.EOF

		cmtOrder=cmtRS("cmtOrder")
		MbrID=cmtRS("MbrID")
		userName=cmtRS("userName")
		cmtWriteDT=cmtRS("cmtWriteDT")
		cmtMemo = Replace(cmtRS("cmtMemo"), vbCrlf,"<br>")
		IPaddress=cmtRS("IPaddress")

		yy = year(cmtWriteDT)
		mm = right("0" & month(cmtWriteDT),2)
		dd = right("0" & day(cmtWriteDT),2)
		h = right("0" & hour(cmtWriteDT),2)
		mi = right("0" & minute(cmtWriteDT),2)
		cmtWriteDT = yy & "년 " & mm & "월 " & dd & "일 " & h & ":" & mi

		if (MbrID <> "" And MbrID = Session("MbrID")) Or Session("sID") <> "" then
			cmtDel = 1
		else
			cmtDel = 0
		end if

%>
<tr>
	<td colspan="2" class="font1" style="word-break:break-all;padding:5px;">
	<b><%=userName%></b> &nbsp; &nbsp; <span style="font-size:7.5pt;">
	(<%=cmtWriteDT%><% if view_ip="True" then %>, &nbsp; IP:<%=IPaddress%><% end if %>)</span>&nbsp; &nbsp;

	 <a href="<% if cmtDel = 1 then %>memo_ok<% else %>pin<% end if %>.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&page=<%=page%>&mode=com_del&cmtOrder=<%=cmtOrder%>
	 	<% if cmtDel = 1 then %>&mem=ok<% end if %>
	 	<% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>">
	 <img src="images/but_com_del.gif" border="0"></a>
	</td>
</tr>
<tr>
	<td colspan="2" style="word-break:break-all;padding:5px;font-family:굴림,verdana;font-size:9pt;color:#666666;" valign="top">
	<%=cmtMemo%>
	</td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<%
		cmtRS.movenext
		i=i+1
	loop

	CloseRS(cmtRS)
%>
<%if cw_level >= session("level") then%>
<tr>
	<td colspan="2" align="center">
	<br>
<script language="javascript">
<!--//
function ok()
{
<% if Session("MbrID") = "" then %>
	if (document.frmMemo.userName.value =="") {
		alert("이름을 입력해 주세요.");
		document.frmMemo.userName.focus();
		return;
	}

	if (document.frmMemo.userPW.value =="") {
		alert("비밀번호를 입력해 주세요.");
		document.frmMemo.userPW.focus();
		return;
	}
	/*
	var letters = 'ghijklabvwxyzABCDEFef)_+|<>?:mnQRSTU~!@#$%^VWXYZ`1234567opGHIJKLu./;'+"'"+'[]MNOP890-='+'\\'+'&*("{},cdqrst '+"\n";
	var split = letters.split("");var num = '';var c = '';
	var encrypted = '';
	var it = document.frmMemo.userPW.value;
	var b = '0';var chars = it.split("");while(b<it.length){c = '0';while(c<letters.length){if(split[c] == chars[b]){if(c == "0") { c = ""; }if(eval(c+10) >= letters.length){num = eval(10-(letters.length-c));encrypted += split[num];}else{num = eval(c+10);encrypted += split[num];}}c++;}b++;}document.frmMemo.userPW.value = encrypted;encrypted = '';
	*/
<% end if %>

	if (document.frmMemo.cmtMemo.value =="") {
		alert("내용을 입력해 주세요.");
		document.frmMemo.cmtMemo.focus();
		return;
	}

	document.frmMemo.submit();

}
//-->
</script>
	<table border="0" cellpadding="0" cellspacing="0" width="<%=bWidth%>">
	<form name="frmMemo" method="post" action="bComment_ok.asp">
	<input type="hidden" name="bID" value="<%=bID%>">
	<input type="hidden" name="page" value="<%=page%>">
	<input type="hidden" name="bNbr" value="<%=bNbr%>">
	<input type="hidden" name="st" value="<%=st%>">
	<input type="hidden" name="sc" value="<%=sc%>">
	<input type="hidden" name="sn" value="<%=sn%>">
	<input type="hidden" name="sw" value="<%=sw%>">

	<tr align="center" height="30">
		<td align="center">
		<table border="0" cellpadding="10" cellspacing="1" bgcolor="#666666" width="100%">
		<tr>
			<td bgcolor="#EEEEEE">
			<% if Session("MbrID") = "" then %>
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="font1"><b>이 름</b>&nbsp;</td>
				<td><input type="text" name="userName" size="10" maxlength="20" class="form_input">
				&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="font1"><b>비밀번호</b>&nbsp;</td>
				<td><input type="password" name="userPW" size="10" maxlength="15" class="form_input">&nbsp;&nbsp;</td>
			</tr>
			</table>
			<br>
			<% else %>
				<input type="hidden" name="MbrID" value="<%=Session("MbrID")%>">
				<!-- 필요없음 input type="hidden" name="userName" value="<%=Session("MbrName")%>">
				<input type="hidden" name="userPW" value="<%=session("pin")%>"-->
			<% end if %>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td class="font1"><b>메 모</b></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><textarea name="cmtMemo" style="width:100%;" rows="3" class="form_textarea"></textarea>&nbsp;&nbsp;</td>
				<td width="70" align="center">
				<input type="button" name="btnMemo" class="but" value=" 확 인 " onclick="javascript:ok();"></td>
			</tr>
			</table>
			</td>
		</tr>
		</table><br>
		</td>
	</tr>
	</form>
	</table>
	</td>
</tr>
<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
</tr>
<% end if %>
<% end if %>
<tr>
	<td colspan="2">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	</table>
	</td>
</tr>
</table>
<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td align="right" style="word-break:break-all;padding:5px;">
		<% if use_rcmd = "True" then %>
			<a href="bView.asp?bID=<%=bID%>&page=<%=page%>&bNbr=<%=bNbr%>&mode=rcmd<% if sw<>"" then %>&st=<%=Request.QueryString("st")%>&sc=<%=Request.QueryString("sc")%>&sn=<%=Request.QueryString("sn")%>&sw=<%=Request.QueryString("sw")%><% end if %>">
			<img src="images/but_reco.gif" border="0"></a>
		<% end if %>

		<%if rw_level >= CInt(session("level")) then%>
			<% if (bType < 2 and notice <> 1) or bType < 2 then %>
				<a href="bForm.asp?bID=<%=bID%>&page=<%=page%>&bNbr=<%=bNbr%>&mode=reply<% if sw<>"" then %>&st=<%=Request.QueryString("st")%>&sc=<%=Request.QueryString("sc")%>&sn=<%=Request.QueryString("sn")%>&sw=<%=Request.QueryString("sw")%><% end if %>">
				<img src="images/but_reply.gif" border="0"></a>
			<% end if %>
		<% end if %>

		<% if w_level >= session("level") then %>
			<a href="bForm.asp?bID=<%=bID%>"><img src="images/but_write.gif" border="0"></a>
		<% end if %>

		<% if Session("MbrID") = MbrID Or (CInt(Session("sLevel4")) > 1) then %>
			<a href="<% if (Session("MbrID") = MbrID And MbrID <> "") Or (CInt(Session("sLevel4")) > 1) then %>
			form<% else %>pin<% end if %>.asp?bID=<%=bID%>&page=<%=page%>&bNbr=<%=bNbr%>&mode=edit
			<% if (Session("MbrID") = MbrID) Or (CInt(Session("sLevel4")) > 1) then %>&mem=ok<% end if %>

			<% if sw<>"" then %>&st=<%=Request.QueryString("st")%>&sc=<%=Request.QueryString("sc")%>&sn=<%=Request.QueryString("sn")%>&sw=<%=Request.QueryString("sw")%><% end if %>">
				<img src="images/but_edit.gif" border="0">
			</a>

			<a href="<% if (Session("MbrID") = MbrID And MbrID <> "") Or (CInt(Session("sLevel4")) > 1) then %>
			del_ok<% else %>pin<% end if %>.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&mode=del<% if (Session("MbrID") = MbrID) Or (CInt(Session("sLevel4")) > 1) then %>&mem=ok<% end if %>

			<% if sw<>"" then %>&st=<%=Request.QueryString("st")%>&sc=<%=Request.QueryString("sc")%>&sn=<%=Request.QueryString("sn")%>&sw=<%=Request.QueryString("sw")%><% end if %>">
			<img src="images/but_del.gif" border="0"></a> <% end if %>

			<% if sw<>"" then %><a href="bList.asp?bID=<%=bID%>&page=<%=page%>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%>">
			<img src="images/but_search_list.gif" border="0"></a>
		<% end if %>
		<a href="bList.asp?bID=<%=bID%>&page=<%=page%>"><img src="images/but_list.gif" border="0"></a>
	</td>
</tr>
</table>
<%
if relPostings = 1 then

dim p_num,p_title,p_name,n_num,n_title,n_name
call pre_next(p_num,n_num,p_title,p_name,n_title,n_name)
%>
<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="2">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	</table>
	</td>
</tr>
<tr>
	<td colspan="2">
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<% If p_num <> 0 Then %>
		<tr align="center" height="22">
			<td width="100"><b style="font-size:8pt;">이전글</b></td>
			<td align="left" style="word-break:break-all;">
			<a href="bView.asp?bID=<%=bID%>&bNbr=<%=p_num%>&page=<%=page%>&sw=<%=sw%>&sn=<%=sn%>&st=<%=st%>&sc=<%=sc%>" onfocus="this.blur()">
			<%=p_title%></a></td>
			<td width="100" nowrap><%=p_name%></td>
		</tr>
		<tr>
			<td colspan="3" height="1" bgcolor="#cccccc"></td>
		</tr>
		<% End If %>

		<% If n_num <> 0 Then %>
		<tr align="center" height="22">
			<td width="100"><b style="font-size:8pt;">다음글</b></td>
			<td align="left" style="word-break:break-all;"><a href="bView.asp?bID=<%=bID%>&bNbr=<%=n_num%>&page=<%=page%>&sw=<%=sw%>&sn=<%=sn%>&st=<%=st%>&sc=<%=sc%>" onfocus="this.blur()"><%=n_title%></a></td>
			<td width="100" nowrap><%=n_name%></td>
		</tr>
		<% End If %>
	</table></td>
</tr>
<tr>
	<td colspan="2">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	</table>
	</td>
</tr>
</table>
<% elseif relPostings = 2 then%>
<Script Language="javascript">
<!--

	var select_obj;
	function inno_layer(name,status) {
		var obj=document.all[name];
		var _tmpx,_tmpy, marginx, marginy;
		_tmpx = event.clientX + parseInt(obj.offsetWidth);
		_tmpy = event.clientY + parseInt(obj.offsetHeight);
		_marginx = document.body.clientWidth - _tmpx;
		_marginy = document.body.clientHeight - _tmpy ;
		if(_marginx < 0)
			_tmpx = event.clientX + document.body.scrollLeft + _marginx ;
		else
			_tmpx = event.clientX + document.body.scrollLeft ;
		if(_marginy < 0)
			_tmpy = event.clientY + document.body.scrollTop + _marginy +20;
		else
			_tmpy = event.clientY + document.body.scrollTop ;
		obj.style.posLeft=_tmpx-13;
		obj.style.posTop=_tmpy-12;
		if(status=='visible') {
			if(select_obj) {
				select_obj.style.visibility='hidden';
				select_obj=null;
			}
			select_obj=obj;
		}else{
			select_obj=null;
		}
		obj.style.visibility=status;
	}

	function show_layer(bNbr, userName, userEmail, homepage, bID, mem_auth, mem_id, admin) {
		var printHeight = 0;
		var printMain="";

		if(userEmail) {
			printMain = "<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=location.href='email.asp?bID="+bID+"&page=<%=page%>&userEmail="+userEmail+"&homepage=list<% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>';><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=images/n_mail.gif border=0 align=absmiddle>&nbsp;&nbsp;메일 보내기&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
		}
		if(homepage) {
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=window.open('http://"+homepage+"');><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=images/n_homepage.gif border=0 align=absmiddle>&nbsp;&nbsp;홈페이지&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
		}
		{
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=location.href='bList.asp?bID="+bID+"&sn=on&st=off&sc=off&sw="+userName+"';><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=images/n_search.gif border=0 align=absmiddle>&nbsp;&nbsp;이름으로 검색&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
		}
		if(mem_auth > 0) {
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=OpenWindow('../member/user_bView.asp?id="+mem_id+"','500','520');><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=images/n_information.gif border=0 align=absmiddle>&nbsp;&nbsp;회원정보 보기&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
			if(admin) {
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=OpenWindow('../member/user_edit.asp?id="+mem_id+"','500','520');><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=images/n_modify.gif border=0 align=absmiddle>&nbsp;&nbsp;<font color=darkred>회원정보 변경&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
			}
		}

		var printHeader = "<div id='"+bNbr+"' style='position:absolute; left:10px; top:25px; width:127; height: "+printHeight+"; z-index:1; visibility: hidden' onMousedown=inno_layer('"+bNbr+"','hidden')><table border=0><tr><td colspan=3 onMouseover=inno_layer('"+bNbr+"','hidden') height=3></td></tr><tr><td width=5 onMouseover=inno_layer('"+bNbr+"','hidden') rowspan=2>&nbsp;</td><td height=5></td></tr><tr><td><table style=cursor:hand border='0' cellspacing='1' cellpadding='0' bgcolor='black' width=100% height=100%><tr><td valign=top bgcolor=white><table border=0 cellspacing=0 cellpadding=3 width=100% height=100%>";
		var printFooter = "</table></td></tr></table></td><td width=5 rowspan=2 onMouseover=inno_layer('"+bNbr+"','hidden')>&nbsp;</td></tr><tr><td colspan=3 height=10 onMouseover=inno_layer('"+bNbr+"','hidden')></td></tr></table></div>";

		document.writeln(printHeader+printMain+printFooter);
	}

//-->
</Script>
<%
	rs.Close

	if use_rcmd = 1 and view_reco = 1 then
		colspan = 7
	else
		colspan = 6
	end if

	dim content_back,content_next

	SQL = "SELECT (bNbr) FROM "&bID&" where reID = 0 and replyGrp > " & replyGrp

	Set rs = dbConn.Execute(SQL)

	if not (rs.BOF or rs.EOF) then
		content_back = rs(0)
	end if

	rs.Close


	SQL = "SELECT max(bNbr) FROM "&bID&" where reID = 0 and replyGrp < " & replyGrp

	Set rs = dbConn.Execute(SQL)

	if not (rs.BOF or rs.EOF) then
		content_next = rs(0)
	end if

	rs.Close


	SQL = "SELECT * FROM "&bID&" where replyGrp = " & replyGrp

	if content_back <> "" then
		SQL = SQL & " or replyGrp =" & content_back
	end if

	if content_next <> "" then
		SQL = SQL & " or replyGrp =" & content_next
	end if


	SQL = SQL & " order by replyGrp desc,reID asc"

    rs.Open SQL,db

%>

<%  if Rs.BOF or Rs.EOF then
    else
%>

<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="<%=colspan-1%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	</table>
	</td>
</tr>
<%

	Dim nowday,write_diff,resame,file,blank,colspan

	Do until Rs.EOF

    bNbr = rs("bNbr")
    id = rs("id")
    userName = rs("userName")
    bTitle = rs("bTitle")
    userEmail = rs("userEmail")
    homepage = rs("homepage")
    write_diff=rs("writeDT")
    writeDT = left(write_diff,8)
    viewCount = rs("viewCount")
    rcmdCount = rs("rcmdCount")

    resame = rs("resame")
    tagHTML = rs("tagHTML")
    'secret = rs("secret")
    'mem_auth = rs("mem_auth")

    if rs("filename1")<>"" or rs("filename2")<>"" or rs("filename3")<>"" or rs("filename4")<>"" then
		file=1
	else
		file=0
    end if

    blank=4*resame

    if left(now,2)="20" then
		nowday=mid(now,3)
	else
		nowday=now
	end if

	if left(writeDT,8) = left(nowday,8) then
		writeDT=right(write_diff,11)
		writeDT=left(writeDT,8)
	end if

	call len_process()

	call search_fontcolor()

	call db_comment()

%>

<tr align="center" height="20" <% if nt_tr = 1 and DateDiff("d",write_diff,nowday) < new_title then %>bgcolor="<%=nt_color%>"<% else %>onmouseover="this.style.background='<%=tr_chcolor%>'" onmouseout="this.style.background='<%=tb_bgcolor%>'<% end if %>">
	<td width="24"></td>
	<td align="left"><% if nt_img = 1 and DateDiff("d",write_diff,nowday) < new_title then %><% if file=1 then %><img src="images/new_file.gif" border="0"><% else %><img src="images/new_normal.gif" border="0"><% end if %><% else %><% if file=1 then %><img src="images/file.gif" border="0"><% else %><img src="images/normal.gif" border="0"><% end if %><% end if %>&nbsp;<% if resame <> 0  then %><img src="images/blank.gif" width="<%=blank%>" height="5" border="0"><img src="images/re.gif" border="0"> <% end if %><a href="<% if secret <> 0 then %>userPW<% else %>view<% end if %>.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&page=<%=page%><% if secret <> 0 then %>&mode=secret<% end if %><% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>"><%=bTitle%></a><% if com_record<>0 then %> &nbsp;<img src="images/comment.gif" border="0"><span style="font-size:8pt;">(<%=com_record%>)</span><% end if %></td>
	<td width="100"><span onMousedown="inno_layer('info_layer<%=id_num%>','visible')" style=cursor:hand><% if mem_auth = 0 then %><%=userName%><% else %><b><%=userName%></b><% end if %></span><script>show_layer('info_layer<%=id_num%>', '<%=userName%>', '<%=userEmail%>', '<%=homepage%>', '<%=bID%>', '<%=mem_auth%>', '<%=id%>', '<% if Session("MbrID")="admin" then %>1<% end if %>');</script></td>
	<td width="100"><%=writeDT%></td>
	<td width="40"><%=viewCount%></td>
	<% if use_rcmd = 1 and view_reco = 1 then %><td width="40"><%=rcmdCount%></td><% end if %>
</tr>
<tr>
	<td colspan="<%=colspan-1%>" height="1" bgcolor="#999999"></td>
</tr>

<%
    Rs.Movenext
id_num = id_num - 1

  Loop

%>
<tr>
	<td colspan="<%=colspan-1%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#999999"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#cccccc"></td>
	</tr>
	</table>
	</td>
</tr>
</table>

<% end if%><% end if%>

<% if relPostings = 3 then server.execute("../board/bList.asp") %>
<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="2" align="right"></td>
</tr>
</table>

<%
	Call CloseRS(Rs)
%>



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
