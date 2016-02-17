<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/Admins/Members/script.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript"
	src="/HomePage/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script>

var mailsys="쇼핑몰 관리자 mail";

var author="Kim Jusung";

if (author == "Kim Jusung"){

	phrompt=prompt;

	snarkconf=confirm;

}

function mailsome1(){


	who=phrompt("발송하실 메일주소를 입력하세요: ","mymg99@naver.com");


	what=phrompt("발송하실 주제를 입력하세요.: ","물품 교환관련 이메일");


	if (snarkconf(" "+who+" 보내는이와, \n"+what+"주제가 확실합니까? ")==true){


		parent.location.href='mailto:'+who+'?subject='+what+'';

	}

}
//참고) 관리자에게 http://blog.daum.net/_blog/BlogTypeView.do?blogid=0AynA&articleno=3439565&categoryId=209037&regdt=20060602114817
	//	메일 보내기
/*
function my_search()
{
	
   form = document.frmMbr;

   var searchflag = form.searchflag.value; 
   var ddlSearch = form.ddlSearch.value;
   var tbSearchString = encodeURIComponent(form.tbSearchString.value); 
   form.searchflag.vaule = searchflag;
   form.ddlSearch.vaule = ddlSearch;
   form.tbSearchString.vaule = tbSearchString;
   
   
   document.frmMbr.submit();
   var url = "/HomePage/mbrList.do?searchflag="+searchflag+"&ddlSearch="+ddlSearch+"&tbSearchString="+tbSearchString;
   //var encodeurl = encodeURIComponent(url);
   alert(url);
   
   document.location.href = url; 
   
}

function my_searchLevel()
{
   
   var ddlSelMenu = form.options[form.selectedIndex].value;
   var searchflag = document.frmMbr.searchflag.value; 
   if(url !=""){
   var url = "/HomePage/mbrList.do?ddlSelMenu="+ddlSelMenu+"&searchflag="+searchflag;
   }
   //var encodeurl = encodeURIComponent(url);
   alert(url);
   
   document.location.href = url;
	z
	document.frmMbr.submit();
} 
*/
</script>

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
				<form name="frmMbr" method="post" action="/HomePage/mbrValList.do">
					<table cellspacing="0" cellpadding="0" width="815" border="0">
						<tr>
							<td colspan="2">
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
										<td width="22"><img height="27"
											src="/HomePage/Admins/zImages/admin_top009.gif" width="26" /></td>
										<td bgcolor="#f4f4f4">현재위치 :</td>
										<td width="10"><img height="27"
											src="/HomePage/Admins/zImages/admin_top010.gif" width="10" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" height="20">&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<table id="Table5" cellspacing="0" cellpadding="0" width="100%"
									bgcolor="#ffffff" border="0">
									<tr>
										<td valign="top" align="center" height="300">
											<table height="49" cellspacing="0" cellpadding="0"
												width="800" border="0">
												<tr>
													<td width="204"><img height="49"
														src="/HomePage/Admins/Members/Images/member_009.gif"
														width="204" /></td>
													<td
														background="/HomePage/Admins/Members/Images/member_002.gif">
														<table id="Table1" cellspacing="0" cellpadding="0"
															width="98%" border="0">
															<tr>
																<td valign="bottom" align="left" colspan="3" height="25">
																	<table cellspacing="0" cellpadding="0" width="100%"
																		border="0">
																		<tr>
																			<td width="72%"><select name="ddlSearch">
																					<option value="mbrName">회원명
																					<option value="mbrLevel">회원등급(숫자)
																					<option value="mbrHowMuch">누적구매액(숫자)
																					<option value="mbrRsvFundAc">누적적립금(숫자)
																					<option value="mbrPointAc">누적포인트(숫자)
																					<option value="mbrUnpaidAc">누적미지불금액(숫자)
																					<option value="m_Id" selected>회원번호</option>
																			</select> <input type="text" name="tbSearchString"
																				maxlength="8" value="검색 키워드" size="25" /> <input
																				type="hidden" name="searchflag" value="false" /> <input
																				name="btnSearch" type="submit" value="검색" /> <%--검색창 http://javaclass1.tistory.com/95
               http://www.devpia.com/Maeul/Contents/Detail.aspx?BoardID=56&MaeulNo=22&no=66203&ref=66203
            --%></td>
																			<td width="28%" align="right">
																				<%-- http://snix.tistory.com/557 --%> <select
																				name="ddlSelMenu">
																					<option value="255"
																						<c:if test="${searchflag eq null  && ddlSelMenu == '255' && ddlSelMenu == false}"> selected </c:if>>
																						전 회원</option>

																					<option value="101"
																						<c:if test="${ddlSelMenu == '101'}">selected </c:if>>주주
																					</option>

																					<option value="50"
																						<c:if test="${ddlSelMenu == '50'}">selected</c:if>>최우수(플래티늄)
																					</option>
																					<option value="40"
																						<c:if test="${ddlSelMenu == '40'}">selected</c:if>>최우수(골드)
																					</option>
																					<option value="30"
																						<c:if test="${ddlSelMenu == '30'}">selected</c:if>>최우수(실버)
																					</option>
																					<option value="20"
																						<c:if test="${ddlSelMenu == '20'}">selected</c:if>>우수회원
																					</option>
																					<option value="10"
																						<c:if test="${ddlSelMenu == '10'}">selected</c:if>>정회
																						원</option>
																					<option value="0"
																						<c:if test="${ddlSelMenu == '0'}">selected</c:if>>불량회원
																					</option>
																					<%--중요 select 넘어오는 값에 따라 selected 처리
                            1.주의사항
                                ${ddlSelMenu == '40'}" (o)
                                ${ddlSelMenu == '40'} "(x)
                            2.주의사항
                                         컬렉션은 foreach 문 아니면 못 뽑는다. 근데 쓰기가 애매하다.
                                         즉 list에서 request.setAttribute로 넘겨줘야 한다. ddlSelMenu를
                                         
                             --%>
																			</select>

																			</td>
																		</tr>
																	</table>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*공백,특수문자를
																	제외한 두글자 이상을 입력하세요
																</td>
															</tr>
														</table>
													<td width="8"><img height="49"
														src="Images/member_003.gif" width="8" /></td>
												</tr>
											</table>

											<table cellspacing="0" cellpadding="0" width="800"
												height="30" border="0">
												<tr>
													<td height="20"></td>
													<td valign="bottom" align="left"></td>
													<td valign="bottom" align="right"></td>
												</tr>
											</table>
											<table cellspacing="1" cellpadding="2" width="800" border="0"
												bgcolor="#eeeeee">
												<tr align="center" bgcolor="#3a8bb1">
													<td width="34" height="25" bgcolor="#3a8bb1" class="Bwhite">
														회 원<br /> 번 호
													</td>
													<td width="51" class="Bwhite">회원명<br />(아이디)
													</td>
													<td width="28" class="Bwhite">등급</td>
													<td width="76" class="Bwhite">구매액/횟수</td>
													<td width="78" class="Bwhite">적립금<br />(누적적립금)
													</td>
													<td width="78" class="Bwhite">포인트<br />(누적포인트)
													</td>
													<td width="91" class="Bwhite">미지불금<br />(누적미지불금)<br />
													</td>
													<!--<td width="43" class="Bwhite">레터</td> -->
													<td width="80" class="Bwhite">가입일</td>
													<td width="80" class="Bwhite">최근방문일</td>
													<td width="105" class="Bwhite">관리메뉴</td>
												</tr>
											</table> <!-- 회원기본정보, 회원부가정보, 회원평가치, 회원가입작성 --> <c:if
												test="${count == 0 } ">
												<table width="800" cellpadding="2" cellspacing="1">
													<tr>
														<td align="center">게시판에 저장된 글이 없습니다.</td>
													</tr>
												</table>
											</c:if> <c:if test="${count > 0}">

												<table width="800" cellpadding="2" cellspacing="1">

													<c:forEach var="List" items="${List }">
														<c:forEach var="Value" items="${Value }">
															<%-- 같은 때만 뽑겠다 ! 
                                        items 이름이 기준이다. var은 그냥 foreach의 이름!--%>
															<c:if test="${List.m_Id == Value.m_Id}">
																<tr align="center">
																	<td width="35" height="20" align="center"><c:out
																			value="${List.m_Id}" /> <%-- 이건 게시판 번호시<c:set var ="number" value="${number-1}"/>  --%>
																		<%-- 여기는 계산을 해줘야 되서 out 사용 --%></td>
																	<td width="51" align="center"><c:set
																			var="mbrLoginId" value="${List.
 mbrLoginId} " /> <c:out
																			value="${mbrLoginId}" /></td>
																	<td width="28" align="center"><c:set
																			var="mbrLevel"
																			value="${Value.
                 mbrLevel} " /> </td>
																	<td width="76" align="center"><c:set
																			var="mbrHowMuch"
																			value="${Value.
                            mbrHowMuch} " />

																		<c:out value="${mbrHowMuch}" /> / <c:set
																			var="mbrHowMany"
																			value="${Value.
                            mbrHowMany}" />

																		<c:out value="${mbrHowMany}" /></td>

																	<td width="78" align="center"><c:set
																			var="mbrRsvFund"
																			value="${Value.
                            mbrRsvFund}" />

																		<c:out value="${mbrRsvFund}" /> <c:set
																			var="mbrRsvFundAc"
																			value="${Value.
                            mbrRsvFundAc}" />
																		<br /> (<c:out value="${mbrRsvFundAc}" />)</td>
																	<td width="78" align="center"><c:set
																			var="mbrPoint"
																			value="${Value.
                            mbrPoint}" />

																		<c:out value="${mbrPoint}" /> <c:set var="mbrPointAc"
																			value="${Value.
                            mbrPointAc}" />
																		<br /> (<c:out value="${mbrPointAc}" />)</td>
																	<td width="92" align="center"><c:set
																			var="mbrUnpaid"
																			value="${Value.
                            mbrUnpaid}" />

																		<c:out value="${mbrUnpaid}" /> <c:set
																			var="mbrUnpaidAc"
																			value="${Value.
                            mbrUnpaidAc}" />
																		<br /> (<c:out value="${mbrUnpaidAc}" />)</td>
					<!-- 이부분에 mbrnews 넣으면 안된다 !!당연 !! jstl 태그 쓰니 주석도 안먹힌다 <결론> -->											
																	<td width="77" align="center">${Value. mbrJoinDt}</td>

																	<td width="78" align="center"><c:set
																			var="mbrRecentLoginDt"
																			value="${Value.
                            mbrRecentLoginDt}" />

																		<c:out value="${mbrRecentLoginDt}" /></td>

																	<td width="105" align="center">
																		<button type="button" name="hlAllView"
																			style="border: solid 0px #FFFFFF;"
																			onclick="javascript:window.location.href='/HomePage/mbrView.do?m_Id=${List.m_Id}&search=true'">
																			<%--이 경우 searchflag 는 null --%>
																			<img
																				src="/HomePage/Admins/zImages/btn_admin_view.gif"
																				width="27" height="26" border="0">
																		</button>
																		<button type="button" name="hlAllModify"
																			style="border: solid 0px #FFFFFF;"
																			onclick="javascript:window.location.href='/HomePage/mbrView.do?m_Id=${List.m_Id}&search=false'">
																			<%--이 경우 searchflag 는 null --%>
																			<img
																				src="/HomePage/Admins/zImages/btn_admin_modify.gif"
																				border="0" width="27" height="26">
																		</button>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</c:forEach>
												</table>
											</c:if>

											<table width="800" cellpadding="0" cellspacing="0" height="1"
												bgcolor="#cccccc">
												<tr>
													<td height="1"></td>
												</tr>
											</table> <br /> <br /> 글의 갯수는 ${count}개 입니다. <br /> <br />
											<table cellspacing="0" cellpadding="0" width="800" border="0">
												<tr>
													<td align="center">&nbsp;</td>
													<td align="center"></td>
													<td align="center">
														<button type="button" name="hlAllList"
															style="border: solid 0px #FFFFFF;"
															onclick="javascript:window.location.href='/HomePage/mbrValList.do?m_Id=${mbrValList.m_Id}'">
															<%--이 경우 searchflag 는 null --%>
															<img src="/HomePage/Admins/zImages/btn_view_list.gif"
																border="0">
														</button>
														<button type="button" name="hlInsert"
															style="border: solid 0px #FFFFFF;" onclick="javascript:window.location.href='/HomePage/MbrForm.do'">
															<img src="/HomePage/Admins/zImages/btn_member_write.gif"
																border="0">
														</button>
														<button type="button" name="ibSendMail"
															style="border: solid 0px #FFFFFF;" onclick="mailsome1()">
															<img src="/HomePage/Admins/zImages/btn_send_mail.gif"
																border="0">

														</button>

													</td>
												</tr>
												<c:if test="${count > 0}">
													<c:set var="imsi" value="${count % pageSize == 0 ? 0: 1 }" />
													<c:set var="pageCount" value="${count / pageSize + imsi}" />
													<c:set var="pageBlock" value="${3}" />
													<fmt:parseNumber var="result"
														value="${(currentPage-1) / pageBlock}" integerOnly="true" />
													<c:set var="startPage" value="${result * pageBlock + 1}" />
													<c:set var="endPage" value="${startPage + pageBlock - 1}" />
													<c:if test="${endPage > pageCount }">
														<c:set var="endPage" value="${pageCount}" />
													</c:if>
													<c:if test="${startPage > pageBlock}">
														<a
															href="/HomePage/mbrValList.do?pageNum=${startPage - pageBlock}">[이전]</a>
														<input type="hidden" name="pageNum"
															value="${startPage - pageBlock}" />
													</c:if>
													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<a href="/HomePage/mbrValList.do?pageNum=${i}">[${i}]</a>
													</c:forEach>
													<c:if test="${endPage < pageCount}">
														<a
															href="/HomePage/mbrValList.do?pageNum=${startPage + pageBlock}">[다음]</a>
													</c:if>
												</c:if>
											</table>
										</td>
									</tr>
								</table>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
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