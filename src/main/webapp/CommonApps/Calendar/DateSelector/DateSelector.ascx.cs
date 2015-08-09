namespace KistelSite.CommonApps.Calendar.DateSelector
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	/// <summary>
	///		Summary description for DateSelector.
	/// </summary>
	//public abstract class DateSelector : System.Web.UI.UserControl
	public class DateSelector : System.Web.UI.UserControl
	{
		protected System.Web.UI.WebControls.TextBox tbDate;
		protected System.Web.UI.WebControls.Label lbl_Date;
		public System.Web.UI.WebControls.Image imgCalendar;
		public System.Web.UI.WebControls.Image imgReset;

		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			//string scriptStr = "javascript:return popUpCalendar(this," + getClientID() + @", 'yyyy-mm-dd', '__doPostBack(\'" + getClientID() + @"\')')";
			imgCalendar.Style.Add("CURSOR", "hand");
			//string scriptStr = "javascript:return popUpCalendar(this," + TBClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + TBClientID + @"\')')";
			//imgCalendar.Attributes.Add("onClick", scriptStr);
			imgReset.Style.Add("CURSOR", "hand");
		}

		// Get the id of the control rendered on client side
		// Very essential for Javascript Calendar scripts to locate the textbox
		public string getClientID()
		{
			return tbDate.ClientID;
		}
		// This propery sets/gets the calendar date
		public string CalendarDate
		{
			get
			{
				return tbDate.Text;
			}
			set
			{
				tbDate.Text = value;
			}
		}
		// This Property sets or gets the the label for 
		// Dateselector user control
		public string Text
		{
			get
			{
				return lbl_Date.Text;
			}
			set
			{
				lbl_Date.Text = value;
			}
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
		
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}

}
