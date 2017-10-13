<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="SNS_Head_Import.jsp" flush="false" />
<meta name="robots" content="index, follow" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--아래 keyword 및 description은 변경 예정. --%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:choose>
	<c:when test="${metaData.keywords eq null }">
		<meta id="metaKeywords" name="keywords"
			content="Digital Marketing, E-Consulting, IT Consulting, WebSite Building, Cloud, AI, MR, VR, AR, IoT Platform, Deep Learning, Agile, DevOps, Domain, Web Hosting, Server Hosting, Hosting, HomePage, IT Solution, IT Product, DataBase, Maintenance, EC, Shopping Mall, Web Mail, News Solution, 디지털마케팅, E-컨설팅, IT컨설팅, 웹사이트 제작, 클라우드, 인공지능, 증강현실, 혼합현실, 가상현실, IOT 플랫폼, 딥 러닝, 에자일, 데브옵스, 도메인, 웹호스팅, 서버호스팅, 호스팅, 홈페이지, 웹사이트, 솔루션개발, 데이터베이스, 유지보수, 전자상거래, 쇼핑몰, 웹메일, 뉴스솔루션" />
	</c:when>
	<c:otherwise>
		<meta id="metaKeywords" name="keywords"
			content="${metaData.keywords }" />
	</c:otherwise>
</c:choose>
<meta id="metaDescription" name="description"
	content="This is the website for Mwav.net. We are an IT development company possessing total E-Commerce platform based on the fancy technologies. You can contact at http://www.mwav.net/CustomerService/Contact/Contact.mwav?modal=Q&A if you have a question or an inquiry on the site." />
<meta name="Owner" content="Mwav.net" />
<meta name="Author" content="Zeus, Peter J." />
<meta name="copyright" content="All contents are copyright by Mwav.net" />
<meta name="distribution" content="global" />
<%--resource는 호출하지않도록 처리. 추후 필요 !!!*** --%>
<link rel="icon" href="/Images/CompanyLogos/CompanyLogo.ico" />
<title><c:choose>
		<c:when test="${metaData.title eq null }">[Mwav.net] >> Unleash your infinite possibilities with IT Optimization!!</c:when>
		<c:otherwise>${metaData.title }</c:otherwise>
	</c:choose></title>
<%-- Mwav CSS--%>
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
<!-- Customize CSS -->
<link href="/resources/CommonLibrary/CSS/myStyle.css" rel="stylesheet">

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
