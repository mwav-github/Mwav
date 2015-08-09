<%
	'Response.write Request.ServerVariables("HTTP_REFERER") & "<br>"
	'Response.write Request.ServerVariables("PATH_INFO") & "<br>"
	'Response.end

	qGroup = Request("qGroup")

	if qaMode = "qi"	then
		if Session("MbrID") <> "" then
			''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			selectedFields = "MbrPW,MbrName,phone,MbrEmail"
			whereClause = "MbrID = '" & Session("MbrID") & "'"
			orderBy = ""	'"bnOrder DESC, QAidx DESC"
			RSresult = SelectSimpleRecord(qRS, " Top 1 " & selectedFields, "vMember", whereClause, orderBy)
			''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			If RSresult = "NotEmpty" Then
				userPW = qRS("MbrPW")
				userName = qRS("MbrName")
				userPhone = qRS("phone")
				userEmail  = qRS("MbrEmail")
				CloseRS(qRS)
			end if		'If RSresult = "NotEmpty" Then
		end if		'if Session("MbrID") <> "" then
		'비회원으로 로그인되어 있을 경우 비회원정보 갖져온다.
		if Session("userEmail") <> "" then
			userEmail = Session("userEmail")
			userPW  = Session("userPW")
		end if		'if Session("userEmail") <> "" then
	elseif qaMode = "qu" then
		QAidx = Request("QAidx")
		'인증부분
		if QAidx = "" then Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		selectedFields = "MbrID,userName,userPW,userPhone,userEmail,qGroup,qService,qTitle,qContent,writeOutDT,IPaddress"
		whereClause = "QAidx = " & QAidx
		orderBy = ""	'"bnOrder DESC, QAidx DESC"
		RSresult = SelectSimpleRecord(qvRS, " Top 1 " & selectedFields, "vQuestion", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		If RSresult = "NotEmpty" Then
			MbrID = qvRS("MbrID")
			userName = qvRS("userName")
			userPW = qvRS("userPW")
			userPhone = qvRS("userPhone")
			userEmail = qvRS("userEmail")
			SelQaGrp = qvRS("qGroup")
			qService = qvRS("qService")
			qTitle = qvRS("qTitle")
			qContent = qvRS("qContent")
			writeOutDT = qvRS("writeOutDT")
			IPaddress = qvRS("IPaddress")
			CloseRS(qvRS)

			qaStatusBit = Request.QueryString("qaStatusBit")
		else
			ShowAlertMsg("시스템장애입니다.")
		end if		'If RSresult = "NotEmpty" Then
	end if		'if qaMode = "qi"	then

%>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<table width="500" border="0" cellspacing="0" cellpadding="0">
<FORM NAME="frmQA" METHOD="post" ACTION="qForm_ok.asp" onSubmit="return qFormValidate(this);">
<INPUT TYPE="hidden" NAME="qaMode" VALUE="<%= qaMode %>">
<INPUT TYPE="hidden" NAME="qaStatusBit" VALUE="<%= qaStatusBit %>">
<INPUT TYPE="hidden" NAME="MbrID" VALUE="<%= Session("MbrID") %>">
<INPUT TYPE="hidden" NAME="QAidx" VALUE="<%= QAidx %>">
<INPUT TYPE="hidden" NAME="qService" VALUE="<%= qService %>">
<INPUT TYPE="hidden" NAME="pageName" VALUE="<%= pageName %>">
  <tr>
    <td background="Images/notice_bg1.gif"><img src="Images/notice_2.gif"></td>
    <td background="Images/notice_bg1.gif"><img src="Images/notice_2.gif"></td>
    <td width="70" background="Images/notice_bg1.gif"><img src="Images/notice_2.gif"></td>
    <td width="16" align="right"  background="Images/table_bg1.gif"><img src="Images/notice_3.gif" width="16" height="15"></td>
    <td width="80" align="right"  background="Images/notice_bg1.gif"><img src="Images/notice_3.gif" width="16" height="15"></td>
  </tr>
  <tr class="body16">
    <td width="93" align="left"> <font color="#40808A"><img src="Images/tit_title.gif" width="37" height="15" hspace="5"> </font></td>
    <td style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:10"">
      <input name="qTitle" type="text" class="body16" id="qTitle" style="border:1 solid #cccccc;background-color:#FFFFFF" value="<%= qTitle %>" size="40" maxlength="50"></td>
    <td>
      <div align="center"><img src="Images/notice_tit3.gif" width="44" height="20"></div></td>
    <td colspan="2">      <div align="center">
        <select name="qGroup" size="1" <% if SelQaGrp<>"일반" then %>onFocus="blur();alert('변경 불가능');"<% end if %>>
          <option value="일반" <%= writeSelected(SelQaGrp, "일반") %>>일반문의</option>
		  <!-- option value="커뮤니티" <%= writeSelected(SelQaGrp, "커뮤니티") %>>커뮤니티</option -->
        </select>
    </div></td>
    </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
  </tr>
  <tr>
    <td height="25" colspan="5"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
              <td width="80"><img src="Images/tit_name.gif" width="35" height="15" hspace="5"></td>
            <td height="25" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:15">
			<input name="userName" type="text" class="body16" id="userName" style="border:1 solid #cccccc;background-color:#FFFFFF"
			value="<%= userName %>" size="20" maxlength="20" <% if userName<>"" then %>onClick="this.blur();"<% end if %>></td>
            <td width="80" class="body16">
            <div align="center"><img src="Images/tit_password.gif" width="59" height="15"></div></td>
            <td colspan="2" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:15">
			<input name="userPW" type="password" class="body16" id="userPW" style="border:1 solid #cccccc;background-color:#FFFFFF" value="<%= userPW %>" size="15" maxlength="15">
            </td>
          </tr>
          <tr>
            <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
          </tr>
          <tr>
            <td><img src="Images/tit_phone.gif" width="44" height="20" hspace="5"></td>
            <td height="25" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:15"><input name="userPhone" type="text" class="body16" id="userPhone" style="border:1 solid #cccccc;background-color:#FFFFFF" value="<%= userPhone %>" size="20" maxlength="30"></td>
            <td align="center" class="body16"><img src="Images/tit_email.gif" width="37" height="20"></td>
            <td colspan="2" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:15">
			<input name="userEmail" type="text" class="body16" id="userEmail" style="border:1 solid #cccccc;background-color:#FFFFFF" value="<%= userEmail %>" size="22" maxlength="50"></td>
          </tr>
      </table></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
  </tr>
  <tr class="body16" >
    <td><img src="Images/tit_content.gif" width="59" height="15" hspace="5"></td>
    <td colspan="4" style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:5"">
      <textarea name="qContent" cols="65" rows="17" wrap="hard" class="body16" id="qContent" style="border:1 solid #cccccc;background-color:#FFFFFF"><%= qContent %></textarea></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="5"></td>
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
    <td height="30" colspan="5" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:10""><div align="right">
	<% if qaMode = "qi"	then %>
	<input type="image"  src="Images/qaWrite.gif" alt="문의하기" width="47" height="22">
	<% else %>

	<input type="image"  src="Images/qaModify.gif" alt="수정하기" width="54" height="22">

  	<a href="<%= pageName %>?qaMode=qav&qaStatusBit=<%= qaStatusBit %>&QAidx=<%= QAidx %>">
	<img src="Images/qaCancle.gif" alt="확인" width="55" height="22" border="0"></a>
	<% end if %>




	<% if qaMode = "qi"	then %>
	<a href="<%= pageName %>?qaMode=vali"><img src="Images/qaConfirm.gif" alt="결과확인" width="58" height="22" border="0"></a>
	<% end if %>
	</div></td>
  </tr>
				<SCRIPT LANGUAGE="JavaScript">
				<!--
					document.onload =ToFocus(frmQA.qTitle);
				//-->
				</SCRIPT>
</form>
</table>
