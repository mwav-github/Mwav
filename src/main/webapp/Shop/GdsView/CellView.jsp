<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<script>

function cartSubmit(ocAmount) {
	var ocAmount = ocAmount;
	
	if(ocAmount < "1"){
		alert('1인당 최소구매수량은 1개입니다.');
		$("#cart_menu").hide();
		return false;
	}
	else{
	
    var formdata = $("#gdsView").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
    jQuery.ajax({
        url: '/shop/order/orderForm.mwav',
        type: 'POST',
        data: formdata,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        success: function (result) {
        	//alert(result);
        	//alert(result.orderCart_id);
        	//alert(result.goods_id);
        	//alert(result.flag);
            if (result.flag != 2){
            	  //document.gdsView.elements['txt4'].aria-expanded="false"
            	//document.getElementById("cartbutton").setAttribute("data-toggle", "dropdown");
            	//document.getElementById("cartbutton").setAttribute("aria-expanded", "true");
            	//document.getElementById("dropup").addClass('open');
            	if (result.flag == 1){
            		//신규등록
            		
            		
            		//document.getElementById("cart_onclick").setAttribute("onClick","javascript:window.location.href='/shop/order/orderList.mwav?orderCart_id="+result.orderCart_id+"';");
            		$('#cart_onclick').attr("onClick","javascript:window.location.href='/shop/order/orderList.mwav?orderCart_id="+result.orderCart_id+"';")
            	}
            	//$('#cart_onclick').attr("onClick","sdfsdf");
            	$("#cart_menu").show();
            	
            }
            else{
            	alert('장바구니 담기에 실패하였습니다.');
            	
            	return false;
            }
        }
    });
	}
}
</script>



<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />

<%-- 
1. 템플릿 : 참고하여 꼭 변경 http://wrapbootstrap.com/preview/WB0025522
                       http://startbootstrap.com/
                       https://wrapbootstrap.com/
                       
  http://bootsnipp.com/snippets/MRZjX - 특징
  
  http://bootsnipp.com/snippets/featured/product-page-for-online-shop
  
  
  http://bootsnipp.com/snippets/featured/shopping-order-status
  -> order 순서           
                       
--%>


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
	<!-- Page Content -->
	<div class="container">



		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> GdsView</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Goods</li>
					<li class="active">GdsView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->

			<%--제품상세 http://bootsnipp.com/snippets/featured/product-page-for-online-shop --%>
			<div class="col-md-12">

				<form class="form-horizontal" name="gdsView" id="gdsView"
					method="post">
					<div class="container-fluid">
						<div class="content-wrapper">
							<div class="item-container">
								<div class="container">
									<div class="col-md-6">
										<div class="product col-md-7 service-image-left">


											<img id="item-display"
												src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png"
												alt=""></img>

										</div>

										<div class="container service1-items col-md-5 pull-right">

											<a id="item-1" class="service1-item"> <img
												src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png"
												alt=""></img>
											</a> <a id="item-2" class="service1-item"> <img
												src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png"
												alt=""></img>
											</a> <a id="item-3" class="service1-item"> <img
												src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png"
												alt=""></img>
											</a>

										</div>
									</div>

									<div class="col-md-6">
										<div class="product-title">Corsair GS600 600 Watt PSU</div>
										<div class="product-desc">The Corsair Gaming Series
											GS600 is the ideal price/performance choice for mid-spec
											gaming PC</div>
										<div class="product-rating">
											<i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i>
											<i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i>
											<i class="fa fa-star-o"></i>
										</div>
										<!-- <hr>
									<div class="product-price">$ 1234.00</div>
									<div class="product-stock">In Stock</div>
									<hr>
									<div class="btn-group cart">
										<button type="button" class="btn btn-success">Add to
											cart</button>
									</div>
									<div class="btn-group wishlist">
										<button type="button" class="btn btn-danger">Add to
											wishlist</button>
									</div> -->

										<div class="enter"></div>


										<input type="hidden" name="goods_id"
											value="${selectOneGdsView.goods_id }" />
											<input type="hidden" name="ocChoiceDt"
											value="${selectOneGdsView.ocChoiceDt }" />

										<%--추가예정 카테고리 --%>
										<input type="hidden" name="gcr_id" value="123" /> <input
											type="hidden" name="type" value="frontCart" />
										<table class="table table-hover">
											<tbody>
												<tr>

													<td><h5>Manufacture</h5></td>
													<td class="text-right"><h5>
															<strong>${selectOneGdsView.gManufacturer }</strong>
														</h5></td>
												</tr>

												<tr>

													<td><h5>PlaceofOrigin</h5></td>
													<td class="text-right"><h5>
															<strong>${selectOneGdsView.gPlaceofOrigin }</strong>
														</h5></td>
												</tr>


												<tr>

													<td><h5>Price</h5></td>
													<td class="text-right"><h5>
															<strong>${selectOneGdsView.gMemberPrice } (회원가)</strong><br>
															<strong>${selectOneGdsView.gConsumerPrice }
																(소비자가)</strong>
														</h5></td>
												</tr>

												<tr>
													<td><h5>ModelNumber</h5></td>
													<td class="text-right"><h5>
															<strong>${selectOneGdsView.gModelNbr }</strong>
														</h5></td>
												</tr>

												<tr>

													<td><h5>Estimated shipping</h5></td>
													<td class="text-right"><h5>
															<select name="state" class="ddList">
																<option value="">(please select a state)</option>
																<option class="lt" value="--">none</option>
																<option class="lt" value="AL">Alabama</option>
																<option class="lt" value="AK">Alaska</option>

															</select>
														</h5></td>
												</tr>
												<tr>

													<td><h3>Total</h3></td>

													<c:if test="${sessionScope.member_LoginId ne null }">
														<c:set var="price"
															value="${selectOneGdsView.gMemberPrice }" />
													</c:if>
													<c:if test="${sessionScope.member_LoginId eq null }">
														<c:set var="price"
															value="${selectOneGdsView.gConsumerPrice}" />
													</c:if>
													<td class="text-right"><input type="text"
														id="ocAmount" name="ocAmount" value="0" />

														<button type="button"
															class="btn btn-default btn-md qtyplus" field='ocAmount'
															onClick="qtyplus(${price});">
															<span class="glyphicon glyphicon glyphicon-plus
"
																aria-hidden="true"></span>
														</button>

														<button type="button"
															class="btn btn-default btn-md qtyminus" field='ocAmount'
															onClick="qtyminus(${price});">
															<span class="glyphicon glyphicon glyphicon-minus"
																aria-hidden="true"></span>
														</button>

														<h3>
															<strong class="totalprice" id="totalprice"></strong>
														</h3></td>
												</tr>



												<tr>
													<td>
														<div class="dropup" id="dropup">
															<button type="button" id="cartbutton"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown"
																onclick="cartSubmit(this.form.ocAmount.value);">
																<span class="glyphicon glyphicon-shopping-cart"></span>
																Add to Cart
															</button>
															<ul class="dropdown-menu" id="cart_menu">
																<%--href="#" 넣으면 클릭시 최상단으로 이동한다. --%>
																<li><a onclick="target_hide('cart_menu');">쇼핑계속하기</a></li>
																
																<%-- 최초 세션아이디 없이 접근하는 경우  /shop/order/orderList.mwav?orderCart_id=
																     와 같이 비어서 노출된다. 이부분 어떻게 할지 생각 하기  --%>
																<li><a id="cart_onclick"
																	onClick="javascript:window.location.href='/shop/order/orderList.mwav?orderCart_id=${sessionScope.orderCart_id}'">카트보기</a></li>
															</ul>
														</div>
													</td>
													<td>
														<button type="button" class="btn btn-success">
															Continue Shopping <span class="glyphicon glyphicon-play"></span>
														</button>
													</td>

												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="container-fluid">
								<div class="col-md-12 product-info">
									<ul id="myTab" class="nav nav-tabs nav_tabs">

										<li class="active"><a href="#service-one"
											data-toggle="tab">DESCRIPTION</a></li>
										<li><a href="#service-two" data-toggle="tab">PRODUCT
												INFO</a></li>
										<li><a href="#service-three" data-toggle="tab">REVIEWS</a></li>

									</ul>
									<div id="myTabContent" class="tab-content">
										<div class="tab-pane fade in active" id="service-one">

											<section class="container product-info">
												The Corsair Gaming Series GS600 power supply is the ideal
												price-performance solution for building or upgrading a
												Gaming PC. A single +12V rail provides up to 48A of
												reliable, continuous power for multi-core gaming PCs with
												multiple graphics cards. The ultra-quiet, dual ball-bearing
												fan automatically adjusts its speed according to
												temperature, so it will never intrude on your music and
												games. Blue LEDs bathe the transparent fan blades in a cool
												glow. Not feeling blue? You can turn off the lighting with
												the press of a button.

												<h3>Corsair Gaming Series GS600 Features:</h3>

											</section>

										</div>
										<div class="tab-pane fade" id="service-two">

											<section class="container"></section>

										</div>
										<div class="tab-pane fade" id="service-three">

											<%--댓글보기 --%>
											<div class="well">

												<div class="text-right">
													<a class="btn btn-success">Leave a Review</a>
												</div>

												<hr>

												<div class="row">
													<div class="col-md-12">
														<span class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star-empty"></span> Anonymous
														<span class="pull-right">10 days ago</span>
														<p>This product was great in terms of quality. I would
															definitely buy another!</p>
													</div>
												</div>

												<hr>

												<div class="row">
													<div class="col-md-12">
														<span class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star-empty"></span> Anonymous
														<span class="pull-right">12 days ago</span>
														<p>I've alredy ordered another one!</p>
													</div>
												</div>

												<hr>

												<div class="row">
													<div class="col-md-12">
														<span class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star"></span> <span
															class="glyphicon glyphicon-star-empty"></span> Anonymous
														<span class="pull-right">15 days ago</span>
														<p>I've seen some better than this, but not at this
															price. I definitely recommend this item.</p>
													</div>
												</div>

											</div>
										</div>
									</div>
									<hr>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- /.container -->

	<div class="enter"></div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter_Shop.mwav"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>




	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>
</body>

</html>