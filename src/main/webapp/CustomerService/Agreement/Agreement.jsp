<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Page Heading/Breadcrumbs -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Customer Service <small> Agreement</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>Customer Service</li>
			<li class="active">Agreement</li>
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
		<div class="enter"></div>
		<div class="row">
			<ul class="nav nav-pills nav-justified">
				<li role="presentation" class="active"><a data-toggle="tab"
					href="#terms1">이메일 주소 무단 수집거부</a></li>
				<li role="presentation"><a data-toggle="tab" href="#terms2">청소년보호정책</a></li>
				<li role="presentation"><a data-toggle="tab" href="#terms3">개인정보취급방침</a></li>
				<li role="presentation"><a data-toggle="tab" href="#terms4">이용자
						약관</a></li>
			</ul>

			<div class="enter"></div>


			<div class="tab-content col-md-offset-1 col-md-10">
				<div class="tab-pane fade active in" id="terms1">
					<jsp:include page="/CustomerService/Policy/_EmailExtract.jsp"
						flush="false" />
				</div>
				<div class="tab-pane fade" id="terms2">

					<jsp:include page="/CustomerService/Policy/_Juvenile.jsp"
						flush="false" />
				</div>
				<div class="tab-pane fade" id="terms3">
					<jsp:include page="/CustomerService/Policy/_PrivateInfo.jsp"
						flush="false" />
				</div>
				<div class="tab-pane fade" id="terms4">
					<jsp:include page="/CustomerService/Policy/_mwav_policy.jsp"
						flush="false" />
				</div>
			</div>
		</div>

	</div>
</div>
