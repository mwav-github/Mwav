<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"
	rel="stylesheet">

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
		<p class="intro-text">잘못된 아이디 또는 비밀번호로 로그인을 여러번 시도하였습니다.<br/>아이디 찾기 또는 비밀번호 찾기를 이용해보세요</p>
		
		<%--Forgotten your password? Enter your email address below to begin the reset process. --%>

		<div class="clearfix form-actions">
			<div>
				<button type="button" id="pwok" onclick="location.href='/MasterPage.mwav?mode=IDSeek'"
					class="btn-custom-default btn btn-primary">아이디 찾기</button>
				<button type="button" id="pwok" onclick="location.href='/MasterPage.mwav?mode=PWSeek'"
					class="btn-custom-default btn btn-primary">비밀번호 찾기</button>
				<button type="button" id="pwok" onclick="location.href='/MasterPage.mwav?mode=SMbrLogin&amp;returnUrl=/login/post.mwav'"
					class="btn-custom-default btn btn-primary">로그인 페이지로 이동</button>
			</div>
		</div>
	</div>
</c:if>

