using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using JinsLibrary;
//using jc = JinsLibrary.CommonLibrary;

namespace KistelSite.CommonApps.BoardNews
{
	/// <summary>
	///		NoticeList에 대한 요약 설명입니다.
	/// </summary>
	public class FrontNewsList : System.Web.UI.UserControl
	{
		protected System.Web.UI.WebControls.Panel pnNews;
		protected System.Web.UI.WebControls.Panel pnlNotice;
		protected System.Web.UI.WebControls.HyperLink hlMoreList;
		protected System.Web.UI.WebControls.Repeater rptNews;

		private void Page_Load(object sender, System.EventArgs e)
		{
			// 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
			if(!Page.IsPostBack) 
			{
				this.NewsBind();
			}
		}
		
		#region 뉴스 바인딩
		protected void NewsBind()
		{
			DBLib dbUtil = new DBLib();
			string qryString;
			qryString = "Select Top 5 bNews_id,bnsTitle,ISNULL(modifyDT, writeDT) as newsDay";
			qryString +=" FROM t_BoardNews ";
			qryString +=" WHERE bnsStatus > 1 ";
			qryString +=" Order By bnsOrder DESC, bNews_id DESC";
			
			SqlDataAdapter daNews = new SqlDataAdapter(qryString, dbUtil.SqlConnection);
			DataSet dsNews = new DataSet();
			daNews.Fill(dsNews, "BoardNews");
			dbUtil.SqlConnection.Close();
			
			this.rptNews.DataSource = dsNews;
			this.rptNews.DataMember = "BoardNews";
			this.rptNews.DataBind();		

			if(this.rptNews.Items.Count <= 0)
			{
				this.rptNews.Visible = false;
				this.pnNews.Visible = true;				
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
