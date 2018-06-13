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
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<!-- <div class="row">
			<div class="col-lg-12">
				<img
					src="/CompanyItem/ITConsulting/Image/CompanyItem_IN(height_280).jpg"
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
				<h1 class="page-header">IT Consulting</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li class="active">IT Services</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">

			<!-- Content Column -->
			<div class="col-md-12">

				<div id="Consulting Services" class="col-lg-12">
					<h2 class="page-header mwav_leftText">IT Services</h2>
				</div>

				<div class="enter"></div>
				<hr class="hr_b">
				<div class="col-md-12 col-lg-12 col-sm-12">
					<p>An IT consultant works in partnership with clients, advising
						them how to use information technology in order to meet their
						business objectives or overcome problems. Consultants work to
						improve the structure and efficiency of an organization's IT
						systems.</p>
					<br>
					<p>Our partner-led approach affords customers the broadest set
						of offerings with competitive pricing for IT consulting. Below are
						examples of various information-technology consulting services and
						solutions offered by our partner community.</p>
					<div class="enter"></div>
					<div class="enter"></div>

				</div>

				<div class="row">

					<div class="row">
						<div class="col-xs-12 col-sm-8 col-md-8">
							<h3 class="text-left mgb3" style="color: #78828D;">
								<strong>관리자 사이트</strong>
							</h3>
							<p>회사인력이 이용하는 사이트로 single sign on으로 대부분의 작업을 할 수 있도록 구성한다.
								필수적인 인트라넷 환경이 적용되며 롤(직급과 직책)에 따라 권한 설정이된다. 각 운영자에게 관리툴을 제공하고,
								Feedback를 확인할 수 있는 프로세서를 제공한다.</p>
						</div>
						<div
							class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
							<img class="thumbnail img-responsive" alt="Bootstrap template"
								src="/Company/zImage/advertisement.png">
						</div>
					</div>

					<div class="enter"></div>
				</div>

				<!-- <div class="col-xs-6 col-sm-3 col-md-3">
						<div class="thumbnail">
							<img class="img-responsive"
								src="/CompanyItem/ITConsulting/Images/analysis.jpg" alt="">
							<div class="cat">Analytics</div>
							<div class="caption">
								<h3>Analytics</h3>
								<p>We gives you the digital analytics tools you need to
									analyze data from all touchpoints in one place, for a deeper
									understanding of the customer experience. You can then share
									the insights that matter with your whole organization.</p>
							</div>
							<a href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"
								class="btn btn-primary btn-sm btn-block">Learn More</a>
						</div>

						<div class="enter"></div>
					</div> -->
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