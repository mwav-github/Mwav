function target_show(target) {
    document.getElementById(target).style.display = 'block';
}

function target_hide(target) {
	
    document.getElementById(target).style.display = 'none';
}

// plus minus
function qtyplus(price) {
	// Stop acting like a button
	//e.preventDefault();
	event.preventDefault();
	// Get the field name
	fieldName = $(".qtyplus").attr('field');
	//alert(fieldName);
	
	// Get its current value
	var currentVal = parseInt($('input[name=' + fieldName + ']').val());
	var price = price;
	// If is not undefined
	if (!isNaN(currentVal)) {
		
		var afterCount = currentVal + 1;
		// Increment
		$('input[name=' + fieldName + ']').val(afterCount);
		
		goodPriceCalutate(price, afterCount);
	} else {
		// Otherwise put a 0 there
		$('input[name=' + fieldName + ']').val(0);
	}
	
	//가격이 0일때
    if (price == 0){
    	alert('가격이 0원입니다. ');
    	return false;
    }
}

function qtyminus(price) {
	// Get the field name
    fieldName = $(".qtyminus").attr('field');
    
    event.preventDefault();
    //alert(fieldName);
    // Get its current value
    var currentVal = parseInt($('input[name='+fieldName+']').val());
    var price = price;
    // If it isn't undefined or its greater than 0
    if (!isNaN(currentVal) && currentVal > 0) {
        // Decrement one
    	var afterCount = currentVal - 1;
        $('input[name='+fieldName+']').val(afterCount);
        
        goodPriceCalutate(price, afterCount);
    } else {
        // Otherwise put a 0 there
        $('input[name='+fieldName+']').val(0);
        alert('갯수는 0 이하는 불가합니다.')
    }
    
    //가격이 0일때
    if (price == 0){
    	alert('가격이 0원입니다. ');
    	return false;
    }
}

//goods
function goodPriceCalutate(price, ocAmount) {

	//alert('1');
	//var ocAmount = document.getElementById('ocAmount').value;
	//alert(ocAmount);
	//var ocAmount = document.getElementById('ocAmount');
	// 여러개 써야하는 경우도 있기 때문에 변경 var exshow1 = document.getElementById('totalprice');
	var exshow1 =  document.getElementsByClassName('totalprice')[0];
	var exshow2 =  document.getElementsByClassName('totalprice')[1];
	
	

	var totalprice = (price * ocAmount);
	//alert(totalprice);

	//var content = ex.value;
	//exshow.innerHTML = content;
	exshow1.innerHTML = totalprice;
	exshow1.value = totalprice;
	exshow2.innerHTML = totalprice;
	exshow2.value = totalprice;
};

//===================================Order

function orderCartPut(cartForm, type) {

	var frm = cartForm;
	alert(frm);
	//var ocAmount = cartForm.value.ocAmount;
	var goods_id = frm.goods_id.value;
	//var gcr_id = cartForm.value.gcr_id;

	alert(goods_id);

	var type = type;

	if (type == "frontCart") {

		alert("장바구니왔다");
		url = "/Shop/Order/orderForm.do?goods_id=" + goods_id + "&type=" + type;
		//location.href= url;
	} else {

		alert("장바구니왔다");
		url = "/Shop/Order/orderForm.do?ocAmount=" + ocAmount + "&goods_id="
				+ goods_id + "&gcr_id=" + gcr_id + "&type=" + type;
	}
}
function chosenGoodsPutMsg(ocAmount, goods_id, gcr_id) {
	alert("찜하기왔다");
	url = "/HomePage/chosenGoodsPut.do?ocAmount=" + ocAmount + "&goods_id="
			+ goods_id + "&gcr_id=" + gcr_id;
	window.open(url, "post", "width=300, height=150");
}
function changingAction(mode) {

	var theForm = document.goodsDetail;
	if (mode == "1") {
		alert("왔네");
		theForm.action = "orderLoginCheck.do";
	} else if (mode == "2") {
		url = "/HomePage/orderCartPut.do?ocAmount=" + ocAmount + "goods_id"
				+ goods_id + "gcr_id" + gcr_id;
		theForm.action = "orderCartPut.do";
	} else if (mode == "3") {

	}
	theForm.submit();
}
//===================================Order

function myconfirm(type) {

	switch (type) {
	case 'delete':
		msg = "정말로 삭제하시겠습니까? 다시 한번 확인해보세요.";
		break;
	default:
		break;
	}

	if (confirm(msg) != 0) {
		// Yes click
		return true;
	} else {
		// no click

		return false;
	}
} // myconfirm

// resize image size
function resizeImageSize() {

	var secW = $(".sec").width();
	var secH = $(".sec").height();
	// 사이즈의 최대치는 선호 해상도로 설정
	if (secW > orgwindowWidth) {
		secW = orgwindowWidth;
	}
	if (secH > orgwindowHeight) {
		secH = orgwindowHeight;
	}
	var image = $(".res_image");// array of class="res_image"

	// 선호 해상도 (이미지가 정상적으로 보이는 기준점 해상도)
	var preferredSize = orgwindowWidth * orgwindowHeight;// 800, 720
	// 현재 해상도
	var currentSize = secW * secH;
	// 비율
	var scalePercentage = Math.sqrt(currentSize) / Math.sqrt(preferredSize);

	// max ofscalePercentage :1
	if (scalePercentage > 1) {
		scalePercentage = 1;
	}
	// 설정한 윈도우 사이즈에서의 이미지가 가장 큰 이미지 사이즈가 된다.
	if (secW > orgwindowWidth) {
		secW = orgwindowWidth;
	}
	// 현재 화면 비율
	var ratioW = secW / orgwindowWidth;

	for (var i = 0; i < image.length; i++) {

		console.log('이미지 크기중');
		var imgwidth = image[i].naturalWidth;// 이미지 원본사이즈 너비
		// 이미지 사이즈가 선호사이즈보다 클수 없도록!!
		console.log('imgwidth종류' + image[i]);
		console.log('imgwidth' + image[i].naturalWidth);
		if (imgwidth > orgwindowWidth) {
			imgwidth = orgwindowWidth;
		}
		// 너비와 해상도 비율 고려(높이까지 고려하여 크기조절)
		if (imgwidth * scalePercentage < imgwidth * ratioW) {// 해상도 비율 고려
			$(image[i]).css('width', imgwidth * scalePercentage);
			$(image[i]).css('height', "auto");
		} else {// 현재 화면 비율 고려
			$(image[i]).css('width', imgwidth * ratioW);
			$(image[i]).css('height', "auto");
		}
	}
}

/**
 * //------------------res_font.js---------------------
 */

function res_Text() {

	//선호 해상도 (이미지가 정상적으로 보이는 기준점 해상도-자동화 예정)
	var preferredSize = 1280 * 720;

	var secW = $(".sec").width();
	var secH = $(".sec").height();

	//현재  해상도 
	var currentSize = secW * secH;

	//해상도에 따른 이미지 비율
	var scalePercentage = Math.sqrt(currentSize) / Math.sqrt(preferredSize);

	//지정 폰트
	var newFontSize = 0;

	//선호 폰트 사이즈 (자동화 예정)
	var preferredFontSize = [ 650, 460, 185, 153, 139, 108 ]; // 선호폰트 사이즈 % (/100 하면 em)

	newFontSize = (preferredFontSize[0] * scalePercentage) / 100;
	$(".large1").css("font-size", newFontSize + 'em');

	//큰 폰트 (기존 60px)
	newFontSize = (preferredFontSize[1] * scalePercentage) / 100;
	$(".large2").css("font-size", newFontSize + 'em');

	//중간 폰트 (기존 24px) 
	newFontSize = (preferredFontSize[2] * scalePercentage) / 100;
	$(".medium1").css("font-size", newFontSize + 'em');

	//중간 폰트 (기존 20px)
	newFontSize = (preferredFontSize[3] * scalePercentage) / 100;
	$(".medium2").css("font-size", newFontSize + 'em');

	//작은 폰트 (기존 18px)
	newFontSize = (preferredFontSize[4] * scalePercentage) / 100;
	$(".small1").css("font-size", newFontSize + 'em');

	//작은 폰트 (기존 14px)
	newFontSize = (preferredFontSize[5] * scalePercentage) / 100;
	$(".small2").css("font-size", newFontSize + 'em');
}

function chkLoginPolicy(mbrLoginId) {

	//로그인 아이디 계정정책 확인
	var re1 = "/^[a-zA-Z]{4,20}/g"; // 첫글자는 영문자 및 4~20글자 = true
	var re2 = "/s$/"; // 공백인 경우 true
	var re3 = "/[`~!@#$%^&*|\\\'\";,:\/?=<>+-]/gi"; //[]들어가있다면 false ^가 반대를 의미

	if (re1.test(mbrLoginId) == false) {
		alert("첫글자는 영문자 및 4~20글자로 구성되어야 합니다.");
		return false;
	}
	if (re2.test(mbrLoginId) == true) {
		alert("공백은 허용하지 않습니다.");
		return false;
	}
	if (re3.test(mbrLoginId) == true) {
		alert("특수문자는 허용하지 않습니다.");
		return false;
	}
}

// 로그인 및 기타 form 체크
function check(form) {

	// 참고 a태그에서는 this 인지 못함
	// 원래는 로그인이 최상단 이나, 패스워드 찾기에서 패스워드 변경 부분에서 로그인이 위에있으면 그냥 통과라 변경
	// 추후 필히 변경 필요.
	if (form.mbrLoginPw.value.length == 0) {
		alert("패스워드를 입력해주세요");
		form.mbrLoginPw.focus();
		return false;
	}
	if (form.mbrLoginPw.value != form.mbrLoginPw_check.value) {
		alert("패스워드를 다시확인해주세요.");
		form.mbrLoginPw_check.focus();
		return false;
	}
	if (form.mbrLoginId.value.length == 0) {
		alert("아이디를 입력해주세요");
		form.mbrLoginId.focus();
		return false;
	}

	form.submit();
}

/* 확인 취소 Alert */

function Alert_DeleteConfirm() {
	if (confirm("정말 삭제하시겠습니까??") == true) { // 확인
		document.form.submit();
	} else { // 취소
		return;
	}
}

function Alert_UpdateConfirm() {
	if (confirm("정말 입력 또는 수정하시겠습니까??") == true) { // 확인
		document.form.submit();
	} else { // 취소
		return;
	}
}

/* 1번 널체크 */
function gfn_isNull(str) {
	if (str == null)
		return true;
	if (str == "NaN")
		return true;
	if (new String(str).valueOf() == "undefined")
		return true;
	var chkStr = new String(str);
	if (chkStr.valueOf() == "undefined")
		return true;
	if (chkStr == null)
		return true;
	if (chkStr.toString().length == 0)
		return true;
	return false;
}

/* 2번 submit에 대한 동적인 형태 */
function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";

	if (this.formId == "commonForm") {
		$("#commonForm")[0].reset();
	}

	this.setUrl = function setUrl(url) {
		this.url = url;
	};

	this.addParam = function addParam(key, value) {
		$("#" + this.formId).append(
				$("<input type='hidden' name='" + key + "' id='" + key
						+ "' value='" + value + "' >"));
	};

	this.submit = function submit() {
		var frm = $("#" + this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
}
