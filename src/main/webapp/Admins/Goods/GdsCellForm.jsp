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
							<c:when test="${fn:length(updateStfForm) > 0}">

								<%-- 1. 회원정보 수정 --%>

								<form class='form-horizontal' method="post"
									action="/admins/staff/stfUpdate.do">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">Mwav - GdsCellForm</h3>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-md-3 col-lg-3 " align="center">
														<img alt="User Pic"
															src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
															class="img-circle">
													</div>


													<div class=" col-md-9 col-lg-9 ">
														<table class="table table-user-information">
															<tbody>
																<tr>
																	<td>아이디:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="stfLoginId"
																					id="chkLoginId" type='text' maxlength="20"
																					value="${updateStfForm.stfLoginId }"
																					readonly="readonly" onchange="chkLoginPolicy()"
																					required>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>비밀번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="stfLoginPw"
																					type='password' id="chkLoginPW"
																					value="${updateStfForm.stfLoginPw }"
																					readonly="readonly" onchange="chkPWPolicy()"
																					required>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>사번:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class="form-control" name="stfNumber"
																					type="text" value="${updateStfForm.stfNumber}"
																					readonly="readonly" required />


																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>본사:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<select class='form-control' name="stfBranch"
																					value="${updateStfForm.stfBranch}" required>
																					<option value="본사">본사</option>
																					<option value="지사">지사</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>부서명:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<select class="form-control" name="stfDeptName"
																					value="${updateStfForm.stfDeptName}" required>
																					<option value="CEOs">CEOs</option>
																					<option value="관리">관리</option>
																					<option value="영업">영업</option>
																					<option value="총무">총무</option>
																					<option value="경리">경리</option>
																					<option value="고객지원">고객지원</option>
																					<option value="기획/개발">기획/개발</option>
																					<option value="마켓팅/영업">마켓팅/영업</option>
																					<option value="온라인프로모터">온라인프로모터</option>
																					<option value="임시">임시</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>직급/권한:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<select class="form-control" name="stfClass"
																					value="${updateStfForm.stfClass}" required>
																					<option value="0">*대기*</option>
																					<option value="05">임시</option>
																					<option value="10">사원</option>
																					<option value="15">주임</option>
																					<option value="20">계장</option>
																					<option value="25">대리</option>
																					<option value="30">실장</option>
																					<option value="35">팀장</option>
																					<option value="40">과장</option>
																					<option value="45">차장</option>
																					<option value="50">부부장</option>
																					<option value="55">부장</option>
																					<option value="60">소장</option>
																					<option value="65">이사</option>
																					<option value="70">상무이사</option>
																					<option value="75">전무이사</option>
																					<option value="80">대표이사</option>
																					<option value="85">회장</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>직원명:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfName"
																					value="${updateStfForm.stfName}" type="text"
																					maxlength="20" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>닉네임:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfNickname"
																					type="text" maxlength="20"
																					value="${updateStfForm.stfNickname}" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>회사 내선번호 Ext#:</td>
																	<td><div class='form-group'>
																			<div class='col-md-5'>
																				<input class="form-control" name="stfExtNbr"
																					type="text" maxlength="5"
																					value="${updateStfForm.stfExtNbr}" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>자택전화:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfPhone"
																					type="text" value="${updateStfForm.stfPhone}"
																					required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>핸드폰번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfCellularP"
																					type="text" value="${updateStfForm.stfCellularP}"
																					required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>이메일:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfEmail"
																					id="chkEmail" type="text"
																					value="${updateStfForm.stfEmail}"
																					onchange="chkEmailPolicy()" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>홈페이지:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfHomepage"
																					type="text" value="${updateStfForm.stfHomepage}"
																					placeholder="http:// " />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주민등록번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-4'>
																				<input class="form-control" name="stfSsn1"
																					type="text" maxlength="6"
																					value="${updateStfForm.stfSsn1}" />
																			</div>
																			<div class='col-md-4'>
																				<input class="form-control" name="stfSsn2"
																					type="text" maxlength="7"
																					value="${updateStfForm.stfSsn2}" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>등록일:</td>
																	<td>${updateStfForm.stfInsertDt}</td>
																</tr>
																<tr>
																	<td>입사일:</td>
																	<td>${updateStfForm.stfJoinDt}</td>
																</tr>
																<tr>
																	<td>부업무:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfSubJobs"
																					type="text" maxlength="200"
																					${updateStfForm.stfSubJobs} />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>우편번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" id="Zipcode"
																					name="stfZipcode" type="text" maxlength="6"
																					value="${updateStfForm.stfZipcode}"
																					readonly="readonly" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주소:</td>
																	<td>

																		<div class='form-group'>

																			<p class="col-md-3 pull-right">
																				<button class="btn btn-primary btn-block"
																					type="button" data-toggle="modal"
																					data-target=".modal_post" onclick="showhide();">주소찾기</button>

																			</p>
																			<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->

																			<div class='col-md-8'>
																				<input class="form-control" id="Address"
																					name="stfAddress_1" type="text"
																					value="${updateStfForm.stfAddress}"
																					placeholder='주소' readonly="readonly" />
																			</div>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfAddress_2"
																					type="text" placeholder='나머지 주소' required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="active">직원명함데이터:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfBusinessPic"
																					type="file" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td class="active">아바타:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfAvataImage"
																					type="file" />
																			</div>
																		</div></td>
																</tr>
																<tr class="info">
																</tr>
															</tbody>
														</table>
													</div>
													<div class="col-md-12 ">
														<div class='col-md-12 form-group center-block'>
															<textarea class="form-control" name="stfMark"
																class="stfMark" rows="15"> ${updateStfForm.stfMark} </textarea>
														</div>

													</div>
												</div>
												<div class="panel-footer">

													<button type="button" class="btn btn-sm btn-primary"
														onclick="javascript:window.location.href='/admins/staff/stfList.do'">
														리스트</button>

													<button type="button" class="btn btn-sm btn-primary"
														onClick="javascript:history.go(-1)">뒤로가기</button>

													<button type="submit" class="btn btn-sm btn-primary">수정하기
													</button>

												</div>

											</div>
										</div>
									</div>
								</form>


							</c:when>

							<c:otherwise>
								<%-- 1. 회원정보 입력 --%>
								<form class='form-horizontal' method="post" action="">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">Mwav - Goods Registration</h3>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-sm-12 col-md-4 col-lg-4 " align="center">

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
																<!-- 																<tr>
																	<td>상품코드:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>

																				<input class='form-control' name="goods_id"
																					type='text' maxlength="15"
																					readonly ="readonly">
																			</div>
																		</div></td>
																</tr> -->
																<tr>
																	<td class='col-md-3'>모델번호:</td>
																	<td class='col-md-9'><div class='form-group'>

																			<input class='form-control' name="gModelNbr" value=""
																				required>

																		</div></td>
																</tr>

																<tr>
																	<td class='col-md-3'>상품명:</td>
																	<td class='col-md-9'><div class='form-group'>

																			<input class='form-control' name="gName" value=""
																				required>

																		</div></td>
																</tr>

																<tr>
																	<td class='col-md-3'>일반판매가:</td>
																	<td class='col-md-3'><div class='form-group'>

																			<input class='form-control' name="gModelNbr" value=""
																				required>

																		</div></td>

																	<td class='col-md-3'>회원판매가:</td>
																	<td class='col-md-3'><div class='form-group'>

																			<input class='form-control' name="gModelNbr" value=""
																				required>

																		</div></td>
																</tr>


																<tr>
																	<td class='col-md-3'>제조(개발)사:
																	<td>
																	<td class='col-md-9'><div class='form-group'>

																			<input class='form-control' name="gManufacturer"
																				value="" required>

																		</div></td>
																</tr>

																<tr>
																	<td class='col-md-3'>원산지:
																	<td>
																	<td class='col-md-9'><div class='form-group'>

																			<input class='form-control' name="gPlaceofOrigin"
																				value="" required>

																		</div></td>
																</tr>


																<tr>
																	<td class='col-md-3'>배송비:</td>
																	<td class='col-md-3'><div class='form-group'>

																			<select class='form-control' name="gDeliveryCost"
																				required>
																				<option value="2500">2500</option>
																				<option value="0">0</option>
																			</select>
																			<p>※제주/도서산간의 경우 추가비용 발생</p>

																		</div></td>
																	<td class='col-md-3'>배송비:</td>
																	<td class='col-md-3'><div class='form-group'>

																			<select class='form-control' name="gDeliveryCost"
																				required>
																				<option value="2500">2500</option>
																				<option value="0">0</option>
																			</select>
																			<p>※제주/도서산간의 경우 추가비용 발생</p>

																		</div></td>
																</tr>


																<tr>
																	<td class='col-md-3'>키워드:
																	<td>
																	<td class='col-md-9'><div class='form-group'>

																			<input class='form-control' name="keywords" value=""
																				required>

																		</div>
																		<p>※키워들르 통한 웹 프로모션 메타페이지 다중생성[WebSpawner]</p></td>
																</tr>


																<tr>
																	<td class='col-md-3'>정렬순서:
																	<td>
																	<td class='col-md-9'><div class='form-group'>

																			<input class='form-control' name="gOrder" value=""
																				required>

																		</div>
																		<p>※키워들르 통한 웹 프로모션 메타페이지 다중생성[WebSpawner]</p></td>
																</tr>

																<tr>
																	<td>게시기간:</td>
																	<td><div class='form-group'>
																			조회기간: <input type="text" class="form-control"
																				id="datepicker_kor_1_1"> ~ <input
																				type="text" class="form-control"
																				id="datepicker_kor_1_2">
																		</div></td>
																</tr>
																<tr>
																	<td>직급/권한:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>

																				<select class="form-control" name="stfClass"
																					required>
																					<option value="0">*대기*</option>
																					<option value="05">임시</option>
																					<option value="10">사원</option>
																					<option value="15">주임</option>
																					<option value="20">계장</option>
																					<option value="25">대리</option>
																					<option value="30">실장</option>
																					<option value="35">팀장</option>
																					<option value="40">과장</option>
																					<option value="45">차장</option>
																					<option value="50">부부장</option>
																					<option value="55">부장</option>
																					<option value="60">소장</option>
																					<option value="65">이사</option>
																					<option value="70">상무이사</option>
																					<option value="75">전무이사</option>
																					<option value="80">대표이사</option>
																					<option value="85">회장</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>직원명:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" name="stfName"
																					type="text" maxlength="20" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>닉네임:</td>
																	<td><div class='col-md-12'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfNickname"
																					type="text" maxlength="20" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>회사 내선번호 Ext#:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" name="stfExtNbr"
																					type="text" maxlength="5" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>자택전화:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" name="stfPhone_1"
																					type="text" maxlength="4" required /> - <input
																					class="form-control" name="stfPhone_2" type="text"
																					maxlength="4" required /> - <input
																					class="form-control" name="stfPhone_3" type="text"
																					maxlength="4" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>핸드폰번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-4'>
																				<input class="form-control" name="stfCellularP_1"
																					type="text" maxlength="4" required />
																			</div>

																			<div class="col-md-4">
																				<input class="form-control" name="stfCellularP_2"
																					type="text" maxlength="4" required />
																			</div>

																			<div class='col-md-4'>
																				<input class="form-control" name="stfCellularP_3"
																					type="text" maxlength="4" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>이메일:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" name="stfEmail"
																					id="chkEmail" type="text"
																					onchange="chkEmailPolicy()" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>홈페이지:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" name="stfHomepage"
																					type="text" placeholder="http:// " />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주민등록번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-5'>
																				<input class="form-control" name="stfSsn1"
																					type="text" maxlength="6" />
																			</div>
																			<div class='col-md-5'>
																				<input class="form-control" name="stfSsn2"
																					type="text" maxlength="7" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>등록일:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>입사일:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>부업무:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" name="stfSubJobs"
																					type="text" maxlength="200" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>우편번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-12'>
																				<input class="form-control" id="Zipcode"
																					name="stfZipcode" type="text" maxlength="6"
																					value="" readonly="readonly" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주소:</td>
																	<td>

																		<div class='form-group'>

																			<p class="col-md-3 pull-right">
																				<button class="btn btn-primary btn-block"
																					type="button" data-toggle="modal"
																					data-target=".modal_post" onclick="showhide();">주소찾기</button>

																			</p>
																			<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->

																			<div class='col-md-8'>
																				<input class="form-control" id="Address"
																					name="stfAddress_1" type="text" value=""
																					placeholder='주소' readonly="readonly" />
																			</div>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfAddress_2"
																					type="text" placeholder='나머지 주소' required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="active">직원명함데이터:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfBusinessPic"
																					type="file" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td class="active">아바타:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfAvataImage"
																					type="file" />
																			</div>
																		</div></td>
																</tr>
																<tr class="info">
																</tr>
															</tbody>
														</table>
													</div>
													<div class="col-md-12 ">
														<div class='col-md-12 form-group center-block'>
															<textarea class="form-control" name="stfMark"
																class="stfMark" rows="15">가입되신것을 환영합니다.</textarea>
														</div>

													</div>
												</div>
												<div class="panel-footer">

													<button type="button" class="btn btn-sm btn-primary"
														onclick="javascript:window.location.href='/admins/staff/stfList.do'">
														리스트</button>

													<button type="button" class="btn btn-sm btn-primary"
														onClick="javascript:history.go(-1)">뒤로가기</button>

													<button type="submit" class="btn btn-sm btn-primary">가입하기
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


	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

