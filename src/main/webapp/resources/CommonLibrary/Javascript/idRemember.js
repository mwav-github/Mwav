/**
 * 
 */

$(document).ready( function() {

    // 이메일, 패스워드 등 안내 문구
    $(".help_email_msg, .help_passwd_msg").css(
        {
            "position" : "absolute",
            "margin-top" : "-37px",
            "padding" : "5px",
            "width" : "180px",
            "color" : "#c8c8c8",
            "font-size" : "16px",
            "font-weight" : "700",
        }
    );

    $(".help_email_msg").click(function (){
        $(this).hide();
        $(".error_msg").hide();
        $("input[name='userEmail']").focus();
    });
    $("#userEmail").blur(function (){
        if ( !$.trim($(this).val() ) ) {
            $(".help_email_msg").show();
        }
    });
    $("#userEmail").focus(function (){
        $(".error_msg").hide();
        $(".help_email_msg").hide();
    });
    $("#userEmail").change( function() {
    	if(!$.trim($('#userEmail').val())){
        	$('#userEmail').siblings('.error_msg').html('Please enter your email address.');
        	$('#userEmail').siblings('.error_msg').css('display', 'block');
        	return false;
    	} else {
    		$('#userEmail').siblings('.error_msg').css('display', '');
    	}
	});

    $(".help_passwd_msg").click(function (){
        $(this).hide();
        $(".error_msg").hide();
        $("input[name='userPassword']").focus();
    });
    $("#userPassword").blur(function (){
        if ( !$.trim($(this).val() ) ) {
            $(".help_passwd_msg").show();
        }
    });
    $("#userPassword").focus(function (){
        $(".error_msg").hide();
        $(".help_passwd_msg").hide();
    });
    $("#userPassword").focus(function (){
        $(".error_msg").hide();
    });
    $("#userPassword").change( function() {
    	if(!$.trim($('#userPassword').val())){
        	$('#userPassword').siblings('.error_msg').html('Please enter your password.');
        	$('#userPassword').siblings('.error_msg').css('display', 'block');
        	return false;
    	} else {
    		$('#userPassword').siblings('.error_msg').css('display', '');
    	}
	});
    $("#userPassword").keydown(function (e){
        if (e.keyCode == 13){
            $.init();
        }
    });
});

/**
* extends
*/
$.extend({

    // init
    init : function () /*
	 jQuery.extend()
     jQuery에서 $.extend() 메서드를 사용하여 객체를 확장할 수 있습니다.
	  (한 객체가 다른 객체의 프로퍼티를 상속받을 수 있습니다. 
	  http://codefactory.kr/2011/12/06/jquery-sourcecode-analysis-javascript-study-jquery-extend/
	  */
    {

        alert('sdf1');
        // 폼필드 유효성 검사
        if( !$.checkFormField() ) { return false; }
        
        alert('sdf0');
        // 폼값 셋팅
        $("form[name='AuthLoginForm']").attr("target", "_self");
        $("form[name='AuthLoginForm']").attr("action", "/WaaSup_Test/Index.html"); //임의로 추가 (처리를 위한 action 값 변경)
		
        
        //추가 부분 
		
	    var frm = document.AuthLoginForm;
	    alert('이메일값은'+frm.userEmail.value);
	    saveLogin(frm.userEmail.value);
	    var id = getCookie("userid");
	    alert(id);
		// 추가 끝
	    
	    
        $("form[name='AuthLoginForm']").submit();
    },


    // 폼필드 유효성 체크
    checkFormField : function ()
    {
        if(!$.trim($('#userEmail').val())){
        	$('#userEmail').siblings('.error_msg').html('Please enter your email address.');
        	$('#userEmail').siblings('.error_msg').css('display', 'block');
        	//alert("Please enter your email address.");
        	//$('#userEmail').focus();
        	return false;
        }
        if(!$.trim($('#userPassword').val())){
        	//alert("Please enter your password.");
        	$('#userPassword').siblings('.error_msg').html('Please enter your password.');
        	$('#userPassword').siblings('.error_msg').css('display', 'block');
        	return false;
        }

        var re=/^[0-9a-zA-Z-_\.]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if( !re.test( $('#userEmail').val() ) ){
            //alert("Your email address has an invalid email address format. Please correct and try again.");
        	$('#userEmail').siblings('.error_msg').html('Your email address has an invalid email address format. Please correct and try again.');
        	$('#userEmail').siblings('.error_msg').css('display', 'block');
            //$('#userEmail').focus();
            return false;
        }
        /*
        var rePw=/^[0-9a-zA-Z-_~!@#$%^&*()+|\=<>?.,]{4,18}$/i;
        if( !rePw.test( $('#userPassword').val() ) ){
        	$('#userPassword').siblings('.error_msg').html('Your password has an invalid password format. <br />Please correct and try again.');
        	$('#userPassword').siblings('.error_msg').css('display', 'block');
            $('#userPassword').focus();
            return false;
        }
		*/
        return true;
    }

});

// 아이디 저장 스크립트 (추가)



//아이디저장 1.confirmSave - 체크박스를 클릭했을경우 나타나는 대화상자로 일종의 경고문이다. 

function confirmSave(checkbox)
{
 var isRemember;

 if(checkbox.checked)
 {
 isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
  if(!isRemember)
   checkbox.checked = false;
 }
}

//2.saveLogin - 저장할 아이디 값을 받아 위의 setsave 함수에게 토스해주는 함수이다. 저장할 아이디 값이 있느냐 없느냐를 검사하는 곳이기도 하다
function saveLogin(id)
{
if(id != "")
{
// userid 쿠키에 id 값을 7일간 저장
setCookie("userid", id, 7);
}else{
// userid 쿠키 삭제
setCookie("userid", id, -1);
}
}

//3. setCookie - 본인의 컴퓨터에 쿠키로 저장하는 함수이다. 어떤이름(name)으로 무엇을(value) 얼마나(expiredays) 저장하는지..매개변수값을 받고 있다

// 쿠키값 설정

function setCookie(name, value, expiredays){

  var today = new Date();

  today.setDate( today.getDate() + expiredays );

  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";

}


//4.쿠키 불러오기
function getLogin()
{
	var frm = document.AuthLoginForm;

	 // userid 쿠키에서 id 값을 가져온다.

	 var id = getCookie("userid");
     alert('4번id'+id);
	 // 가져온 쿠키값이 있으면
	 
	 if(id != "") {
		 alert('불러오니'+id);
		 $(".help_email_msg").hide();
		 
	  frm.userEmail.value = id;
	  frm.rememberMe.checked = true;

	 }
}




//5.쿠키값 가져오기 

function getCookie(key){

  var cook = document.cookie + ";";

  var idx =  cook.indexOf(key, 0);

  var val = "";

  if(idx != -1)  {

    cook = cook.substring(idx, cook.length);
    alert('cook'+cook);

    begin = cook.indexOf("=", 0) + 1;
    alert('begin'+begin);

    end = cook.indexOf(";", begin);
    alert('end'+end);

    val = unescape( cook.substring(begin, end) );
    alert('val'+val);

  }

  return val;

}


