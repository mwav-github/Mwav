<%

	QAidx = Request("QAidx")
	'인증부분
	if QAidx = "" then Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")
	if  CInt(Session("sLevel4")) < 2  then Call ShowAlertMsg("잘못된 경로로 접속하였습니다.")


	if qaMode	 = "ai" then
			SvcStaff = Session("sName") & "(" & Session("sID") & ")"
			aTitle = "Re : " & PickUpValue("vQuestion", "qTitle", "QAidx = " & QAidx)
			aContent = ""
			writeOutDT = ""
			IPaddress = ""
			qaStatusBit = 0
	elseif qaMode	 = "au" then
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		selectedFields = "SvcStaff,aTitle,aContent,writeOutDT,IPaddress"
		whereClause = "QAidx = " & QAidx
		orderBy = "" '"bnOrder DESC, QAidx DESC"
		RSresult = SelectSimpleRecord(aRS, " Top 1 " & selectedFields, "vAnswer", whereClause, orderBy)
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		If RSresult = "NotEmpty" Then
			SvcStaff = aRS("SvcStaff")
			aTitle = aRS("aTitle")
			aContent = aRS("aContent")
			writeOutDT = aRS("writeOutDT")
			IPaddress = aRS("IPaddress")
			CloseRS(aRS)
			qaStatusBit = 1
		else
			ShowAlertMsg("시스템장애입니다.")
		end if		'If RSresult = "NotEmpty" Then
	else
		ShowAlertMsg("시스템장애입니다.")
	end if 		'if qaMode	 = "ai" then

%>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
.style1 {
	color: #006600;
	font-weight: bold;
}
-->
</style>
<table width="500" border="0" cellspacing="0" cellpadding="0">
<FORM NAME="frmQA" METHOD="post" ACTION="aForm_ok.asp" onSubmit="return aFormValidate(this);">
<INPUT TYPE="hidden" NAME="qaMode" VALUE="<%= qaMode %>">
<INPUT TYPE="hidden" NAME="QAidx" VALUE="<%= QAidx %>">
<INPUT TYPE="hidden" NAME="SvcStaff" VALUE="<%= SvcStaff %>">
<INPUT TYPE="hidden" NAME="pageName" VALUE="<%= pageName %>">
  <tr>
    <td height="30">&nbsp;</td>
    <td><span class="style1">* 질문에 대한 답변 </span></td>
    </tr>
  <tr class="body16">
    <td width="93" align="left"> <font color="#40808A"><img src="Images/tit_title.gif" width="37" height="15" hspace="5"> </font></td>
    <td style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:10"">
      <input name="aTitle" type="text" class="body16" id="aTitle" style="border:1 solid #cccccc;background-color:#FFFFFF" value="<%= aTitle %>" size="65" maxlength="70"></td>
    </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="2"></td>
  </tr>
  <tr>  </tr>
  <tr class="body16" >
    <td><img src="Images/tit_content.gif" width="59" height="15" hspace="5"></td>
    <td style="padding-top:10;padding-left:10;padding-right:10;padding-bottom:5"">
<textarea name="aContent" cols="65" rows="17" wrap="hard" class="body16" id="aContent" style="border:1 solid #cccccc;background-color:#FFFFFF;ime-mode:active">
<%= aContent %></textarea></td>
  </tr>
  <tr>
    <td background="Images/notice_dot1.gif" height="5" colspan="2"></td>
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
    <td height="30" colspan="2" style="padding-top:10;padding-left:15;padding-right:15;padding-bottom:10"">

      <div align="right">

 	<% if qaMode = "ai"	then %>
	<input type="image" src="Images/qaReply.gif" alt="답변하기" width="48" height="22">
	<% else %>
	<input type="image" src="Images/qaModify.gif" alt="답변수정하기" width="54" height="22">
	<% end if %>

	  <a href="<%= pageName %>?qaMode=qav&QAidx=<%= QAidx %>&qaStatusBit=<%= qaStatusBit %>">
	 <img src="Images/qaCancle.gif" alt="확인" width="55" height="22" border="0"></a>


	</div></td>
  </tr>
				<SCRIPT LANGUAGE="JavaScript">
				<!--
					document.onload =ToFocus(frmQA.aTitle);
				//-->
				</SCRIPT>
</form>
</table>
