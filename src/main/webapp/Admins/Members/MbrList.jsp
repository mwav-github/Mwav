
<!-- 
/* 
========jsp페이지의 용도 및 설명(호출 부분 명시)==========
용도 : 등록한 회원정보는 기본정보에 대해 Search 및 수정 , 삭제 이동을 유동적으로 처리해줄 수 있는 페이지

========변수에 대한 설명=========
1.check : bodyonload 시 1 : 삭제성공  0 : 수정성공  그외 : 그냥
2.searchflag = 
  	// 최초 : null
	// 넘어올 때 hidden : false -자바 , 카테고리 (전회원 제외)
	// 검색 후 true 세팅 -.jsp , 전체리스트 누를 경우, 전 회원 !
3.search : 관리 메뉴에서 수정, 삭제 클릭시 전달
4.count : 전체글의 갯수

========유의사항=========
1.출력시 같을 때 뽑는다고 명시해줘야 한다.
   데이터베이스가 4개 물리는 경우
  
2.select 넘어오는 값에 따라 selected 처리
                            1.주의사항
                                ${ddlSelMenu == '40'}" (o)
                                ${ddlSelMenu == '40'} "(x)
                            2.주의사항
     컬렉션은 foreach 문 아니면 못 뽑는다. 근데 쓰기가 애매하다.
     즉 list에서 ddlSelMenu를 request.setAttribute로 넘겨줘야 한다. 
3. 변수의 이름길이가 너무 길때
   
========과정에 대한 설명=========
1.해당 창 Load 단 body(onload)할 때 삭제성공, 실패 , 그 외 인지에 따라 alert창
2.처음 load시 /HomePage/mbrList.do 으로 
   =>A_MbrListAction 으로 (단 searchflag=null)
3.search 할 경우에는 searchflag 는 false 이고
  A_MbrListAction 에서 searchflag true로 변경 후 포워딩 시킨다.
4.보기 수정 같은 경우
  보기 : 
  

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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/HomePage/Admins/Members/script.js"></script>
<meta http-equiv="Content-	Type" content="text/html; charset=UTF-8">
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
	
	document.frmMbr.submit();
} 
*/
</script>

<title>Insert title here</title>
</head>

<body onload="DMCheck(${check})">
	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3">&nbsp; <%-- 첫번째--%> <%@ include
					file="/Admins/TopFrame.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="200" valign="top"><table width="190" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="10">
							<%-- 두번째--%> <%@ include file="/Admins/LeftFrame.jsp"%>
						</td>
					</tr>
				</table></td>

			<td width="10">&nbsp;</td>
			<td valign="top">&nbsp;<%-- 세번째--%>
				<form name="frmMbr" method="post" action="/HomePage/mbrList.do">
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
														src="/HomePage/Admins/Members/Images/member_001.gif"
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
																			<td width="64%"><select name="ddlSearch">
																					<option value="mbrName">회원명
																					<option value="mbrLoginId">아이디
																					<option value="mbrLoginPw">비밀번호
																					<option value="mbrCellularP">모바일폰
																					<option value="m_Id" selected>회원번호</option>
																			</select> <input type="text" name="tbSearchString"
																				maxlength="8" value="검색 키워드" size="25" /> <input
																				type="hidden" name="searchflag" value="false" /> <%--List.jsp 한번이라도 호출시 => searchflag는 false --%>
																				<input name="btnSearch" type="submit" value="검색" />
																				<%--검색창 http://javaclass1.tistory.com/95
               http://www.devpia.com/Maeul/Contents/Detail.aspx?BoardID=56&MaeulNo=22&no=66203&ref=66203
            --%></td>
																			<td width="36%" align="right">
																				<%-- http://snix.tistory.com/557 --%> <select
																				name="ddlSelMenu">
																					<option value="255"
																						<c:if test="${searchflag eq null  && ddlSelMenu == '255'}"> selected </c:if>>
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
														src="/HomePage/Admins/Members/Images/member_003.gif" width="8" /></td>
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
													<td width="52" height="25" bgcolor="#3a8bb1" class="Bwhite">
														회원번호</td>
													<td width="94" class="Bwhite">회원명(아이디)</td>
													<td width="89" class="Bwhite">회원명(비번)</td>
													<td width="100" class="Bwhite">모바일폰</td>
													<td width="93" class="Bwhite">등 급</td>
													<td width="102" class="Bwhite">구매액/횟수</td>
													<td width="111" class="Bwhite">최근방문일</td>
													<td width="118" class="Bwhite">관리메뉴</td>
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

													<c:forEach var="mbrList" items="${mbrList }">
														<c:forEach var="mbrValueList" items="${mbrValueList }">
															<%-- 같은 때만 뽑겠다 ! --%>
															<c:if test="${mbrList.m_Id == mbrValueList.m_Id}">
																<tr align="center">
																	<td width="52" height="20" align="center"><c:out
																			value="${mbrList.m_Id}" /> <%-- 이건 게시판 번호시<c:set var ="number" value="${number-1}"/>  --%>
																		<%-- 여기는 계산을 해줘야 되서 out 사용 --%></td>
																	<td width="88" align="center">${mbrList.
																		mbrLoginId}</td>
																	<td width="95" align="center">${mbrList. mbrLoginPw}
																	</td>
																	<td width="100" align="center">${mbrList.
																		mbrCellularP}</td>

																	<td width="93" align="center">${mbrValueList.
																		mbrLevel}</td>
																	<td width="102" align="center">${mbrValueList.
																		mbrHowMuch} /${mbrValueList. mbrHowMany}</td>
																	<td width="111" align="center">${mbrValueList.
																		mbrRecentLoginDt}</td>
																	<td width="116" align="center">
																		<button type="button" name="hlAllView"
																			style="border: solid 0px #FFFFFF;"
																			onclick="javascript:window.location.href='/HomePage/mbrView.do?m_Id=${mbrList.m_Id}&search=true'">
																			<%--이 경우 searchflag 는 null --%>
																			<img
																				src="/HomePage/Admins/zImages/btn_admin_view.gif"
																				width="34" height="28" border="0">
																		</button>
																		<button type="button" name="hlAllModify"
																			style="border: solid 0px #FFFFFF;"
																			onclick="javascript:window.location.href='/HomePage/mbrView.do?m_Id=${mbrList.m_Id}&search=false'">
																			<%--이 경우 searchflag 는 null --%>
																			<img
																				src="/HomePage/Admins/zImages/btn_admin_modify.gif"
																				border="0" width="34" height="28">
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
											</table> <br /> <br /> 전체 글의 갯수는 ${count}개 입니다. <br /> <br />
											<table cellspacing="0" cellpadding="0" width="800" border="0">
												<tr>
													<td align="center">&nbsp;</td>
													<td align="center"></td>
													<td align="center">
														<button type="button" name="hlAllList"
															style="border: solid 0px #FFFFFF;"
															onclick="javascript:window.location.href='/HomePage/mbrList.do'">
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

											</table>
										</td>
									</tr>
								</table> <c:if test="${count > 0}">
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
											href="/HomePage/mbrList.do?pageNum=${startPage - pageBlock}">[이전]</a>
										<input type="hidden" name="pageNum"
											value="${startPage - pageBlock}" />
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<a href="/HomePage/mbrList.do?pageNum=${i}">[${i}]</a>
									</c:forEach>
									<c:if test="${endPage < pageCount}">
										<a
											href="/HomePage/mbrList.do?pageNum=${startPage + pageBlock}">[다음]</a>
									</c:if>
								</c:if>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>

				</form>

			</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;<%-- 네번째--%> <%@ include
					file="/Admins/BottomFrame.jsp"%>
			</td>
		</tr>
	</table>
</body>
</html>