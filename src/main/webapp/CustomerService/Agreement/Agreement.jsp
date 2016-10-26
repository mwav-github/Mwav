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
						<li role="presentation"><a data-toggle="tab" href="#terms4">Mwav
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
					</div>
				</div>

			</div>
		</div>
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