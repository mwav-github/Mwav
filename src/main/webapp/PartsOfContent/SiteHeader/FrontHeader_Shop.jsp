<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(
			function() {
				// 아래의 내용을 해야지 dropdown 됬을때 유지된다
				$(".dropdown").hover(
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideDown("400");
							$(this).toggleClass('open_');
						},
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideUp("400");
							$(this).toggleClass('open_');
						})
			});
</script>

<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
<!--  //////////////////////////////////// -->
<%--
MEGA MENU
http://bootsnipp.com/snippets/featured/bootstrap-mega-menu
 --%>

<!-- 메인 페이지에서만 타겟팅 나머지는 URL 물고가기 
이놈이 슬라이드쇼 있는놈
-->


<!-- position 값 absoulte로 해야 상단 안따라옴 > navbar-fixed-top 로 지정하면된다. 
     navbar-fixed-top이 fixed 라서 안잡힌다. relative로 해야 밑의 영역과 구분
     근데 딴곳 예제보면 위와같이 해도 구분되는데 이부분은 추가 체크 필요.
-->
<nav id="BackToTop" class="menu_shop navbar" role="navigation">

	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand active logo_800" href="/Shop/Index.jsp"> <img
				src="/Images/CompanyLogos/CompanyLogo.gif"
				class="img-thumbnail img-responsive logo_800_h"
				alt="Responsive image">
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="mgt2 collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="mgl5 mgt2 nav navbar-nav">

				<li class="dropdown mega-dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Category <span
						class="caret"></span></a>
					<ul class="dropdown-menu mega-dropdown-menu">
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Features</li>
								<li><a href="#">Auto Carousel</a></li>
								<li><a href="#">Carousel Control</a></li>
								<li><a href="#">Left & Right Navigation</a></li>
								<li><a href="#">Four Columns Grid</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Fonts</li>
								<li><a href="#">Glyphicon</a></li>
								<li><a href="#">Google Fonts</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Plus</li>
								<li><a href="#">Navbar Inverse</a></li>
								<li><a href="#">Pull Right Elements</a></li>
								<li><a href="#">Coloured Headers</a></li>
								<li><a href="#">Primary Buttons & Default</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Much more</li>
								<li><a href="#">Easy to Customize</a></li>
								<li><a href="#">Calls to action</a></li>
								<li><a href="#">Custom Fonts</a></li>
								<li><a href="#">Slide down on Hover</a></li>
							</ul>
						</li>
						<li class="col-sm-3">
							<ul>
								<li class="dropdown-header">Collection</li>
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
					</ul></li>
				<li><a href="#">GNB_1</a></li>
				<li><a href="#">GNB_2</a></li>
				<li><a href="#">GNB_3</a></li>

			</ul>
			<div class="col-sm-4 col-md-4 mgt2">
				<form class="navbar-form" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="q">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="#"><i class="fa fa-user fa-lg"></i></a></li>
				<li><a href="#"><i class="fa fa-user-plus fa-lg"></i></a></li>

			</ul>
		</div>
		<!-- /.container -->
	</div>
	<!-- /.navbar-collapse -->
</nav>


<!--  //////////////////////////////////// -->

<%-- container 는 960 //  row는 전체  --%>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Wrapper for slides -->
	<%--높이값 고정 (기획전 이슈) --%>
	<div class="carousel-inner" style="height: 400px; margin-top: -22px;">
		<div class="item">
			<img src="/Shop/zImages/promotion_1.jpg">
			<div class="carousel-caption">
				<h3>Headline</h3>
				<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed
					diam nonumy eirmod tempor invidunt ut labore et dolore magna
					aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet,
					consetetur sadipscing elitr.</p>
			</div>
		</div>
		<!-- End Item -->
		<div class="item">
			<img src="/Shop/zImages/promotion_2.png">
			<div class="carousel-caption">
				<h3>Headline</h3>
				<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed
					diam nonumy eirmod tempor invidunt ut labore et dolore magna
					aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet,
					consetetur sadipscing elitr.</p>
			</div>
		</div>
		<!-- End Item -->
		<div class="item">
			<img src="/Shop/zImages/promotion_3.jpg">
			<div class="carousel-caption">
				<h3>Headline</h3>
				<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed
					diam nonumy eirmod tempor invidunt ut labore et dolore magna
					aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet,
					consetetur sadipscing elitr.</p>
			</div>
		</div>
		<!-- End Item -->
		<div class="item active">
			<img src="/Shop/zImages/promotion_4.png">
			<div class="carousel-caption"> <h3>Headline</h3>
				<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed
					diam nonumy eirmod tempor invidunt ut labore et dolore magna
					aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet,
					consetetur sadipscing elitr.</p>
			</div>
		</div>
		<!-- End Item -->
	</div>
	<!-- End Carousel Inner -->
	<ul class="nav nav-pills nav-justified">
		<li class="active" data-target="#myCarousel" data-slide-to="0"><a
			data-toggle="tab" href="#">About<small>Lorem ipsum dolor
					sit</small></a></li>
		<li data-target="#myCarousel" data-slide-to="1"><a
			data-toggle="tab" href="#">Projects<small>Lorem ipsum
					dolor sit</small></a></li>
		<li data-target="#myCarousel" data-slide-to="2"><a
			data-toggle="tab" href="#">Portfolio<small>Lorem ipsum
					dolor sit</small></a></li>
		<li data-target="#myCarousel" data-slide-to="3"><a
			data-toggle="tab" href="#">Services<small>Lorem ipsum
					dolor sit</small></a></li>
	</ul>
</div>
