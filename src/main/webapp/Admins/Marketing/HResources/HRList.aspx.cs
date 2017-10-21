using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using JinsLibrary;
using JinsLibrary.LIST;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;
using App_Code.Marketing.HRMgr;

namespace ADMIN
{
    public partial class Admins_Marketing_HResources_HRList : System.Web.UI.Page
    {
        private string _tableName = "t_BusinessCards", _whereClause;
        private string _orderBy, _subQryOrderBy;
	
        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            App_Code.CompanyMgr.Staff.StfBaseLib.Self.LoginOK();
            //JinsLibrary.ADMIN.AdminLib.Self.AccessOnlyForLocalWorking();

            //페이지타이틀설정
            litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("hrl");


            if (!Page.IsPostBack)
            {
                //볼수있는 권한인지 다시 체크.
                if (!HRBaseLib.Self.CanAccess())
                    ClientAction.ShowMsgBack("권한을 체크하세요.");

                //현재 페이지를 셋팅합니다.      -1
                Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);

                //메뉴선택리스트 바인딩
                InitializeControls();
                //조건문 셋팅 //Order By포함
                SetCondition();
                //테이터바이딩
                this.HRListBind();
            }
        }
        //URL Get문관련 셋팅초기화
        private void InitializeSetting()
        {
        }
        //라운드트립에서 상태값을 가질 수 있는 콘트롤
        private void InitializeControls()
        {
            //메뉴선택리스트 바인딩
            HRBaseLib.Self.GetAdminSelMenu(ddlSelMenu);
            if (Cookie.Self["DeptName"] == "기획/관리")
                JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlSelMenu, "삭제명함자료", "0");

            //초기 메모리 각종 설정값 복구(상태유지를 위해)
            GetQueryString();
        }
        private void SetQueryString()
        {
            //값을 지우고 다시 채워넣야~
            URLQuery.Self.Remove("mode");
            URLQuery.Self.Remove("bcID");
            URLQuery.Self["smv"] = this.ddlSelMenu.SelectedValue;
            URLQuery.Self["srch"] = this.ddlSearch.SelectedValue;
            URLQuery.Self["sval"] = this.tbSearchString.Text;
        }
        private void GetQueryString()
        {
            //명함선택메뉴
            if (Request.QueryString["smv"] != null)
                JinsLibrary.CONTROL.Util.DDLFindByValue(ref ddlSelMenu, Request.QueryString["smv"]);
            //ddlSearch선택메뉴
            if (Request.QueryString["srch"] != null)
                this.ddlSearch.SelectedValue = Request.QueryString["srch"];
            //tbSearchString 값 유지
            this.tbSearchString.Text = Request.QueryString["sval"];
        }

        public string SearchResultDisplay(string srdMsg)
        {
            if (srdMsg != "")
                srdMsg = "검색결과 : '<b>" + srdMsg + "</b>'로 검색한 결과입니다.<br>";
            srdMsg += "정렬기준 : '<b>" + ddlSearch.SelectedItem.Text + "</b>'값으로 정렬되었습니다.";
            return srdMsg;
        }
        #region 명함리스트 바인딩
        protected void HRListBind()
        {
            DBLib dbUtil = new DBLib();
            //페이지사이즈초기화
            int topCnt = Paging.Self.PageSize(20);
            string fieldNames;
            fieldNames = "bc_id,bcAGroup,bcGroup,staff_id,bcCompany,bcDept,bcClass,bcName,bcCellP,bcPhone,bcHomepage,bcEmail";

            //Response.Write("whereClause :" + whereClause + "<br>");
            //총레코드수 저장
            Paging.Self.TotRecordCount = dbUtil.GetRecordCount(this._tableName, this._whereClause);
            //상관쿼리 설정, AbsolutePage와 같은 역활을 한다. 실 쿼리실행 이전에 설정해야 한다//Paging.Self.SetPagePortion();
            //실제쿼리실행
            SqlDataReader drCard = dbUtil.Select_DR(topCnt, fieldNames, this._tableName, this._whereClause, this._orderBy, Paging.Self.SetPagePortion(), this._subQryOrderBy);
            if (drCard.HasRows)
            {
                //각종 상태값 메모리로 올림(상태유지를 위해)
                SetQueryString();
                this.dataList.DataSource = drCard;
                this.dataList.DataBind();		//바인딩하기 전에 drCard.Read();하지 말것.
                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = true;
                litPaging.Visible = true;
                ucMessage.Visible = false;
            }
            else
            {
                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = false;
                litPaging.Visible = false;
                //에러유져컨트롤 바인딩
                //ucMessage.LoadControl("../InfoMessages/InfoMessages.ascx");
                Literal lit = (Literal)ucMessage.FindControl("litMsg");
                Literal litDetails = (Literal)ucMessage.FindControl("litDetails");
                ucMessage.LitMsgText = "자료가 없습니다.";
                ucMessage.LitDetailsText = ddlSelMenu.SelectedItem.Text + "의 ";
                if (this.tbSearchString.Text != "")
                    ucMessage.LitDetailsText += "'" + this.ddlSearch.SelectedItem.Text + "'에서 '<b>"
                        + this.tbSearchString.Text + "</b>'으로 ";
                ucMessage.LitDetailsText += "검색결과입니다.";
                ucMessage.HlListVisible = false;
                ucMessage.Visible = true;
            }
            drCard.Close();
            dbUtil.SqlConnection.Close();
        }
        #endregion
        private void SetCondition()
        {
            this._whereClause = HRBaseLib.Self.GetSelMenuQuery(ddlSelMenu.SelectedValue);
            if (tbSearchString.Text != "")
            {
                string search = "";
                tbSearchString.Text = HTML.ReplaceToDB(tbSearchString.Text);
                switch (ddlSearch.SelectedItem.Value)
                {
                    case "bcName":
                    case "bcCompany":
                    case "bcDept":
                    case "bcClass":
                    case "bcHomepage":
                    case "bcEmail":
                    case "bcGroup":
                    case "bcAGroup":
                        search = " LIKE '%" + tbSearchString.Text + "%'";
                        this._whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "bcCellP":
                    case "bcPhone": // Replace([bcCellP], '-', '')
                        search = " LIKE '%" + tbSearchString.Text.Replace("-", "") + "%'";
                        this._whereClause += " AND (Replace(" + ddlSearch.SelectedItem.Value + ", '-', '' )" + search + ")";
                        break;
                    case "sName":
                        SqlDataReader dr = App_Code.CompanyMgr.Staff.StfBaseLib.Self.GetStaff_idFromName(tbSearchString.Text, false);
                        if (dr.HasRows)
                        {
                            this._whereClause += " AND (";
                            while (dr.Read())
                            {
                                //충분히 복수 나옴.
                                this._whereClause += "staff_id =" + dr["staff_id"] + " OR ";
                            }
                            this._whereClause = this._whereClause.Substring(0, this._whereClause.Length - 4);// 마지막" OR "제거
                            this._whereClause += ") ";
                        }
                        else
                            this._whereClause += " AND 1 = -1";
                        dr.Close();
                        break;
                    //case "DeptName":
                    //	search = "=" + tbSearchString.Text;
                    //	break;
                    //	case "DeptID":
                    //	string deptID = HRBaseLib.GetDeptID(tbSearchString.Text);
                    //	if(deptID != null) 
                    //	search = " = " + deptID;
                    //	else
                    //	search = " Is Null";
                    //	this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                    //	JinsLibrary.WebUtil.CurrentResponse.Write("후후후= " +this.whereClause + "<br>");
                    //	JinsLibrary.CommonLib.WebUtil.CurrentResponse.End();
                    //	break;					
                    default:
                        Response.Write("chaos:" + ddlSearch.SelectedItem.Value);
                        break;
                }
            }
            this.SetOrderBy();
            //메일로 보내기 위해 설정
            ViewState["whereClause"] = this._whereClause;
        }
        //정렬기준이다.
        private void SetOrderBy()
        {
            switch (ddlSearch.SelectedItem.Value)
            {
                case "bcName":
                    this._orderBy = "bcName ASC, bc_id ASC";
                    break;
                case "bcCompany":
                    this._orderBy = "bcCompany DESC, bc_id ASC";
                    break;
                case "bcDept":
                    this._orderBy = "bcDept ASC, bc_id ASC";
                    break;
                case "bcClass":
                    this._orderBy = "bcClass ASC, bc_id ASC";
                    break;
                case "bcCellP":
                    this._orderBy = "bcCellP ASC, bc_id ASC";
                    break;
                case "bcPhone":
                    this._orderBy = "bcPhone ASC, bc_id ASC";
                    break;
                case "bcHomepage":
                    this._orderBy = "bcHomepage ASC, bc_id ASC";
                    break;
                case "bcEmail":
                    this._orderBy = "bcEmail ASC, bc_id ASC";
                    break;
                case "bcGroup":
                    this._orderBy = "bcGroup ASC, bc_id ASC";
                    break;
                case "bcAGroup":
                    this._orderBy = "bcAGroup ASC, bc_id ASC";
                    break;
                case "sName":
                    this._orderBy = "staff_id ASC, bc_id ASC";
                    break;
                default:
                    goto case "bcName";
            }
            _subQryOrderBy = _orderBy.Replace("ASC", "\n").Replace("DESC", "ASC").Replace("\n", "DESC"); //orderBy와 반대	 
        }

        private void CommonEvent()
        {
            Page.Validate();
            if (!Page.IsValid)
                ClientAction.ShowMsgBack("정확히 입력하세요.");

            //페이지 번호는 제거해야 에러가 안남.
            Paging.Self.SetCurrentPage(1);
            SetCondition();
            HRListBind();
        }
        protected void ddlSelMenu_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            URLQuery.Self.Remove("cp");
            URLQuery.Self["cp"] = "1";
            //메뉴상태 스태틱저장
            //SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);
            //이벤트실행되면 혼나
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
            this.ddlSearch.SelectedIndexChanged -= new System.EventHandler(this.ddlSearch_SelectedIndexChanged);
            this.CommonEvent();
        }
        protected void tbSearchString_TextChanged(object sender, System.EventArgs e)
        {
            this.ddlSearch.SelectedIndexChanged -= new System.EventHandler(this.ddlSearch_SelectedIndexChanged);
            this.CommonEvent();
        }
        protected void ddlSearch_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
            this.CommonEvent();
        }
 
        protected void ibSendMail_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Write("where = " + tableName + ";" + ViewState["whereClause"] );
            Session.Add("whereClause", ViewState["whereClause"]);
            Response.Redirect("../../Mine/Mail/MailForm.aspx?t=bc");
        }


        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)        
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //DataRow row = ((DataRowView)e.Item.DataItem).Row;    //<-- DataSet에서만 가능
                System.Data.Common.DbDataRecord dRecord = (System.Data.Common.DbDataRecord)e.Item.DataItem;

                //관리구분그룹(직원유져그룹) ==> ToolTip='<%# DataBinder.Eval(Container.DataItem, "bcGroup") %>'
                Label lbGroup = (Label)e.Item.FindControl("lbGroup");
                lbGroup.Text = dRecord.GetValue(dRecord.GetOrdinal("bcAGroup")).ToString();
                lbGroup.ToolTip = dRecord.GetString(dRecord.GetOrdinal("bcGroup"));

                //직원담당자
                Label lbSManager = (Label)e.Item.FindControl("lbSManager");
                System.Int16 staff_id = dRecord.GetInt16(3);
                lbSManager.Text = App_Code.CompanyMgr.Staff.StfBaseLib.Self.GetStfName(staff_id);
                lbSManager.ToolTip = App_Code.CompanyMgr.Staff.StfBaseLib.Self.GetTotalStaffInfo(staff_id.ToString());

                //홈페이지이동링크
                HyperLink hlComp_url = (HyperLink)e.Item.FindControl("hlComp_url");
                hlComp_url.ToolTip = dRecord.GetValue(dRecord.GetOrdinal("bcHomepage")).ToString();
                hlComp_url.Text = dRecord.GetValue(dRecord.GetOrdinal("bcCompany")).ToString();
                hlComp_url.Target = "_blank";
                if(!string.IsNullOrEmpty(hlComp_url.ToolTip))
                    hlComp_url.NavigateUrl = "http://" + hlComp_url.ToolTip;
                
                //파트너 담당자
                Label lbManager = (Label)e.Item.FindControl("lbManager");
                lbManager.Text = string.Concat(dRecord.GetValue(dRecord.GetOrdinal("bcName")).ToString(), "/", dRecord.GetValue(dRecord.GetOrdinal("bcClass")).ToString());
                lbManager.ToolTip = dRecord.GetString(dRecord.GetOrdinal("bcEmail"));


                //메일발송버튼
                ImageButton ibSendOneMail = (ImageButton)e.Item.FindControl("ibSendOneMail");
                ibSendOneMail.CommandName = "select";
                ibSendOneMail.CommandArgument = dRecord.GetValue(dRecord.GetOrdinal("bcName")).ToString();
                ibSendOneMail.ToolTip = lbManager.ToolTip;
                ibSendOneMail.CausesValidation = false;

                //보기버튼링크
                URLQuery.Self["bcID"] = dRecord.GetValue(0).ToString();
                HyperLink hlView = (HyperLink)e.Item.FindControl("hlView");
                hlView.NavigateUrl = "HRView.aspx?" + URLQuery.Self.GetQueryString();
            }
            else if (e.Item.ItemType == ListItemType.Header)
            {
                Literal litSearchResult = (Literal)e.Item.FindControl("litSearchResult");
                Literal litListBrief = (Literal)e.Item.FindControl("litListBrief");

                litSearchResult.Text = this.SearchResultDisplay(this.tbSearchString.Text);
                litListBrief.Text = Paging.Self.ListSummary;
                #region 페이징기능구현
                Paging.Self.Init_Violet();
                this.litPaging.Text = Paging.Self.GeneratePaging();
                #endregion
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                //페이징기능이 여기에 구현되어야 하나 인터페이스에 없으므로 헤더에서 구현
                //Literal litPaging = (Literal)e.Item.FindControl("litPaging");
            }

        }
        protected void dataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                //dlFiles.EditItemIndex = -1;  
                //dlFiles.SelectedIndex = e.Item.ItemIndex;
                //BindDataList();
                ImageButton lb = (ImageButton)e.Item.FindControl("ibSendOneMail");
                string strSendonemail = Text.GetEmailFormat(e.CommandArgument.ToString(), lb.ToolTip);
                Response.Redirect("/Admins/Mine/Mail/MailForm.aspx?o=" + strSendonemail);
            }
        }
    }
}