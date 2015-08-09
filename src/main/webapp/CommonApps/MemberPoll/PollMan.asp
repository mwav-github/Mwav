<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%
	SQL = "SELECT vPollMain.pNbr, vPollMain.pTopic, vPollEX.exNbr, vPollEX.example "
	SQL = SQL & " FROM vPollEX INNER JOIN vPollMain "
	SQL = SQL & " ON vPollEX.pNbr = vPollMain.pNbr "
	SQL = SQL & " WHERE (vPollMain.pDisplay = 'Y') "
    SQL = SQL & " AND (GETDATE() BETWEEN vPollMain.pBeginTime AND dbo.vPollMain.pEndTime) "
	SQL = SQL & " OR (vPollMain.pDisplay = 'Y') AND (dbo.vPollMain.pEndTime IS NULL) "
	SQL = SQL & " AND (dbo.vPollMain.pBeginTime <= GETDATE()) "
	
	
	RSresult = OpenRS(pollRS,SQL,1)
	'Response.Write("RSresult=" + RSresult)
	if RSresult <> "Empty" then
		
		pNbr = trim(pollRS("pNbr"))
		pTopic = trim(pollRS("pTopic"))
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function PollSubmit() {
		var pollResult = CheckRadioBoxValue(frmPoll.exNbr);
		if (pollResult == true) {
			OpenWindow('','poll','scrollbars=yes,resizable=yes,width=500,height=380');
			return true;
		} else {
			alert("투표값을 체크하세요");
			return false;
		}	
	}
//-->
</SCRIPT>
<base href="<%= Application("SiteURLDir") %>CommonAccessories/PollMan/" target="_self">
<table width="150" border="0" cellspacing="0" cellpadding="0">
  <form name="frmPoll" method="post" action="PollMan_ok.asp" target="poll" onSubmit="return PollSubmit();">
    <tr> 
      <td width="5"><input name="pNbr" type="hidden" id="pNbr" value="<%= pNbr %>"></td>
      <td width="140"> 설문조사 </td>
    </tr>
    <tr> 
      <td colspan="2"> <%= pTopic %></td>
    </tr>
<% 
	Do until pollRS.EOF
		exNbr = trim(pollRS("exNbr"))
		example = trim(pollRS("example"))
%>
		<tr> 
		  <td><input type="radio" name="exNbr" value="<%= exNbr %>"></td>
		  <td><%= example %></td></tr>
<%
		pollRS.MoveNext
	Loop
%>
	<tr>
      <td>&nbsp;</td>
      <td height="40">
        
<%
	if Request.Cookies("poolAvail") <> "true" then
%>	
		<input name="sbmPoll" type="submit" id="sbmPoll" value="투표">
<% else %>		
		<input name="PollView" type="button"  onClick="JavaScript:OpenWindow('<%= Application("SiteURLDir") %>CommonAccessories/PollMan/PollMan_ok.asp?pMode=v&pNbr=<%= pNbr %>','poll','scrollbars=yes,resizable=yes,width=500,height=380');" value="보기">
<%
	end if		
%>

      </td>
    </tr>
  </form>
</table>
<%
		Call CloseRS(pollRS)
	end if  'if RSresult <> "Empty" then
%>