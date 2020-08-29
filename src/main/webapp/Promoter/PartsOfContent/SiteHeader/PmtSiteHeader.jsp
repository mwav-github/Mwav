<%-- Promoter 사이트 헤더 jsp 파일 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
	<div class="container">
		<ul class="navbar-nav d-none d-md-flex mr-auto">
			<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Delivery</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Payment</a></li>
		</ul>
		<ul class="navbar-nav">
			<li><a href="#" class="nav-link"> <i class="fa fa-comment"></i>
					Live chat
			</a></li>
			<li class="nav-item dropdown"><a href="#"
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				aria-expanded="false"> English </a>
				<ul class="dropdown-menu dropdown-menu-right"
					style="max-width: 100px;">
					<li><a class="dropdown-item" href="#">Arabic</a></li>
					<li><a class="dropdown-item" href="#">Russian </a></li>
				</ul></li>
		</ul>
		<!-- list-inline //  -->
	</div>
	<!-- navbar-collapse .// -->
	<!-- container //  -->
</nav>
<!-- header-top-light.// -->

<header class="section-header">
	<section class="header-main border-bottom">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-sm-4 col-md-4 col-5">
					<a href="/Promoter/Index.mwav" class="brand-wrap"> <img
						class="logo" src="/Promoter/zImage/Main_logo_white.jpg">
					</a>
					<!-- brand-wrap.// -->
				</div>
				<div class="col-lg-4 col-xl-5 col-sm-8 col-md-4 d-none d-md-block">
					<form action="#" class="search-wrap">
						<div class="input-group w-100">
							<input type="text" class="form-control" style="width: 55%;"
								placeholder="Search">
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
					<!-- search-wrap .end// -->
				</div>
				<!-- col.// -->
				<div class="col-lg-5 col-xl-4 col-sm-8 col-md-4 col-7">
					<div class="d-flex justify-content-end">
						<!-- 장바구니<a href="#" class="widget-header mr-3">
							<div class="icon">
								<i class="icon-sm rounded-circle border fa fa-shopping-cart"></i>
								<span class="notify">0</span>
							</div>
						</a> -->
						<a href="/Promoter/Goods/PmtWishList.mwav"
							class="widget-header mr-3">
							<div class="icon">
								<i class="icon-sm rounded-circle border fa fa-heart"></i> <span
									class="notify">3</span>
							</div>
						</a>
						<!-- 로그인 전 -->
						<div class="widget-header icontext">
							<a href="#" class="icon icon-sm rounded-circle border"><i
								class="fa fa-user"></i></a>
							<div class="text">
								<span class="text-muted">Welcome!</span>
								<div>
									<a href="/Promoter/Facilitator/PmtLogin.mwav">Sign in</a> | <a
										href="/Promoter/Facilitator/PmtInsertForm.mwav"> Register</a>
								</div>
							</div>
						</div>
						<!-- 로그인 후 -->
						<div class="widget-header dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle"
								data-offset="20,10">
								<div class="icon icon-sm rounded-circle border ">
									<i class="fa fa-user"></i>
								</div> <span class="sr-only">Profile actions</span>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="/Promoter/Facilitator/PmtView.mwav">Profile setting</a> <a
									class="dropdown-item" href="#">My orders</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item" href="#">Log out</a>
							</div>
							<!-- dropdown-menu .//-->
						</div>
						<!-- widget-header .// -->
					</div>
					<!-- widgets-wrap.// -->
				</div>
				<!-- col.// -->
			</div>
			<!-- row.// -->
		</div>
		<!-- container.// -->
	</section>
	<!-- header-main .// -->
	<nav
		class="navbar navbar-light navbar-expand-md navbar-main border-bottom">
		<div class="container">
			<form class="d-md-none my-2">
				<div class="input-group">
					<input type="search" name="search" class="form-control"
						placeholder="Search" required="">
					<div class="input-group-append">
						<button type="submit" class="btn btn-secondary">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#dropdown6" aria-expanded="true">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse show" id="dropdown6" style="">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="page-deal.html">Hot
							deals</a></li>
					<li class="nav-item"><a class="nav-link" href="page-blog.html">Markets</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="page-blog.html">Blog</a>
					</li>
				</ul>

				<ul class="navbar-nav">
					<li class="nav-item"><a href="/Promoter/Goods/PmtGoodsList.mwav" class="nav-link">상품조회</a></li>
					<li class="nav-item"><a href="/Promoter/Goods/PmtGoodsDetail.mwav"
						class="btn btn-primary ml-md-4"><i class="fa fa-plus"></i>
							Post item </a></li>
				</ul>
			</div>
			<!-- collapse .// -->
		</div>
		<!-- container .// -->
	</nav>
</header>
<!-- header-main .// -->