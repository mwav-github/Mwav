<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HRView.aspx.cs" Inherits="ADMIN.Admins_Marketing_HResources_HRView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex,nofollow" />
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css" />

    <script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>

    <title>The Human Resources Management</title>
</head>
<body>
    <form id="frmHRView" runat="server">
    <table id="Table5" cellspacing="0" cellpadding="0" width="810" border="0">
        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td width="26"><img height="27" src="../../zImages/admin_top009.gif" width="26" /></td>
                        <td bgcolor="#f4f4f4">현재위치 : <asp:Literal ID="litPageTitle" runat="server" /></td>
                        <td width="10"><img height="27" src="../../zImages/admin_top010.gif" width="10" /></td>
                    </tr>
              </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" height="20">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="800" border="0">
                    <tr>
                        <td width="169">
                            <img height="53" src="Images/HResource_004.gif" width="176" />                        </td>
                        <td background="Images/HResource_005.gif">&nbsp;                      </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#ffffff">
                <table cellspacing="1" cellpadding="3" width="780" bgcolor="#3a8bb1" border="0">
                    <tr>
                        <td align="center" bgcolor="#ffffff">
                            <table cellspacing="2" cellpadding="1" width="100%" border="0">
                                <tr>
                                    <td colspan="2" height="30">
                                        카드번호: #
                                        <asp:Literal ID="bc_id" runat="server"></asp:Literal>
                                    </td>
                                    <td>&nbsp;
                                        
                                  </td>
                                    <td>&nbsp;
                                        
                                  </td>
                                    <td>&nbsp;
                                        
                                  </td>
                                </tr>
                                <tr align="center" bgcolor="#66ffcc">
                                    <td class="Bwhite" bgcolor="#00618e" height="30">
                                        회사명
                                    </td>
                                    <td class="Bwhite" bgcolor="#00618e">
                                        부서명
                                    </td>
                                    <td class="Bwhite" bgcolor="#00618e">
                                        직급
                                    </td>
                                    <td class="Bwhite" bgcolor="#00618e">
                                        이름
                                    </td>
                                    <td class="Bwhite" bgcolor="#00618e">
                                        중요도
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="#eeeeee" height="25">
                                        <asp:Literal ID="bcCompany" runat="server"></asp:Literal>
                                    </td>
                                    <td bgcolor="#eeeeee">
                                        <asp:Literal ID="bcDept" runat="server"></asp:Literal>
                                    </td>
                                    <td bgcolor="#eeeeee">
                                        <asp:Literal ID="bcClass" runat="server"></asp:Literal>
                                    </td>
                                    <td bgcolor="#eeeeee">
                                        <asp:Literal ID="bcName" runat="server"></asp:Literal>
                                        &nbsp;
                                    </td>
                                    <td bgcolor="#eeeeee">
                                        &nbsp;
                                        <asp:Literal ID="bcStatus" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
              </table>
                <br />
                <table cellspacing="2" cellpadding="1" width="780" border="0">
                    <tr align="center" bgcolor="#66ffcc">
                        <td class="Bwhite" bgcolor="#0082cc" height="30">
                            분류그룹                        </td>
                        <td class="Bwhite" bgcolor="#00618e">
                            개요설명
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#eeeeee" height="25">
                            &nbsp;
                            <asp:Literal ID="bcGroup" runat="server"></asp:Literal>
                        </td>
                        <td bgcolor="#eeeeee">
                            <asp:Literal ID="bcNote" runat="server"></asp:Literal>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#ffffff">
                <table cellspacing="2" cellpadding="2" width="780" border="0">
                    <tr align="center">
                        <td valign="top" colspan="2" height="5">
                        </td>
                    </tr>
                    <tr align="center" bgcolor="#707070">
                        <td class="Bwhite" bgcolor="#3a8bb1" height="25">
                            전화번호                        </td>
                        <td bgcolor="#3a8bb1" class="Bwhite">
                            인터넷주소                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table cellspacing="2" cellpadding="5" width="100%" border="0">
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        연락번호
                                    </td>
                                    <td>
                                        <asp:Literal ID="bcPhone" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        팩스번호
                                    </td>
                                    <td>
                                        <asp:Literal ID="bcFax" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        핸드폰번호
                                    </td>
                                    <td>
                                        <asp:Literal ID="bcCellP" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <table cellspacing="2" cellpadding="5" width="100%" border="0">
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        홈페이지
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="hlHomepage" runat="server" Target="_blank"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        이메일
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="hlEmail" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        기타인터넷
                                    </td>
                                    <td>
                                        <asp:Literal ID="bcInternet" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="Bwhite" align="center" bgcolor="#3a8bb1" height="25">
                            주소지                        </td>
                        <td class="Bwhite" align="center" bgcolor="#3a8bb1" height="25">
                            등록정보                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table cellspacing="2" cellpadding="5" width="100%" border="0">
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        우편번호
                                    </td>
                                    <td>
                                        <asp:Literal ID="zipcode" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        주 소
                                    </td>
                                    <td>
                                        <asp:Literal ID="address" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <table cellspacing="2" cellpadding="5" width="100%" border="0">
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        등록인
                                    </td>
                                    <td>
                                        <asp:Literal ID="registrant" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        등록일
                                    </td>
                                    <td>
                                        <asp:Literal ID="bcRegisterDT" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        수정일
                                    </td>
                                    <td>
                                        <asp:Literal ID="bcUpdateDT" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f3f3f3">
                                        IP 어드레스
                                    </td>
                                    <td>
                                        <asp:Literal ID="IPaddress" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr align="center">
                        <td valign="top" colspan="2">
                            <table cellspacing="1" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td class="Bwhite" align="left" bgcolor="#3a8bb1" height="25">
                                        &nbsp; 히스토리 내역                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="left" height="120">
                                        <div id="Layer1" style="overflow-y: scroll; visibility: visible; overflow-x: hidden;
                                            width: 100%; height: 200px">
                                            <div class="ContentBreak">
                                                <asp:Literal ID="bcDescription" runat="server"></asp:Literal>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="780" border="0">
                    <tr valign="top">
                        <td align="center" colspan="2">
                            <asp:Panel ID="pnAdminView" runat="server" Visible="False">
                                <table cellspacing="1" cellpadding="0" width="98%" border="0">
                                    <tr>
                                        <td class="Bwhite" align="center" bgcolor="#005983" height="25">
                                            관리데이터 보기
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#005983">
                                            <table cellspacing="1" cellpadding="0" width="100%" border="0">
                                                <tr bgcolor="#f2f3f9">
                                                    <td valign="top" align="center" bgcolor="#ffffff" rowspan="2">
                                                        <table cellspacing="1" cellpadding="0" width="100%" border="0">
                                                            <tr bgcolor="#f2f3f9">
                                                                <td align="center" bgcolor="#e0fbff" height="30">
                                                                    관리그룹
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" bgcolor="#ffffff" height="30">
                                                                    <asp:Literal ID="bcAGroup" runat="server"></asp:Literal>
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td align="center" bgcolor="#e0fbff" height="30">
                                                                    포인트
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td align="center" bgcolor="#ffffff" height="30">
                                                                    <asp:Literal ID="bcAGrade" runat="server"></asp:Literal>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="center" bgcolor="#e0fbff" height="30">
                                                        관리커멘트
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="left" bgcolor="#ffffff" height="90">
                                                        <div class="ContentBreak">
                                                            <asp:Literal ID="bcAdminNote" runat="server"></asp:Literal>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnAdminEdit" runat="server" Visible="False" DESIGNTIMEDRAGDROP="1243">
                                <table cellspacing="1" cellpadding="0" width="98%" border="0">
                                    <tr>
                                        <td class="Bwhite" align="center" bgcolor="#005983" height="25">
                                            관리데이터 입력
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#005983">
                                            <table cellspacing="1" cellpadding="0" width="100%" border="0">
                                                <tr bgcolor="#f2f3f9">
                                                    <td valign="top" align="center" bgcolor="#ffffff" rowspan="2">
                                                        <table cellspacing="1" cellpadding="0" width="100%" border="0">
                                                            <tr bgcolor="#f2f3f9">
                                                                <td align="center" bgcolor="#e0fbff" height="30">
                                                                    관리그룹
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" bgcolor="#ffffff" height="30">
                                                                    &nbsp;
                                                                    <asp:DropDownList ID="ddlAGroup" runat="server">
                                                                        <asp:ListItem Value="">8~선택하세요~8</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="분류를 입력하세요."
                                                                        ControlToValidate="ddlAGroup">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 41px" align="center" bgcolor="#ffffff" height="20">
                                                                    <asp:TextBox ID="tbAGroup" runat="server" ToolTip="추가그룹을 입력하세요." MaxLength="50" CssClass="box003"
                                                                        Width="130px" OnTextChanged="tbBCGroup_TextChanged"></asp:TextBox>
                                                                    <asp:ImageButton ID="ibGInsert" runat="server" ToolTip="그룹추가" CausesValidation="False"
                                                                        ImageUrl="../../zImages/btn_add_group.gif"></asp:ImageButton>
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td align="center" bgcolor="#e0fbff" height="30">
                                                                    포인트
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td align="center" bgcolor="#ffffff" height="30">
                                                                    <asp:TextBox ID="tbAGrade" runat="server" MaxLength="3" CssClass="box003" Width="30px"
                                                                        Columns="3"></asp:TextBox>
                                                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="숫자 1~100 안에서 입력하세요."
                                                                        ControlToValidate="tbAGrade" Display="Dynamic" Type="Integer" MaximumValue="100"
                                                                        MinimumValue="1">*</asp:RangeValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="중요도를 입력하세요."
                                                                        ControlToValidate="tbAGrade" Display="Dynamic">*</asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="163px" Height="18px"
                                                            ShowSummary="False" ShowMessageBox="True"></asp:ValidationSummary>
                                                    </td>
                                                    <td align="center" bgcolor="#e0fbff" height="30">
                                                        관리커멘트
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="left" bgcolor="#ffffff" height="90">
                                                        <div class="ContentBreak">
                                                            <asp:TextBox ID="tbAdminNote" runat="server" MaxLength="8000" CssClass="box004" Width="560px"
                                                                Rows="12" TextMode="MultiLine"></asp:TextBox>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#ffffff">
                <table height="2" cellspacing="1" cellpadding="0" width="782" border="0">
                    <tr>
                        <td bgcolor="#3a8bb1" height="2">
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#3a8bb1" height="1">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top" align="center" bgcolor="#ffffff">
            <td height="100">
                <table cellspacing="0" cellpadding="0" width="98%" border="0">
                    <tr>
                        <td align="right">&nbsp;
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="center" height="30">
                            <asp:HyperLink ID="hlList" runat="server" ToolTip="전체리스트" NavigateUrl="HRList.aspx" ImageUrl="../../zImages/btn_view_list.gif"/>
                            <asp:HyperLink ID="hlBack" runat="server" ToolTip="뒤로" NavigateUrl="javascript:history.back();" ImageUrl="../../zImages/btn_admin_back.gif"/>
                            <asp:ImageButton ID="ibModfy" runat="server" Visible="False" ImageUrl="../../zImages/btn_admin_modify.gif" onclick="ibModfy_Click"/>
                            <asp:ImageButton ID="ibDelete" runat="server" Visible="False" ImageUrl="../../zImages/btn_admin_delete.gif" onclick="ibDelete_Click" />                            
                            <asp:ImageButton ID="ibEliminate" runat="server" Visible="False" ImageUrl="../../zImages/btn_admin_completedel.gif" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
