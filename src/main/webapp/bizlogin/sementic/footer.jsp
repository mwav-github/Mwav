<%-- Promoter 사이트 푸터 jsp 파일 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<section class="footer-top  padding-y">
		<div class="row">
			<aside class="col-md-4 col-12">
				<article class="mr-md-4">
					<h5 class="title">Contact us</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in feugiat lorem.</p>
					<ul class="list-icon">
						<li><i class="icon fa fa-map-marker"> </i>542 Fake Street, Cityname 10021 Netheerlends</li>
						<li><i class="icon fa fa-envelope"> </i> info@example.com</li>
						<li><i class="icon fa fa-phone"> </i> (800) 060-0730, (800) 060-0730</li>
						<li><i class="icon fa fa-clock"> </i>Mon-Sat 10:00pm - 7:00pm</li>
					</ul>
				</article>
			</aside>
			<aside class="col-md col-6">
				<h5 class="title">Information</h5>
				<ul class="list-unstyled">
					<li><a href="#">About us</a></li>
					<li><a href="#">Career</a></li>
					<li><a href="#">Find a store</a></li>
					<li><a href="#">Rules and terms</a></li>
					<li><a href="#">Sitemap</a></li>
				</ul>
			</aside>
			<aside class="col-md col-6">
				<h5 class="title">My Account</h5>
				<ul class="list-unstyled">
					<li><a href="#">Contact us</a></li>
					<li><a href="#">Money refund</a></li>
					<li><a href="#">Order status</a></li>
					<li><a href="#">Shipping info</a></li>
					<li><a href="#">Open dispute</a></li>
				</ul>
			</aside>
			<aside class="col-md-4 col-12">
				<h5 class="title">Newsletter</h5>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in feugiat lorem.</p>

				<form class="form-group mb-2">
					<input type="text" placeholder="Email" class="form-control" name="">
					<button class="btn btn-warning form-control mt-2">Subscribe</button>
				</form>

				<p class="text-white-50 mb-2">Follow us on social media</p>
				<div>
					<a href="#" class="btn btn-icon btn-light">
						<i class="fab fa-facebook-f"></i>
					</a>
					<a href="#" class="btn btn-icon btn-light">
						<i class="fab fa-twitter"></i>
					</a>
					<a href="#" class="btn btn-icon btn-light">
						<i class="fab fa-instagram"></i>
					</a>
					<a href="#" class="btn btn-icon btn-light">
						<i class="fab fa-youtube"></i>
					</a>
				</div>

			</aside>
		</div>
		<!-- row.// -->
	</section>
	<!-- footer-top.// -->

	<section class="footer-bottom border-top row">
		<div class="col-md-6">
			<p class="mb-0">
				<a href="">Terms and Conditions</a>
				|
				<a href="">Privacy</a>
				|
				<a href="">Cookies</a>
			</p>
		</div>
		<div class="col-md-6 text-md-right">
			<i class="fab fa-lg fa-cc-visa"></i> <i class="fab fa-lg fa-cc-paypal"></i> <i class="fab fa-lg fa-cc-mastercard"></i>
		</div>
	</section>
</div>
<!-- //container -->


<div class="modal fade" id="pmtPolicy" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header" style="border-bottom: 0px solid #eee; background-color: #f8f9fa !important">
				<h4 class="modal-title">이용약관</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<br>
			<ul id="myTab" class="nav nav-pills nav-justified">
				<li class="nav-item active"><a href="#terms1" class="nav-link active" data-toggle="tab">이메일 주소무단수집거부</a></li>
				<li class="nav-item"><a href="#terms2" class="nav-link" data-toggle="tab">청소년보호정책</a></li>
				<li class="nav-item"><a href="#terms3" class="nav-link" data-toggle="tab">개인정보취급방침</a></li>
			</ul>
			<%--max-height로 아래 설정하면 영역이 안잡혀서 안먹힌다. --%>
			<div class="modal-body" style="overflow-y: scroll; height: 300px;">
				<div class="container-fluid">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade show active" id="terms1">
							<jsp:include page="/bizlogin/cs/policy/emailExtract.jsp" flush="false" />
						</div>
						<div class="tab-pane fade" id="terms2">

							<jsp:include page="/bizlogin/cs/policy/juvenile.jsp" flush="false" />
						</div>
						<div class="tab-pane fade" id="terms3">
							<jsp:include page="/bizlogin/cs/policy/privateInfo.jsp" flush="false" />
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

