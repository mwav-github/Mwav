/* 
========제품 관리 전역에서 사용하는 스크립트 로직==========

========일자 별 설명=========

 순번  |    요일    |             내용              |     
ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  1.   12 06     기본적인 틀 생성
 */
//상품등록폼에서 입력 확인하여 제출.
function GsfInsert() {
	var theForm = document.GdsCellForm;
	/*
	 * if (theForm.gcName_first.value == 0) { alert("첫번째 카태고리를 선택해 주세요.");
	 * theForm.gcName_first.focus(); return; } if (theForm.gcName_second.value ==
	 * 0) { alert("두번째 카태고리를 선택해 주세요."); theForm.gcName_second.focus(); return; }
	 */
	if (!theForm.gModelNbr.value) {
		alert("모델 번호를 입력하세요.");
		theForm.gModelNbr.focus();
		return;
	}
	if (!theForm.gName.value) {
		alert("제품명을 입력하세요.");
		theForm.gName.focus();
		return;
	}
	if (!theForm.gManufacturer.value) {
		alert("제조사를 입력하세요.");
		theForm.gManufacturer.focus();
		return;
	}
	if (!theForm.gPlaceofOrigin.value) {
		alert("원산지를 입력하세요.");
		theForm.gPlaceofOrigin.focus();
		return;
	}
	if (!theForm.gConsumerPrice.value) {
		alert("일반판매가를 입력하세요.");
		theForm.gConsumerPrice.focus();
		return;
	}
	if (!theForm.gMemberPrice.value) {
		alert("회원판매가를 입력하세요.");
		theForm.gMemberPrice.focus();
		return;
	}
	/*
	 * if (!theForm.gDescription.value) { alert("특이사항을 입력하세요.");
	 * theForm.gDescription.focus(); return; }
	 */
	if (!theForm.gNote.value) {
		alert("제품 설명를 입력하세요.");
		theForm.gNote.focus();
		return;
	}
	// theForm.encoding="multipart/form-data"
	theForm.submit();
}
function GsfUpdate() {
	document.GdsCellForm.reset();
}
// 서브 카테고리가 나오도록 상품등록 페이지를 서버에 재요청한다.
function showSubCategory() {
	document.GdsCellForm.action = "GdsCellForm.do";
	document.GdsCellForm.submit();
}
// 서브 카테고리가 나오도록 상품리스트 페이지를 서버에 재요청한다.
function showSubCategory_l() {
	document.GdsCellList.action = "GdsCellList.do";
	document.GdsCellList.submit();
}
// 상품 리스트에서 모든 상품이 체크되게하는 메소드.
function checkAll() {
	// 대표 체크박스의 상태를 모두 체크박스에 적용한다 체크할 경우 - 모두 체크 해제할 경우 - 모두해제
	var len = GdsCellList.ch.length;
	// HTML문서내에서 name은 중복이 가능하며, 중복될 경우 DOM은
	// 배열로 인식한다!

	// alert("생성된 체크박스의 수는 " +len);
	for (i = 0; i < len; i++) {
		GdsCellList.ch[i].checked = GdsCellList.chAll.checked;
	}
}
// 상품 리스트에서 선택한 액션을 수행하는 메소드(삭제)
function moveAction() {
	if (GdsCellList.sel.value == "del") { // 삭제를 원하는 삭제처리
		if (confirm("선택한 상품을 삭제하시겠습니까?")) {
			GdsCellList.action = "GdsCellDelete.do";
			GdsCellList.submit();
		}
	}
}
// 이미지등록 추가 버튼 누를시
var count = 0;
function addFile() {
	count++;
	var newItem = document.createElement("div");
	newItem.setAttribute("id", "file_" + count);
	var html = '<input type="button" name="filename" onClick="showImageWindow()" value="등록">'
			+ '<input type="button" value="삭제" onClick="remove('
			+ count
			+ ')">';
	newItem.innerHTML = html;
	var itemListNode = document.getElementById("file");
	itemListNode.appendChild(newItem);
}
// 이미지등록 삭제버튼 누를시
function remove(idCount) {
	var item = document.getElementById("file_" + idCount);
	if (item != null) {
		item.parentNode.removeChild(item);
	}
}
// 이미지등록 버튼 누를시
function upload_click() {
	GdsUpLoader.submit();
}
// 상품 업데이트
function GsfUpdate() {
	GdsCellModify.submit();
}
// open GdsUpLoader window
function showImageWindow(position) {
	url = "GdsUpLoader.do?position=" + position;
	window
			.open(
					url,
					"post",
					"toolbar=no, width = 550, height = 450, directories=no, status=yes, scrollbars=yes, menubar=no");
}
function popupImage(id) {
	url = "LargeImageView.do?id=" + id;
	window
			.open(
					url,
					"post",
					"toolbar=no, width = 1000, height = 1000, directories=no, status=yes, scrollbars=yes, menubar=no");
}
function sendImage(position, name) {
	var theForm = opener.document.GdsCellForm;
	if (position == 'Basic') {
		theForm.tbBasic.value = name;
		theForm.imgGoods.src = 'xUpload/GdsData/TempImages/' + name;
		theForm.imgGoods.width = 250;
		theForm.imgGoods.height = 250;
	}
	if (position == 'Front') {
		theForm.tbFront.value = name;
/*theForm.imgGdsImages01.src = 'xUpload/GdsData/TempImages/' + name;
		theForm.imgGdsImages01.width = 50;
		theForm.imgGdsImages01.height = 50;*/
	}
	if (position == 'Rear') {
		theForm.tbRear.value = name;
	}
	if (position == 'Right') {
		theForm.tbRight.value = name;
	}
	if (position == 'Left') {
		theForm.tbLeft.value = name;
	}
	if (position == 'Top') {
		theForm.tbTop.value = name;
	}
	if (position == 'Bottom') {
		theForm.tbBottom.value = name;
	}
	self.close();
}
function changeImage(cnt) {
	var theForm = opener.document.GdsCellForm;
	if (cnt == 1) {
		alert(theForm.imgGoods.src);
		alert(theForm.imgGdsImages01.src);
		theForm.imgGoods.src = theForm.imgGdsImages01.src;
		theForm.imgGoods.width = 250;
		theForm.imgGoods.height = 250;
	}
}
