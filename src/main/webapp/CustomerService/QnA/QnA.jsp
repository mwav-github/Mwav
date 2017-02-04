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

<c:if test="${requestScope.loginCheck eq 2 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 3 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 1 }">	
<c:set var="uqUserEmail" value='${requestScope.uqUserEmail}' scope="request" /> 
			
			<script type="text/javascript">
				//http://blog.naver.com/PostView.nhn?blogId=haanul98&logNo=80204508627&categoryNo=0&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1
				var uqUserEmail = '<c:out value="${uqUserEmail}"/>';
						location.href = "/qa/qaList.mwav?uqUserEmail="+uqUserEmail;
			</script>
</c:if>
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<!--  //////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Master.jsp"
			flush="false" />
		<!--  //////////////////////////////////// -->
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img
					src="/CustomerService/zImage/CustomerService_IN(height_280).jpg"
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
					Customer Service <small> Q&A</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Customer Service</li>
					<li class="active">Q&A</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- Content Column -->
				<div class="col-lg-12">
					<%--비회원 --%>
					<c:if test="${sessionScope.member_id eq null }">
					<div class="enter"></div>
						<div class="container">
							<div class="row">
							<form name="qaLogin" action="/qa/qaLogin.mwav" method="post">
								<div class="col-md-offset-3 col-md-5">
									<div class="form-login">
										<h4>Non-member Login</h4>
										<input type="text" id="e-mail" name="uqUserEmail"
											class="form-control input-sm chat-input"
											placeholder="E-mail" onchange="chkEmailPolicy(this.value, this)"/> </br>
											
											 <input type="password" name="uqUserPw"
											id="userPassword" class="form-control input-sm chat-input"
											placeholder="Password" onchange="chkPWPolicy(this.value, this)"/> </br>
										<div class="text-center">
											<span class="group-btn"> <a 
												class="btn btn-primary btn-md" onClick="javascript:qaLogin.submit();">login <i
													class="fa fa-sign-in" ></i></a>
											</span>
											<span class="group-btn"> <a href="/MasterPage_1.mwav?mode=Default"
												class="btn btn-primary btn-md">Sign Up Now</a>
											</span>
										</div>
									</div>

								</div>
								</form>
							</div>
						</div>
					</c:if>

					<%--회원 --%>
					<c:if test="${sessionScope.member_id ne null }">
						<c:redirect url="/qa/qaList.mwav" />
						<%-- 			<jsp:include page="/qa/qaList.mwav" flush="false" /> --%>
					</c:if>
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