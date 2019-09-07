<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<%--meta 태그 말고 추후 robot.txt로 제어 --%>
<%--모든 검색엔진 로봇에게 자신의 사이트의 내용을 긁어가지 못하도록(인덱싱) 하려면 아래와 같이 합니다.  --%>
<META NAME="ROBOTS" CONTENT="NOINDEX"> 
<%--모든 검색엔진 로봇이 사이트 내의 링크들을 따라 돌아다니지 못하게 하려면 이렇게 합니다.  --%>
<META NAME="ROBOTS" CONTENT="NOFOLLOW"> 


<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script src="/CommonLibrary/Javascript/custom-chart.js"></script>
<script type="text/javascript">
	var contextPath = '<c:out value="${pageContext.request.contextPath}"/>';
	$(document).ready(
			function() {
				//getRemoteDataDrawChart(contextPath + '/linechart1.chart', createNewLineChart('chart1-container', getBaseChart()));
				//getRemoteDataDrawChart(contextPath + '/linechart2.chart', createNewLineChart('chart2-container', getBaseChart()));
				getRemoteDataDrawColumnChart(contextPath
						+ '/charts/highsofts/Top10PageList.mwav', createNewColumnChart(
						'chart1-container', getBaseColumnChart()));
				getRemoteDataDrawChart(contextPath + '/charts/highsofts/WeeklyUsers.mwav',
						createNewLineChart('chart3-container',
								getBaseLineChart()));
				getRemoteDataDrawPieChart(contextPath
						+ '/charts/highsofts/ClientScreenSize.mwav', createNewPieChart(
						'chart2-container', getBasePieChart()));
			});
</script>
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
<c:if test="${requestScope.loginCheck eq 7 }">
	<script type="text/javascript">
		alert('탈퇴한 회원입니다.');
		msg = '재 가입하시겠습니까.?'
		if (confirm(msg) != 0) {
			location.replace("/MasterPage_1.jsp?mode=Default"); // 이전 url 기록안하는 경우 , location.href 의 경우 이전기록이 남아 login.mwav로 포워딩
		} else {
			history.go(-1)
		}
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
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />

	<%-- Page Content (슬라이드 쇼 제외 실제 본문 내용)--%>
	<div class="row" style="background: url(/Admins/zImages/bg.png) #eee;">
		<div class="container">
			<%-- Fluid container : .container 로 콘텐츠를 감싸는 것으로 페이지의 콘텐츠를 쉽게 중앙으로 가져오세요. 
		                       .container 는 우리의 그리드 시스템에 맞는 다양한 미디어 쿼리 분기점에서 max-width 가 설정되어 있습니다. 
		                       **추후 수정
		                       --%>
		<!-- Marketing Icons Section -->
			
		<!-- 	<iframe src="https://calendar.google.com/calendar/embed?title=Mwav_WBS&amp;height=400&amp;wkst=1&amp;hl=en&amp;bgcolor=%23FFFFFF&amp;src=t73a6fe660mb472delh1u3ild52l4hk2%40import.calendar.google.com&amp;color=%232952A3&amp;src=mwav.net_dcq0ccsaattqooc7htj53jg8n0%40group.calendar.google.com&amp;color=%232952A3&amp;src=s1vgf025rring9lqn6p0ptgc1uradldf%40import.calendar.google.com&amp;color=%2328754E&amp;ctz=Asia%2FSeoul" style="border-width:0" width="1150" height="400" frameborder="0" scrolling="no"></iframe>
		 -->	
			<div class="row mg5xauto">
				<%--장바구니 테스트 --%>
				<!-- <span class="pull-right"><a href="#orderCart"
				data-toggle="modal" data-target=".orderCart" role="button"
				data-toggle="modal"><i class="fa fa-cart-arrow-down fa-2x"></i></a></span> -->

				<%-- <jsp:include page="/Admins/OrderMgr/OrderList.jsp" flush="false" /> --%>



				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green" style="border-color: #5cb85c">
						<div class="panel-heading"
							style="background-color: #5cb85c; color: #fff">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">12</div>
									<div>New Tasks!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow" style="border-color: #f0ad4e">
						<div class="panel-heading"
							style="background-color: #f0ad4e; color: #fff">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-shopping-cart fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">124</div>
									<div>New Orders!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red" style="border-color: #d9534f">
						<div class="panel-heading"
							style="background-color: #d9534f; color: #fff">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-support fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">13</div>
									<div>Support Tickets!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>


			<!-- /.row -->
			<%--이미지 괄호 높이가 같아야 한다 아래는 500 x 250 으로 통일 즉 비율이 맞아야 함
		--%>

			<!-- Portfolio Section -->
			<div class="row">
				<div class="col-md-12">

					<!-- <div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Highchart Chart 1</h3>
						</div>
						<div id="chart1-container"
							style="min-width: 300px; max-width: 500px; height: 300px; margin: 0 auto"></div>
					</div> -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bar-chart"></i> BarChart
							</h3>
						</div>
						<div class="panel-body">
							<div id="chart1-container"></div>
						</div>
						<div class="panel-footer">Updated yesterday at 11:59 PM</div>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-pie-chart" aria-hidden="true"></i> PieChart
							</h3>
						</div>
						<div class="panel-body">
							<div id="chart2-container"></div>
						</div>
						<div class="panel-footer">Updated yesterday at 11:59 PM</div>
					</div>


				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-line-chart" aria-hidden="true"></i> LineChart
							</h3>
						</div>
						<div class="panel-body">
							<div id="chart3-container"></div>
						</div>
						<div class="panel-footer">Updated yesterday at 11:59 PM</div>
					</div>

				</div>
			</div>

			<!-- Portfolio Section -->
			<div class="row" id="IT_Products">
				<div class="col-md-12 col-sm-12">
					<div class="panel panel-red">
						<div class="panel-heading"
							style="background-color: #d9534f; color: #fff;">Q&A</div>
						<div class="panel-body">
							<jsp:include page="/qa/qaFrontList.mwav" flush="false" />

						</div>
					</div>

				</div>

			</div>

			<div class="row" id="IT_Products">
				<div class="col-md-6 col-sm-6">
					<div class="panel panel-primary">
						<div class="panel-heading">Notices</div>
						<div class="panel-body">
							<jsp:include page="/admin/boardNotice/ntmFrontList.mwav"
								flush="false" />

						</div>
					</div>

				</div>
				<div class="col-md-6 col-sm-6">
					<div class="panel panel-primary">
						<div class="panel-heading">News</div>
						<div class="panel-body">
							<jsp:include page="/admin/boardNews/nsmFrontList.mwav"
								flush="false" />
						</div>
					</div>

				</div>



			</div>

			<!-- /.row -->
			<div class="enter"></div>
			<!-- Features Section -->




		</div>

	</div>

	<div class="enter"></div>

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>