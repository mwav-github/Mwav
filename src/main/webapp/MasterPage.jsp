<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<%--
1. 공통규칙

-기본구조는 Header / LEFT / BODY / FOOTER 를 가진다.
-해당 구조에 따른 PX 값에 따른 크기 규정은 상황에 따라 유동적으로 변동하며, 명시한다
-LEFT 메뉴에 대해서는 SPA 방식 도입시 대대적 변경한다.
-
-
 --%>

<!--1. Head_Import 
    설명 : 전체 공통적인 스크립트 삽입 부분
    기타 : 추후 SPA 등 변경 예정
-->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->

<c:if test="${requestScope.loginCheck eq 2 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 3 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	</script>
</c:if>
</head>

<body>
	<!-- 2. FrontHeader 
	      설명 : Header 추가 슬라이드 쇼 까지 포함 예정
           기타 : 추후 SPA 등 변경 예정
	-->
	<!--  //////////////////////////////////// -->
	<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Master.jsp"
		flush="false" />
	<!--  //////////////////////////////////// -->


	<!-- 3. Page Content 
	      설명 : Header Footer 제외 전 부분
	      기타 :
	-->
	<%-- 로그인 페이지는 내부 넓이때문에 mg5xauto --%>
	<div class="container mg5xauto">
		<div class="row">
		    <div class="enter"></div>
			<div class="col-md-12 col-sm-12">
			<%--
${param.name} => request.getParameter("name");
${member} => request.getAttribute("member");
			--%>
				<c:if test="${param.mode != null || mode != null}">
					<c:if test="${param.mode == 'SMbrLogin' || mode == 'SMbrLogin'}">
						<div class="col-md-6 col-md-offset-3">
							<!--/////////////////////////////////////////////////// -->
							<jsp:include page="/CommonApps/Member/MbrLogin.jsp" flush="false" />
							<!--/////////////////////////////////////////////////// -->
						</div>
					</c:if>
<%-- 					<c:if test="${param.mode == 'SMbrView'}">
						<div class="col-md-6 col-md-offset-3">
							<!--/////////////////////////////////////////////////// -->
							<jsp:include page="/CommonApps/Member/MbrLogin.jsp" flush="false" />
							<!--/////////////////////////////////////////////////// -->
						</div>
					</c:if> --%>
				</c:if>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- FrontFooter -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>
</html>