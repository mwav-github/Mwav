<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 페이지에서만 타겟팅 나머지는 URL 물고가기
이놈이 슬라이드쇼 없는 놈 그러나 아직 반영 x 각 페이지별로 따로 있다.
 -->
<div class="row">
	<nav id="BackToTop" class="menu navbar navbar-fixed-top "
		role="navigation">
		<div class="container">
			<%-- Container를 nav 밖에 놓으면 전체 영역 / 안에놓으면 1170px --%>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<%-- 크기 줄었을 때 우측에 navbar 역할 --%>
				<a class="navbar-brand active logo_800" href="/"> <img
					src="/Images/CompanyLogos/CompanyLogo.gif"
					class="img-thumbnail img-responsive" alt="Responsive image">
					<!-- <font color="#E5E5E5">Mwav</font> --></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="mgt2 collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="mgl5 nav navbar-nav">
					<li><a href="/CompanyItem/IT Solutions/IT Solutions.jsp">IT
							Solutions</a></li>
					<li><a
						href="/CompanyItem/IT Solutions/Aervision/Aervision.jsp">IT
							Products</a></li>
					<li><a
						href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite
							Building</a></li>
					<li><a
						href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital
							Marketing</a></li>
					<li><a href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT
							Consulting</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.mbrLoginId ne null }">
						<li><a
							href="/CustomerService/CS-MasterPage.jsp?mode=SDMyPage"
							data-toggle="tooltip" data-placement="bottom"
							data-original-title="${mbrLoginId}님
								반갑습니다."> MyPage</a></li>
						<li><a href="/member/Logout.do">LogOut</a></li>
					</c:if>
					<c:if test="${sessionScope.mbrLoginId eq null }">
						<li><a href="/MasterPage.jsp?mode=SMbrLogin"><i
								class="fa fa-user fa-lg"></i></a></li>
						<li><a href="/MasterPage_1.jsp?mode=Default"><i
								class="fa fa-user-plus fa-lg"></i></a></li>
					</c:if>
				</ul>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</div>


<!--  //////////////////////////////////// -->

<%-- Header Carousel (슬라이드 쇼 부분- 헤더 포함 가능성있음.) 
     클래스명에 container 추가시 조정가능하나 더 이상한듯 ~!! 조정 요망
     
     중간으로 보내기 위해서 container 추가 (left 메뉴 안의 페이지와 크기 동일) // => 다시 빼고 영역 조절
--%>
<header id="myCarousel" class="mgt1_8 carousel slide"
	style="height: 65% !important;">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides 슬라이드쇼 내용 -->
	<div class="carousel-inner">
		<div class="item active">
			<div class="fill"
				style="background-image: url('/Company/zImage/Company_Main(height_300).jpg');"></div>
			<div class="carousel-caption" style="color:#BCE8F1;">
			<!-- 	<h2>Company</h2>
			 -->	<a href="/Company/Introduction/Introduction.jsp" class="btn btn-info btn-lg">Learn More</a>
			</div>
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/CompanyItem/zImage/CompanyItem_Main(height_300).jpg');"></div>
			<div class="carousel-caption" style="color:#BCE8F1;">
				<!-- <h2>Company Item</h2> -->
				<a href="/CompanyItem/IT%20Solutions/Aervision/Aervision.jsp" class="btn btn-info btn-lg">Learn More</a>
			</div>
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/CustomerService/zImage/CustomerService_Main(height_300).jpg');"></div>
			<div class="carousel-caption" style="color:#BCE8F1;">
				<!-- <h2>Customer Service</h2> -->
				<a href="#" class="btn btn-info btn-lg">Learn More</a>
			</div>
		</div>
	</div>

	<%-- Controls (왼, 오른쪽 화살표 버튼)--%>

	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</header>

<%--  
이미지 태그 사용시 
단 background 와 다르게 height 에 대해서 그대로 잡아버린다. 
<div class="container">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          <img src="/Company/zImage/CompanyInfo_2(width1000).jpg" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
        <div class="item">
          <img src="/CompanyItem/zImage/CompanyItem_Main(height_300).jpg" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
        <div class="item">
          <img src="/CustomerService/zImage/CustomerService_Main(height_300).jpg" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>

  </div>

--%>