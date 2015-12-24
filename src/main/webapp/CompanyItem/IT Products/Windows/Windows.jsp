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
					IT Products <small>Azure(MS)</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CompanyItem</li>
					<li class="active">IT Products</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<div class="list-group">
					<a href="/CompanyItem/IT Products/Aervision/Aervision.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="Aervision">Aervision</a> <a
						href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="OpenSRS">OpenSRS</a> <a
						href="/CompanyItem/IT Products/Azure/Azure.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="Azure">Azure</a> <a
						href="/CompanyItem/IT Products/Windows/Windows.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="Windows">Windows</a> <a
						href="/CompanyItem/IT Products/MSOffice/MSOffice.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="OpenSRS">MSOffice</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<%--https://www.microsoft.com/ko-kr/windows/features --%>
			<%-- 이상하게 9로 하면 안맞음. --%>
			<div class="mgtl3 col-md-8">


				<!-- 1번 -->
				<div class="row">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->

					<div class="text-center">
						<h1 style="color: #04A3ED;">Windows의 기능이 더욱 향상되었습니다.</h1>
						<hr>
					</div>

					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">전보다 친숙하고
							향상되었습니다.</h3>
						<p>Windows 10은 시작 메뉴를 포함하여 Windows 7과 상당히 비슷하므로 사용하기 쉽고 친숙합니다.
							Windows 10은 빨리 시작하고 재부팅할 수 있으며 보안 기능이 더 많이 포함되어 있어서 더 안전하게 보안을
							유지할 수 있고 이미 사용하고 있는 소프트웨어 및 하드웨어와 함께 호환되도록 설계되었습니다.</p>
						<br />
						<p>Window 10에는 Windows 7의 장점과 Windows 8의 장점이 결합되었습니다. Windows
							Insider</p>
					</div>
					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_pc_mini_start_nocortana.jpg">
					</div>
				</div>

				<!-- 				<div class="enter"></div>
 -->
				<!-- 2번 -->
				<div class="row">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->
					<%-- block 요소 끼리 중앙정렬 중요. vertical_parent / vertical_child--%>
					<div class="row vertical_parent"
						style="background: url(../Images/lifestyle_guy_computer_1x_flipped.jpg) no-repeat; background-size: 100% auto; height: 300px;">

						<br>
						<div class="col-md-offset-6 col-sm-offset-6 col-xs-offset-6 col-md-6 col-sm-6 col-xs-6">
							<div class="vertical_child" style="text-align: right">
								<h3 style="color: #04A3ED;">수 많은 사람들이 이미 Windows 10을 사용하고
									있습니다.</h3>
								<br>
								<p>Windows Insider Program은 Windows를 사랑하고 개선을 돕고자 하는 팬들의 글로벌
									커뮤니티입니다. 참가자들은 운영체제를 초기 단계에서 볼 수 있어 다듬고 완성하는 데 중요한 역할을 담당합니다.
									또한 참가자들의 피드백은 최고의 Windows를 만드는 데 일조합니다.</p>
							</div>
							<br />
						</div>
					</div>
				</div>
				<div class="enter"></div>

				<!-- 3번 -->
				<div class="row">
					<div class="text-center">
						<h1 style="color: #04A3ED;">작업을 수행하는 방식</h1>
						<hr>
					</div>

					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_squeejee_newbrowser_1x_ko_KRfiletype.png">
					</div>
					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">원하는 방식으로
							웹을 작동하게 합니다.</h3>
						<p>Microsoft Edge는 검색에서 실행으로 빠르게 이동할 수 있습니다.웹 페이지에서 직접 메모를
							작성하거나1 입력하고 다른 사람들과 공유하며 온라인 기사를 집중하여 읽고 좋아하는 기사를 저장해 두고 나중에 편리하게
							읽으세요.</p>

					</div>

				</div>
				<!-- 같은 3번 -->
				<div class="row">

					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_squeejee_multidoing_1x.png">
					</div>
					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">다중 작업을 통해
							업무를 빠르게 “완료”</h3>
						<p>데스크탑을 보다 효율적으로 관리하여 작업을 더 빨리 완료하세요. 최대 4개를 하나의 화면에서 동시에
							스냅하고 더 많은 공간이 필요하거나 프로젝트별로 그룹을 만들고 싶을 때는 가상 데스크톱을 만들 수 있습니다. 예를
							들어 작업을 위한 Office 앱을 모아놓고, 게임 앱은 게임 앱끼리 모아놓을 수 있습니다.</p>
						<br>
						<p>다른 어떤 Windows 버전보다도 훨씬 더 뛰어난 Windows입니다. Windows Insider</p>

					</div>

				</div>
				<div class="enter"></div>

				<!-- 4번 -->
				<div class="row">
					<div class="text-center">
						<h1 style="color: #04A3ED;">원하는 방식으로 작업하는 유연성</h1>
						<hr>
					</div>

					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_2in1_store_1x.jpg">
					</div>
					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">새로운
							Windows 스토어에는 원하는 모든 것이 있습니다.</h3>
						<p>모든 Windows 10 디바이스에서 통합된 쇼핑 환경을 제공하는 새로운 Windows 스토어를
							소개합니다. PC, 태블릿 또는 휴대폰에서 스토어를 탐색하고 앱, 게임, 음악, 동영상 및 TV 프로그램 등 멋진
							무료/유료 디지털 콘텐츠를 손쉽게 다운로드하세요.</p>

					</div>

				</div>


				<!-- 5번 -->
				<div class="row">


					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">Xbox가
							Windows에서 제공될 예정</h3>
						<p>최고의 Xbox 프랜차이즈와 최고의 Xbox Live가 Windows 10에 제공됩니다. 몇 초만에 게임을
							녹화하고 콘솔 플레이어와 경쟁하며 Xbox One에서 가정 내 모든 Windows 10 PC로 게임을 스트리밍하세요.</p>

					</div>
					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_pc_xbox.jpg">
					</div>

				</div>

				<div class="enter"></div>
				<!-- 6번 -->
				<div class="row">

					<div class="text-center">
						<h1 style="color: #04A3ED;">여러 디바이스에서 작동하는 멋진 내장 앱</h1>
						<hr>
					</div>

					<div class="col-md-2 col-sm-2 col-xs-4">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/Apps_Icons_Map.png">
						<p style="color: #04A3ED;">지도</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-4">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/Apps_Icons_Photos.png">
						<p style="color: #04A3ED;">사진</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-4">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/Apps_Icons_Mail.png">
						<p style="color: #04A3ED;">메일</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-4">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/Apps_Icons_Music.png">
						<p style="color: #04A3ED;">Groov 음악</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-4">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/Apps_Icons_MovieTV.png">
						<p style="color: #04A3ED;">영화 및 TV</p>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-4">
						<img class="img-responsive"
							src="/CompanyItem/IT Products/Images/icon_onedrive.png">
						<p style="color: #04A3ED;">OneDrive</p>
					</div>
				</div>


				<!-- 7번 -->
				<div class="row">
					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_family_continuum_Non-CortanaMarket.jpg">
					</div>
					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">최적의 화면을 항상
							표시</h3>
						<p>Windows 10에서 앱은 모든 터치 PC와 태블릿의 모든 모드에서 잘 보이고 훌륭하게 작동할 수
							있습니다.</p>

					</div>

				</div>

				<div class="enter"></div>

				<!-- 8번 -->
				<div class="row">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->
					<%-- block 요소 끼리 중앙정렬 중요. vertical_parent / vertical_child--%>
					<div class="row vertical_parent"
						style="background: url(../Images/lifestyle_girl_tablet_1x.jpg) no-repeat; background-size: 100% 520px;">
						<br>
						<div class="col-md-6">
							<div class="vertical_child" style="text-align: Left">
								<h3 style="color: #04A3ED;">원하는 디바이스와 상호 작용</h3>
								<br>
								<p>터치, 입력, 필기 또는 말하기: 사용자가 작업에 가장 적합한 방식을 선택할 수 있습니다.</p>
								<br> <br>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<img class="img-responsive"
										src="/CompanyItem/IT Products/Images/touch.png"
										data-toggle="tooltip" data-placement="bottom"
										data-original-title="터치">
									<p>웹 페이지에 글쓰기, 살짝 밀어 사진 탐색하기, 앱 고정시키기와 같은 작업을 하세요.</p>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6 enter">
									<img class="img-responsive"
										src="/CompanyItem/IT Products/Images/type.png"
										data-toggle="tooltip" data-placement="bottom"
										data-original-title="키보드입력">
									<p>더 많은 작업을 해야 한다면 터치 기능이 있는 디바이스에서 키보드 또는 터치 키보드를 사용하세요.</p>
								</div>


								<div class="col-md-6 col-sm-6 col-xs-6">
									<img class="img-responsive"
										src="/CompanyItem/IT Products/Images/stylus.png"
										data-toggle="tooltip" data-placement="bottom"
										data-original-title="필기">
									<p>펜을 사용해 자연스럽게 그림을 그리거나 파일에 메모를 추가하거나 문서에 서명하거나 그리기 앱을
										즐겨보세요.</p>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<img class="img-responsive"
										src="/CompanyItem/IT Products/Images/voice.png"
										data-toggle="tooltip" data-placement="bottom"
										data-original-title="말하기">
									<p>Skype에서 친구나 가족과 채팅하세요.</p>
								</div>
							</div>
							<br />
						</div>
					</div>
				</div>


				<!-- 9번 -->
				<div class="row">
					<div class="col-md-6">
						<img class="thumbnail img-responsive" alt="Bootstrap template"
							src="/CompanyItem/IT Products/Images/device_laptop_smile.jpg">
					</div>
					<div class="col-md-6">
						<h3 class="text-left mgb3" style="color: #04A3ED;">당신만의
							Windows</h3>
						<p>당신의 콘텐츠를 담을 수 있는 디바이스는 많지만, 진정으로 개인적인 환경을 제공하는 것은
							Windows입니다. Windows Hello는 현재 사용하는 디바이스의 상태 정보를 토대로 사용자를 인식하고 확인할
							수 있으므로 더 안전한 보안 기능과 편리한 기능을 제공합니다.</p>
						<br>
						<p>참고: Windows Hello는 일부 신제품에서 곧 사용할 수 있습니다.</p>

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