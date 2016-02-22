<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-default" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
				class="icon-bar"></span><span class="icon-bar"></span>
		</button>

		<a class="navbar-brand active logo_800_m" href="/admins/Default.do"> <img
					src="/Company/zImage/CompanyLogo_gray.gif"
					class="img-thumbnail img-responsive logo_800_h"
					alt="Responsive image"></a>
		
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="/HomePage/DefaultFrameset.do?mm=mine"
					title="1.나의업무 2.쪽지관리 3.명함관리 4.메일관리">마이존</a></li>
				<li><a href="/HomePage/DefaultFrameset.do?mm=mine"
					title="1.카테고리등록">카테고리등록</a></li>
				<li class="active"><a
					href="/HomePage/DefaultFrameset.do?mm=cGds" title="1.상품입력 2.상품 리스트">상품관리</a></li>
				<li><a href="/HomePage/DefaultFrameset.do?mm=cStk"
					title="1.상품재고관리">재고관리</a></li>
				<li class="active"><a
					href="/HomePage/DefaultFrameset.do?mm=site"
					title="1.공지관리 2.뉴스관리 3.Q&A관리 4.폴관리">사이트관리</a></li>
				<li><a href="/HomePage/DefaultFrameset.do?mm=firm"
					title="1.문서자료 2.직원조회 3.회사자산">회사관리</a></li>
				<li class="active"><a href="/HomePage/DefaultFrameset.do?mm=ptn"
					title="1.협력사목록 2.협력사입력">관계사관리</a></li>
				<li><a href="/HomePage/DefaultFrameset.do?mm=mbrs"
					title="1.회원기본정보 2.회원부가정보 3.회원평가치 4.회원가입">회원관리</a></li>
				<li class="active"><a href="/HomePage/DefaultFrameset.do?mm=crm"
					title="1.통계관리 2.인적자원 3.상품통계 4.회원메일 5.임박기념일 6.이벤트목록 7.고객충성도">마켓팅관리</a></li>
				<li><a href="/HomePage/DefaultFrameset.do?mm=sys"
					title="1.시스템상태요약 2.로그관리">시스템관리</a></li>
			</ul>
	
	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span class="glyphicon glyphicon-comment"></span>Chats
						<span class="label label-primary">42</span> </a>
					<ul class="dropdown-menu">
						<li><a href="#"><span class="label label-warning">7:00
									AM</span>Hi :)</a></li>
						<li><a href="#"><span class="label label-warning">8:00
									AM</span>How are you?</a></li>
						<li><a href="#"><span class="label label-warning">9:00
									AM</span>What are you doing?</a></li>
						<li class="divider"></li>
						<li><a href="#" class="text-center">View All</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span
						class="glyphicon glyphicon-envelope"></span>Inbox <span
						class="label label-info">32</span> </a>
					<ul class="dropdown-menu">
						<li><a href="#"><span class="label label-warning">4:00
									AM</span>Favourites Snippet</a></li>
						<li><a href="#"><span class="label label-warning">4:30
									AM</span>Email marketing</a></li>
						<li><a href="#"><span class="label label-warning">5:00
									AM</span>Subscriber focused email design</a></li>
						<li class="divider"></li>
						<li><a href="#" class="text-center">View All</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>Admin
						<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>Profile</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-cog"></span>Settings</a></li>
						<li class="divider"></li>
						<li><a href="#"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
					</ul></li>
			</ul>
		</div>
	<!-- /.navbar-collapse -->
</nav>