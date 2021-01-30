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
			<img src="/CompanyItem/zImage/OfficeSuite.png"
				class="img-responsive res_width fix_height_300" alt="CompanyItem">
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
					IT Products <small>OfficeSuite</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Products</li>
					<li class="active">OfficeSuite</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row ">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CompanyItem/ITProducts/ITProductsLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9">
				<!-- OpenSRS_SSL Certificates -->

				<div class="row">
					<div class="enter"></div>
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<strong>OfficeSuite 완벽한 6-in-1 오피스팩과 21년 신규 출시 된 PDF
								Extra로 <br>문서의 완성도를 극대화 하는 놀라운 경험을 누려보세요.<hr>
							</strong>
						</h3>
						<p>
							<br>OfficeSuite for Windows는 문서 작업을 수행하는 데 필요한 모든 도구를 제공합니다.
							문서, 스프레드시트, 프레젠테이션을 만들고 PDF에서 파일을 내보내고 변환할 수 있는 PDF편집기를 이용할 수 있을
							뿐만 아니라, 작업이 완료되면 MobiSystems드라이브에 파일을 업로드하거나 통합 메일을 통해서 파일 전송이
							가능합니다.
						</p>
						<br>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12">
					<img class="img-responsive" alt="OfficeSuite Products"
						src="/CompanyItem/ITProducts/OfficeSuite/Images/officesuite_products.png">
				</div>


				<div class="social-box">
					<div class="row">
						<div class="col-lg-7 col-xs-12 text-center pgtb3">
							<div class="box">
								<div class="box-title text-left">
									<h4>
										<strong>파일 형식과 관계 없이 모든 문서 포멧과 호환 됩니다.</strong>
									</h4>
								</div>
								<div class="box-text text-left">
									<h5 class="box-btn">
										<strong>지원포멧 자세히 보기 : </strong>
									</h5>

									<p>
										<span class="glyphicon glyphicon-ok text-success"> </span> <span>Microsoft
											Office (DOC, DOCX, DOCM, XLS, XLSX, XLSM, PPT, PPTX, PPS,
											PPSX, PPTM, PPSM)</span>
									</p>
									<p>
										<span class="glyphicon glyphicon-ok text-success"> </span><span>
											OpenDocument (ODT, ODS, ODP)</span>
									</p>
									<p>
										<span class="glyphicon glyphicon-ok text-success"> </span><span>
											RTF, CSV, ZIP과 같은 기타 자주 사용되는 형식.</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-5 col-xs-12">
							<div class="enter"></div>
							<img class="img-responsive" alt="OfficeSuite Products"
								src="/CompanyItem/ITProducts/OfficeSuite/Images/CompatibleSectionIcons.png">
							<h5 class="text-left">
								<strong>- OfficeSuite는 사용자 편의성과 사용성을 고려한 새롭고 감각적인 UI/
									UX를 제공합니다.</strong>
							</h5>
							<br>
							<h5 class="text-left">
								<strong>- OfficeSuite PDF 편집기는 Adobe Acrobat Reader가
									제공할 수 있는 모든 것 이상의 완벽한 PDF편집 기능을 제공합니다.</strong>
							</h5>
						</div>
					</div>
				</div>


				<div class="row pgtb3" style="background-color: #f2f2f2;">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>
							<br> <strong>파일 저장 및 관리. </strong>
						</h3>
						<h4>언제 어디서나 OfficeSuite를 사용하여 파일 접근,삭제,수정을 하실 수 있습니다.</h4>
						<br>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<p class="col-md-12">
								<img class="img-responsive" alt="CloudIcons"
									src="/CompanyItem/ITProducts/OfficeSuite/Images/CloudIcons.png">
							</p>
							<h5 class="text-left">
								<strong>다양한 클라우드 서비스로 원활하게 작업 가능합니다. <br>Dropbox,
									Box, OneDrive 클라우드 저장소를 연결하고 OfficeSuite에서 액세스 하세요.
								</strong>
							</h5>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<p class="col-md-10">
								<img class="img-responsive" alt="mobisystem"
									src="/CompanyItem/ITProducts/OfficeSuite/Images/mobisystemdrive.png">
							</p>
							<h5 class="text-left">
								<strong>MobiSystems 드라이브에 50GB의 스토리지를 확보하십시오. <br>문서를
									저장, 관리 및 동기화하여 언제 어디서나 관리 할 수 있습니다.
								</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="enter"></div>
				<div class="col-lg-12">
					<table
						class="table table-bordered table-hover table-striped text-center">
						<colgroup>
							<col style="width: 34%;">
							<col style="width: 11%;">
							<col style="width: 11%;">
							<col style="width: 11%;">
							<col style="width: 11%;">
							<col style="width: 11%;">
							<col style="width: 11%;">
						</colgroup>
						<thead>
							<tr class="well">
								<th class="text-center">특 징</th>
								<th class="text-center">
									<h5>
										<strong>OfficeSuite</strong>
									</h5>
								</th>
								<th class="text-center">
									<h5>
										<strong>Microsoft Office</strong>
									</h5>
								</th>
								<th class="text-center">
									<h5>
										<strong>Open Office</strong>
									</h5>
								</th>
								<th class="text-center">
									<h5>
										<strong>Hancome Office</strong>
									</h5>
								</th>
								<th class="text-center">
									<h5>
										<strong>Polaris Office</strong>
									</h5>
								</th>
								<th class="text-center">
									<h5>
										<strong>WPS Office </strong>
									</h5>
								</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>Integrated PDF viewer and editor</td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
							</tr>


							<tr>
								<td>Support for Microsoft Office formats</td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
							</tr>
							<tr>
								<td>Included Mail with calendar</td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>

							</tr>
							<tr>
								<td>Support for multiple Cloud service</td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
							</tr>
							<tr>
								<td>Mobile platforms support – Android, iOS</td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
							</tr>
							<tr>
								<td>Familiar user interface</td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
							</tr>

						</tbody>
					</table>
					<div class="enter"></div>
				</div>

				<!-- 2번 -->
				<div class="col-xs-12 col-sm-12 col-md-12 text-center">
					<h3>
						<br><strong>2021년 새로운 PDF Extra 출시. </strong><hr><br>
					</h3>
				</div>

				<!-- 2.1번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6">
						<img class="thumbnail img-responsive" alt="21pdfextra_01"
							src="/CompanyItem/ITProducts/OfficeSuite/Images/21pdfextra_01.png">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6">
						<h3 class="text-left mgb3" style="">텍스트 & 이미지 수정 기능.</h3>
						<p>PDF문서에서 텍스트와 이미지를 빠르고 손쉽게 변경할 수 있습니다.</p>
					</div>
				</div>

				<!-- 2.2번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-md-push-6">
						<img class="thumbnail img-responsive" alt="21pdfextra_02"
							src="/CompanyItem/ITProducts/OfficeSuite/Images/21pdfextra_02.png">
					</div>

					<div class="col-xs-12 col-sm-12 col-md-6 col-md-pull-6">
						<h3 class="text-left mgb3">서명 기능</h3>
						<p>인쇄/스캔 작업 없이 PDF문서에 손쉽게 서명할 수 있습니다.</p>
					</div>
				</div>
				<!-- 2.3번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6">
						<img class="thumbnail img-responsive" alt="21pdfextra_03"
							src="/CompanyItem/ITProducts/OfficeSuite/Images/21pdfextra_03.png">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6">
						<h3 class="text-left mgb3" style="">문서 변환 기능.</h3>
						<p>PDF문서에서 Word & Excel & EPub로 손쉽게 변환 가능합니다.</p>
					</div>
				</div>

				<!-- 2.4번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-md-push-6">
						<img class="thumbnail img-responsive" alt="21pdfextra_04"
							src="/CompanyItem/ITProducts/OfficeSuite/Images/21pdfextra_04.png">
					</div>

					<div class="col-xs-12 col-sm-12 col-md-6 col-md-pull-6">
						<h3 class="text-left mgb3">문서 보안</h3>
						<p>대외비 등 중요 문서에 대하여 안전하게 암호화 및 비밀번호 설정이 가능합니다.</p>
					</div>
				</div>

				<!-- 2.5번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6">
						<img class="thumbnail img-responsive" alt="21pdfextra_05"
							src="/CompanyItem/ITProducts/OfficeSuite/Images/21pdfextra_05.png">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6">
						<h3 class="text-left mgb3" style="">클라우드 스토리지 제공.(5GB)</h3>
						<p>PDF문서를 MobiDrive 클라우드 스토리지에 저장 및 관리가 가능합니다.</p>
					</div>
				</div>

				<!-- 2.2번 -->
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-md-push-6">
						<img class="thumbnail img-responsive" alt="21pdfextra_06"
							src="/CompanyItem/ITProducts/OfficeSuite/Images/21pdfextra_06.png">
					</div>

					<div class="col-xs-12 col-sm-12 col-md-6 col-md-pull-6">
						<h3 class="text-left mgb3">다양한 서식 기능</h3>
						<p>협업을 위한 다양한 PDF 주석/서식(메모, 마크업, 텍스트 설명선, 형관펜 강조, 언더라인)이용
							가능합니다.</p>
					</div>
				</div>


				<div class="enter"></div>
				<!-- /.row -->

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