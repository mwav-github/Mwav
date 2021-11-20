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
	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">My account</h2>
		</div>
		<!-- container //  -->
	</section>
	<!-- ========================= SECTION ONE END// ========================= -->

	<!-- ========================= SECTION TWO ========================= -->
	<section class="section-content padding-y">
		<div class="container">

			<div class="row">
				<aside class="col-md-3">
					<ul class="list-group">
						<a class="list-group-item active" href="#"> 회원 정보 </a>
						<a class="list-group-item" href="#"> 켐페인 성과 </a>
						<a class="list-group-item" href="#"> 비밀번호 변경 </a>
						<a class="list-group-item" href="#"> 환급 받기 </a>
						<a class="list-group-item" href="#"> 친구 초대 </a>
						<a class="list-group-item" href="#"> 도움말 및 자주 묻는 질문 </a>
					</ul>
				</aside>



				<div class="card col-md-9">
					<div class="col-md-12">

						<article class="card-group text-center">
							<figure class="card bg">
								<div class="p-4">
									<h4 class="card-title">환급 가능</h4>
									<span>38,000원</span>
								</div>
							</figure>
							<figure class="card bg">
								<div class="p-4">
									<h4 class="card-title">승인 대기</h4>
									<span>5,000원</span>
								</div>
							</figure>
							<figure class="card bg">
								<div class="p-4">
									<h4 class="card-title">환급 완료</h4>
									<span>10,000원</span>
								</div>
							</figure>
							<!-- <figure class="card bg">
								<div class="p-3">
									<h4 class="card-title">50</h4>
									<span>Delivered items</span>
								</div>
							</figure> -->
						</article>
						<br />


						<div class="row">
							<div class="col-md-12">
								<br />
								<h4>
									<strong>회원 정보 - </strong><span class="badge badge-success">이메일
										인증완료</span> <span class="badge badge-secondary">이메일 인증 미완료</span>
								</h4>
								<hr>
								<br />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<form>
									<div class="form-group row">
										<label for="username" class="col-4 col-form-label">아이디</label>
										<div class="col-8">
											<input id="userid" name="userid" placeholder="아이디"
												class="form-control here" required="required" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="select" class="col-4 col-form-label">이메일 <span
											class="text-danger"><strong>*</strong></span></label>
										<div class="col-8">
											<input type="email" class="form-control" placeholder="이메일">
											<small class="form-text text-muted">We'll never share
												your email with anyone else.</small>
										</div>
									</div>
									<div class="form-group row">
										<label for="gender" class="col-4 col-form-label">성별</label>
										<div class="col-8">
											<label
												class="custom-control custom-radio custom-control-inline">
												<input class="custom-control-input" checked="" type="radio"
												name="gender" value="option1"> <span
												class="custom-control-label"> Male </span>
											</label> <label
												class="custom-control custom-radio custom-control-inline">
												<input class="custom-control-input" type="radio"
												name="gender" value="option2"> <span
												class="custom-control-label"> Female </span>
											</label>
										</div>
									</div>
									<div class="form-group row">
										<label for="name" class="col-4 col-form-label">이름</label>
										<div class="col-8">
											<input id="name" name="name" placeholder="이름"
												class="form-control here" type="text">
										</div>
									</div>
									<!-- 휴대폰 번호 선택 가능하도록 SelectBox 형태로 고민 -->
									<div class="form-group row">
										<label for="text" class="col-4 col-form-label">전화번호</label>
										<div class="col-8">
											<input id="text" name="text" placeholder="휴대폰 번호"
												class="form-control here" required="required" type="text">
										</div>
									</div>

									<div class="form-group row">
										<label for="address" class="col-4 col-form-label">주소</label>
										<div class="col-8">
											<input id="address" name="address" placeholder="주소"
												class="form-control here" required="required" type="text">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="postcode" class="col-4 col-form-label">우편번호</label>
										<div class="col-8">
											<input id="postcode" name="postcode" placeholder="우편번호"
												class="form-control here" required="required" type="text">
										</div>
									</div>

									<div class="form-group row">
										<div class="offset-4 col-8">
											<button name="submit" type="submit"
												class="btn btn-primary btn-md btn-block">회원정보 수정하기</button>
										</div>
									</div>
								</form>
							</div>


							<div class="col-md-12">
								<br />
								<hr>
								<h4>
									<strong>환급 계좌번호</strong>
								</h4>
								<br>
								<!-- SelectBox 형태로 고민 - Toss check(은행코드) -->
								<div class="form-group row">
									<label for="bankname" class="col-4 col-form-label">은행명</label>
									<div class="col-8">
										<input id="bankname" name="bankname" placeholder="은행이름"
											class="form-control here" type="text">
									</div>
								</div>

								<div class="form-group row">
									<label for="account holder" class="col-4 col-form-label">예금주</label>
									<div class="col-8">
										<div class="btn-group">
											<input id="accountholder" name="accountholder" placeholder="예금주"
												class="form-control here" type="text">

											<button type="button"
												class="ml-3 btn btn-secondary btn-block">예금주 조회</button>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<label for="text" class="col-4 col-form-label">계좌번호</label>
									<div class="col-8">
										<input id="accountnumber" name="accountnumber" placeholder="계좌번호"
											class="form-control here" required="required" type="text">
									</div>
								</div>
							</div>


							<div class="col-md-12">
								<br />
								<hr>
								<h4>
									<strong>SNS 계정 연결관리</strong>
								</h4>
								<br>
								<div class="table-responsive">
									<table class="table table-hover text-center">
										<thead class="thead-light">
											<tr>
												<th scope="col">SNS 구분</th>
												<th scope="col">연결 계정</th>
												<th scope="col">연결 일자</th>
												<th scope="col">연결 설정</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><img
													src="https://image.rocketpunch.com/company/5466/naver_logo.png?s=400x400&t=inside"
													class="img-xs border"></td>
												<td>
													<p>mymg99@naver.com</p>
												</td>
												<td><p>2021.10.28</p></td>
												<td><a href="#" class="btn btn-outline-primary btn-sm">연결
														하기</a> <a href="#" class="btn btn-light btn-sm">연결 해제</a></td>
											</tr>
											<tr>
												<td><img
													src="https://blog.kakaocdn.net/dn/Sq4OD/btqzlkr13eD/dYwFnscXEA6YIOHckdPDDk/img.jpg"
													class="img-xs border"></td>
												<td>
													<p>mymg99@naver.com</p>
												</td>
												<td><p>2021.10.28</p></td>
												<td><a href="#" class="btn btn-outline-primary btn-sm">연결
														하기</a> <a href="#" class="btn btn-light btn-sm">연결 해제</a></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- container .//  -->
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