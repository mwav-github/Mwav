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

using JinsLibrary;

namespace KistelSite.CommonApps.Calendar
{
	/// <summary>
	/// Calendar에 대한 요약 설명입니다.
	/// </summary>
	public class Calendar : System.Web.UI.Page
	{
		private DateTime sDate;
		protected System.Web.UI.WebControls.TextBox EndTime;
		protected System.Web.UI.WebControls.Calendar calBasic;
		protected System.Web.UI.WebControls.Label lbCalDisplay;
		protected System.Web.UI.WebControls.HyperLink hlReset;
		protected System.Web.UI.WebControls.ImageButton ibCalDone;
		protected System.Web.UI.WebControls.HyperLink hlClose;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.TextBox BeginTime;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			//페이지타이틀설정
			ClientAction.AddBrowserTitleBar("Calendar Helper");
			if(!Page.IsPostBack) 
			{
				//Page_Load에서 발생할 이벤트들을 미리 알수 있는가? 
				//string evtSender = Request["__EVENTTARGET"];   //'이벤트발생 컨트롤 ID
				//string evtArg = Request["__EVENTARGUMENT"];    //'이벤트발생 매개변수
				//Response.Write("영기영 --> " +  evtSender);
				hlReset.NavigateUrl = Request.Url.ToString();// + "?" + URLQuery.Self.GetQueryString();
			} 
			else
			{
				calBasic.SelectedDate = System.DateTime.MinValue;
			}
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
		/// 디자이너 지원에 필요한 메서드입니다.
		/// 이 메서드의 내용을 코드 편집기로 수정하지 마십시오.
		/// </summary>
		private void InitializeComponent()
		{    
			this.calBasic.DayRender += new System.Web.UI.WebControls.DayRenderEventHandler(this.calBasic_DayRender);
			this.calBasic.SelectionChanged += new System.EventHandler(this.calBasic_SelectionChanged);
			this.ibCalDone.Click += new System.Web.UI.ImageClickEventHandler(this.ibCalDone_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void calBasic_SelectionChanged(object sender, System.EventArgs e)
		{
			this.sDate = calBasic.SelectedDate;			
			if(sDate < DateTime.Today)
			{
				ClientAction.ShowMsgBack("지난 날짜는 선택할 수 없습니다.");
			}
			
		
			if(this.BeginTime.Text=="")
			{
				this.BeginTime.Text =  sDate.ToShortDateString();
				this.lbCalDisplay.Text = "종료일을 선택하세요.";
			}
			else if(this.EndTime.Text=="")
			{
				if(sDate < Convert.ToDateTime(this.BeginTime.Text))
				{
					ClientAction.ShowMsgBack("종료일이 시작일보다 이전일 수 없습니다.");
				}
					
				this.EndTime.Text =  sDate.ToShortDateString();
				this.lbCalDisplay.Text = "기간설정이 완료됐으면 확인을 클릭하세요.";
			}
			else
			{
				this.BeginTime.Text = sDate.ToShortDateString();
				this.EndTime.Text = "";
				this.lbCalDisplay.Text = "다시 기간설정을 합니다.";
			}
			

			//Response.Write("<br><br>");
			//Response.Write("this.BeginTime.Text ->" + this.BeginTime.Text + "<br>");
			//Response.Write("sDate ->" + sDate.ToShortDateString() + "<br>");
		}

		private void calBasic_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
		{
			if(e.Day.Date.ToShortDateString() == this.BeginTime.Text)
			{
				e.Cell.BackColor = Color.Pink;
				//e.Cell.Controls.Add(new LiteralControl("<br><font size='1'>*</font>"));
			}
			if(e.Day.Date.ToShortDateString() == this.EndTime.Text)
			{
				e.Cell.BackColor = Color.Purple;
				e.Cell.ForeColor = Color.White;
			}
			
			if(e.Day.IsSelected)
				e.Cell.BackColor = Color.Purple;
		}

		private void ibCalDone_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			Page.Validate();
			if(!Page.IsValid)
				ClientAction.ShowMsgBack("시작일을 입력하세요.");

			if(this.EndTime.Text == "")
				this.EndTime.Text= "2079-06-06";
		
			string javaScript = @"
			<script language=""javascript"">
			<!--
				opener.window.document.{0}.{1}.value = frmCal.BeginTime.value;
				opener.window.document.{0}.{2}.value = frmCal.EndTime.value;
				window.close();
			-->
			</script>
			";
			string [] arrPeriod = Request.QueryString["period"].Split("-".ToCharArray(),2);
			javaScript = String.Format(javaScript, Request.QueryString["frmName"], arrPeriod[0], arrPeriod[1]);
			
			//if (!page.IsStartupScriptRegistered("_javaScript"))
				Page.RegisterStartupScript("_javaScript", javaScript);
		}
	}
}
