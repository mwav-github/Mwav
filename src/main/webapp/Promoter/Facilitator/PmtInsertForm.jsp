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
					<h4 class="card-title">Sign up</h4>
				</header>
				<form>
					<div class="form-group">
						<label>Login ID</label> <input type="text" class="form-control"
							placeholder="">
					</div>
					<!-- form-row.// -->
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>Create password</label> <input class="form-control"
								type="password">
						</div>
						<!-- form-group end.// -->
						<div class="form-group col-md-6">
							<label>Repeat password</label> <input class="form-control"
								type="password">
						</div>
						<!-- form-group end.// -->
					</div>
					<!-- form-group end.// -->
					<div class="form-row">
						<div class="col form-group">
							<label>First name</label> <input type="text" class="form-control"
								placeholder="">
						</div>
						<!-- form-group end.// -->
						<div class="col form-group">
							<label>Last name</label> <input type="text" class="form-control"
								placeholder="">
						</div>
						<!-- form-group end.// -->
					</div>
					<!-- form-row end.// -->
					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							placeholder=""> <small class="form-text text-muted">We'll
							never share your email with anyone else.</small>
					</div>
					<!-- form-row end.// -->
					<div class="form-group">
						<label>Cell Phone</label> <input type="text" class="form-control"
							placeholder="">
					</div>
					<!-- form-group end.// -->
					<div class="form-group">
						<label class="custom-control custom-radio custom-control-inline">
							<input class="custom-control-input" checked="" type="radio"
							name="gender" value="option1"> <span
							class="custom-control-label"> Male </span>
						</label> <label class="custom-control custom-radio custom-control-inline">
							<input class="custom-control-input" type="radio" name="gender"
							value="option2"> <span class="custom-control-label">
								Female </span>
						</label>
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<label class="custom-control custom-checkbox"> <input
							type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label">
								BizLogin의 <a href="#">이용약관과 개인정보 취급방침</a>에 동의합니다. (필수)
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
						<button type="submit" class="btn btn-primary btn-block">
							Register</button>
						<p class="alert alert-success">
							<i class="fa fa-envelope-square mt-2"></i> 가입 후 인증 요청 메일이 되며, 30분 이내에 인증을 완료하셔야 최종 회원가입이 완료됩니다.
						</p>
					</div>
					<!-- form-group end.// -->
				</form>
			</article>
			<!-- card-body.// -->
		</div>
		<!-- card .// -->
		<p class="text-center mt-4">
			Have an account? <a href="">Log In</a>
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