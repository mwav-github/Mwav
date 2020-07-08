<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
<script>
var xhr;
	function createXhr() {
		if (window.ActiveXObject) { // IE 이전버전
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xhr = new XMLHttpRequest();
		}
	}

	//아이디 중복 체크
	function idcheck() {
		// #idcheckLayer 하위의 요소를 제거
		$('#idcheckLayer').empty();

		var id = $('#chkLoginId').val();
		var input_object = $("#chkLoginId");

		// ID값 유효성 검증 (경고창 및 포커싱도 여기서 이루어짐)
		var flagPolicy = chkLoginPolicy(id,input_object);
		if(!flagPolicy){
			$('#idcheckLayer').append("<div class='alert alert-danger text-left'><strong>" +
					"1. 4 ~ 20 자 사이의 문자길이 <br> 2. 첫 문자는 영어로 시작 <br> 3. 특수문자 사용금지 (제외문자: . _ -) <br>" +
					" 4. 공백문자 사용금지  <br> 5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음</strong></div>");
			return false;
		}

		// ID값이 유효하다면 아이디 중복체크
		// flagPolicy 의 값이 ajax로 결정 되기 때문에 동기화를 시켜줌 -> async : false
		if(flagPolicy){
			$.ajax({
				url:'/admins/staff/pmtLoginIdCheck.mwav',
				type:'POST',
				async: false,
				data:{
					'pmtLoginId':id
				},
				dataType:'text',
				success: function(obj){
					// 중복여부에 따라 안내 박스 추가
					if(obj === 'true'){
						$('#idcheckLayer').append("<div class='alert alert-success text-left'><strong>사용할 수 있는 ID 입니다.</strong></div>");
						flagPolicy = true;
					}else{
						$('#idcheckLayer').append("<div class='alert alert-danger text-left'><strong>이미 등록된 ID 입니다. 다시 입력해주세요.</strong></div>");
						flagPolicy = false;
					}
				},
				error: function(err){
					alert('일시적인 서버 오류입니다.');
				}
			})
		}
		return flagPolicy;
	}

	// 최종 회원가입 유효성 검증
	function msubmit() {

		if(	idcheck() &&																		// 아이디 검증
			chkPWPolicy($('#chkLoginPW').val(), $('#chkLoginPW')) &&							// 비밀번호 검증
			chkEmailPolicy($('#chkEmail').val(), $('#chkEmail')) &&								// 이메일 검증

			thisEmptyCheck($('#pmtNameChk'), '이름은 필수로 입력하셔야합니다.') &&				// 이름 검사
			phoneCheck($('#pmtCellularPhone'), '핸드폰 번호가 공백이거나 유효하지 않은 번호입니다.') &&			// 핸드폰 검증

			thisEmptyCheck($('#pmtBankName'), '은행 명은 필수로 입력하셔야합니다.') &&			// 은행명 검증
			thisEmptyCheck($('#pmtBankAccount'), '계좌번호는 필수로 입력하셔야합니다.') &&		// 계좌번호 검증

			thisEmptyCheck($('#pmtChannelId'), '채널 아이디는 필수로 입력하셔야합니다.') &&		// 채널아이디 검증
			thisEmptyCheck($('#pmtChannelName'), '채널 명은 필수로 입력하셔야합니다.') &&			// 채널명 검증
			thisEmptyCheck($('#pmtChannelURL'), '채널 URL은 필수로 입력하셔야합니다.') &&			// 채널URL 검증
			thisEmptyCheck($('#pmtChannelDesc'), '채널 설명은 필수로 입력하셔야합니다.') &&		// 채널설명 검증

			thisEmptyCheck($('#pmtCompany'), '회사 명은 필수로 입력하셔야합니다.') &&				// 회사 명 검증
			thisEmptyCheck($('#pmtBizLicenseNo'), '사업자 번호는 필수로 입력하셔야합니다.') &&	// 사업자 번호 검증
			thisEmptyCheck($('#pmtBizType'), '업태는 필수로 입력하셔야합니다.') &&				// 업태 검증

			confirm("회원가입을 완료하겠습니까?"))												// 최종 검사
		{
			$('#formId').submit();
		} else {
			return false;
		}

	}

	// validate.js 에서 emptyCheck를 가져옴
	function thisEmptyCheck(checkObject, alert_txt_) {
		var checkVar = checkObject.val();
		var alert_txt = alert_txt_;

		if(checkVar == "" || checkVar == null || checkVar == undefined || ( checkVar != null && typeof checkVar == "object" && !Object.keys(checkVar).length ) ){
			alert(alert_txt);
			checkObject.value = "";
			checkObject.focus();
			return false;
		} else{
			return true;
		}
		return false;
	}

	function phoneCheck(obj, msg) {
		var nameObj = obj.target || obj;

		// MbrInput.jsp 의 핸드폰번호 유효성 검증 함수를 가져옴
		var result = /^\d{3}-\d{3,4}-\d{4}$/g.test(nameObj.val())
				|| /^\d{10,11}$/g.test(nameObj.val());

		if (!result) {
			alert(msg);
			obj.focus();
		}
		return result;
	}

</script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>

	<style>
		.form_td{
			width: 15%;
		}

		.required_Input{
			font-weight: bold;
		}

		.fix_textarea{
			resize: none;
		}

		.form_mg_b > div{
			margin-bottom: 15px;
		}

		.required_Input_star{
			color: red;
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
					Admins <small> PmtForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>CompanyMgr</li>
					<li class="active">PmtForm</li>
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
					<h2 class="page-header">PromoterForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<%-- 1. 회원정보 입력 --%>
						<form id='formId' class='form-horizontal' method="post" action="/admins/staff/pmtForm.mwav">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">Mwav - Promoter Registration</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class=" col-md-12 col-lg-12 ">
												<table class="table table-user-information">
													<tbody>
														<!-- 프로모터 정보 -->
														<tr>
															<td class="required_Input form_td">아이디
																<span class="required_Input_star">*</span>
																:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<input class='form-control' name="pmtLoginId" id="chkLoginId" type='text' maxlength="15" onchange="idcheck()" required />
															<br>

														<span class="col-md-12" id="idcheckLayer"></span>

																	</div>
																						<a data-toggle="popover"
																			data-placement="bottom" data-html="true" title="MemberId Rules"
																							data-content="
																		1. 4 ~ 20 자 사이의 문자길이  <br/>
																		2. 첫 문자는 영어로 시작  <br/>
																		3. 특수문자 사용금지 (제외문자: . _ -) <br/>
																		4. 공백문자 사용금지  <br/>
																		5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음">

																			<span class="glyphicon glyphicon-question-sign fa-lg text-muted">
																		</span>
																		</a>
																</div>
															</td>
														</tr>

														<tr>
															<td class="required_Input form_td">비밀번호
																<span class="required_Input_star">*</span>
																:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>

																		<input class='form-control' name="pmtLoginPw"
																			id="chkLoginPW" type='password'
																			onchange="chkPWPolicy(this.value, this)" required>
																	</div>
													<a data-toggle="popover" data-placement="bottom" data-html="true" title="Password Rules"
																				data-content="
												1. 8~255자 사이의 문자길이  <br/>
												2. 영문, 숫자, 특수문자로 구성 <br/>
												3. 특수문자 한 개 이상 꼭 포함 <br/>
												4. 공백문자 사용금지  <br/>
												5. 영문 대문자와 소문자의 구분 ">

																				<span class="glyphicon glyphicon-question-sign fa-lg text-muted"></span>
																			</a>
																</div>
															</td>
														</tr>
														<tr>
															<td class="required_Input form_td">이름
																<span class="required_Input_star">*</span>
																:</td>
															<td>
																<div class='form-group'>
																	<div class='col-md-8'>
																		<input type="text" id="pmtNameChk" class='form-control' name="pmtName" maxlength="20" required>
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td class="required_Input form_td">성별
																<span class="required_Input_star">*</span>
																:</td>
															<td>
																<div class='form-group'>
																	<div class='col-md-4'>
																		<label for="pmtGenderMan">남</label> <input id="pmtGenderMan" name="pmtGender" type="radio" value="남성" checked />
																	</div>
																	<div class='col-md-4'>
																		<label for="pmtGenderWoman">여</label> <input id="pmtGenderWoman" name="pmtGender" type="radio" value="여성" />
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td class="form_td">닉네임:</td>
															<td>
																<div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="pmtNickname" type="text" maxlength="20" required />
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td class="required_Input form_td">핸드폰번호
																<span class="required_Input_star">*</span>
																:</td>
															<td>
																<div class='form-group'>
																	<div class='col-md-8'>
																		<input id='pmtCellularPhone' class="form-control" name="pmtCellularPhone" type="text" placeholder="예) 010-1234-5678" value="" required />
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td class="required_Input form_td">이메일
																<span class="required_Input_star">*</span>
																:</td>
															<td>
																<div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" name="pmtMail" id="chkEmail" type="text"
																			onchange="chkEmailPolicy(this.value, this)" required />
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td class="form_td">우편번호:</td>
															<td><div class='form-group'>
																	<div class='col-md-8'>
																		<input class="form-control" id="Zipcode"
																			name="pmtZipcode" type="text" maxlength="6"
																			value="" readonly="readonly" />
																	</div>
																</div></td>
														</tr>
														<tr>
															<td class="form_td">주소:</td>
															<td>

																<div class='form-group form_mg_b'>

																	<p class="col-md-3 pull-right">
																		<button class="btn btn-primary btn-block"
																			type="button" data-toggle="modal"
																			data-target=".modal_post" onclick="showhide();">주소찾기</button>

																	</p>
																	<div class='col-md-8'>
																		<input class="form-control" id="Address" name="pmtAddress" type="text" value=""
																			placeholder='주소' readonly="readonly" />
																	</div>
																	<div class='col-md-8'>
																		<input class="form-control" name="pmtAddressDetail" id='rest_Address'type="text"
																			   placeholder='나머지 주소' required />
																	</div>
																</div>
															</td>
														</tr>

														<!-- 담당 직원 -->
														<tr>
															<td class="form_td">담당 직원</td>
															<td>
																<div class='form-group'>
																	<p class="col-md-3 pull-right">
																		<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#stf_modal_post" onclick="stfModalInputId('staff_id', 'staff_nm');">담당 직원 선택</button>
																	</p>
																	<div class='col-md-8'>
																		<input class="form-control" id="staff_nm" name="staff_nm" type="text" maxlength="6" value="" readonly="readonly" />
																		<input type='hidden' id="staff_id" name='staff_id'/>
																	</div>
																</div>
															</td>
														</tr>

														<!-- 계좌정보 -->
														<tr>
															<td class="required_Input form_td">계좌정보 : </td>
															<td>
																<div class="form-group form_mg_b">
																	<div class='col-md-5'>
																		<lable class="required_Input">은행명
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtBankName" name="pmtBankName" type="text" placeholder='은행명'/>
																	</div>
																	<br>
																	<div class='col-md-8'>
																		<lable class="required_Input">계좌번호
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtBankAccount" name="pmtBankAccount" type="text" placeholder='계좌번호'/>
																	</div>
																	<% // TODO : 프로모터의 통장사본이미지 등록 구현 %>
																</div>
															</td>
														</tr>

														<!-- 판매채널 -->
														<tr>
															<td class="required_Input form_td">판매채널 : </td>
															<td>
																<div class="form-group form_mg_b">
																	<div class='col-md-7'>
																		<lable class="required_Input">채널 아이디
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtChannelId" name="pmtChannelId" type="text" placeholder='채널 아이디'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="required_Input">채널 명
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtChannelName" name="pmtChannelName" type="text" placeholder='채널 명'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="required_Input">채널 URL
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtChannelURL" name="pmtChannelURL" type="text" placeholder='채널 URL'/>
																	</div>
																	<div class='col-md-10'>
																		<lable class="required_Input">채널 설명
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<textarea class="form-control fix_textarea" id="pmtChannelDesc" name="pmtChannelDesc" rows="5" placeholder='채널 설명'></textarea>
																	</div>
																</div>
															</td>
														</tr>

														<!-- 사업자등록정보 -->
														<tr>
															<td class="form_td">사업자등록정보:</td>
															<td>
																<div class="form-group form_mg_b">
																	<div class='col-md-7'>
																		<lable class="required_Input">회사 명
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtCompany" name="pmtCompany" type="text" placeholder='회사 명'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="required_Input">사업자 번호
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtBizLicenseNo" name="pmtBizLicenseNo" type="text" placeholder='사업자 번호'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="required_Input">업태
																			<span class="required_Input_star">*</span>
																			:</lable>
																		<input class="form-control" id="pmtBizType" name="pmtBizType" type="text" placeholder='업태'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="">종목:</lable>
																		<input class="form-control" id="pmtBizLine" name="pmtBizLine" type="text" placeholder='종목'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="">법인등록번호:</lable>
																		<input class="form-control" id="pmtCorpLicenseNo" name="pmtCorpLicenseNo" type="text" placeholder='법인등록번호'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="">회사대표전화번호:</lable>
																		<input class="form-control" id="pmtBizPhone" name="pmtBizPhone" type="text" placeholder='회사대표전화번호'/>
																	</div>
																	<div class='col-md-7'>
																		<lable class="">사업자 등록 주소:</lable>
																		<input class="form-control" id="pmtBizZipcode" name="pmtBizZipcode" type="text" maxlength="6" readonly="readonly" placeholder='우편번호'/>
																	</div>
																	<div class='col-md-12'>
																		<p class="col-md-3 pull-right">
																			<button class="btn btn-primary btn-block"
																					type="button" data-toggle="modal"
																					data-target=".modal_post" onclick="showhideAnother('pmtBizAddress', 'pmtBizZipcode');">주소찾기</button>
																		</p>
																		<div class='col-md-7' style="padding-left: 0; margin-bottom: 10px;">
																			<input class="form-control" id="pmtBizAddress" name="pmtBizAddress" type="text" value=""
																				   placeholder='주소' readonly="readonly" />
																		</div>
																		<div class='col-md-7' style="padding-left: 0;">
																			<input class="form-control" id='pmtBizAddressDetail'name="pmtBizAddressDetail" type="text"
																				   placeholder='나머지 주소' required />
																		</div>
																	</div>
																</div>
															</td>
														</tr>

														<!-- 프로모터 전문 분야 -->
														<tr>
															<td class="form_td">전문분야:</td>
															<td>
																<div class="form-group">
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="패션의류/잡화">패션의류/잡화</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="뷰티">뷰티</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="출산/유아동">출산/유아동</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="식품">식품</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="주방용품">주방용품</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="생활용품">생활용품</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="홈인테리어">홈인테리어</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="가전디지털">가전디지털</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="스포츠/레저">스포츠/레저</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="자동차용품">자동차용품</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="도서/음반/DVD">도서/음반/DVD</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="완구/취미">완구/취미</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="문구/오피스">문구/오피스</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="반려동물용품">반려동물용품</label>
																	</div>
																	<div class="checkbox col-md-3">
																		<label><input type="checkbox" name="pmtSpecialtyName" value="헬스/건강식품">헬스/건강식품</label>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-md-12 ">
												<span class="col-md-2">하고 싶은 말</span>
												<div class='col-md-10 form-group center-block'>
													<textarea class="form-control fix_textarea" name="pmtMark" class="stfMark" rows="15" placeholder="가입되신것을 환영합니다."></textarea>
												</div>

											</div>
										</div>
										<div class="panel-footer">
											<button type="button" class="btn btn-sm btn-primary" onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">리스트</button>
											<button type="button" class="btn btn-sm btn-primary" onClick="javascript:history.go(-1)">뒤로가기</button>
											<button onclick="msubmit()" type="button" class="btn btn-sm btn-primary">가입하기</button>
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


	<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
	<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />

	<%-- 직원 찾기 모달 --%>
	<jsp:include page="/CommonApps/Staff/StaffSeek.jsp" flush="false" />
	
	<%-- <!-- --> 주석처리해도 include는 된다.  --%>
	<jsp:include page="/Admins/Goods/GdsUpLoader.jsp" flush="false" />
 

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

