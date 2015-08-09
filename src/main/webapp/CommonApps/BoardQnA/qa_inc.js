function qFormValidate(qForm){
	var frmName = qForm;

	if(frmName.qTitle.value == ""){
		alert("제목을 입력하여 주세요.");
		frmName.qTitle.focus();
		return false;
	}else{
		var strTitle = frmName.qTitle.value;
		var chTitle = strTitle.split(" ");

		if(strTitle.length+1 == chTitle.length){
			alert("제목을 입력하여 주세요.");
			frmName.qTitle,value = "";
			frmName.qTitle.focus();
			return false;
		}
	}
	if(frmName.userName.value == ""){
		alert("성명을 입력하여 주세요.");
		frmName.userName.focus();
		return false;
	}

	if(frmName.userPW.value == ""){
		alert("암호를 입력하여 주세요.");
		frmName.userPW.focus();
		return false;
	}

	if(frmName.userPhone.value == ""){
		alert("연락 전화번호를 입력하여 주세요.");
		frmName.userPhone.focus();
		return false;
	}

	if(!CheckMailFormat(frmName.userEmail.value)) {
		alert("\n이메일 주소가 입력되지 않았거나 부정확합니다.");
		frmName.userEmail.focus();
		return false;
	}

	if(frmName.qContent.value == ""){
		alert("내용을 입력하여 주세요.");
		frmName.qContent.focus();
		return false;
	}

	//frmName.submit();
}


function aFormValidate(aForm){
	var frmName = aForm;

	if(frmName.aTitle.value == ""){
		alert("제목을 입력하여 주세요.");
		frmName.aTitle.focus();
		return false;
	}else{
		var strTitle = frmName.aTitle.value;
		var chTitle = strTitle.split(" ");

		if(strTitle.length+1 == chTitle.length){
			alert("제목을 입력하여 주세요.");
			frmName.aTitle,value = "";
			frmName.aTitle.focus();
			return false;
		}
	}

	if(frmName.aContent.value == ""){
		alert("내용을 입력하여 주세요.");
		frmName.aContent.focus();
		return false;
	}
	return true;
	//frmName.submit();
}


function nmFormValidate(nmForm){
	var frmName = nmForm;

	if(!CheckMailFormat(frmName.userEmail.value)) {
		alert("\n이메일 주소가 입력되지 않았거나 부정확합니다.");
		frmName.userEmail.focus();
		return false;
	}

	if(frmName.userPW.value == ""){
		alert("암호를 입력하여 주세요.");
		frmName.userPW.focus();
		return false;
	}
	return true;
	//frmName.submit();
}































