<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					Admins <small> Statistics</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/admins/Default.mwav">Home</a></li>
					<li>Admins</li>
					<li>Statistics</li>
					<li class="active">StsList</li>
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
					<h2 class="page-header">상세정보</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="panel panel-info">
							<!-- 	<div class="panel-heading">
								<h3 class="panel-title">김주성</h3>
							</div> -->
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12 col-lg-12 " align="center">
										<img alt="User Pic"
											src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
											class="img-circle">
										<div class="enter"></div>
									</div>


									<div class=" col-md-12 col-lg-12 ">
										<table class="table table-user-information">
											<tbody>
												<tr>
													<td>통계 ID: ${selectOneStatView.statistics_id}</td>

												</tr>
												<tr>
													<td>고객 ID: ${selectOneStatView.stMember_id}</td>

												</tr>
												<tr>
													<td>프로모터 ID: ${selectOneStatView.stMember_id}</td>

												</tr>
												<tr>
													<td>마지막 접속 일자:</td>

												</tr>
												<tr>
													<td>기기:</td>

												</tr>

												<tr>
													<td>핸드폰번호:</td>

												</tr>
												<tr>
													<td>최초 접속 일자: ${selectOneStatView.stStatisticsDt}</td>

												</tr>
												<tr>
													<td>최초 유입 경로: ${selectOneStatView.stUrlReferrer}</td>

												</tr>
											</tbody>
										</table>


									</div>
								</div>
							</div>


						</div>
					</div>
					<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
						<div class="tab-content faq-cat-content ">
							<div class="tab-pane active in fade" id="faq-cat">
								<div class="panel-group" id="accordion-cat">

									<c:choose>
										<c:when test="${fn:length(selectListStatLogDateList) > 0}">

											<%--for each 다음 값 출력. (설명해주기)--%>

											<%--다음꺼는 items로 사용해줘야 한다. var로 사용시 안된다. 
													https://okky.kr/article/296134 
												<c:set var="nowDate" value="${VselectListStatLogList.date}" />
												<c:set var="nextDate"
													value="${selectListStatLogList[status.index + 1].date}" />

												<%--현재, 다음의 날짜가 같은 경우 	<c:if test="${nextDate == nowDate}">--%>
											<c:forEach var="VselectListStatLogDateList"
												items="${selectListStatLogDateList}" varStatus="index">
												<div class="panel panel-default panel-faq">
													<div class="panel-heading text-center">
														<h5><strong>
															<a data-toggle="collapse" data-parent="#accordion-cat"
																href="#faq-cat-sub-${index.count}"><strong>${VselectListStatLogDateList.ndate}  ${VselectListStatLogDateList.day}</strong><span
																class="pull-right"><i
																	class="glyphicon glyphicon-plus"></i></span> </a></strong>
														</h5>
													</div>
													<c:set var="date"
														value="${VselectListStatLogDateList.ndate}" />
													<div id="faq-cat-sub-${index.count}"
														class="panel-collapse collapse">

														<%-- <c:if
																	test="${date == VselectListStatLogList.date}"> --%>
														<div class="panel-body">
															<ol class="breadcrumb bread-primary ">
																<c:choose>
																	<c:when test="${fn:length(selectListStatLogList) > 0}">

																		<c:forEach var="VselectListStatLogList"
																			items="${selectListStatLogList}" varStatus="status">
																			<c:if test="${date == VselectListStatLogList.date}">

																				<li class="active"><strong>[${VselectListStatLogList.slStatLogDt}]
																						${VselectListStatLogList.slUrlLocalPath}</strong> <br></li>
																				<div class="enter">
																					<%--중복 <c:choose>은 안됨. --%>

																					<c:if test="${status.first }">
																						<a href="#"
																							class="text-center btn btn-success btn-block btn-xs"><span
																							class="glyphicon glyphicon-arrow-down"></span></a>
																					</c:if>
																					<c:if test="${status.last }">
																						<a href="#"
																							class="text-center btn btn-danger btn-block btn-xs"><span
																							class="glyphicon glyphicon-arrow-down"></span></a>
																					</c:if>
																					<c:if
																						test="${status.first  == 'false' && status.last== 'false'}">
																						<a href="#"
																							class="text-center btn btn-primary btn-block btn-xs"><span
																							class="glyphicon glyphicon-arrow-down"></span></a>
																					</c:if>
																				</div>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>

																		<li>조회된 결과가 없습니다.</li>

																	</c:otherwise>
																</c:choose>
															</ol>
														</div>
														<%-- </c:if> --%>

													</div>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>

											<div class="panel panel-default panel-faq">
												<div class="panel-heading text-center"><strong>조회된 결과가 없습니다. (서버 재시작으로 추측.)</strong></div>
											</div>

										</c:otherwise>
									</c:choose>
								</div>
							</div>

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

