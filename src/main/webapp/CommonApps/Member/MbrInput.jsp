<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- container 안에 포함시키면 된다. 
http://planbong.tistory.com/531
-->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>

<script>
	//http://www.nextree.co.kr/p11205/
	//http://godpage.tistory.com/entry/Ajax%EC%A0%95%EB%A6%AC-2-XMLHttpRequest%EC%9D%98-%EB%A9%94%EC%84%9C%EB%93%9C%EC%99%80-%ED%94%84%EB%A1%9C%ED%8D%BC%ED%8B%B0	
	//http://invincure.tistory.com/100
	//http://www.ppomppu.co.kr/zboard/view.php?id=developer&no=8206
	//http://hellogk.tistory.com/84
	//http://java.ihoney.pe.kr/283
	//http://techknowdger.blogspot.kr/2014/02/sping-db-json-ajax.html

	//https://developer.mozilla.org/ko/docs/AJAX/Getting_Started
	var xhr;
	function createXhr() {
		if (window.ActiveXObject) { // IE 이전버전
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xhr = new XMLHttpRequest();
		}
	}

	function idcheck() {
		var id = document.getElementsByName("mbrLoginId")[0].value;
		//alert(id);
		
		//유효성 체크 
		chkLoginPolicy();
		
		var queryString = "mbrLoginId=" + id;
		if (id.length < 6) {
			document.getElementById("idcheckLayer").innerHTML = "<font color=red>6자리 이상 입력하세요.</font>";
		} else {
			// 1. XMLHttpReqeust 객체 생성
			createXhr();
			// 2. 이벤트 핸들러 등록
			xhr.onreadystatechange = callback; // callback 함수를 등록
			// 3. open()를 통해 요청관련 설정을 설정
			xhr.open("POST", "/member/mbrLoginIdCheck.do", true);
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
				var resTxt1 = xhr.responseText; // 서버가 보낸 응답 text
				//console.log(resTxt);
				var resTxt = resTxt1.trim(); // 공백제거 안하면 같은게 안됨 
				var imsiresTxt = "<font color=red><strong>이미 등록된 ID 입니다. 재 입력해주세요.</strong></font>";
				//alert(resTxt);
				//alert(imsiresTxt);
				if (resTxt == imsiresTxt) {
					//alert('1');
					document.getElementById("idcheckLayer").innerHTML = resTxt;
					document.getElementsByName("mbrLoginId")[0].value = "";
					document.getElementsByName("mbrLoginId")[0].focus();
					return false;
				} else {
					//alert('11');
					document.getElementById("idcheckLayer").innerHTML = resTxt;

				}
			} else {
				alert("요청 처리가 정상적으로 되지 않았습니다.\n" + xhr.status);
			}
		}
	}

	function msubmit() {
		/* $("change_record").validate({
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
		    	mbrLoginId: {
		            required : true,
		            minlength : 5,    
		        },
		        mbrLoginPw: {
		            required : true,
		            minlength : 10
		        },
		        mbrEmail: {
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
		});	 */
		document.change_record.submit();
	}
</script>
<script>
	
</script>

<!-- 크기를 줄이고 싶으면 row -->
<div class='container'>
	<div class='panel panel-primary dialog-panel'>
		<div class='panel-heading'>
			<h5>Mwav - Member Registration</h5>
		</div>
		<div class='panel-body'>
			<form role="form" class='form-horizontal' name="change_record" method="post"
				action="/member/mbrForm.do">
				<%--action="/member/memberForm.do" --%>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_accomodation'>Login Id</label>

					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-11'>
								<input type="text" class="form-control" name="mbrLoginId"
									id="chkLoginId" placeholder="예) mymg2002" 
									onchange="idcheck()" maxlength="20" required>
							</div>
						</div>
					</div>
					<!-- 
					ID 중복확인 버튼 클릭없이도 가입 가능하게끔 되어있어서 
					VALIDATION 생각하는 중 ~! 
					> 그냥 AJAX 이기 때문에 자체 무조권 변경하게 끔 설정 
					<p class="col-md-2">
						<button class="btn btn-primary btn-block" type="button"
							onclick="idcheck()">ID중복확인</button>
					</p>
					 -->
					<p class="col-md-4 col-md-offset-4">
						<span id="idcheckLayer"></span>
					</p>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_accomodation'>Password</label>

					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-11'>
								<input type="password" class="form-control" name="mbrLoginPw"
									id="chkLoginPW" placeholder="예) 8자리이상" value=""
									onchange="chkPWPolicy()" required>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_title'>Name</label>
					<div class='col-md-8'>
						<!-- <div class='col-md-2'>
							<div class='form-group internal'>
								<select class='form-control' name="" id='id_title'>
									<option>Mr</option>
									<option>Ms</option>
									<option>Mrs</option>
									<option>Miss</option>
									<option>Dr</option>
								</select>
							</div>
						</div> -->
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="mbrFirstName"
									id='mbrFirstName' placeholder='First Name' type='text' required>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="mbrMiddleName"
									id='mbrMiddleName' placeholder='Middle Name' type='text'>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input class='form-control' name="mbrLastName" id='mbrLastName'
									placeholder='Last Name' type='text' required>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_adults'>Phone</label>
					<div class='col-md-8'>
						<div class='col-md-2'>
							<div class='form-group internal'>
								<input type='text' class='form-control col-md-8'
									name="mbrCellPhone_1" placeholder='010' value="" required>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input type='text' class='form-control' name="mbrCellPhone_2"
									placeholder='3180' value="" required>
							</div>
						</div>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<input type='text' class='form-control' name="mbrCellPhone_3"
									placeholder='4451' value="" required>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2'
						for='id_email'>E-mail</label>
					<div class='col-md-6'>
						<div class='form-group'>
							<div class='col-md-11'>
								<input class='form-control' name="mbrEmail" id='chkEmail'
									placeholder='E-mail' type='text' onchange="chkEmailPolicy()"
									required>
							</div>
						</div>
					</div>
				</div>
				<div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2' for='id_pets'>Address</label>
					<p class="col-md-2 col-md-offset-4">
						<button class="btn btn-primary btn-block" type="button"
							data-toggle="modal" data-target=".modal_post"
							onclick="showhide();">주소찾기</button>

					</p>
					<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->
				</div>
				<!-- disable는 제출되지 않는다 즉 값이 전달되지 않음. *중요 -->
				<div class='form-group'>
					<div class="col-md-offset-4 col-md-6">
						<div class='col-md-11'>
							<input class='form-control' name="mbrZipcode" id='Zipcode'
								type='text' placeholder='우편번호' value ="" readonly="readonly">
						</div>
						<!-- <p class="col-md-1" style="text-align: center">
						<strong>-</strong>
					</p>
					<div class='col-md-2'>
						<input class='form-control' name="mbrZipcode_2" id='id_first_name'
							type='text' disabled>
					</div> -->

						<div class="enter hidden-xs hidden-sm"></div>
						<div class='col-md-11'>
							<input name="mbrAddress_1" class='form-control' id='Address'
								placeholder='주소' type='text' value ="" readonly="readonly">
						</div>
						<div class="enter hidden-xs hidden-sm"></div>

						<div class="col-md-11">
							<input name="mbrAddress_2" class="form-control" 
								 placeholder='나머지 주소' type="text"  />
						</div>
						
						<div class="enter"></div>
					</div>
				</div>

				<div class='form-group pull-right'>
					<%--pull-right 너무 끝까지 간다. --%>
					<div style="padding-right: 50px;">
						<button type="submit" class='btn btn-lg btn-primary'>
							<i class="glyphicon glyphicon-edit"></i>
						</button>
						<%-- incldue 시에는 submit이 아니라 자바스크립트로 처리 --%>

						<button class='btn btn-lg btn-danger'
							onClick="javascript:history.go(-1)">
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

