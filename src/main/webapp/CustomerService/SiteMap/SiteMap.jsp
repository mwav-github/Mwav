<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
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
		<div class="row">
			<div class="col-lg-12">
				<img
					src="/CustomerService/zImage/CustomerService_IN(height_280).jpg"
					class="img-responsive res_width" alt="Responsive image">
			</div>
		</div>
	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					CustomerService <small> SiteMap</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CustomerService</li>
					<li class="active">SiteMap</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<div class="row">
					<!-- <div class="col-lg-12">
						<h2 class="page-header">SiteMap</h2>
					</div>
 -->
					<div class="col-xs-12 col-md-4 col-sm-4 ">
						<h3>
							<strong>Company</strong>
						</h3>
						<h5>All information and story about Mwav.</h5>
						<br>
						<ul class="font_color_faq">
							<li><a href="/Company/Introduction/Introduction.jsp"
								>Introduction</a></li>
							<li><a href="/Company/Greetings/Greetings.jsp"
								>Greetings</a></li>
							<li><a href="/Company/History/History.jsp"
								>History</a></li>
							<li><a href="/Company/BusinessField/BusinessFields.jsp"
								>BusinessField</a></li>
							<li><a href="/Company/ActualResults/ActualResults.jsp"
								>ActualResults</a></li>
							<li><a href="/board/bnsList.do" >ThePress</a></li>
							<li><a href="/Company/HR-Affairs/HR-Affairs.jsp"
								>HR-Affairs</a></li>
							<li><a href="/Company/LocationMap/LocationMap.jsp"
								>LocationMap</a></li>
							<li><a href="/Company/Profitsharing/Profitsharing.jsp"
								>Profitsharing</a></li>
						</ul>
					</div>
					
				</div>
			</div>

		</div>


		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>



</body>

</html>