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

public partial class CustomerServices_QnA_QnA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Title = "고객지원센터 > 묻고 답하기";
            JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "Q&A Main";
        }
    }
}
