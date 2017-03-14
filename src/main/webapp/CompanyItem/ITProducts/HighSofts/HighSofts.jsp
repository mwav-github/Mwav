<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					IT Products <small>HightSofts </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company Item</li>
					<li class="active">IT Products</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3" style="color: #54697E;">
				<jsp:include page="/CompanyItem/ITProducts/ITProductsLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9" style="color: #54697E;">


				<!-- 	<div class="col-md-12">
					Nav tabs

					<ul class="nav nav-pills nav-justified">
						<li role="presentation" class="active"><a href="#features">
								<span>FEATURES</span>
						</a></li>
						<li role="presentation"><a href="#profile"
							data-toggle="modal" data-target=".DEMOS" role="button"><span>DEOMS</span></a></li>
						<li role="presentation"><a href="#LICENSE/PRICING"><span>LICENSE/PRICING</span></a></li>

					</ul>

					<div class="enter"></div>
				</div> -->


				<%--Demos --%>
				<div class="enter visible-xs"></div>

				<h2 class="text-center mgb3" style="color: #78828D;">
					<strong>${item} DEMOS</strong>
				</h2>
				<hr style="border-top: 3px solid #78828D !important;" id="DEMOS">

				<div class="enter"></div>



				<%-- <h3 class="text-left mgb3">
						<strong>${item}</strong>
					</h3> --%>
				<!-- 	<hr style="border-top: 3px solid #78828D !important;"> -->
				<div class="row">
					<!-- Basic line -->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<object
							data="/CompanyItem/ITProducts/Images/[1]_${item}_${demo_1}.svg"
							type="image/svg+xml">
							<img
								src="/CompanyItem/ITProducts/Images/[1]_${item}_${demo_1}.svg" />
						</object>
						<div class="enter hidden-xs"></div>

						<div class="text-center" onMouseOver="this.style.color='#58bb45'"
							onMouseOut="this.style.color='#6B6FCE'" style="color: #6B6FCE">
							<h4>
								<strong>${demo_1_text}</strong>
							</h4>
						</div>
						<div class="clearfix"></div>
					</div>

					<!-- Ajax loaded data, clickable points -->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<object
							data="/CompanyItem/ITProducts/Images/[2]_${item}_${demo_2}.svg"
							type="image/svg+xml">
							<img
								src="/CompanyItem/ITProducts/Images/[2]_${item}_${demo_2}.svg" />
						</object>

						<div class="enter hidden-xs"></div>
						<div class="text-center" onMouseOver="this.style.color='#58bb45'"
							onMouseOut="this.style.color='#6B6FCE'" style="color: #6B6FCE">
							<h4>
								<strong>${demo_2_text}</strong>
							</h4>
						</div>
						<div class="clearfix"></div>

						<div class="enter hidden-xs"></div>
					</div>



					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<object
							data="/CompanyItem/ITProducts/Images/[3]_${item}_${demo_3}.svg"
							type="image/svg+xml">
							<img
								src="/CompanyItem/ITProducts/Images/[3]_${item}_${demo_3}.svg" />
						</object>

						<%-- <img class="image-container img-thumbnail"
								data-original="/CompanyItem/ITProducts/Images/[3]_${item}_${demo_3}.svg"
								alt="Basic line"
								src="/CompanyItem/ITProducts/Images/[3]_${item}_${demo_3}.svg"> --%>
						<div class="enter hidden-xs"></div>
						<div class="text-center" onMouseOver="this.style.color='#58bb45'"
							onMouseOut="this.style.color='#6B6FCE'" style="color: #6B6FCE">
							<h4>
								<strong>${demo_3_text}</strong>
							</h4>
						</div>
						<div class="clearfix"></div>
					</div>

					<!-- Ajax loaded data, clickable points -->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

						<object
							data="/CompanyItem/ITProducts/Images/[4]_${item}_${demo_4}.svg"
							type="image/svg+xml">
							<img
								src="/CompanyItem/ITProducts/Images/[4]_${item}_${demo_4}.svg" />
						</object>
						<%-- <img class="image-container img-thumbnail"
								data-original="/CompanyItem/ITProducts/Images/[4]_${item}_${demo_4}.svg"
								alt="Basic line"
								src="/CompanyItem/ITProducts/Images/[4]_${item}_${demo_4}.svg"> --%>
						<div class="enter hidden-xs"></div>
						<div class="text-center" onMouseOver="this.style.color='#58bb45'"
							onMouseOut="this.style.color='#6B6FCE'" style="color: #6B6FCE">
							<h4>
								<strong>${demo_4_text}</strong>
							</h4>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="enter"></div>


					<div class="enter"></div>
				</div>

				<%--DEMOS END --%>

				<%--FEATURES START --%>


				<h2 class="text-center mgb3" style="color: #78828D;" id="features">
					<strong>${item} FEATURES</strong>
				</h2>
				<hr style="border-top: 3px solid #78828D !important;" id="FEATURES">
				<div class="enter"></div>

				<!-- 1_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>COMPATIBLE</strong>
						</h4>
						<p>It works in all modern mobile and desktop browsers
							including the iPhone/iPad and Internet Explorer from version 6.
							On iOS and Android, multitouch support provides a seamless user
							experience. Standard browsers use SVG for the graphics rendering.
							In legacy Internet Explorer graphics are drawn using VML.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/browsers.png">
					</div>

				</div>

				<div class="enter"></div>

				<!-- 2_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>FREE FOR NON-COMMERCIAL</strong>
						</h4>
						<p>
							Do you want to use ${item} for a personal website, a school site
							or a non-profit organisation? Then you don't need the author's
							permission, just go on and use ${item}. For commercial websites
							and projects, see
							<code class="text-primary">License and Pricing.</code>
						</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/free.png">
					</div>
				</div>

				<div class="enter"></div>


				<!-- 3_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>OPEN</strong>
						</h4>
						<p>One of the key features of ${item} is that under any of the
							licenses, free or not, you are allowed to download the source
							code and make your own edits. This allows for personal
							modifications and a great flexibility.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/open.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 4_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>PURE JAVASCRIPT</strong>
						</h4>
						<p>${item}issolely based on native browser technologies and
							doesn't require client side plugins like Flash or Java.
							Furthermore you don't need to install anything on your server. No
							PHP or ASP.NET. ${item} needs only one JavaScript file to run</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/no-backend.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 5_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>NUMEROUS CHART TYPES</strong>
						</h4>
						<p>${item}supportsline, spline, area, areaspline, column, bar,
							pie, scatter, angular gauges, arearange, areasplinerange,
							columnrange and polar chart types. Many of these can be combined
							in one chart.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/chart-types.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 6_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>SIMPLE CONFIGURATION SYNTAX</strong>
						</h4>
						<p>Setting the ${item} configuration options requires no
							special programming skills. The options are given in a JavaScript
							object notation structure, which is basically a set of keys and
							values connected by colons, separated by commas and grouped by
							curly brackets.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/config-syntax.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 7_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>DYNAMIC</strong>
						</h4>
						<p>Through a full API you can add, remove and modify series
							and points or modify axes at any time after chart creation.
							Numerous events supply hooks for programming against the chart.
							This opens for solutions like live charts constantly updating
							with values from the server, user supplied data and more.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/events.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 7_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>MULTIPLE AXES</strong>
						</h4>
						<p>Sometimes you want to compare variables that are not the
							same scale - for example temperature versus rainfall and air
							pressure. ${item} lets you assign an y axis for each series - or
							an x axis if you want to compare data sets of different
							categories. Each axis can be placed to the right or left, top or
							bottom of the chart. All options can be set individually,
							including reversing, styling and position.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/multiaxes.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 8_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>TOOLTIP LABELS</strong>
						</h4>
						<p>On hovering the chart ${item} can display a tooltip text
							with information on each point and series. The tooltip follows as
							the user moves the mouse over the graph, and great efforts have
							been taken to make it stick to the nearest point as well as
							making it easy to read a point that is below another point.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/tooltip.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 9_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>DATETIME AXIS</strong>
						</h4>
						<p>75% of all charts with an X and Y axis have a date-time X
							axis. Therefore ${item} is very intelligent about time values.
							With milliseconds axis units, ${item} determines where to place
							the ticks so that they always mark the start of the month or the
							week, midnight and midday, the full hour etc.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/datetime.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 10_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>EXPORT AND PRINT</strong>
						</h4>
						<p>With the exporting module enabled, your users can export
							the chart to PNG, JPG, PDF or SVG format at the click of a
							button, or print the chart directly from the web page.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/exporting.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 11_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>ZOOMING</strong>
						</h4>
						<p>By zooming in on a chart you can examine an especially
							interesting part of the data more closely. Zooming can be in the
							X or Y dimension, or both.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/zooming.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 12_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>EXTERNAL DATA LOADING</strong>
						</h4>
						<p>${item} takes the data in a JavaScript array,which can be
							defined in the local configuration object, in a separate file or
							even on a different site. Furthermore, the data can be handled
							over to ${item} in any form, and a callback function used to
							parse the data into an array.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/ajax.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 13_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>ANGULAR GAUGES</strong>
						</h4>
						<p>Ideal for dashboards, angular gauges provides
							speedometer-like charts, easy to read at a quick glance.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/gauges.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 14_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>POLAR CHARTS</strong>
						</h4>
						<p>Cartesian chart types like line, area, spline or areaspline
							can be converted to polar or radial chart by one simple option.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/polar.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 15_HightSofts -->
				<div class="row">
					<div
						class="col-xs-12 col-sm-9 col-sm-push-3 col-md-9 col-md-push-3">
						<h4 class="text-left mgb3">
							<strong>INVERTED CHART OR REVERSED AXIS</strong>
						</h4>
						<p>Sometimes you need to flip over your chart and make the X
							axis appear vertical, like for example in a bar chart. Reversing
							the axis, with the highest values appearing closest to origo, is
							also supported.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-sm-pull-9 col-md-3 col-md-offset-0 col-md-pull-9">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/inverted.png">
					</div>
				</div>

				<div class="enter"></div>

				<!-- 16_HightSofts -->
				<div class="row">
					<div class="col-xs-12 col-sm-9 col-md-9">
						<h4 class="text-left mgb3">
							<strong>TEXT ROTATION FOR LABELS</strong>
						</h4>
						<p>All text labels, including axis labels, data labels for the
							point and axis titles, can be rotated in any angle.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/rotation.png">
					</div>
				</div>

				<div class="enter"></div>






				<%--license / price --%>
				<h2 class="text-center mgb3" style="color: #78828D;">
					<strong>${item} Licenses/Pricing</strong>
				</h2>
				<hr style="border-top: 3px solid #78828D !important;"
					id="LICENSE/PRICING">

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<p>The Highsoft Standard Terms and Conditions applies if you
						run a commercial or governmental website, intranet or project.</p>
					<div class="enter"></div>
				</div>




				<%--HighChartS JS --%>
				<%--<div class="tab-content">
					 <ul class="nav nav-tabs nav-justified">
						nav nav-pills nav-justified
						<li role="presentation" class="active"><a data-toggle="tab"
							href="#HighChartS">HighChartS JS</a></li>
						<li role="presentation"><a data-toggle="tab"
							href="#Highstock">Highstock JS</a></li>
						<li role="presentation"><a data-toggle="tab" href="#Highmaps">Highmaps
								JS</a></li>
					</ul> --%>
				<div class="enter"></div>

				<div class="row">
					<h4 class="text-left mgb3">
						<strong>${item} JS</strong>
					</h4>
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">
									<h4>
										<strong>${item} Single Developer + Premium Support</strong>
									</h4>
									<br>
									<div class="col-md-8">

										<ul>
											<li>Allows ${item} to be used in SaaS projects, web
												applications, intranets, and websites.</li>
											<li>Source editing allowed.</li>
											<li>Includes Highcharts Editor and Highcharts Export
												Server.</li>

										</ul>
										<br>
										<h5>
											<strong>Premium Support</strong>
										</h5>
										<ul>
											<li>Valid for two years</li>
											<li>10 hours of email or chat support per developer</li>
											<li>Guaranteed response time of 36 hours</li>
											<li>Priority bug fixing, and more</li>
											<li><a href="#support">Learn More</a></li>
										</ul>
										<p></p>

									</div>
									<div class="col-md-4 text-center">
										<p>
											<strong><span class="price"> <c:if
														test="${item == 'Highcharts'}">
											 USD 660.00
											</c:if> <c:if test="${item == 'Highstock'}">
											 USD 1,050.00
											</c:if> <c:if test="${item == 'Highmaps'}">
											 USD 660.00
											</c:if>
											</span></strong>
										</p>
										<br> <a href="#" data-toggle="modal"
											data-target="#Contact" class="btn btn-success btn-block">
											BUY</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="panel-footer">

								<div class="col-md-12">
									<h5>
										<strong>${item} Single Developer</strong>
									</h5>
									<div class="col-md-8">

										<ul>
											<li>Allows ${item} to be used in SaaS projects, web
												applications, intranets, and websites.</li>
											<li>Source editing allowed.</li>
											<li>Includes Highcharts Editor and Highcharts Export
												Server</li>
											<li>Includes Basic Support</li>
										</ul>
									</div>
									<div class="col-md-4 text-center">

										<h4>
											<strong><c:if test="${item == 'Highcharts'}">
											 USD 390.00
											</c:if> <c:if test="${item == 'Highstock'}">
											 USD 780.00
											</c:if> <c:if test="${item == 'Highmaps'}">
											 USD 390.00
											</c:if> </strong> <a href="#" data-toggle="modal" data-target="#Contact"
												class="btn btn-success "> BUY</a>
										</h4>

									</div>
								</div>

								<div class="clearfix"></div>

							</div>
						</div>



						<div class="enter"></div>

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">
									<h4>
										<strong>${item} 5 Developer + Premium Support</strong>
									</h4>
									<br>
									<div class="col-md-8">

										<p></p>
										<ul>
											<li>Allows ${item} to be used in SaaS projects, web
												applications, intranets, and websites.</li>
											<li>Source editing allowed.</li>
											<li>Includes Highcharts Editor and Highcharts Export
												Server.</li>

										</ul>
										<br>
										<h5>
											<strong>Premium Support</strong>
										</h5>
										<ul>
											<li>Valid for two years</li>
											<li>10 hours of email or chat support per developer</li>
											<li>Guaranteed response time of 36 hours</li>
											<li>Priority bug fixing, and more</li>
											<li><a href="#support">Learn More</a></li>
										</ul>
										<p></p>
										<div class="clearfix"></div>
									</div>
									<div class="col-md-4 text-center">
										<p>
											<strong><span class="price"> <c:if
														test="${item == 'Highcharts'}">
											 USD 2,970.00
											</c:if> <c:if test="${item == 'Highstock'}">
											 USD 4,725.00
											</c:if> <c:if test="${item == 'Highmaps'}">
											 USD 2,970.00
											</c:if>
											</span></strong>
										</p>
										<br> <a href="#" data-toggle="modal"
											data-target="#Contact" class="btn btn-success btn-block">
											BUY</a>
									</div>
								</div>
							</div>

							<div class="panel-footer">

								<div class="col-md-12">
									<h5>
										<strong>${item} 5 Developer</strong>
									</h5>
									<div class="col-md-8">
										<ul>
											<li>Allows ${item} to be used in SaaS projects, web
												applications, intranets, and websites.</li>
											<li>Source editing allowed.</li>
											<li>Includes Highcharts Editor and Highcharts Export
												Server.</li>
											<li>Includes Basic Support</li>
										</ul>
									</div>
									<div class="col-md-4 text-center">

										<h4>
											<strong><c:if test="${item == 'Highcharts'}">
											 USD 1,755.00
											</c:if> <c:if test="${item == 'Highstock'}">
											 USD 3,510.00
											</c:if> <c:if test="${item == 'Highmaps'}">
											 USD 1,755.00
											</c:if> </strong><a href="#" data-toggle="modal" data-target="#Contact"
												class="btn btn-success "> BUY</a>
										</h4>

									</div>
								</div>

								<div class="clearfix"></div>

							</div>
						</div>

						<div class="enter"></div>

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">

									<h4>
										<strong>${item} 10 Developer + Premium Support</strong>
									</h4>
									<br>

									<div class="col-md-8">
										<p></p>
										<ul>
											<li>Allows ${item} to be used in SaaS projects, web
												applications, intranets, and websites.</li>
											<li>Source editing allowed.</li>
											<li>Includes Highcharts Editor and Highcharts Export
												Server.</li>

										</ul>
										<h5>
											<strong>Premium Support</strong>
										</h5>
										<ul>
											<li>Valid for two years</li>
											<li>10 hours of email or chat support per developer</li>
											<li>Guaranteed response time of 36 hours</li>
											<li>Priority bug fixing, and more</li>
											<li><a href="#support">Learn More</a></li>
										</ul>
										<p></p>

										<div class="clearfix"></div>
									</div>
									<div class="col-md-4 text-center">
										<p>
											<strong><span class="price"> <c:if
														test="${item == 'Highcharts'}">
											 USD 5,620.00
											</c:if> <c:if test="${item == 'Highstock'}">
											 USD 8,930.00
											</c:if> <c:if test="${item == 'Highmaps'}">
											 USD 5,620.00
											</c:if>
											</span></strong>
										</p>
										<br> <a href="#" data-toggle="modal"
											data-target="#Contact" class="btn btn-success btn-block">
											BUY</a>
									</div>
								</div>
							</div>
							<div class="panel-footer">

								<div class="col-md-12">
									<h5>
										<strong>${item}10 Developer</strong>
									</h5>

									<div class="col-md-8">
										<ul>
											<li>Allows ${item} to be used in SaaS projects, web
												applications, intranets, and websites.</li>
											<li>Source editing allowed.</li>
											<li>Includes Highcharts Editor and Highcharts Export
												Server.</li>
											<li>Includes Basic Support</li>
										</ul>
									</div>
									<div class="col-md-4 text-center">

										<h4>
											<strong> <c:if test="${item == 'Highcharts'}">
											 USD 3,320.00
											</c:if> <c:if test="${item == 'Highstock'}">
											 USD 6,630.00
											</c:if> <c:if test="${item == 'Highmaps'}">
											 USD 3,320.00
											</c:if>
											</strong><a href="#" data-toggle="modal" data-target="#Contact"
												class="btn btn-success "> BUY</a>
										</h4>

									</div>
								</div>

								<div class="clearfix"></div>

							</div>
						</div>

						<div class="enter"></div>


						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">

									<h4>
										<strong>High-five License</strong>
									</h4>
									<br>


									<p>Special bootstrap licence for pre-revenue or
										pre-financing startups.</p>
									<ul>
										<li>Allows Highcharts, Highstock and Highmaps to be used
											in SaaS projects, web applications, intranets, and websites.</li>
										<li>Valid for one year and up to two developers</li>
										<li>Includes Basic Support</li>
										<li>Includes Highcharts Editor and Highcharts Export
											Server.</li>

									</ul>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>

						<div class="enter"></div>

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">

									<h4>
										<strong>OEM and Enterprise License</strong>
									</h4>

									<div class="col-md-8">
										<p>Choose this licence if you are bundling Highcharts with
											hardware and/or software solutions designed to be hosted or
											operated by your clients. E.g. Intranets and other
											behind-the-firewall hosting scenarios, appliances, IoT
											devices or other embedded systems.</p>
									</div>
									<div class="col-md-4 text-center">

										<h4>
											<strong>Contact Us For Price </strong>
										</h4>
										<a href="#" data-toggle="modal" data-target="#Contact"
											class="btn btn-success btn-block"> Contact Us</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>

						<div class="enter"></div>

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">

									<h4>
										<strong>Update to ${item} 5</strong>
									</h4>


									<p>
										If you are current ${item} version 4.0 user, <br>you may
										update your license in order to get access to ${item} 5.
									</p>


									<div class="clearfix"></div>
								</div>
							</div>
						</div>

						<div class="enter"></div>

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-12">
									<h4>
										<strong>Non-commercial</strong>
									</h4>

									<div class="col-md-8">
										<p>
											If you are a non-profit company, or use our products for
											personal use, you may enjoy our software for free under a <a
												href="http://creativecommons.org/licenses/by-nc/3.0/">Creative
												Commons (CC) Attribution-NonCommercial licence</a><br> <br>
										</p>
									</div>
									<div class="col-md-4 text-center">
										<h4>
											<strong>Free </strong>
										</h4>
										<a class="btn btn-success btn-block"
											href="/MasterPage_1.jsp?mode=Default" title="Sign up">Sign
											up</a>

									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>



					<div class="col-md-12 col-xs-12 col-sm-12">
						<h3 id="support">Premium Support for ${item}</h3>
						<p>Premium Support is optional, and valid for two years or
							until launch of new major version.</p>
						<!-- <div class="table-responsive"> -->
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>Support Features</th>
									<th>Basic Support</th>
									<th>Premium Support</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Term</td>
									<td class="success text-center">2 years</td>
									<td class="success text-center">2 years</td>
								</tr>
								<tr>
									<td>Access to the Highcharts Forum and Stack Overflow</td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
								<tr>
									<td>Support time per developer</td>
									<td class="warning text-center">1 hour</td>
									<td class="success text-center">10 hours</td>
								</tr>
								<tr>
									<td>Access to 1<sup>st</sup> line support
									</td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
								<tr>
									<td>Guaranteed initial response time of 36 hours, working
										days</td>
									<td class="danger text-center"><i class="fa fa-minus"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
								<tr>
									<td>Access to 2nd line support by core developers</td>
									<td class="danger text-center"><i class="fa fa-minus"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
								<tr>
									<td>Emergency hot fixes</td>
									<td class="danger text-center"><i class="fa fa-minus"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
								<tr>
									<td>Text chat with our 1st line support engineers, working
										days 10-18 CET(CEST)</td>
									<td class="danger text-center"><i class="fa fa-minus"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
								<tr>
									<td>Guiding and advice on implementing Highcharts (with
										third party systems and platforms)</td>
									<td class="danger text-center"><i class="fa fa-minus"></i></td>
									<td class="success text-center"><i class="fa fa-check"></i></td>
								</tr>
							</tbody>
						</table>
						<!-- </div> -->
					</div>
				</div>
				<%--hightcharts JS end --%>

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