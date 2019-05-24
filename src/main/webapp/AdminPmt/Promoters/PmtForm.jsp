<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="net.promoter.vo.Promoter_VO"%>

<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->

<script>
//회원가입시 아래의 6개의 변수가 true가 되어야지만 가입할수있다.
	var IdCheckYN = false;		//아이디
	var PwdCheckYN = false;		//비밀번호
	var PwdCheck2YN = false;	//비밀번호확인
	var NameCheckYN = false;	//이름
	var PhoneCheckYN = false;	//핸드폰
	var EmailCheckYN = false;	//이메일

	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover(); 
	});
	
	function ajaxIdCheck(type,value){
		//ajax를 사용하여 해당 아이디 중복 여부 확인
		// 에이젝스 동기처리 ....
		var result = false;
		
		$.ajax({
			url:'/promoter/pmtLoginIdCheck.mwav',
			data:{
				type:type,
				value:value
			},
			async: false,
			success:function(data){
				var reulstData = data;
				//해당 아이디가 존재하면 1, 없는 아이디면 0
				if(data <= 0){
					alert('해당 아이디는 사용하실수 있는 아이디입니다.');
					result = true;
				}else{
					alert('이미 존재하는 아이디입니다.');
					result = false;
				}
			},
			error:function(err){
				alert('Error!\n관리자에게 문의하여 주시기 바랍니다.');
				result = false;
			}
		});
		
		return result;
	}
	
	//타입별 정규식, 정규식 표현은 멤버 회원가입과 동일
	function regexCheck(type, value){
		switch(type){
		case 'pmtLoginId' :
			//아이디의 경우 정규식 유효성 체크 후, 중복여부 확인
			regex = /[a-zA-Z0-9_-]{4,20}$/g.test(value);
			if(regex){
				//아이디 중복 검사
				IdCheckYN = ajaxIdCheck(type,value);
				return IdCheckYN; 
			}else{
				alert('유효하지 않은 아이디입니다. \n4~20자 사이의 영문,숫자, -_ 만 사용할 수 있습니다.')
				return false;
			}
			break;
		
		case 'pmtLoginPw' : 
			regex = /^(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])(?=.*[0-9])(?=.*[a-zA-Z])[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"0-9a-zA-Z]{8,255}$/g.test(value);
			
			
			// 비밀번호같은경우 사용자 변심으로 인해 수정할수 있기 때문..
			var pwdChk = $('input[name=pmtLoginPwChk]').val();
			if(pwdChk.length != 0){
				console.log('pwdChk : ' + pwdChk);
				console.log('value : ' + value);
				if(value != pwdChk){	
					console.log('false')
					$('input[name=pmtLoginPwChk]').css("border","solid 3px red");
					$('#pmtLoginPwChkFalse').css('display','block');
				}else{
					console.log('true')
					$('input[name=pmtLoginPwChk]').css("border","solid 3px greenyellow");
					$('#pmtLoginPwChkFalse').css('display','none');	//숨김
				}
			}
			
			if(regex)
				PwdCheckYN = true;
			else
				return false;
			break;
			
		case 'pmtLoginPwChk' : 
			var pwd = $('input[name=pmtLoginPw]').val();
			if(pwd != value || pwd.length == 0)
				return false;
			else
				PwdCheck2YN = true;
			break;
			
		case 'pmtName' : 
			regex = /^[가-힣]+$/g.test(value);
			if(regex)
				NameCheckYN = true;
			else
				return false;
			break;
		
		case 'pmtCellularPhone' : 
			regex = /^\d{3}-\d{3,4}-\d{4}$/g.test(value);
			if(regex)
				PhoneCheckYN = true;
			else
				return false;
			break;
		
		case 'pmtMail' : 
			regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/g.test(value);
			if(regex)
				EmailCheckYN = true;
			else
				return false;
			break;
			
		default : alert('Error!\n잘못된 타입입니다.');
		}
		
		return true;	//유효성 체크에 이상이없다면 true
	}	
	
	//각각의 입력란에 대한 유효성 체크를 한다.
	function validateCheck(type){
		var value = $('input[name='+ type +']').val();
		//정규식 유효성 체크
		if(regexCheck(type, value)){
			$('input[name='+ type +']').css("border","solid 3px greenyellow");
			$('#'+ type +'False').css('display','none');	//숨김
		}else{
			$('input[name='+ type +']').css("border","solid 3px red");
			$('#'+ type +'False').css('display','block');	//정규식 설명
		}
		
	}
	
	//모든 값들이 유효하다면 submit
	function pmtSubmit(){
		console.log(IdCheckYN + ', ' + PwdCheckYN + ', ' + PwdCheck2YN + ', ' + NameCheckYN + ', ' + PhoneCheckYN + ', ' + EmailCheckYN)
		if(IdCheckYN && PwdCheckYN && PwdCheck2YN && NameCheckYN && PhoneCheckYN && EmailCheckYN){
			if(confirm('Promoter 가입을 하시겠습니까?')){
				$('#joinForm').submit();
			}
		}else{
			alert('부적절한 값이 있습니다.');
		}
	}
</script>

</head>

<style>
	.input-margin{
		margin-bottom: 15px;
	}
</style>

<body>
	<div class="col-md-12">
		<div class='center-block' style='border: 1px solid red; width: 80%; height: 100px; margin-bottom: 30px;'>
		</div>
		<hr>
		<!-- Content Column -->
		<div class="center-block">
			<%-- 1. 회원정보 입력 --%>
			<form id='joinForm' class='form-horizontal' method="post" action="/promoter/PmtForm.mwav">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Mwav - Promoter Registration</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class=" col-md-12 col-lg-12 ">
									<%-- form-group row는 부트스트랩에서 정식으로 사용함... https://getbootstrap.com/docs/4.0/components/forms/#readonly-plain-text --%>
									<div class='form-group' style='margin-bottom: 0px;'>
										<div class='col-md-2 col-md-offset-2'>아이디 * :</div>
										<div class='col-md-5'>
											<input class='form-control' style='margin-bottom: 10px;' name="pmtLoginId" id="chkLoginId" type='text' maxlength="15"> 
										</div>
									</div>
									
									<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'></div>
										<div class='col-md-5'>
											<button type='button' class='btn btn-primary' onclick='validateCheck("pmtLoginId");'>아이디 중복 체크</button>
										</div>
									</div>

									<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>비밀번호 * :</div>
										<div class='col-md-5'>
											<input class='form-control input-margin' name="pmtLoginPw"
												id="chkLoginPW" type='password' onfocusout='validateCheck("pmtLoginPw");'>
											<div id='pmtLoginPwFalse' class='checkFalse alert alert-danger' style="display:none;">유효하지 않은 비밀번호입니다. <br>8~255자 사이의 영문,숫자,특수문자로 구성되어야 합니다.</div>
										</div>
									</div>
								
									<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>비밀번호 확인 * :</div>
										<div class='col-md-5'>
											<input class='form-control input-margin' name="pmtLoginPwChk"
												id="chkLoginPwChk" type='password' onfocusout='validateCheck("pmtLoginPwChk");'>
												<div id='pmtLoginPwChkFalse' class='checkFalse alert alert-danger' style="display:none;">비밀번호가 일치하지 않습니다.</div>
										</div>
									</div>
								
								<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>이름 * :</div>
										<div class='col-md-5'>
											<input class="form-control input-margin" name="pmtName" type="text"
												maxlength="20" onfocusout='validateCheck("pmtName");' />
											<div id='pmtNameFalse' class='checkFalse alert alert-danger' style="display:none;">한글만 입력해주세요.</div>
										</div>
									</div>
									
								<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>핸드폰번호 * :</div>

										<div class='col-md-5'>
											<input class="form-control input-margin" name="pmtCellularPhone"
												type="text" maxlength="13" onfocusout='validateCheck("pmtCellularPhone");' />
											<div id='pmtCellularPhoneFalse' class='checkFalse alert alert-danger' style="display:none;">010-1234-5678 형태로 입력해주세요 </div>
										</div>
									</div>
								
								
								<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>이메일 * :</div>
										<div class='col-md-5'>
											<input class="form-control input-margin" name="pmtMail" id="chkEmail" type="text" onfocusout='validateCheck("pmtMail");' />
											<div id='pmtMailFalse' class='checkFalse alert alert-danger' style="display:none;">유효하지 않은 이메일 입니다.</div>
										</div>
									</div>
									
								<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>직업 :</div>
										<div class='col-md-5'>
											<input class="form-control input-margin" name="pmtJobType" type="text" maxlength="200" />
										</div>
									</div>
									
								<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>결혼여부 * </div>
										<div class='col-md-5'>
											<label class='radio-inline' style='margin-right:20px;'><input id='MarriedN' class="" name="pmtMarried" value="0" type="radio" checked/> 미혼</label>																
											<label class='radio-inline'><input id='MarriedY' class="" name="pmtMarried" value="1" type="radio" /> 결혼</label>
										</div>
									</div>
								
								
								
									<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>주소 * :</div>

										<div class='col-md-5'>
											<input class="form-control" id="Zipcode" name="pmtZipcode" type="text" maxlength="6" placeholder='우편번호' style='width:40%; display:inline;' readOnly />
											<button class="btn btn-primary" type="button" data-toggle="modal" data-target=".modal_post" data-dismiss="modal" style='vertical-align: unset;'>주소찾기</button>
										</div>
									</div>
									
									<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'></div>
										<div class='col-md-5'>
											<input class="form-control" id="Address" name="pmtAddress_1" type="text" placeholder='주소' style='margin-bottom: 5px;' readOnly />
											<input class="form-control" id='rest_address'     name="pmtAddress_2" value="" id="rest_Address" type="text" placeholder='상세 주소' required />
										</div>
									</div>
									
									<div class='form-group'>
										<div class='col-md-2 col-md-offset-2'>추천인아이디:</div>
										<div class='col-md-5'>
											<input class='form-control' name="pmtRcmderId"
												id="chkUpperPromo_id" type='text' maxlength="20"
												onchange="idcheck('chkUpperPromo_id')">
										</div>
									</div>
								</div>
							</div>
							
							<div class="panel-footer">
								<!-- <button type="button" class="btn btn-sm btn-primary"
									onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">
									리스트</button> -->

								<button type="button" class="btn btn-sm btn-primary"
									onClick="javascript:history.go(-1)">뒤로가기</button>

								<button onclick="pmtSubmit()" type="button"
									class="btn btn-sm btn-primary">가입하기</button>

							</div>

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
		<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />
