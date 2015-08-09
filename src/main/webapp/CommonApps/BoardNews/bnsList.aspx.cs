using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using JinsLibrary;
using JinsLibrary.LIST;
using JinsLibrary.STATEMANAGE;

namespace KistelSite.CommonApps.BoardNews
{
	/// <summary>
	/// bnList에 대한 요약 설명입니다.
	/// </summary>
	public class bnsList : System.Web.UI.Page
	{
		string bnsG;
		protected System.Web.UI.WebControls.Label lbNews;
		protected System.Web.UI.WebControls.Label lbPaging;
		protected System.Web.UI.WebControls.Label lbListBrief;
		protected System.Web.UI.WebControls.DataList dlNewsList;

		private void Page_Load(object sender, System.EventArgs e)
		{
			//어떤 그룹의 리스트를 가져올 것인강?
			this.bnsG = Request.QueryString["bnsG"];
			if(!Page.IsPostBack) 
			{
				//페이지타이틀
				JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "제품동향뉴스목록";

				//현재 페이지를 셋팅합니다.      -1
				Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);
				//테이터바이딩
				this.NewsListBind();
			}
		}

		
		#region 뉴스사항리스트 바인딩
		protected void NewsListBind()
		{
			DBLib dbUtil = new DBLib();
		
			//페이지사이즈초기화
			int topCnt;
			topCnt = Paging.Self.PageSize();
			
			string fieldNames,tableName,whereClause,orderBy;
			fieldNames = "bNews_id,bnsGroup,bnsTitle,ISNULL(modifyDT, writeDT) as newsDay,bnsOrder";
			tableName = "t_BoardNews";
			whereClause = "bnsStatus > 1";
			if(bnsG != null) whereClause += " AND bnsGroup ='" +  bnsG + "'";
			orderBy = "bnsOrder DESC,bNews_id DESC";		
			//SqlDataReader drNews = dbUtil.Select_DR(topCnt,fieldNames,tableName,whereClause,orderBy);
			string subQryOrderBy = "bnsOrder ASC,bNews_id ASC";		
			
			//총레코드수 저장
			Paging.Self.TotRecordCount = dbUtil.GetRecordCount("t_BoardNews",whereClause);			
			//Paging.Self.SetPagePortion(); 상관쿼리 설정, AbsolutePage와 같은 역활을 한다. 실 쿼리실행 이전에 설정해야 한다
			//실제쿼리실행
			SqlDataReader drNews = dbUtil.Select_DR(topCnt,fieldNames,tableName,whereClause,orderBy, Paging.Self.SetPagePortion(), subQryOrderBy);
	//Response.End();

			if(drNews.HasRows) {
				this.dlNewsList.DataSource = drNews;
				this.dlNewsList.DataBind();
				
				#region 페이징기능구현
				//값을 지우고 다시 채워넣야~
				URLQuery.Self.SetQueryString();

				Paging.Self.Init_Violet();
				this.lbPaging.Text = Paging.Self.GeneratePaging();
				this.lbListBrief.Text = Paging.Self.ListSummary;
				#endregion		
			}
			else 
			{
				lbNews.Visible = true;
			}
			drNews.Close();
			dbUtil.SqlConnection.Close();
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
		/// 디자이너 지원에 필요한 메서드입니다.
		/// 이 메서드의 내용을 코드 편집기로 수정하지 마십시오.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	}
}
