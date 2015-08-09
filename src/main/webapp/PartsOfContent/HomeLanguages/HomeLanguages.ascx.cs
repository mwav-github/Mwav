using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using JinsLibrary;
using JinsLibrary.CONTROL;
using JinsLibrary.STATEMANAGE;

namespace WebRoot.PartsOfContents.HomeLanguages
{
    public partial class HomeLanguages : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Home link
                if (DataCache.Self["HomeUrl"] != null)
                    hlHome.NavigateUrl = DataCache.Self["HomeUrl"].ToString();

                ddlLanguages.AutoPostBack = true;
                Util.DDLAddItem(ddlLanguages, "English (International)", "en");
                Util.DDLAddItem(ddlLanguages, "Japanese (にほんご)", "ja");
                Util.DDLAddItem(ddlLanguages, "Chinese (中國語)", "ch");
                Util.DDLAddItem(ddlLanguages, "Korean (한국어)", "kr");

                //Maintain the value of the seleted language.
                ddlLanguages.SelectedIndex = 0;
                if (JinsLibrary.STATEMANAGE.Session.Self["LanguageSelected"] != null)
                {
                    string languageSelected = JinsLibrary.STATEMANAGE.Session.Self["LanguageSelected"].ToString();
                    ddlLanguages.SelectedValue = languageSelected;
                    JinsLibrary.STATEMANAGE.Session.Self["LanguageSelected"] = null;
                }
            }
        }

        protected void ddlLanguages_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            JinsLibrary.STATEMANAGE.Session.Self["LanguageSelected"] = ddl.SelectedValue;
            switch (ddl.SelectedValue)
            {
                case "en":
                    Response.Redirect("/InternationalClients/English/Introduction.aspx");
                    break;
                case "ja":
                    ClientAction.ShowMsgBack(ddl.SelectedItem.Text + " version is under construction.");
                    //Response.Redirect("/InternationalClients/Japanese/IntroductionJapanese.aspx");
                    break;
                case "ch":
                    ClientAction.ShowMsgBack(ddl.SelectedItem.Text + " version is under construction.");
                    //Response.Redirect("/InternationalClients/Chinese/IntroductionChinese.aspx");
                    break;
                default:
                    Response.Redirect(hlHome.NavigateUrl);
                    break;
            }
        }
    }
}