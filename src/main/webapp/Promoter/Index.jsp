<%-- 프로모터 메인 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- ========================= Head & Meta Area ========================= -->
<head>
<jsp:include
	page="/Promoter/PartsOfContent/SiteHeader/PmtSiteMetaHeader.jsp"
	flush="false" />
</head>
<!-- ========================= Head & Meta Area END ========================= -->

<body>

	<!--  //////////////Header////////////////////// -->
	<header class="section-header">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteHeader/PmtSiteHeader.jsp"
			flush="false" />
		<!--  //////////////carousel in Header////////////////////// -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="carousel slide" id="carousel-554496">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-554496"></li>
							<li data-slide-to="1" data-target="#carousel-554496"></li>
							<li data-slide-to="2" data-target="#carousel-554496"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap First"
									 style="height: 350px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22494%22%20height%3D%22250%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20494%20250%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_174a460dc6a%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_174a460dc6a%22%3E%3Crect%20width%3D%22494%22%20height%3D%22250%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22183.0546875%22%20y%3D%22136.1%22%3E494x250%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true"/>
								<div class="carousel-caption">
									<h4>Restaurant View</h4>
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book.</p>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap First"
									 style="height: 350px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22494%22%20height%3D%22250%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20494%20250%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_174a460dc6a%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_174a460dc6a%22%3E%3Crect%20width%3D%22494%22%20height%3D%22250%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22183.0546875%22%20y%3D%22136.1%22%3E494x250%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true"/>
								<div class="carousel-caption">
									<h4>printing and typesetting</h4>
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book.</p>
								</div>
							</div>
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel Bootstrap First"
									 style="height: 350px; width: 100%; display: block;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22494%22%20height%3D%22250%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20494%20250%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_174a460dc6a%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_174a460dc6a%22%3E%3Crect%20width%3D%22494%22%20height%3D%22250%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22183.0546875%22%20y%3D%22136.1%22%3E494x250%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true"/>
								<div class="carousel-caption">
									<h4>printer took</h4>
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book.</p>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-554496"
							data-slide="prev"><span class="carousel-control-prev-icon"></span>
							<span class="sr-only">Previous</span></a> <a
							class="carousel-control-next" href="#carousel-554496"
							data-slide="next"><span class="carousel-control-next-icon"></span>
							<span class="sr-only">Next</span></a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-content padding-bottom-sm">
		<jsp:include page="/Promoter/Goods/PmtFrontGoodsList.jsp" flush="false" />
	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->

	<!-- ========================= OUR BRAND ========================= -->

<section class="section-name bg padding-y-sm">

	<div class="container">
		<header class="section-heading">
			<h3 class="section-title">Our Brands</h3>
		</header>
		<!-- sect-heading -->

		<div class="row">
			<div class="col-md-2 col-6">
				<figure class="box item-logo">
					<a href="#"><img src="/Promoter/Goods/zImage/google.png"></a>
					<figcaption class="border-top pt-2">36 Products</figcaption>
				</figure>
				<!-- item-logo.// -->
			</div>
			<!-- col.// -->
			<div class="col-md-2  col-6">
				<figure class="box item-logo">
					<a href="#"><img src="/Promoter/Goods/zImage/google.png"></a>
					<figcaption class="border-top pt-2">980 Products</figcaption>
				</figure>
				<!-- item-logo.// -->
			</div>
			<!-- col.// -->
			<div class="col-md-2  col-6">
				<figure class="box item-logo">
					<a href="#"><img src="/Promoter/Goods/zImage/google.png"></a>
					<figcaption class="border-top pt-2">25 Products</figcaption>
				</figure>
				<!-- item-logo.// -->
			</div>
			<!-- col.// -->
			<div class="col-md-2  col-6">
				<figure class="box item-logo">
					<a href="#"><img src="/Promoter/Goods/zImage/google.png"></a>
					<figcaption class="border-top pt-2">72 Products</figcaption>
				</figure>
				<!-- item-logo.// -->
			</div>
			<!-- col.// -->
			<div class="col-md-2  col-6">
				<figure class="box item-logo">
					<a href="#"><img src="/Promoter/Goods/zImage/google.png"></a>
					<figcaption class="border-top pt-2">41 Products</figcaption>
				</figure>
				<!-- item-logo.// -->
			</div>
			<!-- col.// -->
			<div class="col-md-2  col-6">
				<figure class="box item-logo">
					<a href="#"><img src="/Promoter/Goods/zImage/google.png"></a>
					<figcaption class="border-top pt-2">12 Products</figcaption>
				</figure>
				<!-- item-logo.// -->
			</div>
			<!-- col.// -->
		</div>
		<!-- row.// -->
	</div>
</section>
	<!-- ========================= OUR BRAND END========================= -->

	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END ========================= -->

</body>
</html>