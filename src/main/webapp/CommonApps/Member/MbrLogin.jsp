<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function check() {
		if (document.login_form.mbrLoginId.value.length == 0) {
			alert("아이디를 입력해주세요");
			login_form.mbrLoginId.focus();
			return false;
		}
		if (document.login_form.mbrLoginPw.value.length == 0) {
			alert("패스워드를 입력해주세요");
			login_form.mbrLoginPw.focus();
			return false;
		}
		document.login_form.submit();
	}
</script>

</head>
<%--세션이 있을 경우 먼저 수행한다. (굳이 재 로그인 필요성이 없다.) 
    1. 아이디가 있을 경우--%>
<c:choose>
	<c:when test="${member eq null}">
   alert('아이디 또는 비밀번호를 다시 입력해주세요.');
</c:when>
	<c:when test="${member ne null}">
   alert('로그인에 성공하셨습ㄴ디ㅏ.');
</c:when>
</c:choose>
<!-- Login - start
container 안에 포함시키면된다.
 -->
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


<div class="row">
	<div class="col-xs-6">
		<form name="login_form" class="col-md-12" action="/Member/MbrLogin"
			onsubmit="return check()" method="post">
			<div class="row text-center">
				<div class="col-md-4 col-sm-12">
					<button type="button" class="btn btn-primary btn-block">Facebook</button>
				</div>
				<div class="col-md-4 col-sm-12">
					<button type="button" class="btn btn-info btn-block">Twitter</button>
				</div>
				<div class="col-md-4 col-sm-12">
					<button type="button" class="btn btn-danger btn-block">Google+</button>
				</div>
			</div>
			<hr />
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span> <input
					type="text" class="form-control" name="mbrLoginId"
					placeholder="email address">
			</div>
			<div class="input-group" style="margin-top: 10px;">
				<span class="input-group-addon"><i class="fa fa-lock"></i></span> <input
					type="password" class="form-control" name="mbrLoginPw"
					placeholder="Password">
			</div>
			<span class="help-block">Password error</span>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
			</div>


			<div class="col-xs-12 col-sm-6">
				<label class="checkbox"> <input type="checkbox"
					value="remember-me">Remember Me
				</label>

			</div>
			<div class="col-xs-12 col-sm-6">
				<label class="checkbox">
					<p class="omb_forgotPwd">
						<a href="#">Forgot password?</a>
					</p>
				</label>
			</div>
		</form>
	</div>

	<div class="col-xs-6">
		<p class="lead">
			Register now for <span class="text-success">FREE</span>
		</p>
		<ul class="list-unstyled" style="line-height: 2">
			<li><span class="glyphicon glyphicon-ok"></span> See all your
				orders</li>
			<li><span class="fa fa-check text-success"></span> Fast re-order</li>
			<li><span class="fa fa-check text-success"></span> Save your
				favorites</li>
			<li><span class="fa fa-check text-success"></span> Fast checkout</li>
			<li><span class="fa fa-check text-success"></span> Get a gift <small>(only
					new customers)</small></li>
			<li><a href="/read-more/"><u>Read more</u></a></li>
		</ul>
		<p>
			<a href="/new-customer/" class="btn btn-success btn-block">Yes
				please, register now!</a>
		</p>
	</div>
</div>
<!-- Login - END -->