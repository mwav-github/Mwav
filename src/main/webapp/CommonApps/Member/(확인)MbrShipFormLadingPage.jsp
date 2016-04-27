<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">

	<!-- 2. 회원정보수정 -->
	<div class="col-lg-12">
		<h2 class="page-header">Member Modify</h2>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-6">
		<h5>회원정보 수정을 희망하시는 경우 비밀번호를 입력해주시기 바랍니다.</h5>

		<form class='form-horizontal mgt4' name="change_record" method="post"
			action="/member/mbrDelete.do">
			<div class="col-md-8">
				<input type="password" name="mbrLoginPw" class="form-control"
					placeholder="암호" value="" required>
			</div>
			<div class="col-md-4">
				<button type="submit" class="btn btn-danger">탈퇴</button>
			</div>
		</form>
	</div>
</div>