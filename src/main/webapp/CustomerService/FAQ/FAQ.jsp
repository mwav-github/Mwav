<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->

<script>
	$(document)
			.ready(
					function() {
						$('.collapse')
								.on(
										'show.bs.collapse',
										function() {
											var id = $(this).attr('id');
											$('a[href="#' + id + '"]').closest(
													'.panel-heading').addClass(
													'active-faq');
											$('a[href="#' + id + '"]  span')
													.html(
															'<i class="glyphicon glyphicon-minus"></i>');
										});
						$('.collapse')
								.on(
										'hide.bs.collapse',
										function() {
											var id = $(this).attr('id');
											$('a[href="#' + id + '"]').closest(
													'.panel-heading')
													.removeClass('active-faq');
											$('a[href="#' + id + '"]  span')
													.html(
															'<i class="glyphicon glyphicon-plus"></i>');
										});
					});
</script>
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
					Customer Service <small> FAQ</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Customer Service</li>
					<li class="active">FAQ</li>
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

				<div class="enter"></div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1 ">
						<!-- Nav tabs category -->
						<ul class="nav nav-pills nav-justified faq-cat-tabs">
							<li role="presentation" class="active"><a href="#faq-cat-1"
								data-toggle="tab"><h4>가입/탈퇴</h4></a></li>
							<li role="presentation"><a href="#faq-cat-2"
								data-toggle="tab"><h4>정보확인/수정</h4></a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content faq-cat-content ">
							<div class="tab-pane active in fade" id="faq-cat-1">
								<div class="panel-group" id="accordion-cat-1">
									<div class="panel panel-default panel-faq">
										<div class="panel-heading font_color_faq">
											<h5>
												<!-- <h5 class="panel-title"> -->
												<a data-toggle="collapse" data-parent="#accordion-cat-1"
													href="#faq-cat-1-sub-1"><strong>Mwav 사이트 회원가입은
														어떻게하나요.?</strong><span class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span> </a>
											</h5>
										</div>
										<div id="faq-cat-1-sub-1" class="panel-collapse collapse">
											<div class="panel-body">
												<small> ▶ 간편회원가입 방법 <br /> ① Mwav 사이트 우측 상단 [회원가입]을
													클릭합니다. <br /> ② 필수 및 선택 약관 동의 <br /> ③ 사용자 정보 입력 후 가입하기
													버튼 클릭 <br />
												</small> <br /> <small> ▶ SNS회원가입 방법 <br /> ① 로그인화면에서 사용하는
													SNS 아이콘을 클릭한다.<br /> ② SNS 로그인 진행시, 정상적으로 Mwav 회원가입 완료.<br />
												</small> <br /> <small> ▶ 유의사항 <br />① 한번 사용한 비밀번호는 재사용이
													불가능합니다. ② 공백은 비밀번호로 사용 불가능합니다. ③ 숫자, 영문, 특수문자 중 1개만 사용한
													비밀번호는 사용 불가능합니다. ④ ID, 주민번호, 생일, 전화번호 등의 개인정보로 이루어진 비밀번호는
													사용 불가능합니다. ⑤ 동일한 문자 또는 숫자를 많이 포함한 경우 사용 불가능합니다.
												</small>
											</div>
										</div>
									</div>
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-1"
													href="#faq-cat-1-sub-2"><strong>재가입이 안된다고 하는데
														이유가 무엇인가요?</strong><span class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span> </a>
											</h5>
										</div>
										<div id="faq-cat-1-sub-2" class="panel-collapse collapse">
											<div class="panel-body">

												<small> 법령 위반 등의 이유로 계약을 해지 당하신 경우라면 재가입이 안 되실 수도
													있습니다. <br> 먼저, Mwav문의 게시판을 통하여, 문의하여 주시기 바라며 거래중지 사유
													등을 기재하여 보내주시면 자체 심사 후, 재가입 가능 여부를 결정하여 처리하여 드리겠습니다. <br>
													<br>Mwav은 다음과 같은 사유가 발생하거나 확인된 경우 이용계약을 해지할 수 있습니다. <br />①
													다른 이용자의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령 또는 공서양속에 위배되는
													행위를 한 경우 <br /> ② 회사가 제공하는 Mwav 서비스의 원활한 진행을 방해하는 행위를 하거나
													시도한 경우 <br /> ③ 제7조 제5항의 승낙거부사유가 있음이 확인된 경우 <br />④ 기타
													회사가 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 인정할 경우 또한, 회원 탈퇴 후
													재가입은 7일 후부터 가능하며, 기존 아이디로는 재가입이 불가합니다.
												</small>
											</div>
										</div>

									</div>
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-1"
													href="#faq-cat-1-sub-3"><strong>회원가입시 이미 가입되어
														있는 정보입니다. 라고 나옵니다.</strong><span class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span> </a>
											</h5>
										</div>
										<div id="faq-cat-1-sub-3" class="panel-collapse collapse">
											<div class="panel-body">

												<small> 회원가입 시 [이미 가입되어 있는 정보입니다.] 라고 나오는 경우 이전에
													회원가입 하신 사실을 잊으셨거나 제휴사이트를 통해 가입하신 경우가 많습니다. <br />이 경우 <a
													href="/MasterPage.jsp?mode=SMbrLogin#IDPWSeek">아이디 찾기
														또는 비밀번호 찾기</a> 메뉴를 통하여 고객님의 정보를 확인하실 수 있습니다. 만약 확인이 되지 않으시는
													경우, 문의게시판으로 자세한 정보 입력 후 질의부탁드립니다.
												</small>
											</div>
										</div>

									</div>

									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-1"
													href="#faq-cat-1-sub-4"><strong>회원탈퇴 후, 재가입이
														가능한가요?</strong><span class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span> </a>
											</h5>
										</div>
										<div id="faq-cat-1-sub-4" class="panel-collapse collapse">
											<div class="panel-body">

												<small> 회원탈퇴를 하시면 해당 아이디는 즉시 탈퇴 처리되며, 이후 영구적으로 사용이
													중지되므로 새로운 아이디로만 재가입이 가능합니다. <br /> 회원 탈퇴 후 재가입은 3개월 후부터
													가능합니다. 또한, 법령 위반 등의 이유로 계약을 해지 당하신 경우라면 Mwav 자체 심사 후, 회원
													재가입 여부를 결정하게 되어 있습니다. <br />
												</small> <small> Mwav 다음과 같은 사유가 발생하거나 확인된 경우 이용계약을 해지할 수
													있습니다.<br> ① 다른 이용자의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국
													법령 또는 공서양속에 위배되는 행위를 한 경우 <br />② 회사가 제공하는 Mwav 서비스의 원활한
													진행을 방해하는 행위를 하거나 시도한 경우 ③ 기타 회사가 합리적인 판단에 기하여 서비스의 제공을 거부할
													필요가 있다고 인정할 경우
												</small>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="faq-cat-2">
								<div class="panel-group" id="accordion-cat-2">
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-2"
													href="#faq-cat-2-sub-1"><strong>개인정보수정은 어디에서
														가능한가요?</strong><span class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span> </a>
											</h5>
										</div>
										<div id="faq-cat-2-sub-1" class="panel-collapse collapse">
											<div class="panel-body">
												<small>Mwav 로그인 후 메인 페이지 우측 상단의 > 나의정보 페이지에서 개인정보를
													수정하실 수 있습니다.<br /> 개인정보 수정방법 이미지 아이디를 제외한 모든 정보의 수정이 가능하며
													이름 변경을 원하시는 경우 고객님께서 본인인증를 거치신 후 직접 변경하실 수 있습니다. <br />아이디
													변경을 원하시는 고객님께서는 탈퇴 후 다시 가입하셔야 하며 그 경우 고객님의 기존 정보 등은 이전이
													불가하오니 이점 참고하시어 진행하여 주시기 바랍니다.
												</small>
											</div>
										</div>
									</div>
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-2"
													href="#faq-cat-2-sub-2"><strong>개명을 하여 회원정보의
														이름을 변경하고 싶어요.</strong><span class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span> </a>
											</h5>
										</div>
										<div id="faq-cat-2-sub-2" class="panel-collapse collapse">
											<div class="panel-body">회원명 변경 시 Mwav 홈페이지에서 쉽게 변경하실 수
												있습니다. 나의 정보 페이지에서 [이름변경] 버튼을 클릭하여 인터넷 실명등록 절차를 거치신 후 수정해주시면
												됩니다.</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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