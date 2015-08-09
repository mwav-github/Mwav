<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>CommonAccessories/BoardNotice/" target="_self">
<table width="98%" border="0" cellpadding="0" cellspacing="0">
<%
	''''''''넘겨져야할 데이터
	nbTitLength = 23	'타이틀 length
	nbTop = 5	'타이틀 length
	''''''''

	selectedFields = "Top " & nbTop & " bnIdx,SvcStaff,bnGroup,bnService,bnTitle,viewCount,noticeDT"
	whereClause = "noticeable = 1"
	orderBy = "bnOrder DESC, bnIdx DESC"
	RSresult = SelectSimpleRecord(nbRS, selectedFields, "vBoardNotice", whereClause, orderBy)

if RSresult = "NotEmpty" then
	i = 1
	Do until nbRS.EOF
		'맵핑
		bnIdx = nbRS("bnIdx")
		SvcStaff = nbRS("SvcStaff")
		bnGroup = nbRS("bnGroup")
		bnService = nbRS("bnService")
		bnTitle = nbRS("bnTitle")
		viewCount = nbRS("viewCount")
		noticeDT = nbRS("noticeDT")
		''
		bnTitle= ShortenString(bnTitle, nbTitLength)
		noticeDT  = left(noticeDT ,10)
%>
    <tr>
      <td height="20" class="body18">
	  <a href="../../ContentsParts/FrameBody/nbTemplate.asp?bnMode=v&bnIdx=<%=CInt(bnIdx)%>" onfocus="this.blur()"><%= bnTitle %></a>
	   &nbsp;[<%= noticeDT %>]</td>
    </tr>
<%
		nbRS.MoveNext
		i=i+1
	Loop
  	Call CloseRS(nbRS)
else
	Response.Write("공지사항없음")
end if 'if RSresult = "NotEmpty" then
%>
    <tr>
      <td height="25" align="right" class="body18"><a href="../../ContentsParts/FrameBody/nbTemplate.asp" onfocus="this.blur()">
	  <img src="Images/bnMoreList.gif" width="42" height="15" border="0"></a></td>
    </tr>
</table>

