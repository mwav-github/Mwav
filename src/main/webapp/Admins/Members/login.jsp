<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="mbrLoginId" value="${sessionScope.mbrLoginId }"/>      
<link rel="stylesheet" href="style.css">   
<html>
<head>
<style type="text/css">
   
  
    td {
	font-size: 16px;
}
    </style>
<title>회원 로그인</title>

<script type="text/javascript">
function check() {
	if(document.login_form.mbrLoginId.value.length==0) {
		alert("아이디를 입력해주세요");
                login_form.mbrLoginId.focus();
                return false;
        }
	if(document.login_form.mbrLoginPw.value.length==0) {
                alert("패스워드를 입력해주세요");
                login_form.mbrLoginPw.focus();
                return false;
        }
	document.login_form.submit();
}
</script>
</head>
<%--세션이 있을 경우 먼저 수행한다. (굳이 재 로그인 필요성이 없다.) 
    1. 아이디가 있을 경우--%>
<c:choose>
   <c:when test="${mbrLoginId ne null}" >
<table border="1">
<tr>
</tr>
  <tr>
  <td colspan = "1" align="center">
  <c:out value="${mbrLoginId  }"/> 님 환영합니다.
  </td>
  
  <td align="center" width="100">
  <a href="#">정보수정</a></td>
  
  <td align="center" width="100">
  <a href="#">회원탈퇴</a></td>
  
  <td align="center" width="100">
  <a href="/HomePage/logout.mwav">로그아웃</a></td>
  
  </tr>
</table>
</c:when>
</c:choose>  

  <c:if test="${requestScope.check eq 0 }">
  <script type="text/javascript"> alert('비밀번호가 틀렸습니다.');</script></c:if>
  
  <c:if test="${requestScope.check eq 1 }">
  <script type="text/javascript"> alert('아이디가 존재하지 않습니다.');</script></c:if>
  
  

<!-- 세션이 없을 경우 띄워주는 창이다. -->
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red" topmargin="0">
      <p align=center><br>
        <br>
        
        <form name="login_form" method="post" action=/HomePage/loginProcess.mwav>
        <b>회원 로그인</b> 
      <p> 
      <div align="center">  
        <table border="1" cellspacing="0" width="305" bgcolor="#082758">
         
            <tr> 
              <td width="303">
                <div align="center">
                  <table border="1" cellpadding="3"
             cellspacing="1" width="100%" bgcolor="white">
                    <tr> 
                      <td width="90" bgcolor="#2E78ED" align="center">
                        <p align="center"><font
                         size="2" color="white">아이디</font>
                      </td>
                      <td width="120" align="center"> 
                        <p align="center"><font size="2">
                          <input type="text" name="mbrLoginId" maxlength="15"
                         size="25">
                          </font>
                      </td>
                    </tr>
                    <tr> 
                      <td width="90" bgcolor="#2E78ED" align="center"> 
                        <p align="center"><font size="2" color="white">패스워드</font>
                      </td>
                      <td width="120" align="center"> 
                        <p align="center"><font size="2">
                          <input type="password" name="mbrLoginPw" maxlength="15"
                         size="25">
                          </font>
                      </td>
                    </tr>
                  </table>
                </div>
              </td>
            </tr>
          
        </table>
      </div>
      <p align="center"> 
        <input type="submit"  value="로그인" onclick="check()"/>
        <input type="button"  value="회원가입" onclick="javascript:window.location.href='/HomePage/MbrForm.mwav'"/> 
        </form>

</body>
</html>