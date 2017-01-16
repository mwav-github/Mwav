<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록폼</title>
<script type="text/javascript" src="Admins/Goods/script.js"
	charset="UTF-8"></script>
</head>
<body leftmargin="50" topmargin="0" marginwidth="0" marginheight="0">

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
				<form method="post" name="GdsCellForm_test" action="GdsCellProc.mwav">
					<table width="1000" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
						<tr>
							<td colspan="2" height="5" bgcolor="#BBBBBB"></td>
						</tr>
						<tr height="30">
							<td height="30" colspan="2" align="center" valign="bottom"
								bgcolor="#DDDDDD" style="padding-bottom: 5"><b> 상품 등록</b></td>
						</tr>
						<tr>
							<td colspan="2" height="1" bgcolor="#BBBBBB"></td>
						</tr>
						<tr>
							<td colspan="2" height="5"></td>
						</tr>
						<tr>
							<td width="100">카테고리</td>
							<td>
								<!-- //카테고리가 바뀔때마다 서버에 재요청하여 상세 카테고리 리스트를 가져온다 --> <select
								name="gcName_first" onchange="showSubCategory()">
									<!-- //처음 요청시에 첫번째 카테고리 리스트를 뿌려준다 -->
									<c:if test="${empty gcName_first}">
										<option value="0">▼ 선 택</option>
										<c:forEach var="vo_first" items="${categoryList}">
											<option value="${vo_first.getGcname()}">${vo_first.getGcname()}</option>
										</c:forEach>
									</c:if>
									<!-- //재요청시에 첫번째 카테고리 이름을 보이게 뿌려준다 -->
									<c:if test="${!empty gcName_first}">
										<option value=${gcName_first}>${gcName_first}</option>
										<c:forEach var="vo_first" items="${categoryList}">
											<option value="${vo_first.getGcname()}">${vo_first.getGcname()}</option>
										</c:forEach>
									</c:if>
							</select> <select name="gcName_second">
									<option value="0">▼ 선 택</option>
									<!-- //재요청시에 두번째 카테고리 리스트를 뿌려준다 -->
									<c:if test="${!empty gcName_first}">
										<c:forEach var="vo_second" items="${categoryList_second}">
											<option value="${vo_second.getGcname()}">${vo_second.getGcname()}</option>
										</c:forEach>
									</c:if>
							</select>
							</td>
						</tr>
						<tr>
							<td width="100">모델번호</td>
							<td><input name="gModelNbr" type="text" style="width: 120px"
								maxlength="9"></td>
						</tr>
						<tr>
							<td width="100">제품명</td>
							<td><input name="gName" type="text" style="width: 120px"
								maxlength="9"></td>
						</tr>
						<tr>
							<td width="100">제조사</td>
							<td><input name="gManufacturer" type="text"
								style="width: 120px" maxlength="9"></td>
						</tr>
						<tr>
							<td>원산지</td>
							<td><span> <input name="gPlaceofOrigin" type="text"
									style="width: 120px" maxlength="9">
							</span></td>
						</tr>
						<tr>
							<td>일반 판매가</td>
							<td><span> <input name="gConsumerPrice" type="text"
									style="width: 120px" maxlength="9">
							</span>원</td>
						</tr>
						<tr>
							<td>회원 판매가</td>
							<td><span> <input name="gMemberPrice" type="text"
									style="width: 120px" maxlength="9">
							</span>원</td>
						</tr>
						<tr>
							<td width="100">배송비</td>
							<td><select name="gDeliveryCost">
									<option value="2500">2500원</option>
									<option value="0">없음</option>
							</select></td>
						</tr>
						<tr>
							<td>상품 이미지</td>
							<td>
								<div id="file">
									<div>
										정면:<input type="button" name="filename"
											onClick="showImageWindow()" value="등록">
									</div>
									<div>
										후면:<input type="button" name="filename"
											onClick="showImageWindow()" value="등록">
									</div>
									<div>
										좌측면:<input type="button" name="filename"
											onClick="showImageWindow()" value="등록">
									</div>
									<div>
										우측면:<input type="button" name="filename"
											onClick="showImageWindow()" value="등록">
									</div>
								</div> <input type="button" name="addfile" value="추가"
								onClick="addFile()">
							</td>
						</tr>
						<tr>
							<td width="100">정렬순서</td>
							<td><input name="gOrder" type="text" style="width: 50px"
								maxlength="1"></td>
						</tr>
						<tr>
							<td width="100">특이 사항</td>
							<td><textarea name="gDescription" cols="80" rows="10"
									style="border: 1px solid #444444;"></textarea></td>
						<tr>
							<td width="100">제품 설명</td>
							<td><textarea name="gNote" cols="80" rows="10"
									style="border: 1px solid #444444;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" height="5" bgcolor="#BBBBBB"></td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="padding-top: 10"><input
								type="button" value="뒤로가기" onClick="javascript:history.back(-1)"><input
								type="reset" value="다시입력"> <input type="button"
								value="전송" onClick="inputCheck()">
						</tr>
						<tr>
							<td width="590" height="10" colspan="2" valign="top"></td>
						</tr>
						<tr>
							<td height="43"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">COPYRIGHT(C) 2013 BY Java
								Shopping ALL RIGHTS RESERVED.</td>
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