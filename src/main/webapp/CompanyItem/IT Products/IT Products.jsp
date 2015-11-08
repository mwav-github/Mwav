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
							<li><a
								href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite
									Building</a></li>
							<li><a
								href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital
									Marketing</a></li>
							<li><a href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT
									Consulting</a></li>
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
					<li>CompanyItem</li>
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
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="IT솔루션">IT Solutions</a>
					<a href="/CompanyItem/IT Solutions/IT Products.jsp"
						class="list-group-item active" data-toggle="tooltip"
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