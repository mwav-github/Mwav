<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	function page_move2(s_value) {
		var f = document.NsmNews; //폼 name
		f.bNews_id.value = s_value; //POST방식으로 넘기고 싶은 값 (이건 실제 내부 내용)
		f.submit();
	}
</script>
<div class="bs-component ">
	<!-- NEW  -->
	<table class="table table-striped">

		<tbody class="mwav_important_10 hidden-xs hidden-sm">
			<%--큰 화면에서는 5개다. --%>
			<form name="NsmNews" action="/board/bnsView.mwav" method="post">

				<c:choose>
					<c:when test="${fn:length(selectListBnsFrontList) > 0}">
						<c:forEach var="VselectListBnsFrontList"
							items="${selectListBnsFrontList}">
							<%-- 							<c:if test="${VselectListBnsFrontList.bnStatus eq '2'}"> --%>
							<input type="hidden" name="bNews_id"
								value="${VselectListBnsFrontList.bNews_id}" />
							<input type="hidden" name="bnViewCount"
								value="${VselectListBnsFrontList.bnViewCount}" />
							<tr>
								<!-- a태그로 처리요망 -->
								<td class="col-md-12 text-left "><a
									href="/board/bnsView.mwav?bNews_id=${VselectListBnsFrontList.bNews_id}#news_top">${VselectListBnsFrontList.bnTitle}</a></td>
								<%--view를 구현하는 방법에 따라 달라진다. get 문 형태 유망 --%>
								<%-- <td class="col-md-4 hidden-xs text-center" style="color:rgba(0,0,0,.5);">${VselectListBnsFrontList.bnInsertDt}</td> --%>
							</tr>
							<%-- 							</c:if> --%>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</form>
		</tbody>

		<tbody class="mwav_important_10 visible-sm">
			<%--작은 화면에서는 3개만 --%>
			<form name="NsmNews" action="/board/bnsView.mwav" method="post">
				<c:choose>
					<c:when test="${fn:length(selectListBnsFrontList) > 0 }">
						<c:forEach var="VselectListBnsFrontList"
							items="${selectListBnsFrontList}" begin="0" end="2" step="1">
							<input type="hidden" name="bNews_id"
								value="${VselectListBnsFrontList.bNews_id}" />
							<input type="hidden" name="bnViewCount"
								value="${VselectListBnsFrontList.bnViewCount}" />
							<tr>
								<!-- a태그로 처리요망 -->

								<td class="col-xs-12 text-left "><a
									href="/board/bnsView.mwav?bNews_id=${VselectListBnsFrontList.bNews_id}">${VselectListBnsFrontList.bnTitle}</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</form>
		</tbody>

		<tbody class="mwav_important_10 visible-xs">
			<%--작은 화면에서는 3개만 --%>
			<form name="NsmNews" action="/board/bnsView.mwav" method="post">
				<c:choose>
					<c:when test="${fn:length(selectListBnsFrontList) > 0 }">
						<c:forEach var="VselectListBnsFrontList"
							items="${selectListBnsFrontList}" begin="0" end="1" step="1">
							<input type="hidden" name="bNews_id"
								value="${VselectListBnsFrontList.bNews_id}" />
							<input type="hidden" name="bnViewCount"
								value="${VselectListBnsFrontList.bnViewCount}" />
							<tr>
								<td class="col-xs-12 text-left "><a
									href="/board/bnsView.mwav?bNews_id=${VselectListBnsFrontList.bNews_id}">${VselectListBnsFrontList.bnTitle}</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</form>
		</tbody>
	</table>
</div>