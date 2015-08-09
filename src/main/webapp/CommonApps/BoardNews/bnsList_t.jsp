<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="../../PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>
	<!-- FrontHeader -->
	<!--  //////////////////////////////////// -->
	<jsp:include page="../../PartsOfContent/SiteHeader/FrontHeader.jsp"
		flush="false" />
	<!--  //////////////////////////////////// -->


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Sidebar Page <small>Subheading</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">ThePress</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CWS/WebRoot/Company/Introduction/Introduction.jsp" class="list-group-item ">회사소개</a> <a href="/CWS/WebRoot/Company/History/History.jsp"
						class="list-group-item">회사연혁</a> <a href="#"
						class="list-group-item">사업분야</a> <a href="/CWS/WebRoot/Company/ActualResults/ActualResults.jsp"
						class="list-group-item ">회사실적</a> <a href="/CWS/WebRoot/Company/ThePress/ThePress.jsp"
						class="list-group-item active">언론보도</a> <a href="#"
						class="list-group-item">채용정보</a> <a href="/CWS/WebRoot/Company/LocationMap/LocationMap.jsp"
						class="list-group-item ">회사약도</a> <a href="#"
						class="list-group-item">Partners & Reseller</a>
				</div>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">언론 보도</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>공지번호</th>
								<th>분류</th>
								<th>기록일</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>정렬</th>
								<th>관리메뉴</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>101</td>
								<td><a
									href="/Company_Introduction_Bootstrap/Sub_Page/COMPANY INFO/Media_Report_Content_List.jsp">Lorem</a></td>
								<td>ipsum</td>
								<td>dolor</td>
								<td>dolor</td>
								<td>dolor</td>
								<td>dolor</td>
							</tr>
							<tr>
								<td>102</td>
								<td>amet</td>
								<td>consectetur</td>
								<td>adipiscing</td>
								<td>dolor</td>
								<td>dolor</td>
								<td>dolor</td>
							</tr>
							<tr>
								<td>103</td>
								<td>Integer</td>
								<td>nec</td>
								<td>odio</td>
								<td>dolor</td>
								<td>dolor</td>
								<td>dolor</td>
							</tr>
							<tr>
								<td>104</td>
								<td>dapibus</td>
								<td>diam</td>
								<td>Sed</td>
								<td>dolor</td>
								<td>dolor</td>
								<td>dolor</td>
							</tr>
							<tr>
								<td>105</td>
								<td>Nulla</td>
								<td>quis</td>
								<td>sem</td>
								<td>dolor</td>
								<td>dolor</td>
								<td>dolor</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Pagination -->
				<div class="row text-center">
					<div class="col-lg-12">
						<ul class="pagination">
							<li><a href="">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="../../PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>


	</div>
	<!-- /.container -->

</body>

</html>