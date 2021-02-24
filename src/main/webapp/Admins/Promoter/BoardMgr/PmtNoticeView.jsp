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
							function check(msg) {
								// msg : 비노출 / 공지게시
								// bpStatus : 1(비노출) / 2(공지게시)
								
								if (confirm("정말 " + msg + " 하시겠습니까?") == true){    //확인
									
									alert(msg + " 되었습니다.");
									
									var bpStatus = {'비노출':1, '공지게시':2};
									location.href = "/admins/promoter/boardmgr/PmtNoticeStatusUpdate.mwav?boardPromoter_id=${selectOnePmtNtmView.boardPromoter_id}&&bpStatus="+bpStatus[msg];																			
									return true;

								}
							
							}
						</script>
						
						
						<!-- Content Column -->
						<div class="table-responsive">
							<form role="form">
								<table class="table table-striped">
									<thead>
										<tr>
											<div class="pull-right">
											    <c:set var ="bpStatus" value="${selectOnePmtNtmView.bpStatus}"/>
												<c:if test="${fn:contains(bpStatus, 1)}">
													<span class="label label-default">
													<strong>비노출</strong>
													</span>
												</c:if>
												<c:if test="${fn:contains(bpStatus, 2)}">
													<span class="label label-primary">
													<strong>공지게시</strong>
													</span>
												</c:if>									
											</div>
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
										<th class="active">Image Link</th>
									</tr>
									<tr>
										<td>${selectOnePmtNtmView.bpTitleImageLink}</td>
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
								<button type="button" class="btn btn"
									onClick="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeList.mwav'">All List</button>
								<button type="button" class="btn btn-success"
									onclick="check('비노출')">비노출</button>
								<button type="button" class="btn btn-success"
									onclick="check('공지게시')">공지게시</button>
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

