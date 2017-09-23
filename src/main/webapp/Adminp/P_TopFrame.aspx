<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_TopFrame.aspx.cs" Inherits="PARTNER.Adminp_TopFrame" trace="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="robots" content="noindex,nofollow"/>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css"/>
<link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
<title>The Top Frame</title>
</head>
<body>
<form id="frmTop" runat="server">
  <table width="100%" height="126" border="0" cellpadding="0" cellspacing="0" style="background-image:url(/Adminp/zImages/A_topmenu_bg01.gif)">
    <tr>
      <td width="150" align="center"><a href="P_DefaultFrameset.aspx" target="_parent"><img src="/Adminp/zImages/A_top_logo.gif" border="0" align="top" /></a><br />
          <asp:Label ID="pCompany" runat="server"></asp:Label>
        </td>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top" style="padding-left:15px">
              <table width="390" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center" style="padding-left:5px">
                    <table width="0" border="0" cellpadding="2" cellspacing="1" bgcolor="#f1f1f1">
                      <tr>
                        <td bgcolor="#FFFFFF">
                          <table width="60" height="70" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="left">&nbsp;
                                <asp:HyperLink ID="hlMyPic" runat="server" Target="BodyFrame" >
                                  <asp:image id="imgMyPic" runat="server" ImageUrl="/zUpload/stfData/MyPic_default.gif" Height="70" Width="60" ToolTip="사진을 업로드하세요" AlternateText="[직원사진]" />                                </asp:HyperLink>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td align="left" style="padding-left:10px">
                    <table cellspacing="0" cellpadding="0" width="160" border="0">
                      <tr>
                        <td width="60"><img src="zImages/A_icon003.gif" width="7" height="7" align="absmiddle" /> <strong>사 번 : </strong> </td>
                        <td width="82">
                          <asp:Literal id="staffNbr" runat="server" Text="사번"></asp:Literal>
                        </td>
                      </tr>
                      <tr>
                        <td><img src="zImages/A_icon003.gif" width="7" height="7" align="absmiddle" /> <strong>부 서 : </strong> </td>
                        <td>
                          <asp:Literal ID="DeptName" runat="server" Text="부서"></asp:Literal>
                        </td>
                      </tr>
                      <tr>
                        <td><img src="zImages/A_icon003.gif" width="7" height="7" align="absmiddle" /> <strong>직 급 : </strong> </td>
                        <td>
                          <asp:Literal id="sClass" runat="server" Text="직급"></asp:Literal>
                          &nbsp;
                          <asp:Literal ID="sLevel" runat="server" Text="권한"></asp:Literal>
                        </td>
                      </tr>
                    </table>
                  </td>
                  <td align="left">
                    <table cellspacing="0" cellpadding="0" width="160" border="0">
                      <tr>
                        <td width="78"><strong><img src="zImages/A_icon003.gif" width="7" height="7" align="absmiddle" /> 성 명 : </strong> </td>
                        <td width="82">
                          <asp:Literal id="sName" runat="server" Text="직원명"></asp:Literal>
                        </td>
                      </tr>
                      <tr>
                        <td><img src="zImages/A_icon003.gif" width="7" height="7" align="absmiddle" /><strong> 아이디 :</strong> </td>
                        <td>
                          <asp:Literal id="sLoginID" runat="server" Text="직원아이디"></asp:Literal>
                        </td>
                      </tr>
                      <tr>
                        <td><strong><img src="zImages/A_icon003.gif" width="7" height="7" align="absmiddle" /> 프로모션 
                          : </strong> </td>
                        <td>
                          <asp:Literal id="promoting" runat="server" Text="프로모팅결과"></asp:Literal>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td valign="top">
              <table width="390" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="27" class="abold" style="padding-left:5px"><img src="/Adminp/zImages/Info_list.gif" align="absmiddle"> 각종현황정보 </td>
                </tr>
                <tr>
                  <td style="padding:5px 0px 3px 10px">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="40%" align="center">
                          <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                              <td width="80" align="left"><img src="zImages/A_icon004.gif" width="8" height="10" /> 메세지 : </td>
                              <td align="left">-</td>
                            </tr>
                            <tr>
                              <td width="80" align="left"><img src="zImages/A_icon004.gif" width="8" height="10" />
                                <asp:HyperLink ID="hlQnAList" runat="server" Target="BodyFrame">고객문의</asp:HyperLink>
                                :&nbsp; </td>
                              <td align="left">
                                <asp:Label ID="UserQuestionNumber" runat="server">-</asp:Label>
                              </td>
                            </tr>
                            <tr>
                              <td width="80" align="left"><img src="zImages/A_icon004.gif" width="8" height="10" /> 오늘공지 : </td>
                              <td align="left">-</td>
                            </tr>
                          </table>
                        </td>
                        <td width="30%" align="center">
                          <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                              <td width="75" align="left"><img src="zImages/A_icon004.gif" width="8" height="10" />
                                <asp:HyperLink id="hlStaff" runat="server" Target="BodyFrame" NavigateUrl="Partners/PtnList.aspx">직원수</asp:HyperLink>
                                : </td>
                              <td align="left">
                                <asp:Literal id="litAllStfsNbr" runat="server" Text="-"></asp:Literal>
                              </td>
                            </tr>
                            <tr>
                              <td width="75" align="left"><img height="10" src="zImages/A_icon004.gif" width="8" />
                                <asp:HyperLink id="hlMember" runat="server" Target="BodyFrame">회원수</asp:HyperLink>
                                : </td>
                              <td align="left">
                                <asp:Literal id="litAllMbrsNbr" runat="server" Text="-"></asp:Literal>
                              </td>
                            </tr>
                            <tr>
                              <td align="left"><img src="zImages/A_icon004.gif" width="8" height="10" /> 설문조사 : </td>
                              <td align="left">-</td>
                            </tr>
                          </table>
                        </td>
                        <td width="30%" align="center">
                          <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                              <td width="80" align="left"><img height="10" src="zImages/A_icon004.gif" width="8" />&nbsp;신규주문 
                                :</td>
                              <td align="left">-</td>
                            </tr>
                            <tr>
                              <td align="left"><img height="10" src="zImages/A_icon004.gif" width="8" />
                                <asp:HyperLink id="hlGoods" runat="server" Target="BodyFrame">제품수</asp:HyperLink>
                                :</td>
                              <td align="left">
                                <asp:Literal id="litAllGdsNbr" runat="server" Text="-"></asp:Literal>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td width="100" align="center">
        <table cellspacing="2" cellpadding="3" border="0">
          <tr>
            <td>
              <asp:HyperLink id="hlModifyMe" runat="server" ImageUrl="/Adminp/zImages/btn_update_Info.gif" Target="BodyFrame"></asp:HyperLink>
            </td>
          </tr>
          <tr>
            <td>
              <asp:ImageButton ID="ibLogout" runat="server" ImageUrl="/Adminp/zImages/btn_adminp_logout.gif" OnClick="ibLogout_Click"></asp:ImageButton>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="150">&nbsp;</td>
      <td colspan="2" valign="top" style="padding-top:9px">
        <table width="50%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="27"><img src="zImages/A_topmenu_bg02.gif" width="27" height="37" /></td>
            <td align="center" valign="middle" background="/Adminp/zImages/A_topmenu_bg03.gif" bgcolor="#003366" class="Bwhite" style="height: 30px">
              <!--<asp:panel id="pnMainMenu" runat="server" ForeColor="White"></asp:panel>-->
              <asp:PlaceHolder ID="phMyZone" runat="server">
                <span class="Bwhite" style="height: 30px"></span>
                <asp:HyperLink ID="hlMyZone" runat="server" NavigateUrl="P_LeftFrame.aspx?mm=mine" Target="leftFrame" ToolTip="1.나의업무 2.쪽지관리 3.명함관리 4.메일관리" ForeColor="white">마이존</asp:HyperLink>
                | </asp:PlaceHolder>
              <asp:PlaceHolder ID="phCellOrderMgr" runat="server">
                <asp:HyperLink ID="hlCellOrderMgr" runat="server" NavigateUrl="P_LeftFrame.aspx?mm=cOrd" Target="leftFrame" ToolTip="1.나의업무 2.쪽지관리 3.명함관리 4.메일관리" ForeColor="white">핸드폰접수</asp:HyperLink>
                | </asp:PlaceHolder>
              <asp:PlaceHolder ID="phNetOrderMgr" runat="server">
                <asp:HyperLink ID="hlNetOrderMgr" runat="server" NavigateUrl="P_LeftFrame.aspx?mm=nOrd" Target="leftFrame" ToolTip="1.LG070접수리스트 2.LG070접수신청" ForeColor="white">인터넷/전화접수</asp:HyperLink>
                | </asp:PlaceHolder>                
              <asp:PlaceHolder ID="phMembersMgr" runat="server">
                <asp:HyperLink ID="hlMembersMgr" runat="server" NavigateUrl="P_LeftFrame.aspx?mm=mbrs" Target="leftFrame" ToolTip="1.회원기본정보 2.회원부가정보 3.회원평가치 4.회원가입" ForeColor="white">회원관리</asp:HyperLink>
                | </asp:PlaceHolder>
              <!--협력사/공급사-->
              <asp:PlaceHolder ID="phPartners" runat="server">                
                <asp:HyperLink ID="hlPartners" runat="server" NavigateUrl="P_LeftFrame.aspx?mm=ptn" Target="leftFrame" ToolTip="1.협력사목록 2.협력사입력" ForeColor="white">관계사관리</asp:HyperLink>
              </asp:PlaceHolder>
            </td>
            <td width="32"><img src="zImages/A_topmenu_bg04.gif" width="32" height="37" /></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
