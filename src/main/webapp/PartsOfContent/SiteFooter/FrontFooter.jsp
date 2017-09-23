<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Google Analytics Content Experiment code -->
<script>
	function utmx_section() {
	}
	function utmx() {
	}
	(function() {
		var k = '140395023-0', d = document, l = d.location, c = d.cookie;
		if (l.search.indexOf('utm_expid=' + k) > 0)
			return;
		function f(n) {
			if (c) {
				var i = c.indexOf(n + '=');
				if (i > -1) {
					var j = c.indexOf(';', i);
					return escape(c.substring(i + n.length + 1,
							j < 0 ? c.length : j))
				}
			}
		}
		var x = f('__utmx'), xx = f('__utmxx'), h = l.hash;
		d.write('<sc' + 'ript src="' + 'http'
				+ (l.protocol == 'https:' ? 's://ssl' : '://www')
				+ '.google-analytics.com/ga_exp.js?' + 'utmxkey=' + k
				+ '&utmx=' + (x ? x : '') + '&utmxx=' + (xx ? xx : '')
				+ '&utmxtime=' + new Date().valueOf()
				+ (h ? '&utmxhash=' + escape(h.substr(1)) : '')
				+ '" type="text/javascript" charset="utf-8"><\/sc'+'ript>')
	})();
</script>
<script>
	utmx('url', 'A/B');
</script>
<!-- End of Google Analytics Content Experiment code -->

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
<%--https://www.simoahava.com/analytics/page-load-time-universal-analytics/

	//ga('create', 'UA-63623427-1', 'auto');
	//cookieDomain none 으로 하면 localhost 까지 잡아낸다.
	//http://www.statstory.com/google-universal-analytics-on-localhost-not-working/--%>
	ga('create', 'UA-63623427-1', {
		'cookieDomain' : 'www.mwav.net',
		'siteSpeedSampleRate' : 100
	}); // 사이트 속도 측정 100은 전체 체크 (2017_01_10)
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
	<!--/////////////////////////////////////////////////// -->
	<jsp:include page="/CommonApps/BoardQnA/qaForm.jsp" flush="false" />
	<!--/////////////////////////////////////////////////// -->
	<%--LayerPopup Alert 아이콘 시작 // footer 간격조정을 위해 mgt5추가--%>
	<!-- <div class="col-md-12 col-xs-12 col-sm-12  alert alert-info"
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
	</div> -->
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
					<li>CompanyName : Mwav Inc.</li>
					<li>Business Registration Number : 206-09-41373</li>
					<li>Address: GV-4F, 5-5, Ttukseom-ro 46-gil, Gwangjin-gu,
						Seoul , Korea [143-865]</li>
					<li>TEL : +82-2-6214-7039</li>
					<li>FAX: +82-2-6214-1122</li>
					<li>CEO : Lewis Kim</li>
					<li>WebSite Manager : James Lee</li>
					<li>Marketing Manager : Alex Chae</li>
					<li>Chief IT-Business Advisor : Peter J.</li>
					<%-- <li>Sales Manager: ${param.pgl}</li> --%>
				</ul>
				<%--
				
				<ul>
						<li>회사상호 : 엠웨이브넷(Mwav.net)</li>
						<li>사업자번호: 206-09-41373</li>
						<li>주소: 서울 광진 자양2동 607-20 GV4F</li>
						<li>TEL : +82-2-6214-7039</li>
						<li>FAX: +82-2-6214-1122</li>
						<li>대표이사 : Zeus | 영업담당자: Song</li>
						<li>사이트 담당자 : James | 사업 고문 : Peter</li>
					</ul>
				 --%>

			</div>
			<div class="col-xs-12 col-sm-8 col-md-4">
				<h3>Navigate</h3>
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
						<!-- <a href="mailto:ebizpromwav@gmail.com" title="Contact me!"><i
						class="fa fa-envelope"></i> Contact</a> -->
						<%--줄 없애기 + 그다음에 메일로 바로연결이아닌 qa쪽 고민 --%>

						<a href="#" class="btn btn-block btn-primary" data-toggle="modal"
							data-target="#Contact"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Footer');"
							style="color: white;"><span
							class="glyphicon glyphicon-envelope"></span> Contact</a>
					</p>
					<p>&nbsp;</p>

					<ul class="list-unstyled list-inline list-social-icons">
						<li><a href=""
							class="btn btn-social-icon btn-twitter" style="color: white;"
							target="_blank"
							onclick="ga('send', 'event', 'twitter', 'click', 'Footer'); redirectUrl('https://twitter.com/mwavnet', '_blank'); ">
								<span class="fa fa-twitter"></span>
						</a></li>
						<li><a href=""
							class="btn btn-social-icon btn-facebook" style="color: white;"
							target="_blank"
							onclick="ga('send', 'event', 'facebook', 'click', 'Footer'); redirectUrl('https://www.facebook.com/mwavsns', '_blank'); ">
								<span class="fa fa-facebook"></span>
						</a></li>
						<li><a
							href=""
							class="btn btn-social-icon btn-google" style="color: white;"
							target="_blank"
							onclick="ga('send', 'event', 'googleplus', 'click', 'Footer'); redirectUrl('https://plus.google.com/113341818785719365682?hl=ko', '_blank'); ">
								<span class="fa fa-google"></span>
						</a></li>
						<li><a href=""
							class="btn btn-social-icon btn-linkedin" style="color: white;"
							onclick="ga('send', 'event', 'linkedin', 'click', 'Footer'); redirectUrl('https://www.linkedin.com/in/mwav-net-255543133/', '_blank');" target="_blank">
								<span class="fa fa-linkedin"></span>
						</a></li>
						<li><a href=""
							class="btn btn-social-icon btn-instagram" style="color: white;"
							target="_blank"
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
		<p class="pull-left">
			Copyright ⓒ Since 2004 Mwav.net All rights reserved | <a>Privacy
				Policy</a> | <a>Terms of Use</a>
		</p>
		<div class="pull-right">
			<ul class="nav nav-pills payments">
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="visa"
					aria-describedby="tooltip235096"><i class="fa fa-cc-visa"></i></li>
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="mastercard"
					aria-describedby="tooltip235096"><i
					class="fa fa-cc-mastercard"></i></li>
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="amex"
					aria-describedby="tooltip235096"><i class="fa fa-cc-amex"></i></li>
				<li class="tooltips" data-toggle="tooltip" data-placement="top"
					title="" data-original-title="paypal"
					aria-describedby="tooltip235096"><i class="fa fa-cc-paypal"></i></li>
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



