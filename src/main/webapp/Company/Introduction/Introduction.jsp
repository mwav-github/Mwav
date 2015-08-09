<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand active" href="/">Mwav</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/CompanyItem/IT Solutions/IT Solutions.jsp">IT
									Solutions</a></li>
							<li><a href="/CompanyItem/IT Products/IT Products.jsp">IT
									Products</a></li>
							<li><a href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite Building</a></li>
							<li><a href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital Marketing</a></li>
							<li><a href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT Consulting</a></li>
							<li><a href="/CommonApps/Member/MbrLogin.jsp"><i
									class="fa fa-user fa-lg"></i></a></li>
							<li><a href="/CommonApps/Member/MbrInput.jsp"><i
									class="fa fa-user-plus fa-lg"></i></a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container -->
			</nav>
		</div>
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img src="/Company/zImage/Company_IN(height_280).jpg"
					class="img-responsive res_width" alt="Responsive image">
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
					Company <small> Introduction</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>Company</li>
					<li class="active">Introduction</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->


		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/Company/Introduction/Introduction.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="left" data-original-title="회사소개">Introduction</a>
					<a href="/Company/Greetings/Greetings.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="대표인사말">Greetings</a> <a
						href="/Company/History/History.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="회사연혁">History</a> <a href="/Company/BusinessField/BusinessFields.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="사업분야">BusinessField</a>
					<a href="/Company/ActualResults/ActualResults.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회사실적">ActualResults</a>
					<a href="/Company/ThePress/ThePress.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="언론보도">ThePress</a> <a href="/Company/HR-Affairs/HR-Affairs.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="인재채용">HR-Affairs</a> <a
						href="/Company/LocationMap/LocationMap.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회사약도">LocationMap</a> <a
						href="/Company/Profitsharing/Profitsharing.jsp" class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="수익분배 프로그램">Profitsharing</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">

				<!-- Summary -->
				<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Summary</h2>
					</div>
					<div class="col-md-12 col-lg-12 col-sm-6">
						<h4>Summary</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>

				<!-- (2) Vision -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">The Vision</h2>
					</div>
					<div class="col-lg-12">

						<ul id="myTab" class="nav nav-tabs nav-justified">
							<li class="active"><a href="#Vision" data-toggle="tab"><i
									class="fa fa-plus-square"></i> The Vision (Mission)</a></li>
							<li class=""><a href="#Goals" data-toggle="tab"><i
									class="fa fa-gratipay"></i> The Goals (Objectives)</a></li>
							<li class=""><a href="#Strategy" data-toggle="tab"><i
									class="fa fa-hand-o-right"></i> Strategy</a></li>
						</ul>

						<div id="myTabContent" class="tab-content">
							<!-- The Vision (Mission) -->
							<div class="tab-pane fade active in" id="Vision">
								<h4>&nbsp;&nbsp;Vision</h4>
								<br>

								<p>
									<i class="fa fa-check"></i>&nbsp;To be the best online business
									provider, creating higher values for the business of our
									clients.
								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Helping staff members together
									in order to make their dreams come true for the ultimate
									happiness.
								</p>
							</div>

							<!-- The Goals (Objectives) -->
							<div class="tab-pane fade" id="Goals">
								<h4>&nbsp;&nbsp;The Goals (Objectives)</h4>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Make the leading company in
									online business industry.
								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Listen to our clients and
									members carefully for better understanding.
								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Make our clients be successful
									for their online business.
								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Contribute to the local
									communities.
								</p>
							</div>

							<!--  -->
							<div class="tab-pane fade" id="Strategy">
								<h4>&nbsp;&nbsp;The Strategy</h4>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Approach clients in online
									business perspective with the most suitable methodology and
									technology for both effectiveness and efficiency.

								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;You have less than 60 seconds
									to get an investors attention. Don’t waste it.

								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Get and Learn new trends in
									our sectors persistently .
								</p>
								<br>
								<p>
									<i class="fa fa-check"></i>&nbsp;Support leading members in
									order to make their business successful.
								</p>
								<p>
									<i class="fa fa-check"></i>&nbsp;40% of company resources
									should be used for doing current works hard, 30% for innovating
									current work processes best,
								</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;and finally 30% for creating the
									next business models in the future.</p>
								<p>
									<i class="fa fa-check"></i>&nbsp;Show, don’t tell (order).

								</p>
							</div>
						</div>

					</div>
				</div>

				<!-- (3) Organization Chart -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Organization Chart</h2>
					</div>
					<div class="col-lg-12">
						<div class="well">
							<p align="center">
								<img class="thumbnail img-responsive" alt="Bootstrap template"
									src="/Company/zImage/OrganizationChart.png" />
							</p>
						</div>

					</div>
				</div>

			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>

	</div>
	<!-- /.container -->
</body>

</html>