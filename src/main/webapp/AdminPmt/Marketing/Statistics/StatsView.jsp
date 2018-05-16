<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- Breadcrumbs-->
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
	<li class="breadcrumb-item active">Blank Page</li>
</ol>

<div class="col-12">

	<!-- 소제목 -->
	<div class="col-lg-12">
		<h2 class="page-header">상세정보</h2>
	</div>
	<!-- ----- -->

	<!-- Content Column -->
	<div class="row">
		<div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-12 col-xl-12 " align="center">
							<img alt="User Pic"
								src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
								class="img-circle">
							<div class="enter"></div>
						</div>


						<div class=" col-lg-12 col-xl-12 ">
							<table class="table ">
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
		<div class="col-12 col-sm-12 col-md-9 col-lg-9 col-xl-9">
			<div class="tab-content faq-cat-content ">
				<div class="tab-pane active in fade" id="faq-cat">
					<div class="panel-group" id="accordion-cat"></div>
				</div>
			</div>

			<c:choose>
				<c:when test="${fn:length(selectListStatLogDateList) > 0}">
					<c:forEach var="VselectListStatLogDateList"
						items="${selectListStatLogDateList}" varStatus="index">
						<div class="card panel-faq">
							<div class="card-header text-center">
								<h5>
									<strong> <a data-toggle="collapse"
										data-parent="#accordion-cat"
										href="#faq-cat-sub-${index.count}"><strong>${VselectListStatLogDateList.ndate}
												${VselectListStatLogDateList.day}</strong><span class="float-right"><i class="fa fa-plus" aria-hidden="true"></i>
												</span> </a></strong>
								</h5>
							</div>
							<c:set var="date" value="${VselectListStatLogDateList.ndate}" />
							<div id="faq-cat-sub-${index.count}"
								class="panel-collapse collapse">
								<div class="card-body">
									<ol class="breadcrumb bread-primary ">
										<c:choose>
											<c:when test="${fn:length(selectListStatLogList) > 0}">

												<c:forEach var="VselectListStatLogList"
													items="${selectListStatLogList}" varStatus="status">
													<c:if test="${date == VselectListStatLogList.date}">

														<li class="active text-center"><strong>[${VselectListStatLogList.slStatLogDt}]
																${VselectListStatLogList.slUrlLocalPath}</strong> <br></li>
														<div class="col-lg-12">
															<%--중복 <c:choose>은 안됨. --%>

															<c:if test="${status.first }">
																<a href="#"
																	class="text-center btn btn-success btn-block disabled btn-sm"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
															</c:if>
															<c:if test="${status.last }">
																<a href="#"
																	class="text-center btn btn-danger btn-block disabled btn-sm"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
															</c:if>
															<c:if
																test="${status.first  == 'false' && status.last== 'false'}">
																<a href="#"
																	class="text-center btn btn-primary btn-block disabled btn-sm"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
															</c:if>
														</div>
														<div class="enter"></div>
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
<div class="enter"></div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>

					<div class="card panel-faq">
						<div class="card-header text-center">
							<strong>조회된 결과가 없습니다. (서버 재시작으로 추측.)</strong>
						</div>
					</div>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
