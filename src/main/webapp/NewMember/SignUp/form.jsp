<%-- 신규회원 모집 form --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<jsp:include page="/bizlogin/sementic/meta.jsp" flush="false" />
</head>
<body>
    <header>
        <jsp:include page="/NewMember/sementic/header.jsp" flush="false" />
    </header>

	<section class="section-content padding-y">
		<div class="card mx-auto" style="max-width: 520px; margin-top: 0px;">
			<article class="card-body">
				<header class="mb-4">
					<form action="<c:url value='/newMember/register' />" method="POST" onsubmit="return pmtSubmit();">
						<div class="form-group">
							<label class="font-weight-bold" alt="Login ID">성함</label>
							<input id="name" name="name" type="text" class="form-control"
								   onfocusout='validateCheck("name");' placeholder="성함을 작성해주세요.">
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Create password">이메일</label>
							<input id="email" name="email" class="form-control"
								onfocusout='validateCheck("email");' placeholder="예) mwav@mwav.net">
						</div>
						<div class="form-group ">
							<label class="font-weight-bold" alt="Repeat password">희망 분야</label>
							<input name="hopeField" id="hopeField" class="form-control"
                                   placeholder="원하시는 희망 분야를 작성해주세요.">
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Name">나이</label>
							<input name="age" id="age" maxlength="20"
								class="form-control" type="text" placeholder="나이를 입력해주세요.">
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Name">경력</label>
							<textarea name="career" id="career" rows="5" style="resize:none;"
                                      class="form-control" placeholder="경력을 입력해주세요." ></textarea>
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Email">참여 취지</label>
                            <textarea name="purpose" id="purpose" rows="5" style="resize:none;"
                                      class="form-control" placeholder="참여 취지을 입력해주세요." ></textarea>
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Gender">성별</label>
							<div class="form-group">
								<label class="custom-control custom-radio custom-control-inline">
									<input class="custom-control-input" checked="" type="radio" name="gender" value="M">
									<span class="custom-control-label">남자 </span>
								</label>
								<label class="custom-control custom-radio custom-control-inline">
									<input class="custom-control-input" type="radio" name="gender" value="F">
									<span class="custom-control-label"> 여자 </span>
								</label>
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block" alt="Register">접수하기</button>
							<p class="alert alert-success mt-3">
								<i class="fa fa-envelope-square mt-2"></i> 정상적으로 접수 되었으며, 수 일내 해당 이메일로 연락드리겠습니다.
							</p>
						</div>
					</form>
			</article>
		</div>
		<br>
		<br>
	</section>

	<footer class="section-footer border-top">
	</footer>

	<script type="text/javascript">
		let NameCheckYN = false; //이름
		let EmailCheckYN = false; //이메일

		//타입별 정규식, 정규식 표현은 멤버 회원가입과 동일
		function regexCheck(type, value) {
			let regex = "";
			switch (type) {

			case 'name':
				regex = /^[가-힣]+$/g.test(value);
				if (regex)
					NameCheckYN = true;
				else
					return false;
				break;

			case 'email':
				regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/g.test(value);
				if (regex)
					EmailCheckYN = true;
				else
					return false;
				break;
			default:
				alert('Error!\n잘못된 타입입니다.');
			}

			return true; //유효성 체크에 이상이없다면 true
		}
		
		function validateCheck(type) {
			let value = $('input[name=' + type + ']').val();
			//정규식 유효성 체크
			if (regexCheck(type, value)) {
				$('input[name=' + type + ']').css("border", "solid 3px greenyellow");
				$('#' + type + 'False').css('display', 'none'); //숨김
			} else {
				$('input[name=' + type + ']').css("border", "solid 3px red");
				$('#' + type + 'False').css('display', 'block'); //정규식 설명
			}
		}

		//모든 값들이 유효하다면 submit
		function pmtSubmit() {
			if (NameCheckYN && EmailCheckYN) {
				return true;
			} else {
				alert('잘못된 입력이 있습니다.');
			}
			return false;
		}

		function sendEmail() {
			$.ajax({
				url : '/accounts/email/certify',
				data : "email=" + $('input[name=pmtMail]').val() + "&account=pmt" + "&id=" + $('input[name=pmtLoginId]').val(),
				type : "POST",
				async : false,
				success : function(data) {
					return true;
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					alert('Error!\n관리자에게 문의하여 주시기 바랍니다.\n' + err);
					return false;
				}
			});
		}
	</script>
</body>
</html>