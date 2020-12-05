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
	<%--mwav는 container 영역만 쓰기때문에 그랬으나 이건 전체 쓴다. 그러므로 container로 감싸면 안된다.  --%>
	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> NoticeForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>SiteMgr</li>
					<li class="active">NtmForm</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%-- 
			- param으로 같은 이름 지정시 위의 named으로 인식
			- getparameter는 param.mm // setattribute는 mm
			- value에 두개다 넣는 경우 비즈니스로직 + 파라미터인경우 문제발생
			- jsp param 안에 choose, when, otherwise 사용 불가
			 --%>
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
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">NsmForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<%--================================================시작========================================================== --%>

						<script>
	function check() {
	/* 	if (document.buForm.staff_id.value == "") {
			alert("이름을 입력하십시오.");
			document.buForm.staff_id.focus();
			return false;
		}
	
	
		 */
		if (confirm("정말 입력 또는 수정하시겠습니까??") == true){    //확인
			if (document.buForm.buGroup.value == "") {
				alert("분류를 선택하세요.");
				document.buForm.buGroup.focus();
				return false;
			}
			if (document.buForm.buTitle.value == "") {
				alert("제목을 입력하십시요.");
				document.buForm.buTitle.focus();
				return false;
			}
			document.buForm.submit();
		}else{   //취소
		    return;
		}
	
	}
</script>
						<!-- Content Column -->
						<div class="table-responsive">
							<c:choose>
								<c:when test="${fn:length(updateNtmForm) > 0}">
									<form role="form" method="post" name="buForm"
										action="/admin/boardNotice/ntmUpdatePro.mwav">
										<table class="table table-striped">

											<thead>
												<tr>

													<div class="pull-right">
														<%--기본값 --%>
														<input type="hidden" name="boardUser_id"
															value="${updateNtmForm.boardUser_id}" /> <input
															type="hidden" name="buHighLight" value="0" /> <input
															type="hidden" name="buViewCount" value="0" MaxLength="10" />
														<input type="hidden" name="buInsertDt"
															value="${updateNtmForm.buInsertDt}" />

														<%--높을수록 TOP (추후 반영)_15.08.01 --%>
														<input type="hidden" name="buOrder" value="0" />
														<%--직원담당자 staff_id 추후 반영예정 --%>
														<input type="hidden" name="staff_id" value="0" />

														<c:set var="buStatus" value="${updateNtmForm.buStatus }" />
														<c:if test="${fn:contains(buStatus, '0')}">
															<span class="pull-right text-danger"><strong>삭제
															</strong></span>
														</c:if>
														<c:if test="${fn:contains(buStatus, '1')}">
															<span class="pull-right text-primary"><strong>임시저장
															</strong></span>
														</c:if>
														<c:if test="${fn:contains(buStatus, '2')}">
															<span class="pull-right text-success"><strong>게시
																	중 </strong></span>
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
													<td>${updateNtmForm.boardUser_id}</td>
													<td><select name="buGroup"
														value="${updateNtmForm.buGroup}">
															<option value="전체">전체</option>
															<option value="휴대폰">휴대폰</option>
															<option value="인터넷">인터넷</option>
															<option value="영어">영어</option>
															<option value="유통">유통</option>
															<option value="SI개발">SI개발</option>
													</select></td>
													<td>${updateNtmForm.buViewCount}</td>
													<td>${updateNtmForm.buInsertDt}</td>
													<td>${updateNtmForm.staff_id}</td>
													<td>${updateNtmForm.buOrder}</td>
												</tr>
											</tbody>
										</table>

										<table class="table table-striped">

											<tr>
												<th class="active">Title</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buTitle"
													value="${updateNtmForm.buTitle}"></td>
											</tr>



											<tr>
												<th class="active">SubTitle</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buSubTitle"
													value="${updateNtmForm.buSubTitle}"></td>
											</tr>


											<tr>
												<th class="active">Reference</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buRelatedLink"
													value="${updateNtmForm.buRelatedLink}"></td>
											</tr>
											
											<tr>
												<th class="active">Keywords</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buKeyword"
													value="${updateNtmForm.buKeyword}"></td>
											</tr>

											<tr>
												<th class="active">Content</th>
												<td><textarea name="buContent"
														class="form-control input-sm ckeditor" id="message"
														placeholder="Message" style="width: 100%; height: 200px;">${updateNtmForm.buContent}</textarea>
													<script type="text/javascript">
															//<![CDATA[
															CKEDITOR
																	.replace('buContent');
															//]]
														</script> <span class="help-block"></span></td>
											</tr>

										</table>


										<br style="clear: both">
										<p class="pull-right">
											<button type="button" class="btn btn-success"
												onClick="javascript:window.location.href='/admin/boardNotice/ntmList.mwav'">All
												List</button>
											<button type="button" class="btn btn-warning"
												onClick="javascript:history.go(-1)">BACK</button>


											<button type="button" class="btn btn-primary"
												onclick="check()">Modify</button>
										</p>
									</form>

								</c:when>
								<c:otherwise>
									<form role="form" method="post" name="buForm"
										action="/admin/boardNotice/ntmForm.mwav">
										<table class="table table-striped">

											<thead>
												<tr>

													<div class="pull-right">
														<%--기본값 --%>
														<input type="hidden" name="boardUser_id" /> <input
															type="hidden" name="buHighLight" value="0" /> <input
															type="hidden" name="buViewCount" value="0" MaxLength="10" />

														<%--높을수록 TOP (추후 반영)_15.08.01 --%>
														<input type="hidden" name="buOrder" value="0" />
														<%--직원담당자 staff_id 추후 반영예정 --%>
														<input type="hidden" name="staff_id" value="0" /> <input
															type="hidden" name="buStatus" value="0" />
														<%-- 		<select
															class="form-control btn-sm" name="bnStatus"
															value="${updateNsmForm.bnStatus}">
															<option value="0">임시저장상태</option>
															<option value="1">현재공지상태</option>
														</select> --%>

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
													<td><select name="buGroup">
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
													placeholder="Text input" name="buTitle"></td>
											</tr>



											<tr>
												<th class="active">SubTitle</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buSubTitle"></td>
											</tr>

											<tr>
												<th class="active">Reference</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buRelatedLink"></td>
											</tr>
											
											<tr>
												<th class="active">Keywords</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="buKeyword"></td>
											</tr>
											
											<tr>
												<th class="active">Content</th>
												<td><textarea name="buContent"
														class="form-control input-sm ckeditor" id="message"
														placeholder="Message" style="width: 100%; height: 200px;"></textarea>
													<span class="help-block"></span></td>
											</tr>

										</table>
										<br style="clear: both">
										<p class="pull-right">
											<button type="button" class="btn btn-success"
												onClick="javascript:window.location.href='/boardNotice/buList.mwav?pageNum=${i}'">All
												List</button>
											<button type="button" class="btn btn-warning"
												onClick="javascript:history.go(-1)">BACK</button>
											<button type="button" class="btn btn-primary"
												onclick="check()">Insert</button>
										</p>
									</form>
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

