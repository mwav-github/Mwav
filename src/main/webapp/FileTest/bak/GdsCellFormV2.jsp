<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="robots" content="index, follow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="msvalidate.01" content="0FE30DF009A686534424BAC0EBB34813">
<meta name="naver-site-verification" content="ec4a8405c82d31675b6464471b2bc4b3a2be1913">
<meta property="fb:app_id" content="956230164513468">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Mwav.net">
<meta property="og:type" content="website">
<meta property="og:locale" content="ko_KR">
<meta name="twitter:card" content="summary">
<meta property="og:image" content="https://www.mwav.net/Images/CompanyLogos/CompanyLogo.ico">
<meta name="twitter:image" content="https://www.mwav.net/Images/CompanyLogos/CompanyLogo.ico">
<meta property="og:title" content="[Mwav.net] - Unleash your infinite possibilities with IT Optimization!!">
<meta name="twitter:title" content="[Mwav.net] - Unleash your infinite possibilities with IT Optimization!!">
<meta property="og:description"
	content="This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at https://www.mwav.net/CustomerService/Contact/Contact.mwav?modal=Q&amp;A if you have a question or an inquiry on the site."
>
<meta name="twitter:description"
	content="This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at https://www.mwav.net/CustomerService/Contact/Contact.mwav?modal=Q&amp;A if you have a question or an inquiry on the site."
>
<meta name="twitter:url" content="http://www.mwav.net">
<meta name="twitter:site" content="@mwavnet">
<meta name="twitter:creator" content="@mwavnet">
<meta id="metaKeywords" name="keywords"
	content="Digital Marketing, E-Consulting, IT Consulting, WebSite Building, Cloud, AI, MR, VR, AR, IoT Platform, Deep Learning, Agile, DevOps, Domain, Web Hosting, Server Hosting, Hosting, HomePage, IT Solution, IT Product, DataBase, Maintenance, EC, Shopping Mall, Web Mail, News Solution, 디지털마케팅, E-컨설팅, IT컨설팅, 웹사이트 제작, 클라우드, 인공지능, 증강현실, 혼합현실, 가상현실, IOT 플랫폼, 딥 러닝, 에자일, 데브옵스, 도메인, 웹호스팅, 서버호스팅, 호스팅, 홈페이지, 웹사이트, 솔루션개발, 데이터베이스, 유지보수, 전자상거래, 쇼핑몰, 웹메일, 뉴스솔루션"
>
<meta id="metaDescription" name="description"
	content="This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at https://www.mwav.net/CustomerService/QnA/QnA.mwav?mode=qaForm if you have a question or an inquiry on the site."
>
<meta name="Owner" content="Mwav.net">
<meta name="Author" content="Zeus, Peter J.">
<meta name="copyright" content="All contents are copyright by Mwav.net">
<meta name="distribution" content="global">

<link rel="icon" href="http://localhost:8080/Images/CompanyLogos/CompanyLogo.ico">
<title>Unleash your infinite possibilities with IT Optimization!!</title>
<link href="./GdsCellFormV2/mwav_style.css" rel="stylesheet">
<link rel="stylesheet" href="./GdsCellFormV2/font-awesome.min.css">
<link href="./GdsCellFormV2/bootstrap.min.css" rel="stylesheet">
<link href="./GdsCellFormV2/bootstrap-social.css" rel="stylesheet">
<link href="./GdsCellFormV2/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="./GdsCellFormV2/jquery-ui.css">
<link rel="stylesheet" href="fileTest.css">

<link rel="stylesheet" href="/resources/JsFramework/Bootstrap/bootstrap.min.css">


<script src="/resources/JsFramework/jQuery/jquery-1.11.0.js"></script>
<script src="/resources/JsFramework/Bootstrap/bootstrap.min.js"></script>

<script type="text/javascript" async="" src="./GdsCellFormV2/recaptcha__ko.js"></script>
<!--  <script src="./GdsCellFormV2/jquery-1.11.2.min.js"></script>-->
<script src="./GdsCellFormV2/jquery-ui.min.js"></script>
<script src="./GdsCellFormV2/Common.js"></script>
<script src="./GdsCellFormV2/validate.js"></script>

<!-- Bootstrap Core JavaScript -->
<!--  <script src="./GdsCellFormV2/bootstrap.min.js"></script> -->

<script>
	$(window).resize(function() {
		res_Text();

		var height = (($('.navbar-fixed-top').height()) + 4);

		$('#myCarousel').css({
			'margin-top' : height
		});
		$('.res_width').css({
			'margin-top' : height
		});

	});
	/*TOP버튼*/
	/* 	외부 리소스 및 이미지와는 상관없이 DOM데이터만 로드가 완료되면 바로 실행이 되는 함수입니다. 
	 따라서 window.onload보다 더 빠르게 실행이 된다는 얘기죠..
	 */
	$(document)
			.ready(
					function() {
						var height = (($('.navbar-fixed-top').height()) + 4);
						res_Text();
						
						$("#comodoTL").css('display', 'none');

	$('#myCarousel').css({
							'margin-top' : height
						});
						$('.res_width').css({
							'margin-top' : height
						});

	caps_lockchk();

						$('#back-to-top').fadeOut();
						$(window).scroll(function() {
							if ($(this).scrollTop() > 550) {
								$('#back-to-top').fadeIn();
								$('#back-to-top').tooltip();
							} else {
								$('#back-to-top').fadeOut();
							}
						});
						// scroll body to 0px on click
						$('#back-to-top').click(function() {
							$('#back-to-top').tooltip('hide');
							$('body,html').animate({
								scrollTop : 0
							}, 800);
							return false;
						});
						
						//MegaMenu 클릭.
						jQuery(document).on('click', '.mega-dropdown', function(e) {
							e.stopPropagation()
						})
					});
</script>
<script>
	window.onload = function() {
		// 페이지 완전 로딩후 실행
		//bootstrap url base 호출, CommonLibrary로 변경.
		//https://stackoverflow.com/questions/28079380/show-bootstrap-modal-only-if-url-has-certain-parameters

		var url = window.location.href;
		if (url.indexOf('?modal=Q&A') != -1) {
			$("#Contact").modal('show');
		}

		//var stClientScreen = 'firstTime';
		//null 인경우 실행.

		//console.log('stClientScreen' + stClientScreen);
		/*
		if (stClientScreen == 'firstTime' && stClientScreen != null) {
			//alert('들어왔다.')
			stClientScreenUpdateAjax();
		}
		*/
	}
	
	/*
	function stClientScreenUpdateAjax() {
		var stClientScreenWidth = screen.width;
		var stClientScreenHeight = screen.height;

		//console.log("사용자 pc 해상도" + stClientScreen);
		var URL = "stClientScreen=" + stClientScreenWidth + 'x'
				+ stClientScreenHeight;
		$.ajax({
			url : "/statistics/stClientScreenUpdateAjax.mwav",
			data : URL,
			success : function(xmlStr) {
				//alert('성공');
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}
	*/
</script>

<script src="./GdsCellFormV2/api.js" async="" defer=""></script>

<script type="text/javascript">
	var CaptchaCallback = function() {
		$('.g-recaptcha').each(function(index, el) {
			var widgetId = grecaptcha.render(el, {
				'sitekey' : '6LcdRxoUAAAAAA4OI0FIN2bv2W0ersTRjqHJdLG-'
			});
			jQuery(this).attr('data-widget-id', widgetId);
		});
	};
</script>

<script src="fileTest.js"></script>

<style>
.async-hide {
	opacity: 0 !important
}
</style>
<script>
	(function(a, s, y, n, c, h, i, d, e) {
		s.className += ' ' + y;
		h.start = 1 * new Date;
		h.end = i = function() {
			s.className = s.className.replace(RegExp(' ?' + y), '')
		};
		(a[n] = a[n] || []).hide = h;
		setTimeout(function() {
			i();
			h.end = null
		}, c);
		h.timeout = c;
	})(window, document.documentElement, 'async-hide', 'dataLayer', 4000, {
		'GTM-ML32Q9G' : true
	});
</script>




<script type="text/javascript">
	//open GdsUpLoader window
	//참고로 수정 및 입력해서 if 분기시 분기 페이지 쪽에 스크립트 삽입이기 때문에 예를들어 수정에는 스크립트 들어가있고 // 입력에는 없으면
	// 입력에서는 호출이 안된다 그래서 head에 올림.
	function showImageWindow(position) {
		//var myBookId = $(this).data('id');

		var modalUploadImages = position;
		$("#modalUploadImages").modal("show");
		$("#images_position").val(modalUploadImages);

		//기존 정보 초기화 
		$('#filebody').empty();
	}
</script>
<style type="text/css">
.hide-bullets {
	list-style: none;
	margin-left: -40px;
	margin-top: 20px;
}
</style>

<script>
	jQuery(document).ready(function($) {

		$('#myCarousel').carousel({
			interval : false
		});

		$('#carousel-text').html($('#slide-content-0').html());

		//Handles the carousel thumbnails
		$('[id^=carousel-selector-]').click(function() {
			var id = this.id.substr(this.id.lastIndexOf("-") + 1);
			var id = parseInt(id);
			$('#myCarousel').carousel(id);
		});

		// When the carousel slides, auto update the text
		$('#myCarousel').on('slid.bs.carousel', function(e) {
			var id = $('.item.active').data('slide-number');
			$('#carousel-text').html($('#slide-content-' + id).html());
		});
	});
</script>


</head>

<body class="" style="">

	<div class="navbar-header col-sm-2 col-md-2 col-lg-2 mgt2 text-center">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button>

	</div>


	<!-- Page Content -->
	<div class="container">
		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">









				<script>
	$(function() {
		/* 		
		http://webdesignerhut.com/active-class-navigation-menu/
		
		var pgurl = window.location.href.substr(window.location.href
		 .lastIndexOf("/") + 1); 
		 실행url -  http://localhost:8088/login/login.mwav?key=value
		
		 -javascript-
		 location.href  -> http://localhost:8088/login/login.mwav?key=value
		 location.protocol ->  http:
		 location.host -> localhost:8088 
		 location.pathname -> /login/login.mwav
		 location.search -> ?key=value
		 ﻿
		 -jquery-
		 ﻿jQuery(location).attr('href') -> http://localhost:8088/login/login.mwav?key=value
		 jQuery(location).attr('protocol') -> http:
		 jQuery(location).attr('host') -> localhost:8088 
		 jQuery(location).attr('pathname') -> /login/login.mwav
		 jQuery(location).attr('search')-> ?key=value
		 [출처] javascript & jquery location object 정보 - 현재 실행중이 URL정보|작성자 미친꼬북		
		 */
		var pgurl = window.location.pathname;
		//alert(pgurl);

		$("#left_menu a").each(function() {
			//alert($(this).attr("href"));
			//alert($(this).attr(''));
			if ($(this).attr("href") == pgurl || $(this).attr("href") == '')
				$(this).addClass("active");
		})
	});
</script>
				<div id="left_menu" class="list-group"></div>
			</div>
			<!-- 끝 -->

			<div class="row">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">GdsCellForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<form class="form-horizontal" method="post" action="http://localhost:8080/FileTestV2/FileUpload.mwav.mwav">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Mwav - Goods Registration</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-sm-12 col-md-4 col-lg-4 " align="center">


												<!-- Slider -->
												<div class="row">
													<div class="col-xs-12" id="slider">
														<!-- Top part of the slider -->
														<div class="row">
															<div class="col-sm-12" id="carousel-bounding-box">
																<div class="carousel slide" id="myCarousel" style="margin-top: 4px;">
																	<!-- Carousel items -->
																	<div class="carousel-inner">
																		<div class="active item" data-slide-number="0">
																			<a href="http://localhost:8080/FileTestV2/GdsCellForm.mwav#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
																			<img id="img1" src="http://placehold.it/770x770&amp;text=one">
																			</a>
																		</div>

																		<div class="item" data-slide-number="1">
																			<a href="http://localhost:8080/FileTestV2/GdsCellForm.mwav#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
																			<img id="img2" src="http://placehold.it/770x770&amp;text=two">
																			</a>
																		</div>

																		<div class="item" data-slide-number="2">
																			<a href="http://localhost:8080/FileTestV2/GdsCellForm.mwav#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
																			<img id="img3" src="http://placehold.it/770x300&amp;text=three">
																			</a>
																		</div>

																		<div class="item" data-slide-number="3">
																			<a href="http://localhost:8080/FileTestV2/GdsCellForm.mwav#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
																			<img id="img4" src="http://placehold.it/770x300&amp;text=four">
																			</a>
																		</div>

																		<div class="item" data-slide-number="4">
																			<a href="http://localhost:8080/FileTestV2/GdsCellForm.mwav#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
																			<img id="img5" src="http://placehold.it/770x300&amp;text=five">
																			</a>
																		</div>

																		<div class="item" data-slide-number="5">
																			<a href="http://localhost:8080/FileTestV2/GdsCellForm.mwav#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
																			<img id="img6" src="http://placehold.it/770x300&amp;text=six">
																			</a>
																		</div>
																	</div>

																</div>
															</div>


														</div>
													</div>
												</div>
												<!--/Slider-->

												<div class="row hidden-xs" id="slider-thumbs">
													<!-- Bottom switcher of slider -->
													<ul class="hide-bullets">
														<li class="col-sm-6"><a class="thumbnail" id="carousel-selector-0"><img id="s-img1" src="http://placehold.it/170x100&amp;text=one"></a></li>
														<li class="col-sm-6"><a class="thumbnail" id="carousel-selector-1"><img src="http://placehold.it/170x100&amp;text=two"></a></li>
														<li class="col-sm-6"><a class="thumbnail" id="carousel-selector-2"><img src="http://placehold.it/170x100&amp;text=three"></a></li>
														<li class="col-sm-6"><a class="thumbnail" id="carousel-selector-3"><img src="http://placehold.it/170x100&amp;text=four"></a></li>
														<li class="col-sm-6"><a class="thumbnail" id="carousel-selector-4"><img src="http://placehold.it/170x100&amp;text=five"></a></li>
														<li class="col-sm-6"><a class="thumbnail" id="carousel-selector-5"><img src="http://placehold.it/170x100&amp;text=six"></a></li>

													</ul>
												</div>











												<script type="text/javascript">

$(document).ready(function() {
    var $lightbox = $('#lightbox');
    
    $('[data-target="#lightbox"]').on('click', function(event) {
        var $img = $(this).find('img'), 
            src = $img.attr('src'),
            alt = $img.attr('alt'),
            css = {
                'maxWidth': $(window).width() - 100,
                'maxHeight': $(window).height() - 100
            };
    
        $lightbox.find('.close').addClass('hidden');
        $lightbox.find('img').attr('src', src);
        $lightbox.find('img').attr('alt', alt);
        $lightbox.find('img').css(css);
    });
    
    $lightbox.on('shown.bs.modal', function (e) {
        var $img = $lightbox.find('img');
            
        $lightbox.find('.modal-dialog').css({'width': $img.width()});
        $lightbox.find('.close').removeClass('hidden');
    });
});
</script>

												<style>
#lightbox .modal-content {
	display: inline-block;
	text-align: center;
}

#lightbox .close {
	opacity: 1;
	color: rgb(255, 255, 255);
	background-color: rgb(25, 25, 25);
	padding: 5px 8px;
	border-radius: 30px;
	border: 2px solid rgb(255, 255, 255);
	position: absolute;
	top: -15px;
	right: -55px;
	z-index: 1032;
}

#lightbox a.zoom:hover img {
	transform: scale(1.3);
	-ms-transform: scale(1.3);
	-webkit-transform: scale(1.3);
	-o-transform: scale(1.3);
	-moz-transform: scale(1.3);
}

#lightbox a.zoom span.overlay {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	height: 100%;
	width: 100%;
	background-color: #000;
	opacity: 0;
	transition: opacity .25s ease-out;
	-moz-transition: opacity .25s ease-out;
	-webkit-transition: opacity .25s ease-out;
	-o-transition: opacity .25s ease-out;
}
</style>




												<div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="overflow: hidden; display: none;">
													<div class="modal-dialog" style="width: 526px;">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<div class="modal-content">
															<div class="modal-body" style="overflow-y: scroll">
																<img src="http://placehold.it/770x770&amp;text=one" alt="" style="max-width: 1172px; max-height: 526px;">
															</div>
														</div>
													</div>
												</div>




											</div>


											<div class="col-sm-12 col-md-8 col-lg-8 ">
												<table class="table table-user-information">
													<tbody>
														<tr>

															<td>상품코드:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">

																		<input class="form-control" name="goods_id" type="text" maxlength="15" readonly="readonly">
																	</div>
																</div>
															</td>
														</tr>


														<tr>
															<td>모델번호:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gModelNbr" value="" required="">
																	</div>
																</div>
															</td>
														</tr>

														<tr>
															<td>상품명:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gName" value="" required="">
																	</div>
																</div>
															</td>
														</tr>

														<tr>
															<td>셋트상품여부:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<select class="form-control" name="isGoodsSet" required="">
																			<option value="1">예</option>
																			<option value="0">아니오</option>
																		</select>
																	</div>
																</div>
															</td>
														</tr>



														<tr>
															<td>일반판매가:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-4">
																		<input class="form-control" name="gConsumerPrice" value="" required="">
																	</div>


																	<div class="col-md-3">

																		<p>회원판매가:</p>
																	</div>



																	<div class="col-md-4">
																		<input class="form-control" name="gMemberPrice" value="" required="">

																	</div>
																</div>
															</td>
														</tr>



														<tr>
															<td>제조(개발)사:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gManufacturer" value="" required="">
																	</div>
																</div>
															</td>
														</tr>

														<tr>
															<td>원산지:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gPlaceofOrigin" value="" required="">
																	</div>
																</div>
															</td>
														</tr>

														<tr>
															<td>배송비 지불 주체:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-4">
																		<select class="form-control" name="gWhoDeliveryCost" required="">
																			<option value="C">고객</option>
																			<option value="P">파트너사, 제조사</option>
																			<option value="S">자사</option>
																		</select>

																	</div>
																</div>
															</td>
														</tr>

														<tr>
															<td>배송비:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-4">
																		<select class="form-control" name="gDeliveryCost" required="">
																			<option value="2500">2500</option>
																			<option value="0">0</option>
																		</select>
																		<p>※제주/도서산간의 경우 추가비용 발생</p>
																	</div>
																	<div class="col-md-3">

																		<p>상품상태:</p>
																	</div>
																	<div class="col-md-4">
																		<select class="form-control" name="gStatus" required="">
																			<option value="1">판매가능</option>
																		</select>
																	</div>
																</div>
															</td>

														</tr>


														<tr>
															<td>적립금:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-4">
																		<input class="form-control" name="gRsvFund" value="">
																	</div>
																	<div class="col-md-3">

																		<p>포인트:</p>
																	</div>
																	<div class="col-md-4">
																		<input class="form-control" name="gPoint" value="">
																	</div>
																</div>
															</td>

														</tr>

														<tr>
															<td>키워드:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gKeywords" value="" required="">

																	</div>
																</div>
																<p>※키워드를 통한 웹 프로모션 메타페이지 다중생성[WebSpawner]</p>
															</td>
														</tr>

														<tr>
															<td>성과급률:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gFruitRate" value="" required="">
																	</div>
																</div>
																<p>% 성과급률은 0~100 숫자 안에서 입력하세요.</p>
															</td>
														</tr>


														<tr>
															<td>정렬순서:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-8">
																		<input class="form-control" name="gOrder" value="" required="">
																	</div>
																</div>
																<p>정렬순서는 -9999~99999 숫자 안에서 사이 값을 입력하세요.</p>
															</td>
														</tr>


														<tr>
															<td>게시기간:</td>
															<td>
																<div class="form-group">
																	<div class="col-md-3">
																		<p>시작일 :</p>
																	</div>
																	<div class="col-md-8">
																		<input type="text" name="gPostStart" class="form-control" id="datepicker_kor_1_1">
																	</div>
																	<div class="col-md-3">
																		<p>종료일 :</p>
																	</div>
																	<div class="col-md-8">
																		<input type="text" class="form-control" name="gPostEnd" id="datepicker_kor_1_2">
																	</div>
																</div>
															</td>
														</tr>

														<tr class="active">
															<td colspan="2">
																<p>이미지정보 (550 x 550픽셀 이상)</p>
															</td>
														</tr>

														<tr>
															<td class="active">대표(표준)</td>
															<td>
																<div class="col-md-8">
																	<button type="button" name="bnUpload0" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img1')">이미지업로드</button>
																</div>
															</td>
														</tr>

														<tr>
															<td class="active">전면</td>
															<td>
																<div class="col-md-8">
																	<button type="button" name="bnUpload1" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img2')">이미지업로드</button>
																</div>
															</td>
														</tr>

														<tr>
															<td class="active">후면</td>
															<td>
																<div class="col-md-8">
																	<button type="button" name="bnUpload2" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img3')">이미지업로드</button>
																</div>
															</td>
														</tr>


														<tr>
															<td class="active">우측면</td>
															<td>

																<div class="col-md-8">
																	<button type="button" name="bnUpload3" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img4')">이미지업로드</button>
																</div>
															</td>
														</tr>


														<tr>
															<td class="active">좌측면</td>
															<td>
																<div class="col-md-8">
																	<button type="button" name="bnUpload4" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img5')">이미지업로드</button>
																</div>

															</td>
														</tr>

														<tr>
															<td class="active">상단면</td>
															<td>
																<div class="col-md-8">
																	<button type="button" name="bnUpload5" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img6')">이미지업로드</button>
																</div>
															</td>
														</tr>

														<tr>
															<td class="active">하단면</td>
															<td>

																<div class="col-md-8">
																	<button type="button" name="bnUpload6" class="fileclear btn btn-sm btn-primary" onclick="showImageWindow('img7')">이미지업로드</button>
																</div>
															</td>
														</tr>
				
														<script type="text/javascript">
																	//open GdsUpLoader window
														 			function showImageWindow(position) {
																		//var myBookId = $(this).data('id');
																		var modalUploadImages = position;
																		$("#modalUploadImages").modal("show");
																		$("#images_position").val(modalUploadImages);
																	} 
																</script>
													</tbody>
												</table>
											</div>
											<div class="col-md-12 ">
												<div class="col-md-12 form-group center-block">
													<textarea class="form-control" name="gNote" rows="15" placeholder="특이사항...."></textarea>
												</div>

											</div>
										</div>
										<div class="panel-footer">

											<button type="button" class="btn btn-sm btn-primary" onclick="javascript:window.location.href=&#39;/admins/goods/gdsList.mwav&#39;">리스트</button>

											<button type="button" class="btn btn-sm btn-primary" onclick="javascript:history.go(-1)">뒤로가기</button>

											<!--  <button type="submit" class="btn btn-sm btn-primary">등록하기</button> -->
											<button type="submit" class="btn btn-sm btn-primary" id="js-upload-submit">Upload files</button>

										</div>

									</div>
								</div>
							</div>
						</form>



					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->









	<script src="./GdsCellFormV2/jquery.form.min.js"></script>


	<script>
	function insertFileUploader() {

		$('#insertFileForm')
				.ajaxForm(
						{
							dataType : 'json',
							beforeSend : function() {
								$("#messages").show();
								$('#messages').html(' <div class="progress"><div id="progressBar" class="progress-bar progress-bar-striped active" style="width: 0%;">0%</div></div>');
						    },
						    uploadProgress: function ( event, position, total, percentComplete ) {
						    	
						    	//에러가 아닐때는 나오면 안된다. 그부분 체크 필요.
						        if (percentComplete == 100) {
						            $('#progressBar').css('width',percentComplete+'%').html('Complete...');
						        } else {
						            $('#progressBar').css('width',percentComplete+'%').html(percentComplete+'%');
						        }
						    },
						    
							complete : function(data) {
								/* $('#fileResult').append("complete...\n").append(
										JSON.stringify(data.responseJSON) + "\n"); */

								$('#messages')
										.append(
												"<font color=green><strong>업로드가 완료되었습니다.</strong></font>");
								$('#fileUploaderBtn').css("display") == "none";
								
								
								
							},
						    error: function(XMLHttpRequest, textStatus, errorThrown)
						    {
						       alert('Internal server error');
						       //some stuff on failure
						    } 
						});
	}
</script>


	<script type="text/javascript">
	$(document).on('click', '#close-preview', function() {
		$('.image-preview').popover('hide');
		// Hover befor close the preview
		$('.image-preview').hover(function() {
			$('.image-preview').popover('show');
		}, function() {
			$('.image-preview').popover('hide');
		});
	});

	$(function() {
		// Create the close button
		var closebtn = $('<button/>', {
			type : "button",
			text : 'x',
			id : 'close-preview',
			style : 'font-size: initial;',
		});
		closebtn.attr("class", "close pull-right");
		// Set the popover default content
		$('.image-preview').popover({
			trigger : 'manual',
			html : true,
			title : "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
			content : "There's no image",
			placement : 'bottom'
		});
		// Clear event  콤마로 다중 사용 가능 or 조건
		$('.image-preview-clear, .fileclear').click(function() {
			$('.image-preview').attr("data-content", "").popover('hide');
			$('.image-preview-filename').val("");
			$('.image-preview-clear').hide();
			$('.image-preview-input input:file').val("");
			$(".image-preview-input-title").text("Browse");
			$("#messages").hide(); // browse 누를때는 show
		});		
		
		// Create the preview image
		$(".image-preview-input input:file").change(
				function() {
					var img = $('<img/>', {
						id : 'dynamic',
						width : 250,
						height : 200
					});
					var file = this.files[0];
					var reader = new FileReader();
					// Set preview image into the popover data-content
					reader.onload = function(e) {
						$(".image-preview-input-title").text("Change");
						$(".image-preview-clear").show();
						$(".image-preview-filename").val(file.name);
						img.attr('src', e.target.result);
						$(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
						
						//document.getElementById('js-upload-files').files = e.target.result; 	
					}
					reader.readAsDataURL(file);						
					document.getElementById('js-upload-files').files = this.files; 	
					
				});
	});
</script>

	<style>
.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.image-preview-input-title {
	margin-left: 2px;
}
</style>
	<div class="container">
		<div class="modal fade modalUploadImages" id="modalUploadImages">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="" method="post" enctype="multipart/form-data" id="js-upload-form">
						<!--  <input type="hidden" type="file" name="files[]" id="js-upload-files"> --> 
						<input type="hidden" id="images_position" name="images_position" value="" />

						<%--
					 GdsCellForm.jsp와 다른 페이지만 한페이지에서 include 하기 때문에 아래와 같이 goods_id 호출이 가능하다.
					 --%>
						<input type="hidden" name="goods_id" id="goods_id" value="${updateGdsForm.goods_id}" /> <input type="hidden" name="file_classification" value="goods" />
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">Upload Photo</h4>
						</div>
						<div class="modal-body">
							<div id="messages"></div>
							<div class="enter"></div>
							<div class="row">
								<div class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" id="filebody">
									<!-- image-preview-filename input [CUT FROM HERE]-->
									<div class="input-group image-preview">
										<input type="text" class="form-control image-preview-filename" disabled="disabled">
										<!-- don't give a name === doesn't send on POST/GET -->
										<span class="input-group-btn"> <!-- image-preview-clear button -->
											<button type="button" class="btn btn-default image-preview-clear" style="display: none;">
												<span class="glyphicon glyphicon-remove"></span> Clear
											</button> <!-- image-preview-input -->
											<div class="btn btn-default image-preview-input">
												<span class="glyphicon glyphicon-folder-open"></span> 
												<span class="image-preview-input-title">Browse</span> 
												<input type="file" name="files[]" id="js-upload-files" accept="image/png, image/jpeg, image/gif" name="input-file-preview" />
												<!-- rename it -->
											</div>
										</span>
									</div>
									<!-- /input-group image-preview [TO HERE]-->

								</div>
							</div>
							<div class="row">
								<h4>□ drag and drop files below</h4>
								<div class="upload-drop-zone" id="drop-zone">Just drag and drop files here</div>

								<!-- Upload Finished -->
								<!-- 
								<div class="js-upload-finished">
									<h4>□ finishided files</h4>
									<div class="list-group" id="upload-finish-file"/>
								</div>
								-->
							</div>



						</div>
						<div class="enter"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<!-- <button type="submit" class="btn btn-primary" id="fileUploaderBtn" onclick="insertFileUploader()">Save</button>  -->
							<!--  <button type="submit" class="btn btn-primary" id="fileUploaderBtn" onclick="tmpSave()">Save</button> -->
							<button type="submit" class="btn btn-primary" id="fileUploaderBtn">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

	Modal
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div> -->


	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<div class="col-lg-12">
			<p>Copyright Â© Mwav Admins Website 2016</p>
		</div>
		<!--/////////////////////////////////////////////////// -->
	</footer>






</body>
</html>