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
using KistelSite.Admins.CompanyMgr.Staffs;

namespace KistelSite.CommonApps.Board
{
	/// <summary>
	/// bList에 대한 요약 설명입니다.
	/// </summary>
	public class bList : BoardBaseLib
	{
		string tableName = "t_DocumentAssets", whereClause;
		public static int SelMenuValue = 34;

		protected System.Web.UI.WebControls.HyperLink hlInsert;
		protected System.Web.UI.WebControls.HyperLink hlAllList;
		protected System.Web.UI.WebControls.Label lbPaging;
		protected System.Web.UI.WebControls.Label lbInfoList;
		protected System.Web.UI.WebControls.DataGrid dataGrid;
		protected System.Web.UI.WebControls.Label lbListBrief;
		protected System.Web.UI.WebControls.Label lbSearchResult;
		protected System.Web.UI.WebControls.DropDownList ddlSelMenu;
		protected System.Web.UI.WebControls.Button btnSearch;
		protected System.Web.UI.WebControls.TextBox tbSearchString;
		protected System.Web.UI.WebControls.DropDownList ddlSearch;
		protected System.Web.UI.HtmlControls.HtmlForm frmNotice;

	
		public void SearchResultDisplay()
		{
			if(tbSearchString.Text != "")
			{
				lbSearchResult.Text="검색결과 : <b>" + ddlSearch.SelectedItem.Text + "</b>에서 <b>";
				lbSearchResult.Text += tbSearchString.Text + "</b>로 검색한 결과입니다";
				lbSearchResult.Visible = true;
			}
			else
				lbSearchResult.Visible = false;			
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			//ClientAction.GoUrl(4, "BoardInfo_inc.asp");

			//로그인되었는지 확인
			//KistelSite.Admins.CompanyMgr.Staffs.LoginProcess.LoginOK();
			//페이지타이틀설정
			JinsLibrary.ClientAction.AddBrowserTitleBar("게시판리스트");

			//Response.End();
			#region 각전역변수 테스트			
			//	if(AppVariable.Self["application"] != null)
			//		ClientAction.ShowInfoMsg(AppVariable.Self["application"].ToString());
			//	if(Session["session"] != null)
			//		ClientAction.ShowInfoMsg(Session["session"].ToString());			
			//	if(DataCache.Self["dataCache"] != null)
			//		ClientAction.ShowInfoMsg(JinsLibrary.STATEMANAGE.DataCache.Self["dataCache"].ToString());
			//	ClientAction.ShowInfoMsg(JinsLibrary.CONFIG.TableConfig.nameNJ);
			#endregion
			//삭제버튼을 클릭한 경우"d" //게시물 영구영구삭제"dd"
			if(Request.QueryString["mode"] != null)
			{
				BoardBaseLib.DeleteDoc(Request.QueryString["mode"], WebUtil.CurrentRequest["daID"]);
				HttpContext.Current.Response.Redirect( Request.Url.AbsolutePath.ToString() +"?"+ URLQuery.Self.GetQueryString());
			}
			if(!Page.IsPostBack) 
			{
				//현재 페이지를 셋팅합니다.      -1
				Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);
				//메뉴선택리스트 바인딩
				SelMenuBind();
				//문서선택메뉴
				if(Request.QueryString["smv"] != null)
					this.ddlSelMenu.SelectedValue = Request.QueryString["smv"];
				SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);
				//조건문 셋팅
				SetWhereClause();
				//테이터바이딩
				this.DocListBind();
				//문서입력 링크바인딩
				InsertButtonLink();
			}
		}

		//메뉴선택리스트 바인딩
		protected void SelMenuBind()
		{
			if(Cookie.Self["DeptName"] == "기획/관리")
				JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlSelMenu, "파기요청문서", "0");
		}	

		#region 문서리스트 바인딩
		protected void DocListBind()
		{
			DBLib dbUtil = new DBLib();
			//페이지사이즈초기화
			int topCnt;
			topCnt = Paging.Self.PageSize(20);
			
			string fieldNames,whereClause,orderBy;
			fieldNames = "da_id,daCategory,daType,daName,daStatus,staff_id,ISNULL(daModifyDT, daRegisterDT) as docDay, DNSecurity, SLSecurity";
			whereClause = this.whereClause;
			orderBy = "daType ASC, docDay DESC";
			string subQryOrderBy = "daType DESC, docDay ASC";	//orderBy와 반대	
			
			//총레코드수 저장
			Paging.Self.TotRecordCount = dbUtil.GetRecordCount(this.tableName,whereClause);			
			//상관쿼리 설정, AbsolutePage와 같은 역활을 한다. 실 쿼리실행 이전에 설정해야 한다//Paging.Self.SetPagePortion();
			//실제쿼리실행
			SqlDataReader drList = dbUtil.Select_DR(topCnt,fieldNames,this.tableName,whereClause,orderBy,Paging.Self.SetPagePortion(), subQryOrderBy);

			if(drList.HasRows) 
			{
				//this.dataList.DataSource = drList;
				//this.dataList.DataBind();		//바인딩하기 전에 drList.Read();하지 말것.
				
				this.dataGrid.DataSource = drList;
				this.dataGrid.DataKeyField = "da_id";
				this.dataGrid.DataBind();		//바인딩하기 전에 drList.Read();하지 말것.

				#region 페이징기능구현
				//값을 지우고 다시 채워넣야~
				URLQuery.Self.SetQueryString();
				//Paging.Self.Init_Green();
				this.lbPaging.Text = Paging.Self.GeneratePaging();
				this.lbListBrief.Text = Paging.Self.ListSummary;
				#endregion		
				//사라질것 사라지고 있어질것 있어져랑
				lbInfoList.Visible = false;
				lbListBrief.Visible = true;
				dataGrid.Visible = true;
				lbPaging.Visible = true;
			}
			else 
			{
				//사라질것 사라지고 있어질것 있어져랑
				lbInfoList.Visible = true;
				lbListBrief.Visible = false;
				dataGrid.Visible = false;
				lbPaging.Visible = false;
			}
			//HttpContext.Current.Response.Write("DBConnection=" + dbUtil.SqlConnection.);
			drList.Close();
			dbUtil.SqlConnection.Close();
		}
		#endregion

		private void SetWhereClause()
		{
			this.whereClause = BoardBaseLib.GetSelMenuQuery(ddlSelMenu.SelectedValue);
			if(tbSearchString.Text != "")
			{
				//현재 페이지를 셋팅합니다.      ; 1
				Paging.Self.SetCurrentPage(1);

				string search = "";
				tbSearchString.Text = HTML.ReplaceToDB(tbSearchString.Text);

				switch(ddlSearch.SelectedItem.Value)
				{         
					case "daCategory":
					case "daType":
						search = " LIKE '" + tbSearchString.Text +  "%'";
						this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
						break;
					case "daName":
					case "DeptName":
					case "daDescription":
						search = " LIKE '%" + tbSearchString.Text +  "%'";
						this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
						break;
					case "da_id":
					case "staff_id":
						if(ddlSearch.SelectedItem.Value == "da_id")
							search = "=" + tbSearchString.Text;
						else
							search = "=" + StfBaseLib.GetStaff_id(tbSearchString.Text);
						
						this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
						break;
						//case "DeptName":
						//	search = "=" + tbSearchString.Text;
						//	break;
						//	case "DeptID":
						//	string deptID = BoardBaseLib.GetDeptID(tbSearchString.Text);
						//	if(deptID != null) 
						//	search = " = " + deptID;
						//	else
						//	search = " Is Null";
						//	this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
						//	JinsLibrary.WebUtil.CurrentResponse.Write("후후후= " +this.whereClause + "<br>");
						//	JinsLibrary.CommonLib.WebUtil.CurrentResponse.End();
						//	break;					
					default:            
						goto case "daCategory";
				}
			}
			SearchResultDisplay();
		}		
				

		private void ddlSelMenu_SelectedIndexChanged(object sender, System.EventArgs e)
		{		
			//페이지 번호는 제거해야 에러가 안남.
			URLQuery.Self.Remove("cp");
			URLQuery.Self["cp"] = "1";
			Paging.Self.SetCurrentPage(1);

			//메뉴상태 스태틱저장
			SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);

			SetWhereClause();
			DocListBind();
			//나머지 이벤트실행되면 혼나
			this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
			this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
		}
		private void btnSearch_Click(object sender, System.EventArgs e)
		{
			SetWhereClause();
			DocListBind();
			this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
		}
		private void tbSearchString_TextChanged(object sender, System.EventArgs e)
		{
			SetWhereClause();
			DocListBind();
			this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
		}
		private void InsertButtonLink() 
		{
			URLQuery.Self["mode"] = "i";
			this.hlInsert.NavigateUrl = "DocForm.aspx?" + URLQuery.Self.GetQueryString();
		}
		private void dataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string tempDAName = e.Item.Cells[3].Text;
				e.Item.Cells[3].ToolTip = tempDAName;
				e.Item.Cells[3].Text = Text.ShortenUniString(tempDAName, 38);
				//				ImageButton ibKeepMail = (ImageButton)e.Item.FindControl("ibKeepMail"); // Text??
				//				if(MailBaseLib.SelMenuValue == 2)
				//					ibKeepMail.Attributes["onClick"] = "return SubmitJ('메일을 보관하시렵니까?', 'this.form', null);";
				//				else
				//					ibKeepMail.Visible = false;
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
