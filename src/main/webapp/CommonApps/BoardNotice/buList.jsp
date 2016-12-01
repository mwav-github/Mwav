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
<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>NO.</th>
				<th>Group</th>
				<th>Title</th>
				<th>WriteDate</th>
				<%-- <th>관리메뉴</th> 삭제예정 --%>

			</tr>
		</thead>
		<tbody>

			<c:choose>
				<c:when test="${fn:length(selectListBuList) > 0}">
					<c:forEach var="VselectListBuList" items="${selectListBuList}">
					
						<tr>
							<input type="hidden" id="bUsers_id" name="bUsers_id"
								value="${VselectListBuList.bUsers_id }">
							<td>${VselectListBuList.bUsers_id}</td>
							<td>${VselectListBuList.buGroup}</td>
							<td><a
								href="javascript:window.location.href='/board/buView.do?bUsers_id=${VselectListBuList.bUsers_id}'">${VselectListBuList.buTitle}</a></td>
							<td>${VselectListBuList.buInsertDt}</td>
							<%-- <td> <button type="button" class="btn btn-info" onclick="javascript:window.location.href='/board/bnsView.do?bUsers_id=${FrontboardList.bUsers_id}'">보기</button>&nbsp;
<button type="button" class="btn btn-warning" onclick="javascript:window.location.href='/board/bnsModify.do?bUsers_id=${FrontboardList.bUsers_id}'">수정</button>
</td> --%>

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
						href="/board/buList.do?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pagingVO.startPage}"
					end="${pagingVO.endPage}">
					<li><a href="/board/buList.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
					<li><a
						href="/board/buList.do?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
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

<script type="text/javascript">
	$(document).ready(function() {
		$("#buForm").on("click", function(e) { //목록으로 버튼
			e.preventDefault();
			fn_insertbnsForm();
		});

		$("#buView").on("click", function(e) { //저장하기 버튼
			e.preventDefault();
			fn_selectbnsView();
		});

		$("#buDelete").on("click", function(e) { //삭제하기 버튼
			e.preventDefault();
			fn_deleteBoard();
		});
	});

	function fn_insertbuForm() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/boardNotice/buForm.do' />");
		comSubmit.submit();
	}

	function fn_selectbuView() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/boardNotice/buView.do'/>");
		alert('sdf');
		comSubmit.addParam("bUsers_id", $("#bUsers_id").val());
		comSubmit.submit();
	}

	function fn_deleteBoard() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/boardNotice/buDelete.do' />");
		comSubmit.addParam("bUsers_id", $("#bUsers_id").val());
		comSubmit.submit();

	}
</script>