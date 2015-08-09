using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using JinsLibrary.STATEMANAGE;

namespace WebRoot.PartsOfContents.HomeLanguages
{
    public partial class CompanyLogoHomeLink : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // default setting: "/Default.aspx";
                DataCache.Self["HomeUrl"] = hlCompanyLogo.NavigateUrl = "/";
                if (!String.IsNullOrEmpty(Request.QueryString["pwe"]))
                {
                    DataCache.Self["HomeUrl"] = hlCompanyLogo.NavigateUrl += "?pwe=" + Request.QueryString["pwe"];

                }
                else
                {
                    if (!String.IsNullOrEmpty(Cookie.Self["pId"]))
                    {
                        DataCache.Self["HomeUrl"] = hlCompanyLogo.NavigateUrl += "?pwe=" + Cookie.Self["pId"].ToString();
                    }
                }
            }
        }
    }
}