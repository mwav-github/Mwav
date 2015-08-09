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

namespace KistelSite.CommonApps.BoardNotice
{
	/// <summary>
	/// bnView에 대한 요약 설명입니다.
	/// </summary>
	public class bnView : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label bNotice_id;
		protected System.Web.UI.WebControls.Label bnGroup;
		protected System.Web.UI.WebControls.Label viewCount;
		protected System.Web.UI.WebControls.Label writeDT;
		protected System.Web.UI.WebControls.Label bnSubTitle;
		protected System.Web.UI.WebControls.Label modifyDT;
		protected System.Web.UI.WebControls.HyperLink btnList;
		protected System.Web.UI.WebControls.HyperLink btnCancle;
		protected System.Web.UI.WebControls.HyperLink hlPreData;
		protected System.Web.UI.WebControls.HyperLink hlNextData;
		protected System.Web.UI.WebControls.Label bnTitle;

		DBLib dbUtil;
		string bnID, bnG;
		protected System.Web.UI.WebControls.Label bnContent;		
		
		private void Page_PreRender(object sender, System.EventArgs e)
		{
			//URLQuery.Self.GetQueryString();
		}
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(Request.QueryString["bnID"] != null)
			{
				if(!Page.IsPostBack) 
				{
					//페이지타이틀
					JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "공지사항보기";

					dbUtil = new DBLib();
					this.bnID = Request.QueryString["bnID"];
					this.bnG = Request.QueryString["bnG"];
					//조회수 증가
					dbUtil.ChangeFigure("t_BoardNotice", "viewCount", 1, "bNotice_id=" + bnID);
					//바인딩
					if(this.NoticeViewBind())
					{
						//리스트 네비게이션 재정의	
						URLQuery.Self.SetQueryString();
//WebUtil.CurrentResponse.Write(URLQuery.Self.GetQueryString() + "Load" );						
						this.btnList.NavigateUrl = "/CommonApps/BoardNotice/bnList.aspx?" + URLQuery.Self.GetQueryString();
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

		#region 공지사항 바인딩
		protected Boolean NoticeViewBind()
		{			
			string qryNoticeView = "Select staff_id,bnGroup,bnTitle,bnSubTitle,bnContent,viewCount,writeDT,modifyDT "
				+ " FROM t_BoardNotice"
				+ " WHERE bNotice_id=" + bnID;
	
			SqlDataReader drNotice;
			drNotice = dbUtil.MyExecuteReader(qryNoticeView);
			if (drNotice.Read()) 
			{
				this.bNotice_id.Text = bnID;
				this.bnGroup.Text = drNotice["bnGroup"].ToString();
				this.viewCount.Text = drNotice["viewCount"].ToString();
				this.writeDT.Text = drNotice.GetDateTime(6).ToShortDateString();
				if (drNotice["modifyDT"] != DBNull.Value) 
				{
					this.modifyDT.Text += "최종수정일: " + drNotice.GetDateTime(7).ToShortDateString();
					this.modifyDT.Visible = true;
				}				
				this.bnTitle.Text = HTML.ReplaceTo(drNotice["bnTitle"].ToString(), "toHTML");
				this.bnSubTitle.Text = HTML.ReplaceTo(drNotice["bnSubTitle"].ToString(), "toHTML");
				if(this.bnSubTitle.Text == "")
					this.bnSubTitle.Text = this.bnTitle.Text;
				this.bnContent.Text = HTML.ReplaceTo(drNotice["bnContent"].ToString(), "toHTML");
				drNotice.Close();
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
			qryString = "SELECT bNotice_id, bnGroup, bnTitle"
				+	" FROM t_BoardNotice WHERE bnStatus > 1 "
				+ " ORDER BY bnOrder DESC,bNotice_id DESC";
			DataTable dTable = dbUtil.MyFillTable(qryString);
			int i;
			for(i=0; i < dTable.Rows.Count-1; i++)
			{
				if(dTable.Rows[i]["bNotice_id"].ToString() == bnID)
					break;
				//Response.Write("cccccccccc = " + dTable.Rows[i]["bNotice_id"].ToString() + "<br>");
			}
			//Response.Write("i = " + i.ToString() + "<br>");

			string strTemp;
			DataRow dRow;
			//이전글 가져오기
			if(i < dTable.Rows.Count-1)
			{
				dRow = dTable.Rows[i+1];
				strTemp = "[" + dRow["bnGroup"].ToString() + "] " + Text.ShortenString(dRow["bnTitle"].ToString(), 40);
				this.hlPreData.Text = strTemp;
				this.hlPreData.NavigateUrl = Request.Url.AbsolutePath.ToString() + "?bnID=" + dRow["bNotice_id"].ToString();
				if(bnG != null)
					this.hlPreData.NavigateUrl += "&bnsG="+bnG;
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
				strTemp = "[" + dRow["bnGroup"].ToString() + "] " + Text.ShortenString(dRow["bnTitle"].ToString(), 40);
				this.hlNextData.Text = strTemp;
				this.hlNextData.NavigateUrl = Request.Url.AbsolutePath.ToString() + "?bnID=" + dRow["bNotice_id"].ToString();
				if(bnG != null)
					this.hlNextData.NavigateUrl += "&bnsG="+bnG;
			}
			else
			{
				this.hlNextData.Text = "다음글이 없습니다";
				this.hlNextData.ForeColor = Color.Gray;
			}
			//			foreach (DataRow drow in dTable.Rows)
			//			{
			//				
			//				Response.Write("cccccccccc = " + drow["bNotice_id"] +	" : " + drow["bnTitle"] + ":" + drow["bnsOrder"] + "<br>");
			//				this.bnsContent.Text += "dddd = " + drow["bNotice_id"] +	" : " + drow["bnTitle"] + ":" + drow["bnsOrder"] + "<br>";
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
