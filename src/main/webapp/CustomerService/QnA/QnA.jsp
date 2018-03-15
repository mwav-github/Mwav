<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${requestScope.loginCheck eq 0 }">
	<script type="text/javascript">
		alert('아이디 또는 비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 1}">
	<c:set var="uqUserEmail" value='${requestScope.uqUserEmail}'
		scope="request" />

	<script type="text/javascript">
		//http://blog.naver.com/PostView.nhn?blogId=haanul98&logNo=80204508627&categoryNo=0&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1
		var uqUserEmail = '<c:out value="${uqUserEmail}"/>';
		location.href = "/qa/qaList.mwav?uqUserEmail=" + uqUserEmail;
	</script>
</c:if>

<script>
	function re_check(form) {
		//alert('11');
		//alert(form.mbrLoginId.value);
		if (emptyCheck(form.uqUserPw, "이메일을 입력해주세요.") == true
				&& emptyCheck(form.uqUserPw, "비밀번호를 입력해주세요.") == true) {
			return true;
		} else {
			return false;
		}
	}
</script>

<c:choose>

	<%--qaForm 출력 --%>
	<c:when test="${param.mode eq 'qaForm'}">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Contact Us
					<span class="pull-right">
					<a href="/CustomerService/QnA/QnA.mwav">
						<input type="button"
							class="btn-custom-default btn btn-md btn-primary" value="문의내역 확인"></a>
					</span>
				</h1>

			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">

			<!-- Content Column -->
			<div class="col-lg-12">

				<%--중요 !! 여기에서 type를 지정해줘야 한다 안그러면, 밑에 footer에도 include 하는데 이때 또 중복되서 나온다. !!  --%>
				<jsp:include page="/CommonApps/BoardQnA/qaForm.jsp" flush="false">
					<jsp:param name="type" value="page" />
				</jsp:include>
			</div>
		</div>
	</c:when>
	<%--qa로그인창 출력 --%>
	<c:otherwise>
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


					<%--비회원 또는 로그인 안한 경우 --%>
					<c:if test="${sessionScope.member eq null }">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6">
								<h3 class="mwav_leftText">
									<strong>Member</strong>
								</h3>
								<div class="enter"></div>
								<div class="container">
									<jsp:include page="/CommonApps/Member/MbrLogin.jsp"
										flush="false">
										<jsp:param name="type" value="simple" />
										<jsp:param name="returnUrl" value="/qa/qaList.mwav" />
									</jsp:include>
								</div>
							</div>

							<div class="right_hr hidden-xs hidden-sm"></div>

							<div class="col-xs-12 col-sm-12 col-md-6">
								<h3 class="mwav_leftText">
									<strong>Non-Member</strong>
								</h3>
								<div class="enter"></div>
								<div class="container">
									<div class="jumbotron">

										<div class="row">
											<div class="col-md-12">
												<form name="qaLogin" action="/qa/qaLogin.mwav" method="post"
													onsubmit="return re_check(document.qaLogin);">
													<div class="form-group">
														<label for="email">Email address*</label> <input
															type="text" id="e-mail" name="uqUserEmail"
															class="form-control " placeholder="E-mail" />
													</div>
													<div class="form-group">
														<label for="password">Password*</label><input
															type="password" name="uqUserPw" id="userPassword"
															class="form-control caps_lockchk" placeholder="Password" />
													</div>
													<button type="button"
														onClick="javascript:qaLogin.submit();"
														class="btn btn-primary btn-block">Sign to your
														account</button>
												</form>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</c:if>

					<%--회원 --%>
					<c:if test="${sessionScope.member ne null }">
						<c:redirect url="/qa/qaList.mwav" />
						<%-- 			<jsp:include page="/qa/qaList.mwav" flush="false" /> --%>
					</c:if>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</c:otherwise>
</c:choose>
