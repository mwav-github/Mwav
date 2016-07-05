<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<SCRIPT LANGUAGE="JavaScript">
<!--
//  설정내용////////////////////////////////////////////////////////
	var scrollerwidth1 = 160;
	var scrollerheight1 = 145;
	var num1 = 1; //스크롤을 멈추게 할때 사용
	//멈춰있는 시간(초*1000)
	var waitingtime1 = 3000;
	//스크롤 속도
	var scrollspeed1 = 30;
	var tvi1 = 0;	//보여줄 목록의 인덱스
	var vtvi1 = 0;	//현재보여지고 있는 div의 인덱스(0,1)
////////////////////////////////////////////////////////////////////
	var liveItems1 = new Array();
<%
	'ClassifiedG ="gSpecial", "gBest", "gReCMD", "gSet", "gPopular", "gRelated"
	i = 0
	selectedFields = "gCode,gMnum,gName,SMprice,Sprice,gOrder,displayOnly,buyable"
	whereClause = "Right(gCode,1)='S' And displayOnly <>'Y'"
	orderBy = "gOrder DESC"
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

	liveItems1[<%= i %>] = "<table cellspacing='0' cellpadding='0' border='0'><tr><td>" +
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
		liveItems1[<%= i %>] = "준비 중"
<%
	end if 'if RSresult = "NotEmpty" then

	ClassifiedG = ""
%>

	function scrollingLiveList1(divlist) {
		list1 = eval(divlist);
		//두개의 div를 모두 올린다.
		list1[0].style.pixelTop -= num1;
		list1[1].style.pixelTop -= num1;

		if (list1[vtvi1].style.pixelTop == 5) {	//멈췄다가 다시 스크롤 되는 부분
			setTimeout("scrollingLiveList1(list1)", waitingtime1);
			//다음 보여줄 div의 위치와 내용을 세팅한다.
			tvi1 = (tvi1 < liveItems1.length - 1) ? tvi1+1 : 0 ;
			if (vtvi1 == 0) {
				vtvi1 = 1;
				list1[1].style.pixelTop = scrollerheight1;
				list1[1].innerHTML = (tvi1 < liveItems1.length) ? liveItems1[tvi1] : liveItems1[0];
			} else {
				vtvi1 = 0;
				list1[0].style.pixelTop = scrollerheight1;
				list1[0].innerHTML = (tvi1 < liveItems1.length) ? liveItems1[tvi1] : liveItems1[0];
			}
		} else {	//스크롤 되는 부분
			//list1[0].style.pixelTop -= num1;
			//list1[1].style.pixelTop -= num1;
			setTimeout("scrollingLiveList1(list1)", scrollspeed1);
		}
	}

	function onmouse_event1() {
		num1=0;
	}

	function mouseout_event1() {
		num1=1;
	}

	function startLiveList1() {
		LiveList1[0].innerHTML = liveItems1[tvi1];
		if (liveItems1.length > 1) {
			//alert(liveItems1.length);
			scrollingLiveList1(LiveList1);
		}
	}
	//window.onload = startLiveList1;
//-->
</SCRIPT>
<base href="<%= Application("SiteURLDir") %>ShopComponents/ClassifiedGoods/" target="_self">
<table cellpadding=0 cellspacing=0 border=0 width="150">
<tr>
<td><img src="SetGoods/Images/SetGoodsBoxTitle.gif" width=150 height=35 border=0></td>
</tr>
<tr>
<td height=150 style="position:relative">
	<div onMouseOver="onmouse_event1();" onMouseOut="mouseout_event1();" style="position:absolute;width:160;height:37px;clip:rect(0 170 145 0);left:10;top:10;z-index:1">
		<div id="LiveList1" style="position:absolute;width:160;left:10;top:10;visibility:visible;"></div>
		<div id="LiveList1" style="position:absolute;width:160;left:10;top:10;visibility:visible;"></div>
	</div></td>
</tr>
</table>
<SCRIPT LANGUAGE="JavaScript">
<!--
	startLiveList1();
//-->
</SCRIPT>
