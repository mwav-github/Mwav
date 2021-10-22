<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<!-- ========================= Head & Meta Area ========================= -->
<head>
<jsp:include
	page="/Promoter/PartsOfContent/SiteHeader/PmtSiteMetaHeader.jsp"
	flush="false" />
<script type="text/javascript">
	/// some script

	// jquery ready start
	$(document).ready(function() {
		// jQuery code

	});
	// jquery end
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- ========================= Head & Meta Area END ========================= -->

<body>
	<!-- ========================= Header ========================= -->
	<header class="section-header">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteHeader/PmtSiteHeader.jsp"
			flush="false" />
	</header>
	<!-- section-header.// -->
	<!-- ========================= Header END ========================= -->


	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-conten padding-y" style="min-height: 84vh">

		<!-- ============================ COMPONENT LOGIN   ================================= -->
		<div class="card mx-auto" style="max-width: 380px; margin-top: 50px;">
			<div class="card-body">
				<!-- <h4 class="card-title mb-4">Sign in</h4> -->
				<form>
					<div class="img-wrap mb-4">
						<a class="btn-overlay" href="${naver_url}">
						<img
							src="zImage/btnG_naver_complete.png" style="width:100%; height:51.38px;">
						</a>
					</div>
					<div class="img-wrap mb-4">
						<a class="btn-overlay" href="javascript:loginWithKakao()">
						<img
							src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_large_wide.png">
						</a>
					</div>
					<!-- <a href="#" class="btn btn-facebook btn-block mb-2"> <i
						class="fab fa-facebook-f"></i> &nbsp Sign in with Facebook
					</a> <a href="#" class="btn btn-google btn-block mb-4"> <i
						class="fab fa-google"></i> &nbsp Sign in with Google
					</a> -->
					<div class="form-group">
						<input name="" class="form-control" placeholder="Username"
							type="text">
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<input name="" class="form-control" placeholder="Password"
							type="password">
					</div>
					<!-- form-group// -->

					<div class="form-group">
						<a href="#" class="float-right" alt="Forgot ID/Password?">아이디/비밀번호 찾기</a> <label
							class="float-left custom-control custom-checkbox"> <input
							type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label" alt="Remember">자동 로그인</div>
						</label>
					</div>
					<!-- form-group form-check .// -->
					<div class="form-group">
						<a href="/Promoter/Facilitator/pmtFacilitatorLogin.mwav" type="submit" class="btn btn-primary btn-block btn-lg" alt="Sign in">로그인</a>
					</div>

					<div class="form-group">
						<a href="/Promoter/Facilitator/PmtInsertForm.mwav" class="btn btn-block btn-outline-primary btn-lg" alt="Sign up">회원가입</a>
					</div>
					<!-- form-group// -->
				</form>
			</div>
			<!-- card-body.// -->
		</div>
		<!-- card .// -->

		<!-- <p class="text-center mt-4">
			Don't have account? <a href="#">Sign up</a>
		</p> -->
		<br> <br>
		<!-- ============================ COMPONENT LOGIN  END.// ================================= -->


	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->


	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->



</body>
</html>

<script type="text/javascript">	
function loginWithKakao() {
	Kakao.Auth.loginForm({
		success: function(authObj) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {				
					var userData = {
							spNickname: res.properties['nickname'],
							spPromoterId: res.kakao_account['email'],
							spEmail: res.kakao_account['email'],
							isEmailVerified: res.kakao_account['is_email_verified'],
							spProfileImage: res.properties['profile_image'],
							spSnsType: 'Kakao'
					}
					
					$.ajax({
						type: 'POST',
						url: '/promoter/kakaoLogin.mwav',
						data : JSON.stringify(userData),
						contentType : "application/json",
						success: function (data) {
							if (data != null) {
								location.href = "/Promoter/Index.mwav";
							}
						},
						fail: function(error) {
							alert(JSON.stringify(error));
						}
					});
				}
			})
		},

		fail: function(err) {
			alert(JSON.stringify(err))
		},
	})
}
</script>