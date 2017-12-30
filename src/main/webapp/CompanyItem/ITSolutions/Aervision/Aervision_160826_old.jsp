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

<script>
	$(function() {
		
		var pgurl = window.location.pathname;
		//alert(pgurl);

		$("#left_menu a").each(function() {
			//alert($(this).attr("href"));
			//alert($(this).attr(''));
			if ($(this).attr("href") == pgurl || $(this).attr("href") == '')
				$(this).addClass("active");
		})
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
		<div class="row" id="affix_start">
			<div class="col-lg-12">
				<h1 class="page-header">
					IT Products <small>Aervision</small>
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
				<div class="panel-group">
					<div class="panel list-group" id="left_menu">

						<a class="list-group-item active" data-toggle="collapse"
							data-target="#list_menu">Aervision</a>
						<div id="list_menu" class="collapse">
							<a href="#AerPass" class="list-group-item " data-toggle="tooltip"
								data-placement="top" data-original-title="AerPass"><span
								class="glyphicon glyphicon-chevron-right"></span> AerPass</a> <a
								 href="#AerCrowd"  class="list-group-item "  data-toggle="tooltip"
								data-placement="top" data-original-title="AerCrowd"><span
								class="glyphicon glyphicon-chevron-right"></span> AerCrowd</a>
								<a  href="#AerCloud"
								class="list-group-item "  data-toggle="tooltip"
								data-placement="top" data-original-title="AerCloud"><span
								class="glyphicon glyphicon-chevron-right"></span> AerCloud</a>
								<a href="#AerPalm"
								class="list-group-item "  data-toggle="tooltip"
								data-placement="top" data-original-title="AerPalm"><span
								class="glyphicon glyphicon-chevron-right"></span> AerPalm</a>
						</div>


						<a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.jsp"
							class="list-group-item " data-toggle="tooltip"
							data-placement="top" data-original-title="OpenSRS">OpenSRS</a> <a
							href="/CompanyItem/ITProducts/Azure/Azure.jsp"
							class="list-group-item " data-toggle="tooltip"
							data-placement="top" data-original-title="Azure">Azure</a> <a
							href="/CompanyItem/ITProducts/Windows/Windows.jsp"
							class="list-group-item" data-toggle="tooltip"
							data-placement="top" data-original-title="Windows">Windows</a> <a
							href="/CompanyItem/ITProducts/MSOffice/MSOffice.jsp"
							class="list-group-item" data-toggle="tooltip"
							data-placement="top" data-original-title="MSOffice">MSOffice</a>
						<a href="/CompanyItem/ITProducts/InsWave/InsWave.jsp"
							class="list-group-item " data-toggle="tooltip"
							data-placement="top" data-original-title="InsWave">InsWave</a>
					</div>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9" >
				<!-- Aervision_AerPass -->
				<div class="row" id="AerPass">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->
					<!-- 
					<nav \>
						<ul class="nav nav-pills nav-justified"
							data-spy="affix" >
							<li class="active"><a href="#section1">Section 1</a></li>
							<li><a href="#section2">Section 2</a></li>
							<li><a href="#section3">Section 3</a></li>
						</ul>
					</nav> -->


					<!-- <nav class="navbar nav_indication navbar-inverse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">Basic Topnav</a></li>
							<li><a href="#">Page 1</a></li>
							<li><a href="#">Page 2</a></li>
							<li><a href="#">Page 3</a></li>
						</ul>
					</nav> -->

					<div class="enter" ></div>

					<div class="text-center" >
						<h1 style="color: #990085;">What Is AerPass™?</h1>
						<hr>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6">
						<img class="thumbnail img-responsive text-center"
							alt="Bootstrap template" src="/CompanyItem/zImage/AerPass.jpg"
							data-toggle="tooltip" data-placement="top"
							data-original-title="AerPass">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<strong>AerPass 에어패스</strong> <br>
						<p>에어패스는 세계 최초로 스스로 레벨링을 맞출 수 있는 홍채인식기입니다.</p>
						<p>홍채인식을 끊김없이 자연스럽게 하도록 설계되었습니다.</p>
						<p>즉시 사용 가능한 수 많은 애플리케이션에서 홍채인식을 자연스럽고 쉽게 처리합니다.</p>
						<p>에어패스는 자동화 되어 별도 조작 없이, 출입통제와 대상검열에 바로 적용이 가능한 완제품입니다.</p>
						<p>제품에 대한 브로셔와 자세한 정보는 연락 주시면 상세히 설명드리겠습니다.</p>
						<br />
					</div>


					<div
						class="vid col-xs-push-1 col-xs-10 col-sm-10 col-sm-push-1  col-md-10 col-md-push-1 embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="http://player.vimeo.com/video/117455204"></iframe>

					</div>
				</div>
				<div class="enter"></div>
				<div class="enter"></div>
				<!-- /.row -->


				<!-- Aervision_AerCrowd -->
				<div class="row"  id="AerCrowd">
					<div class="text-center">
						<h1 style="color: #990085;">What is AerCrowd™?</h1>
						<hr>
					</div>

					<div class="col-md-12" >
						<strong>AerCrowd 에어크라우드 </strong> <br>
						<p>에어크라우드는 군중의 행동을 분석하고 모니터링하는 솔루션입니다. 에어크라우드의 사물 인터넷은 비용이
							저렴하고, 강력하며, 쉽게 설치 및 사용가능합니다. 또한 fault tolerant하고 확장성을 제공합니다.
							에어크라우드에 활용된 최신기술은 생체정보를 표시하는 최소형 전자장치에서 방출한 디지털 신호를 이용합니다. 이 기술이
							적용될 수 있는 다양한 사례 중에 대기시간측정과 참석시간측정은 즉시 적용 가능한 분야입니다.이 제품은
							standalone으로 제공되는 솔루션입니다. OEM 버전에 대한 문의는 메일로 주시기 바랍니다.</p>
						<!-- <p class="text-right">
							<A href="mailto:sales@aervision.com" style="color: #990085;">JuSung.kim@mwav.net</a>
						</p> -->
					</div>
					<div class="enter"></div>

					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCrowd01.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="Anywhere" />
					</div>
					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCrowd02.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="Any volume" />
					</div>
					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCrowd03.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="Any crowd" />
					</div>
					<div class="enter"></div>
					<div class="enter"></div>
					<div class="col-md-offset-2 col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCrowd04.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="Easy Integration" />
					</div>
					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCrowd05.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="At your fingertips" />
					</div>
				</div>
				<div class="enter"></div>
				<div class="enter"></div>
				<!-- /.row -->

				<!-- Aervision_AerCloud -->
				<div class="row" id="AerCloud">
					<div class="text-center" >
						<%--아래 a태그 자체에 색 적용시 가능하다. --%>
						<h1 style="color: #990085;">What is AerCloud™?</h1>
						<hr>
					</div>

					<div class="col-md-12">
						<strong>AerCloud™ 에어클라우드</strong> <br>
						<p>AerCloud™ 는 최신 기술의 이미지 프로세싱과 기계학습에 관한 API를 제공하는 클라우드 서비스
							입니다. 얼굴추적과 얼굴검색, 보행자 및 차량탐지, 자동차번호판 인식과 같은 멋진 기능들을 여러분 앱에 이질감 없이
							추가된다고 생각해 보세요. 에어클라우드는 이런 작업을 쉽고 무척 저렴한 비용으로 가능하게 합니다. 에어크라우드는
							서비스사용 건에 대한 유료결제 방식이며 웹서비스 형태로 제공됩니다. 물론 저희가 private cloud 형태로
							설치해 드릴 수도 있습니다.비용과 자세한 서비스에 관한 문의는 연락주세요.</p>
						<!-- 	<p class="text-right">
							<A href="mailto:sales@aervision.com" style="color: #990085;">JuSung.kim@mwav.net</a>
						</p> -->
					</div>
					<div class="enter"></div>

					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCloud_01.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="Instant access" />
					</div>
					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCloud_02.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="On the cloud" />
					</div>
					<div class="col-md-4 col-sm-4 col-xs-6 well">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerCloud_03.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="Powerful tools" />
					</div>
				</div>
				<div class="enter"></div>
				<!-- /.row -->

				<!-- Aervision_AerPalm -->
				<div class="row" id="AerPalm">
					<div class="text-center" >
						<%--아래 a태그 자체에 색 적용시 가능하다. --%>
						<h1 style="color: #990085;">What is AerPalm?</h1>
						<hr>
					</div>

					<div class="col-md-12">
						<strong>AerPalm</strong> <br>
						<p>“AerPalm Wave” 는 최고의 생체정보인식 식별방법입니다. 식별 목적을 위해 후지쯔 사의 손바닥
							정맥 스캐너를 이용하고, 10개 이상의 즉시 적용할 수 있는 애플리케이션과 함께 제공합니다. “AerPalm
							Wave”는 접촉식이 아니며 극도로 정확합니다. 보안카드를 이용할 때처럼 동일한 방법으로 스캐너에 간단히 손을 움직여
							인식시키면 됩니다. 단지 보안카드가 없다는 것이 다른 점입니다.</p>

						<p>이런 최신 기술은 손바닥 정맥을 바탕으로 하는 강력한 인증 솔루션으로 업계를 선도하는 혈관모양 생체정보인식
							기술을 이용합니다. 이것은 고도로 신뢰가능하며, 비간섭적이고 사용이 쉬운 비접촉식 생체정보인식 솔루션을 제공합니다.
							스캐너가 근적외선을 사용하여 사람의 손바닥 정맥모양을 잡고 고유의 생체정보 템플릿을 생성하면 이것을 사전에 등록된
							사용자 손바닥 정맥모양과 대조합니다. 손바닥 정맥 장비는 단지, 혈액이 개인의 정맥 내에서 활동적으로 흐를 때만 그
							형태만 인식할 수 있으며 이것은 가상적인 위조가 불가능하다는 것을 의미합니다. 이 진보된 혈관모양 인지 기술은 고도로
							신뢰할 수 있는 인증수단을 제공합니다. 일반적으로 위조에 대해 이례적으로 높은 방어율이 0.01% 인 것을 감안할
							때, 이 혈관모양 인지 기술은 위조될 가능성이 단지 0.00000008%에 불과합니다. 모든 기능을 작은 크기의
							하드웨어 하나로 제공하고, 인증처리시간을 1/3 초 미만으로 극도로 빠르게 완료합니다.</p>
						<!-- 						<p class="text-right">
							<A href="mailto:sales@aervision.com" style="color: #990085;">JuSung.kim@mwav.net</a>
						</p> -->
					</div>

					<div class="col-md-12 enter">
						<div class="row text-left">
							<div class="col-md-4 col-sm-4 col-xs-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h5>
											높은 안정성 & 성능 <br /> - 혈관이용
										</h5>
									</div>
									<div class="panel-body text-left">
										<ul>
											<li><strong>피하 은닉 - 위조가 어려움</strong></li>
											<li><strong>어떤 개인들과 또는 쌍둥이 사이에도 유일무이</strong></li>
											<li><strong>변화 없음 – 인생을 걸쳐 동일</strong></li>
										</ul>
									</div>
									<!-- <div class="panel-footer">
										<a href="#" class="btn btn-danger ">BUY NOW</a>
									</div> -->
								</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h5>
											높은 정확성 <br /> – 손가락에 대한 손바닥의 비교우위
										</h5>
									</div>
									<div class="panel-body">
										<ul>
											<li><strong>손바닥 정맥모양은 복잡하다. -> 오백만 개의 비교기준</strong></li>
											<li><strong>손바닥은 손가락 보다 굵은 혈관을 가져 인식이 쉽다.</strong></li>


										</ul>
									</div>
									<!-- <div class="panel-footer">
										<a href="#" class="btn btn-danger ">BUY NOW</a>
									</div> -->
								</div>
							</div>

							<div class="col-md-4 col-sm-4 col-xs-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h5>
											높은 수용성 <br>&nbsp;
										</h5>
										<%-- 그냥 br태그로는 엔터 크기가 먹히지 않는다. ~! &nbsp; 로사용. --%>
									</div>
									<div class="panel-body">
										<ul>
											<li><strong>비접촉식 운영으로 매우 위생적</strong></li>
											<li><strong>매우 쉽고 직관적인 사용법</strong></li>
											<li><strong>체내에 은닉된 생체무늬정보</strong></li>
										</ul>
									</div>
									<!-- <div class="panel-footer">
										<a href="#" class="btn btn-danger ">BUY NOW</a>
									</div> -->
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12 enter">
						<p>
							<strong>제품특성:</strong>
						</p>
						<ul>
							<li>진보된 생체정보인식 알고리즘은 극도로 낮은 FAR (false accept rate)과 FRR
								(false reject rate)실현합니다.</li>
							<li>비접촉식 손바닥 정맥 인식방식은 위생적이고 비간섭적 입니다.</li>
							<li>잠재추적기술 비사용.</li>
							<li>템플릿 저장과 엔터프라이즈 수준의 이벤트로깅 기능을 위한 암호화된 저장소</li>
							<li>가상의 정확한 입력으로 빠르고 쉬운 등록작업</li>
						</ul>

						<div class="enter"></div>

						<p>
							<strong>적용사례:</strong>
						</p>
						<p>전형적인 적용 사례는 아래와 같습니다.</p>
						<ul>
							<li>은행업무용 온라인 거래를 위한 인증표시</li>
							<li>물리적 접근통제</li>
							<li>논리적 접근통제 (애플리케이션이나 웹사이트에 로그인)</li>
							<li>소매 POS 시스템</li>
							<li>자체 서비스 키오스크</li>
							<li>출석관리 시스템</li>
							<li>방문자 ID관리</li>
						</ul>

						<p>데모 예약, 프로셔 문의 등 이 제품에 대해서 더 많은 정보를 받아보시려면 연락주세요.</p>

						<div class="enter"></div>
					</div>

					<!-- <div
						class="col-md-push-3 col-md-6 col-sm-push-3 col-sm-6 col-xs-12 ">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerVision_AerPalm_01.PNG" />
					</div>
					<div
						class="col-md-push-1 col-md-10 col-sm-push-1 col-sm-10 col-xs-12 ">
						<img class="img-responsive"
							src="/CompanyItem/zImage/AerVision_AerPalm_02.PNG" />
					</div> -->

				</div>
				<!-- /.row -->

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
