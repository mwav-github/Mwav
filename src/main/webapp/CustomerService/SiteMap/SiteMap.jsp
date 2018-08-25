<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<li><strong><a
							href="/Company/Introduction/Introduction.mwav">Introduction</a></strong></li>
					<li><strong><a
							href="/Company/Greetings/Greetings.mwav">Greetings</a></strong></li>
					<li><strong><a href="#">History</a></strong></li>
					<li><strong><a
							href="/Company/BusinessField/BusinessFields.mwav">Business
								Field</a></strong></li>
					<li><strong><a href="#">Actual Results</a></strong></li>
					<li><strong><a href="/board/bnsList.mwav">The
								Press</a></strong></li>
					<li><strong><a href="#">HR-Affairs</a></strong></li>
					<li><strong><a
							href="/Company/LocationMap/LocationMap.mwav">Location Map</a></strong></li>
					<li><strong><a href="#">Profit Sharing</a></strong></li>
				</ul>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4 ">
				<h3>
					<strong>Company Item</strong>
				</h3>
				<h5>All CompanyItem about Mwav.</h5>
				<br>
				<ul class="font_color_faq_basic  ">
					<li><a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.mwav">IT
							Solutions</a></li>
					<li><a href="/CompanyItem/ITProducts/Aervision/Aervision.mwav">IT
							Products</a></li>
					<li><a
						href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav">Wesite
							Building</a></li>
					<li><a
						href="/CompanyItem/DigitalMarketing/DigitalMarketing_eng.mwav">Digital
							Marketing</a></li>
					<li><a href="/CompanyItem/ITConsulting/ITConsulting.mwav">IT
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
							href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');">My
								Page</a></li>
					</c:if>

					<c:if test="${sessionScope.mbrLoginId ne null }">
						<li><a href="/CustomerService/MyPage/MyPage.mwav">My Page</a></li>
					</c:if>

					<li><a href="/CustomerService/Announcement/Announcement.mwav">Announcement</a></li>

					<%-- <c:if test="${sessionScope.mbrLoginId eq null }">
								<li><a
									href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');">MemberShip</a></li>
							</c:if>
							<c:if test="${sessionScope.mbrLoginId ne null }"> </c:if>--%>
					<li><a href="/CustomerService/MemberShip/MemberShip.mwav">MemberShip</a>
					</li>
					<li><a href="#">History</a></li>

					<li><a href="/CustomerService/FAQ/FAQ.mwav">FAQ</a></li>
					<li><a href="/CustomerService/QnA/QnA.mwav">Q&A</a></li>
					<li><a href="/CustomerService/Contact/Contact.mwav">Contacts</a></li>
					<li><a href="/CustomerService/SiteMap/SiteMap.mwav">Site
							Map</a></li>
				</ul>
			</div>

		</div>
	</div>

</div>
<!-- /.row -->
