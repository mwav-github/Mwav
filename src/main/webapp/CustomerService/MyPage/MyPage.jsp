<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Heading/Breadcrumbs -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Customer Service <small> MyPage</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>Customer Service</li>
			<li class="active">My Page</li>
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

		<div class="col-lg-12">
			<h2 class="page-header">My Page</h2>
		</div>
		<%--마이페이지란 말그대로 이것저것 다 담긴거. --%>
		<jsp:include page="/member/mbrView.mwav" flush="false" />

	</div>
</div>
<!-- /.row -->
