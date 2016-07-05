<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<SCRIPT LANGUAGE="JavaScript">
<!--
//  설정내용////////////////////////////////////////////////////////
	var scrollerwidth2 = 160;
	var scrollerheight2 = 145;
	var num2 = 1; //스크롤을 멈추게 할때 사용
	//멈춰있는 시간(초*1000)
	var waitingtime2 = 3000;
	//스크롤 속도
	var scrollspeed2 = 30;
	var tvi2 = 0;	//보여줄 목록의 인덱스
	var vtvi2 = 0;	//현재보여지고 있는 div의 인덱스(0,1)
////////////////////////////////////////////////////////////////////
	var liveItems2 = new Array();
<%
	'ClassifiedG ="gSpecial", "gBest", "gReCMD", "gSet", "gPopular", "gRelated"
	i = 0
	selectedFields = "Top 5 gCode,gMnum,gName,SMprice,Sprice,gOrder,displayOnly,buyable,salesFigure,choiceFigure,clicksFigure"
	whereClause = "displayOnly <>'Y'"
	orderBy = "salesFigure DESC, choiceFigure DESC, clicksFigure DESC"
	RSresult = SelectSimpleRecord(rsPopularG, selectedFields, "vPopularGoods", whereClause, orderBy)
	if RSresult = "NotEmpty" then
		Do until rsPopularG.EOF
			gCode = rsPopularG("gCode")
			gMnum = rsPopularG("gMnum")
			gName = rsPopularG("gName")
			SMprice = rsPopularG("SMprice")
			urlClassifiedG = Application("SiteRoot") & "ShopBody/GoodsDetailBody.asp?g=" & gCode
			'작은 이미지 구하기
			smallImage = PickUpValue("vMasterImages", "pName", "gCode = '" & gCode & "' And imgSize = 'S'")
			if smallImage = "NoPickUp" then smallImage ="iSdefault.gif"
			imgClassifiedG = Application("SiteRoot") & "Images/Goods_Images/" & smallImage
			'가격확인
			if IsNumeric(SMprice) then SMprice = FormatNumber(SMprice,0)

%>

	liveItems2[<%= i %>] = "<table cellspacing='0' cellpadding='0' border='0'><tr><td>" +
		"<a href='<%= urlClassifiedG %>'>" +
		"<img src='<%= imgClassifiedG %>' alt='<%= gMnum %>' vspace='2' border='0'></a>" +
		"</td></tr><td align='right' height='25'>" +
		"<a href='<%= urlClassifiedG %>'>" +
		"<font color='#330099'><strong><%= gName %><br><%= SMprice %>원</strong></font></a>" +
		"</td></<tr></table>"


<%
			i = i + 1
			rsPopularG.MoveNext()
		Loop
		CloseRS(rsPopularG)
	else
%>
		liveItems2[<%= i %>] = "준비 중"
<%
	end if 'if RSresult = "NotEmpty" then

	ClassifiedG = ""
%>

	function scrollingLiveList2(divlist) {
		list2 = eval(divlist);
		//두개의 div를 모두 올린다.
		list2[0].style.pixelTop -= num2;
		list2[1].style.pixelTop -= num2;

		if (list2[vtvi2].style.pixelTop == 5) {	//멈췄다가 다시 스크롤 되는 부분
			setTimeout("scrollingLiveList2(list2)", waitingtime2);
			//다음 보여줄 div의 위치와 내용을 세팅한다.
			tvi2 = (tvi2 < liveItems2.length - 1) ? tvi2+1 : 0 ;
			if (vtvi2 == 0) {
				vtvi2 = 1;
				list2[1].style.pixelTop = scrollerheight2;
				list2[1].innerHTML = (tvi2 < liveItems2.length) ? liveItems2[tvi2] : liveItems2[0];
			} else {
				vtvi2 = 0;
				list2[0].style.pixelTop = scrollerheight2;
				list2[0].innerHTML = (tvi2 < liveItems2.length) ? liveItems2[tvi2] : liveItems2[0];
			}
		} else {	//스크롤 되는 부분
			//list2[0].style.pixelTop -= num2;
			//list2[1].style.pixelTop -= num2;
			setTimeout("scrollingLiveList2(list2)", scrollspeed2);
		}
	}

	function onmouse_event2() {
		num2=0;
	}

	function mouseout_event2() {
		num2=1;
	}

	function startLiveList2() {
		LiveList2[0].innerHTML = liveItems2[tvi2];
		if (liveItems2.length > 1) {
			//alert(liveItems2.length);
			scrollingLiveList2(LiveList2);
		}
	}
	//window.onload = startLiveList2;
//-->
</SCRIPT>
<base href="<%= Application("SiteURLDir") %>ShopComponents/ClassifiedGoods/PopularGoods/" target="_self">
<table cellpadding=0 cellspacing=0 border=0 width="150">
<tr>
<td><img src="Images/PopularGoodsBoxTitle.gif" width=150 height=35 border=0></td>
</tr>
<tr>
<td height=150 style="position:relative">
	<div onMouseOver="onmouse_event2();" onMouseOut="mouseout_event2();" style="position:absolute;width:160;height:37px;clip:rect(0 170 145 0);left:10;top:10;z-index:1">
		<div id="LiveList2" style="position:absolute;width:160;left:10;top:10;visibility:visible;"></div>
		<div id="LiveList2" style="position:absolute;width:160;left:10;top:10;visibility:visible;"></div>
	</div></td>
</tr>
</table>
<SCRIPT LANGUAGE="JavaScript">
<!--
	startLiveList2();
//-->
</SCRIPT>
