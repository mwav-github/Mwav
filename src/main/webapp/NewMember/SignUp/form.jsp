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
					<div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Login ID">성함</label>
							<input id="name" name="name" type="text" class="form-control"
								   onfocusout='validateCheck("name");' placeholder="성함을 작성해주세요.">
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Create password">이메일</label>
							<input id="email" name="email" class="form-control"
								onfocusout='validateCheck("email");' placeholder="예) study@gmail.com">
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
							<label class="font-weight-bold" alt="Name">경력 (기간 및 프로젝트 경험 등)</label>
							<textarea name="career" id="career" rows="5" style="resize:none;"
                                      class="form-control" placeholder="경력을 입력해주세요." ></textarea>
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Email">참여 취지</label>
                            <textarea name="purpose" id="purpose" rows="5" style="resize:none;"
                                      class="form-control input_custom col-xs-12 col-sm-12 ckeditor" placeholder="참여 취지을 입력해주세요." ></textarea>
						</div>
						<div class="form-group">
							<label class="font-weight-bold" alt="Gender">성별</label>
							<div class="form-group">
								<label class="custom-control custom-radio custom-control-inline">
									<input class="custom-control-input" checked="" type="radio" name="gender" value="1">
									<span class="custom-control-label">남자 </span>
								</label>
								<label class="custom-control custom-radio custom-control-inline">
									<input class="custom-control-input" type="radio" name="gender" value="0">
									<span class="custom-control-label"> 여자 </span>
								</label>
							</div>
						</div>

<%--						<!-- 약관 안내 박스 START -->
						<hr class="hr_gray_separator">

						<div class="form-group">

							<div class="">
							</div>

							<div class="font-weight-bold">

								<div class="checkbox checbox-switch switch-primary">
									<label>
										<input type="checkbox" name="uqRules" >
										<span></span>
										아래와 같은 개인정보의 수집/이용에 동의 합니다.<br>
									</label>
								</div>

								<div class="txtarea" style="height: 200px;">
									<strong>1. 수집하는 개인정보의 항목</strong>
									회사는 회원가입, 원활한 고객상담, 서비스 제공을 위해 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
									- 필수항목 : 성함, 이메일, 나이

									또한 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
									- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록 등

									아래의 회사(단체)정보도 수집되나, 이는 개인정보에 해당하지 않습니다. 다만, 개인 사업자 등의 특수한 경우에 한해 아래의 정보 중 개인정보가 포함되어 있을 수 있습니다.
									- 필수항목 : 도메인 정보, 회사(단체)명, 대표자명, 대표주소, 대표번호(유선), 사업자 등록번호, 법인 등록번호, 고유번호
									- 선택항목 : 팩스번호

									<strong>2. 개인정보의 수집 및 이용목적</strong>
									가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
									컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인확인, 구매 및 요금 결제, 요금추심

									나. 회원관리
									회원제 서비스 제공, 개인식별, 이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정이용 행위 제재, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동의 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인

									다. 신규 서비스 개발 및 마케팅?광고에의 활용
									신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 정보 및 참여기회 제공, 광고성 정보 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계

									3. 개인정보의 보유 및 이용기간
									이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.

									- 계약 또는 청약철회 등에 관한 기록
									보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
									보존 기간 : 5년

									- 대금결제 및 재화 등의 공급에 관한 기록
									보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
									보존 기간 : 5년

									- 전자금융 거래에 관한 기록
									보존이유 : 전자금융거래법
									보존 기간: 5년

									- 소비자의 불만 또는 분쟁처리에 관한 기록
									보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
									보존 기간 : 3년

									- 웹사이트 방문기록
									보존 이유 : 통신비밀보호법
									보존 기간 : 3개월
								</div>
							</div>
						</div>

						<hr class="hr_gray_separator">
						<!-- 약관 안내 박스 END -->--%>

						<div class="form-group">
							<label>링크 공유 : </label>
							<a class="btn btn-social-icon btn-kakao"
							   onClick="sendSns()">
								<span class="icon-kakao"> </span>
							</a>
						</div>

						<div class="form-group">
							<button id= "regist_btn" type="button" class="btn btn-primary btn-block" alt="Register" style="display: block" onclick="memberRegist()" style="display: none">접수하기</button>
							<div id= "joining_btn" class="btn btn-primary btn-block" alt="Register" style="display: none"><img src="/Images/btn_loading.gif" width="12%"></div>
							<div id= "success_btn" class="btn btn-success btn-block" alt="Register" style="display: none">접수완료</div>

							<p id= "success_msg" class="alert alert-success mt-3" style="display: none">
								<i class="fa fa-envelope-square mt-2"></i> 정상적으로 접수 되었으며, 수 일내 해당 이메일로 연락드리겠습니다.
							</p>
							<p id= "failure_msg" class="alert alert-danger mt-3" style="display: none">
								<i class="fa fa-envelope-square mt-2"></i> 접수 중 오류가 발생하였습니다, <br>itstudy136@gmail.com 메일주소로 접수 내용을 전달해주시면 수 일내로 회신드리겠습니다
							</p>

						</div>
					</div>
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

        // 마스터 메일로 발송
		function sendEmail() {

			var data = {
				email : $('input[name=email]').val(),
				name : $('input[name=name]').val(),
				hopeField : $('input[name=hopeField]').val(),
				age : $('input[name=age]').val(),
				career : $('textarea[name=career]').val(),
				purpose : CKEDITOR.instances['purpose'].getData(),
				gender : $('input[name=gender]:checked').val()
			};

			$.ajax({
				url : '/newMember/emailSend',
				data : JSON.stringify(data),
				type : "POST",
				contentType : "application/json",
				async : true,
				success : function(res_data) {
					console.log('!success send mail');
					return true;
				},
				error : function(request, status, error) {
					console.log('fail send mail')
					return false;
				}
			});
		}

		// 접수자에게 접수완료 메일 발송
		function sendEmailToNewMember() {

			var data = {
				email : $('input[name=email]').val()
			};

			$.ajax({
				url : '/newMember/emailSendToNewMember',
				data : JSON.stringify(data),
				type : "POST",
				contentType : "application/json",
				async : true,
				success : function(res_data) {
					console.log('!success send mail to New Member');
					return true;
				},
				error : function(request, status, error) {
					console.log('fail send mail to New Member')
					return false;
				}
			});
		}

        // 접수신청 내용을 입력
        function memberRegist(){
/*
			if($('input[name=uqRules]').is(':checked') == false){
				alert('개인정보 수집 동의를 해주세요.');
				return false;
			}
*/

            //모든 값들이 유효하다면 submit
            if (NameCheckYN && EmailCheckYN) {
				$("#regist_btn").hide();
				$("#joining_btn").show();

				var data = {
					email : $('input[name=email]').val(),
					name : $('input[name=name]').val(),
					hopeField : $('input[name=hopeField]').val(),
					age : $('input[name=age]').val(),
					career : $('textarea[name=career]').val(),
					purpose : CKEDITOR.instances['purpose'].getData(),
					gender : $('input[name=gender]:checked').val()
				};

				// 유효성 검증에 이상없음 접수정보를 서버에 요청
				$.ajax({
					url : '/newMember/register',
					data : JSON.stringify(data),
					type : 'POST',
					contentType : "application/json",
					async : false,
					success : function (res_data){
						$("#joining_btn").hide();
						$("#success_btn").show();
						$("#success_msg").show();

						// 정상적으로 DB에 접수 정보가 입력되면 webmaster 계정으로 메일을 보낸다
						sendEmail();
						// 정상적으로 webmaster 계정으로 메일을 보내면 접수자에게 접수완료메일을 발송한다
						//sendEmailToNewMember();
					},
					error : function(request, status, error){
						$("#failure_msg").show();
					}
				})

            }else{
                alert('성함과 이메일을 정확히 입력해주시기 바랍니다.');
			}

        }

	</script>
</body>
</html>