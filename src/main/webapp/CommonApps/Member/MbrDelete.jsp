<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">

	<!-- 1. 회원탈퇴 -->
	<div class="col-lg-12">
		<h2 class="page-header">Member Secession</h2>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-6">
		<h4 class="text-danger">회원탈퇴시 Mwav에서 제공해주는 회원 및 프로모션 혜택을 받을 수
			없게됩니다.</h4>
		<p class="text-danger">
			<span class="glyphicon glyphicon-alert"></span> 탈퇴 후 2주간 재가입이
			불가능합니다.
		</p>
		<br />
		<p >회원탈퇴를 희망시는 경우 하단에 비밀번호 입력 후 탈퇴버튼을 클릭하여주시기 바랍니다.</p>
		<br />

		<form class='form-horizontal mgt4' name="change_record" method="post"
			action="/member/mbrDelete.do">
			<div class="col-md-8">
				<input type="password" name="mbrLoginPw" class="form-control"
					placeholder="비밀번호" value="" required>
			</div>
			<div class="col-md-4">
				<button type="submit" class="btn btn-danger">탈퇴</button>
			</div>
		</form>
	</div>
</div>