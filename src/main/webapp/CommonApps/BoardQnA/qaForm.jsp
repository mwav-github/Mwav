<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//cdn.ckeditor.com/4.5.11/basic/ckeditor.js"></script>

<c:if test="${requestScope.check eq true }">
	<script type="text/javascript">
		alert('Success! Thank you! In the near future, our managers will contact you.');
		location.href = "/CustomerService/QnA/QnA.mwav";
	</script>
</c:if>
<c:if test="${requestScope.check eq false }">
	<script type="text/javascript">
		alert('Failure! Please check it again');
		history.go(-1);
	</script>
</c:if>
<script>
	function reCheckForm(formname) {

		var uqUserName = formname.uqUserName;
		var uqUserPhone = formname.uqUserPhone;
		var uqUserEmail = formname.uqUserEmail;
		var uqUserPw = formname.uqUserPw;
		var uqTitle = formname.uqTitle;
		var uqGroup = formname.uqGroup;
		var uqRules = formname.uqRules;
		var uqRules = formname.uqRulesCheck;
		//ckedtior객체
		var uqContent = CKEDITOR.instances['uqContent'];
		//폼 객체
		var uqContentCheck = ckEditorEmptyCheck(uqContent, "내용을 입력해주세요.");
		
		
		var robot_flag = robot_check();
		if (robot_flag == true) {
			if (uqContentCheck == true && emptyCheck(uqUserName, "이름을 입력해주세요.") == true
					&& emptyCheck(uqUserPhone, "핸드폰 번호을 입력해주세요.") == true
					&& emptyCheck(uqUserEmail, "이메일을 입력해주세요.") == true
					&& emptyCheck(uqGroup, "분류기준을 선택해주세요.") == true
					&& emptyCheck(uqTitle, "제목을 입력해주세요.") == true
					) {
				
				if(uqRules.checked == false){
					alert('개인정보 수집 동의를 해주세요.');
					return false;
				}
				
				if (chkEmailPolicy(uqUserEmail.value, uqUserEmail) == false) {
				    //이메일의 경우 onchange로 체크하는 경우 로딩시 계속 alert출력.  value="${sessionScope.member.mbrEmail} 부분때문
					uqUserEmail.focus();
					return false;
				}else{
				return true;
				}
			} else {
				if(uqContentCheck == false){
					formname.uqContent.focus();
				}
				return false;
			}
		} else {
			return false;
		}
		return false;

	}

	function insertQAForm() {

		//빈값 및 유효성 체크 ==================
		var for1mname = document.getElementById("QAForm");
		//alert(for1mname);
		//var zone1 = new Array(check_1, check_2, check_3, check_4, check_5)
		//**하나의 check로 하면  맨마지막만 true 전부 ok이다.
		//==================

		var check = reCheckForm(for1mname);

		if (check == true) {
			//alert('11');

			$
					.ajax({
						url : "/qa/qaFormAjax.mwav",
						type : "post",
						data : $("#QAForm").serialize(),
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						dataType : "json", // 데이터타입을 JSON형식으로 지정
						success : function(xmlStr) {

							//alert(xmlStr);
							//alert(typeof(xmlStr));
							//alert(trim(xmlStr));
							if (xmlStr != null) {
								//http://devbox.tistory.com/entry/%EB%B9%84%EA%B5%90-%EC%99%80-%EC%9D%98-%EC%B0%A8%EC%9D%B4-1
								//alert($("#resultpostseek").height());
								if (xmlStr === true) {
									//alert('정상등록');
									$("#alert_success").show();
									//$("#QAForm").reset();						
									//document.getElementById("insertQA").disabled = true;

									//전체 폼 리셋
									$('#QAForm').each(function() {
										this.reset();
									});
									//

									setTimeout(function() {
										$("#Contact").modal('hide');
										$("#alert_success").hide();
									}, 1500);

								} else if (xmlStr === false) {

									$("#alert_failure").show();
									//alert('등록실패');
									//안내 어떻게 해줄지 추후 구현 필요
									setTimeout(function() {
										$("#Contact").modal('hide');
										$("#alert_failure").hide();
									}, 1500);
								}

							}
						},
						error : function(xhr, status, error) {
							var errorMsg = 'status(code): ' + jqXHR.status
									+ '\n';
							errorMsg += 'statusText: ' + jqXHR.statusText
									+ '\n';
							errorMsg += 'responseText: ' + jqXHR.responseText
									+ '\n';
							errorMsg += 'textStatus: ' + textStatus + '\n';
							errorMsg += 'errorThrown: ' + errorThrown;
							alert(errorMsg);
							$("#alert_failure").show();
						}
					});
		} else {
			return false;
		}
	}

	//페이지 또는 타 페이지에서 QAFORM 클릭 해당 아이디 물고 오기.
	$(document).on("click", ".qaModal_Contact", function() {
		var uqInvoker = $(this).data('type');
		var uqInvoker_id = $(this).data('id');
		$(".modal-dialog #uqInvoker").val(uqInvoker);
		$(".modal-dialog #uqInvoker_id").val(uqInvoker_id);
	});
</script>
<!-- 소제목 -->
<!-- ----- 
색 : http://the3.tistory.com/49

<tr class="active">...</tr>
<tr class="success">...</tr>
<tr class="warning">...</tr>
<tr class="danger">...</tr>
<tr class="active">...</tr>

-->

<%--contact 모달--%>
<c:if test="${param.type ne 'page'}">
	<!-- line modal -->
	<div class="modal fade" id="Contact" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true"
		style="overflow: hidden">

		<%--성공/실패 레이어 팝업 --%>
		<div id="alert_success" class="alert alert-success alert-dismissable"
			style="z-index: 1500 !important; position: fixed; opacity: 1; right: 15px; display: none;">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			<strong>Success!</strong> Thank you! In the near future, our managers
			will contact you.
		</div>

		<div id="alert_failure" class="alert alert-danger alert-dismissable"
			style="z-index: 1500 !important; position: fixed; opacity: 1; right: 15px; display: none;">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			<strong>Failure!</strong> Please check it again
			<!-- Please try again. -->
		</div>
		<div class="modal-dialog" id="qamodal">
			<div class="modal-content">
				<!-- <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div> -->
				<div class="modal-body" style="overflow: auto; max-height: 400px;">

					<form class="form-horizontal" id="QAForm">
						<input TYPE="hidden" name="uqStatus" value=""> <input
							TYPE="hidden" name="before_Q_id" value="${before_Q_id }">

						<input type="hidden" name="uqInvoker" id="uqInvoker" value="" />
						<input type="hidden" name="uqInvoker_id" id="uqInvoker_id"
							value="" />
						<fieldset>

							<!-- Form Name -->
							<legend>
								<h4 class="text-color-gray">
									<Strong> Contact Us</Strong>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
								</h4>
							</legend>

							<p class="text-color-gray">Please use this form to ask your
								question. We will contact you shortly.</p>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="textinput">Name <span class="text-color-red"><strong>*</strong></span></label>
								<div class="col-md-8">
									<input name="uqUserName" placeholder="Enter Your Full Name"
										class="form-control input-md" required type="text">

								</div>
							</div>

							<!-- Prepended text-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="Phone">Phone <span class="text-color-red"><strong>*</strong></span></label>
								<div class="col-md-8">
									<div class="input-group">
										<span class="input-group-addon">+82</span> <input
											name="uqUserPhone" class="form-control" placeholder="Mobile"
											required type="text">
									</div>

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="website">Website</label>
								<div class="col-md-8">
									<input name="uqRelatedLink" placeholder="Enter Your Website"
										class="form-control input-md" type="text">
									<!-- <span class="help-block">Ex:
									Mwav.net</span> -->
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="email">E-Mail <span class="text-color-red"><strong>*</strong></span></label>
								<div class="col-md-8">
									<input name="uqUserEmail" placeholder="Enter Your E mail"
										class="form-control input-md" type="text"
										value="${sessionScope.member.mbrEmail}">

								</div>
							</div>


							<c:if test="${sessionScope.member eq null }">

								<%--비회원인 경우 --%>
								<div class="form-group">
									<label class="col-md-3 text-color-gray control-label"
										for="password">Password <span class="text-color-red"><strong>*</strong></span></label>
									<div class="col-md-8">
										<input id="uqUserPw" name="uqUserPw"
											placeholder="Enter Your Password"
											class="form-control input-md caps_lockchk" type="password"
											value="" onchange="chkPWPolicy(this.value, this)" required>

									</div>
								</div>
							</c:if>

							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="title">Select an issue <span
									class="text-color-red"><strong>*</strong></span>
								</label>
								<div class="col-md-8">
									<select class="form-control input-sm" name="uqGroup">
										<option value="">-- Please make a selection --</option>
										<option value="apply">서비스신청접수</option>
										<option value="gds">일반제품문의</option>
										<option value="tech">기술지원문의</option>
										<option value="biz">사업제휴문의</option>
										<option value="quota">온라인견적문의</option>
										<option value="error">사이트불편신고</option>
										<option value="etc">기타제안 및 문의</option>
									</select>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="title">Title <span class="text-color-red"><strong>*</strong></span>
								</label>
								<div class="col-md-8">
									<input name="uqTitle" placeholder="Title"
										class="form-control input-md" type="text">

								</div>
							</div>

							<!-- Textarea -->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="Message">Message <span class="text-color-red"><strong>*</strong></span>
								</label>
								<div class="col-md-8">
									<textarea class="form-control" rows="5" name="uqContent"
										placeholder="Enter Your Message"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-3"></div>
								<div class="col-md-8">

									<div class="g-recaptcha" name="recaptcha"></div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								role="button">Close</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="insertQA"
								class="btn btn-primary btn-hover-green" data-action="save"
								role="button" onClick="insertQAForm(this.form);">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${param.type eq 'page'}">

	<div class="row">

		<div class="col-md-3 pull-right hidden-xs hidden-sm">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Support Hours <i
							class="fa fa-chevron-up panel-minimise pull-right"></i>
					</h3>
				</div>
				<div class="panel-body">Don't worry! We will respond on the
					next business day. Sit tight!</div>
				<div class="list-group">
					<div class="list-group-item"
						id="Primary_Sidebar-Support_Hours-<strong>Open<_strong>_08:00-17:00_M-F">
						<i class="fa fa-smile-o"></i>&nbsp; <strong>Open</strong>
						08:00-17:00 M-F
					</div>
					<div class="list-group-item"
						id="Primary_Sidebar-Support_Hours-<strong>Closed<_strong>_Weekends">
						<i class="fa fa-frown-o"></i>&nbsp; <strong>Closed</strong>
						Weekends
					</div>
				</div>
			</div>

		</div>

		<!-- Container for main page display content -->
		<div class="col-md-9 pull-left">
			<form class="form-horizontal" id="QAFormPage" method="post"
				action="/qa/qaForm.mwav" onsubmit="return reCheckForm(this);">
				<input TYPE="hidden" name="uqStatus" value=""> <input
					TYPE="hidden" name="QnA_id" value="${before_Q_id }">

				<div class="form-group">
					<label class="col-sm-3 control-label" for="uqUserName">이름<span
						class="text-color-red"><strong>*</strong></span></label>
					<div class="col-sm-9">
						<input type="text" name="uqUserName" id="uqUserName" value=""
							placeholder="Enter Your Full Name"
							class="input_custom col-xs-12 col-sm-5">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일<span
						class="text-color-red"><strong>*</strong></span>
					</label>
					<div class="col-sm-9">
						<input type="text" name="uqUserEmail" id="uqUserEmail"
							value="${sessionScope.member.mbrEmail}"
							class="input_custom  col-xs-12 col-sm-5"
							placeholder="Enter Your E-mail" required>
					</div>
				</div>
				<c:if test="${sessionScope.member eq null }">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="uqUserPw">비밀번호<span
							class="text-color-red"><strong>*</strong></span>
						</label>
						<div class="col-sm-9">
							<input name="uqUserPw" placeholder="Enter Your password"
								class="input_custom col-xs-12 col-sm-5 caps_lockchk"
								type="password" value=""
								onchange="chkPWPolicy(this.value, this)" required>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputSubject">전화번호<span
						class="text-color-red"><strong>*</strong></span></label>
					<div class="col-sm-9">
						<input type="text" name="uqUserPhone" id="uqUserPhone" value=""
							placeholder="Tel Number" class="input_custom col-xs-12 col-sm-8"
							required>
					</div>
				</div>


				<hr class="hr_gray_separator">

				<div class="form-group">
					<label class="col-sm-3 control-label" for="uqTitle">제목<span
						class="text-color-red"><strong>*</strong></span></label>
					<div class="col-sm-9">
						<input type="text" name="uqTitle" id="uqTitle" value=""
							class="input_custom col-xs-12 col-sm-8" placeholder="Title">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="uqGroup">분류 <span
						class="text-color-red"><strong>*</strong></span>
					</label>
					<div class="col-sm-9">
						<select name="uqGroup" id="uqGroup"
							class="input_custom col-xs-12 col-sm-6">
							<option value="">-- Please make a selection --</option>
							<option value="apply">서비스신청접수</option>
							<option value="gds">일반제품문의</option>
							<option value="tech">기술지원문의</option>
							<option value="biz">사업제휴문의</option>
							<option value="quota">온라인견적문의</option>
							<option value="error">사이트불편신고</option>
							<option value="etc">기타제안 및 문의</option>
						</select>
					</div>
				</div>

				<hr class="hr_gray_separator">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="uqContent">내용 <span
						class="text-color-red"><strong>*</strong></span>
					</label>
					<div class="col-sm-9">
						<textarea name="uqContent" id="uqContent" rows="10"
							class="input_custom col-xs-12 col-sm-12 ckeditor"
							placeholder="Enter Your Message"></textarea>

					</div>
				</div>

				<hr class="hr_gray_separator">

				<div class="form-group mgt3">
					
					<div class="col-sm-3 col-md-3 hidden-xs">
					</div>
					

					<div class="col-sm-9 col-md-9 col-xs-12">
					
					<div class="checkbox checbox-switch switch-primary">
                                    <label>
                                        <input type="checkbox" name="uqRules" >
                                        <span></span>
                                        아래와 같은 개인정보의 수집/이용에 동의 합니다.<br>
                                    </label>
                                </div>

						<div class="txtarea mgt3" style="height: 200px;">
                    <strong>1. 수집하는 개인정보의 항목</strong>
                    회사는 회원가입, 원활한 고객상담, 서비스 제공을 위해 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
                    - 필수항목 : 이름, 이메일, 전화번호	

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


				<div class="form-group mgt1_8">
					<div class="col-xs-12 col-md-6 col-md-push-6">
						<div class="g-recaptcha" name="recaptcha"></div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12">
					<div class="pull-right">
						<input type="submit" class="btn-custom-default btn btn-primary"
							value="Submit" />
					</div>
				</div>
			</form>
		</div>
	</div>
</c:if>