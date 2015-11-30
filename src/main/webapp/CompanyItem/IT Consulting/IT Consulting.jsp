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
					<li class="active">IT Consulting</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CompanyItem/IT Solutions/IT Solutions.jsp"
						class="list-group-item active" data-toggle="tooltip" data-placement="top"
						data-original-title="IT솔루션">IT Solutions</a> <a
						href="/CompanyItem/IT Products/IT Products.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="IT제품">IT Products</a> <a
						href="/CompanyItem/WebSite Building/WebSite Building.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="웹사이트 제작">WebSite Building</a> <a
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="top" data-original-title="디지털 마케팅">Digital
						Marketing</a> <a href="/CompanyItem/IT Consulting/IT Consulting.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="IT 컨설팅">IT Consulting</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">

				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">IT Consulting</h2>
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