<!-- 
/* 

========jsp페이지의 용도 및 설명(호출 부분 명시)==========
용도 : 우편번호 찾기 

========변수에 대한 설명=========
1.zipcodeList : 주소에 대해 정보를 담고있는 Vector(컬렉션 클래스)
2.check   : 명령에 대한 구분(아래 자세히 설명)
3.totalList : 검색된 주소의 총 갯수

========과정에 대한 설명=========
1. check 값에 따른 구분 
   1.1 처음에 회원가입 창을 통해서 들어올 경우, =y  
   1.2 동이름에 값 입력 후 들어올 경우, =n를 구분  
       (위에서 check n !)
	우편번호 찾기 하면 post 방식으로 form 을 Action을 통해서 넘긴다. 즉 돌아올 때는 n(검색요청)이 들어온다.
	즉 y 일 경우 최초 회원가입창에서 zip 창 열었을 때
	n 일 경우 띄어진 창에서 검색창에 입력후 찾기버튼 눌렀을 경우!

2. 만약 n일 경우 넘어온 zipcodeList 출력 해당 주소누르면 
   form 에 입력된다. 
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="/HomePage/Admins/Members/zipCheck.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script.js"></script>
<%-- srcipt.js 에서 check=y 값을 가지고 넘어온다. --%>
<%-- dongCheck() 아래와 함수를 추가 --%>
<script>
	function dongCheck() {
		if (document.zipForm.dong.value == "") {
			alert("동이름을 입력하세요");
			document.zipForm.dong.focus();
			return;
		}
		document.zipForm.submit();
	}
	// 주소를 자동으로 입력해 주는 기능을 한다.
	
	function sendAddress(zipcode, sido, gugun, dong, ri, bunji) {
		var address = sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
		opener.document.frmMbr.mbrZipcode.value = zipcode;
		opener.document.frmMbr.mbrAddress.value = address;
		opener.document.frmMbr.mbrAddress.focus();
		self.close();
	}
</script>
</head>
<body >
	<div id="wrapper" align="center">
		<form method="post" name="zipForm" id="zipForm" action="/HomePage/zipCheck.do">
			<h1>
				<span>우편 번호 찾기</span>
			</h1>
		
				<p>
					<label>동 이름 : </label> <span class="celStyle"> 
					<%--자기자신 실행 ==A_ZipCheckAction 으로 가겠다는 말이다. !--%>
					<input
						type="text" size="40" name="dong" value="${dong }" /> <input  type="submit"
						value="검색" onclick="dongCheck()" id="btnSubmit"  />
					</span>
				</p>

				<input type="hidden" name="check" value="n" />
		</form>
		<!-- 여기서의 n은 check 형태를 구분하기 위한 값
		          -->

			<!--n일 경우가 검색 요청이다.
			     가져온 데이터를 중첩if를 통해서 보여준다.  -->
			    
		<c:if test="${check eq 'n'}">
			<c:if test="${zipcodeList.isEmpty()}">
				<font color="red">검색된 결과가 없습니다.</font>
			</c:if>
			 <c:if test="${!zipcodeList.isEmpty()}">
				<font color="blue">※ 아래 우편번호를 클릭하면 자동으로 입력됩니다.</font>
				<td align="left">검색결과는 : ${totalList }개 입니다.
				<br />
				
				<%--zipcodeList 는 무한데이터가 request.parameter 로 넘어온 형태이다. ! --%>
			<%--for문으로 돌면서 인스턴스 하나하나 출력 a[0] a[1] 이런식으로--%>
			<%--var에서 items의 결과를 담고 있다. 
			인스턴스 하나하나로 저장되어있으니까 밑에서 각각 인스턴스 하나에 맞는 열들을 뽑아주는 것이다. 
			즉 검색결과 --%>
				
				<c:forEach var="zipcodeVO" items="${zipcodeList }">
					<a
						href="javascript:sendAddress('${zipcodeVO.zipcode}','${zipcodeVO.sido}','${zipcodeVO.gugun}','${zipcodeVO.dong}','${zipcodeVO.ri}','${zipcodeVO.bunji}')">
						${zipcodeVO.zipcode}&nbsp;${zipcodeVO.sido}&nbsp;${zipcodeVO.gugun}&nbsp;${zipcodeVO.dong}&nbsp;${zipcodeVO.ri}&nbsp;${zipcodeVO.bunji}&nbsp;
					</a>
					<br />
				</c:forEach>
			</c:if>
		</c:if>
		<a href="javascript:this.close();">닫기</a>
	</div>
	
		
	
</body>
</html>