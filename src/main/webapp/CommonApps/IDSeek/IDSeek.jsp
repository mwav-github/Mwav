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
	var xhr;
	function createXhr() {
		if (window.ActiveXObject) { // IE 이전버전
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xhr = new XMLHttpRequest();
		}
	}

	function selectOneMbrLoginIdSeek() { //idFindercheck()
		var phone = document.getElementById("mbrCellPhone");
		var email = document.getElementById("mbrEmail");

		//html element에 대하여 null 또는 비어있는지 체크 및 alert 문구 노출
		var flag; // return false 여부 체크 이함수도 false 시켜야하므로 
		flag = emptyCheck(phone, "휴대폰번호를 입력해주세요.");
		//alert(flag);
		flag = emptyCheck(email, "이메일을 입력해주세요.");
		//alert(flag);

		if (flag == false || flag == undefined) {
			//alert('11');
			return false;
		} else {
			//alert('22');

			var queryString = "mbrCellPhone=" + phone.value + "&mbrEmail="
					+ email.value;
			if (name == null || email == null) {
				document.getElementById("idcheckLayer").innerHTML = "<font color=red>이름 또는 이메일을 입력하세요.</font>";
			} else {
				// 1. XMLHttpReqeust 객체 생성
				createXhr();
				// 2. 이벤트 핸들러 등록
				xhr.onreadystatechange = callback; // callback 함수를 등록
				// 3. open()를 통해 요청관련 설정을 설정
				xhr.open("POST", "/member/mbrLoginIdSeek.mwav", true);
				// 4. Header에 contentType 지정 - post
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				// 5. send()를 통해 요청
				xhr.send(queryString); // 요청 쿼리를 보내준다.
			}
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


<c:if test="${param.type eq 'page'}">

	<div class="col-xs-12 ">
		<p class="intro-text">아이디를 잊어버리셨나요? 아래 입력사항에 가입하실때 작성하신 정보를 입력해주시면
			확인 가능합니다.!</p>
		<%--Forgotten your password? Enter your email address below to begin the reset process. --%>


		<div class="form-group">
			<label class="col-sm-3 control-label" for="mbrCellPhone">휴대폰</label>
			<div class="col-sm-9">
				<input type="text" name="mbrCellPhone"
					class="input_custom col-xs-12 col-sm-4" id="mbrCellPhone"
					placeholder="휴대폰 번호" required>
			</div>
		<div class="enter"></div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label" for="mbrCellPhone">이메일</label>
			<div class="col-sm-9">
				<input type="text" name="mbrEmail"
					class="input_custom col-xs-12 col-sm-4" id="mbrEmail"
					placeholder="이메일" onchange="chkEmailPolicy(this.value, this)"
					required>
			</div>
		</div>
		<div class="enter"></div>

		<hr class="hr_gray_separator">

		<div class="clearfix form-actions">
			<div class="col-md-offset-5 col-md-7">
				<button type="button" onclick="selectOneMbrLoginIdSeek()"
					class="btn-custom-default btn btn-primary">Submit</button>
			</div>
		</div>

		<div class="enter"></div>
		<div id="idcheckLayer" class="col-md-12"></div>

	</div>

</c:if>

<%-- 
<c:if test="${param.type eq null}">

<div class="container">
	<!-- Modal -->
	<div class="modal fade IDPWSeek" id="IDPWSeek" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="wrap-loading display-none">
				<img class="wrap-loading_images "
					src="/CommonApps/PostSeek/Images/ajax-loader.gif">
			</div>
			<div class="modal-content">
				<br>
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#IdFinder" data-toggle="tab">IDSeek</a></li>
						<li class=""><a href="#PwFinder" data-toggle="tab">PWSeek</a></li>
						<li class="pull-right" style="right:15px;"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-times" aria-hidden="true"></i></button></li>
					</ul>

				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active fade in" id="IdFinder">
								<h2>아이디 찾기</h2>
								<p>아이디를 잊어버리셨나요? 아래 입력사항에 가입하실때 작성하신 정보를 입력해주세요! 가입시 이메일로
									전송됩니다.</p>
								
								<div class="col-xs-12 col-sm-12 col-md-12 enter">
									<div class="col-md-4 mgt4">휴대폰</div>
									<div class="col-md-8 mgt4">
										<input type="text" id="mbrCellPhone" class="form-control caps_lockchk"
											placeholder="휴대폰 번호" required>
									</div>
									
									<div class="col-md-4 mgt4">이메일</div>
									<div class="col-md-8 mgt4">
										<input type="text" id="mbrEmail" class="form-control caps_lockchk"
											placeholder="이메일" onchange="chkEmailPolicy(this.value, this)" required>
									</div>
								</div>


								<!-- 								<div id="idcheckLayer" class="col-md-offset-4 col-md-8"></div>
 
								아이디찾기 표기부분 col-xs-12 col-sm-12 표기안하면 전체를 덮는다. -->
								<div id="idcheckLayer" class="col-xs-12 col-sm-12 col-md-12"></div>
								<div class="col-xs-12 col-sm-12 col-md-12 enter">
									<button type="button" class="btn btn-block btn-sm btn-info"
										onclick="selectOneMbrLoginIdSeek()">확인</button>
								</div>

							</div>
							<div class="tab-pane fade" id="PwFinder">
								<form class="form-horizontal">
										<h2>비밀번호 찾기</h2>
										<p>비밀번호를 잊어버리셨나요? 아래 입력사항에 가입하실때 작성하신 정보를 입력해주세요! 가입시 이메일로
											전송됩니다.</p>
										<br />


										<div class="col-xs-12 col-sm-12 col-md-12">
											<div class="col-md-4 mgt4">아이디</div>
											<div class="col-md-8 mgt4">
												<input type="text" id="pwid" class="form-control caps_lockchk"
													placeholder="회원아이디" required>
											</div>

											<div class="col-md-4 mgt4">이메일</div>
											<div class="col-md-8 mgt4">
												<input type="text" id="pwemail" class="form-control caps_lockchk"
													placeholder="이메일" onchange="chkEmailPolicy(this.value, this)" required>
											</div>
											<div class="enter"></div>

										</div>
										
										

										<div class="col-md-12 enter">
											<button type="button" id="pwok"
												class="btn btn-block btn-sm btn-info"
												onclick="mbrTempLoginPwUpdate()">찾기</button>
										</div>
									
								</form>
								<form class="form-horizontal" name="pwform_1">
									<div class="row">
										<div class="col-md-12 mgt5" id="imsipwdisplay"
											style="display: none;">
											<div class="col-md-12">
												<!-- <div class="col-sm-4 col-sm-4 col-md-4">남은시간</div>
												타이머
												<div class="col-sm-8 col-sm-8 mgb3">
													<strong id="time1" class="text-danger"></strong>
												</div> --!>

												<div class='alert alert-danger text-center'>
													<strong class="text-danger">남은 시간은 </strong><strong
														id="time1" class="text-danger"></strong>
												</div>

												<div class="col-md-4 mgt4">임시비밀번호</div>
												<div class="col-md-8 ">
													<input type="text" name="imsipw_" id="mbrTempLoginPw"
														class="form-control caps_lockchk" placeholder="임시비밀번호.." >
												</div>
											</div>

											<div class="col-md-12 enter">
												<button type="button"
													class="btn btn-block btn-sm btn-danger"
													onclick="mbrTempLoginPwSeek()">찾기</button>
											</div>
										</div>
										<p></p>
									</div>
								</form>
								<!-- 리로드 -> imsipw 확인시 ajax 후 변경처리 reload -->
							</div>

							<div class="tab-pane fade" id="pwfinder_1" style="display: none;">
								<form name="pwform" class="form-horizontal" >
									<h2>비밀번호 변경</h2>
									<!-- <p>비밀번호를 변경합니다.</p> -->
									<br />

									<div class="col-md-8">
										<div class="col-md-4 mgt4">변경 할 PW</div>
										<div class="col-md-8 mgt4">
											<input type="password" name="mbrLoginPw" id="mbrLoginPw_chk" class="form-control caps_lockchk"
												onchange="chkPWPolicy(this.value, this)" placeholder="Password">
										</div>
										<input type="hidden" name="imsi_mbrLoginPw"
											id="imsi_mbrLoginPw" value="">
										<div class="col-md-4 mgt4">PW 재확인</div>
										<div class="col-md-8 mgt4">
											<input type="password" class="form-control caps_lockchk"
												onchange="chkPWPolicy(this.value, this)" placeholder="Confirm Password" name="mbrLoginPw_check">
										</div>
									</div>

									<div class="col-md-12 enter">
										<button type="button" id="pwok"
											class="btn btn-block btn-sm btn-primary" onclick="updateMbrLoginPw(document.pwform)">변경</button>
									</div>
								</form>
								<form class="form-horizontal">
									<div class="col-md-12 mgt5" id="imsipwdisplay"
										style="display: none;">
										<div class="col-md-8">
											<div class="col-md-4">남은시간</div>
											<div class="col-md-8" id="time1" style="color: red"></div>
											<div class="col-md-8 col-md-offset-4">
												<input type="text" id="imsipw" class="form-control caps_lockchk"
													placeholder="ImsiPw...">
											</div>
										</div>
										<div>
											<button type="button" class="btn btn-sm btn-info" onclick="">확인</button>
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
</c:if>
--%>