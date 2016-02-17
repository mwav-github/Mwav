<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MbrView.aspx.cs" Inherits="ADMIN.Admins_Members_MbrView" %>
<%@ Import Namespace="App_Code.Member" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex,nofollow" />
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="/App_Themes/Objects.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/OverallPage.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="/CommonLibrary/CommonLibrary.js" type="text/javascript"></script>
    <title>The Members Management</title>
</head>
<body>
    <form id="frmMember" method="post" runat="server">
    <table id="Table5" cellspacing="0" cellpadding="0" width="810" border="0">
        <tr>
            <td bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td width="22">
                            <img height="27" src="../zImages/admin_top009.gif" width="22" />
                        </td>
                        <td bgcolor="#dfdfdf">
                            현재위치 : <asp:Literal ID="litPageTitle" runat="server" />
                        </td>
                        <td>
                            <img height="27" src="../zImages/admin_top010.gif" width="10" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff" height="20">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#ffffff">
                <table cellspacing="0" cellpadding="0" width="800" border="0">
                    <tr>
                        <td width="192">
                            <img width="192" height="54" src="Images/member_004.gif" />
                        </td>
                        <td background="Images/member_005.gif">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#ffffff">
                &nbsp;
            </td>
        </tr>
        <tr valign="top" align="center" bgcolor="#ffffff">
            <td height="300">
                <table cellspacing="0" cellpadding="0" width="780" border="0">
                    <tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="780" border="0">
                                <tr>
                                    <td valign="top">
                                        <table cellspacing="1" cellpadding="2" width="100%" border="0">
                                            <tr>
                                                <td class="Bwhite" align="center" bgcolor="#005983" colspan="2" height="25">
                                                    기본정보                                                 </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;회원번호
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="member_id" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;로그인아이디
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="loginID" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;로그인암호
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="loginPW" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;회원명
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="MbrName" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" style="height: 22px" bgcolor="#707070" height="22">
                                                    &nbsp;연락전화번호
                                                </td>
                                                <td style="height: 22px">
                                                    &nbsp;
                                                    <asp:Literal ID="phone" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;핸드폰번호
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="cellularP" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;이메일
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:HyperLink ID="hlEmail" runat="server"></asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;주민등록번호
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="SSN" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;주소
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="mAddress" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;뉴스레더신청
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="newsLetter" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;PW찾기질문
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="findingID" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;PW찾기답
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="findingA" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;FakeMember
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="litFakeMbr" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                        <table cellspacing="1" cellpadding="2" width="100%" border="0">
                                            <tr>
                                                <td class="Bwhite" align="center" bgcolor="#005983" colspan="2" height="25">
                                                    평가치
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;회원등급
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="mLevel" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;누적구매액/횟수
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="howMuch" runat="server"></asp:Literal>
                                                    &nbsp;/
                                                    <asp:Literal ID="howMany" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;현재/누적적립금&nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="RFund" runat="server"></asp:Literal>
                                                    &nbsp;/
                                                    <asp:Literal ID="RFundAC" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;현재/누적포인트
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="point" runat="server"></asp:Literal>
                                                    &nbsp;/
                                                    <asp:Literal ID="pointAC" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;미지불금액
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="unpaid" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;누적미지불금액
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="unpaidAC" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;추천인ID
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="rcmderID" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;가입일
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="joinDT" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;수정일
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="modifyDT" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;최근방문일
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="recentLogin" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;최근IP
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="IPaddress" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Bwhite" bgcolor="#707070" height="22">
                                                    &nbsp;탈퇴일
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Literal ID="leaveDT" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <asp:Panel ID="pnAdditionalInfo" runat="server" Visible="False">
                        <tr>
                            <td height="2">
                            </td>
                        </tr>
                        <tr>
                            <td height="2" bgcolor="#aaaaaa">
                            </td>
                        </tr>
                        <tr>
                            <td height="5">
                            </td>
                        </tr>
                        <tr>
                            <td class="Bwhite" align="center" bgcolor="#005983" height="25">
                                부가정보
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="0" width="780" border="0">
                                    <tr>
                                        <td valign="top">
                                            <table cellspacing="1" cellpadding="2" width="100%" border="0">
                                                <tr>
                                                    <td class="Bwhite" align="center" bgcolor="#707070" height="25">
                                                        아바타이미지
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="middle" align="center" height="200">
                                                        <asp:Image ID="avataImage" runat="server" ImageUrl="../../xUpload/MbrData/Avata/AvaPic_default.gif">
                                                        </asp:Image>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <table cellspacing="1" cellpadding="2" width="100%" border="0">
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;홈페이지
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:HyperLink ID="hlHomepage" runat="server"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;메신져
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="messenger" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;취미&nbsp;
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="hobbies" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;차량정보
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="carInfo" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;생일
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                        <asp:Literal ID="litBirthDay" runat="server"></asp:Literal>
                                                    </td>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;결혼기념일
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                        <asp:Literal ID="litWeddingDay" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;월급
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                        <asp:Literal ID="monthlyPay" runat="server"></asp:Literal>
                                                    </td>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;자녀수
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                        <asp:Literal ID="children" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;
                                                    </td>
                                                    <td bgcolor="#707070" colspan="3">
                                                        &nbsp;<span class="Bwhite">남기고 싶은 말 </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" height="22">
                                                        <div class="ContentBreak">
                                                            <asp:Literal ID="mark" runat="server"></asp:Literal>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;
                                                    </td>
                                                    <td bgcolor="#707070" colspan="3">
                                                        &nbsp;<span class="Bwhite">회사정보</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;회사명
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="company" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;직업명
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="jobType" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;연락번호
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="officeP" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Bwhite" bgcolor="#707070" height="22">
                                                        &nbsp;회사주소
                                                    </td>
                                                    <td colspan="3">
                                                        &nbsp;
                                                        <asp:Literal ID="oAddress" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td height="5">
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#005983" height="2">
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="98%" border="0">
                    <tr>
                        <td align="right" height="30">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" height="50">
                            <asp:HyperLink ID="hlList" runat="server" ImageUrl="../zImages/btn_view_list.gif"
                                NavigateUrl="MbrList.aspx"></asp:HyperLink>
                            <asp:HyperLink ID="hlBack" runat="server" ImageUrl="../zImages/btn_admin_back.gif"
                                NavigateUrl="javascript:history.back();"></asp:HyperLink>
                            <asp:ImageButton ID="ibModfy" runat="server" Visible="False" ImageUrl="../zImages/btn_admin_modify.gif">
                            </asp:ImageButton>
                            <asp:ImageButton ID="ibDelete" runat="server" Visible="False" ImageUrl="../zImages/btn_admin_delete.gif">
                            </asp:ImageButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
