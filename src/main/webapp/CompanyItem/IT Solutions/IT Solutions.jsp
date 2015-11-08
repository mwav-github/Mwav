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
		<div class="row">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand active" href="/">Mwav</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/CompanyItem/IT Solutions/IT Solutions.jsp">IT
									Solutions</a></li>
							<li><a href="/CompanyItem/IT Products/IT Products.jsp">IT
									Products</a></li>
							<li><a href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite Building</a></li>
							<li><a href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital Marketing</a></li>
							<li><a href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT Consulting</a></li>
							<li><a href="/CommonApps/Member/MbrLogin.jsp"><i
									class="fa fa-user fa-lg"></i></a></li>
							<li><a href="/CommonApps/Member/MbrInput.jsp"><i
									class="fa fa-user-plus fa-lg"></i></a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container -->
			</nav>
		</div>
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
			<!-- Sidebar Column -->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CompanyItem/IT Solutions/IT Solutions.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="left" data-original-title="IT솔루션">IT Solutions</a>
					<a href="/CompanyItem/IT Solutions/IT Products.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="IT제품">IT Products</a> <a
						href="#" class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="웹사이트 제작">WebSite
						Building</a> <a href="#" class="list-group-item "
						data-toggle="tooltip" data-placement="left"
						data-original-title="디지털 마케팅">Digital Marketing</a> <a href="#"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="IT 컨설팅">IT
						Consulting</a>
				</div>
			</div>
			<!-- 끝 -->

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
							Project</i>
						</a>
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
							Project</i>
						</a>
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
							Project</i>
						</a>
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
							Project</i>
						</a>
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
						<a class="btn btn-primary" href="#">View Project</i></a>
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

		<hr>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>

	</div>
	<!-- /.container -->
</body>

</html>	