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
				<h1 class="page-header">
					Company Item <small>IT Consulting</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>Company Item</li>
					<li class="active">IT Consulting</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<!-- <div class="col-md-3">
				<div class="list-group">
					<a href="/CompanyItem/ITConsulting/ITConsulting.mwav"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="IT 컨설팅">IT
						Consulting</a>
				</div>
			</div> -->
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-12">
			<div class="col-xs-12 col-sm-8 col-md-4">
				<div class="col-md-12">
					<h3>Contact:</h3>
					<p>신청접수 및 가격문의가 필요하십니까???</p>
					<br>
					<p>
						<!-- <a href="mailto:ebizpromwav@gmail.com" title="Contact me!"><i
						class="fa fa-envelope"></i> Contact</a> -->
						<%--줄 없애기 + 그다음에 메일로 바로연결이아닌 qa쪽 고민 --%>

						<a href="#" class="btn btn-block btn-primary" data-toggle="modal"
							data-target="#Contact"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Footer');"
							style="color: white;"><span
							class="glyphicon glyphicon-envelope"></span> Contact</a>
					</p>
					<p>&nbsp;</p>
			</div>
			</div>
				<div id="Consulting Services" class="col-lg-12">
					<h2 class="page-header mwav_leftText">IT Consulting Services</h2>
				</div>

				<div class="enter"></div>
				<hr class="hr_b">
				<div class="col-md-12 col-lg-12 col-sm-12">
					<p>Mwav provides our customers with focused offerings and
						practices in areas where we have a unique advantage to providing a
						solution to their business problems. Together with our partners,
						we provide innovative solutions built on products which delight
						our customers by reducing IT risk and maximizing IT performance
						around solutions. Below, you can view examples of the various
						information technology consulting services and solutions provided
						by our partner community and Mwav Consulting Services.</p>
					<br>
					<p>Our partner-led approach affords customers the broadest set
						of offerings with competitive pricing for IT consulting. Below are
						examples of various information-technology consulting services and
						solutions offered by our partner community.</p>
					<div class="enter"></div>
					<div class="enter"></div>

				</div>

				<div class="row">

					<div class="col-xs-12 col-sm-4 col-md-4">
						<div class="thumbnail">
							<img class="img-responsive"
								src="/CompanyItem/ITConsulting/Images/websecurity.jpg" alt="">
							<div class="cat">Web Security</div>
							<div class="caption">
								<h3>Web Security</h3>
								<p>Minimize known implementation risks</p>
								<p>Increase protection against ongoing security threat
									activity</p>
								<p>Access Symantec’s comprehensive global threat
									intelligence and security expertise</p>
								<p>Quickly identify which assets are at risk and how to
									prioritize incident response within your company</p>
							</div>
							<a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.mwav"
								class="btn btn-primary btn-sm btn-block">Learn More</a>
						</div>
						<div class="enter"></div>

					</div>


					<div class="col-xs-12 col-sm-4 col-md-4">
						<div class="thumbnail">
							<img class="img-responsive"
								src="/CompanyItem/ITConsulting/Images/Website_building.png"
								alt="">
							<div class="cat">WebSite Building</div>
							<div class="caption">
								<h3>WebSite Building</h3>
								<p>We can provide information about launching your site
									Hosting plans, Website Design, Layout and forattiong of Website
									and posts, plugins, Responsive Layouts and Themes</p>
								<h3>
									<small>Technologies</small>
								</h3>
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
							</div>
							<a href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"
								class="btn btn-primary btn-sm btn-block">Learn More</a>
						</div>
						<div class="enter"></div>

					</div>

					<div class="col-xs-12 col-sm-4 col-md-4">
						<div class="thumbnail">
							<img class="img-responsive"
								src="/CompanyItem/ITConsulting/Images/ecommerce.png" alt="">
							<div class="cat">E-Commerce</div>
							<div class="caption">
								<h3>E-Commerce</h3>
								<p>We can Advise you how to use information technology in
									order to meet your business objectives or overcome problems
									Improve the structure and effciency of an organization's IT
									systems Provide strategic guidance to organizations with regard
									to technology We involved in sales and business development, as
									well as technical duties</p>
							</div>
							<a href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"
								class="btn btn-primary btn-sm btn-block">Learn More</a>
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