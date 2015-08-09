<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>메일 직접 입력</TITLE>
<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<link href="../../Include_css/Object.css" rel="stylesheet" type="text/css">
<link href="../../Include_css/Style.css" rel="stylesheet" type="text/css">

<SCRIPT language=JavaScript>
<!-- 
function addr_send(){	
	var mel1 = document.emailForm.mailAddress1.value;
	var mel2 = document.emailForm.mailAddress2.value;
	var mel = mel1 + "@"+mel2;
	
	if(/^[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+)*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+)+$/.test(mel) == false)	{ 
		alert("문자열이 공백이거나 잘못된 전자 우편주소를 입력하셨습니다.\n다시 입력해 주십시오.");   
		return;                 
	}
	
	opener.document.frmMbr.MbrEmail1.value = mel1;
	opener.document.frmMbr.MbrEmail2.options[0].text = mel2;
	opener.document.frmMbr.MbrEmail2.options[0].value = mel2;
	opener.document.frmMbr.MbrEmail2.options[0].selected = true;	
	opener.document.frmMbr.MbrEmail.value = mel;
	self.close(); 
}
function cncl_send()
{
	opener.document.frmMbr.MbrEmail1.value ="";
	opener.document.frmMbr.MbrEmail2.options[0].text = "선택하세요";
	opener.document.frmMbr.MbrEmail2.options[0].value = "";
	opener.document.frmMbr.MbrEmail2.options[0].selected = true;	
	opener.document.frmMbr.MbrEmail.value = "";
	self.close();
}
window.resizeTo(500,260);
-->
</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width=490 border=0>
  <TBODY>
  <TR>
    <TD bgColor=#50a149 colSpan=3>
		<IMG src="../../Images/TransparentImage.gif" width="10" height="10">
	</TD></TR>
  <TR>
      <TD bgColor=#50a149><IMG src="../../Images/TransparentImage.gif" width="10" height="10"></TD>
    <TD width=470>
      <TABLE cellSpacing=0 cellPadding=1 width=470 align=center bgColor=#dfdfdf 
      border=0>
        <FORM name="emailForm">
        <TBODY>
        <TR>
          <TD class=textsmall bgColor=#ffffff height=40>
		  <IMG src="Images/muMailETC.gif" width="93" height="18"></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD class=text bgColor=#f2f2f2 height=30>
                  <DIV align=center>E-mail 주소를 입력해 주세요.</DIV></TD></TR>
              <TR>
                <TD bgColor=#dfdfdf height=1><IMG height=1 src="" 
              width=10></TD></TR>
              <TR>
                <TD height=60 align="center" bgColor=#ffffff>
                  <INPUT name="mailAddress1" value="<%= Request.QueryString("eml_id") %>" size="15" maxlength="20"> @ 
				  <INPUT name="mailAddress2" size="20" maxlength="30"></TD></TR>
              <TR>
                <TD class=text bgColor=#ffffff height=1>
                  <DIV align=center>@ 이후 E-mail 주소만 입력해 
            주세요.</DIV></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD bgColor=#ffffff height=40>
            <DIV align=center>
            <TABLE cellSpacing=0 cellPadding=10 width="100%" border=0>
              <TBODY>
              <TR>
                <TD>
                  <DIV align=right><A href="javascript:addr_send();"><IMG 
                  height=36 src="Images/mu_ok.gif" width=112 
                  border=0></A></DIV></TD>
                <TD><A href="javascript:cncl_send();"><IMG height=34 
                  src="Images/mu_cancel.gif" width=110 
                  border=0></A></TD></TR></TBODY></TABLE></DIV></TD></TR></FORM>
        </TABLE></TD>
      <TD bgColor=#50a149><IMG src="../../Images/TransparentImage.gif" width="10" height="10"></TD>
    </TR>
  <TR>
      <TD bgColor=#50a149 colSpan=3><IMG src="../../Images/TransparentImage.gif" width="10" height="10"></TD>
    </TR></TBODY></TABLE></BODY></HTML>
