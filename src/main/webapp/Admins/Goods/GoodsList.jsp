<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->

	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!-- Image Container  container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. -->
	<!--  Header 끝-->

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> GoodsList</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Goods</li>
					<li class="active">GoodsList</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">

				<%--http://egloos.zum.com/tiger5net/v/5828786 
				${param.name} => request.getParameter("name");
				${member} => request.getAttribute("member");
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
					<h2 class="page-header">GoodsList</h2>
				</div>
								
				<!-- Content Column -->
				<div class="col-lg-12">

					<form name="GdsList" method="post" action="/">
						<div class="row">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>

							<input type="hidden" name="pageNum" />
							<div id="table_reset" class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>상품코드</th>
											<th class="hidden-xs">상품 이미지</th>
											<th class="hidden-xs">모델명 / 상품명</th>
											<th class="hidden-xs">제조(개발)사 / 소비자가</th>
											<th class="hidden-xs">제품상태</th>
											<th class="hidden-xs">순열</th>
											<th class="hidden-xs">날짜</th>
											<th class="hidden-xs">관리메뉴</th>
											<%-- <th>관리메뉴</th> 삭제예정 --%>

										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(selectListGdsList) > 0}">
												<c:forEach var="VselectListGdsList" items="${selectListGdsList}">
													<tr>
														<input type="hidden" id="goods_id" name="goods_id" value="${VselectListGdsList.goods_id }">
														<td class="hidden-xs">${VselectListGdsList.goods_id}</td>
														<td class="hidden-xs">
															<img src="/xUpload/GoodsData/Goods-${VselectListGdsList.goods_id }/S1-Base.jpg">
														</td>
														<td class="hidden-xs">${VselectListGdsList.gModelNbr}/ ${VselectListGdsList.gName}</td>
														<td class="hidden-xs">${VselectListGdsList.gManufacturer}/ ${VselectListGdsList.gConsumerPrice}</td>
														<td class="hidden-xs">${VselectListGdsList.gStatus}</td>
														<td class="hidden-xs">${VselectListGdsList.gOrder}</td>
														<td class="hidden-xs">${VselectListGdsList.gInsertDt}</td>
														<td>
															<button type="button" class="btn btn-info" onclick="javascript:window.location.href='/admins/goods/goodsView.mwav?goods_id=${VselectListGdsList.goods_id}'">보기</button>
															&nbsp;
															<button type="button" class="btn btn-warning" onclick="javascript:window.location.href='/admin/goods/goodsUpdateForm.mwav?goods_id=${VselectListGdsList.goods_id}'">수정</button>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<%-- HTML 요소로 강제 텍스트 입력시  --%>
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
												<li><a href="/admins/goods/goodsList.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:if>
											<c:forEach var="i" begin="${pagingVO.startPage}" end="${pagingVO.endPage}">
												<li><a href="/admins/goods/goodsList.mwav?pageNum=${i}">${i}</a></li>
											</c:forEach>
											<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
												<li><a href="/admins/goods/goodsList.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
											</c:if>
											<!-- <li><a href="">&laquo;</a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li> -->
										</ul>
									</div>
								</div>
							</c:if>
						</div>
					</form>
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
