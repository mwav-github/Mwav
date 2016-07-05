//큰 이미지보기
function GoLargeImageView(gCode_id)
{
	WindowOpen("/Shop/LargeImageView/LargeImageView.aspx?gcID="+gCode_id,"livPopup","scrollbars=yes,resizable=yes,width=400,height=500");
}

//이미지업로드 윈도
function GoImageUpload(whichImage)
{
	//alert(window.gCode_id.title);
	WindowOpen("GdsUpLoader.aspx?tid="+ window.gCode_id.title +"&wi="+whichImage,"upPopup","scrollbars=no,resizable=yes,width=500,height=400");
}
function GoCellImageUpload(whichImage)
{
	//alert(window.gCode_id.title);
	WindowOpen("GdsUpLoader.aspx?tid="+ window.gCode_id.title +"&wi="+whichImage,"upPopup","scrollbars=no,resizable=yes,width=500,height=400");
}



function ShowStardView(frm, whichSV)
{
	alert(eval("frm." + whichSV + ".src"));
	frm.imgGoods.src = eval("frm." + whichSV + ".src");
/*무한정 늘어 날것인가?
 switch (whichSV){
    case "Basic":
      	frm.imgGoods.src = frm.Basic.src;
       	break;
    case "Front":
   			frm.imgGoods.src = frm.Front.src;
       	break;
    case "Left":
       	frm.imgGoods.src = frm.Left.src;
       	break;
    case "Rear":
       	frm.imgGoods.src = frm.Rear.src;
       	break;
    case "Right":
       	frm.imgGoods.src = frm.Right.src;
       	break;
    case "Top":
       	frm.imgGoods.src = frm.Top.src;
       	break;
    case "Bottom":
       	frm.imgGoods.src = frm.Bottom.src;
       	break;
    case "ETC":
       	frm.imgGoods.src = frm.ETC.src;
       	break;
    default:
      	frm.imgGoods.src = frm.Basic.src;
 }
*/
}