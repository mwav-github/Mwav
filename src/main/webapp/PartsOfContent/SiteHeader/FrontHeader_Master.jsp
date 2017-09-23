<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 메인 페이지 제외 페이지
 --%>

<%--navbar-fixed-top 은 위에 떠있는것으로서 영역이분리되어 잡히지 않는다.
 narbar-static-top으로 해야잡히며, 이때는 fullwidth가 되지않아 수정 필요.
 
 자동으로 영역잡아주는 부분에 대한 고민 필요 --%>
<div class="row">
	<nav id="BackToTop" class="menu navbar navbar-full navbar-fixed-top"
		role="navigation">
		<div class="container">
			<%-- Container를 nav 밖에 놓으면 전체 영역 / 안에놓으면 1170px --%>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<%--border 칼라 테두리는 style=border || 안의 icon-bar로 구성 --%>

				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					style="border: 2px solid white">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar" style="background-color: white;"></span> <span
						class="icon-bar" style="background-color: white;"></span> <span
						class="icon-bar" style="background-color: white;"></span>
				</button>
				<%-- 크기 줄었을 때 우측에 navbar 역할 --%>
				<a class="navbar-brand active logo_800_m" href="/"> <img
					src="/Images/CompanyLogos/CompanyLogo.gif"
					class="img-thumbnail img-responsive logo_800_h"
					alt="CompanyLogo"> <!-- <font color="#E5E5E5">Mwav</font> --></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="mgt3_5 collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="mgl3 nav navbar-nav">
					<li><a href="/CompanyItem/ITSolutions/OrgChart/OrgChart.mwav"
						onclick="ga('send', 'event', 'GNB', 'click', 'ITSolutions');"><h4>IT
								Solutions</h4></a></li>
					<li><a href="/CompanyItem/ITProducts/Aervision/Aervision.mwav"
						onclick="ga('send', 'event', 'GNB', 'click', 'ITProducts');"><h4>IT
								Products</h4></a></li>
					<li><a
						href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"
						onclick="ga('send', 'event', 'GNB', 'click', 'WebsiteBuilding');"><h4>WebSite
								Building</h4></a></li>
					<li><a
						href="/CompanyItem/DigitalMarketing/DigitalMarketing.mwav"
						onclick="ga('send', 'event', 'GNB', 'click', 'DigitalMarketing');"><h4>Digital
								Marketing</h4></a></li>
					<li><a href="/CompanyItem/ITConsulting/ITConsulting.mwav"
						onclick="ga('send', 'event', 'GNB', 'click', 'ITConsulting');"><h4>IT
								Consulting</h4></a></li>
				</ul>
				<ul class="mgl3 nav navbar-nav navbar-right">
					<!-- 일반로그인 부분 -->
					<c:if test="${sessionScope.member ne null }">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" data-toggle="tooltip"
							data-placement="bottom"
							data-original-title="${member.mbrLoginId}님
								반갑습니다."><i
								class="fa fa-user fa-lg"></i> My Mwav</a>

							<ul class="dropdown-menu dropdown-menu_change">
								<li><a
									href="/CustomerService/CS-MasterPage.mwav?mode=SDMyPage"
									style="color: #428bca;"><h5>
											My Account <span class="glyphicon glyphicon-cog pull-right"></span>
										</h5></a></li>
								<li class=""></li>
								<!-- <li><a href="#">User stats <span
									class="glyphicon glyphicon-stats pull-right"></span></a></li> -->
								<li class=""></li>
								<%--QA 답변 달린 것에 대한 확인. --%>
								<li><a href="/qa/qaList.mwav" style="color: #428bca;"><h5>
											Messages <span class="badge pull-right"></span>
										</h5></a></li>

								<!-- <li><a href="#">Favourites Snippets <span
									class="glyphicon glyphicon-heart pull-right"></span></a></li> -->
								<li class="divider"></li>
								<li><a href="/member/LogOut.mwav" style="color: #428bca;"><h5>
											Sign Out <span class="glyphicon glyphicon-log-out pull-right"></span>
										</h5></a></li>
							</ul></li>

						<!-- <li><h5>
							<a href="/member/LogOut.mwav">LogOut</a>
						</h5></li> -->
					</c:if>
					<c:if test="${sessionScope.member eq null }">
						<li><a href="/login/post"><i class="fa fa-user fa-lg"></i></a></li>
						<li><a href="/MasterPage_1.mwav?mode=Default"><i
								class="fa fa-user-plus fa-lg"></i></a></li>
					</c:if>

				</ul>
				<%-- <ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.mbrLoginId ne null }">
						<li><a
							href="/CustomerService/CS-MasterPage.jsp?mode=SDMyPage"
							data-toggle="tooltip" data-placement="bottom"
							data-original-title="${mbrLoginId}님
								반갑습니다."><h5> MyPage</h5></a></li>
						<li><a href="/member/LogOut.mwav"><h5>LogOut</h5></a></li>
					</c:if>
					<c:if test="${sessionScope.mbrLoginId eq null }">
						<li><a href="/login.mwav"><i class="fa fa-user fa-lg"></i></a></li>
						<li><a href="/MasterPage_1.jsp?mode=Default"><i
								class="fa fa-user-plus fa-lg"></i></a></li>
					</c:if>
				</ul> --%>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.navbar-collapse -->
	</nav>

</div>

