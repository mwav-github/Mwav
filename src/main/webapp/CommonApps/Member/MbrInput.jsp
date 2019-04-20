<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- container 안에 포함시키면 된다.
http://planbong.tistory.com/531
-->

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>

<!-- 크기를 줄이고 싶으면 row -->
<div class='container'>
	<div class='panel panel-primary dialog-panel'>
		<div class='panel-heading'>
			<h5>Mwav - Member Registration</h5>
		</div>
		<div class='panel-body'>
			<form role="form" class='form-horizontal' name="change_record" method="post" action="/member/mbrForm.mwav" autocomplete="off">
				<%--action="/member/memberForm.mwav" --%>
				<div class='form-group'>
					<label class='text-color-gray control-label col-md-2 col-md-offset-2' for='id_accomodation'>
						아이디
						<span class="text-color-red">
							<strong>*</strong>
						</span>
					</label>


					<%--tooltip에 html을쓰려면 설정해줘야 한다. --%>
					<%--모바일 및 테블릿에서는 popover --%>
					<a class="btn btn-primary btn-xs btn-pointer hidden-lg hidden-md" data-toggle="popover" data-placement="bottom" data-html="true" title="Login ID Rules"
						data-content="1. 4 ~ 20 자 사이의 문자길이  <br/>
									2. 첫 문자는 영어로 시작  <br/>
									3. 특수문자 사용금지 <br/> &nbsp;&nbsp;&nbsp;(제외문자: . _ -) <br/>
									4. 공백문자 사용금지  <br/>
									5. 대소문자는 식별이 가능하나   <br/> &nbsp;&nbsp;&nbsp;구분 하지 않음">

						<span class="glyphicon glyphicon glyphicon-search"></span>
					</a>

					<%--PC에서는 hover --%>
					<a class="btn btn-primary btn-xs btn-pointer hidden-xs hidden-sm" data-toggle="popover" data-trigger="hover" data-placement="bottom" data-html="true" title="Login ID Rules"
						data-content=" 1. 4 ~ 20 자 사이의 문자길이  <br/>
										2. 첫 문자는 영어로 시작  <br/>
										3. 특수문자 사용금지 <br/> &nbsp;&nbsp;&nbsp;(제외문자: . _ -) <br/>
										4. 공백문자 사용금지  <br/>
										5. 대소문자는 식별이 가능하나   <br/> &nbsp;&nbsp;&nbsp;구분 하지 않음">
						<span class="glyphicon glyphicon glyphicon-search"></span>
					</a>

					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-12 col-sm-12 col-xs-12'>
								<input type="text" class="form-control caps_lockchk" name="mbrLoginId" id="chkLoginId" placeholder="4~20자 사이의 영문, 숫자, -_ 사용가능" maxlength="20" value="" required>
							</div>
						</div>
					</div>
					<p class="col-md-5 col-md-offset-4">
						<span id="idCheckLayer"></span>
					</p>
				</div>
				<div class='form-group'>
					<label class='text-color-gray control-label col-md-2 col-md-offset-2' for='id_accomodation'>
						비밀번호
						<span class="text-color-red">
							<strong>*</strong>
						</span>
					</label>

					<%--모바일 popover--%>
					<a class="btn btn-primary btn-xs btn-pointer hidden-lg hidden-md" data-toggle="popover" data-placement="bottom" data-html="true" title="Password Rules"
						data-content="1. 8~255자 사이의 문자길이  <br/>
										2. 영문, 숫자, 특수문자로 구성 <br/>
										3. 특수문자 한 개 이상 꼭 포함 <br/>
										4. 공백문자 사용금지  <br/>
										5. 영문 대문자와 소문자의 구분 ">
						<span class="glyphicon glyphicon glyphicon-search"></span>
					</a>

					<%--pc hover--%>
					<a class="btn btn-primary btn-xs btn-pointer hidden-xs hidden-sm" data-toggle="popover" data-trigger="hover" data-placement="bottom" data-html="true" title="Password Rules"
						data-content="1. 8~255자 사이의 문자길이  <br/>
										2. 영문, 숫자, 특수문자로 구성 <br/>
										3. 특수문자 한 개 이상 꼭 포함 <br/>
										4. 공백문자 사용금지  <br/>
										5. 영문 대문자와 소문자의 구분 ">
						<span class="glyphicon glyphicon glyphicon-search"></span>
					</a>

					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-12 col-sm-12 col-xs-12'>
								<input type="password" class="form-control caps_lockchk" name="mbrLoginPw" id="chkLoginPW" placeholder="8~255자 사이의 영문,숫자,특수문자 혼용" value="" required>

							</div>
						</div>
					</div>
					<p class="col-md-5 col-md-offset-4">
						<span id="pwCheckLayer"></span>
					</p>
				</div>

				<div class='form-group'>
					<label class='text-color-gray control-label col-md-2 col-md-offset-2' for='id_title'>
						이름
						<span class="text-color-red">
							<strong>*</strong>
						</span>
					</label>
					<div class='col-md-6'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input class='form-control caps_lockchk' name="mbrLastName" id='mbrLastName' placeholder='성' type='text' required>
							</div>
						</div>
						<!-- 						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input class='form-control caps_lockchk' name="mbrMiddleName" id='mbrMiddleName' placeholder='Middle Name' type='text'>
							</div>
						</div> -->
						<div class='col-md-4 col-md-offset-1 indent-small'>
							<div class='form-group internal'>
								<input class='form-control caps_lockchk' name="mbrFirstName" id='mbrFirstName' placeholder='이름' type='text' required>
							</div>
						</div>

					</div>
					<p class="col-md-5 col-md-offset-4">
						<span id="nameCheckLayer"></span>
					</p>
				</div>
				<div class='form-group'>
					<label class='text-color-gray control-label col-md-2 col-md-offset-2' for='id_adults'>
						전화번호
						<span class="text-color-red">
							<strong>*</strong>
						</span>
					</label>
					<!-- 2019.01.31 남동희 -->
					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-12 col-sm-12 col-xs-12'>
								<input type="text" class="form-control caps_lockchk" name="mbrCellPhone" id="mbrCellPhone" placeholder="예) 010-1234-5678" value="" required>
							</div>
						</div>
					</div>
					<p class="col-md-5 col-md-offset-4">
						<span id="phoneCheckLayer"></span>
					</p>
				</div>
				<div class='form-group'>
					<label class='text-color-gray control-label col-md-2 col-md-offset-2' for='id_email'>
						이메일
						<span class="text-color-red">
							<strong>*</strong>
						</span>
					</label>
					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-12'>
								<input class='form-control caps_lockchk' name="mbrEmail" id='chkEmail' placeholder='예) id@domain.com' type='text' required>
							</div>
						</div>
					</div>
					<p class="col-md-5 col-md-offset-4">
						<span id="emailCheckLayer"></span>
					</p>
				</div>
				<div class="form-group">
					<label class="text-color-gray control-label col-md-2 col-md-offset-2" for="id_pets">주소</label>

					<p class="col-lg-2 col-md-2 col-lg-push-4 col-md-push-4">
						<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target=".modal_post" data-dismiss="modal">주소찾기</button>
					</p>

					<div class="enter hidden-md hidden-lg"></div>

					<div class="col-lg-4 col-md-4 col-lg-pull-2 col-md-pull-2">
						<input class="form-control" name="mbrZipcode" id="Zipcode" type="text" placeholder="우편번호" value="" readonly="readonly">
					</div>


					<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->
				</div>
				<!-- disable는 제출되지 않는다 즉 값이 전달되지 않음. *중요 -->
				<div class='form-group'>
					<div class="col-md-offset-4 col-md-6">
						<input name="mbrAddress_1" class='form-control' id='Address' placeholder='주소' type='text' value="" readonly="readonly"> <input name="mbrAddress_2" class="form-control"
							placeholder='나머지 주소' type="text" id="rest_address" />
						<div class="enter"></div>
					</div>

				</div>

				<div class='form-group pull-right'>
					<%--pull-right 너무 끝까지 간다. --%>
					<div style="padding-right: 50px;">
						<button type="button" class='btn btn-lg btn-primary' onClick="validCheck()">
							<i class="glyphicon glyphicon-edit"></i>
						</button>
						<%-- incldue 시에는 submit이 아니라 자바스크립트로 처리 --%>

						<button class='btn btn-lg btn-danger' onClick="goFirst()">
							<i class="glyphicon glyphicon-remove"></i>
						</button>
					</div>
				</div>
			</form>
		</div>

		<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
		<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />
	</div>
</div>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
		// 뒤로가기 누를 시 발생 이벤트
	});

	/**
	* @param
	* ================================
	* result : 유효성 검증 결과값
	* target : 메세지를 출력할 dom object
	* msg : 출력할 메세지
	* fcTarget : foucs 대상 dom object
	* ================================
	* desc : 유효성 검증 결과에 따라서 guide text를 보여주는 함수
	*/
	function user_guide(result, target, msg, fcTarget) {
		// 초기화
		target.children().remove();
		if (result) {
			return;
		}
		target.append(msg);
		fcTarget.focus();
	}

	function idCheck(obj) {
		// onchange로 넘어올때는 event.target, 직접 object를 넘길때는 event.target이 undefined니까 
		var idObj = obj.target || obj;

		var result = /^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,19}$/g.test(idObj.value);
		var msg = "";
		if (!result) {
			msg += "<div class='alert alert-warning text-left'><strong>";
			msg += "유효하지 않은 아이디입니다. </br>";
			msg += "4~20자 사이의 영문,숫자,-_ 만 사용할 수 있습니다.";
			msg += "</strong></div>";
		}
		user_guide(result, $("#idCheckLayer"), msg, idObj);
		//console.log(result);
		return result;
	}

	function pwCheck(obj) {
		var pwObj = obj.target || obj;
		var result = /^(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])(?=.*[0-9])(?=.*[a-zA-Z])[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"0-9a-zA-Z]{8,255}$/g.test(pwObj.value);
		var msg = "";
		if (!result) {
			msg += "<div class='alert alert-warning text-left'><strong>";
			msg += "유효하지 않은 비밀번호 입니다. </br>";
			msg += "8~255자 사이의 영문,숫자,특수문자로 구성되어야 합니다.";
			msg += "</strong></div>";
		}
		user_guide(result, $("#pwCheckLayer"), msg, pwObj);
		//console.log(pwObj.value + ":" + result);
		return result;
	}

	function nameCheck(obj) {
		var nameObj = obj.target || obj;
		var result = /^[가-힣]+$/g.test(nameObj.value);
		var msg = "";
		if (!result) {
			msg += "<div class='alert alert-warning text-left'><strong>";
			msg += "한글만 입력해주세요 </br>";
			msg += "</strong></div>";
		}
		user_guide(result, $("#nameCheckLayer"), msg, nameObj);
		return result;
	}

	function phoneCheck(obj) {
		var nameObj = obj.target || obj;
		//var result = /^\d{3}-\d{3,4}-\d{4}$/g.test(nameObj.value);
		var result = /^\d{3}-\d{3,4}-\d{4}$/g.test(nameObj.value) 
						|| /^\d{10,11}$/g.test(nameObj.value);
		var msg = "";
		if (!result) {
			msg += "<div class='alert alert-warning text-left'><strong>";
			msg += "유효한 전화번호 형식이 아닙니다. </br>";
			msg += "</strong></div>";
		}
		user_guide(result, $("#phoneCheckLayer"), msg, nameObj);
		return result;
	}

	function emailCheck(obj) {
		var emailObj = obj.target || obj;
		var result = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/g.test(emailObj.value);
		var msg = "";
		if (!result) {
			msg += "<div class='alert alert-warning text-left'><strong>";
			msg += "유효하지 않은 이메일 입니다. </br>";
			msg += "</strong></div>";
		}
		user_guide(result, $("#emailCheckLayer"), msg, emailObj);
		return result;
	}

	function validCheck() {
		if (!idCheck($("#chkLoginId")[0]))
			return false;
		if (!pwCheck($("#chkLoginPW")[0]))
			return false;
		if (!nameCheck($("#mbrFirstName")[0]))
			return false;
		if (!nameCheck($("#mbrLastName")[0]))
			return false;
		if (!phoneCheck($("#mbrCellPhone")[0]))
			return false;
		if (!emailCheck($("#chkEmail")[0]))
			return false;
		$.ajax({
			url : "/member/mbrLoginIdCheck.mwav",
			method : "GET",
			data : {
				"mbrLoginId" : $("#chkLoginId").val()
			},
			dataType : "json",
			cache : false,
			success : function(data) {
				if (!data) {
					var msg = "";
					msg += "<div class='alert alert-warning text-left'><strong>";
					msg += "중복된 아이디입니다.";
					msg += "</strong></div>";
					user_guide(false, $("#idCheckLayer"), msg, $("#chkLoginId")[0]);
					return false;
				} else {
					document.change_record.submit();
				}
			}
		});
	}

	$("#chkLoginId").on("change", function(event) {
		idCheck(event);
	});

	$("#chkLoginPW").on("change", function(event) {
		pwCheck(event);
	});

	$("#mbrFirstName").on("change", function(event) {
		nameCheck(event);
	});

	$("#mbrLastName").on("change", function(event) {
		nameCheck(event);
	});

	$("#mbrCellPhone").on("change", function(event) {
		phoneCheck(event);
	});

	$("#chkEmail").on("change", function(event) {
		emailCheck(event);
	});
</script>