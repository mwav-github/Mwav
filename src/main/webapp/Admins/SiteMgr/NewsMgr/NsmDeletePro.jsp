<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Refresh" content="3;url=/HomePage/N_List.do">
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
    <font size="5" face="바탕체">글이 삭제 되었습니다.<br/>
                         3초 후에 list로 이동합니다.
</font>
    
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