<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="PartsOfContent/Head_Import.jsp" flush="false" />

<%-- 
1. 템플릿 : 참고하여 꼭 변경 http://wrapbootstrap.com/preview/WB0025522
                       http://startbootstrap.com/
                       https://wrapbootstrap.com/
--%>



<c:if test="${requestScope.loginCheck eq 2 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.');
		history.go(-1)
	</script>
</c:if>

<c:if test="${requestScope.loginCheck eq 3 }">
	<script type="text/javascript">
		alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.loginCheck eq 5 }">
	<script type="text/javascript">
		alert('임시패스워드입니다. 비밀번호 변경 후 로그인해주세요.');
		history.go(-1);
	</script>
</c:if>
<c:if test="${requestScope.updateMemberDelete eq 1 }">
	<script type="text/javascript">
		alert('회원탈퇴가 완료되었습니다. 감사합니다.');
	</script>
</c:if>
<c:if test="${requestScope.updateMemberDelete eq 0 }">
	<script type="text/javascript">
		alert('회원탈퇴가 되지 않았습니다.');
		history.go(-1);
	</script>
</c:if>

</head>
<body>

	<!-- Navigation (=메인 메뉴 및 슬라이드 쇼 포함)
	     Index의 마스터 페이지
	 -->
	<!--  //////////////////////////////////// -->
	<jsp:include page="PartsOfContent/SiteHeader/FrontHeader.jsp"
		flush="false" />

	<%-- Page Content (슬라이드 쇼 제외 실제 본문 내용)--%>
	<div class="container">
		<%-- Fluid container : .container 로 콘텐츠를 감싸는 것으로 페이지의 콘텐츠를 쉽게 중앙으로 가져오세요. 
		                       .container 는 우리의 그리드 시스템에 맞는 다양한 미디어 쿼리 분기점에서 max-width 가 설정되어 있습니다. 
		                       **추후 수정
		                       --%>

		<div class="enter"></div>
		<!-- Marketing Icons Section -->
		<div class="row" id="IT_Solutions">
			<!-- Fluid row 1행 -->
			<div class="col-lg-12">
				<!-- 제목 부분 12개의 열 lg >=1200px  -->
				<!-- 소제목 lg >=1200px -->
				<h2 class="col-lg-9 col-md-9 col-sm-9 page-header" style="color:#317eac">IT Solutions</h2>
				<h2 class="col-lg-3 col-md-3 col-sm-3 page-header" style="color:#317eac">Notices &
					News</h2>
			</div>
			<div class="col-md-4 col-sm-4">
				<!--md >= 992 4/12 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0
						</h4>
					</div>
					<div class="panel-body">
						<p>In general parlance, bootstrapping usually refers to the
							starting of a self-sustaining process that is supposed to proceed
							without external input. In computer technology the term (usually
							shortened to booting) usually refers to the process of loading
							the basic software into the memory of a computer after power-on
							or general reset, especially the operating system which will then
							take care of loading other software as needed. The term appears
							to have originated in the early 19th century United States
							(particularly in the phrase "pull oneself over a fence by one's
							bootstraps"), to mean an absurdly impossible action, an adynaton.</p>
						<a href="CompanyItem/IT Solutions/IT Solutions.jsp"
							class="btn btn-info">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4">
				<!-- 8/12 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-gift"></i> Free &amp; Open Source
						</h4>
					</div>
					<div class="panel-body">
						<p>jQuery is a cross-platform JavaScript library designed to
							simplify the client-side scripting of HTML. Used by over 60% of
							the 10,000 most visited websites, jQuery is the most popular
							JavaScript library in use today. jQuery is free, open-source
							software licensed under the MIT License.</p>
						<a href="CompanyItem/IT Solutions/IT Solutions.jsp"
							class="btn btn-info">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4">
				<div class="bs-component">
					<!-- 이클립스 해제 희망시 
				     1. http://ifone420.tistory.com/107
				     
				     추가적으로 
				     
				     localhost:8080/CWS 이부분은 server.xml 에서 지정한다.
				-->
					<jsp:include page="/board/bnsFrontList.do" flush="false" />

					<%--notice/news 순으로 5개씩 삽입 예정
						    만약에 공간 및 제약시 추후 tab 형태 고려 
						  --%>
				</div>
			</div>
		</div>

		<div class="enter"></div>


		<!-- /.row -->
		<%--이미지 괄호 높이가 같아야 한다 아래는 500 x 250 으로 통일 즉 비율이 맞아야 함
		--%>
		<!-- Portfolio Section -->
		<div class="row" id="IT_Products">
			<!-- 2행 -->
			<div class="col-lg-12">
				<!-- 소제목 lg >=1200px -->
				<h2 class="page-header" style="color:#317eac">IT Products</h2>
			</div>

			<div class="col-lg-12">
				<%--1행 --%>
				<div class="col-md-4 col-sm-6">
					<!-- md >= 992 / sm >=768  2행에서 1-->
					<a href="/CompanyItem/IT Products/OpenSRS/OpenSRS.jsp"> <img
						class="img-responsive img-portfolio img-hover"
						src="/CompanyItem/IT Products/Images/OpenSRS(h250).jpg" alt="">
					</a>
					<%--<p>Contents :</p> --%>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="/CompanyItem/IT Products/Windows/Windows.jsp"> <img
						class="img-responsive img-portfolio img-hover"
						src="/CompanyItem/IT Products/Images/windows10(h250).jpg" alt="">
					</a>
					<%--<p>Contents :</p> --%>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="/CompanyItem/IT Products/Azure/Azure.jsp"> <img
						class="img-responsive img-portfolio img-hover"
						src="/CompanyItem/IT Products/Images/ms_azure(h250).png" alt="">
					</a>
					<%--<p>Contents :</p> --%>
				</div>
			</div>

			<div class="col-lg-12">
				<%--2행 --%>
				<div class="col-md-4 col-sm-6">
					<!-- md >= 992 / sm >=768  2행에서 1-->
					<a href="/CompanyItem/IT Products/Aervision/Aervision.jsp"> <img
						class="img-responsive img-portfolio img-hover"
						src="/CompanyItem/IT Products/Images/AerVison(h250).png" alt="">
					</a>
					<%--<p>Contents :</p> --%>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
						class="img-responsive img-portfolio img-hover"
						src="/CompanyItem/IT Products/Images/tucows(h250).jpg" alt="">
					</a>
					<%--<p>Contents :</p> --%>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
						class="img-responsive img-portfolio img-hover"
						src="/CompanyItem/IT Products/Images/MsOffice(h250).jpg" alt="">
					</a>
					<%--<p>Contents :</p> --%>
				</div>
			</div>
			<%-- 3행
			<div class="col-md-4 col-sm-6">
				<!-- 2행에서 2 -->
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_word(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_powerpoint(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="/CompanyItem/IT Products/IT Products.jsp"> <img
					class="img-responsive img-portfolio img-hover"
					src="/CompanyItem/IT Products/Images/ms_publisher(350).png" alt="">
				</a>
				<p>Contents :</p>
			</div> --%>
		</div>
		<!-- /.row -->
		<div class="enter"></div>
		<!-- Features Section -->
		<div class="row" id="WebSite Building">
			<!-- 3행 -->
			<div class="col-lg-12">
				<h2 class="page-header" style="color:#317eac">Website Building</h2>
			</div>
			<div class="col-md-6 mgt5">
				<p>
					<strong>Technologies :</strong>
				</p>
				<ul>
					<li>Bootstrap v3.3.2</li>
					<li>jQuery v1.11.2</li>
					<li>Font Awesome v4.3.0</li>
					<li>Working JSP contact form with validation</li>
					<li>HTML5 & CSS & JavaScript & Ajax</li>
					<li>Spring Framework</li>
					<li>Google Analytics</li>
					<li>17 HTML pages</li>
				</ul>
				<%--15.10.18 내용수정  <p>Build websites for Company, Brands and online campaigns.
					Corporate website, Microsites and Promotion webpages, respectively.</p>--%>

				<p>Mwav의 사이트 구축 솔루션으로 회사용 인트라넷이나 팀에서 사용할 프로젝트 사이트, 고객용 포털을 시작할 수
					있습니다. 단 한 줄의 코드도 작성할 필요가 없습니다.</p>
				<br> <a class="btn btn-lg btn-primary btn-block"
					href="/CompanyItem/WebSite Building/WebSite Building.jsp">WebSite
					Building</a>
			</div>
			<!-- 580x357 -->
			<div class="col-md-6">
				<img class="img-responsive"
					src="/CompanyItem/WebSite Building/Images/WebSiteBuilding.jpg"
					alt="">
			</div>
		</div>
		<!-- /.row -->



		<div class="enter"></div>
		<!-- 
		<div class="well">
		 -->
		<div class="row" id="IT Consulting">
			<div class="col-lg-12">
				<h2 class="page-header" style="color:#317eac">IT Consulting</h2>
			</div>
			<!-- 4행 -->

			<div class="col-md-8">
				<img class="img-responsive"
					src="/CompanyItem/IT Consulting/Images/ITConsulting.jpg" alt="">
			</div>
			<div class="col-md-4 mgt5">
				<p>다양한 고객 비즈니스에 대한 이해와 컨설팅 수행 경험을 바탕으로 IT의 획기적 고도화 및 선진화를 위해 IT
					계획 수립(IT Planning)에서 구축(Implementation), 운영(Operation),
					유지보수(Maintenance)의 IT 라이프 사이클 활동을 효율적으로 수행할 수 있는 체계를 수립하고, 수립된 체계에
					따른 효과적 업무 수행을 지원하여 드립니다..</p>
				<%-- 15.10.18 내용수정	<p></p>--%>
				<a class="btn btn-lg btn-primary btn-block"
					href="/CompanyItem/IT Consulting/IT Consulting.jsp">IT
					Consulting</a>
			</div>

		</div>

		<div class="enter"></div>

		<!-- <div class="well"> -->
		<!-- Call to Action Section -->
		<div class="row" id="Digital Marketing">
			<div class="col-lg-12">
				<h2 class="page-header" style="color:#317eac">Digital Marketing</h2>
			</div>
			<!-- 4행 -->
			<div class="col-md-6 mgt5">
				<p>Mwav는 디지털 마케팅과 관련된 모든 분야(SNS, Portals ...)를 지원하며, 많은 고객과의 수행
					경험을 통해 습득한 통합 마케팅에 관한 남다른 노하우를 바탕으로 디지털 마케팅에 대한 통합적인 마케팅 전략을 수립하고
					실행하고 있습니다.</p>
				<br>
				<%--  15.10.18 내용수정p>Digital Ad Agency: Boost online promotions for maximum
						profits by leveraging digital marketing effectively.</p>--%>
				<a class="btn btn-lg btn-primary btn-block"
					href="/CompanyItem/Digital Marketing/Digital Marketing.jsp">Digital
					Marketing</a>
			</div>
			<div class="col-md-6">
				<img class="img-responsive"
					src="/CompanyItem/Digital Marketing/Images/DigitalMarketing.jpg"
					alt="">
			</div>
		</div>
		<!-- </div> -->
		<!-- /.container -->
	</div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>




	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		});
	</script>

</body>

</html>