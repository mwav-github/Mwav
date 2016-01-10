using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using JinsLibrary;
using JinsLibrary.CONFIG;

public partial class CustomerServices_QnA_QnA_Master : System.Web.UI.Page
{
     
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Page Title
            Title = "고객지원센터 > 묻고 답하기";
            JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "Q&A Form";
        }
        
        if (Request.QueryString["qnamsg"] != null)      //접수 후 접수 메세지 표시
        {
            CustomerServices_CSMasterPage master = this.Master;    //MainMasterPage master = (MainMasterPage)this.Master;
            master.FindControl("ucClientMessage").Visible = true;
            master.LitMsgText = Request.QueryString["qnamsg"];
            if (Request.QueryString["qna"] != "u")
                master.LitDetailsText = "정상적으로 입력되었습니다.";
            else
                master.LitDetailsText = "정상적으로 수정되었습니다.";
            master.HlBackVisible = false;
        }
        else
        {
            // 이 폼을 공통으로 보고 여기에 해당되는 파트를 넣는다.(포스트백에 넣으면 안된다.)    
            GetBodyOfQnA(Request.QueryString["qnaCX"]);
        }
    }

    /// <summary>
    /// 이 폼을 공통으로 보고 여기에 해당되는 파트를 넣는다. )
    /// </summary>
    /// <param name="qnaCX">입력/수정폼(form), 로그인(log), 답변보기(ansView), 답변리스트(ansList) </param>
    private void GetBodyOfQnA(string qnaCX)
    {
        switch (qnaCX)
        {
            case "form":    //각종 입력,수정폼
                //이미지 타이틀 및 네비게이션설정            
                this.GetImgQTitleImageUrl(Request.QueryString["qgrp"]);
                PlaceHolder1.Controls.Add(((WebApps.CommonApps_QnA_System_QnA_Form)Page.LoadControl("/CommonApps/QnA_System/QnA_Form.ascx")));
                //if (Request.QueryString["mode"] != "u") //입력인경우
                //{
                //}
                //else//수정인경우  (ASPX 실행 후 ASCX 실행)
                //{
                //    this.lbNaviMenu.Text += " [수정하기]";
                //}
                break;
            case "logIn":     //로그인
                //이미지 타이틀 및 네비게이션설정            
                this.GetImgQTitleImageUrl("logIn");
                PlaceHolder1.Controls.Add(((WebApps.CommonApps_QnA_System_QnA_Login)Page.LoadControl("/CommonApps/QnA_System/QnA_Login.ascx")));
                break;
            case "ansList": //리스트보기
                //이미지 타이틀 및 네비게이션설정            
                this.GetImgQTitleImageUrl("ansList");
                PlaceHolder1.Controls.Add(((WebApps.CommonApps_QnA_System_QnA_List)Page.LoadControl("/CommonApps/QnA_System/QnA_List.ascx")));
                break;
            case "ansView": //Q&A보기
                //페이지타이틀
                JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "Q&A보기";
                //이미지 타이틀 및 네비게이션설정            
                this.GetImgQTitleImageUrl("ansView");
                PlaceHolder1.Controls.Add(((WebApps.CommonApps_QnA_System_QnA_View)Page.LoadControl("/CommonApps/QnA_System/QnA_View.ascx")));
                break;
            default:
                goto case "form";
        }
    
        //QnA_Form1.Visible = false;
    }

    /// <summary>
    /// 문의사항 그룹에 따라 이미지와 네비게이션의 Text를 변경한다.
    /// qnaCX가 입력/수정폼(form) 때만 수정
    /// </summary>
    /// <param name="qgrp">문의사항그룹</param>
    private void GetImgQTitleImageUrl(string qgrp)
    {
        Title += " > ";
        switch (qgrp)
        {
            case "gds":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "일반제품문의";
                imgQTitle.ImageUrl = "Images/qna_gds_title.gif";
                break;
            case "tech":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "기술지원문의";
                imgQTitle.ImageUrl = "Images/qna_tech_title.gif";
                break;
            case "biz":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "사업제휴문의";
                                imgQTitle.ImageUrl = "Images/qna_biz_title.gif";
                break;
            case "quota":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "온라인견적문의";
                imgQTitle.ImageUrl = "Images/qna_quota_title.gif";
                break;
            case "error":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "사이트불편신고";
                imgQTitle.ImageUrl = "Images/qna_error_title.gif";                
                break;
            case "etc":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "기타제안 및 문의";
                imgQTitle.ImageUrl = "Images/qna_etc_title.gif";
                break;
            case "logIn":         //<--------  답변보기 from here.
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "로그인";
                imgQTitle.ImageUrl = "Images/qna_ans_title.gif";
                break;
            case "ansList":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "QnA 목록";
                imgQTitle.ImageUrl = "Images/qna_ans_title.gif";
                break;
            case "ansView":
                //Page Title
                //네이게이션 메뉴 및 이미지설정
                Title += JinsLibrary.STATEMANAGE.Session.Self["PageName"] = lbNaviMenu.Text = "QnA 보기";
                imgQTitle.ImageUrl = "Images/qna_ans_title.gif";
                break;
            default:
                goto case "etc";
        }
    }
}