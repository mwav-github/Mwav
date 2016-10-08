<%@ page contentType="text/html;charset=utf-8"%>

<meta name="robots" content="index, follow" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta id="metaKeywords" name="keywords"
	content="text/html; charset=utf-8" />
<meta id="metaDescription" name="description"
	content="text/html; charset=utf-8" />
<meta name="Owner" content="Mwav.net" />
<meta name="Author" content="Zeus, Peter J." />
<meta name="copyright" content="All contents are copyright by Mwav.net" />
<meta name="distribution" content="global" />
<link rel="icon" href="/Images/CompanyLogos/CompanyLogo.ico" />
<title></title>

<%--인코딩 설정 --%>

<!-- Mwav CSS-->
<link href="/resources/CommonLibrary/CSS/mwav_style.css"
	rel="stylesheet">

<!-- Custom font-awesome -->
<!-- <link href="/resources/JsFramework/Bootstrap/font-awesome.min.css"
	rel="stylesheet"> -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<%--ì¤ì ë¶í¸ì¤í¸ë©ë³´ë¤ ìì ìì¹í´ì¼ íë¤. --%>

<!-- Bootstrap Core CSS -->
<!-- <link href="/resources/JsFramework/Bootstrap/bootstrap.min.css" rel="stylesheet">
 -->
<link
	href=" //maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/CommonLibrary/CSS/modern-business.css"
	rel="stylesheet">


<!-- Customize CSS -->
<link href="/resources/CommonLibrary/CSS/myStyle.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries  ÃªÂ°ÂÃªÂ°Â Ã«ÂÂ¤Ã«Â¥Â¸ Ã¬ÂÂ¥, Ã«ÂÂ¨Ã¬Â Â (Ã¬ÂÂÃ«ÂÂ Ã«ÂÂÃªÂ°Â)-->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery 달력에 사용. -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>
<script src="/CommonLibrary/Javascript/validate.js"></script>


<!-- jQuery Version 1.11.0 -->
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


<!-- Bootstrap Core JavaScript -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<script>
	/*TOP버튼*/
	$(document).ready(function() {
		
		//url 에 따라 타이틀 지정 
		setTitle(location.pathname);
		//alert(set_Title);
		
		
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

