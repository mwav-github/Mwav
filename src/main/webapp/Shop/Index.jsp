<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

	<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
	<!--  //////////////////////////////////// -->
	<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Shop.jsp"
		flush="false" />

	<!-- Page Content -->
	<div class="container">
		<%-- Fluid container : .container 로 콘텐츠를 감싸는 것으로 페이지의 콘텐츠를 쉽게 중앙으로 가져오세요. 
		                       .container 는 우리의 그리드 시스템에 맞는 다양한 미디어 쿼리 분기점에서 max-width 가 설정되어 있습니다. 
		                       **추후 수정
		                       --%>

		<!-- Jumbotron Header 
        <header class="jumbotron hero-spacer">
            <h1>A Warm Welcome!</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
            <p><a class="btn btn-primary btn-large">Call to action!</a>
            </p>
        </header>
        -->

		<hr>

		<!-- Title -->
		<div class="row">
			<div class="col-lg-12">
				<h3>Goods List</h3>
			</div>
		</div>
		<!-- /.row -->

		<!-- Page Features -->
		<div class="row text-center">

			<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Shop/GdsList/CellList.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->

		</div>
	</div>
	<!-- /.container -->

	<div class="enter"></div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter_Shop.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>




	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>

</body>

</html>