<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery Version 1.11.0 -->

<input type="hidden" name="pageNum" />
<div class="text-enter"></div>

<c:choose>
	<c:when test="${fn:length(selectListBuList) > 0}">
	
		<c:forEach var="VselectListBuList" items="${selectListBuList}">
			<input type="hidden" id="boardNews_id" name="boardNews_id"
				value="${VselectListBuList.boardUser_id }">
			<div class="row">
				<div class="col-md-12">

					<h4 style="color: #23527c !important;">
						<strong><a
							href="javascript:window.location.href='/board/buView.mwav?boardUser_id=${VselectListBuList.boardUser_id}'">${VselectListBuList.buTitle}</a></strong>
					</h4>
					<p style="color: #78828D;">${VselectListBuList.buSubTitle}</p>

					<p style="color: #78828D;" class="text-right">
						<c:if test="${VselectListBuList.fmbuInsertDt ne null}"> 
						Date - ${VselectListBuList.fmbuInsertDt}</c:if>
					</p>
					<%-- <h6 class="pull-right">
						<span class="glyphicon glyphicon-calendar" aria-hidden="true"> ${VselectListBnsList.fmbnInsertDt}</span>
					</h6> --%>

				</div>
			</div>
			<div class="enter"></div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="col-md-12">
			<h4>조회된 결과가 없습니다.</h4>
		</div>
	</c:otherwise>
</c:choose>

<!-- Pagination -->
<c:if test="${totalRow > 0}">
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">

				<c:if test="${pagingVO.startPage > pagingVO.pageBlock}">
					<li><a
						href="/CustomerService/Announcement/Announcement.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span
							class="glyphicon glyphicon-chevron-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pagingVO.startPage}"
					end="${pagingVO.endPage}">
					<li><a href="/CustomerService/Announcement/Announcement.mwav?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
					<li><a
						href="/CustomerService/Announcement/Announcement.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span
							class="glyphicon glyphicon-chevron-right"></span></a></li>
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
		comSubmit.setUrl("<c:url value='/boardNotice/buForm.mwav' />");
		comSubmit.submit();
	}

	function fn_selectbuView() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/boardNotice/buView.mwav'/>");
		alert('sdf');
		comSubmit.addParam("boardUser_id", $("#boardUser_id").val());
		comSubmit.submit();
	}

	function fn_deleteBoard() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/boardNotice/buDelete.mwav' />");
		comSubmit.addParam("boardUser_id", $("#boardUser_id").val());
		comSubmit.submit();

	}
</script>