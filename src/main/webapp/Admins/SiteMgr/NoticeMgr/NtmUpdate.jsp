<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="/HomePage/CommonLibrary/ckeditor/ckeditor.js"></script>
<link href="/HomePage/App_Themes/Objects.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />

<title>The Notice Management</title>
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
				<form name="NtmForm" method="post" action="/HomePage/U_UpdatePro.do">
					<input type="hidden" name="bUser_id" value="${bUser_id}"> <input
						type="hidden" name="pageNum" />
					<table cellspacing="0" cellpadding="0" width="810" border="0">
						<tr>
							<td bgcolor="#ffffff"><table width="100%" border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td width="26"><img
											src="/HomePage/Admins/zImages/admin_top009.gif" width="26"
											height="27" /></td>
										<td bgcolor="#f4f4f4">현재위치 :</td>
										<td width="10"><img
											src="/HomePage/Admins/zImages/admin_top010.gif" width="10"
											height="27" /></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#ffffff">&nbsp;</td>
						</tr>
						<tr>
							<td bgcolor="#ffffff"><table width="100%" border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td width="160"><img
											src="/HomePage/Admins/SiteMgr/zImages/admin_notice_006.gif"
											height="53" /></td>
										<td
											background="/HomePage/Admins/SiteMgr/zImages/admin_notice_005.gif">&nbsp;</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td bgcolor="#ffffff">&nbsp;</td>
						</tr>
						<tr valign="top" align="center" bgcolor="#ffffff">
							<td height="300"><table cellspacing="2" cellpadding="1"
									width="98%" border="0">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><select name="buStatus" value="${buStatus}">
												<option value="0">임시저장상태</option>
												<option value="1">현재공지상태</option>
										</select></td>
									</tr>
									<tr align="center" bgcolor="#3a8bb1">
										<td align="center" width="11%" height="30">공지번호</td>
										<td align="center" width="20%">분류</td>
										<td align="center" width="13%">조회수</td>
										<td align="center" width="19%">작성일</td>
										<td align="center" width="17%">작성자</td>
										<td align="center" width="20%">정렬순서</td>
									</tr>
									<tr align="center">
										<td align="center" width="11%">${article.bUser_id}</td>
										<td><select align="center" width="20%" name="buGroup"
											value="${article.buGroup}">
												<option value="전체">전체</option>
												<option value="휴대폰">휴대폰</option>
												<option value="인터넷">인터넷</option>
												<option value="영어">영어</option>
												<option value="유통">유통</option>
												<option value="SI개발">SI개발</option>
										</select></td>
										<td align="center" width="13%">${article.buViewCount}</td>
										<td align="center" width="19%">${article.buWriteDt}</td>
										<td align="center" width="17%">${article.staff_id}</td>
										<td align="center" width="20%">${article.buOrder}"</td>
									</tr>
								</table>

								<table cellspacing="0" cellpadding="0" width="98%" border="0">
									<tr>
										<td align="left" bgcolor="#3a8bb1" height="25">&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td valign="top" align="left"><br />
											<table cellspacing="1" cellpadding="3" width="600" border="0">
												<tr bgcolor="#ffffff">
													<td width="101" align="center" bgcolor="#3a8bb1">제 목</td>
													<td width="484" align="left"><input type="text"
														Width="450px" MaxLength="200" name="buTitle"
														value="${article.buTitle}"></td>
												</tr>
												<tr bgcolor="#ffffff">
													<td align="center" bgcolor="#3a8bb1">부제목</td>
													<td width="484" align="left"><input type="text"
														name="buSubTitle" Width="450px" rows="2" maxlength="500"
														value="${article.buSubTitle }"></td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td align="center">
											<table cellspacing="1" cellpadding="3" width="800" border="0">
												<tr>
													<td width="101" align="center" bgcolor="#3a8bb1">내 용</td>
													<td align="left" colspan="3"><textarea
															name="buContent" cols="150" rows="80">${article.buContent}</textarea>
														<script type="text/javascript">
															//<![CDATA[
															CKEDITOR
																	.replace('buContent');
															//]]
														</script></td>
												</tr>
											</table>
									<tr height="20">
									</tr>
									<tr height="30">
										<td colspan="4" align="center">
											<button type="button" name="hiList"
												style="border: solid 0px #FFFFFF;"
												onclick="javascript:window.location.href='/HomePage/U_List.do'">
												<img src="/HomePage/Admins/zImages/btn_view_list.gif"
													border="0">
											</button>
											<button type="button" name="hiBack"
												style="border: solid 0px #FFFFFF;">
												<img src="/HomePage/Admins/zImages/btn_admin_back.gif"
													border="0">
											</button>
											<button type="submit" name="iblInsert"
												style="border: solid 0px #FFFFFF;"
												onclick="javascript:window.location.href='/HomePage/U_List.do'">
												<img src="/HomePage/Admins/zImages/admin_btn_enter.gif"
													border="0">
											</button>
								</table></td>
						</tr>
					</table>
				</form></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp; <%@ include
					file="/Admins/BottomFrame.jsp"%> <%-- 네번째--%>
			</td>
		</tr>
	</table>
</body>
</html>