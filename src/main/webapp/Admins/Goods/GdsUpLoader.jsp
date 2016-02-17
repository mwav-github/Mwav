<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지파일 업로드</title>
<script type="text/javascript" src="Admins/Goods/script.js"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="App_Themes/Objects.css" charset="UTF-8">
<link rel="stylesheet" type="text/css" href="App_Themes/OverallPage.css" charset="UTF-8">
</head>
<body>
<!--http://www.albumbang.com/board/board_view.jsp?board_name=free&no=292 파일업로드 관련 -->
    <form name="GdsUpLoader" method="post"
		action="GdsUpLoader.do?position=${position}" 
		enctype="multipart/form-data">
  <table cellSpacing="0" cellPadding="0" width="500" border="0">
   <tr>
    <td align="center" bgColor="#efefef" height="60"><strong>파일업로드</strong>
   </tr>
   <tr>
    <td height="10"></td>
   </tr>
   <tr>
    <td class="bbold" vAlign="bottom" align="center" height="80">
     <table cellSpacing="0" cellPadding="0" width="100%" border="0">
      <tr>
       <td height="220" align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 <tr>
		  <td align="center">
		   <c:if test="${empty image}">
			<img id="imgUpload" src="xUpload/GdsData/GdsPic_default.gif" />
		   </c:if> 
		   <c:if test="${!empty image}">
			<img id="imgUpload" width="200" height="200" src="xUpload/GdsData/TempImages/${image}" />
		   </c:if>
		  </td>
		 </tr>
		</table>
	   </td>
	   <td align="center" width="320">
		<table cellSpacing="0" cellPadding="0" width="300" border="0">
		 <tr>
		  <td height="60" align="center">이미지는 가능하면 큰 사이즈(500px
											이상)으로<br /> 업로드되어야 좋습니다.
		  </td>
		 </tr>
		 <tr>
		  <td align="center">파일명 : 
		   <input class="box003" id="bnUpload" type="file" size="20" name="imagefile"
											value="${image}">
		  </td>
	     </tr>
		 <tr>
		  <td height="60" align="center">
		   <img onclick="upload_click()" src="Admins/zImages/medit_bt.gif">
		  </td>
		 </tr>
		</table>
	   </td>
	  </tr>
	 </table>
	</td>
   </tr>
   <tr>
	<td height="40" align="center" valign="top">
	 <c:if test="${empty image}">
	  <img src="Admins/zImages/btnClose.gif" width="108" height="34"
							onclick="self.close();" />
	 </c:if> 
	 <c:if test="${!empty image}">
	  <img src="Admins/zImages/btnClose.gif" width="108" height="34"
							onclick="sendImage('${position}', '${image}')" />
	 </c:if>
	</td>
   </tr>
   <tr>
	<td height="20" align="center" bgcolor="#efefef">&nbsp;</td>
   </tr>
  </table>
 </form>

 
</body>
</html>
