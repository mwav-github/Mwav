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

using JinsLibrary.CONFIG;

namespace PARTNER
{
    public partial class Adminp_DefaultFrameset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Title = SystemConfig.GetValue("BrowserTitleBar_Admin"); //"The Admin Control Center";
            }
        }
    }
}