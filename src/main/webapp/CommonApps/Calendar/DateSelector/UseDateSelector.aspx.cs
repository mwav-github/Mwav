using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace KistelSite.CommonApps.Calendar.DateSelector
{
	/// <summary>
	/// Summary description for UseDateSelector.
	/// </summary>
	public class UseDateSelector : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button bt_Submit;
		protected DateSelector useDateCal;
		protected DateSelector DtCal;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		private void bt_Submit_Click(object sender, System.EventArgs e)
		{
			//Get the selected data
			string str = useDateCal.CalendarDate;
			Response.Write("Selected Value  is :" + str + "<BR>");
			string str1 = DtCal.CalendarDate;
			Response.Write("Selected Value for is :" + str1 + "<BR>");
			//Set a date in the codebehind using calendardate property
			//DtCal.CalendarDate = "03/04/05"
			//Response.Write("Selected Value for is :" & DtCal.CalendarDate)
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.bt_Submit.Click += new System.EventHandler(this.bt_Submit_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
