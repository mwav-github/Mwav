<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%
	' 게시판에 바로 하단에 포함될 템플릿
	bID = Request("bID")
	if bID = "" then '에러를 표시해야 함
		Call ShowAlertMsg("게시판ID가 존재하지 않습니다.")
	end if 
%>
<base href="<%= Application("SiteURLDir") & "CommonAccessories/Board/IncTemplates/" %>" target="_self">
<%
	Select Case bID
		Case "GeneralMbr"
%>

<table width="100%" border="0" cellpadding="3" cellspacing="3">
  <tr>
    <td><% if bBottomMsg <> "" then %><img src="../../../Images/member_icon.gif"> <%= bBottomMsg %><% end if %></td>
  </tr>
</table>

<%
		Case "free"
%>

<table width="100%" border="0" cellpadding="3" cellspacing="3">
  <tr>
    <td><% if bBottomMsg <> "" then %><img src="../../../Images/member_icon.gif"> <%= bBottomMsg %><% end if %></td>
  </tr>
</table>

<%
		Case "OpenBiz"
%>

<table width="100%" border="0" cellpadding="3" cellspacing="3">
  <tr>
    <td><% if bBottomMsg <> "" then %><img src="../../../Images/member_icon.gif"> <%= bBottomMsg %><% end if %></td>
  </tr>
</table>

<%
		Case "AnYang"
%>

<table width="100%" border="0" cellpadding="3" cellspacing="3">
  <tr>
    <td><% if bBottomMsg <> "" then %><img src="../../../Images/member_icon.gif"> <%= bBottomMsg %><% end if %></td>
  </tr>
</table>

<%
		Case "AnSan"
%>

<table width="100%" border="0" cellpadding="3" cellspacing="3">
  <tr>
    <td><% if bBottomMsg <> "" then %><img src="../../../Images/member_icon.gif"> <%= bBottomMsg %><% end if %></td>
  </tr>
</table>

<%
		Case Else
			'Call ShowAlertMsg("게시판ID가 잘못됐습니다.")
	End Select
%>
<base href="<%= Application("SiteURLDir") & "CommonAccessories/Board/" %>" target="_self">