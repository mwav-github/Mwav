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
using System.Drawing;

using JinsLibrary;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;
using App_Code.CompanyMgr.Staff; //복수형 아님
using App_Code.Member;
using App_Code.Partners.Staff;
using App_Code.SiteMgr.QnAMgr;
using App_Code.Goods.Cell;


namespace PARTNER
{
    /// <summary>
    /// TopFrame에 대한 요약 설명입니다.
    /// </summary>
    public partial class Adminp_TopFrame : System.Web.UI.Page
    {
        //private string[,] arrMainMenu;
        MiddleTier.Staff.StfStaffBiz _db;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인확인
            App_Code.Partners.Staff.PtnBaseLib.Self.LoginOK();
           
            if (!Page.IsPostBack)
            {
                //각종 정보 매핑
                StaffTopInfoBind();
                //개인정보수정
                ModifyMe();
                //필요쿠키 설정
                SetStaffCookies();

                //HttpContext.Current.Response.Write("------------->" + Request.QueryString["mm"]);
                //Response.Write("sBusinessPic = " + Cookie.Self["sBusinessPic"] + "<br>");

                //--삭제예정
                //배열에 메인메뉴 입력
                //MainMenuBind();
                //메인메뉴출력부분
                //ShowMainMenu();
            }
        }

        private void StaffTopInfoBind()
        {
            //데이터 StfStaffBiz 클레스에 체우기 
            StfBaseLib.Self.StfStaffBiz.FillStaffData(Convert.ToInt16(Session["staff_Pid"]));
            //채운 StfStaffBiz 클레스가져오기 
            _db = StfBaseLib.Self.StfStaffBiz;
            //staff_id, DeptName, sLevel --> 세션처리
            pCompany.ToolTip = _db.position.ToString();
            pCompany.Text = PtnBaseLib.Self.GetPartnerCompany(_db.position);
            DeptName.Text = _db.DeptName;
            Session["DeptName"] = _db.DeptName; 
            sLevel.Text = "(L:" + _db.sLevel + ")";
            Session["sLevel"] = _db.sLevel;
            sClass.Text = _db.sClass;
            //Session["sClass"] = _db.sClass;
            sName.Text = _db.sName;
            sLoginID.Text = _db.sLoginID;
            staffNbr.Text = _db.staffNbr;
            promoting.Text = _db.sPoint + "/" + _db.sPointAC;
            ibLogout.ToolTip = "최근 로그인 시간은 " + _db.recentLogin + "입니다.";

            if (_db.sBusinessPic != "")
            {
                hlMyPic.ImageUrl = string.Empty;
                imgMyPic.ImageUrl = SystemConfig.GetValue("StaffUploadDir") + _db.sBusinessPic;
            }
            imgMyPic.ToolTip = "SystemID: " + Session["staff_Pid"] + "\n";
            imgMyPic.ToolTip += @"이메일: " + _db.sEmail;
            imgMyPic.Dispose();
            //HttpContext.Current.Response.Write("Session= " + Session["staff_id"] + "<br>");
            //Response.Write("Test-->" + Cookie.Self["test"] + "<br>");

            //직원수로 변동사항이 많지 않으므로 캐쉬에 보관한다.
            if (AppVariable.Self["AllPtnStaffNumber"] != null)
            {
                litAllStfsNbr.Text = AppVariable.Self["AllPtnStaffNumber"].ToString();
            }
            else
            {
                litAllStfsNbr.Text = PtnBaseLib.Self.UpdateAllPtnStaffNumber(_db.position).ToString();
            }

            if (_db.sLevel > 0)
            {
                //회원수로 변동사항이 많지 않으므로 캐쉬에 보관한다.
                if (AppVariable.Self["AllMembersNumber"] != null)
                {
                    litAllMbrsNbr.Text = AppVariable.Self["AllMembersNumber"].ToString();
                }
                else
                {
                    litAllMbrsNbr.Text = MbrBaseLib.Self.GetTotalNumberOfMembers().ToString();
                    AppVariable.Self["AllMembersNumber"] = litAllMbrsNbr.Text;
                }
            }
            litAllMbrsNbr.Text = "-";

            //질문사항으로 변동사항이 많지 않으므로 캐쉬에 보관한다.
            if (AppVariable.Self["UserQuestionNumber"] != null)
            {
                UserQuestionNumber.Text = AppVariable.Self["UserQuestionNumber"].ToString();
            }
            else
            {
                UserQuestionNumber.Text = QnABaseLib.Self.GetNumberOfNewQuestions().ToString();
                AppVariable.Self["UserQuestionNumber"] = UserQuestionNumber.Text;
            }

            //제품수량으로 제품수량이 많지 않을 때 캐쉬에 보관한다. (제품수량 변동체크 AppVariable.Self["AllGoodsNumber"] = null)
            if(AppVariable.Self["AllGoodsNumber"] != null)
            {
                litAllGdsNbr.Text = AppVariable.Self["AllGoodsNumber"].ToString();		
            }
            else
            {
                litAllGdsNbr.Text = GdsCellBaseLib.Self.GetTotalNumberOfDisplayPhones().ToString();
                AppVariable.Self["AllGoodsNumber"] = litAllGdsNbr.Text;
            }           
        }

        /// <summary>
        /// 페이지 전체영역에서 사용할 직원정보를 쿠키에 담는다.
        /// </summary>
        private void SetStaffCookies()
        {
            //쿠기세션매핑
            //Cookie.Self["staff_Pid"] = _db.staff_id.ToString();
            Cookie.Self["pLevel"] = _db.sLevel.ToString();
            Cookie.Self["pLoginID"] = _db.sLoginID;
            Cookie.Self["position"] = _db.position.ToString();
            Cookie.Self["partnerNbr"] = _db.staffNbr;            
            Cookie.Self["pName"] = Server.UrlEncode(_db.sName);
            Cookie.Self["pDeptName"] = Server.UrlEncode(_db.DeptName);
            Cookie.Self["pClass"] = Server.UrlEncode(_db.sClass);
            Cookie.Self["cellularP"] = _db.cellularP;
            Cookie.Self["pEmail"] = _db.sEmail;
            Cookie.Self["pPoint"] = _db.sPoint.ToString();
            Cookie.Self["pPointAC"] = _db.sPointAC.ToString();
            Response.Cookies["pRecentLogin"].Value = Server.UrlEncode(_db.recentLogin);
            Response.Cookies["pRecentLogin"].Path = "/";
//Response.Write("DeptName--> " + Server.UrlDecode(Request.Cookies["DeptName"].Value) + "<br>");
//HttpContext.Current.Response.Write("DeptName =" + _db.recentLogin + "<br>");
            Cookie.Self["pBusinessPic"] = Server.UrlEncode(_db.sBusinessPic);
            if (Cookie.Self["pBusinessPic"] == "")
                Cookie.Self["pBusinessPic"] = "MyPic_default.gif";
            Cookie.Self["pAvataImage"] = Server.UrlEncode(_db.sAvataImage);
            
            //왜 안돼?
            //HttpContext.Current.Response.Write("나와라 부서2 =" + System.Web.HttpContext.Current.Response.Cookies["DeptName1"].Value + "<br>");
            //HttpContext.Current.Response.Write(HttpContext.Current.Response.HeaderEncoding.HeaderName);
        }
        private void ModifyMe()
        {
            this.hlModifyMe.NavigateUrl = "/Adminp/Partners/PtnForm.aspx?mode=u&sfID=" + Cookie.Self["staff_Pid"];
            this.hlMyPic.NavigateUrl = this.hlModifyMe.NavigateUrl;
        }


        protected void ibLogout_Click(object sender, ImageClickEventArgs e)
        {
            //로그아웃    
            PtnBaseLib.Self.Logout();        
        }    
               

    }
}
