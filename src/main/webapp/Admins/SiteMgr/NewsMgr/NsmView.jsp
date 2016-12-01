<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>
	<%--mwav는 container 영역만 쓰기때문에 그랬으나 이건 전체 쓴다. 그러므로 container로 감싸면 안된다.  --%>
	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->



	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> NoticeView</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>SiteMgr</li>
					<li class="active">NtmView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%-- 
			- param으로 같은 이름 지정시 위의 named으로 인식
			- getparameter는 param.mm // setattribute는 mm
			- value에 두개다 넣는 경우 비즈니스로직 + 파라미터인경우 문제발생
			- jsp param 안에 choose, when, otherwise 사용 불가
			 --%>
				<c:choose>
					<c:when test="${param.mm eq null}">
						<c:set value="${mm}" var="mm" />
					</c:when>
					<c:otherwise>
						<c:set value="${param.mm}" var="mm" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="/admins/LeftMenu.do" flush="false">
					<jsp:param name="mm" value="${mm}" />
				</jsp:include>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">NtmView</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">
						<%--================================================시작========================================================== --%>

						<script>
	function check2(obj) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var bbb = obj;
			location.href= "/admin/boardNews/nsmDelete.do?bNews_id="+bbb;
		}else{   //취소
		    return;
		}

	}
</script>
						<!-- Content Column -->
						<div class="table-responsive">
							<form role="form">
								<table class="table table-striped">
									<thead>
										<tr>

											<c:set var="bnStatus" value="${selectOneNsmView.bnStatus }" />
											<c:if test="${fn:contains(bnStatus, '임시저장상태')}">
												<span class="pull-right text-danger"><strong>${selectOneNsmView.bnStatus }
												</strong></span>
											</c:if>
											<c:if test="${fn:contains(bnStatus, '현재공지상태')}">
												<span class="pull-right text-primary"><strong>${selectOneNsmView.bnStatus }
												</strong></span>
											</c:if>

											<div class="enter"></div>
										</tr>
										<tr class="active">
											<th>NO.</th>
											<th>Group</th>
											<th>ViewCount</th>
											<th>InsertDt</th>
											<th>staff_id</th>
											<th>Order</th>
										</tr>
									</thead>


									<tbody>
										<tr>
											<td>${selectOneNsmView.bNews_id}</td>
											<td>${selectOneNsmView.bnGroup}</td>
											<td>${selectOneNsmView.bnViewCount}</td>
											<td>${selectOneNsmView.bnInsertDt}</td>
											<td>${selectOneNsmView.staff_id}</td>
											<td>${selectOneBnsView.bnOrder}</td>
										</tr>
									</tbody>
								</table>

								<table class="table table-striped">

									<tr>
										<th class="active">Title</th>
									</tr>
									<tr>
										<td>${selectOneNsmView.bnTitle}</td>
									</tr>




									<tr>
										<th class="active">SubTitle</th>
									</tr>
									<tr>
										<td>${selectOneNsmView.bnSubTitle}</td>
									</tr>

									<tr>
										<th class="active">Reference</th>
									</tr>
									<tr>
										<td>${selectOneNsmView.bnRelatedLink}</td>
									</tr>

									<tr>
										<th class="active">Content</th>

									</tr>
									<tr>
										<td>${selectOneNsmView.bnContent}</td>
									</tr>

								</table>
							</form>

							<br style="clear: both">
							<p class="pull-right">
								<button type="button" class="btn btn-success"
									onClick="javascript:window.location.href='/admin/boardNews/nsmList.do?pageNum=${pageNum}'">All
									List</button>
								<button type="button" class="btn btn-warning"
									onClick="javascript:history.go(-1)">BACK</button>
								<button type="button" class="btn btn-danger"
									onclick="check2(${selectOneNsmView.bNews_id})">Delete</button>
							</p>

						</div>

						<%--================================================끝========================================================== --%>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

