<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	function page_move2(s_value) {
		var f = document.NsmNews; //폼 name
		f.bUsers_id.value = s_value; //POST방식으로 넘기고 싶은 값 (이건 실제 내부 내용)
		f.submit();
	}
</script>
<div class="bs-component">
	<!-- NEW  -->
	<table class="table table-striped">
		<!-- 	<thead>
			<tr>
				<th>Title</th>
				<th>UpdateDate</th>
			</tr>
		</thead> -->
		<tbody>
			<%--xml mapper에서 사용한 id는 사용불가능하다. --%>
			<form name="NsmNews" action="/board/buView.mwav" method="post">
				<c:choose>
					<c:when test="${fn:length(selectListBuFrontList) > 0}">
						<c:forEach var="VselectListBuFrontList"
							items="${selectListBuFrontList}">
							<c:if test="${VselectListBuFrontList.buStatus eq '2'}">
								<input type="hidden" name="bUsers_id"
									value="${VselectListBuFrontList.bUsers_id}" />
								<input type="hidden" name="buViewCount"
									value="${VselectListBuFrontList.buViewCount}" />
								<tr>
									<!-- a태그로 처리요망 -->
									<td class="col-md-8 col-xs-8 col-sm-8"><a
										href="/board/buView.mwav?bUsers_id=${VselectListBuFrontList.bUsers_id}#notice_top">${VselectListBuFrontList.buTitle}</a></td>
									<%--view를 구현하는 방법에 따라 달라진다. get 문 형태 유망 --%>
									<td class="col-md-4 col-xs-4 col-sm-4">${VselectListBuFrontList.buInsertDt}</td>
								</tr>
							</c:if>
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