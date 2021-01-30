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
					Admins <small> NewsForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>SiteMgr</li>
					<li class="active">NsmForm</li>
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
				${test }
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
					<h2 class="page-header">NsmForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<button type="button" class="pull-right btn btn-default">
							<a href="/Admins/SiteMgr/NewsMgr/NsmForm.mwav?mm=site">뉴스 등록</a>
						</button>

						<form name="nsmList" method="post"
							action="/admin/boardNews/nsmList.mwav">

							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>

							<%--==================================================시작========================================================== --%>
							<input type="hidden" name="pageNum" value="" />
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>NO.</th>
											<th class="hidden-xs">Group</th>
											<th class="hidden-xs">Title</th>
											<th class="hidden-xs">WriteDate</th>
											<%-- <th>관리메뉴</th> 삭제예정 --%>

										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(selectListNsmList) > 0}">
												<c:forEach var="RselectListNsmList"
													items="${selectListNsmList}">

													<%-- <c:if test="${RselectListNsmList.bnDeleteDt ne null}"> --%>
													<tr>
														<input type="hidden" id="boardNews_id" name="boardNews_id"
															value="${RselectListNsmList.boardNews_id}">
														<td class="hidden-xs">${RselectListNsmList.boardNews_id}</td>
														<td class="hidden-xs">${RselectListNsmList.bnGroup}</td>
														<td><a
															href="javascript:window.location.href='/admin/boardNews/nsmView.mwav?boardNews_id=${RselectListNsmList.boardNews_id}'">${RselectListNsmList.bnTitle}</a></td>
														<td class="hidden-xs">${RselectListNsmList.bnInsertDt}</td>
														<td>
															<button type="button" class="btn btn-info"
																onclick="javascript:window.location.href='/admin/boardNews/nsmView.mwav?boardNews_id=${RselectListNsmList.boardNews_id}&pageNum=${pageNum}'">보기</button>&nbsp;
															<button type="button" class="btn btn-warning"
																onclick="javascript:window.location.href='/admin/boardNews/nsmUpdate.mwav?boardNews_id=${RselectListNsmList.boardNews_id}&pageNum=${pageNum}'">수정</button>
														</td>
													</tr>
													<%-- </c:if> --%>
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
													href="/admin/boardNews/nsmList.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span
														class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:if>
											<c:forEach var="i" begin="${pagingVO.startPage}"
												end="${pagingVO.endPage}">
												<li><a
													href="/admin/boardNews/nsmList.mwav?pageNum=${i}">${i}</a></li>
											</c:forEach>
											<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
												<li><a
													href="/admin/boardNews/nsmList.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span
														class="glyphicon glyphicon-chevron-right"></span></a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</c:if>
						</form>
						<%--==================================================끝========================================================== --%>
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
