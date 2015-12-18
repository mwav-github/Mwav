<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	ga('create', 'UA-63623427-1', 'auto');
	ga('send', 'pageview');
</script>
<br />
<!--TOP아이콘 -->
<a id="back-to-top" href="#"
	class="pull-right btn btn-primary btn-lg back-to-top" role="button"
	title="Click to return on the top page" data-placement="left"><span
	class="glyphicon glyphicon-chevron-up"></span></a>

<%--아이콘 시작 // footer 간격조정을 위해 mgt5추가--%>
<div class="footer mgt5" id="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-4  col-md-4 col-sm-8 col-xs-12">
		
				<p style="padding: 40px 0px 10px; border-bottom: 1px solid #BAC1C8;">
					<img src="/Company/zImage/CompanyLogo_gray.gif"
						class="img-thumbnail img-responsive logo_800_h" alt="Responsive image">
				</p>
				
					<ul>
						<li>회사상호 : 엠웨이브넷(Mwav.net)</li>
						<li>사업자번호: 206-09-41373</li>
						<li>주소: 서울 광진 자양2동 607-20 GV4F</li>
						<li>TEL : +82-2-6214-7039</li>
						<li>FAX: +82-2-6214-1122</li>
						<li>대표이사 : Zeus | 영업담당자: Song</li>
						<li>사이트 담당자 : James | 사업 고문 : Peter</li>
					</ul>
				

			</div>
			<div class="col-lg-4  col-md-4 col-sm-8 col-xs-12">
				<h3>Navigate</h3>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<ul>
						<li><a href="/">Home</a></li>
						<li><a href="/Company/Introduction/Introduction.jsp">Introduction</a></li>
						<li><a href="/Company/BusinessField/BusinessFields.jsp">BusinessField</a></li>
						<li><a href="/Company/LocationMap/LocationMap.jsp">LocationMap</a></li>
						<li><a href="/Company/Profitsharing/Profitsharing.jsp">Profitsharing</a></li>
					</ul>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<ul>
						<li><a href="/CustomerService/Contact/Contact.jsp">Contact</a></li>
						<li><a href="/CustomerService/SiteMap/SiteMap.jsp">SiteMap</a></li>
						<li><a href="#terms3" data-toggle="modal" data-target=".bs-modal-sm">개인정보취급방침</a></li>
						<li><a href="#terms1" data-toggle="modal" data-target=".bs-modal-sm">이메일주소수집거부</a></li>
						<li><a href="/CustomerService/Summary/Summary.jsp">Summary</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4  col-md-4 col-sm-8 col-xs-12 ">
				<h3>Contact:</h3>
				<p>Have a question or feedback?</p>
				<p>Contact me!</p>
				<p>
					<a href="mailto:webmaster@mwav.net" title="Contact me!"><i
						class="fa fa-envelope"></i> Contact</a>
					<%--줄 없애기 + 그다음에 메일로 바로연결이아닌 qa쪽 고민 --%>
				</p>
				<ul class="social">
					<li><a href="#"> <i class=" fa fa-facebook">   </i>
					</a></li>
					<li><a href="#"> <i class="fa fa-twitter">   </i>
					</a></li>
					<li><a href="#"> <i class="fa fa-google-plus">   </i>
					</a></li>
					<li><a href="#"> <i class="fa fa-pinterest">   </i>
					</a></li>
					<li><a href="#"> <i class="fa fa-youtube">   </i>
					</a></li>
				</ul>
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
			Copyright ⓒ Since 2004 Mwav.net All rights reserved | <a href="">Privacy
				Policy</a> | <a href="">Terms of Use</a>
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


<!-- 모달영역 -->

<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="overflow: auto;">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header"
					style="border-bottom: 0px solid #eee; background-color: #0480be; color: white;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">약관</h4>
				</div>
				<br>
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#terms1" data-toggle="tab">이메일 주소무단수집거부</a></li>
						<li class=""><a href="#terms2" data-toggle="tab">청소년보호정책</a></li>
						<li class=""><a href="#terms3" data-toggle="tab">개인정보취급방침</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active fade in" id="terms1">
								<jsp:include page="/CustomerService/Policy/_EmailExtract.html" flush="false" />
							</div>
							<div class="tab-pane fade " id="terms2">
								
								<jsp:include page="/CustomerService/Policy/_Juvenile.html" flush="false" />
							</div>
							<div class="tab-pane fade" id="terms3">
								<jsp:include page="/CustomerService/Policy/_PrivateInfo.html" flush="false" />
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