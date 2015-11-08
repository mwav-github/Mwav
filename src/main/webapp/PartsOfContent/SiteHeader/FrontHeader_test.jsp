<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 메인 페이지에서만 타겟팅 나머지는 URL 물고가기 -->
<div class="row">
	<nav class="navbar navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Mwav</a>

			</div>


			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/" class="">Home</a></li>

					<li class=" dropdown"><a href="#" class="dropdown-toggle "
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Departments <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">View Departments</a></li>
							<li><a href="#">Add New</a></li>
						</ul></li>
					<li class=" dropdown"><a href="#" class="dropdown-toggle "
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Managers <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">View Managers</a></li>
							<li><a href="#">Add New</a></li>
						</ul></li>
					<li class=" dropdown"><a href="#"
						class="dropdown-toggle active" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">Staff
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">View Staff</a></li>
							<li><a href="#">Add New</a></li>
							<li><a href="#">Bulk Upload</a></li>
						</ul></li>
					<li class=" down"><a href="#" class="dropdown-toggle active"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">HR <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Change Time Entry</a></li>
							<li><a href="#">Report</a></li>
						</ul></li>

				</ul>
				<ul class="nav navbar-nav pull-right">
					<li class=" dropdown"><a href="#"
						class="dropdown-toggle active" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">Signed
							in as <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">Change Password</a></li>
							<li><a href="#">My Profile</a></li>
						</ul></li>
					<li class=""><a href="#">Logout</a></li>
					
					
					<c:if test="${sessionScope.mbrLoginId ne null }">
						<li><a href="/CustomerService/CS-MasterPage.jsp?mode=SDMyPage"><font color="#9d9d9d">${mbrLoginId}님 반갑습니다.</font></a></li>
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
		</div>
	</nav>
</div>