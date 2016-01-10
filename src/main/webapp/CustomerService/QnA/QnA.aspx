<%@ Page Language="C#" MasterPageFile="~/CustomerServices/CSMasterPage.master" AutoEventWireup="true" CodeFile="QnA.aspx.cs" Inherits="CustomerServices_QnA_QnA" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CompanyContentPlaceHolder" Runat="Server">
  <table width="640" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="bottom"><img src="/CustomerServices/QnA/Images/qna_title01.gif" width="236" height="22" /></td>
      <td width="50%" align="right" style="padding-right:10px">:: HOME &gt;&gt;고객지원센터&gt;&gt;묻고답하기</td>
    </tr>
    <tr>
      <td colspan="2"><img src="/CustomerServices/zImages/Customer_title_line.gif"></td>
    </tr>
    <tr>
      <td colspan="2" style="padding:20px 10px 10px 10px">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="/CustomerServices/QnA/Images/qna_sum_ans_img.gif"></td>
          </tr>
		  <tr>
		  	<td height="10"></td>
		  </tr>
		  <tr>
            <td height="10" ><img src="/CustomerServices/QnA/Images/qna_sum_top.gif"></td>
          </tr>
          <tr>
            <td background="/CustomerServices/QnA/Images/qna_sum_cen.gif">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="170"><img src="/CustomerServices/QnA/Images/qna_sum_gds.gif"></td>
                  <td width="450">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30" colspan="2">제품구매전 제품에 대해 일반적 문의 및 전반적인 컨설팅을 지원해드립니다.</td>
                      </tr>
                      <tr>
                        <td height="30">담당부서: 영업부</td>
                        <td width="25%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qnaCX=form&qgrp=gds"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0"></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center"><img src="/CustomerServices/QnA/Images/line.gif"></td>
                </tr>
                <tr>
                  <td height="79"><img src="/CustomerServices/QnA/Images/qna_sum_biz.gif" ></td>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30" colspan="2">자사와 함께 사업 아이템을 공유하기 원하시는 파트너 및 리셀러를 환영합니다.</td>
                      </tr>
                      <tr>
                        <td height="30">담당부서: 영업부</td>
                        <td width="25%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qgrp=biz"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0" /></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center"><img src="/CustomerServices/QnA/Images/line.gif"></td>
                </tr>
                <tr>
                  <td height="79"><img src="/CustomerServices/QnA/Images/qna_sum_tech.gif" ></td>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30" colspan="2">제품을 운용하면서 발생하는 문의에 대한 기술지원을 해드립니다.</td>
                      </tr>
                      <tr>
                        <td height="30">담당부서: 관리부</td>
                        <td width="25%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qgrp=tech"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0" /></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center"><img src="/CustomerServices/QnA/Images/line.gif"></td>
                </tr>
                <tr>
                  <td height="79"><img src="/CustomerServices/QnA/Images/qna_sum_est.gif" ></td>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30" colspan="2">웹사이트에 기술되지 않은 제품가격, 서비스비용 및 대량구매에 대한 견적을 <br />
                          의뢰합니다.</td>
                      </tr>
                      <tr>
                        <td height="30">담당부서: 영업부, 관리부</td>
                        <td width="25%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qgrp=quota"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0" /></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center"><img src="/CustomerServices/QnA/Images/line.gif"></td>
                </tr>
                <tr>
                  <td height="79"><img src="/CustomerServices/QnA/Images/qna_sum_error.gif"></td>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30" colspan="2">저희 웹사이트 이용시 개선점이나 에러발생에 대한 문의를 접수합니다.</td>
                      </tr>
                      <tr>
                        <td height="30">담당부서: 기획(개발)부</td>
                        <td width="25%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qgrp=error"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0" /></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center"><img src="/CustomerServices/QnA/Images/line.gif"></td>
                </tr>
                <tr>
                  <td height="71"><img src="/CustomerServices/QnA/Images/qna_sum_etc.gif" ></td>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30" colspan="2">위 범중에 포함되지 않은 정형화 되지 않은 문의를 합니다.</td>
                      </tr>
                      <tr>
                        <td height="30">담당부서: 기획(개발)부</td>
                        <td width="25%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qgrp=etc"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0" /></a></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td height="10" ><img src="/CustomerServices/QnA/Images/qna_sum_bot.gif"></td>
          </tr>
          <tr>
            <td height="15"></td>
          </tr>
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="170"><img src="/CustomerServices/QnA/Images/qna_sum_ans.gif"></td>
                  <td background="/CustomerServices/QnA/Images/qna_sum_ans_c.gif">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>질문하신 내용은 메일주소와 작성시 입력했던 패스워드로 
                          확인 가능합니다.</td>
                        <td width="23%"><a href="/CustomerServices/QnA/QnA_Master.aspx?qnaCX=logIn"><img src="/CustomerServices/QnA/Images/qna_sum_btn.gif" border="0" align="absmiddle"></a></td>
                      </tr>
                    </table>
                  </td>
                  <td width="10" height="73"><img src="/CustomerServices/QnA/Images/qna_sum_ans_r.gif"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
