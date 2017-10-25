<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단에 이부분안해주면 다른 페이지에서 인코딩 깨진다.  --%>
<%--(1) --%>

<!-- Page Heading/Breadcrumbs -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Company <small> History</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li>Company</li>
			<li class="active">History</li>
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

		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header mwav_leftText">History</h2>
			</div>
			<div class="col-lg-10">

				<div id="timeline">
					<div class="row timeline-movement timeline-movement-top">
						<div class="timeline-badge timeline-future-movement">
							<a href="#"> <span class="glyphicon glyphicon-plus"></span>
							</a>
						</div>
						<div class="timeline-badge timeline-filter-movement">
							<a href="#"> <span class="glyphicon glyphicon-time"></span>
							</a>
						</div>

					</div>
					<div class="row timeline-movement">

						<div class="timeline-badge">
							<span class="timeline-balloon-date-day">18</span> <span
								class="timeline-balloon-date-month">APR</span>
						</div>


						<div class="col-sm-3  timeline-item">
							<div class="row">
								<div class="col-sm-11">
									<div class="timeline-panel credits">
										<ul class="timeline-panel-ul">
											<li><span class="importo">Mussum ipsum cacilds</span></li>
											<li><span class="causale">Lorem ipsum dolor sit
													amet, consectetur adipiscing elit. </span></li>
											<li><p>
													<small class="text-muted"><i
														class="glyphicon glyphicon-time"></i> 11/09/2014</small>
												</p></li>
										</ul>
									</div>

								</div>
							</div>
						</div>

						<div class="col-sm-3  timeline-item">
							<div class="row">
								<div class="col-sm-offset-1 col-sm-11">
									<div class="timeline-panel debits">
										<ul class="timeline-panel-ul">
											<li><span class="importo">Mussum ipsum cacilds</span></li>
											<li><span class="causale">Lorem ipsum dolor sit
													amet, consectetur adipiscing elit. </span></li>
											<li><p>
													<small class="text-muted"><i
														class="glyphicon glyphicon-time"></i> 11/09/2014</small>
												</p></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->