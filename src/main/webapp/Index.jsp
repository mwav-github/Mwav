<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="PartsOfContent/Head_Import.jsp" flush="false" />
</head>
<body>

	<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
	<!--  //////////////////////////////////// -->
	<jsp:include page="PartsOfContent/SiteHeader/FrontHeader.jsp"
		flush="false" />

	<%-- Page Content (슬라이드 쇼 제외 실제 본문 내용)--%>
	<div class="container">
		<%-- Fluid container : .container 로 콘텐츠를 감싸는 것으로 페이지의 콘텐츠를 쉽게 중앙으로 가져오세요. 
		                       .container 는 우리의 그리드 시스템에 맞는 다양한 미디어 쿼리 분기점에서 max-width 가 설정되어 있습니다. 
		                       **추후 수정
		                       --%>

		<!-- Marketing Icons Section -->
		<div class="row" id="IT_Solutions">
			<!-- Fluid row 1행 -->
			<div class="col-lg-12">
				<!-- 제목 부분 12개의 열 lg >=1200px  -->
				<!-- 소제목 lg >=1200px -->
				<h2 class="col-lg-9 col-md-9 col-sm-9 page-header">IT Solutions</h2>
				<h2 class="col-lg-3 col-md-3 col-sm-3 page-header">Notices &
					News</h2>
			</div>
			<div class="col-md-4 col-sm-4">
				<!--md >= 992 4/12 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0
						</h4>
					</div>
					<div class="panel-body">
						<p>In general parlance, bootstrapping usually refers to the
							starting of a self-sustaining process that is supposed to proceed
							without external input. In computer technology the term (usually
							shortened to booting) usually refers to the process of loading
							the basic software into the memory of a computer after power-on
							or general reset, especially the operating system which will then
							take care of loading other software as needed. The term appears
							to have originated in the early 19th century United States
							(particularly in the phrase "pull oneself over a fence by one's
							bootstraps"), to mean an absurdly impossible action, an adynaton.</p>
						<a href="CompanyItem/IT Solutions/IT Solutions.jsp"
							class="btn btn-info">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4">
				<!-- 8/12 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-gift"></i> Free &amp; Open Source
						</h4>
					</div>
					<div class="panel-body">
						<p>jQuery is a cross-platform JavaScript library designed to
							simplify the client-side scripting of HTML. Used by over 60% of
							the 10,000 most visited websites, jQuery is the most popular
							JavaScript library in use today. jQuery is free, open-source
							software licensed under the MIT License.</p>
						<a href="CompanyItem/IT Solutions/IT Solutions.jsp"
							class="btn btn-info">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4">
				<div class="bs-component">	
				<!-- 이클립스 해제 희망시 
				     1. http://ifone420.tistory.com/107
				     
				     추가적으로 
				     
				     localhost:8080/CWS 이부분은 server.xml 에서 지정한다.
				-->
					 <jsp:include page="/board/bnsFrontList.do"
						flush="false" /> 
						
					<%--notice/news 순으로 5개씩 삽입 예정
						    만약에 공간 및 제약시 추후 tab 형태 고려 
						  --%>
				</div>
			</div>
		</div>	
		<!-- /.row -->
		<%--밑에 350x150 적어도 한 줄은 높이 같도록 넓이는 상관없다 --%>
		<!-- Portfolio Section -->
		<div class="row" id="IT_Products">
			<!-- 2행 -->
			<div class="col-lg-12">
				<!-- 소제목 lg >=1200px -->
				<h2 class="page-header">IT Products</h2>
			</div>
			<%--1행 --%>
			<div class="col-md-4 col-sm-6">
				<!-- md >= 992 / sm >=768  2행에서 1-->
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_azure(h250).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_onedrive(h250).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_windows10(h250).png" alt="">
				</a>
				<p>Contents :</p>
			</div>

			<%--2행 --%>
			<div class="col-md-4 col-sm-6">
				<!-- md >= 992 / sm >=768  2행에서 1-->
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/AerVison.PNG" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/tucows.jpg" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_outlook(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div>

			<%--3행 --%>
			<div class="col-md-4 col-sm-6">
				<!-- 2행에서 2 -->
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_word(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_powerpoint(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_publisher(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row" id="WebSite Building">
			<!-- 3행 -->
			<div class="col-lg-12">
				<h2 class="page-header">Website Building</h2>
			</div>
			<div class="col-md-6">
				<p>The Modern Business template by Start Bootstrap includes:</p>
				<ul>
					<li><strong>Bootstrap v3.2.0</strong></li>
					<li>jQuery v1.11.0</li>
					<li>Font Awesome v4.1.0</li>
					<li>Working JSP contact form with validation</li>
					<li>Unstyled page elements for easy customization</li>
					<li>17 HTML pages</li>
				</ul>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Corporis, omnis doloremque non cum id reprehenderit, quisquam totam
					aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis
					quia dolorum ducimus unde.</p>
				<a class="btn btn-lg btn-default btn-block"
					href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite
					Building</a>
			</div>
			<!-- 580x357 -->
			<div class="col-md-6">
				<img class="img-responsive"
					src="/Company/zImage/Website-Builders4-300x182.jpg" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="well">
			<!-- Call to Action Section -->
			<div class="row" id="IT Consulting">
				<!-- 4행 -->
				<div class="col-md-8">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Molestias, expedita, saepe, vero rerum deleniti beatae veniam
						harum neque nemo praesentium cum alias asperiores commodi.</p>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-default btn-block"
						href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT
						Consulting</a>
				</div>
			</div>
		</div>

		<div class="well">
			<!-- Call to Action Section -->
			<div class="row" id="Digital Marketing">
				<!-- 4행 -->
				<div class="col-md-8">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Molestias, expedita, saepe, vero rerum deleniti beatae veniam
						harum neque nemo praesentium cum alias asperiores commodi.</p>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-default btn-block"
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital
						Marketing</a>
				</div>
			</div>
		</div>
		<hr>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>


	</div>
	<!-- /.container -->

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>

</body>

</html>