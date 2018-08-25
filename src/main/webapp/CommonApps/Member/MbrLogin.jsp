<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<!--  <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">  -->
<link href="/resources/JsFramework/Bootstrap/bootstrap-social.css"
	rel="stylesheet">

<head>
<c:if test="${requestScope.loginCheck eq 2 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 7 }">
	<script type="text/javascript">
		alert('탈퇴한 회원입니다.');
		msg = '재 가입하시겠습니까.?'
		if (confirm(msg) != 0) {
	<%-- 이전 url 기록안하는 경우 , location.href 의 경우 이전기록이 남아 login.mwav로 포워딩 , 프로세스 정리 필요. --%>
		location.replace("/MasterPage_1.mwav?mode=Default");
		} else {
			history.go(-1)
		}
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 3 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 6 }">
	<script type="text/javascript">
		alert('reCAPTCHA 오류입니다. 다시 시도해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 5 }">
	<script type="text/javascript">
		alert('임시패스워드입니다. 비밀번호 변경 후 로그인해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 1 }">

	<c:choose>
		<c:when test="${requestScope.returnUrl eq null }">
			<script type="text/javascript">
				
			<%--http://blog.naver.com/PostView.nhn?blogId=haanul98&logNo=80204508627&categoryNo=0&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1 --%>
				location.href = "/";
			</script>
		</c:when>
		<c:when test="${requestScope.returnUrl ne null }">
			<c:set var="returnUrl" value='${requestScope.returnUrl}'
				scope="request" />
			<script type="text/javascript">
				var returnUrl = '<c:out value="${returnUrl}"/>';
				location.href = returnUrl;
			</script>
			<%-- <c:url var="url" value="${requestScope.returnUrl}">
			</c:url> 

			<c:redirect url="${requestScope.returnUrl}" />
--%>
		</c:when>
	</c:choose>
</c:if>
<script>
	$(function() {
		$("#checkbox4").bind("click", function() {

			var autoUse = $("#checkbox4").is(":checked");
			if (autoUse == false) {
				$(".autoLogin").val("off");
			} else if (autoUse == true) {
				$(".autoLogin").val("on");
			}
			//alert(autoUse);
		});
	});
</script>
</head>
<script>
	function re_check(form) {

		var robot_flag = robot_check();
		if (robot_flag == true) {
			if (emptyCheck(form.mbrLoginId, "아이디를 입력해주세요.") == true
					&& emptyCheck(form.mbrLoginPw, "비밀번호를 입력해주세요.") == true) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
		return false;
	}
</script>

<%--padding 으로 안쪽 추후 딴건 변경가능 #04A3ED --%>
<c:if test="${param.type eq null}">
	<div class="enter"></div>
	<div class="col-md-12"
		style="padding: 5%; box-shadow: 0 0 20px 3px #04A3ED; background: #f7f7f7;">

		<form name="login_form" action="/member/Login.mwav" role="form"
			class='form-horizontal' method="post"
			onsubmit="return re_check(document.login_form);">
			<%--get문으로 넘어온 것은 param으로 받는다. "${param.returnUrl}" --%>
			<input type="hidden" name="returnUrl" value="${param.returnUrl}" />
			<div class="enter"></div>

			<div class="col-md-12">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span><input type="text"
							name="mbrLoginId" class="form-control input-lg caps_lockchk"
							placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span><input type="password"
							class="form-control input-lg caps_lockchk" placeholder="Password"
							name="mbrLoginPw">
					</div>
				</div>
			</div>
			<%--https://bootsnipp.com/snippets/featured/checkboxradio-css-only 추후 변경 --%>
			<div class="form-group mgl3">
				<div class="checkbox checbox-switch switch-primary">
					<label> <input type="checkbox" id="checkbox4"
						name="autoLoginChk"> <span></span> Keep me signed in.
					</label>
				</div>
			</div>

			<div class="col-md-12">
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
						In</button>
				</div>
			</div>

			<%--recapCha --%>
			<div class="col-md-12">

				<%--invisible --%>
				<%-- 	<button class="g-recaptcha"
				data-sitekey="6LcHRBoUAAAAAH5dmdNp-Iv1d7MAphM6B71ov9ZD"
				data-callback="onSubmit">Submit</button>
		 <div id='recaptcha' class="g-recaptcha"
          data-sitekey="6LcHRBoUAAAAAH5dmdNp-Iv1d7MAphM6B71ov9ZD"
          data-callback="onSubmit"
          data-size="invisible"></div> --%>
				<%--visible --%>
				<div class="g-recaptcha"
					data-sitekey="6LcdRxoUAAAAAA4OI0FIN2bv2W0ersTRjqHJdLG-"
					style="transform: scale(0.88); -webkit-transform: scale(0.88); transform-origin: 0 0; -webkit-transform-origin: 0 0;"></div>
			</div>
		</form>


		<%--소셜 로그인 연동부분 
		중요사항 : col-md-12 외 나머지 것들 col-sm-12 등을 넣으면 버튼 동작이 하지 않음.
		--%>
		<!-- GOOGLE SIGNIN -->
		<div class="col-md-12 ">
			<form action="<c:url value="/signin/google.mwav"/>" method="POST"
				onSubmit="return robot_check();">
				<!-- <button type="submit" class="btn btn-danger btn-block">
						<i class="fa fa-google-plus"></i>
					</button> -->
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-social btn-google">
						<span class="fa fa-google-plus"></span> <span class="">Sign
							in with Google</span>
					</button>
				</div>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="scope"
					value="email profile" /> <input type="hidden" name="autoLoginChk"
					class="autoLoginChk" value="off" />
			</form>
		</div>

		<!-- facebook SIGNIN -->
		<div class="col-md-12">
			<form action="<c:url value="/signin/facebook.mwav"/>" method="POST"
				onSubmit="return robot_check();">
				<!-- <button type="submit" class="btn btn-primary btn-block">
						<i class="fa fa-facebook"></i>
					</button> -->
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-social btn-facebook">
						<span class="fa fa-facebook"></span> <span class=""> Sign
							in with Facebook</span>
					</button>
				</div>
				<input type="hidden" name="test" value="123" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="autoLoginChk" class="autoLoginChk"
					value="off" />
			</form>
		</div>


		<!-- LINKEDIN SIGNIN -->
		<div class=" col-md-12">
			<form action="<c:url value="/signin/linkedin.mwav"/>" method="POST"
				onSubmit="return robot_check();">
				<!-- <button type="submit" class="btn btn-danger btn-block">
						<i class="fa fa-linkedin"></i>
					</button> -->
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-social btn-linkedin">
						<span class="fa fa-linkedin"></span> <span class="">Sign in
							with LinkedIn</span>
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="autoLoginChk"
					class="autoLoginChk" value="off" />
			</form>
		</div>

		<%--twitter sign in --%>
		<div class="col-md-12 mgb3">
			<form action="<c:url value="/signin/twitter.mwav"/>" method="POST"
				onSubmit="return robot_check();">
				<!-- <button type="submit" class="btn btn-info btn-block">
						<i class="fa fa-twitter"></i>
					</button> -->

				<button type="submit" class="btn btn-block btn-social btn-twitter">
					<span class="fa fa-twitter"></span> <span class="">Sign in
						with Twitter</span>
				</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="autoLoginChk"
					class="autoLoginChk" value="off" />
			</form>
		</div>

		<%--아이디 비밀번호 찾기 --%>
		<div class="col-md-12">


			<div class="col-md-4">
				<a href="/MasterPage_1.mwav?mode=Default"><strong>Sign
						up now</strong></a>
			</div>


			<div class="col-md-8">
				<a href="/MasterPage.mwav?mode=IDSeek"><strong>Forgot
						your ID?</strong></a> <br> <a href="/MasterPage.mwav?mode=PWSeek"><strong>Forgot
						your Password?</strong></a>

			</div>


		</div>

	</div>

</c:if>
<!-- Login - END -->
<c:if test="${param.type == 'simple'}">

	<form name="login_form_simple" action="/member/Login.mwav" role="form"
		class='form-horizontal' method="post"
		onsubmit="return re_check(document.login_form_simple);">

		<input type="hidden" name="returnUrl" value="${param.returnUrl }" />


		<div class="form-group">
			<input type="text" name="mbrLoginId"
				class="form-control input-lg caps_lockchk"
				placeholder="Email or member ID">
		</div>
		<div class="form-group">
			<input type="password" class="form-control input-lg caps_lockchk"
				placeholder="Password" name="mbrLoginPw">
		</div>


		<%-- <div class="checkbox">
			<label> <input type="checkbox" name="remember" id="remember">
				Remember login
			</label>
			<p class="help-block">(if this is a private computer)</p>
		</div> --%>


		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-block">Login</button>
		</div>

		<div class="form-group">
			<div class="col-md-12">

				<div class="g-recaptcha"
					data-sitekey="6LcdRxoUAAAAAA4OI0FIN2bv2W0ersTRjqHJdLG-"></div>
			</div>
		</div>

	</form>
	<div class="enter"></div>
	<%--소셜 로그인 연동부분 
		중요사항 : col-md-12 외 나머지 것들 col-sm-12 등을 넣으면 버튼 동작이 하지 않음.
		--%>
	<!-- GOOGLE SIGNIN -->
	<div class="col-md-12 ">
		<div class="enter"></div>
		<form action="<c:url value="/signin/google.mwav"/>" method="POST"
			onSubmit="return robot_check();">
			<!-- <button type="submit" class="btn btn-danger btn-block">
						<i class="fa fa-google-plus"></i>
					</button> -->
			<div class="form-group">
				<button type="submit" class="btn btn-block btn-social btn-google">
					<span class="fa fa-google-plus"></span> <span class="">Sign
						in with Google</span>
				</button>
			</div>

			<input type="hidden" name="test" value="123" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
				type="hidden" name="scope" value="email profile" /> <input
				type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>

	<!-- facebook SIGNIN -->
	<div class="col-md-12">
		<form action="<c:url value="/signin/facebook.mwav"/>" method="POST"
			onSubmit="return robot_check();">
			<!-- <button type="submit" class="btn btn-primary btn-block">
						<i class="fa fa-facebook"></i>
					</button> -->
			<div class="form-group">
				<button type="submit" class="btn btn-block btn-social btn-facebook">
					<span class="fa fa-facebook"></span> <span class=""> Sign in
						with Facebook</span>
				</button>
			</div>
			<input type="hidden" name="test" value="123" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
				type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>


	<!-- LINKEDIN SIGNIN -->
	<div class=" col-md-12">
		<form action="<c:url value="/signin/linkedin.mwav"/>" method="POST"
			onSubmit="return robot_check();">
			<!-- <button type="submit" class="btn btn-danger btn-block">
						<i class="fa fa-linkedin"></i>
					</button> -->
			<div class="form-group">
				<button type="submit" class="btn btn-block btn-social btn-linkedin">
					<span class="fa fa-linkedin"></span> <span class="">Sign in
						with LinkedIn</span>
				</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="autoLoginChk"
				class="autoLoginChk" value="off" />
		</form>
	</div>

	<%--twitter sign in --%>
	<div class="col-md-12 mgb3">
		<form action="<c:url value="/signin/twitter.mwav"/>" method="POST"
			onSubmit="return robot_check();">
			<!-- <button type="submit" class="btn btn-info btn-block">
						<i class="fa fa-twitter"></i>
					</button> -->

			<button type="submit" class="btn btn-block btn-social btn-twitter">
				<span class="fa fa-twitter"></span> <span class="">Sign in
					with Twitter</span>
			</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="autoLoginChk"
				class="autoLoginChk" value="off" />
		</form>
	</div>


	<div class="form-group ">
		<%-- <span class="pull-left"><a href="#IDPWSeek"
				data-toggle="modal" data-target=".IDPWSeek" role="button"
				data-toggle="modal"><strong>Forgot your ID or Password?</strong></a></span>

			이것때문에 tooltip등이 오류가난다
			<jsp:include page="/CommonApps/IDSeek/IDSeek.jsp" flush="false" /> --%>
		<%-- <span class="pull-left"><a
				href="/MasterPage_1.jsp?mode=Default"><strong>Sign up
						now</strong></a></span> --%>

		<div class="col-md-4">
			<a href="/MasterPage_1.mwav?mode=Default"><strong>Sign
					up now</strong></a>
		</div>


		<div class="col-md-8">
			<a href="/MasterPage.mwav?mode=IDSeek"><strong>Forgot
					your ID?</strong></a> <br> <a href="/MasterPage.mwav?mode=PWSeek"><strong>Forgot
					your Password?</strong></a>

		</div>
	</div>

</c:if>
