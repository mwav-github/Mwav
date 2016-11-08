<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<img
					src="/CustomerService/zImage/CustomerService_IN(height_280).jpg"
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
					Customer Service <small> SiteMap</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Customer Service</li>
					<li class="active">SiteMap</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<div class="row">
					<!-- <div class="col-lg-12">
						<h2 class="page-header">SiteMap</h2>
					</div>
 -->
					<div class="col-xs-12 col-md-4 col-sm-4 ">
						<h3>
							<strong>Company</strong>
						</h3>
						<h5>All information and story about Mwav.</h5>
						<br>
						<ul class="font_color_faq_basic  ">
							<li><strong><a href="/Company/Introduction/Introduction.jsp">Introduction</a></strong></li>
							<li><strong><a href="/Company/Greetings/Greetings.jsp">Greetings</a></strong></li>
							<li><strong><a href="/Company/History/History.jsp">History</a></strong></li>
							<li><strong><a href="/Company/BusinessField/BusinessFields.jsp">Business
									Field</a></strong></li>
							<li><strong><a href="/Company/ActualResults/ActualResults.jsp">Actual
									Results</a></strong></li>
							<li><strong><a href="/board/bnsList.do">The Press</a></strong></li>
							<li><strong><a href="/Company/HR-Affairs/HR-Affairs.jsp">HR-Affairs</a></strong></li>
							<li><strong><a href="/Company/LocationMap/LocationMap.jsp">Location
									Map</a></strong></li>
							<li><strong><a href="/Company/Profitsharing/Profitsharing.jsp">Profit
									Sharing</a></strong></li>
						</ul>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 ">
						<h3>
							<strong>Company Item</strong>
						</h3>
						<h5>All CompanyItem about Mwav.</h5>
						<br>
						<ul class="font_color_faq_basic  ">
							<li><a href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp">IT
									Solutions</a></li>
							<li><a
								href="/CompanyItem/IT Products/Aervision/Aervision.jsp">IT
									Products</a></li>
							<li><a
								href="/CompanyItem/WebSite Building/WebSite Building.jsp">Wesite
									Building</a></li>
							<li><a
								href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital
									Marketing</a></li>
							<li><a href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT
									Consulting</a></li>
						</ul>
					</div>

					<div class="col-xs-12 col-sm-4 col-md-4 ">
						<h3>
							<strong>Cusmter Service</strong>
						</h3>
						<h5>Customer Serice about Mwav.</h5>
						<br>
						<ul class="font_color_faq_basic  ">
							<c:if test="${sessionScope.mbrLoginId eq null }">
								<li><a
									href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');">My Page</a></li>
							</c:if>

							<c:if test="${sessionScope.mbrLoginId ne null }">
								<li><a href="/CustomerService/MyPage/MyPage.jsp">My Page</a></li>
							</c:if>

							<li><a href="/CustomerService/Announcement/Announcement.jsp">Announcement</a></li>

							<c:if test="${sessionScope.mbrLoginId eq null }">
								<li><a
									href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');">MemberShip</a></li>
							</c:if>
							<c:if test="${sessionScope.mbrLoginId ne null }">
								<a href="/CustomerService/MemberShip/MemberShip.jsp">MemberShip</a>
							</c:if>

							<li><a href="/Company/History/History.jsp">History</a></li>

							<li><a href="/CustomerService/FAQ/FAQ.jsp">FAQ</a></li>
							<li><a href="/CustomerService/QnA/QnA.jsp">Q&A</a></li>
							<li><a href="/CustomerService/Contact/Contact.jsp">Contact</a></li>
							<li><a href="/CustomerService/SiteMap/SiteMap.jsp">Site
									Map</a></li>
						</ul>
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