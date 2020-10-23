<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>

	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> PromoterNoticeView</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Promoter</li>
					<li>BoardMgr</li>
					<li class="active">PmtNoticeView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-3">
				<c:choose>
					<c:when test="${param.mm eq null}">
						<c:set value="${mm}" var="mm" />
					</c:when>
					<c:otherwise>
						<c:set value="${param.mm}" var="mm" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="/admins/LeftMenu.mwav" flush="false">
					<jsp:param name="mm" value="${mm}" />
				</jsp:include>
			</div>

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">PmtNoticeView</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<%--================================================시작========================================================== --%>
						<script>
							function delete_check(obj) {
								if (confirm("정말 삭제하시겠습니까??") == true){    //확인
									var tmp = obj;
									location.href= "/admins/promoter/boardmgr/PmtNoticeDelete.mwav?boardPromoter_id="+tmp;
									alert("공지가 삭제되었습니다.")
									location.href= "/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=1";
								}else{   //취소
								    return;
								}
						
							}
						</script>
						
						<!-- Content Column -->
						<div class="table-responsive">
							<form role="form">
								<table class="table table-striped">
									<thead>
										<tr>
										    <c:set var ="bpStatus" value="${selectOnePmtNtmView.bpStatus }"/>
											<c:if test="${fn:contains(bpStatus, '삭제완료.')}">
												<span class="pull-right text-danger"><strong>${selectOnePmtNtmView.bpStatus }</strong></span>
											</c:if>
											<c:if test="${fn:contains(bpStatus, '임시저장.')}">
												<span class="pull-right text-primary"><strong>${selectOnePmtNtmView.bpStatus }</strong></span>
											</c:if>
											<c:if test="${fn:contains(bpStatus, '공지완료.')}">
												<span class="pull-right text-success"><strong>${selectOnePmtNtmView.bpStatus } </strong></span>
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
											<td>${selectOnePmtNtmView.boardPromoter_id}</td>
											<td>${selectOnePmtNtmView.bpGroup}</td>
											<td>${selectOnePmtNtmView.bpViewCount}</td>
											<td>${selectOnePmtNtmView.bpInsertDt}</td>
											<td>${selectOnePmtNtmView.staff_id}</td>
											<td>${selectOnePmtNtmView.bpOrder}</td>
										</tr>
									</tbody>
								</table>

								<table class="table table-striped">

									<tr>
										<th class="active">Title</th>
									</tr>
									<tr>
										<td>${selectOnePmtNtmView.bpTitle}</td>
									</tr>




									<tr>
										<th class="active">SubTitle</th>
									</tr>
									<tr>
										<td>${selectOnePmtNtmView.bpSubTitle}</td>
									</tr>
									
									<tr>
										<th class="active">Reference</th>
									</tr>
									<tr>
										<td>${selectOnePmtNtmView.bpRelatedLink}</td>
									</tr>
									
									<tr>
										<th class="active">Keywords</th>
									</tr>
									<tr>
										<td>${selectOnePmtNtmView.bpKeyword}</td>
									</tr>

									<tr>
										<th class="active">Content</th>

									</tr>
									<tr>
										<td>${selectOnePmtNtmView.bpContent}</td>
									</tr>

								</table>
							</form>

							<br style="clear: both">
							<p class="pull-right">
								<button type="button" class="btn btn-success"
									onClick="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeList.mwav'">All List</button>
								<button type="button" class="btn btn-danger"
									onclick="delete_check(${selectOnePmtNtmView.boardPromoter_id})">Delete</button>
							</p>

						</div>


						<%--================================================끝========================================================== --%>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

