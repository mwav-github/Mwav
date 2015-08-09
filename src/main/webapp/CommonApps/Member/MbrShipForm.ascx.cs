namespace KistelSite.CommonApps.MemberShip
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Collections;

	using JinsLibrary;
	using JinsLibrary.CONFIG;
	using JinsLibrary.CONTROL;	
	using JinsLibrary.STATEMANAGE;

	using MiddleTier.Member;


	/// <summary>
	///		MbrShipForm에 대한 요약 설명입니다.
	/// </summary>
	public class MbrShipForm : System.Web.UI.UserControl
	{
		private MbrBaseLib mbl;
		private DBLib dbUtil;
		private string mId; 
		protected System.Web.UI.UserControl	DateSelector1;
		protected System.Web.UI.UserControl	DateSelector2;

		protected System.Web.UI.WebControls.TextBox phone;
		protected System.Web.UI.WebControls.TextBox findingA;
		protected System.Web.UI.WebControls.TextBox mark;
		protected System.Web.UI.WebControls.TextBox company;
		protected System.Web.UI.WebControls.TextBox officeP;
		protected System.Web.UI.WebControls.ImageButton ibInsert;
		protected System.Web.UI.WebControls.ImageButton ibUpdate;
		protected System.Web.UI.WebControls.HyperLink hlList;
		protected System.Web.UI.WebControls.HyperLink hlBack;
		protected System.Web.UI.WebControls.Label member_id;
		protected System.Web.UI.WebControls.HyperLink hlSeekAddr;
		protected System.Web.UI.WebControls.DropDownList findingID;
		protected System.Web.UI.WebControls.RegularExpressionValidator revLoginID;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator11;
		protected System.Web.UI.HtmlControls.HtmlInputButton bnLoginID;
		protected System.Web.UI.WebControls.TextBox loginID;
		protected System.Web.UI.WebControls.RegularExpressionValidator Regularexpressionvalidator4;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator12;
		protected System.Web.UI.WebControls.TextBox loginPW;
		protected System.Web.UI.WebControls.TextBox MbrName;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator3;
		protected System.Web.UI.WebControls.RequiredFieldValidator Requiredfieldvalidator4;
		protected System.Web.UI.WebControls.TextBox MbrEmail;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator6;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator5;
		protected System.Web.UI.WebControls.TextBox SSN2;
		protected System.Web.UI.WebControls.TextBox SSN1;
		protected System.Web.UI.HtmlControls.HtmlInputButton btnSSN;
		protected System.Web.UI.WebControls.CheckBox newsLetter;
		protected System.Web.UI.WebControls.TextBox homepage;
		protected System.Web.UI.WebControls.TextBox MsgName;
		protected System.Web.UI.WebControls.CheckBoxList hobbies;
		protected System.Web.UI.WebControls.DropDownList carInfo;
		protected System.Web.UI.WebControls.TextBox children;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
		protected System.Web.UI.WebControls.CheckBox cbDeleteAI;
		protected System.Web.UI.HtmlControls.HtmlInputFile bnAvataImage;
		protected System.Web.UI.WebControls.DropDownList monthlyPay;
		protected System.Web.UI.WebControls.TextBox MsgID;
		protected System.Web.UI.WebControls.TextBox rcmderID;
		protected System.Web.UI.WebControls.RegularExpressionValidator revRcmderID;
		protected System.Web.UI.HtmlControls.HtmlInputButton bnRcmderID;
		protected System.Web.UI.WebControls.HyperLink hlSeekOAddr;
		protected System.Web.UI.WebControls.TextBox mZipcode;
		protected System.Web.UI.WebControls.TextBox mAddress1;
		protected System.Web.UI.WebControls.TextBox mAddress2;
		protected System.Web.UI.WebControls.TextBox oAddress1;
		protected System.Web.UI.WebControls.TextBox oAddress2;
		protected System.Web.UI.WebControls.TextBox oZipcode;
		protected System.Web.UI.WebControls.Image avataImage;
		protected System.Web.UI.WebControls.TextBox tbBirthDay;
		protected System.Web.UI.WebControls.RadioButtonList rblSLBirth;
		protected System.Web.UI.WebControls.RadioButtonList rblMarried;
		protected System.Web.UI.WebControls.TextBox tbWeddingDay;
		protected System.Web.UI.WebControls.DropDownList jobType;
		protected System.Web.UI.WebControls.TextBox cellularP3;
		protected System.Web.UI.WebControls.TextBox cellularP2;
		protected System.Web.UI.WebControls.DropDownList cellularP1;
		protected System.Web.UI.WebControls.Literal mLevel;
		protected System.Web.UI.WebControls.Literal howMany;
		protected System.Web.UI.WebControls.Literal howMuch;
		protected System.Web.UI.WebControls.Literal RFundAC;
		protected System.Web.UI.WebControls.Literal RFund;
		protected System.Web.UI.WebControls.Literal pointAC;
		protected System.Web.UI.WebControls.Literal point;
		protected System.Web.UI.WebControls.Literal unpaid;
		protected System.Web.UI.WebControls.Literal unpaidAC;
		protected System.Web.UI.WebControls.Literal joinDT;
		protected System.Web.UI.WebControls.Literal recentLogin;
		protected System.Web.UI.WebControls.Literal IPaddress;
		protected System.Web.UI.WebControls.Literal leaveDT;
		protected System.Web.UI.WebControls.Literal modifyDT;
		

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
	//-->
</script>
";
		#endregion

		
		private void Page_Load(object sender, System.EventArgs e)
		{
			this.mId = Request.QueryString["mId"];
			if(Text.IsNullOrEmpty(this.mId))	// Insert Case
			{

				Response.Write("There is an input!! " + "<br>");
	
			}
			else				// Update Case
			{
				if(!Page.IsPostBack) 
				{					
					//Login check
					//MiddleTier.Member.MbrBaseBiz.MbrLoginOK();

					//Remove an input button
					ibInsert.Visible = false;
					
					//Initializing
					this.SettingInitialize();
					
					
					//Fill out an element of dropdownlist
					DDLElementsInitialize();
					//바인딩
					if(!this.MemberFormBind("basic"))
					{
						ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
					}
				}	
			}

			//else
			//	ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");
/*
			if(Request.QueryString["mode"] != "u") 
			{
				//자바스크립트 및 웹서비스
				JinsLibrary.ClientAction.RegisterOnloadFunction(Page, "_joiningWebServiceInit()");
				joiningWebServiceBehaviorScript = String.Format(joiningWebServiceBehaviorScript, new String[] { revLoginID.ClientID, loginID.ClientID, revRcmderID.ClientID, rcmderID.ClientID, "0","0" });
				Page.RegisterClientScriptBlock("_joiningWebServiceBehaviorScript", joiningWebServiceBehaviorScript);
				if(!Page.IsPostBack) 
				{	
					//버튼제거
					ibUpdate.Visible = false;
					//this.ddlMLevel.Visible = false;
					//초기화
					//this.SettingInitialize();
					this.DDLElementsInitialize();
					//회원
					bnLoginID.Attributes["OnClick"] = "_CallIDDupCheck(document.getElementById('" + loginID.ClientID + "').value)";
					//추천인
					bnRcmderID.Attributes["OnClick"] = "_CallIDDupCheck1(document.getElementById('" + rcmderID.ClientID + "').value)";
				}
			}
			else	//수정인경우
			{	
				//권한체크
				//if(!MbrBaseLib.CanAccess(string.Empty))
				//	ClientAction.ShowMsgBack("해당 권한이 없습니다.");
				this.mId = Request.QueryString["mbID"];
				if(this.mId != "")
				{
					if(!Page.IsPostBack) 
					{					
						//입력버튼제거
						ibInsert.Visible = false;
					
						//초기화
						//this.SettingInitialize();
						//드랍다운리스트 엘리먼트채우기
						DDLElementsInitialize();
						//바인딩
						//if(!this.MemberFormBind())
						//{
						//	ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
						//}
					}	
				}
				else
					ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");
			}
			
*/
		}
		//셋팅초기화
		private void SettingInitialize()
		{
			URLQuery.Self.SetQueryString();
//URLQuery.Self.Remove("mode");
		
//리스트가 어디로 갈것인가
//hlList.NavigateUrl =  base.GetWhichList(Request.QueryString["ml"]);
			
			//주소찾기버튼 (us->사용자사이트)
			hlSeekAddr.Attributes["OnClick"] = "WindowOpen('/CommonApps/PostSeek/PostSeek.aspx','usMemberZip','scrollbars=yes,resizable=yes')";
			hlSeekAddr.Style.Add("CURSOR", "hand");
			hlSeekOAddr.Attributes["OnClick"] = "WindowOpen('/CommonApps/PostSeek/PostSeek.aspx','usOfficeZip','scrollbars=yes,resizable=yes')";
			hlSeekOAddr.Style.Add("CURSOR", "hand");
			
			//아바타이미지 미리보기
			bnAvataImage.Attributes["onChange"] = "javascript:ImagePreview(this, '"+ avataImage.ClientID +"',260,300);";


//권한직접입력 인증
//if(Cookie.Self["DeptName"] == "기획/관리" && Convert.ToInt16(Cookie.Self["sLevel"]) >= 30) 
//findingA.Visible = true;

			//DateTimePicker1
			KistelSite.CommonApps.Calendar.DateSelector.DateSelector dSelector = (KistelSite.CommonApps.Calendar.DateSelector.DateSelector)DateSelector1;
			string scriptStr = "javascript:return popUpCalendar(this," + tbBirthDay.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + tbBirthDay.ClientID + @"\')')";
			dSelector.imgCalendar.Attributes["OnClick"] = scriptStr;
			dSelector.imgReset.Attributes["OnClick"] = "javascript:" + tbBirthDay.ClientID + ".value = '';ResetRadioBox(" + rblSLBirth.ClientID + ");";
			//DateTimePicker2
			dSelector = (KistelSite.CommonApps.Calendar.DateSelector.DateSelector)DateSelector2;
			scriptStr = "javascript:return popUpCalendar(this," + tbWeddingDay.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + tbWeddingDay.ClientID + @"\')')";
			dSelector.imgCalendar.Attributes["OnClick"] = scriptStr;
			dSelector.imgReset.Attributes["OnClick"] = "javascript:" + tbWeddingDay.ClientID + ".value = '';ResetRadioBox(" + rblMarried.ClientID + ");";
			
////////////////////rblMarried.Attributes["onClick"] =  "javascript:if(rblMarried_1.checked){pnWA.style.display='block' ;}else{pnWA.style.display='none';}";
			
			//ibUpdate.Attributes["onClick"] = "return ConfirmJ('수정하시겠습니까?');";생각해보장....
			btnSSN.Attributes["onClick"] = "if(CheckNumbers(this.form)) alert('바른 주민등록번호입니다.');";
		}
	

		//드랍다운리스트 엘리먼트채우기
		private void DDLElementsInitialize()
		{
			string mbrDirPath = "/Admins/Members/";
			//모바일서비스넘버
			JinsLibrary.CONTROL.Util.GetMobileNo(ref cellularP1);
			//아이디/패스워드 힌트문제
			SortedList mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "FindingMbrInfo.resx");
			JinsLibrary.CONTROL.Util.DDLAddItem(ref findingID, mySL);
			//취미
			mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "Hobbies.resx");
			Util.CBLAddItem(ref hobbies, mySL);
			//월급
			mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "MonthlyPay.resx");
			Util.DDLAddItem(ref monthlyPay, mySL);
			//자동차정보
			mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList(mbrDirPath + "CarInfo.resx");
			Util.DDLAddItem(ref carInfo, mySL);
			//직업정보
			ArrayList arrayList = TableConfig.GetOnlyValues("Jobs_root");
			this.jobType.Items.AddRange(JinsLibrary.CONTROL.Util.GetListItems(arrayList));
		}		


		#region 기본회원데이터 바인딩
		private Boolean MemberFormBind(string tableName)
		{			
			DataSet dsMbr;
			DataRow dRow;
			string [] arrTemp;
			mbl = new  MbrBaseLib();
			
			
			////Basic Information.
			dsMbr =	mbl.GetMbrBasicInfo( Convert.ToInt32(mId) );

	Response.Write(dsMbr.Tables[0].DesignMode + "<br>");
	Response.Write(dsMbr.ToString() + "<br>");
	Response.Write(dsMbr.HasErrors.ToString() + "<br>");
	Response.Write(dsMbr.Tables[0].Rows[0]["MbrName"] + "<br>");
			
			dRow = dsMbr.Tables[0].Rows[0];
			this.member_id.Text		= dRow["member_id"].ToString();
			this.loginID.Text		= dRow["loginID"].ToString();
			loginID.ReadOnly = true;
			loginID.BorderStyle = BorderStyle.None;
			bnLoginID.Visible = false;
			this.loginPW.Text		= dRow["loginPW"].ToString();
			this.MbrName.Text		= dRow["MbrName"].ToString();
			this.MbrEmail.Text		= dRow["MbrEmail"].ToString();
			this.phone.Text			= dRow["phone"].ToString();
			arrTemp	= dRow["cellularP"].ToString().Split('-');
			if(arrTemp.Length>0)
			{
				Util.DDLFindByText(ref cellularP1, arrTemp[0]);
				this.cellularP2.Text = arrTemp[1];
				this.cellularP3.Text = arrTemp[2];
				if(arrTemp[0] != "")
					cellularP1.Items.RemoveAt(0);
				arrTemp =null;
			}
			this.mZipcode.Text		= dRow["zipcode"].ToString();
			arrTemp = dRow["address"].ToString().Split('|');
			if(arrTemp.Length>1)
			{
				this.mAddress1.Text = arrTemp[0];
				this.mAddress2.Text = arrTemp[1];
				arrTemp =null;
			}
			arrTemp = dRow["SSN"].ToString().Split('-');
			if(arrTemp.Length>0)
			{
				this.SSN1.Text = arrTemp[0];
				this.SSN2.Text = arrTemp[1];
				arrTemp =null;
			}
			if(Convert.ToBoolean(dRow["newsLetter"]))
				this.newsLetter.Checked = true;
			else
				this.newsLetter.Checked = false;;
			//When you lost your id and pw; QnA.
			Util.DDLFindByValue(ref findingID, dRow["findingID"].ToString());
			if(dRow["findingID"].ToString() != "")
				findingID.Items.RemoveAt(0);			
			this.findingA.Text = dRow["findingA"].ToString();



			////Member Value Information.
			dsMbr =	mbl.GetMbrValueInfo( Convert.ToInt32(mId) );
			dRow = dsMbr.Tables[1].Rows[0];

			this.rcmderID.Text = dRow["rcmderID"].ToString();
			rcmderID.ReadOnly = true;
			rcmderID.BorderStyle = BorderStyle.None;
			rcmderID.ToolTip = "수정할 수 없습니다.";
			bnRcmderID.Visible = false;
			
			//Util.DDLFindByValue(ref ddlMLevel, dRow["mLevel"].ToString());
			this.mLevel.Text = MathLib.GetComma(dRow["mLevel"]);
			this.howMuch.Text = MathLib.GetComma(dRow["howMuch"]);
			this.howMany.Text = MathLib.GetComma(dRow["howMany"]);
			this.RFund.Text = MathLib.GetComma(dRow["RFund"]);
			this.RFundAC.Text = MathLib.GetComma(dRow["RFundAC"]);
			this.point.Text = MathLib.GetComma(dRow["point"]);
			this.pointAC.Text = MathLib.GetComma(dRow["pointAC"]);
			this.unpaid.Text = MathLib.GetComma(dRow["unpaid"]);
			this.unpaidAC.Text = MathLib.GetComma(dRow["unpaidAC"]);
			this.joinDT.Text = dRow["joinDT"].ToString();
			this.recentLogin.Text = dRow["recentLogin"].ToString();
			this.IPaddress.Text = dRow["IPaddress"].ToString();
			this.leaveDT.Text = dRow["leaveDT"].ToString();	


			////Member's additional Information
			dsMbr =	mbl.GetMbrOptionInfo( Convert.ToInt32(mId) );
			if(dsMbr.Tables[2].Rows.Count>0)
			{
				dRow = dsMbr.Tables[2].Rows[0];
				//파일 보존 체크박스처리
				if(dRow["avataImage"].ToString() != "")
				{
					cbDeleteAI.Visible = true;
					cbDeleteAI.ToolTip = dRow["avataImage"].ToString();	
							
					this.avataImage.ImageUrl = SystemConfig.GetValue("MemberPicUploadDir") + dRow["avataImage"].ToString();
					this.avataImage.Style["cursor"] = "hand";
					this.avataImage.Attributes["OnClick"] = "javascript:ZoomWindowOpen('" + this.avataImage.ImageUrl + "','avaPic','');";
							
					//이미지 리사이즈
					JinsLibrary.IMAGE.ImageLib.Self.ImageResize(ref avataImage, 260, 300);
				}
				this.homepage.Text = dRow["homepage"].ToString();
				arrTemp = dRow["messenger"].ToString().Split('|');
				if(arrTemp.Length>1)
				{
					this.MsgName.Text = arrTemp[0];
					this.MsgID.Text =	arrTemp[1];
				}
				Util.CBLFindByText(ref hobbies, dRow["hobbies"].ToString().Split(';'));
				Util.DDLFindByValue(ref monthlyPay, dRow["monthlyPay"].ToString());
				if(dRow["monthlyPay"].ToString() != "")
					monthlyPay.Items.RemoveAt(0);
				Util.DDLFindByValue(ref carInfo, dRow["carInfo"].ToString());
				if(dRow["carInfo"].ToString() != "")
					carInfo.Items.RemoveAt(0);
				this.children.Text = dRow["children"].ToString();	
				this.mark.Text = dRow["mark"].ToString();
			}

				//// Company Information
			dsMbr =	mbl.GetMbrOptionInfo( Convert.ToInt32(mId) );
			if(dsMbr.Tables[3].Rows.Count>0)
			{
				dRow = dsMbr.Tables[3].Rows[0];
				this.company.Text = dRow["company"].ToString();				
				Util.DDLFindByText(ref jobType, dRow["jobType"].ToString());
				if(dRow["jobType"].ToString() != "")
					jobType.Items.RemoveAt(0);
				arrTemp = dRow["officeP"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					//Util.DDLFindByText(ref cellularP1, arrTemp[0].ToString());
					
					//this.officeP1.Text = dRow[0];
					//this.officeP2.Text = dRow[1];
					//this.officeP3.Text = dRow[2];
					arrTemp =null;
				}	
				this.oZipcode.Text = dRow["zipcode"].ToString();
				arrTemp = dRow["address"].ToString().Split('|');
				if(arrTemp.Length>1)
				{
					this.oAddress1.Text = arrTemp[0];
					this.oAddress2.Text = arrTemp[1];
					arrTemp =null;
				}
			}


			return true;
			
			/*
			dbUtil = new DBLib();
			string qryString = "Select member_id,loginID,loginPW,MbrName,MbrEmail,phone,cellularP,zipcode,address,findingID,findingA,SSN,newsLetter"
				+ " FROM t_Members WHERE member_id=" + mId;
			qryString += ";Select mLevel,howMuch,howMany,RFund,RFundAC,point,pointAC,unpaid,unpaidAC,rcmderID,joinDT,recentLogin,IPaddress,leaveDT"
				+ " FROM t_MemberValue WHERE member_id=" + mId;
			qryString += ";Select homepage,messenger,hobbies,carInfo,children,avataImage,monthlyPay,mark"				
				+ " FROM t_MemberOption WHERE member_id=" + mId;
			qryString += ";Select company,jobType,officeP,zipcode,address"				
				+ " FROM t_MemberJob WHERE member_id=" + mId;
			qryString += ";Select annGroup,itemFlag,annDate FROM t_Anniversary WHERE (annGroup BETWEEN 200 AND 220) AND item_id=" + mId;
	
			SqlDataReader drMember;
			drMember = dbUtil.MyExecuteReader(qryString);
			if (drMember.Read())			//기본정보
			{
				string [] arrTemp;
				this.member_id.Text = drMember["member_id"].ToString();
				if(Convert.ToInt32(this.member_id.Text) > 0)
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
				if(arrTemp.Length>0)
				{
					this.phone1.Text = arrTemp[0];
					this.phone2.Text = arrTemp[1];
					this.phone3.Text = arrTemp[2];
					arrTemp =null;
				}
				arrTemp = drMember["cellularP"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					Util.DDLFindByText(ref cellularP1, arrTemp[0]);
					this.cellularP2.Text = arrTemp[1];
					this.cellularP3.Text = arrTemp[2];
					if(arrTemp[0] != "")
						cellularP1.Items.RemoveAt(0);
					arrTemp =null;
				}
				this.MbrEmail.Text = drMember["MbrEmail"].ToString();
				arrTemp = drMember["SSN"].ToString().Split('-');
				if(arrTemp.Length>0)
				{
					this.SSN1.Text = arrTemp[0];
					this.SSN2.Text = arrTemp[1];
					arrTemp =null;
				}
				this.zipcode.Text = drMember["zipcode"].ToString();
				arrTemp = drMember["address"].ToString().Split('|');
				if(arrTemp.Length>1)
				{
					this.mAddress1.Text = arrTemp[0];
					this.mAddress2.Text = arrTemp[1];
					arrTemp =null;
				}
				if(Convert.ToBoolean(drMember["newsLetter"]))
					this.newsLetter.Checked = true;
				else
					this.newsLetter.Checked = false;;
				
				//아이디/패스워드 잊어 버렸을 때 QnA.
				Util.DDLFindByValue(ref findingID, drMember["findingID"].ToString());
				if(drMember["findingID"].ToString() != "")
					findingID.Items.RemoveAt(0);			
				this.findingA.Text = drMember["findingA"].ToString();

				if(drMember.NextResult())	//평가치
				{
					drMember.Read();
					this.rcmderID.Text = drMember["rcmderID"].ToString();
					rcmderID.ReadOnly = true;
					rcmderID.BorderStyle = BorderStyle.None;
					rcmderID.ToolTip = "수정할 수 없습니다.";
					bnRcmderID.Visible = false;
					Util.DDLFindByValue(ref ddlMLevel, drMember["mLevel"].ToString());
										
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
										
				}
				
				if(drMember.NextResult())	//부가정보
				{
					if(drMember.Read())
					{
						//파일 보존 체크박스처리
						if(drMember["avataImage"].ToString() != "")
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
						if(arrTemp.Length>1)
						{
							this.MsgName.Text = arrTemp[0];
							this.MsgID.Text =	arrTemp[1];
						}
						Util.CBLFindByText(ref hobbies, drMember["hobbies"].ToString().Split(';'));
						Util.DDLFindByValue(ref monthlyPay, drMember["monthlyPay"].ToString());
						if(drMember["monthlyPay"].ToString() != "")
							monthlyPay.Items.RemoveAt(0);
						Util.DDLFindByValue(ref carInfo, drMember["carInfo"].ToString());
						if(drMember["carInfo"].ToString() != "")
							carInfo.Items.RemoveAt(0);
						this.children.Text = drMember["children"].ToString();	
						this.mark.Text = drMember["mark"].ToString();
					}
				}
				if(drMember.NextResult())	//회사정보
				{
					if(drMember.Read())
					{
						this.company.Text = drMember["company"].ToString();				
						Util.DDLFindByText(ref jobType, drMember["jobType"].ToString());
						if(drMember["jobType"].ToString() != "")
							jobType.Items.RemoveAt(0);
						arrTemp = drMember["officeP"].ToString().Split('-');
						if(arrTemp.Length>0)
						{
							//Util.DDLFindByText(ref cellularP1, arrTemp[0].ToString());
							this.officeP1.Text = arrTemp[0];
							this.officeP2.Text = arrTemp[1];
							this.officeP3.Text = arrTemp[2];
							arrTemp =null;
						}	
						this.oZipcode.Text = drMember["zipcode"].ToString();
						arrTemp = drMember["address"].ToString().Split('|');
						if(arrTemp.Length>1)
						{
							this.oAddress1.Text = arrTemp[0];
							this.oAddress2.Text = arrTemp[1];
							arrTemp =null;
						}
					}
				}

				if(drMember.NextResult())	//기념일 셋팅
				{
					while(drMember.Read())
					{
						//Response.Write( drMember["itemFlag"].ToString());
						switch(Convert.ToInt32(drMember["annGroup"]))
						{
							case 200 :		//생일
								Util.RBLFindByValue(ref rblSLBirth, drMember["itemFlag"].ToString());
								if(drMember["annDate"].ToString() != "")
									this.tbBirthDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
								break;
							case 210 :		//결혼기념일(양력없음)	-->기혼 미혼 셋팅
								Util.RBLFindByValue(ref rblMarried, drMember["itemFlag"].ToString());
								if(rblMarried.SelectedValue == "기")
								{
									if(drMember["annDate"].ToString() != "")
										this.tbWeddingDay.Text = Convert.ToDateTime(drMember["annDate"]).ToShortDateString();
								}
								break;
						}	
					}
				}
				//DR,DB닫기
				drMember.Close();
				dbUtil.SqlConnection.Close();
				return true;
			}
			else
				return false;
				*/
		}
		#endregion
/*
		private void CommonInsertUpdate()
		{
			Page.Validate();
			if(!Page.IsValid)
				ClientAction.ShowMsgBack("정확히 입력하세요.");

			mbr = new MbrBase();
			mbr.loginPW			= HTML.ReplaceToDB(loginPW.Text);
			mbr.MbrName			= HTML.ReplaceToDB(MbrName.Text);
			mbr.phone			= HTML.ReplaceToDB(phone1.Text) + "-" + HTML.ReplaceToDB(phone2.Text) + "-" + HTML.ReplaceToDB(phone3.Text);
			mbr.cellularP		= cellularP1.SelectedItem.Text + "-" + HTML.ReplaceToDB(cellularP2.Text) + "-" + HTML.ReplaceToDB(cellularP3.Text);
			mbr.MbrEmail		= HTML.ReplaceToDB(MbrEmail.Text);
			mbr.SSN				= HTML.ReplaceToDB(SSN1.Text) + "-" + HTML.ReplaceToDB(SSN2.Text);
			mbr.zipcode			= HTML.ReplaceToDB(zipcode.Text);
			mbr.address			= HTML.ReplaceToDB(mAddress1.Text) + "|" + HTML.ReplaceToDB(mAddress2.Text);
			mbr.newsLetter		= Text.BoolToOneZero(newsLetter.Checked);
			mbr.findingID		= findingID.SelectedValue; 
			mbr.findingA		= HTML.ReplaceToDB(findingA.Text); 
			mbr.rcmderID		= HTML.ReplaceToDB(rcmderID.Text);
			if(pnAdditionalInfo.Visible)
			{
				mbr.homepage		= HTML.ReplaceToDB(homepage.Text);
				mbr.monthlyPay		= monthlyPay.SelectedValue;
				mbr.carInfo			= carInfo.SelectedValue;
				mbr.SLBirth			= rblSLBirth.SelectedValue; 
				mbr.BirthDay		= tbBirthDay.Text;
				mbr.Married			= rblMarried.SelectedValue;	//음력결혼이라....
				mbr.WeddingDay		= tbWeddingDay.Text;
				//Response.Write("tbWeddingDay.Text= " + tbWeddingDay.Text +"<br>");
				mbr.children		= HTML.ReplaceToDB(children.Text);
				mbr.messenger		= MsgName.Text + "|"+ MsgID.Text;
				mbr.hobbies			= Util.CBLSelectedValues(ref hobbies, ";");
				mbr.mark			= HTML.ReplaceToDB(mark.Text);
				mbr.company			= HTML.ReplaceToDB(company.Text);
				mbr.jobType			= jobType.SelectedValue;
				mbr.officeP			= HTML.ReplaceToDB(officeP1.Text) + "-" + HTML.ReplaceToDB(officeP2.Text) + "-" + HTML.ReplaceToDB(officeP3.Text);
				mbr.oZipcode		= oZipcode.Text;
				mbr.oAddress		= oAddress1.Text + "|" + HTML.ReplaceToDB(oAddress2.Text);
				//mbr.mLevel			= 2;		//우수회원
			}
			else
			{
				//mbr.mLevel			= 1;		//정회원
			}
			mbr.IPaddress		= Request.UserHostAddress;			
		}
		private void ibInsert_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			//Response.Write(Text.BoolToOneZero(cbProMbr.Checked));
			ibInsert.Enabled = false;
			//아디디 중복되나 최종확인
			if(MbrBaseLib.LoginID_Exist(loginID.Text))
				ClientAction.ShowMsgBack("입력하신 아이디는 존재합니다. 중복확인을 하세요.");

			//데이타 충전
			//공통부분///////////
			CommonInsertUpdate();
			/////////////////////
			mbr.member_id		= -1; //적용안됨//dbUtil.GetNextNumber("t_Members", "member_id", 100);
			mbr.loginID			= HTML.ReplaceToDB(loginID.Text);
			mbr.rcmderID		= HTML.ReplaceToDB(rcmderID.Text);
			mbr.cbProMbr		= Text.BoolToOneZero(cbProMbr.Checked);
						
			//DB업데이트
			bool up_result = true; //파일업로드 결과
			int sp_result = mbr.member_id = mbr.Insert();
			//부가정보.
			if(pnAdditionalInfo.Visible)
			{
				if(bnAvataImage.PostedFile.ContentLength > 0 && bnAvataImage.PostedFile.ContentLength < 256000)
				{
					mbr.avataImage	= "AvaPic_" + mbr.member_id.ToString() + FileLib.Self.GetExtention(bnAvataImage.Value);				
					cbDeleteAI.ToolTip = "ok";
				}
				else
					mbr.avataImage		= "";
				//부가정보저장.
				sp_result = mbr.Insert_OptionJob();
				//파일업로드
				up_result = this.UploadFiles();
			}
			if(sp_result != 0)
			{
				//회원수를 업데이트한다.
				this.UpdateAllMembersNumber();
				if( up_result==false )
				{
					ClientAction.ShowMsgAndGoUrl("이미지파일이 아닙니다!! 다시 수정업로드하세요. \\n[가능한 확장자 : " + ImageLib.Self.imagesExtsForWeb + "]", "MbrView.aspx?"+ URLQuery.Self.GetQueryString());
				}
				ClientAction.ShowMsgAndGoUrl("정상적으로 입력되었습니다."," MbrList.aspx?"+ URLQuery.Self.GetQueryString());
			}
			else
				ClientAction.ShowMsgAndGoUrl("입력작업이 실패했습니다." + "Code:" + sp_result,"MbrView.aspx?"+ URLQuery.Self.GetQueryString());
		}
		private void ibUpdate_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			ibUpdate.Enabled = false;
			//데이타 충전
			//공통부분///////////
			CommonInsertUpdate();
			/////////////////////
			mbr.member_id		= Convert.ToInt32(member_id.Text);	
			mbr.loginID			= "";		//해당사항없음

			//DB업데이트
			bool up_result = true; //파일업로드 결과
			int sp_result = mbr.Update();
			//부가정보.
			if(pnAdditionalInfo.Visible)
			{
				if(cbDeleteAI.Checked)
				{
					mbr.avataImage	= "";
				}
				else if(bnAvataImage.PostedFile.ContentLength > 0 && bnAvataImage.PostedFile.ContentLength < 256000)
				{
					mbr.avataImage	= "AvaPic_" + mbr.member_id.ToString() + FileLib.Self.GetExtention(bnAvataImage.Value);
					cbDeleteAI.ToolTip = "ok";
				}
				else
				{
					mbr.avataImage = cbDeleteAI.ToolTip;
				}
				//부가정보저장.
				sp_result = mbr.Insert_OptionJob();
				//파일업로드
				up_result = this.UploadFiles();
			}
			if(sp_result != 0)
			{
				//회원수를 업데이트한다.
				this.UpdateAllMembersNumber();
				if( !up_result )
				{
					ClientAction.ShowMsgAndGoUrl("이미지파일이 아닙니다!! 다시 수정업로드하세요. \\n[가능한 확장자 : " + ImageLib.Self.imagesExtsForWeb + "]", "MbrView.aspx?"+ URLQuery.Self.GetQueryString());
				}
				ClientAction.ShowMsgAndGoUrl("정상적으로 수정되었습니다.", base.GetWhichList(Request.QueryString["ml"]) + "?"+ URLQuery.Self.GetQueryString());
			}
			else
				ClientAction.ShowMsgAndGoUrl("수정작업이 실패했습니다." + "Code:" + sp_result,"MbrView.aspx?"+ URLQuery.Self.GetQueryString());
		}
		//파일관련 업로드
		private bool UploadFiles()
		{
			string memberPicUploadDir = SystemConfig.GetValue("MemberPicUploadDir");
			if(cbDeleteAI.Checked)		//삭제체크박스가 선택된 케이스
			{
				//관련이미지 이동(이미 검증되었기 때문에 파일세이브)
				FileLib.Self.FileMoveTo(memberPicUploadDir + cbDeleteAI.ToolTip, memberPicUploadDir + "Avata.bak/" + cbDeleteAI.ToolTip);
			}
			else if(cbDeleteAI.ToolTip == "ok")
			{
				//먼저 이미지 파일인가를 확인한다.
				if(!FileLib.Self.IsImageFileExts(bnAvataImage))
					return false;
				//관련이미지 이동(이미 검증되었기 때문에 파일세이브)
				FileLib.Self.FileMoveTo(memberPicUploadDir + cbDeleteAI.ToolTip, memberPicUploadDir + "Avata.bak/" + cbDeleteAI.ToolTip);
				//저장
				FileLib.Self.FileSave(bnAvataImage, memberPicUploadDir, FileLib.Self.GetFileNameWithoutExtension(mbr.avataImage));
			}
			else	//업로드과정이 실행되지 않음.... 용량이 많거나 처리할 필요가 없을 때.
			{
				if(bnAvataImage.PostedFile.ContentLength >= 255000)
					ClientAction.ShowInfoMsg("이미지 용량이 256K 이상이므로 업로드되지 않았습니다.");
			}
			return true;
		}		
		//회원수를 업데이트한다.
		private void UpdateAllMembersNumber()
		{
			dbUtil = new DBLib();
			AppVariable.Self["AllMembersNumber"] = dbUtil.GetRecordCount("t_MemberValue", "leaveDT IS  null Or leaveDT = ''").ToString();
			dbUtil.SqlConnection.Close();
			//ClientAction.ShowInfoMsg(AppVariable.Self["AllMembersNumber"].ToString());
		}		
		private void ibAdditionalInfo_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			if(pnAdditionalInfo.Visible)
				pnAdditionalInfo.Visible = false;
			else
			{
				pnAdditionalInfo.Visible = true;
				if(rblMarried.SelectedValue == "미")
					ClientAction.WriteJavascript(this, "pnWA", "pnWA.style.display='none';");
			}
		}
*/			
	

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