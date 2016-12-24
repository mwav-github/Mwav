<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단에 이부분안해주면 다른 페이지에서 인코딩 깨진다.  --%>
<%--(1) --%>
<!-- Page Heading/Breadcrumbs -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Company <small> Business Field</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>Company</li>
			<li class="active">Business Field</li>
		</ol>
	</div>
</div>
<!-- /.row -->


<!-- Content Row -->
<div class="row">
	<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
	<div class="col-md-3">
		<jsp:include page="/Company/CompanyLeftMenu.jsp" flush="false" />
	</div>
	<!-- 끝 -->

	<!-- Content Column -->
	<div class="col-md-9">

		<%--(1) --%>
		<div class="row">

			<div class="col-lg-12">
				<h2 class="page-header">Business Field</h2>
			</div>
			<%--추후 버튼 변경 예정 또한 추가적으로 ~!! 모달 예정--%>
			<!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<div class="well">
							<a href="#webAd"> <img class="thumbnail img-responsive"
								alt="Bootstrap template"
								src="http://www.prepbootstrap.com/Content/images/shared/houses/h4.jpg" />
							</a>
						</div>
						<a href="#"> <span
								style="border: 1px solid rgba(0, 0, 0, 0.1); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.7);"
								class="btn btn-info btn-lg"><i
									class="glyphicon glyphicon-info-sign"></i> Web / Ad Agency</span>


							</a>
					</div> -->
			<!-- 					<div class="col-lg-12">
						<a href="#Web / Ad Agency">
							<button type="button"
								class="btn btn-info btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h3>Web / Ad Agency</h3>
							</button>
						</a> <a href="#IT Solutions Provider">
							<button type="button"
								class="btn btn-warning btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h3>IT Solutions Provider</h3>
							</button>
						</a> <a href="#IT Edu. / Consulting">
							<button type="button"
								class="btn btn-primary btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h3>IT Edu. / Consulting</h3>
							</button>
						</a> <a href="#E-Commerce Services">
							<button type="button"
								class="btn btn-danger btn-sm col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<h3>E-Commerce Services</h3>
							</button>
						</a>
					</div> -->


			<div class="col-md-12">
				<div class="enter"></div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-bookmark"></span> Quick Menu
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<a href="#Web / Ad Agency"
									class="btn btn-success btn-lg col-lg-6 col-md-6 col-sm-6 col-xs-12"
									role="button"
									style="background-color: #3F729B !important; border-color: #FFFFFF !important;"><span
									class="glyphicon glyphicon-globe"></span> <br />Web / Ad
									Agency</a> <a href="#IT Solutions Provider"
									class="btn btn-info btn-lg col-lg-6 col-md-6 col-sm-6 col-xs-12"
									role="button"
									style="background-color: #37474F !important; border-color: #FFFFFF !important;"><span
									class="glyphicon glyphicon glyphicon-user"></span> <br />IT
									Solutions Provider</a> <a href="#IT Edu. / Consulting"
									class="btn btn-primary btn-lg col-lg-6 col-md-6 col-sm-6 col-xs-12"
									role="button"
									style="background-color: #D8616D !important; border-color: #FFFFFF !important;"><span
									class="glyphicon glyphicon glyphicon-list-alt"></span> <br />IT
									Edu. / Consulting</a> <a href="#E-Commerce Services"
									class="btn btn-info btn-lg col-lg-6 col-md-6 col-sm-6 col-xs-12"
									role="button"
									style="background-color: #B5917B !important; border-color: #FFFFFF !important;"><span
									class="glyphicon glyphicon-comment"></span> <br />E-Commerce
									Services</a>
							</div>

						</div>
						<!-- 	<a href="http://www.jquery2dotnet.com/"
											class="btn btn-success btn-lg btn-block" role="button"><span
											class="glyphicon glyphicon-globe"></span> Website</a> -->
					</div>
				</div>
			</div>



			<div class="col-md-12 mgt1_8">
				<br>
				<p>
					<i class="fa fa-chevron-right"></i> Provides 4 business models
					including an independent business (E-Commerce).
				</p>
				<br>
				<p>
					<i class="fa fa-chevron-right"></i> Web / Ad Agency is sort of
					simple IT- business model suitable for startups.
				</p>
				<br>

				<p>
					<i class="fa fa-chevron-right"></i> Obtains most of IT Solutions by
					global partnership.
				</p>
				<br>
				<p>
					<i class="fa fa-chevron-right"></i> E-Commerce platform is to be
					developed in house and services to be operated by stakeholders
				</p>
			</div>

		</div>

		<%--(2) --%>
		<div class="row">
			<div id="Web / Ad Agency" class="col-lg-12">
				<h2 class="page-header">Web / Ad Agency</h2>
			</div>
			<div class="col-md-12 col-lg-12 col-sm-6">
				<p>
					<i class="fa fa-chevron-right"></i> Web agency:
				</p>
				<p>Build websites for Company, Brands and online campaigns.
					Corporate website, Microsites and Promotion webpages, respectively.</p>
				<br>
				<p>
					<i class="fa fa-long-arrow-right"></i> Tasks: Building websites,
					systems, domains, securities, business process, corporate (brands)
					identity and skillful workforce as providing valuable know-hows on
					IT environment for clients.
				</p>

				<br> <br>
				<p>
					<i class="fa fa-chevron-right"></i> Digital Ad Agency: Boost online
					promotions for maximum profits by leveraging digital marketing
					effectively.
				<p>
					<br>
				<p>
					<i class="fa fa-long-arrow-right"></i> Tasks: Social marketing &
					Campaigns (SNS, Blogs, Communities, Korea major portals and etc.),
				</p>
				<p>Search Engines (SEO, SEM), Distribution in open malls and
					Media exposures as providing CPM, CPC and statistical analysis.</p>
			</div>
		</div>

		<%--(3) --%>
		<div class="row">
			<div id="IT Solutions Provider" class="col-lg-12">
				<h2 class="page-header">IT Solutions Provider</h2>
			</div>

			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div
					class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="/CompanyItem/ITProducts/MSOffice/MSOffice.jsp"
						class="btn btn-xs btn-primary pull-right" target="_blank">Learn
						More</a> <strong>MS Office</strong> (Microsoft, US)
				</div>
				<div
					class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="/CompanyItem/ITProducts/Azure/Azure.jsp"
						class="btn btn-xs btn-primary pull-right" target="_blank">Learn
						More</a> <strong>MS Azure </strong> (Microsoft, US)
				</div>
				<div
					class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="/CompanyItem/ITProducts/Windows/Windows.jsp"
						class="btn btn-xs btn-primary pull-right" target="_blank">Learn
						More</a> <strong>MS Windows </strong> (Microsoft, US)
				</div>

				<div
					class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="/CompanyItem/ITProducts/InsWave/InsWave.jsp"
						class="btn btn-xs btn-primary pull-right" target="_blank">Learn
						More</a> <strong>Media Solutions </strong> (InsWave, Korea)
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div
					class="alert alert-danger col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="#" class="btn btn-xs btn-danger pull-right"
						target="_blank">Learn More</a> <strong>IoT, Security
						Solutions </strong> (Aervision, Australia)
				</div>
				<div
					class="alert alert-danger col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.jsp"
						class="btn btn-xs btn-danger pull-right" target="_blank">Learn
						More</a> <strong>Domain, SSL </strong> (Open SRS, US)
				</div>
			</div>

		</div>

		<%--(4) --%>
		<div class="row">
			<div id="IT Edu. / Consulting" class="col-lg-12">
				<h2 class="page-header">IT Edu. / Consulting</h2>
			</div>
			<div class="col-md-12 col-lg-12 col-sm-6">
				<p>
					<i class="fa fa-chevron-right"></i> An IT consultant works in
					partnership with clients,
				</p>
				<p>&nbsp;&nbsp;advising them how to use information technology
					in order to meet their business objectives or overcome problems.</p>

				<p>&nbsp;&nbsp;Consultants work to improve the structure and
					efficiency of an organization's IT systems.</p>

				<br>
				<p>
					<i class="fa fa-chevron-right"></i> IT consultants may be used to
					provide strategic guidance to organizations with regard to
					technology,
				</p>
				<p>&nbsp;&nbsp;IT infrastructures and the enablement of major
					business processes through enhancements to IT.</p>
				<p>&nbsp;&nbsp;They can also be used to provide guidance during
					selection and procurement as well as providing highly expert
					technical assistance, &nbsp;&nbsp;and may be responsible for user
					training and feedback.</p>
				<br>
				<p>
					<i class="fa fa-chevron-right"></i>IT consultants may be involved
					in sales and business development, as well as technical duties.
				</p>

			</div>
		</div>

		<%--(5) --%>
		<div class="row">
			<div id="E-Commerce Services" class="col-lg-12">
				<h2 class="page-header">E-Commerce Services</h2>
			</div>
			<div class="col-lg-12">
				<p>
					<i class="fa fa-chevron-right"></i> An IT consultant works in
					partnership with clients, advising them how to use information
					technology in order to meet their business objectives or overcome
					problems. <br>&nbsp;&nbsp;Consultants work to improve the
					structure and efficiency of an organization's IT systems.

				</p>
				<br>

				<p>
					<i class="fa fa-chevron-right"></i> IT consultants may be used to
					provide strategic guidance to organizations with regard to
					technology, <br>&nbsp;&nbsp;IT infrastructures and the
					enablement of major business processes through enhancements to IT.
					<br>&nbsp;&nbsp;They can also be used to provide guidance
					during selection and procurement as well as providing highly expert
					technical assistance, <br>&nbsp;&nbsp;and may be responsible
					for user training and feedback.


				</p>
				<br>
				<p>
					<i class="fa fa-chevron-right"></i> IT consultants may be involved
					in sales and business development, as well as technical duties.



				</p>

			</div>
		</div>



		<%--(6) --%>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">The Business Concept</h2>
			</div>
			<div class="col-md-12 col-lg-12 col-sm-6">
				<p>Our business models are currently categorized into three
					fundamental sectors and one applied sector (EC as of now).</p>
				<br>
				<p>The fundamental ones are about technology areas that can
					promote or activate online business, and the applied one is about
					independent online business which have strong investment propensity
					in the long-term perspectives.</p>
				<br>
				<p>With the technologies of fundamental sectors, we provide our
					clients with opportunities to boost their business performance but
					also they can be used for our own applied sectors (primarily
					E-Commerce Platform Business for now).</p>
				<br>
				<p>Consequently, our ultimate goal is defined to support and
					back up online business efficiently for remarkable business
					achievements in holistic view.</p>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->