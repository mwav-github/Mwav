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
					IT Products <small>InsWav</small>
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
					<a href="/CompanyItem/ITProducts/Aervision/Aervision.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="Aervision">Aervision</a> <a
						href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="OpenSRS">OpenSRS</a> <a
						href="/CompanyItem/ITProducts/Azure/Azure.jsp"
						class="list-group-item " data-toggle="tooltip"
						data-placement="top" data-original-title="Azure">Azure</a> <a
						href="/CompanyItem/ITProducts/Windows/Windows.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="Windows">Windows</a> <a
						href="/CompanyItem/ITProducts/MSOffice/MSOffice.jsp"
						class="list-group-item" data-toggle="tooltip" data-placement="top"
						data-original-title="MSOffice">MSOffice</a> <a
						href="/CompanyItem/ITProducts/InsWave/InsWave.jsp"
						class="list-group-item active" data-toggle="tooltip"
						data-placement="top" data-original-title="InsWave">InsWave</a>
				</div>
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="mgtl3 col-md-8 ">


				<!-- 인터넷 뉴스안내  -->
				<div class="row">
					<div class="text-center">
						<%--아래 a태그 자체에 색 적용시 가능하다. --%>
						<h1 style="color: #90ba82;">인터넷 뉴스 안내</h1>
						<hr class="hr_g">
					</div>

					<div class="col-md-12">
						<p>Mwav에서 제공하는 인터넷 뉴스의 특별한 서비스 내용을 안내해드립니다.</p>

						<p>제품에 대한 브로셔와 자세한 정보는 연락 주시면 상세히 설명드리겠습니다.</p>
<!-- 						<p class="text-right">
							<A href="mailto:sales@aervision.com" style="color: #990085;">JuSung.kim@mwav.net</a>
						</p> -->
						<div class="enter"></div>

					</div>
					<!-- One -->
					<div class="row">
						<div class="col-md-4">
							 <img
								class="img-responsive img-hover"
								src="/CompanyItem/ITProducts/Images/InsWave_Service_01.gif"
								alt="">
							
						</div>
						<div class="col-md-8">
							<p>- 언론사의 특성에 맞는 화면 구성과 디자인으로 빠르게 세팅 해 드립니다.</p>
							<p>- 고객센터를 통해 신속한 업무지원을 해 드립니다.</p>

						</div>
					</div>
					<div class="enter"></div>
					<hr>

					<!-- Two -->
					<div class="row">
						<div class="col-md-4">
							<img
								class="img-responsive img-hover"
								src="/CompanyItem/ITProducts/Images/InsWave_Service_02.gif"
								alt="">
							
						</div>
						<div class="col-md-8">
							<p>- 전문 보도자료 제작 업체의 기사를 제공 해 드립니다.</p>
							<p>- 인스정보 회원사들간의 기사공유 시스템으로 다양한 기사이용이 가능합니다.</p>

						</div>
					</div>
					<div class="enter"></div>
					<hr>


					<!-- Three -->
					<div class="row">
						<div class="col-md-4">
							<img
								class="img-responsive img-hover"
								src="/CompanyItem/ITProducts/Images/InsWave_Service_03.gif"
								alt="">
							
						</div>
						<div class="col-md-8">
							<p>- 네이버, 다음, 줌, 구글 등 포털로 기사전송 기능을 제공합니다.</p>
							<p>- PC와 태블릿, 스마트 폰 등 다양한 환경에도 동영상 뉴스를 안정적으로 제공하는 와우자 미디어 서버
							</p>
							<p>- 지면신문을 발행하는 언론사를 위한 PDF.Ebook</p>

						</div>
					</div>
					<div class="enter"></div>
					<hr>


					<!-- Four -->
					<div class="row">
						<div class="col-md-4">
							<img
								class="img-responsive img-hover"
								src="/CompanyItem/ITProducts/Images/InsWave_Service_04.gif"
								alt="">
							
						</div>
						<div class="col-md-8">
							<p>- 모바일 웹을 제공하며 언론사의 특성에 맞는 구성으로 운영하세요.</p>
							<p>- 초고속 검색엔진 사용으로 방대한 양의 데이터도 빠르게 검색됩니다.</p>
							<p>- 타언론사 기사 검색 기능도 있어 연계 검색이 가능합니다.</p>
							<p>- 빠른 변화의 흐름에 맞춘 기능개발과 디자인 스킨등 다양한 업데이트가 이루어집니다.</p>

						</div>
					</div>
					<!-- /.row -->
				</div>
				<div class="enter"></div>


				<!-- 서비스안내 -->
				<div class="row">
					<div class="text-center">
						<%--아래 a태그 자체에 색 적용시 가능하다. --%>
						<h1 style="color: #90ba82;">서비스 안내</h1>
						<hr class="hr_g">
					</div>

					<div class="col-md-12">
						<p>인터넷 뉴스 유형별 서비스 내용을 상세하게 안내 해 드립니다.</p>

						<p>제품에 대한 브로셔와 자세한 정보는 연락 주시면 상세히 설명드리겠습니다.</p>
<!-- 						<p class="text-right">
							<A href="mailto:JuSung.kim@mwav.net" style="color: #990085;">JuSung.kim@mwav.net</a>
						</p> -->
						<div class="enter"></div>

					</div>
					<div class="col-md-12">
						<ul id="myTab" class="nav nav-pills nav-justified">
							<li class="active"><a href="#Basic" data-toggle="tab">기본형</a></li>
							<li class=""><a href="#Customized" data-toggle="tab">맞춤형</a></li>
							<li class=""><a href="#DistributedServer" data-toggle="tab">
									서버 분산형</a></li>
							<li class=""><a href="#Paytype" data-toggle="tab"> 유료형</a></li>
						</ul>

						<div id="myTabContent" class="tab-content">
							<div class="enter"></div>
							<!-- Basic -->
							<div class="tab-pane fade active in" id="Basic">
								<p>
									<strong>기본형:</strong>
								</p>
								<br> <br>

								<ul>
									<li>뉴스데이터 통합 및 이미지데이터, 동영상데이터 DB화 (10년이상 파일을 저장할 수 있는 구성)</li>
									<li>통신원들의 회원가입을 통한 사이버기자 시스템</li>
									<li>관리자모드를 통한 전체적인 사이트 관리</li>
									<li>보조관리자 기능을 통한 효율적인 사이트 관리</li>
									<li>HTML편집기, 자유로운 본문사진 배치</li>
									<li>다양한 디자인 스킨 제공</li>
									<li>본문사진 워터마크 기능(본문사진에 저작권 표시)</li>
									<li>트위터, 페이스북, 카카오톡 등 SNS기사보내기</li>
									<li>배너/팝업 관리 및 라이브폴</li>
									<li>외부동영상 연동(유투브, 다음, 네이버 등의 외부동영상 삽입가능)</li>
									<li>유료클릭광고 제공(리얼클릭과 제휴)</li>
									<li>후원시스템 (CMS, 카드결제)</li>
									<li>공유기사 제공 (인스 회원사간의 공유기사 시스템)</li>
									<li>연예/스포츠 기사 제공</li>
									<li>보도자료 제공 (보도자료 전문업체와 제휴)</li>
									<li>포털사이트 기업메일로의 연결(네이버 works)</li>
									<li>뉴스레터 발송 기능</li>
									<li>초고속 검색 엔진 도입(유료)</li>
									<li>다양한 스킨의 모바일 웹 제공(유료)</li>
									<li>네이버, 다음, 줌, 구글 등 포털기사전송 기능(유료)</li>
									<li>PDFㆍEbook 보기 기능(유료)</li>
									<li>핸드폰, 아이핀을 통한 본인확인 인증 기능(유료)</li>
								</ul>
							</div>

							<!-- Customized -->
							<div class="tab-pane fade in" id="Customized">
								<p>
									<strong>맞춤형:</strong>
								</p>
								<p>맞춤형 작업으로 언론사만의 고유 디자인과 기능으로 인터넷 뉴스를 운영할 수 있습니다.</p>
								<p>
									기획안을 접수 받아 협의 후 진행니다. <br> -개별 프로그램 작업이 필요하므로 요청사항에 따라
									독립서버 사용여부 결정.
								</p>
								<br> <br>
								<ul>
									<li>뉴스데이터 통합 및 이미지데이터, 동영상데이터 DB화 (10년이상 파일을 저장할 수 있는 구성)</li>
									<li>통신원들의 회원가입을 통한 사이버기자 시스템</li>
									<li>관리자모드를 통한 전체적인 사이트 관리</li>
									<li>보조관리자 기능을 통한 효율적인 사이트 관리</li>
									<li>HTML편집기, 자유로운 본문사진 배치</li>
									<li>다양한 디자인 스킨 제공</li>
									<li>본문사진 워터마크 기능(본문사진에 저작권 표시)</li>
									<li>트위터, 페이스북, 카카오톡 등 SNS기사보내기</li>
									<li>배너/팝업 관리 및 라이브폴</li>
									<li>외부동영상 연동(유투브, 다음, 네이버 등의 외부동영상 삽입가능)</li>
									<li>유료클릭광고 제공(리얼클릭과 제휴)</li>
									<li>후원시스템 (CMS, 카드결제)</li>
									<li>공유기사 제공 (인스 회원사간의 공유기사 시스템)</li>
									<li>연예/스포츠 기사 제공</li>
									<li>보도자료 제공 (보도자료 전문업체와 제휴)</li>
									<li>포털사이트 기업메일로의 연결(네이버 works)</li>
									<li>뉴스레터 발송 기능</li>
									<li>초고속 검색 엔진 도입(유료)</li>
									<li>다양한 스킨의 모바일 웹 제공(유료)</li>
									<li>네이버, 다음, 줌, 구글 등 포털기사전송 기능(유료)</li>
									<li>PDFㆍEbook 보기 기능(유료)</li>
									<li>핸드폰, 아이핀을 통한 본인확인 인증 기능(유료)</li>
								</ul>
							</div>

							<!-- Distributed Server -->
							<div class="tab-pane fade in" id="DistributedServer">
								<p>
									<strong>서버 분산형:</strong>
								</p>
								<p>다중 웹서버 구축을 지원합니다.</p>
								<p>라운드로빈(로드밸런싱)으로 서버 분산 시 한대의 서버에 업로드 된 파일을 여러 서버에 동시 업로드
									합니다. - 사용자들은 어느 서버를 접속해도 동일함</p>
								<p>메인 페이지 기사 페이지를 직접 html로 생성하여 DB연결을 하지 않기 때문에 DB 부하를
									줄여줍니다.</p>
								<p>1대의 서버당 50만 페이지뷰 이상 접속 가능합니다. - 현재 웹 서버 2대, DB서버 1대로 100만
									페이지뷰 이상의 접속자가 발생하는 사이트를 운영 중</p>
								<p>서버 기본 구성 : 2대</p>
								<br> <br>
								<ul>
									<li>뉴스데이터 통합 및 이미지데이터, 동영상데이터 DB화 (10년이상 파일을 저장할 수 있는 구성)</li>
									<li>통신원들의 회원가입을 통한 사이버기자 시스템</li>
									<li>관리자모드를 통한 전체적인 사이트 관리</li>
									<li>보조관리자 기능을 통한 효율적인 사이트 관리</li>
									<li>HTML편집기, 자유로운 본문사진 배치</li>
									<li>다양한 디자인 스킨 제공</li>
									<li>본문사진 워터마크 기능(본문사진에 저작권 표시)</li>
									<li>트위터, 페이스북, 카카오톡 등 SNS기사보내기</li>
									<li>배너/팝업 관리 및 라이브폴</li>
									<li>외부동영상 연동(유투브, 다음, 네이버 등의 외부동영상 삽입가능)</li>
									<li>유료클릭광고 제공(리얼클릭과 제휴)</li>
									<li>후원시스템 (CMS, 카드결제)</li>
									<li>공유기사 제공 (인스 회원사간의 공유기사 시스템)</li>
									<li>연예/스포츠 기사 제공</li>
									<li>보도자료 제공 (보도자료 전문업체와 제휴)</li>
									<li>포털사이트 기업메일로의 연결(네이버 works)</li>
									<li>뉴스레터 발송 기능</li>
									<li>초고속 검색 엔진 도입(유료)</li>
									<li>다양한 스킨의 모바일 웹 제공(유료)</li>
									<li>네이버, 다음, 줌, 구글 등 포털기사전송 기능(유료)</li>
									<li>PDFㆍEbook 보기 기능(유료)</li>
									<li>핸드폰, 아이핀을 통한 본인확인 인증 기능(유료)</li>
								</ul>
							</div>

							<!-- Pay type -->
							<div class="tab-pane fade in" id="Paytype">
								<p>
									<strong>유료형:</strong>
								</p>
								<p>
									콘텐츠 판매가 가능한 인터넷 뉴스 서비스 입니다. <br> 여러 형태의 콘텐츠를 제공할 수 있기 때문에
									강좌, 정보제공 사이트로 운영 하실 수 있습니다.
								</p>
								<br> <br>
								<ul>
									<li>뉴스데이터 통합 및 이미지데이터, 동영상데이터 DB화 (10년이상 파일을 저장할 수 있는 구성)</li>
									<li>통신원들의 회원가입을 통한 사이버기자 시스템</li>
									<li>관리자모드를 통한 전체적인 사이트 관리</li>
									<li>보조관리자 기능을 통한 효율적인 사이트 관리</li>
									<li>HTML편집기, 자유로운 본문사진 배치</li>
									<li>다양한 디자인 스킨 제공</li>
									<li>본문사진 워터마크 기능(본문사진에 저작권 표시)</li>
									<li>트위터, 페이스북, 카카오톡 등 SNS기사보내기</li>
									<li>배너/팝업 관리 및 라이브폴</li>
									<li>외부동영상 연동(유투브, 다음, 네이버 등의 외부동영상 삽입가능)</li>
									<li>유료클릭광고 제공(리얼클릭과 제휴)</li>
									<li>후원시스템 (CMS, 카드결제)</li>
									<li>공유기사 제공 (인스 회원사간의 공유기사 시스템)</li>
									<li>연예/스포츠 기사 제공</li>
									<li>보도자료 제공 (보도자료 전문업체와 제휴)</li>
									<li>포털사이트 기업메일로의 연결(네이버 works)</li>
									<li>뉴스레터 발송 기능</li>
									<li>초고속 검색 엔진 도입(유료)</li>
									<li>다양한 스킨의 모바일 웹 제공(유료)</li>
									<li>네이버, 다음, 줌, 구글 등 포털기사전송 기능(유료)</li>
									<li>PDFㆍEbook 보기 기능(유료)</li>
									<li>핸드폰, 아이핀을 통한 본인확인 인증 기능(유료)</li>
								</ul>
							</div>



						</div>
					</div>
					<!-- /.row -->
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