<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css" />
<link href="/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js"
	type="text/javascript"></script>
<title>The Staff Management</title>
<script>
function numberCheck(temp)

{

              var temp = temp;
			  var num = parseInt(temp);
if( !(10000 <=num && num<= 20030222) ) {

				alert("입력된 값 : " + temp + " 잘못입력했습니다. (10000-20030222)");
				document.stfForm.stfNumber.focus();

			} else {

				alert("입력된 값 : " + temp + " 제대로 입력했습니다.");

			}
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
				<form name="GdsCaInsert" method="post"
					action="/HomePage/GdsCaProInsert.do">
					<table cellSpacing="0" cellPadding="0" width="815" border="0">
						<tr>
							<td bgColor="#ffffff"><table cellSpacing="0" cellPadding="0"
									width="100%" border="0">
									<tr>
										<td width="26"><IMG height="27"
											src="/HomePage/Admins/zImages/admin_top009.gif" width="26"></td>
										<td bgColor="#f4f4f4">현재위치: 카테고리등록</td>
										<td width="10"><IMG height="27"
											src="/HomePage/Admins/zImages/admin_top010.gif" width="10"></td>
									</tr>
								</table></td>
						</tr>
						<tr vAlign="top" align="center" bgColor="#ffffff">
							<td height="20">&nbsp;</td>
						</tr>
						<tr vAlign="top" align="center" bgColor="#ffffff">
							<td height="150"><table cellSpacing="0" cellPadding="0"
									width="800" border="0">
									<tr>
										<td width="149"><IMG height="53"
											src="/HomePage/Admins/CompanyMgr/Staff/Images/staff_004.gif"
											width="176"></td>
										<td
											background="/HomePage/Admins/CompanyMgr/Staff/Images/staff_008.gif">&nbsp;</td>
									</tr>
								</table> <br>
								<table cellSpacing="0" cellPadding="0" width="780" border="0">
									<tr>
										<td vAlign="top" align="center" width="150" height="200">&nbsp;

										</td>
										<td vAlign="top" align="center" width="1" bgColor="#999999"
											rowSpan="2"></td>
										<td vAlign="top" align="center" rowSpan="2"><table
												cellSpacing="1" cellPadding="0" width="600" border="0">

												<tr>
													<td class="Bwhite" align="center" bgColor="#3a8bb1">카테고리명</td>
													<td align="left">&nbsp; <input name="gCname"
														type="text" maxlength="15" class="box003"
														style="width: 100px;" /></td>
												</tr>
												<tr>
													<td class="Bwhite" align="center" bgColor="#3a8bb1">영어명</td>
													<td align="left">&nbsp; <input name="gCengname"
														type="text" maxlength="14" class="box003"
														style="width: 50px;" /></td>
												</tr>






											</table></td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td colSpan="2">&nbsp;</td>
									</tr>

									<tr vAlign="top">

									</tr>
								</table></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#ffffff" height="31">
								<button type="button" name="hiList"
									style="border: solid 0px #FFFFFF;"
									onclick="javascript:window.location.href='/HomePage/GdsCellList.do'">
									<img src="/HomePage/Admins/zImages/btn_view_list.gif"
										border="0">
								</button>
								<button type="button" name="hiBack"
									style="border: solid 0px #FFFFFF;"
									onClick="javascript:history.go(-1)">
									<img src="/HomePage/Admins/zImages/btn_admin_back.gif"
										border="0">
								</button>
								<button type="submit" name="iblInsert"
									style="border: solid 0px #FFFFFF;">
									<img src="/HomePage/Admins/zImages/admin_btn_enter.gif"
										border="0">
								</button>
							</td>
						</tr>
					</table>
					<div id="ValidationSummary1"
						style="color: Red; height: 17px; width: 163px; Z-INDEX: 101; LEFT: 624px; POSITION: absolute; TOP: 24px; display: none;">
					</div>
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
