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
					<a href="/CompanyItem/ITSolutions/ITSolutions.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="IT솔루션">IT Solutions</a>
					<%-- <a
						href="/CompanyItem/IT Products/IT Products.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="IT제품">IT Products</a> <a
						href="/CompanyItem/WebSite Building/WebSite Building.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="웹사이트 제작">WebSite Building</a> <a
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="디지털 마케팅">Digital
						Marketing</a> <a href="/CompanyItem/IT Consulting/IT Consulting.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="IT 컨설팅">IT Consulting</a>--%>
				</div>
			</div>
			<!-- 끝 -->
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
	
</div>

			<!-- Content Column -->
			<div class="col-md-9">
				<!-- Project One -->
				<div class="row">
					<div class="col-md-7">
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-5">
						<h3>Project One</h3>
						<h4>Subheading</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Laudantium veniam exercitationem expedita laborum at voluptate.
							Labore, voluptates totam at aut nemo deserunt rem magni pariatur
							quos perspiciatis atque eveniet unde.</p>
						<a class="btn btn-primary" href="portfolio-item.html">View
							Project </a>
					</div>
				</div>
				<!-- /.row -->

				<hr>

				<!-- Project Two -->
				<div class="row">
					<div class="col-md-7">
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-5">
						<h3>Project Two</h3>
						<h4>Subheading</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ut, odit velit cumque vero doloremque repellendus distinctio
							maiores rem expedita a nam vitae modi quidem similique ducimus!
							Velit, esse totam tempore.</p>
						<a class="btn btn-primary" href="portfolio-item.html">View
							Project </a>
					</div>
				</div>
				<!-- /.row -->

				<hr>

				<!-- Project Three -->
				<div class="row">
					<div class="col-md-7">
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-5">
						<h3>Project Three</h3>
						<h4>Subheading</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Omnis, temporibus, dolores, at, praesentium ut unde repudiandae
							voluptatum sit ab debitis suscipit fugiat natus velit excepturi
							amet commodi deleniti alias possimus!</p>
						<a class="btn btn-primary" href="portfolio-item.html">View
							Project </a>
					</div>
				</div>
				<!-- /.row -->

				<hr>

				<!-- Project Four -->
				<div class="row">

					<div class="col-md-7">
						<a href="portfolio-item.html"> <img
							class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-5">
						<h3>Project Four</h3>
						<h4>Subheading</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Explicabo, quidem, consectetur, officia rem officiis illum
							aliquam perspiciatis aspernatur quod modi hic nemo qui soluta aut
							eius fugit quam in suscipit?</p>
						<a class="btn btn-primary" href="portfolio-item.html">View
							Project </a>
					</div>
				</div>
				<!-- /.row -->

				<hr>

				<!-- Project Five -->
				<div class="row">
					<div class="col-md-7">
						<a href="#"> <img class="img-responsive img-hover"
							src="http://placehold.it/700x300" alt="">
						</a>
					</div>
					<div class="col-md-5">
						<h3>Project Five</h3>
						<h4>Subheading</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquid, quo, minima, inventore voluptatum saepe quos nostrum
							provident ex quisquam hic odio repellendus atque porro distinctio
							quae id laboriosam facilis dolorum.</p>
						<a class="btn btn-primary" href="#">View Project</a>
					</div>
				</div>
				<!-- /.row -->

				<hr>

				<!-- Pagination -->
				<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
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
