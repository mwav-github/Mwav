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


namespace PARTNER
{
    public partial class Adminp_BottomFrame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.MappingSiteInfo();
        }

        public void MappingSiteInfo()
        {
            //siteName.text = JinsLibrary.CONFIG.GeneralConfig.GetValue("siteName");
            firmName.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmName");
            //ceoName.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("ceoName");
            //chiefManager.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("chiefManager");
            //siteManager.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("siteManager");
            //lbPromoter.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("sitePromoter");
            firmPhone.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmPhone");
            firmFax.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmFax");
            //			siteAddress.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("siteAddress");
            //			firmEmail.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmEmail");
            businessID.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("businessID");
            firmAddr.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmAddr");
            copyright.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("copyright");
        }
    }
}