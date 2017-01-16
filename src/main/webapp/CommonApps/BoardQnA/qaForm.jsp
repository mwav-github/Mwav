<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>

<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<script>
	function insertQAForm() {
		$.ajax({
			url : "/qa/qaForm.do",
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
					} else if (xmlStr === false) {

						$("#alert_failure").show();
						//alert('등록실패');
					}

				}
			},
			error : function(xhr, status, error) {
				var errorMsg = 'status(code): ' + jqXHR.status + '\n';
				errorMsg += 'statusText: ' + jqXHR.statusText + '\n';
				errorMsg += 'responseText: ' + jqXHR.responseText + '\n';
				errorMsg += 'textStatus: ' + textStatus + '\n';
				errorMsg += 'errorThrown: ' + errorThrown;
				alert(errorMsg);
				$("#alert_failure").show();
			}
		});
	}
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

<!-- line modal -->
<div class="modal fade" id="Contact" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">

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
		<strong>Failure!</strong> Please try again.
	</div>
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div> -->
			<div class="modal-body">

				<form class="form-horizontal" id="QAForm">
					<fieldset>

						<!-- Form Name -->
						<legend>
							Contact Us
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
						</legend>

						<p>Please use this form to ask your question. We will contact
							you shortly.</p>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="textinput">Name
								*</label>
							<div class="col-md-8">
								<input id="textinput" name="uqUserName"
									placeholder="Enter Your Full Name"
									class="form-control input-md" required="" type="text">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="title">Title</label>
							<div class="col-md-8">
								<input id="uqTitle" name="uqTitle" placeholder="Title"
									class="form-control input-md" type="text">

							</div>
						</div>

						<!-- Text input
						<div class="form-group">
							<label class="col-md-4 control-label" for="company">Company</label>
							<div class="col-md-6">
								<input id="company" name="company"
									placeholder="Enter your Company Name"
									class="form-control input-md" type="text">

							</div>
						</div>-->

						<!-- Prepended text-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="Phone">Mobile
								Number *</label>
							<div class="col-md-8">
								<div class="input-group">
									<span class="input-group-addon">+82</span> <input
										id="uqUserPhone" name="uqUserPhone" class="form-control"
										placeholder="Mobile" required="" type="text">
								</div>

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="website">Website</label>
							<div class="col-md-8">
								<input id="uqRelatedLink" name="uqRelatedLink"
									placeholder="Enter Your Website" class="form-control input-md"
									type="text"> <span class="help-block">Ex:
									Mwav.net</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-3 control-label" for="email">E-Mail
								*</label>
							<div class="col-md-8">
								<input id="uqUserEmail" name="uqUserEmail"
									placeholder="Enter Your E mail" class="form-control input-md"
									required="" type="text">

							</div>
						</div>

						<!-- Textarea -->
						<div class="form-group">
							<label class="col-md-3 control-label" for="Message">Message
								*</label>
							<div class="col-md-8">
								<textarea class="form-control" rows="6" id="Message"
									name="uqContent">Enter Your Message *</textarea>
							</div>
						</div>

						<!-- Button 
						<div class="form-group">
							<label class="col-md-4 control-label" for="singlebutton"></label>
							<div class="col-md-6">
								<button id="singlebutton" name="singlebutton"
									class="btn btn-primary">Send Feedback</button>
							</div>
						</div>-->

					</fieldset>
				</form>



			</div>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					
					<!-- <div class="btn-group btn-delete hidden" role="group">
						<button type="button" id="delImage"
							class="btn btn-default btn-hover-red" data-dismiss="modal"
							role="button">Delete</button>
					</div> -->
					<div class="btn-group" role="group">
						<button type="button" id="saveImage"
							class="btn btn-primary btn-hover-green" data-action="save"
							role="button" onClick="insertQAForm();">Send</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							role="button">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <!-- Content Column -->
<div class="table-responsive">

			<form role="form" method="post" name="frmQA" action="">

				hidden name 값 지정.
				<INPUT TYPE="hidden" NAME="qaMode" VALUE=""> <INPUT
					TYPE="hidden" NAME="qaStatusBit" VALUE=""> <INPUT
					TYPE="hidden" NAME="MbrID" VALUE=""> <INPUT TYPE="hidden"
					NAME="QAidx" VALUE=""> <INPUT TYPE="hidden" NAME="qService"
					VALUE=""> <INPUT TYPE="hidden" NAME="pageName" VALUE="">


				
				<table class="table">

					<tr>
						<th class="active">Title</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqTitle"></td>
						<th class="active">Group</th>
						<td><select class="form-control" name="uqGroup" value="">
								<option value="일반">일반문의</option>
						</select></td>
					</tr>
					<tr>
						<th class="active">Name</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqUserName"></td>
						<th class="active">Password</th>
						<td><input type="password" class="form-control"
							placeholder="Text input" name="uqUserEmail"></td>
					</tr>

					<tr>
						<th class="active">Phone</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqUserPhone"></td>
						<th class="active">Email</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqUserEmail"></td>
					</tr>

					<tr>
						<th class="active">Content</th>
						<td colspan="3"><textarea name="uqContent"
								class="form-control input-sm ckeditor" id="message"
								placeholder="Message" maxlength="140" rows="7"
								style="width: 100%; height: 200px;"></textarea> <span
							class="help-block"></span></td>
					</tr>

				</table>
				<br style="clear: both">
				<p class="pull-right">
					<button type="button" class="btn btn-success"
						onClick="javascript:window.location.href=''">All
						List</button>
					<button type="button" class="btn btn-warning"
						onClick="javascript:history.go(-1)">BACK</button>
					<button type="button" class="btn btn-primary" onclick="check()">Insert</button>
				</p>
			</form>

</div>
 --%>