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
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			var bbb = obj;
			location.href = "/admin/boardNews/nsmDelete.mwav?bNews_id=" + bbb;
		} else { //취소
			return;
		}

	}
	
	
	//triggered when modal is about to be shown
	$('#reContact').on('click', function(e) {

		alert('123');
	    //get data-id attribute of the clicked element
	    var bookId = $(e.relatedTarget).data('book-id');

	    //populate the textbox
	    $(e.currentTarget).find('input[name="bookId"]').val(bookId);
	});
</script>

<div class="container">

	<!-- Page Heading/Breadcrumbs -->

	<!-- /.row -->

	<!-- Content Row -->


	<!-- Content Column -->
	<div class="col-lg-12">

		<div class="row">
			<%--================================================시작========================================================== --%>
			<!-- Content Column -->

			<form role="form">
				<table class="table table-striped">
					<thead>
						<tr>


						</tr>
						<tr class="active">
							<th>Group</th>
							<th>InsertDate</th>
							<th>Answer</th>
							<th>Status</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>${selectOneQAView.uqGroup}</td>
							<td>${selectOneQAView.fmuqInsertDt}</td>
							<td></td>

							<c:if test="${selectOneQAView.uqStatus eq '0'}">
								<td><span class="label label-danger">삭제 </span></td>
							</c:if>
							<c:if test="${selectOneQAView.uqStatus eq '1'}">
								<td><span class="label label-primary">문의접수 </span></td>
							</c:if>
							<c:if test="${selectOneQAView.uqStatus eq '10'}">
								<td><span class="label label-success">답변처리 </span></td>
							</c:if>
							<c:if test="${selectOneQAView.uqStatus eq '20'}">
								<td><span class="label label-warning">재답변처리</span></td>
							</c:if>

							<c:if test="${selectOneQAView.uqStatus eq '100'}">
								<td><span class="label label-default">답변완료</span></td>
							</c:if>


						</tr>
					</tbody>
				</table>

				<table class="table table-bordered ">
					<colgroup>
						<col class="col-md-4">
						<col class="col-md-8">
					</colgroup>

					<tr>
						<th class="active">Title</th>
						<td>${selectOneQAView.uqTitle}</td>
					</tr>
					<tr>
						<th class="active">SubTitle</th>
						<td>${selectOneQAView.uqSubTitle}</td>
					</tr>
					<tr>
						<th class="active">Reference</th>
						<td>${selectOneQAView.uqRelatedLink}</td>
					</tr>
				</table>
				<div class="enter"></div>
				<p>${selectOneQAView.uqContent}</p>
			</form>

			<div class="enter"></div>
			<c:if test="${selectOneQAView.uqStatus eq '10' || selectOneQAView.uqStatus eq '20' || selectOneQAView.uqStatus eq '100'}">
				<div class="span12">
					<div class="well">
						<h6 class="text-danger text-right">
							<strong>처리자 : 김성욱 | 처리일자 : 2016-08-27 16:01:44 </strong>
						</h6>
						<h3 class="text-info">Economy</h3>

						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis
							sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue
							semper porta.</p>

					</div>
				</div>
			</c:if>



			<br style="clear: both">

			<hr class="hr_b">
			<div class="row text-right">
				<p>

					<!-- <button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#Contact" id="reContact">
						<span class="glyphicon glyphicon-envelope"></span> Contact
					</button> -->
					
					<button type="button" class="btn btn-default"
							onclick="javascript:window.location.href='/CustomerService/CS-MasterPage.mwav?mode=qaForm&uqUserEmail=${selectOneQAView.uqUserEmail}&before_Q_id=${selectOneQAView.QnA_id}'">Contact
					</button>
					
					<%--회원 --%>
					<c:if test="${sessionScope.member_id ne null }">
						<button type="button" class="btn btn-default"
							onclick="javascript:window.location.href='/qa/qaList.mwav?member_id=${sessionScope.member_id}'">All
							List</button>
					</c:if>
					<%--비회원 --%>
					<c:if test="${sessionScope.member_id eq null }">
						<button type="button" class="btn btn-default"
							onclick="javascript:window.location.href='/qa/qaList.mwav?uqUserEmail=${selectOneQAView.uqUserEmail}'">All
							List</button>
					</c:if>
					<button type="button" class="btn btn-default"
						onclick="javascript:history.go(-1)">BACK</button>
				</p>
			</div>
			<div class="row">
				<ul class="pager">
					<c:if test="${(selectOneQAView.QnA_id) ne '1000000'}">
						<li class="previous"><a
							href="/qa/qaView.mwav?QnA_id=${selectOneQAView.QnA_id-1}">←
								Older</a></li>
					</c:if>

					<c:if test="${selectOneQAView.QnA_id_2 ne null}">
						<li class="next"><a
							href="/qa/qaView.mwav?QnA_id=${selectOneQAView.QnA_id_2}">Newer
								→</a></li>
					</c:if>
				</ul>
			</div>


			<%--================================================끝========================================================== --%>
		</div>

	</div>
</div>
