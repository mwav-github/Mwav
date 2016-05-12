<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//cdn.ckeditor.com/4.4.6/basic/ckeditor.js"></script>
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

			<form role="form" method="post" name="frmQA" action="">

				<%-- hidden name 값 지정. --%>
				<INPUT TYPE="hidden" NAME="qaMode" VALUE=""> <INPUT
					TYPE="hidden" NAME="qaStatusBit" VALUE=""> <INPUT
					TYPE="hidden" NAME="MbrID" VALUE=""> <INPUT TYPE="hidden"
					NAME="QAidx" VALUE=""> <INPUT TYPE="hidden" NAME="qService"
					VALUE=""> <INPUT TYPE="hidden" NAME="pageName" VALUE="">


				
				<table class="table">

					<tr>
						<th class="active">Title</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqTitle"></td>
						<th class="active">Group</th>
						<td><select class="form-control" name="uqGroup" value="">
								<option value="일반">일반문의</option>
						</select></td>
					</tr>
					<tr>
						<th class="active">Name</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqUserName"></td>
						<th class="active">Password</th>
						<td><input type="password" class="form-control"
							placeholder="Text input" name="uqUserEmail"></td>
					</tr>

					<tr>
						<th class="active">Phone</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqUserPhone"></td>
						<th class="active">Email</th>
						<td><input type="text" class="form-control"
							placeholder="Text input" name="uqUserEmail"></td>
					</tr>

					<tr>
						<th class="active">Content</th>
						<td colspan="3"><textarea name="uqContent"
								class="form-control input-sm ckeditor" id="message"
								placeholder="Message" maxlength="140" rows="7"
								style="width: 100%; height: 200px;"></textarea> <span
							class="help-block"></span></td>
					</tr>

				</table>
				<br style="clear: both">
				<p class="pull-right">
					<button type="button" class="btn btn-success"
						onClick="javascript:window.location.href=''">All
						List</button>
					<button type="button" class="btn btn-warning"
						onClick="javascript:history.go(-1)">BACK</button>
					<button type="button" class="btn btn-primary" onclick="check()">Insert</button>
				</p>
			</form>

</div>
