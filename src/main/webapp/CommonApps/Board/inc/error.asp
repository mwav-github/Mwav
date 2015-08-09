<%
	no=request("no")
      
	caseVar = lcase (no)
	Select Case caseVar
		Case 1  msg = "관리자로 로그인 하셔야 이용가능합니다." 'del_ok.asp,institute_ok.asp
		Case 2  msg = "비밀번호가 틀립니다."
		Case 3  msg = "삭제할 글을 선택해주세요.."
		Case 4  msg = "권한이 없습니다."
		Case 5  msg = "이미 사용중인 아이디입니다."	'join_ok.asp
		Case 6  msg = "이미 사용중인 전자우편 주소입니다."	'join_ok.asp
		Case 7  msg = "이미 등록된 주민등록번호입니다."	'join_ok.asp
		Case 8  msg = "DATA 폴더가 존재하지 않습니다.."	'tb_form_ok.asp
		Case 9  msg = "비밀번호를 입력해주세요."	'dext_form_ok.asp
		Case 10 msg = "파일 용량을 초가하였습니다." 'write_ok.asp
		Case 11 msg = "비밀번호를 공백으로 채우시면 안됩니다." 'write_ok.asp
		Case 12 msg = request("strext")&"파일은 업로드가 안됩니다."
	End Select
%>

<script language="JavaScript">
	alert("<%=msg%>");
	location.href="javascript:history.back()";
</script>
