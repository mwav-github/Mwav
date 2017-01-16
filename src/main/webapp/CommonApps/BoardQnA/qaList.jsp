<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<%--================================================시작========================================================== --%>
	<form name="qaList" method="post"
		action="/qa/qaList.do">

		<div class="input-group custom-search-form">
			<input type="text" class="form-control" placeholder="Search...">
			<span class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="fa fa-search"></i>
				</button>
			</span>
		</div>
		<input type="hidden" name="pageNum" />
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
						<c:when test="${fn:length(selectListQAList) > 0}">
							<c:forEach var="RselectListQAList" items="${selectListQAList}">

								<tr>
									<input type="hidden" id="QnA_id" name="QnA_id"
										value="${RselectListQAList.QnA_id }">
									<td class="hidden-xs">${RselectListQAList.QnA_id}</td>
									<td class="hidden-xs">${RselectListQAList.uqGroup}</td>
									<td><a
										href="javascript:window.location.href='/qa/qaView.do?QnA_id=${RselectListQAList.QnA_id}'">${RselectListQAList.uqTitle}</a></td>
									<td class="hidden-xs">${RselectListQAList.uqInsertDt}</td>
									<td>
										<button type="button" class="btn btn-info"
											onclick="javascript:window.location.href='/qa/qaView.do?QnA_id=${RselectListQAList.QnA_id}'">보기</button>&nbsp;
										<button type="button" class="btn btn-warning"
											onclick="javascript:window.location.href='/qa/qaView.do?QnA_id=${RselectListQAList.QnA_id}'">수정</button>
									</td>
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
								href="/qa/qaList.do?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
						</c:if>
						<c:forEach var="i" begin="${pagingVO.startPage}"
							end="${pagingVO.endPage}">
							<li><a href="/qa/qaList.do?pageNum=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
							<li><a
								href="/qa/qaList.do?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
	</form>
	<%--================================================끝========================================================== --%>
</div>
