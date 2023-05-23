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
	function sendSns(url, utm_source, utm_campaign, utm_medium, utm_content, subTitle, pgl, thumbnail_link, count)
	{
		// TODO 통계기 추가 필요
		var o;
		var _br = encodeURIComponent('\r\n'); // 보안이슈 인코딩 처리.

		//trim 처리를 안하는 경우 url이 중간에 짤려서 다 인식못함.
//		var googleAnalytics_var = '&utm_source=' + utm_source +'&utm_campaign=' + trim(utm_campaign) +'&utm_medium=' + utm_medium + '&utm_content=' + utm_content;
//		var pgl = '&pgl='+pgl
//		var _url = encodeURIComponent(url + googleAnalytics_var + pgl + '#news_top');

		switch(utm_source){
			case 'kakao':
				o = {
					method:'kakao',
					url : url,
					utm_source : utm_source,
					utm_campaign : utm_campaign,
					utm_medium : utm_medium,
					utm_content : utm_content,
					subTitle : subTitle,
//					pgl : pgl,
					count : count,
					params : url.split("mwav.net/")[1]
				};
				break;
			default:
				alert('곧 지원될 예정입니다.');
				break;
				return;
		}


		switch(o.method) {
			case 'kakao' :
				Kakao.Link.sendDefault({
					objectType:"feed"
					,content: {
						title: o.utm_campaign   // 콘텐츠의 타이틀
						, description: o.subTitle  // 콘텐츠 상세설명
						, imageUrl: thumbnail_link // 썸네일 이미지
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