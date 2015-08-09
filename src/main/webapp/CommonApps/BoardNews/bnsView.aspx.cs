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
using JinsLibrary.STATEMANAGE;

namespace KistelSite.CommonApps.BoardNews
{
	/// <summary>
	/// bnView에 대한 요약 설명입니다.
	/// </summary>
	public class bnsView : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label bNews_id;
		protected System.Web.UI.WebControls.Label bnsGroup;
		protected System.Web.UI.WebControls.Label viewCount;
		protected System.Web.UI.WebControls.Label writeDT;
		protected System.Web.UI.WebControls.Label bnsSubTitle;
		protected System.Web.UI.WebControls.Label bnsContent;		
		protected System.Web.UI.WebControls.Label modifyDT;		
		protected System.Web.UI.WebControls.HyperLink btnList;
		protected System.Web.UI.WebControls.HyperLink btnCancle;
		protected System.Web.UI.WebControls.HyperLink hlPreData;
		protected System.Web.UI.WebControls.HyperLink hlNextData;
		protected System.Web.UI.WebControls.Label bnsTitle;

		DBLib dbUtil;
		string bnsID, bnsG;
				
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(Request.QueryString["bnsID"] != null)
			{
				if(!Page.IsPostBack) 
				{
					//페이지타이틀
					JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "제품동향뉴스보기";

					//Response.Cache.SetExpires(DateTime.MinValue);
					//queryString = "?" + Server.UrlEncode(Request.QueryString.ToString());
					
					dbUtil = new DBLib();
					this.bnsID = Request.QueryString["bnsID"];
					this.bnsG = Request.QueryString["bnsG"];
			
					//조회수 증가
					dbUtil.ChangeFigure("t_BoardNews", "viewCount", 1, "bNews_id=" + bnsID);
					//바인딩
					if(this.NewsViewBind())
					{
						//리스트 네비게이션 재정의	
						URLQuery.Self.SetQueryString();
//WebUtil.CurrentResponse.Write(URLQuery.Self.GetQueryString() + "Load" );						
						this.btnList.NavigateUrl = "/CommonApps/BoardNews/bnsList.aspx?" + URLQuery.Self.GetQueryString();
						//이전글  다음글 보기
						this.GetPreNextData();
						//DB닫기
						dbUtil.SqlConnection.Close();
					}
					else 
					{
						ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
					}
				}
			}
			else
				ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");							
		}

		#region 뉴스 바인딩
		protected Boolean NewsViewBind()
		{			
			string qryString = "Select bnsGroup,bnsTitle,bnsSubTitle,bnsContent,viewCount,staff_id,writeDT,modifyDT "
				+ " FROM t_BoardNews"
				+ " WHERE bNews_id=" + bnsID;
	
			SqlDataReader drNews;
			drNews = dbUtil.MyExecuteReader(qryString);
			if (drNews.Read()) 
			{
				this.bNews_id.Text = bnsID;
				this.bnsGroup.Text = drNews["bnsGroup"].ToString();
				this.viewCount.Text = drNews["viewCount"].ToString();
				this.writeDT.Text = drNews.GetDateTime(6).ToShortDateString();
				if (drNews["modifyDT"] != DBNull.Value) 
				{
					this.modifyDT.Text += "최종수정일: " + drNews.GetDateTime(7).ToShortDateString();
					this.modifyDT.Visible = true;
				}				
				string tempTitle = drNews["bnsTitle"].ToString();
				this.bnsTitle.Text = tempTitle;
				this.bnsTitle.ToolTip = tempTitle;



				this.bnsSubTitle.Text = HTML.ReplaceTo(drNews["bnsSubTitle"].ToString(), "toHTML");
				if(this.bnsSubTitle.Text == "")
					this.bnsSubTitle.Text = this.bnsTitle.Text;
				this.bnsContent.Text = HTML.ReplaceTo(drNews["bnsContent"].ToString(), "toHTML");
				drNews.Close();
				return true;
			}
			else
				return false;
		}
		#endregion
		
		#region 이전글  다음글 보기
		private void GetPreNextData()
		{
			string qryString;
			qryString = "SELECT bNews_id,bnsGroup,bnsTitle,bnsOrder,bnsStatus"
				+	" FROM t_BoardNews WHERE bnsStatus > 1 "
				+ " ORDER BY bnsOrder DESC,bNews_id DESC";
			DataTable dTable = dbUtil.MyFillTable(qryString);
			int i;
			for(i=0; i < dTable.Rows.Count-1; i++)
			{
				if(dTable.Rows[i]["bNews_id"].ToString() == bnsID)
					break;
				//Response.Write("cccccccccc = " + dTable.Rows[i]["bNews_id"].ToString() + "<br>");
			}
			//Response.Write("i = " + i.ToString() + "<br>");

			string strTemp;
			DataRow dRow;
			//이전글 가져오기
			if(i < dTable.Rows.Count-1)
			{
				dRow = dTable.Rows[i+1];
				strTemp = "[" + dRow["bnsGroup"].ToString() + "] " + Text.ShortenString(dRow["bnsTitle"].ToString(), 40);
				this.hlPreData.Text = strTemp;
				this.hlPreData.NavigateUrl = Request.Url.AbsolutePath.ToString() + "?bnsID=" + dRow["bNews_id"].ToString();
				if(bnsG != null)
					this.hlPreData.NavigateUrl += "&bnsG="+bnsG;
			}
			else
			{
				this.hlPreData.Text = "이전글이 없습니다";
				this.hlPreData.ForeColor = Color.Gray;
			}

			//다음글 가져오기
			if(i > 0)
			{
				dRow = dTable.Rows[i-1];
				strTemp = "[" + dRow["bnsGroup"].ToString() + "] " + Text.ShortenString(dRow["bnsTitle"].ToString(), 40);
				this.hlNextData.Text = strTemp;
				this.hlNextData.NavigateUrl = Request.Url.AbsolutePath.ToString() + "?bnsID=" + dRow["bNews_id"].ToString();
				if(bnsG != null)
					this.hlNextData.NavigateUrl += "&bnsG="+bnsG;
			}
			else
			{
				this.hlNextData.Text = "다음글이 없습니다";
				this.hlNextData.ForeColor = Color.Gray;
			}
			//			foreach (DataRow drow in dTable.Rows)
			//			{
			//				
			//				Response.Write("cccccccccc = " + drow["bNews_id"] +	" : " + drow["bnsTitle"] + ":" + drow["bnsOrder"] + "<br>");
			//				this.bnsContent.Text += "dddd = " + drow["bNews_id"] +	" : " + drow["bnsTitle"] + ":" + drow["bnsOrder"] + "<br>";
			//			}
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
