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
					Company <small> LocationMap</small>
				</h1>
				<ol class="breadcrumb">
				    <li><a href="index.html">Home</a></li>
					<li>Company</li>
					<li class="active">LocationMap</li>
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

			<div class="col-md-9">
				<!-- Content Column -->
				<div class="col-md-8">
					<!-- Embedded Google Map -->
					<iframe width="100%" height="400px" frameborder="0" scrolling="no"
						marginheight="0" marginwidth="0"
						src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3167.4012950319825!2d127.129278!3d37.451246000000005!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca8a401f3127b%3A0x39d64e7ee201cd15!2z6rCA7LKc64yA7ZWZ6rWQIOq4gOuhnOuyjOy6oO2NvOyKpA!5e0!3m2!1sko!2sus!4v1413105831080"></iframe>
				</div>
				<div class="col-md-4">
					<h3>Contact Details</h3>
					<p>
						Gachon University,<br>Bokjeong-dong, Sujeong-gu, <br />Seongnam-si,
						Gyeonggi-do, Korea<br>
					</p>
					<p>
						<i class="fa fa-phone"></i> <abbr title="Phone">P</abbr>: (031)
						339-4451
					</p>
					<p>
						<i class="fa fa-envelope-o"></i> <abbr title="Email">E</abbr>: <a
							href="mailto:mymg99@gmail.com">mymg99@gmail.com</a>
					</p>
					<p>
						<i class="fa fa-clock-o"></i> <abbr title="Hours">H</abbr>: Monday
						- Friday: <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						9:00 AM to 6:00 PM
					</p>
					<ul class="list-unstyled list-inline list-social-icons">
						<li><a href="#"><i class="fa fa-facebook-square fa-2x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-twitter-square fa-2x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a>
						</li>
					</ul>
				</div>

				<!-- /.row -->

			</div>
		</div>

		<hr>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="../../PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>


	</div>
	<!-- /.container -->

</body>

</html>