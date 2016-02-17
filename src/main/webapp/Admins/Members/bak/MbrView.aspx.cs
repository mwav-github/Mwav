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
using App_Code.Member;

namespace ADMIN
{
    public partial class Admins_Members_MbrView : System.Web.UI.Page
    {
        private DBLib _dbUtil;
        private string _mbID;
        public static bool _retire = false; 

        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            //App_Code.CompanyMgr.Staff.StfBaseLib.Self.LoginOK();
            //JinsLibrary.ADMIN.AdminLib.Self.AccessOnlyForLocalWorking();

            //페이지타이틀설정
            litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("mbv");

            if (Request.QueryString["mbID"] != null)
            {
                InitializeSetting();
                if (!Page.IsPostBack)
                {                    
                    //권한체크
                    if (!MbrBaseLib.Self.CanAccess(string.Empty))
                        ClientAction.ShowMsgBack("해당 권한이 없습니다.");
                    //바인딩
                    this.MemberViewBind();
                    //버튼생성초기화
                    this.ButtonCreationInitialize();
                    //컨트롤 초기화
                    InitializeControls();
                }
            }
            else
                ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");		
        }

        //URL Get문관련 셋팅초기화
        private void InitializeSetting()
        {            
            this._mbID = Request.QueryString["mbID"];

            //리스트가 어디로 갈것인가
            hlList.NavigateUrl = MbrBaseLib.Self.GetWhichList(Request.QueryString["ml"]);
        }  

        //라운드트립에서 상태값을 가질 수 있는 콘트롤
        private void InitializeControls()
        {

        }


        /// <summary>
        /// 버튼생성초기화
        /// </summary>
        private void ButtonCreationInitialize()
        {
            if (MbrBaseLib.Self.CanAccess(this.leaveDT.Text))
            {
                //수정버튼 만들기
                ibModfy.ToolTip = "수정";
                //ibModfy.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";
                ibModfy.Visible = true;
                //삭제버튼 만들기
                ibDelete.ToolTip = "삭제";
                ibDelete.Attributes["onClick"] = "return ConfirmJ('삭제하시겠습니까?');";
                ibDelete.Visible = true;
            }        
        }

        #region 회원데이터 바인딩
        private void MemberViewBind()
        {
            _dbUtil = new DBLib();
            string qryString = "Select member_id,loginID,loginPW,MbrName,MbrEmail,phone,cellularP,zipcode,address,findingID,findingA,SSN,newsLetter"
                + " FROM t_Member WHERE member_id=" + _mbID;
            qryString += ";Select mLevel,howMuch,howMany,RFund,RFundAC,point,pointAC,unpaid,unpaidAC,rcmderID,joinDT,modifyDT,recentLogin,IPaddress,leaveDT"
                + " FROM t_MemberValue WHERE member_id=" + _mbID;
            qryString += ";Select homepage,messenger,hobbies,carInfo,children,avataImage,monthlyPay,mark"
                + " FROM t_MemberOption WHERE member_id=" + _mbID;
            qryString += ";Select company,jobType,officeP,zipcode,address"
                + " FROM t_MemberJob WHERE member_id=" + _mbID;
            qryString += ";Select annGroup,itemFlag,annDate FROM t_Anniversary WHERE (annGroup BETWEEN 200 AND 220) AND item_id=" + _mbID;

            SqlDataReader drMember;
            drMember = _dbUtil.MyExecuteReader(qryString);
            if (drMember.Read())			//기본정보
            {
                this.member_id.Text = _mbID;
                ViewState["mbID"] = _mbID;
                if (Convert.ToInt32(_mbID) > 0)
                    litFakeMbr.Text = "정상회원입니다.";
                else
                    litFakeMbr.Text = "가짜회원입니다.";
                this.member_id.Text = drMember["member_id"].ToString();
                this.loginID.Text = drMember["loginID"].ToString();
                this.loginPW.Text = drMember["loginPW"].ToString();
                this.MbrName.Text = drMember["MbrName"].ToString();
                this.phone.Text = drMember["phone"].ToString();
                this.cellularP.Text = drMember["cellularP"].ToString();
                this.hlEmail.Text = drMember["MbrEmail"].ToString();
                string strSendonemail = this.MbrName.Text + " <" + this.hlEmail.Text + ">;";
                this.hlEmail.NavigateUrl = "../Mine/Mail/MailForm.aspx?s=" + strSendonemail;
                this.SSN.Text = drMember["SSN"].ToString();
                this.mAddress.Text = "[" + drMember["zipcode"].ToString().Substring(0, 3) + "-" + drMember["zipcode"].ToString().Substring(3, 3) + "] ";
                this.mAddress.Text += drMember["address"].ToString().Replace("|", " ");
                if (Convert.ToBoolean(drMember["newsLetter"].ToString()))
                    this.newsLetter.Text = "신청";
                else
                    this.newsLetter.Text = "비신청";
                //Response.Write("newsLetter =" + drMember["newsLetter"].ToString());
                //아이디/패스워드 잊어 버렸을 때 QnA.
                SortedList mySL = JinsLibrary.XML.XmlLib.Self.GetResxList("/App_Data/resx/FindingMbrInfo.resx");
                if (mySL.ContainsKey(Convert.ToInt16(drMember["findingID"])))
                {
                    this.findingID.Text = mySL[Convert.ToInt16(drMember["findingID"])].ToString();
                    this.findingA.Text = drMember["findingA"].ToString();
                    //JinsLibrary.CONTROL.Util.DDLAddItem(ref ddl, mySL);
                }
                if (drMember.NextResult())	//평가치
                {
                    drMember.Read();
                    this.mLevel.Text = MbrBaseLib.Self.GetStatusText((byte)drMember["mLevel"]);
                    this.howMuch.Text = MathLib.GetComma(drMember["howMuch"]);
                    this.howMany.Text = MathLib.GetComma(drMember["howMany"]);
                    this.RFund.Text = MathLib.GetComma(drMember["RFund"]);
                    this.RFundAC.Text = MathLib.GetComma(drMember["RFundAC"]);
                    this.point.Text = MathLib.GetComma(drMember["point"]);
                    this.pointAC.Text = MathLib.GetComma(drMember["pointAC"]);
                    this.unpaid.Text = MathLib.GetComma(drMember["unpaid"]);
                    this.unpaidAC.Text = MathLib.GetComma(drMember["unpaidAC"]);
                    this.rcmderID.Text = drMember["rcmderID"].ToString();
                    this.joinDT.Text = drMember["joinDT"].ToString();
                    this.modifyDT.Text = drMember["modifyDT"].ToString();
                    this.recentLogin.Text = drMember["recentLogin"].ToString();
                    this.IPaddress.Text = drMember["IPaddress"].ToString();
                    this.leaveDT.Text = drMember["leaveDT"].ToString();
                    if (this.leaveDT.Text != "")
                        this.mLevel.Text += " <b>[탈퇴회원]</b>";
                }
                if (drMember.NextResult())	//부가정보
                {
                    if (drMember.Read())
                    {
                        if (drMember["avataImage"].ToString() != "")
                        {
                            this.avataImage.ImageUrl = SystemConfig.GetValue("MemberPicUploadDir") + Text.SetDefaultValue(drMember["avataImage"].ToString(), "MbrPic_default.gif");
                            this.avataImage.Style["cursor"] = "hand";
                            this.avataImage.Attributes["onClick"] = "javascript:ZoomWindowOpen('" + this.avataImage.ImageUrl + "','avaPic','');";
                            this.avataImage.ToolTip = "큰 이미지보기";
                            //이미지 리사이즈
                            JinsLibrary.IMAGE.ImageLib.Self.ImageResize(ref avataImage, 280, 300);
                        }
                        if (drMember["homepage"].ToString() != "")
                        {
                            this.hlHomepage.Text = "http://" + drMember["homepage"].ToString();
                            this.hlHomepage.NavigateUrl = "http://" + drMember["homepage"].ToString();
                            this.hlHomepage.Target = "_blank";
                        }
                        if (drMember["messenger"].ToString() != "|")
                        {
                            this.messenger.Text = drMember["messenger"].ToString().Replace("|", " / ");
                        }
                        this.hobbies.Text = drMember["hobbies"].ToString().Replace(";", "; ");
                        this.carInfo.Text = MbrBaseLib.Self.GetCarInfoText(drMember["carInfo"].ToString());
                        this.monthlyPay.Text = MbrBaseLib.Self.GetMonthlyPayText(drMember["monthlyPay"].ToString());
                        this.children.Text = drMember["children"].ToString();
                        this.mark.Text = HTML.ReplaceToHTML(drMember["mark"].ToString());
                        //부가정보보여주기
                        pnAdditionalInfo.Visible = true;
                    }
                }

                if (drMember.NextResult())	//회사정보
                {
                    if (drMember.Read())
                    {
                        this.company.Text = drMember["company"].ToString();
                        this.jobType.Text = drMember["jobType"].ToString();
                        if (drMember["officeP"].ToString().Trim() != "--")
                            this.officeP.Text = drMember["officeP"].ToString();
                        if (drMember["address"].ToString() != "|")
                        {
                            this.oAddress.Text = "[" + drMember["zipcode"].ToString().Substring(0, 3) + "-" + drMember["zipcode"].ToString().Substring(3, 3) + "] ";
                            this.oAddress.Text += drMember["address"].ToString().Replace("|", " ");
                        }
                        //부가정보보여주기
                        pnAdditionalInfo.Visible = true;
                    }
                }
                if (drMember.NextResult())	//기념일 셋팅
                {
                    while (drMember.Read())
                    {
                        switch (Convert.ToInt32(drMember["annGroup"]))
                        {
                            case 200:		//생일
                                string anniversary = "";
                                if (drMember["annDate"].ToString() != "")
                                    anniversary = Convert.ToDateTime(drMember["annDate"]).ToShortDateString() + " (" + drMember["itemFlag"].ToString() + ")";
                                this.litBirthDay.Text = anniversary;
                                break;
                            case 210:		//결혼기념일
                                if (drMember["itemFlag"].ToString() == "미")
                                    this.litWeddingDay.Text = "미혼";
                                else
                                    if (drMember["annDate"].ToString() != "")
                                        this.litWeddingDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
                                break;
                        }
                    }
                }
                //DR,DB닫기
                drMember.Close();
                _dbUtil.SqlConnection.Close();
            }
            else
                ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
        }
        #endregion

        private void ibModfy_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ibModfy.Visible = false;
            MbrBaseLib.Self.Modify(ViewState["mbID"].ToString());
        }

        private void ibDelete_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ibDelete.Visible = false;
            MbrBaseLib.Self.Delete(ViewState["mbID"].ToString());
        }


        /*
                private void lbDownload_Click(object sender, System.EventArgs e)
                {
                    //HttpContext.Current.Response.Write("this.sDataPathInfo = " + PostState.Self["sDataPathInfo"]);
                    //return true;
                    JinsLibrary.FILE.FileLib fUtil = new JinsLibrary.FILE.FileLib();
                    fUtil.Open(PostState.Self["sDataPathInfo"].ToString());
                    fUtil.DownLoad();
                }
        */		
    }
}