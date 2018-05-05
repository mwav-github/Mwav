<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단에 이부분안해주면 다른 페이지에서 인코딩 깨진다.  --%>
<%--(1) --%>
<!-- Page Heading/Breadcrumbs -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Company <small> Greetings</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li>Company</li>
			<li class="active">Greetings</li>
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

		<!-- (1) Greetings -->
		<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header mwav_leftText">CEO Greeting</h2>
			</div>
			<div class="col-md-9 col-lg-9 col-sm-7">
				<br>
				<p class="lead">안녕하세요. 엠웨이브넷 경영진입니다.</p>
				<br>
				<p>우선 저희 엠웨이브넷을 관심을 가지고 방문해 주신 고객 및 관계사 여러분들께 깊은 감사의 말씀 전합니다.</p>
				<p>인터넷 초창기에 마음 맞는 개발자 중심의 작은 커뮤니티에서 시험적으로 시작해 본 것이 이제는 꽤 많은 시간이
					지난 듯합니다.</p>
				<p>우리는 오늘날 Social, Mobile, Cloud, Analytics, IoT 등의 인터넷기술을 배제하고는
					상상하기 힘든 사업환경 속에 살고 있습니다.</p>
				<p>하지만,일반기업들이 이런 기술을 최적화하여 사업에 활용하는 것이 쉽지 않음은 이미 알고 있습니다.</p>

				<p>따라서 인터넷 기반의 사업을 진행하면서 저희의 처음처럼 경험 부족으로 어려움을 겪고 계실 것이라
					생각됩니다.그런 사업체를 대상으로 기회를 함께 보고, 전문분야를 서로 공유하고자 합니다.</p>
				<p>IT 컨설팅에서 개발,유지보수, 프로모션운영까지 저희의 축적된 경험이 귀사의 성공으로 가는 여정에 토대가 되어
					드릴 것이라 확신하며, 느낄 수 있는 보람이라 생각하겠습니다.</p>

				<br>
				<p>앞으로 IT환경이 삶에 미칠 영향력의 크기는 정확히 예측하기 어렵지만,분명한 것은 이러한 파급효과는 지속되고
					세분화되어 인터넷 문화의 한 축으로 공고히 자리 잡게 될 것이라는 것입니다.</p>
				<p>그 문화중심에서고객사와 함께 온라인 Business 문화를 선도하고 가치를 창조하여 파트너로써 다양한 역할을
					수행할 것을 약속 드립니다.</p>
				<p>아울러 마지막으로 내실 있고 자사만의 색깔을 가진 조직으로 발전하여 미래지향적인 글로벌 시대에 새로운 지평을
					열겠습니다.</p>
				<p>고객감동을 통한 최고의 기업가치를 제공할 수 있도록 열정을 가지고 임하겠습니다.</p>
				<br> <br>
				<p class="text-right">
					<strong>CEO: Lewis.Kim</strong>
				</p>
			</div>

			<div class="col-md-3 col-lg-3 col-sm-5">
				<div class="well">
					<img class="thumbnail img-responsive" alt="Bootstrap template"
						src="http://www.prepbootstrap.com/Content/images/shared/houses/h7.jpg" />
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->