<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="../../PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>
	<!-- FrontHeader -->
	<!--  //////////////////////////////////// -->
	<jsp:include page="../../PartsOfContent/SiteHeader/FrontHeader.jsp"
		flush="false" />
	<!--  //////////////////////////////////// -->


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs  SPA방식으로 추후변경 -->
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<!-- 끝 -->
			<div class="col-md-2"></div>
			<div class="mgt5 col-md-8">
				<!-- Content Column -->

				<div class="span3">
					<h2>Sign Up</h2>
					<form>
						<label>member_loginID</label> <input type="text" name="firstname"
							class="span3"> <label>member_loginPW</label> <input
							type="text" name="lastname" class="span3"> <!-- <label>Email
							Address</label> <input type="email" name="email" class="span3">  --><label>Username</label>
						<input type="text" name="username" class="span3"> <label>member_CellularP</label>
						<input type="password" name="password" class="span3"> <label><input
							type="checkbox" name="terms"> I agree with the <a
							href="#">Terms and Conditions</a>.</label><!-- modal 형태로 출력예정 --> <input type="submit"
							value="Sign up" class="btn btn-primary pull-right">
						<div class="clearfix"></div>
					</form>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>

		<hr>

		<!-- Footer -->
		<footer>
			<!--/////////////////////////////////////////////////// -->
			<jsp:include page="../../PartsOfContent/SiteFooter/FrontFooter.jsp"
				flush="false" />
			<!--/////////////////////////////////////////////////// -->
		</footer>


	</div>
	<!-- /.container -->
</body>

</html>