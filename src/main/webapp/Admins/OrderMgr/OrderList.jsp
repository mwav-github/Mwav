<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문목록</title>
<script type="text/javascript" src="/HomePage/Admins/Goods/script.js"
	charset="UTF-8"></script>
	<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet" type="text/css" charset="UTF-8"/>
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet" type="text/css" charset="UTF-8"/>
	
</head>
<body>


	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3" >&nbsp; <%@ include
					file="/Admins/TopFrame.jsp"%> <%-- 첫번째--%></td>
		</tr>
		<tr>
			<td width="200" valign="top" ><table
					width="190" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="10"><%@ include file="/Admins/LeftFrame.jsp"%>
							<%-- 두번째--%></td>
					</tr>
				</table></td>


			<td width="10">&nbsp;</td>
			<td valign="top" >&nbsp; <%-- 세번째--%>
				<form>
					<table cellspacing="0" cellpadding="0" width="815" border="0">
						<tr>
							<td colspan="2">
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
										<td width="26"><img height="27"
											src="/HomePage/Admins/zImages/admin_top009.gif" width="26" /></td>
										<td bgcolor="#f4f4f4">현제위치 : 현제주문목록 <a
											href="OrderHistoyList.do">주문history목록</a>
										</td>

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
								<table id="table5" cellspacing="0" cellpadding="0" width="100%"
									bgcolor="#ffffff" border="0">
									<tr>
										<td valign="top" align="center" height="300">
											<table height="49" cellspacing="0" cellpadding="0"
												width="800" border="0">
												<tr>
													<td width="176"><img
														src="/HomePage/Admins/Goods/Images/goods_001.gif" width="176" /></td>
													<td background="Admins/Goods/Images/goods_002.gif">
														<table id="table1" cellspacing="0" cellpadding="0"
															width="98%" border="0">
															<tr>
																<td valign="bottom" align="left" colspan="3" height="25">
																	<table cellspacing="0" cellpadding="0" width="100%"
																		border="0">
																		<tr>
																			<td>&nbsp;&nbsp;&nbsp;&nbsp; <select
																				id="ddlSearch">
																					<option value="*">전체</option>
																					<option value="gName">상품명</option>
																					<option value="modelNbr">모델번호</option>
																					<option value="Mfger">제조사</option>
																			</select> <input type="text" id="tbSearchString" Height="15px"
																				MaxLength="20" Width="100px"> <input
																				type="button" id="btnSearch" Height="23px"
																				value="검색">
																			</td>
																			<td align="right"><select name="ddlSelMenu">
																					<option value="0">처리상태</option>
																					<option value="1">주문접수</option>
																					<option value="2">입금확인중</option>
																					<option value="3">환불중</option>
																					<option value="4">배송중</option>
																					<option value="5">반송중</option>
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
											</table> <br /> <HeaderTemplate>
											<table cellspacing="0" cellpadding="0" width="800"
												height="30" border="0">
												<tr>
													<td height="20"></td>
													<td valign="bottom" align="left">&nbsp;</td>
													<td valign="bottom" align="right"></td>
												</tr>
											</table>
											</HeaderTemplate> <itemtemplate> <c:forEach var="orders"
												items="${ordersList}">
												<table cellSpacing="0" cellPadding="0" width="100%"
													align="center" border="1">
													<tr align="center" bgColor="#f2f2f2">
														<td height=30 class="Bwhite" bgcolor="#3a8bb1">주문번호(주문일)</td>
														<td colspan="3"><a href="#">${orders.getOrder_id()}(${omOrderDt})</a></td>
														<td class="Bwhite" bgcolor="#3a8bb1">회원정보</td>
														<td colspan="2">회원이름(<a href="#">회원아이디</a>)
														</td>
													</tr>
												</table>
												<br />
												<table cellSpacing="0" cellPadding="0" width="95%"
													align="center" border="1">
													<tr align="center" bgColor=#f2f2f2>
														<td width="80" height=30 class="Bwhite" bgcolor="#3a8bb1">상품코드</td>
														<td width="170" class="Bwhite" bgcolor="#3a8bb1">상품명</td>
														<td width="50" class="Bwhite" bgcolor="#3a8bb1">옵션</td>
														<td width="50" class="Bwhite" bgcolor="#3a8bb1">수량</td>
														<td width="100" class="Bwhite" bgcolor="#3a8bb1">금액</td>
														<td width="50" class="Bwhite" bgcolor="#3a8bb1">적립금</td>
														<td width="100" class="Bwhite" bgcolor="#3a8bb1">총
															주문금액</td>
													</tr>
													<tr align="center">
														<td height=25><a href="#">${orders.getGoods_id()}</a></td>
														<td>${orders.getgName()}</td>
														<td>${orders.getOdrOption()}</td>
														<td>${orders.getOdrAmount()}</td>
														<td>${orders.getgPrice()}</td>
														<td>${orders.getOdrRsvFund()}</td>
														<td>${opAmount}</td>
													</tr>
												</table>
											</c:forEach> </itemtemplate> <SeparatorTemplate>
											<table width="800" cellpadding="0" cellspacing="0" height="1"
												bgcolor="#cccccc">
												<tr>
													<td height="1"></td>
												</tr>
											</table>
											</SeparatorTemplate> <br />
										<br />
											<table cellspacing="0" cellpadding="0" width="800" border="0">
												<tr>
													<td align="center">&nbsp;</td>
													<td align="center"></td>
													<td align="center"><img id="hlAllList"
														onclick="location.href('GdsCellList.do')"
														src="/HomePage/Admins/zImages/btn_view_list.gif"></td>
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
			<td colspan="3" >&nbsp; <%@ include
					file="/Admins/BottomFrame.jsp"%> <%-- 네번째--%>
			</td>
		</tr>
	</table>

</body>
</html>
