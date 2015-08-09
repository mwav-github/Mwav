function SubmitMbr(MbrFrm)
{
	<!-- 기본 항목 check -->
	<!-- ID check -->
	if (!CheckID(MbrFrm.MbrID, 4, 15, "회원아이디")){
		return false
	}

	<!-- name check -->
	if (MbrFrm.MbrName.value.length == 0 )	{
		alert("성명을 기입하여 주십시오");
		MbrFrm.MbrName.focus();
		return false;
	}
	if (MbrFrm.MbrName.value.indexOf(" ") >= 0 )	{
		alert("성명을 빈칸없이 입력하십시오.");
		MbrFrm.MbrName.focus();
		return false;
	}

	// 자택전화번호
	if (MbrFrm.HTEL1.value.length ==0 || MbrFrm.HTEL2.value.length ==0 || MbrFrm.HTEL3.value.length ==0)
	{
		alert("전화번호를 입력하십시오.");

		MbrFrm.HTEL1.focus();
		return false;
	}
	else
	{
		if (isNaN(MbrFrm.HTEL1.value) || isNaN(MbrFrm.HTEL2.value) || isNaN(MbrFrm.HTEL3.value))
		{
			alert("전화번호를 숫자로 입력하십시오.");

			MbrFrm.HTEL1.focus();
			return false;
		}
	}
	if(/^[0-9]+$/.test(MbrFrm.HTEL1.value) == false){
                alert("전화번호를 입력하십시오.");
                MbrFrm.HTEL1.select();
                MbrFrm.HTEL1.focus();
                return false;
     }
	if(/^[0-9]+$/.test(MbrFrm.HTEL2.value) == false){
		alert("전화번호를 입력하십시오.");
		MbrFrm.HTEL2.select();
		MbrFrm.HTEL2.focus();
		return false;
	}
	if(/^[0-9]+$/.test(MbrFrm.HTEL3.value) == false){
		alert("전화번호를 입력하십시오.");
		MbrFrm.HTEL3.select();
		MbrFrm.HTEL3.focus();
		return false;
	}

	//조소체크
	if(/^[0-9-]{7}$/.test(MbrFrm.AddrZip.value) == false) {
	    alert("우편번호를 입력해주십시요.");
	    MbrFrm.AddrZip.select();
	    MbrFrm.AddrZip.focus();
	    return false;
	}
	if (MbrFrm.AddrStt.value.length ==0) {
		alert("상세주소를 입력하십시오.");
		MbrFrm.AddrStt.focus();
		return false;
	}

	<!-- passwd check -->
	if(/^.{4,15}$/.test(MbrFrm.MbrPW.value) == false){
	        alert("암호는 최소4자에서 최대 15자까지의 영문자 또는 숫자여야 합니다.\n다시 입력해 주세요.");
	        MbrFrm.MbrPW.select();
	        MbrFrm.MbrPW.focus();
	        return false;
     }
	if (MbrFrm.MbrPW.value != MbrFrm.MbrPW1.value ) {
	    alert ("비밀번호가 일치하지 않습니다.");
	    MbrFrm.MbrPW.focus();
	    return false;
	}
	if (MbrFrm.MbrID.value == MbrFrm.MbrPW.value ) {
	    alert("아이디와 비밀번호를 서로 다르게 해주십시오.");
	    MbrFrm.MbrPW.focus();
	    return false;
	}
	//비밀번호 힌트 추가
	if (MbrFrm.findingA.value.length == 0 ) {
	    alert("비밀번호 힌트용 답변을 기입하여 주십시오");
	    MbrFrm.findingA.focus();
	    return false;
	}
	<!-- 주민등록, 외국인등록번호 check -->
	if(CheckNumbers(MbrFrm)==false){
		return false;
	}
	//메일 재확인
 	//alert(typeof(MbrFrm.MbrEmail1));
 	//alert(typeof(MbrFrm.MbrEmail));
 	if (MbrFrm.MbrEmail1 == "object" || MbrFrm.MbrEmail2 == "object") {
 		MbrFrm.MbrEmail.value = MbrFrm.MbrEmail1.value + "@" + MbrFrm.MbrEmail2.value;
	}
	if(MbrFrm.MbrEmail.value.length == 0 ||MbrFrm.MbrEmail.value.indexOf("@") == 0 || MbrFrm.MbrEmail.value.indexOf("@")  == (MbrFrm.MbrEmail.value.length-1))
	{
		alert("부정확한 이메일 주소입니다.\n다시한번 입력해 주십시오.\n"+"(현재 입력된 값 : "+MbrFrm.MbrEmail1.value+")");
		return false;
	}
return true;

}//function SubmitMbr(MbrFrm)

function mailAddr(MbrFrm)
{
	var str_id = MbrFrm.MbrEmail1.value;
	var str_addr = MbrFrm.MbrEmail2.value;
	if(str_id == "" && !MbrFrm.MbrEmail2.options[0].selected){
		alert("빈칸을 채워주세요.");
		MbrFrm.MbrEmail1.focus();
		MbrFrm.MbrEmail2.options[0].selected = true;
		return;
	}else if(str_id != "" && str_id.indexOf("@") > -1){
		alert("@의 앞부분만 입력해 주시고,\n뒷부분은 선택해 주세요.");
		MbrFrm.MbrEmail1.focus();
		MbrFrm.MbrEmail2.options[0].selected = true;
		return;
	}
	if ( str_addr == "etc" ){
		 email_popup(MbrFrm);
	}else {
		var mailsum = MbrFrm.MbrEmail1.value + "@" + MbrFrm.MbrEmail2.value;
		MbrFrm.MbrEmail.value = mailsum;
	}
	//alert(MbrFrm.MbrEmail.value) ;
}
function email_popup(MbrFrm) {
  	var urlname = "muMailETC.asp?eml_id="+MbrFrm.MbrEmail1.value;
	addr_etc = window.open(urlname, '',"top=100px,left=100px,status=no,resizable=no,menubar=no,scrollbars=no,width=391,height=238");
	addr_etc.focus();
}

function CheckNumbers(form){
//주민등록체크

	var Digit = '1234567890';

	if(TTcheck(form.SSN1, Digit, 6, 6,"주민번호 앞자리"))
	{
		form.SSN1.focus();
		return false;
	}
	if(TTcheck(form.SSN2, Digit, 7, 7,"주민번호 뒷자리"))
	{
		form.SSN2.focus();
		return false;
	}
	var gubun = parseInt(form.SSN2.value.substring(0,1));
	if(gubun >=1 && gubun <=4){
		if(CheckIdnNo(form) == false){
			form.SSN1.focus();
			return false;
		}else{
			return true;
		}
	}else if(gubun>=5 && gubun <=8){
		if(checkForeignNo(form)==false){
			form.SSN1.focus();
			return false;
		}else{
			return true;
		}
	}else{
		alert('주민등록번호에 오류가 있습니다. 다시 확인하십시오.');
		form.SSN1.focus();
		return false;
	}
	return true;
}

function CheckIdnNo(form){
	var ssn1 = form.SSN1.value;
	var ssn2 = form.SSN2.value;
	var yy = ssn1.substring(0,2);
	var mm = ssn1.substring(2,4);
	var dd = ssn1.substring(4,6);
	var sex = ssn2.substring(0,1);

	var idn_no = ssn1 + ssn2;

	if (idn_no == ''){
		alert('주민등록번호를 입력하십시오.');
		return false;
	}

	if (idn_no.length != 13) {
		alert('주민등록번호 자리수가 맞지 않습니다.');
		return false;
	}

	//server time set
	var fullyr = 2003;
	var born="";

	if (sex=="1" || sex=="2"){
		born = "19"+yy;

	}else  if (sex=="3" || sex=="4") {
		born = "20"+yy;
	}

	if ( (fullyr-parseInt(born))<14) {
		alert("만 14세이상만 가입할수 있습니다.");
		 return false;
	}

	if(idn_no_checksum(ssn1+ssn2)== false){
            	alert('주민등록번호에 오류가 있습니다. 다시 확인하십시오.');
            	return false;
	}else{
		return true;
	}
}
function checkForeignNo(form){
	var fgn_reg_no = form.SSN1.value + form.SSN2.value;
	if (fgn_reg_no == ''){
		alert('외국인등록번호를 입력하십시오.');
		return false;
	}

	if (fgn_reg_no.length != 13) {
		alert('외국인등록번호 자리수가 맞지 않습니다.');
		return false;
	}

//server time set
	var fullyr = 2003;

	if ((fgn_reg_no.charAt(6) == "5") || (fgn_reg_no.charAt(6) == "6"))
	{
		birthYear = "19";
	}
	else if ((fgn_reg_no.charAt(6) == "7") || (fgn_reg_no.charAt(6) == "8"))
	{
		birthYear = "20";
	}
	else if ((fgn_reg_no.charAt(6) == "9") || (fgn_reg_no.charAt(6) == "0"))
	{
		birthYear = "18";
	}
	else
	{
		alert("등록번호에 오류가 있습니다. 다시 확인하십시오.");
		return false;
	}

	birthYear += fgn_reg_no.substr(0, 2);
	birthMonth = fgn_reg_no.substr(2, 2) - 1;
	birthDate = fgn_reg_no.substr(4, 2);
	birth = new Date(birthYear, birthMonth, birthDate);

	if ( (fullyr-parseInt(birthYear))<14) {
		alert("만 14세이상만 가입할수 있습니다.");
		 return false;
	}

	if ( birth.getYear() % 100 != fgn_reg_no.substr(0, 2) ||
		birth.getMonth() != birthMonth ||
		birth.getDate() != birthDate) {
		alert('생년월일에 오류가 있습니다. 다시 확인하십시오.');
		return false;
	}

	if (fgn_no_chksum(fgn_reg_no) == false){
		alert('외국인등록번호에 오류가 있습니다. 다시 확인하십시오.');
		return false;
	}
	else {
		return true;
	}
}
function TTcheck(target, astr, lmin, lmax, targetname)
{
	var i
	var t = target.value

	if (t.length < lmin || t.length > lmax)
	{
		if (lmin == lmax) alert( + lmin + "글자로  " + targetname + "를 입력하십시오.");
		else alert(+ lmin + ' ~ ' + lmax + "글자로  " + targetname + "를 입력하십시오.");
		return true
	}

	if (astr.length > 1)
	{
		for (i=0; i<t.length; i++)
			if(astr.indexOf(t.substring(i,i+1))<0)
			{
				alert(targetname + "에 허용할 수 없는 문자가 입력되었습니다.     ");
				target.focus()
				return true
			}
	}
	return false
}
















function DupIdnNo()
{
	var idnNo1 = document.MemberForm.SSN1.value;
	var idnNo2 = document.MemberForm.SSN2.value;
	var idnNo = idnNo1 + idnNo2;
	if( idnNo == "")
	{
		alert("주민등록번호를 입력하십시오.");
		document.MemberForm.SSN1.focus();
		return (false);
	}
	window.open("MemIdnNoDup.jsp?COMM_001=0000100000&COMM_002=0&idnNo=" + idnNo, '', "height=100,width=280,status=no,toolbar=no,menubar=no,location=no");
	return (false);
}


function checkAddr(zipWhere)
{
	<!-- 주소항목 우편번호 button으로만 입력하게 안내 -->

	alert("우편번호및 주소(동이전)는 우편번호 찾기 버튼을 이용해 주십시오");
	return(false);
}




function emlyn_popup() {
  	var urlname = "/html/EmailDetailInfo.html";
	emlyn = window.open(urlname, '',"top=100px,left=100px,status=no,resizable=no,menubar=no,scrollbars=no,width=490,height=550");
	emlyn.focus();
}


function idn_no_checksum(idn_no){
	var tmp = 0
	var ssn1 = idn_no.substring(0,6);
	var ssn2 = idn_no.substring(6,13);
	for (i = 0; i <=5 ; i++) {
		tmp = tmp + ((i%8+2) * parseInt(ssn1.substring(i,i+1)))
	}

	for (i = 6; i <=11 ; i++) {
		tmp = tmp + ((i%8+2) * parseInt(ssn2.substring(i-6,i-5)))
	}

	tmp = 11 - (tmp %11)
	tmp = tmp % 10

	if (tmp != ssn2.substring(6,7)) {
		return false;
	}else{
		return true;
	}
}

function fgn_no_chksum(reg_no) {
	var sum = 0;
	var odd = 0;

	buf = new Array(13);
	for (i = 0; i < 13; i++) buf[i] = parseInt(reg_no.charAt(i));

	odd = buf[7]*10 + buf[8];

	if (odd%2 != 0) {
		return false;
	}

	if ((buf[11] != 6)&&(buf[11] != 7)&&(buf[11] != 8)&&(buf[11] != 9)) {
		return false;
	}

	multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
	for (i = 0, sum = 0; i < 12; i++) sum += (buf[i] *= multipliers[i]);


	sum=11-(sum%11);

	if (sum>=10) sum-=10;

	sum += 2;

	if (sum>=10) sum-=10;

	if ( sum != buf[12]) {
		return false;
	}
	else {
		return true;
	}
}

function checkBirth() {
	document.MemberForm.B_YEAR.value = "";
	document.MemberForm.B_MON.value = "";
	document.MemberForm.B_DAY.value = "";

	document.MemberForm.B_YEAR.value = 19 + document.MemberForm.SSN1.value.substr(0, 2);
	document.MemberForm.B_MON.value =document.MemberForm.SSN1.value.substr(2, 2);
	document.MemberForm.B_DAY.value =document.MemberForm.SSN1.value.substr(4, 2);
}

function trimmed(value)
{

	<!-- value = value.replace(/^\s+/, "")	remove leading white spaces -->

	<!-- return  value.replace(/\s+$/g, "")	remove trailing while spaces -->

	value = value.replace(/^\s+/, "");  // remove leading white spaces
    	return  value.replace(/\s+$/g, ""); // remove trailing while spaces
}

function moveFocus(num,fromform,toform){
	var str = fromform.value.length;
	if(str == num)
   		toform.focus();
}
