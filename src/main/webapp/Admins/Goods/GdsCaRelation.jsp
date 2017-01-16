<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
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
					Admins <small> CategoryRelationForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Goods</li>
					<li class="active">CategoryRelationForm</li>
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
					<h2 class="page-header">CategoryRelationForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<%--================================================시작========================================================== --%>



						<!-- Content Column -->
						<div class="table-responsive">


							<form role="form" method="post" name="categoryForm"
								action="/admins/goods/categoryRelationForm.mwav">

								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 class="panel-title">Mwav - CategoryRelation
												Registration</h3>
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
																<td>상품유일코드 :</td>
																<td><div class='form-group'>
																		<div class='col-md-8'>


																			<c:choose>
																				<c:when
																					test="${fn:length(selectCategoryGoodsList) > 0}">
																					<select name="goods_id">
																						<c:forEach var="vselectCategoryGoodsList"
																							items="${selectCategoryGoodsList}">

																							<option
																								value="${vselectCategoryGoodsList.goods_id}">${vselectCategoryGoodsList.goods_id} / ${vselectCategoryGoodsList.gName}</option>

																						</c:forEach>
																					</select>
																				</c:when>
																				<c:otherwise>
																					<p>등록된 상품이 0개입니다.</p>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div></td>
															</tr>

															<tr>
																<td>카테고리 ID:</td>
																<td><div class='form-group'>
																		<div class='col-md-8'>

																			<!-- 		<select name="gCategory_id">
																				<option value="1000">스페셜</option>
																				<option value="1001">패션/잡화</option>
																				<option value="1002">스포츠/레져</option>
																				<option value="1003">식품/건강</option>
																				<option value="1004">뷰티/미용</option>
																				<option value="1005">생활/주방</option>
																				<option value="1006">가구/인테리어</option>
																				<option value="1007">디지털/가전</option>
																				<option value="1008">출산/유아</option>
																				<option value="1009">휴대폰</option>

																			</select> -->

																			<%-- 현재의 경우 자동화가 아니니까 하드코딩으로 --%>
																			<c:choose>
																				<c:when test="${fn:length(selectListCategory) > 0}">
																					<select name="gCategory_id">
																						<c:forEach var="vselectListCategory"
																							items="${selectListCategory}">

																							<option
																								value="${vselectListCategory.gCategory_id}">${vselectListCategory.gcategory_id} / ${vselectListCategory.gcName}</option>

																						</c:forEach>
																					</select>
																				</c:when>
																				<c:otherwise>
																					<p>카테고리가 0개입니다.</p>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div></td>
															</tr>


														</tbody>
													</table>
												</div>

											</div>
											<div class="panel-footer">

												<button type="button" class="btn btn-sm btn-primary"
													onclick="javascript:window.location.href='/admins/staff/stfList.mwav'">
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

						</div>

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

