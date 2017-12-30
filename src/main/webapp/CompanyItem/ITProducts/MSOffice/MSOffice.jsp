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
					IT Products <small>MSOffice</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Products</li>
					<li class="active">MSOffice</li>
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

			<div class="col-md-9">


				<!-- 1번 -->
				<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->

				<div class="text-center">
					<h1 style="color: #04A3ED;">What Is Microsoft Office 2016?</h1>
					<hr>
				</div>

				<div class="col-md-12">
					<h3 class="text-left mgb3" style="color: #04A3ED;">완전히 새로워진
						Office에 오신것을 환영합니다.</h3>
					<p>
						작업이든 오락이든 Microsoft가 도와드리겠습니다. Microsoft는 Office 365 Home, Office
						365 Personal, Office Home & Student 2016, Office Home & Business
						2016, Office Professional 2016 등의 Microsoft Office를 제작한 회사입니다.
						Mac용 Office도 제공하고 있습니다. 전문적인 작업을 위해서든 재미가 목적이든 모두 저희가 책임지겠습니다. <br>
						<br>이제 어디를 가든 Office 365를 통해 모든 기기에서 Office를 사용할 수 있습니다.
						Office 365를 구독하시면 PC, Mac, 태블릿, 스마트폰에서 최신 버전의 Word, Excel,
						PowerPoint, Outlook, OneNote 등을 사용할 수 있습니다. 또한 사진, 동영상 및 문서를 위한
						1TB의 OneDrive 클라우드 저장소 및 Microsoft 전문가의 기술 지원이 추가 요금 없이 제공됩니다. <br>
						<br>전문적인 디자인의 프레젠테이션 제작, 스프레드시트 작업, 워드 작업 등 가장 자주 사용하는 기능과
						단축키를 비롯하여 Microsoft Office 2013의 강력한 소프트웨어가 Microsoft Office 2016에
						그대로 남아 있습니다. Office 2016에서는 클라우드에 있는 문서를 열어 수정, 저장하거나 협업을 할 수 있기
						때문에 효율성을 극대화하고 언제 어디서든 일을 처리할 수 있습니다. Microsoft Office는 Open
						Office나 Google Docs와 같은 무료 소프트웨어와 비교해 훨씬 강력하며, 보다 나은 지원 서비스를
						제공합니다. <br> <br>Office Home & Student 2013, Office Home
						& Business 2013, Office Professional 2013 등 이전 버전의 Office를 갖고 계신다면
						Office 365 또는 Office 2016으로 업그레이드할 때가 되었습니다. Microsoft Office 제품을
						살펴보고 사용자의 개인적 필요나 비즈니스 필요에 맞는 완벽한 솔루션을 찾으십시오. <br> <br>
				</div>


				<!-- 				<div class="enter"></div>
 -->


				<!-- 2번 -->
				<div class="text-center">
					<h1 style="color: #04A3ED;">모든 새 Office 응용 프로그램</h1>
					<hr>
				</div>

				<!-- 2.1번 -->
				<div class="row">
					<div class="col-md-12">
						<p>Office 365에는 새로운 Office 2016 버전의 Word, Excel, PowerPoint 등이
							포함되어 있습니다.</p>
					</div>
				</div>

				<div class="enter"></div>

				<!-- 2.2번 -->
				<div class="row">

					<div class="col-xs-12 col-sm-12 col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/MSOffice_2.jpg">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">Word 2016</h3>
						<p>최신의 편집, 검토 및 공유 도구가 포함되어 있습니다.</p>

					</div>
				</div>

				<!-- 2.3번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-md-push-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/MSOffice_3.jpg">
					</div>

					<div class="col-xs-12 col-sm-12 col-md-6 col-md-pull-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">Excel 2016</h3>
						<p>클릭 한 번으로 미래의 추세를 쉽게 예측 할 수 있습니다.</p>

					</div>


				</div>

				<!-- 2.4번 -->
				<div class="row">

					<div class="col-xs-12 col-sm-12 col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/MSOffice_4.jpg">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">PowerPoint
							2016</h3>
						<p>발표자 보기에는 청중에게는 슬라이드만 보이지만 발표자는 모니터로 메모를 볼 수 있습니다.</p>

					</div>
				</div>

				<!-- 2.5번 -->
				<div class="row">

					<div class="col-xs-12 col-sm-12 col-md-6 col-md-push-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/ITProducts/Images/MSOffice_5.jpg">
					</div>

					<div class="col-xs-12 col-sm-12 col-md-6 col-md-pull-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">Outlook
							2016</h3>
						<p>피플 카드에서 바로 회의 일정을 잡거나, 인스턴트 메시지를 보내거나, 전화를 걸 수 있습니다.</p>

					</div>
				</div>


				<div class="enter"></div>

				<div class="vertical_parent col-md-12"
					style="background: url(../Images/MSOffice_6.jpg) no-repeat; background-size: 100% auto;">
					<div
						class="col-md-offset-6 col-sm-offset-6 col-xs-offset-0 col-md-6 col-sm-12 col-xs-12">
						<div class="vertical_child" style="text-align: left;">
							<h3 style="color: #04A3ED;">모든 기기에서 사용할 수 있는 Office</h3>
							<br>
							<p>PC, Mac, 태블릿, 스마트폰 어디에서나 Office가 원활하게 작동 합니다.</p>
						</div>

					</div>
				</div>

				<div class="vertical_parent col-md-12"
					style="background: url(../Images/MSOffice_7.jpg) no-repeat; background-size: 100% auto;">

					<br>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="vertical_child" style="text-align: left;">
							<h3 style="color: #04A3ED;">언제 어디서든 필요한 파일을 이용</h3>
							<br>
							<p>Office 365에 포함되어 있는 1TB OneDrive 클라우드 저장소로 문서, 사진, 동영상,
								음악을 보관, 액세스, 공유하세요.</p>
						</div>

					</div>
				</div>

				<div class="vertical_parent col-md-12"
					style="background: url(../Images/MSOffice_8.jpg) no-repeat; background-size: 100% auto;">

					<br>
					<div
						class="col-md-offset-6 col-sm-offset-0 col-xs-offset-0 col-md-6 col-sm-12 col-xs-12">
						<div class="vertical_child" style="text-align: right;">
							<h3 style="color: #04A3ED;">항상 업그레이드가 포함</h3>
							<br>
							<p>Office 365를 사용하면 오래된 소프트웨어를 사용할 일이 없습니다. 모든 새 업그레이드가 구독에
								포함되기 때문입니다.</p>
						</div>

					</div>
				</div>



				<div class="enter"></div>



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