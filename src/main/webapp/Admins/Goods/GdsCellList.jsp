<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>
<!-- 소제목 -->

<!-- ----- -->

<!-- Content Column 
container 안에 포함시키면된다.

-->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<input type="hidden" name="pageNum" />
<div id="table_reset" class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>상품코드.</th>
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
							<input type="hidden" id="goods_id" name="goods_id"
								value="${VselectListGdsList.goods_id }">
							<td class="hidden-xs">${VselectListGdsList.goods_id}</td>
							<td class="hidden-xs">${VselectListGdsList.gModelNbr}</td>
							<td class="hidden-xs">${VselectListGdsList.gModelNbr} / ${VselectListGdsList.gName}</td>
							<td class="hidden-xs">${VselectListGdsList.gManufacturer} / ${VselectListGdsList.gConsumerPrice}</td>
							<td class="hidden-xs">${VselectListGdsList.gStatus}</td>
							<td class="hidden-xs">${VselectListGdsList.gOrder}</td>
							<td class="hidden-xs">${VselectListGdsList.gInsertDt}</td>
							<td><a
								href="javascript:window.location.href='/board/bnsView.do?bNews_id=${VselectListBnsList.bNews_id}'">${VselectListBnsList.bnTitle}</a></td>
							<td class="hidden-xs">${VselectListBnsList.bnUpdateDt}</td>
							<%-- <td> <button type="button" class="btn btn-info" onclick="javascript:window.location.href='/board/bnsView.do?bNews_id=${FrontboardList.bNews_id}'">보기</button>&nbsp;
<button type="button" class="btn btn-warning" onclick="javascript:window.location.href='/board/bnsModify.do?bNews_id=${FrontboardList.bNews_id}'">수정</button>
</td> --%>
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
					<li><a
						href="/board/bnsList.do?pageNum=${pagingVO.startPage - pagingVO.pageBlock}">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${pagingVO.startPage}"
					end="${pagingVO.endPage}">
					<li><a href="/board/bnsList.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
					<li><a
						href="/board/bnsList.do?pageNum=${pagingVO.startPage + pagingVO.pageBlock}">&raquo;</a></li>
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