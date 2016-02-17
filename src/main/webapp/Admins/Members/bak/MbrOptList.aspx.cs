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
using App_Code.Member;

namespace ADMIN
{
    public partial class Admins_Members_MbrOptList : System.Web.UI.Page
    {
        private string _tableName = "v_Member_Option_List";
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            //App_Code.CompanyMgr.Staff.StfBaseLib.Self.LoginOK();
            //JinsLibrary.ADMIN.AdminLib.Self.AccessOnlyForLocalWorking();

            //페이지타이틀설정
            litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("mbo");

            //셋팅초기화
            InitializeSetting();
            if (!Page.IsPostBack)
            {
                //현재 페이지를 셋팅합니다.      -1
                Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);
                //테이터바이딩
                this.MbrOptListBind();
                //컨트롤초기화
                InitializeControls();
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
            //명함입력 링크바인딩
            URLQuery.Self["mode"] = "i";
            this.hlInsert.NavigateUrl = "MbrForm.aspx?" + URLQuery.Self.GetQueryString();
            //값을 지우고 다시 채워넣야~
            URLQuery.Self.Remove("mode");
            URLQuery.Self.Remove("mbID");
            //초기 메모리 각종 설정값 복구(상태유지를 위해)
            GetQueryString();
        }
        //라운드트립에서 상태값을 가질 수 있는 콘트롤
        private void InitializeControls()
        {
            //메뉴바인팅
            if (WebUtil.CurrentServer.UrlDecode(Cookie.Self["DeptName"]) == "기획/관리")
                JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlSelMenu, "탈퇴회원", "-1");
        }


        private void SetQueryString()
        {
            URLQuery.Self["ml"] = "opt";		//멤버리스트가 어디로 갈것인가?
            URLQuery.Self["cp"] = Paging.Self.CP;
            URLQuery.Self["smv"] = this.ddlSelMenu.SelectedValue;
            URLQuery.Self["srch"] = this.ddlSearch.SelectedValue;
            URLQuery.Self["sval"] = this.tbSearchString.Text;
        }
        private void GetQueryString()
        {
            //명함선택메뉴
            if (Request.QueryString["smv"] != null)
                this.ddlSelMenu.SelectedValue = Request.QueryString["smv"];
            //ddlSearch선택메뉴
            if (Request.QueryString["srch"] != null)
                this.ddlSearch.SelectedValue = Request.QueryString["srch"];
            //tbSearchString 값 유지
            this.tbSearchString.Text = Request.QueryString["sval"];
        }


        #region 회원리스트 바인딩
        protected void MbrOptListBind()
        {
            DBLib dbUtil = new DBLib();
            //페이지사이즈초기화
            int topCnt;
            topCnt = Paging.Self.PageSize(20);
            string fieldNames, whereClause, orderBy, subQryOrderBy;
            fieldNames = "member_id,loginID,MbrName,MbrEmail,company,jobType,hobbies,carInfo,children,monthlyPay,mLevel";
            whereClause = SetWhereClause();
            orderBy = SetOrderBy();
            subQryOrderBy = orderBy.Replace("ASC", "\n").Replace("DESC", "ASC").Replace("\n", "DESC"); //orderBy와 반대	 //Response.Write("subQryOrderBy = " + subQryOrderBy + "<br/>");

            //Response.Write("whereClause :" + whereClause + "<br>");
            //총레코드수 저장
            Paging.Self.TotRecordCount = dbUtil.GetRecordCount(this._tableName, whereClause);

            //상관쿼리 설정, AbsolutePage와 같은 역활을 한다. 실 쿼리실행 이전에 설정해야 한다//Paging.Self.SetPagePortion();
            //실제쿼리실행
            SqlDataReader drMbr = dbUtil.Select_DR(topCnt, fieldNames, this._tableName, whereClause, orderBy, Paging.Self.SetPagePortion(), subQryOrderBy);

            if (drMbr.HasRows)
            {
                dataList.DataKeyField = "member_id";
                this.dataList.DataSource = drMbr;
                this.dataList.DataBind();		//바인딩하기 전에 drMbr.Read();하지 말것.

                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = litPaging.Visible = true;

            }
            else
            {
                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = litPaging.Visible = false;
                //에러유져컨트롤 바인딩
                ucMessage.LitMsgText = "자료가 없습니다.";
                if (Page.IsPostBack)
                {
                    ucMessage.LitDetailsText = ddlSelMenu.SelectedItem.Text + "의 ";
                    if (this.tbSearchString.Text != "")
                        ucMessage.LitDetailsText += "'" + this.ddlSearch.SelectedItem.Text + "'에서 '<b>"
                            + this.tbSearchString.Text + "</b>'으로 ";
                    ucMessage.LitDetailsText += "검색결과입니다.";
                }   
            }
            ucMessage.Visible = !dataList.Visible;
            drMbr.Close();
            dbUtil.SqlConnection.Close();
        }
        #endregion
        private string SetWhereClause()
        {
            string whereClause = MbrBaseLib.Self.GetSelMenuQuery(ddlSelMenu.SelectedValue);
            if (tbSearchString.Text != "")
            {
                string search = "";
                tbSearchString.Text = HTML.ReplaceToDB(tbSearchString.Text);
                switch (ddlSearch.SelectedItem.Value)
                {
                    case "loginID":
                        search = " LIKE '" + tbSearchString.Text + "%'";
                        whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "member_id":
                        if (!MathLib.IsNumber(tbSearchString.Text))
                            ClientAction.ShowMsgBack("회원번호는 숫자로 입력하세요.");
                        search = "='" + tbSearchString.Text + "'";
                        whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    case "MbrName":
                    case "company":
                    case "jobType":
                    case "hobbies":
                        search = " LIKE '%" + tbSearchString.Text + "%'";
                        whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
                        break;
                    //case "DeptName":
                    //	search = "=" + tbSearchString.Text;
                    //	break;
                    //	case "DeptID":
                    //	string deptID = MbrBaseLib.GetDeptID(tbSearchString.Text);
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
            ViewState["whereClause"] = whereClause;
            return whereClause;
        }
        //정렬기준이다.
        private string SetOrderBy()
        {
            string orderBy = "";
            switch (ddlSearch.SelectedItem.Value)
            {
                case "loginID":
                    orderBy = "loginID ASC, member_id ASC";
                    break;
                case "MbrName":
                    orderBy = "MbrName ASC, member_id ASC";
                    break;
                case "member_id":
                    orderBy = "member_id DESC";
                    break;
                case "company":
                    orderBy = "company ASC, member_id ASC";
                    break;
                case "jobType":
                    orderBy = "jobType ASC, member_id ASC";
                    break;
                case "hobbies":
                    orderBy = "hobbies ASC, member_id ASC";
                    break;
                default:
                    goto case "member_id";
            }
            return orderBy;
        }

        protected void ddlSelMenu_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            URLQuery.Self.Remove("cp");
            URLQuery.Self["cp"] = "1";
            Paging.Self.SetCurrentPage(1);

            //메뉴상태 스태틱저장
            //SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);

            SetWhereClause();
            MbrOptListBind();
            //나머지 이벤트실행되면 혼나
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
            this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        }
        protected void tbSearchString_TextChanged(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            Paging.Self.SetCurrentPage(1);

            SetWhereClause();
            MbrOptListBind();
            this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        }
        protected void btnSearch_Click(object sender, System.EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            Paging.Self.SetCurrentPage(1);

            SetWhereClause();
            MbrOptListBind();
            this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
        }

        private void ibSendMail_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            //Response.Write("where = " + tableName + ";" + ViewState["whereClause"] );
            Session.Add("whereClause", ViewState["whereClause"]);
            Response.Redirect("../Mine/Mail/MailForm.aspx?t=mbr");
        }


        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //DataRow row = ((DataRowView)e.Item.DataItem).Row;    //<-- DataSet에서만 가능
                System.Data.Common.DbDataRecord dRecord = (System.Data.Common.DbDataRecord)e.Item.DataItem;
                //((Literal)e.Item.FindControl("litIDX")).Text = e.Item.ItemIndex.ToString();

                //회원등급
                Label mLevel = (Label)e.Item.FindControl("mLevel");
                mLevel.ToolTip = MbrBaseLib.Self.GetStatusText(dRecord.GetByte(dRecord.GetOrdinal("mLevel")));


                //회사명(직업) 
                Label lbJobInfo = (Label)e.Item.FindControl("lbJobInfo");
                lbJobInfo.Text = dRecord.GetValue(dRecord.GetOrdinal("company")).ToString();
                lbJobInfo.ToolTip = dRecord.GetValue(dRecord.GetOrdinal("jobType")).ToString();
                
                //최근로그인한 날
                Label hobbies = (Label)e.Item.FindControl("hobbies");
                hobbies.ToolTip = dRecord.GetValue(dRecord.GetOrdinal("hobbies")).ToString();
                if (hobbies.ToolTip != "")
                    hobbies.Text = Text.ShortenString(hobbies.ToolTip, 10);

                //메일링크
                HyperLink hlEmail = (HyperLink)e.Item.FindControl("hlEmail");
                hlEmail.Text = string.Format("{0} ({1})",  dRecord.GetString(dRecord.GetOrdinal("MbrName")), dRecord.GetString(dRecord.GetOrdinal("loginID")));
                hlEmail.ToolTip = dRecord.GetValue(dRecord.GetOrdinal("MbrEmail")).ToString();
                string strSendonemail = Text.GetEmailFormat(dRecord.GetValue(dRecord.GetOrdinal("MbrName")).ToString(), hlEmail.ToolTip);
                hlEmail.NavigateUrl = "../Mine/Mail/MailForm.aspx?m=" + strSendonemail;

                //월급정보
                Literal litMonthlyPayText = (Literal)e.Item.FindControl("litMonthlyPayText");
                litMonthlyPayText.Text = MbrBaseLib.Self.GetMonthlyPayText(dRecord.GetValue(dRecord.GetOrdinal("monthlyPay")).ToString());

                //자동차정보
                Literal litCarInfoText = (Literal)e.Item.FindControl("litCarInfoText");
                litCarInfoText.Text = MbrBaseLib.Self.GetCarInfoText(dRecord.GetValue(dRecord.GetOrdinal("carInfo")).ToString());
                

                URLQuery.Self["mbID"] = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(0).ToString();
                bool boolDisplay;
                if (MbrBaseLib.Self.CanAccess(string.Empty))
                {
                    //보기버튼
                    HyperLink hlView = (HyperLink)e.Item.FindControl("hlView");
                    hlView.NavigateUrl = "MbrView.aspx?" + URLQuery.Self.GetQueryString();
                    hlView.ToolTip = "내용보기";
                    hlView.Visible = true;
                    //수정버튼
                    ImageButton ibModfy = (ImageButton)e.Item.FindControl("ibModfy");
                    ibModfy.CommandName = "select";
                    ibModfy.CommandArgument = dataList.DataKeys[e.Item.ItemIndex].ToString();
                    //이렇게 할필요 까지???ibModfy.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";
                    ibModfy.ToolTip = "수정하기";
                    ibModfy.Visible = true;

                    //Response.Write(hlView.Visible + " - " + ibModfy.Visible + " : " + DateTime.Now.ToString() + "<br>");
                    boolDisplay = false;
                }
                else
                    boolDisplay = true;
                //없음표시(뭔가 이상);					
                Literal displayNone = (Literal)e.Item.FindControl("displayNone");
                displayNone.Visible = boolDisplay;//DisplayNone(hlView.Visible, ibModfy.Visible);

            }
            else if (e.Item.ItemType == ListItemType.Header)
            {
                Literal litSearchResult = (Literal)e.Item.FindControl("litSearchResult");
                Literal litListBrief = (Literal)e.Item.FindControl("litListBrief");

                litSearchResult.Text = this.SearchResultDisplay(this.tbSearchString.Text);
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
                if (MbrBaseLib.Self.CanAccess(string.Empty))
                    MbrBaseLib.Self.Modify(e.CommandArgument.ToString());
                //Response.Redirect("MbrForm.aspx?" + URLQuery.Self.GetQueryString());
                else
                    Response.Redirect("MbrList.aspx");
            }
        }

    }
}