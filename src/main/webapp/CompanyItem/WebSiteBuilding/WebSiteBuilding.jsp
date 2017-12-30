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
<%--http://bootsnipp.com/snippets/featured/resonsive-features-comparison-table-without-js --%>
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
		<!-- <div class="row">
			<div class="col-lg-12">
				<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
					class="img-responsive res_width fix_height_300"
					alt="Responsive image">
			</div>
		</div> -->
	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row res_width">
			<div class="col-lg-12">
				<h1 class="page-header">WebSite Building</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li class="active">WebSite Building</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<!-- <div class="col-md-3">
				<div class="list-group">

					<a href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="웹사이트 제작" target="_blank">WebSite
						Building</a>

				</div>
			</div> -->
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-12">

				<div class="col-lg-12">
					<h2 class="page-header mwav_leftText">WebSite Building</h2>
				</div>
				<!-- Intro Content -->
				<div class="container">
					<!-- /.col-md-4 -->
					<div class="col-md-4">
						<div class="enter"></div>
						<p>
							주식회사 Mwav는 다양한 고객들의 웹 사이트를 제작해드리고 있습니다. <br> 각 분야의 전문가들로
							구성되어, 모바일 최적화 기능, 최신 기술 적용, 비지니스 최적화, 맞춤형 도메인 등록, 안정적인 호스팅, SEO
							향상 등 완성도 높고 안정적인 웹 사이트를 제공해 드립니다.!
						</p>

						<a href="/Templates/FrontTemplate.html"
							class="btn btn-primary btn-md btn-block">LIVE PREVIEW</a>
					</div>
					<div class="col-md-8">
						<img class="img-responsive img-rounded"
							src="/CompanyItem/WebSiteBuilding/Images/Website_building_3.jpg"
							alt="">
					</div>

					<div class="col-lg-12">
						<div class="well text-center">Mwav의 한발 앞선 홈페이지 제작 기술은 하루아침에
							이뤄지지 않았습니다!</div>
					</div>
				</div>

				<!--Technologies -->
				<div class="container">
					<div class="col-lg-12">
						<h2 class="page-header mwav_leftText">Portfolios</h2>
					</div>

					<div class="row form-group">

						<div class="col-md-4">
							<figure class="snip1174 blue ">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_4.png"
									alt="Elite Clothing" />
								<figcaption>
									<h2>Elite Clothing</h2>
									<p>Garment Exporters</p>
									<a href="http://eliteclothing.in/">ReadMore</a>
								</figcaption>
							</figure>
						</div>

						<div class="col-xs-12 col-md-4">
							<figure class="snip1174 blue ">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_2.png"
									alt="sq-sample33" />
								<figcaption>
									<h2>Shanttech</h2>
									<p>BPO Services</p>
									<a href="https://www.shanttech.com/">ReadMore</a>
								</figcaption>
							</figure>
						</div>
						<div class="col-xs-12 col-md-4">
							<figure class="snip1174 blue ">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_3.png"
									alt="Filcosys" />
								<figcaption>
									<h2>Filcosys</h2>
									<p>Software Developments</p>
									<a href="http://www.filcosys.com/">ReadMore</a>
								</figcaption>
							</figure>
						</div>

						<div class="col-xs-12 col-md-4">
							<figure class="snip1174 blue ">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_5.png"
									alt="Hexagon Nutrition
" />
								<figcaption>
									<h2>Hexagon Nutrition</h2>
									<p>Disease Management</p>
									<a href="http://hexagonnutrition.com/">ReadMore</a>
								</figcaption>
							</figure>
						</div>
						<div class="col-xs-12 col-md-4">
							<figure class="snip1174 blue">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_1.png"
									alt="Prime Visualss" />
								<figcaption>
									<h2>Prime Visualss</h2>
									<p>Visual Advertishments</p>
									<a href="http://www.primevisualss.com/">Read More</a>
								</figcaption>
							</figure>
						</div>
						<div class="col-xs-12 col-md-4">
							<figure class="snip1174 blue ">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_6.png"
									alt="AAPT" />
								<figcaption>
									<h2>AAPT</h2>
									<p>Product Development</p>
									<a href="http://www.aaptinc.com/">ReadMore</a>
								</figcaption>
							</figure>
						</div>

						<div class="col-xs-12 col-md-4">
							<figure class="snip1174 blue ">
								<img
									src="/CompanyItem/WebSiteBuilding/Images/WebSiteBuilding_portfolios_7.png"
									alt="Snappy Joy" />
								<figcaption>
									<h2>Snappy Joy</h2>
									<p>New Product Trophy</p>
									<a href="http://www.snappyjoy.com/">ReadMore</a>
								</figcaption>
							</figure>
						</div>
					</div>

				</div>

				<!--Technologies -->
				<div class="container">
					<div class="col-lg-12">
						<h2 class="page-header mwav_leftText">Technologies</h2>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/Images/CompanyLogos/logo_html5.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/Images/CompanyLogos/logo_javascript.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/Images/CompanyLogos/logo_css3.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/Images/CompanyLogos/logo_bootstrap.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/Images/CompanyLogos/logo_googleanaytics.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/Images/CompanyLogos/logo_jquery.png" alt="">
					</div>
				</div>



				<!-- <div class="row">
					<div class="col-md-8">
						<a href="/Templates/FrontTemplate.html" target="_blank"> <img
							class="img-responsive well"
							src="/CompanyItem/WebSiteBuilding/Images/CompanyTemplate.gif"
							alt=""></a>
					</div>
					<div class="col-md-4">
						<h2>WebSiteBuilding</h2>
						<p>주식회사 Mwav는 다양한 고객들의 웹 사이트를 제작해드리고 있습니다. 각 분야의 전문가들로 구성되어,
							미래 지향적이고 안정적인 웹 사이트를 제공해 드립니다.</p>

						<br> <br>
						<h2>Technologies</h2>
						<ul>
							<li>Bootstrap v3.3.2</li>
							<li>jQuery v1.11.2</li>
							<li>Font Awesome v4.3.0</li>
							<li>Working JSP contact form with validation</li>
							<li>HTML5 &amp; CSS &amp; JavaScript &amp; Ajax</li>
							<li>Spring Framework</li>
							<li>Google Analytics</li>
							<li>17 HTML pages</li>
						</ul>
						<br>
					</div>
				</div> -->


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