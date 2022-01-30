<%-- 메인화면 상품목록 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="section-content padding-top-sm">
	<div class="container">

		<header class="section-heading">
			<h3 class="section-title">New arrived</h3>
		</header>
		<!-- sect-heading -->

		<div class="row">
			<div class="col-md-3">
				<div href="#" class="card card-product-grid">
					<div class="img-wrap">
						<span class="badge badge-danger"> NEW </span>
						<span class="topbar">
							<a href="#" class="float-right">
								<i class="fa fa-heart fa-2x"></i>
							</a>
						</span>
						<img src="<c:url value="/resources/bizlogin/images/goods/orange.jpg" />">
						<a class="btn-overlay" href="#">
							<i class="fa fa-search-plus"></i>
							Quick view
						</a>
					</div>
					<figcaption class="info-wrap">
						<a href="<c:url value="/bizlogin/goods/catalog/detail" />" class="title font-weight-bold">오렌지 쥬스</a>
						<h6 class="text-muted">맛있는 오렌지 쥬스 팔아요.~!! 망설이지 마시고 포스팅 해보세요 RightNow</h6>

						<!-- Category 나열 영역 -->
						<span class="tag">32 GB</span>
						<span class="tag">Brand new</span>
						<span class="tag">256 px</span>
						<span class="tag">Metallic</span>
						<div class="rating-wrap">
							<ul class="rating-stars">
								<li style="width: 80%" class="stars-active">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
								<li>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
							</ul>
							<span class="label-rating text-muted"> 34 reviws</span>
						</div>
						<div class="price mt-1">$179.00</div>
						<!-- .price-wrap -->
					</figcaption>
				</div>
			</div>
			<!-- col.// -->
			<div class="col-md-3">
				<div href="/bizlogin/goods/catalog/detail" class="card card-product-grid">
					<a href="#" class="img-wrap">
						<img src="<c:url value="/resources/bizlogin/images/goods/orange.jpg" />">
					</a>
					<figcaption class="info-wrap">
						<a href="#" class="title">Some item name here</a>

						<div class="rating-wrap">
							<ul class="rating-stars">
								<li style="width: 80%" class="stars-active">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
								<li>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
							</ul>
							<span class="label-rating text-muted"> 34 reviws</span>
						</div>
						<div class="price mt-1">$280.00</div>
						<!-- .price-wrap -->
					</figcaption>
				</div>
			</div>
			<!-- col.// -->
			<div class="col-md-3">
				<div href="#" class="card card-product-grid">
					<a href="/bizlogin/goods/catalog/detail" class="img-wrap">
						<img src="<c:url value="/resources/bizlogin/images/goods/orange.jpg" />">
					</a>
					<figcaption class="info-wrap">
						<a href="#" class="title">Great product name here</a>

						<div class="rating-wrap">
							<ul class="rating-stars">
								<li style="width: 80%" class="stars-active">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
								<li>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
							</ul>
							<span class="label-rating text-muted"> 34 reviws</span>
						</div>
						<div class="price mt-1">$56.00</div>
						<!-- price-wrap.// -->
					</figcaption>
				</div>
			</div>
			<!-- col.// -->
			<div class="col-md-3">
				<div href="#" class="card card-product-grid">
					<a href="/bizlogin/goods/catalog/detail" class="img-wrap">
						<img src="<c:url value="/resources/bizlogin/images/goods/orange.jpg" />">
					</a>
					<figcaption class="info-wrap">
						<a href="#" class="title">Just another product name</a>

						<div class="rating-wrap">
							<ul class="rating-stars">
								<li style="width: 80%" class="stars-active">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
								<li>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</li>
							</ul>
							<span class="label-rating text-muted"> 34 reviws</span>
						</div>
						<div class="price mt-1">$179.00</div>
						<!-- price-wrap.// -->
					</figcaption>
				</div>
			</div>
			<!-- col.// -->
		</div>
		<!-- row.// -->

	</div>
	<!-- container .//  -->
</section>