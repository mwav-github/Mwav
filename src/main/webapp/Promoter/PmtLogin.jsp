<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}else if(result == 'false'){
		alert("실패하였습니다");
	}

</script>


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
		//4.아이디 저장
		if (pmt_login_form.cbStoreID.checked) {

			saveLogin(frm.pmtLoginId.value);

		} else {
			saveLogin("");
		}

		frm.submit();
	}

	//아이디저장 1.confirmSave - 체크박스를 클릭했을경우 나타나는 대화상자로 일종의 경고문이다.

	function confirmSave(checkbox) {
		var isRemember;

		if (checkbox.checked) {
			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
			if (!isRemember)
				checkbox.checked = false;
		}
	}

	//3. setCookie - 본인의 컴퓨터에 쿠키로 저장하는 함수이다. 어떤이름(name)으로 무엇을(value) 얼마나(expiredays) 저장하는지..매개변수값을 받고 있다

	// 쿠키값 설정

	function setCookie(name, value, expiredays) {

		var today = new Date();

		today.setDate(today.getDate() + expiredays);

		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ today.toGMTString() + ";";

	}

	//2.saveLogin - 저장할 아이디 값을 받아 위의 setsave 함수에게 토스해주는 함수이다. 저장할 아이디 값이 있느냐 없느냐를 검사하는 곳이기도 하다
	function saveLogin(id) {
		if (id != "") {
			// userid 쿠키에 id 값을 7일간 저장
			setCookie("userid", id, 7);
		} else {
			// userid 쿠키 삭제
			setCookie("userid", id, -1);
		}
	}

	//쿠키값 가져오기
	// 쿠키값 가져오기

	function getCookie(key) {

		var cook = document.cookie + ";";

		var idx = cook.indexOf(key, 0);

		var val = "";

		if (idx != -1) {

			cook = cook.substring(idx, cook.length);

			begin = cook.indexOf("=", 0) + 1;

			end = cook.indexOf(";", begin);

			val = unescape(cook.substring(begin, end));

		}

		return val;

	}

	//4.쿠키 불러오기
	function getLogin() {
		var frm = document.pmt_login_form;

		// userid 쿠키에서 id 값을 가져온다.

		var id = getCookie("userid");

		// 가져온 쿠키값이 있으면

		if (id != "") {

			frm.pmtLoginId.value = id;

			frm.cbStoreID.checked = true;

		}
	}
</script>
<c:if test="${requestScope.check eq 1 }">
	<c:choose>
		<c:when test="${requestScope.returnUrl eq null }">
			<script type="text/javascript">
				alert('관리자 화면으로 이동합니다.');
			<%--http://blog.naver.com/PostView.nhn?blogId=haanul98&logNo=80204508627&categoryNo=0&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1 --%>
				location.href = "/HomePage/DefaultFrame.mwa";
			</script>
		</c:when>
		<c:when test="${requestScope.returnUrl ne null }">
			<c:set var="returnUrl" value='${requestScope.returnUrl}'
				scope="request" />
			<script type="text/javascript">
				var returnUrl = '<c:out value="${returnUrl}"/>';
				location.href = returnUrl;
			</script>
			<%-- <c:url var="url" value="${requestScope.returnUrl}">
			</c:url>

			<c:redirect url="${requestScope.returnUrl}" />
--%>
		</c:when>
	</c:choose>

</c:if>

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
<body onLoad="getLogin();" style="background-color: #eee;">
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
					action="/admins/staff/pmtLogin.mwav">
					<h2 class="form-signin-heading">Mwav promoter sign in</h2>
					<input type="hidden" name="returnUrl" value="${param.returnUrl }" />
					<div class='form-group'>
						<input type="text" name="pmtLoginId" id="inputEmail"
							class="form-control" placeholder="Staff Id" required autofocus>
					</div>
					<div class='form-group'>
						<input type="password" name="pmtLoginPw" id="inputPassword"
							class="form-control" placeholder="Password" required>
					</div>

					<div class="checkbox">
						<label> <input type="checkbox" name="cbStoreID"
							value="remember-me" onClick="confirmSave(this)"> Remember
							me
						</label>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit"
						onClick="check()">Sign in</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>