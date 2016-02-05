<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<!-- 페북 로그인 관련 -->
<script>
	var FBtoken = "";
	
	// This is called with the results from from FB.getLoginStatus().
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			FBtoken = response.authResponse.accessToken;
			console.log('id = '+response.authResponse.id);
			console.log('FBtoken = '+FBtoken); //자체적인 accessToken으로 로그인 관리중인듯
			console.log('public_profile = '+response.authResponse.public_profile);
			fbLogin();
			//insertAPI();
			console.log('connected finished')
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.';
			console.log('not authorized!!');
			
		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into Facebook.';
		}
	}

	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
		console.log('statusChangeCallback');
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '{1742261129335045}',
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.5' // use version 2.2
		});

		// Now that we've initialized the JavaScript SDK, we call 
		// FB.getLoginStatus().  This function gets the state of the
		// person visiting this page and can return one of three states to
		// the callback you provide.  They can be:
		//
		// 1. Logged into your app ('connected')
		// 2. Logged into Facebook, but not your app ('not_authorized')
		// 3. Not logged into Facebook and can't tell if they are logged into
		//    your app or not.
		//
		// These three cases are handled in the callback function.

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5&appId=1742261129335045";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	// Here we run a very simple test of the Graph API after login is
	// successful.  See statusChangeCallback() for when this call is made.
	function insertAPI() {
		FB.api('/me', function(response) {	
			/* console.log('apiJson = '+JSON.stringify(response)); //이름이랑 ID만 들어옴
			console.log('email = '+response.email); //이메일 안들어온다?
			console.log('Successful login for: '+ response.name);
			console.log('ID1 = '+response.id);
			$('#name').html(response.name);
			ID = documnet.getElementByID()
			Name = response.name;
			console.log('ID2 = '+ID.value);
			console.log('Name = '+Name.innerHTML);
			document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!'; */
			
			var $form = $('<form></form>');
            $form.attr('action', '/member/snsForm.do');
            $form.attr('method', 'post');
            $form.appendTo('body');
             
            var fId = $('<input type="hidden" value="'+response.id+'" name="fId">');
            var fEmail = $('<input type="hidden" value="'+response.email+'" name="fEmail">');
            var fName = $('<input type="hidden" value="'+response.name+'" name="fName">');
            /* var fsex = $('<input type="hidden" value="'+response.sex+'" name="fsex">');
            var ffirst_name = $('<input type="hidden" value="'+response.first_name+'" name="ffirst_name">');
            var flast_name = $('<input type="hidden" value="'+response.last_name+'" name="flast_name">');
            var flocale = $('<input type="hidden" value="'+response.locale+'" name="flocale">');
            var fbirthday = $('<input type="hidden" value="'+response.birthday+'" name="fbirthday">'); */
            
            $form.append(fId).append(fEmail).append(fName);
            $form.submit();
						});
	}
	
	function permissionAPI() {
		FB.api('/me', function(response) {	
			
						});
	}
	
	function fbLogin() { //이 기능은 안 쓰이는중
	FB.login(function(response) {
	    if (response.authResponse) {
	     console.log('Welcome!  FBlogin() ');
	     FB.api('/me', function(response) {
	       console.log('Good to see you, ' + response.name + '.');
	     });
	    } else {
	     console.log('User cancelled login or did not fully authorize.');
	    }
	}, {scope: 'email'});
	}
	
	
</script>

<%--padding 으로 안쪽 추후 딴건 변경가능 #04A3ED --%>
<div class="col-md-12"
	style="padding: 60px; box-shadow: 0 0 20px 3px #04A3ED; background: #f7f7f7;">
	<form name="login_form" action="/member/Login.do" method="post">
		<!-- 
	<form name="login_form" action="/member/Login.do"
		onsubmit="return check(document.login_form)" method="post"> -->
		<div class="form-group">
			<div class="col-xs-6 col-sm-6 col-md-2">
				<button type="button" class="btn btn-primary btn-block ">
					<i class="fa fa-facebook"></i>
				</button>

			</div>
			<div class="col-xs-6 col-sm-6 col-md-2">
				<button type="button" class="btn btn-info btn-block">
					<i class="fa fa-twitter"></i>
				</button>

			</div>
			<div class="col-xs-6 col-sm-6 col-md-2">
				<button type="button" class="btn btn-danger btn-block ">
					<i class="fa fa-google-plus"></i>
				</button>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-2">
				<button type="button" class="btn btn-primary btn-block ">
					<i class="fa fa-linkedin"></i>
				</button>
			</div>
		</div>

		<div class="enter"></div>
		<div class="enter"></div>

		<div class="form-group">
			<input type="text" name="mbrLoginId" class="form-control input-lg"
				placeholder="Email">
		</div>
		<div class="form-group">
			<input type="password" class="form-control input-lg"
				placeholder="Password" name="mbrLoginPw">
		</div>
		<!-- <div class="form-group">
			<input type="password" class="form-control input-lg"
				placeholder="Confirm Password" name="mbrLoginPw_check">
		</div> -->
		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
				In</button>
		</div>
		<div class="form-group">

			<span class="pull-left"><a href="#IDPWSeek"
				data-toggle="modal" data-target=".IDPWSeek" role="button"
				data-toggle="modal"><strong>Forgot your password?</strong></a></span>

			<jsp:include page="/CommonApps/IDSeek/IDSeek.jsp" flush="false" />
			<span class="pull-left"><a
				href="/MasterPage_1.jsp?mode=Default"><strong>Sign up
						now</strong></a></span>
		</div>
		
		<!-- 페북 로그인 연동 -->
		<!-- <input type="text" id="id" value="ID" name="snsId"> -->
		
		<div class="form-group">
			<button type="button" class="btn btn-primary btn-lg btn-block">Facebook</button>
		</div>
		
		<fb:login-button scope="public_profile,email"
			onlogin="checkLoginState();">
		</fb:login-button>
		
		<div class="fb-login-button" data-max-rows="12" data-size="large" scope="public_profile,email"
				data-show-faces="true" data-auto-logout-link="true"></div>

			<!-- 
			<script>
				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5&appId=1737556269805531";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script> -->



		<!-- <a href="#" onclick="FB.logout();">logout</a> -->
		
	</form>
</div>
<!-- Login - END -->