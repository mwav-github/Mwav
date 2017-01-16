<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/HomePage/NsmNews.css" rel="stylesheet" type="text/css" />
<link href="/HomePage/App_Themes/OverallPage.css" rel="stylesheet"
	type="text/css" />
<link href="/HomePage/Admins/SiteMgr/NewsMgr/NsmNews.css"
	rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The News Management</title>

<script type="text/javascript">
function page_move(s_value){
    var f=document.NsmNews; //폼 name
    f.news_id.value = s_value; //POST방식으로 넘기고 싶은 값
    f.submit();  
}
</script>

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
				<form name="NsmNews" action="/HomePage/N_View.mwav" method="post">
					<input type="hidden" name="news_id" /> <input type="hidden"
						name="pageNum" value="${pageNum }" />

					<c:forEach var="LinearticleList" items="${LinearticleList }">
						<tr align="center" width="150">
							<td height="10"><a
								href="javascript:page_move('${LinearticleList.news_id}');">${LinearticleList.bnTitle}</a>
								<br /></td>
						</tr>
					</c:forEach>
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