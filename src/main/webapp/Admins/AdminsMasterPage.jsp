<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />

<%-- 
1. 템플릿 : 참고하여 꼭 변경 http://wrapbootstrap.com/preview/WB0025522
                       http://startbootstrap.com/
                       https://wrapbootstrap.com/
--%>



<c:if test="${requestScope.loginCheck eq 2 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 7 }">
	<script type="text/javascript">
		alert('탈퇴한 회원입니다.');
		msg = '재 가입하시겠습니까.?'
		if (confirm(msg) != 0) {
			location.replace("/MasterPage_1.jsp?mode=Default"); // 이전 url 기록안하는 경우 , location.href 의 경우 이전기록이 남아 login.do로 포워딩
		} else {
			history.go(-1)
		}
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 3 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 5 }">
	<script type="text/javascript">
		alert('임시패스워드입니다. 비밀번호 변경 후 로그인해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.updateMemberDelete eq 1 }">
	<script type="text/javascript">
		alert('회원탈퇴가 완료되었습니다. 감사합니다.');
	</script>
</c:if>
<c:if test="${requestScope.updateMemberDelete eq 0 }">
	<script type="text/javascript">
		alert('회원탈퇴가 되지 않았습니다.');
		history.go(-1);
	</script>
</c:if>

</head>
<body>

	<%-- 구조 2

     상단읜 메인메뉴 및 슬라이드 쇼 부분
 --%>

	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->




	<!-- Page Content -->
	<div class="container">


		<!-- Content Row -->
		<div class="row">

			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%-- 
			- param으로 같은 이름 지정시 위의 named으로 인식
			- getparameter는 param.mm // setattribute는 mm
			- value에 두개다 넣는 경우 비즈니스로직 + 파라미터인경우 문제발생
			- jsp param 안에 choose, when, otherwise 사용 불가
			 --%>
				<c:choose>
					<c:when test="${param.mm eq null}">
						<c:set value="${mm}" var="mm" />
					</c:when>
					<c:otherwise>
						<c:set value="${param.mm}" var="mm" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="/admins/LeftMenu.do" flush="false">
					<jsp:param name="mm" value="${mm}" />
				</jsp:include>
			</div>
			<!-- 끝 -->



			<div class="col-md-9">
				<%--param.mode 는 get문으로 올때 // mode는 setattribute일때 --%>
				<c:if test="${param.mode == 'm_stfList' || mode == 'm_stfList'}">
					<jsp:include page="/Admins/CompanyMgr/Staff/StfList.jsp"
						flush="false" />
				</c:if>
				<c:if test="${param.mode == 'm_stfForm' || mode == 'm_stfForm'}">
					<jsp:include page="/Admins/CompanyMgr/Staff/StfForm.jsp"
						flush="false" />
				</c:if>
				<c:if test="${param.mode == 'm_stfView' || mode == 'm_stfView'}">
					<jsp:include page="/Admins/CompanyMgr/Staff/StfView.jsp"
						flush="false" />
				</c:if>
				<c:if test="${param.mode == 'm_stfUpdate' || mode == 'm_stfUpdate'}">
					<jsp:include page="/Admins/CompanyMgr/Staff/StfUpdate.jsp"
						flush="false" />
				</c:if>
				
				
				
				<c:if test="${param.mode == 'm_nsmList' || mode == 'm_nsmList'}">
					<jsp:include page="/admin/boardNews/nsmList.do"
						flush="false" />
				</c:if>
				
				
				

			</div>
		</div>
	</div>
	<!-- /.container -->
	<%--
		구조 7
		
		사이트에서 Footer 하단 부분을 의미한다. 
		
		 --%>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>

</body>

</html>