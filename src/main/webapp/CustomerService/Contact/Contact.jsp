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
					CustomerService <small> Contact</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CustomerService</li>
					<li class="active">Contact</li>
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
						<h2 class="page-header">Contact</h2>
					</div>
					<div class="col-lg-4 well text-center">
								<img
								src="http://m.c.lnkd.licdn.com/mpr/pub/image-0em6ZpPcOdZ5lNMcu6cP5vOTrPn4Gvnzr-mkepfGr4nX-Rp70emkiNscr_K_GnWmBylB/prasad-phule.jpg"
								name="aboutme" width="140" height="140" class="img-circle">
							<h3>CEO</h3>
							<em>click on me to see Image Manager</em>
					</div>
					<div class="col-lg-4 well text-center">
								<img
								src="http://m.c.lnkd.licdn.com/mpr/pub/image-0em6ZpPcOdZ5lNMcu6cP5vOTrPn4Gvnzr-mkepfGr4nX-Rp70emkiNscr_K_GnWmBylB/prasad-phule.jpg"
								name="aboutme" width="140" height="140" class="img-circle">
							<h3>CIO</h3>
							<em>click on me to see Image Manager</em>
					</div>
					<div class="col-lg-4 well text-center">
								<img
								src="http://m.c.lnkd.licdn.com/mpr/pub/image-0em6ZpPcOdZ5lNMcu6cP5vOTrPn4Gvnzr-mkepfGr4nX-Rp70emkiNscr_K_GnWmBylB/prasad-phule.jpg"
								name="aboutme" width="140" height="140" class="img-circle">
							<h3>CTO</h3>
							<em>click on me to see Image Manager</em>
					</div>
				</div>
				<!-- <div class="well well-sm">
						<form>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="name"> Name</label> <input type="text"
											class="form-control" id="name" placeholder="Enter name"
											required="required" />
									</div>
									<div class="form-group">
										<label for="email"> Email Address</label>
										<div class="input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-envelope"></span> </span> <input
												type="email" class="form-control" id="email"
												placeholder="Enter email" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="subject"> Subject</label> <select id="subject"
											name="subject" class="form-control" required="required">
											<option value="na" selected="">Choose One:</option>
											<option value="service">General Customer Service</option>
											<option value="suggestions">Suggestions</option>
											<option value="product">Product Support</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="name"> Message</label>
										<textarea name="message" id="message" class="form-control"
											rows="9" cols="25" required="required" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-md-12">
									<button type="submit" class="btn btn-primary pull-right"
										id="btnContactUs">Send Message</button>
								</div>
							</div>
						</form>
					</div> -->

				<!-- 	<div class="col-md-4">
							<form>
								<legend>
									<span class="glyphicon glyphicon-globe"></span> Our office
								</legend>
								<address>
									<strong>Twitter, Inc.</strong><br> 서울 광진 자양2동 607-20 GV4F
									<abbr title="Phone"> P:</abbr> +82-2-6214-7039
								</address>
								<address>
									<strong>Full Name</strong><br> <a href="mailto:#">first.last@example.com</a>
								</address>
							</form>
						</div> -->

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