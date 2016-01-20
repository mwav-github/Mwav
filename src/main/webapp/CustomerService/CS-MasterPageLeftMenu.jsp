<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		/* 		
		http://webdesignerhut.com/active-class-navigation-menu/
		
		var pgurl = window.location.href.substr(window.location.href
		 .lastIndexOf("/") + 1); 
		 실행url -  http://localhost:8088/login/login.do?key=value
		
		 -javascript-
		 location.href  -> http://localhost:8088/login/login.do?key=value
		 location.protocol ->  http:
		 location.host -> localhost:8088 
		 location.pathname -> /login/login.do
		 location.search -> ?key=value
		 ﻿
		 -jquery-
		 ﻿jQuery(location).attr('href') -> http://localhost:8088/login/login.do?key=value
		 jQuery(location).attr('protocol') -> http:
		 jQuery(location).attr('host') -> localhost:8088 
		 jQuery(location).attr('pathname') -> /login/login.do
		 jQuery(location).attr('search')-> ?key=value
		 [출처] javascript & jquery location object 정보 - 현재 실행중이 URL정보|작성자 미친꼬북		
		 */
		var pgurl = window.location.pathname;
		//alert(pgurl);

		$("#left_menu a").each(function() {
			//alert($(this).attr("href"));
			//alert($(this).attr(''));
			if ($(this).attr("href") == pgurl || $(this).attr("href") == '')
				$(this).addClass("active");
			
			//.do 로 즉 마스터 페이지로 온 경우에 대한 내용도 필요
		})
	});
</script>
<div id="left_menu" class="list-group">
	<a href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');"
		class="list-group-item " data-toggle="tooltip" data-placement="top"
		data-original-title="마이페이지">MyPage</a>

	<c:if test="${sessionScope.mbrLoginId ne null }">
		<a href="/CustomerService/MyPage/MyPage.jsp" class="list-group-item "
			data-toggle="tooltip" data-placement="top"
			data-original-title="마이페이지">MyPage</a>
	</c:if>

	<a href="/CustomerService/Announcement/Announcement.jsp"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="공지사항">Announcement</a> <a
		href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="회원정보(수정)">MemberShip</a>

	<c:if test="${sessionScope.mbrLoginId ne null }">
		<a href="/CustomerService/MemberShip/MemberShip.jsp"
			class="list-group-item" data-toggle="tooltip" data-placement="top"
			data-original-title="회원정보(수정)">MemberShip</a>
	</c:if>
	
	<a href="/CustomerService/Agreement/Agreement.jsp"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="이용약관">Agreement</a> <a
		href="/CustomerService/SiteGuide/SiteGuide.jsp"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="이용방법">Site Guide</a> <a
		href="/CustomerService/FAQ/FAQ.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="자주하는 질문">FAQ</a> <a
		href="/CustomerService/QnA/QnA.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="묻고 답하기">QnA</a> <a
		href="/CustomerService/Contact/Contact.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="담당자안내">Contact</a>
	<a href="/CustomerService/SiteMap/SiteMap.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="사이트맵">SiteMap</a>
</div>