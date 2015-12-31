<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 페이지 제외 페이지
 -->
<div class="row">
	<nav id="BackToTop" class="menu navbar navbar-fixed-top "
		role="navigation">
		<div class="container">
			<%-- Container를 nav 밖에 놓으면 전체 영역 / 안에놓으면 1170px --%>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header" >
			<%--border 칼라 테두리는 style=border || 안의 icon-bar로 구성 --%>
			
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1" style="border:2px solid white">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar" style="background-color:white;"></span> <span class="icon-bar" style="background-color:white;"></span> <span
						class="icon-bar" style="background-color:white;"></span>
				</button>
				<%-- 크기 줄었을 때 우측에 navbar 역할 --%>
				<a class="navbar-brand active logo_800_m" href="/"> <img
					src="/Images/CompanyLogos/CompanyLogo.gif"
					class="img-thumbnail img-responsive logo_800_h" alt="Responsive image">
					<!-- <font color="#E5E5E5">Mwav</font> --></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="mgt2 collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="mgl5 nav navbar-nav">
					<li><a href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp">IT
							Solutions</a></li>
					<li><a href="/CompanyItem/IT Products/Aervision/Aervision.jsp">IT
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
						<li><a href="/member/LogOut.do">LogOut</a></li>
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
<div class="enter"></div>


