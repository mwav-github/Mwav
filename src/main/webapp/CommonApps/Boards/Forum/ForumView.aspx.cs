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


using MiddleTier.Boards.Business;
using MiddleTier.Boards.Comment;



using JinsLibrary;
using JinsLibrary.STATEMANAGE;

namespace KistelSite.CommonApps.Boards.Forum
{
	/// <summary>
	/// view에 대한 요약 설명입니다.
	/// </summary>
	public class ForumView : System.Web.UI.Page //Neovis.Web.Homepage.RootPage 
	{
		protected System.Web.UI.WebControls.Label IDLabel;
		protected System.Web.UI.WebControls.Label WriterLabel;
		protected System.Web.UI.WebControls.Label RegDateLabel;
		protected System.Web.UI.WebControls.Label VisitedLabel;
		protected System.Web.UI.WebControls.Label SubjectLabel;
		protected System.Web.UI.WebControls.Label ContentLabel;
		protected System.Web.UI.WebControls.HyperLink ListLink;
		protected System.Web.UI.WebControls.HyperLink BackLink;
		protected System.Web.UI.WebControls.HyperLink NextLink;
		protected System.Web.UI.WebControls.HyperLink EditLink;
		protected System.Web.UI.WebControls.HyperLink ReplyLink;
		protected System.Web.UI.WebControls.DataList BoardList;
	
		protected string db;
		protected int pageNo, id;
		protected string keyField, keyWord;
		protected System.Web.UI.WebControls.ImageButton DeleteButton;
		protected System.Web.UI.WebControls.DataList CommentList;
		protected System.Web.UI.WebControls.ImageButton CommentButton;
		protected System.Web.UI.WebControls.TextBox Comment;
		protected System.Web.UI.HtmlControls.HtmlForm ViewForm;
		protected bool searchStatus = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			//로그인되었는지 확인
			KistelSite.Admins.CompanyMgr.Staffs.LoginProcess.LoginOK();
			
			// 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
			DeleteButton.Attributes.Add("OnClick", "return confirm('게시물을 삭제 하시겠습니까?');");
			CommentButton.Attributes.Add("OnClick", "return confirm('코멘트를 등록 하시겠습니까?');");
			string content;

			if (Request.QueryString["db"] == null)
				ClientAction.ShowMsgBack("테이블명이 지정되지 않았습니다.");
			else
				db = Request.QueryString["db"];

			// 검색관련 데이터 수집
			if (Request.QueryString["keyword"] != null)
			{
				keyField = Request.QueryString["keyfield"];
				keyWord = Request.QueryString["keyword"];
				searchStatus = true;
			}

			// 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
			if (Request.QueryString["pageno"] == null)
				pageNo = 1;
			else
				pageNo = int.Parse(Request.QueryString["pageno"]);

			id = int.Parse(Request.QueryString["id"]);
			
			if (!Page.IsPostBack)
			{
				QnaBiz objBoard = new QnaBiz(db, id);

				// 게시판 ID 정보 수집
				if (!searchStatus)
					objBoard.GetBoardIDInfo(id);
				else
					objBoard.GetBoardIDInfo(id, keyField, keyWord);

				if(objBoard.Email != null)
				{
					WriterLabel.Text = "<a href='mailto:" + objBoard.Email + "'>" + objBoard.Writer + "</a>";
				}
				else
				{
					WriterLabel.Text = objBoard.Writer;
				}

				if (objBoard.ListNum == 0)
					IDLabel.Text = "-";
				else
					IDLabel.Text = objBoard.ListNum.ToString();

				RegDateLabel.Text = objBoard.RegDate;
				VisitedLabel.Text = objBoard.Visited.ToString();

				// 검색일 때 글 색 변환
				if (keyField == "subject")
				{
					SubjectLabel.Text = Server.HtmlEncode(objBoard.Subject).Replace(keyWord, "<b><font color=red>"+keyWord+"</font></b>");
				}
				else
				{
					SubjectLabel.Text = Server.HtmlEncode(objBoard.Subject);
				}

				content = objBoard.Content;
				if(objBoard.Html)
				{
					ContentLabel.Text = content;
				}
				else
				{
					content = Server.HtmlEncode(content);
					content = content.Replace("\n","\n<br>");

					ContentLabel.Text = content;
				}

				if (keyField == "content")
					ContentLabel.Text = ContentLabel.Text.Replace(keyWord, "<b><font color=red>"+keyWord+"</font></b>");

				if(objBoard.PrevID == 0)
					BackLink.ImageUrl = "Images/img/back2.gif";
				else
				{
					if (!searchStatus)
						BackLink.NavigateUrl = "ForumView.aspx?db="+db+"&pageno=" + pageNo + "&id=" + objBoard.PrevID;
					else
						BackLink.NavigateUrl = "ForumView.aspx?db="+db+"&pageno=" + pageNo + "&id=" + objBoard.PrevID + "&keyfield=" + keyField + "&keyword=" + Server.UrlEncode(keyWord);
				}

				if(objBoard.NextID == 0)
					NextLink.ImageUrl = "Images/img/next2.gif";
				else
				{
					if (!searchStatus)
						NextLink.NavigateUrl = "ForumView.aspx?db="+db+"&pageno=" + pageNo + "&id=" + objBoard.NextID;
					else
						NextLink.NavigateUrl = "ForumView.aspx?db="+db+"&pageno=" + pageNo + "&id=" + objBoard.NextID + "&keyfield=" + keyField + "&keyword=" + Server.UrlEncode(keyWord);
				}

				// 목록
				if (!searchStatus)
					ListLink.NavigateUrl = "ForumList.aspx?db="+db+"&pageno="+pageNo;
				else
					ListLink.NavigateUrl = "ForumList.aspx?db="+db+"&pageno="+pageNo+"&keyfield="+keyField+"&keyword="+Server.UrlEncode(keyWord);


				ReplyLink.NavigateUrl = "ForumReply.aspx?db=" + db + "&pageno=" + pageNo + "&id=" + id;

				// 자신의 게시물의 경우
				if (Context.User.Identity.Name == objBoard.Passwd)
				{
					//답변, 수정 및 삭제버튼 링크
					EditLink.NavigateUrl = "edit.aspx?db=" + db + "&pageno=" + pageNo + "&id=" + id;
				}
				else
				{
					EditLink.Visible = false;
					DeleteButton.Visible = false;
					objBoard.IncreaseVisited(id);
				}				

				if (objBoard.GetRefIDCount(db, objBoard.RefID) > 1)
				{
					BoardList.Visible = true;
					GetRefList(objBoard.RefID);
				}
			}

			CommentListBind();
		}

		private void CommentListBind()
		{
			// 코멘트 목록 바인딩
			BrdsCmtBiz objComment = new BrdsCmtBiz(db+"Comment");
			CommentList.DataSource = objComment.GetBoardList(id);
			CommentList.DataBind();
		}

		private void GetRefList(int refID)
		{
			QnaBiz objBoard = new QnaBiz(db);
			
			BoardList.DataSource = objBoard.GetRefList(refID);
			BoardList.DataBind();
		}

		protected string PageLinkURL(int boardID)
		{
			string path;
			if (id == boardID)
			{
				path = "";
			}
			else
			{
				if (!searchStatus)
					path = "ForumView.aspx?db="+db+"&id=" + boardID.ToString() + "&pageno=" + pageNo;
				else
					path = "ForumView.aspx?db="+db+"&id=" + boardID.ToString() + "&pageno=" + pageNo + "&keyfield=" + keyField + "&keyword=" + Server.UrlEncode(keyWord);
			}
			return path;
		}

		protected string ListNum(int listNum)
		{
			string listNumHtml = listNum.ToString();

			if (listNum == 0)
			{
				listNumHtml = "";
			}

			return listNumHtml;
		}

		protected string ReplyList(int reLevel)
		{
			string subjectHtml = "";

			if (reLevel != 0)
			{
				for (int i = 1; i <= reLevel; i++)
				{
					subjectHtml += "<img src='Images/img/blank.gif' border='0' width='15' height='7'>";
				}
				subjectHtml += "<img src='Images/img/re.gif' border='0' align='absmiddle'>";
			}

			return subjectHtml;
		}

		protected string GetSubject(int boardID, string subject)
		{
			if (id == boardID)
				return "<b>"+subject+"</b>";
			else
				return subject;

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
			this.DeleteButton.Click += new System.Web.UI.ImageClickEventHandler(this.DeleteButton_Click);
			this.CommentButton.Click += new System.Web.UI.ImageClickEventHandler(this.CommentButton_Click);
			this.ID = "Form";
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void DeleteButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			int result, rowsAffected;

			if(IsValid)
			{
				QnaBiz objBoard = new QnaBiz(db);
				result = objBoard.IsValidatePasswd(id, Context.User.Identity.Name);

				if(result == 1)
				{
					rowsAffected = objBoard.Delete(id);

					if(rowsAffected == 1)
					{
						Response.Redirect("ForumList.aspx?db="+db+"&pageno="+pageNo);
					}
					else
					{
						ClientAction.ShowMsgBack("삭제에 실패하였습니다.");
					}
				}
				else
				{
					ClientAction.ShowMsgBack("본인이 작성한 게시물만 삭제할 수 있습니다.");
				}
			}		
		}

		private void CommentButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			string userID, userName;
			int result;

			if (Comment.Text.Length > 0)
			{
				//if(Context.User.Identity.IsAuthenticated)
				//{
					BrdsCmtBiz objComment = new BrdsCmtBiz(db+"Comment");

					//SiteIdentity currUser = (SiteIdentity)Context.User.Identity;
					userName =  Cookie.Self["sName"];//currUser.NickName;
					userID = Cookie.Self["staff_id"];//currUser.UserID;

					result = objComment.Insert(id, userID, userName, Server.HtmlEncode(Comment.Text));

					if (result == 1)
					{
						Response.Redirect("ForumView.aspx?db="+db+"&id="+id+"&pageno="+pageNo);
					}
					else
					{
						ClientAction.ShowMsgBack("등록에 실패하였습니다.");
					}
				//}
				//else
				//{
				//	ErrorLogin("?db=" + db + "&id=" + id + "&pageno=" + pageNo);
				//}
			}

		}

		protected string GetCommentEdit(int cid, string userID)
		{
			string retVal = "";
			//if (Context.User.Identity.Name == userID)
			if (Cookie.Self["staff_id"] == userID)
			{
				retVal = "<a href='Javascript:EditComment(\"ForumCmt_edit.aspx?db="+db+"&cid="+cid+"\");'><img src='Images/img/cedit.gif' border='0' alt='코멘트 수정'></a>";
			}
			return retVal;
		}

		protected string GetCommentDelete(int cid, string userID)
		{
			string retVal = "";
			//if (Context.User.Identity.Name == userID)
			if (Cookie.Self["staff_id"] == userID)
			{
				retVal = "<a href=\"Javascript:DeleteComment('"+db+"','"+id+"','"+cid+"','"+pageNo+"');\"><img src='Images/img/cdelete.gif' border='0' alt='코멘트 삭제'></a>";
			}
			return retVal;
		}

	}
}
