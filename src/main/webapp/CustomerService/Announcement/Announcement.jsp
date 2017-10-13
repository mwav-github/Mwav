<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Heading/Breadcrumbs -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Customer Service <small> Announcement</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>Customer Service</li>
			<li class="active">Announcement</li>
		</ol>
	</div>
</div>
<!-- /.row -->

<!-- Content Row -->
<div class="row">
	<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
	<div class="col-md-3">
		<div class="list-group">
			<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
				flush="false" />
		</div>
	</div>
	<!-- 끝 -->

	<div class="col-md-9">
		<!-- 소제목 -->
		<div class="col-lg-12">
			<h2 class="page-header mwav_leftText">Announcement</h2>
		</div>
		<!-- ----- -->

		<!-- Content Column -->
		<div class="col-lg-12">

			<jsp:include page="/board/buList.mwav" flush="false" />

		</div>

	</div>
</div>
<!-- /.row -->
