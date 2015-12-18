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
					IT Solutions <small>WebSite Building</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CompanyItem</li>
					<li class="active">WebSite Building</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
				 <%--
					<a href="/CompanyItem/IT Solutions/IT Solutions.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="IT솔루션">IT Solutions</a> <a
						href="/CompanyItem/IT Products/IT Products.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="IT제품">IT Products</a> 
						 --%>
						
						<a
						href="/CompanyItem/WebSite Building/WebSite Building.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="웹사이트 제작">WebSite
						Building</a> <%--<a
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="디지털 마케팅">Digital
						Marketing</a> <a href="/CompanyItem/IT Consulting/IT Consulting.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="IT 컨설팅">IT
						Consulting</a> --%>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">

				<!-- Intro Content -->
				<div class="row">
					<div class="col-md-8">
						<a href="/Templates/FrontTemplate.html"> <img class="img-responsive well"
							src="/CompanyItem/WebSite Building/Images/CompanyTemplate.PNG"
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
				</div>

				<!-- Our Customers -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Our Customers</h2>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6">
						<img class="img-responsive "
							src="/Images/CompanyLogos/CompanyLogo.gif" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6">
						<img class="img-responsive " src="http://placehold.it/500x300"
							alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6">
						<img class="img-responsive " src="http://placehold.it/500x300"
							alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6">
						<img class="img-responsive " src="http://placehold.it/500x300"
							alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6">
						<img class="img-responsive " src="http://placehold.it/500x300"
							alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6">
						<img class="img-responsive " src="http://placehold.it/500x300"
							alt="">
					</div>
				</div>
				<!-- Contact Us -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Contact Us</h2>
					</div>
					<div class="row mgt12">
						<div class="well well-sm">
							<form>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="name"> Name</label> <input type="text"
												class="form-control" id="name" placeholder="Enter name"
												required="required" />
										</div>
										<div class="form-group">
											<label for="email"> Email Address</label>
											<div class="input-group">
												<span class="input-group-addon"><span
													class="glyphicon glyphicon-envelope"></span> </span> <input
													type="email" class="form-control" id="email"
													placeholder="Enter email" required="required" />
											</div>
										</div>
										<div class="form-group">
											<label for="subject"> Subject</label> <select id="subject"
												name="subject" class="form-control" required="required">
												<option value="na" selected="">Choose One:</option>
												<option value="service">General Customer Service</option>
												<option value="suggestions">Suggestions</option>
												<option value="product">Product Support</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="name"> Message</label>
											<textarea name="message" id="message" class="form-control"
												rows="9" cols="25" required="required" placeholder="Message"></textarea>
										</div>
									</div>
									<div class="col-md-12">
										<button type="submit" class="btn btn-primary pull-right"
											id="btnContactUs">Send Message</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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