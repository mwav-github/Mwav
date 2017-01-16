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
		<div class="row">
			<div class="col-lg-12">
				<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
					class="img-responsive res_width fix_height_300"
					alt="Responsive image">
			</div>
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
					Company Item <small>IT Consulting</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company Item</li>
					<li class="active">IT Consulting</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CompanyItem/ITProducts/Aervision/Aervision.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="IT솔루션">IT Solutions</a> <a
						href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="IT제품">IT Products</a> <a
						href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="웹사이트 제작">WebSite Building</a> <a
						href="/CompanyItem/DigitalMarketing/DigitalMarketing.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="디지털 마케팅">Digital Marketing</a> <a
						href="/CompanyItem/ITConsulting/ITConsulting.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="IT 컨설팅">IT
						Consulting</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">


					<div id="Consulting Services" class="col-lg-12">
						<h2 class="page-header">Consulting Services</h2>
					</div>
					<div class="col-md-12 col-lg-12 col-sm-12 well">
						<p>Mwav provides our customers with focused offerings and
							practices in areas where we have a unique advantage to providing
							a solution to their business problems. Together with our
							partners, we provide innovative solutions built on products which
							delight our customers by reducing IT risk and maximizing IT
							performance around solutions. Below, you can view examples of the
							various information technology consulting services and solutions
							provided by our partner community and Mwav Consulting Services.</p>
						<br>
						<p>Our partner-led approach affords customers the broadest set
							of offerings with competitive pricing for IT consulting. Below
							are examples of various information-technology consulting
							services and solutions offered by our partner community.</p>
					</div>
					
					
					<div class="row">
						<div class="enter"></div>

						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-fw fa-check"></i> Web Security
									</h4>
								</div>
								<div class="panel-body">
									<p>Minimize known implementation risks</p>
									<p>Increase protection against ongoing security threat
										activity</p>
									<p>Access Symantec’s comprehensive global threat
										intelligence and security expertise</p>
									<p>Quickly identify which assets are at risk and how to
										prioritize incident response within your company</p>
									<br> <a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.jsp"
										class="btn btn-default">Learn More</a>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-fw fa-gift"></i> WebSite Building
									</h4>
								</div>
								<div class="panel-body">
									<p>We can provide information about launching your site
										Hosting plans, Website Design, Layout and forattiong of
										Website and posts, plugins, Responsive Layouts and Themes</p>
									<h5>Technologies</h5>
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
									<br> <a href="/Templates/FrontTemplate.html"
										class="btn btn-default"  target="_blank">Learn More</a>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-fw fa-compass"></i> E-Commerce
									</h4>
								</div>
								<div class="panel-body">
									<p>We can Advise you how to use information technology in
										order to meet your business objectives or overcome problems
										Improve the structure and effciency of an organization's IT
										systems Provide strategic guidance to organizations with
										regard to technology We involved in sales and business
										development, as well as technical duties</p>
									<br> <a href="#" class="btn btn-default">Learn More</a>
								</div>
							</div>
						</div>
					</div>

					<!-- 	
					
					
					<div id="Consulting Services" class="col-lg-12">
						<h2 class="page-header">Consulting Services Examples</h2>
					</div>

					<div class="col-md-12 col-lg-12 col-sm-6">

						<p>Our partner-led approach affords customers the broadest set
							of offerings with competitive pricing for IT consulting. Below
							are examples of various information-technology consulting
							services and solutions offered by our partner community.</p>
						<br>

						<p>
							<i class="fa fa-chevron-right"></i> Web Security
						</p>
						<p>
							<i class="fa fa-long-arrow-right"></i> Minimize known implementation risks
							<br>
							<i class="fa fa-long-arrow-right"></i> Increase protection against ongoing security threat activity
							<br>
							<i class="fa fa-long-arrow-right"></i> Access Symantec’s comprehensive global threat intelligence and security expertise
							<br>
							<i class="fa fa-long-arrow-right"></i> Quickly identify which assets are at risk and how to prioritize incident response within your company
						</p>
						
						<p>
							<i class="fa fa-chevron-right"></i> WebSite Building
						</p>
						<p>
							<i class="fa fa-long-arrow-right"></i> We can provide information about launching your site
							<br>
							<i class="fa fa-long-arrow-right"></i> Hosting plans, Website Design, Layout and forattiong of Website and posts, plugins, Responsive Layouts and Themes, 
							<br>
							<i class="fa fa-long-arrow-right"></i> Technologies
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
						
						<p>
							<i class="fa fa-chevron-right"></i> E-Commerce
						</p>
						<p>
							<i class="fa fa-long-arrow-right"></i> We can Advise you how to use information technology in order to meet your business objectives or overcome problems
							<br>
							<i class="fa fa-long-arrow-right"></i> Improve the structure and effciency of an organization's IT systems
							<br>
							<i class="fa fa-long-arrow-right"></i> provide strategic guidance to organizations with regard to technology
							<br>
							<i class="fa fa-long-arrow-right"></i> We involved in sales and business development, as well as technical duties
						</p>
						
						

					</div>


 -->
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