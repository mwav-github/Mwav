<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<!-- ========================= Head & Meta Area ========================= -->
<head>
<jsp:include
	page="/Promoter/PartsOfContent/SiteHeader/PmtSiteMetaHeader.jsp"
	flush="false" />
<script type="text/javascript">
	let IdCheckYN = false;		//아이디
	let PwdCheckYN = false;		//비밀번호
	let PwdCheck2YN = false;	//비밀번호확인
	let NameCheckYN = false;	//이름
	let PhoneCheckYN = false;	//핸드폰
	let EmailCheckYN = false;	//이메일
	let PmtPolicyChk = false;	//이메일
	// jquery ready start
	$(document).ready(function() {
	});
	function ajaxIdCheck(type,value){
		let result = false;

		$.ajax({
			url:'/promoter/pmtLoginIdCheck.mwav',
			data:{
				type:type,
				value:value
			},
			async: false,
			success:function(data){
				//해당 아이디가 존재하면 1, 없는 아이디면 0
				if(data <= 0){
					alert('해당 아이디는 사용하실수 있는 아이디입니다.');
					result = true;
				}else{
					alert('이미 존재하는 아이디입니다.');
					result = false;
				}
			},
			error:function(err){
				alert('Error!\n관리자에게 문의하여 주시기 바랍니다.');
				result = false;
			}
		});

		return result;
	}
	//타입별 정규식, 정규식 표현은 멤버 회원가입과 동일
	function regexCheck(type, value){
		let regex = ""
		switch(type){
			case 'pmtLoginId' :
				//아이디의 경우 정규식 유효성 체크 후, 중복여부 확인
				regex = /[a-zA-Z0-9_-]{4,20}$/g.test(value);
				if(regex){
					//아이디 중복 검사
					IdCheckYN = ajaxIdCheck(type,value);
					return IdCheckYN;
				}else{
					alert('유효하지 않은 아이디입니다. \n4~20자 사이의 영문,숫자, -_ 만 사용할 수 있습니다.')
					return false;
				}
				break;

			case 'pmtLoginPw' :
				regex = /^(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])(?=.*[0-9])(?=.*[a-zA-Z])[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"0-9a-zA-Z]{8,255}$/g.test(value)
				// 비밀번호같은경우 사용자 변심으로 인해 수정할수 있기 때문..
				let pwdChk = $('input[name=pmtLoginPwChk]').val();
				if(pwdChk.length != 0){
					if(value != pwdChk){
						$('input[name=pmtLoginPwChk]').css("border","solid 3px red");
						$('#pmtLoginPwChkFalse').css('display','block');
					}else{
						$('input[name=pmtLoginPwChk]').css("border","solid 3px greenyellow");
						$('#pmtLoginPwChkFalse').css('display','none');	//숨김
					}
				}

				if(regex)
					PwdCheckYN = true;
				else
					return false;
				break;

			case 'pmtLoginPwChk' :
				let pwd = $('input[name=pmtLoginPw]').val();
				if(pwd != value || pwd.length == 0)
					return false;
				else
					PwdCheck2YN = true;
				break;

			case 'pmtLastName': case 'pmtFirstName' :
				regex = /^[가-힣]+$/g.test(value);
				if(regex)
					NameCheckYN = true;
				else
					return false;
				break;

			case 'pmtCellularPhone' :
				regex = /^\d{3}-\d{3,4}-\d{4}$/g.test(value);
				if(regex)
					PhoneCheckYN = true;
				else
					return false;
				break;

			case 'pmtMail' :
				regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/g.test(value);
				if(regex)
					EmailCheckYN = true;
				else
					return false;
				break;
			default : alert('Error!\n잘못된 타입입니다.');
		}

		return true;	//유효성 체크에 이상이없다면 true
	}
	function validateCheck(type){
		let value = $('input[name='+ type +']').val();
		//정규식 유효성 체크
		if(regexCheck(type, value)){
			$('input[name='+ type +']').css("border","solid 3px greenyellow");
			$('#'+ type +'False').css('display','none');	//숨김
		}else{
			$('input[name='+ type +']').css("border","solid 3px red");
			$('#'+ type +'False').css('display','block');	//정규식 설명
		}
	}

	//모든 값들이 유효하다면 submit
	function pmtSubmit(){
		let pmtPolicyChk=$('#pmtPolicyChk').is(":checked")
		if(!pmtPolicyChk){
			alert("약관에 동의하여 주시기 바랍니다.")
			return false;
		}
		validateCheck('pmtLoginId')
		if(IdCheckYN && PwdCheckYN && PwdCheck2YN && NameCheckYN && PhoneCheckYN && EmailCheckYN){
			return true;
		}else{
			alert('부적절한 값이 있습니다.');
		}
		return false
	}


	// jquery end
</script>
</head>
<!-- ========================= Head & Meta Area END ========================= -->

<body>
	<!-- ========================= Header ========================= -->
	<header class="section-header">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteHeader/PmtSiteHeader.jsp"
			flush="false" />
	</header>
	<!-- section-header.// -->
	<!-- ========================= Header END ========================= -->


	<!-- ========================= SECTION ONE ========================= -->
	<!-- 	<section class="section-pagetop bg">
		<div class="container">
			<h2 class="title-page">Wish List</h2>
		</div>
		container // 
	</section> -->
	<!-- ========================= SECTION ONE END// ========================= -->

	<!-- ========================= SECTION TWO ========================= -->
	<section class="section-content padding-y">

		<!-- ============================ COMPONENT REGISTER   ================================= -->
		<div class="card mx-auto" style="max-width: 520px; margin-top: 0px;">
			<article class="card-body">
				<header class="mb-4">
					<!-- 					<h4 class="card-title">Sign up</h4>
 -->
				</header>
<%--			<form action="/member/Login.mwav">--%>
				<form action="/bizLogin/promoter/facilitator/pmtForm.mwav" method="POST" onsubmit="return pmtSubmit();">
					<div class="form-group">
						<label class="font-weight-bold" alt="Login ID">아이디</label> <input
							id="pmtLoginId" name="pmtLoginId" type="text" class="form-control"
							placeholder="예)BizLogin12 - 4~20자 사이의 영문,숫자,-_ 만 사용">
					</div>

					<div class="form-group">
						<label class="font-weight-bold" alt="Create password">비밀번호</label>
						<input id="pmtLoginPw" name="pmtLoginPw" class="form-control" type="password"
							   onfocusout='validateCheck("pmtLoginPw");' placeholder="비밀번호를 입력해주세요.">
					</div>

					<div class="form-group ">
						<label class="font-weight-bold" alt="Repeat password">비밀번호
							확인</label> <input name="pmtLoginPwChk" id="pmtLoginPwChk"
											  class="form-control" type="password"
											  onfocusout='validateCheck("pmtLoginPwChk");' placeholder="비밀번호를 한번 더 입력해주세요.">
					</div>

					<div class="form-group">
						<label class="font-weight-bold" alt="Name">성(First name)</label>
						<input name="pmtFirstName" id="pmtFirstName" maxlength="20"
							   onfocusout='validateCheck("pmtFirstName");'  class="form-control"
							   type="text" placeholder="성을 입력해주세요.">
					</div>
					<div class="form-group">
						<label class="font-weight-bold" alt="Name">이름(Last name)</label>
						<input name="pmtLastName" id="pmtLastName" maxlength="20"
							   onfocusout='validateCheck("pmtLastName");' class="form-control"
							   type="text" placeholder="이름을 입력해주세요.">
					</div>

					<!-- form-row end.// -->
					<div class="form-group">
						<label class="font-weight-bold" alt="Email">이메일</label>
						<input name="pmtMail" id="pmtMail" onfocusout='validateCheck("pmtMail");'
							type="email" class="form-control"
							placeholder="예)BizLogin12@biz.com">
						<!-- <small class="form-text text-muted">We'll
							never share your email with anyone else.</small> -->
					</div>
					<!-- form-row end.// -->
					<div class="form-group">
						<label class="font-weight-bold">휴대폰</label>
						<input name="pmtCellularPhone" type="text" onfocusout='validateCheck("pmtCellularPhone");'
							class="form-control" placeholder="숫자만 입력해주세요.">
					</div>
					<!-- form-group end.// -->
					<div class="form-group">
						<label class="font-weight-bold" alt="Gender">성별</label>
						<div class="form-group">
							<label class="custom-control custom-radio custom-control-inline">
								<input class="custom-control-input" checked="" type="radio"
								name="pmtGender" value="M"> <span
								class="custom-control-label">남자 </span>
							</label> <label class="custom-control custom-radio custom-control-inline">
								<input class="custom-control-input" type="radio" name="pmtGender"
								value="F"> <span class="custom-control-label">
									여자 </span>
							</label>
						</div>
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<label class="custom-control custom-checkbox">
							<input id="pmtPolicyChk"  type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label">
								BizLogin의 <a href="#" data-toggle="modal"
									data-target="#pmtPolicy">이용약관과 개인정보 취급방침</a>에 동의합니다. (필수)
							</div>
						</label>
					</div>
					<div class="form-group">
						<label class="custom-control custom-checkbox"> <input
							type="checkbox" class="custom-control-input" checked="">
							<div class="custom-control-label">신규 제품 및 이벤트 알림 SMS/메일 수신
								(선택)</div>
						</label>
					</div>

					<div class="form-group">
						<button  type="submit" class="btn btn-primary btn-block"
							alt="Register">가입하기</button>
						<p class="alert alert-success mt-3">
							<i class="fa fa-envelope-square mt-2"></i> 가입 후 인증 요청 메일이 되며, 30분
							이내에 인증을 완료하셔야 최종 회원가입이 완료됩니다.
						</p>
					</div>
					<!-- form-group end.// -->
				</form>
			</article>
			<!-- card-body.// -->
		</div>
		<!-- card .// -->
		<p class="text-center mt-4">
			이미 가입하셨나요.? <a href="/Promoter/Facilitator/PmtLogin.mwav">로그인</a>
		</p>
		<br> <br>
		<!-- ============================ COMPONENT REGISTER  END.// ================================= -->

	</section>
	<!-- ========================= SECTION TWO END// ========================= -->



	<!-- ========================= FOOTER ========================= -->
	<footer class="section-footer border-top">
		<jsp:include
			page="/Promoter/PartsOfContent/SiteFooter/PmtSiteFooter.jsp"
			flush="false" />
	</footer>
	<!-- ========================= FOOTER END // ========================= -->



</body>
</html>