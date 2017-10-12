using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

using JinsLibrary;
using JinsLibrary.STATEMANAGE;

namespace PARTNER
{
    public partial class Adminp_LeftFrame : System.Web.UI.Page
    {
        private string _strBodyFrame;
        private string mainMenu
        {
            get
            {
                return (String)JinsLibrary.STATEMANAGE.Session.Self["mainMenu"];
            }
            set
            {
                JinsLibrary.STATEMANAGE.Session.Self["mainMenu"] = value;	// Cache["mainMenu"] = value;
            }
        }
        private string[,] arrSubMenu;

        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            App_Code.Partners.Staff.PtnBaseLib.Self.LoginOK();

            if (Request.QueryString["mm"] != null)
            {
                //서브메뉴가 선택되었을 때
                if (!Page.IsPostBack)
                {
                    if (mainMenu != Request.QueryString["mm"])
                        mainMenu = Request.QueryString["mm"];

                    this.pnLeftDefault.Visible = false;
                    
                    //레프트스몰메뉴바인딩    
                    LeftPageBind();
                    //바디프레임 컨텐츠변경
                    if (_strBodyFrame != "")
                        ClientAction.GoUrlOnFrame("BodyFrame", _strBodyFrame);

                    //서브메뉴보여주기
                    ShowSubMenu();
                }
            }
            else	//서브메뉴가 선택되지 않았을 때 
            {
                pnLeftSubMenu.Visible = false;
                mainMenu = "";
            }
            //HttpContext.Current.Response.Write("------>" + this.mainMenu + "<br>");
            //HttpContext.Current.Response.Write("------>" + mainMenu);
        }

        private void ShowSubMenu()
        {
            HyperLink hlSubMenu;
            for (int i = 0; i < arrSubMenu.GetLength(0); i++)
            {
                hlSubMenu = new HyperLink();
                //여기서 메뉴권한 검증
                if (Convert.ToInt16(arrSubMenu[i, 3]) < Convert.ToInt16(Cookie.Self["sLevel"])
                    && (arrSubMenu[i, 4] == Cookie.Self["DeptName"] || arrSubMenu[i, 4] == "*"))
                {
                    //블릿이미지
                    pnSubMenu.Controls.Add(new LiteralControl("&nbsp;&nbsp;<img src='zImages/admin_left004.gif' width='11' height='11'>&nbsp;"));
                    //for(int j=0; j < arrSubMenu.GetLength(1); j++) //이게 필요한가?
                    //{
                    //Response.Write("i=" + i.ToString() + " j=" + j.ToString() + "<br>");
                    //Response.Write("arrSubMenu[i,1]= " + arrSubMenu[i,1] + "<br>");

                    //정보셋팅
                    hlSubMenu.ID = arrSubMenu[i, 0];
                    hlSubMenu.Text = arrSubMenu[i, 1];
                    hlSubMenu.ForeColor = Color.Black;
                    if (arrSubMenu[i, 2].IndexOf("?") > 0)
                        hlSubMenu.NavigateUrl = arrSubMenu[i, 2];
                    else
                        hlSubMenu.NavigateUrl = arrSubMenu[i, 2] + "?sm=" + arrSubMenu[i, 0];
                    hlSubMenu.Target = "BodyFrame";		//arrSubMenu.Target = "leftFrame";
                    //HttpContext.Current.Response.Write(arrSubMenu[i,0]);
                    //}
                    pnSubMenu.Controls.Add(hlSubMenu);
                    //마지막 구분자는 출력안됨.
                    if (i < arrSubMenu.GetLength(0) - 1)
                        pnSubMenu.Controls.Add(new LiteralControl("<br>&nbsp;&nbsp;<img src='zImages/A_left010.gif' vspace='4'><br>"));
                }
            }
            //아무좌측메뉴도 없을 때 
            if (pnSubMenu.Controls.Count == 0)
                pnSubMenu.Controls.Add(new LiteralControl("<center>[좌측메뉴없음]</center>"));
        }

        //서브메뉴를 설정한다.
        private void LeftPageBind()
        {
            switch (mainMenu)
            {
                case "mine":
                    litMainMenu.Text = String.Format("<== {0} ==>", "MyZone");
                    //strBodyFrame = "Mine/Mail/MailList.aspx?sm=mail";
                    _strBodyFrame = "/MessageView/AdminMessage.aspx?errID=100";                    
                    arrSubMenu = new string[4, 5];
                    arrSubMenu[0, 0] = "mail";						// 관련메뉴코드값(get문에서 이용)
                    arrSubMenu[0, 1] = "메일관리";					// 메뉴이름
                    //arrSubMenu[0, 2] = "Mine/Mail/MailList.aspx";	// 해당링크
                    arrSubMenu[0, 2] = "/MessageView/AdminMessage.aspx?errID=100"; 	// 해당링크
                    arrSubMenu[0, 3] = "1";							// 선택가능 권한(레벨)
                    arrSubMenu[0, 4] = "*";							// 선택가능 부서				

                    arrSubMenu[1, 0] = "crd";
                    arrSubMenu[1, 1] = "명함관리";
                    arrSubMenu[1, 2] = "/MessageView/AdminMessage.aspx?errID=100"; 
                    //arrSubMenu[1, 2] = "Mine/BizCard/CardList.aspx";
                    arrSubMenu[1, 3] = "1";
                    arrSubMenu[1, 4] = "*";

                    arrSubMenu[2, 0] = "memo";
                    arrSubMenu[2, 1] = "쪽지함";
                    arrSubMenu[2, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[2, 3] = "1";
                    arrSubMenu[2, 4] = "*";

                    arrSubMenu[3, 0] = "pds";
                    arrSubMenu[3, 1] = "FTP자료실";
                    //arrSubMenu[3, 2] = "Mine/FTP.aspx";
                    arrSubMenu[3, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[3, 3] = "1";
                    arrSubMenu[3, 4] = "*";

                    break;

                case "cOrd":
                    litMainMenu.Text = String.Format("<= {0} =>", "핸드폰주문관리");
                    _strBodyFrame = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu = new string[6, 5];
                    arrSubMenu[0, 0] = "redy";
                    arrSubMenu[0, 1] = "발주상태주문";				//(주문접수,입금확인중)		
                    arrSubMenu[0, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[0, 3] = "1";
                    arrSubMenu[0, 4] = "*";

                    arrSubMenu[1, 0] = "shp";
                    arrSubMenu[1, 1] = "배송중주문";					//(배송중)		
                    arrSubMenu[1, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[1, 3] = "1";
                    arrSubMenu[1, 4] = "*";

                    arrSubMenu[2, 0] = "orddn";
                    arrSubMenu[2, 1] = "주문완료";
                    arrSubMenu[2, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[2, 3] = "1";
                    arrSubMenu[2, 4] = "*";

                    arrSubMenu[3, 0] = "ccl";
                    arrSubMenu[3, 1] = "취소중주문";					//(환불중, 반송중)
                    arrSubMenu[3, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[3, 3] = "1";
                    arrSubMenu[3, 4] = "*";

                    arrSubMenu[4, 0] = "ccldn";
                    arrSubMenu[4, 1] = "취소완료";
                    arrSubMenu[4, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[4, 3] = "1";
                    arrSubMenu[4, 4] = "*";

                    arrSubMenu[5, 0] = "ordal";
                    arrSubMenu[5, 1] = "전체주문현황";
                    arrSubMenu[5, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[5, 3] = "1";
                    arrSubMenu[5, 4] = "*";

                    break;

                case "nOrd":
                    litMainMenu.Text = String.Format("<= {0} =>", "인터넷/전화접수");
                    _strBodyFrame = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu = new string[2, 5];
                    arrSubMenu[0, 0] = "redy";
                    arrSubMenu[0, 1] = "LG070접수리스트";				//(주문접수,입금확인중)		
                    arrSubMenu[0, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[0, 3] = "1";
                    arrSubMenu[0, 4] = "*";

                    arrSubMenu[1, 0] = "shp";
                    arrSubMenu[1, 1] = "LG070접수신청";					//(배송중)		
                    arrSubMenu[1, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[1, 3] = "1";
                    arrSubMenu[1, 4] = "*";

                    //arrSubMenu[2, 0] = "orddn";
                    //arrSubMenu[2, 1] = "주문완료";
                    //arrSubMenu[2, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    //arrSubMenu[2, 3] = "1";
                    //arrSubMenu[2, 4] = "*";

                    //arrSubMenu[3, 0] = "ccl";
                    //arrSubMenu[3, 1] = "취소중주문";					//(환불중, 반송중)
                    //arrSubMenu[3, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    //arrSubMenu[3, 3] = "1";
                    //arrSubMenu[3, 4] = "*";


                    break;

                case "ptn":
                    litMainMenu.Text = String.Format("<== {0} ==>", "협력사관리");
                    _strBodyFrame = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu = new string[1, 5];
                    arrSubMenu[0, 0] = "supli";
                    arrSubMenu[0, 1] = "협력사목록";
                    arrSubMenu[0, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[0, 3] = "1";
                    arrSubMenu[0, 4] = "*";

                    //arrSubMenu[1, 0] = "sustp";
                    //arrSubMenu[1, 1] = "공급중지사";
                    //arrSubMenu[1, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    //arrSubMenu[1, 3] = "1";
                    //arrSubMenu[1, 4] = "*";

                    //arrSubMenu[2, 0] = "suset";
                    //arrSubMenu[2, 1] = "공급상품설정";
                    //arrSubMenu[2, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    //arrSubMenu[2, 3] = "1";
                    //arrSubMenu[2, 4] = "*";

                    //arrSubMenu[3, 0] = "expir";
                    //arrSubMenu[3, 1] = "계약만기일설정";
                    //arrSubMenu[3, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    //arrSubMenu[3, 3] = "1";
                    //arrSubMenu[3, 4] = "*";

                    //arrSubMenu[4, 0] = "supad";
                    //arrSubMenu[4, 1] = "공급사입력";
                    //arrSubMenu[4, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    //arrSubMenu[4, 3] = "1";
                    //arrSubMenu[4, 4] = "*";
                    break;

                case "mbrs":
                    litMainMenu.Text = String.Format("<== {0} ==>", "회원관리");
                    //strBodyFrame = "Members/MbrList.aspx?sm=mbb";
                    _strBodyFrame = "/MessageView/AdminMessage.aspx?errID=100";
                    
                    arrSubMenu = new string[4, 5];
                    arrSubMenu[0, 0] = "mbb";
                    arrSubMenu[0, 1] = "회원리스트";
                    //arrSubMenu[0, 2] = "Members/MbrList.aspx?sm=mbb";
                    arrSubMenu[0, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[0, 3] = "1";
                    arrSubMenu[0, 4] = "*";

                    arrSubMenu[1, 0] = "mbo";
                    arrSubMenu[1, 1] = "회원부가정보";
                    //arrSubMenu[1, 2] = "Members/MbrOptList.aspx?sm=mbo";
                    arrSubMenu[1, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[1, 3] = "1";
                    arrSubMenu[1, 4] = "*";

                    arrSubMenu[2, 0] = "mbv";
                    arrSubMenu[2, 1] = "회원평가치";
                    //arrSubMenu[2, 2] = "Members/MbrValList.aspx?sm=mbv";
                    arrSubMenu[2, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[2, 3] = "1";
                    arrSubMenu[2, 4] = "*";

                    arrSubMenu[3, 0] = "mbj";
                    arrSubMenu[3, 1] = "회원가입";
                    //arrSubMenu[3, 2] = "Members/MbrForm.aspx?sm=mbj&mode=i";
                    arrSubMenu[3, 2] = "/MessageView/AdminMessage.aspx?errID=100";
                    arrSubMenu[3, 3] = "1";
                    arrSubMenu[3, 4] = "*";

                    break;

                default:
                    //goto case 1;
                    arrSubMenu = null;
                    break;
            }

        }

    }
}