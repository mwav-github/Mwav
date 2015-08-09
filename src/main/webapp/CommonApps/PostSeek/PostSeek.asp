<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<%
	frm = Trim(Request("frm"))
	whereTo = Trim(Request("whereTo"))
	addrSeek =Trim(Request.Form("addrSeek"))
	frmWhereTo = frm & "." & whereTo
%>

<html>
<head>
<title>우편번호검색</title>
	<link href="<%= Application("SiteURLDir") %>Include_css/Style.css" rel="stylesheet" type="text/css">
	<link href="<%= Application("SiteURLDir") %>Include_css/Object.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="<%= Application("SiteURLDir") %>Include_js/CommonFunctions.js"></script>
	<script language="JavaScript" src="<%= Application("SiteURLDir") %>Include_js/Function.js"></script>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script language="JavaScript">
<!--
	function pBkCr(irow,Cr){
	ilen=document.all.stb.rows(0).cells.length;
	if (Cr=="IN") for(i=0;i<ilen;i++) document.all.stb.rows(irow).cells(i).style.backgroundColor="#70B9CB";//powderpink
	else for (j=0;j<ilen;j++) document.all.stb.rows(irow).cells(j).style.backgroundColor="#9ACDDA";//#cedee7
	}


	function PostSubmit(){
		if(document.PostSeek.addrSeek.value==""){
			alert("우편번호를 넣으세요!");
			PostSeek.addrSeek.focus();
			return;
		}
		PostSeek.submit();
	}
-->
</script>

<body topmargin="0" leftmargin="0" style="width:100%;overflow-x:hidden;overflow-y:scroll" onLoad="ToFocus(PostSeek.addrSeek)">
<table width="410" border="0" align="center" cellpadding="0" cellspacing="0">
  <FORM NAME="PostSeek" ACTION="PostSeek.asp" METHOD="post">
  <tr>
      <td align="center" valign="top" bgcolor="#63B2C6" class="blue2"> <table width="100" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/gif.gif" width="10" height="5"></td>
          </tr>
        </table>
        <table width="400" height="90" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="bottom" background="images/post_back.gif"><br>
            &nbsp;&nbsp;&nbsp;&nbsp;<br> <table width="400" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td height="20" align="center" class="black12">&nbsp;&nbsp;찾고자 하시는 주소의 동(읍/면/리)를
                    입력하십시오</td>
              </tr>
            </table>
            <table width="400" border="0" cellspacing="0" cellpadding="0">

                <tr>
                  <td width="169" height="18" align="right" valign="bottom" class="black12">예) 
                    청담동, 신림동 &nbsp;&nbsp;&nbsp;</td>
                  <td width="130" height="18"> <input name="addrSeek" id="addrSeek" style="ime-mode:active" value="<%= addrSeek %>" size="15">
                  </td>
                  <td height="18">&nbsp;<a href="javascript:PostSubmit();"><img src="images/search_btn.gif" width="60" height="20" border="0"></a> 
                  </td>
                </tr>

            </table></td>
        </tr>
      </table>
      <table width="400" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="22" height="22" align="center" bgcolor="#63B2C6" class="gray12"><img src="images/back_arrow.gif" width="14" height="13">
          </td>
            <td width="378" height="22" bgcolor="#63B2C6" class="black12">&nbsp;&nbsp;해당하는
              주소를 클릭하시면 됩니다</td>
        </tr>
      </table>
        <table width="396" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" id="stb" style="WIDTH:400px">
          <tr bgcolor="#4097AC" class="white12b">
            <!--#ff4d90 #ffd6dd-->
            <th width="107" height="23">우편번호</th>
            <th width="279" height="23"><input name="frm" type="hidden" id="frm" value="<%= frm %>">
              <input name="whereTo" type="hidden" id="whereTo" value="<%= whereTo %>">
              주 소</Th>
<%
if Len(addrSeek) > 0 then

	SQL="SELECT Distinct * " & " FROM vPost " & " WHERE DONG like '" & addrSeek & "%'"

	RSresult = OpenSimpleRS(rs,SQL)

	if RSresult = "Empty" then
		Response.Write("<TR bgcolor=""#9ACDDA"" class=""black12""><td colspan=2 height=100>"&chr(13))
		Response.Write("<center>"""&Request.Form("addrSeek")& """이라는 읍/면/동은 존재하지 않습니다</center>"&chr(13))
		Response.Write("</td></TR>"&chr(13))
	else
		j=0
		do while not rs.EOF
			j=j+1
			zCode = Trim(rs.Fields("ZIPCODE"))
			totalAddr = Trim(rs.Fields("SIDO")) & " " & Trim(rs.Fields("GUGUN")) & " " & Trim(rs.Fields("DONG")) & " " & Trim(rs.Fields("BUNJI"))

		%>
			  <TR bgcolor="#9ACDDA" class="black12"
		style="CURSOR:HAND"
		Onclick="ReturnID('<%= frmWhereTo %>', '<%= zCode %>|<%= totalAddr %>')" onmouseover=pBkCr(<%=j%>,"IN") onmouseout=pBkCr(<%=j%>,"OUT")>
				<TD height="23" align="center"><%= zCode %></td>
				<td height="23" align="center" bgcolor="#9ACDDA"><%= totalAddr %></td>
			  </tr>
			  <%
		rs.MoveNext
		loop
		Call CloseRS(rs)
	end if
end if
Call CloseDB()
response.write sql
response.end

%>
          <tr bgcolor="#4097AC">
            <td colspan="2"><img src="images/gif.gif" width="10" height="10"></td>
          </tr>
        </table>
      </td>
  </tr>
   </form>
</table>

</body>
</html>


