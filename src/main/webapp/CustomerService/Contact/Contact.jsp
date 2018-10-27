<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Customer Service <small> Contacts</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/">Home</a></li>
			<li>Customer Service</li>
			<li class="active">Contacts</li>
		</ol>
	</div>
</div>
<!-- /.row -->

<!-- Content Row -->
<div class="row">
	<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
	<div class="col-md-3">
		<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
			flush="false" />
	</div>
	<!-- 끝 -->

	<div class="col-md-9">
		<!-- <span class="label label-primary">Contact</span> 위에는 사진 형식으로 예정
 -->

		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header mwav_leftText">Contacts</h2>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Lewis Kim</h1>
						<br>
					</div>
					<p class="description">
						<strong><small>Chief Executive Officer</small></strong> <br>
						<br> Business, Issue Feedback, HR, IPR Infringement
					</p>
					<p class="more">

						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm" data-type="P"
							data-id="10001001"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Contact');">
							Contact </a> <i class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>



			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Dave Shin</h1>
						<br>
					</div>
					<p class="description">
						<strong><small>Chief Marketing Officer</small></strong> <br /> <br />
						Digital Marketing, Distribution Channel, Affiliate Program

					</p>
					<p class="more">
						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm" data-type="P"
							data-id="10001002"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Contact');">
							Contact</a> <i class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>TaeYi Yoon</h1>
						<br>
					</div>
					<p class="description">
						<strong><small>Chief Financial Officer</small></strong> <br /> <br /><br />
						Investment & Funding

					</p>
					<p class="more">
						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Contact');">
							Contact</a> <i class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Hunt Kim</h1>
						<br>
					</div>
					<p class="description">
						<strong><small>Chief Operation Officer</small></strong> <br /> <br />
						Online User Guide, Information Security, Bugs Report
					</p>
					<p class="more">
						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm" data-type="P"
							data-id="10001002"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Contact');">
							Contact</a> <i class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>James Lee</h1>
						<br>
					</div>
					<p class="description">
						<strong><small>Chief Technical Officer</small></strong> <br /> <br />
						IT Projects, Technical Support & Service
					</p>
					<p class="more">
						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm" data-type="S"
							data-id="102"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Contact');">
							Contact</a> <i class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

			<div class="col-xs-12 col-sm-4 col-md-4">
				<div class="news">
					<div class="title">
						<%-- <i class="fa fa-user-o" aria-hidden="true"
									style="text-align:center; font-size: 3rem; color: #D8D8D8; -webkit-transition: all .3s ease-in-out; transition: all .3s ease-in-out;"></i> --%>
						<br>
						<h1>Peter J. Cho</h1>
						<br>
					</div>
					<p class="description">
						<strong><small>Chief Information Officer (CIO)</small></strong> <br />
						<br /> IT Consulting (Solutions & Products), IT Partnership
					</p>
					<p class="more">
						<a href="/CustomerService/QnA/QnA.mwav?mode=qaForm" data-type="P"
							data-id="10001002"
							onclick="ga('send', 'event', 'Q&A', 'click', 'Contact');">
							Contact</a> <i class="fa fa-angle-right" aria-hidden="true"></i>
					</p>
				</div>
				<div class="enter"></div>
			</div>

		</div>
	</div>
</div>
<!-- /.row -->
