<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
fieldset {
	display: none
}

fieldset.show {
	display: block
}

select:focus, input:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #2196F3 !important;
	outline-width: 0 !important;
	font-weight: 400
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}

.tabs {
	margin: 2px 5px 0px 5px;
	padding-bottom: 10px;
	cursor: pointer
}

.tabs:hover, .tabs.active {
	border-bottom: 1px solid #2196F3
}

a:hover {
	text-decoration: none;
	color: #1565C0
}

.box {
	margin-bottom: 10px;
	border-radius: 5px;
	padding: 10px
}

.modal-backdrop {
	background-color: #64B5F6
}

.line {
	background-color: #CFD8DC;
	height: 1px;
	width: 100%
}

@media screen and (max-width: 768px) {
	.tabs h6 {
		font-size: 12px
	}
}
</style>
<script>
	$(document).ready(function() {

		$(".tabs").click(function() {

			$(".tabs").removeClass("active");
			$(".tabs h6").removeClass("font-weight-bold");
			$(".tabs h6").addClass("text-muted");
			$(this).children("h6").removeClass("text-muted");
			$(this).children("h6").addClass("font-weight-bold");
			$(this).addClass("active");

			current_fs = $(".active");

			next_fs = $(this).attr('id');
			next_fs = "#" + next_fs + "1";

			$("fieldset").removeClass("show");
			$(next_fs).addClass("show");

			current_fs.animate({}, {
				step : function() {
					current_fs.css({
						'display' : 'none',
						'position' : 'relative'
					});
					next_fs.css({
						'display' : 'block'
					});
				}
			});
		});

	});
</script>

<%-- Policy(Terms of use using modal) --%>
<!-- Modal-->
<div id="pmtPolicy" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
	class="modal fade text-left">
	<div role="document" class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header row d-flex justify-content-between mx-1 mx-sm-3 mb-0 pb-0 border-0">
				<div class="tabs" id="tab01">
					<h6 class="text-muted">My Apps</h6>
				</div>
				<div class="tabs active" id="tab02">
					<h6 class="font-weight-bold">Knowledge Center</h6>
				</div>
				<div class="tabs" id="tab03">
					<h6 class="text-muted">Communities</h6>
				</div>
			</div>
			<div class="line"></div>
			<div class="modal-body p-0">
				<fieldset id="tab011">
					<div class="bg-light">
						<h5 class="text-center mb-4 mt-0 pt-4">My Apps</h5>
						<h6 class="px-3">Most Used Apps</h6>
						<ol class="pb-4">
							<li>Watsapp</li>
							<li>Instagram</li>
							<li>Chrome</li>
							<li>Linkedin</li>
						</ol>
					</div>
					<div class="px-3">
						<h6 class="pt-3 pb-3 mb-4 border-bottom">
							<span class="fa fa-android"></span> Suggested Apps
						</h6>
						<h6 class="text-primary pb-2">
							<a href="#">Opera Browser</a>
							<span class="text-secondary">- One of the best browsers</span>
						</h6>
						<h6 class="text-primary pb-2">
							<a href="#">Camscanner</a>
							<span class="text-secondary">- Easily scan your documents</span>
						</h6>
						<h6 class="text-primary pb-4">
							<a href="#">Coursera</a>
							<span class="text-secondary">- Learn online, lecturers from top universities</span>
						</h6>
					</div>
				</fieldset>
				<fieldset class="show" id="tab021">
					<div class="bg-light">
						<h5 class="text-center mb-4 mt-0 pt-4">Knowledge Center</h5>
						<form>
							<div class="form-group pb-5 px-3">
								<select name="account" class="form-control">
									<option selected disabled>Select Product</option>
									<option>Product 1</option>
									<option>Product 2</option>
									<option>Product 3</option>
									<option>Product 4</option>
								</select>
							</div>
						</form>
					</div>
					<div class="px-3">
						<h6 class="pt-3 pb-3 mb-4 border-bottom">
							<span class="fa fa-star"></span> Popular Topics
						</h6>
						<h6 class="text-primary pb-2">
							<a href="#">Getting started with Blazemeter</a>
						</h6>
						<h6 class="text-primary pb-2">
							<a href="#">Creating tests</a>
						</h6>
						<h6 class="text-primary pb-4">
							<a href="#">Running tests</a>
						</h6>
					</div>
				</fieldset>
				<fieldset id="tab031">
					<div class="bg-light">
						<h5 class="text-center mb-4 mt-0 pt-4">Communities</h5>
						<form>
							<div class="form-group pb-5 px-3 row justify-content-center">
								<button type="button" class="btn btn-primary">New Community +</button>
							</div>
						</form>
					</div>
					<div class="px-3">
						<div class="border border-1 box">
							<h5>Community 1</h5>
							<p class="text-muted mb-1">
								Members : <strong>27</strong>
							</p>
						</div>
						<div class="border border-1 box">
							<h5>Community 2</h5>
							<p class="text-muted mb-1">
								Members : <strong>16</strong>
							</p>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="line"></div>
			<div class="modal-footer d-flex flex-column justify-content-center border-0">
				<p class="text-muted">Can't find what you're looking for?</p>
				<button type="button" class="btn btn-primary">Contact Support Team</button>
			</div>
		</div>
	</div>
</div>