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
		<!-- Image Container container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<img src="/CompanyItem/ITProducts/Images/vanillaNAV_mall.jpg"
				class="img-responsive res_width fix_height_300"
				alt="vanillaNAV_mall">
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
					IT Products <small>vanillaNAV</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Products</li>
					<li class="active">vanillaNAV</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CompanyItem/ITProducts/ITProductsLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- Content Column -->
			<div class="col-md-9">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="enter"></div>
					
					<div id="features" class="row">
						<div class="row">
							<div class="col-md-3">
								<img class="img-responsive img-hover center-block"
									src="/CompanyItem/ITProducts/Images/vanillaNAV_marker.png"
									alt="vanillaNAV_marker">

							</div>
							<div class="col-md-9">
								<div class="text-left">
									<h4 class="pull-left" style="color: #e67525;">
										<strong>Indoor positioning technology</strong>
									</h4>
									<h4 class="pull-left">&nbsp; – accurate and reliable</h4>
									<p class="pull-left">The vanillaNAV indoor positioning
										system doesn´t require complex bluetooth beacon or WiFi
										infrastructure. It simply works via optical navigation
										markers. Those small QR codes can be attached to the floor or
										on walls and enable absolutely reliable and precise indoor
										positioning within centimeters.</p>

								</div>
							</div>
						</div>

						<div class="enter"></div>
						<div class="row">
							<div class="col-md-3">
								<img class="img-responsive img-hover center-block"
									src="/CompanyItem/ITProducts/Images/vanillaNAV_mac.png"
									alt="vanillaNAV_mac">

							</div>
							<div class="col-md-9">
								<div class="text-left">
									<h4 class="pull-left" style="color: #e67525;">
										<strong>vanillaNAV Manager</strong>
									</h4>
									<h4 class="pull-left">&nbsp; – simply easy</h4>
									<p class="pull-left">The web-backend allows you to manage
										your venue 24/7 from all over the world. Use the vanillaNAV
										Manager to define navigation destinations, specify routes and
										add additional information about destinations.</p>
									<p class="small pull-left" style="color: #e67525;">Try out
										vanillaNAV indoor navigation for free for up to 10 navigation
										destinations</p>
									<%-- <p class="pull-left"><a href="" class="btn btn-xs btn-warning">Android</a></p> --%>
								</div>
							</div>
						</div>
						<div class="enter"></div>
						<div class="row">
							<div class="col-md-3">
								<img class="img-responsive img-hover center-block"
									src="/CompanyItem/ITProducts/Images/vanillaNAV_hand.png"
									alt="vanillaNAV_mac">

							</div>
							<div class="col-md-9">
								<div class="text-left">
									<h4 class="pull-left" style="color: #e67525;">
										<strong>vanillaNAV App</strong>
									</h4>
									<h4 class="pull-left">&nbsp; – exciting route guidance</h4>
									<p class="pull-left">Navigation destinations can either be
										selected from the list of destinations or via the integrated
										search function. When route guidance is started the vanillaNAV
										App detects navigation markers on the floor or on walls and
										provides intuitive turn by turn navigation through an
										augmented reality navigation arrow – across various floors and
										outdoor areas. Your visitors will be excited!</p>
									<p class="small pull-left" style="color: #e67525;">The
										vanillaNAV indoor navigation App is available free of charge
										in the Android Play Store and Apple App Store Android</p>
								</div>
							</div>
						</div>
					</div>

					<div class="row pgtb7" style="background-color: #e67525;">
						<div class="col-xs-12 col-sm-12 col-md-12" style="color: #eee;">
							<div class="row">
								<div class="col-md-6">
									<h4>
										<strong>Quick, easy and cost-efficient integration
											and operation</strong>
									</h4>
									<ul>
										<li>Quick, easy and cost-efficient integration and
											operation:</li>
										<li>No costs for addition hardware or infrastructure such
											as WiFi hotspots or bluetooth beacons</li>
										<li>No maintenance costs</li>
										<li>No first-time calibration or recalibration necessary</li>
										<li>No need for special map material – any existing floor
											plan can be used</li>
									</ul>
								</div>
								<div class="col-md-6">
									<h4>
										<strong>Location Based Services</strong>
									</h4>
									<ul>
										<li>Information about talks/events at
											exhibitions/conferences</li>
										<li>Additional information about products/articles</li>
										<li>Most visited/searched places in a venue</li>
										<ul>
											<li>Highlights of an exhibitor</li>
											<li>Articles in a store</li>
											<li>Information about an exhibit</li>
											<li>Departure times at a gate</li>
										</ul>
									</ul>
								</div>
							</div>
							<div class="enter"></div>
							<div class="row">
								<div class="col-md-6">
									<h4>
										<strong>Functioning guarantee: the vanillaNAV indoor
											navigation system is guaranteed to work in every building!</strong>
									</h4>
									<ul>
										<li>Works across various floors, elevators, escalators,
											stairs and outdoor areas</li>
										<li>Precise navigation through indoor location tracking
											within centimeters</li>
										<li>Takes your visitors on the best path to their
											destination</li>
									</ul>
								</div>
								<div class="col-md-6">
									<h4>
										<strong>Exciting visitor experience of your location</strong>
									</h4>
									<ul>
										<li>Comfortable turn by turn navigation with augmented
											reality navigation arrows</li>
										<li>Great usability of the vanillaNAV App</li>
										<li>Search function for destinations: quick searching and
											finding of destinations in your building</li>
									</ul>
								</div>
							</div>
							<div class="enter"></div>
							<div class="row">
								<div class="col-md-6">
									<h4>
										<strong>Mobile Marketing & Location Based
											Advertisement:</strong>
									</h4>
									<ul>
										<li>Shops with discounts</li>
										<li>Information about special offers</li>
										<li>Advertisement for new products</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
										<div class="enter"></div>
	
						<div
							class="vid col-xs-push-1 col-xs-10 col-sm-10 col-sm-push-1  col-md-10 col-md-push-1 embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item"
								src="https://www.youtube.com/embed/7BlD57bknbQ"></iframe>

						</div>

						<div class="col-xs-12 col-sm-12 col-md-12">
							<h3 class="text-center" style="color: #e67525;">3 easy steps
								to your indoor navigation system</h3>
						</div>


						<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="enter"></div>
							<div class="col-md-4">
								<h4>Define venue</h4>
								<ul>
									<li>Import floor plan of the venue</li>
									<li>Define navigation destinations and mobile marketing
										information</li>
									<li>Define position of navigation markers</li>
								</ul>
							</div>
							<div class="col-md-4">
								<h4>Print navigation markers</h4>
								<ul>
									<li>Save used navigation markers</li>
									<li>Either print navigation markers on self-adhesive
										material yourself</li>
									<li>Or use our print service</li>
								</ul>
							</div>
							<div class="col-md-4">
								<h4>Place navigation markers</h4>
								<ul>
									<li>Go to the venue</li>
									<li>Place the navigation markers as defined in the floor
										plan</li>
								</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>

</html>