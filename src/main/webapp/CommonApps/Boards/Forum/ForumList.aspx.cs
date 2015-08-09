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
using MiddleTier.Boards.Business;
using MiddleTier.Boards.Comment;

using JinsLibrary;


namespace KistelSite.CommonApps.Boards.Forum
{
	/// <summary>
	/// list에 대한 요약 설명입니다.
	/// </summary>
	public class ForumList : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label SearchLabel;
		protected System.Web.UI.WebControls.Label PageCountLabel;
		protected System.Web.UI.WebControls.DataList BoardList;
		protected System.Web.UI.WebControls.Label PageListLabel;
		protected System.Web.UI.WebControls.DropDownList KeyFieldList;
		protected System.Web.UI.WebControls.TextBox KeyWordTextBox;
		protected System.Web.UI.WebControls.ImageButton SearchButton;
		protected System.Web.UI.WebControls.HyperLink HomeLink;
		protected System.Web.UI.WebControls.HyperLink BackLink;
		protected System.Web.UI.WebControls.HyperLink NextLink;
	
		protected string db;
		protected int pageNo, pageSize;
		protected int recordCount, totalPageNumber;
		protected string keyField, keyWord;
		protected bool searchStatus = false;

		private void Page_Load(object sender, System.EventArgs e)
		{
			// 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
			if (Request.QueryString["db"] == null)
			{
				ClientAction.ShowMsgBack("테이블명이 지정되지 않았습니다.");
			}
			else
				db = Request.QueryString["db"];
			
			if (Request.QueryString["pageno"] == null)
				pageNo = 1;
			else
				pageNo = int.Parse(Request.QueryString["pageno"]);

			// 검색관련 데이터 수집
			if (Request.QueryString["keyword"] == null)
			{
				if (KeyWordTextBox.Text != "")
				{
					keyField = KeyFieldList.SelectedItem.Value;
					keyWord = KeyWordTextBox.Text;
					searchStatus = true;
					SearchOutput();
				}
			}
			else
			{
				keyField = Request.QueryString["keyfield"];
				keyWord = Request.QueryString["keyword"];
				searchStatus = true;
				SearchOutput();
			}

			// 검색 조건에 따른 리스트 구현
			if (!searchStatus)
			{
				GetBoardList();
			}
			else
			{
				if (Page.IsPostBack)
				{
					pageNo = 1;
				}

				GetSearchBoardList();
			}

			// 홈 버튼 속성 변경
			if (pageNo == 1 && searchStatus == false)
			{
				HomeLink.ImageUrl = "Images/img/home2.gif";
				HomeLink.NavigateUrl = "";
			}
			else
			{
				HomeLink.NavigateUrl = "ForumList.aspx?db="+db;
			}
		}

		private void GetBoardList()
		{
			QnaBiz objBoard = new QnaBiz(db);
			
			recordCount = objBoard.GetBoardRecordCount();			
			//recordCount.CompareTo("ccc");

			totalPageNumber = objBoard.GetTotalPageNumber(recordCount);

			PageCountLabel.Text = "Total : " + recordCount.ToString() + ", [" + pageNo.ToString() + "/" + totalPageNumber.ToString() + "] Page";

			BoardList.DataSource = objBoard.GetBoardList(pageNo);
			BoardList.DataMember = "Board";
			
			BoardList.DataBind();
			
			//Response.Write("--> " + pageNo.ToString() + "<br>");
			//Response.End();
			


			GetPageList(pageNo, recordCount, totalPageNumber);
		}

		private void GetSearchBoardList()
		{
			QnaBiz objBoard = new QnaBiz(db);
			
			recordCount = objBoard.GetBoardRecordCount(keyField, keyWord);
			totalPageNumber = objBoard.GetTotalPageNumber(recordCount);
			
			PageCountLabel.Text = "Total : " + recordCount.ToString() + ", [" + pageNo.ToString() + "/" + totalPageNumber.ToString() + "] Page";

			BoardList.DataSource = objBoard.GetBoardList(pageNo, keyField, keyWord);
			BoardList.DataMember = "BoardSearch";
			BoardList.DataBind();
			
			GetPageList(pageNo, recordCount, totalPageNumber);
		}

		private void GetPageList(int PageNo, int RecordCount, int TotalPageCount)
		{
			int PageToLength = 20;
			int FromPage, ToPage;
			string Path;

			FromPage = (int)(PageNo-1)/PageToLength*PageToLength+1;

			if ((FromPage+PageToLength-1)<TotalPageCount)
				ToPage = FromPage+PageToLength-1;
			else
				ToPage = TotalPageCount;


			// 이전 10개 표시
			if ((int)((PageNo-1)/PageToLength)>0)
			{
				if (searchStatus == false)
					Path = "<a href='ForumList.aspx?db="+db+"&pageno=" + (FromPage-1).ToString() + "'><img src=Images/img/pback1.gif border=0 align=absmiddle></a> ";
				else
					Path = "<a href='ForumList.aspx?db="+db+"&pageno=" + (FromPage-1).ToString() + "&keyfield="+keyField+"&keyword="+Server.UrlEncode(keyWord)+"'><img src=Images/img/pback1.gif border=0 align=absmiddle></a> ";
			}
			else
			{
				Path = "<img src=Images/img/pback2.gif border=0 align=absmiddle> ";
			}

			// 페이지 바로가기
			for (int i = FromPage; i <= ToPage; i++)
			{
				if (i == PageNo)
					Path += "<b>" + i.ToString() + "</b> ";
				else
					if (searchStatus == false)
					Path += "<a href='ForumList.aspx?db="+db+"&pageno=" + i.ToString() + "'>" + i.ToString() + "</a> ";
				else
					Path += "<a href='ForumList.aspx?db="+db+"&pageno=" + i.ToString() + "&keyfield="+keyField+"&keyword="+Server.UrlEncode(keyWord)+"'>" + i.ToString() + "</a> ";
			}

			// 다음 10개 표시
			if (ToPage < TotalPageCount)
				if (searchStatus == false)
					Path += "<a href='ForumList.aspx?db="+db+"&pageno=" + (ToPage+1).ToString() + "'><img src=Images/img/pnext1.gif border=0 align=absmiddle></a>";
				else
					Path += "<a href='ForumList.aspx?db="+db+"&pageno=" + (ToPage+1).ToString() + "&keyfield="+keyField+"&keyword="+Server.UrlEncode(keyWord)+"'><img src=Images/img/pnext1.gif border=0 align=absmiddle></a>";
			else
				Path += "<img src=Images/img/pnext2.gif border=0 align=absmiddle>";

			PageListLabel.Text = Path;

			if (PageNo > 1)
			{
				if (!searchStatus)
					BackLink.NavigateUrl="ForumList.aspx?db="+db+"&pageno=" + (PageNo-1).ToString();
				else
					BackLink.NavigateUrl="ForumList.aspx?db="+db+"&pageno=" + (PageNo-1).ToString() + "&keyfield="+keyField+"&keyword="+Server.UrlEncode(keyWord);
			}
			else
			{
				BackLink.ImageUrl = "Images/img/back2.gif";
			}

			if (PageNo < TotalPageCount)
			{
				if (!searchStatus)
					NextLink.NavigateUrl="ForumList.aspx?db="+db+"&pageno=" + (PageNo+1).ToString();
				else
					NextLink.NavigateUrl="ForumList.aspx?db="+db+"&pageno=" + (PageNo+1).ToString() + "&keyfield="+keyField+"&keyword="+Server.UrlEncode(keyWord);
			}
			else
			{
				NextLink.ImageUrl = "Images/img/next2.gif";
			}
		}

		protected string PageLinkURL(int boardID)
		{
			string path;
			if (!searchStatus)
				path = "ForumView.aspx?db="+db+"&id=" + boardID.ToString() + "&pageno=" + pageNo;
			else
				path = "ForumView.aspx?db="+db+"&id=" + boardID.ToString() + "&pageno=" + pageNo + "&keyfield=" + keyField + "&keyword=" + Server.UrlEncode(keyWord);

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

		protected string GetSubject(string subject)
		{
			string retVal;

			retVal = subject;

			if (subject.Length > 30)
			{
				retVal = subject.Substring(0, 30) + "..";
			}

			if (keyField == "subject")
			{
				retVal = subject.Replace(keyWord, "<b><font color=red>" + keyWord + "</font></b>");
			}

			return retVal;
		}

		private void SearchOutput()
		{
			SearchLabel.Text = "[검색어 :" + keyWord + "]";
			KeyFieldList.Visible = false;
			KeyWordTextBox.Visible = false;
			SearchButton.Visible = false;
		}

		protected string GetNewItem(DateTime regDate)
		{
			string retVal = "";
			
			// New 게시물 표시 : ((작성시간+1일)-현재시간 > 0)
			if (DateTime.Compare(regDate.AddHours(24), DateTime.Now) > 0)
				retVal = "<img src='Images/img/new.gif' align=absmiddle border=0>";

			return retVal;

		}

		protected string GetCommentCount(int id)
		{
			int commentCount;
			string retVal;


			BrdsCmtBiz objComment = new BrdsCmtBiz(db+"Comment");

			commentCount = objComment.GetBoardRecordCount(id);        // <---------- 문제

			
			if (commentCount == 0)
				retVal = "";
			else
				retVal = "("+commentCount.ToString()+")";

			return retVal;
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
