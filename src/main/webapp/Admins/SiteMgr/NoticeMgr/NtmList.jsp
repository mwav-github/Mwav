<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Notice Management</title>
<script type="text/javascript">

function page_move(s_value,p_value){
    var f=document.NtmList; //폼 name
    f.bUser_id.value = s_value; //POST방식으로 넘기고 싶은 값
    f.pageNum.value = p_value;
    f.submit();
    
}
</script>
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
			<form name="NtmList" method="post" action="/HomePage/U_View.do">
            <input type="hidden" name="bUser_id" /> <input type="hidden"
						name="pageNum" />
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
														src="/HomePage/Admins/SiteMgr/zImages/admin_notice_001.gif"
														width="204" /></td>
													<td
														background="/HomePage/Admins/SiteMgr/zImages/admin_notice_002.gif">
														<table id="Table1" cellspacing="0" cellpadding="0"
															width="98%" border="0">
															<tr>
																<td valign="bottom" align="left" colspan="3" height="25">
																	<table cellspacing="0" cellpadding="0" width="100%"
																		border="0">
																		<tr>
																			<td width="64%"><select name="ddlSearch">
														<option value="bUser_id">공지번호</option>
														<option value="buTitle">제목</option>
														<option value="buGroup">분류</option>
														<option value="staff_id">작성자</option>
														<option value="buContent">내용</option>
												</select>  <input type="text" name="tbSearchString"
																				maxlength="8" value="검색 키워드" size="25" /> <input
																				type="hidden" name="searchflag" value="false" /> <%--List.jsp 한번이라도 호출시 => searchflag는 false --%>
																				<input name="btnSearch" type="submit" value="검색" />
																				<%--검색창 http://javaclass1.tistory.com/95
               http://www.devpia.com/Maeul/Contents/Detail.aspx?BoardID=56&MaeulNo=22&no=66203&ref=66203
            --%></td>
																			<td width="36%" align="right">
																				<%-- http://snix.tistory.com/557 --%> 
																				<select name="ddlSelMenu">
																					<option value="1">현재공지상태</option>
																					<option value="0">임시저장상태</option>
																				</select>
																			</td>
																		</tr>
																	</table>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*공백,특수문자를
																	제외한 두글자 이상을 입력하세요
																</td>
															</tr>
														</table>
													<td width="8"><img height="49" src="/HomePage/Admins/Members/Images/member_003.gif" width="8" /></td>
												</tr>
											</table>

											<table cellspacing="0" cellpadding="0" width="800" height="30" border="0">
												<tr>
													<td height="20"></td>
													<td valign="bottom" align="left"></td>
													<td valign="bottom" align="right"></td>
												</tr>
											</table>
											<table cellspacing="1" cellpadding="2" width="800" border="0">
												<tr align="center" bgcolor="#66ffcc">
													<td width="55" height="30" bgcolor="#3a8bb1">공지번호</td>
													<td width="70" bgcolor="#3a8bb1">분류</td>
													<td width="171" bgcolor="#3a8bb1">제 목</td>
													<td width="82" bgcolor="#3a8bb1">기록일</td>
													<td width="91" bgcolor="#3a8bb1">작성자</td>
													<td width="89" bgcolor="#3a8bb1">조회수</td>
													<td width="74" bgcolor="#3a8bb1">정렬</td>
													<td width="127" bgcolor="#3a8bb1">관리메뉴</td>
												</tr>
											</table> <!-- 회원기본정보, 회원부가정보, 회원평가치, 회원가입작성 --> 
												<c:if test="${count == 0 } ">
													<table width="800" cellpadding="2" cellspacing="1">
														<tr>
															<td align="center">게시판에 저장된 글이 없습니다.</td>
														</tr>
													</table>
												</c:if> 
												<c:if test="${count > 0}">
													<table width="800" cellpadding="2" cellspacing="1">
													<c:forEach var="article" items="${articleList}">
													<tr height="30">
														<td align="center" width="55">${article.bUser_id}</td>
														<td align="center" width="70">${article.buGroup}</td>
														<td align="center" width="171">${article.buTitle}</td>
														<td align="center" width="83">${article.buWriteDt}</td>
														<td align="center" width="91">${article.staff_id}</td>
														<td align="center" width="89">${article.buViewCount}</td>
														<td align="center" width="74">${article.buOrder}</td>
														<td width="124" align="center">
															<button type="button" name="hlAllView" style="border: solid 0px #FFFFFF;"
																onclick="javascript:window.location.href='/HomePage/U_View.do?bUser_id=${article.bUser_id}'">
																<%--이 경우 searchflag 는 null --%>
																<img src="/HomePage/Admins/zImages/btn_admin_view.gif" border="0">
															</button>
															<button type="button" name="hlAllModify" style="border: solid 0px #FFFFFF;"
																onclick="javascript:window.location.href='/HomePage/U_UpdateForm.do?bUser_id=${article.bUser_id}'">
																<img src="/HomePage/Admins/zImages/btn_admin_modify.gif" border="0">
															</button>
															</td>
														</tr>
													</c:forEach>
												</table>
											</c:if>

											<table width="800" cellpadding="0" cellspacing="0" height="1" bgcolor="#cccccc">
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
															onclick="javascript:window.location.href='/HomePage/U_List.do'">
															<%--이 경우 searchflag 는 null --%>
															<img src="/HomePage/Admins/zImages/btn_view_list.gif" border="0">
														</button>
														<button type="button" name="hlInsert" style="border: solid 0px #FFFFFF;"
															onclick="javascript:window.location.href='/HomePage/U_WriteForm.do'">
															<img src="/HomePage/Admins/zImages/btn_admin_write.gif" border="0">
														</button>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								 </table>
								 <c:if test="${count > 0}">
        							<c:set var="imsi" value="${count % pageSize == 0 ? 0: 1 }"/>
						        	<c:set var="pageCount" value="${count / pageSize + imsi}"/>
						        	<c:set var="pageBlock" value="${3}"/>
						        	<fmt:parseNumber var="result" value="${(currentPage-1) / pageBlock}" integerOnly="true"/>
						        	<c:set var="startPage" value="${result * pageBlock + 1}"/>
						        	<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
						        	<c:if test="${endPage > pageCount }">
						        		<c:set var="endPage" value="${pageCount}"/>
						        	</c:if>
						        	<c:if test="${startPage > pageBlock}">
						        		<a href="/HomePage/U_List.do?pageNum=${startPage - pageBlock}">[이전]</a>
						        		<input type = "hidden" name ="pageNum" value ="${startPage - pageBlock}"/>
						        	</c:if>
						        	<c:forEach var="i" begin="${startPage}" end="${endPage}">
						        	<a href="/HomePage/U_List.do?pageNum=${i}">[${i}]</a>
						        	</c:forEach>
						        	<c:if test="${endPage < pageCount}">
						        		<a href="/HomePage/U_List.do?pageNum=${startPage + pageBlock}">[다음]</a>
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
			<td colspan="3">&nbsp; <%@ include file="/Admins/BottomFrame.jsp"%> <%-- 네번째--%></td>
		</tr>
	</table>
</body>
</html>