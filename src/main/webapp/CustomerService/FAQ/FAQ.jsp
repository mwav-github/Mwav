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
	$(document)
			.ready(
					function() {
						$('.collapse')
								.on(
										'show.bs.collapse',
										function() {
											var id = $(this).attr('id');
											$('a[href="#' + id + '"]').closest(
													'.panel-heading').addClass(
													'active-faq');
											$('a[href="#' + id + '"]  span')
													.html(
															'<i class="glyphicon glyphicon-minus"></i>');
										});
						$('.collapse')
								.on(
										'hide.bs.collapse',
										function() {
											var id = $(this).attr('id');
											$('a[href="#' + id + '"]').closest(
													'.panel-heading')
													.removeClass('active-faq');
											$('a[href="#' + id + '"]  span')
													.html(
															'<i class="glyphicon glyphicon-plus"></i>');
										});
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
		<!--  //////////////////////////////////// -->
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img
					src="/CustomerService/zImage/CustomerService_IN(height_280).jpg"
					class="img-responsive res_width" alt="Responsive image">
			</div>
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
					CustomerService <small> FAQ</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>CustomerService</li>
					<li class="active">FAQ</li>
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
			
			<div class="enter"></div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1 ">
						<!-- Nav tabs category -->
						<ul class="nav nav-tabs faq-cat-tabs">
							<li role="presentation" class="active"><a href="#faq-cat-1" data-toggle="tab"><h4>Category
									#1</h4></a></li>
							<li role="presentation"><a href="#faq-cat-2" data-toggle="tab"><h4>Category #2</h4></a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content faq-cat-content ">
							<div class="tab-pane active in fade" id="faq-cat-1">
								<div class="panel-group" id="accordion-cat-1">
									<div class="panel panel-default panel-faq">
										<div class="panel-heading font_color_faq">
											<h5> <!-- <h5 class="panel-title"> -->
												<a data-toggle="collapse" data-parent="#accordion-cat-1"
													href="#faq-cat-1-sub-1"> FAQ Item Category #1 <span
													class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span>
												</a>
											</h5>
										</div>
										<div id="faq-cat-1-sub-1" class="panel-collapse collapse">
											<div class="panel-body">Anim pariatur cliche
												reprehenderit, enim eiusmod high life accusamus terry
												richardson ad squid. 3 wolf moon officia aute, non cupidatat
												skateboard dolor brunch. Food truck quinoa nesciunt laborum
												eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
												on it squid single-origin coffee nulla assumenda shoreditch
												et. Nihil anim keffiyeh helvetica, craft beer labore wes
												anderson cred nesciunt sapiente ea proident. Ad vegan
												excepteur butcher vice lomo. Leggings occaecat craft beer
												farm-to-table, raw denim aesthetic synth nesciunt you
												probably haven't heard of them accusamus labore sustainable
												VHS.</div>
										</div>
									</div>
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-1"
													href="#faq-cat-1-sub-2"> FAQ Item Category #1 <span
													class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span>
												</a>
											</h5>
										</div>
										<div id="faq-cat-1-sub-2" class="panel-collapse collapse">
											<div class="panel-body">Anim pariatur cliche
												reprehenderit, enim eiusmod high life accusamus terry
												richardson ad squid. 3 wolf moon officia aute, non cupidatat
												skateboard dolor brunch. Food truck quinoa nesciunt laborum
												eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
												on it squid single-origin coffee nulla assumenda shoreditch
												et. Nihil anim keffiyeh helvetica, craft beer labore wes
												anderson cred nesciunt sapiente ea proident. Ad vegan
												excepteur butcher vice lomo. Leggings occaecat craft beer
												farm-to-table, raw denim aesthetic synth nesciunt you
												probably haven't heard of them accusamus labore sustainable
												VHS.</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="faq-cat-2">
								<div class="panel-group" id="accordion-cat-2">
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5>
												<a data-toggle="collapse" data-parent="#accordion-cat-2"
													href="#faq-cat-2-sub-1"> FAQ Item Category #2 <span
													class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span>
												</a>
											</h5>
										</div>
										<div id="faq-cat-2-sub-1" class="panel-collapse collapse">
											<div class="panel-body">Anim pariatur cliche
												reprehenderit, enim eiusmod high life accusamus terry
												richardson ad squid. 3 wolf moon officia aute, non cupidatat
												skateboard dolor brunch. Food truck quinoa nesciunt laborum
												eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
												on it squid single-origin coffee nulla assumenda shoreditch
												et. Nihil anim keffiyeh helvetica, craft beer labore wes
												anderson cred nesciunt sapiente ea proident. Ad vegan
												excepteur butcher vice lomo. Leggings occaecat craft beer
												farm-to-table, raw denim aesthetic synth nesciunt you
												probably haven't heard of them accusamus labore sustainable
												VHS.</div>
										</div>
									</div>
									<div class="panel panel-default panel-faq">
										<div class="panel-heading">
											<h5> 
												<a data-toggle="collapse" data-parent="#accordion-cat-2"
													href="#faq-cat-2-sub-2"> FAQ Item Category #2 <span
													class="pull-right"><i
														class="glyphicon glyphicon-plus"></i></span>
												</a>
											</h5>
										</div>
										<div id="faq-cat-2-sub-2" class="panel-collapse collapse">
											<div class="panel-body">Anim pariatur cliche
												reprehenderit, enim eiusmod high life accusamus terry
												richardson ad squid. 3 wolf moon officia aute, non cupidatat
												skateboard dolor brunch. Food truck quinoa nesciunt laborum
												eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
												on it squid single-origin coffee nulla assumenda shoreditch
												et. Nihil anim keffiyeh helvetica, craft beer labore wes
												anderson cred nesciunt sapiente ea proident. Ad vegan
												excepteur butcher vice lomo. Leggings occaecat craft beer
												farm-to-table, raw denim aesthetic synth nesciunt you
												probably haven't heard of them accusamus labore sustainable
												VHS.</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->


		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>


</body>

</html>