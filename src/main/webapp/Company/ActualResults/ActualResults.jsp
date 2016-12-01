<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단에 이부분안해주면 다른 페이지에서 인코딩 깨진다.  --%>
<!-- Page Heading/Breadcrumbs  SPA방식으로 추후변경 -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Company<small> ActualResults</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li>Company</li>
			<li class="active">ActualResults</li>
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
		<!-- Content Column -->

		<!-- Gallery - START -->

		<div class="row">
			<div class="text-center">
				<h1>Sample Image Gallery</h1>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h9.jpg" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h8.jpg" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h4.jpg" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h7.jpg" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h3.jpg" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h6.jpg" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h1.jpg" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h2.jpg" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="well">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="http://www.prepbootstrap.com/Content/images/shared/houses/h5.jpg" />
					</div>
				</div>
			</div>
		</div>
		<!-- Gallery - END -->

	</div>
</div>