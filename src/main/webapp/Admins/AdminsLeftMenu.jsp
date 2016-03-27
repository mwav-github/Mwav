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

<%--param은 get문 setattribute // mode 가 addObject // 그냥 mm은 넘어온 값  --%>

	<c:if test="${mm eq null}">
		<a href="#" >존재하지 않습니다.</a>
	</c:if>


	<c:if test="${mm ne null}">
		<c:forEach var="vo" items="${vo }">
			<a href="${vo.url }" class="list-group-item " data-toggle="tooltip"
				data-placement="top" data-original-title="${vo.hKName}">${vo.hEName}</a>
		</c:forEach>
	</c:if>
</div>