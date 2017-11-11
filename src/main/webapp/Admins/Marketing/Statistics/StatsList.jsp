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
					Admins <small> Statistics</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/admins/Default.mwav">Home</a></li>
					<li>Admins</li>
					<li>Statistics</li>
					<li class="active">StatisticsList</li>
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
					<h2 class="page-header">StatisticsList</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<%--================================================시작========================================================== --%>

						<form id="order_form" action="" method="post">

							<div class="table-responsive">
								<table class="table table-bordered table-striped">


									<tbody>

										<tr>
											<th scope="row">기간</th>
											<td colspan="3" class="form-inline"><input type="date" name="ORD_DATE_BEFORE" id="datePicker"
												min="2010-01-01" max="2020-01-01" value="2017-01-01"
												class="form-control">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
												<input type="date" name="ORD_DATE_AFTER" id="datePicker"
												min="2010-01-01" max="2020-01-01" value="2017-12-31"
												class="form-control"></td>
										</tr>
										<tr>
											<th scope="row">조건검색</th>
											<td class="form-inline"><select class="input-sm "
												name="searchType">
													<option value="ORD_NO">날짜별</option>
													<option value="ORDERER_NM">회원명</option>
													<option value="DEPOSIT_NM">프로모터명</option>
											</select>
												<div class="input-group custom-search-form">
													<input type="text" class="form-control"
														placeholder="Search..."> <span
														class="input-group-btn">
														<button class="btn btn-default" type="submit">
															<i class="fa fa-search"></i>
														</button>
													</span>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- <div class="form-inline" align="center">
						<button type="button" class="btn btn-sm btn-default"
							onclick="fn_selectOrderSearchList(1);">조회</button>
						<button type="button" class="btn btn-sm btn-default"
							onclick="location.reload(true);">전체목록</button>
					</div> -->
							<p></p>
						</form>
						<form name="stsList" method="post"
							action="/admins/marketing/statistics/statsList.mwav">

							<input type="hidden" name="pageNum" />
							<div class="table-fixed">
								<%--통계는 table-bordered 부여 --%>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th class="col-md-1 hidden-xs">통계아이디</th>
											<th class="col-md-2 hidden-xs">회원/프로모터 아이디</th>
											<th class="col-md-4 hidden-xs">유입경로</th>
											<th class="col-md-3 hidden-xs">유입페이지</th>
											<th class="col-md-2 hidden-xs">유입일자</th>
											<%-- <th>관리메뉴</th> 삭제예정 --%>

										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(selectListStatistics) > 0}">
												<c:forEach var="RselectListStatistics"
													items="${selectListStatistics}">

													<tr>
														<input type="hidden" id="statistics_id"
															name="statistics_id"
															value="${RselectListStatistics.statistics_id }">
														<td class="col-md-1 hidden-xs"><a
															href="javascript:window.location.href='/admins/marketing/statistics/statsView.mwav?statistics_id=${RselectListStatistics.statistics_id}'">${RselectListStatistics.statistics_id}</a></td>
														<td class="col-md-2 hidden-xs">${RselectListStatistics.stMember_id}
															/ ${RselectListStatistics.stPromoterId}</td>
														<td class="col-md-4 hidden-xs">
															${RselectListStatistics.stUrlReferrer}</td>
														<td class="col-md-3 hidden-xs">${RselectListStatistics.stPageName}</td>
														<td class="col-md-2 hidden-xs">${RselectListStatistics.stStatisticsDt }</td>
													</tr>

												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="4">조회된 결과가 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<!-- Pagination -->
							<c:if test="${totalRow > 0}">
								<div class="row text-center">
									<div class="col-lg-12">
										<ul class="pagination">

											<c:if test="${pagingVO.startPage > pagingVO.pageBlock}">
												<li><a
													href="/admins/marketing/statistics/statsList.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span
														class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:if>
											<c:forEach var="i" begin="${pagingVO.startPage}"
												end="${pagingVO.endPage}">
												<li><a
													href="/admins/marketing/statistics/statsList.mwav?pageNum=${i}">${i}</a></li>
											</c:forEach>
											<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
												<li><a
													href="/admins/marketing/statistics/statsList.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span
														class="glyphicon glyphicon-chevron-right"></span></a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</c:if>
						</form>
						<%--================================================끝========================================================== --%>
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

