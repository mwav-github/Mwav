<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-xl-12">
	<div class="row">
		<form name="stsList" method="post"
			action="/admins/marketing/statistics/statsList.mwav">
			<input type="hidden" name="pageNum">
			<div class="table-fixed">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th class="col-lg-2 col-2">회원</th>
							<th class="col-lg-2 col-2">프로모터</th>
							<th class="col-lg-4 col-4">유입경로</th>
							<th class="col-lg-2 col-2">유입페이지</th>
							<th class="col-lg-2 col-2">유입일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(selectListStatistics) > 0}">
								<c:forEach var="RselectListStatistics"
									items="${selectListStatistics}">
									<tr>

										<%-- <td class="col-lg-4 hidden-xsd-none d-sm-block"><a
											href="javascript:window.location.href=&apos;/admins/marketing/statistics/statsView.mwav?statistics_id=${RselectListStatistics.statistics_id}&apos;">${RselectListStatistics.statistics_id}</a>
										</td> --%>
										<td class="col-lg-2 "><c:if
												test="${RselectListStatistics.stMember_id ne 0}">${RselectListStatistics.stMember_id}</c:if>
										</td>
										<td class="col-lg-2 "><c:if
												test="${RselectListStatistics.stPromoterId ne 0}">${RselectListStatistics.stPromoterId}</c:if></td>
										<td class="col-lg-4 ">${fn:trim(RselectListStatistics.stUrlReferrer)}</td>
										<td class="col-lg-2 ">${RselectListStatistics.stPageName}</td>
										<td class="col-lg-2 ">${RselectListStatistics.stStatisticsDt }</td>
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
			<!-- Pagination 
			<c:if test="${totalRow > 0}">
				<div class="row text-center">
					<div class="col-xl-12">
						<ul class="pagination">
							<c:if test="${pagingVO.startPage > pagingVO.pageBlock}">
								<li class="page-item"><a
									href="/Promoters/StatList.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span
										aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span></a></li>
							</c:if>
							<c:forEach var="i" begin="${pagingVO.startPage}"
								end="${pagingVO.endPage}">
								<li class="page-item"><a class="page-link"
									href="/Promoters/StatList.mwav?pageNum=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
								<li class="page-item"><a class="page-link"
									aria-label="Next"
									href="/Promoters/StatList.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span
										aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</c:if>-->
		</form>
	</div>
</div>

