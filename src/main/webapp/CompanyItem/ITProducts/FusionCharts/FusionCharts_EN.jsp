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
							<strong>An experience so delightful, you can use it as
								one of your USPs.</strong>
						</h3>
						<p>FusionCharts Suite XT gives you the best looking JavaScript
							charts in the industry — exciting animation, smart designs and
							rich interactivity. Show off the beautiful dashboards in your
							product to drive more sales, or drive adoption of the application
							in your organization.</p>
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
							<strong>The same delight across devices, browsers and
								platforms.</strong>
						</h3>
						<p>
							PCs, Macs, iPads, iPhones or Android devices, FusionCharts Suite
							XT offers a unified experience across all of them. It works with
							all your web and mobile applications, including IE 6, 7 and 8
							that most components do not support but over 5% of the world
							still uses, especially the corporates. <br>(Source:
							w3schools)
						</p>
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
							<strong>It doesn't stop at delightful looks, it takes it
								to the engineering too. </strong>
						</h3>
						<p>The charts come with super-smart defaults, so you will need
							all of 15 minutes to create your first chart. And advanced
							reporting capabilities like unlimited drill-down, chart export
							and interactive legends are built right in, so your team can
							implement them in a matter of hours instead of needing weeks to
							build them.</p>
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
							<strong>Pure JavaScript under the hood</strong>
						</h3>
						<br>
						<p>With an extensive JavaScript API, FusionCharts Suite XT
							brings you events, and methods for deep integration with other
							libraries and web-frameworks. It gives you complete control over
							each step of the charting process, and equips you to build the
							most advanced dashboards for your enterprise applications.</p>
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
							<strong>Extensive docs, ready-to-use dashboards and
								personalized tech support <br> shorten implementation
								cycles even further.
							</strong>
						</h3>
						<br>
						<p>FusionCharts Suite XT comes with exhaustive documentation
							having complete API and attribute definitions, integration
							examples and tutorial-style explanation of all the advanced
							capabilities. The dashboards simulate real-life business use
							cases and are the best place to get inspired from. And if you are
							stuck with a query, you don't have to scout 3rd party forums to
							find an answer — just write in to our tech support and team and
							get an answer within 24 working hours. Implementation will be a
							breeze.</p>
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="col-md-4 col-sm-4 col-xs-12">
							<img class="img-responsive center-block"
								src="/CompanyItem/ITProducts/FusionCharts/Images/features-documention.png"
								alt="features-documention">
							<p class="text-center">Extensive Docs</p>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<img class="img-responsive center-block"
								src="/CompanyItem/ITProducts/FusionCharts/Images/features-dashboards.png"
								alt="features-dashboards">
							<p class="text-center">Ready-to-use Dashboards</p>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<img class="img-responsive center-block"
								src="/CompanyItem/ITProducts/FusionCharts/Images/features-tech-support.png"
								alt="features-tech-support">
							<p class="text-center">Personalized Tech Support</p>
						</div>

					</div>

				</div>



				<div class="row pgtb7">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<strong>The industry's most comprehensive charting
								solution by a big fat margin. </strong>
						</h3>
						<br>
						<p>Teams often make do with basic chart types because the
							component they are using doesn't support the advanced ones. But
							incorrect chart types lead to incorrect analysis, which in turn
							lead to incorrect business decisions. Surely, you want to do
							better for your customers. FusionCharts Suite XT gives you 90+
							charts and graphs right from the basic ones to the more advanced
							Funnel, Heat Map, Zoom Line, Multi-Axis and Treemap Charts. Data
							in your business applications will always have the right face for
							them.</p>
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
							<strong>27,000 customers. 700,000 developers. 118
								countries. A decade of data visualization experience. </strong>
						</h3>
						<br>
						<p>Right from one-man startups to Fortune 500 companies,
							government institutions to the world's leading banks,
							organizations and people throughout the world trust FusionCharts
							when it comes to data visualization. And not without good reason.</p>
						<p>
							We pioneered interactive charting way back in 2002 and today have
							a team of 60 that lives and breathes data visualization.<br>
							It is not one of the many things we do, it is the only thing we
							do and care about.
						</p>
						<p>So you know your trust isn't misplaced when you choose
							FusionCharts Suite XT for your data visualization needs. Oh, and
							we got books on us.</p>
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
							&nbsp;&nbsp;<strong>Features</strong>
						</h2>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<p>FusionCharts Suite XT is packed with power features that
							let you have full control over the aesthetics and behavior of all
							the charts. Additionally, the JavaScript API of each chart
							exposes a lot more functionality like client-side data updates,
							updating individual parameters, exporting charts as images or
							PDFs, creating multi-level drill-down.</p>
						<p>This section lets you see the features in action
							individually, look at the underlying code and learn
							implementation best practices. Select a feature below to learn
							more about it.</p>
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
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>

</html>