<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="decorator" 
            uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib  prefix="page"
            uri="http://www.opensymphony.com/sitemesh/page" %>

<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<page:applyDecorator name="headerImport" />
<!-- /////////// -->
<title><decorator:title default="comapanyTemplate" /></title>
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<!--  //////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Master.jsp"
			flush="false" />
		<!--  //////////////////////////////////// -->
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->

	<!-- Page Content -->
	<section class="bg-primary res_width" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<h2 class="section-heading">Mwav - Company</h2>
					<hr class="light">
					<p class="text-faded">Unleash your infinite possibilities with IT Optimization!!</p>

				</div>
			</div>
		</div>
	</section>
	<!--  //////////////////////////////////// 
	Header 끝
	-->


	<!-- Page Content LEFTMenu and Body-->
	<div class="container">

				<decorator:body></decorator:body>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<page:applyDecorator name="footer" />
		<!--/////////////////////////////////////////////////// -->
	</footer>

</body>

</html>