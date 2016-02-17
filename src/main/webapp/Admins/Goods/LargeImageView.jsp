<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>큰 이미지보기</title>
<link rel="stylesheet" type="text/css" href="App_Themes/Objects.css"
	charset="UTF-8">
<link rel="stylesheet" type="text/css" href="App_Themes/OverallPage.css"
	charset="UTF-8">
<style type="text/css">
</style>
</head>
<body>

				<form id="frmShop">
					<table cellspacing="0" cellpadding="0" width="100%" border="0">
						<tbody>
							<tr>
								<td colspan="3">
									<table cellspacing="0" cellpadding="0" width="100%" border="0">
										<tbody>
											<tr>
												<td align="right" colspan="3" height="41">
													<table cellspacing="0" cellpadding="0" width="100%"
														border="0">
														<tbody>
															<tr>
																<td align="left"
																	background="Admins/Goods/Images/title_bg.gif"><img
																	src="Admins/Goods/Images/title.gif" width="751"
																	height="41" /></td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td valign="top" align="center" style="padding: 5px">
									<table width="100%" height="500" border="1" cellpadding="0"
										cellspacing="0" bordercolor="#d7e5f1">
										<tbody>
											<tr>
												<td align="center"><img id="imgLIV"
													src="xUpload/GdsData/${id}/${images.get(0).getgFileName()}"></img>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td valign="top" width="1" bgcolor="#ffffff"></td>
								<td valign="top" align="center" width="160" height="100%">
									<div id="Layer1"
										style="OVERFLOW-Y: scroll; VISIBILITY: visible; OVERFLOW-X: hidden; WIDTH: 100%; HEIGHT: 580px">
										<ItemTemplate>
										<table width="100%" border="0" cellpadding="5" cellspacing="0"
											align="center">
											<c:forEach var="images" items="${images}">
												<tr>
													<td width="100%"><img
														src="xUpload/GdsData/${id}/n${images.getgFileName()}"
														width="160" height="160" /></td>
												</tr>
											</c:forEach>
										</table>
										</ItemTemplate>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table cellspacing="0" cellpadding="0" width="90%" border="0">
										<tbody>
											<tr>
												<td valign="bottom" align="right" height="10"><img
													src="Admins/Goods/Images/btnClose.gif" width="108"
													height="34" onclick="self.close();" /></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

</body>
</html>
