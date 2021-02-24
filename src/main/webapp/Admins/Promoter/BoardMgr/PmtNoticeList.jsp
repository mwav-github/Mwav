<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
</head>

<body>

	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />


	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> PromoterNoticeForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>Promoter</li>
					<li>BoardMgr</li>
					<li class="active">PmtNtmForm</li>
				</ol>
			</div>
		</div>

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
					<h2 class="page-header">PmtNtmForm</h2>
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
						
						
						
						<button type="button" class="pull-right btn btn-default"><a href="/Admins/Promoter/BoardMgr/PmtNoticeForm.mwav?mm=site">공지사항 등록</a></button>
						
						<form name="ntmList" method="post"
							action="/admins/promoter/boardmgr/PmtNoticeList.mwav">

							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
							
							<input type="hidden" name="pageNum" />
							
							
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>NO.</th>
											<th class="hidden-xs">노출여부</th>
											<th class="hidden-xs">Title</th>
											<th class="hidden-xs">WriteDate</th>
											<th class="hidden-xs">관리</th>																						
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(selectListPmtNtmList) > 0}">
									
												<c:forEach var="RselectListPmtNtmList" items="${selectListPmtNtmList}">
												
													<tr>
														<input type="hidden" id="boardPromoter_id" name="boardPromoter_id" value="${RselectListPmtNtmList.boardPromoter_id }">
														<td class="hidden-xs">${RselectListPmtNtmList.boardPromoter_id}</td>
														<c:if test="${RselectListPmtNtmList.bpStatus eq '1'}">
															<td><span class="label label-default">비노출 </span></td>
														</c:if>
														<c:if test="${RselectListPmtNtmList.bpStatus eq '2'}">
															<td><span class="label label-primary">공지게시 </span></td>
														</c:if>														
														<td>
															<a href="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeView.mwav?boardPromoter_id=${RselectListPmtNtmList.boardPromoter_id}'">${RselectListPmtNtmList.bpTitle}</a>
														</td>
														<td class="hidden-xs">${RselectListPmtNtmList.bpInsertDt}</td>		
																	
														<td>
															<button type="button" class="btn btn"
																onclick="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeView.mwav?boardPromoter_id=${RselectListPmtNtmList.boardPromoter_id}'">보기</button>&nbsp;
															<button type="button" class="btn btn-success"
																onclick="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeUpdate.mwav?boardPromoter_id=${RselectListPmtNtmList.boardPromoter_id}'">수정</button>
															<button type="button" class="btn btn-danger"
																onclick="delete_check(${RselectListPmtNtmList.boardPromoter_id})">삭제</button>	
														</td>
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
							<c:if test="${totalRow > 0}">
								<div class="row text-center">
									<div class="col-lg-12">
										<ul class="pagination">

											<c:if test="${pagingVO.startPage > pagingVO.pageBlock}">
												<li><a
													href="/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:if>
											<c:forEach var="i" begin="${pagingVO.startPage}"
												end="${pagingVO.endPage}">
												<li><a href="/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=${i}">${i}</a></li>
											</c:forEach>
											<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
												<li><a
													href="/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</c:if>
						</form>
						<%--================================================끝========================================================== --%>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
	</footer>
</body>
</html>