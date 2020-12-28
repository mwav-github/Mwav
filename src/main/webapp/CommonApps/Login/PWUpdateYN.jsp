<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
	rel="stylesheet">
<!-- jQuery Version 1.11.0 -->
<%--아래 jquery가 들어가있으면 tooltip등 안먹힌다.  --%>
<!-- <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
 -->

<script>
	function updateLater(){
		$.ajax({
			type : 'POST', // Http Request Method로 POST로 지정
			url : '/login/pwUpdateLater.mwav', // 서버 요청 주소
			//data : URL, // JavaScript 객체를 JSON 객체로 변환하여 서버 요청시 전송
			success : function(data) {
				if (data == 1) {
					location.href='/';
					}
				},
			error : function() {
				alert('다시 시도해주세요.');
				} // 서버로부터 응답 데이터 실패시 로직 처리
		});
	}
</script>


<style>
.wrap-loading_images { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 10000;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'; /* ie */
}
</style>

<c:if test="${param.type eq 'page'}">
	<div class="wrap-loading display-none">
		<img class="wrap-loading_images "
			src="/CommonApps/PostSeek/Images/ajax-loader.gif">
	</div>

	<div class="col-xs-12 " id="PwFinder">
		<p class="intro-text">소중한 개인정보 보호를 위해</p>
		<p class="red-text">비밀번호를 변경해주세요.</p>
		<p class="intro-text">개인정보 도용으로 인한 피해를
방지하고자<br/>6개월 주기로 비밀번호 변경을 안내해 드리고 있습니다.</p>
		
		<%--Forgotten your password? Enter your email address below to begin the reset process. --%>

		<div class="clearfix form-actions">
			<div>
				<button type="button" id="pwok" onclick="updateLater()"
					class="btn-custom-default btn btn-primary">6개월 후 변경하기</button>
				<button type="button" id="pwok" onclick="location.href='/MasterPage.mwav?mode=PWUpdate'"
					class="btn-custom-default btn btn-primary">지금 변경하기</button>
			</div>
		</div>
	</div>
</c:if>

