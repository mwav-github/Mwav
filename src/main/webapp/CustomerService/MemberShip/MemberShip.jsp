<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Page Heading/Breadcrumbs -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Customer Service <small> Member Ship</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>Customer Service</li>
			<li class="active">Member Ship</li>
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
		<!-- 소제목 -->
		<div class="col-lg-12">
			<h2 class="page-header mwav_leftText">Member Ship</h2>
		</div>
		<!-- ----- -->

		<!-- Content Column -->
		<div class="col-lg-12">
			<jsp:include page="/member/mbrView.mwav" flush="false" />
		</div>

		<!-- Pagination -->

	</div>
</div>
<!-- /.row -->
