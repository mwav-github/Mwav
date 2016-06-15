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
	jQuery(document).ready(function($) {

		$('#myCarousel').carousel({
			interval : false
		});

		$('#carousel-text').html($('#slide-content-0').html());

		//Handles the carousel thumbnails
		$('[id^=carousel-selector-]').click(function() {
			var id = this.id.substr(this.id.lastIndexOf("-") + 1);
			var id = parseInt(id);
			$('#myCarousel').carousel(id);
		});

		// When the carousel slides, auto update the text
		$('#myCarousel').on('slid.bs.carousel', function(e) {
			var id = $('.item.active').data('slide-number');
			$('#carousel-text').html($('#slide-content-' + id).html());
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
					<li class="active">GdsCellForm</li>
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
				<jsp:include page="/admins/LeftMenu.do" flush="false">
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

						<c:choose>
							<c:when test="${fn:length(updateGdsForm) > 0}">

								<%-- 1. 회원정보 수정 --%>

								<form class='form-horizontal' method="post"
									action="/admins/goods/gdsForm.do">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">Mwav - Goods Modify</h3>
											</div>
											<div class="panel-body">
												<div class="row">


													<div class="col-sm-12 col-md-4 col-lg-4 " align="center">
														<%--http://bootsnipp.com/snippets/featured/carousel-extended-320-compatible --%>
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
																					<c:when test="${fn:length(goodsFileList) > 0}">
																						<!-- http://fruitdev.tistory.com/132 -->
																						<%--http://marobiana.tistory.com/9 --%>
																						<c:forEach var="VgoodsFileList"
																							items="${goodsFileList}" varStatus="status">
																							<%--http://bootsnipp.com/snippets/featured/bootstrap-lightbox --%>
																							
																							<div ${status.first ? 'class="active item"' : 'class="item"'} data-slide-number="${status.index}">
																								<a href="#" class="thumbnail"
																									data-toggle="modal" data-target="#lightbox">
																									<img src="/xUpload/GdsData/GC${updateGdsForm.goods_id}/${VgoodsFileList}">
																								</a>
																							</div>

																						</c:forEach>
																					</c:when>

																					<c:otherwise>
																						<div class="item" data-slide-number="0">
																								<a href="#" class="thumbnail"
																									data-toggle="modal" data-target="#lightbox">
																									<img
																									src="http://placehold.it/770x300&text=four">
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
																<c:when test="${fn:length(goodsFileList) > 0}">
																	<!-- http://fruitdev.tistory.com/132 -->
																	<%--http://marobiana.tistory.com/9 --%>
																	<c:forEach var="VgoodsFileList"
																		items="${goodsFileList}" varStatus="status">

																		<ul class="hide-bullets">
																			<li class="col-sm-6"><a class="thumbnail"
																				<%--start.count는 1부터 시작 // index는 0부터 시작 --%>
																				id="carousel-selector-${status.index}"><img
																					src="/xUpload/GdsData/GC${updateGdsForm.goods_id}/${VgoodsFileList}"></a></li>
																		</ul>
																	</c:forEach>
																</c:when>

																<c:otherwise>
																	<li class="col-sm-6"><a class="thumbnail"
																		id="carousel-selector-0"><img
																			src="http://placehold.it/170x100&text=one"></a></li>
																</c:otherwise>
															</c:choose>
														</div>



														<jsp:include page="/Admins/Goods/LargeImageView.jsp"
															flush="false"></jsp:include></div>


													<div class="col-sm-12 col-md-8 col-lg-8 ">
														<table class="table table-user-information">
															<tbody>
																<tr>

																	<td>상품코드:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="goods_id"
																					type='text' maxlength="15"
																					value="${updateGdsForm.goods_id}"
																					readonly="readonly">
																			</div>
																		</div></td>
																</tr>

																<%-- 테이블은 td 크기가 전체 영향 즉! 최상단 모델번호쪽에 col-md 먹으면 그 열은 전체가 다 쭉 아래로 똑같이 먹는다.
																     유의 행 안에 또 잘게 쪼개야 한다.
																     
																     즉 tr td 자체에는 col-~ 사용하지 않기.
																 --%>
																<tr>
																	<td>모델번호:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gModelNbr"
																					value="${updateGdsForm.gModelNbr}" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>상품명:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gName"
																					value="${updateGdsForm.gName}" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>셋트상품여부:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<select class='form-control' name="isGoodsSet"
																					value="${updateGdsForm.isGoodsSet}" required>
																					<option value="1">예</option>
																					<option value="0">아니오</option>
																				</select>
																			</div>
																		</div></td>
																</tr>


																<%-- 한 행에 따른 대는 td 두개인데 여기만 4개 이렇게 할 수가 없다 그러면 틀어지기 때문에 아래와 같이 임시방편으로.. --%>
																<tr>
																	<td>일반판매가:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<input class='form-control' name="gConsumerPrice"
																					value="${updateGdsForm.gConsumerPrice}" required>
																			</div>


																			<div class="col-md-3">

																				<p>회원판매가:</p>
																			</div>



																			<div class="col-md-4">
																				<input class='form-control' name="gMemberPrice"
																					value="${updateGdsForm.gMemberPrice}" required>

																			</div>
																		</div></td>
																</tr>



																<tr>
																	<td>제조(개발)사:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gManufacturer"
																					value="${updateGdsForm.gManufacturer}" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>원산지:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gPlaceofOrigin"
																					value="${updateGdsForm.gPlaceofOrigin}" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>배송비 지불 주체:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<select class='form-control' name="gWhoDeliveryCost"
																					value="${updateGdsForm.gWhoDeliveryCost}" required>
																					<option value="C">고객</option>
																					<option value="P">파트너사, 제조사</option>
																					<option value="S">자사</option>
																				</select>

																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>배송비:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<select class='form-control' name="gDeliveryCost"
																					value="${updateGdsForm.gDeliveryCost}" required>
																					<option value="2500">2500</option>
																					<option value="0">0</option>
																				</select>
																				<p>※제주/도서산간의 경우 추가비용 발생</p>
																			</div>
																			<div class="col-md-3">

																				<p>상품상태:</p>
																			</div>
																			<div class="col-md-4">
																				<select class='form-control' name="gStatus"
																					value="${updateGdsForm.gStatus}" required>
																					<option value="1">판매가능</option>
																				</select>
																			</div>
																		</div></td>

																</tr>


																<tr>
																	<td>적립금:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<input class='form-control' name="gRsvFund"
																					value="${updateGdsForm.gRsvFund}">
																			</div>
																			<div class="col-md-3">

																				<p>포인트:</p>
																			</div>
																			<div class="col-md-4">
																				<input class='form-control' name="gPoint"
																					value="${updateGdsForm.gPoint}">
																			</div>
																		</div></td>

																</tr>

																<tr>
																	<td>키워드:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gKeywords"
																					value="${updateGdsForm.gKeywords}" required>

																			</div>
																		</div>
																		<p>※키워들르 통한 웹 프로모션 메타페이지 다중생성[WebSpawner]</p></td>
																</tr>

																<tr>
																	<td>성과급률:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gFruitRate"
																					value="${updateGdsForm.gFruitRate}" required>
																			</div>
																		</div>
																		<p>% 성과급률은 0~100 숫자 안에서 입력하세요.</p></td>
																</tr>


																<tr>
																	<td>정렬순서:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gOrder"
																					value="${updateGdsForm.gOrder}" required>
																			</div>
																		</div>
																		<p>정렬순서는 -9999~99999 숫자 안에서 사이 값을 입력하세요.</p></td>
																</tr>


																<tr>
																	<td>게시기간:</td>
																	<td><div class='form-group'>
																			<div class="col-md-3">
																				<p>시작일 :</p>
																			</div>
																			<div class="col-md-8">
																				<input type="text" name="gPostStart"
																					class="form-control" id="datepicker_kor_1_1"
																					value="${updateGdsForm.gPostStart}">
																			</div>
																			<div class="col-md-3">
																				<p>종료일 :</p>
																			</div>
																			<div class="col-md-8">
																				<input type="text" class="form-control"
																					name="gPostEnd" id="datepicker_kor_1_2"
																					value="${updateGdsForm.gPostEnd}">
																			</div>
																		</div></td>
																</tr>

																<tr class="active">
																	<td colspan="2"><p>이미지정보 (550 x 550픽셀 이상)</p></td>
																</tr>

																<tr>
																	<td class="active">대표(표준)</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload0"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Basic')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td class="active">전면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload1"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Front')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td class="active">후면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload2"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Rear')">이미지업로드</button>
																		</div>
																	</td>
																</tr>


																<tr>
																	<td class="active">우측면</td>
																	<td>

																		<div class='col-md-8'>
																			<button type="button" name="bnUpload3"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Right')">이미지업로드</button>
																		</div>
																	</td>
																</tr>


																<tr>
																	<td class="active">좌측면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload4"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Left')">이미지업로드</button>
																		</div>

																	</td>
																</tr>

																<tr>
																	<td class="active">상단면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload5"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Top')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td class="active">하단면</td>
																	<td>

																		<div class='col-md-8'>
																			<button type="button" name="bnUpload6"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Bottom')">이미지업로드</button>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="col-md-12 ">
														<div class='col-md-12 form-group center-block'>
															<textarea class="form-control" name="gNote" rows="15"
																value="${updateGdsForm.gNote}">특이사항....</textarea>
														</div>

													</div>
												</div>
												<div class="panel-footer">

													<button type="button" class="btn btn-sm btn-primary"
														onclick="javascript:window.location.href='/admins/goods/gdsList.do'">
														리스트</button>

													<button type="button" class="btn btn-sm btn-primary"
														onClick="javascript:history.go(-1)">뒤로가기</button>

													<button type="submit" class="btn btn-sm btn-primary">등록하기
													</button>

												</div>

											</div>
										</div>
									</div>
								</form>


							</c:when>

							<c:otherwise>
								<%-- 1. 회원정보 입력 --%>
								<form class='form-horizontal' method="post"
									action="/admins/goods/gdsForm.do">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">Mwav - Goods Registration</h3>
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

																				<%--http://bootsnipp.com/snippets/featured/bootstrap-lightbox --%>
																				<div class="active item" data-slide-number="0">
																					<a href="#" class="thumbnail" data-toggle="modal"
																						data-target="#lightbox"> <img
																						src="http://placehold.it/770x770&text=one">
																					</a>
																				</div>

																				<div class="item" data-slide-number="1">
																					<a href="#" class="thumbnail" data-toggle="modal"
																						data-target="#lightbox"> <img
																						src="http://placehold.it/770x770&text=two">
																					</a>
																				</div>

																				<div class="item" data-slide-number="2">
																					<a href="#" class="thumbnail" data-toggle="modal"
																						data-target="#lightbox"> <img
																						src="http://placehold.it/770x300&text=three">
																					</a>
																				</div>

																				<div class="item" data-slide-number="3">
																					<a href="#" class="thumbnail" data-toggle="modal"
																						data-target="#lightbox"> <img
																						src="http://placehold.it/770x300&text=four">
																					</a>
																				</div>

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
															<ul class="hide-bullets">
																<li class="col-sm-6"><a class="thumbnail"
																	id="carousel-selector-0"><img
																		src="http://placehold.it/170x100&text=one"></a></li>

																<li class="col-sm-6"><a class="thumbnail"
																	id="carousel-selector-1"><img
																		src="http://placehold.it/170x100&text=two"></a></li>

																<li class="col-sm-6"><a class="thumbnail"
																	id="carousel-selector-2"><img
																		src="http://placehold.it/170x100&text=three"></a></li>

																<li class="col-sm-6"><a class="thumbnail"
																	id="carousel-selector-3"><img
																		src="http://placehold.it/170x100&text=four"></a></li>

															</ul>
														</div>



														<jsp:include page="/Admins/Goods/LargeImageView.jsp"
															flush="false"></jsp:include></div>


													<div class="col-sm-12 col-md-8 col-lg-8 ">
														<table class="table table-user-information">
															<tbody>
																<tr>

																	<td>상품코드:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="goods_id"
																					type='text' maxlength="15" readonly="readonly">
																			</div>
																		</div></td>
																</tr>

																<%-- 테이블은 td 크기가 전체 영향 즉! 최상단 모델번호쪽에 col-md 먹으면 그 열은 전체가 다 쭉 아래로 똑같이 먹는다.
																     유의 행 안에 또 잘게 쪼개야 한다.
																     
																     즉 tr td 자체에는 col-~ 사용하지 않기.
																 --%>
																<tr>
																	<td>모델번호:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gModelNbr"
																					value="" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>상품명:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gName" value=""
																					required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>셋트상품여부:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<select class='form-control' name="isGoodsSet"
																					required>
																					<option value="1">예</option>
																					<option value="0">아니오</option>
																				</select>
																			</div>
																		</div></td>
																</tr>


																<%-- 한 행에 따른 대는 td 두개인데 여기만 4개 이렇게 할 수가 없다 그러면 틀어지기 때문에 아래와 같이 임시방편으로.. --%>
																<tr>
																	<td>일반판매가:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<input class='form-control' name="gConsumerPrice"
																					value="" required>
																			</div>


																			<div class="col-md-3">

																				<p>회원판매가:</p>
																			</div>



																			<div class="col-md-4">
																				<input class='form-control' name="gMemberPrice"
																					value="" required>

																			</div>
																		</div></td>
																</tr>



																<tr>
																	<td>제조(개발)사:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gManufacturer"
																					value="" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>원산지:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gPlaceofOrigin"
																					value="" required>
																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>배송비 지불 주체:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<select class='form-control' name="gWhoDeliveryCost"
																					required>
																					<option value="C">고객</option>
																					<option value="P">파트너사, 제조사</option>
																					<option value="S">자사</option>
																				</select>

																			</div>
																		</div></td>
																</tr>

																<tr>
																	<td>배송비:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<select class='form-control' name="gDeliveryCost"
																					required>
																					<option value="2500">2500</option>
																					<option value="0">0</option>
																				</select>
																				<p>※제주/도서산간의 경우 추가비용 발생</p>
																			</div>
																			<div class="col-md-3">

																				<p>상품상태:</p>
																			</div>
																			<div class="col-md-4">
																				<select class='form-control' name="gStatus" required>
																					<option value="1">판매가능</option>
																				</select>
																			</div>
																		</div></td>

																</tr>


																<tr>
																	<td>적립금:</td>
																	<td><div class='form-group'>
																			<div class="col-md-4">
																				<input class='form-control' name="gRsvFund" value="">
																			</div>
																			<div class="col-md-3">

																				<p>포인트:</p>
																			</div>
																			<div class="col-md-4">
																				<input class='form-control' name="gPoint" value="">
																			</div>
																		</div></td>

																</tr>

																<tr>
																	<td>키워드:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gKeywords"
																					value="" required>

																			</div>
																		</div>
																		<p>※키워들르 통한 웹 프로모션 메타페이지 다중생성[WebSpawner]</p></td>
																</tr>

																<tr>
																	<td>성과급률:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gFruitRate"
																					value="" required>
																			</div>
																		</div>
																		<p>% 성과급률은 0~100 숫자 안에서 입력하세요.</p></td>
																</tr>


																<tr>
																	<td>정렬순서:</td>
																	<td><div class='form-group'>
																			<div class="col-md-8">
																				<input class='form-control' name="gOrder" value=""
																					required>
																			</div>
																		</div>
																		<p>정렬순서는 -9999~99999 숫자 안에서 사이 값을 입력하세요.</p></td>
																</tr>


																<tr>
																	<td>게시기간:</td>
																	<td><div class='form-group'>
																			<div class="col-md-3">
																				<p>시작일 :</p>
																			</div>
																			<div class="col-md-8">
																				<input type="text" name="gPostStart"
																					class="form-control" id="datepicker_kor_1_1">
																			</div>
																			<div class="col-md-3">
																				<p>종료일 :</p>
																			</div>
																			<div class="col-md-8">
																				<input type="text" class="form-control"
																					name="gPostEnd" id="datepicker_kor_1_2">
																			</div>
																		</div></td>
																</tr>

																<tr class="active">
																	<td colspan="2"><p>이미지정보 (550 x 550픽셀 이상)</p></td>
																</tr>

																<tr>
																	<td class="active">대표(표준)</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload0"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Basic')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td class="active">전면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload1"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Front')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td class="active">후면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload2"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Rear')">이미지업로드</button>
																		</div>
																	</td>
																</tr>


																<tr>
																	<td class="active">우측면</td>
																	<td>

																		<div class='col-md-8'>
																			<button type="button" name="bnUpload3"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Right')">이미지업로드</button>
																		</div>
																	</td>
																</tr>


																<tr>
																	<td class="active">좌측면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload4"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Left')">이미지업로드</button>
																		</div>

																	</td>
																</tr>

																<tr>
																	<td class="active">상단면</td>
																	<td>
																		<div class='col-md-8'>
																			<button type="button" name="bnUpload5"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Top')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<tr>
																	<td class="active">하단면</td>
																	<td>

																		<div class='col-md-8'>
																			<button type="button" name="bnUpload6"
																				class="btn btn-sm btn-primary"
																				onclick="showImageWindow('Bottom')">이미지업로드</button>
																		</div>
																	</td>
																</tr>

																<script type="text/javascript">
																	//open GdsUpLoader window
																	function showImageWindow(
																			position) {
																		//var myBookId = $(this).data('id');
																		var modalUploadImages = position;
																		$(
																				"#modalUploadImages")
																				.modal(
																						"show");
																		$(
																				"#images_position")
																				.val(
																						modalUploadImages);

																	}
																</script>
															</tbody>
														</table>
													</div>
													<div class="col-md-12 ">
														<div class='col-md-12 form-group center-block'>
															<textarea class="form-control" name="gNote" rows="15">특이사항....</textarea>
														</div>

													</div>
												</div>
												<div class="panel-footer">

													<button type="button" class="btn btn-sm btn-primary"
														onclick="javascript:window.location.href='/admins/goods/gdsList.do'">
														리스트</button>

													<button type="button" class="btn btn-sm btn-primary"
														onClick="javascript:history.go(-1)">뒤로가기</button>

													<button type="submit" class="btn btn-sm btn-primary">등록하기
													</button>

												</div>

											</div>
										</div>
									</div>
								</form>

							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->


	<%-- <!-- --> 주석처리해도 include는 된다.  --%>
	<jsp:include page="/Admins/Goods/GdsUpLoader.jsp" flush="false" />


	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

