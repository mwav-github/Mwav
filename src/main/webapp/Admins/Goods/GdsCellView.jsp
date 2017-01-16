<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />

<script src="/CommonApps/Calendar/DateSelector/DatePicker.js"></script>
<!-- /////////// -->



<script type="text/javascript">
	//open GdsUpLoader window
	//참고로 수정 및 입력해서 if 분기시 분기 페이지 쪽에 스크립트 삽입이기 때문에 예를들어 수정에는 스크립트 들어가있고 // 입력에는 없으면
	// 입력에서는 호출이 안된다 그래서 head에 올림.
	function showImageWindow(position) {
		//var myBookId = $(this).data('id');
		
		var modalUploadImages = position;
		$("#modalUploadImages").modal("show");
		$("#images_position").val(modalUploadImages);
		
		//기존 정보 초기화 
		$('#filebody').empty();
	}
</script>
<style type="text/css">
.hide-bullets {
	list-style: none;
	margin-left: -40px;
	margin-top: 20px;
}
</style>

<script>
															jQuery(document)
																	.ready(
																			function(
																					$) {

																				$(
																						'#myCarousel')
																						.carousel(
																								{
																									interval : false
																								});

																				$(
																						'#carousel-text')
																						.html(
																								$(
																										'#slide-content-0')
																										.html());

																				//Handles the carousel thumbnails
																				$(
																						'[id^=carousel-selector-]')
																						.click(
																								function() {
																									var id = this.id
																											.substr(this.id
																													.lastIndexOf("-") + 1);
																									var id = parseInt(id);
																									$(
																											'#myCarousel')
																											.carousel(
																													id);
																								});

																				// When the carousel slides, auto update the text
																				$(
																						'#myCarousel')
																						.on(
																								'slid.bs.carousel',
																								function(
																										e) {
																									var id = $(
																											'.item.active')
																											.data(
																													'slide-number');
																									$(
																											'#carousel-text')
																											.html(
																													$(
																															'#slide-content-'
																																	+ id)
																															.html());
																								});
																			});
														</script>
<%--http://bootsnipp.com/snippets/featured/carousel-extended-320-compatible --%>

</head>

<body>
	<%--mwav는 container 영역만 쓰기때문에 그랬으나 이건 전체 쓴다. 그러므로 container로 감싸면 안된다.  --%>
	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->



	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> Goods</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Goods</li>
					<li class="active">GdsCellView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%-- 
			- param으로 같은 이름 지정시 위의 named으로 인식
			- getparameter는 param.mm // setattribute는 mm
			- value에 두개다 넣는 경우 비즈니스로직 + 파라미터인경우 문제발생
			- jsp param 안에 choose, when, otherwise 사용 불가
			 --%>
				<c:choose>
					<c:when test="${param.mm eq null}">
						<c:set value="${mm}" var="mm" />
					</c:when>
					<c:otherwise>
						<c:set value="${param.mm}" var="mm" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="/admins/LeftMenu.mwav" flush="false">
					<jsp:param name="mm" value="${mm}" />
				</jsp:include>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">GdsCellForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<%-- 1. 회원정보 입력 --%>
						<form class='form-horizontal' method="post"
							action="/admins/goods/gdsDelete.mwav"
							onsubmit="return myconfirm('delete')">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Mwav - Goods View</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-sm-12 col-md-4 col-lg-4 " align="center">


												<!-- Slider -->
												<div class="row">
													<div class="col-xs-12" id="slider">
														<!-- Top part of the slider -->
														<div class="row">
															<div class="col-sm-12" id="carousel-bounding-box">
																<div class="carousel slide" id="myCarousel">
																	<!-- Carousel items -->

																	<div class="carousel-inner">


																		<c:choose>
																			<c:when test="${fn:length(selectListGdsList) > 0}">
																				<!-- http://fruitdev.tistory.com/132 -->
																				<%--http://marobiana.tistory.com/9 --%>
																				<c:forEach var="VgoodsFileList"
																					items="${selectListGdsList}" varStatus="status">
																					<%--http://bootsnipp.com/snippets/featured/bootstrap-lightbox --%>

																					<div
																						${status.first ? 'class="active item"' : 'class="item"'}
																						data-slide-number="${status.index}">
																						<a href="#" class="thumbnail" data-toggle="modal"
																							data-target="#lightbox"> <img
																							src="/xUpload/GdsData/GC${selectOneGdsView.goods_id}/${VgoodsFileList.fileName}">
																						</a>
																					</div>

																				</c:forEach>
																			</c:when>

																			<c:otherwise>
																				<div class="active item" data-slide-number="0">
																					<a href="#" class="thumbnail" data-toggle="modal"
																						data-target="#lightbox"> <img
																						src="http://placehold.it/770x300&text=one">
																					</a>
																				</div>
																			</c:otherwise>
																		</c:choose>
																	</div>
																	<%-- 
																			<!-- Carousel nav -->
																			<a class="left carousel-control" href="#myCarousel"
																				role="button" data-slide="prev"> <span
																				class="glyphicon glyphicon-chevron-left"></span>
																			</a> <a class="right carousel-control" href="#myCarousel"
																				role="button" data-slide="next"> <span
																				class="glyphicon glyphicon-chevron-right"></span>
																			</a> --%>
																</div>
															</div>


														</div>
													</div>
												</div>
												<!--/Slider-->

												<div class="row hidden-xs" id="slider-thumbs">
													<!-- Bottom switcher of slider -->
													<c:choose>
														<c:when test="${fn:length(selectListGdsList) > 0}">
															<!-- http://fruitdev.tistory.com/132 -->
															<%--http://marobiana.tistory.com/9 --%>
															<c:forEach var="VgoodsFileList"
																items="${selectListGdsList}" varStatus="status">

																<ul class="hide-bullets">
																	<li class="col-sm-6"><a class="thumbnail"
																		<%--start.count는 1부터 시작 // index는 0부터 시작 --%>
																				id="carousel-selector-${status.index}"><img
																			src="/xUpload/GdsData/GC${selectOneGdsView.goods_id}/${VgoodsFileList.fileName}"></a></li>
																</ul>
															</c:forEach>
														</c:when>

														<c:otherwise>
															<!-- <li class="col-sm-6"><a class="thumbnail"
																		id="carousel-selector-0"><img
																			src="http://placehold.it/170x100&text=one"></a></li> -->
														</c:otherwise>
													</c:choose>
												</div>



												<jsp:include page="/Admins/Goods/LargeImageView.jsp"
													flush="false"></jsp:include></div>


											<div class="col-sm-12 col-md-8 col-lg-8 ">
												<table class="table table-user-information">
													<tbody>
														<input type="hidden" name="goods_id"
															value="${selectOneGdsView.goods_id }" />
														<tr>

															<td class="info">상품코드:</td>
															<td>${selectOneGdsView.goods_id }</td>
														</tr>

														<%-- 테이블은 td 크기가 전체 영향 즉! 최상단 모델번호쪽에 col-md 먹으면 그 열은 전체가 다 쭉 아래로 똑같이 먹는다.
																     유의 행 안에 또 잘게 쪼개야 한다.
																     
																     즉 tr td 자체에는 col-~ 사용하지 않기.
																 --%>
														<tr>
															<td class="info">모델번호:</td>
															<td>${selectOneGdsView.gModelNbr}</td>
														</tr>

														<tr>
															<td class="info">상품명:</td>
															<td>${selectOneGdsView.gName}</td>
														</tr>

														<tr>
															<td class="info">셋트상품여부:</td>
															<td>${selectOneGdsView.isGoodsSet}</td>
														</tr>


														<%-- 한 행에 따른 대는 td 두개인데 여기만 4개 이렇게 할 수가 없다 그러면 틀어지기 때문에 아래와 같이 임시방편으로.. --%>
														<tr>
															<td class="info">일반판매가:</td>
															<td><div class='form-group'>
																	<div class="col-md-4">${selectOneGdsView.gConsumerPrice}
																	</div>

																	<div class="col-md-3">

																		<p>회원판매가:</p>
																	</div>



																	<div class="col-md-4">
																		${selectOneGdsView.gMemberPrice}</div>
																</div></td>
														</tr>



														<tr>
															<td class="info">제조(개발)사:</td>
															<td>${selectOneGdsView.gManufacturer}</td>
														</tr>

														<tr>
															<td class="info">원산지:</td>
															<td>${selectOneGdsView.gPlaceofOrigin}</td>
														</tr>

														<tr>
															<td class="info">배송비 지불 주체:</td>
															<td>${selectOneGdsView.gWhoDeliveryCost}</td>
														</tr>

														<tr>
															<td class="info">배송비:</td>
															<td><div class='form-group'>
																	<div class="col-md-4">

																		${selectOneGdsView.gDeliveryCost}</div>
																	<div class="col-md-3">

																		<p>상품상태:</p>
																	</div>
																	<div class="col-md-4">

																		${selectOneGdsView.gStatus}</div>
																</div></td>

														</tr>


														<tr>
															<td class="info">적립금:</td>
															<td><div class='form-group'>
																	<div class="col-md-4">
																		${selectOneGdsView.gRsvFund}</div>


																	<div class="col-md-3">

																		<p>포인트:</p>
																	</div>
																	<div class="col-md-4">${selectOneGdsView.gPoint}
																	</div>
																</div></td>

														</tr>

														<tr>
															<td class="info">키워드:</td>
															<td>${selectOneGdsView.gKeywords}</td>
														</tr>

														<tr>
															<td class="info">성과급률:</td>
															<td>${selectOneGdsView.gFruitRate}</td>
														</tr>


														<tr>
															<td class="info">정렬순서:</td>
															<td>${selectOneGdsView.gOrder}</td>
														</tr>


														<tr>
															<td class="info">게시기간:</td>
															<td><div class='form-group'>
																	<div class="col-md-3">
																		<p>시작일 :</p>
																	</div>
																	<div class="col-md-3">
																		${selectOneGdsView.gPostStart}</div>
																	<div class="col-md-3">
																		<p>종료일 :</p>
																	</div>
																	<div class="col-md-3">
																		${selectOneGdsView.gPostEnd}</div>
																</div></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-md-12 ">
												<div class='col-md-12 form-group center-block'>
													${selectOneGdsView.gNote}</div>

											</div>
										</div>
										<div class="panel-footer">

											<button type="button" class="btn btn-sm btn-primary"
												onclick="javascript:window.location.href='/admins/goods/gdsList.mwav'">
												리스트</button>

											<button type="button" class="btn btn-sm btn-primary"
												onClick="javascript:history.go(-1)">뒤로가기</button>

											<button type="submit" class="btn btn-sm btn-danger">삭제하기
											</button>

										</div>

									</div>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

