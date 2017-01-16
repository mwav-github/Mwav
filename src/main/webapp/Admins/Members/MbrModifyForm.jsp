<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"
	type="text/javascript"></script>
<title>Insert title here</title>
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
				<form name="frmMember" method="post" action="/HomePage/mbrModify.mwav">
					<table id="Table5" cellspacing="0" cellpadding="0" width="810"
						border="0">
						<tr>
							<td bgcolor="#ffffff">
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
										<td width="22"><img height="27"
											src="/HomePage/Admins/zImages/admin_top009.gif" width="22" /></td>
										<td bgcolor="#f4f4f4">현재위치 : </td>
										<td width="10"><img height="27"
											src="../zImages/admin_top010.gif" width="10" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td bgcolor="#ffffff" height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#ffffff">
								<table cellspacing="0" cellpadding="0" width="800" border="0">
									<tr>
										<td width="176"><img width="176" height="53"
											src="/HomePage/Admins/Members/Images/member_004.gif" /></td>
										<td
											background="/HomePage/Admins/Members/Images/member_005.gif">&nbsp;

										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td bgcolor="#ffffff">&nbsp;</td>
						</tr>
						<tr valign="top" align="center" bgcolor="#ffffff">
							<td height="300">

								<table cellspacing="0" cellpadding="0" width="780" border="0">


									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" width="780" border="0">

												<tr>
													<td width="297" valign="top">
														<table cellspacing="1" cellpadding="2" width="100%"
															border="0">
															<c:forEach var="List" items="${List }">

																<tr>
																	<td class="Bwhite" align="center" bgcolor="#005983"
																		colspan="2" height="25">기본정보</td>
																</tr>
																<%-- 같은 때만 뽑겠다 ! --%>
																<tr>
																	<td width="33%" height="22" bgcolor="#3a8bb1"
																		class="Bwhite">&nbsp;회원번호</td>
																	<td width="67%">&nbsp; <c:set var="m_Id"
																			value="${m_Id}" /> <c:out value="${m_Id}" /> <input
																		type="hidden" name="m_Id" value="${m_Id}">
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;로그인아이디</td>
																	<td>&nbsp; <input type="text" name="mbrLoginId"
																		value="${List.mbrLoginId}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;로그인암호</td>
																	<td>&nbsp; <input type="text" name="mbrLoginPw"
																		value="${List.mbrLoginPw}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;회원명</td>
																	<td>&nbsp; <input type="text" name="mbrName"
																		value="${List.mbrName}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" style="height: 22px"
																		bgcolor="#3a8bb1" height="22">&nbsp;핸드폰번호</td>
																	<td style="height: 22px">&nbsp; <input
																		name="mbrCellularP" type="text" value="${List.mbrCellularP}" />&nbsp;

																	</td>
																</tr>
		                                                         </c:forEach> 
            
            <c:forEach var="Option1" items="${Option }">														<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;연락전화번호</td>
																	<td>&nbsp; <%--       <c:set var="mbrCellularP" value="${List.mbrCellularP}" />

                                             
       <c:forTokens var="mbrCellularP" items="${mbrCellularP}" delims="-">
        <input name="mbrCellularP" type = "text" value="${mbrCellularP}"   maxlength="4" size="3"/>&nbsp;
           </c:forTokens> --%> <input name="mbrPhone" type="text"
																		value="${Option1.mbrPhone}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;이메일</td>
																	<td>&nbsp; <input type="text" name="mbrEmail"
																		value="${Option1.mbrEmail}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;주민등록번호</td>
																	<td>&nbsp; <input name="mbrSsn1" type="text"
																		value="${Option1.mbrSsn1}" size="7" maxlength="6" /> - <input
																		name="mbrSsn2" type="text" value="${Option1.mbrSsn2}"
																		size="7" maxlength="7" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;주소</td>
																	<td>&nbsp; <input type="text" name="mbrAddress"
																		value="${Option1.mbrAddress}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;뉴스레더신청</td>
																	<td>&nbsp; <input type="text" name="mbrMailing"
																		value="${Option1.mbrMailing}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;PW찾기질문</td>
																	<td>&nbsp; <input type="text" name="mbrFindingId"
																		value="${Option1.mbrFindingId}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;PW찾기답</td>
																	<td>&nbsp; <input type="text" name="mbrFindingA"
																		value="${Option1.mbrFindingA}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;FakeMember</td>
																	<td>&nbsp; 
																	</td>
																</tr>
															
			</c:forEach>													</table>
													</td>
													<td width="483" valign="top">
														<table cellspacing="1" cellpadding="2" width="100%"
															border="0">
															<c:forEach var="Value" items="${Value }">
																<tr>
																	<td class="Bwhite" align="center" bgcolor="#005983"
																		colspan="2" height="25">평가치</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;회원등급</td>
																	<td>&nbsp; <input type="text" name="mbrLevel"
																		value="${Value.mbrLevel}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;누적구매액/횟수</td>
																	<td>&nbsp; <input type="text" name="mbrHowMuch"
																		value="${Value.mbrHowMuch}" /> &nbsp;/ <input
																		type="text" name="mbrHowMany"
																		value="${Value.mbrHowMany}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;현재/누적적립금&nbsp;</td>
																	<td>&nbsp; <input type="text" name="mbrRsvFund"
																		value="${Value.mbrRsvFund}" /> &nbsp;/ <input
																		type="text" name="mbrRsvFundAc"
																		value="${Value.mbrRsvFundAc}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;현재/누적포인트</td>
																	<td>&nbsp; <input type="text" name="mbrPoint"
																		value="${Value.mbrPoint}" /> &nbsp;/ <input
																		type="text" name="mbrPointAc"
																		value="${Value.mbrPointAc}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;미지불금액</td>
																	<td>&nbsp; <input type="text" name="mbrUnpaid"
																		value="${Value.mbrUnpaid}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;누적미지불금액</td>
																	<td>&nbsp; <input type="text" name="mbrUnpaidAc"
																		value="${Value.mbrUnpaidAc}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;추천인ID</td>
																	<td>&nbsp; <input type="text" name="mbrRcmderId"
																		value="${Value.mbrRcmderId}" />
																	</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;가입일</td>
																	<td>&nbsp; ${Value.mbrJoinDt}</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;수정일</td>
																	<td>&nbsp; ${Value.mbrModifyDt}</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;최근방문일</td>
																	<td>&nbsp; ${Value.mbrRecentLoginDt}</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;최근IP</td>
																	<td>&nbsp; ${Value.mbrIpAddress}</td>
																</tr>
																<tr>
																	<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																		&nbsp;탈퇴일</td>
																	<td>&nbsp; ${Value.mbrLeaveDt}</td>
																</tr>
															</c:forEach>
														</table>
													</td>
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
										<td height="5"></td>
									</tr>
									<tr>
										<td class="Bwhite" align="center" bgcolor="#005983"
											height="25">부가정보</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" width="780" border="0">
												<c:forEach var="Job" items="${Job }">
													<c:forEach var="Option" items="${Option }">
														<c:if test="${Job.m_Id == Option.m_Id}">
															<tr>
																<td valign="top">
																	<table cellspacing="1" cellpadding="2" width="100%"
																		border="0">
																		<tr>
																			<td class="Bwhite" align="center" bgcolor="#3a8bb1"
																				height="25">아바타이미지</td>
																		</tr>
																		<tr>
																			<td valign="middle" align="center" height="200">
																				<img id="avataImage" width="176" height="53"
																				src="/HomePage/xUpload/MbrData/Avata/AvaPic_default.gif" />
																			</td>
																		</tr>
																	</table>
																</td>
																<td valign="top">
																	<table cellspacing="1" cellpadding="2" width="100%"
																		border="0">
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;홈페이지</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrHomepage" value="${Option.mbrHomepage}" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;메신져</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrMessengerName"
																				value="${Option.mbrNickname}" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;취미&nbsp;</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrHobbies" value="${Option.mbrHobbies}" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;차량정보</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrCarInfo" value="${Option.mbrCarInfo}" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;생일</td>
																			<td>&nbsp; <input type="text" name="litBirthDay"
																				value="${Option.mbrCarInfo}" />
																			</td>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;결혼기념일</td>
																			<td>&nbsp; <input type="text"
																				name="litWeddingDay" value="" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;월급</td>
																			<td>&nbsp; <input type="text"
																				name="mbrMonthlyPay" value="${Option.mbrMonthlyPay}" />
																			</td>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;자녀수</td>
																			<td>&nbsp; <input type="text" name="mbrChildren"
																				value="${Option.mbrChildren}" /></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;

																			</td>
																			<td bgcolor="#3a8bb1" colspan="3">&nbsp;<span
																				class="Bwhite">남기고 싶은 말 </span>
																			</td>
																		</tr>
																		<tr>
																			<td colspan="4" height="22">
																				<div class="ContentBreak">
																					<textarea name="mbrMark" rows="10" cols="50">
                                                              ${Option.mbrMark}                                                </textarea>

																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;

																			</td>
																			<td bgcolor="#3a8bb1" colspan="3">&nbsp;<span
																				class="Bwhite">회사정보</span>
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;회사명</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrCompany" value="${Job.mbrCompany}" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;직업명</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrJobType" value="${Job.mbrJobType}" /></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;연락번호</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrOfficePhone" value="${Job.mbrOfficePhone}" />
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;회사주소</td>
																			<td colspan="3">&nbsp; <input type="text"
																				name="mbrOfficeAddress"
																				value="${Job.mbrOfficeAddress}" />

																			</td>
																		</tr>

																	</table>

																</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:forEach>
											</table>
										</td>
									</tr>

									<tr>
										<td height="5"></td>
									</tr>
									<tr>
										<td bgcolor="#005983" height="2"></td>
									</tr>

								</table>

								<table cellspacing="0" cellpadding="0" width="98%" border="0">
									<tr>
										<td align="right" height="30">&nbsp;</td>
									</tr>
									<tr>
										<td align="center" height="50">
											<button type="button" name="hiList"
												style="border: solid 0px #FFFFFF;"
												onclick="javascript:window.location.href='/HomePage/mbrList.mwav'">
												<img src="/HomePage/Admins/zImages/btn_view_list.gif"
													border="0">
											</button>&nbsp;
											<button type="button" name="hiBack"
												style="border: solid 0px #FFFFFF;" onClick="javascript:history.go(-1)">
												<img src="/HomePage/Admins/zImages/btn_admin_back.gif"
													border="0" >
											</button>&nbsp;
											<button type="submit" name="ibModfy"
												style="border: solid 0px #FFFFFF;">
												<img src="/HomePage/Admins/zImages/btn_admin_modify.gif"
													border="0">
											</button>
											</td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
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