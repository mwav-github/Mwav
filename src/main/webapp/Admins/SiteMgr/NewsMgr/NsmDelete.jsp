<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="/HomePage/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Notice Management</title>
</head>
<body>



<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" >&nbsp;
    <%@ include file ="/Admins/TopFrame.jsp" %>
   <%-- 첫번째--%></td>
  </tr>
  <tr>
    <td width="200" valign="top" ><table width="190" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10"> 
         
         <%@ include file ="/Admins/LeftFrame.jsp" %>
        <%-- 두번째--%></td>
        </tr>
    </table>
     </td>
     
     
    <td width="10">&nbsp;</td>
    <td valign="top" >&nbsp;
    
    <%-- 세번째--%>
    <form method="post" name="NsmDelete" action="/HomePage/N_DeletePro.do">
<input type="hidden" name="news_id" value ="${news_id}">
   <input type="hidden" name="pageNum" value="${pageNum}">
<table align="center">
<tr height="30">
<td align="center">
<b>삭제 하시겠습니까?</b>
</td>
</tr>
<tr height="30">
<td align="center">
<button type="submit" name="ibDelete" style="border:solid 0px #FFFFFF;" onclick="javascript:window.location.href='/HomePage/N_Delete.do?staff_id=${staff_id}'" >
 								<img src="/HomePage/Admins/zImages/btn_admin_delete.gif"  border="0"> 
							</button>
							<button type="button" name="hiList" style="border:solid 0px #FFFFFF;"  onclick="javascript:window.location.href='/HomePage/N_List.do?pageNum=${pageNum}'" >
 								<img src="/HomePage/Admins/zImages/btn_view_list.gif"  border="0"> 
							</button>
</td>
</tr>
</table>
</form>
    </td>
  </tr>
  <tr>
    <td colspan="3" >&nbsp;
    <%@ include file ="/Admins/BottomFrame.jsp" %>
    <%-- 네번째--%>
    </td>
  </tr>
</table>

</body>
</html>