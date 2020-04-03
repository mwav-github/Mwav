<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Customize CSS
Mwav 관련 별도 css 이며, 추가로 해당 부분은 footer 내 위치해야 할 수도있다.
css 중 가장 마지막에 호출되어야하며, include 되는 파일 중 css가 하단에 위치하는 경우가 존재하는 이슈가 존재.
 --%>
<link href="/resources/CommonLibrary/CSS/mwav_custom.css"
	rel="stylesheet">

<script>
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
	var userId = '<c:out value="${sessionScope.member.member_id}"/>';
	var pgl = '<c:out value="${param.pgl}"/>'; //세션으로 변경
	var statistics_id = '<c:out value="${sessionScope.statistics_id}"/>'; //세션으로 변경
<%--https://www.simoahava.com/analytics/page-load-time-universal-analytics/

	//ga('create', 'UA-63623427-1', 'auto');
	//cookieDomain none 으로 하면 localhost 까지 잡아낸다.
	//http://www.statstory.com/google-universal-analytics-on-localhost-not-working/--%>
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
<%-- 인구통계부분 추가 (2017_01_10) --%>
	ga('require', 'linkid', 'linkid.js');
<%--향상된 링크 추적코드  (2017_01_10)--%>
	
<%--https://www.simoahava.com/analytics/page-load-time-universal-analytics/
	//ga.push({'event': 'GAEvent', 'eventCategory' : 'PageLoadTime', 'eventAction' : loadTime, 'nonInteratction':1});  //  사이트 속도 이벤트 작성중 --%>
	
</script>



<br />
<!--TOP아이콘 -->
<a id="back-to-top" href="#"
	class="pull-right btn btn-primary btn-lg back-to-top" role="button"
	title="Click to return on the top page" data-placement="left"
	style="z-index: 6;"><span class="glyphicon glyphicon-chevron-up"></span></a>


<div class="mgt5">
	<%--QA이슈 z-index로 처리 --%>
	<%-- <div class="col-md-12 col-xs-12 col-sm-12  alert alert-info"
		style="z-index: 5;">
		<div class="container">
			<h3>
				<strong> <span class="glyphicon glyphicon-question-sign"
					aria-hidden="true"></span> Still Have Questions?
				</strong>
			</h3>
			<a href="#" data-toggle="modal" data-target="#Contact"
				class="btn btn-lg btn-primary pull-right">Contact Us</a>
		</div>
	</div> --%>
	<%--footer --%>
	<div class="footer" id="footer">
		<%--row로 하면 전체잡힌다. --%>
		<div class="container">

			<div class="col-xs-12 col-sm-8 col-md-4">

				<p style="padding: 40px 0px 10px; border-bottom: 1px solid #BAC1C8;">
					<img src="/Company/zImage/CompanyLogo_gray.gif"
						class="img-thumbnail img-responsive logo_800_h"
						alt="CompanyLogo_gray">
				</p>

				<ul>
					<li>Company Name : Mwav corp.</li>
					<%-- <li>Business Registration Number : 206-09-41373</li>--%>
					<li>Address: GV-4F, 5-5, Ttukseom-ro 46-gil, Gwangjin-gu,
						Seoul , Korea [05099]</li>
					<li>TEL : +82-70-4655-4777</li>
					<li>FAX : +82-2-6214-7039</li>
					<li>CEO : Lewis, Kim</li>
					<li>WebSite Manager : Hunt, Kim</li>
					<li>Marketing Manager : Jose, Shin</li>
					<c:choose>
						<c:when test="${!empty sessionScope.pmtNick}">
							<li>Sales Manager : ${sessionScope.pmtNick}</li>
						</c:when>
						<c:when test="${!empty sessionScope.pmtName}">
							<li>Sales Manager : ${sessionScope.pmtName}</li>
						</c:when>
					</c:choose>
					
					<li>Chief IT-Business Advisor : Peter J.</li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-8 col-md-4">
				<h3>Site Navigation:</h3>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<ul>
						<li><a href="/">Home</a></li>
						<li><a href="/Company/Introduction/Introduction.mwav">Introduction</a></li>
						<li><a href="/Company/BusinessField/BusinessFields.mwav">Business
								Fields</a></li>
						<li><a href="/Company/LocationMap/LocationMap.mwav">Location
								Map</a></li>
						<li><a href="#">Profit Sharing</a></li>
					</ul>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<ul>
						<li><a href="/CustomerService/Contact/Contact.mwav">Contacts</a></li>
						<li><a href="/CustomerService/SiteMap/SiteMap.mwav">Site
								Map</a></li>
						<li><a href="#terms3" data-toggle="modal"
							data-target=".modal_terms">개인정보취급방침</a></li>
						<li><a href="#terms1" data-toggle="modal"
							data-target=".modal_terms">이메일주소수집거부</a></li>
						<li><a href="#">Summary</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-12 col-sm-8 col-md-4">
				<div class="col-md-12">
					<h3>Contact:</h3>
					<p>Have a question or feedback?</p>
					<br>
					<p>
						<%-- <a href="mailto:ebizpromwav@gmail.com" title="Contact me!"><i
						class="fa fa-envelope"></i> Contact</a> 
						<%--줄 없애기 + 그다음에 메일로 바로연결이아닌 qa쪽 고민 

						<a href="#" class="btn btn-block btn-primary hidden-md hidden-lg"
							data-toggle="modal" data-target="#Contact"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Footer');"
							style="color: white;"><span
							class="glyphicon glyphicon-envelope"></span> Contact</a> 
							--%>

						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"
							class="btn btn-block btn-primary "
							onclick="ga('send', 'event', 'Q&A', 'click', 'Footer');"
							style="color: white;"><span
							class="glyphicon glyphicon-envelope"></span> Contact</a>
					</p>
					<p>&nbsp;</p>

					<ul class="list-unstyled list-inline list-social-icons">

						<li><a class="btn btn-social-icon btn-linkedin"
							style="color: white;"
							onclick="ga('send', 'event', 'linkedin', 'click', 'Footer'); redirectUrl('https://www.linkedin.com/in/mwav-net-255543133/', '_blank');"
							target="_blank"> <span class="fa fa-linkedin"></span>
						</a></li>
						<li><a class="btn btn-social-icon btn-twitter"
							style="color: white;" target="_blank"
							onclick="ga('send', 'event', 'twitter', 'click', 'Footer'); redirectUrl('https://twitter.com/mwavnet', '_blank');">
								<span class="fa fa-twitter"></span>
						</a></li>
						<li><a class="btn btn-social-icon btn-facebook"
							style="color: white;" target="_blank"
							onclick="ga('send', 'event', 'facebook', 'click', 'Footer'); redirectUrl('https://www.facebook.com/mwavsns', '_blank'); ">
								<span class="fa fa-facebook"></span>
						</a></li>
						<li><a class="btn btn-social-icon btn-google"
							style="color: white;" target="_blank"
							onclick="ga('send', 'event', 'googleplus', 'click', 'Footer'); redirectUrl('https://plus.google.com/113341818785719365682?hl=ko', '_blank'); ">
								<span class="fa fa-google"></span>
						</a></li>

						<li><a class="btn btn-social-icon btn-instagram"
							style="color: white;" target="_blank"
							onclick="ga('send', 'event', 'instagram', 'click', 'Footer'); redirectUrl('https://www.instagram.com/mwavnet/', '_blank'); ">
								<span class="fa fa-instagram"></span>
						</a></li>
					</ul>
				</div>
				<div class="col-md-12">
					<h3 style="padding: 0 0 10px;">Branch Office India:</h3>
					<p>
						<i class="fa fa-map-marker" aria-hidden="true"></i> 52C, Nanjappan
						Street, Maruthapuram Bharathiary University (P.O) Coimbatore -
						641046
					</p>
					<p>
						<i class="fa fa-phone"></i> 044- 42 875 952
					</p>

					<p>
						<i class="fa fa-envelope-o" aria-hidden="true"></i>
						info@cliqtechnologies.in
					</p>

				</div>
			</div>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</div>
<!--/.footer-->

<div class="footer-bottom">
	<div class="container">
		<p class="pull-left col-md-7 col-sm-12 col-xs-12">
			Copyright ⓒ Since 2004 Mwav.net All rights reserved | <a>Privacy
				Policy</a> | <a>Terms of Use</a>
		</p>
		<p class="pull-right col-md-2 col-sm-12 col-xs-4">
			<%-- Comodo Certificated 18.09.15 --%>
			<script language="JavaScript" type="text/javascript">
				TrustLogo(
						"https://www.mwav.net/Images/TrustBanners/comodo_secure_seal_100x85_transp.png",
						"CL1", "none");
			</script>
			<a href="https://www.positivessl.com/" id="comodoTL">Positive SSL</a>
		</p>
		<div class="col-md-5 col-sm-12 col-xs-8">
			<ul class="nav nav-pills">
				<p class="pull-left mgr2">All Browsers Compatibility</p>
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="internet-explorer"><img
					src="/PartsOfContent/SiteFooter/Images/Edge.png"
					class="img-thumbnail img-responsive" alt="internet-explorer"></li>
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="chrome"><img
					src="/PartsOfContent/SiteFooter/Images/Chrome.png"
					class="img-thumbnail img-responsive" alt="internet-explorer">
				</li>
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="firefox"><img
					src="/PartsOfContent/SiteFooter/Images/Firefox.png"
					class="img-thumbnail img-responsive" alt="firefox"></li>
				<li class="tool
				tips" data-toggle="tooltip"
					data-placement="top" title="" data-original-title="safari"><img
					src="/PartsOfContent/SiteFooter/Images/Safari.png"
					class="img-thumbnail img-responsive" alt="safari"></li>
				<li class="tool
				tips" data-toggle="tooltip"
					data-placement="top" title="" data-original-title="opera"><img
					src="/PartsOfContent/SiteFooter/Images/Opera.png"
					class="img-thumbnail img-responsive" alt="opera"></li>
			</ul>
		</div>
	</div>
</div>
<!--/.footer-bottom-->


<%-- 모달영역 --%>

<div class="modal fade modal_terms" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true"
	style="overflow: auto;">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header"
				style="border-bottom: 0px solid #eee; background-color: #0480be; color: white;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Policy</h4>
			</div>
			<br>
			<div class="bs-example bs-example-tabs">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#terms1" data-toggle="tab">이메일
							주소무단수집거부</a></li>
					<li class=""><a href="#terms2" data-toggle="tab">청소년보호정책</a></li>
					<li class=""><a href="#terms3" data-toggle="tab">개인정보취급방침</a></li>
				</ul>
			</div>
			<%--max-height로 아래 설정하면 영역이 안잡혀서 안먹힌다. --%>
			<div class="modal-body" style="overflow-y: scroll; height: 300px;">
				<div class="container-fluid">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="terms1">
							<jsp:include page="/CustomerService/Policy/_EmailExtract.jsp"
								flush="false" />
						</div>
						<div class="tab-pane fade" id="terms2">

							<jsp:include page="/CustomerService/Policy/_Juvenile.jsp"
								flush="false" />
						</div>
						<div class="tab-pane fade" id="terms3">
							<jsp:include page="/CustomerService/Policy/_PrivateInfo.jsp"
								flush="false" />
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 챗봇 -->
<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>
	window.fbAsyncInit = function() {
        FB.init({
            xfbml   : true,
            version : 'v6.0'
        });
    };
    
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/ko_KR/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
</script>

<!-- Your customer chat code -->
<div class="fb-customerchat" attribution=setup_tool
	page_id="1763283283755673" theme_color="#0084ff"
	logged_in_greeting="안녕하세요 Mwav 입니다. 무엇을 도와 드릴까요?"
	logged_out_greeting="이용해주셔서 감사합니다.">
</div>

