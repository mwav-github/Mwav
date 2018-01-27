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
		//var formname;
		//alert(formname);
		var uqUserName = formname.uqUserName;
		//alert(uqUserName);
		//var uqUserName = document.getElementById("uqUserName");
		var uqUserPhone = formname.uqUserPhone;
		//var uqUserEmail = $('#uqUserEmail');
		//var uqUserPw = $('#uqUserPw');
		var uqContent = formname.uqContent;
		var uqUserEmail = formname.uqUserEmail;
		var uqUserPw = formname.uqUserPw;

		var uqTitle = formname.uqTitle;
		var uqGroup = formname.uqGroup;
		//$('#uqContent') 은 undefined

		var check_1 = emptyCheck(uqUserName, "이름을 입력해주세요.");
		if (check_1 == false) {
			uqUserName.focus();
			return false;
		}
		var check_2 = emptyCheck(uqUserPhone, "핸드폰 번호을 입력해주세요.");
		if (check_2 == false) {
			uqUserPhone.focus();
			return false;
		}

		var check_3 = emptyCheck(uqUserEmail, "이메일을 입력해주세요.");
		check_3 = chkEmailPolicy(uqUserEmail.value, uqUserEmail);
		if (check_3 == false) {
			uqUserEmail.focus();
			return false;
		}

		//회원인경우 해당되지 않음.
		if (uqUserPw != null) {
			var check_4 = chkPWPolicy(uqUserPw.value, uqUserPw);
			if (check_4 == false) {
				uqUserPw.focus();
				return false;
			}

		}
		var check_5 = emptyCheck(uqGroup, "분류기준을 선택해주세요.");
		if (check_5 == false) {
			uqGroup.focus();
			return false;
		}

		var check_6 = emptyCheck(uqTitle, "제목을 입력해주세요.");
		if (check_6 == false) {
			uqTitle.focus();
			return false;
		}

		var check_7 = emptyCheck(uqContent, "내용을 입력해주세요.");
		if (check_7 == false) {
			uqContent.focus();
			return false;
		}

		//alert('d'+formname.recaptcha.attr('data-widget-id'));
		//jQuery('#your_recaptcha_box_id').attr('data-widget-id')
		var robotCheck = robot_check($(formname).find("[name=recaptcha]").attr(
				'data-widget-id'));
		if (robotCheck == false) {
			return false;
		}

		var check = false;
		// && check_4 == true 패스워드는 회원인경우 없으니까 
		if (check_1 == true && check_2 == true && check_3 == true
				&& check_5 == true && check_6 == true && check_7 == true
				&& robotCheck == true) {
			check = true;
			return true;

		} else {
			check = false;
			return false;
		}

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
									<input id="uqUserName" name="uqUserName"
										placeholder="Enter Your Full Name"
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
											id="uqUserPhone" name="uqUserPhone" class="form-control"
											placeholder="Mobile" required type="text">
									</div>

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="website">Website</label>
								<div class="col-md-8">
									<input id="uqRelatedLink" name="uqRelatedLink"
										placeholder="Enter Your Website" class="form-control input-md"
										type="text">
									<!-- <span class="help-block">Ex:
									Mwav.net</span> -->
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="email">E-Mail <span class="text-color-red"><strong>*</strong></span></label>
								<div class="col-md-8">
									<input id="uqUserEmail" name="uqUserEmail"
										placeholder="Enter Your E mail" class="form-control input-md"
										type="text" value="${sessionScope.member.mbrEmail}">

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
											value="" required>

									</div>
								</div>
							</c:if>

							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="title">Select an issue <span
									class="text-color-red"><strong>*</strong></span>
								</label>
								<div class="col-md-8">
									<select class="form-control input-sm" id="uqGroup"
										name="uqGroup">
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
									<input id="uqTitle" name="uqTitle" placeholder="Title"
										class="form-control input-md" type="text">

								</div>
							</div>

							<!-- Textarea -->
							<div class="form-group">
								<label class="col-md-3 text-color-gray control-label"
									for="Message">Message <span class="text-color-red"><strong>*</strong></span>
								</label>
								<div class="col-md-8">
									<textarea class="form-control" rows="5" id="uqContent"
										name="uqContent" placeholder="Enter Your Message"></textarea>
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
					<label class="col-sm-3 control-label" for="uqUserName">Name<span
						class="text-color-red"><strong>*</strong></span></label>
					<div class="col-sm-9">
						<input type="text" name="uqUserName" id="uqUserName" value=""
							placeholder="Enter Your Full Name"
							class="input_custom col-xs-12 col-sm-5">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">Email<span
						class="text-color-red"><strong>*</strong></span> 
					</label>
					<div class="col-sm-9">
						<input type="email" name="uqUserEmail" id="uqUserEmail"
							value="${sessionScope.member.mbrEmail}"
							class="input_custom  col-xs-12 col-sm-5"
							placeholder="Enter Your E-mail">
					</div>
				</div>
				<c:if test="${sessionScope.member eq null }">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="uqUserPw">Password<span
							class="text-color-red"><strong>*</strong></span>
						</label>
						<div class="col-sm-9">
							<input id="uqUserPw" name="uqUserPw"
								placeholder="Enter Your password"
								class="input_custom col-xs-12 col-sm-5 caps_lockchk"
								type="password" value="" required>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputSubject">Phone<span
						class="text-color-red"><strong>*</strong></span></label>
					<div class="col-sm-9">
						<input type="text" name="uqUserPhone" id="uqUserPhone" value=""
							placeholder="Tel Number" class="input_custom col-xs-12 col-sm-8"
							required>
					</div>
				</div>


				<hr class="hr_gray_separator">

				<div class="form-group">
					<label class="col-sm-3 control-label" for="uqTitle">Title</label>
					<div class="col-sm-9">
						<input type="text" name="uqTitle" id="uqTitle" value=""
							class="input_custom col-xs-12 col-sm-8" placeholder="Title">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="uqGroup">Select
						an issue <span class="text-color-red"><strong>*</strong></span>
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
					<label class="col-sm-3 control-label" for="uqContent">Message
						<span class="text-color-red"><strong>*</strong></span>
					</label>
					<div class="col-sm-9">
						<textarea name="uqContent" id="uqContent" rows="10"
							class="input_custom col-xs-12 col-sm-12 ckeditor"
							placeholder="Enter Your Message"></textarea>
						
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