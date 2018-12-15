<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

		<%-- pc 화면 --%>
		<tbody class="mwav_important_10 hidden-xs hidden-sm">
			<%--큰 화면에서는 5개다. --%>
			<form name="NsmNews" action="/board/bnsView.mwav" method="post">
				<c:choose>
					<c:when test="${fn:length(selectListBnsFrontList) > 0}">
						<c:forEach var="VselectListBnsFrontList"
							items="${selectListBnsFrontList}">
							
							<!-- 날짜 확인//// -->
							<!-- 기사 업데이트 날짜 -->
							<c:set var="jstl_targetDate" value="${VselectListBnsFrontList.bnUpdateDt }" /><!-- 2000-01-01 00:00:00 -->
							<fmt:parseDate var="parse_targetDate" pattern="yyyy-MM-dd" value="${jstl_targetDate }" />
							<fmt:formatDate value="${parse_targetDate }" pattern="yyyy-MM-dd" var="targetdate"/>
							
							<%-- <c:set var="jstl_today" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${jstl_today}" pattern="yyyy-MM-dd" var="today" /> --%>
							
							<c:set var="jstl_ago" value="<%=new java.util.Date(new java.util.Date().getTime()-(60*60*24*1000*21)) %>"/><!-- 3주 -->
							<fmt:formatDate value="${jstl_ago}" pattern="yyyy-MM-dd" var="ago" />
							
							<fmt:parseDate var="parseTargetDate" pattern="yyyy-MM-dd" value="${targetdate }" />
							<fmt:parseDate var="parseAgoDate" pattern="yyyy-MM-dd" value="${ago }" />
							<fmt:parseNumber var="parseTdate" value="${parseTargetDate.time / (1000*60*60*24) }" integerOnly="true"/>
							<fmt:parseNumber var="parseAgo" value="${parseAgoDate.time / (1000*60*60*24) }" integerOnly="true"/>
							<!-- //// -->
							
							
							<c:if test="${VselectListBnsFrontList.bnStatus eq '2'}">
								<input type="hidden" name="bNews_id"
									value="${VselectListBnsFrontList.bNews_id}" />
								<input type="hidden" name="bnViewCount"
									value="${VselectListBnsFrontList.bnViewCount}" />
								<tr>
									<!-- a태그로 처리요망 -->
									<td class="col-md-12 text-left ">
										<a href="/board/bnsView.mwav?bNews_id=${VselectListBnsFrontList.bNews_id}#news_top">
											<%-- <c:if test="${parseTdate -parseAgo < 20 && parseTdate -parseAgo > 0}"> --%>
											<c:if test="${parseTdate - parseAgo > 0}">
											    <span class="label label-danger">new</span>
											</c:if>
											<c:choose>
												<c:when test="${fn:length(VselectListBnsFrontList.bnTitle) < 70}">
													${VselectListBnsFrontList.bnTitle}
												</c:when>
												<c:otherwise>
													${fn:substring(VselectListBnsFrontList.bnTitle, 0, 70)} ...
												</c:otherwise>
											</c:choose>
											<%-- ${VselectListBnsFrontList.bnTitle} --%>
										</a>
									</td>
									<%--view를 구현하는 방법에 따라 달라진다. get 문 형태 유망 --%>
									<%-- <td class="col-md-4 hidden-xs text-center" style="color:rgba(0,0,0,.5);">${VselectListBnsFrontList.bnInsertDt}</td> --%>
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

		<%-- 태블릿/모바일 화면 --%>
		<tbody class="mwav_important_10 visible-sm visible-xs">
			<%--작은 화면에서는 3개만 --%>
			<form name="NsmNews" action="/board/bnsView.mwav" method="post">
				<c:choose>
					<c:when test="${fn:length(selectListBnsFrontList) > 0 }">
						<c:forEach var="VselectListBnsFrontList"
							items="${selectListBnsFrontList}" begin="0" end="2" step="1">
							
							<!-- 날짜 확인//// -->
							<!-- 기사 업데이트 날짜 -->
							<c:set var="jstl_targetDate" value="${VselectListBnsFrontList.bnUpdateDt }" /><!-- 2000-01-01 00:00:00 -->
							<fmt:parseDate var="parse_targetDate" pattern="yyyy-MM-dd" value="${jstl_targetDate }" />
							<fmt:formatDate value="${parse_targetDate }" pattern="yyyy-MM-dd" var="targetdate"/>
							
							<%-- <c:set var="jstl_today" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${jstl_today}" pattern="yyyy-MM-dd" var="today" /> --%>
							
							<c:set var="jstl_ago" value="<%=new java.util.Date(new java.util.Date().getTime()-(60*60*24*1000*21)) %>"/><!-- 3주 -->
							<fmt:formatDate value="${jstl_ago}" pattern="yyyy-MM-dd" var="ago" />
							
							<fmt:parseDate var="parseTargetDate" pattern="yyyy-MM-dd" value="${targetdate }" />
							<fmt:parseDate var="parseAgoDate" pattern="yyyy-MM-dd" value="${ago }" />
							<fmt:parseNumber var="parseTdate" value="${parseTargetDate.time / (1000*60*60*24) }" integerOnly="true"/>
							<fmt:parseNumber var="parseAgo" value="${parseAgoDate.time / (1000*60*60*24) }" integerOnly="true"/>
							<!-- //// -->
							
							<c:if test="${VselectListBnsFrontList.bnStatus eq '2'}">
							<input type="hidden" name="bNews_id"
								value="${VselectListBnsFrontList.bNews_id}" />
							<input type="hidden" name="bnViewCount"
								value="${VselectListBnsFrontList.bnViewCount}" />
							<tr class="center-block">
								<td class="col-xs-12  text-left ">
									<a href="/board/bnsView.mwav?bNews_id=${VselectListBnsFrontList.bNews_id}">
										<%-- <c:if test="${parseTdate -parseAgo < 20 && parseTdate -parseAgo > 0}"> --%>
											<c:if test="${parseTdate - parseAgo > 0}">
										    <span class="label label-danger">new</span>
										</c:if>
										<c:choose>
											<c:when test="${fn:length(VselectListBnsFrontList.bnTitle) < 40}">
												${VselectListBnsFrontList.bnTitle}
											</c:when>
											<c:otherwise>
												${fn:substring(VselectListBnsFrontList.bnTitle, 0, 40)} ...	
											</c:otherwise>
										</c:choose>
									</a>
								</td>
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

		<%-- <tbody class="mwav_important_10 visible-xs">
			작은 화면에서는 3개만
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
		</tbody> --%>
	</table>
</div>