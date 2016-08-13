<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$('document').ready(function() {
		updatestatus();
		scrollalert();
	});
	function updatestatus() {
		//Show number of loaded items  
		var totalItems = $('#gdsList').length;
		$('#status').text('Loaded ' + totalItems + ' Items');
	}
	function scrollalert() {
		var scrolltop = $('#gdsList').attr('scrollTop');
		var scrollheight = $('#gdsList').attr('scrollHeight');
		var windowheight = $('#gdsList').attr('clientHeight');
		var scrolloffset = 20;
		if (scrolltop >= (scrollheight - (windowheight + scrolloffset))) {
			//fetch new items  
			$('#status').text('Loading more items...');
			$.get('CellList.jsp', '', function(newitems) {
				$('#gdsList').append(newitems);
				updatestatus();
			});
		}
		setTimeout('scrollalert();', 1500);
	}

	/* 
	 $(document).ready(function() {
	 var win = $(window);

	 // Each time the user scrolls
	 win.scroll(function() {
	 // End of the document reached?

	 // console.log($('#gdsList').height());
	 // console.log(win.height());
	 console.log(win.scrollTop());
	
	 if ($('#gdsList').height() - win.height() == win.scrollTop()) {
	 $('#loading').show();
	
	 console.log("변화");
	 //$(document).height() 로하면 전체 이기때문에 상품리스트만 
	 console.log($(document).height());
	 console.log(win.height());
	 console.log(win.scrollTop());

	 $.ajax({
	 url: 'get-post.php',
	 dataType: 'html',
	 success: function(html) {
	 $('#posts').append(html);
	 $('#loading').hide();
	 }
	 });
	 }
	 });
	 }); */
</script>


<%-- 모달 > 페이지이동으로 바뀌면서 include 삭제 
<jsp:include page="/Shop/OrderProcess/OrderForm.jsp" flush="false" 

http://bootsnipp.com/snippets/50pP7 요롷게 변경

http://bootsnipp.com/snippets/GXemy

http://bootsnipp.com/snippets/3x4PV

/>
 --%>
<div class="container">
	<div class="row">
		<form class="form-horizontal" name="orderCart" method="post">
			<div class="col-md-12" id="gdsList">
				<c:choose>
					<c:when test="${fn:length(selectListGdsList) > 0}">
						<c:forEach var="VselectListGdsList" items="${selectListGdsList}">
							<input type="hidden" id="goods_id" name="goods_id"
								value="${VselectListGdsList.goods_id }">
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail">
									<h4 class="text-center">
										<span class="label label-info">${VselectListGdsList.gManufacturer}</span>
									</h4>
									<img
										src="/xUpload/GdsData/GC${VselectListGdsList.goods_id }/s_S1_Basic.png"
										class="img-responsive">
									<div class="caption">
										<div class="row">
											<div class="col-md-6 col-xs-6">
												<h3>${VselectListGdsList.gName}</h3>
											</div>
											<div class="col-md-6 col-xs-6 price">
												<h3>
													<label>${VselectListGdsList.gConsumerPrice}</label>
												</h3>
											</div>
										</div>
										<p>${VselectListGdsList.gDescription}</p>
										<div class="row">
											<div class="col-md-6">

												<button type="button" class="btn btn-primary"
													onclick="javascript:window.location.href='/shop/goods/gdsView.do?goods_id=${VselectListGdsList.goods_id}'">More
													Info</button>
											</div>

											<div class="col-md-6">
												<%--모달에 클래스 지정할때 아래 span에 다 하지않고 button에 직접하기 그래야 잘먹는다. --%>
												<button type="button" class="btn btn-success btn-product"
													onclick="orderCartPut(document.orderCart.goods_id.value, 'frontCart');">
													<span class="glyphicon glyphicon-shopping-cart"></span> Buy
												</button>
											</div>
										</div>

										<p></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-sm-6 col-md-3">상품이 없습니다.</div>
					</c:otherwise>
				</c:choose>


			</div>
		</form>
	</div>
</div>

<%-- 
<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<h4 class="text-center">
									<span class="label label-info">Apple</span>
								</h4>
								<img src="http://placehold.it/650x450&text=iPhone 6"
									class="img-responsive">
								<div class="caption">
									<div class="row">
										<div class="col-md-6 col-xs-6">
											<h3>Galaxy S5</h3>
										</div>
										<div class="col-md-6 col-xs-6 price">
											<h3>
												<label>$749.99</label>
											</h3>
										</div>
									</div>
									<p>32GB, 64Bit, 1080HD, 4.7 inches, iOS 8</p>
									<div class="row">
										<div class="col-md-6">
											<a href="/Shop/GdsView/CellView.jsp" class="btn btn-primary">More
												Info</a>
										</div>
										<div class="col-md-6">
											<button type="button" class="btn btn-success btn-product"
												data-toggle="modal" data-target=".orderCart">
												<span class="glyphicon glyphicon-shopping-cart"></span>
												Buy
											</button>
										</div>
									</div>

									<p></p>
								</div>
							</div>
						</div>--%>