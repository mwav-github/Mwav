<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-xl-12">
	<div class="card-block p-0">
		<form name="stsList" method="post"
			action="">
			<input type="hidden" name="pageNum">
			<div class="table-fixed">
				<table class="table table-bordered table-sm">
					<thead style="font-size:15px;">
						<tr>
							<th>통계 /회원 아이디</th>
							<th>유입경로</th>
							<th>유입페이지</th>
							<th>유입일자</th>
						</tr>
					</thead>
					<tbody style="font-size:12px;">
						<c:choose>
							<c:when test="${fn:length(selectListStatistics) > 0}">
								<c:forEach var="RselectListStatistics"
									items="${selectListStatistics}">
									<tr>
										<td><c:if
												test="${RselectListStatistics.statistics_id ne 0}"><a href="javascript:window.location.href='/Promoters/StatView.mwav?statistics_id=${RselectListStatistics.statistics_id}'">${RselectListStatistics.statistics_id}</a></c:if> <c:if
												test="${RselectListStatistics.stMember_id ne 0}">/ ${RselectListStatistics.stMember_id}</c:if>  
										</td>
										<td>${fn:trim(RselectListStatistics.stUrlReferrer)}</td>
										<td>${RselectListStatistics.stPageName}</td>
										<td>${RselectListStatistics.date }</td>
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
		</form>
	</div>
</div>

