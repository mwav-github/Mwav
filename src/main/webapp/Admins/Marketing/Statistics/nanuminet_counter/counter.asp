<!--#include file="inc_static.asp" -->
<% 

Response.Buffer  = True 
 '년도와 월을 가져온다.
   s_year = Trim(request.QueryString("s_year"))
   s_month = Trim(request.QueryString("s_month"))
   
   '없다면 현재 년도 와 월을 설정
   If s_year = "" Then s_year = year(now)
   If s_month = "" Then  s_month  = month(now)
   
   dim rs  

   Set rs = server.CreateObject("ADODB.Recordset")

   '히팅수를 가져온다.
   SQL = "SELECT sum(s_count) FROM "&static_table 

   rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
   
  
   
      totalHit = rs(0) 
      totalhhh =rs(0)
      totalHit = Formatcurrency(totalHit)
	  totalHit = mid(totalHit,2)


   rs.close

   '접속통계테이블에서  현재 월의 총 접속수를 가져온다.
   '

   SQL = "SELECT sum(s_count) FROM "&static_table&" WHERE s_year="&s_year&" AND s_month="&s_month

   rs.Open SQL,db,adOpenForwardOnly ,adLockReadOnly ,adCmdText
   
   if isnull(rs(0)) Then 

   Else 
   
      monthtotal = clng(rs(0)) 
      monthtotal = Formatcurrency(monthtotal)
	  monthtotal = mid(monthtotal,2)
   end If

   rs.close
%>
<% 
'☞전체 접속자수:
count =totalHhh
j=7-len(count)%>

<table border="0" cellpadding="0" cellspacing="0" width="91" height="15">
    <tr>
<% for i=1 to j%>
<% if i<=j then %> 
<td><IMG  height="13" src="images/d0.gif" width="15" ><td>
<%end if
next
for i=1 to len(count)         

select case Mid(Count,i,1)
case "1" %>
<td><IMG  height="13" src="images/d1.gif" width="15" ><td>
<%case "2"%>
<td><IMG height="13" src="images/d2.gif" width="15" ><td>
<%case "3"%>
<td><IMG height="13" src="images/d3.gif" width="15"><td>
<%case "4"%>
<td><IMG height="13" src="images/d4.gif" width="15" ><td>
<%case "5"%>
<td><IMG height="13" src="images/d5.gif" width="15" ><td>
<%case "6"%>
<td><IMG height="13" src="images/d6.gif" width="15" ><td>
<%case "7"%>
<td><IMG height="13" src="images/d7.gif" width="15" ><td>
<%case "8"%>
<td><IMG  height="13" src="images/d8.gif" width="15" ><td>
<%case "9"%>
<td><IMG height="13" src="images/d9.gif" width="15" ><td>
<%case "0"%>
<td><IMG height="13" src="images/d0.gif" width="15" ><td>
<%End select%>
<%next%>  
</tr>
</table>




<!--#include file="inc_close.asp" -->