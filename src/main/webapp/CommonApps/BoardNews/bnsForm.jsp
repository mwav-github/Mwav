<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
<script>
	function check() {
	/* 	if (document.bnsForm.staff_id.value == "") {
			alert("이름을 입력하십시오.");
			document.bnsForm.staff_id.focus();
			return false;
		}
		 */if (document.bnsForm.bnGroup.value == "") {
			alert("분류를 선택하세요.");
			document.bnsForm.bnGroup.focus();
			return false;
		}
		if (document.bnsForm.bnTitle.value == "") {
			alert("제목을 입력하십시요.");
			document.bnsForm.bnTitle.focus();
			return false;
		}
		/* 
		ckeditor라 value에 대한 내용이 없다 추가 생각요망
		
		if (document.bnsForm.bnContent.value == "") {
			alert("내용을 입력 하십시요.");
			document.bnsForm.bnContent.focus();
			return false;
		} */
		document.bnsForm.submit();

	}
</script>
<!-- imsi -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">


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
	<form role="form"den method="post" name="bnsForm"
		action="/board/bnsForm.do">
		<table class="table table-striped">
		
			<thead>
				<tr>
				
					<div class="pull-right">
					<%--기본값 --%>
					<input type="hidden" name="bNews_id" />
					<input type="hidden" name="bnHighLight" value="0"/>
					<input type="hidden" name="bnViewCount" value="0" MaxLength="10" />
					
					<%--높을수록 TOP (추후 반영)_15.08.01 --%>
					<input type="hidden" name="bnOrder" value="0" />
					<%--직원담당자 staff_id 추후 반영예정 --%>
					<input type="hidden" name="staff_id" value="0" />
					
						<select class="form-control" name="bnStatus">
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
				<th class="active">Content</th>
				<td><textarea name="bnContent"
						class="form-control input-sm ckeditor" id="message"
						placeholder="Message" maxlength="140" rows="7"
						style="width: 100%; height: 200px;"></textarea> <span
					class="help-block"></span></td>
			</tr>

		</table>


		<br style="clear: both">
		<p class="pull-right">
			<button type="button" class="btn btn-success">All List</button>
			<button type="button" class="btn btn-warning" onClick="javascript:history.go(-1)">BACK</button>
			<button type="submit" class="btn btn-primary" onclick="check()">Insert</button>
		</p>
	</form>
</div>
