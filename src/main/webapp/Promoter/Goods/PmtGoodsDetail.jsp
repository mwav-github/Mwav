<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<!-- ========================= Head & Meta Area ========================= -->
<head>
<jsp:include
	page="/Promoter/PartsOfContent/SiteHeader/PmtSiteMetaHeader.jsp"
	flush="false" />
<script type="text/javascript">
	/// some script

	// jquery ready start
	$(document).ready(function() {
		// jQuery code

	});
	// jquery end
</script>
</head>
<!-- ========================= Head & Meta Area END ========================= -->

<body>
	<!-- ========================= Header ========================= -->
	<header class="section-header">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteHeader/PmtSiteHeader.jsp"
			flush="false" />
	</header>
	<!-- section-header.// -->
	<!-- ========================= Header END ========================= -->


	<!-- ========================= SECTION CONTENT ========================= -->
	<section class="section-conten padding-y" style="min-height: 84vh">
		<div class="container">
			<div class="card">
				<div class="row no-gutters">
					<aside class="col-md-6">
						<article class="gallery-wrap">
							<div class="img-big-wrap">
								<div>
									<a href="#"><img
										src="https://www.inshopkorea.com/productFiles/0c5fb670c198bb4900ec4e01e08864fc.jpg"></a>
								</div>
							</div>
							<!-- slider-product.// -->
							<div class="thumbs-wrap">
								<a href="" class="item-thumb"> <img
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEavTIIwnqU4DzhmWLU76A7Mu2ZaLpVtKvQBdCQnblIdI8k7ZGht9vSuWybfnUYlNEVCMCHiM&usqp=CAc"></a> <a
									href="" class="item-thumb"> <img
									src="data:image/jpeg;base64,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"></a> <a
									href="" class="item-thumb"> <img
									src="data:image/jpeg;base64,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"></a>
							</div>
							<!-- slider-nav.// -->
						</article>
						<!-- gallery-wrap .end// -->
					</aside>
					<main class="col-md-6 border-left">
					<article class="content-body">

						<h2 class="title">무항생제 백억 한돈세트(돼지고기 1.2kg+ 특갈비탕 1.2 kg)</h2>
						<p>무항생제 백억 한돈세트(돼지고기 1.2kg+ 특갈비탕 1.2 kg)</p>


						<div class="rating-wrap my-3">
							<ul class="rating-stars">
								<li style="width: 80%" class="stars-active"><i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i></li>
								<li><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i></li>
							</ul>
							<small class="label-rating text-muted">132 reviews</small> <small
								class="label-rating text-success"> <i
								class="fa fa-clipboard-check"></i> 154 orders
							</small>
						</div>
						<!-- rating-wrap.// -->

						<!-- price-detail-wrap .// -->
						<hr>
						<dl class="row mt-2">
							<dt class="col-sm-3">정가</dt>
							<dd class="col-sm-9">
								<var class="price h4">
									<del> 1,000,000 원</del>
								</var>
							</dd>
							<dt class="col-sm-3">회원특가</dt>
							<dd class="col-sm-9">
								<var class="price h4">500,000 원</var>
								&nbsp;<span class="badge badge-secondary">자사몰 판매가 </span>
							</dd>
						</dl>
						<hr>
						<dl class="row mt-2">
							<dt class="col-sm-3">옵션</dt>
							<dd class="col-sm-9">
								<select class="form-control">
									<option>1</option>
									<option>2</option>
									<option>3</option>
								</select>
							</dd>
						</dl>


						<div class="form-row">
							<!-- col.// -->
							<div class="col">
								<a href="/Promoter/Goods/PmtGoodsPosting.mwav"
									class="btn btn-primary w-100"> <span class="text">제품
										포스팅 하기</span>
								</a>
							</div>
							<div class="col">
								<a href="#" class="btn  btn-light"> <i class="fas fa-heart"></i>
								</a>
							</div>
						</div>
						<!-- col.// -->
					</article>
					<!-- product-info-aside .// --> </main>
					<!-- col.// -->
				</div>
				<!-- row.// -->
			</div>
		</div>

		<div class="container">

			<article class="card">
				<div class="card-body">
					<div class="row">
						<aside class="col-md-6">
							<h5 class="mb-5">
								<strong>주요사항</strong>
							</h5>
							<dl class="row">
								<dt class="col-sm-3">포스팅 혜택</dt>
								<dd class="col-sm-9">--------------</dd>

								<dt class="col-sm-3">선물포장</dt>
								<dd class="col-sm-9">선물포장가방을 원하실 경우 추가 옵션사항에서 선택 가능</dd>

								<dt class="col-sm-3">배송</dt>
								<dd class="col-sm-9">오전11:00 이전 주문 당일발송 이후 주문건 익일발송</dd>
							</dl>
						</aside>
						<aside class="col-md-6">
							<h5 class="mb-5">
								<strong>특 징</strong>
							</h5>
							<ul class="list-check">
								<li>무항생제 한돈 생삼겹 600g + 무항생제 한돈 목살 600g + 백억 특갈비탕 1.2kg</li>
								<li>무항생제 축산물 정식 인증받은 한돈 돼지고기 세트</li>
							</ul>
						</aside>
					</div>
					<!-- row.// -->
					<hr>
					<h5 class="mb-5">
						<strong>상품 설명</strong>
					</h5>
					<div class="text-center">
						<div>
							<a href="#"><img
								class="img-fluid" src="https://www.inshopkorea.com/productFiles/202009111738541249654822.jpg"></a>
						</div>
					</div>
				</div>
				<!-- card-body.// -->
			</article>
		</div>
	</section>
	<!-- ========================= SECTION CONTENT END// ========================= -->


	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->



</body>
</html>