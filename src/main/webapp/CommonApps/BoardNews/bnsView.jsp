<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>

<!-- Highcharts -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<style type="text/css">
#highchartsData {
  min-width: 310px;
  max-width: 800px;
  height: 400px;
  margin: 0 auto
}
</style>
<!-- imsi -->

<!-- Content Column -->
<div class="row news_fontfamilly" >
	<form role="form">
		<%-- <table class="table-responsive table table-striped">
			<thead>

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
					<td>${selectOneBnsView.bNews_id}</td>
					<td>${selectOneBnsView.bnGroup}</td>
					<td>${selectOneBnsView.bnViewCount}</td>
					<td>${selectOneBnsView.bnInsertDt}</td>
					<td>${selectOneBnsView.staff_id}</td>
					<td>${selectOneBnsView.bnOrder}</td>
				</tr>
			</tbody>
		</table>

		<table class="table table-striped">

			<tr>
				<th class="active">Title</th>
			</tr>
			<tr>
				<td>${selectOneBnsView.bnTitle}</td>
			</tr>

			subtitle은 우리쪽 내용이 들어가는 부분이므로 null이면 노출하지 않는다. admin 페이지는 전체 노출!! 

			<c:if
				test="${selectOneBnsView.bnSubTitle != '' or selectOneBnsView.bnSubTitle eq null}">
				<tr>
					<th class="active">SubTitle</th>
				</tr>
				<tr>
					<td>${selectOneBnsView.bnSubTitle}</td>
				</tr>

			</c:if>
			
			<tr>
				<th class="active">Reference</th>

			</tr>
			<tr>
				<td>${selectOneBnsView.bnRelatedLink}</td>
			</tr>
			
			
			<tr>
				<th class="active">Content</th>

			</tr>
			<tr>
				<td>${selectOneBnsView.bnContent}</td>
			</tr>

		</table> --%>
	</form>

	<div class="col-md-12">


		<h2 class="news_title text-color-blue-type-1">
			${selectOneBnsView.bnTitle}
		</h2>
		<p class="news_subtitle">
			<c:if
				test="${selectOneBnsView.bnSubTitle != '' or selectOneBnsView.bnSubTitle eq null}">
				${selectOneBnsView.bnSubTitle} 
			</c:if>
		</p>
		<hr>
		<p>
			<i class="fa fa-clock-o"></i> Last Modified:
			${selectOneBnsView.fmbnUpdateDt} | Topic: ${selectOneBnsView.bnGroup}
		</p>
		<hr>
		<div class="text-right">
			<a class="btn btn-social-icon btn-facebook"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}', 'facebook', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}', '${param.pgl}')"><span
				class="fa fa-facebook"></span></a> <a
				class="btn btn-social-icon btn-google"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}','googleplus', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}', '${param.pgl}')"><span
				class="fa fa-google"></span></a> <a
				class="btn btn-social-icon btn-linkedin"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}','linkedin', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}', '${param.pgl}')"><span
				class="fa fa-linkedin"></span></a> <a
				class="btn btn-social-icon btn-twitter"
				onClick="sendSns('http://www.mwav.net/board/bnsView.mwav?bNews_id=${selectOneBnsView.bNews_id}','twitter', '${selectOneBnsView.bnTitle}', 'social', 'news', '${selectOneBnsView.bnSubTitle}', '${param.pgl}')"><span
				class="fa fa-twitter"></span></a>
		</div>
		<div class="enter"></div>

		<div class="news_contents">${selectOneBnsView.bnContent}</div>

		<c:if test="${selectOneBnsView.bnRelatedLink eq null }">
			<a class="btn btn-primary" href='${selectOneBnsView.bnRelatedLink}'>Read
				More <i class="fa fa-angle-right"></i>
			</a>
		</c:if>
		
		<div id="highchartsData"></div>
		<script type="text/javascript">

		Highcharts.chart('highchartsData', {

		  title: {
		    text: 'Solar Employment Growth by Sector, 2010-2016'
		  },

		  subtitle: {
		    text: 'Source: thesolarfoundation.com'
		  },

		  yAxis: {
		    title: {
		      text: 'Number of Employees'
		    }
		  },
		  legend: {
		    layout: 'vertical',
		    align: 'right',
		    verticalAlign: 'middle'
		  },

		  plotOptions: {
		    series: {
		      label: {
		        connectorAllowed: false
		      },
		      pointStart: 2010
		    }
		  },

		  series: [{
		    name: 'Installation',
		    data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
		  }, {
		    name: 'Manufacturing',
		    data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
		  }, {
		    name: 'Sales & Distribution',
		    data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
		  }, {
		    name: 'Project Development',
		    data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
		  }, {
		    name: 'Other',
		    data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
		  }],

		  responsive: {
		    rules: [{
		      condition: {
		        maxWidth: 500
		      },
		      chartOptions: {
		        legend: {
		          layout: 'horizontal',
		          align: 'center',
		          verticalAlign: 'bottom'
		        }
		      }
		    }]
		  }

		});
		</script>
		

		<hr class="hr_b">



		<br style="clear: both">
		<div class="row text-right">
			<p>
				<button type="button" class="btn btn-default"
					onClick="javascript:window.location.href='/Company/ITTrends/ITTrends.mwav'">All
					List</button>
				<button type="button" class="btn btn-default"
					onClick="javascript:history.go(-1)">BACK</button>
			</p>
		</div>

	</div>
</div>
