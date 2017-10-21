<!--#include file="inc_static.asp" -->
<%
   
   s_year = request("s_year")
   s_month = request("s_month")
   s_day = request("s_day")

   labeldate = s_year&"-"&s_month&"-"&s_day
   labeldate = formatdatetime(labeldate,1)

	dim rs
	
	Set rs = Server.CreateObject("ADODB.Recordset")

%>


<html>
<head>
<title><%=labeldate%> 히팅수통계</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" href="css.css" type="text/css">
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<!--일일접속현황 테이블-->
<%
    SQL = "SELECT Top 1 sum(s_count) as Max_count,s_year,s_month,s_time FROM "&static_table 
	SQL = SQL & " GROUP BY s_time,s_day,s_year,s_month "
	SQL = SQL & " HAVING s_year="&s_year&" AND s_month="&s_month&" AND s_day="&s_day 
	SQL = SQL & " ORDER BY sum(s_count) DESC "
  
	rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
	
	IF rs.Eof OR rs.Bof Then
	
	Else 
	
		Max_count = rs("Max_count")
		Max_Time = rs("s_time")
	
	End If
	rs.close
	
	
	SQL = "SELECT sum(s_count) as hourcount,s_year,s_month,s_time FROM "&static_table 
	SQL = SQL & " GROUP BY s_time,s_day,s_year,s_month "
	SQL = SQL & " HAVING s_year="&s_year&" AND s_month="&s_month&" AND s_day="&s_day 

  
	rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText




%>

<table width="382" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td> 
      <table width="384" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5CEDE">
        <tr bgcolor="#EDF0F5"> 
          <td align="center" colspan="2"><font face="굴림체"><b><font face="굴림체"><b><%=labeldate%></b></font><b> 
            시간대별 접속현황</b></b></font></td>
        </tr>
        <%
 
 		If rs.Eof Or rs.Bof Then
 %>
        <tr bgcolor="#FFFFFF" align="center"> 
          <td colspan="2">현재 시간대별접속현황이 없습니다.</td>
        </tr>
   <%

    Else

	  Do Until rs.eof 

          
		s_time = rs("s_time")
		hourcount = rs("hourcount")
		
		width_len = ((hourcount/Max_count)*40) *5
		'만일, 그 계산된 wid가 1보다 작은 경우라면 최소값으로 1을 지정합니다.
		if width_len < 1 then
			width_len = 1
		End if
		
         
	
%>
        <tr bgcolor="#FFFFFF"> 
          <td width="53"><b><font color="#333333"><%=s_time%>시</font></b> </td>
          <td width="312"> 
            <%If Clng(Max_Time) =  Clng(s_time) Then %>
            <img src="max_bar.gif" width="<%=width_len%>" height="9"> &nbsp;<font color="#CC0000"><b><%=hourcount%></b></font> 
            <%Else%>
            <img src="bar.gif" width="<%=width_len%>" height="9"> &nbsp;<%=hourcount%> 
            <%End If%>
          </td>
        </tr>
        <%
	      rs.movenext
		  
     Loop

    End If

    rs.close

	
	Set rs = Nothing

%>
      </table>
    </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center" height="17"><a href="javascript:window.close()" class="menu05">☞창닫기</a></td>
  </tr>
</table>
</body>
</html>
<!--#include file="inc_close.asp" -->