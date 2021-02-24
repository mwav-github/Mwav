<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<!-- jQuery Version 1.11.0 -->
<script src="/CommonLibrary/Javascript/Common.js"></script>
<script>
	function check() {
	/* 	if (document.buForm.staff_id.value == "") {
			alert("이름을 입력하십시오.");
			document.buForm.staff_id.focus();
			return false;
		}
	
	
		 */
		if (confirm("정말 입력 또는 수정하시겠습니까??") == true){    //확인
			if (document.buForm.buGroup.value == "") {
				alert("분류를 선택하세요.");
				document.buForm.buGroup.focus();
				return false;
			}
			if (document.buForm.buTitle.value == "") {
				alert("제목을 입력하십시요.");
				document.buForm.buTitle.focus();
				return false;
			}
			document.buForm.submit();
		}else{   //취소
		    return;
		}
	
	}
</script>
<script>
	function check2(obj) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var bbb = obj;
			location.href= "/boardNotice/buDelete.mwav?boardUser_id="+bbb;
		}else{   //취소
		    return;
		}

	}
</script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<!-- ////basePackage
<script src="//cdn.ckeditor.com/4.5.11/basic/ckeditor.js"></script>
/////// -->

<!-- StandardPackage 
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script> -->

<!-- FullPackage --> 
<script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>

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
			<form role="form" method="post" name="buForm"
				action="/boardNotice/buUpdate.mwav">
				<table class="table table-striped">

					<thead>
						<tr>

							<div class="pull-right">
								<%--기본값 --%>
								<input type="hidden" name="boardUser_id"
									value="${selectboardUpdate.boardUser_id}" /> <input type="hidden"
									name="buHighLight" value="0" /> <input type="hidden"
									name="buViewCount" value="0" MaxLength="10" /> <input
									type="hidden" name="buInsertDt"
									value="${selectboardUpdate.buInsertDt}" />

								<%--높을수록 TOP (추후 반영)_15.08.01 --%>
								<input type="hidden" name="buOrder" value="0" />
								<%--직원담당자 staff_id 추후 반영예정 --%>
								<input type="hidden" name="staff_id" value="0" /> <select
									class="form-control" name="buStatus"
									value="${selectboardUpdate.butatus}">
									<option value="0">임시저장상태</option>
									<option value="1">현재공지상태</option>
								</select>
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
							<td>${selectboardUpdate.boardUser_id}</td>
							<td><select name="buGroup"
								value="${selectboardUpdate.buGroup}">
									<option value="전체">전체</option>
									<option value="휴대폰">휴대폰</option>
									<option value="인터넷">인터넷</option>
									<option value="영어">영어</option>
									<option value="유통">유통</option>
									<option value="SI개발">SI개발</option>
							</select></td>
							<td>${selectboardUpdate.buViewCount}</td>
							<td>${selectboardUpdate.buInsertDt}</td>
							<td>${selectboardUpdate.staff_id}</td>
							<td>${selectboardUpdate.buOrder}</td>
						</tr>
					</tbody>
				</table>

				<table class="table table-striped">

					<tr>
						<th class="active">Title</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="buTitle"
							value="${selectboardUpdate.buTitle}"></td>
					</tr>



					<tr>
						<th class="active">SubTitle</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="buSubTitle"
							value="${selectboardUpdate.buSubTitle}"></td>
					</tr>
					
					<tr>
						<th class="active">Reference</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="buRelatedLink"
							value="${selectboardUpdate.buRelatedLink}"></td>
					</tr>

					<tr>
						<th class="active">Content</th>
						<td><textarea name="buContent"
								class="form-control input-sm ckeditor" id="message"
								placeholder="Message"
								style="width: 100%; height: 200px;">${selectboardUpdate.buContent}</textarea>
							<script type="text/javascript">
															//<![CDATA[
															CKEDITOR
																	.replace('buContent');
															//]]
														</script> <span class="help-block"></span></td>
					</tr>

				</table>


				<br style="clear: both">
				<p class="pull-right">
					<button type="button" class="btn btn-success"
						onClick="javascript:window.location.href='/board/buList.mwav'">All
						List</button>
					<button type="button" class="btn btn-warning"
						onClick="javascript:history.go(-1)">BACK</button>

					<button type="button" class="btn btn-danger"
						onclick="check2(${selectboardUpdate.boardUser_id})">Delete</button>
					<button type="button" class="btn btn-primary" onclick="check()">Modify</button>
				</p>
			</form>

		</c:when>
		<c:otherwise>
			<form role="form" method="post" name="buForm"
				action="/boardNotice/buForm.mwav">
				<table class="table table-striped">

					<thead>
						<tr>

							<div class="pull-right">
								<%--기본값 --%>
								<input type="hidden" name="boardUser_id" /> 
								<input type="hidden" name="buHighLight" value="0" /> 
								<input type="hidden" name="buViewCount" value="0" MaxLength="10" />

								<%--높을수록 TOP (추후 반영)_15.08.01 --%>
								<input type="hidden" name="buOrder" value="0" />
								<%--직원담당자 staff_id 추후 반영예정 --%>
								<input type="hidden" name="staff_id" value="0" /> <select
									class="form-control" name="buStatus">
									<option value="0">임시저장상태</option>
									<option value="1">현재공지상태</option>
								</select>
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
							<td><select name="buGroup">
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
							placeholder="Text input" name="buTitle"></td>
					</tr>



					<tr>
						<th class="active">SubTitle</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="buSubTitle"></td>
					</tr>
					
					<tr>
						<th class="active">Reference</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="buRelatedLink"
							></td>
					</tr>
					

					<tr>
						<th class="active">Content</th>
						<td><textarea name="buContent"
								class="form-control input-sm ckeditor" id="message"
								placeholder="Message" 
								style="width: 100%; height: 200px;"></textarea> <span
							class="help-block"></span></td>
					</tr>

				</table>


				<br style="clear: both">
				<p class="pull-right">
					<button type="button" class="btn btn-success"
						onClick="javascript:window.location.href='/board/buList.mwav'">All
						List</button>
					<button type="button" class="btn btn-warning"
						onClick="javascript:history.go(-1)">BACK</button>
					<button type="button" class="btn btn-primary" onclick="check()">Insert</button>
				</p>
			</form>
		</c:otherwise>
	</c:choose>

</div>
