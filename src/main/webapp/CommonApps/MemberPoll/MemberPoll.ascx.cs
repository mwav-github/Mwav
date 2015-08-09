using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using JinsLibrary;
using JinsLibrary.STATEMANAGE;

namespace KistelSite.CommonApps.MemberPoll
{
	/// <summary>
	///		MemberPoll에 대한 요약 설명입니다.
	/// </summary>
	public class MemberPoll : System.Web.UI.UserControl
	{
		private DBLib dbUtil;
		private SqlDataReader drPoll;
		private int poll_id;
		private int pollSum;
		protected System.Web.UI.WebControls.Label pTopic;
		protected System.Web.UI.WebControls.RadioButtonList rblExamples;
		protected System.Web.UI.WebControls.Panel pnViewResult;
		protected System.Web.UI.WebControls.HyperLink hlView;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.ImageButton btnVote;
		protected System.Web.UI.WebControls.ValidationSummary ValidationSummary1;
		
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!Page.IsPostBack) 
			{
				if( LoadPollMain() )
				{
					if(Cookie.Self["voted"] == "")
					{
						//폴 예바인딩				
						this.PollExampleBind();
					}
					else
					{
						//결과보기
						this.ViewPollResult();
						this.btnVote.Visible = false;
						this.rblExamples.Visible = false;
						this.pnViewResult.Visible = true;
						this.hlView.Visible = true;
						this.hlView.NavigateUrl = "javascript:WindowOpen('/CommonApps/MemberPoll/PollView.aspx?poll_id=" + this.poll_id +"','poll','')";
					}
				}
				else
				{
					PostState.Self["poll_id"] = 0;
					pTopic.Text = "현재 진행하고 있지 않습니다.";		
					this.rblExamples.Visible = false;
					this.btnVote.Visible = false;
				}
			}			
		}

		#region 폴메인부 로딩
		private bool LoadPollMain()
		{
			dbUtil = new DBLib();
		
			string fieldNames,tableName,whereClause,orderBy;
			fieldNames = "poll_id,pTopic";
			tableName = "t_PollMain";
			whereClause = "DATEDIFF(day, pBeginTime, '" + DateTime.Now.ToShortDateString() + "') >=0"; 
			whereClause += " AND DATEDIFF(day, pEndTime, '" + DateTime.Now.ToShortDateString() + "') <=0"; 
			//whereClause += " AND pEndTime >= '" + DateTime.Now.ToShortDateString() + "'";
			whereClause += " AND pDisplay = 1 AND IsStaff = 0";
			orderBy = "poll_id DESC";				
			
			//실제쿼리실행
			drPoll = dbUtil.Select_DR(1,fieldNames,tableName,whereClause,orderBy);
			//Response.End();

			if(drPoll.HasRows) 
			{
				drPoll.Read();
				PostState.Self["poll_id"] = drPoll["poll_id"].ToString();
				this.poll_id = Convert.ToInt32(drPoll["poll_id"]);
				pTopic.Text = drPoll["pTopic"].ToString();
				//쿠키표시된 
				if(this.poll_id.ToString() != Cookie.Self["voted"])
					Cookie.Self.RemoveCookie("voted");
				drPoll.Close();
				return true;
			}
			else
				return false;

		}
		#endregion

		#region 폴예제바인딩
		protected void PollExampleBind()
		{
			dbUtil = new DBLib();

			string fieldNames,tableName,whereClause,orderBy;
			fieldNames = "exNbr,example";
			tableName = "t_PollEX";
			whereClause = "poll_id =" + this.poll_id;
			orderBy = "exNbr";		
			//실제쿼리실행
			drPoll = dbUtil.Select_DR(fieldNames,tableName,whereClause,orderBy);

			if(drPoll.HasRows) 
			{
				rblExamples.DataSource = drPoll;
				
				rblExamples.DataValueField = "exNbr";
				rblExamples.DataTextField = "example";
				rblExamples.DataTextFormatString = "{0}";
				rblExamples.DataBind();
			}
			else 
			{
				rblExamples.ToolTip = "예제가 없습니다.";
			}
			drPoll.Close();
		}
		#endregion
		
		#region 득표결과보기
		private void ViewPollResult()
		{
			//총득표수 셋팅
			//this.GetPollSum();
			this.pollSum = PollBaseLib.GetPollSum(this.poll_id);

			dbUtil = new DBLib();
			string fieldNames,tableName,whereClause,orderBy;
			fieldNames = "exNbr,example,pPoint";
			tableName = "t_PollEX";
			whereClause = "poll_id =" + this.poll_id;
			orderBy = "exNbr";		
			//실제쿼리실행
			drPoll = dbUtil.Select_DR(fieldNames,tableName,whereClause,orderBy);		

			Table pTable = new Table();
			TableRow tRow;
			TableCell tCell;
			while(drPoll.Read()) 
			{				
				tRow = new TableRow();
				tCell = new TableCell();
				tCell.ColumnSpan = 2;
				tCell.Text = drPoll["exNbr"].ToString() + "." + drPoll["example"].ToString();
				//Create a new cell and add it to the row.//행만들기
				tRow.Cells.Add(tCell);					
				pTable.Rows.Add(tRow);
				
				tRow = new TableRow();
				tCell = new TableCell();
				tCell.Width = Unit.Percentage(2);
				//tCell.BackColor = Color.LightGreen;
				tCell.Text = "&nbsp;";
				tRow.Cells.Add(tCell);
				
				tCell = new TableCell();
				tCell.CssClass = "sTxt1";
			
				System.Web.UI.WebControls.Image imgBar = PollBaseLib.DrawGraph(Convert.ToInt32(drPoll["pPoint"]), this.pollSum);
				tCell.Controls.Add(imgBar);
				tCell.Controls.Add(new LiteralControl("&nbsp;" + imgBar.AlternateText));
				tRow.Cells.Add(tCell);
				
				pTable.Width = Unit.Percentage(100);
				pTable.BorderWidth = 0;
				pTable.CellPadding = 0;
				pTable.CellSpacing = 0;
				pTable.Rows.Add(tRow);
			}
			drPoll.Close();			
			pnViewResult.Controls.Add(pTable);
		}

		//총득표수(공통으로 뽑음)
		private void GetPollSum()
		{			
			string qryString;
			dbUtil = new DBLib();
			qryString = "SELECT SUM(pPoint) FROM t_PollEX "
				+	" Where poll_id = " + this.poll_id 
				+	" GROUP BY poll_id";
			this.pollSum = dbUtil.MyExecuteScalar(qryString);
		}
		/*
		//그래프그리기(공통으로 뽑음--장기적으로 이상없으면 지움)
		private System.Web.UI.WebControls.Image DrawGraph(int point)
		{
			System.Web.UI.WebControls.Image imgCntGraph;
			double widthPercent = 0;
			if(this.pollSum > 0)
				widthPercent = Math.Round(MathLib.GetPercent(point, this.pollSum), 1);
			
			imgCntGraph = new System.Web.UI.WebControls.Image();
			imgCntGraph.ImageUrl = @"/CommonApps/MemberPoll/Images/green.gif";
			imgCntGraph.Width = Unit.Percentage(widthPercent * 1.4);
			imgCntGraph.Height = 10;
			imgCntGraph.AlternateText = Unit.Percentage(widthPercent).ToString();
			imgCntGraph.ImageAlign = ImageAlign.AbsMiddle;
			imgCntGraph.Visible = true;
			return imgCntGraph;
		}
		*/
		#endregion

		//투표
		private void btnVote_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			Page.Validate();
			if(!Page.IsValid)
				ClientAction.ShowMsgBack("정확히 입력하세요.");

			dbUtil = new DBLib();
			string whereClause =	"poll_id =" + PostState.Self["poll_id"].ToString();
			whereClause +=			" AND exNbr =" + rblExamples.SelectedValue;

			if(dbUtil.ChangeFigure("t_PollEX", "pPoint", 1, whereClause) > 0)
			{
				Cookie.Self.SetCookie("voted", PostState.Self["poll_id"].ToString(), 1);
				Cookie.Self.SetCookie("votedDay", System.DateTime.Today.ToString(), 1);
				ClientAction.ShowMsgAndGoUrl("[" + rblExamples.SelectedValue +"." + rblExamples.SelectedItem.Text + "] 에 투표하였습니다.", Request.Url.ToString());
			}	
			else
				ClientAction.ShowInfoMsg("에러!!");
		}
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
			this.btnVote.Click += new System.Web.UI.ImageClickEventHandler(this.btnVote_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


		#region 임의 투표쿠키삭제
		private void Button1_Click(object sender, System.EventArgs e)
		{
			Cookie.Self["voted"] = null;
			Cookie.Self.RemoveCookie("voted");		
		}
		#endregion




	}
}
