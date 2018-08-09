<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
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

		<!-- Page Content -->
		<div class="container">

			<!-- Page Heading/Breadcrumbs -->
			<div class="row res_width">
				<div class="col-lg-12">
					<h1 class="page-header">IT Services</h1>
					<ol class="breadcrumb">
						<li><a href="/">Home</a></li>
						<li class="active">IT Services</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->

			<!-- Content Row -->
			<div class="row">

				<!-- Content Column -->
				<div class="col-md-12">
					<div class="enter"></div>
					<div class="col-md-12 col-lg-12 col-sm-12">
						<div id="Consulting Services">
							<h2 class="page-header mwav_leftText">E-Commerce Platform</h2>
						</div>

					</div>
					<hr class="hr_b">
					<div class="col-md-12 col-lg-12 col-sm-12">
						<h3 class="text-center" style="color: #4d90c5;">
							<strong> IT 최적화를 통하여 무한한 비즈니스 가능성을 제공합니다. </strong>
						</h3>
						<br> <br>
						<p>
							Mwav는 온라인 비즈니스 영역 중심에서 <strong>'고객에게는 새로운 가치를 파트너에게는 새로운
								비즈니스'</strong>를 제공할 수 있는 서비스를 만들어가고 있습니다.
						</p>
						<p>
							<img class="center-block img-responsive" alt="E-Commerce Diagram"
								src="/CompanyItem/ITServices/Images/E-Commerce Diagram.png">
						</p>
						<p>
							쇼핑몰 구축부터 분석 그리고 마케팅 까지 지원 가능한 Mwav의 플랫폼은 크게 아래 5개 사이트로 구성되어있습니다.
							<br> <strong>'쇼핑몰 사이트', '관리자 사이트', '프로모터(홍보) 사이트',
								'제조사 및 파트너(협력업체) 사이트', 'OLAP, BI 사이트'</strong>
						</p>
						<div class="enter"></div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="col-xs-12 col-sm-8 col-md-8">
								<h3 class="text-left mgb3" style="color: #78828D;">
									<strong>쇼핑몰 사이트</strong>
								</h3>
								<p>고객 중심적이고 4차 산업 혁명에 맞는 기술 및 철학을 반영하여 판매자와 구입자가 함께 자유롭게
									참여하고 문화를 만들어 갈 수 있는 온라인 마켓 사이트로 구성되어 있습니다.</p>
								<br>

							</div>
							<div
								class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
								<img class="thumbnail img-responsive" alt="쇼핑몰 사이트"
									src="/CompanyItem/ITServices/Images/ITService_2.jpg">
							</div>
						</div>
						<div class="col-md-6">
							<div class="col-xs-12 col-sm-8 col-md-8">
								<h3 class="text-left mgb3" style="color: #78828D;">
									<strong>관리자 사이트</strong>
								</h3>
								<p>온라인 비즈니스를 전체를 분석하고 관리 가능한 사이트입니다. 직급과 직책에 따라 권한이 설정되고,
									신규회원/신규주문/신규게시글에 대한 푸시 알림을 받을 수 있으며 상품/주문/회원/게시판 업무를 PC,
									Mobile에서 운영 및 관리 가능합니다.</p>
								<br>

							</div>
							<div
								class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
								<img class="thumbnail img-responsive" alt="관리자 사이트"
									src="/CompanyItem/ITServices/Images/ITService_4.jpg">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="col-xs-12 col-sm-8 col-md-8">
								<h3 class="text-left mgb3" style="color: #78828D;">
									<strong>제조사 및 공급사 사이트</strong>
								</h3>
								<p>제품을 공급하는 협력사들의 B2B업무를 위한 사이트로서, 상품등록/재고관리/판매관리 등 협력사에서
									효율적인 상품운영 및 관리가 가능합니다.</p>
								<br>
							</div>
							<div
								class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
								<img class="thumbnail img-responsive" alt="제조사 및 파트너 사이트"
									src="/CompanyItem/ITServices/Images/ITService_1.jpg">
							</div>
						</div>
						<div class="col-md-6">
							<div class="col-xs-12 col-sm-8 col-md-8">
								<h3 class="text-left mgb3" style="color: #78828D;">
									<strong>프로모터(홍보) 사이트</strong>
								</h3>
								<p>제품에 대한 외부 홍보를 위한 사이트로서, SNS/블로그/카페 및 기타 커뮤니티 운영자들이 제품에 대한
									프로모션 활동을 위한 프로파일 관리나 활동 통계상황을 실시간으로 확인할 수 있습니다.</p>
								<br>
							</div>
							<div
								class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
								<img class="thumbnail img-responsive" alt="프로모터(홍보) 사이트"
									src="/CompanyItem/ITServices/Images/ITService_5.png">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="col-xs-12 col-sm-8 col-md-8">
								<h3 class="text-left mgb3" style="color: #78828D;">
									<strong>OLAP, BI 사이트</strong>
								</h3>
								<p>축척되는 통계자료를 시각화 솔루션을 통하여 적절한 자료를 제공하고, 이를 통하여 비즈니스의 전략을
									효율적이고 효과적으로 지원가능 합니다.</p>
								<br>
							</div>
							<div
								class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
								<img class="thumbnail img-responsive" alt="OLAP, BI 사이트"
									src="/CompanyItem/ITServices/Images/ITService_3.jpg">
							</div>
						</div>
					</div>
					<div class="enter"></div>
				</div>
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.container -->



	<div class="col-md-12 col-xs-12 col-sm-12 "
		style="background-color: #00547E;">
		<div class="container ">
			<div class="col-md-5 pgtb9">
				<h4 style="color: white;" class="visible-sm visible-xs text-center">
					PC뿐만 아니라 모바일, 태블릿 등 <br> <br> 다양한 디지털 기기의 화면에 맞춰 <br>
					<br> 자동으로 크기가 변하는 반응형 홈페이지<br>
				</h4>
				<h3 style="color: white;" class="hidden-xs hidden-sm">
					PC뿐만 아니라 모바일, 태블릿 등 <br> <br> 다양한 디지털 기기의 화면에 맞춰 <br>
					<br> 자동으로 크기가 변하는 반응형 홈페이지<br>
				</h3>
			</div>
			<div class="col-md-7">
				<img class="center-block img-responsive" alt="E-Commerce Diagram"
					src="/CompanyItem/ITServices/Images/ITService_site.png">
			</div>

		</div>
	</div>

	<div class="container">
		<!-- Content Row -->
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12 text-left">
				<div class="enter"></div>
				<h3 class="mwav_leftText">다양한 기능</h3>
				<hr>
				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>쇼핑몰 완벽 지원</strong>
					</h4>
					<p class="col-md-12 col-sm-12 col-xs-12">회원, 게시판, SNS로그인 등 쇼핑몰에
						필요한 모든 기능을 제공합니다.</p>
					<div class="enter visible-xs visible-sm hidden-md hidden-lg"></div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-cloud-upload fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>안정적인 시스템</strong>
					</h4>

					<p class="col-md-12 col-sm-12 col-xs-12">24시간 모니터링, 클라우드 서비스등을
						통하여 언제나 안정적인 서비스를 제공합니다.</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-retweet fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>디지털 마케팅</strong>
					</h4>

					<p class="col-md-12 col-sm-12 col-xs-12">최적화 된 온라인 광고로 소비자들에게
						제품과 서비스를 알리고 판매될 수 있도록 합니다.</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-lock fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>보안</strong>
					</h4>

					<p class="col-md-12 col-sm-12 col-xs-12">법적 의무사항인 SSL 인증서 발급 뿐만
						아니라 강력한 웹 사이트에 대한 보안을 제공합니다.</p>
				</div>
				<div class="enter col-md-12 col-xs-12 col-sm-12 hidden-md hidden-lg"></div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12 text-left">
				<div class="enter"></div>
				
				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-rss fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>SNS 공유</strong>
					</h4>

					<p class="col-md-12 col-sm-12 col-xs-12">트위터, 페이스북, 구글, 링크드인 ,
						인스타그램 등 다양한 SNS 공유 기능 제공.</p>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-line-chart fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>통계 분석</strong>
					</h4>
					<p class="col-md-12 col-sm-12 col-xs-12">구글, 네이버, Mwav에서 제공하는
						사용자 로그 분석 도구를 통하여 고객의 다양한 행동들을 속속들이 측정하고 분석할 수 있습니다.</p>
					<div class="enter visible-xs visible-sm hidden-md hidden-lg"></div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-search fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>SEO</strong>
					</h4>

					<p class="col-md-12 col-sm-12 col-xs-12">구글, 네이버, 다음 등의 검색 결과의
						상위에 나올 수 있도록 최적화 되어있습니다.</p>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-6 right_hr text-center">
					<i class="fa fa-sign-in fa-4x" aria-hidden="true"></i>
					<h4>
						<strong>소셜 로그인</strong>
					</h4>

					<p class="col-md-12 col-sm-12 col-xs-12">쇼핑몰에 따로 가입하지 않아도 구글,
						페이스북, 트위터, 링크드인 계정으로 로그인할 수 있습니다.</p>
				</div>
				<div class="enter col-md-12 col-xs-12 col-sm-12 hidden-md hidden-lg"></div>
			</div>
		</div>
		<!-- /.row -->


		<!-- Content Row -->
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12 text-left">
				<div class="enter"></div>
				<h3 class="mwav_leftText">글로벌 판매처</h3>
				<hr>

				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>해외 채널 발굴 및 공유</strong>
						</h4>
						<p>Mwav는 고객님들의 상품이 해외 어느 곳에서나 판매 될 수 있도록 자체 플랫폼 외 해외 채널 발굴에도 꾸준히 투자하고 있습니다.
						   그 결과 몇가지 업체와의 제휴를 통하여, 전세계 어느곳에서나 동일 통화로 판매 및 배송될 수 있게 되었습니다.
						   지금 바로 진행해보세요.
						</p>
					</div>
					<div class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<a class="mgt10 btn-lg btn-custom-default btn btn-primary btn-block" target="_blank"
							onClick="ga('send', 'event', 'globalbox', 'click', 'vendor_register'); redirectUrl('https://globalbox.world/register/Vendor/QUFDMDE1OS0xMzgwLVZlbmRvcg==', '_blank'); ">벤더 가입하기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>



	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>

</html>