<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<script type="text/javascript" src="Admins/Goods/script.js"></script>
</head>
<body leftmargin="10" topmargin="0" marginwidth="0" marginheight="0">

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
				<center>
					<form method="post" name="GdsCellList">
						<table width="900" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<b>상품목록(전체 상품 수:${count})</b>
							<tr align="right">
								<td><select name="gcName_first"
									onchange="showSubCategory_l()">
										<c:if test="${empty gcName_first}">
											<option value="0">▼ 선 택</option>
											<c:forEach var="vo_first" items="${categoryList}">
												<option value="${vo_first.getGcname()}">${vo_first.getGcname()}</option>
											</c:forEach>
										</c:if>
										<c:if test="${!empty gcName_first}">
											<option value=${gcName_first}>${gcName_first}</option>
											<c:forEach var="vo_first" items="${categoryList}">
												<option value="${vo_first.getGcname()}">${vo_first.getGcname()}</option>
											</c:forEach>
										</c:if>
								</select> <select name="gcName_second">
										<option value="0">▼ 선 택</option>
										<c:if test="${!empty gcName_first}">
											<c:forEach var="vo_second" items="${categoryList_second}">
												<option value="${vo_second.getGcname()}">${vo_second.getGcname()}</option>
											</c:forEach>
										</c:if>
								</select><input type="button" value="검색"></td>
							</tr>
							<tr>
								<td>
									<!-- //상품이 없을시 --> <c:if test="${count==0}">
										<table width="900" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td align="center">등록된 상품이 없습니다.</td>
											</tr>
										</table>
									</c:if> <!-- //상품이 있을시 --> <c:if test="${count>0}">
										<table width="900" border="0" cellspacing="0" cellpadding="0"
											class="default" id="intranet_board1">
											<tr height="27">
												<td colspan="11"></td>
											</tr>
											<tr>
												<td colspan="12" height="5" bgcolor="#BBBBBB"></td>
											</tr>
											<tr height="35" align="center">
												<td width="38" bgcolor="#EFEFEF" class="top_bg"><input
													type="checkbox" style="background: yellow" name="chAll"
													onClick="checkAll()"></td>
												<td width="38" bgcolor="#EFEFEF" class="top_bg"><strong>상품코드</strong></td>
												<td width="161" bgcolor="#EFEFEF" class="top_bg"><strong>이미지</strong></td>
												<td width="130" bgcolor="#EFEFEF" class="top_bg"><strong>상품명</strong></td>
												<td width="106" bgcolor="#EFEFEF" class="top_bg"><strong>가격</strong></td>
												<td width="85" bgcolor="#EFEFEF" class="top_bg"><strong>할인가</strong></td>
												<td width="69" bgcolor="#EFEFEF" class="top_bg"><strong>제조사</strong></td>
												<td width="95" bgcolor="#EFEFEF" class="top_bg"><strong>날짜</strong></td>
											</tr>
											<tr>
												<td colspan="12" height="1" bgcolor="#CCCCCC"></td>
											</tr>
											<tr>
												<td colspan="12" height="5" bgcolor="#BBBBBB"></td>
											</tr>
											<c:forEach var="goods" items="${goodsList}">
												<tr align="center">
													<td><input type="checkbox" name="ch"
														value="${goods.getGoods_id()}"></td>
													<td>${goods.getGoods_id()}</td>
													<td><img src=""></td>
													<!-- //상세페이지를 요청할때 해당 상품의 goods_id를 요청 파라미터로 넘김. -->
													<td><a href="GdsCellView.do?id=${goods.getGoods_id()}">${goods.getgName()}</a></td>
													<td>${goods.getgConsumerPrice()}원</td>
													<td>${goods.getgMemberPrice()}원</td>
													<td>${goods.getgManufacturer()}</td>
													<td>${goods.getgInsertDt()}</td>
												</tr>
											</c:forEach>
										</table>
									</c:if> <!-- //페이징 구현 --> <c:if test="${ count > 0 }">
										<c:set var="imsi" value="${ count % pageSize == 0 ? 0 : 1 }" />
										<c:set var="pageCount" value="${ count / pageSize + imsi }" />
										<c:set var="pageBlock" value="${ 3 }" />
										<fmt:parseNumber var="result"
											value="${ (currentPage - 1) / pageBlock}" integerOnly="true" />
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
										<tr>
											<td colspan="12" align="left">선택한 게시물을 <select
												name="sel">
													<option value="del">삭제</option>
											</select> <input type="button" value="확인" onclick="moveAction()">
											</td>
										</tr>
									</c:if> <!-- //페이징 구현 끝 -->
							<tr>
								<td align="right"><a href="GdsCellForm.do">상품등록</a></td>
							</tr>
						</table>
					</form>
				</center>

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