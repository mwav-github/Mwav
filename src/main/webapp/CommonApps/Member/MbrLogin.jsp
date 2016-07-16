<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- 구글 API관련 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="881218558153-ndr868i68rlofoo4l2gb488ksabi5q23.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>

</head>

<!-- 페북 로그인 관련 -->
<script>
	var FBtoken = "";
	
	// This is called with the results from from FB.getLoginStatus().
	function statusChangeCallback(response) {
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			//console.log('document = '+document.getElementById('id').innerHTML);
			FBtoken = response.authResponse.accessToken;
			console.log('FBtoken = '+FBtoken); //자체적인 accessToken으로 로그인 관리중인듯
			fbLogin();
			//permissionAPI();
			//insertAPI();
			console.log('connected finished')
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.
			console.log('not authorized!!');
			
		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
			// 미리 로그인 안됐을시 이쪽으로 들어옴 유지보수 필요!
			console.log('not logged into this app or not!!');
		}
	}

	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '{1746137728947385}',
			cookie : true, // enable cookies to allow the server to access 
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

		/* FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		}); */

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5&appId=1746137728947385";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	// Here we run a very simple test of the Graph API after login is
	// successful.  See statusChangeCallback() for when this call is made.
	/* function insertAPI() {
		FB.api('/me?fields=id,first_name,last_name,email,gender,link,picture,verified,friends.fields(id)', function(response) {	
			console.log(response);
			var $form = $('<form></form>');
            $form.attr('action', '/member/snsForm.do');
            $form.attr('method', 'post');
            $form.appendTo('body');
             
            var fsmMember_id = $('<input type="hidden" value="'+response.id+'" name="fsmMember_id">');
            var fFirst_Name = $('<input type="hidden" value="'+response.first_name+'" name="fFirst_Name">');
            var fLast_Name = $('<input type="hidden" value="'+response.last_name+'" name="fLast_Name">');
            var fEmail = $('<input type="hidden" value="'+response.email+'" name="fEmail">');
            var fGender = $('<input type="hidden" value="'+response.gender+'" name="fGender">');
            var fLink = $('<input type="hidden" value="'+response.link+'" name="fLink">');
            var fPicture = $('<input type="hidden" value="'+response.picture+'" name="fPicture">');
            
            $form.append(fsmMember_id).append(fFirst_Name).append(fLast_Name).append(fEmail).append(fGender).append(fLink).append(fPicture);
            $form.submit();
						});
		
	} */
	
	function permissionAPI() { // permission 거부하였을때 쓰이는 기능
		FB.api('/me/permissions', function(response) {
			console.log('permission');
			console.log(response);
			var declined = [];
			  for (i = 0; i < response.data.length; i++) {
				console.log('de = '+response.data[i]);
			    if (response.data[i].status == 'declined') {
			      declined.push(response.data[i].permission);
			    }
			  }			
						});
	}
	
	function fbLogin() {
	FB.login(function(response) {
	    if (response.authResponse) {
	     FB.api('/me?fields=id,first_name,last_name,email,gender,link,picture,verified,friends.fields(id)', function(response) {
	    	 	console.log(response);
	    	 	var $form = $('<form></form>');
	            $form.attr('action', '/member/snsForm.do');
	            $form.attr('method', 'post');
	            $form.appendTo('body');
	             
	            var fsmMember_id = $('<input type="hidden" value="'+response.id+'" name="fsmMember_id">');
	            var fFirst_Name = $('<input type="hidden" value="'+response.first_name+'" name="fFirst_Name">');
	            var fLast_Name = $('<input type="hidden" value="'+response.last_name+'" name="fLast_Name">');
	            var fEmail = $('<input type="hidden" value="'+response.email+'" name="fEmail">');
	            var fGender = $('<input type="hidden" value="'+response.gender+'" name="fGender">');
	            var fLink = $('<input type="hidden" value="'+response.link+'" name="fLink">');
	            var fPicture = $('<input type="hidden" value="'+response.picture+'" name="fPicture">');
	            
	            $form.append(fsmMember_id).append(fFirst_Name).append(fLast_Name).append(fEmail).append(fGender).append(fLink).append(fPicture);
	            $form.submit();
	     });
	    } else {
	     console.log('User cancelled login or did not fully authorize.');
	    }
	}, {scope: 'public_profile, email, user_friends'}); // permission 거부 아래 grant?인가를 써서 다시 재 건의 할 수 있음
	}
	
	//구글 로그인 api(Spring Security적용 후 완료 예정)
	function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log("Name: " + profile.getName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail()); 
        console.log(JSON.stringify(profile));
        

        
        /* var $form = $('<form></form>');
        $form.attr('action', '/member/snsForm.do');
        $form.attr('method', 'post');
        $form.appendTo('body');
         
        var fsmMember_id = $('<input type="hidden" value="'+profile.getId()+'" name="fsmMember_id">');
        var fFirst_Name = $('<input type="hidden" value="'+profile.getName()+'" name="fFirst_Name">');
        var fEmail = $('<input type="hidden" value="'+profile.getEmail()+'" name="fEmail">');
        var fPicture = $('<input type="hidden" value="'+profile.getImageUrl()+'" name="fPicture">');
        
        $form.append(fsmMember_id).append(fFirst_Name).append(fEmail).append(fPicture);
        $form.submit(); */

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        }
</script>

<%--padding 으로 안쪽 추후 딴건 변경가능 #04A3ED --%>
<div class="col-md-12"
	style="padding: 60px; box-shadow: 0 0 20px 3px #04A3ED; background: #f7f7f7;">
	
		<div class="form-group">
			<div class="col-xs-6 col-sm-6 col-md-2">
				<button type="button" class="btn btn-primary btn-block " onclick="checkLoginState();">
					<i class="fa fa-facebook"></i>
				</button>

			</div>
			<div class="col-xs-6 col-sm-6 col-md-2">
				<button type="button" class="btn btn-info btn-block">
					<i class="fa fa-twitter"></i>
				</button>

			</div>
			
			<!-- facebook SIGNIN -->
			<form id="go_signin" name="go_signin" action="<c:url value="/signin/facebook.do"/>" method="POST">
				<div class="col-xs-6 col-sm-6 col-md-2">
					<button type="submit" class="btn btn-primary btn-block"><i class="fa fa-facebook"></i></button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
				</div>
			</form>
			
			<!-- GOOGLE SIGNIN -->
			<form id="go_signin" name="go_signin" action="<c:url value="/signin/google.do"/>" method="POST">
				<div class="col-xs-6 col-sm-6 col-md-2">
					<button type="submit" class="btn btn-danger btn-block"><i class="fa fa-google-plus"></i></button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="scope" value="email profile" />
				</div>
			</form>
			
			<!-- LINKEDIN SIGNIN -->
			<form id="go_signin" name="go_signin" action="<c:url value="/signin/linkedin.do"/>" method="POST">
				<div class="col-xs-6 col-sm-6 col-md-2">
					<button type="submit" class="btn btn-danger btn-block"><i class="fa fa-linkedin"></i></button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</div>
			</form>
		</div>

		<form name="login_form" action="/member/Login.do" method="post">
		
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
		 <!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" ></div> -->
		
		<!-- 페북 로그인 연동 -->
		
		<!-- <fb:login-button scope="public_profile,email"
			onlogin="checkLoginState();">
		</fb:login-button> -->
		
		<!-- <div class="fb-login-button" data-max-rows="12" data-size="large" scope="public_profile,email"
				data-show-faces="true" data-auto-logout-link="true"></div> -->

	</form>
	
</div>
<!-- Login - END -->