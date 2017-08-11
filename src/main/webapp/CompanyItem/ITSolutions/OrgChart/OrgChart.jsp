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
					IT Solutions <small>OrgChart</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Company Item</li>
					<li class="active">IT Solutions</li>
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
				<!-- 1_Azure -->
				<div class="row">

					<%-- block 요소 끼리 중앙정렬 중요. vertical_parent / vertical_child--%>
					<div class="vertical_parent col-xs-12 col-sm-12 col-md-12"
						style="color: #fff; background: url(../Images/products-title-bkgd-1.jpg) no-repeat; background-size: 100% auto;">
						<div class="vertical_child">
							<h3 class="align_center ">OrgChart Software
								Product Family</h3>
							<h4 class="mgt2 ">Desktop – Cloud – Enterprise</h4>
						</div>
					</div>
				</div>
				<div class="enter hidden-xs"></div>

				<!-- 1_Explain -->
				<div class="row">
					<div class="text-center">
						<h3>Organisation Charting Software for Any Business, Any
							Market, Any Size</h3>
						<h5>Online – Desktop – Enterprise</h5>
					</div>
					<br />
					<div class="col-xs-12 col-sm-12 col-md-12" style="color: #78828D;">
						<p>Every company needs to create and share organisation
							charts, company org charts or organigrams. There is no substitute
							for visualising the organisation structure, and by using our org
							chart software you will quickly get the visual information you
							need. Company size really does not matter; whether the company is
							50 employees or 50,000 employees OrgChart software will do the
							job. Thousands of companies have come to rely on our Org Chart
							software solutions as the easiest and most accurate way to create
							organisation charts, visualise talent, and more.</p>
						<br />
					</div>
				</div>


				<!-- 2_OrgChart -->
				<div class="row pgtb7">

					<div
						class="col-xs-12 col-sm-7 col-sm-push-5 col-md-7 col-md-push-5"
						style="color: #78828D;">
						<p class="col-md-12">
							<img class="img-responsive col-md-8 "
								alt="orgchart-platinum-logo-100h"
								src="/CompanyItem/ITSolutions/Images/orgchart-platinum-logo-100h.png">
						</p>
						<p>End-to-End Desktop Org Chart Software Solution</p>
						<p>Talent visualization and workforce planning – simplified</p>
						<p>OrgChart Platinum enables you to manage your workforce with
							greater insight, plan for organizational changes with increased
							clarity, and model change scenarios with detailed accuracy.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-5 col-sm-offset-0 col-sm-pull-7 col-md-5 col-md-offset-0 col-md-pull-7">
						<img class="img-responsive" alt="featured-orgchart-platinum-1"
							src="/CompanyItem/ITSolutions/Images/featured-orgchart-platinum-1.png">
					</div>

				</div>

				<!-- 3_OrgChart -->
				<div class="row pgtb7" style="background-color: #f2f2f2;">
					<div class="col-xs-12 col-sm-7 col-md-7" style="color: #78828D;">
						<p class="col-md-12">
							<img class="img-responsive col-md-6 "
								alt="orgchart-now-logo-100h"
								src="/CompanyItem/ITSolutions/Images/orgchart-now-logo-100h.png">
						</p>
						<p>The #1 Cloud Org Charting Solution</p>
						<p>OrgChart Now makes creating, maintaining and sharing org
							charts simple and efficient.</p>
						<p>With OrgChart Now, all you need is a web browser – no need
							to download, install, or configure anything. If you are looking
							for organizational charting software for a team of 1 or for your
							entire organization, OrgChart Now is engineered to meet your
							needs and grow with you.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-5 col-sm-offset-0 col-md-5 col-md-offset-0">
						<img class="img-responsive" alt="orgchart-now-3"
							src="/CompanyItem/ITSolutions/Images/orgchart-now-3.png">
					</div>

				</div>


				<!-- 4_OrgChart -->
				<div class="row pgtb7">

					<div
						class="col-xs-12 col-sm-7 col-sm-push-5 col-md-7 col-md-push-5"
						style="color: #78828D;">
						<p class="col-md-12">
							<img class="img-responsive col-md-8 "
								alt="orgchart-enterprise-logo-100h"
								src="/CompanyItem/ITSolutions/Images/orgchart-enterprise-logo-100h.png">
						</p>
						<p>The Gold Standard For Enterprise Org Charting Solutions</p>
						<p>Providing unparalleled power and performance</p>
						<p>OrgChart Enterprise is the ultimate charting and workforce
							planning solution allowing for the ultimate flexibility in
							layout, content, and design. Direct integration with the leading
							HR systems allows for quick creation and maintenance of your
							organizational charts and visualizations.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-5 col-sm-offset-0 col-sm-pull-7 col-md-5 col-md-offset-0 col-md-pull-7">
						<img class="img-responsive" alt="featured-orgchart-enterprise-1"
							src="/CompanyItem/ITSolutions/Images/featured-orgchart-enterprise-1.png">
					</div>

				</div>


				<!-- 5_OrgChart -->
				<div class="row pgtb7" style="background-color: #f2f2f2;">
					<div class="col-xs-12 col-sm-7 col-md-7" style="color: #78828D;">
						<p class="col-md-12">
							<img class="img-responsive col-md-6"
								alt="orgchart-professional-logo-100h"
								src="/CompanyItem/ITSolutions/Images/orgchart-professional-logo-100h.png">
						</p>
						<p>The Standard Desktop Org Chart Software</p>
						<p>An industry leading solution for creating and publishing
							organizational charts.</p>
						<p>OrgChart Professional helps you create customizable charts
							that include key HR metrics such as salary, span of control and
							performance ratings. OrgChart Professional empowers you to manage
							your workforce with greater insight and less time strain.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-5 col-sm-offset-0 col-md-5 col-md-offset-0">
						<img class="img-responsive "
							alt="featured-orgchart-professional-1"
							src="/CompanyItem/ITSolutions/Images/featured-orgchart-professional-1.png">
					</div>

				</div>


				<!-- Features Table -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header" style="color: #78828D;">Which Org
							Chart software product is right for your needs?</h2>
					</div>
					<div class="col-lg-12 table-responsive">
						<table
							class="table table-bordered table-hover table-striped text-center">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th class="text-center"><br /> <img
										class="img-responsive center-block" alt="go-cal3"
										src="/CompanyItem/ITSolutions/Images/go-cal3.png"> <br>
										<h4>
											<strong>OrgChart Platinum</strong>
										</h4></th>

									<th class="text-center"><br /> <img
										class="img-responsive center-block" alt="icon-orgchart-now"
										src="/CompanyItem/ITSolutions/Images/icon-orgchart-now.png">
										<br>
										<h4>
											<strong>OrgChart Now</strong>
										</h4></th>

									<th class="text-center"><br /> <img
										class="img-responsive center-block" alt="go-cal4"
										src="/CompanyItem/ITSolutions/Images/go-cal4.png"> <br>
										<h4>
											<strong>OrgChart Enterprise</strong>
										</h4></th>
									<%--center-block 이미지 중앙정렬 --%>
									<th class="text-center"><br /> <img
										class="img-responsive center-block" alt="go-cal2"
										src="/CompanyItem/ITSolutions/Images/go-cal2.png"> <br>
										<h4>
											<strong>OrgChart Professional</strong>
										</h4></th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Platform</td>
									<td><strong>Desktop</strong></td>
									<td><strong>Cloud</strong></td>
									<td><strong>Enterprise</strong></td>
									<td><strong>Desktop</strong></td>
								</tr>

								<tr>
									<td>Employee Charting</td>
									<td>Up to 40,000</td>
									<td>Up to 40,000</td>
									<td>Up to 550,000</td>
									<td>Up to 1,000</td>
								</tr>

								<tr>
									<td>Easy Org Chart Creation</td>
									<%--아이콘 <a class="btn btn-success btn-xs float_right"><span class="glyphicon glyphicon-ok float_right"></span></a> --%>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Chart Automation</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Workforce Planning</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>

								<tr>
									<td>Talent Visualization</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>

								<tr>
									<td>Re-Orgs & Mergers</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>OrgCharting with Excel</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Dynamic Organizational Charts</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Collaboration & Publish</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Import Data</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Audit Trail for Changes</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
								</tr>
								<tr>
									<td>Cloud Connectors</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>Reports and Templates</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>Mobile Access Worldwide</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>Simultaneous Views</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>Advanced Security</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>Publish to Web</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>Publish to MS Office & Interactive PDF</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td>SharePoint & Office 365 Integration</td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td><span class="glyphicon glyphicon-ok"></span></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td><strong>OrgChart Platinum</strong></td>
									<td><strong>OrgChart Now</strong></td>
									<td><strong>OrgChart Enterprise</strong></td>
									<td><strong>OrgChart Professional</strong></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>



				<!--Technologies -->
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header" style="color: #78828D;">Trusted by</h2>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/CompanyItem/ITSolutions/Images/spon-grey-422-starz.png"
							alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/CompanyItem/ITSolutions/Images/spon-grey-321.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/CompanyItem/ITSolutions/Images/spon-grey-421.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/CompanyItem/ITSolutions/Images/spon-grey-521.png" alt="">
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4">
						<img class="img-responsive "
							src="/CompanyItem/ITSolutions/Images/spon-grey-621.png" alt="">
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