<%
	QAidx = Request("QAidx")
	qaStatusBit = Request.QueryString("qaStatusBit")
	'인증부분
	if QAidx = "" Or qaStatusBit = "" then Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
	if  CInt(Session("sLevel4")) < 2  And Session("MbrID") = "" And Session("userEmail") = "" then
		Response.Redirect(pageName & "?qaMode=vali")
	end if

	if qaStatusBit = 1 then
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		selectedFields = "SvcStaff,aTitle,aContent,writeOutDT,IPaddress"
		whereClause = "QAidx = " & QAidx
		orderBy = "" '"bnOrder DESC, QAidx DESC"
		RSresult = SelectSimpleRecord(avRS, " Top 1 " & selectedFields, "vAnswer", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		If RSresult = "NotEmpty" Then
			SvcStaff = avRS("SvcStaff")
			aTitle = ReplaceTo(avRS("aTitle"), "toHTML")
			aContent = ReplaceTo(avRS("aContent"), "toHTML")
			writeOutDT = avRS("writeOutDT")
			IPaddress = avRS("IPaddress")
			CloseRS(avRS)
		end if		'If RSresult = "NotEmpty" Then
%>


<style>
	#boxScroll{
		width:405;
		height:180;
		overflow:auto;
		border:0 solid;
		scrollbar-face-color:#FFFFFF;
		scrollbar-shadow-color:#CCCCCC;
		scrollbar-gighlight-color:#777777;
		scrollbar-3dlight-color:#777777;
		scrollbar-darkshadow-color:#777777;
		scrollbar-track-color:#FFFFFF;
		scrollbar-arrow-color:#777777;
	}
.style1 {	color: #006600;
	font-weight: bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<br>
<table width="500" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#EEFFEE">
    <td height="30">&nbsp;</td>
    <td><span class="style1">* 아래와 같이 답변되었습니다.</span></td>
  </tr>
  <tr class="body16">
    <td width="90">
    <div align="center"><font color="#40808A"><img src="Images/tit_title.gif" width="37" height="15"> </font></div></td>
    <td width="250" class="body16" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:10"">
      <%= aTitle %></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="2"></td>
  </tr>
  <tr class="body16" >
    <td height="150"><div align="center"><img src="Images/tit_content.gif" width="59" height="15"></div></td>
    <td valign="top" style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:5">
      <div  class="body16" id="boxScroll">
            <%= aContent %>
	 </div></td>
  </tr>
  <tr class="body16" >
    <td height="30"><div align="center"></div></td>
    <td valign="middle" style="padding-left:10;padding-right:10">>> 담당자 : <%= SvcStaff %> << </td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="2">
		<% If CInt(Session("sLevel4")) > 1 Then %>
		<font size="1"><%= writeOutDT %>  / <%= IPaddress %></font>
        <% end if %>
	</td>
  </tr>
  <!-- tr>
                      <td width="80"><div class="body16">
                          <div align="center"><img src="Images/tit_file.gif"></div>
                        </div></td>
                      <td height="25" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:15""><input name="textarea2" type="text" class="body16" style="border:1 solid #cccccc;background-color:#FFFFFF" value="" size="35"></td>
                      <td height="25" colspan="3" style="padding-top:10;padding-bottom:15""><img src="Imagessearch.gif"></td>
                    </tr>
                    <tr>
                      <td height="5" colspan="5" background="Images/notice_line3.gif"></td>
                    </tr-->
  <tr>
    <td height="30" colspan="2" style="padding-top:10;padding-left:5;padding-right:15;padding-bottom:10""><div align="right">

<% If CInt(Session("sLevel4")) > 1 Then %>
	<% if qaMode = "qav" then %>
    <a href="<%=pageName%>?qaMode=li&QAidx=<%=Request("QAidx")%>&virNbr=<%=Request("virNbr")%>&page=<%=Request("page")%>">
	<img src="Images/qaList.gif" alt="목록보기" width="39" height="22" border="0"></a>
    <% end if %>

	<a href="<%= pageName %>?qaMode=au&QAidx=<%= QAidx %>">
	<img src="Images/qaModify.gif" alt="답변수정하기" width="54" height="22" border="0"></a>

	<a href="javascript:ConfirmJ('해당 답변을 정말 삭제하시겠습니까?', '<%= Application("SiteURLDir") %>CommonAccessories/BoardQnA/qaDelete_ok.asp?qaMode=ad&QAidx=<%= QAidx %>&pageName=<%= pageName %>')">
	<img src="Images/qaDelete.gif" alt="답변삭제하기" width="55" height="22" border="0"></a>
<% end if 	'If CInt(Session("sLevel4")) > 1 Then %>

	</div></td>
  </tr>
</table>

<%
	end if	'if qaStatusBit = 1 then
%>
