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
	// ready는 DOM이 완성된 이후에 호출되는 callback 함수
	$(document).ready(function () {
		<c:forEach items="${selectPmtView.pmtSpecialtyNames}" var="spec">
			// JS 에서는 '/' 특수문자를 처리해주어야함
			$('#${spec.pmtSpecialtyName}'.split('/').join('\\/')).attr('checked', true)
										.parent().css('font-weight', 'bold');
		</c:forEach>
		$('input:checkbox').attr('disabled',true);
	});

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

	function pmtLeave() {
		if(confirm("정말로 탈퇴시키겠습니까?")){
			$('#pmtForm').attr('action', '/admins/staff/pmtLeave.mwav').submit();
		}
	}

	function pmtReturn() {
		if(confirm("정말로 탈퇴시키겠습니까?")){
			$('#pmtForm').attr('action', '/admins/staff/pmtReturn.mwav').submit();
		}
	}
</script>

	<style>
		/* 테이블 첫번째 줄 */
		.table > tbody > tr > td:nth-child(1){
			width: 200px;
		}

	</style>
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

						<form id="pmtForm" class='form-horizontal' name="change_record" method="post" action="">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Mwav - Promoter Information</h3>
									</div>
									<div class="panel-body">
										<div class="row">

											<% // Promoter_tbl %>
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
														<div class="panel-body">${selectPmtView.pmtFirstName} ${selectPmtView.pmtLastName}</div>
													</div>
												</div>
											</div>

											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<tbody>
														<tr>
															<td class="info">핸드폰 번호</td>
															<td>${selectPmtView.pmtCellularPhone}</td>
														</tr>
														<tr>
															<td class="info">이메일</td>
															<td>${selectPmtView.pmtMail}</td>
														</tr>
														<tr>
															<td class="info">우편번호</td>
															<td>${selectPmtView.pmtZipcode}</td>
														</tr>
														<tr>
															<td class="info">주소</td>
															<td>${selectPmtView.pmtAddress}</td>
														</tr>
														<tr>
															<td class="info">상세 주소</td>
															<td>${selectPmtView.pmtAddressDetail}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<% // PromoterValue_tbl %>
											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<thead>
														<tr>
															<th colspan="2">Promoter Value</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="info">담당 직원</td>
															<td>${selectPmtView.stfName}</td>
														</tr>
														<tr>
															<td class="info">상위 프로모터</td>
															<td>${selectPmtView.pmtUpperPromoter_id}</td>
														</tr>
														<tr>
															<td class="info">추천인 ID</td>
															<td>${selectPmtView.pmtRcmderId}</td>
														</tr>
														<tr>
															<td class="info">프로모터 등급</td>
															<td>${selectPmtView.pmtLevel}</td>
														</tr>
														<tr>
															<td class="info">방문 유도 수</td>
															<td>${selectPmtView.pmtVisitNbr}</td>
														</tr>
														<tr>
															<td class="info">고객질의</td>
															<td>${selectPmtView.pmtEffects}</td>
														</tr>
														<tr>
															<td class="info">프로모팅 성과(매출)</td>
															<td>${selectPmtView.pmtProfits}</td>
														</tr>
														<tr>
															<td class="info">적용그룹</td>
															<td>${selectPmtView.pmtGdsGroup}</td>
														</tr>
														<tr>
															<td class="info">가입 일</td>
															<td>${selectPmtView.pmtJoinDt}</td>
														</tr>
														<tr>
															<td class="info">수정 일</td>
															<td>${selectPmtView.pmtUpdateDt}</td>
														</tr>
														<tr>
															<td class="info">탈퇴 일</td>
															<td>${selectPmtView.pmtLeaveDt}</td>
														</tr>
														<tr>
															<td class="info">최근 방문 일</td>
															<td>${selectPmtView.pmtRecentLoginDt}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<% // PromoterSpecialty_tbl, TODO : 프로모터 전문분야 수정 필요 %>
											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<thead>
														<tr>
															<th colspan="2">Promoter Specialty</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="info">카테고리</td>
															<td>${selectPmtView.pmtSpecialtyName}</td>
														</tr>
														<tr>
															<td class="info">스페셜티</td>
															<td>${selectPmtView.pmtSpecialtyLevel}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<% // PromoterLicense_tbl %>
											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<thead>
														<tr>
															<th colspan="2">Promoter License</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="info">회사 명</td>
															<td>${selectPmtView.pmtCompany}</td>
														</tr>
														<tr>
															<td class="info">사업자 번호</td>
															<td>${selectPmtView.pmtBizLicenseNo}</td>
														</tr>
														<tr>
															<td class="info">법인등록번호</td>
															<td>${selectPmtView.pmtCorpLicenseNo}</td>
														</tr>
														<tr>
															<td class="info">업태</td>
															<td>${selectPmtView.pmtBizType}</td>
														</tr>
														<tr>
															<td class="info">종목</td>
															<td>${selectPmtView.pmtBizLine}</td>
														</tr>
														<tr>
															<td class="info">회사대표전화번호</td>
															<td>${selectPmtView.pmtBizPhone}</td>
														</tr>
														<tr>
															<td class="info">우편번호</td>
															<td>${selectPmtView.pmtBizZipcode}</td>
														</tr>
														<tr>
															<td class="info">주소</td>
															<td>${selectPmtView.pmtBizAddress}</td>
														</tr>
														<tr>
															<td class="info">상세주소</td>
															<td>${selectPmtView.pmtBizAddressDetail}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<% // PromoterChannel_tbl %>
											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<thead>
														<tr>
															<th colspan="2">Promoter Channel</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="info">채널 타입</td>
															<td>${selectPmtView.pmtChannelType}</td>
														</tr>
														<tr>
															<td class="info">채널 아이디</td>
															<td>${selectPmtView.pmtChannelId}</td>
														</tr>
														<tr>
															<td class="info">채널 명</td>
															<td>${selectPmtView.pmtChannelName}</td>
														</tr>
														<tr>
															<td class="info">채널 설명</td>
															<td>${selectPmtView.pmtChannelDesc}</td>
														</tr>
														<tr>
															<td class="info">채널 URL</td>
															<td>${selectPmtView.pmtChannelURL}</td>
														</tr>
														<tr>
															<td class="info">채널 가입자 수 또는 회원수</td>
															<td>${selectPmtView.pmtChannelMember}</td>
														</tr>
														<tr>
															<td class="info">평균 일 방문자수</td>
															<td>${selectPmtView.pmtChannelDaillyVisit}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<% // PromoterAccount_tbl %>
											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<thead>
														<tr>
															<th colspan="2">Promoter Bank</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="info">은행명</td>
															<td>${selectPmtView.pmtBankName}</td>
														</tr>
														<tr>
															<td class="info">은행 계좌</td>
															<td>${selectPmtView.pmtBankAccount}</td>
														</tr>
														<tr>
															<td class="info">통장사본 이미지 경로</td>
															<td>${selectPmtView.pmtBankbookFileImage}</td>
														</tr>
														<tr>
															<td class="info">계좌정보 입력일</td>
															<td>${selectPmtView.pmtBankInsertedDt}</td>
														</tr>
													</tbody>
												</table>
											</div>

											<% // PromoterSpecialty_tbl %>
											<div class=" col-md-12 col-lg-12 ">
												<table class="table">
													<thead>
														<tr>
															<th colspan="2">Promoter Specialty</th>
														</tr>
													</thead>
													<tbody>
													<tr>
														<td>
															<div class="form-group chk_box_disabled">
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="패션의류/잡화">패션의류/잡화</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="뷰티">뷰티</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="출산/유아동">출산/유아동</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="식품">식품</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="주방용품">주방용품</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="생활용품">생활용품</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="홈인테리어">홈인테리어</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="가전디지털">가전디지털</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="스포츠/레저">스포츠/레저</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="자동차용품">자동차용품</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="도서/음반/DVD">도서/음반/DVD</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="완구/취미">완구/취미</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="문구/오피스">문구/오피스</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="반려동물용품">반려동물용품</label>
																</div>
																<div class="checkbox col-md-3">
																	<label><input type="checkbox" name="pmtSpecialtyName" id="헬스/건강식품">헬스/건강식품</label>
																</div>
															</div>
														</td>
													</tr>
													</tbody>
												</table>
											</div>

											<div class="col-md-12 ">
												<div class="panel panel-info">
													<div class="panel-heading">하고 싶은 말</div>
													<div class="panel-body">${selectPmtView.pmtMark}</div>
												</div>
											</div>

										</div>
										<div class="panel-footer">
											<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/admins/staff/pmtList.mwav'">리스트</button>
											<button type="button" class="btn btn-sm btn-success" onClick="location.href='/admins/staff/pmtUpdateForm.mwav?promoter_id=${selectPmtView.promoter_id}'">수정하기</button>
											<c:choose>
												<c:when test="${empty selectPmtView.pmtLeaveDt}">
													<button type="button" class="btn btn-sm btn-danger" onClick="pmtLeave()">탈퇴 시키기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-sm btn-info" onClick="pmtReturn()">복귀 시키기</button>
												</c:otherwise>
											</c:choose>
											<input type="hidden" id="promoter_id" name="promoter_id" value="${selectPmtView.promoter_id}">
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

