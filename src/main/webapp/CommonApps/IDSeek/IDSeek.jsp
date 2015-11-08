<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
	rel="stylesheet">
<!-- jQuery Version 1.11.0 -->
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<!-- function idFindercheck() {
alert('sdfsdf');

$.ajax({
	  type : 'POST', // Http Request Method로 POST로 지정
	  url : '/member/IdFinder.do', // 서버 요청 주소
	  contentType : 'application/json;charset=UTF-8', // 서버 요청시 전송할 데이터가 UTF-8 형식의 JSON 객체임을 명시
	  data : JSON.stringify(request), // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
	  dataType : 'json', // 서버로부터 응답받을 데이터가 JSON 객체임을 명시하여 수작업 없이 응답 데이터를 JavaScript 객체로 획득
	  success : function(response) { alert(response); }, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능
	    error : function() { ... } // 서버로부터 응답 데이터 실패시 로직 처리
	});
} 
 -->
<script>
	var xhr;
	function createXhr() {
		if (window.ActiveXObject) { // IE 이전버전
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xhr = new XMLHttpRequest();
		}
	}

	function idFindercheck() {
		var phone = document.getElementById("mbrCellPhone").value;
		var email = document.getElementById("mbrEmail").value;

		var queryString = "mbrCellPhone=" + phone + "&mbrEmail=" + email;
		if (name == null || email == null) {
			document.getElementById("idcheckLayer").innerHTML = "<font color=red>이름 또는 이메일을 입력하세요.</font>";
		} else {
			// 1. XMLHttpReqeust 객체 생성
			createXhr();
			// 2. 이벤트 핸들러 등록
			xhr.onreadystatechange = callback; // callback 함수를 등록
			// 3. open()를 통해 요청관련 설정을 설정
			xhr.open("POST", "/member/IdFinder.do", true);
			// 4. Header에 contentType 지정 - post
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			// 5. send()를 통해 요청
			xhr.send(queryString); // 요청 쿼리를 보내준다.
		}
	}
	function callback() {
		if (xhr.readyState == 4) { // 응답을 다 받은 경우
			if (xhr.status == 200) { // 응답코드가 200인 경우 - 정상인 경우
				var resTxt = xhr.responseText; // 서버가 보낸 응답 text

				document.getElementById("idcheckLayer").innerHTML = resTxt;
			} else {
				alert("요청처리가 정상적으로 되지 않았습니다.\n" + xhr.status);
			}
		}
	}
</script>
<script>
	function PWFinder() {
		var aa = $('#pwid').val();
		var bb = $('#pwemail').val()

		var URL = "mbrLoginId=" + aa + "&mbrEmail=" + bb;

		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/member/PWFinder.do', // 서버 요청 주소
			data : URL, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {
				alert('입력해주신 이메일로 임시PW를 발급완료했습니다. (5분안에 입력해주세요.)');
				document.getElementById("pwid").readOnly = true;
				document.getElementById("pwemail").readOnly = true;
				document.getElementById("pwok").disabled = true;
				$('#imsipwdisplay').css('display', 'block') //to show
				start_timer();

			}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능
			error : function() {
				alert('잘못입력했습니다. 다시 입력해주세요.');

			} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>

<script>
	function imsiPWFinder() {
		var aa = $('#imsipw').val();

		var URL = "imsiPW=" + aa;

		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/member/imsiPWFinder.do', // 서버 요청 주소
			data : URL, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {

				if (data == true) {
					$('#PwFinder').css('display', 'none') //to show
					$('#pwfinder_1').css('display', 'block') //to show
					$('#pwfinder_1').addClass('active in') //to show
					alert('비밀번호를 변경합니다.');
					$("#imsi_mbrLoginPw").val(aa);
					/* alert('aa'+aa);
					lol = $("#imsi_mbrLoginPw").val();
					alert('lol'+lol); */

				}
				if (data == false) {
					alert('임시pw가 맞지 않습니다. 메일은 확인하고, 다시 입력해주세요.')
					document.pwform_1.imsipw_.focus();
				}

			}, // 서버로부터 응답 데이터 도착시 로직 처리, 응답 데이터는 JavaScript 객체로 바로 사용 가능
			error : function() {
				alert('임시pw가 맞지 않습니다. 메일은 확인하고, 다시 입력해주세요.');

			} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>


<script>
	var timerID; // 타이머를 핸들링하기 위한 전역 변수
	var time = 300; // 타이머 시작시의 시간 3분주고싶다면 180

	/* 타이머를 시작하는 함수 */
	function start_timer() {
		timerID = setInterval("decrementTime()", 1000);
	}

	/* 남은 시간을 감소시키는 함수 */
	function decrementTime() {

		var x1 = document.getElementById("time1");
		//var x2 = document.getElementById("time2");
		x1.innerHTML = toHourMinSec(time);
		//x2.innerHTML = toHourMinSec(time);

		if (time > 0)
			time--;
		else {
			// 시간이 0이 되었으므로 타이머를 중지함
			clearInterval(timerID);
			alert('5분의 시간이 지났습니다. 다시 시도해주세요.');
			document.location.href = '/';

			// 시간이 만료되고 나서 할 작업을 여기에 작성
			//document.form.submit(); // 예: 강제로 form 실행
		}
	}

	/* 정수형 숫자(초 단위)를 "시:분:초" 형태로 표현하는 함수 */
	function toHourMinSec(t) {
		var hour;
		var min;
		var sec;

		// 정수로부터 남은 시, 분, 초 단위 계산
		hour = Math.floor(t / 3600);
		min = Math.floor((t - (hour * 3600)) / 60);
		sec = t - (hour * 3600) - (min * 60);

		// hh:mm:ss 형태를 유지하기 위해 한자리 수일 때 0 추가
		if (hour < 10)
			hour = "0" + hour;
		if (min < 10)
			min = "0" + min;
		if (sec < 10)
			sec = "0" + sec;

		return (hour + ":" + min + ":" + sec);
	}
</script>

<div class="container">
	<!-- Modal -->
	<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<br>
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#IdFinder" data-toggle="tab">IDSeek</a></li>
						<li class=""><a href="#PwFinder" data-toggle="tab">PWSeek</a></li>
						<!-- <li class=""><a href="#why" data-toggle="tab">Why?</a></li> -->
					</ul>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active fade in" id="IdFinder">
								<h2>아이디 찾기</h2>
								<p>아이디를 잊어버리셨나요? 아래 입력사항에 가입하실때 작성하신 정보를 입력해주세요! 가입시 이메일로
									전송됩니다.</p>
								<br />
								<div class="col-md-8">
									<div class="col-md-4">휴대폰</div>
									<div class="col-md-8">
										<input type="text" id="mbrCellPhone" class="form-control"
											placeholder="CellularPhone...">
									</div>
									<p class="text-center">&nbsp;&nbsp;* -없이 입력해주시면 됩니다.</p>

									<br />
									<div class="col-md-4">이메일</div>
									<div class="col-md-8">
										<input type="text" id="mbrEmail" class="form-control"
											placeholder="Email...">
									</div>
								</div>
								<div class="col-md-4">
									<button type="button" class="btn btn-primary"
										onclick="idFindercheck()">확인</button>
								</div>
								<p class="col-md-4 col-md-offset-4">
									<span id="idcheckLayer"></span>
								</p>
							</div>
							<div class="tab-pane fade" id="PwFinder">
								<form class="form-horizontal">
									<h2>비밀번호 찾기</h2>
									<p>비밀번호를 잊어버리셨나요? 아래 입력사항에 가입하실때 작성하신 정보를 입력해주세요! 가입시 이메일로
										전송됩니다.</p>
									<br />


									<div class="col-md-8">
										<div class="col-md-4">아이디</div>
										<div class="col-md-8">
											<input type="text" id="pwid" class="form-control"
												placeholder="Name...">
										</div>

										<div class="col-md-4 mgt4">이메일</div>
										<div class="col-md-8 mgt4">
											<input type="text" id="pwemail" class="form-control"
												placeholder="Email...">
										</div>
									</div>
									<div class="col-md-4">
										<button type="button" id="pwok" class="btn btn-primary"
											onclick="PWFinder()">확인</button>
									</div>
								</form>
								<form class="form-horizontal" name="pwform_1">
									<div class="col-md-12 mgt5" id="imsipwdisplay"
										style="display: none;">
										<div class="col-md-8">
											<div class="col-md-4">남은시간</div>
											<div class="col-md-8" id="time1" style="color: red"></div>
											<div class="col-md-8 col-md-offset-4">
												<input type="text" name="imsipw_" id="imsipw"
													class="form-control" placeholder="ImsiPw...">
											</div>
										</div>
										<div class="col-md-4">
											<button type="button" class="btn btn-primary"
												onclick="imsiPWFinder()">확인</button>
										</div>
									</div>
									<p></p>
								</form>
								<!-- 리로드 -> imsipw 확인시 ajax 후 변경처리 reload -->
							</div>

							<div class="tab-pane fade" id="pwfinder_1" style="display: none;">
								<form name="pwform" class="form-horizontal" method="post"
									action="/member/PWUpdate.do"
									onsubmit="return check(document.pwform)">
									<h2>비밀번호 변경</h2>
									<p>비밀번호를 변경합니다.</p>
									<br />

									<div class="col-md-8">
										<div class="col-md-4">변경 할 PW</div>
										<div class="col-md-8">
											<input type="password" name="mbrLoginPw" class="form-control"
												placeholder="mbrLoginPW">
										</div>
										<input type="hidden" name="imsi_mbrLoginPw"
											id="imsi_mbrLoginPw" value="">
										<div class="col-md-4 mgt4">PW 재확인</div>
										<div class="col-md-8 mgt4">
											<input type="password" class="form-control"
												placeholder="Confirm Password" name="mbrLoginPw_check">
										</div>
									</div>
									<div class="col-md-4">
										<button type="submit" id="pwok" class="btn btn-primary">변경</button>
									</div>
								</form>
								<form class="form-horizontal">
									<div class="col-md-12 mgt5" id="imsipwdisplay"
										style="display: none;">
										<div class="col-md-8">
											<div class="col-md-4">남은시간</div>
											<div class="col-md-8" id="time1" style="color: red"></div>
											<div class="col-md-8 col-md-offset-4">
												<input type="text" id="imsipw" class="form-control"
													placeholder="ImsiPw...">
											</div>
										</div>
										<div class="col-md-4">
											<button type="button" class="btn btn-primary" onclick="">확인</button>
										</div>
									</div>
									<p></p>
								</form>
								<!-- 리로드 -> imsipw 확인시 ajax 후 변경처리 reload -->
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>