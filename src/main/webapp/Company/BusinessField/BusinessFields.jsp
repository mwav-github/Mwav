<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단에 이부분안해주면 다른 페이지에서 인코딩 깨진다.  --%>
<%--(1) --%>
<!-- Page Heading/Breadcrumbs -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Company <small> Business Fields</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li>Company</li>
			<li class="active">Business Fields</li>
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
				<h2 class="page-header mwav_leftText">Business Fields</h2>
			</div>



			<!-- <div class="col-md-12 text-center">
				<div class="col-md-3 col-sm-3 col-xs-3 well">
					<h4>
						Web / Ad Agency<br>
					</h4>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 well">
					<h4>
						IT Solutions Provider<br>
					</h4>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 well">
					<h4>
						IT Edu. / Consulting<br>
					</h4>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 well">
					<h4>E-Commerce Services</h4>
				</div>
				<div class="enter"></div>
			</div> -->


			<div class="item row col-md-12">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="block block-3">
						<h4 class="fontsize_20">Web / Ad Agency</h4>
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="block block-2">
						<h4 class="fontsize_20">IT Solutions Provider</h4>

					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="block block-1">
						<h4 class="fontsize_20">IT Edu. / Consulting</h4>
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="block block-4">
						<h4 class="fontsize_20">E-Commerce Services</h4>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="enter"></div>

				<h4 class="text-left" style="color: #78828D;">
					<strong>- Web / Ad Agency is sort of simple IT- business
						model suitable for startups.</strong>
				</h4>
				<h4 class="text-left" style="color: #78828D;">
					<strong>- Obtains most of IT Solutions by global
						partnership.</strong>
				</h4>
				<h4 class="text-left" style="color: #78828D;">
					<strong>- E-Commerce platform is to be developed in house
						and services to be operated by stakeholders</strong>
				</h4>
				<h4 class="text-left" style="color: #78828D;">
					<strong>- Provides 4 business models including an
						independent business (E-Commerce).</strong>
				</h4>
			</div>

		</div>

		<%--(2) --%>

		<hr class="hr_b">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-8">
				<h3 class="text-left mgb3" style="color: #78828D;">
					<strong>Web / Ad Agency</strong>
				</h3>
				<p>Web agency: Build websites for Company, Brands and online
					campaigns. Corporate website, Microsites and Promotion webpages,
					respectively.</p>
				<br>
				<p>Tasks: Building websites, systems, domains, securities,
					business process, corporate (brands) identity and skillful
					workforce as providing valuable know-hows on IT environment for
					clients.</p>
				<br>
				<p>Digital Ad Agency: Boost online promotions for maximum
					profits by leveraging digital marketing effectively.</p>
				<p>Tasks: Social marketing & Campaigns (SNS, Blogs, Communities,
					Korea major portals and etc.), Search Engines (SEO, SEM),
					Distribution in open malls and Media exposures as providing CPM,
					CPC and statistical analysis.</p>
			</div>
			<div
				class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
				<img class="thumbnail img-responsive" alt="Bootstrap template"
					src="/Company/zImage/advertisement.png">
			</div>
		</div>
		<div class="enter"></div>
		<hr class="hr_b">

		<div class="row ">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<h3 class="text-left mgb3" style="color: #78828D;">
					<strong>IT Solutions Providers</strong>
				</h3>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<div
						class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/MSOffice/MSOffice.mwav"
							class="btn btn-xs btn-primary pull-right" target="_blank">Learn
							More</a> <strong>MS Office</strong> (Microsoft, US)
					</div>
					<div
						class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/Azure/Azure.mwav"
							class="btn btn-xs btn-primary pull-right" target="_blank">Learn
							More</a> <strong>MS Azure </strong> (Microsoft, US)
					</div>
					<div
						class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/Windows/Windows.mwav"
							class="btn btn-xs btn-primary pull-right" target="_blank">Learn
							More</a> <strong>MS Windows </strong> (Microsoft, US)
					</div>

					<div
						class="alert alert-info col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/InsWave/InsWave.mwav"
							class="btn btn-xs btn-primary pull-right" target="_blank">Learn
							More</a> <strong>Media Solutions </strong> (InsWave, Korea)
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<div
						class="alert alert-danger col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/Aervision/Aervision.mwav"
							class="btn btn-xs btn-danger pull-right" target="_blank">Learn
							More</a> <strong>IoT, Security Solutions </strong> (Aervision,
						Australia)
					</div>
					<div
						class="alert alert-danger col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.mwav"
							class="btn btn-xs btn-danger pull-right" target="_blank">Learn
							More</a> <strong>Domain, SSL </strong> (Open SRS, US)
					</div>

					<div
						class="alert alert-danger col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<a href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.mwav"
							class="btn btn-xs btn-danger pull-right" target="_blank">Learn
							More</a> <strong>HTML 5 Charts, Stock, Maps Solutions</strong>
						(HightSoft, Norway)
					</div>
				</div>
			</div>
		</div>

		<%--(3) --%>
		<hr class="hr_b">
		<div class="row">
			<div id="IT Edu. / Consulting" class="col-xs-12 col-sm-8 col-md-8">
				<h3 class="text-left mgb3" style="color: #78828D;">
					<strong>IT Edu. / Consulting</strong>
				</h3>
				<p>An IT consultant works in partnership with clients, advising
					them how to use information technology in order to meet their
					business objectives or overcome problems. Consultants work to
					improve the structure and efficiency of an organization's IT
					systems.</p>
				<br>
				<p>IT consultants may be used to provide strategic guidance to
					organizations with regard to technology, IT infrastructures and the
					enablement of major business processes through enhancements to IT.

					They can also be used to provide guidance during selection and
					procurement as well as providing highly expert technical
					assistance, and may be responsible for user training and feedback.</p>
				<br>
				<p>IT consultants may be involved in sales and business
					development, as well as technical duties.</p>
			</div>
			<div
				class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
				<img class="thumbnail img-responsive" alt="Bootstrap template"
					src="/Company/zImage/IT_Consulting.jpg">
			</div>
		</div>
		<div class="enter"></div>
		<hr class="hr_b">

		<%--(4) --%>
		<div class="row">
			<div id="IT Edu. / Consulting" class="col-xs-12 col-sm-8 col-md-8">
				<h3 class="text-left mgb3" style="color: #78828D;">
					<strong>E-Commerce Services</strong>
				</h3>
				<p>An IT consultant works in partnership with clients, advising
					them how to use information technology in order to meet their
					business objectives or overcome problems. Consultants work to
					improve the structure and efficiency of an organization's IT
					systems.</p>
				<br>
				<p>IT consultants may be used to provide strategic guidance to
					organizations with regard to technology, IT infrastructures and the
					enablement of major business processes through enhancements to IT.
					They can also be used to provide guidance during selection and
					procurement as well as providing highly expert technical
					assistance, and may be responsible for user training and feedback.</p>
				<br>
				<p>IT consultants may be involved in sales and business
					development, as well as technical duties.</p>
			</div>
			<div
				class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0 col-md-4 col-md-offset-0">
				<img class="thumbnail img-responsive" alt="Bootstrap template"
					src="/Company/zImage/e_commerce.jpg">
			</div>
		</div>
		<div class="enter"></div>
		<hr class="hr_b">

		<%--(5) --%>

		<div class="row">
			<div id="IT Edu. / Consulting" class="col-xs-12 col-sm-12 col-md-12">
				<h3 class="text-left mgb3" style="color: #78828D;">
					<strong>The Business Concept</strong>
				</h3>
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