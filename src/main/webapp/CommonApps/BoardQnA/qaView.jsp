<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>

<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script>
	function check2(obj) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var bbb = obj;
			location.href= "/admin/boardNews/nsmDelete.mwav?bNews_id="+bbb;
		}else{   //취소
		    return;
		}

	}
</script>
<div class="container">

	<!-- Page Heading/Breadcrumbs -->

	<!-- /.row -->

	<!-- Content Row -->
	<div class="row">


		<div class="col-md-9">
			<!-- 소제목 -->


			<!-- Content Column -->
			<div class="col-lg-12">

				<div class="row">
					<%--================================================시작========================================================== --%>
					<!-- Content Column -->
					<div class="table-responsive">
						<form role="form">
							<table class="table table-striped">
								<thead>
									<tr>

										<c:set var="bnStatus" value="${selectOneQAView.uqStatus }" />
										<c:if test="${fn:contains(uqStatus, '0')}">
											<span class="pull-right bg-danger"><strong>삭제
											</strong></span>
										</c:if>
										<c:if test="${fn:contains(uqStatus, '1')}">
											<span class="pull-right bg-primary"><strong>문의접수
											</strong></span>
										</c:if>
										<c:if test="${fn:contains(uqStatus, '10')}">
											<span class="pull-right bg-info"><strong>답변처리
											</strong></span>
										</c:if>
										<c:if test="${fn:contains(uqStatus, '20')}">
											<span class="pull-right bg-warning"><strong>재답변처리
											</strong></span>
										</c:if>

										<c:if test="${fn:contains(uqStatus, '100')}">
											<span class="pull-right bg-success"><strong>처리완료
											</strong></span>
										</c:if>

										<div class="enter"></div>
									</tr>
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
										<td>${selectOneQAView.QnA_id}</td>
										<td>${selectOneQAView.uqGroup}</td>
										<td>${selectOneQAView.uqViewCount}</td>
										<td>${selectOneQAView.uqInsertDt}</td>
										<td>${selectOneQAView.member_id}</td>
										<td>${selectOneQAView.uqGroup}</td>
									</tr>
								</tbody>
							</table>

							<table class="table table-striped">

								<tr>
									<th class="active">Title</th>
								</tr>
								<tr>
									<td>${selectOneQAView.uqTitle}</td>
								</tr>




								<tr>
									<th class="active">SubTitle</th>
								</tr>
								<tr>
									<td>${selectOneQAView.uqSubTitle}</td>
								</tr>

								<tr>
									<th class="active">Reference</th>
								</tr>
								<tr>
									<td>${selectOneQAView.uqRelatedLink}</td>
								</tr>

								<tr>
									<th class="active">Content</th>

								</tr>
								<tr>
									<td>${selectOneQAView.uqContent}</td>
								</tr>

							</table>
						</form>

						<br style="clear: both">
						<p class="pull-right">
							<button type="button" class="btn btn-success"
								onClick="javascript:window.location.href='/qa/qaList.mwav?pageNum=${pageNum}'">All
								List</button>
							<button type="button" class="btn btn-warning"
								onClick="javascript:history.go(-1)">BACK</button>
							<button type="button" class="btn btn-danger"
								onclick="check2(${selectOneQAView.QnA_id})">Delete</button>
						</p>

					</div>

					<%--================================================끝========================================================== --%>
				</div>

			</div>
		</div>
	</div>
</div>