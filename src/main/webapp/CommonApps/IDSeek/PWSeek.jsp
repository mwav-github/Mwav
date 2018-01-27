<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
	rel="stylesheet">
<!-- jQuery Version 1.11.0 -->
<%--아래 jquery가 들어가있으면 tooltip등 안먹힌다.  --%>
<!-- <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
 -->


<script>
	function mbrTempLoginPwUpdate() { //PWFinder()
		var aa = document.getElementById("pwid");
		//$('#pwid'); undefined 출력
		//document.getElementById("mbrCellPhone");
		var bb = document.getElementById("pwemail");
		//document.getElementById("mbrCellPhone");

		//html element에 대하여 null 또는 비어있는지 체크 및 alert 문구 노출
		var flag; // return false 여부 체크 이함수도 false 시켜야하므로 
		flag = emptyCheck(aa, "회원아이디를 입력해주세요.");
		//alert(flag);
		flag = emptyCheck(bb, "이메일을 입력해주세요.");
		//alert(flag);
		if (flag == false || flag == undefined) {
			//alert('11');
			return false;
		} else {

			var URL = "mbrLoginId=" + aa.value + "&mbrEmail=" + bb.value;

			$.ajax({
				type : 'POST', // Http Request Method로 POST로 지정
				url : '/member/mbrTempLoginPwUpdate.mwav', // 서버 요청 주소
				data : URL, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
				success : function(data) {
					//alert(data);
					if (data == 'false') {
						alert('해당 회원정보는 존재하지 않습니다.');
						return false;
					} else {

						alert('입력해주신 ' + data
								+ '이메일로 임시PW를 발급완료했습니다. (5분안에 입력해주세요.)');
						document.getElementById("pwid").readOnly = true;
						document.getElementById("pwemail").readOnly = true;
						document.getElementById("pwok").disabled = true;
						$('#imsipwdisplay').css('display', 'block') //to show
						start_timer();
					}

				}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능

				beforeSend : function() {
					//(이미지 보여주기 처리)
					//alert('1');
					$('.wrap-loading').removeClass('display-none');
				},
				complete : function() {
					//(이미지 감추기 처리)
					//alert('2');
					$('.wrap-loading').addClass('display-none');

				},
				error : function(status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					if (status == 0) {
						alert('You are offline!!n Please Check Your Network.');
					} else if (status == 404) {
						alert('Requested URL not found.');
					} else if (status == 500) {
						alert('Internel Server Error.');
					} else if (error == 'parsererror') {
						alert('Error.nParsing JSON Request failed.');
					} else if (error == 'timeout') {
						alert('Request Time out.');
					} else {
						alert('Unknow Error.n' + request.responseText);
					}
				} // 서버로부터 응답 데이터 실패시 로직 처리
			});
		}
	}
</script>

<script>
	function mbrTempLoginPwSeek() { //imsiPWFinder()
		var before_value = $('#mbrTempLoginPw').val();
		var after_value;
		//공백값 제거
		after_value = trim(before_value);
		var URL = "mbrTempLoginPw=" + after_value;

		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/member/mbrTempLoginPwSeek.mwav', // 서버 요청 주소
			data : URL, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {

				if (data == true) {

					$('#PwFinder').css('display', 'none') //to show
					$('#pwfinder_1').css('display', 'block') //to show
					$('#pwfinder_1').addClass('active in') //to show
					alert('비밀번호를 변경합니다.');
					$("#imsi_mbrLoginPw").val(after_value);
					/* alert('aa'+aa);
					lol = $("#imsi_mbrLoginPw").val();
					alert('lol'+lol); */

				} else if (data == false) {
					alert('임시pw가 맞지 않습니다. 메일은 확인하고, 다시 입력해주세요.')
					document.pwform_1.imsipw_.focus();
				}

			}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능

			beforeSend : function() {
				//(이미지 보여주기 처리)
				//alert('1');
				$('.wrap-loading').removeClass('display-none');
			},
			complete : function() {
				//(이미지 감추기 처리)
				//alert('2');
				$('.wrap-loading').addClass('display-none');

			},
			error : function() {
				alert('임시pw가 맞지 않습니다. 메일은 확인하고, 다시 입력해주세요.');

			} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>


<script>
	function updateMbrLoginPw(form) { //imsiPWFinder()

		// 로그인 및 기타 form 체크

		// 참고 a태그에서는 this 인지 못함
		// 원래는 로그인이 최상단 이나, 패스워드 찾기에서 패스워드 변경 부분에서 로그인이 위에있으면 그냥 통과라 변경
		// 추후 필히 변경 필요.
		if (form.mbrLoginPw.value.length == 0) {
			alert("패스워드를 입력해주세요");
			form.mbrLoginPw.focus();
			return false;
		}
		if (form.mbrLoginPw.value != form.mbrLoginPw_check.value) {
			alert("패스워드를 다시확인해주세요.");
			form.mbrLoginPw_check.focus();
			return false;
		}

		var imsi_mbrLoginPw = $('#imsi_mbrLoginPw').val();
		var mbrLoginPw = $('#mbrLoginPw_chk').val();
		var after_value;
		var after_value_;

		//공백값 제거
		after_value = trim(imsi_mbrLoginPw);
		after_value_ = trim(mbrLoginPw);
		var URL = "imsi_mbrLoginPw=" + after_value + "&mbrLoginPw="
				+ after_value_;

		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/member/mbrLoginPwUpdate.mwav', // 서버 요청 주소
			data : URL, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {

				if (data == true) {
					alert('비밀번호를 변경합니다.');
					document.location = "/MasterPage.mwav?mode=SMbrLogin";
					return true;

				} else if (data == false) {
					alert('이전에 사용한 비밀번호로 변경이 불가능합니다.');
					return false;
				}

			}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능

			beforeSend : function() {
				//(이미지 보여주기 처리)
				//alert('1');
				$('.wrap-loading').removeClass('display-none');
			},
			complete : function() {
				//(이미지 감추기 처리)
				//alert('2');
				$('.wrap-loading').addClass('display-none');

			},
			error : function() {
				alert('pw가 맞지 않습니다.다시 입력해주세요.');

			} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>

<style>
.wrap-loading_images { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 10000;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'; /* ie */
}
</style>

<c:if test="${param.type eq 'page'}">


	<div class="wrap-loading display-none">
		<img class="wrap-loading_images "
			src="/CommonApps/PostSeek/Images/ajax-loader.gif">
	</div>

	<div class="col-xs-12 " id="PwFinder">
		<p class="intro-text">비밀번호를 잊어버리셨나요? 아래 입력사항에 가입하실때 작성하신 정보를
			입력해주세요! 가입시 이메일로 전송됩니다.</p>
		<%--Forgotten your password? Enter your email address below to begin the reset process. --%>


		<div class="form-group">
			<label class="col-sm-3 control-label">아이디</label>
			<div class="col-sm-9">
				<input type="text" id="pwid"
					class="caps_lockchk input_custom col-xs-12 col-sm-4"
					id="mbrCellPhone" placeholder="회원아이디" required>
			</div>
			<div class="enter"></div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label" for="mbrCellPhone">이메일</label>
			<div class="col-sm-9">
				<input type="text" id="pwemail"
					class="input_custom col-xs-12 col-sm-4" id="mbrEmail"
					placeholder="이메일" onchange="chkEmailPolicy(this.value, this)"
					required>
			</div>
		</div>
		<div class="enter"></div>

		<hr class="hr_gray_separator">

		<div class="clearfix form-actions">
			<div class="col-md-offset-5 col-md-7">
				<button type="button" id="pwok" onclick="mbrTempLoginPwUpdate()"
					class="btn-custom-default btn btn-primary">Submit</button>
			</div>
		</div>

		<div class="enter"></div>
		<div id="idcheckLayer" class="col-md-12"></div>

	</div>


	<%-- 임시비밀번호 발급 및 입력 (5분이내) --%>

	<div class="col-xs-12 " id="imsipwdisplay" style="display: none;">
		<form class="form-horizontal" name="pwform_1">

			<div class='alert alert-danger text-center'>
				<strong class="text-danger">남은 시간은 </strong><strong id="time1"
					class="text-danger"></strong>
			</div>
			<div class="form-group">

				<label class="col-sm-3 control-label">임시 비밀번호</label>
				<div class="col-sm-9">
					<input type="text" name="imsipw_" id="mbrTempLoginPw"
						class="caps_lockchk input_custom col-xs-12 col-sm-4"
						id="mbrCellPhone" placeholder="임시비밀번호" required>
				</div>
				<div class="enter"></div>
			</div>

			<div class="enter"></div>

			<hr class="hr_gray_separator">

			<div class="clearfix form-actions">
				<div class="col-md-offset-5 col-md-7">
					<button type="button" onclick="mbrTempLoginPwSeek()"
						class="btn-custom-default btn btn-primary">Submit</button>
				</div>
			</div>

			<div class="enter"></div>

		</form>
	</div>


	<%-- 임시비밀번호 발급 및 입력 (5분이내) --%>

	<div class="col-xs-12 " id="pwfinder_1" style="display: none;">
		<form class="form-horizontal" name="pwform">
			<p class="intro-text">새롭게 변경할 비밀번호를 입력하세요.</p>

			<div class="form-group">
				<label class="col-sm-3 control-label">변경 할 비밀번호</label>
				<div class="col-sm-9">
					<input type="password" name="mbrLoginPw" id="mbrLoginPw_chk"
						class="caps_lockchk input_custom col-xs-12 col-sm-4"
						onchange="chkPWPolicy(this.value, this)" placeholder="변경 할 비밀번호"
						required>
				</div>
				<div class="enter"></div>
			</div>

			<input type="hidden" name="imsi_mbrLoginPw" id="imsi_mbrLoginPw"
				value="">

			<div class="form-group">
				<label class="col-sm-3 control-label">변경 할 비밀번호 재 확인</label>
				<div class="col-sm-9">
					<input type="password" placeholder="Confirm Password"
						name="mbrLoginPw_check"
						class="caps_lockchk input_custom col-xs-12 col-sm-4"
						onchange="chkPWPolicy(this.value, this)"
						placeholder="변경 할 비밀번호 재 입력" required>
				</div>
				<div class="enter"></div>
			</div>
			<hr class="hr_gray_separator">

			<div class="clearfix form-actions">
				<div class="col-md-offset-5 col-md-7">
					<button type="button" onclick="updateMbrLoginPw(document.pwform)"
						class="btn-custom-default btn btn-primary">변경</button>
				</div>
			</div>
		</form>
	</div>


</c:if>

