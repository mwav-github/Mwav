function CheckShoppingCart(frmCSC, pushedBtn) {
	//alert(pushedBtn);
	//evalGoodsCnt = parseInt(form.elements("amount").value);	
	
	frmSize = typeof(frmCSC.gSize);
	frmColor = typeof(frmCSC.gColor);
	if(frmSize == "object" && frmCSC.gSize.value == "") {
		alert('제품크기를 선택하세요.');
		frmCSC.gSize.focus();
		return;
	}

	if(frmColor == "object" && frmCSC.gColor.value == "") {
		alert('제품색상를 선택하세요.');
		frmCSC.gColor.focus();
		return;
	}
	
	if(frmCSC.amount.value == "") {
		alert('주문수량을 입력하십시오.');
		frmCSC.amount.focus();
		return;
	}
	else if(isNaN(frmCSC.amount.value)) {
		alert('주문수량을 숫자로 입력하십시오.');
		frmCSC.amount.focus();
		return;
	}
	else if(frmCSC.amount.value < 1) {
		alert('한개 이상은 주문하셔야 합니다.');
		frmCSC.amount.focus();
		return;
	}
	else {
		if(pushedBtn == "directBuy") {
			SubmitJ("지금 바로구매를 하시겠습니까?", frmOrder, "OrderProcess/HowToPay_ok.asp")
		}
		else {
			frmCSC.submit();
		}
		//return true;
	}
}