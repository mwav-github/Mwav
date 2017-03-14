<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/JsFramework/Bootstrap/bootstrap-social.css"
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
<div class="row">
	<form role="form">
		<%-- <table class="table-responsive table table-striped">
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
					<td>${selectOneBnsView.bNews_id}</td>
					<td>${selectOneBnsView.bnGroup}</td>
					<td>${selectOneBnsView.bnViewCount}</td>
					<td>${selectOneBnsView.bnInsertDt}</td>
					<td>${selectOneBnsView.staff_id}</td>
					<td>${selectOneBnsView.bnOrder}</td>
				</tr>
			</tbody>
		</table>

		<table class="table table-striped">

			<tr>
				<th class="active">Title</th>
			</tr>
			<tr>
				<td>${selectOneBnsView.bnTitle}</td>
			</tr>

			subtitle은 우리쪽 내용이 들어가는 부분이므로 null이면 노출하지 않는다. admin 페이지는 전체 노출!! 

			<c:if
				test="${selectOneBnsView.bnSubTitle != '' or selectOneBnsView.bnSubTitle eq null}">
				<tr>
					<th class="active">SubTitle</th>
				</tr>
				<tr>
					<td>${selectOneBnsView.bnSubTitle}</td>
				</tr>

			</c:if>
			
			<tr>
				<th class="active">Reference</th>

			</tr>
			<tr>
				<td>${selectOneBnsView.bnRelatedLink}</td>
			</tr>
			
			
			<tr>
				<th class="active">Content</th>

			</tr>
			<tr>
				<td>${selectOneBnsView.bnContent}</td>
			</tr>

		</table> --%>
	</form>

	<div class="col-md-12">


		<h2>
			<a>${selectOneBnsView.bnTitle}</a>
		</h2>
		<p class="lead">
			<c:if
				test="${selectOneBnsView.bnSubTitle != '' or selectOneBnsView.bnSubTitle eq null}">
				${selectOneBnsView.bnSubTitle} 
			</c:if>
		</p>
		<hr>
		<p>
			<i class="fa fa-clock-o"></i> Posted on
			${selectOneBnsView.fmbnInsertDt} | Topic: ${selectOneBnsView.bnGroup}
		</p>
		<hr>
		<div class="text-right">
			<a class="btn btn-social-icon btn-facebook"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}', 'facebook', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}')"><span
				class="fa fa-facebook"></span></a> <a
				class="btn btn-social-icon btn-google"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}','googleplus', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}')"><span
				class="fa fa-google"></span></a> <a
				class="btn btn-social-icon btn-linkedin"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}','linkedin', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}')"><span
				class="fa fa-linkedin"></span></a> <a
				class="btn btn-social-icon btn-twitter"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}','twitter', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}')"><span
				class="fa fa-twitter"></span></a>
		</div>
		<div class="enter"></div>

		<p>${selectOneBnsView.bnContent}</p>

		<c:if test="${selectOneBnsView.bnRelatedLink eq null }">
			<a class="btn btn-primary" href='${selectOneBnsView.bnRelatedLink}'>Read
				More <i class="fa fa-angle-right"></i>
			</a>
		</c:if>


		<hr class="hr_b">



		<br style="clear: both">
		<div class="row text-right">
			<p>
				<button type="button" class="btn btn-default"
					onClick="javascript:window.location.href='/board/bnsList.mwav'">All
					List</button>
				<button type="button" class="btn btn-default"
					onClick="javascript:history.go(-1)">BACK</button>
			</p>
		</div>

		<!-- Pager -->
		<%--이전 이후있는 경우만 가능하도록 if 문 처리 필요. --%>
		<div class="row">
			<ul class="pager">
				<li class="previous"><a
					href="/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id-1}">←
						Older</a></li>
				<li class="next"><a
					href="/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id+1}">Newer
						→</a></li>
			</ul>
		</div>

	</div>
</div>
