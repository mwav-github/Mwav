<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>


<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
<script>
var xhr;
	function createXhr() {
		if (window.ActiveXObject) { // IE 이전버전
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			xhr = new XMLHttpRequest();
		}
	}

	function idcheck() {
		var id = document.getElementsByName("stfLoginId")[0].value;
		<%--var id = document.getElementsByName("mbrLoginId")[0].value;
		//alert(id);
		//var html_object = document.getElementsByName("mbrLoginId");
		//위에로 하면 HTMLCollection로 나오며 이는  리턴 결과가 복수인 경우에 사용하게 되는 객체다
		// 아래는 HTML INPUTELEMENT? 하나 !
		//유효성 체크  후 ajax --%>
		var input_object = document.getElementById("chkLoginId");
		
		var flagPolicy = chkLoginPolicy(id,input_object);
		
		var queryString = "stfLoginId=" + id;
		if (id.length < 6) {
			document.getElementById("idcheckLayer").innerHTML = "<font color=red>6자리 이상 입력하세요.</font>";
		} 
		else if (flagPolicy == true){
			<%-- 1. XMLHttpReqeust 객체 생성 --%>
			createXhr();
			<%-- 2. 이벤트 핸들러 등록 --%>
			xhr.onreadystatechange = callback; 
			<%-- callback 함수를 등록
			// 3. open()를 통해 요청관련 설정을 설정 --%>
			xhr.open("POST", "/admins/staff/stfLoginIdCheck.mwav", true);
			<%-- 4. Header에 contentType 지정 - post --%>
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			<%-- 5. send()를 통해 요청 // 요청 쿼리를 보내준다. --%>
			xhr.send(queryString); 
		}


	}
	function callback() {
		if (xhr.readyState == 4) { // 응답을 다 받은 경우
			if (xhr.status == 200) { // 응답코드가 200인 경우 - 정상인 경우
				var resTxt1 = xhr.responseText; // 서버가 보낸 응답 text
				//console.log(resTxt);
				var resTxt = resTxt1.trim(); // 공백제거 안하면 같은게 안됨 
				var imsiresTxt = "<div class='alert alert-success text-left'><strong>사용할 수 있는 ID 입니다.</strong></div>";
				//alert(resTxt);
				//alert(imsiresTxt);
				if (resTxt == imsiresTxt) {
					//아이디 중복되지 않음
					//alert('1');
					document.getElementById("idcheckLayer").innerHTML = resTxt;
					
				} else {
					//아이디 중복
					//alert('11');
					document.getElementById("idcheckLayer").innerHTML = resTxt;

					$('input[name="mbrLoginId"]').val('');
					$('input[name="mbrLoginId"]').focus();
					return false;
				}
			} else {
				alert("요청 처리가 정상적으로 되지 않았습니다.\n" + xhr.status);
			}
		}
	}

	function msubmit() {

		var Zipcode = $('#Zipcode').val()
		var Address = $('#Address').val()
		var rest_address = $('#rest_Address').val()

		//html element에 대하여 null 또는 비어있는지 체크 및 alert 문구 노출
		var flag; // return false 여부 체크 이함수도 false 시켜야하므로 

		//flag 마지막 값만 인식하므로 수정이 필요하긴 함.
		//필수값은 아니다. 
		flag = emptyCheck(rest_address, "나머지 주소를 입력해주세요.");
		flag = emptyCheck(Zipcode, "우편번호를 입력해주세요.");
		flag = emptyCheck(Address, "주소를 입력해주세요.");

		 if (flag == false || flag == undefined) {
			return false;
		} else {
		 document.change_record.submit();
		}
		alert(flag);
		 $("change_record").validate({
		    submitHandler: function() {
		        if(confirm("회원가입을 완료하겠습니까?")){
		            return true;
		        } else {
		            return false;
		        }
		    },
		    //규칙
		    rules: {
		    	pmtLoginId: {
		            required : true,
		            minlength : 5,    
		        },
		        pmtLoginPw: {
		            required : true,
		            minlength : 10
		        },
		        pmtEmail: {
		            required : true,
		            minlength : 2,
		            email : true
		        }
		    },
		    //규칙체크 실패시 출력될 메시지
		    messages : {
		    	mbrLoginId: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            remote : "존재하는 아이디입니다"
		        },
		        mbrLoginPw: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
		        },
		        mbrEmail: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다",
		            email : "메일규칙에 어긋납니다"
		        }
		    }
		});	 

	}
</script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>

</head>

<body>
	<%--mwav는 container 영역만 쓰기때문에 그랬으나 이건 전체 쓴다. 그러므로 container로 감싸면 안된다.  --%>
	<!--  //////////////////////////////////// -->
	<jsp:include page="/Admins/AdminsHeader.jsp" flush="false" />
	<!--  //////////////////////////////////// -->




	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Admins <small> StfForm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Admins</li>
					<li>CompanyMgr</li>
					<li class="active">StfForm</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column left메뉴 추후 변경 예정<시작>-->
			<div class="col-md-3">
				<%-- 
			- param으로 같은 이름 지정시 위의 named으로 인식
			- getparameter는 param.mm // setattribute는 mm
			- value에 두개다 넣는 경우 비즈니스로직 + 파라미터인경우 문제발생
			- jsp param 안에 choose, when, otherwise 사용 불가
			 --%>
				<c:choose>
					<c:when test="${param.mm eq null}">
						<c:set value="${mm}" var="mm" />
					</c:when>
					<c:otherwise>
						<c:set value="${param.mm}" var="mm" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="/admins/LeftMenu.mwav" flush="false">
					<jsp:param name="mm" value="${mm}" />
				</jsp:include>
			</div>
			<!-- 끝 -->

			<div class="col-md-9">
				<!-- 소제목 -->
				<div class="col-lg-12">
					<h2 class="page-header">PromoterForm</h2>
				</div>
				<!-- ----- -->

				<!-- Content Column -->
				<div class="col-lg-12">

					<div class="row">

						<c:choose>
							<c:when test="${fn:length(updateStfForm) > 0}">

								<%-- 1. 회원정보 수정 --%>

								<form class='form-horizontal' method="post"
									action="/admins/staff/stfUpdate.mwav">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">Mwav - Staff Modify</h3>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-md-3 col-lg-3 " align="center">
														<img alt="User Pic"
															src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
															class="img-circle">
													</div>


													<div class=" col-md-9 col-lg-9 ">
														<table class="table table-user-information">
															<tbody>
																<tr>
																	<td>아이디:
																																			<a data-toggle="popover"
						data-placement="bottom" data-html="true" title="MemberId Rules"
						data-content="
	1. 4 ~ 20 자 사이의 문자길이  <br/>	
	2. 첫 문자는 영어로 시작  <br/>
	3. 특수문자 사용금지 (제외문자: . _ -) <br/>
	4. 공백문자 사용금지  <br/>
	5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음">

						<span class="glyphicon glyphicon-question-sign fa-lg text-muted">
					</span>
					</a>
																	
																	
																	
																	</td>

																	
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="stfLoginId"
																					id="chkLoginId" type='text' maxlength="20"
																					value="${updateStfForm.stfLoginId }"
																					readonly="readonly" onchange="idcheck()"
																					required>
																			</div>
																		</div></td>
																	<td>
																		
																	<p class="col-md-5 col-md-offset-4">
																<span id="idcheckLayer"></span>
																		</p>
																	</td>
																</tr>
																<tr>
																	<td>비밀번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="stfLoginPw"
																					type='password' id="chkLoginPW"
																					value="${updateStfForm.stfLoginPw }"
																					readonly="readonly" onchange="chkPWPolicy()"
																					required>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>사번:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class="form-control" name="stfNumber"
																					type="text" value="${updateStfForm.stfNumber}"
																					readonly="readonly" required />


																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>본사:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<select class='form-control' name="stfBranch"
																					value="${updateStfForm.stfBranch}" required>
																					<option value="본사">본사</option>
																					<option value="지사">지사</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>부서명:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<select class="form-control" name="stfDeptName"
																					value="${updateStfForm.stfDeptName}" required>
																					<option value="CEOs">CEOs</option>
																					<option value="관리">관리</option>
																					<option value="영업">영업</option>
																					<option value="총무">총무</option>
																					<option value="경리">경리</option>
																					<option value="고객지원">고객지원</option>
																					<option value="기획/개발">기획/개발</option>
																					<option value="마켓팅/영업">마켓팅/영업</option>
																					<option value="온라인프로모터">온라인프로모터</option>
																					<option value="임시">임시</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>직급/권한:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<select class="form-control" name="stfClass"
																					value="${updateStfForm.stfClass}" required>
																					<option value="0">*대기*</option>
																					<option value="05">임시</option>
																					<option value="10">사원</option>
																					<option value="15">주임</option>
																					<option value="20">계장</option>
																					<option value="25">대리</option>
																					<option value="30">실장</option>
																					<option value="35">팀장</option>
																					<option value="40">과장</option>
																					<option value="45">차장</option>
																					<option value="50">부부장</option>
																					<option value="55">부장</option>
																					<option value="60">소장</option>
																					<option value="65">이사</option>
																					<option value="70">상무이사</option>
																					<option value="75">전무이사</option>
																					<option value="80">대표이사</option>
																					<option value="85">회장</option>
																				</select>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>직원명:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfName"
																					value="${updateStfForm.stfName}" type="text"
																					maxlength="20" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>닉네임:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfNickname"
																					type="text" maxlength="20"
																					value="${updateStfForm.stfNickname}" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>회사 내선번호 Ext#:</td>
																	<td><div class='form-group'>
																			<div class='col-md-5'>
																				<input class="form-control" name="stfExtNbr"
																					type="text" maxlength="5"
																					value="${updateStfForm.stfExtNbr}"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>자택전화:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfPhone"
																					type="text" value="${updateStfForm.stfPhone}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
																					required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>핸드폰번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfCellularP"
																					type="text" value="${updateStfForm.stfCellularP}"
																					onkeypress='return event.charCode >= 48 && event.charCode <= 57' required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>이메일:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfEmail"
																					id="chkEmail" type="text"
																					value="${updateStfForm.stfEmail}"
																					onchange="chkEmailPolicy()" required />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>홈페이지:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfHomepage"
																					type="text" value="${updateStfForm.stfHomepage}"
																					placeholder="http:// " />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주민등록번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-4'>
																				<input class="form-control" name="stfSsn1"
																					type="text" maxlength="6"
																					value="${updateStfForm.stfSsn1}" />
																			</div>
																			<div class='col-md-4'>
																				<input class="form-control" name="stfSsn2"
																					type="text" maxlength="7"
																					value="${updateStfForm.stfSsn2}" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>등록일:</td>
																	<td>${updateStfForm.stfInsertDt}</td>
																</tr>
																<tr>
																	<td>입사일:</td>
																	<td>${updateStfForm.stfJoinDt}</td>
																</tr>
																<tr>
																	<td>부업무:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfSubJobs"
																					type="text" maxlength="200"
																					${updateStfForm.stfSubJobs} />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>우편번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" id="Zipcode"
																					name="stfZipcode" type="text" maxlength="6"
																					value="${updateStfForm.stfZipcode}"
																					readonly="readonly" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주소:</td>
																	<td>

																		<div class='form-group'>

																			<p class="col-md-3 pull-right">
																				<button class="btn btn-primary btn-block"
																					type="button" data-toggle="modal"
																					data-target=".modal_post" onclick="showhide();">주소찾기</button>

																			</p>
																			<!-- <div class='col-md-8'>
						<label><input type="radio" name="optradio" value="0">지번
							주소</label> <label><input type="radio" name="optradio" value="1">도로명
							주소</label>
					</div> -->

																			<div class='col-md-8'>
																				<input class="form-control" id="Address"
																					name="stfAddress_1" type="text"
																					value="${updateStfForm.stfAddress}"
																					placeholder='주소' readonly="readonly" />
																			</div>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfAddress_2"
																					type="text" placeholder='나머지 주소' required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="active">직원명함데이터:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfBusinessPic"
																					type="file" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td class="active">아바타:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="stfAvataImage"
																					type="file" />
																			</div>
																		</div></td>
																</tr>
																<tr class="info">
																</tr>
															</tbody>
														</table>
													</div>
													<div class="col-md-12 ">
														<div class='col-md-12 form-group center-block'>
															<textarea class="form-control" name="stfMark"
																class="stfMark" rows="15"> ${updateStfForm.stfMark} </textarea>
														</div>

													</div>
												</div>
												<div class="panel-footer">

													<button type="button" class="btn btn-sm btn-primary"
														onclick="javascript:window.location.href='/admins/staff/stfList.mwav'">
														리스트</button>

													<button type="button" class="btn btn-sm btn-primary"
														onClick="javascript:history.go(-1)">뒤로가기</button>

													<button type="submit" class="btn btn-sm btn-primary">수정하기
													</button>

												</div>

											</div>
										</div>
									</div>
								</form>


							</c:when>

							<c:otherwise>
								<%-- 1. 회원정보 입력 --%>
								<form class='form-horizontal' method="post" action="/admins/staff/pmtForm.mwav">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">Mwav - Staff Registration</h3>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class=" col-md-12 col-lg-12 ">
														<table class="table table-user-information">
															<tbody>
																<tr>
																	<td>아이디:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="pmtLoginId"
																					id="chkLoginId" type='text' maxlength="15"
																					onchange="idcheck()" required>
																	<br>
																	
																<span class="col-md-12" id="idcheckLayer"></span>
																					
																			</div>
																								<a data-toggle="popover"
																					data-placement="bottom" data-html="true" title="MemberId Rules"
																									data-content="
																				1. 4 ~ 20 자 사이의 문자길이  <br/>	
																				2. 첫 문자는 영어로 시작  <br/>
																				3. 특수문자 사용금지 (제외문자: . _ -) <br/>
																				4. 공백문자 사용금지  <br/>
																				5. 대소문자는 식별이 가능하나 구분 및 구별을 하지 않음">
																			
																					<span class="glyphicon glyphicon-question-sign fa-lg text-muted">
																				</span>
																				</a>	
																		</div>
																	</td>
																</tr>
															
																<tr>
																	<td>비밀번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>

																				<input class='form-control' name="pmtLoginPw"
																					id="chkLoginPW" type='password'
																					onchange="chkPWPolicy(this.value, this)" required>
																			</div>
															<a data-toggle="popover" data-placement="bottom" data-html="true" title="Password Rules"
																						data-content="
														1. 8~255자 사이의 문자길이  <br/>	
														2. 영문, 숫자, 특수문자로 구성 <br/>
														3. 특수문자 한 개 이상 꼭 포함 <br/>
														4. 공백문자 사용금지  <br/>
														5. 영문 대문자와 소문자의 구분 ">
													
																						<span class="glyphicon glyphicon-question-sign fa-lg text-muted"></span>
																					</a>	
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>이름:</td>
																	<td>
																		<div class='form-group'>
																			<div class='col-md-8'>
																				<input type="text" class='form-control' name="pmtName" maxlength="20" required>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>성별:</td>
																	<td>
																		<div class='form-group'>
																			<div class='col-md-4'>
																				<label for="pmtGenderMan">남</label> <input id="pmtGenderMan" name="pmtGender" type="radio" value="남성" checked />
																			</div>
																			<div class='col-md-4'>
																				<label for="pmtGenderWoman">여</label> <input id="pmtGenderWoman" name="pmtGender" type="radio" value="여성" />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>닉네임:</td>
																	<td>
																		<div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="pmtNickname" type="text" maxlength="20" required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>핸드폰번호:</td>
																	<td>
																		<div class='form-group'>
																			<div class='col-md-3'>
																				<input class="form-control" name="pmtCellularP_1"
																					type="text" maxlength="4" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required />
																			</div>

																			<div class="col-md-3">
																				<input class="form-control" name="pmtCellularP_2"
																					type="text" maxlength="4" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required />
																			</div>

																			<div class='col-md-3'>
																				<input class="form-control" name="pmtCellularP_3"
																					type="text" maxlength="4" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>이메일:</td>
																	<td>
																		<div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" name="pmtEmail" id="chkEmail" type="text"
																					onchange="chkEmailPolicy(this.value, this)" required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>우편번호:</td>
																	<td><div class='form-group'>
																			<div class='col-md-8'>
																				<input class="form-control" id="Zipcode"
																					name="pmtZipcode" type="text" maxlength="6"
																					value="" readonly="readonly" />
																			</div>
																		</div></td>
																</tr>
																<tr>
																	<td>주소:</td>
																	<td>

																		<div class='form-group'>

																			<p class="col-md-3 pull-right">
																				<button class="btn btn-primary btn-block"
																					type="button" data-toggle="modal"
																					data-target=".modal_post" onclick="showhide();">주소찾기</button>

																			</p>
																			<div class='col-md-8'>
																				<input class="form-control" id="Address" name="pmtAddress" type="text" value=""
																					placeholder='주소' readonly="readonly" />
																			</div>
																			<div class='col-md-8'>
																				<input class="form-control" name="pmtAddressDetail" id='rest_Address'type="text"
																					   placeholder='나머지 주소' required />
																			</div>
																		</div>
																	</td>
																</tr>
																<tr class="info">
																</tr>
															</tbody>
														</table>
													</div>
													<div class="col-md-12 ">
														<span class="col-md-2">하고 싶은 말</span>
														<div class='col-md-10 form-group center-block'>
															<textarea class="form-control" name="pmtMark"
																class="stfMark" rows="15">가입되신것을 환영합니다.</textarea>
														</div>

													</div>
												</div>
												<div class="panel-footer">
													<button type="button" class="btn btn-sm btn-primary" onclick="javascript:window.location.href='/admins/staff/pmtList.mwav'">리스트</button>
													<button type="button" class="btn btn-sm btn-primary" onClick="javascript:history.go(-1)">뒤로가기</button>
													<button onclick="msubmit()" type="submit" class="btn btn-sm btn-primary">가입하기</button>
												</div>

											</div>
										</div>
									</div>
								</form>

							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->


	<%-- 아래의 내용을 위에 주소 위치에 둘 경우 form태그가 해당위치로 닫힌다 form태그 중복 추후 확인 필요 --%>
	<jsp:include page="/CommonApps/PostSeek/PostSeek.jsp" flush="false" />
	
	
	<%-- <!-- --> 주석처리해도 include는 된다.  --%>
	<jsp:include page="/Admins/Goods/GdsUpLoader.jsp" flush="false" />
 

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/Admins/AdminsFooter.jsp" flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>


</body>

</html>

