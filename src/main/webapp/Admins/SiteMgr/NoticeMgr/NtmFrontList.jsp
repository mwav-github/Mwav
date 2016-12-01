<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- imsi -->
<!-- <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet"> -->
<script>
	function page_move2(s_value) {
		var f = document.NsmNews; //폼 name
		f.bUsers_id.value = s_value; //POST방식으로 넘기고 싶은 값 (이건 실제 내부 내용)
		f.submit();
	}
	
	
</script>
<div class="bs-component">
	<!-- NEW  -->
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Title</th>
				<th>UpdateDate</th>
			</tr>
		</thead>
		<tbody>
		<%--xml mapper에서 사용한 id는 사용불가능하다. --%>
			<form name="NsmNews" action="/admin/boardNotice/nsmView.do" method="post">
				<c:choose>
					<c:when test="${fn:length(selectListNtmFrontList) > 0}">
						<c:forEach var="VselectListNtmFrontList" items="${selectListNtmFrontList}">
							<input type="hidden" name="bUsers_id" value="${VselectListNtmFrontList.bUsers_id}" />
							<input type="hidden" name="buViewCount" value="${VselectListNtmFrontList.buViewCount}" />
							<tr>
								<!-- a태그로 처리요망 -->
								<td><a
									href="/boardNotice/buView.do?bUsers_id=${VselectListNtmFrontList.bUsers_id}">${VselectListNtmFrontList.buTitle}</a></td>
								<%--view를 구현하는 방법에 따라 달라진다. get 문 형태 유망 --%>
								<td>${VselectListNtmFrontList.buInsertDt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</form>
		</tbody>
	</table>
</div>

<!-- 

1. 페이징 기법을 변경한다.
 
레코드셋.PageSize = 10
 
이건 많은 데이타를 읽어와서 그 중 10개만 보여주는 형태 입니다. 테이블의 로우 수가 커질수록 당연히 느려지겠지요.
강좌란에 가시면
 
1799		sql매거진 에서 퍼온 페이징 저장 프로시저		3		7.3		서민호(minotie)		2005-01-22
 
이 글이 도움이 될 겁니다.
 
2. 첫페이지를 HTML 화 해서 보여준다.
리스트라는 것이 사용자가 새글을 올렸을 때 또는수정, 삭제 했을 때 변하게 되는 거지요
그 때마다 HTML 로 만들어진 최종 결과물을 .htm 확장자로 저장하고 그것을 첫페이지로 만드는 것이지요.
부연하자면 굳이 매번 첫페이지를 asp 로 해서 DB 결과를 가져오는 코드로 돌리 것이 아니라
DB 에 변화가 있을 때만 asp 로 돌려서 나온 결과를 .htm 으로 저장해 두고 그 .htm 을 보여주는 것이지요.
신문사들이 주로 이 기법을 활용하는 걸로 알구요. 데브피아에서도 이 기법을 사용했었던 것을 압니다.
강좌란 잘 찾아보면 있지 않을까 싶네요.
 
그럼 성공하시길..
 
() ()
 -->
