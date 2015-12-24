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
		})
	});
</script>
<div id="left_menu" class="list-group">
	<a href="/Company/Introduction/Introduction.jsp"
		class="list-group-item " data-toggle="tooltip" data-placement="top"
		data-original-title="회사소개">Introduction</a> <a
		href="/Company/Greetings/Greetings.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="대표인사말">Greetings</a>
	<a href="/Company/History/History.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="회사연혁">History</a> <a
		href="/Company/BusinessField/BusinessFields.jsp"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="사업분야">BusinessField</a> <a
		href="/Company/ActualResults/ActualResults.jsp"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="회사실적">ActualResults</a> <a
		href="/board/bnsList.do" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="언론보도">ThePress</a> <a
		href="/Company/HR-Affairs/HR-Affairs.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="인재채용">HR-Affairs</a>
	<a href="/Company/LocationMap/LocationMap.jsp" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="회사약도">LocationMap</a> <a
		href="/Company/Profitsharing/Profitsharing.jsp"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="수익분배 프로그램">Profitsharing</a>
		<a
		href="/board/bnsList.do" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="공지사항">Notice</a>
</div>