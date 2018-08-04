<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- ////basePackage
<script src="//cdn.ckeditor.com/4.5.11/basic/ckeditor.js"></script>
/////// -->

<!-- StandardPackage 
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>-->

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
					Admins <small> NewsForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>SiteMgr</li>
					<li class="active">NsmForm</li>
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
	/* 	if (document.bnsForm.staff_id.value == "") {
			alert("이름을 입력하십시오.");
			document.bnsForm.staff_id.focus();
			return false;
		}
	
	
		 */
		if (confirm("정말 입력 또는 수정하시겠습니까??") == true){    //확인
			if (document.bnsForm.bnGroup.value == "") {
				alert("분류를 선택하세요.");
				document.bnsForm.bnGroup.focus();
				return false;
			}
			if (document.bnsForm.bnTitle.value == "") {
				alert("제목을 입력하십시요.");
				document.bnsForm.bnTitle.focus();
				return false;
			}
			document.bnsForm.submit();
		}else{   //취소
		    return;
		}
	
	}
</script>


						<!-- Content Column -->
						<div class="table-responsive">

							<c:choose>
								<c:when test="${fn:length(updateNsmForm) > 0}">
									<form role="form" method="post" name="bnsForm"
										action="/admin/boardNews/nsmUpdatePro.mwav">
										<table class="table table-striped">

											<thead>
												<tr>

													<div class="pull-right">
														<%--기본값 --%>
														<input type="hidden" name="bNews_id"
															value="${updateNsmForm.bNews_id}" /> <input
															type="hidden" name="bnHighLight" value="0" /> <input
															type="hidden" name="bnViewCount" value="0" MaxLength="10" />
														<input type="hidden" name="bnInsertDt"
															value="${updateNsmForm.bnInsertDt}" />

														<%--높을수록 TOP (추후 반영)_15.08.01 --%>
														<input type="hidden" name="bnOrder" value="0" />
														<%--직원담당자 staff_id 추후 반영예정 --%>
														<input type="hidden" name="staff_id" value="0" /> 
														
														
														
														<c:set var="bnStatus"
															value="${updateNsmForm.bnStatus }" />
														<c:if test="${fn:contains(bnStatus, '0')}">
															<span class="pull-right text-danger"><strong>삭제
															</strong></span>
														</c:if>
														<c:if test="${fn:contains(bnStatus, '1')}">
															<span class="pull-right text-primary"><strong>임시저장
															</strong></span>
														</c:if>
														<c:if test="${fn:contains(bnStatus, '2')}">
															<span class="pull-right text-success"><strong>게시
																	중 </strong></span>
														</c:if>
														
														<div class="enter"></div>
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
													<td>${updateNsmForm.bNews_id}</td>
													<td><select name="bnGroup"
														value="${updateNsmForm.bnGroup}">
															<option value="전체">전체</option>
															<option value="휴대폰">휴대폰</option>
															<option value="인터넷">인터넷</option>
															<option value="영어">영어</option>
															<option value="유통">유통</option>
															<option value="SI개발">SI개발</option>
															<option value="UX/UI Design">UX/UI Design</option>
													</select></td>
													<td>${updateNsmForm.bnViewCount}</td>
													<td>${updateNsmForm.bnInsertDt}</td>
													<td>${updateNsmForm.staff_id}</td>
													<td>${updateNsmForm.bnOrder}</td>
												</tr>
											</tbody>
										</table>

										<table class="table table-striped">

											<tr>
												<th class="active">Title</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bnTitle"
													value="${updateNsmForm.bnTitle}"></td>
											</tr>



											<tr>
												<th class="active">SubTitle</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bnSubTitle"
													value="${updateNsmForm.bnSubTitle}"></td>
											</tr>

											<tr>
												<th class="active">Reference</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bnRelatedLink"
													value="${updateNsmForm.bnRelatedLink}"></td>
											</tr>
											
											<tr>
												<th class="active">Keywords</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bnKeyword"
													value="${updateNsmForm.bnKeyword}"></td>
											</tr>

											<tr>
												<th class="active">Content</th>
												<td><textarea name="bnContent"
														class="form-control input-sm ckeditor" id="message"
														placeholder="Message" style="width: 100%; height: 200px;">${updateNsmForm.bnContent}</textarea>
													<script type="text/javascript">
															//<![CDATA[
															CKEDITOR
																	.replace('bnContent');
															//]]
														</script> <span class="help-block"></span></td>
											</tr>

										</table>


										<br style="clear: both">
										<p class="pull-right">
											<button type="button" class="btn btn-success"
												onClick="javascript:window.location.href='/admin/boardNews/nsmList.mwav?pageNum=${pageNum}'">All
												List</button>
											<button type="button" class="btn btn-warning"
												onClick="javascript:history.go(-1)">BACK</button>
											<button type="button" class="btn btn-primary"
												onclick="check()">Modify</button>
										</p>
									</form>

								</c:when>
								<c:otherwise>
									<form role="form" method="post" name="bnsForm"
										action="/admin/boardNews/nsmForm.mwav">
										<table class="table table-striped">

											<thead>
												<tr>

													<div class="pull-right">
														<%--기본값 --%>
														<input type="hidden" name="bNews_id" /> <input
															type="hidden" name="bnHighLight" value="0" /> <input
															type="hidden" name="bnViewCount" value="0" MaxLength="10" />

														<%--높을수록 TOP (추후 반영)_15.08.01 --%>
														<input type="hidden" name="bnOrder" value="0" />
														<%--직원담당자 staff_id 추후 반영예정 --%>
														<input type="hidden" name="staff_id" value="0" /> <input
															type="hidden" name="bnStatus" value="0" />
														<%-- 		<select
															class="form-control btn-sm" name="bnStatus"
															value="${updateNsmForm.bnStatus}">
															<option value="0">임시저장상태</option>
															<option value="1">현재공지상태</option>
														</select> --%>
														<div class="enter"></div>
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
													<td><select name="bnGroup">
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
													placeholder="Text input" name="bnTitle"></td>
											</tr>



											<tr>
												<th class="active">SubTitle</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bnSubTitle"></td>
											</tr>


											<tr>
												<th class="active">Reference</th>
												<td><input type="text" class="form-control"
													placeholder="Text input" name="bnRelatedLink"></td>
											</tr>


											<tr>
												<th class="active">Content</th>
												<td><textarea name="bnContent"
														class="form-control input-sm ckeditor" id="message"
														placeholder="Message" style="width: 100%; height: 200px;"></textarea>
													<span class="help-block"></span></td>
											</tr>

										</table>


										<br style="clear: both">
										<p class="pull-right">
											<button type="button" class="btn btn-success"
												onClick="javascript:window.location.href='/admin/boardNews/nsmList.mwav'">All
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

