<!-- ShopSetting Start -->
	<!-- #include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<!-- #include File="BoardInfo_inc.asp" -->
<!-- #include File="../../CommonLibrary/fsBoard_inc.asp" -->
<%
	Session("PageTitleName") = "게시판"
%>
<% StartTime = Timer() %>
<% session("read")="" %>

<%
	if l_level < Session("level4") then Response.Redirect "inc/error.asp?no=4"
%>

<%
	Dim pagecount, recordCount,colspan

	Session("bID") = request("bID")

	page = Request("page")
	if page = "" then page = 1

	'보드바디데이터를 가져온다.
	Call BoardBodyData()		'call db_list

	if use_rcmd = "True" then
		colspan = 7
	else
		colspan = 6
	end if
%>
<html>
<head>
<title><%=bTitleName%></title>
<LINK rel="stylesheet" type="text/css" href="IncTemplates/style.css">
<Script Language="javascript">
<!--
browserName = navigator.appName;
browserVer = parseInt(navigator.appVersion);
if(browserName == "Netscape" && browserVer >= 3){ init = "net"; }
else { init = "ie"; }


if(((init == "net")&&(browserVer >=3))||((init == "ie")&&(browserVer >= 4))){

 sn_on=new Image;
 sn_off=new Image;
 sn_on.src=  "Images/sn_on.gif";
 sn_off.src= "Images/sn_off.gif";

 st_on=new Image;
 st_off=new Image;
 st_on.src=  "Images/st_on.gif";
 st_off.src= "Images/st_off.gif";

 sc_on=new Image;
 sc_off=new Image;
 sc_on.src=  "Images/sc_on.gif";
 sc_off.src= "Images/sc_off.gif";

}

function OnOff(name) {
if(((init == "net")&&(browserVer >=3))||((init == "ie")&&(browserVer >= 4))) {
  if(document.inno[name].value=='on')
  {
   document.inno[name].value='off';
   ImgSrc=eval(name+"_off.src");
   document[name].src=ImgSrc;
  }
  else
  {
   document.inno[name].value='on';
   ImgSrc=eval(name+"_on.src");
   document[name].src=ImgSrc;
  }
 }
}


function box(inno)
{

	   if (inno.style.display != "none")
           inno.style.display = "none"
           else
           inno.style.display = ""
}

function admin_submit()
{
	if (document.adminform.admin_pin.value =="") {
		alert("비밀번호를 입력해 주세요.");
		document.adminform.admin_pin.focus();
		return;
	}

	document.adminform.submit();

}

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
			//printMain = "<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=location.href='email.asp?bID="+bID+"&page=<%=page%>&userEmail="+userEmail+"&homepage=list<% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>';><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=Images/n_mail.gif border=0 align=absmiddle>&nbsp;&nbsp;메일 보내기&nbsp;&nbsp;</td></tr>";
			//printHeight = printHeight + 16;
		}
		if(homepage) {
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=window.open('http://"+homepage+"');><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=Images/n_homepage.gif border=0 align=absmiddle>&nbsp;&nbsp;홈페이지&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
		}
		{
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=location.href='bList.asp?bID="+bID+"&sn=on&st=off&sc=off&sw="+userName+"';><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=Images/n_search.gif border=0 align=absmiddle>&nbsp;&nbsp;이름으로 검색&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
		}

		if(mem_auth > 0) {
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=OpenWindow('../member/user_bView.asp?id="+mem_id+"','500','520');><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=Images/n_information.gif border=0 align=absmiddle>&nbsp;&nbsp;회원정보 보기&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
			if(admin) {
			printMain = printMain +	"<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' onMousedown=OpenWindow('../member/user_edit.asp?id="+mem_id+"','500','520');><td style=font-family:굴림;font-size:9pt height=18 nowrap>&nbsp;<img src=Images/n_modify.gif border=0 align=absmiddle>&nbsp;&nbsp;<font color=darkred>회원정보 변경&nbsp;&nbsp;</td></tr>";
			printHeight = printHeight + 16;
			}
		}

		var printHeader = "<div id='"+bNbr+"' style='position:absolute; left:10px; top:25px; width:127; height: "+printHeight+"; z-index:1; visibility: hidden' onMousedown=inno_layer('"+bNbr+"','hidden')><table border=0><tr><td colspan=3 onMouseover=inno_layer('"+bNbr+"','hidden') height=3></td></tr><tr><td width=5 onMouseover=inno_layer('"+bNbr+"','hidden') rowspan=2>&nbsp;</td><td height=5></td></tr><tr><td><table style=cursor:hand border='0' cellspacing='1' cellpadding='0' bgcolor='black' width=100% height=100%><tr><td valign=top bgcolor=white><table border=0 cellspacing=0 cellpadding=3 width=100% height=100%>";
		var printFooter = "</table></td></tr></table></td><td width=5 rowspan=2 onMouseover=inno_layer('"+bNbr+"','hidden')>&nbsp;</td></tr><tr><td colspan=3 height=10 onMouseover=inno_layer('"+bNbr+"','hidden')></td></tr></table></div>";

		document.writeln(printHeader+printMain+printFooter);
	}

var checkflag = "false";

function checkboxall() {

field = eval("document.inno_check.cart");

if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
return;
}

else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return;
}

}

function del_cart()
{
document.inno_check.submit();
}

function OpenWindow(homepage,intWidth,intHeight) {
      window.open(homepage, "joins", "width="+intWidth+",height="+intHeight+",resizable=0,scrollbars=1");
}
//-->
</Script>
<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)

CheckValue = replace(CheckValue, "&lt;", "<")
CheckValue = replace(CheckValue, "&gt;", ">")
CheckValue = replace(CheckValue, "&quot;", "'")
CheckValue = replace(CheckValue, "&amp;", "&" )
CheckWord = CheckValue
End Function
</script>

</head>
<body bgcolor="<%=bgcolor%>" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" oncontextmenu="return false">
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
<% 'if session("read")="" and Request.QueryString("bNbr")="" then %>
<% 'end if %>


<base href="<%= Application("SiteURLDir") & "CommonAccessories/Board/" %>" target="_self">
<table cellpadding="0" cellspacing="0" border="0" width="<%=bWidth%>">
  <tr>
    <td class="font"><img src="Images/reference.gif" border="0"> <img src="Images/total.gif" border="0"> <%=recordCount%>, &nbsp; <img src="Images/pages.gif" border="0"> <%=page%> / <%=pagecount%></td>
    <td width="300" class="font" align="right">
    <% if session("read")="" and Request.QueryString("bNbr")="" then %>
    <% call memberForm %> &nbsp; <% end if %></td>
  </tr>
</table>

<%
	Dim bNbr,MbrID,userName,bTitle,homepage,userEmail,writeDT,viewCount,rcmdCount,reSame,tagHTML,secret,mem_auth,blank,img_check,id_num,file,filename1,i_width1,i_height1
	Dim nowday,write_diff

	if bType < 2 then
%>
<table width="<%=bWidth%>" bgcolor="<%=tb_bgcolor%>" border="0" cellpadding="0" cellspacing="0" ID="Table9">
<form method="post" name="inno_check" action="del_ok.asp?bID=<%=bID%>&page=<%=page%>&mode=del_cart" ID="Form1">
<tr>
	<td width="50" height="15"><img src="Images/title_num.gif"></td>
	<td width="24" align="center"><a href=javascript:checkboxall();><img src="Images/title_c.gif" border="0"></a></td>
	<td align="center"><img src="Images/title_title.gif"></td>
	<td align="center" width="100"><img src="Images/title_name.gif"></td>
	<td align="center" width="100"><img src="Images/title_date.gif"></td>
	<td align="center" width="40"><img src="Images/title_visit.gif"></td>
	<% if use_rcmd = "True" then %><td width="40"><img src="Images/title_hit.gif"></td><% end if %>
</tr>
<tr>
  <td colspan="<%=colspan%>" background="Images/line1.gif" height="5" colspan="8"></td>
</tr>
<%
	Do until Rs.EOF

	    bNbr = rs("bNbr")
	    MbrID = rs("MbrID")
	    userName = rs("userName")
	    secretPW = Trim(rs("secretPW"))
	    bTitle = rs("bTitle")
	    userEmail = rs("userEmail")
	    homepage = rs("homepage")
	    write_diff=rs("writeDT")
	    writeDT = left(write_diff,10)
	    viewCount = rs("viewCount")
	    rcmdCount = rs("rcmdCount")
	    reSame = rs("reSame")
	    tagHTML = rs("tagHTML")

		if CInt(Session("sLevel4")) > 1 or secretPW = "" then
			secret = 0
		else
			secret = 1
		end if

	    	'파일관련 테이블 체크
	    	SQL = "Select * From " & bFilesTable & " Where bNbr= " & bNbr
		RSresult = OpenSimpleRS(fRS,SQL)
		if RSresult <> "Empty" then
			file=1
			Call CloseRS(fRS)
		else
			file=0
		end if


	    blank = 3 * reSame

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


<tr align="center" height="20" <% if nt_tr = 1 and DateDiff("d",write_diff,nowday) < newPostings then %>bgcolor="<%=nt_color%>"<% else %>onmouseover="this.style.background='<%=tr_chcolor%>'" onmouseout="this.style.background='<%=tb_bgcolor%>'<% end if %>">
	<td width="50"><% if bNbr > 100000000 then %><img src="Images/notice.gif"><% else %><%=id_num%><% end if %></td>
	<td width="24"><input type="checkbox" name="cart" value="<%=bNbr%>"></td>
	<td align="left">
	<% if DateDiff("d",write_diff,nowday) < CInt(newPostings) then %>
		<% if file=1 then %>
			<img src="Images/new_file.gif" border="0">
		<% else %>
			<img src="Images/new_normal.gif" border="0">
		<% end if %>
	<% else %>
		<% if file=1 then %>
			<img src="Images/file.gif" border="0">
		<% else %>
			<img src="Images/normal.gif" border="0">
		<% end if %>
	<% end if %>
	&nbsp;
	<% if reSame <> 0  then %>
		<img src="Images/blank.gif" width="<%=blank%>" height="5" border="0">
		<img src="Images/re.gif" border="0">
	<% end if %>
	<a href="<% if secret <> 0 then %>pin<% else %>bView<% end if %>.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&page=<%=page%>
	<% if secret <> 0 then %>&mode=secret<% end if %>
	<% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>">
	<%=bTitle%></a><% if com_record<>0 then %>
	&nbsp;<img src="Images/comment.gif" border="0">
	<span style="font-size:8pt;">(<%=com_record%>)</span><% end if %></td>
	<td width="100">
		<span onMousedown="inno_layer('info_layer<%=id_num%>','visible')" style=cursor:hand>
			<% if mem_auth = 0 then %>
				<%=userName%>
			<% else %>
				<b><%=userName%></b>
			<% end if %>
		</span>
	<script>
		show_layer('info_layer<%=id_num%>', '<%=userName%>', '<%=userEmail%>', '<%=homepage%>', '<%=bID%>', '<%=mem_auth%>', '<%=MbrID%>', '<% if CInt(Session("sLevel4")) > 1 then %>1<% end if %>');
	</script>
	</td>
	<td width="100"><%=writeDT%></td>
	<td width="40"><%=viewCount%></td>
	<% if use_rcmd = "True" then %><td width="40"><%=rcmdCount%></td><% end if %>
</tr>

<tr>
  <td height="5" colspan="<%=colspan%>" background="Images/dotline1.gif"></td>
</tr>

<%
    Rs.Movenext
    id_num = id_num - 1
  Loop
%>
<tr>
    <td colspan="<%=colspan%>" background="Images/line2.gif" height="5" colspan="8"></td>
</tr>

</table>


<%

else '겔러리 일경우

%>
<table width="<%=bWidth%>" bgcolor="<%=tb_bgcolor%>" border="0" cellpadding="0" cellspacing="0" ID="Table5">
<tr>
	<td colspan="2">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" ID="Table8">
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#333333"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	</table>
	</td>
</tr>
</table>
<table width="<%=bWidth%>" bgcolor="<%=tb_bgcolor%>" border="0" cellpadding="0" cellspacing="0" ID="Table10">
<tr>
	<td align="center">
<%

	dim process_gap,nanuki,j

	process_gap = CInt(bWidth)/145

	nanuki = int(process_gap)

	Do until Rs.EOF

%>
<table border="0" cellpadding="0" cellpadding ="0" ID="Table1">
<tr>
<%
	for j=1 to nanuki

	    bNbr = rs("bNbr")
	    MbrID = rs("MbrID")
	    userName = rs("userName")
	    bTitle = rs("bTitle")
	    userEmail = rs("userEmail")
	    homepage = rs("homepage")
	    write_diff=rs("writeDT")
	    writeDT = left(write_diff,8)
	    viewCount = rs("viewCount")
	    rcmdCount = rs("rcmdCount")
	    reSame = rs("reSame")
	    filename1 = rs("filename1")
	    i_width1 = rs("i_width1")
	    i_height1 = rs("i_height1")

	    if i_width1=0 and i_height1=0 then
			filename1 = "../../Images/noimage.jpg"
			i_height1 = 100
			i_width1 =  145
		elseif i_width1 > 145 and i_height1 > 100 then

			i_height1 = 100
			i_width1 =  i_width1 / (rs("i_height1")/i_height1)

			if i_width1 > 145 then
				i_width1 = 145
				i_height1 =  rs("i_height1") / (rs("i_width1")/145)
			end if
		end if


	    tagHTML = rs("tagHTML")
	    if session("admin")="admin" then
			secret=0
		else
			secret = rs("secret")
		end if
	    mem_auth = rs("mem_auth")

	    if rs("filename1")<>"" or rs("filename2")<>"" or rs("filename3")<>"" or rs("filename4")<>"" then
			file=1
		else
			file=0
	    end if

	    blank=3*reSame

	    if left(now,2)="20" then
			nowday=mid(now,3)
		else
			nowday=now
		end if

		if left(writeDT,8) = left(nowday,8) then
			writeDT=right(write_diff,11)
			writeDT=left(writeDT,8)
		end if

		call len_process

		call search_fontcolor

		call db_comment

%>

	<td align="center" valign="top">
	<a href="<% if secret <> 0 then %>pin<% else %>bView<% end if %>.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&page=<%=page%>
	<% if secret <> 0 then %>&mode=secret<% end if %>
	<% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>">
	<B><%=bTitle%></B></a>

	<table width="145" height="110" border="0" cellpadding="0" cellpadding ="0" ID="Table6"><tr><td align="center">
	<a href="<% if secret <> 0 then %>pin<% else %>view<% end if %>.asp?bID=<%=bID%>&bNbr=<%=bNbr%>&page=<%=page%>
	<% if secret <> 0 then %>&mode=secret<% end if %>
	<% if sw<>"" then %>&st=<%=st%>&sc=<%=sc%>&sn=<%=sn%>&sw=<%=sw%><% end if %>">
	<img src="FileData/<%=bID%>/<%=filename1%>" width="<%=i_width1%>" height="<%=i_height1%>" border="0"></a>
	</td></tr></table></td>

<%
	    	Rs.Movenext
	    	id_num = id_num - 1

	    	if rs.EOF then
			exit for
		end if
	next
%>
</tr>
</table>
<table width="<%=bWidth%>" border="0" cellpadding="0" cellpadding ="0" ID="Table7">
<tr>
		<td height="1" bgcolor="#cccccc"></td>
</tr>
</table>
<%
  Loop

	Call CloseRS(Rs)
%>
</td>
</tr>
</table>

<table width="<%=bWidth%>" bgcolor="<%=tb_bgcolor%>" border="0" cellpadding="0" cellspacing="0" ID="Table3">
<tr>
	<td colspan="2">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" ID="Table4">
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#333333"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#333333"></td>
	</tr>
	</table>
	</td>
</tr>
</table>
<% end if %>

<table width="<%=bWidth%>" border="0" cellpadding="0" cellspacing="0">
<% if session("read")="" and Request.QueryString("bNbr")="" then %>
<tr>
	<td align="left" style="word-break:break-all;padding:5px;">

	<% if Session("sLevel4") > 1 then %>
		<a href="javascript:del_cart();"><img src="Images/but_del.gif" border="0"></a>
	<% end if %>

	<% if w_level >= Session("level4") then %>
		<a href="bForm.asp?bID=<%=bID%>"><img src="Images/but_write.gif" border="0"></a>
	<% end if %>

	<a href="javascript:box(document.all.form_search)"><img src="Images/but_search.gif" border="0"></a>

	<% if sw<>"" then %>
		<a href="bList.asp?bID=<%=bID%>"><img src="Images/but_list.gif" border="0"></a>
	<% end if %>

	</td>
</tr>
<% end if %>
</form>
<tr>
	<td class="font" align="right"><% Call PageSearch %></td>
</tr>
<% if session("read")="" and Request.QueryString("bNbr")="" then %>
<tr>
	<td align="right" id="form_search" style="display:<% if sw="" then %>none<% end if %>">
		<% Call form_search %>
	</td>
</tr>
<% end if %>
</table>
<!-------------------- 여기부터가 게시판 내용 끝----------------->
	</td>
        </tr>
      <tr>
        <td align="left">
        <!-- #include File="IncTemplates/bIncludeBottomMsgTemplate.asp" -->
      </td>
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
