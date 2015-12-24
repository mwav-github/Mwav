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
					IT Solutions <small>Aervision</small>
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
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="Aervision">Aervision</a>
					<a href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="OpenSRS">OpenSRS</a> <a
						href="/CompanyItem/IT Products/Azure/Azure.jsp"
						class="list-group-item " data-toggle="tooltip"
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
			<div class="col-md-9">
				<!-- Aervision_AerPass -->
				<div class="row">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->

					<div class="text-center">
						<h1 style="color: #990085;">What Is AerPass™?</h1>
						<hr>
					</div>

					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/zImage/AerPass.jpg" data-toggle="tooltip"
							data-placement="top" data-original-title="AerPass">
						<div class="enter"></div>
					</div>
					<div class="col-md-6">
						<strong>AerPass 에어패스</strong> <br>
						<p>에어패스는 세계 최초로 스스로 레벨링을 맞출 수 있는 홍채인식기입니다.</p>
						<p>홍채인식을 끊김없이 자연스럽게 하도록 설계되었습니다.</p>
						<p>즉시 사용 가능한 수 많은 애플리케이션에서 홍채인식을 자연스럽고 쉽게 처리합니다.</p>
						<p>에어패스는 자동화 되어 별도 조작 없이, 출입통제와 대상검열에 바로 적용이 가능한 완제품입니다.</p>
						<p>제품에 대한 브로셔와 자세한 정보는 연락 주시면 상세히 설명드리겠습니다.</p>
					</div>


					<div class="vid col-md-10 col-md-push-1">
						<iframe width="560" height="315"
							src="http://player.vimeo.com/video/117455204" allowfullscreen=""></iframe>

					</div>
				</div>
				<div class="enter"></div>
				<div class="enter"></div>
				<!-- /.row -->


				<!-- Aervision_AerCrowd -->
				<div class="row">
					<div class="text-center">
						<h1 style="color: #990085;">What is AerCrowd™?</h1>
						<hr>
					</div>

					<div class="col-md-12">
						<strong>AerCrowd 에어크라우드 </strong> <br>
						<p>에어크라우드는 군중의 행동을 분석하고 모니터링하는 솔루션입니다. 에어크라우드의 사물 인터넷은 비용이
							저렴하고, 강력하며, 쉽게 설치 및 사용가능합니다. 또한 fault tolerant하고 확장성을 제공합니다.
							에어크라우드에 활용된 최신기술은 생체정보를 표시하는 최소형 전자장치에서 방출한 디지털 신호를 이용합니다. 이 기술이
							적용될 수 있는 다양한 사례 중에 대기시간측정과 참석시간측정은 즉시 적용 가능한 분야입니다.이 제품은
							standalone으로 제공되는 솔루션입니다. OEM 버전에 대한 문의는 메일로 주시기 바랍니다.</p>
						<p class="text-right">
							<A href="mailto:sales@aervision.com" style="color: #990085;">sales@aervision.com</a>
						</p>
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
				<div class="row">
					<div class="text-center">
						<%--아래 a태그 자체에 색 적용시 가능하다. --%>
						<h1>
							<a href="https://www.aercloud.net/>What is AerCloud™?"
								style="color: #990085;">What is AerCloud™?</a>
						</h1>
						<hr>
					</div>

					<div class="col-md-12">
						<strong>AerCloud™ 에어클라우드</strong> <br>
						<p>AerCloud™ 는 최신 기술의 이미지 프로세싱과 기계학습에 관한 API를 제공하는 클라우드 서비스
							입니다. 얼굴추적과 얼굴검색, 보행자 및 차량탐지, 자동차번호판 인식과 같은 멋진 기능들을 여러분 앱에 이질감 없이
							추가된다고 생각해 보세요. 에어클라우드는 이런 작업을 쉽고 무척 저렴한 비용으로 가능하게 합니다. 에어크라우드는
							서비스사용 건에 대한 유료결제 방식이며 웹서비스 형태로 제공됩니다. 물론 저희가 private cloud 형태로
							설치해 드릴 수도 있습니다.비용과 자세한 서비스에 관한 문의는 연락주세요.</p>
						<p class="text-right">
							<A href="mailto:sales@aervision.com" style="color: #990085;">sales@aervision.com</a>
						</p>
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