<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

</head>


<form name="login_form" class="col-md-12" action="/member/Login.do"
	onsubmit="return check(document.login_form)" method="post">

	<!-- <div class="form-group">
			<div class="col-md-4 col-sm-12">
				<button type="button" class="btn btn-primary btn-block">Facebook</button>
			</div>
			<div class="col-md-4 col-sm-12">
				<button type="button" class="btn btn-info btn-block">Twitter</button>
			</div>
			<div class="col-md-4 col-sm-12">
				<button type="button" class="btn btn-danger btn-block">Google+</button>
			</div>
		</div> -->
	<div class="form-group">
		<input type="text" name="mbrLoginId" class="form-control input-lg"
			placeholder="Email">
	</div>
	<div class="form-group">
		<input type="password" class="form-control input-lg"
			placeholder="Password" name="mbrLoginPw">
	</div>
	<div class="form-group">
		<input type="password" class="form-control input-lg"
			placeholder="Confirm Password" name="mbrLoginPw_check">
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
			In</button>
		<span><a href="#IDPWSeek" data-toggle="modal"
			data-target=".bs-modal-sm" role="button" class="btn"
			data-toggle="modal">Id Seek</a></span>

		<jsp:include page="/CommonApps/IDSeek/IDSeek.jsp" flush="false" />
		<span class="pull-right"><a
			href="/MasterPage_1.jsp?mode=Default">New Registration</a></span>
	</div>
</form>
<!-- Login - END -->