<%@ Import namespace="JinsLibrary" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PtnList.aspx.cs" Inherits="PARTNER.Adminp_Partners_PtnList" MaintainScrollPositionOnPostback="true" %>

<%@ Register src="~/MessageView/AdminMessage.ascx" tagname="AdminMessage" tagprefix="uc1" %>

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
  <table cellspacing="0" cellpadding="0" width="815" border="0">
    <tr>
      <td colspan="2"><table cellspacing="0" cellpadding="0" width="100%" border="0">
          <tr>
            <td width="26"><img height="27" src="/Adminp/zImages/admin_top009.gif" width="26" /></td>
            <td bgcolor="#f4f4f4">현재위치 : <asp:Literal ID="litPageTitle" runat="server"></asp:Literal></td>
            <td width="10"><img height="27" src="/Adminp/zImages/admin_top010.gif" width="10" /></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2" height="20">&nbsp;</td>
    </tr>
    <tr>
      <td width="10">&nbsp;</td>
      <td><table id="Table5" cellspacing="0" cellpadding="0" width="100%" bgcolor="#ffffff" border="0">
          <tr>
            <td valign="top" align="center" height="300"><table height="49" cellspacing="0" cellpadding="0" width="800" border="0">
                <tr>
                  <td width="176"><img height="49" src="Images/staff_001.gif" width="176"/></td>
                  <td background="Images/staff_002.gif"><table id="Table1" cellspacing="0" cellpadding="0" width="98%" border="0">
                      <tr>
                        <td valign="bottom" align="left" colspan="3" height="25"><table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                              <td><asp:DropDownList id="ddlSearch" runat="server">
                                  <asp:ListItem Value="sName" Selected="True">직원명</asp:ListItem>
                                  <asp:ListItem Value="sLoginID">아이디</asp:ListItem>
                                  <asp:ListItem Value="DeptName">부서</asp:ListItem>
                                  <asp:ListItem Value="sClass">직급</asp:ListItem>
                                  <asp:ListItem Value="staffNbr">사번</asp:ListItem>
                                </asp:DropDownList>
                                <asp:textbox id="tbSearchString" runat="server" Height="15px" ToolTip="검색 키워드를 넣으세요." MaxLength="8"	Width="100px" ontextchanged="tbSearchString_TextChanged"></asp:textbox>
                                <asp:button id="btnSearch" runat="server" Height="23px" Text="검색" EnableViewState="False" onclick="btnSearch_Click"></asp:button>
                              </td>
                              <td align="right"><asp:DropDownList id="ddlSelMenu" runat="server" 
                                      AutoPostBack="True" onselectedindexchanged="ddlSelMenu_SelectedIndexChanged" 
                                      Enabled="False" Visible="False">
                                  <asp:ListItem Value="3" Selected="True">전직원</asp:ListItem>
                                  <asp:ListItem Value="2">재직직원</asp:ListItem>
                                  <asp:ListItem Value="1">임시직원</asp:ListItem>
                                </asp:DropDownList></td>
                            </tr>
                          </table>
                          <asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" EnableViewState="False" ControlToValidate="tbSearchString"
																ErrorMessage="*" ValidationExpression="[0-9A-Za-z\uac00-\ud7a3]{2,10}" Display="Dynamic">*공백,특수문자를 제외한 두글자 이상을 입력하세요.</asp:regularexpressionvalidator></td>
                      </tr>
                    </table></td>
                  <td width="9"><img height="49" src="Images/staff_003.gif" width="9"/></td>
                </tr>
              </table>
              <div id="print_area">
                <asp:datalist id="dataList" runat="server" onitemcommand="dataList_ItemCommand" onitemdatabound="dataList_ItemDataBound">
                  <headertemplate>
                    <table cellspacing="0" cellpadding="0" width="800" height="30" border="0">
                        <tr>
                          <td height="20"></td>
                          <td valign="bottom" align="left"><asp:Literal ID="litSearchResult" runat="server"></asp:Literal>
                            &nbsp; </td>
                          <td valign="bottom" align="right"><asp:Literal ID="litListBrief" runat="server"></asp:Literal></td>
                        </tr>
                      </table>
                    <table cellspacing="1" cellpadding="2" width="800" border="0" bgcolor="#eeeeee">
                      <tr align="center" bgcolor="#3a8bb1">
                        <td width="90" height="25" bgcolor="#3a8bb1" class="Bwhite">사 진</td>
                        <td width="60" class="Bwhite">사 번</td>
                        <td width="60" class="Bwhite">부 서</td>
                        <td width="50" class="Bwhite">직 급</td>
                        <td width="130" class="Bwhite">직원명(아이디)</td>
                        <td width="80" class="Bwhite">연락번호</td>
                        <td width="160" class="Bwhite">이메일</td>
                        <td width="70 " class="Bwhite">관리메뉴</td>
                      </tr>
                    </table>
                  </headertemplate>
                  <alternatingitemstyle BackColor="#e9e9e9"></alternatingitemstyle>
                  <itemtemplate>
                    <table width="800" cellpadding="2" cellspacing="1">
                      <tr align="center">
                        <td width="90" height="80" rowspan="4" align="center"><a href='<%# base.ZoomWindowOpen(DataBinder.Eval(Container.DataItem, "sBusinessPic")) %>'> <img src='/zUpload/stfData/<%# Text.SetDefaultValue(DataBinder.Eval(Container.DataItem, "sBusinessPic").ToString(), "MyPic_default.gif") %>' width="62" height="80"/></a> </td>
                        <td width="60" rowspan="4" align="center"><%# DataBinder.Eval(Container.DataItem, "staffNbr") %></td>
                        <td width="60" rowspan="4" align="center"><%# DataBinder.Eval(Container.DataItem, "DeptName") %></td>
                        <td width="50" rowspan="4" align="center"><!--%# //NmList.ShowLinkTitle(DataBinder.Eval(Container.DataItem, "sClass"), DataBinder.Eval(Container.DataItem, "bnGroup"), DataBinder.Eval(Container.DataItem, "bnTitle") ) %-->
                          <%# DataBinder.Eval(Container.DataItem, "sClass") %> </td>
                        <td width="130" rowspan="4" align="center"><%# DataBinder.Eval(Container.DataItem, "sName") %> (<%# DataBinder.Eval(Container.DataItem, "sLoginID") %>)</td>
                        <td width="80" height="19" align="center" bgcolor="#51b1dd" class="Bwhite">자택전화</td>
                        <td width="160" rowspan="4" align="center"><asp:HyperLink ID="hlEmail" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "sEmail") %>'><%# DataBinder.Eval(Container.DataItem, "sEmail") %></asp:HyperLink>
                        </td>
                        <td width="70" rowspan="4" align="center"><asp:HyperLink ID="hlView" ImageUrl="/Adminp/zImages/btn_admin_view.gif" Visible="False" Runat="server"></asp:HyperLink>
                          <asp:ImageButton ID="ibUpdate" runat="server" CommandName="select" ImageUrl="/Adminp/zImages/btn_admin_update.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "staff_id") %>' CausesValidation="False" Visible="False" />
                          <asp:Literal ID="displayNone" Text="없음" Visible="False" runat="server"></asp:Literal>
                        </td>
                      </tr>
                      <tr align="center">
                        <td height="19" align="center"><%# DataBinder.Eval(Container.DataItem, "phone") %></td>
                      </tr>
                      <tr align="center">
                        <td height="19" align="center" bgcolor="#51b1dd" class="Bwhite">모바일폰</td>
                      </tr>
                      <tr align="center">
                        <td height="19" align="center"><%# DataBinder.Eval(Container.DataItem, "cellularP") %></td>
                      </tr>
                    </table>
                    <table width="800" cellpadding="0" cellspacing="0" height="1" bgcolor="#cccccc">
                      <tr>
                        <td height="1"></td>
                      </tr>
                    </table>
                  </itemtemplate>
                </asp:datalist>
                  <uc1:AdminMessage ID="ucMessage" runat="server" />
                <br/>
              </div>
              <table cellspacing="0" cellpadding="0" width="800" border="0">
                <tr>
                  <td align="center" width="50">&nbsp;</td>
                  <td align="center"><asp:literal id="litPaging" runat="server"></asp:literal></td>
                  <td align="center" width="380"><asp:hyperlink id="hlAllList" runat="server" NavigateUrl="PtnList.aspx" ImageUrl="/Adminp/zImages/btn_admin_list.gif"/>
                    <asp:hyperlink id="hlInsert" runat="server" NavigateUrl="PtnForm.aspx" ImageUrl="/Adminp/zImages/btn_admin_insert.gif"/>
                    <asp:imagebutton id="ibSendMail" runat="server" ImageUrl="/Adminp/zImages/btn_send_mail.gif" AlternateText="메일발송"/>
                    <asp:hyperlink id="hlPrint" runat="server" ImageUrl="/Adminp/zImages/btn_print.gif"/></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
