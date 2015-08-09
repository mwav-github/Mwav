<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 소제목 -->

<!-- ----- -->

<!-- Content Column 
container 안에 포함시키면된다.

-->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>NO.</th>
				<th>Group</th>
				<th>Title</th>
				<th>UpdateDate</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(selectboardList) > 0}">
					<c:forEach var="FrontboardList" items="${selectboardList}">
						<tr>
							<td>${FrontboardList.bNews_id}</td>
							<td>${FrontboardList.bnGroup}</td>
							<td><a onclick="javascript:window.location.href='/board/bnsView.do?bNews_id=${FrontboardList.bNews_id}'"">${FrontboardList.bnTitle}</a></td>
							<td>${FrontboardList.bnUpdateDt}</td>

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
<div class="row text-center">
	<div class="col-lg-12">
		<ul class="pagination">
			<li><a href="">&laquo;</a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</div>
