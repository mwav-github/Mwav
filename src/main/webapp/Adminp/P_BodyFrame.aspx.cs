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

namespace PARTNER
{
    public partial class Adminp_BodyFrame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //로그인되었는지 확인
                App_Code.Partners.Staff.PtnBaseLib.Self.LoginOK();

            }
        }


        protected void ddlProceed_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}