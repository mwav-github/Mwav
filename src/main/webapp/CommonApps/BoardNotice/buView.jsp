<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


<!-- 소제목 -->
<!-- ----- 
색 : http://the3.tistory.com/49

<tr class="active">...</tr>
<tr class="success">...</tr>
<tr class="warning">...</tr>
<tr class="danger">...</tr>
<tr class="active">...</tr>

-->

<!-- Content Column -->
<div class="table-responsive">
	<form role="form">
		<table class="table table-striped">
			<thead>
				
				<tr class="active">
					<th>NO.</th>
					<th>Group</th>
					<th>ViewCount</th>
					<th>InsertDt</th>
					<th>staff_id</th>
					<th>Order</th>
				</tr>
			</thead>


			<tbody>
					<tr>
						<td>${selectOneBuView.bUsers_id}</td>
						<td>${selectOneBuView.buGroup}</td>
						<td><!-- <span class="badge text-center"> -->${selectOneBuView.buViewCount}</td>
						<td>${selectOneBuView.buInsertDt}</td>
						<td>${selectOneBuView.staff_id}</td>
						<td>${selectOneBuView.buOrder}</td>
					</tr>
			</tbody>
		</table>

		<table class="table table-striped">

			<tr>
				<th class="active">Title</th>
			</tr>
			<tr> <td>${selectOneBuView.buTitle}</td></tr>
			

<%--subtitle은 우리쪽 내용이 들어가는 부분이므로 null이면 노출하지 않는다. admin 페이지는 전체 노출!!  --%>
            <c:if test ="${selectOneBuView.buSubTitle != '' or selectOneBuView.buSubTitle eq null}">
			<tr>
				<th class="active">SubTitle</th>
			</tr>
			<tr><td>${selectOneBuView.buSubTitle}</td></tr>
            </c:if>
         
			<tr>
				<th class="active">Reference</th>
				
			</tr>
			<tr><td>${selectOneBuView.buRelatedLink}</td></tr>
            
			<tr>
				<th class="active">Content</th>
				
			</tr>
			<tr><td>${selectOneBuView.buContent}</td></tr>

		</table>
	</form>

	<br style="clear: both">
	<p class="pull-right">
		<button type="button" class="btn btn-success" onClick="javascript:window.location.href='/board/buList.do'">All List</button>
		<button type="button" class="btn btn-warning" onClick="javascript:history.go(-1)">BACK</button>
	</p>

</div>
