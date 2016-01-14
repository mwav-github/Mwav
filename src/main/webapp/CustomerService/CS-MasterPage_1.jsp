<!-- SPA 방식 전까지는 LEFT, HEAD 부분은 강제 삽입 FOOTER는 동일하므로 상관이 없다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>



<body>


	<!-- Page Content -->
	<div class="container">

		<div class="row">


			<div class="col-md-9">
				
					<c:if test="${mode == 'SbuForm'}">
						<jsp:include page="/CommonApps/BoardNotice/buForm.jsp"
							flush="false" />
					</c:if>

					<c:if test="${mode == 'SbuList'}">
					<script></script> <!-- script를 찍으니 나온다 뭐얌 !!!!!???? -->
						<jsp:include page="/CommonApps/BoardNotice/buList.jsp"
							flush="false" />
					</c:if>
					
					<c:if test="${mode == 'SbuView'}">
						<jsp:include page="/CommonApps/BoardNotice/buView.jsp"
							flush="false" />
					</c:if>
					
					<c:if test="${sessionScope.mode == 'SbuUpdate'}">
						<jsp:include page="/CommonApps/BoardNotice/buForm.jsp"
							flush="false" />
					</c:if>

			</div>
		</div>
	</div>


</body>

</html>