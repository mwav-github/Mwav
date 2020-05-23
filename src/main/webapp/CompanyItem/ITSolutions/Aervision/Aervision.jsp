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
	$(document).ready(function() {
		/* affix the navbar after scroll below header */
		$(".nav_indication").affix({
			offset : {
				top : $("#affix_start").outerHeight(true)
			}
		});
	});
</script>


<style>
.affix {
	top: 0;
	width: 100%;
}

.affix+.container-fluid {
	padding-top: 70px;
}
</style>

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
	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->
	<div class="row">
		<div class="col-lg-12">
			<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
				class="img-responsive res_width fix_height_300"
				alt="Responsive image">
		</div>
	</div>


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row" id="affix_start">
			<div class="col-lg-12">
				<h1 class="page-header">
					IT Solutions <small>Aervision</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Solutions</li>
					<li class="active">Aervision</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CompanyItem/ITProducts/ITProductsLeftMenu.jsp"
					flush="false" />

			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">
				<!-- Aervision_AerPass -->
				<div class="row" id="AerPass">
					<div class="enter"></div>

					<div class="text-center col-md-12">
						<h1 style="color: #9F00C5;">AerPass™ - 빠른 홍채스캔과 안면인식 단위</h1>
						<hr>
					</div>

					<div
						class="col-xs-offset-3 col-xs-5 col-sm-offset-0 col-sm-3 col-md-offset-0 col-md-3">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template" src="/CompanyItem/zImage/aerpass02.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="AerPass">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-9 col-md-9 text-color-gray">
						<h4>
							<strong>AerPass 에어패스</strong>
						</h4>
						<br>
						<p>AerPass는 세계에서 최초 자체 높이 조절이 가능하고, 비접촉식이며 플러그엔 플레이를 지원하는 홍채
							스캐너이자, 안면캡처 플랫폼입니다.</p>
						<p>AerPass는 홍채스캐닝에서 모든 작업을 자동으로 처리하여 사용자의 수고로움을 제거하였습니다.</p>
						<p>AerVision의 특허 솔루션은 홍채를 감지하고 로봇 팔을 제어하여 스캐너를 사용자의 홍채와 일치시켜
							완벽한 홍채 스캔을 훌륭히 이뤄냅니다. 스캔 과정은 몇 초 내에 일어나고, 고속 처리능력으로 홍채 액세스와 등록이
							즉시 가능합니다.</p>
						<p>유동인구가 많은 공항, 기업건물 및 안전시설과 같은 지역에서 AerPass의 도입으로 출입 접근제어와
							탑승객 검열이 쉽고 빠르며 신뢰할 수 있게 됩니다. 실제로 AerPass의 인식 오류는 2~3조 분의 1입니다!!
							더구나1초 내에 수행을 기준으로 할 때 입니다.</p>
						<br>
						<p>
							<strong>AerPass는 다음과 같은 작업에 이상적입니다.</strong>
						</p>
						<ul>
							<li>국경지역 통제</li>
							<li>공항 보안에 있어 신속한 조사</li>
							<li>신속한 항공 탑승</li>
							<li>첨단 보안 건물에 대한 안전하고 믿을 수 있는 접근통제</li>
							<li>이벤트에 대한 접근</li>
							<li>수술실과 같은 위생환경 내에 접근통제</li>
						</ul>
						<br>
						<p class="text-right" style="color: #9F00C5;">
							<a href="/CompanyItem/ITSolutions/Aervision/aerpass_spec.pdf"
								target="blank"><span class="glyphicon glyphicon-save"
								aria-hidden="true"></span>AerPass 기술 스펙 다운로드</a>
						</p>
					</div>


					<%-- <div
						class="vid col-xs-push-1 col-xs-10 col-sm-10 col-sm-push-1  col-md-10 col-md-push-1 embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="http://player.vimeo.com/video/117455204"></iframe>

					</div>--%>
				</div>
				<div class="enter hidden-xs"></div>
				<div class="enter"></div>

				<!-- /.row -->


				<!-- Aervision_AerCrowd -->
				<div class="row" id="AerCrowd">
					<div class="text-center col-md-12">
						<h1 style="color: #9F00C5;">What is AerCrowd™?</h1>
						<hr>
					</div>


					<div
						class="col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-12 ">
						<img class="img-responsive"
							src="/CompanyItem/zImage/aercrowd00.jpg" data-toggle="tooltip"
							data-placement="middle" data-original-title="AerCrowd technology">

						<div class="enter"></div>

					</div>
					<div class="col-md-12 text-color-gray">

						<h4>
							<strong>AerCrowd 에어크라우드 </strong>
						</h4>
						<br>
						<p>AerCrowd는 분주한 도시지역, 공항, 철도 역, 쇼핑센터, 스포츠 경기장, 고속도로와 같은 유동인구
							밀집 지역에서의 대중 행동 패턴에 대한 전례 없는 인사이트를 제공해 줍니다.</p>
						<p>AerCrowd는 비용 대비 효과가 크고, 시스템 장애에 강하며, 설치와 사용이 쉽고, 실시간 트래픽
							데이터 수집에 확장성이 뛰어난 수십 가지의 최신기술을 활용합니다. AerCrowd는 비즈니스 인텔리전스를 위해
							사용되는 실시간 점유시간, 대기시간, 체류시간과 같은 통계와 리포트를 생성합니다.</p>
						<br>
						<p>
							<strong>AerCrowd는 다음과 같은 작업에 이상적입니다.</strong>
						</p>
						<ul>
							<li>인파 및 고객 유동에 대한 실시간 모니터링</li>
							<li>공항 보안에 있어 신속한 조사</li>
							<li>모든 규모의 실시간 이동시간 리포팅</li>
							<li>실시간 대기시간 리포팅 - KPIs와 SLAs에 연계된 즉각적인 시각화.</li>
							<li>소매점에서의 전환율 측정</li>
						</ul>
						<div class="enter"></div>

					</div>




					<div class="text-center col-md-12 text-color-gray">

						<h3>
							<strong>AerCrowd Scanner</strong>
						</h3>
						<div class="enter"></div>
					</div>
					

					<div class="col-xs-push-2 col-xs-8 col-md-push-8 col-md-4">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template"
							src="/CompanyItem/zImage/aercrowd_scanner.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="AerCrowd Scanner">


					</div>
					<div class="col-xs-12 col-md-pull-4 col-md-8 text-color-gray">

						<p>AerCrowd는 분주한 도시지역, 공항, 철도 역, 쇼핑센터, 스포츠 경기장, 고속도로와 같은 유동인구
							밀집 지역에서의 대중 행동 패턴에 대한 전례 없는 인사이트를 제공해 줍니다.</p>
						<p>AerCrowd 스캐너는 내장 Wifi나 블루투스 기능이 있는 어떠한 이동형 장치도 감지할 수 있습니다.
							모바일 장치는 특정 Wifi 액세스 포인트에 연결되거나 또 다른 장치와 페어링을 하지 않아도 감지할 수 있습니다.</p>
						<p>AerCrowd는 분주한 도시지역, 공항, 철도 역, 쇼핑센터, 스포츠 경기장, 고속도로와 같은 유동인구
							밀집 지역에서의 대중 행동 패턴에 대한 전례 없는 인사이트를 제공해 줍니다.</p>
						<p>이것은 AerCrowd 스캐너의 통신 가능 영역으로 들어 오는 어떠한 스마트폰, 노트북, 핸즈프리 장치도
							감지할 수 있다는 것을 의미입니다.</p>
						<p>따라서 AerCrowd 스캐너는 특정 시간과 장소에 상주하는 사람과 차량의 수를 측정할 수 있습니다.</p>
						<div class="enter hidden-xs"></div>
						<div class="enter"></div>
					</div>


					<!-- /.row -->
				</div>


				<!-- /.row -->

				<!-- Aervision_AerPalm -->
				<div class="row" id="AerPalm">

					<div class="text-center">

						<h1 style="color: #9F00C5;">AerPalm – 손 바닥 생체정보 인증과 출입통제 장치</h1>
						<hr>
					</div>

					<div
						class="col-xs-offset-2 col-xs-8 col-sm-offset-0 col-sm-4 col-md-offset-0 col-md-4">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template" src="/CompanyItem/zImage/aerpalm.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="AerPalm">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-8 col-md-8 text-color-gray">
						<h4>
							<strong>AerPalm <a
								href="/CompanyItem/ITSolutions/Aervision/Aervision_before.mwav#AerPalm"
								class="btn btn-default btn-sm" data-toggle="tooltip"
								data-placement="right" data-original-title="자세히보기."
								target="_blank"><span
									class="glyphicon glyphicon glyphicon-search"></span></a></strong>
						</h4>
						<br>
						<p>손 바닥 정맥 생체정보 센서 기술인 AerPalm은 비접촉식이며 극도로 정확합니다. 보안카드를 이용할
							때처럼 동일한 방법으로 스캐너에 간단히 손을 움직여 인식시키면 됩니다. 단지 보안카드가 없다는 것이 다른 점입니다.</p>

						<p>
							<strong>주요특징:</strong>
						</p>
						<ul>
							<li>진보된 생체정보인식 알고리즘은 극도로 낮은 FAR (false accept rate)과 FRR
								(false reject rate)을 실현합니다.</li>
							<li>비접촉식 손바닥 정맥 인식방식은 위생적이고 비간섭적 입니다. - 잠재추적기술 비사용.</li>
							<li>가상의 정확한 입력으로 빠르고 쉬운 등록작업</li>

						</ul>

						<div class="enter"></div>

						<p>
							<strong>AerPalm 는 다음과 같은 작업에 이상적입니다.</strong>
						</p>

						<ul>
							<li>유지보수 비용이 없는, 기업 수준의 물리적 출입 통제</li>
							<li>빠르고 쉬운 출결 관리</li>
							<li>방문객 관리</li>

						</ul>

						<p>데모 예약, 프로셔 문의 등 이 제품에 대해서 더 많은 정보를 받아보시려면 연락주세요.</p>

						<p class="text-right" style="color: #9F00C5;">
							<a href="/CompanyItem/ITSolutions/Aervision/aerpalm_spec.pdf"
								target="blank"><span class="glyphicon glyphicon-save"
								aria-hidden="true"></span>AerPalm 기술 스펙 다운로드</a>
						</p>
						<div class="enter"></div>
						<div class="enter"></div>
					</div>
				</div>
				<!-- /.row -->

				<!-- Aervision_AerID -->
				<div class="row" id="AerID">
					<div class="text-center">

						<h1 style="color: #9F00C5;">AerID™ - 기업용 생체 정보 API</h1>
						<hr>
					</div>

					<div
						class="col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-12 ">
						<img class="img-responsive"
							src="/CompanyItem/zImage/aerid_family.jpg" data-toggle="tooltip"
							data-placement="middle"
							data-original-title="AerID family scanners">
						<div class="enter"></div>
					</div>
					<div class="col-md-12 text-color-gray">
						<h4>
							<strong>AerID 에어아이디 </strong>
						</h4>
						<br>
						<p>AerID는 생체정보를 이용한 최고의 신원 인증 방식입니다. 가장 새롭고 진보적인 신원 인증 기술로의
							소프트웨어 통합 게이트웨이입니다. AerID는 손 바닥 정맥과 홍채를 포함한 진보된 접근 통제 기술의 확장적
							라이브러리 운용을 위해서 통합적이지만 간단하고 쉬운 RESTful API를 제공합니다. 우리의 고된 연구 통해서
							귀사의 소프트웨어에 생체정보 액세스를 가능하도록 간단한 C# 코드를 제공할 것입니다.</p>

						<br>
						<p>
							<strong>주요 특징:</strong>
						</p>
						<ul>
							<li>생체 정보 센서와 끊김 없는 연결</li>
							<li>백오피스와 신속한 통합</li>
							<li>명료한 동기화</li>

						</ul>
						<p>또한 AerVision는 세계적으로 잘 알려진 생체 정보 하드웨어 회사들과 파트너 관계입니다. 우리는 생체
							정보 인증 솔루션의 기획부터 배포와 통합까지 프로젝트 전반에 걸쳐 귀사를 도울 수 있습니다.</p>
						<div class="enter"></div>

					</div>




				</div>

				<!-- Aervision_AerGate -->
				<div class="row" id="AerGate">
					<div class="enter hidden-xs"></div>
					<div class="enter"></div>
					<div class="text-center">

						<h2 style="color: #9F00C5;">AerGate – 손바닥 정맥 측정을 통한 Plug and
							play 접근통제키트</h2>
						<hr>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template" src="/CompanyItem/zImage/aergate.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="AerGate">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6 text-color-gray">
						<h4>
							<strong>AerGate</strong>
						</h4>
						<br>
						<p>AerGate는 손바닥 정맥을 측정하여 고도로 신뢰가능하지만, 비용 대비 효과가 탁월하고 사용하기 쉬운
							접근 통제 시스템입니다. AerGate 시스템은 하나의 패키지 안에 필요한 모든 구성요소를 제공하여, 기존 출입문
							컨트롤러와 접근제어 시스템에 쉽게 통합될 수 있도록 설계되었습니다.</p>
						<p>AerGate 시스템과 설비되는 출입문 수에 제한이 없으며, 실제로 다양한 건물의 다수의 문들이 하나의
							중앙센터에서 관리될 수 있습니다.</p>
						<p>
							<strong>AerGate 는 다음에 이상적입니다.</strong>
						</p>
						<ul>
							<li>가정과 소기업체</li>
							<li>데이터 센터</li>
							<li>보안 캐비닛 접근제어 (총기, 약품 및 기타.)</li>
						</ul>

						<p class="text-right" style="color: #9F00C5;">
							<a href="/CompanyItem/ITSolutions/Aervision/aergate_spec.pdf"
								target="blank"><span class="glyphicon glyphicon-save"
								aria-hidden="true"></span>AerGate 기술 스펙 다운로드</a>
						</p>
						<div class="enter hidden-xs"></div>

					</div>
				</div>
				<!-- /.row -->

				<!-- Aervision_IDMatch -->
				<div class="row" id="IDMatch">
					<div class="enter"></div>
					<div class="enter"></div>
					<div class="text-center">

						<h2 style="color: #9F00C5;">IDMatch – 손 바닥 생체 인증과 접근통제</h2>
						<hr>
					</div>

					<div
						class="col-xs-offset-2 col-xs-8 col-sm-offset-0 col-sm-4 col-md-offset-0 col-md-4">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template" src="/CompanyItem/zImage/idmatch.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="IDMatch">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-8 col-md-8 text-color-gray">
						<h4>
							<strong>IDMatch</strong>
						</h4>
						<br>
						<p>IDMatch는 귀사의 보안 솔루션이 무엇이던 간에 (접근, 데이터, 결제정보 보호 관련 등) 새로운
							차원으로 확장해 드립니다.</p>
						<p>IDMatch는 최대의 보안을 제공하고 개인정보정책을 준수 하에 개인 스마트카드에 저장되어 있는 생체정보
							템플릿과 고유의 손바닥 정맥 스캔을 매칭합니다. 해당 장비의 이용은 매우 직관적이고, 위생적이며, 또한 쉽습니다.
							장비의 맞춤형 소프트웨어 프레임워크를 통해 실질적으로 제한 없이 귀사의 업무요구사항을 충족시켜 적용할 수 있습니다.</p>
						<br>
						<p>
							<strong>IDMatch 는 다음에 이상적입니다. </strong>
						</p>
						<ul>
							<li>무현금 결제 및 은행업무</li>
							<li>헬스 및 피트니스 센터</li>
							<li>헬스케어 (의료기록 접근제어)</li>
							<li>로열티(충성도) 프로그램</li>
							<li>클럽 멤버십</li>
						</ul>
						<br>

						<p class="text-right" style="color: #9F00C5;">
							<a href="/CompanyItem/ITSolutions/Aervision/idmatch_spec.pdf"
								target="blank"><span class="glyphicon glyphicon-save"
								aria-hidden="true"></span>IDMatch 기술 스펙 다운로드</a>
						</p>
						<div class="enter"></div>
						<div class="enter"></div>
					</div>

				</div>
				<!-- /.row -->

				<!-- Aervision_IDMatch -->
				<div class="row" id="eyeLock">

					<div class="text-center">

						<h2 style="color: #9F00C5;">eyeLock – 진보된 홍채 인증 기술</h2>
						<hr>
					</div>

					<div
						class="col-xs-offset-2 col-xs-8 col-sm-offset-0 col-sm-4 col-md-offset-0 col-md-4">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template"
							src="/CompanyItem/zImage/eyelock_nano_nxt.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="eyeLock iris scanner">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-8 col-md-8 text-color-gray">
						<h4>
							<strong>eyelock</strong>
						</h4>
						<br>
						<p>EyeLock은 접근통제 기술의 미래를 실현합니다.</p>
						<p>EyeLock은 DNA 다음으로 가장 정확한 생체정보 인증 솔루션입니다. 기존 접근통제 및 건물관리 그리고
							출결 시스템에 쉽게 통합될 수 있습니다. 또한 3rd Party 카드 리더나 모바일폰 어플리케이션을 이용하여 이중
							인증 방식을 지원합니다.</p>

						<br>

						<p class="text-right" style="color: #9F00C5;">
							<a
								href="/CompanyItem/ITSolutions/Aervision/eyelock_nano_nxt_spec.pdf"
								target="blank"><span class="glyphicon glyphicon-save"
								aria-hidden="true"></span>eyelock 기술 스펙 다운로드</a>
						</p>
						<div class="enter hidden-xs"></div>
						<div class="enter"></div>
					</div>

				</div>
				<!-- /.row -->

				<!-- Aervision_services -->
				<div class="row" id="Services">
					<div class="text-center">

						<h1 style="color: #9F00C5;">서비스</h1>
						<hr>
					</div>

					<div class="col-md-12 text-color-gray">

						<p>AerVision 기술팀은 고도로 숙련된 소프트웨어 및 하드웨어 기술자 그룹에 의해 운영됩니다.</p>

						<br>


						<h5>
							<strong>접근방법</strong>
						</h5>
						AerVision 애자일 팀은 고객요구 분석부터 신뢰도 높은 고품질 턴키 솔루션까지 만료일 준수 하에 모든 프로젝트
						주기를 관리합니다.<br>


						<h5>
							<strong>기술 스택</strong>
						</h5>
						AerVision 이 사용하는 기술 스택은 미래를 보증하고, 비용 대비 효율이 좋으며 유연합니다. 자사의 솔루션은
						윈도우나 리눅스 PC, ARM 기반의 컴퓨터, 임베이디드 시스템 및 모바일 장치에 배포가 가능합니다. <br>


						<h5>
							<strong>평판</strong>
						</h5>
						우리는 제공하는 기술의 완벽함과 용이한 사용을 추구합니다. 세계에서 가장 도전적인 기술적 이슈를 해결하는 우리의 방식은
						고객과 프로젝트 진행을 최신의 방법으로 활발히 참여하고, 또한 우수한 품질과 사후 지원을 통해 할당된 예산으로 최상의
						솔루션을 보장하는 것입니다.<br>

						<div class="enter"></div>
					</div>


					<div class="col-md-12 col-sm-12 col-xs-12">
						<img class="img-responsive"
							src="/CompanyItem/zImage/technology_stack.jpg"
							data-toggle="tooltip" data-placement="middle"
							data-original-title="Services">
					</div>
				</div>

				<!-- Aervision_AboutUs -->
				<div class="row" id="AboutUs">
					<div class="enter hidden-xs"></div>
					<div class="enter"></div>
					<div class="text-center">

						<h1 style="color: #9F00C5;">AerVision 소개</h1>
						<hr>
					</div>

					<div class="col-md-12 text-color-gray">
						<h5>
							<strong>배경</strong>
						</h5>
						AerVision 은 실무에 적용할 수 있는 세계 수준의 생체측정기술과 컴퓨터영상 및 기계학습 솔루션을 개발하는 시드니
						지역 기반의 기술 스타트업 입니다. 2명의 최고 생체정보 및 컴퓨터영상 과학자와 기술 기업가에 의해서 2013년 1월에
						창립된 이후, AerVision은 확실한 사업실적을 기록하고 있습니다. 우리의 대상 고객은 정부와 기업체를 전부를
						아우릅니다. <br>


						<h5>
							<strong>기술</strong>
						</h5>
						AerVisoin 특허 기술은 극도로 높은 정확도의 초고속 생체정보 기술엔진부터 정밀 로봇 공학과 열 이미지 처리
						기술에 이르고 있습니다. AerVisoin 제품 군은 보안, 생체정보기술, 비즈니스 인텔리전트, 건강상태 모니터링,
						비디오 감시 및 과학적 범죄수사 애플리케이션을 대상으로 하고 있습니다. 진보된 병렬 컴퓨팅 (GPU)과 내장형 시스템을
						이용한 AerVision의 실시간 비디오 분석은 해당 비즈니스 영역에서 패러다임의 변화를 가져 올 것입니다. <br>


						<h5>
							<strong>혁신</strong>
						</h5>
						AerVision 팀은 생체정보기술, 컴퓨터 영상 및 기계 학습에 대하여, 강력한 고성능 소프트웨어 및 시스템
						개발기술로 강화된 깊은 지식과 전문성을 가지고, 실질적인 제품과 솔루션을 성공적으로 구축합니다. <br>
						AerVision 팀은 맞춤형 생체정보기술과 실시간 군중 분석 및 보안/감시 솔루션을 개발하기 위해 크고 작은 기업체와
						협업하여 개별적인 각각의 요구사항을 충족시켜 배포해 드립니다. <br>
						<div class="enter"></div>
						<h3 class="text-left">
							<strong>Clients</strong>
						</h3>
						<div class="col-md-12 col-sm-12 col-xs-12 ">
							<img class="img-responsive" src="/CompanyItem/zImage/clients.jpg"
								data-toggle="tooltip" data-placement="middle"
								data-original-title="Clients and Customers">
							<div class="enter"></div>
						</div>

						<h3 class="text-left">
							<strong>Industry partners</strong>
						</h3>
						<div class="col-md-12 col-sm-12 col-xs-12 ">
							<img class="img-responsive"
								src="/CompanyItem/zImage/partners.jpg" data-toggle="tooltip"
								data-placement="middle" data-original-title="Industry Partners">
							<div class="enter"></div>
						</div>
						<div class="enter"></div>
					</div>

				</div>


			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>

</html>
