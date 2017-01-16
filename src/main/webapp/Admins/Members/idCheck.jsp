<!-- 
/* 

========jsp페이지의 용도 및 설명(호출 부분 명시)==========
용도 : id중복확인 및 check

========변수에 대한 설명=========
1.checkId : 내가 비교를 위해 입력한 id
2.check   : A_IdCheckAction 에서 forward 된 boolean 형태의 값

========과정에 대한 설명=========
1.해당 창 Load 
2.비교를 원하는 id 입력
3.중복확인시 controller => A_IdCheckAction => idCheck 메소드 값
   을 거쳐 boolean 형태로 반환 
4.check 에 따라 적용하기 button(true) or 중복된 아이디 입니다.라고 뜬다(false)

========일자 별 설명=========

 순번  |    요일    |             내용              |     
ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  1.      13 03,23     수정 및 설명
  2.
  3.
  4.
  5.

*/
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link href="/HomePage/Admins/Members/idCheck.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
	<title>아이디 중복확인</title>
	<script type="text/javascript">
	function idcheck(){
		if(document.idCheckForm.id.value==""){
			alert("아이디를 입력해주세요.");
			document.idCheckForm.id.focus();
			return;
		}
		var checkId = document.idCheckForm.id.value;
		window.location='/HomePage/idCheck.mwav?mbrLoginId='+checkId;
	};
	function selectId(chackId){
		var id = document.idCheckForm.id.value;
		opener.mwavcument.frmMbr.mbrLoginId.value = id;	
		self.close();
	};
	</script>
</head>
	<body>
	<div id="wrapper">
		<form action="/HomePage/MbrForm.mwav" name="idCheckForm" id="idCheckForm">
		<h1><span>아이디 중복확인</span></h1>
		<p>
			<label for="id">아이디</label>
			<input type="text" size="20" id="id" name="id" value="${mbrLoginId}"/>
		</p>
		<p>
				<c:if test= "${mbrLoginId != null}">
		        <c:if test="${check ne true }">
		           <span id="success">사용 가능한 아이디 입니다.</span>

		        </c:if>
		        
		        <c:if test="${check eq true }">
		        <br/>
		     		<span id="falied">중복된 아이디 입니다.</span>
		        </c:if>
		        </c:if>
		</p>
		<p class="btnRow">
			<input type="button" onclick="idcheck()" value="중복 확인" id="btnSubmit"/>
		    <c:if test = "${check ne true }">
		    <input type="button" onclick="selectId('${check}')" value="적용 하기" id="btnSubmit"/>
		    </c:if>
		</p>
		</form>
		</div>
	</body>
</html>