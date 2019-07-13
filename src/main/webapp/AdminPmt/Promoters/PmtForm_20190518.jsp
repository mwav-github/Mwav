<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="net.promoter.vo.Promoter_VO"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script>
	function filterNumber(event) {
		  var code = event.keyCode;
		  if (code > 47 && code < 58) { //숫자만 입력받음
		    return;
		  }
		  if (event.ctrlKey || event.altKey) { //컨트롤과 알트키 가능하게 끔
		    return;
		  }
		  if (code === 9 || code === 36 || code === 35 || code === 37 ||
		      code === 39 || code === 8 || code === 46) {
		    return; //화살표 가능하게끔
		  }
		  event.preventDefault();
		}
	
	$(document).ready(function(){
	    $('[data-toggle="popover"]').popover(); 
	});
	
	function validate(type){
		var value = $('input[name='+ type +']').val(); 
		$.ajax({
			url:'/promoter/pmtLoginIdCheck.mwav',
			data:{
				type:type,
				value:value
			},
			success:function(data){
				//해당 아이디가 존재하면 true, 없는 아이디면 false
				if(data){
					if(confirm('회원가입 하시겠습니까?')){
						alert('완료');
					}
				}else{
					alert('이미 존재하는 아이디입니다.');
					$('#chkLoginId').focus();
					return false;
				}
			},
			error:function(err){
				alert('Error!\n관리자에게 문의하여 주시기 바랍니다.');
			}
		});
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
																	id="chkLoginId" type='text' maxlength="15" required> <br>
																	
																<button onclick='validate("pmtLoginId");'>아이디 중복 체크</button>
																
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
																	id="chkLoginPW" type='password' required>
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
																	id="chkLoginPwChk" type='password' required>
															</div>
														</div>
													</td>
												</tr>												
												<tr>
													<td>이름:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtName" type="text"
																	maxlength="20" required />
															</div>
														</div></td>
												</tr>
												<tr>
													<td>핸드폰번호:</td>
													<td><div class='form-group'>

															<div class='col-md-8'>
																<input class="form-control" name="pmtCellularPhone"
																	type="text" maxlength="13"  required />
																	<!-- onkeydown="filterNumber(event);" -->
																	
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>이메일:</td>
													<td><div class='form-group'>
															<div class='col-md-8'>
																<input class="form-control" name="pmtMail"
																	id="chkEmail" type="text"
																	onchange="chkEmailPolicy(this.value, this)" required />
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
																<button class="btn btn-primary btn-block" type="button"
																	data-toggle="modal" data-target=".modal_post"
																	onclick="showhide();">주소찾기</button>

															</p>

															<div class='col-md-8'>
																<input class="form-control" id="Address" value=""
																	name="pmtAddress_1" type="text" placeholder='주소'
																	readOnly />
															</div>
															<div class='col-md-8'>
																<input class="form-control" name="pmtAddress_2"
																	value="" id="rest_Address" type="text"
																	placeholder='나머지 주소' required />
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


