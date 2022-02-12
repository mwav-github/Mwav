<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<jsp:include page="/bizlogin/sementic/meta.jsp" flush="false" />
</head>
<body>
	<header class="section-header">
		<jsp:include page="/bizlogin/sementic/header.jsp" flush="false" />
	</header>
	<!-- .section-header -->

	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">공지사항</h2>
		</div>
		<!-- .container  -->
	</section>

	<input type="hidden" name="pageNum" />

	<section class="section-content padding-y">
		<div class="card mx-auto" style="max-width: 700px; margin-top: 0px;">
			<!-- ========================= 공지사항 게시물 존재. ========================= -->
			<c:choose>
				<c:when test="${fn:length(selectListBuList) > 0}">
					<c:forEach var="VselectListBuList" items="${selectListBuList}"> --%>
				<input type="hidden" id="boardNews_id" name="boardNews_id" value="${VselectListBuList.boardUser_id }">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" style="width: 80%" class="text-center">제 목</th>
									<th scope="col" style="width: 20%" class="text-center">등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 80%" class="text-left">
										<i class="fas fa-exclamation-circle"></i>
										<a href="javascript:window.location.href='/board/buView.mwav?boardUser_id=${VselectListBuList.boardUser_id}'">${VselectListBuList.buTitle}</a>
									</td>
									<td style="width: 20%" class="text-center text-secondary">
										<c:if test="${VselectListBuList.fmbuInsertDt ne null}"> 
						Date - ${VselectListBuList.fmbuInsertDt}</c:if>
									</td>
								</tr>

							</tbody>
						</table>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<!-- ========================= 공지사항 게시물 존재하지 않을 때. ========================= -->
					<div class="col-md-auto text-center">
						<h4>조회된 결과가 없습니다.</h4>
					</div>
				</c:otherwise>
			</c:choose>

			<!-- Pagination -->

			<c:if test="${totalRow > 0}">
				<div class="col-lg-auto mt-3">
					<div class="d-flex justify-content-center">
						<nav aria-label="...">
							<ul class="pagination">
								<c:if test="${pagingVO.startPage > pagingVO.pageBlock}">
									<li class="page-item disabled">
										<a class="page-link"
											href="/CustomerService/Announcement/Announcement.mwav?pageNum=${pagingVO.startPage - pagingVO.pageBlock}"
											tabindex="-1">Previous</a>
									</li>
								</c:if>

								<c:forEach var="i" begin="${pagingVO.startPage}" end="${pagingVO.endPage}">
									<li class="page-item">
										<a class="page-link" href="/CustomerService/Announcement/Announcement.mwav?pageNum=${i}">${i}<span
												class="sr-only">(current)</span>
										</a>
									</li>
								</c:forEach>
								<c:if test="${pagingVO.endPage < pagingVO.pageCount}">
									<li class="page-item">
										<a class="page-link"
											href="/CustomerService/Announcement/Announcement.mwav?pageNum=${pagingVO.startPage + pagingVO.pageBlock}">Next</a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
		</div>
	</section>

	<footer class="section-footer border-top">
		<jsp:include page="/bizlogin/sementic/footer.jsp" flush="false" />
	</footer>
</body>
</html>

