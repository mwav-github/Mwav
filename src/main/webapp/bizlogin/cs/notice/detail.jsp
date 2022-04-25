<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<jsp:include page="/bizlogin/sementic/meta.jsp" flush="false" />
</head>
<body>
	<header class="section-header">
		<jsp:include page="/bizlogin/sementic/header.jsp" flush="false" />
	</header>

	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">공지사항</h2>
		</div>
	</section>

	<section class="section-content padding-y">
		<div class="container mx-auto" style="max-width: 700px; margin-top: 0px;">
			<!-- Content Column -->
			<div class="row news_fontfamilly">
				<div class="col-md-12">

					<h2 class="news_title">
						<a>Title${selectOneBuView.buTitle}</a>
					</h2>
					<p class="news_subtitle">
						<c:if test="${selectOneBuView.buSubTitle != '' or selectOneBuView.buSubTitle eq null}">
				SubTitle${selectOneBuView.buSubTitle} 
			</c:if>
					</p>
					<hr>
					<p>
						<i class="fa fa-clock-o"></i>
						Last Modified: Date${selectOneBuView.fmbuInsertDt} | Topic: Group${selectOneBuView.buGroup}
					</p>
					<hr>
					<div class="text-right"></div>

					<div class="news_contents">news_contents${selectOneBuView.buContent}</div>
					<div class="news_emphasis">news_emphasis${selectOneBuView.buContent}</div>
					<hr class="hr_b">
					<div class="d-flex justify-content-center">
						<p>
							<button type="button" class="btn btn-dark btn-lg"
								onClick="javascript:window.location.href='/bizlogin/cs/notice/list'">목 록</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="section-footer border-top">
		<jsp:include page="/bizlogin/sementic/footer.jsp" flush="false" />
	</footer>

	<script type="text/javascript">
		//kakao init
		Kakao.init('b66e3d6516bdc422b77b51024332a218');
	</script>
</body>
</html>

