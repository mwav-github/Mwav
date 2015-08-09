<!-- SPA 방식 전까지는 LEFT, HEAD 부분은 강제 삽입 FOOTER는 동일하므로 상관이 없다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%--구조 1번 
    
      상단의 Include 할 CSS,JS 등 --%>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>

	<%-- 구조 2

     상단읜 메인메뉴 및 슬라이드 쇼 부분
 --%>
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
							<li><a href="/CompanyItem/IT Solutions/IT Solutions.jsp">IT
									Solutions</a></li>
							<li><a href="/CompanyItem/IT Products/IT Products.jsp">IT
									Products</a></li>
							<li><a href="#WebSite Building">WebSite Building</a></li>
							<li><a href="#Digital Marketing">Digital Marketing</a></li>
							<li><a href="#IT Consulting">IT Consulting</a></li>
							<li><a href="/CommonApps/Member/MbrLogin.jsp"><i
									class="fa fa-user fa-lg"></i></a></li>
							<li><a href="/CommonApps/Member/MbrInput.jsp"><i
									class="fa fa-user-plus fa-lg"></i></a></li>
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
				<img src="/Company/zImage/CustomerService_IN(height_280).jpg"
					class="img-responsive res_width" alt="Responsive image">
			</div>
		</div>
	</div>
	<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
**추가적으로 img-responsive에는 width:100%가 없어서 현재 이미지 크기를 그대로 가져온다 !!
해당 영역이 이미지보다 크면 이미지가 이미지 크기만큼만 나온다.!!
뭐 영역보다 크면 상관없겠지만
=>
그래서 res_width 추가
높이 수정은 container, row, col-lg 에는 안된다. 이미지자체 크기라

높이 강제 300px 과 같은 고정은 줄어들 때 반영이 안되기 때문에 아래 들어가는 그림은 최초시 300px 로 조정한다.
-->

	<!--  //////////////////////////////////// 
	Header 끝
	-->


	<%-- 
    
      실제 내용 부분 LEFT , BODY 부분

 --%>

	<!-- Page Content -->
	<div class="container">

		<%--
     구조 4 
     네비게이션 바
     
     제목 및 소재목 
     그리고 네비게이션 바 

 --%>
		<!-- Page Heading/Breadcrumbs  SPA방식으로 추후변경
		     네비게이션 바 ~!!! HOME만 링크있고 HOME/COMPANY COMPANY 은 없다 .
		 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					CustomerService <small> CustomerService</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CustomerService</li>
					<li class="active">CustomerService</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<%-- 
		구조 5
		
		  LEFT 메뉴 현재는 크기 3부분 
		  
		 --%>
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CustomerService/MyPage/MyPage.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="left" data-original-title="마이페이지">MyPage</a> <a
						href="/CustomerService/Announcement/Announcement.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="공지사항">Announcement</a>
					<a href="/CustomerService/MemberShip/MemberShip.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="회원정보(수정)">MemberShip</a>
					<a href="/CustomerService/Agreement/Agreement.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="이용약관">Agreement</a> <a
						href="/CustomerService/SiteGuide/SiteGuide.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="이용방법">SiteGuide</a> <a
						href="/CustomerService/FAQ/FAQ.jsp" class="list-group-item active"
						data-toggle="tooltip" data-placement="left"
						data-original-title="자주하는 질문">FAQ</a> <a
						href="/CustomerService/QnA/QnA.jsp" class="list-group-item"
						data-toggle="tooltip" data-placement="left"
						data-original-title="묻고 답하기">QnA</a> <a
						href="/CustomerService/Contact/Contact.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="담당자안내">Contact</a> <a
						href="/CustomerService/SiteMap/SiteMap.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="left" data-original-title="사이트맵">SiteMap</a>
				</div>
			</div>
			<!-- 끝 -->


			<%-- 
		구조 6
		
		  실제 BODY 부분
		  SPA 방식시 실제 각 페이지에 이 내용들만 있고 나머지는
		  MASTER 페이지에 남아있는다. 
		  
		 --%>

			<div class="col-md-9"></div>
		</div>

		<hr>

		<%--
		구조 7
		
		사이트에서 Footer 하단 부분을 의미한다. 
		
		 --%>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>


	</div>
	<!-- /.container -->
</body>

</html>