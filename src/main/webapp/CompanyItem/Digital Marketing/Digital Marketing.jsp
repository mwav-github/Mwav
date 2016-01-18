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
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
					class="img-responsive res_width fix_height_300"
					alt="Responsive image">
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
					IT Solutions <small>Digital Marketing</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CompanyItem</li>
					<li class="active">Digital Marketing</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="#marketing_1" class="list-group-item"
						data-toggle="tooltip" data-placement="top"
						data-original-title="키워드마케팅">Keyword Marketing</a> <a
						href="#marketing_2" class="list-group-item" data-toggle="tooltip"
						data-placement="top" data-original-title="바이럴마케팅">바이럴마케팅</a>
					<!-- <a
						href="#" class="list-group-item" data-toggle="tooltip"
						data-placement="top" data-original-title="바이럴마케팅(PC)">Viral
						Marketing(PC)</a> -->
					<a href="#marketing_3" class="list-group-item"
						data-toggle="tooltip" data-placement="top"
						data-original-title="바이럴마케팅(모바일)">Viral Marketing(Mobile)</a> <a
						href="#marketing_4" class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="소셜마케팅">SNS Marketing</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">

				<div class="row">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->

					<div class="text-center">
						<h1 style="color: #04A3ED;">DIGITAL MARKETING</h1>
						<hr class="hr_b">
					</div>

					<div class="enter"></div>
					<h5 class="text-left"><strong>Keyword Marketing</strong></h5>
					<hr>
					<div id="marketing_1" class="col-md-12">
						<img src="/CompanyItem/Digital Marketing/Images/1_1.png"
							class="img-responsive" alt="Responsive image">
					</div>

					<div class="enter"></div>
					
					<h5 class="text-left"><strong>Viral Marketing</strong></h5>
					<hr>
					<div id="marketing_2" class="col-md-12">
						<img src="/CompanyItem/Digital Marketing/Images/2_1.png"
							class="img-responsive" alt="Responsive image">
					</div>

					<div class="enter"></div>

					<h5 class="text-left"><strong>SNS Marketing</strong></h5>
					<hr>

					<div id="marketing_4" class="col-md-12">
						<img src="/CompanyItem/Digital Marketing/Images/2_3.png"
							class="img-responsive" alt="Responsive image">
					</div>

					<div class="enter"></div>

					<h5 class="text-left"><strong>Viral Marketing(Mobile)</strong></h5>
					<hr>
					<div class="col-md-12">
						<img src="/CompanyItem/Digital Marketing/Images/2_4.png"
							class="img-responsive" alt="Responsive image">
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