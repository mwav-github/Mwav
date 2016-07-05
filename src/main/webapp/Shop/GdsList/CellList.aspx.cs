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
using JinsLibrary.CONTROL;
using JinsLibrary.STATEMANAGE;
using App_Code.Goods.Cell;

namespace SHOP
{
    public partial class Shop_GdsList_CellList : System.Web.UI.Page
    {
        
        private string _whereClause, _orderBy, _subQryOrderBy, _whichSRD;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Title = "서비스정보 > 휴대폰리스트";
                JinsLibrary.STATEMANAGE.Session.Self["PageName"] = "휴대폰리스트";

                //현재 페이지를 셋팅합니다.      -1
                Paging.Self.SetCurrentPage(WebUtil.CurrentRequest["cp"]);
                //셋팅초기화
                SettingInitialize();
                //조건문 셋팅 //Order By포함
                SetCondition();
                //테이터바이딩
                GoodsListBind();
            }
        }

        //public string SearchResultDisplay(string srdMsg)
        //{
        //    //if (srdMsg != "")
        //    //    srdMsg = "검색결과 : '<b>" + srdMsg + "</b>'로 검색한 결과입니다.<br>";
        //    srdMsg += "정렬기준 : '<b>" + ddlSearch.SelectedItem.Text + "</b>'값으로 정렬되었습니다.";
        //    return srdMsg;
        //}

        private void SettingInitialize()
        {
            //Title Image Bar setting
            if(!string.IsNullOrEmpty(Request["gc"]))
                imgTitle.ImageUrl = String.Format("/Shop/GdsList/Images/title_{0}.gif", Request["gc"]);
            //메뉴바인팅
            //SelMenuBind();
            //명함입력 링크바인딩
            //URLQuery.Self["mode"] = "i";
            //this.hlInsert.NavigateUrl = "GdsCellForm.aspx?sm=gci"; //+ URLQuery.Self.GetQueryString();
            //값을 지우고 다시 채워넣야~
            //URLQuery.Self.Remove("mode");
            URLQuery.Self.Remove("gcID");
            //초기 메모리 각종 설정값 복구(상태유지를 위해)
            GetQueryString();
        }
        private void SetQueryString()
        {
            URLQuery.Self["cp"] = Paging.Self.CP;
            //URLQuery.Self["smv"] = this.ddlSelMenu.SelectedValue;
            //URLQuery.Self["srch"] = this.ddlSearch.SelectedValue;
            //URLQuery.Self["sval"] = this.tbSearchString.Text;
        }
        private void GetQueryString()
        {
            //whichSRD
            if (Request.QueryString["srd"] != null)
                this._whichSRD = Request.QueryString["srd"];
            //명함선택메뉴
            //if (Request.QueryString["smv"] != null)
            //    this.ddlSelMenu.SelectedValue = Request.QueryString["smv"];
            
            //ddlSearch선택메뉴
            if (Request.QueryString["srch"] != null)
                ((DropDownList)dataList.FindControl("ddlSearch")).SelectedValue = Request.QueryString["srch"]; //this.ddlSearch.SelectedValue = Request.QueryString["srch"];
            
            //tbSearchString 값 유지
            //this.tbSearchString.Text = Request.QueryString["sval"];
        }

        //메뉴선택리스트 바인딩
        //private void SelMenuBind()
        //{
        //    //상품상태 셋팅
        //    //JinsLibrary.CONTROL.Util.DDLAddItem(ref ddlSelMenu, GdsCellBaseLib.Self.GetGSListItems());

        //}

        #region 상품리스트 바인딩
        protected void GoodsListBind()
        {
            DBLib dbUtil = new DBLib();
            //페이지사이즈초기화
            int topCnt;
            topCnt = Paging.Self.PageSize(20);
            string fieldNames = "gCode_id,modelNbr,gName,Mfger,custPrice,newPrice,transPrice,joinPrice,USimmPrice";

            //Response.Write("whereClause :" + whereClause + "<br>");
            //총레코드수 저장
            Paging.Self.TotRecordCount = dbUtil.GetRecordCount(GdsCellBaseLib.Self.GdsCellBiz.TableName, _whereClause);

            //상관쿼리 설정, AbsolutePage와 같은 역활을 한다. 실 쿼리실행 이전에 설정해야 한다//Paging.Self.SetPagePortion();
            //실제쿼리실행
            SqlDataReader drGds = dbUtil.Select_DR(topCnt, fieldNames, GdsCellBaseLib.Self.GdsCellBiz.TableName, _whereClause, _orderBy, Paging.Self.SetPagePortion(), _subQryOrderBy);

            CompanyItems_CIMasterPage master = this.Master;    //MainMasterPage master = (MainMasterPage)this.Master;
            if (drGds.HasRows)
            {
                this.dataList.DataSource = drGds;
                this.dataList.DataBind();		//바인딩하기 전에 drGds.Read();하지 말것.

                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = true;
                litPaging.Visible = true;
                //ucClientMessage.Visible = false;
                master.FindControl("ucClientMessage").Visible = false;
            }
            else
            {
                //사라질것 사라지고 있어질것 있어져랑
                dataList.Visible = false;
                litPaging.Visible = false;

                //에러유져컨트롤 바인딩                
                master.FindControl("ucClientMessage").Visible = true;
                master.LitMsgText = "Goods Code Error!!";
                master.LitDetailsText = "요구하신 제품정보가 존재하지 않습니다.";
                master.HlBackVisible = true;
                
                //Literal lit = (Literal)ucClientMessage.FindControl("litMsg");
                //Literal litDetails = (Literal)ucClientMessage.FindControl("litDetails");
                //lit.Text = "자료가 없습니다.";
                //ucClientMessage.Visible = true;
                if (Page.IsPostBack)
                {                    
                    //if (this.tbSearchString.Text != "")
                    //    litDetails.Text =  this.ddlSearch.SelectedItem.Text + "'에서 '<b>"
                    //        + this.tbSearchString.Text + "</b>'으로 ";
                    //litDetails.Text += "검색결과입니다.";
                }
                
            }
            drGds.Close();
            dbUtil.SqlConnection.Close();
        }
        #endregion
        private void SetCondition()
        {
            _whereClause = "status>0";
            //if (tbSearchString.Text != "")
            //{
            //    string search = "";
            //    tbSearchString.Text = HTML.ReplaceToDB(tbSearchString.Text);
            //    switch (ddlSearch.SelectedItem.Value)
            //    {
            //        case "modelNbr":
            //            search = " LIKE '" + tbSearchString.Text + "%'";
            //            this._whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
            //            break;
            //        case "gCode_id":
            //            if (!MathLib.IsNumber(tbSearchString.Text))
            //                ClientAction.ShowMsgBack("상품번호는 숫자로 입력하세요.");
            //            search = "='" + tbSearchString.Text + "'";
            //            this._whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
            //            break;
            //        case "gName":
            //        case "Mfger":
            //            search = " LIKE '%" + tbSearchString.Text + "%'";
            //            this._whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
            //            break;
            //        //case "DeptName":
            //        //	search = "=" + tbSearchString.Text;
            //        //	break;
            //        //	case "DeptID":
            //        //	string deptID = GdsBaseLib.GetDeptID(tbSearchString.Text);
            //        //	if(deptID != null) 
            //        //	search = " = " + deptID;
            //        //	else
            //        //	search = " Is Null";
            //        //	this.whereClause += " AND (" + ddlSearch.SelectedItem.Value + search + ")";
            //        //	JinsLibrary.WebUtil.CurrentResponse.Write("후후후= " +this.whereClause + "<br>");
            //        //	JinsLibrary.CommonLib.WebUtil.CurrentResponse.End();
            //        //	break;					
            //        default:
            //            Response.Write("chaos:" + ddlSearch.SelectedItem.Value);
            //            break;
            //    }
            //    //this.whichSRD = "w";
            //}
            //else
            //{
            //    //this.whichSRD = "o";				
            //}
            this.SetOrderBy();
            //메일로 보내기 위해 설정
            ViewState["whereClause"] = this._whereClause;
        }
        //정렬기준이다.
        private void SetOrderBy()
        {
//            DataList. dataList.h

            //ITemplate it = dataList.HeaderTemplate;

            ///DropDownList ddlSearch = (DropDownList) dataList.FindControl("ddlSearch");
            
            //ddlSearch.ToolTip = "aaaaaaaaaaa";


            //DropDownList ddlSearch = dataList.HeaderTemplate[0];

            
            string orderby = "";
            switch (ddlSearch.SelectedItem.Value)
            {
                case "gName":
                    this._orderBy = "gName ASC, gCode_id ASC";
                    break;
                case "modelNbr":
                    this._orderBy = "modelNbr ASC, gCode_id ASC";
                    break;
                case "Mfger":
                    this._orderBy = "Mfger ASC, gCode_id ASC";
                    break;
                default:
                    goto case "modelNbr";
            }
            this._subQryOrderBy = this._orderBy.Replace("ASC", "\n").Replace("DESC", "ASC").Replace("\n", "DESC"); //orderBy와 반대	
        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            //페이지 번호는 제거해야 에러가 안남.
            Paging.Self.SetCurrentPage(1);

            SetCondition();
            GoodsListBind();
        }
        #region MyDeleteRegion
        //protected void ddlSelMenu_SelectedIndexChanged(object sender, System.EventArgs e)
        //{
        //    //페이지 번호는 제거해야 에러가 안남.
        //    URLQuery.Self.Remove("cp");
        //    URLQuery.Self["cp"] = "1";
        //    Paging.Self.SetCurrentPage(1);

        //    //메뉴상태 스태틱저장
        //    //SelMenuValue = Convert.ToInt16(ddlSelMenu.SelectedValue);

        //    SetCondition();
        //    GoodsListBind();
        //    //나머지 이벤트실행되면 혼나
        //    //this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
        //    //this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        //}
        //protected void tbSearchString_TextChanged(object sender, System.EventArgs e)
        //{
        //    //페이지 번호는 제거해야 에러가 안남.
        //    Paging.Self.SetCurrentPage(1);

        //    SetCondition();
        //    GoodsListBind();
        //    //this.btnSearch.Click -= new System.EventHandler(this.btnSearch_Click);
        //}
        //protected void btnSearch_Click(object sender, System.EventArgs e)
        //{
        //    //페이지 번호는 제거해야 에러가 안남.
        //    Paging.Self.SetCurrentPage(1);

        //    SetCondition();
        //    GoodsListBind();
        //    //this.tbSearchString.TextChanged -= new System.EventHandler(this.tbSearchString_TextChanged);
        //}


        //protected void ibSendMail_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        //{
        //    //Response.Write("where = " + tableName + ";" + ViewState["whereClause"] );
        //    Session.Add("whereClause", ViewState["whereClause"]);
        //    Response.Redirect("../Mine/Mail/MailForm.aspx?t=mbr");
        //} 
        #endregion

        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //DataRow row = ((DataRowView)e.Item.DataItem).Row;    //<-- DataSet에서만 가능
                System.Data.Common.DbDataRecord dRecord = (System.Data.Common.DbDataRecord)e.Item.DataItem;

                //메일링크
                //HyperLink hlEmail = (HyperLink)e.Item.FindControl("hlEmail");
                //string strSendonemail = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(2) + " <" + hlEmail.ToolTip +">;";
                //hlEmail.NavigateUrl = "../Mine/Mail/MailForm.aspx?m=" + strSendonemail;		

                URLQuery.Self["gcID"] = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(0).ToString();
                //작은 상품이미지(링크) 만들기
                Image imgGdsSmallPic = (Image)e.Item.FindControl("imgGdsSmallPic");
                imgGdsSmallPic.ImageUrl = GdsCellBaseLib.Self.GetGdsSmallPicUrl(Convert.ToInt32(URLQuery.Self["gcID"]));
                imgGdsSmallPic.ToolTip = dRecord.GetString(dRecord.GetOrdinal("gName"));
                HyperLink hlGdsSmallPic = (HyperLink)e.Item.FindControl("hlGdsSmallPic");
                hlGdsSmallPic.NavigateUrl = "/Shop/GdsView/CellView.aspx?gcid=" + URLQuery.Self["gcID"];
                HyperLink hlGdsTitle = (HyperLink)e.Item.FindControl("hlGdsTitle");
                hlGdsTitle.NavigateUrl = hlGdsSmallPic.NavigateUrl;

                //bool boolDisplay;
                //if (GdsCellBaseLib.Self.CanAccess())
                //{
                //    //보기버튼
                //    HyperLink hlView = (HyperLink)e.Item.FindControl("hlView");
                //    hlView.NavigateUrl = "GdsCellView.aspx?" + URLQuery.Self.GetQueryString();
                //    hlView.ToolTip = "내용보기";
                //    hlView.Visible = true;
                //    //수정버튼
                //    ImageButton ibUpdate = (ImageButton)e.Item.FindControl("ibUpdate");
                //    //이렇게 할필요 까지???ibUpdate.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";
                //    ibUpdate.ToolTip = "수정하기";
                //    ibUpdate.Visible = true;

                //    //Response.Write(hlView.Visible + " - " + ibUpdate.Visible + " : " + DateTime.Now.ToString() + "<br>");
                //    boolDisplay = false;
                //}
                //else
                //    boolDisplay = true;
                ////없음표시(뭔가 이상);					
                //Literal displayNone = (Literal)e.Item.FindControl("displayNone");
                //displayNone.Visible = boolDisplay;//DisplayNone(hlView.Visible, ibUpdate.Visible);

            }
            else if (e.Item.ItemType == ListItemType.Header)
            {
                //Literal litSearchResult = (Literal)e.Item.FindControl("litSearchResult");
                //litSearchResult.Text = this.SearchResultDisplay("");//this.tbSearchString.Text);
                //Literal litListBrief = (Literal)e.Item.FindControl("litListBrief");
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

            //Response.Write("WebUtil.CurrentRequest.Path => " + WebUtil.CurrentRequest.Path + "<br/>");
        }

        protected void dataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //Response.Write("e.CommandArgument.ToString()" + e.CommandArgument.ToString());

            if (e.CommandName == "select")
            {
                //dlFiles.EditItemIndex = -1;  
                //dlFiles.SelectedIndex = e.Item.ItemIndex;
                if (GdsCellBaseLib.Self.CanAccess())
                {
                    GdsCellBaseLib.Self.Modify(e.CommandArgument.ToString());
                    //Response.Redirect("GdsCellForm.aspx?" + URLQuery.Self.GetQueryString());
                }
                else
                    Response.Redirect("GdsCellList.aspx");
            }
        }
    }
}