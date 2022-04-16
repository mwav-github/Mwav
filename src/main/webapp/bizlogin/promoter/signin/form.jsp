<%-- 프로모터 로그인 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<jsp:include page="/bizlogin/sementic/meta.jsp" flush="false" />
<body>
	<header class="section-header">
		<jsp:include page="/bizlogin/sementic/header.jsp" flush="false" />
	</header>

	<section class="section-conten padding-y" style="min-height: 84vh">
		<div class="card mx-auto" style="max-width: 380px; margin-top: 50px;">
			<div class="card-body">
				<form id="promoter" name="promoter" action="<c:url value='/bizlogin/promoter/signin' />" method="post"
					autocomplete="off">
					<input type="hidden" id="token" name="token" value="">

					<div class="img-wrap mb-4">
						<a class="btn-overlay" href="javascript:loginWithKakao()">
							<img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_large_wide.png">
						</a>
					</div>
					<div class="form-group">
						<input id="pmtLoginId" name="pmtLoginId" class="form-control" placeholder="Username" type="text">
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<input id="pmtLoginPw" name="pmtLoginPw" class="form-control" placeholder="Password" type="password">
					</div>
					<!-- form-group// -->

					<div class="form-group">
						<a href="#" class="float-right" alt="Forgot ID/Password?">아이디/비밀번호 찾기</a>
						<label class="float-left custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label" alt="Remember">자동 로그인</div>
						</label>
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg" alt="Sign in">로그인</button>
					</div>

					<div class="form-group">
						<a href="<c:url value='/bizlogin/promoter/signup/form' />" class="btn btn-block btn-outline-primary btn-lg"
							alt="Sign up">회원가입</a>
					</div>
				</form>
			</div>
			<!-- .card-body -->
		</div>
		<!-- .card -->
		<br>
		<br>
	</section>

	<footer class="section-footer border-top">
		<jsp:include page="/bizlogin/sementic/footer.jsp" flush="false" />
	</footer>

</body>
</html>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6LdhTbYbAAAAACn-5-QwU92JmHyAoi25He6wRbGa"></script>
<script type="text/javascript">
	function loginWithKakao() {
		Kakao.Auth.loginForm({
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						var userData = {
							spNickname : res.properties['nickname'],
							spPromoterId : res.kakao_account['email'],
							spEmail : res.kakao_account['email'],
							spEmailVerified : res.kakao_account['is_email_verified'],
							spProfileImage : res.properties['profile_image'],
							spSnsType : 'Kakao'
						}

						$.ajax({
							type : 'POST',
							url : '<c:url value="/bizlogin/promoter/signin/kakao" />',
							data : JSON.stringify(userData),
							contentType : "application/json",
							success : function(data) {
								if (data != null) {
									location.href = '<c:url value="/bizlogin" />';
								}
							},
							fail : function(error) {
								alert(JSON.stringify(error));
							}
						});
					}
				})
			},

			fail : function(err) {
				alert(JSON.stringify(err));
			},
		})
	}

	// 해당 page에 접근 시 msg 가 있다면 alert 으로 출력
	function showMessage() {
		var msg = '${msg}';
		if (msg) {
			alert(msg);
		}
	}

	// 구글 리캡챠 펑션
	function recaptcha() {
		grecaptcha.ready(function() {
			grecaptcha.execute('6LdhTbYbAAAAACn-5-QwU92JmHyAoi25He6wRbGa', {
				action : 'submit'
			}).then(function(token) {
				$('#token').val(token);
			});
		});
	}

	document.querySelector('#promoter').onsubmit = function(event) {
		var promoter = event.target;
		if (!promoter) {
			return false;
		}
		
		var pmtLoginId = promoter.pmtLoginId;
		var pmtLoginPw = promoter.pmtLoginPw;
		if (!pmtLoginId || !pmtLoginPw) {
			return false;
		}
		
		if (!pmtLoginId.value) {
			alert('아이디를 입력해주세요.');
			pmtLoginId.focus();
			return false;
		}
		
		if (!pmtLoginPw.value) {
			alert('비밀번호를 입력해주세요.');
			pmtLoginPw.focus();
			return false;
		}
		
		return true;
	};
	
	$(function() {
		recaptcha(); // 페이지 로드시 Google Recaptcha token를 받아옴
		showMessage();
	});
</script>