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
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
					class="img-responsive res_width fix_height_300"
					alt="Responsive image">
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
					IT Products <small>Azure(MS)</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CompanyItem</li>
					<li class="active">IT Products</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CompanyItem/IT Products/Aervision/Aervision.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="Aervision">Aervision</a> <a
						href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="OpenSRS">OpenSRS</a> <a
						href="/CompanyItem/IT Products/Azure/Azure.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="Azure">Azure</a>
						<a
						href="/CompanyItem/IT Products/Windows/Windows.jsp"
						class="list-group-item" data-toggle="tooltip"
						data-placement="top" data-original-title="Windows">Windows</a>
						<a
						href="/CompanyItem/IT Products/MSOffice/MSOffice.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="OpenSRS">MSOffice</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="mgtl3 col-md-8 ">


				<!-- 1_Azure -->
				<div class="row">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->
					<%-- block 요소 끼리 중앙정렬 중요. vertical_parent / vertical_child--%>
					<div class="row vertical_parent"
						style="color: #fff; background: url(../Images/what-is-azure.jpg) no-repeat; background-size: 100% auto; height: 300px;">
						<div class="vertical_child">
							<h3 class="align_center">앱 프레임워크 플랫폼 반갑습니다.</h3>
							<h4 class="mgt5">Microsoft Azure는 분석, 컴퓨팅, 데이터베이스, 모바일,
								네트워킹, 저장소 및 웹이 통합된 클라우드 서비스의 모음입니다. 이를 통해 작동이 더 빨라지고 더 많은 성과를 거둘
								수 있으며 비용을 절감할 수 있습니다. Azure에서 수행할 수 있는 작업은 다음과 같습니다.</h4>
						</div>
						<br />
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">

				<!-- 2_Azure -->
				<div class="row">
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>더 많은 작업 수행</strong>
						</h3>
						<p>개발자 또는 IT 전문가는 Azure로 생산성을 높일 수 있습니다. 통합 도구, 미리 작성된 템플릿 및
							관리 서비스를 사용하는 경우 자신이 이미 보유하거나 알고 있는 기술을 활용하여 엔터프라이즈, 모바일, 웹 및
							IoT(사물 인터넷) 앱을 더 쉽고 빠르게 빌드하고 관리할 수 있습니다. Microsoft는 Gartner의
							Magic Quadrants에서 클라우드 Infrastructure as a Service, 응용 프로그램
							Platform as a Service 및 클라우드 저장소 서비스 부문 선두업체로 2년 연속 선정된 유일한
							공급업체이기도 합니다.</p>
						<br />
						<p>
							Gartner의 Magic Quadrant에서
							<code class="text-primary">클라우드 Infrastructure as a
								Service, 클라우드 저장소 서비스 및 엔터프라이즈 응용 프로그램 Platform as a Service를 참조</code>
							하f세요.
						</p>
					</div>
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/01-get-more-done.png">
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">
				<!-- 3_Azure -->
				<div class="row">
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/02-open.png">
					</div>
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>유연한 개방형 플랫폼 사용</strong>
						</h3>
						<p>
							Azure는 다양한 운영 체제, 프로그래밍 언어, 프레임워크, 도구, 데이터베이스 및 장치를 지원합니다. Linux
							컨테이너를 Docker 통합과 함께 실행하고, JavaScript, Python, .NET, PHP, Java 및
							Node.js로 앱을 빌드하고, iOS, Android 및 Windows 장치용 백 엔드를 구축할 수 있습니다.
							Azure는 수백만의 개발자 및 IT 전문가가 이미 믿고 사용하고 있는 동일한 수준의 기술을
							<code class="text-primary">지원</code>
							합니다.
						</p>
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">
				<!-- 4_Azure -->
				<div class="row">
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>기존 IT 확장</strong>
						</h3>
						<p>
							일부 클라우드 공급자의 제품은 데이터 센터와 클라우드 중에서 선택해야 합니다. Azure는 이러한 방식의 공급자와는
							달리, 안전한 개인 연결, 하이브리드 데이터베이스 및 저장소 솔루션, 데이터 상주 및 암호화 기능이 포함된 가장 큰
							네트워크를 통해 기존 IT 환경과 쉽게 통합됩니다. 따라서 필요한 위치에 자산을 유지할 수 있습니다.
							<code class="text-primary">Azure Stack</code>
							이 있으면 자체 데이터 센터에서도 Azure를 실행할 수 있습니다. Azure 하이브리드 클라우드 솔루션은 두 분야
							모두에서 최고의 성과를 자랑하며 더 많은 IT 옵션을 제공하고 복잡성과 비용을 낮춥니다.
						</p>
					</div>
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/03-existing.png">
					</div>

				</div>

				<div class="enter"></div>

				<hr class="hr_b">

				<!-- 5_Azure -->
				<div class="row">
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/04-pay.png">
					</div>
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>필요에 따라 확장하고 사용한 만큼 지불 </strong>
						</h3>
						<p>
							Azure의 종량제 서비스는 수요에 맞춰 신속하게 확장하거나 축소할 수 있으므로 사용한 만큼만 지불하면 됩니다.
							계산, 저장소, 대역폭 등 자주 사용하는 인프라 서비스에 대해 경쟁업체 가격과 동일하도록
							<code class="text-primary">보장</code>
							하고 분당 청구 기능도 제공하므로 항상 성능 대비 가장 저렴한 요금이 청구됩니다.
						</p>
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">

				<!-- 6_Azure -->
				<div class="row">
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>데이터 보호</strong>
						</h3>
						<p>
							Microsoft는 일부 조직이 여전히 클라우드에 대해 조심스러워하고 있다는 점을 알고 있습니다. Microsoft가
							사용자의 데이터 보호 및 개인 정보 보호에 대해 업계 선도적인 노력을 기울이고 있는 것도 바로 이러한 이유입니다.
							Microsoft는 유럽 연합 데이터 보호 당국으로부터 엄격한 EU 개인 정보 보호법을 제대로 준수하고 있다고
							인정받은 최초의 클라우드 공급자입니다. Microsoft는 새로운 국제 클라우드 개인 정보 보호 표준인 ISO
							27018을 채택한 최초의 주요 클라우드 공급자이기도 합니다. 그뿐만 아니라 미국 공공 기관의 엄격한 규정 준수
							요구를 충족하도록 설계된 독립형 Azure 버전인
							<code class="text-primary">Azure Government</code>
							도 출시했습니다.
						</p>
					</div>
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/05-protect.png">
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">

				<!-- 7_Azure -->
				<div class="row">
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/06-everywhere.png">
					</div>
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>어디서든 앱 실행</strong>
						</h3>
						<p>
							Azure는 22개 지역에 대해 하나의
							<code class="text-primary">전 세계 Microsoft 관리 데이터 센터 네트워크</code>
							로 운영되며, 이는 Amazon Web Services 및 Google 클라우드를 합친 것보다 더 많은 국가 및
							지역에서 운영되고 있는 것입니다. 이처럼 빠른 성장세에 힘입어 응용 프로그램을 실행하고 뛰어난 고객 성능을 보장하는
							다양한 옵션을 제공하고 있습니다. Azure는 중국 본토에서 최초의 다국적 클라우드 공급자이기도 합니다.
						</p>
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">

				<!-- 8_Azure -->
				<div class="row">
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>더 현명한 결정 내리기</strong>
						</h3>
						<p>기계 학습, Cortana Analytics 및 스트림 분석과 같은 Azure의 예측 분석 서비스는
							비즈니스 인텔리전스를 좀 더 구체적으로 조정합니다. 더 나은 결정을 내리고, 고객 서비스를 향상시키고, 구조적,
							비구조적, 스트리밍 사물 인터넷 데이터에서 새로운 비즈니스의 가능성을 실현해 보세요.</p>
					</div>
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/07-smarter.png">
					</div>
				</div>

				<div class="enter"></div>

				<hr class="hr_b">
				<!-- 9_Azure -->
				<div class="row">
					<div class="col-md-4">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/08-trusted.png">
					</div>
					<div class="col-md-8">
						<h3 class="text-left mgb3" style="color: #78828D;">
							<strong>신뢰할 수 있는 클라우드 사용 </strong>
						</h3>
						<p>
							Azure는 소규모의 개발자 테스트 프로젝트부터 세계적인 제품 출시에 이르기까지 다양한 작업을 처리하도록
							설계되었습니다.
							<code class="text-primary">포춘지 선정 500대 기업 중 57%</code>
							이상의 기업이 Azure를 사용하고 있습니다. Azure는 서비스에 대해 엔터프라이즈급 SLA를 제공하고, 연중무휴
							기술 지원 및 24시간 연속 운영되는 서비스 상태 모니터링을 제공하고 있습니다. 고객으로는 Skanska,
							Heineken, 3M, Dyson, Paul Smith, Mazda, GE Healthcare, Trek,
							McKesson, Milliman, Towers Watson, NBC Sports, TVB를 비롯한 다양한 기업이
							있습니다.
						</p>
					</div>
				</div>
				<div class="enter"></div>

				<hr class="hr_b">
				<div class="enter"></div>

				<div class="row">
					<p>
						올림픽 방송부터 대규모 멀티플레이어 온라인 게임 개발에 이르기까지, Azure를 사용하는 고객은
						<code class="text-primary">늘 놀라운 성과를 이루고 있습니다.</code>
						아래에서 더 많은 성과를 확인해 보세요.
					</p>
					<h3 class="text-left mgb3" style="color: #78828D;">
						<strong>현대적인 플랫폼 간 웹/모바일 응용 프로그램 빌드 및 배포</strong>
					</h3>
					<p class="mgb3">고객 예)</p>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/skanska_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/heineken_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/3m_s.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/real_s.png" />
					</div>
				</div>
				<div class="enter"></div>

				<div class="row">
					<h3 class="text-left mgb3" style="color: #78828D;">
						<strong>클라우드에서 데이터 저장, 백업 및 복구</strong>
					</h3>
					<p class="mgb3">고객 예)</p>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/paul-smith_s.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/mazda_s.png" />
					</div>
				</div>
				<div class="enter"></div>

				<div class="row">
					<h3 class="text-left mgb3" style="color: #78828D;">
						<strong>Azure에서 엔터프라이즈 응용 프로그램 실행</strong>
					</h3>
					<p class="mgb3">고객 예)</p>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/ge-healthcare_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/trek_m.png" />
					</div>
				</div>
				<div class="enter"></div>

				<div class="row">
					<h3 class="text-left mgb3" style="color: #78828D;">
						<strong>대규모 컴퓨팅 작업 실행 및 강력한 예측 분석 수행</strong>
					</h3>
					<p class="mgb3">고객 예)</p>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/milliman_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/towers-watson_m.png" />
					</div>
				</div>
				<div class="enter"></div>

				<div class="row">
					<h3 class="text-left mgb3" style="color: #78828D;">
						<strong>대규모 오디오 및 비디오 인코딩, 저장, 스트리밍</strong>
					</h3>
					<p class="mgb3">고객 예)</p>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/nbc-sports_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/tvb_m.png" />
					</div>
				</div>
				<div class="enter"></div>

				<div class="row">
					<h3 class="text-left mgb3" style="color: #78828D;">
						<strong>사물 인터넷 서비스를 활용하는 지능형 제품 및 서비스 구축</strong>
					</h3>
					<p class="mgb3">고객 예)</p>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/thyssenkrupp_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/lido_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/rockwell-automation_m.png" />
					</div>
					<div class="col-md-2 col-sm-2 col-xs-3">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/slac_m.png" />
					</div>
				</div>


			</div>
		</div>
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