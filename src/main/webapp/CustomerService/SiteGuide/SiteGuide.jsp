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
				<img src="/CustomerService/zImage/CustomerService_IN(height_280).jpg"
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
					CustomerService <small> SiteGuide</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CustomerService</li>
					<li class="active">SiteGuide</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CustomerService/MyPage/MyPage.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="마이페이지">MyPage</a> <a
						href="/CustomerService/Announcement/Announcement.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="공지사항">Announcement</a>
					<a href="/CustomerService/MemberShip/MemberShip.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회원정보(수정)">MemberShip</a>
					<a href="/CustomerService/Agreement/Agreement.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="이용약관">Agreement</a> <a
						href="/CustomerService/SiteGuide/SiteGuide.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="left" data-original-title="이용방법">SiteGuide</a> <a
						href="/CustomerService/FAQ/FAQ.jsp" class="list-group-item  "
						data-toggle="tooltip" data-placement="left"
						data-original-title="자주하는 질문">FAQ</a> <a
						href="/CustomerService/QnA/QnA.jsp" class="list-group-item "
						data-toggle="tooltip" data-placement="left"
						data-original-title="묻고 답하기">QnA</a> <a
						href="/CustomerService/Contact/Contact.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="담당자안내">Contact</a> <a
						href="/CustomerService/SiteMap/SiteMap.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="사이트맵">SiteMap</a>
				</div>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<span class="label label-primary">SiteGuide</span>

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