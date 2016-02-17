<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<script type="text/javascript" src="Admins/Goods/script.js"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="App_Themes/Objects.css"
	charset="UTF-8">
<link rel="stylesheet" type="text/css" href="App_Themes/OverallPage.css"
	charset="UTF-8">
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
				<form name="GbsCellList" method="post"
					action="/HomePage/GdsCellList.do">
					<table cellspacing="0" cellpadding="0" width="815" border="0">
						<tr>
							<td colspan="2">
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
										<td width="26"><img height="27"
											src="Admins/zImages/admin_top009.gif" width="26" /></td>
										<td bgcolor="#f4f4f4">현재위치 : 상품리스트</td>
										<td width="10"><img height="27"
											src="Admins/zImages/admin_top010.gif" width="10" /></td>
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
													<td width="176"><img
														src="Admins/Goods/Images/goods_001.gif" width="176" /></td>
													<td background="Admins/Goods/Images/goods_002.gif">
														<table id="Table1" cellspacing="0" cellpadding="0"
															width="98%" border="0">
															<tr>
																<td valign="bottom" align="left" colspan="3" height="25">
																	<table cellspacing="0" cellpadding="0" width="100%"
																		border="0">
																		<tr>
																			<td>&nbsp;&nbsp;&nbsp;&nbsp; <select
																				name="ddlSearch">
																					<option value="*"
																						<c:if test="${search=='*'}">selected </c:if>>전체</option>
																					<option value="gName"
																						<c:if test="${search=='gName'}">selected </c:if>>상품명</option>
																					<option value="gModelNbr"
																						<c:if test="${search=='gModelNbr'}">selected </c:if>>모델번호</option>
																					<option value="gManufacturer"
																						<c:if test="${search=='gManufacturer'}">selected </c:if>>제조사</option>
																			</select> <input type="text" name="tbSearchString"
																				Height="15px" MaxLength="20" Width="100px"
																				value="${searchString}"> <input
																				type="submit" id="btnSearch" Height="23px"
																				value="검색"> <input type="hidden"
																				name="searchflag" value="false" />
																			</td>
																			<td align="right"><select name="gclStateSel"
																				onchange="this.form.submit()">
																					<option value="*"
																						<c:if test="${state=='*'}">selected </c:if>>모든
																						게시상품</option>
																					<option value="1"
																						<c:if test="${state=='1'}">selected </c:if>>구매가능</option>
																					<option value="0"
																						<c:if test="${state=='0'}">selected </c:if>>일시품절</option>
																			</select></td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
													<td width="9"><img
														src="Admins/Goods/Images/goods_003.gif" width="9" /></td>
												</tr>
											</table> <br /> <HeaderTemplate> <!-- //상품이 없을시 -->
											<c:if test="${count==0}">
												<table width="900" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td align="center">등록된 상품이 없습니다.</td>
													</tr>
												</table>
											</c:if> <c:if test="${count>0}">
												<table cellspacing="0" cellpadding="0" width="800"
													height="30" border="0">
													<tr>
														<td height="20"></td>
														<td valign="bottom" align="left">&nbsp;</td>
														<td valign="bottom" align="right"></td>
													</tr>
												</table>
												<table cellspacing="1" cellpadding="2" width="800"
													border="0" bgcolor="#eeeeee">
													<tr align="center" bgcolor="#3a8bb1">
														<td width="60" height="25" class="Bwhite">상품코드</td>
														<td width="180" class="Bwhite">상품 이미지</td>
														<td width="100" class="Bwhite">모델명 / 상품명</td>
														<td width="130" class="Bwhite">제조(개발)사 / 소비자가</td>
														<td width="60" class="Bwhite">제품상태</td>
														<td width="50" class="Bwhite">순열</td>
														<td width="70" bgcolor="#3a8bb1" class="Bwhite">날짜</td>
														<td width="120" class="Bwhite">관리메뉴</td>
													</tr>
												</table>
												<!-- 회원기본정보, 회원부가정보, 회원평가치, 회원가입작성 --></HeaderTemplate> <itemtemplate>
											<table width="800" cellpadding="2" cellspacing="1">
												<c:forEach var="goods" items="${goodsList}">
													<tr align="center" height="100">
														<td width="60" height="20" align="center"><c:set
																var="goods_id" value="${goods.getGoods_id()} " /> <c:out
																value="${goods_id}" /></td>
														<td width="180"><img height="120"
															src="xUpload/GdsData/${goods.getGoods_id()}/s${goods.getgBasicFileName()}"></td>
														<td width="100"><c:set var="gModelNbr"
																value="${goods.getgModelNbr()} " /> <c:out
																value="${gModelNbr}" /> / <c:set var="gName"
																value="${goods.getgName()} " /> <c:out value="${gName}" /></td>
														<td width="130" align="center"><c:set
																var="gManufacturer" value="${goods.getgManufacturer()} " />
															<c:out value="${gManufacturer}" /> / <c:set
																var="gConsumerPrice"
																value="${goods.getgConsumerPrice()}" /> <c:out
																value="${gConsumerPrice}" />원</td>
														<td width="60" align="center">${goods.getgStatus()==0?"일시품절":"구매가능"}</td>
														<td width="50" align="center"><c:set var="gOrder"
																value="${goods.getgOrder()}" /> <c:out
																value="${gOrder}" /></td>
														<td width="70" align="center"><c:set var="gInsertDt"
																value="${goods.getgInsertDt()}" /> <c:out
																value="${gInsertDt}" /></td>
														<td width="120" align="center">
															<button type="button" name="hlView"
																style="border: solid 0px #FFFFFF;"
																onclick="javascript:location.href='/HomePage/GdsCellView.do?id=${goods.getGoods_id()}'">
																<img src="Admins/zImages/btn_admin_view.gif" >
															</button>
															<button type="button" name="ibUpdate"
																style="border: solid 0px #FFFFFF;"
																onclick="javascript:location.href='/HomePage/GdsCellModify.do?id=${goods.getGoods_id()}'">
																<img src="Admins/zImages/btn_admin_modify.gif"/>
															</button>
														</td>
													</tr>
												</c:forEach>
											</table>
											</itemtemplate> <SeparatorTemplate>
											<table width="800" cellpadding="0" cellspacing="0" height="1"
												bgcolor="#cccccc">
												<tr>
													<td height="1"></td>
												</tr>
											</table>
											</SeparatorTemplate> <!-- //페이징 구현 --> <c:if test="${ count > 0 }">
												<c:set var="imsi" value="${ count % pageSize == 0 ? 0 : 1 }" />
												<c:set var="pageCount" value="${ count / pageSize + imsi }" />
												<c:set var="pageBlock" value="${ 3 }" />
												<fmt:parseNumber var="result"
													value="${ (currentPage - 1) / pageBlock}"
													integerOnly="true" />
												<c:set var="startPage" value="${ result * pageBlock + 1 }" />
												<c:set var="endPage" value="${ startPage + pageBlock - 1 }" />
												<c:if test="${ endPage > pageCount}">
													<c:set var="endPage" value="${ pageCount}" />
												</c:if>
												<c:if test="${ startPage > pageBlock }">
													<a href="GdsCellList.do?pageNum=${startPage - pageBlock}">[이전]</a>
												</c:if>
												<c:forEach var="i" begin="${ startPage}" end="${ endPage}">
													<a href="GdsCellList.do?pageNum=${i}">[${i}]</a>
												</c:forEach>
												<c:if test="${ endPage < pageCount }">
													<a href="GdsCellList.do?pageNum=${startPage + pageBlock}">[다음]</a>
												</c:if>
											</c:if> <!-- //페이징 구현 끝 --> </c:if> <br />
										<br />
											<table cellspacing="0" cellpadding="0" width="800" border="0">
												<tr>
													<td align="center">&nbsp;</td>
													<td align="center"></td>
													<td align="center">
														<button type="button" name="hlAllList"
															style="border: solid 0px #FFFFFF;"
															onclick="javascript:location.href='/HomePage/GdsCellList.do'">
															<img id="hlAllList"
																src="Admins/zImages/btn_view_list.gif"> &nbsp;
														</button>
														<button type="button" name="hlInsert"
															style="border: solid 0px #FFFFFF;"
															onclick="javascript:location.href='/HomePage/GdsCellForm.do'">
															<img id="hlInsert"
																src="Admins/zImages/btn_goods_write.gif"> &nbsp;
														</button>

													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
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
