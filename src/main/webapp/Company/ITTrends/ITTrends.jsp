<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단에 이부분안해주면 다른 페이지에서 인코딩 깨진다.  --%>
<%--(1) --%>
				<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Company <small> IT Trends</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company</li>
					<li class="active">IT Trends</li>
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
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">IT Trends</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<jsp:include page="/board/bnsList.mwav" flush="false" />

				</div>

				<!-- Pagination -->

			</div>
		</div>