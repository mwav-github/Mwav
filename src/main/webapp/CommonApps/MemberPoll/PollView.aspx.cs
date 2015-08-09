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

namespace KistelSite.CommonApps.MemberPoll
{
	/// <summary>
	/// PollView에 대한 요약 설명입니다.
	/// </summary>
	public class PollView : System.Web.UI.Page
	{
		private DBLib dbUtil;
		private SqlDataReader drPoll;
		private int poll_id;
		private int pollSum;
		protected System.Web.UI.WebControls.Label pTopic;
		protected System.Web.UI.WebControls.PlaceHolder phViewResult;
		protected System.Web.UI.WebControls.Label period;


		private void Page_Load(object sender, System.EventArgs e)
		{
			
			if(!Page.IsPostBack) 
			{
				//스크린 크기변경
				ClientAction.WindowResizeTo(500,500);


				if(Request.QueryString["poll_id"] != null)
				{	
					this.poll_id = Convert.ToInt32(Request.QueryString["poll_id"]);
					//결과보기
					if(this.LoadPollMain())
                        this.ViewPollResult();
					else
						phViewResult.Visible = false;
				}
				else
				{
					ClientAction.ShowMsgAndClose("정상적인 접근이 아닙니다");
				}
			}
		}

		#region 폴메인부 로딩
		private bool LoadPollMain()
		{
			dbUtil = new DBLib();
		
			string fieldNames,tableName,whereClause,orderBy;
			fieldNames = "poll_id,pTopic,pBeginTime,pEndTime";
			tableName = "t_PollMain";
			whereClause = "DATEDIFF(day, pBeginTime, '" + DateTime.Now.ToShortDateString() + "') >=0"; 
			whereClause += " AND DATEDIFF(day, pEndTime, '" + DateTime.Now.ToShortDateString() + "') <=0"; 
			whereClause += " AND pDisplay = 1 AND IsStaff = 0";
			whereClause += " AND poll_id = " + this.poll_id;
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
				//기간세팅
				period.Text = PollBaseLib.GetPeriod(drPoll["pBeginTime"], drPoll["pEndTime"]);
				drPoll.Close();
				return true;
			}
			else 
			{
				PostState.Self["poll_id"] = 0;
				pTopic.Text = "현재 진행하고 있지 않습니다.";				
				return false;
			}
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

			pTable.Width = Unit.Percentage(100);
			pTable.BorderWidth = 1;
			pTable.BorderStyle = BorderStyle.Solid;				
			pTable.BorderColor = Color.LightBlue;
			pTable.CellPadding = 1;
			pTable.CellSpacing = 2;
			

			tRow = new TableRow();
			tRow.HorizontalAlign = HorizontalAlign.Center;
			tRow.Height = 30;
			tRow.BackColor = JinsLibrary.IMAGE.ImageLib.Self.ColorFromArgb("d2","f1","ff");		//Color.FromArgb(Convert.ToInt32("d2",16),Convert.ToInt32("f1",16) ,Convert.ToInt32("ff",16));

			tCell = new TableCell();
			tCell.CssClass = "header";
			tCell.Text = "예문";
			tRow.Cells.Add(tCell);					
			tCell = new TableCell();
			tCell.CssClass = "header";
			tCell.Width = 50;
			tCell.Text = "득표수";
			tRow.Cells.Add(tCell);
			tCell = new TableCell();
			tCell.CssClass = "header";
			tCell.Text = "그래프";
			tRow.Cells.Add(tCell);
			pTable.Rows.Add(tRow);

			while(drPoll.Read()) 
			{				
				tRow = new TableRow();
				tCell = new TableCell();
				tCell.Text = "&nbsp;" + drPoll["exNbr"].ToString() + "." + drPoll["example"].ToString();
				tRow.Cells.Add(tCell);					
				
				tCell = new TableCell();
				tCell.BackColor = JinsLibrary.IMAGE.ImageLib.Self.ColorFromArgb("f4","fc","ff");
				tCell.Text = drPoll["pPoint"].ToString() + " 표";
				tCell.HorizontalAlign = HorizontalAlign.Center;
				tRow.Cells.Add(tCell);					

				tCell = new TableCell();
				System.Web.UI.WebControls.Image imgBar = PollBaseLib.DrawGraph(Convert.ToInt32(drPoll["pPoint"]), this.pollSum);
				tCell.Controls.Add(imgBar);
				tCell.Controls.Add(new LiteralControl("&nbsp;" + imgBar.AlternateText));
				tRow.Cells.Add(tCell);					
				
				pTable.Rows.Add(tRow);

			}
			tRow = new TableRow();
			tRow.BackColor = JinsLibrary.IMAGE.ImageLib.Self.ColorFromArgb("d2","f1","ff");
			tCell = new TableCell();
			tRow.Height = 20;
			tCell.ColumnSpan = 3;
			tRow.HorizontalAlign = HorizontalAlign.Center;
			tCell.Text = "[총득표수 : " + this.pollSum.ToString() + "표]";
			tRow.Cells.Add(tCell);
			pTable.Rows.Add(tRow);

			drPoll.Close();			
			phViewResult.Controls.Add(pTable);
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
