<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->

<script type="text/javascript">
	var status = ${status};
	console.log('status : '+status);
	switch(status){
	case 'joinSuccess' : alert('회원가입에 성공하셨습니다.');	//PromoterControll -> /promoter/PmtForm.mwav 매핑
	}
</script>


<c:if test="${sessionScope.promoterId ne null }">
			<script>
				location.href = "/promoter/viewMyPoint.mwav";
			</script>
</c:if>


<title>관리자 로그인</title>

<script type="text/javascript">
	function check() {
		// 서버 restart시에는 어짜피 초기화 세션유지안되면서
		var pmtLoginId = pmt_login_form.pmtLoginId.value;
		var pmtLoginPw = pmt_login_form.pmtLoginPw.value;
		var frm = document.pmt_login_form;

		if (pmtLoginId.length == 0) {
			alert("아이디를 입력해주세요");
			frm.pmtLoginId.focus();
			return false;
		}
		if (pmtLoginPw.length == 0) {
			alert("패스워드를 입력해주세요");
			frm.pmtLoginPw.focus();
			return false;
		}


		frm.submit();
	}



</script>


<c:if test="${requestScope.check eq 0 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
	</script>
</c:if>

<c:if test="${requestScope.check eq -1 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
	</script>
</c:if>


</head>

<!-- 세션이 없을 경우 띄워주는 창이다. -->
<body style="background-color: #eee;">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<img class="img-responsive center-block" alt="StaffOnly"
					src="/Admins/CompanyMgr/Staff/Images/Background_StaffLogin_1.png">
			</div>
			<div class="col-md-6 col-md-offset-3">

				<%--참고로 sr-only는 화면에는 표시되지 않으나 스크린 리더에 표시하려고 할때 사용
			<label for="inputEmail" class="sr-only">StaffLoginId</label
			--%>
				<form name="pmt_login_form" class="form-signin" method="post"
					action="/pmt/pmtLogin.mwav">
					<h2 class="form-signin-heading">Mwav promoter sign in</h2>
					<input type="hidden" name="returnUrl" value="${param.returnUrl }" />
					<div class='form-group'>
						<input type="text" name="pmtLoginId" id="inputEmail"
							class="form-control" placeholder="promoter Id" required autofocus>
					</div>
					<div class='form-group'>
						<input type="password" name="pmtLoginPw" id="inputPassword"
							class="form-control" placeholder="Password" required>
					</div>

					<button class="btn btn-lg btn-primary btn-block" type="submit"
						onClick="check()">Sign in</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>