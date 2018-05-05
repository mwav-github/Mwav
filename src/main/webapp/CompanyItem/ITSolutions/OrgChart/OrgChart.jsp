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
					IT Solutions <small>OrgChart</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Solutions</li>
					<li class="active">OrgChart</li>
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
							<h3 class="align_center ">OrgChart Software Product Family</h3>
							<h4 class="mgt2 ">Desktop – Cloud – Enterprise</h4>
						</div>
					</div>
				</div>
				<div class="enter hidden-xs"></div>

				<!-- 1_Explain -->
				<div class="row">
					<div class="text-center">
						<h3>모든 사업형태,시장,규모에 대응하는 조직차트 소프트웨어</h3>
						<h5>온라인 -데스크탑 -엔터프라이즈</h5>
					</div>
					<br />
					<div class="col-xs-12 col-sm-12 col-md-12" style="color: #78828D;">
						<p>
							어떤 회사라도 조직차트, 회사조직도 또는 조직도표를 만들고 공유할 필요가 있습니다. <br /> 조직 구성도를
							시각화할 최적의 대안은 찾기 쉽지 않지만, 자사의 OrgChart 소프트웨어를 이용하면 필요한 정보를 시각화하여
							빠르게 얻을 수 있습니다. 회사 규모는 실제 중요하지 않습니다. 직원 수가 50명이던 50,000명이던
							OrgChart 소프트웨어를 통해 가능합니다. <br /> 많은 회사들이 조직도를 구성하고 직원 능력 수치를
							시각화하는 등 가장 쉽고 정확한 방식으로써 자사의 OrgChart 소프트웨어 솔루션을 신뢰하고 있습니다.
						</p>
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
						<p>End-to-End 데스크톱 OrgChart 소프트웨어 솔루션</p>
						<p>단순화된 직무능력 시각화와 인력계획</p>
						<p>OrgChart Platinum을 통하여 더욱 큰 통찰력을 가지고 인력관리를 할 수 있습니다. 조직변경의
							높은 투명성과 정밀한 모델변경 시나리오를 계획하세요.</p>
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
						<p>최고의 클라우드 Org Charting 솔루션</p>
						<p>OrgChart Now조직도를 만들고 유지하며 공유하는 것을 단순하고 효율적으로 만듭니다.</p>
						<p>또한 OrgChart Now에 필요한 것은 웹브라우저 뿐입니다. – 다운로드하여 설치 또는 어떤 것도
							세팅할 필요가 없습니다. 한 개의 팀 또는 전체 조직을 위한 조직구성차트 소프트웨어를 찾고 있다면, 바로
							OrgChart Now는 그런 여러분의 요구사항을 충족시키고 더불어 필요에 따라 확장되도록 설계되었습니다.</p>
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
						<p>Enterprise Org Charting 솔루션을 위한 골드 스탠다드</p>
						<p>비교할 수 없는 파워와 성능을 제공합니다.</p>
						<p>OrgChart Enterprise는 최상의 차트 및 인원계획 솔루션입니다.레이아웃,컨텐츠 및 디자인에
							있어 최상의 유연성을 보장합니다.유명 HR 시스템과 직접적인 통합을 통해 조직 차트와 시각화를 빠르게 구성하고 유지할
							수 있습니다.</p>
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
						<p>표준 데스크톱 Org Chart 소프트웨어</p>
						<p>조직차트 구성과 퍼블리싱을 위한 업계 최고 솔루션</p>
						<p>OrgChart Professional는 급여 및 성과율 등과 같은 주요 HR측정항목을 포괄하여 맞춤
							차트를 구성하는데 유용합니다. OrgChart Professional는 보다 큰 인사이트와 적은 시간으로 인력관리를
							할 수 있게 합니다.</p>
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
						<h3 class="page-header" style="color: #78828D;">어느 Org Chart
							소프트웨어 제품이 귀사에 가장 적합할까요?</h3>
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