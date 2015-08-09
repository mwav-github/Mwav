using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRoot.PartsOfContents.CenterFocus
{
    public partial class FrontAdRotator : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AdRotator1.EnableViewState = false;
                AdRotator1.AdvertisementFile = "/PartsOfContents/CenterFocus/FrontAdRotatorAdsFile.xml";
                //AdRotator1.NavigateUrlField
            }
        }
    }
}