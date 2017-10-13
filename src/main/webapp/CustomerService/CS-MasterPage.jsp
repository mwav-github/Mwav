<!-- SPA 방식 전까지는 LEFT, HEAD 부분은 강제 삽입 FOOTER는 동일하므로 상관이 없다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			CustomerService <small> ${breadcrumb}</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li>CustomerService</li>
			<li class="active">${breadcrumb}</li>
		</ol>
	</div>
</div>

<!-- /.row -->

<!-- Content Row -->
<div class="row">
	<%-- 
		구조 5
		
		  LEFT 메뉴 현재는 크기 3부분 
		  
		 --%>
	<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
	<div class="col-md-3">
		<jsp:include page="/CustomerService/CS-MasterPageLeftMenu.jsp"
			flush="false" />
	</div>
	<!-- 끝 -->


	<%-- 
		구조 6
		
		  실제 BODY 부분
		  SPA 방식시 실제 각 페이지에 이 내용들만 있고 나머지는
		  MASTER 페이지에 남아있는다. 
		  
		 --%>

	<div class="col-md-9">
		<%--param.mode 는 get문으로 올때 // mode는 setattribute일때 --%>
		<c:if test="${param.mode == 'SDMyPage' || mode == 'SmbrUpdatePro'}">
			<jsp:include page="/member/mbrView.mwav" flush="false" />
		</c:if>
		<c:if test="${mode == 'SmbrUpdate'}">
			<jsp:include page="/CommonApps/Member/MbrShipForm.jsp" flush="false" />
		</c:if>

		<c:if test="${param.mode == 'SDMbrDelete'}">
			<jsp:include page="/CommonApps/Member/MbrDelete.jsp" flush="false" />
		</c:if>

		<c:if test="${mode == 'm_buView'}">
			<jsp:include page="/CommonApps/BoardNotice/buView.jsp" flush="false" />
		</c:if>
		<c:if test="${mode == 'm_buList'}">

			<jsp:include page="/CommonApps/BoardNotice/buList.jsp" flush="false" />
		</c:if>
		<c:if test="${mode == 'qaList'}">

			<jsp:include page="/CommonApps/BoardQnA/qaList.jsp" flush="false" />
		</c:if>
		<c:if test="${mode == 'qaView'}">

			<jsp:include page="/CommonApps/BoardQnA/qaView.jsp" flush="false" />
		</c:if>

		<c:if test="${param.mode == 'qaForm'}">
			<%--중요 !! 여기에서 type를 지정해줘야 한다 안그러면, 밑에 footer에도 include 하는데 이때 또 중복되서 나온다. !!  --%>
			<jsp:include page="/CommonApps/BoardQnA/qaForm.jsp" flush="false">
				<jsp:param name="type" value="page" />
			</jsp:include>
		</c:if>


	</div>
</div>
