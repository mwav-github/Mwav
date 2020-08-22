<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="max-age=604800" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Website title - bootstrap html template</title>

<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  
<!-- Bootstrap4 files-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Font awesome 5.1 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.1.0/css/v4-shims.min.css" type="text/css" rel="stylesheet">

<!-- custom style -->
<link href="/Promoter/css/PmtCommons.css.css" rel="stylesheet" type="text/css"/>
<link href="/Promoter/css/PmtResponsive.css.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

<!-- custom javascript -->
<!-- <script src="/CommonLibrary/Javascript/bizLogin-script.js" type="text/javascript"></script> -->

<body>

<header class="section-header">

	<!--  //////////////////////////////////// -->
	<jsp:include page="/Promoter/Promoters/PmtSiteHeader.jsp"
		flush="false" />
</header>
<section class="section-content padding-bottom-sm">
	<jsp:include page="/Promoter/Goods/PmtGoodsList.jsp"
		flush="false" />
</section>


<footer class="section-footer border-top">
	<jsp:include page="/Promoter/Promoters/PmtSiteFooter.jsp"
		flush="false" />
</footer>
</body>