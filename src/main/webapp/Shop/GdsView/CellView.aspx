<%@ Page Language="C#" MasterPageFile="~/CompanyItems/CIMasterPage_wide.master" AutoEventWireup="true" CodeFile="CellView.aspx.cs" Inherits="SHOP.Shop_GdsView_CellView" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/CompanyItems/CIMasterPage_wide.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CompanyItemsPlaceHolder" Runat="Server">
  <table cellspacing="0" cellpadding="0" width="810" border="0" id="tblCellView" runat="server">
    <tr>
      <td>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
          <tr>
            <td width="28" valign="bottom"><img src="/Shop/Images/shop_titlebar.gif" width="28" height="22" /></td>
            <td><b>상세보기</b></td>
            <td width="400" align="right" style="padding-right:10px">:: HOME &gt;&gt;휴대폰&gt;&gt;상세보기</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td bgcolor="#ed7a42" height="1"></td>
            <td bgcolor="#f9aa81" height="1"></td>
            <td bgcolor="#ffdcb3" height="1"></td>
          </tr>
        </table>
      </td>
    </tr>
	<tr>
    	<td height="5"></td>
  	</tr>
    <tr>
      <td align="center"><img src="/Shop/Images/shop_img.jpg" /></td>
    </tr>
	<tr>
    	<td height="5"></td>
  	</tr>
    <tr valign="top" align="center" bgcolor="#ffffff">
      <td height="300">
        <div id="print_area">
          <table cellspacing="0" cellpadding="0" width="780" border="0">
            <tr>
              <td>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                  <tr>
                    <td align="center" height="25">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="6"><img src="/Shop/Images/shop_t_bg01.gif" /></td>
                          <td align="center" background="/Shop/Images/shop_t_bg02.gif"><b>제품정보</b></td>
                          <td width="6"><img src="/Shop/Images/shop_t_bg03.gif" width="6" height="36" /></td>
                        </tr>
                        <tr>
                          <td height="3"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                          <td valign="top" width="35%">
                            <table cellspacing="1" cellpadding="2" width="100%" border="0">
                              <tr>
                                <td class="bOrange" align="center" bgcolor="#efefef" height="25"><b class="txt3">상품이미지</b></td>
                              </tr>
                              <tr>
                                <td valign="middle" align="center" height="220">
                                  <asp:Image ID="imgGoods" runat="server" ImageUrl="~/xUpload/GdsData/GdsPic_default.gif"/>
                                </td>
                              </tr>
                              <tr>
                                <td valign="top" align="center" height="70">
                                  <asp:DataList ID="dlGdsImages" 
                                      runat="server" CellPadding="0" RepeatColumns="4" RepeatDirection="Horizontal" 
                                      OnItemDataBound="dlGdsImages_ItemDataBound">
                                    <itemtemplate>
                                      <table cellspacing="2" cellpadding="0" width="100%" align="center">
                                        <tr>
                                          <td>
                                            <asp:Image ID="imgGdsImages" runat="server" ImageUrl="~/xUpload/GdsData/GdsPic_default.gif" Width="50" Height="50"/>
                                          </td>
                                        </tr>
                                      </table>
                                    </itemtemplate>
                                  </asp:DataList>
                                </td>
                              </tr>
                              <tr>
                                <td valign="middle" align="center" height="20">
                                  <asp:HyperLink ID="hlLargeImages" runat="server" ImageUrl="/Shop/Images/btnEnlarge.gif" Visible="False">확대이미지보기</asp:HyperLink>
                                </td>
                              </tr>
                            </table>
                          </td>
                          <td valign="top">
                            <table cellspacing="1" cellpadding="2" width="100%" border="0">
                              <tr>
                                <td class="txt3" width="120" bgcolor="#efefef" height="25"><b>&nbsp;상품코드</b></td>
                                <td colspan="3" align="left">&nbsp;
                                    <asp:Literal ID="gCode_id" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;모델번호</b></td>
                                <td colspan="3" align="left">&nbsp;
                                    <asp:Literal ID="modelNbr" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;상품명&nbsp;</b></td>
                                <td colspan="3" align="left">&nbsp;
                                    <asp:Literal ID="gName" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;일반판매가</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="custPrice" runat="server"></asp:Literal>
                                </td>
                                <td class="Bwhite" width="120" height="22">&nbsp;</td>
                                <td width="200" align="left">&nbsp;</td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;신규입금가</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="newPrice" runat="server"></asp:Literal>
                                </td>
                                <td class="txt3" bgcolor="#efefef" height="22"><b>&nbsp;번호이동가</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="transPrice" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;가입비</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="joinPrice" runat="server"></asp:Literal>
                                </td>
                                <td class="txt3" bgcolor="#efefef" height="22"><b>&nbsp;U-Simm</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="USimmPrice" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;제조(개발)사</b></td>
                                <td width="170" align="left">&nbsp;
                                    <asp:Literal ID="Mfger" runat="server"></asp:Literal>
                                </td>
                                <!--td class="Bwhite" bgcolor="#efefef" height="22">&nbsp;상품상태 </td>
                                <td align="left">&nbsp;
                                  <asp:Literal ID="status" runat="server"></asp:Literal></td-->
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;적립금</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="reserveFund" runat="server"></asp:Literal>
                                </td>
                                <td class="txt3" bgcolor="#efefef" height="22"><b>&nbsp;포인트</b></td>
                                <td align="left">&nbsp;
                                    <asp:Literal ID="point" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="25"><b>&nbsp;키워드</b></td>
                                <td colspan="3" align="left">&nbsp;
                                    <asp:Literal ID="keywords" runat="server"></asp:Literal>
                                </td>
                              </tr>
                              <tr>
                                <td class="txt3" bgcolor="#efefef" height="22"><b>&nbsp;특정상품</b></td>
                                <td colspan="3" align="left">&nbsp;
                                    <asp:Literal ID="GoodsClass" runat="server" Visible="False"></asp:Literal>
                                    <asp:Image ID="imgSpecial" ImageUrl="/Shop/Images/special.gif" runat="server" Visible="False" />  
                                    <asp:Image ID="imgBest" ImageUrl="/Shop/Images/best.gif" runat="server" Visible="False" />  
                                    <asp:Image ID="imgRecommand" ImageUrl="/Shop/Images/recommand.gif" runat="server" Visible="False" />  
                                    <asp:Image ID="imgPopular" ImageUrl="/Shop/Images/popular.gif" runat="server" Visible="False" />  
                                </td>
                              </tr>
                              <!--tr>
                                <td class="Bwhite" bgcolor="#efefef" height="22">&nbsp;현재고 </td>
                                <td colspan="3" align="left">&nbsp;
                                  <asp:Literal ID="currStock" runat="server"></asp:Literal></td>
                              </tr>
                              <tr>
                                <td class="Bwhite" bgcolor="#efefef" height="22">&nbsp;게시기간 </td>
                                <td colspan="3" align="left">&nbsp;
                                  <asp:Literal ID="litDisplayTerm" runat="server"></asp:Literal></td>
                              </tr-->
                              <tr>
                                <td height="70"></td>
                                <td colspan="3" align="left">
                                  <asp:HyperLink ID="hlAskPrice" ImageUrl="/Shop/Images/askPrice.gif" runat="server" Visible="False" />
                                  &nbsp;
                                  <asp:HyperLink ID="hlAskGoods" ImageUrl="/Shop/Images/askGoods.gif" runat="server" />
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr bgcolor="#e7e7e7">
                          <td valign="middle" colspan="2" height="29" style="background-image:url(/Shop/Images/view_title_bg.gif); background-position:left; background-repeat:repeat-y; padding:2px 0px 0px 22px"><b>&nbsp;상품상세정보</b></td>
                        </tr>
                        <tr>
                          <td valign="top" colspan="2" height="100" align="left">
                            <div class="ContentBreak">
                              <asp:Literal ID="specSummary" runat="server"></asp:Literal>
                            </div>
                          </td>
                        </tr>
                        <asp:Panel ID="pnDetailedHTML" runat="server" Visible="False">
                          <tr bgcolor="#e7e7e7">
                            <td valign="middle" colspan="2" height="29" style="background-image:url(/Shop/Images/view_title_bg.gif); background-position:left; background-repeat:repeat-y; padding:2px 0px 0px 22px"><b>상세HTML 내용</b></td>
                          </tr>
                          <tr>
                            <td valign="top" colspan="2" height="50">
                              <div class="ContentBreak">
                                <!-- 세부HTML 파일 내용 __시작 -->
                                <asp:Literal ID="litHTML" runat="server"></asp:Literal>
                                <!-- 세부HTML 파일 내용 __끝 -->
                              </div>
                            </td>
                          </tr>
                        </asp:Panel>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td bgcolor="#e9e9e9" height="3"></td>
            </tr>
            <tr>
              <td bgcolor="#d0d0d0" height="1"></td>
            </tr>
          </table>
        </div>
        <table cellspacing="0" cellpadding="0" width="98%" border="0">
          <tr>
            <td align="right">
              <p>&nbsp;</p>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="center" height="30">
              <asp:HyperLink ID="hlList" runat="server" 
                    ImageUrl="/Shop/Images/btn_view_list.gif" Visible="False" />
              <asp:HyperLink ID="hlBack" runat="server" ImageUrl="/Shop/Images/btn_back.gif" NavigateUrl="javascript:history.back();" />
              <asp:HyperLink ID="hlPrint" runat="server" ImageUrl="/Shop/Images/btn_print.gif">제품정보 프린트하기</asp:HyperLink>
            </td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff">&nbsp;</td>
    </tr>
  </table>
</asp:Content>
