function idCheck() {
	
		url = "/HomePage/Admins/Members/idCheck.jsp";
		window.open(url, "post", "left=300, top=300 ,width=600, height=600, scrollbars = yes");
	
}

function DMCheck(check) {
	if (check == "1") {
		alert("삭제성공");
	} else if(check == "0") {
		alert("수정성공");
	} else {
		
	}
}
function nickNameCheck(mbrNickname) {
	if (mbrLoginId == "") {
		alert("닉네임을 입력하세요");
		document.frmMbr.mbrNickname.focus();
	} else {
		// url="/HomePage/idCheck.do?mbrLoginId="+mbrLoginId;
		// window.open(url, "post", "width=400, height=250");
	}
}

function zipCheck() {
	url = "/HomePage/zipCheck.do?check=y";
	window
			.open(
					url,
					"post",
					"toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes,menubar=no");
}

/*
 * //이메일 형식 확인 function CheckMailFormat(emailValue) { var strEmail = emailValue;
 * var i; var strCheck1 = false; var strCheck2 = false; var iEmailLen =
 * strEmail.length;
 * 
 * if (iEmailLen > 0) { // strEmail 에 '.@', '@.' 이 있는 경우 에러메시지. // strEmail의 맨앞
 * 또는 맨뒤에 '@', '.' 이 있는 경우 에러메시지. if ((strEmail.indexOf(".@") != -1) ||
 * (strEmail.indexOf("@.") != -1) || (strEmail.substring(0,1) == ".") ||
 * (strEmail.substring(0,1) == "@") ||
 * (strEmail.substring(iEmailLen-1,iEmailLen) == ".") ||
 * (strEmail.substring(iEmailLen-1,iEmailLen) == "@")) { alert("잘못된 이메일
 * 형식입니다."); return false; }
 * 
 * for(i=0; i < iEmailLen; i++) { if ((strEmail.substring(i,i+1) == ".") ||
 * (strEmail.substring(i,i+1) == "-") || (strEmail.substring(i,i+1) == "_") ||
 * ((strEmail.substring(i,i+1) >= "0") && (strEmail.substring(i,i+1) <= "9")) ||
 * ((strEmail.substring(i,i+1) >= "@") && (strEmail.substring(i,i+1) <= "Z")) ||
 * ((strEmail.substring(i,i+1) >= "a") && (strEmail.substring(i,i+1) <= "z"))) {
 * if (strEmail.substring(i,i+1) == ".") strCheck1 = true; if
 * (strEmail.substring(i,i+1) == "@") strCheck2 = true; } else { alert("잘못된 이메일
 * 형식입니다."); return false; } }
 * 
 * if ((strCheck1 == false) || (strCheck2 == false)) { alert("잘못된 이메일 형식입니다.");
 * return false; } } else { alert("잘못된 이메일 형식입니다."); return false; } return
 * true;
 *  }
 */

function inputCheck() {
	if (document.frmMbr.mbrLoginId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.frmMbr.mbrLoginId.focus();
		return;
	}
	if (document.frmMbr.mbrLoginPw.value == "") {
		alert("비밀번호를 입력해주세요. ");
		document.frmMbr.mbrLoginPw.focus();
		return;
	}
	if (document.frmMbr.mbrLoginPw2.value == "") {
		alert("비밀번호를 재 입력해주세요.");
		document.frmMbr.mbrLoginPw2.focus();
		return;
	}
	if (document.frmMbr.mbrLoginPw.value != document.frmMbr.mbrLoginPw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.frmMbr.mbrLoginPw2.focus();
		return;
	}
	if (document.frmMbr.mbrName.value == "") {
		alert("이름을 입력해 주세요.");
		document.frmMbr.mbrName.focus();
		return;
	}
	if (document.frmMbr.mbrPhone1.value == "") {
		alert("전화번호 를 입력해주세요.");
		document.frmMbr.mbrPhone1.focus();
		return;
	}
	if (document.frmMbr.mbrPhone2.value == "") {
		alert("전화번호 번호를 입력해주세요.");
		document.frmMbr.mbrPhone2.focus();
		return;
	}
	if (document.frmMbr.mbrPhone3.value == "") {
		alert("전화번호 번호를 입력해주세요.");
		document.frmMbr.mbrPhone3.focus();
		return;
	}
	if (document.frmMbr.mbrCellularP1.value == "") {
		alert("휴대폰 번호 를 입력해주세요.");
		document.frmMbr.mbrCellularP1.focus();
		return;
	}
	if (document.frmMbr.mbrCellularP2.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		document.frmMbr.mbrCellularP2.focus();
		return;
	}
	if (document.frmMbr.mbrCellularP3.value == "") {
		alert("휴대폰 번호를 입력해주세요.");
		document.frmMbr.mbrCellularP3.focus();
		return;
	}
	if (document.frmMbr.mbrEmail.value == "") {
		alert("이메일을 입력해주세요.");
		document.frmMbr.mbrEmail.focus();
		return;
	}
	var str = document.frmMbr.mbrEmail.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;

	if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1
			&& commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize)
		;
	else {
		alert('잘못된 이메일 주소입니다.');
		document.frmMbr.mbrEmail.focus();
		return;
	}
	if (document.frmMbr.mbrZipcode.value == "") {
		alert("우편번호를 입력해주세요.");
		document.frmMbr.mbrZipcode.focus();
		return;
	}
	if (document.frmMbr.mbrAddress.value == "") {
		alert("주소를 입력해주세요.");
		document.frmMbr.mbrAddress.focus();
		return;
	}
	if (document.frmMbr.mbrAddress2.value == "") {
		alert("상세주소를 입력해주세요.");
		document.frmMbr.mbrAddress2.focus();
		return;
	}
	document.frmMbr.submit();
}

// 토글은 사용
// 참고) http://www.jynote.net/549
function LayerView(id) {
	obj = document.getElementById(id);

	if (obj.style.visibility == "hidden")
		obj.style.visibility = "visible";
	else
		obj.style.visibility = "hidden";
}


