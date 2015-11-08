
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon"  href="/Images/CompanyLogos/CompanyLogo.ico" />
<title>Mwav</title>
<!-- Custom font-awesome -->
<!-- <link href="/resources/JsFramework/Bootstrap/font-awesome.min.css"
	rel="stylesheet"> -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<%--중요 부트스트랩보다 위에 위치해야 한다. --%>

<!-- Bootstrap Core CSS -->
<!-- <link href="/resources/JsFramework/Bootstrap/bootstrap.min.css" rel="stylesheet">
 -->
<link
	href=" //maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/CommonLibrary/CSS/modern-business.css"
	rel="stylesheet">

<!-- ë´ê° ì ìíë ì¤íì¼ -->
<link href="/resources/CommonLibrary/CSS/mwav_style.css"
	rel="stylesheet">

<!-- ë´ê° ì ìíë ì¤íì¼ -->
<link href="/resources/CommonLibrary/CSS/myStyle.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries  ê°ê° ë¤ë¥¸ ì¥, ë¨ì  (ìë ëê°)-->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>
<script src="/CommonLibrary/Javascript/validate.js"></script>


<!-- jQuery Version 1.11.0 -->
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<script>
	/*추후 빼기*/
	$(document).ready(function() {
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

