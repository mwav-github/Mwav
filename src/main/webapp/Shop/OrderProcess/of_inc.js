function SubmitOrderForm(frm) {
	<!-- 기본 항목 check -->
	<!-- name check -->
	if (frm.cName.value.length == 0 )	{
		alert("성명을 기입하여 주십시오");
		frm.cName.focus();
		return false;
	}
	if (frm.cName.value.indexOf(" ") >= 0 )	{
		alert("성명을 빈칸없이 입력하십시오.");
		frm.cName.focus();
		return false;
	}

	// 전화번호
	if(/^[0-9]+$/.test(frm.cTEL1.value) == false){
		alert("전화번호를 입력하십시오.");
		frm.cTEL1.select();
		frm.cTEL1.focus();
		return false;
     }
	if(/^[0-9]+$/.test(frm.cTEL2.value) == false){
		alert("전화번호를 입력하십시오.");
		frm.cTEL2.select();
		frm.cTEL2.focus();
		return false;
	}
	if(/^[0-9]+$/.test(frm.cTEL3.value) == false){
		alert("전화번호를 입력하십시오.");
		frm.cTEL3.select();
		frm.cTEL3.focus();
		return false;
	}

	// 핸드폰전화번호
	if (isNaN(frm.cMTEL1.value) || isNaN(frm.cMTEL2.value) || isNaN(frm.cMTEL3.value)) {
		alert("핸드폰번호를 숫자로 입력하십시오.");
		frm.cMTEL1.focus();
		return false;
	}

	//메일확인
	if (frm.cEmail.value.length > 0)
	{
		if (!checkMail(frm.cEmail)) {
			frm.cEmail.focus();
			return false;
		}
	} else {
		alert("메일을 입력해 주세요.");
		frm.cEmail.focus();
		return false;
	}


	//조소체크
	if(/^[0-9-]{7}$/.test(frm.cAddrZip.value) == false) {
	    alert("우편번호를 입력해주십시요.");
	    frm.cAddrZip.focus();
		frm.cAddrZip.select();
	    return false;
	}
	if (frm.cAddrStt.value.length ==0) {
		alert("상세주소를 입력하십시오.");
		frm.cAddrStt.focus();
		return false;
	}


	//배송지조소체크
	if(/^[0-9-]{7}$/.test(frm.rAddrZip.value) == false) {
	    alert("배송지 우편번호를 입력해주십시요.");
	    frm.rAddrZip.focus();
		frm.rAddrZip.select();
	    return false;
	}
	if (frm.rAddrStt.value.length ==0) {
		alert("배송지 상세주소를 입력하십시오.");
		frm.rAddrStt.focus();
		return false;
	}

	if (frm.rName.value.length == 0 )	{
		alert("수령인(처)을 기입하여 주십시오");
		frm.rName.focus();
		return false;
	}
	if (frm.rName.value.indexOf(" ") >= 0 )	{
		alert("수령인(처)을 빈칸없이 입력하십시오.");
		frm.rName.focus();
		return false;
	}

	//배송지 전화번호 체크
	if (frm.rTEL1.value.length ==0 || frm.rTEL2.value.length ==0 || frm.rTEL3.value.length ==0)	{
		alert("배송지 전화번호를 입력하십시오.");
		frm.rTEL1.focus();
		return false;
	} else {
		if (isNaN(frm.rTEL1.value) || isNaN(frm.rTEL2.value) || isNaN(frm.rTEL3.value))	{
			alert("배송지 전화번호를 숫자로 입력하십시오.");
			frm.rTEL1.focus();
			return false;
		}
	}
	if (isNaN(frm.rMTEL1.value) || isNaN(frm.rMTEL2.value) || isNaN(frm.rMTEL3.value)) {
		alert("배송지 핸드폰번호를 숫자로 입력하십시오.");
		frm.rMTEL1.focus();
		return false;
	}

	//무통장입금
	if (typeof(frm.bankInfo) == "object")
	{
		//은행선택
		if (frm.bankInfo.options.selectedIndex < 1)	{
			alert("입금할 은행을 선택하세요.");
			frm.bankInfo.selectedIndex = 0
			return false;
		}
		//입급자명
		if (frm.onlinePayer.value.length == 0 )	{
			alert("입금자명을 기입하여 주십시오");
			frm.onlinePayer.focus();
			return false;
		}
		if (frm.onlinePayer.value.indexOf(" ") >= 0 )	{
			alert("입금자명을 빈칸없이 입력하십시오.");
			frm.onlinePayer.focus();
			return false;
		}
	}


	return true;
}	//function SubmitOrderForm(frm)



<!-- 이메일 형식 확인 -->
function checkMail(eMail)
{
	var strEmail = eMail.value;
	var i;
	var strCheck1 = false;
	var strCheck2 = false;
	var iEmailLen = strEmail.length

	if (iEmailLen > 0) {
		// strEmail 에 '.@', '@.' 이 있는 경우 에러메시지.
		// strEmail의 맨앞 또는 맨뒤에 '@', '.' 이 있는 경우 에러메시지.
		if ((strEmail.indexOf(".@") != -1) || (strEmail.indexOf("@.") != -1) ||
			(strEmail.substring(0,1) == ".") || (strEmail.substring(0,1) == "@") ||
			(strEmail.substring(iEmailLen-1,iEmailLen) == ".") || (strEmail.substring(iEmailLen-1,iEmailLen) == "@")) {
				alert("\n이메일 주소를 정확하게 입력하십시오.");
				eMail.focus();
			return false;
		}

		for(i=0; i < iEmailLen; i++) {
	 		if ((strEmail.substring(i,i+1) == ".") ||
	 		 	(strEmail.substring(i,i+1) == "-") || (strEmail.substring(i,i+1) == "_") ||
	 		 	((strEmail.substring(i,i+1) >= "0") && (strEmail.substring(i,i+1) <= "9")) ||
	 		 	((strEmail.substring(i,i+1) >= "@") && (strEmail.substring(i,i+1) <= "Z")) ||
	 		 	((strEmail.substring(i,i+1) >= "a") && (strEmail.substring(i,i+1) <= "z"))) {
	 		 		if (strEmail.substring(i,i+1) == ".")
	 		 			strCheck1 = true;
	 		 		if (strEmail.substring(i,i+1) == "@")
	 		 			strCheck2 = true;
	 		 }
	 		else {
	 			alert("\n이메일 주소를 정확하게 입력하십시오. ");
	 			eMail.focus();
				return false;
	 		}
	 	}

	 	if ((strCheck1 == false) || (strCheck2 == false)) {
	 		alert("\n이메일 주소를 정확하게 입력하십시오.");
	 		eMail.focus();
	 		return false;
	 	}
	}

	return true;
}





function sameData(frm) {
    if(frm.cbSameData.checked) {
      frm.rAddrZip.value = frm.cAddrZip.value;
      frm.rAddrCity.value = frm.cAddrCity.value;
      frm.rAddrStt.value = frm.cAddrStt.value;
      frm.rName.value = frm.cName.value;
      frm.rTEL1.value = frm.cTEL1.value;
      frm.rTEL2.value = frm.cTEL2.value;
      frm.rTEL3.value = frm.cTEL3.value;
      frm.rMTEL1.value = frm.cMTEL1.value;
      frm.rMTEL2.value = frm.cMTEL2.value;
      frm.rMTEL3.value = frm.cMTEL3.value;
    } else {
      frm.rAddrZip.value = "";
      frm.rAddrCity.value = "";
      frm.rAddrStt.value = "";
      frm.rName.value = "";
      frm.rTEL1.value = "";
      frm.rTEL2.value = "";
      frm.rTEL3.value = "";
      frm.rMTEL1.value = "";
      frm.rMTEL2.value = "";
      frm.rMTEL3.value = "";
    }
}