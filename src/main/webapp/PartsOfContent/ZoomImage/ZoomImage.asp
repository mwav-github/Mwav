<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	g = Request.QueryString("g")
	if g = "" then 
		Call ShowAlertMsgClose("이미지가 없습니다.")
	end if
	'큰 이미지 구하기
	 bigImage = PickUpValue("vMasterImages", "pName", "gCode = '" & g & "' And imgSize = 'B'")
	if bigImage = "NoPickUp" then Call ShowAlertMsgClose("이미지가 없습니다.")
%>		

<html>
<head>
<title>상품 줌이미지보기</title>
	<meta name="keywords" content="캠코더 카메라 메모리">
	<meta name="description" content="최고의 캠코더 전문사이트">
	<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
	<meta http-equiv="refresh" content="<%= refl %>">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	
		<base href="<%= Application("SiteURLDir") %>" target="_self">
	
	<link href="Include_css/Style.css" rel="stylesheet" type="text/css">
	<link href="Include_css/Object.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="Include_js/CommonFunctions.js"></script>
	<script language="JavaScript" src="Include_js/Function.js"></script>
</HEAD>

<BODY bgColor=#ffffff leftMargin=0 topMargin=20 onload="openWin('bigImage');//alert(bigImage.readyState);" marginheight="20" marginwidth="0">

<TABLE width=350 height=230 border=0 align="center" cellPadding=0 cellSpacing=0 hspace="0" vspace="0">
  <TR vAlign=top align=middle>

    <TD height=200>
	<img src="Images/Goods_Images/<%= bigImage %>" name="bigImage" border="0"> 
	  </TD>
  </TR>
  <TR>
    <TD>
            <!-- CloseButton Start -->
            <!--#include File = "../CloseButton/CloseButton.asp" --> 
            <!-- CloseButton End -->
	</TD>			
</TR>
</TABLE>


<SCRIPT language=javascript> 
	function openWin(img) { 
		imgWidth=eval("window."+img+".width");       // 이미지의 넓이 
		imgHeight=eval("window."+img+".height");      // 이미지의 높이 
	
		if( imgWidth < 370 ){ 
		   imgWidth=380; 
		} 
		else {
		   imgWidth=imgWidth+40; 
		} 
		window.self.resizeTo(imgWidth,imgHeight + 100); // 창 열기 
	} 
   	// Load the first image
	//var im = new Image();
   	//im.src = bigImage.src; //"Images/Goods_Images/<%= bigImage %>";
	// When it's loaded, do something else
	//while (im.readyState != "complete") { // Just loop round, doing nothing 
	//}
	//document.onload = openWin("bigImage");
</SCRIPT>

</BODY></HTML>

