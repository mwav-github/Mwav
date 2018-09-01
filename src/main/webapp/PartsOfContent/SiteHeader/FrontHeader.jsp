<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 메인 페이지에서만 타겟팅 나머지는 URL 물고가기
이놈이 슬라이드쇼 없는 놈 그러나 아직 반영 x 각 페이지별로 따로 있다.
 --%>
<!-- Script to Activate the Carousel -->
<script>
	$('.carousel').carousel({
		interval : 10000
	//changes the speed
	});
</script>


<nav id="BackToTop" class="menu navbar navbar-fixed-top"
	role="navigation">
	<div class="container">
		<%-- Container를 nav 밖에 놓으면 전체 영역 / 안에놓으면 1170px --%>
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<%--border 칼라 테두리는 style=border || 안의 icon-bar로 구성 --%>
			<%--768px 이하부터 변형 --%>
			<%--navbar-collapse 이게 부트스트랩꺼를 무조권 !important 인식 변경하려면
    cdn 말고 직접해서 아래 사이트와 같이 변경
    http://www.bootply.com/120951
 --%>
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
				class="img-thumbnail img-responsive logo_800_h" alt="CompanyLogo">
				<!-- <font color="#E5E5E5">Mwav</font> --></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse "
			id="bs-example-navbar-collapse-1">
			<ul class="mgt1 mgl3 nav navbar-nav lead ">
				<!-- <li class="dropdown mega-dropdown hidden-xs hidden-sm"><h4 class="nav_fontsize"><a
					href="#" class="dropdown-toggle backgroud_transparent"
					data-toggle="dropdown"><i class="fa fa-align-justify"></i> 
							<strong>Categories</strong>
						</a></h4>
					<ul class="dropdown-menu mega-dropdown-menu">
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header_type2">Features</li>
								<li><a href="#">Auto Carousel</a></li>
								<li><a href="#">Carousel Control</a></li>
								<li><a href="#">Left & Right Navigation</a></li>
								<li><a href="#">Four Columns Grid</a></li>
								<li class="divider"></li>
								<li class="dropdown-header_type2">Fonts</li>
								<li><a href="#">Glyphicon</a></li>
								<li><a href="#">Google Fonts</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header_type2">Plus</li>
								<li><a href="#">Navbar Inverse</a></li>
								<li><a href="#">Pull Right Elements</a></li>
								<li><a href="#">Coloured Headers</a></li>
								<li><a href="#">Primary Buttons & Default</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header_type2">Accessories</li>
								<li><a href="#">Default Navbar</a></li>
								<li><a href="#">Lovely Fonts</a></li>
								<li><a href="#">Responsive Dropdown </a></li>
								<li class="divider"></li>
								<li class="dropdown-header_type2">Newsletter</li>
								<form class="form" role="form">
									<div class="form-group">
										<label class="sr-only" for="email">Email address</label> <input
											type="email" class="form-control" id="email"
											placeholder="Enter email">
									</div>
									<button type="submit" class="btn btn-primary btn-block">Sign
										in</button>
								</form>
								<br>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header_type2">Collection</li>
								<div id="carousel-example-generic" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example-generic" data-slide-to="1"
											class=""></li>
										<li data-target="#carousel-example-generic" data-slide-to="2"
											class=""></li>
									</ol>
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="/Shop/zImages/promotion_1.jpg">
										</div>
										<div class="item">
											<img
												data-src="holder.js/900x500/auto/#666:#444/text:Second slide"
												alt="Second slide [900x500]"
												src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDkwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzY2NiIvPjxnPjx0ZXh0IHg9IjI3Ny4yODkwNjI1IiB5PSIyNTAiIHN0eWxlPSJmaWxsOiM0NDQ7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NDJwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj5TZWNvbmQgc2xpZGU8L3RleHQ+PC9nPjwvc3ZnPg=="
												data-holder-rendered="true">
										</div>
										<div class="item">
											<img
												data-src="holder.js/900x500/auto/#555:#333/text:Third slide"
												alt="Third slide [900x500]"
												src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDkwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzU1NSIvPjxnPjx0ZXh0IHg9IjMwOC40Mjk2ODc1IiB5PSIyNTAiIHN0eWxlPSJmaWxsOiMzMzM7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NDJwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj5UaGlyZCBzbGlkZTwvdGV4dD48L2c+PC9zdmc+"
												data-holder-rendered="true">
										</div>
									</div>
									<a class="left carousel-control"
										href="#carousel-example-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
								<li><a href="#">View all Collection <span
										class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
							</ul>
						</li>
					</ul></li> -->
				<li><a href="/CompanyItem/ITSolutions/Aervision/Aervision.mwav"
					onclick="ga('send', 'event', 'GNB', 'click', 'ITSolutions');"><h4
							class="nav_fontsize">
							<strong>IT Solutions</strong>
						</h4></a></li>
				<li><a href="/CompanyItem/ITProducts/QuickHeal/QuickHeal.mwav"
					onclick="ga('send', 'event', 'GNB', 'click', 'ITProducts');"><h4
							class="nav_fontsize">
							<strong>IT Products</strong>
						</h4></a></li>
				<li><a href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"
					onclick="ga('send', 'event', 'GNB', 'click', 'WebsiteBuilding');"><h4
							class="nav_fontsize">
							<strong>WebSite Building</strong>
						</h4></a></li>
				<li><a
					href="/CompanyItem/DigitalMarketing/DigitalMarketing.mwav"
					onclick="ga('send', 'event', 'GNB', 'click', 'DigitalMarketing');"><h4
							class="nav_fontsize">
							<strong>Digital Marketing</strong>
						</h4></a></li>
				<li><a href="/CompanyItem/ITConsulting/ITConsulting.mwav"
					onclick="ga('send', 'event', 'GNB', 'click', 'ITConsulting');"><h4
							class="nav_fontsize">
							<strong>IT Consulting</strong>
						</h4></a></li>
			</ul>
			<ul class="mgt2 nav navbar-nav navbar-right mgl3_1023">
				<!-- 일반로그인 부분 -->
				<c:if test="${sessionScope.member ne null }">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" data-toggle="tooltip"
						data-placement="bottom"
						data-original-title="${member.mbrLoginId}님
								반갑습니다."><i
							class="fa fa-user fa-lg"></i> My Mwav</a>

						<ul class="dropdown-menu dropdown-menu_change">
							<li><a href="/CustomerService/MemberShip/MemberShip.mwav"
								style="color: #428bca;"><h5>
										My Account <span class="glyphicon glyphicon-cog pull-right"></span>
									</h5></a></li>
							<li class=""></li>
							<!-- <li><a href="#">User stats <span
									class="glyphicon glyphicon-stats pull-right"></span></a></li> -->
							<li class=""></li>
							<%--QA 답변 달린 것에 대한 확인. --%>
							<li><a href="/qa/qaList.mwav" style="color: #428bca;"><h5>
										Messages <span class="badge pull-right"> </span>
									</h5></a></li>

							<!-- <li><a href="#">Favourites Snippets <span
									class="glyphicon glyphicon-heart pull-right"></span></a></li> -->
							<li class="divider"></li>
							<li><a href="/member/LogOut.mwav" style="color: #428bca;"><h5>
										Sign Out <span class="glyphicon glyphicon-log-out pull-right"></span>
									</h5></a></li>
						</ul></li>
				</c:if>
				<c:if test="${sessionScope.member eq null }">
					<li><a
						href="/MasterPage.mwav?mode=SMbrLogin&returnUrl=/login/post.mwav"><i
							class="fa fa-user fa-lg"></i></a></li>
					<li><a href="/MasterPage_1.mwav?mode=Default"><i
							class="fa fa-user-plus fa-lg"></i></a></li>
				</c:if>

			</ul>
		</div>
		<!-- /.container -->
	</div>
	<!-- /.navbar-collapse -->
</nav>



<!--  //////////////////////////////////// -->

<%--
  Header Carousel (슬라이드 쇼 부분- 헤더 포함 가능성있음.)
     클래스명에 container 추가시 조정가능하나 더 이상한듯 ~!! 조정 요망

     중간으로 보내기 위해서 container 추가 (left 메뉴 안의 페이지와 크기 동일) // => 다시 빼고 영역 조절
--%>
<header id="myCarousel" class="carousel slide"
	style="height: 55% !important;">

	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<%-- Wrapper for slides 슬라이드쇼 내용 --%>
	<div class="carousel-inner">
		<div class="item active slide1">
			<div class="fill img-responsive company_slideImg_600"
				style="background-image: url('/Company/zImage/keyboard-428326_1920.jpg'); background-repeat: no-repeat;">
				<div class="carousel-caption">
					<div class="container">
						<%-- <div class="col-md-7 text-left">
						<h3>We are creative</h3>
						<h4>Get start your next awesome project</h4>
					</div>
 --%>
						<div
							class="col-md-8 col-md-push-5 col-xs-12 text-right block_no block-3"
							style="opacity: 0.8;">
							<h4 class="">IT Trends</h4>
							<div class="bs-component" style="background-color: white;">
								 <jsp:include page="/board/bnsFrontList.mwav" flush="false" />
							</div>
							<%-- <div class="bs-component" style="background-color: white;">
						<jsp:include page="/board/bnsFrontList.mwav" flush="false" />
					</div> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="item slide2">
			<div class="fill img-responsive companyItem_slideImg_600"
				style="background-image: url('/CompanyItem/zImage/computer-1149148_1920.jpg'); background-repeat: no-repeat;">
				<div class="carousel-caption "
					style="color: rgba(138, 109, 59, 0.14)">

					<h4 class="fontsize_30">We are creative Get start your next
						awesome project</h4>
					<div class="col-xs-6 col-sm-4 col-md-4">
						<div class="block block-1">
							<h4 class="fontsize_20">WebSite Building</h4>
							<a href="/CompanyItem/WebSiteBuilding/WebSiteBuilding.mwav"><button
									class="btn btn-default btn-lg fontsize_14">Learn More</button></a>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-4">
						<div class="block block-2">
							<h4 class="fontsize_20">Digital Marketing</h4>
							<a href="/CompanyItem/DigitalMarketing/DigitalMarketing.mwav"><button
									class="btn btn-default btn-lg fontsize_14">Learn More</button></a>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-4">
						<div class="block block-3">
							<h4 class="fontsize_20">
								IT <br>Consulting
							</h4>
							<a href="/CompanyItem/ITConsulting/ITConsulting.mwav"><button
									class="btn btn-default btn-lg fontsize_14">Learn More</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="item slide3">
			<div class="fill img-responsive customer_slideImg_600"
				style="background-image: url('/CustomerService/zImage/education-1651259_1920.jpg'); background-repeat: no-repeat;">


				<%-- 전체크기는 일괄되게 --%>
				<%-- <div class="hidden-xs hidden-sm col-md-8 row pull-right">
					<h1 style="color: white;">Contact Address</h1>
					<br />
					<div class="row text-center">
						<div class="col-xs-3 col-sm-3 col-md-3"
							style="padding: 10px; background: #9C0;">
							<h1>
								<span class="glyphicon glyphicon-earphone"></span>
							</h1>
							<h3>Tel</h3>
							<br />
							<p>+82-2-6214-7039</p>
							<br />
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3"
							style="padding: 10px; background: #39F;">
							<h1>
								<span class="glyphicon glyphicon-home"></span>
							</h1>
							<h3>Location</h3>
							<p>607-20, Jayang-dong, Gwangjin-gu, Seoul, Korea</p>
							<br>

						</div>
						<div class="col-xs-3 col-sm-3 col-md-3"
							style="padding: 10px; background: #F66;">
							<h1>
								<span class="glyphicon glyphicon-send"></span>
							</h1>
							<h3>E-mail</h3>
							<br />
							<p>ebizpromwav@gmail.com</p>
							추후 클릭스 Contact 쪽으로 넘기면 좋을듯.
							<br />
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3"
							style="padding: 10px; background: #6CC;">
							<h1>
								<span class="glyphicon glyphicon-leaf"></span>
							</h1>
							<h3>Web</h3>
							<br />
							<p>Mwav.net</p>
							<br />
						</div>
					</div>
				</div> --%>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>

</header>

