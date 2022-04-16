<%-- 프로모터 메일 인증 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<jsp:include page="/bizlogin/sementic/meta.jsp" flush="false" />
</head>
<body>
	<header class="section-header">
		<jsp:include page="/bizlogin/sementic/header.jsp" flush="false" />
	</header>

	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">My account</h2>
		</div>
	</section>

	<section class="section-content padding-y">
		<div class="container">

			<div class="row">
				<aside class="col-md-3">
					<ul class="list-group">
						<a class="list-group-item active" href="#"> Account overview </a>
						<a class="list-group-item" href="#"> My Orders </a>
						<a class="list-group-item" href="#"> My wishlist </a>
						<a class="list-group-item" href="#"> Return and refunds </a>
						<a class="list-group-item" href="#">Settings </a>
						<a class="list-group-item" href="#"> My Selling Items </a>
						<a class="list-group-item" href="#"> Received orders </a>
					</ul>
				</aside>
				<!-- col.// -->
				<main class="col-md-9">

					<article class="card mb-3">
						<div class="card-body">

							<figure class="icontext">
								<div class="icon">
									<img class="rounded-circle img-sm border" src="images/avatars/avatar3.jpg">
								</div>
								<div class="text">
									<strong> Mr. Jackson Someone </strong>
									<br>
									myloginname@gmail.com
									<br>
									<a href="#">Edit</a>
								</div>
							</figure>
							<hr>
							<p>
								<i class="fa fa-map-marker text-muted"></i> &nbsp; My address:
								<br>
								Tashkent city, Street name, Building 123, House 321 &nbsp;
								<a href="#" class="btn-link"> Edit</a>
							</p>

							<article class="card-group">
								<figure class="card bg">
									<div class="p-3">
										<h5 class="card-title">38</h5>
										<span>Orders</span>
									</div>
								</figure>
								<figure class="card bg">
									<div class="p-3">
										<h5 class="card-title">5</h5>
										<span>Wishlists</span>
									</div>
								</figure>
								<figure class="card bg">
									<div class="p-3">
										<h5 class="card-title">12</h5>
										<span>Awaiting delivery</span>
									</div>
								</figure>
								<figure class="card bg">
									<div class="p-3">
										<h5 class="card-title">50</h5>
										<span>Delivered items</span>
									</div>
								</figure>
							</article>

						</div>
					</article>

					<article class="card  mb-3">
						<div class="card-body">
							<h5 class="card-title mb-4">Recent orders</h5>

							<div class="row">
								<div class="col-md-6">
									<figure class="itemside  mb-3">
										<div class="aside">
											<img src="images/items/1.jpg" class="border img-sm">
										</div>
										<figcaption class="info">
											<time class="text-muted">
												<i class="fa fa-calendar-alt"></i> 12.09.2019
											</time>
											<p>Great item name goes here</p>
											<span class="text-warning">Pending</span>
										</figcaption>
									</figure>
								</div>
								<!-- col.// -->
								<div class="col-md-6">
									<figure class="itemside  mb-3">
										<div class="aside">
											<img src="images/items/2.jpg" class="border img-sm">
										</div>
										<figcaption class="info">
											<time class="text-muted">
												<i class="fa fa-calendar-alt"></i> 12.09.2019
											</time>
											<p>Machine for kitchen to blend</p>
											<span class="text-success">Departured</span>
										</figcaption>
									</figure>
								</div>
								<!-- col.// -->
								<div class="col-md-6">
									<figure class="itemside mb-3">
										<div class="aside">
											<img src="images/items/3.jpg" class="border img-sm">
										</div>
										<figcaption class="info">
											<time class="text-muted">
												<i class="fa fa-calendar-alt"></i> 12.09.2019
											</time>
											<p>Ladies bag original leather</p>
											<span class="text-success">Shipped </span>
										</figcaption>
									</figure>
								</div>
							</div>
							<a href="#" class="btn btn-outline-primary"> See all orders </a>
						</div>
					</article>
				</main>
			</div>
		</div>
	</section>

	<footer class="section-footer border-top">
		<jsp:include page="/bizlogin/sementic/footer.jsp" flush="false" />
	</footer>

</body>
</html>