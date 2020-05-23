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
		<!-- Image Container container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<img src="/CompanyItem/ITProducts/Images/vanillaNAV_mall.jpg"
				class="img-responsive res_width fix_height_300"
				alt="vanillaNAV_mall">
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
					IT Products <small>vanillaNAV</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Products</li>
					<li class="active">vanillaNAV</li>
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
			<!-- Content Column -->
			<div class="col-md-9">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="enter"></div>

					<div id="features" class="row">
						<div class="row">
							<div class="col-md-3">
								<img class="img-responsive img-hover center-block"
									src="/CompanyItem/ITProducts/Images/vanillaNAV_marker.png"
									alt="vanillaNAV_marker">

							</div>
							<div class="col-md-9">
								<div class="text-left">
									<h4 class="pull-left" style="color: #e67525;">
										<strong>정확하고 신뢰성 높은 실내 위치추적 기술</strong>
									</h4>
									<p class="pull-left">vanillaNAV의 실내 위치추적 시스템은 복잡한 블루투스 비콘
										이나 WiFi 인프라망이 필요하지 않습니다. 자사의 시스템은 광학 내비게이션 마커를 통해 간단히 동작합니다.
										작은 QR코드인 마커를 바닥이나 벽에 붙이면 센티미터 수준의 정확하고 신뢰할 수 있는 실내 위치 추적이
										가능합니다.</p>

								</div>
							</div>
						</div>

						<div class="enter"></div>
						<div class="row">
							<div class="col-md-3">
								<img class="img-responsive img-hover center-block"
									src="/CompanyItem/ITProducts/Images/vanillaNAV_mac.png"
									alt="vanillaNAV_mac">

							</div>
							<div class="col-md-9">
								<div class="text-left">
									<h4 class="pull-left" style="color: #e67525;">
										<strong>간단하고 사용이 쉬운 vanillaNAV 매니저</strong>
									</h4>
									<p class="pull-left">웹 백엔드 형태의 기술로, 전 세계에 위치해 있는 여러분의 장소를
										365일 관리할 수 있습니다. vanillaNAV 매니저를 내비게이션의 목적지를 정의하고, 그에 대한 경로를
										설정하며 추가 정보를 제공하는 데 이용해 보세요.</p>
									<p class="small pull-left" style="color: #e67525;">vanillaNAV
										실내 내비게이션을 목적지 10개까지 무료로 사용해 보세요.</p>
									<%-- <p class="pull-left"><a href="" class="btn btn-xs btn-warning">Android</a></p> --%>
								</div>
							</div>
						</div>
						<div class="enter"></div>
						<div class="row">
							<div class="col-md-3">
								<img class="img-responsive img-hover center-block"
									src="/CompanyItem/ITProducts/Images/vanillaNAV_hand.png"
									alt="vanillaNAV_mac">

							</div>
							<div class="col-md-9">
								<div class="text-left">
									<h4 class="pull-left" style="color: #e67525;">
										<strong>vanillaNAV 애플리케이션을 통한 편리한 경로 안내</strong>
									</h4>
									<p class="pull-left">내비게이션 목적지는 목적지 목록이나 통합 검색기능을 통해 선택할 수
										있습니다. 경로 안내가 시작되면, vanillaNAV 애플리케이션은 바닥이나 벽에 위치되어 있는 내비게이션
										마커를 감지하고 증강현실 방식으로 내비게이션 화살표를 통해 층간 및 실외 지역을 가로지르는 내비게이션 경로를
										직관적으로 제공해 줍니다.</p>
									<p class="small pull-left" style="color: #e67525;">vanillaNAV
										애플리케이션은 구글 플레이 스토어 및 애플 앱 스토어에서 무료로 다운로드 가능합니다.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="row pgtb7" style="background-color: #e67525;">
						<div class="col-xs-12 col-sm-12 col-md-12" style="color: #eee;">
							<div class="row">
								<div class="col-md-6">
									<h4>
										<strong>빠르고 쉬우며, 효율적인 비용으로 통합 운영</strong>
									</h4>
									<ul>
										<li>WiFi 핫스팟이나 블루투스 비콘과 같이 추가적인 하드웨어나 인프라가 필요하지 않음</li>
										<li>유지보수 비용이 없음</li>
										<li>최초 및 재 측정이 필요하지 않음</li>
										<li>별도로 지도 제작이 필요 없음 – 기존의 평면도를 사용할 수 있음</li>
									</ul>
								</div>
								<div class="col-md-6">
									<h4>
										<strong>위치 기반 서비스</strong>
									</h4>
									<ul>
										<li>전시회/컨퍼런스에서의 강연/이벤트 정보제공</li>
										<li>제품/기사에 대한 추가 정보제공</li>
										<li>방문과 조회가 가장 많은 장소표시</li>
										<ul>
											<li>전시 업체의 강조</li>
											<li>매장 내 기사</li>
											<li>전시회 정보</li>
											<li>게이트에서 출발시간</li>
										</ul>
									</ul>
								</div>
							</div>
							<div class="enter"></div>
							<div class="row">
								<div class="col-md-6">
									<h4>
										<strong>기능보증: vanillaNAV 실내 내비게이션 시스템은 모든 건물에서의 동작을 보장합니다!</strong>
									</h4>
									<ul>
										<li>층 간, 엘리베이터, 에스컬레이터, 계단 및 야외 구역에서 작동합니다.</li>
										<li>센티미터 수준의 실내 위치 추적을 통한 정확한 내비게이션 구현</li>
										<li>원하는 목적지의 최적 경로로 귀사의 방문객을 안내합니다.</li>
									</ul>
								</div>
								<div class="col-md-6">
									<h4>
										<strong>위치서비스에 대한 흥미로운 방문경험</strong>
									</h4>
									<ul>
										<li>증강 현실 방식의 내비게이션 화살표가 안내하는 편안한 경로 탐색 방식</li>
										<li>vanillaNAV 앱의 뛰어난 유용성</li>
										<li>목적지 탐색 기능 : 건물 내 목적지에 대한 빠른 검색 및 찾기</li>
									</ul>
								</div>
							</div>
							<div class="enter"></div>
							<div class="row">
								<div class="col-md-6">
									<h4>
										<strong>모바일 마케팅 & 위치 기반 광고</strong>
									</h4>
									<ul>
										<li>할인 매장 정보</li>
										<li>특별 행사 정보</li>
										<li>신제품 광고</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="enter"></div>

						<div
							class="vid col-xs-push-1 col-xs-10 col-sm-10 col-sm-push-1  col-md-10 col-md-push-1 embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item"
								src="https://www.youtube.com/embed/7BlD57bknbQ"></iframe>

						</div>

						<div class="col-xs-12 col-sm-12 col-md-12">
							<h3 class="text-center" style="color: #e67525;">귀사의 실내 내비게이션 시스템을 위한 쉬운 3단계 과정</h3>
						</div>


						<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="enter"></div>
							<div class="col-md-4">
								<h4>장소 정의</h4>
								<ul>
									<li>우선 장소에 대한 평면도 준비하세요.</li>
									<li>탐색 목적지 및 모바일 마케팅 정보를 입력하세요.</li>
									<li>내비게이션 마커의 위치를 지정하세요.</li>
								</ul>
							</div>
							<div class="col-md-4">
								<h4>내비게이션 마커 인쇄</h4>
								<ul>
									<li>정의된 내비게이션 마커를 저장하세요.</li>
									<li>접착이 가능한 인쇄지에 직접 네비게이션 마커를 출력하거나</li>
									<li>또는 자사의 인쇄서비스 이용하세요.</li>
								</ul>
							</div>
							<div class="col-md-4">
								<h4>내비게이션 마커 배치하기</h4>
								<ul>
									<li>해당 장소로 이동하세요.</li>
									<li>평면도에 정의된 대로 내비게이션 마커를 배치하세요.</li>
								</ul>
							</div>

						</div>
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