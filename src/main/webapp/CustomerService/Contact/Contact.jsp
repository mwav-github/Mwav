<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
<link href="/resources/JsFramework/Bootstrap/bootstrap-social.css"
	rel="stylesheet">
</head>
<%--http://bootsnipp.com/snippets/featured/responsive-team-profiles-with-social-links-free --%>
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
					Customer Service <small> Contacts</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>Customer Service</li>
					<li class="active">Contacts</li>
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
				<!-- <span class="label label-primary">Contact</span> 위에는 사진 형식으로 예정
 -->

				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header mwav_leftText">Contacts</h2>
					</div>
					
						<div class="col-xs-12 col-sm-4 col-md-4">
							<div class="well well-sm">
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2"></div>
									<div class="col-xs-10 col-sm-10 col-md-10">
										<h4>
											CEO (Lewis Kim) 
										</h4>
										<small><cite title="Seoul, KOREA">Seoul, KOREA
												<i class="glyphicon glyphicon-map-marker"> </i>
										</cite></small>
										<p>
											<i class="glyphicon glyphicon-envelope"></i>
											Lewis.Kim@mwav.net <br /> <i
												class="glyphicon glyphicon-gift"></i> June 02, 1975
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<div class="well well-sm">
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2"></div>
									<div class="col-xs-10 col-sm-10 col-md-10">
										<h4>
											CTO (James Lee) 
										</h4>
										<small><cite title="Seoul, KOREA">Seoul, KOREA
												<i class="glyphicon glyphicon-map-marker"> </i>
										</cite></small>
										<p>
											<i class="glyphicon glyphicon-envelope"></i>James.Lee@mwav.net
											<br /> <i class="glyphicon glyphicon-gift"></i> May 02, 1970
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<div class="well well-sm">
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2"></div>
									<div class="col-xs-10 col-sm-10 col-md-10">
										<h4>
											CMO (Alex Chae) 
										</h4>
										<small><cite title="Seoul, KOREA">Seoul, KOREA
												<i class="glyphicon glyphicon-map-marker"> </i>
										</cite></small>
										<p>
											<i class="glyphicon glyphicon-envelope"></i>
											Alex.Chae@mwav.net <br /> <i
												class="glyphicon glyphicon-gift"></i> June 02, 1975
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<div class="well well-sm">
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2"></div>
									<div class="col-xs-10 col-sm-10 col-md-10">
										<h4>
											CTO (Evan Martin) 
										</h4>
										<small><cite title="Seoul, KOREA">Seoul, KOREA
												<i class="glyphicon glyphicon-map-marker"> </i>
										</cite></small>
										<p>
											<i class="glyphicon glyphicon-envelope"></i>
											Evan.Martin@mwav.net <br /> <i
												class="glyphicon glyphicon-gift"></i> June 01, 1970
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<div class="well well-sm">
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2"></div>
									<div class="col-xs-10 col-sm-10 col-md-10">
										<h4>
											CIO (Peter J) 
										</h4>
										<small><cite title="Seoul, KOREA">Seoul, KOREA
												<i class="glyphicon glyphicon-map-marker"> </i>
										</cite></small>
										<p>
											<i class="glyphicon glyphicon-envelope"></i>
											PeterJ.Cho@mwav.net <br /> <i
												class="glyphicon glyphicon-gift"></i> January 07, 1971
										</p>
									</div>
								</div>
							</div>
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