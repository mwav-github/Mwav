<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		
		var pgurl = window.location.pathname;
		
		$("#left_menu a").each(function() {
			if ($(this).attr("href") == pgurl || $(this).attr("href") == '')
				$(this).addClass("active");
		})
	});
</script>
<%-- 추후 choose로 변경하기 http://stackoverflow.com/questions/5935892/if-else-within-jsp-or-jstl --%>
<div id="left_menu" class="list-group">
	<%-- <c:if test="${sessionScope.member eq null }">
		<a href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');"
			class="list-group-item " data-toggle="tooltip" data-placement="top"
			data-original-title="페이지 준비 중입니다.">My Page</a>
	</c:if>

	<c:if test="${sessionScope.member ne null }"> </c:if>--%>
	<a href="/CustomerService/MyPage/MyPage.mwav" class="list-group-item "
		data-toggle="tooltip" data-placement="top" data-original-title="마이페이지">My
		Page</a> <a href="/CustomerService/Announcement/Announcement.mwav"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="공지사항">Announcement</a>

	<%-- <c:if test="${sessionScope.mbrLoginId eq null }">
		<a href="javascript:window.alert('권한이 없습니다. \n 로그인 후 이용해주시기 바랍니다.');"
			class="list-group-item" data-toggle="tooltip" data-placement="top"
			data-original-title="회원정보(수정)">Member Ship</a>
	</c:if>

	<c:if test="${sessionScope.mbrLoginId ne null }">
		<a href="/CustomerService/MemberShip/MemberShip.jsp"
			class="list-group-item" data-toggle="tooltip" data-placement="top"
			data-original-title="회원정보(수정)">Member Ship</a>
	</c:if> --%>
	<a href="/CustomerService/MemberShip/MemberShip.mwav"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="회원정보(수정)">Member Ship</a> <a
		href="/CustomerService/Agreement/Agreement.mwav"
		class="list-group-item" data-toggle="tooltip" data-placement="top"
		data-original-title="이용약관">Agreement</a> <a class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="페이지 준비 중입니다.">Site Guide</a> <a
		href="/CustomerService/FAQ/FAQ.mwav" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="자주 묻는 질문">FAQ</a> <a
		href="/CustomerService/QnA/QnA.mwav?mode=qaForm" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="묻고 답하기">Q&A</a> <a
		href="/CustomerService/Contact/Contact.mwav" class="list-group-item"
		data-toggle="tooltip" data-placement="top"
		data-original-title="담당부서안내">Contacts</a> <a
		href="/CustomerService/SiteMap/SiteMap.mwav" class="list-group-item"
		data-toggle="tooltip" data-placement="top" data-original-title="사이트맵">SiteMap</a>
</div>