<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GdsCellForm</title>
<script type="text/javascript" src="Admins/Goods//script.js"
	charset="UTF-8"></script>
</head>
<body leftmargin="50" topmargin="0" marginwidth="0" marginheight="0">
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
				bgcolor="#DDDDDD" style="padding-bottom: 5"><b> 상품 보기</b></td>
		</tr>
		<tr>
			<td colspan="2" height="1" bgcolor="#BBBBBB"></td>
		</tr>
		<tr>
			<td colspan="2" height="5"></td>
		</tr>
		<tr>
			<td width="100">카테고리</td>
			<td>${gcName_first}>${gcName_second}</td>
		</tr>
		<tr>
			<td width="100">모델번호</td>
			<td>${goods.getgModelNbr()}</td>
		</tr>
		<tr>
			<td width="100">제품명</td>
			<td>${goods.getgName()}</td>
		</tr>
		<tr>
			<td width="100">제조사</td>
			<td>${goods.getgManufacturer()}</td>
		</tr>
		<tr>
			<td width="100">원산지</td>
			<td>${goods.getgPlaceofOrigin()}</td>
		</tr>
		<tr>
			<td width="100">일반 판매가</td>
			<td>${goods.getgConsumerPrice()}원</td>
		</tr>
		<tr>
			<td width="100">회원 판매가</td>
			<td>${goods.getgMemberPrice()}원</td>
		</tr>
		<tr>
			<td width="100">배송비</td>
			<td>${goods.getgDeliveryCost()}</td>
		</tr>
		<tr>
			<td width="100">상품 이미지</td>
			<td></td>
		</tr>
		<tr>
			<td width="100">정렬순서</td>
			<td>${goods.getgOrder()}</td>
		</tr>
		<tr>
			<td width="100">특이 사항</td>
			<td>${goods.getgNote()}</td>
		<tr>
			<td width="100">제품 설명</td>
			<td>${goods.getgDescription()}</td>
		</tr>
		<tr>
			<td colspan="2" height="5" bgcolor="#BBBBBB"></td>
		</tr>
		<td colspan="2" align="center" style="padding-top: 10"><input
			type="button" value="뒤로가기" onClick="javascript:history.back(-1)"><input
			type="button" value="수정하기"></td>
		<tr>
		</tr>
		<tr>
			<td width="590" height="10" colspan="2" valign="top"></td>
		</tr>
		<tr>
			<td>
		<tr>
			<td height="43"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">COPYRIGHT(C) 2013 BY Java
				Shopping ALL RIGHTS RESERVED.</td>
		</tr>

	</table>
</body>
</html>