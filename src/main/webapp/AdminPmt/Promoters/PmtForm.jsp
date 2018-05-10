<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="net.promoter.vo.Promoter_VO"%>


<script>
var result = '${msg}';

if (result == '1') 	alert("서버에서 눌 값을 발견했습니다.");
else if(result == '2')	alert("서버에서 이름을 발견하지 못했습니다.");
else if(result =='3') alert("결혼값이 비어있습니다.");


var xhr;
	function createXhr() {
		if (window.ActiveXObject) { // IE 이전버전
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xhr = new XMLHttpRequest();
		}
	}

	function idcheck(id) {
		var idValue = document.getElementsId(id)[0].value;
		alert(idValue);
		<%--var id = document.getElementsByName("mbrLoginId")[0].value;
		//alert(id);
		//var html_object = document.getElementsByName("mbrLoginId");
		//위에로 하면 HTMLCollection로 나오며 이는  리턴 결과가 복수인 경우에 사용하게 되는 객체다
		// 아래는 HTML INPUTELEMENT? 하나 !
		//유효성 체크  후 ajax --%>
		var input_object = document.getElementById(id);

		var flagPolicy = chkLoginPolicy(idValue,input_object);

		var queryString = "pmtLoginId=" + idValue;
		if (id.length < 6) {
			document.getElementById("idcheckLayer").innerHTML = "<font color=red>6자리 이상 입력하세요.</font>";
		}
		else if (flagPolicy == true){
			<%-- 1. XMLHttpReqeust 객체 생성 --%>
			createXhr();
			<%-- 2. 이벤트 핸들러 등록 --%>
			if(id="chkUpperPromo_id") xhr.onreadystatechange = callback2;
			else xhr.onreadystatechange = callback;
			<%-- callback 함수를 등록
			// 3. open()를 통해 요청관련 설정을 설정 --%>
			xhr.open("POST", "/promoter/pmtLoginIdCheck.mwav", true);
			<%-- 4. Header에 contentType 지정 - post --%>
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			<%-- 5. send()를 통해 요청 // 요청 쿼리를 보내준다. --%>
			xhr.send(queryString);
		}


	}





	function callback() {
		if (xhr.readyState == 4) { // 응답을 다 받은 경우
			if (xhr.status == 200) { // 응답코드가 200인 경우 - 정상인 경우
				var resTxt1 = xhr.responseText; // 서버가 보낸 응답 text
				//console.log(resTxt);
				var resTxt = resTxt1.trim(); // 공백제거 안하면 같은게 안됨
				var imsiresTxt = "<div class='alert alert-success text-left'><strong>사용할 수 있는 ID 입니다.</strong></div>";
				//alert(resTxt);
				//alert(imsiresTxt);
				if (resTxt == imsiresTxt) {
					//아이디 중복되지 않음
					//alert('1');
					document.getElementById("idcheckLayer").innerHTML = resTxt;

				} else {
					//아이디 중복
					//alert('11');
					document.getElementById("idcheckLayer").innerHTML = resTxt;

					$('input[name="mbrLoginId"]').val('');
					$('input[name="mbrLoginId"]').focus();
					return false;
				}
			} else {
				alert("요청 처리가 정상적으로 되지 않았습니다.\n" + xhr.status);
			}
		}
	}

	function callback2() {
		if (xhr.readyState == 4) { // 응답을 다 받은 경우
			if (xhr.status == 200) { // 응답코드가 200인 경우 - 정상인 경우
				var resTxt1 = xhr.responseText; // 서버가 보낸 응답 text
				//console.log(resTxt);
				var resTxt = resTxt1.trim(); // 공백제거 안하면 같은게 안됨
				var imsiresTxt = "<div class='alert alert-success text-left'><strong>사용할 수 있는 ID 입니다.</strong></div>";
				//alert(resTxt);
				//alert(imsiresTxt);
				if (resTxt == imsiresTxt) {
					//아이디 중복되지 않음
					//alert('1');
					alert("추천인 아이디를 찾을 수가 없습니다.");

				} else {
					//아이디 중복
					//alert('11');
					alert("해당 추천인을 찾았습니다.");

					$('input[name="mbrLoginId"]').val('');
					$('input[name="mbrLoginId"]').focus();
					return false;
				}
			} else {
				alert("요청 처리가 정상적으로 되지 않았습니다.\n" + xhr.status);
			}
		}
	}

	function msubmit() {

		var Zipcode = $('#Zipcode').val();
		var Address = $('#Address').val();
		var rest_address = $('#rest_Address').val();
		//html element에 대하여 null 또는 비어있는지 체크 및 alert 문구 노출
		var flag; // return false 여부 체크 이함수도 false 시켜야하므로

		//flag 마지막 값만 인식하므로 수정이 필요하긴 함.
		//필수값은 아니다.
		flag = emptyCheck(rest_address, "나머지 주소를 입력해주세요.");
		flag = emptyCheck(Zipcode, "우편번호를 입력해주세요.");
		flag = emptyCheck(Address, "주소를 입력해주세요.");

		 if (flag == false || flag == undefined) {
			//alert('11');
			return false;
		} else {
		 document.change_record.submit();
		}
		alert(flag);
		 $("change_record").validate({
		    //validation이 끝난 이후의 submit 직전 추가 작업할 부분
		    //http://hellogk.tistory.com/48
		    submitHandler: function() {
		        var f = confirm("회원가입을 완료하겠습니까?");
		        if(f){
		            return true;
		        } else {
		            return false;
		        }
		    },
		    //규칙
		    rules: {
		    	pmtLoginId: {
		            required : true,
		            minlength : 5,
		        },
		        pmtLoginPw: {
		            required : true,
		            minlength : 10
		        },
		        pmtEmail: {
		            required : true,
		            minlength : 2,
		            email : true
		        }
		    },
		    //규칙체크 실패시 출력될 메시지
		    messages : {
		    	mbrLoginId: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            remote : "존재하는 아이디입니다"
		        },
		        mbrLoginPw: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
		        },
		        mbrEmail: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            email : "메일규칙에 어긋납니다"
		        }
		    }
		});

	}

	function mmodify() {

		var Zipcode = $('#Zipcode').val();
		var Address = $('#Address').val();
		var rest_address = $('#rest_Address').val();
		var chkLoginPW = $('#chkLoginPW').val();
		var chkLoginPW2 = $('#chkLoginPW2').val();

		//html element에 대하여 null 또는 비어있는지 체크 및 alert 문구 노출
		var flag; // return false 여부 체크 이함수도 false 시켜야하므로

		//flag 마지막 값만 인식하므로 수정이 필요하긴 함.
		//필수값은 아니다.
		flag = emptyCheck(rest_address, "나머지 주소를 입력해주세요.");
		flag = emptyCheck(Zipcode, "우편번호를 입력해주세요.");
		flag = emptyCheck(Address, "주소를 입력해주세요.");
		if(chkLoginPW!=chkLoginPW2) flag="비밀번호 확인을 다시해주세요.";

		 if (flag == false || flag == undefined) {
			//alert('11');
			return false;
		} else {
			document.change_record.submit();
		}
		alert(flag);
		 $("change_record").validate({
		    //validation이 끝난 이후의 submit 직전 추가 작업할 부분
		    //http://hellogk.tistory.com/48
		    submitHandler: function() {
		        var f = confirm("수정하시겠습니까?");
		        if(f){
		            return true;
		        } else {
		            return false;
		        }
		    },
		    //규칙
		    rules: {
		    	pmtLoginId: {
		            required : true,
		            minlength : 5,
		        },
		        pmtLoginPw: {
		            required : true,
		            minlength : 10
		        },
		        pmtEmail: {
		            required : true,
		            minlength : 2,
		            email : true
		        }
		    },
		    //규칙체크 실패시 출력될 메시지
		    messages : {
		    	mbrLoginId: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            remote : "존재하는 아이디입니다"
		        },
		        mbrLoginPw: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
		        },
		        mbrEmail: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            email : "메일규칙에 어긋납니다"
		        }
		    }
		});


	}


	function filterNumber(event) {
		  var code = event.keyCode;
		  if (code > 47 && code < 58) { //숫자만 입력받음
		    return;
		  }
		/*
		  if (code === 110 || code === 190) {
		    return; 소수까지 받을 수 있도록 점 찍을 수 있음
		  }
		*/
		  if (event.ctrlKey || event.altKey) { //컨트롤과 알트키 가능하게 끔
		    return;
		  }
		  if (code === 9 || code === 36 || code === 35 || code === 37 ||
		      code === 39 || code === 8 || code === 46) {
		    return; //화살표 가능하게끔
		  }
		  event.preventDefault();
		}
</script>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});
</script>

</head>
<!-- Breadcrumbs-->
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Promoter</a></li>
	<li class="breadcrumb-item active">PromoterForm</li>
</ol>

<div class="col-md-12">
	<!-- Content Column -->
	<div class="col-lg-12">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

			<c:choose>
				<c:when
					test="${!empty updatePmtForm && updatePmtForm.promoter_id ne null }">

					<%-- 1. 회원정보 수정 --%>

					<form class='form-horizontal' method="post"
						action="/promoter/PmtUpdatePro.mwav">


						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Mwav - Promoter Modify</h3>
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
													<td width="40">아이디: <a data-toggle="popover"
														data-placement="bottom" data-html="true"
														title="MemberId Rules"
														data-content="
	1. 4 ~ 20 자 사이의 문자길이  <br/>
	2. 첫 문자는 영어로 시작  <br/>
	3. 특수문자 사용금지 (제외문자: . _ -) <br/>
	4. 공백문자 사용금지  <br/>
	5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음">

															<span
															class="glyphicon glyphicon-question-sign fa-lg text-muted">
														</span>
													</a>



													</td>


													<td><div class='form-group'>
															<div class='col-md-8'>

																<input class='form-control' name="pmtLoginId"
																	id="chkLoginId" type='text' maxlength="20"
																	value="${updatePmtForm.pmtLoginId }"
																	readonly="readonly" onchange="idcheck()" required>
															</div>
														</div></td>
													<td><input type="hidden" name="promoter_id"
														value="${updatePmtForm.promoter_id}" />
														<p class="col-md-5 col-md-offset-4">
															<span id="idcheckLayer"></span>
														</p></td>
												</tr>
												<tr>
													<td>비밀번호:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>

																<input class='form-control' name="pmtLoginPw"
																	type='password' id="chkLoginPW"
																	value="${updatePmtForm.pmtLoginPw }"
																	readonly="readonly" onchange="chkPWPolicy()" required>
															</div>
														</div></td>
												</tr>
												<tr>
													<td>새로운 비밀번호:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>

																<input class='form-control' name="pmtLogiNewPw"
																	type='password' id="chkLoginPW"
																	onchange="chkPWPolicy()" required>
															</div>
														</div></td>
												</tr>
												<tr>
													<td>새로운 비밀번호 확인:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>

																<input class='form-control' name="pmtLoginNewPw2"
																	type='password' id="chkLoginPW2"
																	onchange="chkPWPolicy()" required>
															</div>
														</div></td>
												</tr>

												<tr>
													<td>이름:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtName"
																	value="${updatePmtForm.pmtName}" type="text"
																	maxlength="20" readOnly required />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>추천인아이디:</td>
													<td>
														<div class='col-md-8'>
															<input class='form-control' name="pmtUpperPromo_id"
																id="chkUpperPromo_id" type='text' maxlength="20"
																readonly="readonly" onchange="idcheck()" required>
														</div>
													</td>
												</tr>
												<tr>
													<td>자택전화:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtPhone" type="text"
																	value="${updatePmtForm.pmtPhone}"
																	onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																	required />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>핸드폰번호:</td>

													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtCellularPhone"
																	type="text" value="${updatePmtForm.pmtCellularPhone}"
																	onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																	required />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>이메일:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtMail" id="chkEmail"
																	type="text" value="${updatePmtForm.pmtMail}"
																	onchange="chkEmailPolicy()" required />
															</div>
														</div></td>
												</tr>

												<tr>
													<td>결혼여부</td>
													<td><div class='form-group'>
															<div class='col-md-3'>
																<input class="form-control" id="pmtMarried"
																	name="pmtMarried1" value="0" type="radio" /> 미혼
															</div>
															<div class='col-md-3'>
																<input class="form-control" id="pmtMarried"
																	name="pmtMarried1" value="1" type="radio" /> 결혼
															</div>
														</div></td>
												</tr>

												<tr>
													<td>우편번호:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" id="Zipcode"
																	name="pmtZipcode" type="text" maxlength="6"
																	readonly="readonly" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>주소:</td>
													<td>

														<div class='form-group'>

															<p class="col-md-3 pull-right">
																<button class="btn btn-primary btn-block" type="button"
																	data-toggle="modal" data-target=".modal_post"
																	onclick="showhide();">주소찾기</button>

															</p>
															<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->

															<div class='col-md-8'>
																<input class="form-control" id="Address"
																	name="pmtAddress_1" type="text"
																	value="${updatePmtForm.pmtAddress}" placeholder='주소'
																	readonly="readonly" />
															</div>
															<div class='col-md-8'>
																<input class="form-control" name="pmtAddress_2"
																	type="text" placeholder='나머지 주소' required />
															</div>
														</div>
													</td>
												</tr>

												<tr>
													<td class="active">아바타:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtAvataImage"
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
											<textarea class="form-control" name="pmtMark" class="pmtMark"
												rows="15">  </textarea>
										</div>

									</div>
								</div>
								<div class="panel-footer">

									<button type="button" class="btn btn-sm btn-primary"
										onclick="javascript:window.location.href='/promoter/pmrList.mwav'">
										리스트</button>

									<button type="button" class="btn btn-sm btn-primary"
										onClick="javascript:history.go(-1)">뒤로가기</button>

									<button type="submit" id="modifyBuotton" onclick="mmodify()"
										class="btn btn-sm btn-primary">수정하기</button>

								</div>

							</div>
						</div>

					</form>


				</c:when>

				<c:otherwise>
					<%-- 1. 회원정보 입력 --%>
					<form class='form-horizontal' method="post"
						action="/promoter/PmtForm.mwav">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">Mwav - Staff Registration</h3>
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

																	<input class='form-control' name="pmtLoginId"
																		id="chkLoginId" type='text' maxlength="15"
																		onchange="idcheck('chkLoginId')" required> <br>

																	<span class="col-md-12" id="idcheckLayer"></span>

																</div>
																<a data-toggle="popover" data-placement="bottom"
																	data-html="true" title="MemberId Rules"
																	data-content="
																				1. 4 ~ 20 자 사이의 문자길이  <br/>
																				2. 첫 문자는 영어로 시작  <br/>
																				3. 특수문자 사용금지 (제외문자: . _ -) <br/>
																				4. 공백문자 사용금지  <br/>
																				5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음">

																	<span
																	class="glyphicon glyphicon-question-sign fa-lg text-muted">
																</span>
																</a>
															</div></td>
													</tr>

													<tr>
														<td>비밀번호:</td>
														<td><div class='form-group'>
																<div class='col-md-8'>

																	<input class='form-control' name="pmtLoginPw"
																		id="chkLoginPW" type='password'
																		onchange="chkPWPolicy(this.value, this)" required>
																</div>
																<a data-toggle="popover" data-placement="bottom"
																	data-html="true" title="Password Rules"
																	data-content="
														1. 8~255자 사이의 문자길이  <br/>
														2. 영문, 숫자, 특수문자로 구성 <br/>
														3. 특수문자 한 개 이상 꼭 포함 <br/>
														4. 공백문자 사용금지  <br/>
														5. 영문 대문자와 소문자의 구분 ">

																	<span
																	class="glyphicon glyphicon-question-sign fa-lg text-muted"></span>
																</a>
															</div></td>
													</tr>
													<tr>
													<tr>
														<td>이름:</td>
														<td><div class='form-group'>
																<div class='col-md-8'>
																	<input class="form-control" name="pmtName" type="text"
																		maxlength="20" required />
																</div>
															</div></td>
													</tr>
													<tr>
														<td>추천인아이디:</td>
														<td>
															<div class='col-md-8'>
																<input class='form-control' name="pmtRcmderId"
																	id="chkUpperPromo_id" type='text' maxlength="20"
																	onchange="idcheck('chkUpperPromo_id')" required>
															</div>
														</td>
													</tr>
													<tr>
														<td>자택전화:</td>
														<td><div class='form-group'>
																<div class='col-md-3'>
																	<input class="form-control" name="pmtPhone_1"
																		type="text" onkeydown="filterNumber(event);"
																		maxlength="4" required />
																</div>
																<div class='col-md-1'>-</div>
																<div class="col-md-3">

																	<input class="form-control" name="pmtPhone_2"
																		type="text" maxlength="4"
																		onkeydown="filterNumber(event);" maxlength="4"
																		required />
																</div>
																<div class='col-md-1'>-</div>

																<div class="col-md-3">
																	<input class="form-control" name="pmtPhone_3"
																		type="text" maxlength="4"
																		onkeydown="filterNumber(event);" maxlength="4"
																		required />
																</div>
															</div></td>
													</tr>
													<tr>
														<td>핸드폰번호:</td>
														<td><div class='form-group'>

																<div class='col-md-3'>
																	<input class="form-control" name="pmtCellularP_1"
																		type="text" maxlength="4"
																		onkeydown="filterNumber(event);" required />

																</div>
																<div class='col-md-1'>-</div>

																<div class="col-md-3">
																	<input class="form-control" name="pmtCellularP_2"
																		type="text" maxlength="4"
																		onkeydown="filterNumber(event);" required />
																</div>
																<div class='col-md-1'>-</div>

																<div class='col-md-3'>
																	<input class="form-control" name="pmtCellularP_3"
																		type="text" maxlength="4"
																		onkeydown="filterNumber(event);" required />
																</div>

															</div></td>
													</tr>
													<tr>
														<td>이메일:</td>
														<td><div class='form-group'>
																<div class='col-md-8'>
																	<input class="form-control" name="pmtMail"
																		id="chkEmail" type="text"
																		onchange="chkEmailPolicy(this.value, this)" required />
																</div>
															</div></td>
													</tr>

													<tr>
														<td>주민등록번호:</td>
														<td><div class='form-group'>
																<div class='col-md-4'>
																	<input class="form-control" name="pmtSsn1" type="text"
																		maxlength="6" />
																</div>
																<div class='col-md-1'>-</div>
																<div class='col-md-4'>
																	<input class="form-control" name="pmtSsn2" type="text"
																		maxlength="7" />
																</div>
															</div></td>
													</tr>


													<tr>
														<td>부업무:</td>
														<td><div class='form-group'>
																<div class='col-md-8'>
																	<input class="form-control" name="pmtJobType"
																		type="text" maxlength="200" />
																</div>
															</div></td>
													</tr>
													<tr>
														<td>결혼여부</td>
														<td><div class='form-group'>
																<div class='col-md-3'>
																	<input class="form-control" id="pmtMarried"
																		name="pmtMarried" value="0" type="radio" /> 미혼
																</div>
																<div class='col-md-3'>
																	<input class="form-control" id="pmtMarried"
																		name="pmtMarried" value="1" type="radio" /> 결혼
																</div>
															</div></td>
													</tr>
													<tr>
														<td>우편번호:</td>
														<td><div class='form-group'>
																<div class='col-md-8'>
																	<input class="form-control" id="Zipcode"
																		name="pmtZipcode" type="text" maxlength="6" value=""
																		readonly="readonly" />
																</div>
															</div></td>
													</tr>
													<tr>
														<td>주소:</td>
														<td>

															<div class='form-group'>

																<p class="col-md-3 pull-right">
																	<button class="btn btn-primary btn-block" type="button"
																		data-toggle="modal" data-target=".modal_post"
																		onclick="showhide();">주소찾기</button>

																</p>
																<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> readonly="readonly" -->

																<div class='col-md-8'>
																	<input class="form-control" id="Address" value=""
																		name="pmtAddress_1" type="text" placeholder='주소'
																		readOnly />
																</div>
																<div class='col-md-8'>
																	<input class="form-control" name="pmtAddress_2"
																		value="" id="rest_Address" type="text"
																		placeholder='나머지 주소' required />
																</div>
															</div>
														</td>
													</tr>

													<tr>
														<td class="active">아바타:</td>
														<td><div class='form-group'>
																<div class='col-md-8'>
																	<button type="button" name="pmtAvataImage"
																		class="btn btn-sm btn-primary" data-toggle="modal"
																		data-target=".modalUploadImages">이미지업로드</button>

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
												<textarea class="form-control" name="pmtMarkl"
													class="pmtMark" placeholder="자기소개나 하고싶은 말을 써주세요" rows="15"></textarea>
											</div>

										</div>
									</div>
									<div class="panel-footer">

										<button type="button" class="btn btn-sm btn-primary"
											onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">
											리스트</button>

										<button type="button" class="btn btn-sm btn-primary"
											onClick="javascript:history.go(-1)">뒤로가기</button>

										<button onclick="msubmit()" type="submit"
											class="btn btn-sm btn-primary">가입하기</button>

									</div>

								</div>
							</div>
						</div>
					</form>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<!-- /.container -->


<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />


<%-- <!-- --> 주석처리해도 include는 된다.  --%>
<jsp:include page="/Admins/Goods/GdsUpLoader.jsp" flush="false" />


