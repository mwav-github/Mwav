<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
<%--이미지 클릭시 크게 ~!  --%>
<jsp:include page="/Shop/LargeImageView/LargeImageView.jsp"
	flush="false"></jsp:include>
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
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->

	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->

	<!-- Page Content -->
	<!-- <div class="block">
		<div class="col-lg-12">
			<img
				src="/CompanyItem/DigitalMarketing/Images/Marketing_Main_3.jpg"
				class="img-responsive res_width fix_height_300"
				alt="Responsive image">
		</div>
	</div> -->


	<div class="container-fluid">
		<div class="row res_width">
			<div class="col-lg-12">
				<h1 class="page-header">
					Company Item <small>Digital Marketing</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>Company Items</li>
					<li class="active">Digital Marketing</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<!-- <div class="col-md-3">
				<div class="list-group">
					<a href="#marketing_1" class="list-group-item"
						data-toggle="tooltip" data-placement="top"
						data-original-title="키워드마케팅">Keyword Marketing</a> <a
						href="#marketing_2" class="list-group-item" data-toggle="tooltip"
						data-placement="top" data-original-title="바이럴마케팅">바이럴마케팅</a>
					<a
						href="#" class="list-group-item" data-toggle="tooltip"
						data-placement="top" data-original-title="바이럴마케팅(PC)">Viral
						Marketing(PC)</a>
					<a href="#marketing_3" class="list-group-item"
						data-toggle="tooltip" data-placement="top"
						data-original-title="바이럴마케팅(모바일)">Viral Marketing(Mobile)</a> <a
						href="#marketing_4" class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="소셜마케팅">SNS Marketing</a>
				</div>
			</div> -->
			<!-- 끝 -->
			<div class="col-lg-12">
				<h2 class="page-header mwav_leftText">DigitalMarketing Services</h2>
			</div>
			<%--QA이슈 z-index로 처리 
			<!--///////////////////////////////////////////////////
			<jsp:include page="/CommonApps/BoardQnA/qaForm.jsp" flush="false" />
			
			LayerPopup Alert 아이콘 시작 // footer 간격조정을 위해 mgt5추가
			<div class="col-md-12 col-xs-12 col-sm-12  alert alert-info"
				style="z-index: 5;">
				<div class="container">
					<h3>
						<strong> <span class="glyphicon glyphicon-question-sign"
							aria-hidden="true"></span> Have Questions?
						</strong>
					</h3>
					<a href="#" data-toggle="modal" data-target="#Contact"
						class="btn btn-lg btn-primary pull-right">Contact Us</a>
				</div>
			</div>--%>

			<!-- Content Column -->
			<div class="col-md-12">

				<div class="enter"></div>
				<div class="row">
					<div class="continer">
						<div class="row">
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/keyword_search_Main.jpg"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#lightbox"><img
													data-image="/CompanyItem/DigitalMarketing/Images/1_1.png" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<%-- <div class="panel-thumbnail">
										<a href="#" class="thumbnail" data-toggle="modal"
											data-target="#lightbox"> <img
											src="/CompanyItem/DigitalMarketing/Images/Social_Marketing_1.jpg"
											class="img-responsive img-rounded"
											data-image="/CompanyItem/DigitalMarketing/Images/2_3.png">
										</a>
									</div> --%>
									<div class="panel-body">
										<p class="lead">
											<strong>키워드 검색 광고</strong>
										</p>
										<p class="">검색 사이트에서 검색어를 입력하면 검색 결과가 나오는 화면에 광고주의 광고가 상단에
											노출되도록 합니다.</p>
									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/Mobile_marketing_2.jpg"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#lightbox"><img
													data-image="/CompanyItem/DigitalMarketing/Images/2_2.png" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<div class="panel-body">
										<p class="lead">
											<strong>바이럴 마케팅</strong>
										</p>
										<p class="">블로그, 카페, 이메일 등의 채널을 통해 소비자들에게 효과적인 입소문 광고가 될 수
											있도록 제공합니다..</p>
									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/Mobile_Maketing_1.png"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#lightbox"><img
													data-image="/CompanyItem/DigitalMarketing/Images/2_4.png" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<div class="panel-body">
										<p class="lead">
											<strong>모바일 마케팅</strong>
										</p>
										<p class="">포탈, SNS 등 모바일 특화 플랫폼에 노출시켜, 최적의 모바일 마케팅 효과를 얻을
											수 있도록 제공합니다.</p>
									</div>
								</div>
								<!--/panel-->
							</div>

							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/Social_Marketing_1.jpg"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#lightbox"><img
													data-image="/CompanyItem/DigitalMarketing/Images/2_3.png" />
													Read More</a>
											</figcaption>
										</figure>
									</div>

									<div class="panel-body">
										<p class="lead">
											<strong>SNS 마케팅</strong>
										</p>
										<p class="">페이스북, 트위터, 인스타그램 등의 SNS채널에서 핵심 타겟을 대상으로 효과적인
											소셜 마케팅을 진행합니다.</p>

									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->
						</div>
						<!--/row-->


						<div class="col-lg-12">
							<h2 class="page-header mwav_leftText">Ad Tech Services</h2>
						</div>
						<div class="row">
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img src="/CompanyItem/DigitalMarketing/Images/Analytics.jpg"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#"><img
													data-image="" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<div class="panel-body">
										<p class="lead">
											<strong>Analytics</strong>
										</p>
										<p class="">방문자의 사이트 활동, 유입경로, 재방문을 유도하는 방법에 대해 이해함으로써 마케팅
											효과를 향상 시키고, 온라인 비즈니스를 효율적으로 관리할 수 있습니다.</p>
									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/A-B_testing_simple_example.png"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#"><img
													data-image="" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<div class="panel-body">
										<p class="lead">
											<strong>A/B Testing</strong>
										</p>
										<p class="">전체 디자인에서 변경하려고하는 디자인에 대하여, 변경하고자 하는 디자인이 기존
											디자인에 비해 좋은지를 정량적으로 평가할 수 있도록 제공함으로써, 최적의 사이트를 제공합니다.</p>
									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/conversion rate.jpg"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#"><img
													data-image="" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<div class="panel-body">
										<p class="lead">
											<strong>전환율</strong>
										</p>
										<p class="">SNS, 이메일, 제품구매율 등 웹 사이트를 방문한 사용자 중 특정한 목표에 대한
											전환율을 제공함으로써 마케팅 효과를 향상 시키고, 온라인 비즈니스를 효율적으로 관리할 수 있습니다.</p>
									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->

							<!--/col-->
							<div class="col-md-3 col-sm-3 col-xs-6">
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<figure class="snip1174 blue ">
											<img
												src="/CompanyItem/DigitalMarketing/Images/seo.png"
												class="img-responsive img-rounded">
											<figcaption>
												<a href="#" class="" data-toggle="modal"
													data-target="#"><img
													data-image="" />
													Read More</a>
											</figcaption>
										</figure>
									</div>
									<div class="panel-body">
										<p class="lead">
											<strong>검색엔진최적화(SEO)</strong>
										</p>
										<p class="">특정키워드 등에 대하여, 웹사이트를 최적화하여 검색엔진 내 상위에 랭크 될 수
											있도록 합니다.</p>
									</div>
								</div>
								<!--/panel-->
							</div>
							<!--/col-->
						</div>
						<!--/row-->
					</div>
					<!--/container-->
				</div>

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