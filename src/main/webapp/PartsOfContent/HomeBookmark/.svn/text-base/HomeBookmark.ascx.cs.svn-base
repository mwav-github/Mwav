using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using JinsLibrary;

namespace WebRoot.PartsOfContents.HomeBookmark
{
    public partial class HomeBookmark : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ClientAction.Bookmark(imgBookmark);
                ClientAction.SetHomepage(imgHomepage);
            }
        }
    }
}