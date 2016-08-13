<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
http://bootsnipp.com/snippets/featured/responsive-shopping-cart 
반응형 체크 필요.

http://bootsnipp.com/snippets/featured/carousel-product-cart-slider
>cart 슬라이더 형태로 

16.07.09 Admins/Order에는 있었으나 여기에는 동일 파일명으로 신규생성
wish 는 https://www.wish.com/#cid=563db50683b75d5a54fedcfc 와 같이 id 값은 변경 	
 --%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
</head>
<body>
	<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
	<!--  //////////////////////////////////// -->
	<jsp:include
		page="/PartsOfContent/SiteHeader/FrontHeader_Shop_Left.jsp"
		flush="false" />

	<!-- Page Content -->
	<div class="container">

		<div class="enter"></div>
		<!-- /.row -->
		<!-- Page Features -->
		<div class="row col-md-12">

			<!-- Modal -->
			<div class="orderCart" id="orderCart">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-12 col-md-10 col-md-offset-1">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Product</th>
										<th>Quantity</th>
										<th class="text-center">Price</th>
										<th class="text-center">Total</th>
										<th></th>




									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="col-sm-8 col-md-6">
											<div class="media">
												<a class="thumbnail pull-left" href="#"> <img
													class="media-object"
													src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
													style="width: 72px; height: 72px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">
														<a href="#">Product name</a>
													</h4>
													<h5 class="media-heading">
														by <a href="#">Brand name</a>
													</h5>
													<span>Status: </span><span class="text-success"><strong>In
															Stock</strong></span>
												</div>
											</div>
										</td>
										<td class="col-sm-1 col-md-1" style="text-align: center">
											<input type="email" class="form-control"
											id="exampleInputEmail1" value="3">
										</td>
										<td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
										<td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
										<td class="col-sm-1 col-md-1">
											<button type="button" class="btn btn-danger">
												<span class="glyphicon glyphicon-remove"></span> Remove
											</button>
										</td>
									</tr>
									<tr>
										<td class="col-md-6">
											<div class="media">
												<a class="thumbnail pull-left" href="#"> <img
													class="media-object"
													src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
													style="width: 72px; height: 72px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">
														<a href="#">Product name</a>
													</h4>
													<h5 class="media-heading">
														by <a href="#">Brand name</a>
													</h5>
													<span>Status: </span><span class="text-warning"><strong>Leaves
															warehouse in 2 - 3 weeks</strong></span>
												</div>
											</div>
										</td>
										<td class="col-md-1" style="text-align: center"><input
											type="email" class="form-control" id="exampleInputEmail1"
											value="2"></td>
										<td class="col-md-1 text-center"><strong>$4.99</strong></td>
										<td class="col-md-1 text-center"><strong>$9.98</strong></td>
										<td class="col-md-1">
											<button type="button" class="btn btn-danger">
												<span class="glyphicon glyphicon-remove"></span> Remove
											</button>
										</td>
									</tr>
									<tr>
										<td> </td>
										<td> </td>
										<td> </td>
										<td><h5>Subtotal</h5></td>
										<td class="text-right"><h5>
												<strong>$24.59</strong>
											</h5></td>
									</tr>
									<tr>
										<td> </td>
										<td> </td>
										<td> </td>
										<td><h5>Estimated shipping</h5></td>
										<td class="text-right"><h5>
												<strong>$6.94</strong>
											</h5></td>
									</tr>
									<tr>
										<td> </td>
										<td> </td>
										<td> </td>
										<td><h3>Total</h3></td>
										<td class="text-right"><h3>
												<strong>$31.53</strong>
											</h3></td>
									</tr>
									<tr>
										<td> </td>
										<td> </td>
										<td> </td>
										<td>
											<button type="button" class="btn btn-default">
												<span class="glyphicon glyphicon-shopping-cart"></span>
												Continue Shopping
											</button>
										</td>
										<td>
											<button type="button" class="btn btn-success">
												Checkout <span class="glyphicon glyphicon-play"></span>
											</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<div class="enter"></div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter_Shop.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>
</html>
