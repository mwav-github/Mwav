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
using JinsLibrary.STATEMANAGE;
using App_Code.Partners.Staff;

namespace PARTNER
{
    /// <summary>
    /// 관리자로그인창 구현
    /// </summary>
    public partial class Adminp_Partners_PtnLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //처리전 인증잡업
            //ValidateVarsInServer();            
            if (!IsPostBack)
            {
                //Page Title
                Title = "The Admin Control Center";
                JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "Login Box";
                
                //쿠키아이디복구
                ReStorePid();

                //최근방문시간
                recentPLogin.Text = Server.UrlDecode(Cookie.Self["recentPLogin"]);
                //Response.Write("--> " + Server.UrlDecode(Request.Cookies["recentPLogin"].Value));
                if (recentPLogin.Text != "")
                    recentPLogin.Text = "최근방문시간은 " + recentPLogin.Text + "입니다.";
                else
                    recentPLogin.Visible = false;

                //포커스이동	
                //ClientAction.FocusOn(this, "frmLogin.sLoginID");	
                litSiteName.Text = GeneralConfig.GetValue("siteName");                
            }            
        }

        /// <summary>
        /// Validate the variables for processing.
        /// </summary>
        private void ValidateVarsInServer()
        {
        }

        /// <summary>
        /// 쿠키아이디복구
        /// </summary>
        private void ReStorePid()
        {
            if (Cookie.Self["cbStorePid"] == true.ToString())
            {
                cbStorePid.Checked = true;
                sLoginID.Text = Cookie.Self["StorePid"];
                //포커스이동	
                ClientAction.FocusOn(this, "frmLogin.sLoginPW");

                //HttpContext.Current.Response.Write("아이디복구성공" + Cookie.Self["StorePid"]+ "<br>");
            }
            else
            {
                cbStorePid.Checked = false;
                //포커스이동	
                ClientAction.FocusOn(this, "frmLogin.sLoginID");
            }

        }
        
        private void CheckStorePid()
        {
            if (this.cbStorePid.Checked)
            {
                Cookie.Self.SetCookie("cbStorePid", true.ToString(), 100000);
                Cookie.Self.SetCookie("StorePid", sLoginID.Text.Trim(), 100000);
                //HttpContext.Current.Response.Write("체크박스체크실행" +  Cookie.Self["StorePid"] + "<br>");	
            }
            else
            {
                Cookie.Self.RemoveCookie("cbStorePid");
                Cookie.Self.RemoveCookie("StorePid");
                //HttpContext.Current.Response.Write("체크박스언체크실행" +  Cookie.Self["StorePid"] + "<br>");					
            }
        }


        protected void smtLogin_Click(object sender, ImageClickEventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                //로그인에 대한 에러메세지를 받아 온다 없으면 로그인 Ok
                string errMessage = PtnBaseLib.Self.PartnerLogin(sLoginID.Text, sLoginPW.Text);//StfBaseLib.Login(sLoginID.Text, sLoginPW.Text);
                if (errMessage == "")
                {
                    //아이디 저장을 위한 체크박스확인
                    CheckStorePid();
                    //페이지이동                    
                    WebUtil.CurrentResponse.Redirect(AppVariable.Self["RootDir"] + "Adminp/P_DefaultFrameset.aspx");
                    //HttpContext.Current.Response.Write("Session= " + Session["staff_id"] + "<br>");
                    //HttpContext.Current.Response.Write("DataCache= " + DataCache.Self["staff_id"] + "<br>");
                    //HttpContext.Current.Response.Write("Login OK <br>");  
                }
                else
                    ClientAction.ShowMsgBack(errMessage);
            }
            else
            {
                foreach (IValidator validator in Page.Validators)
                    if (!validator.IsValid)
                        Response.Write(validator.ErrorMessage + "<br>");
                //HttpContext.Current.Response.Write("You guessed poorly");
            }
            //저장된 상태 복구
            ReStorePid();
        }

    }
}