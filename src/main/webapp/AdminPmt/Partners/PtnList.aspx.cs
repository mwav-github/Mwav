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
using App_Code.Partners.Staff; //복수형 아님
using App_Code.CompanyMgr.Staff;


namespace PARTNER
{
    public partial class Adminp_Partners_PtnList : System.Web.UI.Page
    {
        private string tableName = "t_Staff", whereClause;
        private string orderBy, subQryOrderBy, whichSRD;

        //public static int SelMenuValue = 3;
        //protected System.Web.UI.WebControls.Panel pnModifyDelete;



        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            App_Code.Partners.Staff.PtnBaseLib.Self.LoginOK();

            //페이지타이틀설정
            litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("_ptl");

            if (!Page.IsPostBack)
            {
                //현재 페이지를 셋팅합니다.      -1
                Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);
                //셋팅초기화
                InitializeSetting();
                //조건문 셋팅 //Order By포함
                SetCondition();
                //테이터바이딩
                this.StaffListBind();
            }
        }

        public string SearchResultDisplay(string srdMsg)
        {
            if (srdMsg != "")
                srdMsg = "검색결과 : '<b>" + srdMsg + "</b>'로 검색한 결과입니다.<br>";
            srdMsg += "정렬기준 : '<b>" + ddlSearch.SelectedItem.Text + "</b>'값으로 정렬되었습니다.";
            return srdMsg;
        }

        private void InitializeSetting()
        {
            //메뉴바인팅
            SelMenuBind();
            //명함입력 링크바인딩
            URLQuery.Self["mode"] = "i";
            this.hlInsert.NavigateUrl = "PtnForm.aspx?" + URLQuery.Self.GetQueryString();
            //값을 지우고 다시 채워넣야~
            URLQuery.Self.Remove("mode");
            URLQuery.Self.Remove("sfID");
            //초기 메모리 각종 설정값 복구(상태유지를 위해)
            GetQueryString();
            //print area
            this.hlPrint.NavigateUrl = "javascript:GetPrint('print_area');";
        }
        private void SetQueryString()
        {
            URLQuery.Self["cp"] = Paging.Self.CP;
            URLQuery.Self["smv"] = this.ddlSelMenu.SelectedValue;
            URLQuery.Self["srch"] = this.ddlSearch.SelectedValue;
            URLQuery.Self["sval"] = this.tbSearchString.Text;
        }
        private void GetQueryString()
        {
            //whichSRD
            if (Request.QueryString["srd"] != null)
                this.whichSRD = Request.QueryString["srd"];
            //명함선택메뉴
            if (Request.QueryString["smv"] != null)
                this.ddlSelMenu.SelectedValue = Request.QueryString["smv"];
            //ddlSearch선택메뉴
            if (Request.QueryString["srch"] != null)
                this.ddlSearch.SelectedValue = Request.QueryString["srch"];
            //tbSearchString 값 유지
            this.tbSearchString.Text = Request.QueryString["sval"];
        }

        //메뉴선택리스트 바인딩
        protected void SelMenuBind()
        {
            if (Session["DeptName"].ToString() == "관리")
            {
                JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlSelMenu, "퇴사직원", "0");
            }
        }

        #region 직원리스트 바인딩
        protected void StaffListBind()
        {
            DBLib dbUtil = new DBLib();
            //페이지사이즈초기화
            int topCnt;
            topCnt = Paging.Self.PageSize(20);
            string fieldNames, whereClause;
            fieldNames = "staff_id,sLoginID,staffNbr,sName,DeptName,sClass,phone,cellularP,sEmail,sBusinessPic,sLevel";
            whereClause = this.whereClause;

            //Response.Write("whereClause :" + whereClause + "<br>");
            //총레코드수 저장
            Paging.Self.TotRecordCount = dbUtil.GetRecordCount(this.tableName, whereClause);

            //상관쿼리 설정, AbsolutePage와 같은 역활을 한다. 실 쿼리실행 이전에 설정해야 한다//Paging.Self.SetPagePortion();
            //실제쿼리실행
            SqlDataReader drStaff = dbUtil.Select_DR(topCnt, fieldNames, this.tableName, whereClause, this.orderBy, Paging.Self.SetPagePortion(), this.subQryOrderBy);

            if (drStaff.HasRows)
            {
                this.dataList.DataSource = drStaff;
                this.dataList.DataBind();		//바인딩하기 전에 drStaff.Read();하지 말것.

                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = true;
                litPaging.Visible = true;
                ucMessage.Visible = false;
                ibSendMail.Visible = true;
                hlPrint.Visible = true;
            }
            else
            {
                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = false;
                litPaging.Visible = false;
                ibSendMail.Visible = false;
                hlPrint.Visible = false;
                //에러유져컨트롤 바인딩
                Literal lit = (Literal)ucMessage.FindControl("litMsg");
                Literal litDetails = (Literal)ucMessage.FindControl("litDetails");
                lit.Text = "자료가 없습니다.";
                if (Page.IsPostBack)
                {
                    litDetails.Text = ddlSelMenu.SelectedItem.Text + "의 ";
                    if (this.tbSearchString.Text != "")
                        litDetails.Text += "'" + this.ddlSearch.SelectedItem.Text + "'에서 '<b>"
                            + this.tbSearchString.Text + "</b>'으로 ";
                    litDetails.Text += "검색결과입니다.";
                }
                ucMessage.Visible = true;
            }
            drStaff.Close();
            dbUtil.SqlConnection.Close();
        }
        #endregion
        private void SetCondition()
        {
            this.whereClause = "(retireDT Is Null OR retireDT = '') AND position=" + Cookie.Self["position"]; // StfBaseLib.Self.GetSelMenuQuery(ddlSelMenu.SelectedValue);
            if (tbSearchString.Text != "")
            {
                string search = "";
                tbSearchString.Text = HTML.ReplaceToDB(tbSearchString.Text);
                switch (ddlSearch.SelectedItem.Value)
                {
                    case "sName":
                    case "sClass":
                        search = " LIKE '" + tbSearchString.Text + "%'";
                        this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "sLoginID":
                    case "staffNbr":
                        search = "='" + tbSearchString.Text + "'";
                        this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "DeptName":
                        search = " LIKE '%" + tbSearchString.Text + "%'";
                        this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    //case "DeptName":
                    //	search = "=" + tbSearchString.Text;
                    //	break;
                    //	case "DeptID":
                    //	string deptID = StfBaseLib.GetDeptID(tbSearchString.Text);
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
                this.whichSRD = "w";
            }
            else
            {
                this.whichSRD = "o";
            }
            this.SetOrderBy();
            //SearchResultDisplay();
            //메일로 보내기 위해 설정
            ViewState["whereClause"] = this.whereClause;
        }
        //정렬기준이다.
        private void SetOrderBy()
        {
            switch (ddlSearch.SelectedItem.Value)
            {
                case "sName":
                    this.orderBy = "sName ASC, staff_id ASC";
                    this.subQryOrderBy = "sName DESC, staff_id DESC";		//orderBy와 반대
                    break;
                case "sClass":
                    this.orderBy = "sLevel DESC, staff_id ASC";
                    this.subQryOrderBy = "sLevel ASC, staff_id DESC";		//orderBy와 반대
                    break;
                case "sLoginID":
                    this.orderBy = "sLoginID ASC, staff_id ASC";
                    this.subQryOrderBy = "sLoginID DESC, staff_id DESC";		//orderBy와 반대
                    break;
                case "staffNbr":
                    this.orderBy = "staffNbr ASC, staff_id ASC";
                    this.subQryOrderBy = "staffNbr DESC, staff_id DESC";		//orderBy와 반대
                    break;
                case "DeptName":
                    this.orderBy = "DeptName ASC, staff_id ASC";
                    this.subQryOrderBy = "DeptName DESC, staff_id DESC";		//orderBy와 반대
                    break;
                default:
                    goto case "sName";
            }
        }

        protected void ddlSelMenu_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            URLQuery.Self.Remove("cp");
            URLQuery.Self["cp"] = "1";
            Paging.Self.SetCurrentPage(1);

            //메뉴상태 스태틱저장
            //SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);

            SetCondition();
            StaffListBind();
            //나머지 이벤트실행되면 혼나
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
            this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        }
        protected void tbSearchString_TextChanged(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            Paging.Self.SetCurrentPage(1);

            SetCondition();
            StaffListBind();
            this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        }
        protected void btnSearch_Click(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            Paging.Self.SetCurrentPage(1);

            SetCondition();
            StaffListBind();
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
        }

        protected string ZoomWindowOpen(object sBusinessPic)
        {
            if (sBusinessPic.ToString() != "")
                return "javascript:ZoomWindowOpen(\"" + SystemConfig.GetValue("StaffUploadDir") + sBusinessPic + "\",\"직원사진\",\"\");";
            else
                return "javascript:";
        }
        private void ibSendMail_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            //Response.Write("where = " + tableName + ";" + ViewState["whereClause"] );
            Session.Add("whereClause", ViewState["whereClause"]);
            Response.Redirect("../../Mine/Mail/MailForm.aspx?t=stf");
        }

        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //((Literal)e.Item.FindControl("litIDX")).Text = e.Item.ItemIndex.ToString();
                //메일링크
                HyperLink hlEmail = (HyperLink)e.Item.FindControl("hlEmail");
                string strSendonemail = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(3) + " <" + hlEmail.Text + ">;";
                hlEmail.NavigateUrl = "../../Mine/Mail/MailForm.aspx?s=" + strSendonemail;

                //없음표시
                Literal displayNone = (Literal)e.Item.FindControl("displayNone");

                URLQuery.Self["sfID"] = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(0).ToString();
                if (PtnBaseLib.Self.Modify(URLQuery.Self["sfID"]))
                {
                    //보기버튼
                    //HyperLink hlView = (HyperLink)e.Item.FindControl("hlView");
                    //hlView.NavigateUrl = "StfView.aspx?" + URLQuery.Self.GetQueryString();
                    //hlView.Visible = true;
                    //수정버튼
                    ImageButton ibUpdate = (ImageButton)e.Item.FindControl("ibUpdate");
                    //이렇게 할필요 까지???ibUpdate.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";
                    ibUpdate.ToolTip = "수정하기";
                    ibUpdate.Visible = true;

                    displayNone.Visible = false;
                }
                else
                {
                    displayNone.Visible = true;
                }


            }
            else if (e.Item.ItemType == ListItemType.Header)
            {
                Literal litSearchResult = (Literal)e.Item.FindControl("litSearchResult");
                Literal litListBrief = (Literal)e.Item.FindControl("litListBrief");

                litSearchResult.Text = 
                    this.SearchResultDisplay(this.tbSearchString.Text);
                litListBrief.Text = Paging.Self.ListSummary;
                //각종 상태값 메모리로 올림(상태유지를 위해)
                SetQueryString();
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
                if (PtnBaseLib.Self.Modify(e.CommandArgument.ToString()))
                {
                    URLQuery.Self["mode"] = "u";
                    URLQuery.Self["sfID"] = e.CommandArgument.ToString();
                    Response.Redirect("PtnForm.aspx?" + URLQuery.Self.GetQueryString());
                }
                else
                    Response.Redirect(PtnBaseLib.Self.baseDirPath + "PtnfList.aspx");
            }
        }
    }
}