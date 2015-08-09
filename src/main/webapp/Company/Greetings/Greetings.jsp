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
					Company <small> Greetings</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company</li>
					<li class="active">Greetings</li>
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
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회사소개">Introduction</a>
					<a href="/Company/Greetings/Greetings.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="left" data-original-title="대표인사말">Greetings</a> <a
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
						data-original-title="언론보도">ThePress</a> <a href="#"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="인재채용">HR-Affairs</a> <a
						href="/Company/LocationMap/LocationMap.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회사약도">LocationMap</a> <a
						href="#" class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="수익분배 프로그램">Profitsharing</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">

				<!-- (1) Greetings -->
				<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">CEO Greeting</h2>
					</div>
					<div class="col-md-9 col-lg-9 col-sm-7">
						<br>
						<p class="lead">안녕하세요. 엠웨이브넷 경영진입니다.</p>
						<br>
						<p>우선 저희 엠웨이브넷을 관심을 가지고 방문해 주신 고객 및 관계사 여러분들께 깊은 감사의 말씀 전합니다.</p>
						<p>인터넷 초창기에 마음 맞는 개발자 중심의 작은 커뮤니티에서 시험적으로 시작해 본 것이 이제는 꽤 많은
							시간이 지난 듯합니다.</p>
						<p>우리는 오늘날 Social, Mobile, Cloud, Analytics, IoT 등의 인터넷기술을
							배제하고는 상상하기 힘든 사업환경 속에 살고 있습니다.</p>
						<p>하지만,일반기업들이 이런 기술을 최적화하여 사업에 활용하는 것이 쉽지 않음은 이미 알고 있습니다.</p>

						<p>따라서 인터넷 기반의 사업을 진행하면서 저희의 처음처럼 경험 부족으로 어려움을 겪고 계실 것이라
							생각됩니다.그런 사업체를 대상으로 기회를 함께 보고, 전문분야를 서로 공유하고자 합니다.</p>
						<p>IT 컨설팅에서 개발,유지보수, 프로모션운영까지 저희의 축적된 경험이 귀사의 성공으로 가는 여정에 토대가
							되어 드릴 것이라 확신하며, 느낄 수 있는 보람이라 생각하겠습니다.</p>

						<br>
						<p>앞으로 IT환경이 삶에 미칠 영향력의 크기는 정확히 예측하기 어렵지만,분명한 것은 이러한 파급효과는
							지속되고 세분화되어 인터넷 문화의 한 축으로 공고히 자리 잡게 될 것이라는 것입니다.</p>
						<p>그 문화중심에서고객사와 함께 온라인 Business 문화를 선도하고 가치를 창조하여 파트너로써 다양한
							역할을 수행할 것을 약속 드립니다.</p>
						<p>아울러 마지막으로 내실 있고 자사만의 색깔을 가진 조직으로 발전하여 미래지향적인 글로벌 시대에 새로운
							지평을 열겠습니다.</p>
						<p>고객감동을 통한 최고의 기업가치를 제공할 수 있도록 열정을 가지고 임하겠습니다.</p>
						<br>
						<br>
						<p class="text-right">
							<strong>대표이사: 김주성(사인)</strong>
						</p>
					</div>

					<div class="col-md-3 col-lg-3 col-sm-5">
						<div class="well">
							<img class="thumbnail img-responsive" alt="Bootstrap template"
								src="http://www.prepbootstrap.com/Content/images/shared/houses/h7.jpg" />
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