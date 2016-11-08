
//아래 참고해보면 다수일때 flag 하나로 쓰면 최종값이 결국은 결과값이 되기때문에 이부분 생각하기
function emptyCheck(checkVar_, alert_txt_) {
		    var checkVar = checkVar_;
		    var alert_txt = alert_txt_;
			
		    if (checkVar == null || checkVar == "") {
		        alert(alert_txt);
		        return false;
		    }
		    else{
		    	return true;
		    }
		}

function return_check(flag){
	var flag_ = flag;
	if(flag == false || flag == undefined){
		//alert('11');
		return false;
	}
	return true;
}


function chkLoginPolicy() {

	chkLoginId_1 = document.getElementById("chkLoginId");
	var chkLoginId = chkLoginId_1.value;
	// var mbrLoginId = mbrLoginId;

	// 로그인 아이디 계정정책 확인
	var re1 = /^[a-zA-Z]/g; // 첫글자는 영문만 가능
	var re2 = /\s/; // 공백인 경우 true
	var re3 = /[`~!@#$%^&*|\\\'\";,:\/?=<>+-]/gi;
	// []들어가있다면 false ^가 반대를 의미

	/*
	 * alert(re1.test(mbrLoginId)); alert(re1.test(mbrLoginId) == false)
	 */if ((re1.test(chkLoginId)) == false) {
		alert("첫글자는 영문자만 가능합니다.");
		chkLoginId_1.value = ""; // value 초기화를 위해서는 input 태그에 value="" 가
									// 되어있어야 한다.
		chkLoginId_1.focus();
		return false;

	}
	// alert(re2.test(mbrLoginId));
	if ((re2.test(chkLoginId)) == true) {
		alert("공백은 허용하지 않습니다.");
		// form.mbrLoginId.value="";
		chkLoginId_1 = "";
		chkLoginId_1.focus();
		return false;

	}
	// alert(re3.test(mbrLoginId));
	if (re3.test(chkLoginId) == true) {
		alert("특수문자는 허용하지 않습니다.");

		chkLoginId_1 = "";
		chkLoginId_1.focus();
		return false;
	}
	if ((chkLoginId.length < 4) || (chkLoginId.length > 20)) {
		alert("아이디는 4~20글자 까지 가능합니다..");
		chkLoginId_1 = "";
		chkLoginId_1.focus();
		return false;
	}
}
function chkPWPolicy() {

	/*
	 * alert('1'); var mbrLoginPw = form.mbrLoginPw.value;
	 */
	// 로그인 아이디 계정정책 확인
	// var mbrLoginPw = form.mbrLoginPw.value;
	chkLoginPW_1 = document.getElementById("chkLoginPW");
	var chkLoginPW = chkLoginPW_1.value;
	// alert(chk_LoginPW);

	// alert('chk_LoginPW'+chk_LoginPW)

	var re1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,255}$/; // 영문+숫자+특수문자를
																		// 혼용하여
																		// 사용
																		// 255자사용.
	var re2 = /\s/; // 공백인 경우 true

	/*
	 * if (mbrLoginPW.length < 8 || mbrLoginPW.length > 255) { alert("비밀번호는 8 ~
	 * 255 자리로 입력해주세요."); return false; }
	 */

	/*
	 * alert(re1.test(mbrLoginPw)); alert(re1.test(mbrLoginPw) == false)
	 */if ((re1.test(chkLoginPW)) == false) {
		alert("비밀번호는 영문+숫자+특수문자를 혼용하여, 8~255자로 사용해주셔야합니다.");
		chkLoginPW_1.value = "";
		chkLoginPW_1.focus();
		return false;
	}
	/*
	 * alert(re2.test(mbrLoginPw));
	 */if ((re2.test(chkLoginPW)) == true) {
		alert("공백은 허용하지 않습니다.");
		chkLoginPW_1.value = "";
		chkLoginPW_1.focus();
		return false;
	}
}
function chkEmailPolicy() {

	// var mbrEmail = form.mbrEmail.value;

	chkEmail_1 = document.getElementById("chkEmail");
	var chkEmail = chkEmail_1.value;

	// 로그인 아이디 계정정책 확인
	var re1 = /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;

	// alert(re1.test(mbrEmail));
	if ((re1.test(chkEmail)) == false) {
		alert("이메일형식이 올바르지 않습니다.");
		chkEmail_1 = "";
		chkEmail_1.focus();
		return false;
	}
}

/*
 * //태그제거 var re = "<[^<|>]*>"; var re = /[<][^>]*[>]/gi; str =
 * str.replace(RegExpTag,"");
 * 
 *  // 스크립트 제거 var RegExpJS = "<script[^>]*>(.*?)</script>"; str =
 * str.replace(RegExpJS,"");
 * 
 *  // 스타일 제거 var RegExpCSS = "<style[^>]*>(.*?)"; str =
 * str.replace(RegExpCSS,"");
 * 
 *  // 한글 제거 var RegExpHG = "[ㄱ-ㅎ가-힣]"; str = str.replace(RegExpHG,"");
 * 
 *  // 주석 제거 var RegExpDS = /<!--[^>](.*?)-->/g; str6 =
 * str.replace(RegExpDS,"");
 * 
 *//***************************************************************************
	 * //copy & paste 방지 : onkeydown="javascript:preventPaste(event);"
	 **************************************************************************/
/*
 * function preventPaste(e) {
 * 
 * var ctrlKey; var keyNum;
 * 
 * if (window.event) { ctrlKey = event.ctrlKey; keyNum = event.keyCode; } else
 * if (e.which) { ctrlKey = e.ctrlKey; keyNum = e.which; }
 * 
 * if (ctrlKey == true && keyNum == 86) { if (window.event) { event.returnValue =
 * false; } else if (e.which) { e.preventDefault(); } } }
 * 
 *//***************************************************************************
	 * * 컴마(",") 제거
	 **************************************************************************/
/*
 * function removeComma( strSrc ) { return strSrc.replace(/,/gi,""); }
 * 
 *//***************************************************************************
	 * * 하이픈("-") 제거
	 **************************************************************************/
/*
 * function removeHyphen( strSrc ) { return strSrc.replace(/-/gi,""); }
 *//***************************************************************************
	 * * String 에서 왼쪽 빈공백문자 제거 script
	 **************************************************************************/
/*
 * function LTrim(strSrc) { return strSrc.replace(/^\s+/,''); }
 * 
 *//***************************************************************************
	 * * String 에서 오른쪽 빈공백문자 제거 script
	 **************************************************************************/
/*
 * function RTrim(strSrc) { return strSrc.replace(/\s+$/,''); }
 * 
 *//***************************************************************************
	 * * String 에서 양쪽공백문자 제거 script
	 **************************************************************************/
/*
 * function Trim(strSrc) { var strLTrim = strSrc.replace(/^\s+/,''); return
 * strLTrim.replace(/\s+$/,''); }
 * 
 *//***************************************************************************
	 * * String 에서 모든 공백문자 제거 script
	 **************************************************************************/
/*
 * function Del_Space( strSrc ) { return strSrc.replace(/ /g, ''); }
 * 
 * 
 * 
 * 
 *//***************************************************************************
	 * * 입력값이 한글만 사용못함 체크
	 **************************************************************************/
/*
 * function ishangle(s) { for (i = 0; i < s.length; i++) { if ((s.charCodeAt(i) !=
 * 32) && (s.charCodeAt(i) < 127)) { }else{ return true; } } }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * //////////////////////////// function chk(re, e, msg) { if (re.test(e.value)) {
 * return true; }
 * 
 * alert(msg); e.value = ""; e.focus(); return false; }
 * 
 * 
 * function Validate() { var validator = new Validate(); //사용 var
 * str_cell_phone1 = frm.v_hand_f.value; //var str_cell_phone2 =
 * frm.v_hand_l.value;
 * 
 * if(Validate.prototype.isOnlyNumeric(str_cell_phone1)==false) { alert("핸드폰 번호는
 * 숫자만 가능합니다.\n\n다시 입력해 주세요."); frm.v_hand_f.focus(); return ; }
 * 
 * 
 * 
 * //첫글자는 반드시 알파벳 이면 true Validate.prototype.isOnlyFirstAlpabetic =
 * function(str) { var invalidCharactersRegExp = /^[a-zA-Z]/g; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 * 
 * //첫글자는 반드시 알파벳 이면 true Validate.prototype.isOnlyFirstAlpabetic =
 * function(str) { var invalidCharactersRegExp = /^[a-zA-Z]/g; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 모든 글자가 알파벳/space 이면 true Validate.prototype.isOnlyAlpabetic =
 * function(str) { var invalidCharactersRegExp = /[^a-z- ]/i; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 모든 글자가 알파벳/space 이면 true Validate.prototype.isOnlyAlpabetic =
 * function(str) { var invalidCharactersRegExp = /[^a-z- ]/i; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 모든 글자가 알파벳numeric 이면 true Validate.prototype.isAlpaNumeric =
 * function(str) { var invalidCharactersRegExp = /[^a-z0-9.,;%$#@& ]/i; var
 * isValid = !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 모든 글자가 space인 경우 true Validate.prototype.isAllSpace = function(str) { var
 * invalidCharactersRegExp = /[^ ]/; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 한글은 1자이상, 영문은 2자이상인 경우 true Validate.prototype.isCheckSearchCode =
 * function(str) { var isValid = false; if (!this.isAllSpace(str)) { if
 * (str.length >= 1) { if (this.isOnlyAlpabetic(str)) { if (str.length >= 2) {
 * isValid = true; } } else { isValid = true; } } } return isValid; }
 *  // 숫자만 true Validate.prototype.isOnlyNumeric = function(str) { var
 * invalidCharactersRegExp = /[^\d]/; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 숫자 + '-' true Validate.prototype.isNumeric = function(str) { var
 * invalidCharactersRegExp = /[^\d\-]/; var isValid =
 * !(invalidCharactersRegExp.test(str)); return isValid; }
 *  // 임시 사업자번호체크 Validate.prototype.isCheckImsiBusRegNo = function(str) { var
 * invalidCharactersRegExp = /D[0-9]{9}/; var isValid =
 * (invalidCharactersRegExp.test(str)); return isValid; }
 *  // 날짜만 true Validate.prototype.isOnlyDate = function(yyyy, mm, dd) { var
 * isValid = true; var enteredDate = new Date(dd + " " +
 * Validate.prototype.MMtoMon(mm) + " " + yyyy); if (enteredDate.getDate() !=
 * dd) { isValid = false; } return isValid; }
 * 
 * Validate.prototype.isOnlyDate2 = function(yyyymmdd) { var isValid = true; var
 * enteredDate = new Date(yyyymmdd.substring(6, 8) + " " +
 * Validate.prototype.MMtoMon(yyyymmdd.substring(4, 6)) + " " +
 * yyyymmdd.substring(0, 4)); if (enteredDate.getDate() != yyyymmdd.substring(6,
 * 8)) { isValid = false; } return isValid; }
 *  // IS DATE ( yyyymmdd ) 닷컴 _script/util/validate.js 와 동일
 * Validate.prototype.isOnlyDateYMD = function(ymd) { var yyyy, mm, dd if
 * (ymd.length != 8) { return false; } // length : year(4), month(2), day(2) if
 * (!this.isOnlyNumeric(ymd)) { return false; } // check number if
 * (ymd.substring(0, 2) != "19" && ymd.substring(0, 2) != "20") { return false; } //
 * 1899 < year < 2100 yyyy = parseInt(ymd.substring(0, 4)); // year string ->
 * integer if (ymd.charAt(4) == "0") mm = parseInt(ymd.charAt(5)); else if
 * (ymd.charAt(4) == "1") mm = parseInt(ymd.substring(4, 6)) else return false; //
 * month string -> integer if (ymd.charAt(6) == "0") dd =
 * parseInt(ymd.charAt(7)) else if (ymd.charAt(6) == "1" || ymd.charAt(6) == "2" ||
 * ymd.charAt(6) == "3") dd = parseInt(ymd.substring(6, 8)) else return false; //
 * day string -> integer if (mm == 0 || dd == 0 || mm > 12 || dd > 31 || (mm ==
 * 2 && dd > 29) || (mm == 2 && yyyy % 4 != 0 && dd > 28)) return false; else if
 * ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && dd > 30) return false; return
 * true; }
 *  // IS DATE ( yyyymmdd ) isOnlyDateYMD + now 이전체크
 * Validate.prototype.isOnlyDateBirth = function(ymd) { var birth = new
 * Date(ymd.substring(0, 4), ymd.substring(4, 6) - 1, ymd .substring(6, 8)); var
 * now = new Date(); if (!this.isOnlyDateYMD(ymd)) { return false; } if (birth >
 * now) { return false; } return true; } // 메일 true /*
 * Validate.prototype.isValidEmail = function(email) { ///var
 * invalidCharactersRegExp =
 * /^\w(-)([a-zA-Z_0-9\-\.])*@\w(\.?[-\w])*\.([a-z]{3}(\.[a-z]{2})?|[a-z]{2}(\.[a-z]{2})?)$/i;
 * //var invalidCharactersRegExp =
 * /^([A-Za-z0-9_\-\]{1,15})(@{1})([A-Za-z0-9_]{1,15})(\.{1})([A-Za-z0-9_]{2,10})(\.{1}[A-Za-z]{2,10})?(\.{1}[A-Za-z]{2,10})?$/;
 * 
 * //var isValid = invalidCharactersRegExp.test(email); //return isValid;
 * 
 * var flag = false; emailEx1 =
 * /^([A-Za-z0-9_-]{1,15})(@{1})([A-Za-z0-9_]{1,15})(\.{1})([A-Za-z0-9_]{2,10})(\.{1}[A-Za-z]{2,10})?(\.{1}[A-Za-z]{2,10})?$/;
 * if(emailEx1.test(email)) { flag = true; } else { flag = false; } return flag; }
 * 
 * 
 * Validate.prototype.isValidEmail = function(email) { var
 * invalidCharactersRegExp =
 * /^\w(\.?[-\w])*@\w(\.?[-\w])*\.([a-z]{3}(\.[a-z]{2})?|[a-z]{2}(\.[a-z]{2})?)$/i;
 * var isValid = invalidCharactersRegExp.test(email); return isValid; }
 *  // 안심번호(050) 및 15**, 16**, 18** 로 시작하는 번호 유효성 체크
 * Validate.prototype.isValidPhone = function(phone_number) { if
 * (!this.isOnlyNumeric(phone_number)) return false; var regExp_phoneNum =
 * /^(15.{2}|16.{2}|18.{2}|050.{1}|070|02|031|032|033|041|042|043|044|051|052|053|054|055|061|062|063|064|010|011|016|017|018|019)\d{4,8}$/; //
 * var regExp_phoneNum = //
 * /^(070|050|02|031|032|033|041|042|043|051|052|053|054|055|061|062|063|064|010|011|016|017|018|019)-?\d{3,4}-?\d{4}$/;
 * var isValid = regExp_phoneNum.test(phone_number); return isValid; }
 *  // 휴대폰 및 지역번호만 true Validate.prototype.isValidCellPhone =
 * function(cellphone) { if (!this.isOnlyNumeric(cellphone)) return false; var
 * regExp_cpNum =
 * /^(070|02|031|032|033|041|042|043|044|051|052|053|054|055|061|062|063|064|010|011|016|017|018|019)\d{7,8}$/;
 * var isValid = regExp_cpNum.test(cellphone); return isValid; }
 *  // 월이 맞으면 true Validate.prototype.isValidMonStr = function(mStr) { var
 * invalidCharactersRegExp = /jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec/;
 * var isValid = invalidCharactersRegExp.test(mStr.toLowerCase()); return
 * isValid; }
 *  // 년이 맞으면 true Validate.prototype.isValidYYYY = function(yyyy) { var isValid =
 * true; var enteredDate = new Date("01 Jan " + yyyy); if (enteredDate.getDate() !=
 * '01') { isValid = false; } return isValid; }
 *  // 월이 맞으면 true Validate.prototype.isValidMM = function(mm) { var
 * invalidCharactersRegExp = /01|02|03|04|05|06|07|08|09|10|11|12/; var isValid =
 * invalidCharactersRegExp.test(mm); return isValid; }
 *  // jan -> 01 Validate.prototype.MonStrtoMM = function(mStr) { switch
 * (mStr.toLowerCase()) { case "jan": return "01"; break; case "feb": return
 * "02"; break; case "mar": return "03"; break; case "apr": return "04"; break;
 * case "may": return "05"; break; case "jun": return "06"; break; case "jul":
 * return "07"; break; case "aug": return "08"; break; case "sep": return "09";
 * break; case "oct": return "10"; break; case "nov": return "11"; break; case
 * "dec": return "12"; break; default: return ""; break; } }
 *  // 01 -> Jan Validate.prototype.MMtoMon = function(mm) { switch
 * (mm.toLowerCase()) { case "01": return "Jan"; break; case "02": return "Feb";
 * break; case "03": return "Mar"; break; case "04": return "Apr"; break; case
 * "05": return "May"; break; case "06": return "Jun"; break; case "07": return
 * "Jul"; break; case "08": return "Aug"; break; case "09": return "Sep"; break;
 * case "10": return "Oct"; break; case "11": return "Nov"; break; case "12":
 * return "Dec"; break; default: return ""; break; } } // 길이가 최대값을 넘으면 false,
 * 아니면 true Validate.prototype.chkMaxLength = function(obj, minlen, maxlen) {
 * return (obj.value.length < min && obj.value.length > maxlen) ? false : true; }
 *  // 크기(byte)가 최대값을 넘으면 false, 아니면 true Validate.prototype.chkMaxSize =
 * function(obj, maxlen) { var len, k, chklen, chr; len = obj.value.length;
 * chklen = 0;
 * 
 * for (k = 0; k < len; k++) { if (chklen > maxlen) return false; chr =
 * obj.value.charAt(k); if (escape(chr).length > 4) chklen += 2; else chklen++; }
 * return true;
 *  }
 *  // 2008-11-21 안병호 추가 // 숫자체크 0~9 ←→↑↓ del, backSpace 등 기본키 허용 //
 * Validate.prototype.fc_onfocus 에서 호출 Validate.prototype.fc_onlyNum_check =
 * function() { var key = event.keyCode; if (!(key == 8 || key == 9 || key == 13 ||
 * key == 46 || key == 144 || (key >= 96 && key <= 105) || (key >= 48 && key <=
 * 57) || key == 110 || key == 190 || (key >= 37 && key <= 40))) { // alert('숫자만
 * 입력 가능합니다'); event.returnValue = false; } }
 *  // imeMode 변경 & 숫자체크 호출 // onActivate 이벤트로 발생시키야 imeMode 가 작동
 * Validate.prototype.fc_onlyNum = function(xobj) { xobj.style.imeMode =
 * "disabled"; xobj.onkeydown = Validate.prototype.fc_onlyNum_check; } // 콤마 찍기
 * Validate.prototype.fc_formatNumber = function(price, num) { var str = new
 * Array(); price = String(price); for (var i = 1; i <= price.length; i++) { if
 * (i % num) str[price.length - i] = price.charAt(price.length - i); else
 * str[price.length - i] = ',' + price.charAt(price.length - i); } return
 * str.join('').replace(/^,/, ''); }
 * 
 * 입력된 값중에 <script 태그가 포함되어 있는지 검사(게시판. 2012.05.25) checkScriptTag(form.name,
 * alert의 컨트럴 표시이름) Validate.prototype.checkScriptTag = function(obj, txt) { if
 * (!validator.isAllSpace(obj.value)) { var regExp = /<script/; var str =
 * obj.value.replace(/[^a-zA-Z<\/>]|[\s]+/g, ""); str = str.toLowerCase(str);
 * if (regExp.test(str)) { alert(txt + "에 script 태그는 사용할 수 없습니다. ");
 * obj.focus(); return true; } else { return false; } } else { return false; } } }
 *//***************************************************************************
	 * * 컴마(",") 제거
	 **************************************************************************/
/*
 * function removeComma(strSrc) { return strSrc.replace(/,/gi, ""); }
 * 
 *//***************************************************************************
	 * * 하이픈("-") 제거
	 **************************************************************************/
/*
 * function removeHyphen(strSrc) { return strSrc.replace(/-/gi, ""); }
 * 
 *//***************************************************************************
	 * * String 에서 왼쪽 빈공백문자 제거 script
	 **************************************************************************/
/*
 * function LTrim(strSrc) { return strSrc.replace(/^\s+/, ''); }
 * 
 *//***************************************************************************
	 * * String 에서 오른쪽 빈공백문자 제거 script
	 **************************************************************************/
/*
 * function RTrim(strSrc) { return strSrc.replace(/\s+$/, ''); }
 *  // ////////////////////////////////////// // http://babo9006.tistory.com/47 //
 * http://androphil.tistory.com/entry/JavaScript-%EC%98%88%EC%A0%9C-%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-%EC%A0%95%EA%B7%9C%EC%8B%9D-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EC%9C%A0%ED%9A%A8%EC%84%B1-%EA%B2%80%EC%82%AC //
 * http://warmz.tistory.com/734
 * 
 * function validate(form) { var mbrLoginId =
 * document.getElementById('mbrLoginId'); alert(mbrLoginId); var mbrLoginPw =
 * document.getElementById('mbrLoginPw'); alert(mbrLoginPw); //var pass1 =
 * document.getElementById('pass1'); //var name =
 * document.getElementById('name'); var mbrEmail =
 * document.getElementById('mbrEmail'); var tel1 =
 * document.getElementById('member_CellularP_1'); var tel2 =
 * document.getElementById('member_CellularP_2'); var tel2 =
 * document.getElementById('member_CellularP_3');
 * 
 * //^[a-zA-Z] 첫문자는 영문자만 if (!chk(/^[a-zA-Z]{4,20}/g, mbrLoginId, "첫글자는 영문자 및
 * 4~20글자만 가능합니다.")) return false; // /[\{\}\[\]\/?.;:|\)*~`!^\+<>@\#$%&\\\=\(\'\"]/gi
 * 특수문자 포함 var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi; if
 * (chk(special_pattern, mbrLoginId, "특수문자는 사용 불가능합니다.")) return false; //
 * /[\s]/g; 공백포함 포함 불가 var blank_pattern = /[\s]/g; //공백포함 불가 ==> true 나와야
 * return 하니까 // 공백 포함안된것이 true로 나와야 ! 맞다. if (chk(blank_pattern, mbrLoginId,
 * "공백은 사용 불가능합니다.")) return false; // 아이디 검사 // 첫 글자는 반드시 영문 소문자, 4~12자로 이루어지고,
 * 숫자가 // 하나 이상 포함되어야 한다. 영문소문자와 숫자로만 이루어져야한다. // \d : [0-9]와 같다. {n,m} : n에서
 * m까지 글자수 if (!chk(/^[a-z][a-z\d]{3,11}$/, mbrLoginId, "첫글자는 영문 소문자, 4~12자
 * 입력할것!")) return false; // 이메일 검사 // 4글자 이상(\w = [a-zA-Z0-9_], [\w-\.]) @가 나오고 //
 * 1글자 이상(주소). 글자 가 1~3번 반복됨 if (!chk(/^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/,
 * mbrEmail, "이메일 형식에 어긋납니다.")) return false;
 * 
 * 
 * if (!chk(/[0-9]/, mbrLoginId, "숫자 하나이상포함!")) return false; // 비밀번호 확인 검사
 * if(pass.value!=pass1.value) { alert("비밀번호 확인!"); } var Pass_pattern =
 * /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,255}$/; if
 * (!chk(Pass_pattern, mbrLoginPw, "패스워드를 정확히 입력해주세요.")) return false;
 * 
 * if (!chk(blank_pattern, mbrLoginId, "공백은 사용 불가능합니다.")) return false;
 * 
 * if(!chk(/[0-9]/, id, "숫자 하나이상포함!")) return false; // 이름 검사 // 2글자 이상, 한글만 //
 * 통과하지 못하면 한글로 2글자 이상을 넣으세요~ alert 출력! if(!/^[가-힝]{2,}$/, name, "한글로 2글자 이상을
 * 넣으세요~") return false; // 전화번호 검사 // 전화번호 앞자리는 2~3자리 숫자, 두번째 자리는 3~4자리 숫자 //
 * 세번째 자리는 4자리 숫자 if (member_CellularP_1.value != '') { if
 * (!chk(/^0(2|1[01679])$/, member_CellularP_1, "번호 2자리 이상 입력")) return false;
 * if (!chk(/^[0-9]{3,}$/, member_CellularP_2, "번호 3자리 이상 입력")) return false; if
 * (!chk(/^[0-9]{4}$/, member_CellularP_3, "4자리 번호 입력")) return false; } }
 * 
 * function chk(re, e, msg) { if (re.test(e.value)) { return true; }
 * 
 * alert(msg); e.value = ""; e.focus(); return false; }
 */