<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
<script>
	function numberCheck(temp)

	{

		var temp = temp;
		var num = parseInt(temp);
		if (!(10000 <= num && num <= 20030222)) {

			alert("입력된 값 : " + temp + " 잘못입력했습니다. (10000-20030222)");
			document.stfForm.stfNumber.focus();

		} else {

			alert("입력된 값 : " + temp + " 제대로 입력했습니다.");

		}
	}
</script>
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
					Admins <small> PmtView</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>CompanyMgr</li>
					<li class="active">PmtView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%--http://egloos.zum.com/tiger5net/v/5828786 --%>
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
					<h2 class="page-header">PromoterView</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<form class='form-horizontal' name="change_record" method="post" action="/admins/staff/stf.mwav">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Mwav - Staff Information</h3>
									</div>
									<div class="panel-body">
										<div class="row">

											<div class="enter"></div>
											<div class="col-md-12 text-center">
												<div class="col-sm-4 col-md-4">
													<div class="panel panel-info">
														<div class="panel-heading">사번</div>
														<div class="panel-body">${selectPmtView.promoter_id}</div>
													</div>
												</div>
												<div class="col-sm-4 col-md-4">
													<div class="panel panel-info">
														<div class="panel-heading">아이디</div>
														<div class="panel-body">${selectPmtView.pmtLoginId}</div>
													</div>
												</div>
												<div class="col-sm-4 col-md-4">
													<div class="panel panel-info">
														<div class="panel-heading">직원명</div>
														<div class="panel-body">${selectPmtView.pmtName}</div>
													</div>
												</div>
											</div>

											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<tbody>

														<tr>
															<td class="info">자택전화:</td>
															<td>${selectPmtView.pmtPhone}</td>
														</tr>
														<tr>
															<td class="info">핸드폰번호:</td>
															<td>${selectPmtView.pmtCellularPhone}</td>
														</tr>
														<tr>
															<td class="info">이메일:</td>
															<td>${selectPmtView.pmtMail}</td>
														</tr>
														<tr>
															<td class="info">우편번호:</td>
															<td>${selectPmtView.pmtZipcode}</td>
														</tr>
														<tr>
															<td class="info">주소:</td>
															<td>${selectPmtView.pmtAddress}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<div class="col-md-12 ">
												<div class="panel panel-info">
													<div class="panel-heading">기타</div>
													<div class="panel-body">${selectPmtView.pmtMark}</div>
												</div>
											</div>

										</div>
										<div class="panel-footer">
											<button type="button" class="btn btn-sm btn-primary" onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">리스트</button>
											<button type="button" class="btn btn-sm btn-primary" onClick="/admins/staff/pmtUpdate.mwav?staff_id=${selectPmtView.promoter_id}">수정하기</button>
											<button type="submit" class="btn btn-sm btn-primary">탈퇴하기</button>
											<input type="hidden" name="promoter_id" value="${selectPmtView.promoter_id}">
										</div>

									</div>
								</div>
							</div>
						</form>
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

