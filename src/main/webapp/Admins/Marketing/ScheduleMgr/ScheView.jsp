<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					Admins <small> ScheduleMgr</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/admins/Default.mwav">Home</a></li>
					<li>Admins</li>
					<li>ScheduleMgr</li>
					<li class="active">ScheView</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">


			<div class="col-md-12">
				<!-- Content Column -->
				<div class="col-lg-12">

					<iframe
						src="https://calendar.google.com/calendar/embed?title=Mwav_WBS&amp;height=800&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=t73a6fe660mb472delh1u3ild52l4hk2%40import.calendar.google.com&amp;color=%232952A3&amp;src=s1vgf025rring9lqn6p0ptgc1uradldf%40import.calendar.google.com&amp;color=%23125A12&amp;src=mwav.net_dcq0ccsaattqooc7htj53jg8n0%40group.calendar.google.com&amp;color=%23691426&amp;ctz=Asia%2FSeoul"
						style="border-width: 0" width="1200" height="800" frameborder="0"
						scrolling="no"></iframe>


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

