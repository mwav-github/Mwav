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
			<h2 class="title-page">Wish List</h2>
		</div>
		<!-- container //  -->
	</section>
	<!-- ========================= SECTION ONE END// ========================= -->

	<!-- ========================= SECTION TWO ========================= -->
	<section class="section-content padding-y">
		<div class="container">

			<div class="row">
				<main class="col-md-12">
				<div class="card">

					<table class="table table-borderless table-shopping-cart">
						<thead class="text-muted">
							<tr class="small text-uppercase">
								<th scope="col">Product</th>
								<th scope="col" width="120">Quantity</th>
								<th scope="col" width="120">Price</th>
								<th scope="col" class="text-right" width="200"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<figure class="itemside">
										<div class="aside">
											<img src="images/items/1.jpg" class="img-sm">
										</div>
										<figcaption class="info">
											<a href="#" class="title text-dark">Some name of item
												goes here nice</a>
											<p class="text-muted small">
												Size: XL, Color: blue, <br> Brand: Gucci
											</p>
										</figcaption>
									</figure>
								</td>
								<td><select class="form-control">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
								</select></td>
								<td>
									<div class="price-wrap">
										<var class="price">$1156.00</var>
										<small class="text-muted"> $315.20 each </small>
									</div> <!-- price-wrap .// -->
								</td>
								<td class="text-right"><a
									data-original-title="Save to Wishlist" title="" href=""
									class="btn btn-light" data-toggle="tooltip"> <i
										class="fa fa-heart"></i></a> <a href="" class="btn btn-light">
										Remove</a></td>
							</tr>
							<tr>
								<td>
									<figure class="itemside">
										<div class="aside">
											<img src="images/items/2.jpg" class="img-sm">
										</div>
										<figcaption class="info">
											<a href="#" class="title text-dark">Product name goes
												here nice</a>
											<p class="text-muted small">
												Size: XL, Color: blue, <br> Brand: Gucci
											</p>
										</figcaption>
									</figure>
								</td>
								<td><select class="form-control">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
								</select></td>
								<td>
									<div class="price-wrap">
										<var class="price">$149.97</var>
										<small class="text-muted"> $75.00 each </small>
									</div> <!-- price-wrap .// -->
								</td>
								<td class="text-right"><a
									data-original-title="Save to Wishlist" title="" href=""
									class="btn btn-light" data-toggle="tooltip"> <i
										class="fa fa-heart"></i></a> <a href=""
									class="btn btn-light btn-round"> Remove</a></td>
							</tr>
							<tr>
								<td>
									<figure class="itemside">
										<div class="aside">
											<img src="images/items/3.jpg" class="img-sm">
										</div>
										<figcaption class="info">
											<a href="#" class="title text-dark">Another name of some
												product goes just here</a>
											<p class="small text-muted">Size: XL, Color: blue, Brand:
												Tissot</p>
										</figcaption>
									</figure>
								</td>
								<td><select class="form-control">
										<option>1</option>
										<option>2</option>
										<option>3</option>
								</select></td>
								<td>
									<div class="price-wrap">
										<var class="price">$98.00</var>
										<small class="text-muted"> $578.00 each</small>
									</div> <!-- price-wrap .// -->
								</td>
								<td class="text-right"><a
									data-original-title="Save to Wishlist" title="" href=""
									class="btn btn-light" data-toggle="tooltip"> <i
										class="fa fa-heart"></i></a> <a href=""
									class="btn btn-light btn-round"> Remove</a></td>
							</tr>
						</tbody>
					</table>

					<div class="card-body border-top">
						<a href="#" class="btn btn-primary float-md-right"> Make
							Purchase <i class="fa fa-chevron-right"></i>
						</a> <a href="#" class="btn btn-light"> <i
							class="fa fa-chevron-left"></i> Continue shopping
						</a>
					</div>
				</div>
				<!-- card.// -->

				<div class="alert alert-success mt-3">
					<p class="icontext">
						<i class="icon text-success fa fa-truck"></i> Free Delivery within
						1-2 weeks
					</p>
				</div>

				</main>
			</div>

		</div>
		<!-- container .//  -->
	</section>
	<!-- ========================= SECTION TWO END// ========================= -->

	<!-- ========================= SECTION THREE ========================= -->
	<section class="section-name bg padding-y">
		<div class="container">
			<h6>Payment and refund policy</h6>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>

		</div>
		<!-- container // -->
	</section>
	<!-- ========================= SECTION THREE END// ========================= -->


	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->



</body>
</html>