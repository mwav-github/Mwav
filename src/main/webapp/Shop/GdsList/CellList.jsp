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
							<div class="col-md-4">
								<div class="product-item">
									<div class="pi-img-wrapper">
										<img src="http://keenthemes.com/assets/bootsnipp/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
										
										<%-- <img
											src="/xUpload/GdsData/GC${VselectListGdsList.goods_id }/s_S1_Basic.png"
											class="img-responsive" alt="Berry Lace Dress"> --%>
										<div>
											<a href="#" class="btn">Zoom</a> <a href="#" class="btn">View</a>
										</div>
									</div>
									<h3>
										<a href="shop-item.html">${VselectListGdsList.gName}</a>
									</h3>
									<div class="pi-price">$${VselectListGdsList.gConsumerPrice}</div>
									<button type="button" class="btn add2cart"
													onclick="javascript:window.location.href='/shop/goods/gdsView.mwav?goods_id=${VselectListGdsList.goods_id}'">Add
										to cart</button>
									
									<div class="sticker sticker-new"></div>
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
