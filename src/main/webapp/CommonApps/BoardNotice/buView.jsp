<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<%-- 소셜버튼 추가에 따라 --%>
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
	<div class="col-md-12">


		<h2>
			<a>${selectOneBuView.buTitle}</a>
		</h2>
		<p class="lead">
			<c:if
				test="${selectOneBuView.buSubTitle != '' or selectOneBuView.buSubTitle eq null}">
				${selectOneBuView.buSubTitle} 
			</c:if>
		</p>
		<hr>
		<p>
			<i class="fa fa-clock-o"></i> Posted on
			${selectOneBuView.fmbuInsertDt} | Topic: ${selectOneBuView.buGroup}
		</p>
		<hr>
		<div class="text-right">
			<a class="btn btn-social-icon btn-facebook"
				onClick="sendSns('facebook', '${selectOneBuView.buRelatedLink}', '${selectOneBuView.buTitle}', 'notice')"><span
				class="fa fa-facebook"></span></a> <a
				class="btn btn-social-icon btn-google"
				onClick="sendSns('googleplus', '${selectOneBuView.buRelatedLink}', '${selectOneBuView.buTitle}', 'news')"><span
				class="fa fa-google"></span></a> <a
				class="btn btn-social-icon btn-linkedin"
				onClick="sendSns('linkedin', '${selectOneBuView.buRelatedLink}', '${selectOneBuView.buTitle}', 'news')"><span
				class="fa fa-linkedin"></span></a> <a
				class="btn btn-social-icon btn-twitter"
				onClick="sendSns('twitter', '${selectOneBuView.buRelatedLink}', '${selectOneBuView.buTitle}', 'news')"><span
				class="fa fa-twitter"></span></a>
		</div>
		<div class="enter"></div>
		<hr>
		<p>${selectOneBnsView.bnContent}</p>
		<a class="btn btn-primary" href='${selectOneBuView.buRelatedLink}'>Read
			More <i class="fa fa-angle-right"></i>
		</a>


		<hr>




		<br style="clear: both">
		<div class="row">
			<p>
				<button type="button" class="btn btn-default"
					onClick="javascript:window.location.href='/CustomerService/Announcement/Announcement.jsp'">All
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
					href="/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id-1}">←
						Older</a></li>
				<li class="next"><a
					href="/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id+1}">Newer
						→</a></li>
			</ul>
		</div>

	</div>
	

</div>
