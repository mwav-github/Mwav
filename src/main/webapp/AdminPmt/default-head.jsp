<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>
<!-- Bootstrap core CSS-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Custom fonts for this template-->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Page level plugin CSS
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
<link href="/resources/CommonLibrary/CSS/mwav_admin.css"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- Custom scripts for all pages
<script src="/CommonLibrary/Javascript/mwav_admin.js"></script>-->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script src="/CommonLibrary/Javascript/custom-chart.js"></script>

<script type="text/javascript">
	var contextPath = '<c:out value="${pageContext.request.contextPath}"/>';
	//var pgl = '${sessionScope.promoter.promoter_id}"/>';
	//var pgl = '${param.promoter_id}';
	

	$(document)
			.ready(
					function() {
						//getRemoteDataDrawChart(contextPath + '/linechart1.chart', createNewLineChart('chart1-container', getBaseChart()));
						//getRemoteDataDrawChart(contextPath + '/linechart2.chart', createNewLineChart('chart2-container', getBaseChart()));
						getRemoteDataDrawColumnChart(contextPath
								+ '/charts/highsofts/Top10PageList.mwav',
								createNewColumnChart('chart1-container',
										getBaseColumnChart()));
						getRemoteDataDrawChart(contextPath
								+ '/charts/highsofts/WeeklyUsers.mwav',
								createNewLineChart('chart3-container',
										getBaseLineChart()));
						getRemoteDataDrawPieChart(contextPath
								+ '/charts/highsofts/ClientScreenSize.mwav',
								createNewPieChart('chart2-container',
										getBasePieChart()));
					});
</script>