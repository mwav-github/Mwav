<%
	'Response.write Request.ServerVariables("HTTP_REFERER") & "<br>"
	'Response.write Request.ServerVariables("PATH_INFO") & "<br>"
	'Response.end

	QAidx = Request("QAidx")
	qaStatusBit = Request.QueryString("qaStatusBit")


		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		selectedFields = "MbrID,userName,userPW,userPhone,userEmail,qGroup,qService,qTitle,qContent,writeOutDT,IPaddress"
		whereClause = "QAidx = " & QAidx
		orderBy = "" '"bnOrder DESC, QAidx DESC"
		RSresult = SelectSimpleRecord(qvRS, " Top 1 " & selectedFields, "vQuestion", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		If RSresult = "NotEmpty" Then
			MbrID = qvRS("MbrID")
			userName = ReplaceTo(qvRS("userName"), "toHTML")
			userPW = ReplaceTo(qvRS("userPW"), "toHTML")
			userPhone = ReplaceTo(qvRS("userPhone"), "toHTML")
			userEmail = ReplaceTo(qvRS("userEmail"), "toHTML")
			qGroup = qvRS("qGroup")
			qService = ReplaceTo(qvRS("qService"), "toHTML")
			qTitle = ReplaceTo(qvRS("qTitle"), "toHTML")
			qContent = ReplaceTo(qvRS("qContent"), "toHTML")
			writeOutDT = qvRS("writeOutDT")
			IPaddress = qvRS("IPaddress")
			CloseRS(qvRS)

			'해당조회수증가.
			if Session("sID") = "" And qaMode = "qv"  then
				Call ChangeFvalue("vQuestion","viewCount=viewCount+1","QAidx=" & QAidx)
			end if

		else
			ShowAlertMsg("시스템장애입니다.")
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<table width="500" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="Images/notice_bg1.gif"><img src="Images/notice_2.gif"></td>
    <td background="Images/notice_bg1.gif"><img src="Images/notice_2.gif"></td>
    <td width="70" background="Images/notice_bg1.gif"><img src="Images/notice_2.gif"></td>
    <td align="right"  background="Images/table_bg1.gif"><img src="Images/notice_3.gif" width="16" height="15"></td>
    <td width="80" align="right"  background="Images/notice_bg1.gif"><img src="Images/notice_3.gif" width="16" height="15"></td>
  </tr>
  <tr class="body16">
    <td width="90">
    <div align="center"><font color="#40808A"><img src="Images/tit_title.gif" width="37" height="15"> </font></div></td>
    <td width="250" class="body16" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5">
      <%= qTitle %></td>
    <td>
      <div align="center"><img src="Images/notice_tit3.gif" width="44" height="20"></div></td>
    <td colspan="2" class="body16"><div align="center"><%= qGroup %>
    </div></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
  </tr>
  <tr>
    <td height="25" colspan="5"><div class="body16">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="90" align="center"><img src="Images/tit_name.gif" width="35" height="15"></td>
            <td height="25"  class="body16" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5">
			<%= userName %></td>
            <td width="80" class="body16">
              <div align="center"><img src="Images/tit_password.gif" width="59" height="15"></div></td>
            <td colspan="2" class="body16" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5">
			<%= userPW %>
            </td>
          </tr>
          <tr>
            <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
          </tr>
          <tr>
            <td align="center"><img src="Images/tit_phone.gif" width="44" height="20"></td>
            <td height="25"  class="body16" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5">
			<%= userPhone %></td>
            <td align="center" class="body16"><img src="Images/tit_email.gif" width="37" height="20"></td>
            <td colspan="2"  class="body16" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5">
			<%= userEmail %></td>
          </tr>
        </table>
    </div></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
  </tr>
  <tr class="body16" >
    <td height="150"><div align="center"><img src="Images/tit_content.gif" width="59" height="15"></div></td>
    <td colspan="4" valign="top" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5">
      <div  class="body16" id="boxScroll">
            <%= qContent %>
      </div></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="5">
		<% If CInt(Session("sLevel4")) > 1 Then %>
		<font size="1"><%= writeOutDT %>/<%= IPaddress %></font>
        <% end if %>
	</td>
  </tr>
  <!-- tr>
                      <td width="80"><div class="body16">
                          <div align="center"><img src="Images/tit_file.gif"></div>
                        </div></td>
                      <td height="25" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5"><input name="textarea2" type="text" class="body16" style="border:1 solid #cccccc;background-color:#FFFFFF" value="" size="35"></td>
                      <td height="25" colspan="3" style="padding-top:5;padding-bottom:5"><img src="Imagessearch.gif"></td>
                    </tr>
                    <tr>
                      <td height="5" colspan="5" background="Images/notice_line3.gif"></td>
                    </tr-->
  <tr>
    <td height="30" colspan="5" style="padding-top:5;padding-left:10;padding-right:10;padding-bottom:5"><div align="right">
	<% if qaMode = "qv"	then %>
	<a href="<%= pageName %>?qaMode=qi"><img src="Images/qaOk.gif" alt="확인" width="55" height="22" border="0"></a>
	<% end if %>

	<% if qaMode = "qav" then %>
    <a href="<%=pageName%>?qaMode=li&QAidx=<%=Request("QAidx")%>&virNbr=<%=Request("virNbr")%>&page=<%=Request("page")%>">
	<img src="Images/qaList.gif" alt="목록보기" width="39" height="22" border="0"></a>
    <% end if %>

	<% if (qaMode = "qav"  And qaStatusBit <> 1)  then %>
	<a href="<%= pageName %>?qaMode=qu&qaStatusBit=<%= qaStatusBit %>&QAidx=<%= QAidx %>">
	<img src="Images/qaModify.gif" alt="수정하기" width="54" height="22" border="0"></a>
	<% end if %>

	<% if (qaMode = "qav"  And qaStatusBit <> 1)  Or (qaMode = "qav"  And CInt(Session("sLevel4")) > 1) then %>
	<a href="javascript:ConfirmJ('해당 문의를 정말 삭제하시겠습니까?', '<%= Application("SiteURLDir") %>CommonAccessories/BoardQnA/qaDelete_ok.asp?qaMode=qd&QAidx=<%= QAidx %>&pageName=<%= pageName %>')">
	<img src="Images/qaDelete.gif" alt="삭제하기" width="55" height="22" border="0"></a>
	<% end if %>

	<% If CInt(Session("sLevel4")) > 1 And qaStatusBit <> 1Then %>
	<a href="<%= pageName %>?qaMode=ai&QAidx=<%= QAidx %>"><img src="Images/qaReply.gif" alt="답변하기" width="48" height="22" border="0"></a>
	<% end if %>
	</div></td>
  </tr>
</table>
