<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<form name="NtmView" method="post">
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
										<td>&nbsp;</td>
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
										<td align="center" width="20%">${article.buGroup}</td>
										<td align="center" width="13%">${article.buViewCount}</td>
										<td align="center" width="19%">${article.buWriteDt}</td>
										<td align="center" width="17%">${article.staff_id}</td>
										<td align="center" width="20%">${article.buOrder}</td>
									</tr>
								</table>

								<table cellspacing="0" cellpadding="0" width="98%" border="0">
									<tr>
										<td align="left" bgcolor="#3a8bb1" height="25">&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td valign="top" align="center"><br />
											<table cellspacing="1" cellpadding="3" width="600" border="0">
												<tr bgcolor="#ffffff">
													<td width="101" align="center" bgcolor="#3a8bb1">제 목</td>
													<td width="484" colspan="3" align="center">${article.buTitle}</td>
												</tr>
												<tr bgcolor="#ffffff">
													<td align="center" bgcolor="#3a8bb1">부제목</td>
													<td colspan="3" align="center">${article.buSubTitle}</td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td align="center">
											<table cellspacing="1" cellpadding="3" width="600" border="0">
												<tr>
													<td width="101" align="center" bgcolor="#3a8bb1">내 용</td>
													<td align="left" width="484" colspan="3"><pre>${article.buContent}</pre>
													</td>
												</tr>
											</table>
                                            <tr>
                                            <td height="20"></td>
                                            </tr>
									<tr>
										<td align="right"><button type="button" name="hlAllModify" style="border: solid 0px #FFFFFF;"
onclick="javascript:window.location.href='/HomePage/U_UpdateForm.do?bUser_id=${article.bUser_id}'">
<img src="/HomePage/Admins/zImages/btn_admin_modify.gif" border="0">
</button></td>
									</tr>
									<tr height="30">
										<td colspan="4" align="center">
<button type="button" name="hlAllList"
															style="border: solid 0px #FFFFFF;"
															onclick="javascript:window.location.href='/HomePage/U_List.do'">
														<img src="/HomePage/Admins/zImages/btn_view_list.gif" border="0">
														</button>
</button>
<button type="button" name="ibDelete" style="border:solid 0px #FFFFFF;" onclick=
"javascript:window.location.href='/HomePage/U_DeleteForm.do?bUser_id=${article.bUser_id}'">
 <img src="/HomePage/Admins/zImages/btn_admin_delete.gif"  border="0"> 
</button>
								</table></td>
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