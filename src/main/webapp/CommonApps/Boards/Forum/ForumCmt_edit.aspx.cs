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
//using Neovis.Web.Member.Business;
//using Neovis.Web.Boards.Business;
using MiddleTier.Boards.Business;
using MiddleTier.Boards.Comment;

using JinsLibrary;
using JinsLibrary.STATEMANAGE;

namespace KistelSite.CommonApps.Boards.Forum
{
	/// <summary>
	/// comment_edit에 대한 요약 설명입니다.
	/// </summary>
	public class ForumCmt_edit : System.Web.UI.Page //Neovis.Web.Homepage.RootPage 
	{
		protected System.Web.UI.WebControls.ImageButton EditButton;
		protected System.Web.UI.WebControls.TextBox Comment;

		protected string db;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected int cid;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			//로그인되었는지 확인
			KistelSite.Admins.CompanyMgr.Staffs.LoginProcess.LoginOK();

			// 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
			db = Request.QueryString["db"];
			cid = int.Parse(Request.QueryString["cid"]);

			if (!Page.IsPostBack)
			{
				//CommentBiz objComment = new CommentBiz(db+"Comment", cid);
				BrdsCmtBiz objComment = new BrdsCmtBiz(db+"Comment", cid);
				
				//if (Context.User.Identity.Name == objComment.UserID)
				if (Cookie.Self["staff_id"] == objComment.UserID)
					Comment.Text = objComment.Comment;
				else
				{
					ClientAction.ShowMsgAndClose("정상적인 접근이 아닙니다");
					//ErrorLogin("?db="+db+"&cid="+cid);
				}
			}
		}

		#region Web Form 디자이너에서 생성한 코드
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 이 호출은 ASP.NET Web Form 디자이너에 필요합니다.
			//
			base.OnInit(e);
			InitializeComponent();
		}
		
		/// <summary>
		/// 디자이너 지원에 필요한 메서드입니다.
		/// 이 메서드의 내용을 코드 편집기로 수정하지 마십시오.
		/// </summary>
		private void InitializeComponent()
		{    
			this.EditButton.Click += new System.Web.UI.ImageClickEventHandler(this.EditButton_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void EditButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			//SiteIdentity currUser = (SiteIdentity)Context.User.Identity;
			if (IsValid)
			{
				//CommentBiz objComment = new CommentBiz(db+"Comment");
				BrdsCmtBiz objComment = new BrdsCmtBiz(db+"Comment");


				//if (Context.User.Identity.IsAuthenticated)
					//objComment.Update(cid, currUser.UserID, currUser.UserName, Comment.Text);
					objComment.Update(cid, Cookie.Self["staff_id"], Cookie.Self["sName"], Comment.Text);

				ClientAction.ReloadOpenerClose();
			}
		}
	}
}
