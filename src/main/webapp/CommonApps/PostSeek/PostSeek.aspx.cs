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

namespace KistelSite.CommonApps.PostSeek
{
	/// <summary>
	/// PostSeek에 대한 요약 설명입니다.
	/// </summary>
	public class PostSeek : System.Web.UI.Page
	{
		protected static string totalAddr;
		protected System.Web.UI.WebControls.TextBox addrSeek;
		protected System.Web.UI.WebControls.Label postDisplay;
		protected System.Web.UI.WebControls.Panel pnAddrList;
		protected System.Web.UI.WebControls.DataList dlPost;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.ValidationSummary ValidationSummary1;
		protected System.Web.UI.WebControls.ImageButton btnSearch;
		protected System.Web.UI.WebControls.Panel pnNone;
		protected System.Web.UI.WebControls.Label ZIPCODE;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			//로그인되었는지 확인(이럴필요 없징!!)
			//KistelSite.Admins.CompanyMgr.Staffs.LoginProcess.LoginOK();
			if(!Page.IsPostBack) 
			{
				//팝업스크린사이즈변경
				ClientAction.WindowResizeTo(500,600);			
				//페이지타이틀설정
				JinsLibrary.ClientAction.AddBrowserTitleBar("우편번호찾기");			
				//포커스이동
				ClientAction.FocusOn(Page, "frmAddr.addrSeek");
			}
		}
		
		#region 주소리스트 바인딩
		protected void AddressListBind()
		{
			DBLib dbUtil = new DBLib();			
			string fieldNames,whereClause,orderBy;
			fieldNames = "ZIPCODE,(IsNull(SIDO,'')+' '+IsNull(SIGUNGU,'')+' '+IsNull(DONG,'')+' '+IsNull(RI,'')+' '+IsNull(DOSEO,'')+' '+IsNull(BUNJI,'')+' '+IsNull(AMOUNT,'')) AS totAddrValue";
			whereClause = "DONG Like '" + addrSeek.Text.Trim() + "%'";
			orderBy = "ZIPCODE";
		
			SqlDataReader drPost = dbUtil.Select_DR(fieldNames, "t_post", whereClause, orderBy);
			if(drPost.HasRows) 
			{
				this.dlPost.DataSource = drPost;
				this.dlPost.DataBind();		//바인딩하기 전에 drPost.Read();하지 말것.
				dlPost.Visible = true;
				pnAddrList.Visible = true;
				pnNone.Visible = false;
			}
			else 
			{
				dlPost.Visible = false;
				pnAddrList.Visible = false;
				pnNone.Visible = true;
			}
			//HttpContext.Current.Response.Write("DBConnection=" + dbUtil.SqlConnection.);
			drPost.Close();
			dbUtil.SqlConnection.Close();
		}
		#endregion

		private void addrSeek_TextChanged(object sender, System.EventArgs e)
		{
			Page.Validate();
			if(Page.IsValid)
				this.AddressListBind();
		}
		//ZIPCODE 포멧하기
		public static string ZipcodeFormat(object zipcode)
		{				
			return "[" + zipcode.ToString().Substring(0,3) + "-" + zipcode.ToString().Substring(3,3) + "]";
		}

		private void dlPost_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				//((Literal)e.Item.FindControl("litIDX")).Text = e.Item.ItemIndex.ToString();
				//Onclick="ReturnValues('<%# DataBinder.Eval(Container.DataItem, "ZIPCODE") %>', '<%#	DataBinder.Eval(Container.DataItem, "totAddrValue").ToString().Replace("  "," ") %>')"  runat="server" id="trReturnValues"
				//리턴주소값
				HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("trReturnValues");
				tr.Attributes["OnClick"] = "ReturnValues('" + ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetString(0) + "', '";
				tr.Attributes["OnClick"] +=  ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetString(1).Replace("  "," ") + "');";
			}
			else if(e.Item.ItemType == ListItemType.Header)
			{

			}
			else if(e.Item.ItemType == ListItemType.Footer) 
			{
				//페이징기능이 여기에 구현되어야 하나 인터페이스에 없으므로 헤더에서 구현
				//Literal litPaging = (Literal)e.Item.FindControl("litPaging");
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
			this.addrSeek.TextChanged += new System.EventHandler(this.addrSeek_TextChanged);
			this.dlPost.ItemDataBound += new System.Web.UI.WebControls.DataListItemEventHandler(this.dlPost_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
