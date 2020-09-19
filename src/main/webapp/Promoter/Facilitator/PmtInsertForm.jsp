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
</head>
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


	<!-- ========================= SECTION ONE ========================= -->
	<!-- 	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">Wish List</h2>
		</div>
		container // 
	</section> -->
	<!-- ========================= SECTION ONE END// ========================= -->

	<!-- ========================= SECTION TWO ========================= -->
	<section class="section-content padding-y">

		<!-- ============================ COMPONENT REGISTER   ================================= -->
		<div class="card mx-auto" style="max-width: 520px; margin-top: 0px;">
			<article class="card-body">
				<header class="mb-4">
					<!-- 					<h4 class="card-title">Sign up</h4>
 -->
				</header>
				<form>
					<div class="form-group">
						<label class="font-weight-bold" alt="Login ID">아이디</label> <input
							type="text" class="form-control"
							placeholder="예)BizLogin12 - 4~20자 사이의 영문,숫자,-_ 만 사용">
					</div>

					<div class="form-group">
						<label class="font-weight-bold" alt="Create password">비밀번호</label>
						<input class="form-control" type="password"
							placeholder="비밀번호를 입력해주세요.">
					</div>

					<div class="form-group ">
						<label class="font-weight-bold" alt="Repeat password">비밀번호
							확인</label> <input class="form-control" type="password"
							placeholder="비밀번호를 한번 더 입력해주세요.">
					</div>

					<div class="form-group">
						<label class="font-weight-bold" alt="Name">이름</label> <input
							class="form-control" type="text" placeholder="이름을 입력해주세요.">
					</div>

					<!-- form-row end.// -->
					<div class="form-group">
						<label class="font-weight-bold" alt="Email">이메일</label> <input
							type="email" class="form-control"
							placeholder="예)BizLogin12@biz.com">
						<!-- <small class="form-text text-muted">We'll
							never share your email with anyone else.</small> -->
					</div>
					<!-- form-row end.// -->
					<div class="form-group">
						<label class="font-weight-bold">휴대폰</label> <input type="text"
							class="form-control" placeholder="숫자만 입력해주세요.">
					</div>
					<!-- form-group end.// -->
					<div class="form-group">
						<label class="font-weight-bold" alt="Gender">성별</label>
						<div class="form-group">
							<label class="custom-control custom-radio custom-control-inline">
								<input class="custom-control-input" checked="" type="radio"
								name="gender" value="option1"> <span
								class="custom-control-label">남자 </span>
							</label> <label class="custom-control custom-radio custom-control-inline">
								<input class="custom-control-input" type="radio" name="gender"
								value="option2"> <span class="custom-control-label">
									여자 </span>
							</label>
						</div>
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<label class="custom-control custom-checkbox"> <input
							type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label">
								BizLogin의 <a href="#" data-toggle="modal"
									data-target="#pmtPolicy">이용약관과 개인정보 취급방침</a>에 동의합니다. (필수)
							</div>
						</label>
					</div>
					<div class="form-group">
						<label class="custom-control custom-checkbox"> <input
							type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label">신규 제품 및 이벤트 알림 SMS/메일 수신
								(선택)</div>
						</label>
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block"
							alt="Register">가입하기</button>
						<p class="alert alert-success mt-3">
							<i class="fa fa-envelope-square mt-2"></i> 가입 후 인증 요청 메일이 되며, 30분
							이내에 인증을 완료하셔야 최종 회원가입이 완료됩니다.
						</p>
					</div>
					<!-- form-group end.// -->
				</form>
			</article>
			<!-- card-body.// -->
		</div>
		<!-- card .// -->
		<p class="text-center mt-4">
			이미 가입하셨나요.? <a href="/Promoter/Facilitator/PmtLogin.mwav">로그인</a>
		</p>
		<br> <br>
		<!-- ============================ COMPONENT REGISTER  END.// ================================= -->

	</section>
	<!-- ========================= SECTION TWO END// ========================= -->



	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->



</body>
</html>