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
	</div>
	<div class="row">
		<div class="col-lg-12">
			<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
				class="img-responsive res_width fix_height_300"
				alt="Responsive image">
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
					IT Products <small>FusionCharts</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Products</li>
					<li class="active">FusionCharts</li>
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
				<div class="row">
					<!-- <div class="text-Left">
						<h2>
							&nbsp;&nbsp;<strong>Overview</strong>
						</h2>
					</div> -->
					<div class="enter"></div>

				</div>


				<!-- 2_OrgChart -->
				<div class="row" style="background-color: #f5f5f575;">

					<div
						class="col-xs-12 col-sm-7 col-sm-push-5 col-md-5 col-md-push-7">
						<h3>
							<strong>FusionCharts Suite XT는 USP (Unique Selling
								Point) 중 하나로 사용할 수 있으며 매우 즐거운 경험을 여러분께 제공합니다. </strong>
						</h3>
						<p>FusionCharts Suite XT는 흥미로운 애니메이션 효과, 스마트한 디자인, 풍부한 대화형 기능
							등 업계 최고의 JavaScript 차트를 제공합니다. 더 많은 매출을 올리거나 조직에서 응용 애플리케이션을 채택할
							수 있도록 제품에 최적화되고 아름다운 대시 보드를 제공합니다.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-5 col-sm-offset-0 col-sm-pull-7 col-md-7 col-md-offset-0 col-md-pull-5">
						<img class="img-responsive" alt="drop-screenshot"
							src="/CompanyItem/ITProducts/FusionCharts/Images/drop-screenshot.png">
					</div>

				</div>

				<!-- 3_OrgChart -->
				<div class="row pgtb7">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<h3>
							<strong>모든기기, 브라우저 및 플랫폼에 적용할 수 있는 유연한 호환성을 제공합니다.</strong>
						</h3>
						<p>FusionCharts Suite XT는 PC, Mac, iPad, iPhones 또는 Android
							기기를 포함한 모든 기기에서 동일한 경험을 제공합니다. 또한 대부분 솔루션이 지원하지 않지만 세계의 5 % 이상이
							여전히 사용하는 IE 6, 7 및 8을 포함한 모든 웹 및 모바일 응용 프로그램, 특히 기업 자체 환경에서도
							동작합니다. (출처 : w3schools)</p>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<img class="img-responsive"
							alt="Unified Experience Accross Browsers_Image"
							src="/CompanyItem/ITProducts/FusionCharts/Images/Unified Experience Accross Browsers_Image.png">
					</div>

				</div>



				<!-- 5_OrgChart -->
				<div class="row pgtb7" style="background-color: #f5f5f575;">
					<div class="col-xs-12 col-sm-5 col-md-5">
						<h3>
							<strong>아름다운 디자인과 효율성</strong>
						</h3>
						<p>FusionCharts Suite XT는 빠르고 효율적입니다. 첫 번째 차트를 생성하는데 15분이라는 시간
							밖에 소요되지 않습니다. 또한 무제한 드릴다운, 차트 내보내기, 대화형 범례와 같은 고급 보고기능 내장되어있으므로
							회사 내 개발팀에서는 단 몇시간 안에 차트를 완성 할 수 있습니다.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-7 col-sm-offset-0 col-md-7 col-md-offset-0">
						<img class="img-responsive " alt="easy-15mins"
							src="/CompanyItem/ITProducts/FusionCharts/Images/easy-15mins.png">
					</div>

				</div>


				<div class="row pgtb7">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<strong>순수 자바스크립트만으로 구성</strong>
						</h3>
						<br>
						<p>광범위한 JavaScript API를 갖춘 FusionCharts Suite XT는 다른 라이브러리 및 웹
							프레임 워크와의 긴밀한 통합을위한 이벤트 및 메소드를 제공합니다. 차트 작성 프로세스의 각 단계를 완벽하게 제어 할
							수 있으며, 엔터프라이즈 응용 프로그램을 위한 가장 진보 된 대시 보드를 구축 할 수 있습니다.</p>
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<img class="img-responsive center-block" alt="pure-javascript"
							src="/CompanyItem/ITProducts/FusionCharts/Images/pure-javascript-.png">
					</div>

				</div>

				<div class="row pgtb7" style="background-color: #f5f5f575;">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<strong>광범위한 문서, 즉시 사용할 수 있는 대시보드 및 맞춤형 기술지원을 통한 구현 주기를
								더욱 단축 할 수 있습니다. </strong>
						</h3>
						<br>
						<p>FusionCharts Suite XT에는 모든 고급기능에 대한 완전한 API 및 특성정의, 통합예제 및
							모든 고급 기능에 대하여 구체적인 설명서가 함께 제공됩니다. 대시보드에서는 실제 비즈니스 사용사례를 시뮬레이션하여
							최고의 비즈니스 인사이트를 얻을 수 있습니다. 또한 질문이있는 경우 타사 포럼을 통해 정보를 찾을 필요가 없이 기술
							지원 팀에 문의하여 24 시간 이내에 답변을 얻으실 수 있습니다.</p>
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="col-md-4 col-sm-4 col-xs-12">
							<img class="img-responsive center-block"
								src="/CompanyItem/ITProducts/FusionCharts/Images/features-documention.png"
								alt="features-documention">
							<p class="text-center">광범위한 문서</p>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<img class="img-responsive center-block"
								src="/CompanyItem/ITProducts/FusionCharts/Images/features-dashboards.png"
								alt="features-dashboards">
							<p class="text-center">바로 사용할 수 있는 대시보드</p>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<img class="img-responsive center-block"
								src="/CompanyItem/ITProducts/FusionCharts/Images/features-tech-support.png"
								alt="features-tech-support">
						ㄴ	<p class="text-center">맞춤형 기술 지원</p>
						</div>

					</div>

				</div>



				<div class="row pgtb7">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<strong>업계에서 가장 포괄적인 차트 솔루션.</strong>
						</h3>
						<br>
						<p>많은 회사에서 사용 중인 차트 솔루션이 고급 구성을 지원하지 않기 때문에 기본 차트만을 사용하여 표현하는
							경우가 많습니다. 그러나 잘못된 차트 유형은 잘못된 분석으로 이어지며 이는 잘못된 비즈니스 의사결정으로 이어집니다.
							FusionCharts Suite XT는 기본 차트에서부터 Funnel 차트, 히트 맵, 확대 / 축소 선, 다중 축
							및 Treemap 차트에 이르기까지 90 가지 이상의 차트와 그래프를 제공합니다. 그렇기 때문에 언제나 적절한
							유형으로 차트로 표현 할 수 있으며 이는 항상 올바른 비즈니스 방향을 제시합니다</p>
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<img class="img-responsive center-block"
							alt="comprehensive-charts"
							src="/CompanyItem/ITProducts/FusionCharts/Images/comprehensive-charts.png">
					</div>

				</div>

				<div class="row pgtb7" style="background-color: #f5f5f575;">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<strong>27,000 고객들. 700,000 개발자들. 118 나라들. 데이터 시각화 경험
								10년.</strong>
						</h3>
						<br>
						<p>데이터 시각화 솔루션 관련하여, 1인 기업에서부터 Fortune 500 대 기업, 정부 기관, 세계 유수의
							은행, 조직 및 사람들에 이르기까지 세계는 데이터 시각화에 관해서 FusionCharts를 신뢰합니다.</p>
						<p>우리는 2002 년에 대화 형 차트 작성 방식을 개척했으며 오늘날에는 데이터 시각화만을 구현하고 연구하는
							60여개의 팀을 보유하고 있습니다. 데이터 시각화는 우리가 하는 많은 일 중 하나가 아니라, 우리가 하고 관심을 갖는
							것은 유일한 것입니다.</p>
						<P>만약 귀사에서 데이터 시각화 요구 사항에 맞게 FusionCharts Suite XT의 선택에 대해 절대로
							후회하지 않을 것입니다.</P>
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<img class="img-responsive center-block" alt="customers-logos"
							src="/CompanyItem/ITProducts/FusionCharts/Images/customers-logos.png">
					</div>

				</div>
				<div class="row">
					<div class="enter"></div>
					<div class="enter"></div>
					<div class="text-Left" id="fusionchart_features_position">
						<h2>
							&nbsp;&nbsp;<strong>특징들</strong>
						</h2>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<p>FusionCharts Suite XT에는 모든 차트의 미적 및 동작을 완벽하게 제어 할 수있는 강력한
							기능이 포함되어 있습니다. 또한 각 차트의 JavaScript API는 클라이언트 측 데이터 업데이트, 개별 매개
							변수 업데이트, 차트를 이미지 또는 PDF로 내보내기, 다중 레벨 드릴 다운과 같은 훨씬 더 많은 기능을 제공합니다.</p>
						<p>이 섹션을 통해 각 기능을 개별적으로 확인하고 기본 코드를 확인하며 구현 모범 사례를 익힐 수 있습니다.
							이에 대한 자세한 내용을 보려면 아래에서 해당하는 기능을 참조하십시오.</p>
						<div class="enter"></div>
					</div>
				</div>

				<div class="row">

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/linkedcharts-for-easy-drilldown.png"
									alt="linkedcharts-for-easy-drilldown"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>LinkedCharts for Easy Drill-Down</strong>
								</p>
								<h5>Create unlimited levels of drill-down in minutes using
									a single data source with LinkedCharts, a first-of-its-type
									concept</h5>
							</div>
						</div>
					</div>
					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/exporting-as-imagespdf.png"
									alt="exporting-as-imagespdf"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Exporting as Images/PDF</strong>
								</p>
								<h5>Enable your users to export the charts as JPEG, PNG and
									PDF images for use in emails and PPTs</h5>
							</div>
						</div>
					</div>
					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/interactive-zooming-and-scrolling.png"
									alt="interactive-zooming-and-scrolling"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Interactive Zooming & Scrolling</strong>
								</p>
								<h5>Plot huge quantities of data like stock quote
									comparison for a decade with the highly interactive zoom and
									scroll charts</h5>
							</div>
						</div>
					</div>

					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/intelligent-label-management.png"
									alt="intelligent-label-management"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Intelligent Label Management</strong>
								</p>
								<h5>The chart selects the best fit for your labels
									automatically, or you can select from the 4 modes available to
									you</h5>
							</div>
						</div>
					</div>
					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/realtime-charts-and-gauges.png"
									alt="realtime-charts-and-gauges"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Real-time Charts and Gauges</strong>
								</p>
								<h5>Create stock, manufacturing and network monitoring apps
									with charts that can automatically update themselves</h5>
							</div>
						</div>
					</div>
					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/interactive-legend.png"
									alt="interactive-legend"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Interactive Legend</strong>
								</p>
								<h5>Enable your users to analyze only the data series they
									want to by hiding the other data series using the legend</h5>
							</div>
						</div>
					</div>
					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/informative-tooltips.png"
									alt="informative-tooltips"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Informative Tooltips</strong>
								</p>
								<h5>Make your chart information-rich yet clutter-free by
									delegating detailed information to tooltips</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/formatted-numbers.png"
									alt="formatted-numbers"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Formatted Numbers</strong>
								</p>
								<h5>Add number suffixes and prefixes, control the decimal
									accuracy and define your own number scales</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/highlighting-data-points.png"
									alt="highlighting-data-points"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Highlight Data Points </strong>
								</p>
								<h5>Make data sets stand out from the rest by adding a
									dashed border, changing their color and more</h5>
							</div>
						</div>
					</div>
					<!--/col-->



					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/editable-gauges.png"
									alt="editable-gauges"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Visually Editable Gauges</strong>
								</p>
								<h5>Take inputs from your users in surveys and polls, and
									submit to the server for further processing</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/glass-effect-on-chart.png"
									alt="glass-effect-on-chart"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Glass Effect on Chart</strong>
								</p>
								<h5>Make your column charts look great with the
									one-of-its-type glass effect</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/multi-lingual-charts.png"
									alt="multi-lingual-charts"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Multi-Lingual Charts </strong>
								</p>
								<h5>Cater to your international audience by having your
									charts in their language, as long as it written left to right</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/clientside-update-of-data.png"
									alt="clientside-update-of-data.png"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Client-Side Data Update</strong>
								</p>
								<h5>Use the FusionCharts JavaScript classes to update the
									data of a chart at run-time</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/dynamic-switching-of-chart-type.png"
									alt="dynamic-switching-of-chart-type"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Dynamic Chart Switching </strong>
								</p>
								<h5>Allow your user to visualize the same data with a
									completely different perspective</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/visual-selection-of-data.png"
									alt="visual-selection-of-data"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Visual Selection of Data</strong>
								</p>
								<h5>Enable advanced data analysis by having the user select
									a subset of data which can then be processed further</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/macros-to-effortlessly-configure-information-to-display.png"
									alt="macros-to-effortlessly-configure-information-to-display"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Macros to effortlessly configure information
										to display </strong>
								</p>
								<h5>Use chart macros to dynamically configure chart
									elements. Annotations, tooltips, labels or chart captions</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/custom-display-of-values.png"
									alt="custom-display-of-values"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Custom Display Values using Annotations </strong>
								</p>
								<h5>Make your charts more information-intensive by adding
									custom string values (annotations) on top of data items</h5>
							</div>
						</div>
					</div>
					<!--/col-->


					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/x-axis-label-modes.png"
									alt="x-axis-label-modes"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>X-Axis Label Modes for Bubble and Scatter
										Chart</strong>
								</p>
								<h5>Add your own custom labels to the X-Axis in addition to
									automatically calculated scale</h5>
								<br>
							</div>
						</div>
					</div>
					<!--/col-->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/trendlines-zones.png"
									alt="trendlines-zones"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Trendlines</strong>
								</p>
								<h5>Add context to your chart and help users interpret data
									with respect to some predetermined value like target revenue</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/dynamic-resizing-of-image-annotations.png"
									alt="dynamic-resizing-of-image-annotations"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Dynamic resizing of image annotations </strong>
								</p>
								<h5>Enable annotations to be dynamically resized (upon
									chart resize) by using annotation macros</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/visual-editing-of-data.png"
									alt="visual-editing-of-data"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Visually Editable Charts </strong>
								</p>
								<h5>Enable planning and estimation in your charts by
									allowing your users to modify data on the chart and submit it
									back to server</h5>
								<br>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/theme-manager.png"
									alt="theme-manager" class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Theme Manager </strong>
								</p>
								<h5>Give your charts a new identity - give them a theme</h5>
							</div>
						</div>
					</div>
					<!--/col-->


					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/log-axis-charts.png"
									alt="log-axis-charts"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Log Axis Charts</strong>
								</p>
								<h5>Plot data that varies widely over a huge range on a
									logarithmic scale</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/inverse-axis-charts.png"
									alt="inverse-axis-charts"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Inverse Axis Charts</strong>
								</p>
								<h5>Plot data like rankings and race timings on an inverted
									scale</h5>
							</div>
						</div>
					</div>
					<!--/col-->



					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/regression-line.png"
									alt="regression-line"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Regression Line</strong>
								</p>
								<h5>Use the regression line to derive a particular trend
									from the scattered data points and predict future values</h5>
							</div>
						</div>
					</div>
					<!--/col-->

					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/chart-event-handling.png"
									alt="chart-event-handling"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Chart Event Handling </strong>
								</p>
								<h5>Choose from 100+ events (and growing) to micro control
									the charting experience</h5>
							</div>
						</div>
					</div>
					<!--/col-->


					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-thumbnail">
								<img
									src="/CompanyItem/ITProducts/FusionCharts/Images/personalizing-the-chart.png"
									alt="personalizing-the-chart"
									class="mgt3_5 img-responsive center-block">
							</div>
							<div class="panel-body text-center">
								<p>
									<strong>Personalizing the Chart</strong>
								</p>
								<h5>Brand your charts with your logo and link in the
									context menu to add credibility</h5>
							</div>
						</div>
					</div>
					<!--/col-->
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