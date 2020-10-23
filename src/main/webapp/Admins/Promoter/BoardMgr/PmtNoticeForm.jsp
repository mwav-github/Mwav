<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- FullPackage -->
<script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>
</head>

<body>
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
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

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<%--================================================시작========================================================== --%>

						<script>
							function check() {
						
								if (confirm("정말 입력 또는 수정하시겠습니까??") == true){    //확인
									if (document.bpForm.bpTitle.value == "") {
										alert("제목을 입력하십시요.");
										document.bpForm.bpTitle.focus();
										return false;
									}
								
									// contents 빈값 체크기능 추가 (textarea 값의 길이 체크하자!)
									
									alert("공지가 등록/수정 되었습니다.");
									location.href= "/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=1";
									document.bpForm.submit();
									
									// location.href= "/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=1";
									
									
									return true;
								}else{   //취소
								    return false;
								}
							
							}
						</script>
						
						<!-- Content Column -->
						<div class="table-responsive">
							<c:choose>
								<c:when test="${fn:length(updatePmtNtmForm) > 0}">
									<form role="form" method="post" name="bpForm"
										action="/admins/promoter/boardmgr/PmtNoticeUpdatePro.mwav"
										target="iframe">
										
										<table class="table table-striped">

											<thead>
												<tr>

													<div class="pull-right">
														<%--기본값 --%>
														<input type="hidden" name="boardPromoter_id" value="${updatePmtNtmForm.boardPromoter_id}" />
														<input type="hidden" name="bpHighLight" value="0" /> 
														<input type="hidden" name="bpViewCount" value="0" MaxLength="10" />
														<input type="hidden" name="bpInsertDt" value="${updatePmtNtmForm.bpInsertDt}" />

														<%--높을수록 TOP (추후 반영)_15.08.01 --%>
														<input type="hidden" name="bpOrder" value="0" />
														<%--직원담당자 staff_id 추후 반영예정 --%>
														<input type="hidden" name="staff_id" value="0" />

														<c:set var="bpStatus" value="${updatePmtNtmForm.bpStatus }" />
														<c:if test="${fn:contains(bpStatus, '0')}">
															<span class="pull-right text-danger">
															<strong>삭제</strong>
															</span>
														</c:if>
														<c:if test="${fn:contains(bpStatus, '1')}">
															<span class="pull-right text-primary">
															<strong>임시저장</strong>
															</span>
														</c:if>
														<c:if test="${fn:contains(bpStatus, '2')}">
															<span class="pull-right text-success">
															<strong>게시중 </strong>
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
													<td>${updatePmtNtmForm.boardPromoter_id}</td>
													<td><select name="bpGroup"
														value="${updatePmtNtmForm.bpGroup}">
															<option value="전체">전체</option>
															<option value="휴대폰">휴대폰</option>
															<option value="인터넷">인터넷</option>
															<option value="영어">영어</option>
															<option value="유통">유통</option>
															<option value="SI개발">SI개발</option>
													</select></td>
													<td>${updatePmtNtmForm.bpViewCount}</td>
													<td>${updatePmtNtmForm.bpInsertDt}</td>
													<td>${updatePmtNtmForm.staff_id}</td>
													<td>${updatePmtNtmForm.bpOrder}</td>
												</tr>
											</tbody>
										</table>

										<table class="table table-striped">

											<tr>
												<th class="active">Title</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpTitle"
													value="${updatePmtNtmForm.bpTitle}"></td>
											</tr>



											<tr>
												<th class="active">SubTitle</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpSubTitle"
													value="${updatePmtNtmForm.bpSubTitle}"></td>
											</tr>


											<tr>
												<th class="active">Reference</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpRelatedLink"
													value="${updatePmtNtmForm.bpRelatedLink}"></td>
											</tr>
											
											<tr>
												<th class="active">Keywords</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpKeyword"
													value="${updatePmtNtmForm.bpKeyword}"></td>
											</tr>

											<tr>
												<th class="active">Content</th>
												<td><textarea name="bpContent"
														class="form-control input-sm ckeditor" id="message"
														placeholder="Message" style="width: 100%; height: 200px;">${updatePmtNtmForm.bpContent}</textarea>
													<script type="text/javascript">
															//<![CDATA[
															CKEDITOR
																	.replace('bpContent');
															//]]
														</script> <span class="help-block"></span></td>
											</tr>

										</table>


										<br style="clear: both">
										<p class="pull-right">
											<button type="button" class="btn btn-success"
												onClick="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeList.mwav'">All List</button>
											<button type="button" class="btn btn-warning"
												onClick="javascript:history.go(-1)">BACK</button>


											<button type="button" class="btn btn-primary"
												onclick="check()">Modify</button>
										
										</p>
									</form>
									<iframe src="#" name="iframe" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
								</c:when>
								
								<c:otherwise>
									<form role="form" method="post" name="bpForm"
										action="/admins/promoter/boardmgr/PmtNoticeForm.mwav"
										target="iframe">
										
										<table class="table table-striped">

											<thead>
												<tr>

													<div class="pull-right">
														<%--기본값 --%>
														<input type="hidden" name="boardPromoter_id" /> <input
															type="hidden" name="bpHighLight" value="0" /> <input
															type="hidden" name="bpViewCount" value="0" MaxLength="10" />

														<%--높을수록 TOP (추후 반영)_15.08.01 --%>
														<input type="hidden" name="bpOrder" value="0" />
														<%--직원담당자 staff_id 추후 반영예정 --%>
														<input type="hidden" name="staff_id" value="0" /> 
														<%-- 최초 공지 등록시, 공지 비노출 처리 --%>
														<%-- (추후반영) 공지 등록시 노출여부를 받아 bpStatus 값 입력하기 --%>
														<input type="hidden" name="bpStatus" value="1" />
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
													<td></td>
													<td><select name="bpGroup">
															<option value="전체">전체</option>
															<option value="휴대폰">휴대폰</option>
															<option value="인터넷">인터넷</option>
															<option value="영어">영어</option>
															<option value="유통">유통</option>
															<option value="SI개발">SI개발</option>
													</select></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</tbody>
										</table>

										<table class="table table-striped">

											<tr>
												<th class="active">Title</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpTitle"></td>
											</tr>



											<tr>
												<th class="active">SubTitle</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpSubTitle"></td>
											</tr>

											<tr>
												<th class="active">Reference</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpRelatedLink"></td>
											</tr>
											
											<tr>
												<th class="active">Keywords</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bpKeyword"></td>
											</tr>
											
											<tr>
												<th class="active">Content</th>
												<td><textarea name="bpContent"
														class="form-control input-sm ckeditor" id="message"
														placeholder="Message" style="width: 100%; height: 200px;"></textarea>
													<span class="help-block"></span></td>
											</tr>

										</table>
										<br style="clear: both">
										<p class="pull-right">
											<button type="button" class="btn btn-success"
												onClick="javascript:window.location.href='/admins/promoter/boardmgr/PmtNoticeList.mwav?pageNum=1'">All List</button>
											<button type="button" class="btn btn-warning" onClick="javascript:history.go(-1)">BACK</button>
											<button type="button" class="btn btn-primary"
												onclick="check()">Insert</button>
										</p>
									</form>
									<iframe src="#" name="iframe" style="width:1px; height:1px; border:0; visibility:hidden;"></iframe>
								</c:otherwise>
							</c:choose>
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

