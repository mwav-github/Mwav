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
		 */
		var pgurl = window.location.pathname;
		var pgurl_ = window.location.search;
		//alert(pgurl);

		$("#left_menu a").each(
				function() {
					//alert($(this).attr("href"));
					//alert($(this).attr(''));
					if ($(this).attr("href") == pgurl
							|| $(this).attr("href") == ''
							|| $(this).attr("alt") == pgurl) {
						$(this).addClass("active");
					} /* else if($(this).attr("href") == pgurl){
									
								} */
				})

		/* $("#list_menu a").each(function() {
			//alert($(this).attr("href"));
			//alert($(this).attr(''));
			alert('11');
			alert($(this));
			if ($(this).attr("href") == pgurl || $(this).attr("href") == '' || $(this).attr("alt") == pgurl)
				{$(this).addClass("active");} /* else if($(this).attr("href") == pgurl){
					
				} 
		}) */
	});
</script>
<div class="panel-group">
	<div class="panel list-group" id="left_menu">

		<%--사용자 시각에서 hover시 포인터가 떠야한다.
         
         1. href="#"을 하면 자꾸 상단으로 이동
         2. 없애면 hover시 포인터가 없다 
         3. btn 클래스 등록하면 포인터 등장
         4. inline-stye로 btn이 중앙정렬이라  --%>
		<a class="btn list-group-item multiple_leftMenu"
			data-toggle="collapse" data-target="#list_menu_Aervision"
			alt="/CompanyItem/ITProducts/Aervision/Aervision.mwav"
			style="text-align: left !important">Aervision</a>
		<%--
/CompanyItem/ITProducts/Aervision/Aervision.jsp
붙여줘야지 #만해주면 다른 페이지에서는 안먹는다.
 --%>
		<div id="list_menu_Aervision" class="collapse child_left_menu ">
			<a href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#AerPass"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="AerPass"><span
				class="glyphicon glyphicon-chevron-right"></span> AerPass</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#AerCrowd"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="AerCrowd"><span
				class="glyphicon glyphicon-chevron-right"></span> AerCrowd</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#AerPalm"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="AerPalm"><span
				class="glyphicon glyphicon-chevron-right"></span> AerPalm</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#AerID"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="AerID"><span
				class="glyphicon glyphicon-chevron-right"></span> AerID</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#AerGate"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="AerGate"><span
				class="glyphicon glyphicon-chevron-right"></span> AerGate</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#IDMatch"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="IDMatch"><span
				class="glyphicon glyphicon-chevron-right"></span> IDMatch</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#eyeLock"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="eyeLock"><span
				class="glyphicon glyphicon-chevron-right"></span> eyeLock</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#Services"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="Services"><span
				class="glyphicon glyphicon-chevron-right"></span> Services</a> <a
				href="/CompanyItem/ITProducts/Aervision/Aervision.mwav#AboutUs"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="AboutUs"><span
				class="glyphicon glyphicon-chevron-right"></span> AboutUs</a>
		</div>


		<a class="btn list-group-item " data-toggle="collapse"
			data-target="#list_menu_highsofts"
			alt="/CompanyItem/ITProducts/HighSofts/HighSofts.mwav"
			style="text-align: left !important">HighSofts</a>

		<div id="list_menu_highsofts" class="collapse child_left_menu">
			<a href="/hightsofts/hightsofts.mwav?items=Highcharts"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="Highcharts"><span
				class="glyphicon glyphicon-chevron-right"></span> Highcharts</a> <a
				href="/hightsofts/hightsofts.mwav?items=Highstock"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="Highstock"><span
				class="glyphicon glyphicon-chevron-right"></span> Highstock</a> <a
				href="/hightsofts/hightsofts.mwav?items=Highmaps"
				class="list-group-item " data-toggle="tooltip" data-placement="top"
				data-original-title="Highmaps"><span
				class="glyphicon glyphicon-chevron-right"></span> Highmaps</a>
		</div>

		<a href="/CompanyItem/ITSolutions/OrgChart/OrgChart.mwav"
			class="list-group-item " data-toggle="tooltip" data-placement="top"
			data-original-title="OrgChart">OrgChart</a> <a
			href="/CompanyItem/ITProducts/OpenSRS/OpenSRS.mwav"
			class="list-group-item " data-toggle="tooltip" data-placement="top"
			data-original-title="OpenSRS">OpenSRS</a> <a
			href="/CompanyItem/ITProducts/Azure/Azure.mwav"
			class="list-group-item " data-toggle="tooltip" data-placement="top"
			data-original-title="Azure">Azure</a> <a
			href="/CompanyItem/ITProducts/Windows/Windows.mwav"
			class="list-group-item" data-toggle="tooltip" data-placement="top"
			data-original-title="Windows">Windows</a> <a
			href="/CompanyItem/ITProducts/MSOffice/MSOffice.mwav"
			class="list-group-item" data-toggle="tooltip" data-placement="top"
			data-original-title="MSOffice">MSOffice</a> <a
			href="/CompanyItem/ITProducts/InsWave/InsWave.mwav"
			class="list-group-item " data-toggle="tooltip" data-placement="top"
			data-original-title="InsWave">InsWave</a>
	</div>
</div>