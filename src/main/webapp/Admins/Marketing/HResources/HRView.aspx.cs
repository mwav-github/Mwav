using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using JinsLibrary;
using JinsLibrary.FILE;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;
using App_Code.Marketing.HRMgr;

namespace ADMIN
{
    public partial class Admins_Marketing_HResources_HRView : System.Web.UI.Page
    {
        private HRBase hb;
        private DBLib dbUtil;
        private string bcID;

        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            App_Code.CompanyMgr.Staff.StfBaseLib.Self.LoginOK();
            //JinsLibrary.ADMIN.AdminLib.Self.AccessOnlyForLocalWorking();

            //페이지타이틀설정
            litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("hrv");

            
            if (Request.QueryString["bcID"] != null)
            {
                this.bcID = Request.QueryString["bcID"];
                if (!Page.IsPostBack)
                {
                    //바인딩
                    this.HRViewBind();
                    //버튼생성초기화
                    this.ButtonCreationInitialize();
                }
            }
            else
                ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");		
        }

        #region 명함데이터 바인딩
        private void HRViewBind()
        {
            string qryString = "Select bcGroup,bcCompany,bcDept,bcClass,bcName,bcStatus,bcCellP,bcPhone,bcFax"
                + ",bcHomepage,bcEmail,bcInternet,zipcode,address,bcNote,bcDescription"
                + ",staff_id,bcRegisterDT,bcUpdateDT,IPaddress,bcAGroup,bcAGrade,bcAdminNote "
                + " FROM t_BusinessCards"
                + " WHERE bc_id=" + bcID;

            dbUtil = new DBLib();
            SqlDataReader drCard;
            drCard = dbUtil.MyExecuteReader(qryString);

            if (drCard.Read())
            {
                //권한체크
                if (!HRBaseLib.Self.CanAccess())
                    ClientAction.ShowMsgBack("해당 권한이 없습니다.");
                this.bc_id.Text = bcID;
                this.bcGroup.Text = drCard["bcGroup"].ToString();
                this.bcCompany.Text = drCard["bcCompany"].ToString();
                this.bcDept.Text = drCard["bcDept"].ToString();
                this.bcClass.Text = drCard["bcClass"].ToString();
                this.bcName.Text = drCard["bcName"].ToString();
                this.bcStatus.Text = drCard["bcStatus"].ToString();
                this.bcCellP.Text = drCard["bcCellP"].ToString();
                this.bcPhone.Text = drCard["bcPhone"].ToString();
                this.bcFax.Text = drCard["bcFax"].ToString();
                if (!string.IsNullOrEmpty(drCard["bcHomepage"].ToString()))
                    hlHomepage.NavigateUrl = hlHomepage.Text = "http://" + drCard["bcHomepage"].ToString();

                if (!string.IsNullOrEmpty(drCard["bcEmail"].ToString()))
                {
                    hlEmail.Text = drCard["bcEmail"].ToString();
                    hlEmail.NavigateUrl = "/Admins/Mine/Mail/MailForm.aspx?o=" + Text.GetEmailFormat(bcName.Text, hlEmail.Text);
                }
                this.bcInternet.Text = drCard["bcInternet"].ToString();
                this.zipcode.Text = "[" + drCard["zipcode"].ToString().Substring(0, 3) + "-" + drCard["zipcode"].ToString().Substring(3, 3) + "]";
                this.address.Text = drCard["address"].ToString().Replace("|", " ");
                this.registrant.Text = App_Code.CompanyMgr.Staff.StfBaseLib.Self.GetTotalStaffInfo(drCard["staff_id"].ToString());
                this.bcRegisterDT.Text = drCard["bcRegisterDT"].ToString();
                this.bcUpdateDT.Text = drCard["bcUpdateDT"].ToString();
                this.IPaddress.Text = drCard["IPaddress"].ToString();
                this.bcNote.Text = drCard["bcNote"].ToString();
                this.bcDescription.Text = HTML.ReplaceToHTML(drCard["bcDescription"].ToString());
                if (HRBaseLib.Self.CanView() && pnAdminEdit.Visible == false)
                {
                    //어드민 보기부분
                    this.bcAGroup.Text = drCard["bcAGroup"].ToString();
                    this.bcAGrade.Text = drCard["bcAGrade"].ToString();
                    this.bcAdminNote.Text = HTML.ReplaceToHTML(drCard["bcAdminNote"].ToString());
                    this.pnAdminView.Visible = true;
                    //어드민 수정부분
                    ViewState["ddlAGroup"] = drCard["bcAGroup"].ToString();
                    ViewState["bcAGrade"] = drCard["bcAGrade"].ToString();
                    ViewState["bcAdminNote"] = HTML.ReplaceToHTML(drCard["bcAdminNote"].ToString());
                }
                drCard.Close();
            }
            else
                ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
            //DB닫기
            dbUtil.SqlConnection.Close();
        }
        //어드민 부분
        private void HRAViewBind()
        {

        }

        #endregion

        /// <summary>
        /// 버튼생성초기화
        /// </summary>
        private void ButtonCreationInitialize()
        {
            if (HRBaseLib.Self.CanAccess() && pnAdminView.Visible == true)
            {
                //수정버튼 만들기
                ibModfy.ToolTip = "수정";
                ibModfy.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";
                ibModfy.Visible = true;
                //삭제버튼 만들기
                //ibDelete.ToolTip = "삭제";
                //ibDelete.Attributes["onClick"] = "return ConfirmJ('삭제하시겠습니까?')";
                //ibDelete.Visible = true;
            }
            if (Convert.ToInt16(this.bcStatus.Text) == 0)
            {
                if (HRBaseLib.Self.CanDelete())
                {
                    //완젼삭제버튼 만들기
                    ibEliminate.ToolTip = "완전삭제";
                    ibEliminate.Attributes["onClick"] = "return ConfirmJ('명함자료를 영구히 삭제하시겠습니까?');";
                    ibEliminate.Visible = true;
                }
            }
        }


        protected void ibModfy_Click(object sender, ImageClickEventArgs e)
        {
            if (pnAdminEdit.Visible)
            {
                Page.Validate();
                if (!Page.IsValid)
                    ClientAction.ShowMsgBack("정확히 입력하세요.");
                ibModfy.Visible = false;

                //쿠키내용을 깨야 DB에서 가져옴.
                string strCardKey = "Card_A" + Cookie.Self["staff_id"];
                Cookie.Self.RemoveCookie(strCardKey);

                //데이타 충전
                hb = new HRBase();
                hb.bc_id = Convert.ToInt32(bc_id.Text);
                hb.bcAGroup = ddlAGroup.SelectedValue;
                hb.bcAGrade = Convert.ToInt16(tbAGrade.Text);
                hb.bcAdminNote = HTML.ReplaceToDB(tbAdminNote.Text);
                //DB반영 및 수정결과처리
                HRBaseLib.Self.Modify(hb.Update());
            }
            else
            {
                //스크롤바 이동
                ClientAction.ScrollTo(this, 0, 1000);

                ibModfy.Attributes["onClick"] = null;
                //반전
                pnAdminEdit.Visible = true;
                pnAdminView.Visible = false;
                //관리자 바인딩
                HRBaseLib.Self.GetAdminSelMenu(ddlAGroup);
                //this.ddlAGroup.SelectedValue = ViewState["ddlAGroup"].ToString(); 잘못하면 에러
                JinsLibrary.CONTROL.Util.DDLFindByValue(ref ddlAGroup, ViewState["ddlAGroup"].ToString());
                //Response.Write("값 --> " + ViewState["ddlAGroup"].ToString() + "<br>");
                //Response.Write("패널 --> " + pnAdminEdit.Visible);
                this.tbAGrade.Text = ViewState["bcAGrade"].ToString();
                this.tbAdminNote.Text = ViewState["bcAdminNote"].ToString();
            }

        }
        protected void ibDelete_Click(object sender, ImageClickEventArgs e)
        {
            //ibDelete.Visible = false;
            //HRBaseLib.Delete(this.bc_id.Text);
        }

        private void ibEliminate_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ibEliminate.Visible = false;
            HRBaseLib.Self.Eliminate(this.bc_id.Text);
        }

        protected void tbBCGroup_TextChanged(object sender, System.EventArgs e)
        {
            string tempBCGroup = this.tbAGroup.Text.Trim();
            if (tempBCGroup != "")
            {
                ListItem li = this.ddlAGroup.Items.FindByText(tempBCGroup);
                if (li != null)
                    ClientAction.ShowMsgBack("이미 유져그룹에 존재합니다.");
                else
                {
                    JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlAGroup, tempBCGroup, tempBCGroup);
                    JinsLibrary.CONTROL.Util.DDLFindByText(ref ddlAGroup, tempBCGroup);
                    this.tbAGroup.Text = "";
                    this.ibGInsert.Click -= new System.Web.UI.ImageClickEventHandler(this.ibGInsert_Click);
                    //스크롤바 이동
                    ClientAction.ScrollTo(this, 0, 1000);
                }
            }
            else
                ClientAction.ShowMsgBack("추가그룹을 입력하세요!!");
        }

        private void ibGInsert_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (tbAGroup.Text.Trim() == "")
                ClientAction.ShowMsgBack("추가그룹을 입력하세요!!");
        }

}
}