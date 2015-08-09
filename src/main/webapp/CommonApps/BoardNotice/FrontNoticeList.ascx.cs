namespace KistelSite.CommonApps.BoardNotice
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using JinsLibrary;
	
	//using jc = JinsLibrary.CommonLibrary;

	/// <summary>
	///		NoticeList에 대한 요약 설명입니다.
	/// </summary>
	public class FrontNoticeList : System.Web.UI.UserControl
	{
		protected System.Web.UI.WebControls.Panel pnlNotice;
		protected System.Web.UI.WebControls.HyperLink hlMoreList;
		protected System.Web.UI.WebControls.Repeater rptNotice;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!Page.IsPostBack) 
			{
				this.NoticeBind();
			}
		}
		
		#region 공지사항 바인딩
		protected void NoticeBind()
		{
			DBLib dbUtil = new DBLib();
			string qryString;
			qryString = "Select Top 5 bNotice_id,bnTitle,ISNULL(modifyDT, writeDT) as noticeDay";
			qryString +=" FROM t_BoardNotice ";
			qryString +=" WHERE bnStatus > 1 ";
			qryString +=" Order By bnOrder DESC, bNotice_id DESC";
			
			SqlDataAdapter daNotice = new SqlDataAdapter(qryString, dbUtil.SqlConnection);
			DataSet dsNotice = new DataSet();
			daNotice.Fill(dsNotice, "BoardNotice");
			dbUtil.SqlConnection.Close();
			
			this.rptNotice.DataSource = dsNotice;
			this.rptNotice.DataMember = "BoardNotice";
			this.rptNotice.DataBind();		

			if(this.rptNotice.Items.Count <= 0)
			{
				this.rptNotice.Visible = false;
				this.pnlNotice.Visible = true;	
			}		
		}
		#endregion
		
		#region Web Form 디자이너에서 생성한 코드
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 이 호출은 ASP.NET Web Form 디자이너에 필요합니다.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		디자이너 지원에 필요한 메서드입니다. 이 메서드의 내용을
		///		코드 편집기로 수정하지 마십시오.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


	}
}
