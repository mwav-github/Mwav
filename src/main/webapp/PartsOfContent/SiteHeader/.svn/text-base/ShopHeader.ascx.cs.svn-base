using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using JinsLibrary;
using JinsLibrary.STATEMANAGE;

using MiddleTier.Member;

namespace WebRoot.PartsOfContents.SiteHeader
{
    public partial class ShopHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                InitializeSetting();

                OnMemberLogged();                
            }

        }

        /// <summary>
        /// 셋팅초기화 (Viewstate에 의해서 상태값이 유지되는 웹컨트롤들)
        /// </summary>
        private void InitializeSetting()
        {
            ibMbrLogout.CausesValidation = false;
            hlMemberInfo.NavigateUrl = "/CustomerServices/MemberShip/MemberInfoView.aspx?mode=v";
            hlMyPage.NavigateUrl = "/Shop/MyPage/MyPage.aspx";     //<----------------생각해 볼것... 쇼핑몰이 다가 아닌데...
            hlShoppingCart.NavigateUrl = "/Shop/ShoppingCart/ShoppingCart.aspx";
            hlCsCenter.NavigateUrl = "/CustomerServices/Summary/Summary.aspx";

        }

        protected void ibMbrLogout_Click(object sender, ImageClickEventArgs e)
        {
            //로그아웃
            MemberBaseBiz.Self.Logout();
            ClientAction.ShowMsgAndGoUrl("로그아웃 되었습니다.", "/");            
        }

        private void OnMemberLogged()
        {
            //로그인 확인
            if (MemberBaseBiz.Self.IsMemberLogged())
            {
                phWhenOn.Visible = true;
                phWhenOff.Visible = false;
            }
            else
            {
                phWhenOn.Visible = false;
                phWhenOff.Visible = true;
            }
        
        }
    }
}