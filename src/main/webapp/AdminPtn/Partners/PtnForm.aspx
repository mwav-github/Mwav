<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PtnForm.aspx.cs" Inherits="PARTNER.Adminp_Partners_StfForm" Trace="false" %>
<%@ Register src="~/CommonApps/PostCalls/IDButton.ascx" tagname="IDButton" tagprefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="DateSelector" Src="~/CommonApps/Calendar/DateSelector/DateSelector.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="robots" content="noindex,nofollow"/>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script> 
    <title>The Partner Management</title>
</head>
<body>
    <form id="frmPartner" runat="server">
  <table id="Table5" cellSpacing="0" cellPadding="0" width="815" border="0">
    <tr>
      <td bgColor="#ffffff"><table cellSpacing="0" cellPadding="0" width="100%" border="0">
          <tr>
            <td width="26"><IMG height="27" src="../zImages/admin_top009.gif" width="26"></td>
            <td bgColor="#f4f4f4">현재위치: 
              <asp:Literal ID="litPageTitle" runat="server"></asp:Literal>
            </td>
            <td width="10"><IMG height="27" src="../zImages/admin_top010.gif" width="10"></td>
          </tr>
        </table></td>
    </tr>
    <tr vAlign="top" align="center" bgColor="#ffffff">
      <td height="20">&nbsp;</td>
    </tr>
    <tr vAlign="top" align="center" bgColor="#ffffff">
      <td height="150"><table cellSpacing="0" cellPadding="0" width="800" border="0">
          <tr>
            <td width="149"><IMG height="53" src="Images/staff_004.gif" width="176"></td>
            <td background="Images/staff_008.gif">&nbsp;</td>
          </tr>
        </table>
        <br>
        <table cellSpacing="0" cellPadding="0" width="780" border="0">
          <tr>
            <td vAlign="top" align="center" width="150" height="200">&nbsp;
              <asp:image id="sBusinessPic" runat="server" ImageUrl="~/zUpload/stfData/MyPic_default.gif" Width="70px" Height="90px"></asp:image>
                </td>
            <td vAlign="top" align="center" width="1" bgColor="#999999" rowSpan="2"></td>
            <td vAlign="top" align="center" rowSpan="2"><table cellSpacing="1" cellPadding="0" width="600" border="0">
                <tr>
                  <td class="Bwhite" align="center" width="115" bgColor="#3a8bb1">아이디</td>
                  <td width="482" align="left">&nbsp;
                    <asp:textbox id="sLoginID" runat="server" Width="80px" MaxLength="15" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator11" runat="server" 
                          ErrorMessage="아이디를 넣으세요." ControlToValidate="sLoginID" Display="Dynamic">*</asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="revLoginID" runat="server" 
                          ErrorMessage="아이디는 영문자로 시작하여 3자 이상 15자 까지입니다." ControlToValidate="sLoginID" 
                          ValidationExpression="[A-z]\w{2,15}" Display="Dynamic" 
                          SetFocusOnError="True">*</asp:regularexpressionvalidator>
                    <script type="text/javascript">
                        <!--
                        function ValidateLoginID()
	                    {       
		                    if (document.getElementById("<%= sLoginID.ClientID %>").value.length < 3)
		                    {
			                    alert("검사하기 원하는 ID를 3자이상 입력하세요.");
			                    return false;			                    
		                    }
		                    
		                    if(Tcheck(document.getElementById("<%= sLoginID.ClientID %>"), "직원아이디"))
			                    return false;
			                
			                return true;
	                    }    
	                    -->
                      </script><uc2:IDButton ID="ucLoginID" runat="server" /></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">비밀번호</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="sLoginPW" runat="server" Width="80px" MaxLength="15" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator12" runat="server" ErrorMessage="패스워드를 넣으세요." ControlToValidate="sLoginPW">*</asp:requiredfieldvalidator>
                    <asp:RegularExpressionValidator id="Regularexpressionvalidator4" runat="server" ErrorMessage="암호는 공백없이 4자 이상 입력하세요."
											ControlToValidate="sLoginPW" ValidationExpression="\w{4,14}">*</asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">소속</td>
                  <td style="HEIGHT: 29px" align="left">&nbsp;
                    <asp:dropdownlist id="position1" runat="server" Visible="False">
                      <asp:ListItem Selected="True" Value="">8~선택하세요~8</asp:ListItem>
                    </asp:dropdownlist>                    
                    <asp:Literal ID="position" runat="server"></asp:Literal>
                      
                </tr>                    
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">사번</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="staffNbr" runat="server" Width="80px" MaxLength="14" 
                          CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">부서</td>
                  <td style="HEIGHT: 29px" align="left">&nbsp;
                    <asp:dropdownlist id="DeptName" runat="server">
                      <asp:ListItem Selected="True" Value="">8~선택하세요~8</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator10" runat="server" ErrorMessage="부서를 선택하세요." ControlToValidate="DeptName">*</asp:requiredfieldvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" style="HEIGHT: 19px" align="center" bgColor="#3a8bb1">직급/권한</td>
                  <td style="HEIGHT: 19px" align="left">&nbsp;
                    <asp:dropdownlist id="sClass" runat="server">
                      <asp:ListItem Selected="True" Value="">8~선택하세요~8</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator9" runat="server" ErrorMessage="직급을 선택하세요." ControlToValidate="sClass">*</asp:requiredfieldvalidator>
                    /
                    <asp:textbox id="sLevel" runat="server" MaxLength="3" CssClass="box003" Visible="False" Columns="3"></asp:textbox>
                    <asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="0~250 숫자 안에서 입력하세요." ControlToValidate="sLevel"
											Type="Integer" MaximumValue="255" MinimumValue="0">*</asp:RangeValidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">직원명</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="sName" runat="server" Width="80px" MaxLength="20" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="이름을 입력하세요." ControlToValidate="sName">*</asp:requiredfieldvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">Ext # </td>
                  <td align="left">&nbsp;
                    <asp:textbox id="ExtNbr" runat="server" Width="50px" MaxLength="5" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" width="115" bgColor="#3a8bb1">자택전화</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="phone1" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="phone2" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="phone3" runat="server" Width="70px" MaxLength="12" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">핸드폰</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="cellularP1" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="cellularP2" runat="server" Width="50px" MaxLength="4" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="cellularP3" runat="server" Width="70px" MaxLength="12" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">메일주소</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="sEmail" runat="server" Width="184px" MaxLength="50" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ErrorMessage="이메일을 입력하세요." ControlToValidate="sEmail">*</asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="RegularExpressionValidator3" runat="server" ErrorMessage="이메일을 정확히 입력하세요." ControlToValidate="sEmail"
											ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:regularexpressionvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">홈페이지</td>
                  <td align="left">&nbsp; http://
                    <asp:textbox id="homepage" runat="server" Width="176px" MaxLength="50" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">주민번호</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="SSN1" runat="server" Width="98px" MaxLength="6" CssClass="box003"></asp:textbox>
                    -
                    <asp:textbox id="SSN2" runat="server" Width="104px" MaxLength="7" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" ErrorMessage="주민번호를 입력하세요." ControlToValidate="SSN1">*</asp:requiredfieldvalidator>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" ErrorMessage="주민번호를 입력하세요." ControlToValidate="SSN2">*</asp:requiredfieldvalidator></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">생일</td>
                  <td align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="100"><asp:RadioButtonList ID="rblSLBirth" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem Value="양">양력</asp:ListItem>
                            <asp:ListItem Value="음">음력</asp:ListItem>
                          </asp:RadioButtonList></td>
                        <td><asp:TextBox ID="tbBirthDay" runat="server" CssClass="box003" MaxLength="10" 
                                Columns="9" ReadOnly="True"></asp:TextBox>
                            <uc1:dateselector id="dSelectorBirth" runat="server"></uc1:dateselector></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td class="Bwhite" style="HEIGHT: 19px" align="center" bgColor="#3a8bb1">결혼기념일</td>
                  <td style="HEIGHT: 19px" align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="100"><asp:radiobuttonlist id="rblMarried" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="미">미혼</asp:ListItem>
                            <asp:ListItem Value="기">기혼</asp:ListItem>
                          </asp:radiobuttonlist></td>
                        <td><asp:Panel id="pnWA" Runat="server">
                            <asp:textbox id="tbWeddingDay" runat="server" CssClass="box003" MaxLength="10" 
                                Columns="9" ReadOnly="True"></asp:textbox>
                            <uc1:dateselector id="dSelectorWedding" runat="server"></uc1:dateselector>
                            </asp:Panel></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">등록일(입사일)</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="joinDT" runat="server" MaxLength="10" CssClass="box003" Columns="9" ReadOnly="True"></asp:textbox>
                    <uc1:dateselector id="dSelectorJoinDay" runat="server"></uc1:dateselector></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">부업무</td>
                  <td align="left">&nbsp;
                    <asp:textbox id="subJobs" runat="server" Width="300px" MaxLength="200" CssClass="box003"></asp:textbox></td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">우편번호</td>
                  <td align="left">&nbsp;
                    <asp:TextBox id="zipcode" runat="server" Width="60px" MaxLength="10" CssClass="box003" />
                      &nbsp;
                    <asp:hyperlink id="hlSeekAddr" runat="server" ImageUrl="/Admins/zImages/btn_post_search.gif" ToolTip="우편번호찾기" CssClass="ImgBtnAbsMiddle"/>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator7" runat="server" ErrorMessage="우편번호를 찾으세요." ControlToValidate="zipcode">*</asp:requiredfieldvalidator>
                </td>
                </tr>
                <tr>
                  <td class="Bwhite" align="center" bgColor="#3a8bb1">주소           <td align="left">&nbsp;
                    <asp:textbox id="address1" runat="server" Width="300px" MaxLength="200" CssClass="box003"></asp:textbox>
                    <BR>
                    &nbsp;
                    <asp:textbox id="address2" runat="server" Width="300px" MaxLength="200" CssClass="box003"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator8" runat="server" ErrorMessage="주소를 정확히 입력하세요." ControlToValidate="address2">*</asp:requiredfieldvalidator></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td align="center">&nbsp;
              <asp:image id="sAvataImage" runat="server" Visible="False"></asp:image></td>
          </tr>
          <tr>
            <td colSpan="2">&nbsp;</td>
          </tr>
          <tr>
            <td class="Bbluetitle" align="center" bgColor="#eeeeee" height="30">명함이미지</td>
            <td colSpan="2" align="left">&nbsp;
            
              <input class="box003" id="btnBusinessPic" type="file" size="30" runat="server">
              <asp:checkbox id="cbKeepBP" runat="server" Visible="False" Text="파일보존"></asp:checkbox>
              &nbsp;(70px*90px)</td>
          </tr>
          <asp:panel id="pnAvata" runat="server" Visible="False">
            <TR bgColor="#cccccc">
              <TD class="Bbluetitle" align="center" bgColor="#cccccc" height="30">아바타 </TD>
              <TD colSpan="2">&nbsp;
                <INPUT language="C#" class="box003" id="btnAvataImage" type="file" size="30" runat="server">
                <asp:checkbox id="cbKeepAI" runat="server" Visible="False" Text="파일보존"></asp:checkbox></TD>
            </TR>
            </asp:panel>
          <tr>
            <td class="Bbluetitle" align="center" bgColor="#eeeeee" height="30">데이터</td>
            <td colSpan="2" align="left">&nbsp;
              <INPUT language="C#" class="box003" id="btnData" type="file" size="30" runat="server">
              <asp:checkbox id="cbKeepData" runat="server" Visible="False" Text="파일보존"></asp:checkbox></td>
          </tr>
          <tr vAlign="top">
            <td align="center" colSpan="3"><table cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr>
                  <td class="Bbluetitle">&nbsp;</td>
                </tr>
                <tr>
                  <td class="Bbluetitle" bgColor="#eeeeee" height="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기 타</td>
                </tr>
                <tr>
                  <td vAlign="top" align="center" height="200"><div class="ContentBreak">
                      <asp:textbox id="mark" runat="server" Width="500px" MaxLength="2000" CssClass="box004" Rows="15" TextMode="MultiLine"></asp:textbox>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td align="center" bgColor="#ffffff" height="30">
        <asp:hyperlink id="hlList" runat="server" ImageUrl="/Adminp/zImages/btn_admin_list.gif" NavigateUrl="PtnList.aspx"/>
        <asp:hyperlink id="hlBack" runat="server" ImageUrl="/Adminp/zImages/btn_admin_back.gif" NavigateUrl="javascript:history.back();"/>
        <asp:ImageButton id="ibInsert" runat="server" ImageUrl="/Adminp/zImages/btn_admin_insert.gif" onclick="ibInsert_Click"/>
        <asp:ImageButton id="ibUpdate" runat="server" ImageUrl="/Adminp/zImages/btn_admin_update.gif" onclick="ibUpdate_Click"/>
        </td>
    </tr>
  </table>
  
   <asp:validationsummary id="ValidationSummary1" runat="server" Width="163px" Height="17px" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary>
    </form>
    <!--div id="joiningWebService" style="BEHAVIOR--: url(/CommonLibrary/WebServices/webservice.htc)"></div-->
</body>
</html>
