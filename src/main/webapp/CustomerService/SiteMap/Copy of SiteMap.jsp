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
					<div class="col-lg-12">
						<h2 class="page-header">SiteMap</h2>
					</div>

					<div class="col-md-4 col-sm-4 col-xs-12"
						style="border-radius: 5px 20px 5px; border: 3px solid #BADA55;">
						<h3>
							<strong>Company</strong>
						</h3>
						<h5>All information and story about Mwav.</h5>
						<div class="list-group">
							<a href="/Company/Introduction/Introduction.jsp"
								class="list-group-item">Introduction</a> <a
								href="/Company/Greetings/Greetings.jsp" class="list-group-item">Greetings</a>
							<a href="/Company/History/History.jsp" class="list-group-item">History</a>
							<a href="/Company/BusinessField/BusinessFields.jsp"
								class="list-group-item">BusinessField</a> <a
								href="/Company/ActualResults/ActualResults.jsp"
								class="list-group-item">ActualResults</a> <a
								href="/board/bnsList.do" class="list-group-item">ThePress</a> <a
								href="/Company/HR-Affairs/HR-Affairs.jsp"
								class="list-group-item">HR-Affairs</a> <a
								href="/Company/LocationMap/LocationMap.jsp"
								class="list-group-item">LocationMap</a> <a
								href="/Company/Profitsharing/Profitsharing.jsp"
								class="list-group-item">Profitsharing</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12"
						style="border-radius: 5px 20px 5px; border: 3px solid #A05C37;">
						<strong><h3>Our Business</h3></strong>
						<h5>We serve you the best solution.</h5>
						<ul class="list-group">
							<li><a href="#" class="list-group-item">Company
									Background</a></li>

						</ul>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12"
						style="border-radius: 5px 20px 5px; border: 3px solid #EB3232;">
						<strong><h3>Newsroom</h3></strong>
						<h5>They talk about us.</h5>
						<ul class="list-group">
							<li><a href="#" class="list-group-item">Company
									Background</a></li>

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