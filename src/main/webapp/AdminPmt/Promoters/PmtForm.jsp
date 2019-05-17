<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="net.promoter.vo.Promoter_VO"%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>
<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />
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
	
	//타입별 정규식, 정규식 표현은 멤버 회원가입과 동일
	function regexCheck(type, value){
		var result = false;
		switch(type){
		case 'pmtLoginId' :
			//아이디의 경우 정규식 유효성 체크 후, 중복여부 확인
			result = /[a-zA-Z0-9_-]{4,20}$/g.test(value);
			if(!result){
				console.log('유효하지 않은 아이디입니다. \n4~20자 사이의 영문,숫자, -_ 만 사용할 수 있습니다.')
				return false;
			}
			
			//ajax를 사용하여 해당 아이디 중복 여부 확인
			$.ajax({
				url:'/promoter/pmtLoginIdCheck.mwav',
				data:{
					type:type,
					value:value
				},
				success:function(data){
					//해당 아이디가 존재하면 true, 없는 아이디면 false
					if(data){
						IdCheckYN = true;
						alert('해당 아이디는 사용하실수 있는 아이디입니다.');
					}else{
						alert('이미 존재하는 아이디입니다.');
						return false;
					}
				},
				error:function(err){
					alert('Error!\n관리자에게 문의하여 주시기 바랍니다.');
				}
			});
			break;
		
		case 'pmtLoginPw' : 
			result = /^(?=.*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])(?=.*[0-9])(?=.*[a-zA-Z])[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"0-9a-zA-Z]{8,255}$/g.test(value);
			if(!result)
				return false;
			else
				PwdCheckYN = true;
			break;
			
		case 'pmtLoginPwChk' : 
			var pwd = $('input[name=pmtLoginPw]').val();
			if(pwd != value || pwd.length == 0)
				return false
			else
				PwdCheck2YN = true;
			break;
			
		case 'pmtName' : 
			result = /^[가-힣]+$/g.test(value);
			if(!result)
				return false;
			else
				NameCheckYN = true;
			break;
		
		case 'pmtCellularPhone' : 
			result = /^\d{3}-\d{3,4}-\d{4}$/g.test(value);
			if(!result)
				return false;
			else
				PhoneCheckYN = true;
			break;
		
		case 'pmtMail' : 
			result = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/g.test(value);
			if(!result)
				return false;
			else
				EmailCheckYN = true;
			break;
		default : alert('Error!\n잘못된 타입입니다.');
		}
		
		return true;	//이상이 없다면 정규식 true
	}
	
	//각각의 입력란에 대한 유효성 체크를 한다.
	function validateCheck(type){
		var value = $('input[name='+ type +']').val();
		
		//정규식 유효성 체크
		if(!regexCheck(type,value)){
			$('input[name='+ type +']').css("border","solid 3px red");
			$('#'+ type +'False').css('display','block');	//정규식 설명
		}else{
			$('input[name='+ type +']').css("border","solid 3px greenyellow");
			$('#'+ type +'False').css('display','none');	//숨김
		}
		
		console.log('확인 : '+IdCheckYN +', '+PwdCheckYN +', '+ PwdCheck2YN +', ' +NameCheckYN +', '+ PhoneCheckYN +', '+EmailCheckYN);
	}
</script>

</head>

<div class="col-md-12">
	<!-- Content Column -->
	<div class="col-lg-12">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<%-- 1. 회원정보 입력 --%>
				<form class='form-horizontal' method="post" action="/promoter/PmtForm.mwav">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Mwav - Promoter Registration</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class=" col-md-12 col-lg-12 ">
										<table class="table table-user-information">
											<tbody>
												<tr>
													<td>아이디:</td>
													<td>
														<div class='form-group'>
															<div class='col-md-8'>

																<input class='form-control' name="pmtLoginId"
																	id="chkLoginId" type='text' maxlength="15"> 
																	
																<button type='button' onclick='validateCheck("pmtLoginId");'>아이디 중복 체크</button>
																
																<span class="col-md-12" id="idcheckLayer"></span>
															</div>
														</div>
													</td>
												</tr>

												<tr>
													<td>비밀번호:</td>
													<td>
														<div class='form-group'>
															<div class='col-md-8'>
																<input class='form-control' name="pmtLoginPw"
																	id="chkLoginPW" type='password' onfocusout='validateCheck("pmtLoginPw");'>
																<div id='pmtLoginPwFalse' class='checkFalse' style="display:none; background:red; color:white;">유효하지 않은 비밀번호입니다. <br>8~255자 사이의 영문,숫자,특수문자로 구성되어야 합니다.</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>비밀번호 확인:</td>
													<td>
														<div class='form-group'>
															<div class='col-md-8'>
																<input class='form-control' name="pmtLoginPwChk"
																	id="chkLoginPwChk" type='password' onfocusout='validateCheck("pmtLoginPwChk");'>
																	<div id='pmtLoginPwChkFalse' class='checkFalse' style="display:none; background:red; color:white;">비밀번호가 일치하지 않습니다.</div>
															</div>
														</div>
													</td>
												</tr>												
												<tr>
													<td>이름:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtName" type="text"
																	maxlength="20" onfocusout='validateCheck("pmtName");' />
																<div id='pmtNameFalse' class='checkFalse' style="display:none; background:red; color:white;">한글만 입력해주세요.</div>
															</div>
														</div></td>
												</tr>
												<tr>
													<td>핸드폰번호:</td>
													<td><div class='form-group'>

															<div class='col-md-8'>
																<input class="form-control" name="pmtCellularPhone"
																	type="text" maxlength="13" onfocusout='validateCheck("pmtCellularPhone");' />
																<div id='pmtCellularPhoneFalse' class='checkFalse' style="display:none; background:red; color:white;">010-1234-5678 형태로 입력해주세요 </div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>이메일:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtMail" id="chkEmail" type="text" onfocusout='validateCheck("pmtMail");' />
																<div id='pmtMailFalse' class='checkFalse' style="display:none; background:red; color:white;">유효하지 않은 이메일 입니다.</div>
															</div>
														</div></td>
												</tr>

												<tr>
													<td>직업 :</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtJobType"
																	type="text" maxlength="200" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>결혼여부</td>
													<td><div class='form-group'>
															<div class='col-md-3'>
																<input class="form-control" 
																	name="pmtMarried" value="0" type="radio" /> 미혼
															</div>
															<div class='col-md-3'>
																<input class="form-control" 
																	name="pmtMarried" value="1" type="radio" /> 결혼
															</div>
														</div></td>
												</tr>
												<tr>
													<td>우편번호:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" id="Zipcode"
																	name="pmtZipcode" type="text" maxlength="6" value=""
																	readonly="readonly" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>주소:</td>
													<td>

														<div class='form-group'>

															<p class="col-md-3 pull-right">
																<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target=".modal_post" data-dismiss="modal">주소찾기</button>
															</p>

															<div class='col-md-8'>
																<input class="form-control" name="pmtZipcode" id="Zipcode" type="text" placeholder="우편번호" value="" readonly="readonly">
															</div>
															<div class='col-md-8'>
																<input class="form-control" id="Address" value="" name="pmtAddress_1" type="text" placeholder='주소' readOnly />
																<input id='rest_address' class="form-control" name="pmtAddress_2" value="" id="rest_Address" type="text" placeholder='나머지 주소' required />
															</div>
														</div>
													</td>
												</tr>
												<tr>
														<td>추천인아이디:</td>
														<td>
															<div class='col-md-8'>
																<input class='form-control' name="pmtRcmderId"
																	id="chkUpperPromo_id" type='text' maxlength="20"
																	onchange="idcheck('chkUpperPromo_id')" required>
															</div>
														</td>
													</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="panel-footer">

									<button type="button" class="btn btn-sm btn-primary"
										onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">
										리스트</button>

									<button type="button" class="btn btn-sm btn-primary"
										onClick="javascript:history.go(-1)">뒤로가기</button>

									<button onclick="msubmit()" type="submit"
										class="btn btn-sm btn-primary">가입하기</button>

								</div>

							</div>
						</div>
					</div>
				</form>
		</div>
	</div>
</div>
