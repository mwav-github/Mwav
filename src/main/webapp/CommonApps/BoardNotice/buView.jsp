<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	//kakao init
	Kakao.init('b66e3d6516bdc422b77b51024332a218');
</script>
<!-- Content Column -->
<div class="row news_fontfamilly">
	<div class="col-md-12">

		<h2 class="news_title">
			<a>${selectOneBuView.buTitle}</a>
		</h2>
		<p class="news_subtitle">
			<c:if
				test="${selectOneBuView.buSubTitle != '' or selectOneBuView.buSubTitle eq null}">
				${selectOneBuView.buSubTitle} 
			</c:if>
		</p>
		<hr>
		<p>
			<i class="fa fa-clock-o"></i> Last Modified:
			${selectOneBuView.fmbuInsertDt} | Topic: ${selectOneBuView.buGroup}
		</p>
		<hr>
		<div class="text-right">
			<a class="btn btn-social-icon btn-facebook"
				onClick="sendSns('http://www.mwav.net/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id}', 'facebook', '${selectOneBuView.buTitle}', 'social', 'notices', '${selectOneBuView.buSubTitle}', '${param.pgl}')"><span
				class="fa fa-facebook"></span></a> <a
				class="btn btn-social-icon btn-google"
				onClick="sendSns('http://www.mwav.net/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id}','googleplus', '${selectOneBuView.buTitle}', 'social', 'notices', '${selectOneBuView.buSubTitle}', '${param.pgl}')"><span
				class="fa fa-google"></span></a> <a
				class="btn btn-social-icon btn-linkedin"
				onClick="sendSns('http://www.mwav.net/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id}','linkedin', '${selectOneBuView.buTitle}', 'social', 'notices', '${selectOneBuView.buSubTitle}', '${param.pgl}')"><span
				class="fa fa-linkedin"></span></a> <a
				class="btn btn-social-icon btn-twitter"
				onClick="sendSns('http://www.mwav.net/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id}','twitter', '${selectOneBuView.buTitle}', 'social', 'notices', '${selectOneBuView.buSubTitle}', '${param.pgl}')"><span
				class="fa fa-twitter"></span></a> <a
				class="btn btn-social-icon btn-kakao"
				onClick="sendSns('https://www.mwav.net/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id}','kakao', '${selectOneBuView.buTitle}', 'social', 'notices', '${selectOneBuView.buSubTitle}', '${param.pgl}', '${selectOneBuView.buRelatedLink}', ${selectOneBuView.buViewCount})">
			<span class="icon-kakao"> </span>
			</a>
		</div>
		<div class="enter"></div>

		<div class="news_contents">${selectOneBuView.buContent}</div>

		<div class="enter"></div>

		<hr class="hr_b">

		<br style="clear: both">
		<div class="row text-right">
			<p>
				<button type="button" class="btn btn-default"
					onClick="javascript:window.location.href='/CustomerService/Announcement/Announcement.mwav'">All
					List</button>
				<button type="button" class="btn btn-default"
					onClick="javascript:history.go(-1)">BACK</button>
			</p>
		</div>

		<!-- Pager -->
		<%--이전 이후있는 경우만 가능하도록 if 문 처리 필요. 
		<div class="row">
			<ul class="pager">
				<li class="previous"><a
					href="/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id-1}">←
						Older</a></li>
				<li class="next"><a
					href="/board/buView.mwav?bUsers_id=${selectOneBuView.bUsers_id+1}">Newer
						→</a></li>
			</ul>
		</div>--%>

	</div>


</div>
