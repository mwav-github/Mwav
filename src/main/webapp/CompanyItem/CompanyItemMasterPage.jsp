<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->


<script>
	$(function() {
		
		var pgurl = window.location.pathname;
		//alert(pgurl);

		$("#left_menu a").each(function() {
			//alert($(this).attr("href"));
			//alert($(this).attr(''));
			if ($(this).attr("href") == pgurl || $(this).attr("href") == '' || )
				$(this).addClass("active");
		})
	});
</script>
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand active" href="/">Mwav</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/CompanyItem/ITSolutions/ITSolutions.jsp">IT
									Solutions</a></li>
							<li><a href="/CompanyItem/ITProducts/ITProducts.jsp">IT
									Products</a></li>
							<li><a
								href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.jsp">WebSite
									Building</a></li>
							<li><a
								href="/CompanyItem/DigitalMarketing/DigitalMarketing.jsp">Digital
									Marketing</a></li>
							<li><a href="/CompanyItem/ITConsulting/ITConsulting.jsp">IT
									Consulting</a></li>
							<c:if test="${sessionScope.mbrLoginId ne null }">
								<li><a href="/member/MbrView.do"><font color="#9d9d9d">${mbrLoginId}님
											반갑습니다.</font></a></li>
								<li><a href="/member/Logout.do"><font color="#9d9d9d">로그아웃</font></a></li>
							</c:if>
							<c:if test="${sessionScope.mbrLoginId eq null }">
								<li><a href="/MasterPage.jsp?mode=SMbrLogin"><i
										class="fa fa-user fa-lg"></i></a></li>
								<li><a href="/MasterPage_1.jsp?mode=Default"><i
										class="fa fa-user-plus fa-lg"></i></a></li>
							</c:if>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container -->
			</nav>
		</div>
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
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
					<li>CompanyItem</li>
					<li class="active">MyPage</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/Company/Introduction/Introduction.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="회사소개">Introduction</a>
					<a href="/Company/Greetings/Greetings.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="top"
						data-original-title="대표인사말">Greetings</a> <a
						href="/Company/History/History.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="right"
						data-original-title="회사연혁">History</a> <a
						href="/Company/BusinessField/BusinessFields.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="bottom" data-original-title="사업분야">BusinessField</a>
					<a href="/Company/ActualResults/ActualResults.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회사실적">ActualResults</a>
					<a href="/Company/ThePress/ThePress.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="right"
						data-original-title="언론보도">ThePress</a> <a
						href="/Company/HR-Affairs/HR-Affairs.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="인재채용">HR-Affairs</a> <a
						href="/Company/LocationMap/LocationMap.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="right" data-original-title="회사약도">LocationMap</a>
					<a href="/Company/Profitsharing/Profitsharing.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="right" data-original-title="수익분배 프로그램">Profitsharing</a>
						<a href="/Company/Profitsharing/Profitsharing.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="right" data-original-title="공지사항">Notice</a>
				</div>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">MyPage</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">


					<!--/////////////////////////////////////////////////// -->
					<jsp:include page="/CommonApps/Member/MbrView.jsp" flush="false" />
					<!--/////////////////////////////////////////////////// -->
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