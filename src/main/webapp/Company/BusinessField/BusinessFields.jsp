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
					Company <small> BusinessField</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company</li>
					<li class="active">BusinessField</li>
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
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="회사소개">Introduction</a>
					<a href="/Company/Greetings/Greetings.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="대표인사말">Greetings</a> <a
						href="/Company/History/History.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="회사연혁">History</a> <a
						href="/Company/BusinessField/BusinessFields.jsp"
						class="list-group-item active" data-toggle="tooltip"
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

				<%--(1) --%>
				<div class="row">

					<div class="col-lg-12">
						<h2 class="page-header">The Business Areas</h2>
					</div>
					<%--추후 버튼 변경 예정 또한 추가적으로 ~!! 모달 예정--%>
					<!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<div class="well">
							<a href="#webAd"> <img class="thumbnail img-responsive"
								alt="Bootstrap template"
								src="http://www.prepbootstrap.com/Content/images/shared/houses/h4.jpg" />
							</a>
						</div>
						<a href="#"> <span
								style="border: 1px solid rgba(0, 0, 0, 0.1); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.7);"
								class="btn btn-info btn-lg"><i
									class="glyphicon glyphicon-info-sign"></i> Web / Ad Agency</span>


							</a>
					</div> -->
					<a href="#Web / Ad Agency">
						<button type="button"
							class="btn btn-info btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<h1>Web / Ad Agency</h1>
						</button>
					</a> <a href="#IT Solutions Provider">
						<button type="button"
							class="btn btn-warning btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<h1>IT Solutions Provider</h1>
						</button>
					</a> <a href="#IT Edu. / Consulting">
						<button type="button"
							class="btn btn-primary btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<h1>IT Edu. / Consulting</h1>
						</button>
					</a> <a href="#E-Commerce Services">
						<button type="button"
							class="btn btn-danger btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<h1>E-Commerce Services</h1>
						</button>
					</a>


					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-6">
						<br>
						<p>
							<i class="fa fa-chevron-right"></i> Provides 4 business models
							including an independent business (E-Commerce).
						</p>
						<br>
						<p>
							<i class="fa fa-chevron-right"></i> Web / Ad Agency is sort of
							simple IT- business model suitable for startups.
						</p>
						<br>

						<p>
							<i class="fa fa-chevron-right"></i> Obtains most of IT Solutions
							by global partnership.
						</p>
						<br>
						<p>
							<i class="fa fa-chevron-right"></i> E-Commerce platform is to be
							developed in house and services to be operated by stakeholders
						</p>
					</div>

				</div>

				<%--(2) --%>
				<div class="row">
					<div id="Web / Ad Agency" class="col-lg-12">
						<h2 class="page-header">Web / Ad Agency</h2>
					</div>
					<div class="col-md-12 col-lg-12 col-sm-6">
						<p>
							<i class="fa fa-chevron-right"></i> Web agency:
						</p>
						<p>Build websites for Company, Brands and online campaigns.
							Corporate website, Microsites and Promotion webpages,
							respectively.</p>
						<br>
						<p>
							<i class="fa fa-long-arrow-right"></i> Tasks: Building websites,
							systems, domains, securities, business process, corporate
							(brands) identity and skillful workforce as providing valuable
							know-hows on IT environment for clients.
						</p>

						<br> <br>
						<p>
							<i class="fa fa-chevron-right"></i> Digital Ad Agency: Boost
							online promotions for maximum profits by leveraging digital
							marketing effectively.
						<p>
							<br>
						<p>
							<i class="fa fa-long-arrow-right"></i> Tasks: Social marketing &
							Campaigns (SNS, Blogs, Communities, Korea major portals and
							etc.),
						</p>
						<p>Search Engines (SEO, SEM), Distribution in open malls and
							Media exposures as providing CPM, CPC and statistical analysis.</p>
					</div>
				</div>

				<%--(3) --%>
				<div class="row">
					<div id="IT Solutions Provider" class="col-lg-12">
						<h2 class="page-header">IT Solutions Provider</h2>
					</div>

					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<div
							class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<a href="#" class="btn btn-xs btn-primary pull-right">Learn
								More</a> <strong>MS Products</strong> (Microsoft, US)
						</div>
						<div
							class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<a href="#" class="btn btn-xs btn-primary pull-right">Learn
								More</a> <strong>Open ERP, CRM </strong> (India)
						</div>
						<div
							class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<a href="#" class="btn btn-xs btn-primary pull-right">Learn
								More</a> <strong>Domain, SSL </strong> (Canada)
						</div>
						<div
							class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<a href="#" class="btn btn-xs btn-primary pull-right">Learn
								More</a> <strong>Media Solutions </strong> (Korea)
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<div
							class="alert alert-danger col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<a href="#" class="btn btn-xs btn-danger pull-right">Learn
								More</a> <strong>Trade Certificates </strong> (Russia)
						</div>
					</div>

				</div>

				<%--(4) --%>
				<div class="row">
					<div id="IT Edu. / Consulting" class="col-lg-12">
						<h2 class="page-header">IT Edu. / Consulting</h2>
					</div>
					<div class="col-md-12 col-lg-12 col-sm-6">
						<p>
							<i class="fa fa-chevron-right"></i> An IT consultant works in
							partnership with clients,
						</p>
						<p>&nbsp;&nbsp;advising them how to use information technology
							in order to meet their business objectives or overcome problems.</p>

						<p>&nbsp;&nbsp;Consultants work to improve the structure and
							efficiency of an organization's IT systems.</p>

						<br>
						<p>
							<i class="fa fa-chevron-right"></i> IT consultants may be used to
							provide strategic guidance to organizations with regard to
							technology,
						</p>
						<p>&nbsp;&nbsp;IT infrastructures and the enablement of major
							business processes through enhancements to IT.</p>
						<p>&nbsp;&nbsp;They can also be used to provide guidance
							during selection and procurement as well as providing highly
							expert technical assistance, &nbsp;&nbsp;and may be responsible
							for user training and feedback.</p>
						<br>
						<p>
							<i class="fa fa-chevron-right"></i>IT consultants may be involved
							in sales and business development, as well as technical duties.
						</p>

					</div>
				</div>

				<%--(5) --%>
				<div class="row">
					<div id="E-Commerce Services" class="col-lg-12">
						<h2 class="page-header">E-Commerce Services</h2>
					</div>
					<div class="col-lg-12">
						<p>
							<i class="fa fa-chevron-right"></i> An IT consultant works in
							partnership with clients, advising them how to use information
							technology in order to meet their business objectives or overcome
							problems. <br>&nbsp;&nbsp;Consultants work to improve the
							structure and efficiency of an organization's IT systems.

						</p>
						<br>

						<p>
							<i class="fa fa-chevron-right"></i> IT consultants may be used to
							provide strategic guidance to organizations with regard to
							technology, <br>&nbsp;&nbsp;IT infrastructures and the
							enablement of major business processes through enhancements to
							IT. <br>&nbsp;&nbsp;They can also be used to provide
							guidance during selection and procurement as well as providing
							highly expert technical assistance, <br>&nbsp;&nbsp;and may
							be responsible for user training and feedback.


						</p>
						<br>
						<p>
							<i class="fa fa-chevron-right"></i> IT consultants may be
							involved in sales and business development, as well as technical
							duties.



						</p>

					</div>
				</div>



				<%--(6) --%>
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">The Business Concept</h2>
					</div>
					<div class="col-md-12 col-lg-12 col-sm-6">
						<p>Our business models are currently categorized into three
							fundamental sectors and one applied sector (EC as of now).</p>
						<br>
						<p>The fundamental ones are about technology areas that can
							promote or activate online business, and the applied one is about
							independent online business which have strong investment
							propensity in the long-term perspectives.</p>
						<br>
						<p>With the technologies of fundamental sectors, we provide
							our clients with opportunities to boost their business
							performance but also they can be used for our own applied sectors
							(primarily E-Commerce Platform Business for now).</p>
						<br>
						<p>Consequently, our ultimate goal is defined to support and
							back up online business efficiently for remarkable business
							achievements in holistic view.</p>
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