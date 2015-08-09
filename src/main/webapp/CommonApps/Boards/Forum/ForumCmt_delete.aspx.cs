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

//using Neovis.Web.Boards.Business;
//using Neovis.Web.Member.Business;

using MiddleTier.Boards.Comment;
using MiddleTier.Boards.Business;

using JinsLibrary;
using JinsLibrary.STATEMANAGE;


namespace KistelSite.CommonApps.Boards.Forum
{
	/// <summary>
	/// comment_delete에 대한 요약 설명입니다.
	/// </summary>
	public class ForumCmt_delete : System.Web.UI.Page //Neovis.Web.Homepage.RootPage 
	{
		protected int id, cid, pageNo;
		protected string db;

		private void Page_Load(object sender, System.EventArgs e)
		{
			//로그인되었는지 확인
			KistelSite.Admins.CompanyMgr.Staffs.LoginProcess.LoginOK();

			// 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
			//if(Context.User.Identity.IsAuthenticated)
			//{
				if (Request.QueryString["db"] == null)
					ClientAction.ShowMsgBack("테이블명이 없습니다. 다시 접속하십시오.");
				else
					db = Request.QueryString["db"];

				id = int.Parse(Request.QueryString["id"]);
				cid = int.Parse(Request.QueryString["cid"]);
				pageNo = int.Parse(Request.QueryString["pageno"]);

				//CommentBiz objComment = new CommentBiz(db+"Comment", cid);
				BrdsCmtBiz objComment = new BrdsCmtBiz(db+"Comment", cid);

			
			//Response.Write("--> " + objComment.UserID);
			
				//if (objComment.UserID == Context.User.Identity.Name)
				if (objComment.UserID == Cookie.Self["staff_id"])
				{
					int rowsAffected = objComment.Delete(cid);

					if(rowsAffected == 1)
					{
						Response.Redirect("ForumView.aspx?db="+db+"&id="+id+"&pageno="+pageNo);
					}
					else
					{
						ClientAction.ShowMsgBack("코멘트 삭제에 실패하였습니다.");
					}
				}
			
			//}
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
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
