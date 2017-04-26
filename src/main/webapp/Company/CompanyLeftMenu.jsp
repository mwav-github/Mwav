<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		/* 		
		http://webdesignerhut.com/active-class-navigation-menu/
		
		var pgurl = window.location.href.substr(window.location.href
		 .lastIndexOf("/") + 1); 
		 실행url -  http://localhost:8088/login/login.mwav?key=value
		
		 -javascript-
		 location.href  -> http://localhost:8088/login/login.mwav?key=value
		 location.protocol ->  http:
		 location.host -> localhost:8088 
		 location.pathname -> /login/login.mwav
		 location.search -> ?key=value
		 ﻿
		 -jquery-
		 ﻿jQuery(location).attr('href') -> http://localhost:8088/login/login.mwav?key=value
		 jQuery(location).attr('protocol') -> http:
		 jQuery(location).attr('host') -> localhost:8088 
		 jQuery(location).attr('pathname') -> /login/login.mwav
		 jQuery(location).attr('search')-> ?key=value
		 [출처] javascript & jquery location object 정보 - 현재 실행중이 URL정보|작성자 미친꼬북		
		 
		 또는
		 function setActive() {
			  aObj = document.getElementById('nav').getElementsByTagName('a');
			  for(i=0;i<aObj.length;i++) { 
			    if(document.location.href.indexOf(aObj[i].href)>=0) {
			      aObj[i].className='active';
			    }
			  }
			}
			window.onload = setActive;
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
	<a href="/Company/Introduction/Introduction.mwav"
		class="list-group-item " data-toggle="tooltip" data-placement="top"
		data-original-title="회사소개">Introduction</a> <a
		href="/Company/Greetings/Greetings.mwav" class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="대표인사말">Greetings</a>
	<a class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="페이지 준비 중입니다.">History</a> <a
		href="/Company/BusinessField/BusinessFields.mwav"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="사업분야">Business Fields</a> <a
		
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="페이지 준비 중입니다.">Actual Results</a> <a
		href="/board/bnsList.mwav" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="IT 트렌드">IT Trends</a> <a
		 class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="페이지 준비 중입니다.">HR-Affairs</a>
	<a href="/Company/LocationMap/LocationMap.mwav" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="회사약도">Location Map</a> <a
		
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="페이지 준비 중입니다.">Profit sharing</a>
</div>