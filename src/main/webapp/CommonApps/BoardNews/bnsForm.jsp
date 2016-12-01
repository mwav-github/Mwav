<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ////basePackage
<script src="//cdn.ckeditor.com/4.5.11/basic/ckeditor.js"></script>
/////// -->

<!-- StandardPackage 
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>-->

<!-- FullPackage -->
<script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>

<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>
<script>
	function check() {
	/* 	if (document.bnsForm.staff_id.value == "") {
			alert("이름을 입력하십시오.");
			document.bnsForm.staff_id.focus();
			return false;
		}
	
	
		 */
		if (confirm("정말 입력 또는 수정하시겠습니까??") == true){    //확인
			if (document.bnsForm.bnGroup.value == "") {
				alert("분류를 선택하세요.");
				document.bnsForm.bnGroup.focus();
				return false;
			}
			if (document.bnsForm.bnTitle.value == "") {
				alert("제목을 입력하십시요.");
				document.bnsForm.bnTitle.focus();
				return false;
			}
			document.bnsForm.submit();
		}else{   //취소
		    return;
		}
	
	}
</script>
<script>
	function check2(obj) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var bbb = obj;
			location.href= "/board/bnsDelete.do?bNews_id="+bbb;
		}else{   //취소
		    return;
		}

	}
</script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="//cdn.ckeditor.com/4.5.11/basic/ckeditor.js"></script>

<!-- 소제목 -->
<!-- ----- 
색 : http://the3.tistory.com/49

<tr class="active">...</tr>
<tr class="success">...</tr>
<tr class="warning">...</tr>
<tr class="danger">...</tr>
<tr class="active">...</tr>

-->

<!-- Content Column -->
<div class="table-responsive">

	<c:choose>
		<c:when test="${fn:length(selectboardUpdate) > 0}">
			<form role="form" method="post" name="bnsForm"
				action="/board/bnsUpdatePro.do">
				<table class="table table-striped">

					<thead>
						<tr>

							<div class="pull-right">
								<%--기본값 --%>
								<input type="hidden" name="bNews_id"
									value="${selectboardUpdate.bNews_id}" /> <input type="hidden"
									name="bnHighLight" value="0" /> <input type="hidden"
									name="bnViewCount" value="0" MaxLength="10" /> <input
									type="hidden" name="bnInsertDt"
									value="${selectboardUpdate.bnInsertDt}" />

								<%--높을수록 TOP (추후 반영)_15.08.01 --%>
								<input type="hidden" name="bnOrder" value="0" />
								<%--직원담당자 staff_id 추후 반영예정 --%>
								<input type="hidden" name="staff_id" value="0" /> <select
									class="form-control btn-sm" name="bnStatus"
									value="${selectboardUpdate.bnStatus}">
									<option value="0">임시저장상태</option>
									<option value="1">현재공지상태</option>
								</select>
								<div class="enter"></div>
							</div>
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
							<td>${selectboardUpdate.bNews_id}</td>
							<td><select name="bnGroup"
								value="${selectboardUpdate.bnGroup}">
									<option value="전체">전체</option>
									<option value="휴대폰">휴대폰</option>
									<option value="인터넷">인터넷</option>
									<option value="영어">영어</option>
									<option value="유통">유통</option>
									<option value="SI개발">SI개발</option>
							</select></td>
							<td>${selectboardUpdate.bnViewCount}</td>
							<td>${selectboardUpdate.bnInsertDt}</td>
							<td>${selectboardUpdate.staff_id}</td>
							<td>${selectboardUpdate.bnOrder}</td>
						</tr>
					</tbody>
				</table>

				<table class="table table-striped">

					<tr>
						<th class="active">Title</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="bnTitle"
							value="${selectboardUpdate.bnTitle}"></td>
					</tr>



					<tr>
						<th class="active">SubTitle</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="bnSubTitle"
							value="${selectboardUpdate.bnSubTitle}"></td>
					</tr>

					<tr>
						<th class="active">Reference</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="bnRelatedLink" value="${selectboardUpdate.bnRelatedLink}"></td>
					</tr>

					<tr>
						<th class="active">Content</th>
						<td><textarea name="bnContent"
								class="form-control input-sm ckeditor" id="message"
								placeholder="Message" style="width: 100%; height: 200px;">${selectboardUpdate.bnContent}</textarea>
							<script type="text/javascript">
															//<![CDATA[
															CKEDITOR
																	.replace('bnContent');
															//]]
														</script> <span class="help-block"></span></td>
					</tr>

				</table>


				<br style="clear: both">
				<p class="pull-right">
					<button type="button" class="btn btn-success"
						onClick="javascript:window.location.href='/board/bnsList.do'">All
						List</button>
					<button type="button" class="btn btn-warning"
						onClick="javascript:history.go(-1)">BACK</button>

					<button type="button" class="btn btn-danger"
						onclick="check2(${selectboardUpdate.bNews_id})">Delete</button>
					<button type="button" class="btn btn-primary" onclick="check()">Modify</button>
				</p>
			</form>

		</c:when>
		<c:otherwise>
			<form role="form" method="post" name="bnsForm"
				action="/board/bnsForm.do">
				<table class="table table-striped">

					<thead>
						<tr>

							<div class="pull-right">
								<%--기본값 --%>
								<input type="hidden" name="bNews_id" /> <input type="hidden"
									name="bnHighLight" value="0" /> <input type="hidden"
									name="bnViewCount" value="0" MaxLength="10" />

								<%--높을수록 TOP (추후 반영)_15.08.01 --%>
								<input type="hidden" name="bnOrder" value="0" />
								<%--직원담당자 staff_id 추후 반영예정 --%>
								<input type="hidden btn-sm" name="staff_id" value="0" /> <select
									class="form-control" name="bnStatus">
									<option value="0">임시저장상태</option>
									<option value="1">현재공지상태</option>
								</select>
								<div class="enter"></div>
							</div>
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
							<td></td>
							<td><select name="bnGroup">
									<option value="전체">전체</option>
									<option value="휴대폰">휴대폰</option>
									<option value="인터넷">인터넷</option>
									<option value="영어">영어</option>
									<option value="유통">유통</option>
									<option value="SI개발">SI개발</option>
							</select></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-striped">

					<tr>
						<th class="active">Title</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="bnTitle"></td>
					</tr>



					<tr>
						<th class="active">SubTitle</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="bnSubTitle"></td>
					</tr>

					<tr>
						<th class="active">Reference</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="bnRelatedLink"></td>
					</tr>

					<tr>
						<th class="active">Content</th>
						<td><textarea name="bnContent"
								class="form-control input-sm ckeditor" id="message"
								placeholder="Message" style="width: 100%; height: 200px;"></textarea>
							<span class="help-block"></span></td>
					</tr>

				</table>


				<br style="clear: both">
				<p class="pull-right">
					<button type="button" class="btn btn-success"
						onClick="javascript:window.location.href='/board/bnsList.do'">All
						List</button>
					<button type="button" class="btn btn-warning"
						onClick="javascript:history.go(-1)">BACK</button>
					<button type="button" class="btn btn-primary" onclick="check()">Insert</button>
				</p>
			</form>
		</c:otherwise>
	</c:choose>

</div>
