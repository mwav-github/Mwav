<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<!--  //////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteHeader/FrontHeader_Master.jsp"
			flush="false" />
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<img src="/CompanyItem/zImage/CompanyItem_IN(height_280).jpg"
				class="img-responsive res_width fix_height_300" alt="CompanyItem">
		</div>
	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					IT Products <small>OpenSRS</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li>IT Products</li>
					<li class="active">OpenSRS</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row ">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/CompanyItem/ITProducts/ITProductsLeftMenu.jsp"
					flush="false" />
			</div>
			<!-- 끝 -->

			<!-- Content Column -->
			<div class="col-md-9 text-color-gray">
				<!-- OpenSRS_SSL Certificates -->
				<div class="row text-color-gray">
					<!-- <div class="col-md-8 col-md-offset-2" style="background-color: #990085; color: white;">
						<h1 class="text-center">What Is AerPass™?</h1>
					</div>
					<br> -->
					<div class="col-md-12 text-center">
						<h1 style="color: #f37d27;">SSL Certificates</h1>
						<hr>
					</div>

					<div
						class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-4 col-md-2 col-md-offset-0">
						<img class="thumbnail img-responsive" alt="ssl"
							src="/CompanyItem/ITProducts/Images/ssl.png"
							data-toggle="tooltip" data-placement="top"
							data-original-title="SSL Certificates">
						<div class="enter"></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-10 text-center">
						<h3>SSL Certificates for every customer need.</h3>
						<p>OpenSRS partners with leading providers so you can offer
							your customers the right SSL certificates no matter what their
							unique need or circumstance might be.</p>
					</div>


					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>A more secure Internet starts with you</h3>
					</div>
					<div class="col-xs-12 col-sm-9 col-md-9">

						<p>Did you know that 97% of all websites lack basic security?
							Just let that sink in for a minute. Only 3% of websites are
							considered “safe”. Chances are, you probably visited an
							unencrypted site today. In an effort to make the Internet more
							secure, we have partnered with Symantec to bring you the
							Encryption Everywhere program.</p>
					</div>
					<div
						class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0">
						<img class="img-responsive" alt="orgchart-now-3"
							src="/CompanyItem/ITProducts/Images/encryption-everywhere.jpg">
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h3>Program at a glance</h3>
					</div>
					<br>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<p>
							The Encryption Everywhere program was designed to provide basic
							web security to everyone, FREE of charge. This is accomplished
							through SSL Lite – a complimentary certificate that provides
							basic encryption without the bells and whistles. By participating
							in this program, you will gain exclusive access to SSL Lite with
							the opportunity to grow your business and change the Internet
							security game. If you’re looking for something more robust, you
							can always offer our other <span class="text-color-orange-type-1"></span>
						</p>
						<br>
					</div>

					<div class="col-md-12 col-xs-12 col-sm-12 text-center">
						<h3>Why consider Encryption Everywhere?</h3>
						<div class="col-md-3 col-sm-6 col-xs-6 right_hr">
							<p>
								<img class="col-md-12 col-md-push-0 col-xs-8 col-xs-push-2 col-sm-6 col-sm-push-3 img-responsive"
									src="/CompanyItem/ITProducts/Images/EE_icn1.png" alt="EE_icn1" />
							</p>
							<p class="col-md-12 col-sm-12 col-xs-12">Increase growth and revenue by upselling more robust <span class="text-color-orange-type-1"><strong>SSL
								certificates</strong></span> later on.</p>
								<div class="enter visible-xs visible-sm hidden-md hidden-lg"></div>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6 right_hr">
							<p>
								<img class="col-md-12 col-md-push-0 col-xs-8 col-xs-push-2 col-sm-6 col-sm-push-3 img-responsive"
									src="/CompanyItem/ITProducts/Images/EE_icn22.png" alt="EE_icn22" />
							</p>
							<p class="col-md-12 col-sm-12 col-xs-12">Provide basic security to your customers’ websites, valid
								up to 365 days.</p>
						</div>
						<%--박스 2/2 배열일 때 칸 띄우기 --%>
						<div class="enter col-md-12 col-xs-12 col-sm-12 hidden-md hidden-lg" ></div>
						
						<div class="col-md-3 col-sm-6 col-xs-6 right_hr">
							<p>
								<img class="col-md-12 col-md-push-0 col-xs-8 col-xs-push-2 col-sm-6 col-sm-push-3 img-responsive"
									src="/CompanyItem/ITProducts/Images/EE_icn44.png" alt="EE_icn44" />
							</p>
							<p class="col-md-12 col-sm-12 col-xs-12">Hassle-free, instant startup and immediate validation with
								no commitment/application required.</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6 right_hr">
							<p>
								<img class="col-md-12 col-md-push-0 col-xs-8 col-xs-push-2 col-sm-6 col-sm-push-3 img-responsive"
									src="/CompanyItem/ITProducts/Images/EE_icn55.png" alt="EE_icn55" />
							</p>
							<p class="col-md-12 col-sm-12 col-xs-12">Contribute to the bigger picture of a safer and more
								secure Internet.</p>
						</div>

					</div>
					<div class="col-md-12">
						<div
							class="mgt3 col-md-12 col-xs-12 col-sm-12 Leading providers. Dozens of options. text-center">
							<h3>The leading SSL providers with dozens of certificate
								options.</h3>
							<br />
						</div>
						<div class="col-xs-4 col-sm-4 col-md-offset-2 col-md-2 ">
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/rapidssllogo.png"
								alt="rapidssllogo" data-toggle="tooltip" data-placement="top"
								data-original-title="rapidssl">

						</div>
						<div class="col-xs-4 col-sm-4 col-md-2 ">
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/digicertlogo.png"
								alt="digicertlogo" data-toggle="tooltip" data-placement="top"
								data-original-title="digicertlogo">

						</div>
						<div class="col-xs-4 col-sm-4 col-md-2">
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/symantec.png" alt="symantec"
								data-toggle="tooltip" data-placement="top"
								data-original-title="symantec">

						</div>
						<div class="col-xs-4 col-sm-4 col-md-2">
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/thawte.png" alt="thawte"
								data-toggle="tooltip" data-placement="top"
								data-original-title="thawte"> <br>
						</div>
						<div class="col-xs-4 col-sm-4 col-md-offset-3 col-md-2">
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/trustwave.png"
								alt="trustwave" data-toggle="tooltip" data-placement="top"
								data-original-title="trustwave"> <br>
						</div>
						<div class="col-xs-4 col-sm-4 col-md-2">
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/geotrust.png" alt="geotrust"
								data-toggle="tooltip" data-placement="top"
								data-original-title="geotrust"> <br>
						</div>
						<div class="col-xs-4 col-sm-4 col-md-2">
							<!-- col-xs-6 col-xs-pull-6 col-sm-6 col-sm-pull-6 col-md-2 col-md-pull-0 -->
							<img class="img-responsive"
								src="/CompanyItem/ITProducts/Images/comodo.png" alt="comodo"
								data-toggle="tooltip" data-placement="top"
								data-original-title="comodo"> <br>
						</div>
					</div>
				</div>
				<div class="enter"></div>
				<!-- /.row -->




				<!-- Features Table -->
				<div class="row text-color-gray">
					<div
						class="col-md-12 col-xs-12 col-sm-12 Leading providers. Dozens of options. text-center">
						<h3>Compare RapidSSL Certificates</h3>
						<br>
					</div>

					<div class="col-md-12 col-xs-12 col-sm-12 text-center">
						<h4>
							<b>RapidSSL Basic</b><br>
						</h4>
						<div class="col-md-3 col-sm-3 col-xs-6 well">
							<p>Validation type</p>
							<h4>DomainValidated</h4>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-6 well">
							<p>Browser compatibility</p>
							<h4>99%</h4>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-6 well">
							<p>Issuance</p>
							<h4>Minutes</h4>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-6 well">
							<p>Warranty</p>
							<h4>$10,000</h4>
						</div>
						<div class="enter"></div>
					</div>

					<div class="col-lg-12">
						<table
							class="table table-bordered table-hover table-striped text-center">
							<colgroup>
								<col style="width: 40%;">
								<col style="width: 30%;">
								<col style="width: 30%;">
							</colgroup>
							<thead>
								<tr class="well">
									<th class="text-center"></th>
									<th class="text-center">
										<h5>
											<strong>RapidSSL Basic</strong>
										</h5>
									</th>
									<th class="text-center">
										<h5>
											<strong>RapidSSL Wildcard </strong>
										</h5>
									</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Validation type</td>
									<td>Domain Validated</td>
									<td>Domain Validated</td>
								</tr>

								<tr>
									<td>Wildcard <%--pc에서는 hover --%> <a
										class="btn btn-primary btn-xs btn-pointer hidden-xs hidden-sm"
										data-toggle="popover" data-trigger="hover" title="Wildcard"
										data-placement="right"
										data-content="A wildcard certificate allows for unlimited subdomains to be protected with a single certificate."><span
											class="glyphicon glyphicon glyphicon-search"></span></a> <%--mobile에서는 popover --%>
										<a
										class="btn btn-primary btn-xs btn-pointer hidden-lg hidden-md"
										data-toggle="popover" title="Wildcard" data-placement="right"
										data-content="A wildcard certificate allows for unlimited subdomains to be protected with a single certificate."><span
											class="glyphicon glyphicon glyphicon-search"></span></a>
									</td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
									<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								</tr>
								<tr>
									<td>SAN support <%--pc에서는 hover --%> <a
										class="btn btn-primary btn-xs btn-pointer hidden-xs hidden-sm"
										data-toggle="popover" data-trigger="hover" title="SAN"
										data-placement="right"
										data-content="A SAN certificate allows for multiple domain names to be protected with a single certificate."><span
											class="glyphicon glyphicon glyphicon-search"></span></a> <%--mobile에서는 popover --%>
										<a
										class="btn btn-primary btn-xs btn-pointer hidden-lg hidden-md"
										data-toggle="popover" title="SAN" data-placement="right"
										data-content="A SAN certificate allows for multiple domain names to be protected with a single certificate."><span
											class="glyphicon glyphicon glyphicon-search"></span></a>
									</td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								</tr>
								<tr>
									<td>Issuance</td>
									<td>Minutes</td>
									<td>Minutes</td>
								</tr>
								<tr>
									<td>Re-issues</td>
									<td>Unlimited</td>
									<td>Unlimited</td>
								</tr>
								<tr>
									<td>Warranty</td>
									<td>$10,000</td>
									<td>$10,000</td>
								</tr>
								<tr>
									<td>Business validated</td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								</tr>
								<tr>
									<td>Green address bar</td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								</tr>
								<tr>
									<td>Security and encryption</td>
									<td>256-bit encryption</td>
									<td>256-bit encryption</td>
								</tr>
								<tr>
									<td>Available periods</td>
									<td>1-2 years</td>
									<td>1-2 years</td>
								</tr>
								<tr>
									<td>Vulnerability assessment</td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								</tr>
								<tr>
									<td>Site seal</td>
									<td>Static</td>
									<td>Static</td>
								</tr>
								<tr>
									<td>Server licensing</td>
									<td>Unlimited</td>
									<td>Unlimited</td>
								</tr>
								<tr>
									<td>Malware scan</td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
									<td><span class="glyphicon glyphicon-remove text-danger"></span></td>
								</tr>
								<tr>
									<td>Mobile friendly</td>
									<td><span class="glyphicon glyphicon-ok text-success"></span></td>
									<td><span class="glyphicon glyphicon-ok text-success"></span></td>
								</tr>
								<tr>
									<td>Browser compatibility</td>
									<td>99%</td>
									<td>99%</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="enter"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>