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
using JinsLibrary.FILE;
using JinsLibrary.IMAGE;
using JinsLibrary.CONFIG;
using JinsLibrary.CONTROL;
using JinsLibrary.STATEMANAGE;
using App_Code.Member;

namespace ADMIN
{
    public partial class Admins_Members_MbrForm : System.Web.UI.Page
    {
        private MbrBase _mbr;
        //private MiddleTier.Member.
        private DBLib _dbUtil;
        private string _mbID;

        #region 자바스크립트
        private string joiningWebServiceBehaviorScript = @"
<script language=""javascript"">
	<!--
		var iCallID;
		var processedID, processedDong;
		var dongInputEntered = false;

		function _joiningWebServiceInit()
		{{
			joiningWebService.useService(""../../CommonLibrary/WebServices/WebService.asmx?WSDL"",""wService"");
		}}


		function _CallIDDupCheck(inputID)
		{{
			//alert(document.getElementById('{1}').value);
			if (document.getElementById('{1}').value.length < 3)
			{{
				alert(""검사하기 원하는 ID를 3자이상 입력하세요."");
				return;
			}}
			if(Tcheck(document.getElementById('{1}'), ""회원아이디""))
				return;

			document.getElementById('marqeeIdCheckWaitMag').style.display = """";
			iCallID = joiningWebService.wService.callService(_UserIDCheckResults, ""MbrIDDuplicationCheck"", inputID);
			processedID = inputID;
		}}

		function _UserIDCheckResults(result)
		{{
			if(result.error)
			{{
				var xfaultcode   = result.errorDetail.code;
				var xfaultstring = result.errorDetail.string;
				var xfaultsoap   = result.errorDetail.raw;
				alert(""에러! : "" + xfaultcode + "" : "" + xfaultstring);
			}}
			else
			{{
				//alert(result.error);
				document.getElementById('marqeeIdCheckWaitMag').style.display = ""none"";
				if (result.value)
				{{
					alert(""이미 사용중인 ID 입니다."");
					var comObj = document.getElementById('{0}');
					comObj.valuetocompare = processedID;
				}}
				else
				{{
					alert(""사용가능한 ID입니다."");
					var comObj = document.getElementById('{0}');
					comObj.valuetocompare = """";
				}}
			}}
		}}


		function _CallIDDupCheck1(inputID)
		{{
			//alert(document.getElementById('{3}').value);
			if (document.getElementById('{3}').value.length < 3)
			{{
				alert(""검사하기 원하는 ID를 3자이상 입력하세요."");
				return;
			}}
			if(Tcheck(document.getElementById('{3}'), ""회원아이디""))
				return;

			document.getElementById('marqeeIdCheckWaitMag1').style.display = """";
			iCallID = joiningWebService.wService.callService(_UserIDCheckResults1, ""MbrIDDuplicationCheck"", inputID);
			processedID = inputID;
		}}

		function _UserIDCheckResults1(result)
		{{
			if(result.error)
			{{
				var xfaultcode   = result.errorDetail.code;
				var xfaultstring = result.errorDetail.string;
				var xfaultsoap   = result.errorDetail.raw;
				alert(""에러! : "" + xfaultcode + "" : "" + xfaultstring);
			}}
			else
			{{
				//alert(result.error);
				document.getElementById('marqeeIdCheckWaitMag1').style.display = ""none"";
				if (result.value)
				{{
					alert(""추천인 아이디가 존재합니다."");
					var comObj = document.getElementById('{2}');
					comObj.valuetocompare = processedID;
				}}
				else
				{{
					alert(""추천인 아이디가 존재하지 않습니다. 다시 입력하세요."");
					var comObj = document.getElementById('{2}');
					comObj.valuetocompare = """";
				}}
			}}
		}}


/*
		function _CallIZipAddrs(inputDong)
		{{
			//alert(inputDong);
			inputDong = inputDong + '';
			if (document.getElementById('txtInputDong').value == """")
			{{
				alert(""검색하기 원하는 읍,면,동 이름을 입력하세요~~"");
				return;
			}}
			document.getElementById('searchedAddrsTR').style.display = """";
			document.getElementById('marqeeWaitMag').style.display = """";
			iCallID = joiningWebService.wService.callService(_ZipAddrsResults, ""GetZipAddrs"", inputDong);
			processedDong = inputDong;
		}}



		function _ZipAddrsResults(result)
		{{
			if(result.error)
			{{
				var xfaultcode   = result.errorDetail.code;
				var xfaultstring = result.errorDetail.string;
				var xfaultsoap   = result.errorDetail.raw;
				alert(""에러! : "" + xfaultcode + ""  "" + xfaultstring);
			}}
			else
			{{
				//alert(result.value.length);

				var oSel = document.getElementById('selSearchedAddrs');
				//for (i=1; i<=oSel.options.length; i++)
				for (i=oSel.options.length; i>=1; i--)
				{{
					oSel.options[i] = null;
				}}

				if (result.value.length > 0)
				{{
					oSel.options[0] = new Option('------주소를 선택하세요------','');
					var aTemp;
					for (i=1; i<=result.value.length; i++)
					{{
						aTemp = result.value[i-1].split(""$"");
						oSel.options[i] = new Option(aTemp[1],aTemp[0]);
					}}
					oSel.disabled = false;
				}}
				else
				{{
					oSel.options[0] = new Option('------검색된 주소가 없습니다.------','');
					alert('검색된 주소가 없습니다.');
					oSel.disabled = true;
				}}

				oSel.style.display = """";
				document.getElementById('marqeeWaitMag').style.display = ""none"";
			}}
		}}

		function _selectSearchedAddrs()
		{{
			var oSel = document.getElementById('selSearchedAddrs');
			if (oSel.selectedIndex < 1) 
				return;
			var val = oSel.options[oSel.selectedIndex].value;
			var address = oSel.options[oSel.selectedIndex].text;
			var aZip = val.split(""-"");
			document.getElementById('{2}').value = address;
			document.getElementById('{3}').value = aZip[0];
			document.getElementById('{4}').value = aZip[1];
			document.getElementById('{5}').focus();
		}}
*/
	//-->
</script>
";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            //App_Code.CompanyMgr.Staff.StfBaseLib.Self.LoginOK();
            //JinsLibrary.ADMIN.AdminLib.Self.AccessOnlyForLocalWorking();

            if (Request.QueryString["mode"] != "u") //입력인경우
            {
                //페이지타이틀설정
                litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("mbi");

                //자바스크립트 및 웹서비스
                JinsLibrary.ClientAction.RegisterOnloadFunction(Page, "_joiningWebServiceInit()");
                joiningWebServiceBehaviorScript = String.Format(joiningWebServiceBehaviorScript, new String[] { revLoginID.ClientID, loginID.ClientID, revRcmderID.ClientID, rcmderID.ClientID, "0", "0" });
                Page.RegisterClientScriptBlock("_joiningWebServiceBehaviorScript", joiningWebServiceBehaviorScript);
                
                //초기화
                InitializeSetting();
                if (!Page.IsPostBack)
                {
                    //버튼제거
                    ibUpdate.Visible = false;
                    this.ddlMLevel.Visible = false;
                    //컨트롤초기화
                    this.InitializeControls();
                    //회원
                    bnLoginID.Attributes["OnClick"] = "_CallIDDupCheck(document.getElementById('" + loginID.ClientID + "').value)";
                    //추천인
                    bnRcmderID.Attributes["OnClick"] = "_CallIDDupCheck1(document.getElementById('" + rcmderID.ClientID + "').value)";
                }
            }
            else	//수정인경우
            {
                //페이지타이틀설정
                litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("mbu");

                //권한체크
                if (!MbrBaseLib.Self.CanAccess(string.Empty))
                    ClientAction.ShowMsgBack("해당 권한이 없습니다.");
                this._mbID = Request.QueryString["mbID"];
                if (this._mbID != "")
                {
                    //초기화
                    InitializeSetting();
                    if (!Page.IsPostBack)
                    {
                        //입력버튼제거
                        ibInsert.Visible = false;

                        //컨트롤초기화
                        this.InitializeControls();
                        //바인딩
                        if (!this.MemberFormBind())
                        {
                            ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
                        }
                    }
                }
                else
                    ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");
            }
        }

        //셋팅초기화
        private void InitializeSetting()
        {
            //자바스크립트 파일의 등록
            if (!Page.ClientScript.IsClientScriptIncludeRegistered(this.GetType(), "Function"))
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Function", "/CommonLibrary/Function.js");
            if (!Page.ClientScript.IsClientScriptIncludeRegistered(this.GetType(), "MemberShip"))
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "MemberShip", "/CommonApps/MemberShip/MemberShip.js");
            if (!Page.ClientScript.IsClientScriptIncludeRegistered(this.GetType(), "radio"))
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "radio", "/CommonLibrary/Objects/radio.js");
            if (!Page.ClientScript.IsClientScriptIncludeRegistered(this.GetType(), "popcalendar"))
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "popcalendar", "/CommonApps/Calendar/DateSelector/popcalendar.js");
        }

        //라운드트립에서 상태값을 가질 수 있는 콘트롤
        private void InitializeControls()
        {
            URLQuery.Self.SetQueryString();
            URLQuery.Self.Remove("mode");

            //리스트가 어디로 갈것인가
            hlList.NavigateUrl = MbrBaseLib.Self.GetWhichList(Request.QueryString["ml"]);

            //주소찾기버튼
            hlSeekAddr.Attributes["OnClick"] = "WindowOpen('../../CommonApps/PostSeek/PostSeek.aspx','memberZip','scrollbars=yes,resizable=yes')";
            hlSeekAddr.Style.Add("CURSOR", "hand");
            hlSeekOAddr.Attributes["OnClick"] = "WindowOpen('../../CommonApps/PostSeek/PostSeek.aspx','officeZip','scrollbars=yes,resizable=yes')";
            hlSeekOAddr.Style.Add("CURSOR", "hand");

            //아바타이미지 미리보기
            bnAvataImage.Attributes["onChange"] = "javascript:ImagePreview(this, 'AvataImage',260,300);";

            //권한직접입력 인증
            if (Cookie.Self["DeptName"] == "기획/관리" && Convert.ToInt16(Cookie.Self["sLevel"]) >= 30)
                findingA.Visible = true;

            //직원생일
            string scriptStr = "javascript:return popUpCalendar(this," + tbBirthDay.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + tbBirthDay.ClientID + @"\')')";
            tbBirthDay.Attributes["OnClick"] = "blur();"; //OnClientClick 안됨
            tbBirthDay.Attributes.Add("ReadOnly", "ReadOnly");
            dSelectorBirth.ImgCalendar.Attributes["OnClick"] = scriptStr;
            dSelectorBirth.ImgReset.Attributes["onClick"] = "javascript:" + tbBirthDay.ClientID + ".value = '';ResetRadioBox(" + rblSLBirth.ClientID + ");";

            //결혼기념일
            scriptStr = "javascript:return popUpCalendar(this," + tbWeddingDay.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + tbWeddingDay.ClientID + @"\')')";
            tbWeddingDay.Attributes["onClick"] = "blur();"; //OnClientClick 안됨
            tbWeddingDay.Attributes.Add("ReadOnly", "ReadOnly");
            tbWeddingDay.Attributes["onpropertychange"] = "rblMarried_1.checked=true;";
            dSelectorWedding.ImgCalendar.Attributes["onClick"] = scriptStr;
            dSelectorWedding.ImgReset.Attributes["onClick"] = "javascript:" + tbWeddingDay.ClientID + ".value = '';ResetRadioBox(" + rblMarried.ClientID + ");";
            rblMarried.Attributes["onClick"] = "javascript:if(rblMarried_1.checked){pnWA.style.display='block' ;}else{pnWA.style.display='none';}";
            
            rblMarried.Attributes["onClick"] = "javascript:if(rblMarried_1.checked){pnWA.style.display='block' ;}else{pnWA.style.display='none';}";
            //ibUpdate.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";생각해보장....
            btnSSN.Attributes["onClick"] = "if(CheckNumbers(this.form)) alert('바른 주민등록번호입니다.');";


            //-------------------드랍다운리스트 엘리먼트채우기
            //모바일서비스넘버
            JinsLibrary.CONTROL.Util.GetMobileNo(ref cellularP1);
            //아이디/패스워드 힌트문제
            SortedList mySL = JinsLibrary.XML.XmlLib.Self.GetResxList("/App_Data/resx/FindingMbrInfo.resx");
            JinsLibrary.CONTROL.Util.DDLAddItem(ref findingID, mySL);
            //취미
            mySL = JinsLibrary.XML.XmlLib.Self.GetResxList("/App_Data/resx/Hobbies.resx");
            Util.CBLAddItem(ref hobbies, mySL);
            //월급
            mySL = JinsLibrary.XML.XmlLib.Self.GetResxList("/App_Data/resx/MonthlyPay.resx");
            Util.DDLAddItem(ref monthlyPay, mySL);
            //자동차정보
            mySL = JinsLibrary.XML.XmlLib.Self.GetResxList("/App_Data/resx/CarInfo.resx");
            Util.DDLAddItem(ref carInfo, mySL);
            //직업정보
            ArrayList arrayList = TableConfig.GetOnlyValues("Jobs_root");
            this.jobType.Items.AddRange(JinsLibrary.CONTROL.Util.GetListItems(arrayList));

            //백버튼
            hlBack.NavigateUrl = "javascript:history.back();";
        }

        #region 회원데이터 바인딩
        private Boolean MemberFormBind()
        {
            _dbUtil = new DBLib();
            string qryString = "Select member_id,loginID,loginPW,MbrName,MbrEmail,phone,cellularP,zipcode,address,findingID,findingA,SSN,newsLetter"
                + " FROM t_Member WHERE member_id=" + _mbID;
            qryString += ";Select mLevel,howMuch,howMany,RFund,RFundAC,point,pointAC,unpaid,unpaidAC,rcmderID,joinDT,recentLogin,IPaddress,leaveDT"
                + " FROM t_MemberValue WHERE member_id=" + _mbID;
            qryString += ";Select homepage,messenger,hobbies,carInfo,children,avataImage,monthlyPay,mark"
                + " FROM t_MemberOption WHERE member_id=" + _mbID;
            qryString += ";Select company,jobType,officeP,zipcode,address"
                + " FROM t_MemberJob WHERE member_id=" + _mbID;
            qryString += ";Select annGroup,itemFlag,annDate FROM t_Anniversary WHERE (annGroup BETWEEN 200 AND 220) AND item_id=" + _mbID;

            SqlDataReader drMember;
            drMember = _dbUtil.MyExecuteReader(qryString);
            if (drMember.Read())			//기본정보
            {
                string[] arrTemp;
                this.member_id.Text = drMember["member_id"].ToString();
                if (Convert.ToInt32(this.member_id.Text) > 0)
                    cbProMbr.Checked = false;
                else
                    cbProMbr.Checked = true;
                cbProMbr.Enabled = false;//수정안됨.
                this.loginID.Text = drMember["loginID"].ToString();
                loginID.ReadOnly = true;
                loginID.BorderStyle = BorderStyle.None;
                bnLoginID.Visible = false;
                this.loginPW.Text = drMember["loginPW"].ToString();
                this.MbrName.Text = drMember["MbrName"].ToString();
                arrTemp = drMember["phone"].ToString().Split('-');
                if (arrTemp.Length > 0)
                {
                    this.phone1.Text = arrTemp[0];
                    this.phone2.Text = arrTemp[1];
                    this.phone3.Text = arrTemp[2];
                    arrTemp = null;
                }
                arrTemp = drMember["cellularP"].ToString().Split('-');
                if (arrTemp.Length > 0)
                {
                    Util.DDLFindByText(ref cellularP1, arrTemp[0]);
                    this.cellularP2.Text = arrTemp[1];
                    this.cellularP3.Text = arrTemp[2];
                    if (arrTemp[0] != "")
                        cellularP1.Items.RemoveAt(0);
                    arrTemp = null;
                }
                this.MbrEmail.Text = drMember["MbrEmail"].ToString();
                arrTemp = drMember["SSN"].ToString().Split('-');
                if (arrTemp.Length > 0)
                {
                    this.SSN1.Text = arrTemp[0];
                    this.SSN2.Text = arrTemp[1];
                    arrTemp = null;
                }
                this.zipcode.Text = drMember["zipcode"].ToString();
                arrTemp = drMember["address"].ToString().Split('|');
                if (arrTemp.Length > 1)
                {
                    this.mAddress1.Text = arrTemp[0];
                    this.mAddress2.Text = arrTemp[1];
                    arrTemp = null;
                }
                if (Convert.ToBoolean(drMember["newsLetter"]))
                    this.newsLetter.Checked = true;
                else
                    this.newsLetter.Checked = false; ;

                //아이디/패스워드 잊어 버렸을 때 QnA.
                Util.DDLFindByValue(ref findingID, drMember["findingID"].ToString());
                if (drMember["findingID"].ToString() != "")
                    findingID.Items.RemoveAt(0);
                this.findingA.Text = drMember["findingA"].ToString();

                if (drMember.NextResult())	//평가치
                {
                    drMember.Read();
                    this.rcmderID.Text = drMember["rcmderID"].ToString();
                    rcmderID.ReadOnly = true;
                    rcmderID.BorderStyle = BorderStyle.None;
                    rcmderID.ToolTip = "수정할 수 없습니다.";
                    bnRcmderID.Visible = false;
                    Util.DDLFindByValue(ref ddlMLevel, drMember["mLevel"].ToString());
                    /*					
                                        this.howMuch.Text = MathLib.GetComma(drMember["howMuch"]);
                                        this.howMany.Text = MathLib.GetComma(drMember["howMany"]);
                                        this.RFund.Text = MathLib.GetComma(drMember["RFund"]);
                                        this.RFundAC.Text = MathLib.GetComma(drMember["RFundAC"]);
                                        this.point.Text = MathLib.GetComma(drMember["point"]);
                                        this.pointAC.Text = MathLib.GetComma(drMember["pointAC"]);
                                        this.unpaid.Text = MathLib.GetComma(drMember["unpaid"]);
                                        this.unpaidAC.Text = MathLib.GetComma(drMember["unpaidAC"]);
                                        this.joinDT.Text = drMember["joinDT"].ToString();
                                        this.recentLogin.Text = drMember["recentLogin"].ToString();
                                        this.IPaddress.Text = drMember["IPaddress"].ToString();
                                        this.leaveDT.Text = drMember["leaveDT"].ToString();	
                    */
                }

                if (drMember.NextResult())	//부가정보
                {
                    if (drMember.Read())
                    {
                        //파일 보존 체크박스처리
                        if (drMember["avataImage"].ToString() != "")
                        {
                            cbDeleteAI.Visible = true;
                            cbDeleteAI.ToolTip = drMember["avataImage"].ToString();

                            this.avataImage.ImageUrl = SystemConfig.GetValue("MemberPicUploadDir") + drMember["avataImage"].ToString();
                            this.avataImage.Style["cursor"] = "hand";
                            this.avataImage.Attributes["OnClick"] = "javascript:ZoomWindowOpen('" + this.avataImage.ImageUrl + "','avaPic','');";

                            //이미지 리사이즈
                            JinsLibrary.IMAGE.ImageLib.Self.ImageResize(ref avataImage, 260, 300);
                        }
                        this.homepage.Text = drMember["homepage"].ToString();
                        arrTemp = drMember["messenger"].ToString().Split('|');
                        if (arrTemp.Length > 1)
                        {
                            this.MsgName.Text = arrTemp[0];
                            this.MsgID.Text = arrTemp[1];
                        }
                        Util.CBLFindByText(ref hobbies, drMember["hobbies"].ToString().Split(';'));
                        Util.DDLFindByValue(ref monthlyPay, drMember["monthlyPay"].ToString());
                        if (drMember["monthlyPay"].ToString() != "")
                            monthlyPay.Items.RemoveAt(0);
                        Util.DDLFindByValue(ref carInfo, drMember["carInfo"].ToString());
                        if (drMember["carInfo"].ToString() != "")
                            carInfo.Items.RemoveAt(0);
                        this.children.Text = drMember["children"].ToString();
                        this.mark.Text = drMember["mark"].ToString();
                    }
                }
                if (drMember.NextResult())	//회사정보
                {
                    if (drMember.Read())
                    {
                        this.company.Text = drMember["company"].ToString();
                        Util.DDLFindByText(ref jobType, drMember["jobType"].ToString());
                        if (drMember["jobType"].ToString() != "")
                            jobType.Items.RemoveAt(0);
                        arrTemp = drMember["officeP"].ToString().Split('-');
                        if (arrTemp.Length > 0)
                        {
                            //Util.DDLFindByText(ref cellularP1, arrTemp[0].ToString());
                            this.officeP1.Text = arrTemp[0];
                            this.officeP2.Text = arrTemp[1];
                            this.officeP3.Text = arrTemp[2];
                            arrTemp = null;
                        }
                        this.oZipcode.Text = drMember["zipcode"].ToString();
                        arrTemp = drMember["address"].ToString().Split('|');
                        if (arrTemp.Length > 1)
                        {
                            this.oAddress1.Text = arrTemp[0];
                            this.oAddress2.Text = arrTemp[1];
                            arrTemp = null;
                        }
                    }
                }
                if (drMember.NextResult())	//기념일 셋팅
                {
                    while (drMember.Read())
                    {
                        //Response.Write( drMember["itemFlag"].ToString());
                        switch (Convert.ToInt32(drMember["annGroup"]))
                        {
                            case 200:		//생일
                                Util.RBLFindByValue(ref rblSLBirth, drMember["itemFlag"].ToString());
                                if (drMember["annDate"].ToString() != "")
                                    this.tbBirthDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
                                break;
                            case 210:		//결혼기념일(양력없음)	-->기혼 미혼 셋팅
                                Util.RBLFindByValue(ref rblMarried, drMember["itemFlag"].ToString());
                                if (rblMarried.SelectedValue == "기")
                                {
                                    if (drMember["annDate"].ToString() != "")
                                        this.tbWeddingDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
                                }
                                break;
                        }
                    }
                }
                //DR,DB닫기
                drMember.Close();
                _dbUtil.SqlConnection.Close();
                return true;
            }
            else
                return false;
        }
        #endregion

        private void CommonInsertUpdate()
        {
            Page.Validate();
            if (!Page.IsValid)
                ClientAction.ShowMsgBack("정확히 입력하세요.");

            _mbr = new MbrBase();
            _mbr.loginPW = HTML.ReplaceToDB(loginPW.Text);
            _mbr.MbrName = HTML.ReplaceToDB(MbrName.Text);
            _mbr.phone = HTML.ReplaceToDB(phone1.Text) + "-" + HTML.ReplaceToDB(phone2.Text) + "-" + HTML.ReplaceToDB(phone3.Text);
            _mbr.cellularP = cellularP1.SelectedItem.Text + "-" + HTML.ReplaceToDB(cellularP2.Text) + "-" + HTML.ReplaceToDB(cellularP3.Text);
            _mbr.MbrEmail = HTML.ReplaceToDB(MbrEmail.Text);
            _mbr.SSN = HTML.ReplaceToDB(SSN1.Text) + "-" + HTML.ReplaceToDB(SSN2.Text);
            _mbr.zipcode = HTML.ReplaceToDB(zipcode.Text);
            _mbr.address = HTML.ReplaceToDB(mAddress1.Text) + "|" + HTML.ReplaceToDB(mAddress2.Text);
            _mbr.newsLetter = Text.BoolToOneZero(newsLetter.Checked);
            _mbr.findingID = findingID.SelectedValue;
            _mbr.findingA = HTML.ReplaceToDB(findingA.Text);
            _mbr.rcmderID = HTML.ReplaceToDB(rcmderID.Text);
            if (pnAdditionalInfo.Visible)
            {
                _mbr.homepage = HTML.ReplaceToDB(homepage.Text);
                _mbr.monthlyPay = monthlyPay.SelectedValue;
                _mbr.carInfo = carInfo.SelectedValue;
                _mbr.SLBirth = rblSLBirth.SelectedValue;
                _mbr.BirthDay = tbBirthDay.Text;
                _mbr.Married = rblMarried.SelectedValue;	//음력결혼이라....
                _mbr.WeddingDay = tbWeddingDay.Text;
                //Response.Write("tbWeddingDay.Text= " + tbWeddingDay.Text +"<br>");
                _mbr.children = HTML.ReplaceToDB(children.Text);
                _mbr.messenger = MsgName.Text + "|" + MsgID.Text;
                _mbr.hobbies = Util.CBLSelectedValues(ref hobbies, ";");
                _mbr.mark = HTML.ReplaceToDB(mark.Text);
                _mbr.company = HTML.ReplaceToDB(company.Text);
                _mbr.jobType = jobType.SelectedValue;
                _mbr.officeP = HTML.ReplaceToDB(officeP1.Text) + "-" + HTML.ReplaceToDB(officeP2.Text) + "-" + HTML.ReplaceToDB(officeP3.Text);
                _mbr.oZipcode = oZipcode.Text;
                _mbr.oAddress = oAddress1.Text + "|" + HTML.ReplaceToDB(oAddress2.Text);
                //mbr.mLevel			= 2;		//우수회원
            }
            else
            {
                //mbr.mLevel			= 1;		//정회원
            }
            _mbr.IPaddress = Request.UserHostAddress;
        }
        private void ibInsert_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            //Response.Write(Text.BoolToOneZero(cbProMbr.Checked));
            ibInsert.Enabled = false;
            //아디디 중복되나 최종확인
            if (MbrBaseLib.Self.LoginID_Exist(loginID.Text))
                ClientAction.ShowMsgBack("입력하신 아이디는 존재합니다. 중복확인을 하세요.");

            //데이타 충전
            //공통부분///////////
            CommonInsertUpdate();
            /////////////////////
            _mbr.member_id = -1; //적용안됨//dbUtil.GetNextNumber("t_Members", "member_id", 100);
            _mbr.loginID = HTML.ReplaceToDB(loginID.Text);
            _mbr.rcmderID = HTML.ReplaceToDB(rcmderID.Text);
            _mbr.cbProMbr = Text.BoolToOneZero(cbProMbr.Checked);

            //DB업데이트
            bool up_result = true; //파일업로드 결과
            int sp_result = _mbr.member_id = _mbr.Insert();
            //부가정보.
            if (pnAdditionalInfo.Visible)
            {
                if (bnAvataImage.PostedFile.ContentLength > 0 && bnAvataImage.PostedFile.ContentLength < 256000)
                {
                    _mbr.avataImage = "AvaPic_" + _mbr.member_id.ToString() + FileLib.Self.GetExtention(bnAvataImage.Value);
                    cbDeleteAI.ToolTip = "ok";
                }
                else
                    _mbr.avataImage = "";
                //부가정보저장.
                sp_result = _mbr.Insert_OptionJob();
                //파일업로드
                up_result = this.UploadFiles();
            }
            if (sp_result != 0)
            {
                //회원수를 업데이트한다.
                this.UpdateAllMembersNumber();
                if (up_result == false)
                {
                    ClientAction.ShowMsgAndGoUrl("이미지파일이 아닙니다!! 다시 수정업로드하세요. \\n[가능한 확장자 : " + ImageLib.Self.imagesExtsForWeb + "]", "MbrView.aspx?" + URLQuery.Self.GetQueryString());
                }
                ClientAction.ShowMsgAndGoUrl("정상적으로 입력되었습니다.", " MbrList.aspx?" + URLQuery.Self.GetQueryString());
            }
            else
                ClientAction.ShowMsgAndGoUrl("입력작업이 실패했습니다." + "Code:" + sp_result, "MbrView.aspx?" + URLQuery.Self.GetQueryString());
        }
        private void ibUpdate_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ibUpdate.Enabled = false;
            //데이타 충전
            //공통부분///////////
            CommonInsertUpdate();
            /////////////////////
            _mbr.member_id = Convert.ToInt32(member_id.Text);
            _mbr.loginID = "";		//해당사항없음

            //DB업데이트
            bool up_result = true; //파일업로드 결과
            int sp_result = _mbr.Update();
            //부가정보.
            if (pnAdditionalInfo.Visible)
            {
                if (cbDeleteAI.Checked)
                {
                    _mbr.avataImage = "";
                }
                else if (bnAvataImage.PostedFile.ContentLength > 0 && bnAvataImage.PostedFile.ContentLength < 256000)
                {
                    _mbr.avataImage = "AvaPic_" + _mbr.member_id.ToString() + FileLib.Self.GetExtention(bnAvataImage.Value);
                    cbDeleteAI.ToolTip = "ok";
                }
                else
                {
                    _mbr.avataImage = cbDeleteAI.ToolTip;
                }
                //부가정보저장.
                sp_result = _mbr.Insert_OptionJob();
                //파일업로드
                up_result = this.UploadFiles();
            }
            if (sp_result != 0)
            {
                //회원수를 업데이트한다.
                this.UpdateAllMembersNumber();
                if (!up_result)
                {
                    ClientAction.ShowMsgAndGoUrl("이미지파일이 아닙니다!! 다시 수정업로드하세요. \\n[가능한 확장자 : " + ImageLib.Self.imagesExtsForWeb + "]", "MbrView.aspx?" + URLQuery.Self.GetQueryString());
                }
                ClientAction.ShowMsgAndGoUrl("정상적으로 수정되었습니다.", MbrBaseLib.Self.GetWhichList(Request.QueryString["ml"]) + "?" + URLQuery.Self.GetQueryString());
            }
            else
                ClientAction.ShowMsgAndGoUrl("수정작업이 실패했습니다." + "Code:" + sp_result, "MbrView.aspx?" + URLQuery.Self.GetQueryString());
        }
        //파일관련 업로드
        private bool UploadFiles()
        {
            string memberPicUploadDir = SystemConfig.GetValue("MemberPicUploadDir");
            if (cbDeleteAI.Checked)		//삭제체크박스가 선택된 케이스
            {
                //관련이미지 이동(이미 검증되었기 때문에 파일세이브)
                FileLib.Self.FileMoveTo(memberPicUploadDir + cbDeleteAI.ToolTip, memberPicUploadDir + "Avata.bak/" + cbDeleteAI.ToolTip);
            }
            else if (cbDeleteAI.ToolTip == "ok")
            {
                //먼저 이미지 파일인가를 확인한다.
                if (!FileLib.Self.IsImageFileExts(bnAvataImage))
                    return false;
                //관련이미지 이동(이미 검증되었기 때문에 파일세이브)
                FileLib.Self.FileMoveTo(memberPicUploadDir + cbDeleteAI.ToolTip, memberPicUploadDir + "Avata.bak/" + cbDeleteAI.ToolTip);
                //저장
                FileLib.Self.FileSave(bnAvataImage, memberPicUploadDir, FileLib.Self.GetFileNameWithoutExtension(_mbr.avataImage));
            }
            else	//업로드과정이 실행되지 않음.... 용량이 많거나 처리할 필요가 없을 때.
            {
                if (bnAvataImage.PostedFile.ContentLength >= 255000)
                    ClientAction.ShowInfoMsg("이미지 용량이 256K 이상이므로 업로드되지 않았습니다.");
            }
            return true;
        }
        //회원수를 업데이트한다.
        private void UpdateAllMembersNumber()
        {
            _dbUtil = new DBLib();
            AppVariable.Self["AllMembersNumber"] = _dbUtil.GetRecordCount("t_MemberValue", "leaveDT IS  null Or leaveDT = ''").ToString();
            _dbUtil.SqlConnection.Close();
            //ClientAction.ShowInfoMsg(AppVariable.Self["AllMembersNumber"].ToString());
        }

        protected void ibAdditionalInfo_Click(object sender, ImageClickEventArgs e)
        {
            if (pnAdditionalInfo.Visible)
                pnAdditionalInfo.Visible = false;
            else
            {
                pnAdditionalInfo.Visible = true;
                if (rblMarried.SelectedValue == "미")
                    ClientAction.WriteJavascript(this, "pnWA", "pnWA.style.display='none';");
            }

        }
    }
}