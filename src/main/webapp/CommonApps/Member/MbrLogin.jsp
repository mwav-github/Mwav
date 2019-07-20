<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/JsFramework/Bootstrap/bootstrap-social.css" rel="stylesheet">
<%--padding 으로 안쪽 추후 딴건 변경가능 #04A3ED --%>
<c:if test="${param.type eq null}">
	<div class="enter"></div>
	<div class="col-md-12" style="padding: 5%; box-shadow: 0 0 20px 3px #04A3ED; background: #f7f7f7;">

		<form name="login_form" action="/member/Login.mwav" role="form" class='form-horizontal' method="post" onsubmit="return re_check(document.login_form);">
			<%--get문으로 넘어온 것은 param으로 받는다. "${param.returnUrl}" --%>
			<input type="hidden" name="returnUrl" value="${param.returnUrl}" />
			<div class="enter"></div>

			<div class="col-md-12">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" name="mbrLoginId" class="form-control input-lg caps_lockchk" placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" class="form-control input-lg caps_lockchk" placeholder="Password" name="mbrLoginPw">
					</div>
				</div>
			</div>
			<%--https://bootsnipp.com/snippets/featured/checkboxradio-css-only 추후 변경 --%>
			<div class="form-group mgl3">
				<div class="checkbox checbox-switch switch-primary">
					<label> <input type="checkbox" id="checkbox4" name="autoLoginChk"> <span></span> Keep me signed in.
					</label>
				</div>
			</div>

			<div class="col-md-12">
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Sign In</button>
				</div>
			</div>

			<%--recapCha --%>
			<div class="col-md-12">
				<div class="g-recaptcha" data-sitekey="6LcdRxoUAAAAAA4OI0FIN2bv2W0ersTRjqHJdLG-"
					style="transform: scale(0.88); -webkit-transform: scale(0.88); transform-origin: 0 0; -webkit-transform-origin: 0 0;"></div>
			</div>
		</form>

		<%--소셜 로그인 연동부분 
		중요사항 : col-md-12 외 나머지 것들 col-sm-12 등을 넣으면 버튼 동작이 하지 않음.
		<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off"> 확인 필요. 
		
		--%>
		<!-- GOOGLE SIGNIN -->
		<div class="col-md-12 ">
			<form action="<c:url value="/signin/google.mwav"/>" method="POST" onSubmit="return robot_check();">
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-social btn-google">
						<span class="fa fa-google-plus"></span> <span class="">Sign in with Google</span>
					</button>
				</div>

				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="scope" value="email profile" />
				<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
			</form>
		</div>

		<!-- facebook SIGNIN -->
		<div class="col-md-12">
			<form action="<c:url value="/signin/facebook.mwav"/>" method="POST" onSubmit="return robot_check();">
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-social btn-facebook">
						<span class="fa fa-facebook"></span> <span class=""> Sign in with Facebook</span>
					</button>
				</div>
				<input type="hidden" name="test" value="123" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
			</form>
		</div>

		<!-- LINKEDIN SIGNIN -->
		<div class=" col-md-12">
			<form action="<c:url value="/signin/linkedin.mwav"/>" method="POST" onSubmit="return robot_check();">
				<div class="form-group">
					<button type="submit" class="btn btn-block btn-social btn-linkedin">
						<span class="fa fa-linkedin"></span> <span class="">Sign in with LinkedIn</span>
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
			</form>
		</div>

		<%--twitter sign in --%>
		<div class="col-md-12 mgb3">
			<form action="<c:url value="/signin/twitter.mwav"/>" method="POST" onSubmit="return robot_check();">
				<button type="submit" class="btn btn-block btn-social btn-twitter">
					<span class="fa fa-twitter"></span> <span class="">Sign in with Twitter</span>
				</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
			</form>
		</div>

		<%--naver sign in --%>
		<div class="col-md-12 mgb3">
			<form action="${naver_url}" method="POST" onSubmit="return robot_check();">
				<button type="submit" class="btn btn-block btn-social btn-naver">
					<span class="fa icon-naver"></span> <span class="">Sign in with Naver</span>
				</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
			</form>
		</div>

		<%--아이디 비밀번호 찾기 --%>
		<div class="col-md-12">
			<div class="col-md-4">
				<a href="/MasterPage_1.mwav?mode=Default">
					<strong>Sign up now</strong>
				</a>
			</div>

			<div class="col-md-8">
				<a href="/MasterPage.mwav?mode=IDSeek">
					<strong>Forgot your ID?</strong>
				</a>
				<br>
				<a href="/MasterPage.mwav?mode=PWSeek">
					<strong>Forgot your Password?</strong>
				</a>
			</div>
		</div>
	</div>
</c:if>
<!-- Login - END -->
<c:if test="${param.type == 'simple'}">

	<form name="login_form_simple" action="/member/Login.mwav" role="form" class='form-horizontal' method="post" onsubmit="return re_check(document.login_form_simple);">

		<input type="hidden" name="returnUrl" value="${param.returnUrl }" />


		<div class="form-group">
			<input type="text" name="mbrLoginId" class="form-control input-lg caps_lockchk" placeholder="Email or member ID">
		</div>
		<div class="form-group">
			<input type="password" class="form-control input-lg caps_lockchk" placeholder="Password" name="mbrLoginPw">
		</div>

		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-block">Login</button>
		</div>

		<div class="form-group">
			<div class="col-md-12">
				<div class="g-recaptcha" data-sitekey="6LcdRxoUAAAAAA4OI0FIN2bv2W0ersTRjqHJdLG-"></div>
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
		<form action="<c:url value="/signin/google.mwav"/>" method="POST" onSubmit="return robot_check();">
			<div class="form-group">
				<button type="submit" class="btn btn-block btn-social btn-google">
					<span class="fa fa-google-plus"></span> <span class="">Sign in with Google</span>
				</button>
			</div>

			<input type="hidden" name="test" value="123" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="scope" value="email profile" />
			<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>

	<!-- facebook SIGNIN -->
	<div class="col-md-12">
		<form action="<c:url value="/signin/facebook.mwav"/>" method="POST" onSubmit="return robot_check();">
			<div class="form-group">
				<button type="submit" class="btn btn-block btn-social btn-facebook">
					<span class="fa fa-facebook"></span> <span class=""> Sign in with Facebook</span>
				</button>
			</div>
			<input type="hidden" name="test" value="123" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>

	<!-- LINKEDIN SIGNIN -->
	<div class=" col-md-12">
		<form action="<c:url value="/signin/linkedin.mwav"/>" method="POST" onSubmit="return robot_check();">
			<div class="form-group">
				<button type="submit" class="btn btn-block btn-social btn-linkedin">
					<span class="fa fa-linkedin"></span> <span class="">Sign in with LinkedIn</span>
				</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>

	<%--twitter sign in --%>
	<div class="col-md-12 mgb3">
		<form action="<c:url value="/signin/twitter.mwav"/>" method="POST" onSubmit="return robot_check();">
			<button type="submit" class="btn btn-block btn-social btn-twitter">
				<span class="fa fa-twitter"></span> <span class="">Sign in with Twitter</span>
			</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>

	<%--naver sign in --%>
	<div class="col-md-12 mgb3">
		<form action="${naver_url}" method="POST" onSubmit="return robot_check();">
			<button type="submit" class="btn btn-block btn-social btn-naver">
				<span class="fa icon-naver"></span> <span class="">Sign in with Naver</span>
			</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="autoLoginChk" class="autoLoginChk" value="off" />
		</form>
	</div>

	<div class="form-group ">
		<div class="col-md-4">
			<a href="/MasterPage_1.mwav?mode=Default">
				<strong>Sign up now</strong>
			</a>
		</div>

		<div class="col-md-8">
			<a href="/MasterPage.mwav?mode=IDSeek">
				<strong>Forgot your ID?</strong>
			</a>
			<br>
			<a href="/MasterPage.mwav?mode=PWSeek">
				<strong>Forgot your Password?</strong>
			</a>
		</div>
	</div>
</c:if>

<script type="text/javascript">
	// 해당 page에 접근 시 loginCheck value에 따라 페이지를 제어하는 함수로 추정
	function controlDisplay() {
		var loginCheck = '<c:out value="${requestScope.loginCheck}"/>';
		var returnUrl = '<c:out value="${requestScope.returnUrl}"/>';

		switch (String(loginCheck)) {
		case '1':
			if (String(returnUrl))
				location.href = "/";
			else
				location.href = returnUrl;
			break;
		case '2':
		case '3':
			alert('아이디/비밀번호가  일치하지 않습니다.');
			history.go(-1);
			break;
		case '5':
			alert('임시패스워드입니다. 비밀번호 변경 후 로그인해주세요.');
			history.go(-1);
			break;
		case '6':
			alert('reCAPTCHA 오류입니다. 다시 시도해주세요.');
			history.go(-1);
			break;
		case '7':
			alert('탈퇴한 회원입니다.');
			msg = '재 가입하시겠습니까.?'
			if (confirm(msg) != 0) {
				// 이전 url 기록안하는 경우 , location.href 의 경우 이전기록이 남아 login.mwav로 포워딩 , 프로세스 정리 필요
				location.replace("/MasterPage_1.mwav?mode=Default");
			} else {
				history.go(-1);
			}
			break;
		}
	}

	// form 전송 data를 검증하는 함수인 것으로 추정
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

	// document.Ready
	$(function() {
		controlDisplay();
	});
</script>
