<!-- 
/* 

========jsp페이지의 용도 및 설명(호출 부분 명시)==========
용도 : 회원등록 form

========유의사항=========
1.primarykey 100000에서 부터 시작 1부터 시작하면 유동등에 제한이 많다.
2.우편번호는 주소와 , 상세주소를 동시에 mbrAddress 필드에 들어간다.
3.부가정보 이전까지 필수정보 
  이후는 부가정보 입력버튼(토글형태) 누르면 나온다.
4.자녀수는 byte이므로 입력에 숫자 제한이있다.
   범위 -127 ~ 128
5.취미 및 운동분야는 다양한 선택이 가능하도록 checkbox로 구현
  그러나 직업군 같은 경우는 radio 로 하나 선택가능
6.textarea는 마우스 클릭시 내용을 입력하세요는 사라진다.

========과정에 대한 설명=========
1.해당 창 Load 
2.값 입력
3.등록버튼 누를경우
  (mbrForm.jsp => InputCheck(Script.js) 조건만족시 폼 submit
   =>MbrFormProcess.mwav => A_MbrFormProcessAction() 등록 후 
    DefaultFrame.jsp (메인화면)

========일자 별 설명=========

 순번  |    요일    |             내용              |     
ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  1.      13 03,23     수정 및 설명
  2.
  3.
  4.
  5.

*/
 -->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript" src="/HomePage/Admins/Members/script.js"></script>
<script language="javascript"
	src="/HomePage/Admins/Members/popupcalendar.js"></script>

<!-- 스크립트 script.js 안된다. // 절대경로로 써줘야 된다 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/CommonApps/Calendar/DateSelector/popcalendar.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">

<script>

  $(function() {

    $( "#datepicker" ).datepicker({

      showOn: "button",

      buttonImage: "/HomePage/common-img/calendar.gif",

      buttonImageOnly: true

    });

  });

$(function() {

    $( "#datepicker2" ).datepicker({

      showOn: "button",

      buttonImage: "/HomePage/common-img/calendar.gif",

      buttonImageOnly: true

    });

  });
  </script>




<title>The Members Management</title>
</head>
<body>
	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3">&nbsp; <%@ include file="/Admins/TopFrame.jsp"%>
				<%-- 첫번째--%></td>
		</tr>
		<tr>
			<td width="200" valign="top"><table width="190" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="10"><%@ include file="/Admins/LeftFrame.jsp"%>
							<%-- 두번째--%></td>
					</tr>
				</table></td>


			<td width="10">&nbsp;</td>
			<td valign="top">&nbsp; <%-- 세번째--%>
				<form name="frmMbr" method="post"
					action="/HomePage/MbrFormProcess.mwav">
					<table cellspacing="0" cellpadding="0" width="815" border="0">
						<tr>
							<td bgcolor="#ffffff" align="left">
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
										<td width="22"><img height="27"
											src="/HomePage/Admins/zImages/admin_top009.gif" /></td>
										<td bgcolor="#f4f4f4">현재위치 :</td>
										<td width="10"><img height="27"
											src="/HomePage/Admins/zImages/admin_top010.gif" width="10" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr valign="top" align="center" bgcolor="#ffffff">
							<td height="20">&nbsp;</td>
						</tr>
						<tr valign="top" align="center" bgcolor="#ffffff">
							<td height="150">
								<table cellspacing="0" cellpadding="0" width="800" border="0">
									<tr>
										<td width="176"><img width="176" height="53"
											src="/HomePage/Admins/Members/Images/member_006.gif" /></td>
										<td background="Images/member_005.gif">&nbsp;</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="780" border="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" cellpadding="2" width="100%"
												border="0">
												<tr>
													<td class="Bwhite" align="center" bgcolor="#005983"
														colspan="4" height="10">
														<p></p>
														<p>
														<h3>기 본 정 보</h3>

													</td>
												</tr>
												<tr>
													<td width="16%" height="22" bgcolor="#3a8bb1"
														class="Bwhite" align="center"><b> &nbsp;회원번호 </b></td>
													<td width="30%" align="left"><input type="hidden"
														name="m_Id" value="${session.m_Id}">
													<%--나중에 바꿔줘야한다 100000부터 시작 --%> <%--1 --%> <c:out
															value="${m_Id}" /></td>
													<td width="17%" bgcolor="#3a8bb1" class="Bwhite"
														align="center"><b>주민등록번호</b></td>
													<td width="37%" align="right"><input type="text"
														name="mbrSsn1" maxlength="6" value="" size="17">
														&nbsp;-&nbsp; <%--12번 --%> <input type="password"
														name="mbrSsn2" maxlength="7" value="" size="17"> <%--13번 --%>
														&nbsp; 앞자리 주민번호 입력 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														뒷자리 주민번호를 입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

														<p></p> <input type="button" name="btnSSN" size="25"
														height="30px" align="right" value="주민번호확인"> <br />
													</td>
												</tr>
												<tr>
													<td class="Bwhite" bgcolor="#3a8bb1" height="56"
														align="center"><b>로그인아이디</b></td>
													<td align="left"><input type="text" name="mbrLoginId"
														maxlength="15" size="15" /> <%-- 2번 --%> &nbsp;&nbsp;<input
														name="bnLoginID" type="button" value="중복확인"
														onClick="idCheck()" /><br />


														영문자로 시작하여 3자 이상 15자 까지입니다.</td>
													<td class="Bwhite" bgcolor="#3a8bb1" rowspan="2"
														align="center"><b>주소||상세주소</b></td>
													<!-- 8번 -->
													<td align="left">&nbsp;우편번호찾기 <br />&nbsp;<input
														name="mbrZipcode" type="text" value="동이름을 입력하세요." /> <input
														type="button" value="찾기" onclick="zipCheck()" />
													</td>
												</tr>
												<tr>
													<td class="Bwhite" bgcolor="#3a8bb1" height="78"
														align="center"><b>로그인암호</b></td>
													<td align="left">
														<p>
															<input name="mbrLoginPw" type="password" value=""
																maxlength="15" />

															<!-- 3번 -->
															비밀번호입력
														</p> <input name="mbrLoginPw2" type="password" value=""
														maxlength="15" /> <!-- 3번 --> 비밀번호재입력
														<p>(공백없이 4자 이상 15자 이하를 입력하세요.)</p>
													</td>
													<td align="left"><input type="text" name="mbrAddress"
														size="30" /> &nbsp;&nbsp;&nbsp;(주소입력)<br />
													<br /> <!-- 9번 -->
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상세주소입력)
														<input type="text" name="mbrAddress2" width="100" /></td>
												</tr>
												<tr>
													<td class="Bwhite" style="height: 22px" bgcolor="#3a8bb1"
														height="22" align="center"><b>회원명</b></td>
													<td style="height: 22px"><input name="mbrName"
														type="text" value="" /> <%-- 4번 --%></td>
													<td class="Bwhite" bgcolor="#3a8bb1" align="center"><b>뉴스레더신청</b>
													</td>
													<td style="height: 22px" align="center">
														<%--15번 --%> <input name="mbrMailing" type="checkbox"
														checked />(신청시
														check) <%--check은 true이다.--%>
													</td>
												</tr>
												<tr>
													<td class="Bwhite" bgcolor="#3a8bb1" height="22"
														align="center"><b>연락전화번호</b></td>
													<td><input name="mbrPhone1" type="text" value=""
														MaxLength="4" size="5" /> <%--세개 함쳐서 6번 --%> - <input
														name="mbrPhone2" type="text" value="" MaxLength="4"
														size="5" /> - <input name="mbrPhone3" type="text" value=""
														MaxLength="4" size="5" /></td>
													<td class="Bwhite" bgcolor="#3a8bb1" align="center"><b>PW찾기질문</b>
													</td>
													<td><select name="mbrFindingId">
															<%--10번 --%>
															<option value="0">학창시절 가장 무서웠던 선생님은?
															<option value="10">가장 생각나는 여자친구 이름은?
															<option value="20">죽기전에 해보고 싶은 것은?
															<option value="30">꼭 가고 싶은 나라 이름은?
															<option value="40">화가났을 때 참는방법은?</option>
													</select></td>
												</tr>
												<tr>
													<td class="Bwhite" bgcolor="#3a8bb1" height="22"
														align="center"><b>핸드폰번호</b></td>
													<td><input name="mbrCellularP1" type="text" value=""
														MaxLength="4" size="5" /> <%--세개 합쳐서 7번 --%> - <input
														name="mbrCellularP2" type="text" value="" MaxLength="4"
														size="5" /> - <input name="mbrCellularP3" type="text"
														value="" MaxLength="4" size="5" /></td>
													<td class="Bwhite" bgcolor="#3a8bb1" align="center"><b>PW찾기답</b>
													</td>
													<td align="center"><input name="mbrFindingA"
														type="text" value="" width="40" /> <%--11번 --%></td>
												</tr>
												<tr>
													<td class="Bwhite" bgcolor="#3a8bb1" height="22"
														align="center"><b>이메일</b></td>
													<td><input name="mbrEmail" type="text" value=""
														width="100%" /> <!-- 5번 --></td>
													<td class="Bwhite" bgcolor="#3a8bb1" align="center"><b>추천인아이디</b>
													</td>
													<td><input type="text" name="rcmderID" maxlength="15" />


														&nbsp;&nbsp;<input name="bnLoginID" type="button"
														value="검사" onClick="idCheck(this.form.loginID.value)" /><br />


														영문자로 시작하여 3자 이상 15자 까지입니다.</td>
												</tr>
												<tr>
													<td height="39" align="center" bgcolor="#3a8bb1"
														class="Bwhite"><b>Ipin번호</b>
													<td><input name="mbrIpin" type="text" width="80%" />
														<!-- 14번 --></td>
													<td class="Bwhite" bgcolor="#3a8bb1" align="center"><b>SMS
															송신가능여부</b></td>
													<td align="center"><input name="mbrSms" type="radio"
														value="1" />(수신) <%--1은 true이다.--%> <input name="mbrSms"
														type="radio" value="0" />(비수신)</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="2"></td>
									</tr>
									<tr>
										<td height="2" bgcolor="#aaaaaa"></td>
									</tr>
									<tr>
										<td height="20"></td>
									<tr>

										<td>
											<table cellspacing="0" cellpadding="0" width="100%"
												border="0">
												<tr>
													<td width="10%" height="30" align="center"
														bgcolor="#005983" class="Bwhite">&nbsp;</td>
													<td width="90%" colspan="3" align="center"
														bgcolor="#005983" class="Bwhite"><img height="20"
														width="73" src="/HomePage/Admins/zImages/btn_add_info.gif"
														onClick="LayerView('table1');" /></td>
												</tr>
												<tr>
													<td colspan="3">
														<table cellspacing="0" cellpadding="0" id="table1"
															width="780" border="0" style="visibility: hidden">
															<tr>
																<td width="218" valign="top">
																	<table cellspacing="1" cellpadding="2" width="100%"
																		border="0">
																		<tr>
																			<td class="Bwhite" align="center" bgcolor="#3a8bb1"
																				height="25"><b>회원등급</b></td>
																		</tr>
																		<tr>
																			<td align="center" height="35">&nbsp; <select
																				name="mbrLevel">
																					<%--10번 --%>
																					<option value="101">주주
																					<option value="50">최우수(플래티늄)
																					<option value="40">최우수(골드)
																					<option value="30">최우수(실버)
																					<option value="20">우수회원
																					<option value="10">정회원
																					<option value="0">불량회원
																					<option value="-10">탈퇴회원</option>
																			</select>
																			</td>
																		</tr>
																	</table>
																	<table cellspacing="1" cellpadding="2" width="100%"
																		border="0">
																		<tr>
																			<td class="Bwhite" align="center" bgcolor="#3a8bb1"
																				height="25"><b>아바타이미지</b></td>
																		</tr>
																		<tr>
																			<td valign="middle" align="center" height="300">
																				<img height="156" width="135"
																				src="/HomePage/xUpload/MbrData/Avata/AvaPic_default.gif" />

																			</td>
																		</tr>
																		<tr>
																			<td valign="middle" align="left"><input
																				language="C#" class="box003" id="bnAvataImage"
																				type="file" size="22" name="file" />
																				&nbsp;(512K미만)</td>
																		</tr>
																	</table>
																</td>
																<td width="562" valign="top">
																	<table cellspacing="1" cellpadding="2" width="100%"
																		border="0">
																		<tr>
																			<td width="120" height="22" align="center"
																				bgcolor="#3a8bb1" class="Bwhite"><b>홈페이지</b></td>
																			<td colspan="3">&nbsp;http:// <input
																				name="mbrHomepage" type="text" value="" size="30" />
																			</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite"><b>닉네임</b></td>
																			<td><input type="text" name="mbrNickname"
																				maxlength="15" size="15" /> <%-- 2번 --%>
																				&nbsp;&nbsp; <input name="bnNickname" type="button"
																				value="중복"
																				onClick="nickNameCheck(this.form.mbrNickname.value)" />
																				<br /> 영문자로 시작하여 3자 ~ 15자 까지입니다.</td>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;<b>차량<br />&nbsp;종류
																			</b>
																			</td>
																			<td><select name="mbrCarInfo">
																					<%--10번 --%>
																					<option value="0">경차(1000cc미만)
																					<option value="10">소형차(1600cc미만)
																					<option value="20">중형차(2000cc미만)
																					<option value="30">대형차(2000cc이상)
																			</select></td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite"><b>생일</b></td>
																			<td colspan="3">&nbsp; Date: <input type="text"
																				name="BirtdayDate" id="datepicker" value="">
																			</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite"><b>결혼기념일</b></td>
																			<td>&nbsp; <input name="mbrWedding" type="radio"
																				value="1" />(미혼) <%--1은 true이다.--%> <input
																				name="mbrWedding" type="radio" value="0" />(기혼)
																			</td>
																			<td colspan="2">Date: <input type="text"
																				name="WeddingDate" id="datepicker2" size="15"
																				value="">
																			</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite"><b>자녀수</b></td>
																			<td><input type="text" name="mbrChildren"
																				width="100" /></td>
																			<td class="Bwhite" height="22">&nbsp;</td>
																			<td>&nbsp;</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite"><b>메신져명</b></td>
																			<td><input type="text" name="mbrMessengerName"
																				width="100" /></td>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">

																				<b>메신져</b> <b>아이디</b>
																			</td>
																			<td><input type="text" name="mbrMessengerId"
																				width="100" /></td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite"><b>취미 및<br /> &nbsp;관심분야
																			</b></td>
																			<td colspan="3"><span class="Bwhite"> </span>
																				&nbsp;<input name="mbrHobbies" type="checkbox"
																				value="영화감상;" />영화감상&nbsp;&nbsp; <input
																				name="mbrHobbies" type="checkbox" value="운동;" />운동&nbsp;&nbsp;<input
																				name="mbrHobbies" type="checkbox" value="독서;" />독서&nbsp;&nbsp;<input
																				name="mbrHobbies" type="checkbox" value="드라이브;" />드라이브
																				&nbsp;&nbsp;<input name="mbrHobbies" type="checkbox"
																				value="음악감상;" />음악감상<br /> &nbsp;<input
																				name="mbrHobbies" type="checkbox" value="수면;" />수면&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
																				name="mbrHobbies" type="checkbox" value="게임;" />게임&nbsp;&nbsp;
																				<input name="mbrHobbies" type="checkbox" value="여행;" />여행&nbsp;&nbsp;<input
																				name="mbrHobbies" type="checkbox" value="음주가무;" />음주가무&nbsp;&nbsp;

																			</td>
																		</tr>
																		<tr>

																			<td bgcolor="#3a8bb1" colspan="4" align="center"
																				height="50">&nbsp;<span class="Bwhite"><b>남기고
																						싶은 말</b> </span>
																			</td>
																		</tr>
																		<tr>
																			<td align="center" colspan="4" height="22"><textarea
																					name="mbrMark" rows="10" cols="70"
																					onclick="if(this.value==this.defaultValue){this.value=''}"
																					onblur="if (this.value == '') { this.value = this.defaultValue;">내용을 입력하세요 
                                                                    </textarea></td>
																		</tr>
																		<tr>
																		<tr>
																		<tr>

																			<td bgcolor="#3a8bb1" colspan="4" align="center"
																				height="50">&nbsp;<span class="Bwhite"><b>회사정보</b></span>
																			</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite">&nbsp;<b>회사명 </b>
																			</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrCompany" width="100" />
																			</td>
																		</tr>
																		<tr>
																			<td height="20" align="center" bgcolor="#3a8bb1"
																				class="Bwhite" style="height: 20px">&nbsp;<b>직업군
																			</b>
																			</td>
																			<td colspan="3">&nbsp;<input name="mbrJobType"
																				type="radio" value="관리자" />관리자&nbsp;&nbsp; <input
																				name="mbrJobType" type="radio" value="전문가 및 관련 종사자" />전문가
																				및 관련 종사자&nbsp;&nbsp;<input name="mbrJobType"
																				type="radio" value="사무종사자" />사무종사자&nbsp; <input
																				name="mbrJobType" type="radio" value="서비스 종사자" />
																				&nbsp;서비스 종사자 <br />&nbsp;&nbsp;<input
																				name="mbrJobType" type="radio" value="판매 종사자" />판매
																				종사자 &nbsp;&nbsp;<input name="mbrJobType"
																				type="radio" value="농림어업 숙련 종사자" />농림어업 숙련
																				종사자&nbsp;&nbsp;<input name="mbrJobType" type="radio"
																				value="기능원 및 관련 기능 종사자" />기능원 및 관련 기능
																				종사자&nbsp;&nbsp;&nbsp;&nbsp; <br />
																			<input name="mbrJobType" type="radio"
																				value="장치 기계조작 및 조립종사자" />장치 기계조작 및
																				조립종사자&nbsp;&nbsp;<input name="mbrJobType"
																				type="radio" value="단순노무 종사자" />단순노무
																				종사자&nbsp;&nbsp; <input name="mbrJobType"
																				type="radio" value="군인" />군인&nbsp;&nbsp;



																			</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite">&nbsp;<b>연락번호 </b>
																			</td>
																			<td colspan="3">&nbsp; <input
																				name="mbrOfficePhone1" type="text" value=""
																				MaxLength="3" size="4" /> - <input
																				name="mbrOfficePhone2" type="text" value=""
																				MaxLength="4" size="5" /> - <input
																				name="mbrOfficePhone3" type="text" value=""
																				MaxLength="4" size="5" />
																			</td>
																		</tr>
																		<tr>
																			<td height="22" align="center" bgcolor="#3a8bb1"
																				class="Bwhite" rowspan="3">&nbsp;<b>회사주소</b>
																			</td>
																			<td colspan="3" align="left">&nbsp; 우편번호찾기 <br />&nbsp;<input
																				name="mbrOfficeZipcode" type="text"
																				value="동이름을 입력하세요." /> <input type="button"
																				value="찾기" onclick="zipCheck()" />
																			</td>
																		</tr>
																		<tr>

																			<td colspan="3" rowspan="2" height="22" align="left">
																				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
																				type="text" name="mbrOfficeAddress" size="30" />
																				&nbsp;&nbsp;&nbsp;(주소입력)<br />
																			<br /> <!-- 9번 -->
																				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상세주소입력)
																				<input type="text" name="mbrOfficeAddress2"
																				width="100" />
																			</td>
																		</tr>
																		<tr>


																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td bgcolor="#005983" colspan="3" height="2"></td>
												</tr>

												<tr>
													<td colspan="3" height="30">&nbsp;</td>
												</tr>
											</table>
										</td>

									</tr>



									<tr>
										<td align="center" bgcolor="#ffffff" height="31">
											<button type="button" name="hiList"
												style="border: solid 0px #FFFFFF;"
												onclick="javascript:window.location.href='/HomePage/Admins/Members/MbrList.jsp?BirtdayDate=${BirtdayDate}'">
												<img src="/HomePage/Admins/zImages/btn_view_list.gif"
													border="0">
											</button>
											<button type="button" name="hiBack"
												style="border: solid 0px #FFFFFF;" onClick="javascript:history.go(-1)">
												<img src="/HomePage/Admins/zImages/btn_admin_back.gif"
													border="0">
											</button>
											<button type="button" name="iblInsert"
												style="border: solid 0px #FFFFFF;" onclick="inputCheck()">
												<img src="/HomePage/Admins/zImages/admin_btn_enter.gif"
													border="0">
											</button>
											<button type="button" name="iblUpdate"
												style="border: solid 0px #FFFFFF;"
												onclick="javascript:window.location.href='/HomePage/mbrList.mwav'">
												<img src="/HomePage/Admins/zImages/btn_admin_modify.gif"
													border="0">
											</button>

										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>

			</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp; <%@ include
					file="/Admins/BottomFrame.jsp"%> <%-- 네번째--%>
			</td>
		</tr>
	</table>
</body>
</html>
