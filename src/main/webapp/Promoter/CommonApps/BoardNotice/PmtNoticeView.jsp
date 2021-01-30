<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html lang="en">
<!-- ========================= Head & Meta Area ========================= -->
<head>
<jsp:include
	page="/Promoter/PartsOfContent/SiteHeader/PmtSiteMetaHeader.jsp"
	flush="false" />
</head>
<!-- ========================= Head & Meta Area END ========================= -->
<body>
	<!-- ========================= Header ========================= -->
	<header class="section-header">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteHeader/PmtSiteHeader.jsp"
			flush="false" />
	</header>
	<!-- section-header.// -->
	<!-- ========================= Header END ========================= -->
	<!-- ========================= SECTION ONE ========================= -->
	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">공지사항</h2>
		</div>
		<!-- container //  -->
	</section>
	<!-- ========================= SECTION ONE END// ========================= -->

	<!-- ========================= SECTION TWO ========================= -->
	<section class="section-content padding-y">
		<div class="container mx-auto" style="max-width: 700px; margin-top: 0px;">
			<script type="text/javascript">
				//kakao init
				Kakao.init('b66e3d6516bdc422b77b51024332a218');
			</script>
			<!-- Content Column -->
			<div class="row news_fontfamilly">
				<div class="col-md-12">

					<h2 class="news_title">
						<a>Title${selectOneBuView.buTitle}</a>
					</h2>
					<p class="news_subtitle">
						<c:if
							test="${selectOneBuView.buSubTitle != '' or selectOneBuView.buSubTitle eq null}">
				SubTitle${selectOneBuView.buSubTitle} 
			</c:if>
					</p>
					<hr>
					<p>
						<i class="fa fa-clock-o"></i> Last Modified:
						Date${selectOneBuView.fmbuInsertDt} | Topic:
						Group${selectOneBuView.buGroup}
					</p>
					<hr>
					<!-- =========================START SNS Share Icon ========================= -->
					<div class="text-right"></div>
					<!-- =========================END SNS Share Icon ========================= -->

					<!-- =========================START news_contents ========================= -->
					<div class="news_contents">news_contents${selectOneBuView.buContent}</div>
					<div class="news_emphasis">news_emphasis${selectOneBuView.buContent}</div>
					<hr class="hr_b">
					<div class="d-flex justify-content-center">
						<p>
							<button type="button" class="btn btn-dark btn-lg"
								onClick="javascript:window.location.href='/Promoter/CommonApps/BoardNotice/PmtNoticeList.mwav'">목
								   록</button>

						</p>
					</div>
					<!-- =========================END news_contents ========================= -->

				</div>
			</div>
		</div>
	</section>
	<!-- ========================= SECTION TWO END// ========================= -->

	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->
</body>
</html>

