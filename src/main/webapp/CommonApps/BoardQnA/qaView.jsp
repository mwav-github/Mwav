<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- jQuery Version 1.11.0 -->

<!-- imsi -->

<script>


	$(function() {
		return $(".starrr").starrr();
	});
	//별표 끝
	$(document).ready(function() {

		$('#hearts').on('starrr:change', function(e, value) {
			$('#count').html(value);
			$('#uaSatisfaction').val(value);
		});

		/*   $('#hearts-existing').on('starrr:change', function(e, value){
		    $('#count-existing').html(value);
		  }); */
	});

	function uaSatisfactionAjax() {
		var uaSatisfaction = $('#uaSatisfaction').val();
		if (uaSatisfaction == 0 || uaSatisfaction == null) {
			alert('평가를 해주세요.');
			return false;
		} else {
			$
					.ajax({
						url : "/qa/uaSatisfactionUpdateAjax.mwav",
						type : "post",
						data : $('#uaSatisfactionForm').serialize(),
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						dataType : "json", // 데이터타입을 JSON형식으로 지정
						success : function(xmlStr) {
							if (xmlStr != null) {
								//http://devbox.tistory.com/entry/%EB%B9%84%EA%B5%90-%EC%99%80-%EC%9D%98-%EC%B0%A8%EC%9D%B4-1
								//alert($("#resultpostseek").height());
								if (xmlStr === true) {
									alert("고객님의 소중한 평가에 감사드립니다.")
									location.reload();

								} else {
									return false;

								}

							}
						},
						error : function(xhr, status, error) {
							var errorMsg = 'status(code): ' + jqXHR.status
									+ '\n';
							errorMsg += 'statusText: ' + jqXHR.statusText
									+ '\n';
							errorMsg += 'responseText: ' + jqXHR.responseText
									+ '\n';
							errorMsg += 'textStatus: ' + textStatus + '\n';
							errorMsg += 'errorThrown: ' + errorThrown;
							alert(errorMsg);
						}
					});
		}
	}
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
							<th>분류</th>
							<th>등록일</th>
							<th>답변자</th>
							<th></th>
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
						<col class="col-md-4 col-sm-4 col-xs-3">
						<col class="col-md-8 col-sm-8 col-xs-9">
					</colgroup>

					<tr>
						<th class="active">제목</th>
						<td>${selectOneQAView.uqTitle}</td>
					</tr>
					<tr>
						<th class="active">부제목</th>
						<td>${selectOneQAView.uqSubTitle}</td>
					</tr>
					<tr>
						<th class="active">홈페이지</th>
						<td>${selectOneQAView.uqRelatedLink}</td>
					</tr>
				</table>
				<div class="enter"></div>
				<div class="col-md-12"><p>${selectOneQAView.uqContent}</p></div>
			</form>

			<div class="enter"></div>
			<c:if
				test="${selectOneQAView.uqStatus eq '10' || selectOneQAView.uqStatus eq '20' || selectOneQAView.uqStatus eq '100'}">
				<div class="span12">
					<div class="well">
						<h6 class="text-danger text-right">
							<strong>처리자 : ${selectOneQAView.stfName} | 처리일자 :
								${selectOneQAView.uaInsertDt} </strong>
						</h6>
						<h3 class="text-info">${selectOneQAView.uaTitle}</h3>

						<p>${selectOneQAView.uaContent}</p>
						<br>
						<hr class="hr_g">

						<c:choose>
							<c:when test="${selectOneQAView.uaSatisfaction eq null}">
								<form name="uaSatisfactionForm" id="uaSatisfactionForm"
									method="post">
									<div class="row">
										<h5 class="text-right">
											<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
											답변에 대한 만족도를 평가해주세요. 소중한 자료로 사용하겠습니다. <small>-Hover
												and click on a star-</small>
										</h5>
									</div>
									<div class="row lead">

										<div id="hearts" class="starrr col-md-12 text-right"
											style="color: #ee8b2d;"></div>
										<input type="hidden" name="uaSatisfaction" id="uaSatisfaction"
											value="" /> <input type="hidden" name="QnA_id"
											value="${selectOneQAView.QnA_id}" />

										<div class="col-md-12 text-right">
											<h4>
												You gave a rating of <strong><span id="count">0</span></strong>
												star(s) --
												<button type="button" class="btn btn-default"
													onclick="uaSatisfactionAjax();">평가</button>
											</h4>

										</div>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<div class="text-right">
									<h3>
										${selectOneQAView.uaSatisfaction} <small>/ 5</small>
									</h3>

									<c:forEach begin="1" end="${selectOneQAView.uaSatisfaction}">
										<button type="button" class="btn btn-warning btn-sm"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
									</c:forEach>
									<c:set value="${5 - selectOneQAView.uaSatisfaction}"
										var="endValue" />

									<c:forEach begin="1" end="${endValue }">
										<button type="button" class="btn btn-defalut btn-sm btn-grey"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
									</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</c:if>

			<div class="enter"></div>
			<hr class="hr_b">
			<div class="row text-right">
				<p class="col-md-12">
					<button type="button" class="btn btn-default"
						onclick="javascript:window.location.href='/CustomerService/QnA/QnA.mwav?mode=qaForm&uqUserEmail=${selectOneQAView.uqUserEmail}&before_Q_id=${selectOneQAView.QnA_id}'">Contact
					</button>
					<button type="button" class="btn btn-default"
						onclick="javascript:history.go(-1)">BACK</button>
				</p>
				</div>

				<div class="col-md-12 ">
					<%--회원 --%>
					<c:if test="${sessionScope.member_id ne null }">
						<form class="pull-right" method="post" action="/qa/qaList.mwav">
							<input type="hidden" name="member_id"
								value="${sessionScope.member_id}">
							<button type="submit" class="btn btn-default btn-md">All
								List</button>
						</form>
					</c:if>
					<%--비회원 --%>
					<c:if test="${sessionScope.member_id eq null }">
						<form class="pull-right" method="post" action="/qa/qaList.mwav">
							<input type="hidden" name="uqUserEmail"
								value="${selectOneQAView.uqUserEmail}">
							<button type="submit" class="btn btn-default btn-md">All
								List</button>
						</form>
					</c:if>
	

			</div>
			<%-- <div class="row">
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
			</div> --%>


			<%--================================================끝========================================================== --%>
		</div>

	</div>
</div>
