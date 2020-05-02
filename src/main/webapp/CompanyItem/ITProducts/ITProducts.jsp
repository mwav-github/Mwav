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

	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->
	<div class="row">
		<div class="col-lg-12">
			<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
				class="img-responsive res_width fix_height_300"
				alt="Responsive image">
		</div>
	</div>


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					IT Solutions <small>Subheading</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company Item</li>
					<li class="active">IT Solutions</li>
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
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="IT솔루션">IT Solutions</a> <a
						href="/CompanyItem/IT Products/IT Products.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="IT제품">IT Products</a> <a
						href="/CompanyItem/WebSite Building/WebSite Building.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="웹사이트 제작">WebSite Building</a> <a
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="디지털 마케팅">Digital
						Marketing</a> <a href="/CompanyItem/IT Consulting/IT Consulting.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="IT 컨설팅">IT Consulting</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">
				<!-- Aervision 1Item Row -->
				<div class="row">
					<div class="thumbnail">
						<img class="img-responsive" src="http://placehold.it/800x300"
							alt="">
						<div class="caption-full">
							<h4 class="pull-right">$24.99</h4>
							<h4>
								<a href="#">Product Name</a>
							</h4>
							<p>
								See more snippets like these online store reviews at <a
									target="_blank" href="http://bootsnipp.com">Bootsnipp -
									http://bootsnipp.com</a>.
							</p>
							<p>
								Want to make these reviews work? Check out <strong><a
									href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this
										building a review system tutorial</a> </strong>over at maxoffsky.com!
							</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor in reprehenderit in voluptate velit esse cillum
								dolore eu fugiat nulla pariatur. Excepteur sint occaecat
								cupidatat non proident, sunt in culpa qui officia deserunt
								mollit anim id est laborum</p>
						</div>
						<div class="ratings">
							<p class="pull-right">3 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> 4.0 stars
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
<div class="col-md-12">
					<h3>Contact:</h3>
					<p>Have a question or feedback?</p>
					<br>
					<p>
						<!-- <a href="mailto:ebizpromwav@gmail.com" title="Contact me!"><i
						class="fa fa-envelope"></i> Contact</a> -->
						<%--줄 없애기 + 그다음에 메일로 바로연결이아닌 qa쪽 고민 --%>

						<a href="#" class="btn btn-block btn-primary" data-toggle="modal"
							data-target="#Contact"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Footer');"
							style="color: white;"><span
							class="glyphicon glyphicon-envelope"></span> Contact</a>
					</p>
					<p>&nbsp;</p>
	


	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>

</html>