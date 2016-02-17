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
				<form method="post" name="GdsCellForm" action="GdsCellProc.do">
					<table cellspacing="0" cellpadding="0" width="815" border="0">
						<tr>
							<td bgcolor="#ffffff">
								<table cellspacing="0" cellpadding="0" width="100%" border="0">
									<tr>
										<td width="26"><img height="27"
											src="Admins/zImages/admin_top009.gif" width="26" /></td>
										<td bgcolor="#f4f4f4">현재위치 : 상품등록</td>
										<td width="10"><img height="27"
											src="Admins/zImages/admin_top010.gif" width="10" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr valign="top" align="center" bgcolor="#ffffff">
							<td height="20">&nbsp;</td>
						</tr>
						<tr valign="top" align="center" bgcolor="#ffffff">
							<td height="150">
								<table cellspacing="0" cellpadding="0" width="800" border="0">
									<tr>
										<td width="176"><img height="53"
											src="/HomePage/Admins/Goods/Images/goods_004.gif" /></td>
										<td background="/HomePage/Admins/Goods/Images/goods_008.gif">&nbsp;
										</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="0" width="780" border="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" width="100%"
												border="0">
												<tr>
													<td align="center" bgcolor="#005983" height="25"><span
														class="Bwhite">제품정보 </span></td>
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
																			<td align="center" height="240"><c:choose>
																					<c:when test="${goods==null}">
																						<img name="imgGoods"
																							src="/HomePage/xUpload/GdsData/GdsPic_default.gif" />
																					</c:when>
																					<c:otherwise>
																						<img id="main-img" name="imgGoods"
																							src="/HomePage/xUpload/GdsData/${goods.getGoods_id()}/n${images.get(0).getgFileName()}" />
																					</c:otherwise>
																				</c:choose></td>
																		</tr>
																	</table>
																</td>
																<td valign="top">
																	<table id="Table1" cellspacing="1" cellpadding="2"
																		width="100%" border="0">
																		<tr>
																			<td class="Bwhite" style="width: 100px" width="150"
																				bgcolor="#3a8bb1" height="22">&nbsp;상품코드</td>
																			<td colspan="3"><label ID="gCode_id">${goods.getGoods_id()}</label>
																				<input type="hidden" name="goods_id"
																				value="${goods.getGoods_id()}"></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;모델번호</td>
																			<td colspan="3"><input type="text"
																				name="gModelNbr" MaxLength="200" CssClass="box003"
																				Width="350px" value="${goods.getgModelNbr()}">
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;상품명&nbsp;</td>
																			<td colspan="3"><input type="text" name="gName"
																				MaxLength="200" CssClass="box003" Width="350px"
																				value="${goods.getgName()}"></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;일반판매가</td>
																			<td width="150"><input type="text"
																				name="gConsumerPrice" MaxLength="10"
																				CssClass="box003" Columns="12"
																				value="${goods.getgConsumerPrice()}"></td>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;회원판매가</td>
																			<td width="150"><input type="text"
																				name="gMemberPrice" MaxLength="10" CssClass="box003"
																				Columns="12" value="${goods.getgMemberPrice()}">
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;제조(개발)사</td>
																			<td><input type="text" name="gManufacturer"
																				MaxLength="50" CssClass="box003" Columns="16"
																				value="${goods.getgManufacturer()}"></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;원산지</td>
																			<td><input type="text" name="gPlaceofOrigin"
																				MaxLength="50" CssClass="box003" Columns="16"
																				value="${goods.getgPlaceofOrigin()}"></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;배송료</td>
																			<td><select name="gDeliveryCost" Width="130px">
																					<option value="2500">2500원</option>
																					<option value="0">무료</option>
																			</select></td>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;상품상태</td>
																			<td><select name="gStatus" Width="130px">
																					<option value="1">판매가능</option>
																			</select></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="50">&nbsp;키워드</td>
																			<td colspan="3" height="50">
																				<p>
																					<input type="text" ID="keywords" MaxLength="200"
																						CssClass="box003"> <br />키워드를 통한 웹프로모션
																					메타페이지 다중생성 [Web Spawner] <input type="checkbox"
																						ID="cbSpawner" Checked="True">
																				</p>
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" bgcolor="#3a8bb1" height="22">
																				&nbsp;정렬순서</td>
																			<td><input type="text" name="gOrder"
																				MaxLength="6" CssClass="box003" Columns="5"
																				value="${goods.getgOrder()}"></td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="22">&nbsp;재고수량</td>
																			<td align="center" colspan="3">
																				<table cellspacing="0" cellpadding="0" width="100%"
																					border="0">
																					<tr>
																						<td width="120">
																							<div ID="rblStock">
																								<input type="radio" Value="0" checked="checked">미적용
																							</div> &nbsp; <a href="#" ID="hlOptions">옵션사항</a>
																						</td>
																						<td>
																							<div ID="pnStock">
																								<input type="text" ID="stock" CssClass="box003"
																									MaxLength="3" Columns="3" value="00"
																									disabled="disabled">
																							</div>
																						</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td class="Bwhite" style="width: 98px"
																				bgcolor="#3a8bb1" height="50">&nbsp;게시기간</td>
																			<td valign="top" colspan="3">
																				<table cellspacing="0" cellpadding="0" width="100%"
																					border="0">
																					<tr>
																						<td>
																							<div ID="rblPosting">
																								<input type="radio" Value="nowforever"
																									checked="checked">현재영구게시
																							</div>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<table id="Table4" cellspacing="0"
																								cellpadding="0" width="100%" border="0">
																								<tr>
																									<td class="txt6" align="center" width="60"
																										height="25">시작일</td>
																									<td><input type="text" ID="tbPostStartDT"
																										CssClass="box003" MaxLength="10" Columns="9"
																										disabled="disabled" value="00:00:00">
																									</td>
																								</tr>
																							</table>
																							<table id="Table6" cellspacing="0"
																								cellpadding="0" width="100%" border="0">
																								<tr>
																									<td class="txt6" align="center" width="60"
																										height="25">종료일</td>
																									<td><input type="text" ID="tbPostEndDT"
																										CssClass="box003" MaxLength="10" Columns="9"
																										disabled="disabled" value="00:00:00">
																									</td>
																								</tr>
																							</table>
																						</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																	</table>
																	<table id="Table1" cellspacing="0" cellpadding="0"
																		width="100%" border="0">
																		<tr>
																			<td height="30">&nbsp;</td>
																			<td>이미지정보 (550 x 550픽셀 이상)</td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" width="100"
																				bgcolor="#f0f0f0" height="22">대표(표준)</td>
																			<td height="20"><input type="text"
																				name="tbBasic" MaxLength="50" CssClass="box003"
																				Columns="20"> <input type="text"
																				name="tbBasic_desc" MaxLength="100"
																				CssClass="box003" Columns="11"> <input
																				class="box003" id="bnUpload0"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Basic')" type="button"
																				value="Upload" name="bnUpload0" /> <input
																				type="checkbox" ID="cbBasic" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" bgcolor="#f0f0f0"
																				height="22">전면</td>
																			<td><input type="text" name="tbFront"
																				MaxLength="50" CssClass="box003" Columns="20">
																				<input type="text" name="tbFront_desc"
																				MaxLength="100" CssClass="box003" Columns="11">
																				<input class="box003" id="bnUpload1"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Front')" type="button"
																				value="Upload" name="bnUpload1" /> <input
																				type="checkbox" ID="cbFront" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" bgcolor="#f0f0f0"
																				height="22">후면</td>
																			<td><input type="text" name="tbRear"
																				MaxLength="50" CssClass="box003" Columns="20">
																				<input type="text" name="tbRear_desc"
																				MaxLength="100" CssClass="box003" Columns="11">
																				<input class="box003" id="bnUpload2"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Rear')" type="button"
																				value="Upload" name="bnUpload2" /> <input
																				type="checkbox" ID="cbRear" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" bgcolor="#f0f0f0"
																				height="22">우측면</td>
																			<td><input type="text" name="tbRight"
																				MaxLength="50" CssClass="box003" Columns="20">
																				<input type="text" name="tbRight_desc"
																				MaxLength="100" CssClass="box003" Columns="11">
																				<input class="box003" id="bnUpload3"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Right')" type="button"
																				value="Upload" name="bnUpload3" /> <input
																				type="checkbox" ID="cbRight" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" bgcolor="#f0f0f0"
																				height="22">좌측면</td>
																			<td><input type="text" name="tbLeft"
																				MaxLength="50" CssClass="box003" Columns="20">
																				<input type="text" name="tbLeft_desc"
																				MaxLength="100" CssClass="box003" Columns="11">
																				<input class="box003" id="bnUpload4"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Left')" type="button"
																				value="Upload" name="bnUpload4" /> <input
																				type="checkbox" ID="cbLeft" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" bgcolor="#f0f0f0"
																				height="22">상단면</td>
																			<td><input type="text" name="tbTop"
																				MaxLength="50" CssClass="box003" Columns="20">
																				<input type="text" name="tbTop_desc" MaxLength="100"
																				CssClass="box003" Columns="11"> <input
																				class="box003" id="bnUpload5"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Top')" type="button"
																				value="Upload" name="bnUpload5" /> <input
																				type="checkbox" ID="cbTop" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td class="txt6" align="center" bgcolor="#f0f0f0"
																				height="22">하단면</td>
																			<td><input type="text" name="tbBottom"
																				MaxLength="50" CssClass="box003" Columns="20">
																				<input type="text" name="tbBottom_desc"
																				MaxLength="100" CssClass="box003" Columns="11">
																				<input class="box003" id="bnUpload6"
																				style="cursor: hand; background-color: #e0e0e0"
																				onclick="showImageWindow('Bottom')" type="button"
																				value="Upload" name="bnUpload6" /> <input
																				type="checkbox" ID="cbBottom" Text="이미지제거"
																				Visible="False"></td>
																		</tr>
																		<tr>
																			<td valign="middle" align="center" colspan="2"
																				height="70"></td>
																		</tr>
																		<tr>
																			<td valign="middle" bgcolor="#3a8bb1" colspan="2"
																				height="22"><span class="Bwhite">&nbsp;특이사항</span>
																			</td>
																		</tr>
																		<tr>
																			<td valign="top" colspan="2">
																				<table id="Table2" cellspacing="0" cellpadding="0"
																					width="80%" align="center" border="0">
																					<tr>
																						<td>
																							<div class="ContentBreak">
																								<textarea name="gNote" MaxLength="2000"
																									CssClass="box004" Width="600px" Rows="25"
																									cols="60">${goods.getgNote()}</textarea>
																							</div>
																						</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td valign="middle" bgcolor="#3a8bb1" colspan="2"
																				height="22"><span class="Bwhite">&nbsp;상품상세정보</span>
																			</td>
																		</tr>
																		<tr>
																			<td valign="top" colspan="2">
																				<table id="Table2" cellspacing="0" cellpadding="0"
																					width="80%" align="center" border="0">
																					<tr>
																						<td>
																							<div class="ContentBreak">
																								<textarea name="gDescription" MaxLength="2000"
																									CssClass="box004" Width="600px" Rows="25"
																									cols="60">${goods.getgDescription()}</textarea>
																							</div> <script language="JavaScript1.2"
																								type="text/javascript">
																							<!-- // load htmlarea
																								_editor_url = "/CommonApps/HtmlArea/"; // URL to htmlarea files
																								var win_ie_ver = parseFloat(navigator.appVersion
																										.split("MSIE")[1]);
																								if (navigator.userAgent
																										.indexOf('Mac') >= 0) {
																									win_ie_ver = 0;
																								}
																								if (navigator.userAgent
																										.indexOf('Windows CE') >= 0) {
																									win_ie_ver = 0;
																								}
																								if (navigator.userAgent
																										.indexOf('Opera') >= 0) {
																									win_ie_ver = 0;
																								}
																								if (win_ie_ver >= 5.5) {
																									document
																											.write('<scr'
																													+ 'ipt src="'
																													+ _editor_url
																													+ 'editor.js"');
																									document
																											.write(' language="Javascript1.2"></scr' + 'ipt>');
																								} else {
																									document
																											.write('<scr'+'ipt>function editor_generate() { return false; }</scr'+'ipt>');
																								}
																							// -->
																							</script> <script language="JavaScript1.2"
																								type="text/javascript" defer="defer">
																								editor_generate('specSummary');
																								////
																								var config = new Object(); // create new config object
																								config.width = "100%";
																								//config.height = "200px";
																								config.bodyStyle = 'background-color: white; font-family: "굴림"; font-size: x-small;';
																								config.debug = 0;
																							</script>

																						</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<tr>
																			<td valign="middle" bgcolor="#3a8bb1" colspan="2"
																				height="22">&nbsp;<a
																				href="javascript:ShowAreaOnOff('divHTML');"><span
																					class="Bwhite">상세HTML 내용</span></a>
																			</td>
																		</tr>
																		<tr>
																			<td valign="top" align="center" colspan="2"
																				height="50">
																				<div id="divHTML" class="ContentBreak"
																					style="display: none">
																					<!-- 세부HTML 파일 내용 __시작 -->
																					<!-- 세부HTML 파일 내용 __끝 -->
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td valign="top" colspan="2">
																				<!--iframe name="FTP" align="top" marginWidth="0" marginHeight="0" src="ftp://administrator:@kistel.co.kr:2121"
			frameBorder="0" width="700" scrolling="no" height="80"> </iframe-->
																			</td>
																		</tr>
																		<tr>
																			<td valign="top" colspan="2">
																				<table id="Table3" cellspacing="0" cellpadding="0"
																					width="100%" border="0">
																					<tr>
																						<td align="center" width="100" height="50">
																							파일경로:</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td bgcolor="#005983" height="2"></td>
												</tr>
												<tr>
													<td height="30"></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td align="center" bgcolor="#ffffff" height="50">
											<div ID="pnMirrorControl">
												<img ID="hlList" src="/HomePage/Admins/zImages/btn_view_list.gif"
													onclick="location.href('GdsCellList.do')" /> <img
													ID="hlBack" src="/HomePage/Admins/zImages/btn_admin_back.gif"
													onclick="javascript:history.back(-1);" /> <img
													ID="ibInsert" src="/HomePage/Admins/zImages/admin_btn_enter.gif"
													OnClick="GsfInsert()" /> <img ID="ibUpdate"
													src="/HomePage/Admins/zImages/btn_admin_modify.gif"
													OnClick="GsfUpdate()" />
											</div>
										</td>
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
