<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GdsCellView</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="Admins/Goods/script.js"
	charset="UTF-8"></script>
<script type="text/javascript">
	$("#gallery li img").hover(function() {
		$('#main-img').attr('src', $(this).attr('src'));
	});
	$(document).ready(function() {
		// Image swap on hover
		$("#gallery li img").hover(function() {
			$('#main-img').attr('src', $(this).attr('src'));
		});
		// Image preload
		var imgSwap = [];
		$("#gallery li img").each(function() {
			imgUrl = this.src;
			imgSwap.push(imgUrl);
		});
		$(imgSwap).preload();
	});
	$.fn.preload = function() {
		this.each(function() {
			$('<img/>')[0].src = this;
		});
	}
</script>
<style type="text/css">
#gallery li {
	display: inline;
	margin-right: 3px;
}
</style>
<link rel="stylesheet" type="text/css" href="App_Themes/Objects.css"
	charset="UTF-8">
<link rel="stylesheet" type="text/css" href="App_Themes/OverallPage.css"
	charset="UTF-8">
</head>
<body>

	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3" >&nbsp; <%@ include
					file="/Admins/TopFrame.jsp"%> <%-- 첫번째--%></td>
		</tr>
		<tr>
			<td width="200" valign="top"><table
					width="190" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="10"><%@ include file="/Admins/LeftFrame.jsp"%>
							<%-- 두번째--%></td>
					</tr>
				</table></td>


			<td width="10">&nbsp;</td>
			<td valign="top" >&nbsp; <%-- 세번째--%>
				<form name="GdsCellView">
					<table cellSpacing="0" cellPadding="0" width="810" border="0">
						<tr>
							<td bgColor="#ffffff">
								<table cellSpacing="0" cellPadding="0" width="100%" border="0">
									<tr>
										<td width="26"><img height="27"
											src="Admins/zImages/admin_top009.gif" width="26"></td>
										<td bgColor="#f4f4f4">현재위치 : 상품보기</td>
										<td width="10"><img height="27"
											src="Admins/zImages/admin_top010.gif" width="10"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td bgColor="#ffffff" height="20">&nbsp;</td>
						</tr>
						<tr>
							<td align="center" bgColor="#ffffff">
								<table cellSpacing="0" cellPadding="0" width="800" border="0">
									<tr>
										<td width="176"><img height="53"
											src="Admins/Goods/Images/goods_006.gif"></td>
										<td background="Admins/Goods/Images/goods_008.gif">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td bgColor="#ffffff">&nbsp;</td>
						</tr>
						<tr vAlign="top" align="center" bgColor="#ffffff">
							<td height="300">
								<div id="print_area">
									<table cellSpacing="0" cellPadding="0" width="780" border="0">
										<tr>
											<td>
												<table cellspacing="0" cellpadding="0" width="100%"
													border="0">
													<tr>
														<td align="center" bgcolor="#005983" height="25"><span
															class="Bwhite">제품정보</span></td>
													</tr>
													<tr>
														<td>
															<table cellspacing="0" cellpadding="0" width="100%"
																border="0">
																<tr>
																	<td valign="top" width="35%">
																		<table cellspacing="1" cellpadding="2" width="100%"
																			border="0">
																			<tr>
																				<td class="Bwhite" align="center" bgcolor="#3a8bb1"
																					height="25">상품이미지</td>
																			</tr>
																			<tr>
																				<td valign="middle" align="left" height="220">
																					<!-- 이미지 갤러리 형식 -->
																					<div id="gallery">
																						<img id="main-img"
																							src="xUpload/GdsData/${images.get(0).getGoods_id()}/n${images.get(0).getgFileName()}"
																							width="250" height="250" />
																						<ul>
																							<c:forEach var="images" items="${images}">
																								<li><img
																									src="xUpload/GdsData/${images.getGoods_id()}/n${images.getgFileName()}"
																									width="50" height="50" /></li>
																							</c:forEach>
																						</ul>
																					</div> <!-- //이미지 갤러리 형식 -->
																				</td>
																			</tr>
																			<tr>
																				<td valign="middle" align="center" height="20">
																					<img src="Admins/Goods/Images/btnEnlarge.gif"
																					onclick="popupImage('${goods.getGoods_id()}')" />
																				</td>
																			</tr>
																		</table>
																	</td>
																	<td valign="top">
																		<table cellspacing="1" cellpadding="2" width="100%"
																			border="0">
																			<tr>
																				<td class="Bwhite" width="120" bgcolor="#3a8bb1"
																					height="22">&nbsp;상품코드</td>
																				<td colspan="3" align="left">&nbsp;${goods.getGoods_id()}
																				</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;모델번호</td>
																				<td colspan="3" align="left">&nbsp;${goods.getgModelNbr()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;상품명</td>
																				<td align="left">&nbsp;${goods.getgName()}</td>
																				<td class="Bwhite" width="120" height="22">&nbsp;</td>
																				<td width="200" align="left">&nbsp;</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;일반판매가</td>
																				<td align="left">&nbsp;${goods.getgConsumerPrice()}원</td>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;회원판매가</td>
																				<td align="left">&nbsp;${goods.getgMemberPrice()}원</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;제조(개발)사</td>
																				<td width="170" align="left">&nbsp;${goods.getgManufacturer()}</td>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;원산지
																				</td>
																				<td align="left">&nbsp;${goods.getgPlaceofOrigin()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;배송비</td>
																				<td width="170" align="left">&nbsp;${goods.getgDeliveryCost()}원</td>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;구매가능여부</td>
																				<td align="left">&nbsp;${goods.getgStatus()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;키워드</td>
																				<td colspan="3" align="left">&nbsp;${goods.getgKeywords()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;특정상품</td>
																				<td align="left">&nbsp;</td>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;정렬순서
																				</td>
																				<td align="left">&nbsp;${goods.getgOrder()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;등록인</td>
																				<td colspan="2" height="22" align="left">&nbsp;아이디</td>
																				<td>&nbsp;</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;등록일</td>
																				<td colspan="3" align="left">&nbsp;${goods.getgInsertDt()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;수정일</td>
																				<td colspan="3" align="left">&nbsp;${goods.getgUdateDt()}</td>
																			</tr>
																			<tr>
																				<td class="Bwhite" bgcolor="#3a8bb1" height="22">&nbsp;게시기간
																				</td>
																				<td colspan="3" align="left">&nbsp;기간 제한이 없는
																					상품입니다.</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td valign="middle" bgcolor="#3a8bb1" colspan="2"
																		height="22"><span class="Bwhite">&nbsp;상품특이사항</span></td>
																</tr>
																<tr>
																	<td valign="top" colspan="2" height="100" align="left">
																		<div class="ContentBreak">${goods.getgNote()}</div>
																	</td>
																</tr>
																<tr>
																	<td valign="middle" bgcolor="#3a8bb1" colspan="2"
																		height="22"><span class="Bwhite">&nbsp;상품상세정보</span></td>
																</tr>
																<tr>
																	<td valign="top" colspan="2" height="100" align="left">
																		<div class="ContentBreak">${goods.getgDescription()}
																		</div>
																	</td>
																</tr>
																<tr>
																	<td valign="middle" bgcolor="#3a8bb1" colspan="2"
																		height="22"><span class="Bwhite">&nbsp;상세HTML
																			내용</span></td>
																</tr>
																<tr>
																	<td valign="top" colspan="2" height="50">
																		<div class="ContentBreak">
																			<!-- 세부HTML 파일 내용 __시작 -->
																			<!-- 세부HTML 파일 내용 __끝 -->
																		</div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td bgColor="#005983" height="2"></td>
										</tr>
									</table>
								</div>
								<table cellSpacing="0" cellPadding="0" width="98%" border="0">
									<tr>
										<td align="right"><p>&nbsp;</p></td>
									</tr>
									<tr>
										<td><p>&nbsp;</p></td>
									</tr>
									<tr>
										<td align="center" height="30"><img id="hlList"
											src="Admins/zImages/btn_view_list.gif"
											onclick="location.href('GdsCellList.do')" /> <img
											id="hlBack" src="Admins/zImages/btn_admin_back.gif"
											onclick="javascript:history.back(-1);"> <img
											id="ibModfy" src="Admins/zImages/btn_admin_modify.gif"
											onclick="location.href('GdsCellModify.do?id=${goods.getGoods_id()}')">
											<img id="ibStopPosting"
											src="Admins/zImages/btn_admin_delete.gif"
											onclick="location.href('GdsCellDelete.do?id=${goods.getGoods_id()}')"
											style="width: 44px"></td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td bgColor="#ffffff">&nbsp;</td>
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
