<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script src="/CommonLibrary/Javascript/custom-chart.js"></script>
<script type="text/javascript">
	var charData = '<c:out value="${charData}"/>';

	if (emptyChk(charData)) {
		var series2 = '<c:out value="${charDataSeries}"/>';
		var categories2 = '<c:out value="${categories}"/>';
		var title = '<c:out value="${charData.title}"/>';
		var yTitle = '<c:out value="${charData.yAxisTitle}"/>';
		var xTitle = '<c:out value="${charData.xAxisTitle}"/>';
		var divId = '<c:out value="${charData.divId}"/>';

		var decodeHtmlEntity = function(series2) {
			return series2.replace(/&\#(\d+);/g, function(match, dec) {
				return String.fromCharCode(dec);
			});
		};

		var series = decodeHtmlEntity(series2);
		var categories = decodeHtmlEntity(categories2);
		$(document).ready(
				function() {
					getRemoteDataDrawChart_News(categories, title, yTitle,
							xTitle, divId, series, createNewLineChart(
									'chart4-container', getBaseLineChart()));

				});
	}
</script>
<!-- imsi -->

<!-- Content Column -->
<div class="row news_fontfamilly">

	<div class="col-md-12">


		<h2 class="news_title text-color-blue-type-1">
			${selectOneBnsView.bnTitle}</h2>
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

		<c:if test="${charData != '' && charData ne null}">
			<div class="col-md-12">
				<div class="enter"></div>
				<div class="panel panel-default">

					<div class="panel-body">
						<div id="chart4-container"></div>
					</div>
					<div class="panel-footer">
						<p>* 일별 데이터는 익일 8~10시간 후 결과에 반영됩니다.</p>
						<p>
							* 그래프는 네이버에서 해당검색어가 검색 및 클릭된 횟수를 일별/주별/월별 각각 합산하여 <span
								style="color: #268bd2; font-weight: 700">조회기간 내 최대 검색량을
								100으로 표현하여 상대적인 변화</span>를 나타냅니다.
						</p>
					</div>
				</div>

			</div>
		</c:if>

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
