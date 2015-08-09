using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using JinsLibrary;
using JinsLibrary.STATEMANAGE;

using MiddleTier.Staff;
using MiddleTier.Statistics;
using MiddleTier.Marketing;

//using App_Code.CompanyMgr.Staff;


namespace WebRoot.PartsOfContents.SiteFooter
{
    public partial class FrontFooter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                #region 자바스크립트
                //해상도
                string scrResolutionWebServiceBehaviorScript = @"
				<SCRIPT language=""javascript"">
				<!--
					var processedID			
					var iCallID;
					//var retIdx;

					function _SetScreenInfo()
					{{
						var windowScreen = ""n/a"";
						if( window.screen )
							windowScreen = window.screen.width+'*'+window.screen.height+'*'+window.screen.colorDepth ;

						//(리턴받을 자바스크립트함수, 웹서비스함수, 웹서비스함수파라미터)
						iCallID = ScrResolutionWebService.wService.callService(ScreenInfoScript, ""SetScreenInfo"", windowScreen);
						//retIdx = windowScreen;

					}}

					function _srWebServiceInit()
					{{
						ScrResolutionWebService.useService(""{0}"",""wService"");
						_SetScreenInfo();
					}}

					function ScreenInfoScript(result)
					{{
						//alert(result.error);
						//alert(result.value);
						if(result.error)
						{{
							var xfaultcode   = result.errorDetail.code;
							var xfaultstring = result.errorDetail.string;
							var xfaultsoap   = result.errorDetail.raw;
							//--> alert(""에러! : "" + xfaultcode + "" : "" + xfaultstring);
						}}
						else
						{{
							//alert(result.value);
						}}
					}}
				-->
				</SCRIPT>
				";
                #endregion

                //Home link --------> FrontHeader.ascx정의됨
                if (DataCache.Self["HomeUrl"] != null)
                    hlHome.NavigateUrl = DataCache.Self["HomeUrl"].ToString();
                else
                    hlHome.NavigateUrl = JinsLibrary.STATEMANAGE.AppVariable.Self["BaseHref"].ToString();// "http://cubecorp.co.kr/";
                

                //웹서비스를 위한 자바스크립트설정 및 함수 등록
                scrResolutionWebServiceBehaviorScript = String.Format(scrResolutionWebServiceBehaviorScript, new String[] { "http://" + HttpContext.Current.Request.ServerVariables["HTTP_HOST"] + "/CommonLibrary/WebServices/WebService.asmx?WSDL" });
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_scrResolutionWebServiceBehaviorScript", scrResolutionWebServiceBehaviorScript);
                JinsLibrary.ClientAction.RegisterOnloadFunction(Page, "_srWebServiceInit()");
                //Response.Write("sc = " + JinsLibrary.WEBSERVICE.WebServiceLib.ScreenInfo + "<br>");
            }

            //정보매핑 (IsPostBack밖으로 빼야 함)
            MappingSiteInfo();

            //통계관련내용.
            StatisticsBaseBiz sbb = new StatisticsBaseBiz();
            sbb.BeginRecording(Request.QueryString["rpwe"]);       //QueryString분석 (rpwe=S;110;5100;1000029, linkId=110;S;119;1233;1000000)
            //프로모터셋팅
            GetPromoter(sbb.pType, sbb.pId);
            
            //ClientAction.WriteJavascript(Page, "clear", "document.clear();");
            //Response.Write("--> " + App_Code.CompanyMgr.Staff.StfBaseLib.Self.GetPromotor_id() + "<br/>");
        }
        
        public void MappingSiteInfo()
        {
            //siteName.text = JinsLibrary.CONFIG.GeneralConfig.GetValue("siteName");
            litFirmName.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmName");
            litCeoName.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("ceoName");
            litChiefManager.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("chiefManager");
            litSiteManager.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("siteManager");
            litFirmPhone.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmPhone");
            litFirmFax.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmFax");
            //siteAddress.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("siteAddress");
            litBusinessID.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("businessID");
            litFirmAddr.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("firmAddr");
            copyright.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("copyright");
        }
        
        //프로모터명을 가져온다.
        public void GetPromoter(string pType, int pId)
        {
            string tempStfName = "";
            if (!string.IsNullOrEmpty(pType) && pId > 0) //프로모터가 있는 경우 
            {
                if (pType != Cookie.Self["pType"] || pId.ToString() != Cookie.Self["pId"])	//갱신
                {
                    //프로모터이름을 가져온다.
                    tempStfName = MarketingBaseBiz.Self.GetPromoterName(pType, pId);

                    if (tempStfName != "")
                    {
                        Cookie.Self.SetCookie("pType", pType, Int16.MaxValue);
                        Cookie.Self.SetCookie("pId", pId.ToString(), Int16.MaxValue);
                        Cookie.Self.SetCookie("pName", Server.UrlEncode(tempStfName), Int16.MaxValue);
                        //Response.Write("1---------------------->" + "<br/>");
                    }
                    else //기본 프로모터로 셋팅
                    {
                        tempStfName = JinsLibrary.CONFIG.GeneralConfig.GetValue("sitePromoter");
                        //Response.Write("2---------------------->" + "<br/>");
                    }
                }
                else	// 쿠키에서 값을 가져온다. (그냥 위에서 업데이트 해도 되는데....)
                {
                    if (Cookie.Self["pId"] != null || Cookie.Self["pId"] != "")
                    {
                        //tempStfName = StaffBaseBiz.Self.StaffDAO.GetName(Convert.ToInt16(Cookie.Self["pId"]));
                        tempStfName = MarketingBaseBiz.Self.GetPromoterName(Cookie.Self["pType"], Convert.ToInt32(Cookie.Self["pId"]));
                        //Response.Write("3---------------------->" + Cookie.Self["pId"] + "<br/>");
                    }
                    else
                        if (Cookie.Self["pName"] != null || Cookie.Self["pName"] != "")
                            tempStfName = Server.UrlDecode(Cookie.Self["pName"]);
                    //Response.Write("4---------------------->" + "<br/>");
                }
                //리얼타임 메인화면 변경
                //PopupInLine(pId);
            }
            else if (Cookie.Self["pId"] != null && Cookie.Self["pId"] != "") //프로모터가 없는 겨우 쿠키에서 찾는다. 
            {
                if (Cookie.Self["pName"] == null || Cookie.Self["pName"] == "")
                {
                    //tempStfName = StaffBaseBiz.Self.StaffDAO.GetName(Convert.ToInt32(Cookie.Self["pId"]));
                    tempStfName = MarketingBaseBiz.Self.GetPromoterName(Cookie.Self["pType"], Convert.ToInt32(Cookie.Self["pId"]));
                }
                else
                    tempStfName = Server.UrlDecode(Cookie.Self["pName"]);
                //Response.Write("5---------------------->" + "<br/>");
            }
            else	//이것도 저것도 아니면 기본값
                tempStfName = JinsLibrary.CONFIG.GeneralConfig.GetValue("sitePromoter");

            lbPromoter.Text = tempStfName;

            //Response.Write("GetStat_id --> " + App_Code.Statistics.StatisticsBaseLib.Self.GetStat_id() + "<br/>");
            //Response.Write("GetStfName --> " + StfBaseLib.Self.GetStfName(pId) + "<br/>");
            //Response.Write("pId1 --> " + Cookie.Self["pId"] + "<br/>");
            //Response.Write("pId --> " + pId + "<br/>");
            //Response.Write("pName --> " + Server.UrlDecode(Cookie.Self["pName"]) + "<br/>");
        }

        //프로모터명을 가져온다.  쿠키와 세션... 쩝..
        //public void GetPromoter1(int pId)
        //{
        //    string tempStfName = "";
        //    if (pId > 0 && (pId.ToString() != Cookie.Self["pId"]))	//새로운 pId로 갱신이 필요한 경우
        //    {
        //        tempStfName = StfBaseLib.Self.GetStfName(pId);
        //        if (tempStfName != "")
        //        {
        //            Cookie.Self.SetCookie("pId", pId.ToString(), Int16.MaxValue);
        //            Cookie.Self.SetCookie("pName", Server.UrlEncode(tempStfName), Int16.MaxValue);
        //        }
        //     }
        //    else if (Cookie.Self["pId"] != null && Cookie.Self["pId"] != "") //프로모터가 없는 겨우 쿠키에서 찾는다. 
        //    {
        //        if(Cookie.Self["pName"] != "")
        //            tempStfName = Server.UrlDecode(Cookie.Self["pName"]);
        //    }

        //    if (tempStfName != "")
        //        lbPromoter.Text = tempStfName;
        //    else
        //        lbPromoter.Text = JinsLibrary.CONFIG.GeneralConfig.GetValue("sitePromoter");

        //    Response.Write("pId --> " + pId + "<br/>");
        //    Response.Write("GetStfName --> " + StfBaseLib.Self.GetStfName(pId) + "<br/>");

        //    Response.Write("pId1 --> " + Cookie.Self["pId"] + "<br/>");
        //    Response.Write("pName --> " + Server.UrlDecode(Cookie.Self["pName"]) + "<br/>");

        //}

        //화면 전체내역 표시

        public void PopupInLine(int pId)
        {
            string pathInfo = "/PopupInLine/PI" + pId.ToString() + "/PI" + pId.ToString() + ".html";
            if (JinsLibrary.FILE.FileLib.Self.FileExist(pathInfo))
                Response.Redirect(pathInfo, false);
        }
    }
}