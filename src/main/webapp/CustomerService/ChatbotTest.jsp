<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Chatbot Test Page</h1>

	<!-- 챗봇 스크립 -->
	<!-- Load Facebook SDK for JavaScript -->
	<div id="fb-root"></div>
	<script>
        window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v6.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/ko_KR/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

	<!-- Your customer chat code -->
	<div class="fb-customerchat" attribution=setup_tool
		page_id="1763283283755673" theme_color="#0084ff"
		logged_in_greeting="안녕하세요 Mwav 입니다. 무엇을 도와 드릴까요?"
		logged_out_greeting="이용해주셔서 감사합니다."></div>




</body>
</html>