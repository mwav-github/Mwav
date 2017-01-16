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
					Admins <small> CategoryForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Goods</li>
					<li class="active">CategoryForm</li>
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
					<h2 class="page-header">CategoryForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<%--================================================시작========================================================== --%>



						<!-- Content Column -->
						<div class="table-responsive">


							<form role="form" method="post" name="categoryForm"
								action="/admins/goods/categoryForm.mwav">

								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 class="panel-title">Mwav - Category Registration</h3>
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-md-3 col-lg-3 " align="center">
													<img alt="User Pic"
														src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
														class="img-circle">
												</div>

												<input
													type="hidden" name="gcUpper_id" value="1" /> <input
													type="hidden" name="gcDepth" value="1" />


												<div class=" col-md-9 col-lg-9 ">
													<table class="table table-user-information">
														<tbody>
															<tr>
																<td>카테고리명:</td>
																<td><div class='form-group'>
																		<div class='col-md-8'>

																			<input class='form-control' name="gcName" type='text'
																				maxlength="15" value="" required>
																		</div>
																	</div></td>
															</tr>
															<tr>
																<td>영어명:</td>


																<td><div class='form-group'>
																		<div class='col-md-8'>
																			<input class='form-control' name="gcEngName"
																				type='text' value="" required>
																		</div>
																		<%-- 			<c:choose>
																				<c:when test="${fn:length(selectListGdsList) > 0}">
																					<c:forEach var="VselectListCategory"
																						items="${selectListCategory}">

																						<select class='form-control' name="gcEngName"
																							required>
																							<option value="${VselectListCategory.gcEngName}">${VselectListCategory.gcEngName}</option>
																						</select>
																					</c:forEach>
																				</c:when>
																				<c:otherwise> 													</c:otherwise>
																			</c:choose>
						 --%>
																	</div></td>

															</tr>

														</tbody>
													</table>
												</div>

											</div>
											<div class="panel-footer">


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

