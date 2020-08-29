<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<!-- ========================= Head & Meta Area ========================= -->
<head>
<jsp:include
	page="/Promoter/PartsOfContent/SiteHeader/PmtSiteMetaHeader.jsp"
	flush="false" />
<script type="text/javascript">
	/// some script

	// jquery ready start
	$(document).ready(function() {
		// jQuery code

	});
	// jquery end
</script>
</head>
<!-- ========================= Head & Meta Area END ========================= -->

<body>
	<!-- ========================= Header ========================= -->
	<header class="section-header">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteHeader/PmtSiteHeader.jsp"
			flush="false" />
	</header>
	<!-- section-header.// -->
	<!-- ========================= Header END ========================= -->


	<!-- ========================= SECTION ONE ========================= -->
	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">Category products</h2>
			<nav>
				<ol class="breadcrumb text-white">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Best category</a></li>
					<li class="breadcrumb-item active" aria-current="page">Great
						articles</li>
				</ol>
			</nav>
		</div>
		<!-- container //  -->
	</section>
	<!-- ========================= SECTION ONE END// ========================= -->

	<!-- ========================= SECTION TWO ========================= -->
	<section class="section-content padding-y">
		<div class="container">

			<div class="row">
				<aside class="col-md-3">

					<div class="card">
						<article class="filter-group">
							<header class="card-header">
								<a href="#" data-toggle="collapse" data-target="#collapse_1"
									aria-expanded="true" class=""> <i
									class="icon-control fa fa-chevron-down"></i>
									<h6 class="title">Category type</h6>
								</a>
							</header>
							<div class="filter-content collapse show" id="collapse_1"
								style="">
								<div class="card-body">
									<form class="pb-3">
										<div class="input-group">
											<input type="text" class="form-control" placeholder="Search">
											<div class="input-group-append">
												<button class="btn btn-light" type="button">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</form>

									<ul class="list-menu">
										<li><a href="#">People </a></li>
										<li><a href="#">Watches </a></li>
										<li><a href="#">Cinema </a></li>
										<li><a href="#">Clothes </a></li>
										<li><a href="#">Home items </a></li>
										<li><a href="#">Animals</a></li>
										<li><a href="#">People </a></li>
									</ul>

								</div>
								<!-- card-body.// -->
							</div>
						</article>
						<!-- filter-group  .// -->
						<article class="filter-group">
							<header class="card-header">
								<a href="#" data-toggle="collapse" data-target="#collapse_2"
									aria-expanded="true" class=""> <i
									class="icon-control fa fa-chevron-down"></i>
									<h6 class="title">Brands</h6>
								</a>
							</header>
							<div class="filter-content collapse show" id="collapse_2"
								style="">
								<div class="card-body">
									<label class="custom-control custom-checkbox"> <input
										type="checkbox" checked="" class="custom-control-input">
										<div class="custom-control-label">
											Mercedes <b class="badge badge-pill badge-light float-right">120</b>
										</div>
									</label> <label class="custom-control custom-checkbox"> <input
										type="checkbox" checked="" class="custom-control-input">
										<div class="custom-control-label">
											Toyota <b class="badge badge-pill badge-light float-right">15</b>
										</div>
									</label> <label class="custom-control custom-checkbox"> <input
										type="checkbox" checked="" class="custom-control-input">
										<div class="custom-control-label">
											Mitsubishi <b
												class="badge badge-pill badge-light float-right">35</b>
										</div>
									</label> <label class="custom-control custom-checkbox"> <input
										type="checkbox" checked="" class="custom-control-input">
										<div class="custom-control-label">
											Nissan <b class="badge badge-pill badge-light float-right">89</b>
										</div>
									</label> <label class="custom-control custom-checkbox"> <input
										type="checkbox" class="custom-control-input">
										<div class="custom-control-label">
											Honda <b class="badge badge-pill badge-light float-right">30</b>
										</div>
									</label>
								</div>
								<!-- card-body.// -->
							</div>
						</article>
						<!-- filter-group .// -->
						<article class="filter-group">
							<header class="card-header">
								<a href="#" data-toggle="collapse" data-target="#collapse_3"
									aria-expanded="true" class=""> <i
									class="icon-control fa fa-chevron-down"></i>
									<h6 class="title">Price range</h6>
								</a>
							</header>
							<div class="filter-content collapse show" id="collapse_3"
								style="">
								<div class="card-body">
									<input type="range" class="custom-range" min="0" max="100"
										name="">
									<div class="form-row">
										<div class="form-group col-md-6">
											<label>Min</label> <input class="form-control"
												placeholder="$0" type="number">
										</div>
										<div class="form-group text-right col-md-6">
											<label>Max</label> <input class="form-control"
												placeholder="$1,0000" type="number">
										</div>
									</div>
									<!-- form-row.// -->
									<button class="btn btn-block btn-primary">Apply</button>
								</div>
								<!-- card-body.// -->
							</div>
						</article>
						<!-- filter-group .// -->
					</div>
					<!-- card.// -->

				</aside>
				<!-- col.// -->
				<main class="col-md-9"> <header
					class="border-bottom mb-4 pb-3">
					<div class="form-inline">
						<span class="mr-md-auto">32 Items found </span> <select
							class="mr-2 form-control">
							<option>Latest items</option>
							<option>Trending</option>
							<option>Most Popular</option>
							<option>Cheapest</option>
						</select>
						<div class="btn-group">
							<a href="#" class="btn btn-outline-secondary"
								data-toggle="tooltip" title="" data-original-title="List view">
								<i class="fa fa-bars"></i>
							</a> <a href="#" class="btn  btn-outline-secondary active"
								data-toggle="tooltip" title="" data-original-title="Grid view">
								<i class="fa fa-th"></i>
							</a>
						</div>
					</div>
				</header><!-- sect-heading -->

				<div class="row">
					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<span class="badge badge-danger"> NEW </span> <img
									src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay" href="#"><i
									class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Great item name goes here</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
										<del class="price-old">$1980</del>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->

					<div class="col-md-4">
						<figure class="card card-product-grid">
							<div class="img-wrap">
								<img src="/Promoter/Goods/zImage/orange.jpg"> <a class="btn-overlay"
									href="#"><i class="fa fa-search-plus"></i> Quick view</a>
							</div>
							<!-- img-wrap.// -->
							<figcaption class="info-wrap">
								<div class="fix-height">
									<a href="#" class="title">Product name goes here just for
										demo item</a>
									<div class="price-wrap mt-2">
										<span class="price">$1280</span>
									</div>
									<!-- price-wrap.// -->
								</div>
								<a href="#" class="btn btn-block btn-primary">Add to cart </a>
							</figcaption>
						</figure>
					</div>
					<!-- col.// -->
				</div>
				<!-- row end.// -->


				<nav class="mt-4" aria-label="Page navigation sample">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>

				</main>
				<!-- col.// -->

			</div>

		</div>
		<!-- container .//  -->
	</section>
	<!-- ========================= SECTION TWO END// ========================= -->


	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->



</body>
</html>