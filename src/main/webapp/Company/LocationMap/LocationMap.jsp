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
		<!--  //////////////////////////////////// -->
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
				<jsp:include page="/Company/CompanyLeftMenu.jsp" flush="false" />
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
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="../../PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>