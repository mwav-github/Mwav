function amountCheck(amount) {

	evalGoodsCnt = parseInt(amount);	
	
	if(evalGoodsCnt == "") {
		alert('주문수량을 입력하십시오.');
		frmCart.amount.focus();
		return false;
	}
	else if(isNaN(evalGoodsCnt)) {
		alert('주문수량을 숫자로 입력하십시오.');
		frmCart.amount.focus();
		return false;
	}
	else if(evalGoodsCnt < 1) {
		alert('한개 이상은 주문하셔야 합니다.');
		frmCart.amount.focus();
		return false;
	}
	else {
		return true;
	}
}



function onDB1Click() 
{
	form = document.CARTLIST;	
	
	vgoodsPr = 0;
	vgoodsNo = 0;
	vcartCnt = 0;
	vsumGoodsPr = 0;
	vCostOptAmt = 0;
	vtot = 0;
	i = 0;
	var retValue = ""; 
	var ret2Value = ""; 
	
	form["updateCart"].value = "Y";
	form["OPCODE"].value = "edit";  
	
	while( i< 4)
	{
		var retValue = ""; 
		vgoodsNo = parseInt(DB2[i]) ;
		vgoodsPr = parseInt(DB2[i+1]);
		vcartCnt = parseInt(form["CARTCNT"+(i/2+1)].value);
		
		if(form["txtCostOptAmt"+(i/2+1)] != null)
		{
			alert(form["txtCostOptAmt"+(i/2+1)].value);
			vCostOptAmt = parseInt(form["txtCostOptAmt"+(i/2+1)].value) ;
		}
			
		if(vcartCnt == 0)
		{
			alert("취소는 취소를 클릭하세요");
			return;
		}
		vsumGoodsPr = (vgoodsPr * vcartCnt)+""; 
		
		for(j=0; j<vsumGoodsPr.length; j++) 
        { 
                if(j > 0 && (j%3)==0)
                { 
                        retValue = vsumGoodsPr.charAt(vsumGoodsPr.length - j -1) + "," + retValue; 
                }
                else 
                { 
                        retValue = vsumGoodsPr.charAt(vsumGoodsPr.length - j -1) + retValue; 
                } 
        }
   	
		form["txtgoodsPr"+(i/2+1)].value = retValue + "원";	
		form["CART" + (i/2+1) + "_005"].value = form["CARTCNT"+(i/2+1)].value;
		
		if(form["txtCostOptAmt"+(i/2+1)] != null)
		{
			vtot += parseInt(vsumGoodsPr)+ vCostOptAmt ;
		}
		else 
		{
			vtot += parseInt(vsumGoodsPr);
		}
		
		i = i+2;
	}	
	vtot = vtot + "";
	for(j=0; j<vtot.length; j++) 
    { 
            if(j > 0 && (j%3)==0) { 
                    ret2Value = vtot.charAt(vtot.length - j -1) + "," + ret2Value; 
            }
            else { 
                    ret2Value = vtot.charAt(vtot.length - j -1) + ret2Value; 
            } 
    }    
    form["txtchonGoodsPr"].value = ret2Value + "원";
}


function alterAmount(gCode,stockID,amountHint) {
	var url = "";
	var amount = "";
	if (isNaN(frmCart.amount.length)) {
		amount = frmCart.amount.value;
	} else {
		amount = frmCart.amount[amountHint].value;
	}
	if (amountCheck(amount)) {
		location.href = "ViewCart_ok.asp?mode=a&g=" + gCode + "&stockID=" + stockID + "&amount=" + amount;
	}
	//alert(typeof(frmCart.amount));
}
