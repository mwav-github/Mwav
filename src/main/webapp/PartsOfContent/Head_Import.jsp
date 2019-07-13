<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="robots" content="index, follow" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%--SEO 관련설정. --%>
<jsp:include page="SNS_Head_Import.jsp" flush="false" />

<%-- Mwav CSS 
유의사항 : bootstrap.mins 위에 위치해야 gnb등 따로 스타일 먹인 부분이 먼저 적용되어 정상적으로 출력된다.
        만약 bootstrap보다 뒤에 필요한 경우 mwav_custom.css로 이동.
--%>
<link href="/resources/CommonLibrary/CSS/mwav_style.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href=" //maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">

<link href="/resources/JsFramework/Bootstrap/bootstrap-social.css"
	rel="stylesheet">
<link href="/resources/CommonLibrary/CSS/modern-business.css"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<%-- jQuery 달력에 사용. --%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<%-- jQuery Version 1.11.0 --%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/CommonLibrary/Javascript/Common.js"></script>
<script src="/CommonLibrary/Javascript/validate.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

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
<%-- 		$('.res_width').animate({
			marginTop : height
		}, 1000);
 --%>
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
<%--/* $('#myCarousel').css({
			'margin-top' : (($('.navbar-fixed-top').height()) + 4) + 'px'
		}); */
		/* $('#myCarousel').animate({
			marginTop : height
		}, 1000);

		$('.res_width').animate({
			marginTop : height
		}, 1000); */--%>
	$('#myCarousel').css({
							'margin-top' : height
						});
						$('.res_width').css({
							'margin-top' : height
						});
<%--url 에 따라 타이틀 지정 (170418 부로 서버사이드로 이동)
		setTitle(location.pathname);--%>
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

		var stClientScreen = '<c:out value="${requestScope.stClientScreen}" />';
		//null 인경우 실행.

		console.log('stClientScreen' + stClientScreen);
		if (stClientScreen == 'firstTime' && stClientScreen != null) {
			//alert('들어왔다.')
			stClientScreenUpdateAjax();
		}
	}
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
</script>

<%-- recapcha의 경우 한 페이지 하나만 사용 가능한 한계를 아래 스크립트로 극복.
https://stackoverflow.com/questions/1241947/how-do-i-show-multiple-recaptchas-on-a-single-page
 
 Recapcha 
     두번들어가는 경우 오류발생.
     https://stackoverflow.com/questions/37297348/uncaught-error-recaptcha-placeholder-element-must-be-empty--%>

<script
	src='https://www.google.com/recaptcha/api.js?onload=CaptchaCallback&render=explicit'
	async defer></script>

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
	})(window, document.documentElement, 'async-hide', 'dataLayer', 0, {	//임시로 수정 4000	
		'GTM-ML32Q9G' : true
	});
</script>
<%-- Comodo Certificated 18.09.15 --%>
<script type="text/javascript"> //<![CDATA[ 
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>
