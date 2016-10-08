<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="decorator" 
            uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib  prefix="page"
            uri="http://www.opensymphony.com/sitemesh/page" %>

<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<page:applyDecorator name="headerImport" />
<!-- /////////// -->
<title><decorator:title default="comapanyTemplate" /></title>
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<!--  //////////////////////////////////// -->
		<page:applyDecorator name="headerMaster" />
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
					Company <small> ThePress</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company</li>
					<li class="active">ThePress</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
			<page:applyDecorator name="companyLeft" />
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<decorator:body></decorator:body>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<page:applyDecorator name="footer" />
		<!--/////////////////////////////////////////////////// -->
	</footer>

</body>

</html>