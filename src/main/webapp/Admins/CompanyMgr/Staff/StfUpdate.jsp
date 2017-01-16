<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->

</head>

<body>
	<!-- FrontHeader
	Company의 마스터 페이지 상에서 Header 
	1. 마스터 헤더 한번 변경해보기 ~!!! container 안으로
	 -->
	<!--  //////////////////////////////////// -->
	<div class="container">
		<!--  //////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
		<!--  //////////////////////////////////// -->
		<!-- Image Container 
container 가 아닌 row로 하는 경우는 전체 영역 다 차지한다. 
-->
		<div class="row">
			<div class="col-lg-12">
				<img src="/Company/zImage/Company_IN(height_280).jpg"
					class="img-responsive res_width" alt="Responsive image">
			</div>
		</div>
	</div>
	<!--  //////////////////////////////////// 
	Header 끝
	-->


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> StfForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>CompanyMgr</li>
					<li class="active">StfForm</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<jsp:include page="/Admins/AdminsLeftMenu.jsp" flush="false" />
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">StaffForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<!-- <div class="col-md-12">
		<A href="/CWS/CommonApps/Member/MbrShipForm.jsp">Edit Profile</A> <A
			href="/member/Logout.mwav">Logout</A> <br>
		<p class=" text-info">May 05,2014,03:00 pm</p>
	</div> -->

						<form class='form-horizontal' name="change_record" method="post"
							action="/admins/staff/stfForm.mwav">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Mwav - Staff Modify</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-md-3 col-lg-3 " align="center">
												<img alt="User Pic"
													src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
													class="img-circle">
											</div>


											<div class=" col-md-9 col-lg-9 ">
												<table class="table table-user-information">
													<tbody>
														<tr>
															<td>아이디:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<input class='form-control' name="stfLoginId"
																			type='text' maxlength="15" value="" required>
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>비밀번호:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<input class='form-control' name="stfLoginPw"
																			type='password' required>
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>사번:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<input class="form-control" name="stfNumber"
																			type="text"
																			onClick="numberCheck(this.form.stfNumber.value)"
																			required />


																	</div>
																</div></td>
														</tr>
														<tr>
															<td>본사:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<select class='form-control' name="stfBranch" required>
																			<option value="본사">본사</option>
																			<option value="지사">지사</option>
																		</select>
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>부서명:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<select class="form-control" name="stfDeptName"
																			required>
																			<option value="CEOs">CEOs</option>
																			<option value="관리">관리</option>
																			<option value="영업">영업</option>
																			<option value="총무">총무</option>
																			<option value="경리">경리</option>
																			<option value="고객지원">고객지원</option>
																			<option value="기획/개발">기획/개발</option>
																			<option value="마켓팅/영업">마켓팅/영업</option>
																			<option value="온라인프로모터">온라인프로모터</option>
																			<option value="임시">임시</option>
																		</select>
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>직급/권한:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<select class="form-control" name="stfClass" required>
																			<option value="0">*대기*</option>
																			<option value="05">임시</option>
																			<option value="10">사원</option>
																			<option value="15">주임</option>
																			<option value="20">계장</option>
																			<option value="25">대리</option>
																			<option value="30">실장</option>
																			<option value="35">팀장</option>
																			<option value="40">과장</option>
																			<option value="45">차장</option>
																			<option value="50">부부장</option>
																			<option value="55">부장</option>
																			<option value="60">소장</option>
																			<option value="65">이사</option>
																			<option value="70">상무이사</option>
																			<option value="75">전무이사</option>
																			<option value="80">대표이사</option>
																			<option value="85">회장</option>
																		</select>
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>직원명:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfName" type="text"
																			maxlength="20" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>닉네임:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfNickname"
																			type="text" maxlength="20" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>회사 내선번호 Ext#:</td>
															<td><div class='form-group'>
																	<div class='col-md-5'>
																		<input class="form-control" name="stfExtNbr"
																			type="text" maxlength="5" />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>자택전화:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfPhone_1"
																			type="text" maxlength="4" required /> - <input
																			class="form-control" name="stfPhone_2" type="text"
																			maxlength="4" required /> - <input
																			class="form-control" name="stfPhone_3" type="text"
																			maxlength="4" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>핸드폰번호:</td>
															<td><div class='form-group'>
																	<div class='col-md-3'>
																		<input class="form-control" name="stfCellularP_1"
																			type="text" maxlength="4" required />
																	</div>

																	<div class="col-md-3">
																		<input class="form-control" name="stfCellularP_2"
																			type="text" maxlength="4" required />
																	</div>

																	<div class='col-md-3'>
																		<input class="form-control" name="stfCellularP_3"
																			type="text" maxlength="4" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>이메일:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfEmail"
																			type="text" maxlength="50" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>홈페이지:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfHomepage"
																			type="text" placeholder="http:// " />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>주민등록번호:</td>
															<td><div class='form-group'>
																	<div class='col-md-4'>
																		<input class="form-control" name="stfSsn1" type="text"
																			maxlength="6" />
																	</div>
																	<div class='col-md-4'>
																		<input class="form-control" name="stfSsn2" type="text"
																			maxlength="7" />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>등록일:</td>
															<td></td>
														</tr>
														<tr>
															<td>입사일:</td>
															<td></td>
														</tr>
														<tr>
															<td>부업무:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfSubJobs"
																			type="text" maxlength="200" />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>우편번호:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfZipcode"
																			type="text" maxlength="6" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td>주소:</td>
															<td><div class='form-group'>
																	<div class='col-md-3'>
																		<input class="form-control" name="stfAddress_1"
																			type="text" required />
																	</div>
																	<div class='col-md-3'>
																		<input class="form-control" name="stfAddress_2"
																			type="text" required />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td class="active">직원명함데이터:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfBusinessPic"
																			type="file" />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td class="active">아바타:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="stfAvataImage"
																			type="file" />
																	</div>
																</div></td>
														</tr>
														<tr class="info">
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-md-12 ">
												<div class='col-md-12 form-group center-block'>
													<textarea class="form-control" class="stfMark" rows="15"></textarea>
												</div>

											</div>
										</div>
										<div class="panel-footer">

											<button type="button" class="btn btn-sm btn-primary"
												onclick="javascript:window.location.href='/HomePage/S_List.mwav'">
												리스트</button>

											<button type="button" class="btn btn-sm btn-primary"
												onClick="javascript:history.go(-1)">뒤로가기</button>

											<button type="submit" class="btn btn-sm btn-primary">가입하기
											</button>

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

