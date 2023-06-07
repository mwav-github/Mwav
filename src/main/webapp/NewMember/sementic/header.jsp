<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//cdn.ckeditor.com/4.5.11/basic/ckeditor.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%--<script src="/CommonLibrary/Javascript/Common.js"></script>--%>
<link href="/resources/CommonLibrary/CSS/mwav_custom.css" rel="stylesheet">
<link href="/resources/JsFramework/Bootstrap/bootstrap-social.css" rel="stylesheet">

<script>
	// kakao init
	Kakao.init('b66e3d6516bdc422b77b51024332a218');

	//소셜 공유하기
	function sendSns()
	{
		// TODO 통계기 추가 필요
		var o;
		var _br = encodeURIComponent('\r\n'); // 보안이슈 인코딩 처리.
		var url = window.location.hostname;
		var port = location.port;
		if(port.length != 0){
			url = 'http://' + url + ':' + port + '/newMember/signUp?utm_source=studyform&utm_medium=kakao&utm_campaign=';
		} else{
			url = 'http://' + url + '/newMember/signUp?utm_source=studyform&utm_medium=kakao&utm_campaign=';
		}

		o = {
			method:'kakao',
			url : url,
			utm_source : 'studyform',
			utm_campaign : 'Mwav 스터디 접수 신청',
			utm_medium : 'kakao',
			utm_content : 'studyform',
			subTitle : '',
			count : 0
		};

		switch(o.method) {
			case 'kakao' :
				Kakao.Link.sendDefault({
					objectType:"feed"
					,content: {
						title: o.utm_campaign   // 콘텐츠의 타이틀
						, description: o.subTitle  // 콘텐츠 상세설명
						, imageUrl: 'thumbnail_link' // 썸네일 이미지
						, link: {
							mobileWebUrl: o.url   // 모바일 카카오톡에서 사용하는 웹 링크 URL
							, webUrl: o.url // PC버전 카카오톡에서 사용하는 웹 링크 URL
						}
					}
					, social: {
						viewCount : o.count //조회수
					}
					, buttons: [
						{
							title:"상세확인" // 버튼 제목
							, link: {
								mobileWebUrl:o.url  // 모바일 카카오톡에서 사용하는 웹 링크 URL
								, webUrl:o.url // PC버전 카카오톡에서 사용하는 웹 링크 URL
							}
						}
					]
				});
		}
	}
</script>

<script>
	// GA 스크립트
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');
	var perfData = window.performance.timing;
	var pageLoadTime = perfData.mwavmComplete - perfData.navigationStart;
	var loadTime = "";
	var userId = '';
	var pgl = ''; //세션으로 변경
	var statistics_id = '1000199344'; //세션으로 변경
	ga('create', 'UA-63623427-1', {
		'cookieDomain' : 'www.mwav.net',
		'siteSpeedSampleRate' : 100
	}); // 사이트 속도 측정 100은 전체 체크 (2017_01_10)
	//171102 usderid세팅.
	if (!(gfn_isNull(userId))) {
		ga('set', 'userId', userId);
	}
	//171104 맞춤 측정기준 설정(세션).
	//https://support.google.com/analytics/answer/2709828?hl=ko
	//ga('send', 'pageview'); 위에 존재해야한다.
	if (!(gfn_isNull(pgl))) {
		ga('set', 'dimension1', pgl);
	}
	if (!(gfn_isNull(statistics_id))) {
		ga('set', 'dimension2', statistics_id);
	}
	ga('require', 'GTM-ML32Q9G');
	ga('send', 'pageview');
	ga('require', 'displayfeatures');
	ga('require', 'linkid', 'linkid.js');
</script>


<header class="section-header">

	<nav class="navbar navbar-light navbar-expand-md navbar-main border-bottom">
		<div class="container">

			<div class="navbar-collapse collapse justify-content-center" id="dropdown6" style="">
				<ul class="navbar-nav text-center">
					<li class="nav-item ml-5">
						<a class="nav-link" target="_blank" href="<c:url value='https://www.youtube.com/@mwavcorp1814/videos' />">관련 영상</a>
					</li>
					<li class="nav-item ml-5">
						<a class="nav-link" target="_blank" href="<c:url value='https://sites.google.com/mwav.net/study/home' />">교육 자료</a>
					</li>
				</ul>
			</div>
			<!-- .collapse -->
		</div>
	</nav>
</header>