/* 타이머를 시작하는 함수 */

var timerID; // 타이머를 핸들링하기 위한 전역 변수
var time = 300; // 타이머 시작시의 시간 3분주고싶다면 180
function start_timer() {

	timerID = setInterval("decrementTime()", 1000);

}

/* 남은 시간을 감소시키는 함수 */
function decrementTime() {

	var x1 = document.getElementById("time1");
	// var x2 = document.getElementById("time2");
	x1.innerHTML = toHourMinSec(time);
	// x2.innerHTML = toHourMinSec(time);

	if (time > 0)
		time--;
	else {
		// 시간이 0이 되었으므로 타이머를 중지함
		clearInterval(timerID);
		alert('5분의 시간이 지났습니다. 다시 시도해주세요.');
		// $("#PwFinder").empty();
		// $("#myTabContent").modal('hide');
		document.location.href = '/MasterPage.jsp?mode=SMbrLogin';

		// 시간이 만료되고 나서 할 작업을 여기에 작성
		// document.form.submit(); // 예: 강제로 form 실행
	}
}

/* 정수형 숫자(초 단위)를 "시:분:초" 형태로 표현하는 함수 */
function toHourMinSec(t) {
	var hour;
	var min;
	var sec;

	// 정수로부터 남은 시, 분, 초 단위 계산
	hour = Math.floor(t / 3600);
	min = Math.floor((t - (hour * 3600)) / 60);
	sec = t - (hour * 3600) - (min * 60);

	// hh:mm:ss 형태를 유지하기 위해 한자리 수일 때 0 추가
	if (hour < 10)
		hour = "0" + hour;
	if (min < 10)
		min = "0" + min;
	if (sec < 10)
		sec = "0" + sec;

	return (hour + ":" + min + ":" + sec);
}

function setTitle(url) {
	/*
	 * var pgurl = url.substr(window.location.href .lastIndexOf("/") + 1);
	 */

	var first_slash = url.indexOf("/");
	var second_slash = url.indexOf("/", first_slash + 1);
	var third_slash = url.indexOf("/", second_slash + 1);
	var fourth_slash = url.indexOf("/", third_slash + 1);

	var last_slash = url.lastIndexOf("/");
	var lastDot = url.lastIndexOf('.');

	var url_1depth = url.substring(first_slash + 1, second_slash);
	var url_2depth = url.substring(second_slash + 1, third_slash);
	var url_3depth = url.substring(third_slash + 1, fourth_slash);

	var last_depth = url.substring(last_slash + 1, lastDot);

	// substring vs substr은 다르다.
	// http://aljjabaegi.tistory.com/127

	// alert(url);
	// alert(first_slash);
	// alert(second_slash);
	// alert(third_slash);
	// alert(url_1depth);
	// alert(url_2depth);
	// alert(url_1depth);
	// alert(last_depth);

	var set_Title = "";

	// 이걸 캐치프레이즈라고 한다.
	var main_Title = "Unleash your infinite possibilities with IT Optimization!!";

	var aervision_Title = "Biometric authentication & computer vision & machine learning";

	// 대분류 안에 소분류로 !
	if (url_1depth == "Company") {
		set_Title = "[Mwav.net] >> [" + url_1depth + " > " + last_depth
				+ "] - " + main_Title;

	} else if (url_1depth == "/CustomerService") {
		url_1depth = "CS";
		set_Title = "[Mwav.net] >> [" + url_1depth + " > " + last_depth
				+ "] - " + main_Title;

	} else if (url_1depth == "CompanyItem") {
		// 여기는 디지털마케팅 등 포함 2depth로

		if (url_2depth == "ITProducts" || url_2depth == "ITSolutions") {
			if (url_3depth == "OpenSRS") {
				set_Title = "[Mwav.net] >> [" + url_3depth + "] - "
						+ main_Title;
			} else if (url_3depth == "Aervision") {
				set_Title = "[Mwav.net] >> [" + url_3depth + "> "
						+ aervision_Title + "] - " + main_Title;
			} else if (url_3depth == "MSOffice") {
				set_Title = "[Mwav.net] >> [" + url_3depth + "] - "
						+ main_Title;
			} else if (url_3depth == "InsWave") {
				set_Title = "[Mwav.net] >> [" + url_3depth + "] - "
						+ main_Title;
			} else {
				set_Title = "[Mwav.net] >> [" + url_3depth + "] - "
						+ main_Title;
			}
		}
		// 디지털 마케팅 등
		else {
			set_Title = "[Mwav.net] >> [" + url_2depth + " > " + last_depth
					+ "] - " + main_Title;
		}
	} else {
		if (url_1depth == "/" && last_depth != "/") {
			set_Title = "[Mwav.net] >> [" + last_depth + "] - " + main_Title;
		} else if (url_1depth == "/" && last_depth == "/") {
			set_Title = "[Mwav.net] >> " + main_Title;
		} else {
			// .do 등등 일단은 고객친화적이게 임시 변환
			set_Title = "[Mwav.net] - " + main_Title;
		}
	}

	// alert(set_Title);
	// not fine이나 없으면안됨 그래서 else로 일괄 처리
	// $('meta[property="og:title"]').attr("content", "All contents are
	// copyright by Mwav.net");
	// $('meta[property="og:image"]').attr("content",
	// "http://mwav.net/Images/CompanyLogos/CompanyLogo.gif");
	// $('meta[property="og:description"]').attr("content", set_Title);

	// $('meta[property="og:title"]').attr('content', 'All contents are
	// copyright by Mwav.net');
	// $('meta[property="og:image"]').attr('content',
	// 'http://mwav.net/Images/CompanyLogos/CompanyLogo.gif');
	// $('meta[property="og:description"]').attr('content', set_Title);

	document.title = set_Title;
}

function cartlist_sum() {
	// 계산

	// alert('계산고고');
	var getSum = function(selector) {
		var sum = 0;
		var selector = selector;
		// alert(selector);

		$('#cart_list').find(selector).each(function(index, element) {
			sum += parseInt($(element).text());
		});

		return sum;
	};

	$('#cart_list').find('.subtotal_Price').each(function(index, element) {
		// $(this).text('Total: ' + getSum('.eachdelivery'));
		$(this).text(getSum('.eachPrice'));
	});

	$('#cart_list').find('.total_DeliveryCost').each(function(index, element) {
		$(this).text(getSum('.eachDeliveryCost'));
	});
	$('#cart_list').find('.total_Price').each(function(index, element) {
		$(this).text(getSum('.eachTotalPrice'));
	});
}

function target_show(target) {
	document.getElementById(target).style.display = 'block';
}

function target_hide(target) {

	document.getElementById(target).style.display = 'none';
}

// plus minus
function qtyplus(price) {
	// Stop acting like a button
	// e.preventDefault();
	event.preventDefault();
	// Get the field name
	fieldName = $(".qtyplus").attr('field');
	// alert(fieldName);

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

	// 가격이 0일때
	if (price == 0) {
		alert('가격이 0원입니다. ');
		return false;
	}
}

function qtyminus(price) {
	// Get the field name
	fieldName = $(".qtyminus").attr('field');

	event.preventDefault();
	// alert(fieldName);
	// Get its current value
	var currentVal = parseInt($('input[name=' + fieldName + ']').val());
	var price = price;
	// If it isn't undefined or its greater than 0
	if (!isNaN(currentVal) && currentVal > 0) {
		// Decrement one
		var afterCount = currentVal - 1;
		$('input[name=' + fieldName + ']').val(afterCount);

		goodPriceCalutate(price, afterCount);
	} else {
		// Otherwise put a 0 there
		$('input[name=' + fieldName + ']').val(0);
		alert('갯수는 0 이하는 불가합니다.')
	}

	// 가격이 0일때
	if (price == 0) {
		alert('가격이 0원입니다. ');
		return false;
	}
}

// goods
function goodPriceCalutate(price, ocAmount) {

	// alert('1');
	// var ocAmount = document.getElementById('ocAmount').value;
	// alert(ocAmount);
	// var ocAmount = document.getElementById('ocAmount');
	// 여러개 써야하는 경우도 있기 때문에 변경 var exshow1 =
	// document.getElementById('totalprice');
	var exshow1 = document.getElementsByClassName('totalprice')[0];
	var exshow2 = document.getElementsByClassName('totalprice')[1];

	var totalprice = (price * ocAmount);
	// alert(totalprice);

	// var content = ex.value;
	// exshow.innerHTML = content;
	exshow1.innerHTML = totalprice;
	exshow1.value = totalprice;
	exshow2.innerHTML = totalprice;
	exshow2.value = totalprice;
};

// ===================================Order

function orderCartPut(cartForm, type) {

	var frm = cartForm;
	alert(frm);
	// var ocAmount = cartForm.value.ocAmount;
	var goods_id = frm.goods_id.value;
	// var gcr_id = cartForm.value.gcr_id;

	alert(goods_id);

	var type = type;

	if (type == "frontCart") {

		alert("장바구니왔다");
		url = "/Shop/Order/orderForm.do?goods_id=" + goods_id + "&type=" + type;
		// location.href= url;
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
// ===================================Order

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
	// 선호 해상도 (이미지가 정상적으로 보이는 기준점 해상도-자동화 예정)
	var preferredSize = 1366 * 768;

	var secW = $(window).width();
	var secH = $(window).height();

	// 현재 해상도
	var currentSize = secW * secH;

	// 해상도에 따른 이미지 비율
	var scalePercentage = Math.sqrt(currentSize) / Math.sqrt(preferredSize);
    //alert(scalePercentage);
	
	// 지정 폰트
	var newFontSize = 0;

	// 선호 폰트 사이즈 (자동화 예정)
	var preferredFontSize = [ 612, 302, 204, 183, 142, 115, 102 ]; // 선호폰트 사이즈 %
	// (/102 하면 em)
	
	// 큰 폰트 (기존 60px)
	newFontSize = (preferredFontSize[0] * scalePercentage) / 100;
	$(".fontsize_60").css("font-size", newFontSize + 'em');

	// 큰 폰트 (기존 30px)
	newFontSize = (preferredFontSize[1] * scalePercentage) / 100;
	$(".fontsize_30").css("font-size", newFontSize + 'em');

	// 중간 폰트 (기존 20px)
	newFontSize = (preferredFontSize[2] * scalePercentage) / 100;
	$(".fontsize_20").css("font-size", newFontSize + 'em');

	// 중간 폰트 (기존 18px)
	newFontSize = (preferredFontSize[3] * scalePercentage) / 100;
	$(".fontsize_18").css("font-size", newFontSize + 'em');

	// 작은 폰트 (기존 14px)
	newFontSize = (preferredFontSize[4] * scalePercentage) / 100;
	$(".fontsize_14").css("font-size", newFontSize + 'em');

	// 작은 폰트 (기존 12px)
	newFontSize = (preferredFontSize[5] * scalePercentage) / 100;
	$(".fontsize_12").css("font-size", newFontSize + 'em');

	
	// 작은 폰트 (기존 10px)
	newFontSize = (preferredFontSize[6] * scalePercentage) / 100;
	$(".fontsize_10").css("font-size", newFontSize + 'em');
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

// 문자열내의 공백 제거
function trim(varSTR) {
	var result = "";
	for (var i = 0; i < varSTR.length; i++) {
		if (varSTR.charAt(i) != ' ')
			result = result + varSTR.charAt(i);
	}
	return result;

}

// form 내의 같은 element 개수
function getElementsCount(formname, elementname, isvalue) {
	var cntelement = 0;
	var tform = document.forms[formname];
	for (var i = 0; i < tform.elements.length; i++) {
		if (tform.elements[i].name == elementname) {
			if (isvalue == true) { // 값이 있는경우만
				if (tform.elements[i].value != '')
					cntelement = cntelement + 1;
			} else {
				cntelement = cntelement + 1;
			}
		}
	}
	return cntelement
}

// 영문 소문자를 영문대문자로 변환하는 함수
function nameUpper(arg) {
	arg.value = arg.value.toUpperCase();
}

// 쿠키 읽어오기
function getCookie(Name) {
	var search = Name + "="
	var cookie_value = unescape(document.cookie)

	if (document.cookie.length > 0) {
		var offset = cookie_value.indexOf(search)

		if (offset != -1) {
			offset += search.length
			var end = cookie_value.indexOf(";", offset)
			if (end == -1)
				end = document.cookie.length
			return trim(cookie_value.substring(offset, end))
		}
	}
	return ""
}

// 팝업창 띄우기
function openWindow(url, wt, ht, urlName, tbar, mbar, st, sbar, rsize) {

	wt = '1070';
	ht = '700';

	var dim = new Array(2);
	dim = CenterWindow(ht, wt);
	top = dim[0];
	left = dim[1];
	var left = left;
	var top = top;

	var toolbar = tbar;
	var menubar = mbar;
	var status = st;
	var scrollbars = sbar;
	var resizable = rsize;

	window
			.open(
					url,
					'',
					'left='
							+ left
							+ ', top='
							+ top
							+ ', width='
							+ wt
							+ ', height='
							+ ht
							+ ', toolbar=no, menubar=no, status=no, scrollbars=yes, resizable=yes');

}

// 중앙팝업창 띄우기
function CenterWindow(height, width) {

	var outx = screen.height;
	var outy = screen.width;
	var x = (outx - height) / 2;
	var y = (outy - width) / 2;
	dim = new Array(2);
	dim[0] = x;
	dim[1] = y;

	return dim;
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

// 콤마 삽입
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마 삭제
function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

// 특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj) {
	if (obj.value.length > 0) {
		// 특수문자 제거
		var expText = /[%=><]/;
		if (expText.test(obj.value) == true) {
			alert("특수문자를 입력 할수 없습니다.");
			obj.value = obj.value.split(expText).join("");
			return false;
		}

		// 특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
		// sql 예약어
		"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
				"UNION", "FETCH", "DECLARE", "TRUNCATE");

		var regex;
		var regex_plus;
		for (var i = 0; i < sqlArray.length; i++) {
			// 공백문자 포함 체크
			regex = new RegExp("\\s" + sqlArray[i] + "\\s", "gi");
			if (regex.test(obj.value)) {
				alert("\"" + sqlArray[i] + "\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value = obj.value.replace(regex, "");
				return false;
			}
			// 공백문자 미포함 체크
			regex_plus = new RegExp("\\+" + sqlArray[i] + "\\+", "gi");
			if (regex_plus.test(obj.value)) {
				alert("\"" + sqlArray[i] + "\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value = obj.value.replace(regex_plus, "");
				return false;
			}
		}
	}
	return true;
}

function caps_lockchk() {
	$('.caps_lockchk').keypress(
			function(e) {
				var $caps_lockchk = $(this), tooltipVisible = $('.tooltip').is(
						':visible'), s = String.fromCharCode(e.which);

				// Check if capslock is on. No easy way to test for this
				// Tests if letter is upper case and the shift key is NOT
				// pressed.
				if (s.toUpperCase() === s && s.toLowerCase() !== s
						&& !e.shiftKey) {
					if (!tooltipVisible)
						$caps_lockchk.data('toggle', 'tooltip');
					$caps_lockchk.data('placement', 'bottom');
					$caps_lockchk.data('title', 'Caps lock is on');
					$caps_lockchk.tooltip('show');
				} else {
					if (tooltipVisible)
						$caps_lockchk.tooltip('hide');
				}

				// Hide the tooltip when moving away from the password field
				$caps_lockchk.blur(function(e) {
					$caps_lockchk.tooltip('hide');
				});
			});
}

//소셜 공유하기
//http://dev.epiloum.net/916
//http://www.sharelinkgenerator.com/
function sendSns(url, utm_source, utm_campaign ,utm_medium, utm_content, subTitle)
{
	//alert(sns);
	//alert(url);
	//alert(txt);
	
	//통계기 추가 필요
	console.log(utm_campaign);
	console.log(trim(utm_campaign));
	
    var o;
    
    //보안이슈 인코딩 처리.
    //var _txt = encodeURIComponent(txt);
    var _br  = encodeURIComponent('\r\n');
    
    var googleAnalytics_var = '&utm_source='+ utm_source +'&utm_campaign='+ trim(utm_campaign)+'&utm_medium='+utm_medium+'&utm_content='+utm_content;
    var _url = encodeURIComponent(url+googleAnalytics_var);
    	
    //alert(url + googleAnalytics_var);
    console.log(_url);
    //alert(googleAnalytics_var);
    switch(utm_source)
    {
        case 'facebook':
            o = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
            };
            break;
 
        case 'twitter':
            o = {
                method:'popup',
                url:'http://twitter.com/intent/tweet?text=' + utm_campaign + '&url=' + _url 
            };
            break;
 
        case 'me2day':
            o = {
                method:'popup',
                url:'http://me2day.net/posts/new?new_post[body]=' + _txt + _br + _url + '&new_post[tags]=epiloum'
            };
            break;
 
        case 'googleplus':
            o = {
                method:'popup',
                url:'https://plus.google.com/share?&url='+ _url
            };
            break;
        
        case 'linkedin':
            o = {
                method:'popup',
                url:'https://www.linkedin.com/shareArticle?mini=true&url=' + _url +'&title=' + utm_campaign + '&summary=' + subTitle
            };
            break;    
     
            
        case 'kakaotalk':
            o = {
                method:'web2app',
                param:'sendurl?msg=' + _txt + '&url=' + _url + '&type=link&apiver=2.0.1&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('Epiloum 개발노트'),
                a_store:'itms-apps://itunes.apple.com/app/id362057947?mt=8',
                g_store:'market://details?id=com.kakao.talk',
                a_proto:'kakaolink://',
                g_proto:'scheme=kakaolink;package=com.kakao.talk'
            };
            break;
 
        case 'kakaostory':
            o = {
                method:'web2app',
                param:'posting?post=' + _txt + _br + _url + '&apiver=1.0&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('Epiloum 개발노트'),
                a_store:'itms-apps://itunes.apple.com/app/id486244601?mt=8',
                g_store:'market://details?id=com.kakao.story',
                a_proto:'storylink://',
                g_proto:'scheme=kakaolink;package=com.kakao.story'
            };
            break;
 
        case 'band':
            o = {
                method:'web2app',
                param:'create/post?text=' + _txt + _br + _url,
                a_store:'itms-apps://itunes.apple.com/app/id542613198?mt=8',
                g_store:'market://details?id=com.nhn.android.band',
                a_proto:'bandapp://',
                g_proto:'scheme=bandapp;package=com.nhn.android.band'
            };
            break;
 
        default:
            alert('지원하지 않는 SNS입니다.');
            return false;
    }
 
    switch(o.method)
    {
        case 'popup':
            window.open(o.url);
            break;
 
        case 'web2app':
            if(navigator.userAgent.match(/android/i))
            {
                // Android
                setTimeout(function(){ location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'}, 100);
            }
            else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i))
            {
                // Apple
                setTimeout(function(){ location.href = o.a_store; }, 200);          
                setTimeout(function(){ location.href = o.a_proto + o.param }, 100);
            }
            else
            {
                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
            }
            break;
    }
}

function reloadPage(paramName, paramValue){
	var parameterName = paramName;
	var parameterValue = paramValue;

	if(parameterName != null || parameterValue != null){
		$('input[name="reloadparam"]').val(paramValue);
	window.location = location.href + "&"+ parameterName + "="+ parameterValue;
	}
	else{
		window.location = location.href;
	}
}

//자바스크립트 parater 자르기 
function getParams() {
    // 파라미터가 담길 배열
    var param = new Array();
 
    // 현재 페이지의 url
    var url = decodeURIComponent(location.href);
    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
    url = decodeURIComponent(url);
 
    var params;
    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
    params = url.substring( url.indexOf('?')+1, url.length );
    // 파라미터 구분자("&") 로 분리
    params = params.split("&");
 
    // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
    var size = params.length;
    var key, value;
    for(var i=0 ; i < size ; i++) {
        key = params[i].split("=")[0];
        value = params[i].split("=")[1];
 
        param[key] = value;
    }
 
    return param;
}

//별표 스크립트
//Starrr plugin (https://github.com/dobtco/starrr)
//Starrr plugin (https://github.com/dobtco/starrr)
var __slice = [].slice;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      
      this.$el.on('dblclick.starrr', 'span', function(e) {
    	  console.log('dblclick.starrr');
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});

//별표 끝

function robot_check(widgetId) {
	//alert('widgetId'+widgetId);
	var recaptcha = grecaptcha.getResponse(widgetId);
	if (recaptcha.length == 0) {
		alert('로봇이 아닌지 체크해주세요.');
		return false;
	} else {
		return true
	}
}