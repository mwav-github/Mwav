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
using App_Code.CompanyMgr.Staff;
using App_Code.Partners.Staff;


namespace PARTNER
{
    /// <summary>
    /// 직원정보의 입력과 수정을 구현합니다.
    /// </summary>
    public partial class Adminp_Partners_StfForm : System.Web.UI.Page
    {
        MiddleTier.Staff.StfStaffBiz _ssb;
        string _sfID;


        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인되었는지 확인
            App_Code.Partners.Staff.PtnBaseLib.Self.LoginOK();
            
            if (Request.QueryString["mode"] != "u") //입력인경우
            {
                if (!Page.IsPostBack)
                {
                    //페이지타이틀설정
                    litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("sti");

                    this.joinDT.Text = System.DateTime.Today.ToShortDateString();
                    //버튼제거                    
                    ibUpdate.Visible = false;

                    //초기화
                    this.SettingInitialize();
                    DDLElementsInitialize();
                }
                //PostCall Service
                if (!IsCallback)
                    ucLoginID.tbClientID = sLoginID.ClientID;
            }
            else	//수정인경우
            {
                //페이지타이틀설정
                litPageTitle.Text = Title = App_Code.ADMIN.AdminLocations.MakeLocation("_ptu");

                _sfID = Request.QueryString["sfID"];
                //권한체크
                if (!PtnBaseLib.Self.Modify(_sfID))
                    ClientAction.ShowMsgBack("해당 권한이 없습니다.");

                ucLoginID.Visible = false;
                ibInsert.Visible = false;
                sLoginID.ReadOnly = true;
                sLoginID.BorderStyle = BorderStyle.None;
                if (_sfID != "")
                {
                    if (!Page.IsPostBack)
                    {
                        this.SettingInitialize();
                        //드랍다운리스트 엘리먼트채우기
                        //초기 선택리스트 제거
                        DeptName.Items.RemoveAt(0);
                        sClass.Items.RemoveAt(0);
                        DDLElementsInitialize();
                        //바인딩
                        if (!this.StaffFormBind())
                        {
                            ClientAction.ShowMsgBack("해당 데이터가 없습니다.");
                        }
                    }
                }
                else
                    ClientAction.ShowMsgBack("정상적인 접근이 아닙니다");
            }
            sBusinessPic.Dispose();
        }



        //셋팅초기화
        private void SettingInitialize()
        {
            //자바스크립트 파일의 등록
            if (!Page.ClientScript.IsClientScriptIncludeRegistered(this.GetType(), "Function"))
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Function", "/CommonLibrary/Function.js");
            if (!Page.ClientScript.IsClientScriptIncludeRegistered(this.GetType(), "radio"))
                Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "radio", "/CommonLibrary/Objects/radio.js");

            //QueryString 재정의//URLQuery.Self.SetQueryString();
            URLQuery.Self.SetQueryString();
            URLQuery.Self.Remove("mode");

            //주소찾기버튼
            hlSeekAddr.Attributes["OnClick"] = "WindowOpen('../../../CommonApps/PostSeek/PostSeek.aspx','staffZip','scrollbars=yes,resizable=yes')";
            hlSeekAddr.Style.Add("CURSOR", "hand");
            //명함이미지 미리보기
            btnBusinessPic.Attributes["onChange"] = "javascript:ImagePreview(this, 'sBusinessPic',70,90);"; //IE7.0에서 문제
            //btnBusinessPic.Attributes["onChange"] = "javascript:document.getElementById('sBusinessPic').src = frmStaff.btnBusinessPic.value;alert(document.sBusinessPic.src);";
            //btnBusinessPic.Attributes["onFocus"] = "javascript:this.style.backgroundColor='#f0f0e0';sBusinessPic.src = frmStaff.btnBusinessPic.value;";

            //직접권한 수정
            //if(StfBaseLib.Self.CanAccessLevel)
            sLevel.Visible = true;

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

            //입사일
            scriptStr = "javascript:return popUpCalendar(this," + joinDT.ClientID + @", 'yyyy-mm-dd', '__doPostBack(\'" + joinDT.ClientID + @"\')')";
            joinDT.Attributes["OnClick"] = "blur();"; //OnClientClick 안됨
            joinDT.Attributes.Add("ReadOnly", "ReadOnly");
            dSelectorJoinDay.ImgCalendar.Attributes["onClick"] = scriptStr;
            dSelectorJoinDay.ImgReset.Attributes["onClick"] = "javascript:" + joinDT.ClientID + ".value = ''";

            //주소에 읽기속성부여
            zipcode.Attributes.Add("ReadOnly", "ReadOnly");
            address1.Attributes.Add("ReadOnly", "ReadOnly");

            //this.frmStaff.Attributes["onSubmit"] = "return ConfirmJ('내용을 전송하시겠습니까?');";
            this.Form.Attributes["onSubmit"] = "return ConfirmJ('내용을 전송하시겠습니까?');";
            
        }

        //드랍다운리스트 엘리먼트채우기
        private void DDLElementsInitialize()
        {
            ArrayList arrayList = TableConfig.GetOnlyValues("DeptName_root");
            this.DeptName.Items.AddRange(JinsLibrary.CONTROL.Util.GetListItems(arrayList));
            SortedList sortedList = JinsLibrary.CONFIG.TableConfig.GetValues("Class_root");
            this.sClass.Items.AddRange(JinsLibrary.CONTROL.Util.GetListItems(sortedList));
            //소속에 본사 추가
            //JinsLibrary.CONTROL.Util.DDLAddItem(ref position, "본사", "0");
        }



        #region 직원데이터 바인딩
        private Boolean StaffFormBind()
        {
            string qryString = "Select staff_id,sLoginID,sLoginPW,position,staffNbr,sName,DeptName,sClass,subJobs,phone,cellularP,ExtNbr,sEmail,SSN,zipcode,address"
                + ",homepage,mark,sLevel,sBusinessPic,sAvataImage,sData,joinDT"
                + " FROM t_Staff"
                + " WHERE staff_id=" + _sfID;
            qryString += ";Select annGroup,itemFlag,annDate FROM t_Anniversary WHERE annGroup<100 AND item_id=" + _sfID;

            SqlDataReader drStaff;

            DBLib dbUtil = new DBLib();
            drStaff = dbUtil.MyExecuteReader(qryString);
            if (drStaff.Read())
            {
                string[] arrTemp;
                //this.staff_id.Text = sfID;
                this.sLoginID.Text = drStaff["sLoginID"].ToString();
                this.sLoginPW.Text = drStaff["sLoginPW"].ToString();
                position.Text = PtnBaseLib.Self.GetPartnerCompany(Convert.ToInt16(Cookie.Self["position"]));
                this.staffNbr.Text = drStaff["staffNbr"].ToString();
                this.sName.Text = drStaff["sName"].ToString();
                this.DeptName.SelectedValue = drStaff["DeptName"].ToString();
                this.sClass.SelectedValue = TableConfig.GetKey("Class_root", drStaff["sClass"].ToString());
                this.subJobs.Text = drStaff["subJobs"].ToString();

                arrTemp = drStaff["phone"].ToString().Split('-');
                if (arrTemp.Length > 0)
                {
                    this.phone1.Text = arrTemp[0];
                    this.phone2.Text = arrTemp[1];
                    this.phone3.Text = arrTemp[2];
                    arrTemp = null;
                }
                arrTemp = drStaff["cellularP"].ToString().Split('-');
                if (arrTemp.Length > 0)
                {
                    this.cellularP1.Text = arrTemp[0];
                    this.cellularP2.Text = arrTemp[1];
                    this.cellularP3.Text = arrTemp[2];
                    arrTemp = null;
                }
                this.ExtNbr.Text = drStaff["ExtNbr"].ToString();
                this.sEmail.Text = drStaff["sEmail"].ToString();
                arrTemp = drStaff["SSN"].ToString().Split('-');
                if (arrTemp.Length > 0)
                {
                    this.SSN1.Text = arrTemp[0];
                    this.SSN2.Text = arrTemp[1];
                    arrTemp = null;
                }
                this.zipcode.Text = drStaff["zipcode"].ToString();
                arrTemp = drStaff["address"].ToString().Split('|');
                if (arrTemp.Length > 1)
                {
                    this.address1.Text = arrTemp[0];
                    this.address2.Text = arrTemp[1];
                    arrTemp = null;
                }

                this.homepage.Text = drStaff["homepage"].ToString();
                this.mark.Text = drStaff["mark"].ToString();
                this.sLevel.Text = drStaff["sLevel"].ToString();
                //뷰스테이트로 파일 경로 저장 (체크박스 툴팁이용)
                //PostState.Self["sBusinessPic"] = drStaff["sBusinessPic"].ToString();
                //PostState.Self["sAvataImage"] = drStaff["sAvataImage"].ToString();
                //PostState.Self["sData"] = drStaff["sData"].ToString();
                this.sBusinessPic.ImageUrl = SystemConfig.GetValue("StaffUploadDir") + Text.SetDefaultValue(drStaff["sBusinessPic"].ToString(), "MyPic_default.gif");
                this.sBusinessPic.Style["cursor"] = "hand";
                this.sBusinessPic.Attributes["OnClick"] = "javascript:ZoomWindowOpen('" + this.sBusinessPic.ImageUrl + "','bizPic','');";
                //이미지 리사이즈
                JinsLibrary.IMAGE.ImageLib.Self.ImageResize(ref sBusinessPic, 150, 200);

                this.sAvataImage.ImageUrl = @"../../zUpload/stfData/" + Text.SetDefaultValue(drStaff["sAvataImage"].ToString(), "MyPic_default.gif");
                this.joinDT.Text = drStaff["joinDT"].ToString();

                //파일 보존 체크박스처리
                if (drStaff["sBusinessPic"].ToString() != "")
                {
                    cbKeepBP.Visible = true;
                    cbKeepBP.Checked = true;
                    cbKeepBP.ToolTip = drStaff["sBusinessPic"].ToString();
                }
                if (drStaff["sAvataImage"].ToString() != "")
                {
                    cbKeepAI.Visible = true;
                    cbKeepAI.Checked = true;
                    cbKeepAI.ToolTip = drStaff["sAvataImage"].ToString();
                }
                if (drStaff["sData"].ToString() != "")
                {
                    cbKeepData.Visible = true;
                    cbKeepData.Checked = true;
                    cbKeepData.ToolTip = drStaff["sData"].ToString();
                }

                //기념일 셋팅
                if (drStaff.NextResult())
                {
                    string annDate;
                    while (drStaff.Read())
                    {
                        if (drStaff["annDate"].ToString() != "")
                            annDate = Convert.ToDateTime(drStaff["annDate"]).ToShortDateString();
                        else
                            annDate = "";
                        //Response.Write("----> " + drStaff["annDate"].ToString());

                        switch (Convert.ToInt32(drStaff["annGroup"]))
                        {
                            case 10:		//생일
                                Util.RBLFindByValue(ref rblSLBirth, drStaff["itemFlag"].ToString());
                                this.tbBirthDay.Text = annDate;//Convert.ToDateTime(drStaff["annDate"]).ToShortDateString();
                                break;
                            case 20:		//결혼기념일
                                Util.RBLFindByValue(ref rblMarried, drStaff["itemFlag"].ToString());
                                //this.rblMarried.SelectedValue = drStaff["itemFlag"].ToString(); //되냉
                                if (rblMarried.SelectedValue == "미")
                                    ClientAction.WriteJavascript(this, "pnWA", "pnWA.style.display='none';");
                                else
                                    if (drStaff["annDate"].ToString() != "")
                                        this.tbWeddingDay.Text = annDate;//Convert.ToDateTime(drCard["annDate"]).ToShortDateString();
                                break;
                        }
                    }
                }

                //기획/관리부가 아닐때 수정못하게...
                if (Convert.ToInt16(Cookie.Self["sLevel"]) < 30)
                {
                    this.staffNbr.Enabled = false;
                    this.sClass.Enabled = false;
                    this.DeptName.Enabled = false;
                    this.joinDT.Enabled = false;
                    this.dSelectorJoinDay.Visible = false;
                }
                drStaff.Close();
                //DB닫기
                dbUtil.SqlConnection.Close();
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
                ClientAction.ShowMsgBack("정확히 입력하세요."); //Response.Write( Util.GetErrorValidators(this.Validators) );

            _ssb.sLoginPW = HTML.ReplaceToDB(sLoginPW.Text);
            _ssb.position = Convert.ToInt16(Cookie.Self["position"]);// Convert.ToInt16(position.SelectedItem.Value);
            _ssb.staffNbr = HTML.ReplaceToDB(staffNbr.Text);
            _ssb.sName = HTML.ReplaceToDB(sName.Text);
            _ssb.DeptName = DeptName.SelectedValue;
            _ssb.sClass = sClass.SelectedItem.Text;
            _ssb.subJobs = HTML.ReplaceToDB(subJobs.Text);
            _ssb.phone = HTML.ReplaceToDB(phone1.Text) + "-" + HTML.ReplaceToDB(phone2.Text) + "-" + HTML.ReplaceToDB(phone3.Text);
            _ssb.cellularP = HTML.ReplaceToDB(cellularP1.Text) + "-" + HTML.ReplaceToDB(cellularP2.Text) + "-" + HTML.ReplaceToDB(cellularP3.Text);
            _ssb.ExtNbr = HTML.ReplaceToDB(ExtNbr.Text);
            _ssb.sEmail = HTML.ReplaceToDB(sEmail.Text);
            _ssb.SSN = HTML.ReplaceToDB(SSN1.Text) + "-" + HTML.ReplaceToDB(SSN2.Text);
            _ssb.zipcode = HTML.ReplaceToDB(zipcode.Text);
            if (_ssb.zipcode != "")
                _ssb.address = HTML.ReplaceToDB(address1.Text) + "|" + HTML.ReplaceToDB(address2.Text);
            _ssb.homepage = HTML.ReplaceToDB(homepage.Text);
            _ssb.mark = HTML.ReplaceToDB(mark.Text);
            if (sLevel.Visible && sLevel.Text != "")
                _ssb.sLevel = Convert.ToInt16(sLevel.Text);
            else
                _ssb.sLevel = Convert.ToInt16(sClass.SelectedValue);
            _ssb.IPaddress = HttpContext.Current.Request.UserHostAddress.ToString();
            _ssb.joinDT = Request[this.joinDT.UniqueID]; //joinDT.Text; ReadOnly속성때문
            _ssb.SLBirth = rblSLBirth.SelectedValue;
            if (_ssb.SLBirth != "")
                _ssb.BirthDay = Request[this.tbBirthDay.UniqueID]; // tbBirthDay.Text;ReadOnly속성때문
            else
                _ssb.BirthDay = "";
            _ssb.Married = rblMarried.SelectedValue;
            if (_ssb.Married != "")
                _ssb.WeddingDay = Request[this.tbWeddingDay.UniqueID]; // tbWeddingDay.Text;ReadOnly속성때문
            else
                _ssb.WeddingDay = "";
            //Response.Write("BirthDay----> " + _ssb.BirthDay);            
        }

         protected void ibInsert_Click(object sender, ImageClickEventArgs e)
        {
            ibInsert.Enabled = false;
            //아디디 중복되나 최종확인
            if (StfBaseLib.Self.sLoginID_Exist(sLoginID.Text))
                ClientAction.ShowMsgBack("입력하신 아이디는 존재합니다. 중복확인을 하세요.");

            //데이타 충전
            _ssb = new MiddleTier.Staff.StfStaffBiz();
            _ssb.staff_id = StfBaseLib.Self.GetNextStaff_id();

             //공통부분///////////
            CommonInsertUpdate();
            /////////////////////
            if (btnBusinessPic.Value != "")
                _ssb.sBusinessPic = "MyPic_" + _ssb.staff_id.ToString() + FileLib.Self.GetExtention(btnBusinessPic.Value);
            else
                _ssb.sBusinessPic = "";
            if (btnAvataImage.Value != "")
                _ssb.sAvataImage = "Avata_" + _ssb.staff_id.ToString() + FileLib.Self.GetExtention(btnAvataImage.Value);
            else
                _ssb.sAvataImage = "";
            if (btnData.Value != "")
                _ssb.sData = "sData_" + _ssb.staff_id.ToString() + "_" + System.DateTime.Today.ToShortDateString() + FileLib.Self.GetExtention(btnData.Value);
            else
                _ssb.sData = "";
            _ssb.sLoginID = HTML.ReplaceToDB(sLoginID.Text);

            //DB업데이트
            int sp_result = _ssb.Insert();

            //파일업로드
            _sfID = sp_result.ToString();
            bool up_result = this.UploadFiles();
            if (sp_result > 0)
            {
                //직원수를 업데이트한다.
                PtnBaseLib.Self.UpdateAllPtnStaffNumber(_ssb.position);
                if (up_result == false)
                {
                    ClientAction.ShowMsgAndGoUrl("이미지파일이 아닙니다!! 다시 수정업로드하세요. \\n[가능한 확장자 : " + ImageLib.Self.imagesExtsForWeb + "]", "PtnList.aspx?" + URLQuery.Self.GetQueryString());
                }
                //메일보관디렉토리생성
                DirectoryLib.Self.Create(SystemConfig.GetValue("MailUploadDir") + "ma_" + _ssb.staff_id + "_" + sLoginID.Text);
                ClientAction.ShowMsgAndGoUrl("정상적으로 입력되었습니다.", " PtnList.aspx?" + URLQuery.Self.GetQueryString());
            }
            else
            {
                ClientAction.ShowMsgAndGoUrl("입력작업이 실패했습니다." + "Code:" + sp_result, "PtnList.aspx?" + URLQuery.Self.GetQueryString());
            }
        }

        protected void ibUpdate_Click(object sender, ImageClickEventArgs e)
        {
            ibUpdate.Enabled = false;
            //데이타 충전
            _ssb = new MiddleTier.Staff.StfStaffBiz();
            _ssb.staff_id = Convert.ToInt16(_sfID);
            //공통부분///////////
            CommonInsertUpdate();
            /////////////////////		

            if (btnBusinessPic.Value != "" && cbKeepBP.Checked == false)
                _ssb.sBusinessPic = "MyPic_" + _ssb.staff_id.ToString() + FileLib.Self.GetExtention(btnBusinessPic.Value);
            else if (btnBusinessPic.Value == "" && cbKeepBP.Checked == false)
                _ssb.sBusinessPic = "";
            else
                _ssb.sBusinessPic = cbKeepBP.ToolTip;
            if (btnAvataImage.Value != "" && cbKeepAI.Checked == false)
                _ssb.sAvataImage = "Avata_" + _ssb.staff_id.ToString() + FileLib.Self.GetExtention(btnAvataImage.Value);
            else
                _ssb.sAvataImage = cbKeepAI.ToolTip;
            if (btnData.Value != "" && cbKeepData.Checked == false)
                _ssb.sData = "sData_" + _ssb.staff_id.ToString() + "_" + System.DateTime.Today.ToShortDateString() + FileLib.Self.GetExtention(btnData.Value);
            else
                _ssb.sData = cbKeepData.ToolTip;
            _ssb.sLoginID = "";	//적용안됨
            //파일관련 업로드
            bool up_result = this.UploadFiles();
            if (up_result == false)
            {
                ClientAction.ShowMsgBack("이미지파일이 아닙니다!! \\n[가능한 확장자 : " + ImageLib.Self.imagesExtsForWeb + "]");
            }
            //DB반영
            int sp_result = _ssb.Update();
            if (sp_result > 0)
            {
                //직원수를 업데이트한다.(수정했어도 직원탈퇴가 있다.)
                StfBaseLib.Self.UpdateAllStaffNumber();
                //메일보관디렉토리생성
                DirectoryLib.Self.Create(SystemConfig.GetValue("MailUploadDir") + "ma_" + _ssb.staff_id + "_" + sLoginID.Text);
                ClientAction.ShowMsgAndGoUrl("정상적으로 수정되었습니다.", "PtnList.aspx?" + URLQuery.Self.GetQueryString());
            }
            else
            {
                ClientAction.ShowMsgAndGoUrl("수정작업이 실패했습니다." + "Code:" + sp_result, "PtnList.aspx?" + URLQuery.Self.GetQueryString());
            }
        }

        //파일관련 업로드
        private bool UploadFiles()
        {
            if (btnBusinessPic.PostedFile.ContentLength > 0 && cbKeepBP.Checked == false)
            {
                //먼저 이미지 파일인가를 확인한다.
                if (!FileLib.Self.IsImageFileExts(btnBusinessPic))
                    return false;

                //관련이미지 이동(이미 검증되었기 때문에 파일세이브)
                FileLib.Self.FileNamesMoveTo(SystemConfig.GetValue("StaffUploadDir"), "MyPic_" + _sfID, SystemConfig.GetValue("UploadDirBackup") + "stfData.bak/");
                //저장        //FileLib.Self.ImageFileSave(btnBusinessPic, SystemConfig.GetValue("StaffUploadDir"), FileLib.Self.GetFileNameWithoutExtension(sf.sBusinessPic));
                FileLib.Self.FileSave(btnBusinessPic, SystemConfig.GetValue("StaffUploadDir"), FileLib.Self.GetFileNameWithoutExtension(_ssb.sBusinessPic));
            }
            if (btnAvataImage.Value != "" && cbKeepAI.Checked == false)
            {
                //관련이미지 이동
                FileLib.Self.FileNamesMoveTo(SystemConfig.GetValue("StaffUploadDir"), "Avata_" + _sfID, SystemConfig.GetValue("UploadDirBackup") + "stfData.bak/");
                //저장
                HTML.ReplaceToDB(btnAvataImage.Value);
            }
            if (btnData.Value != "" && cbKeepData.Checked == false)
            {
                //관련데이타 이동
                FileLib.Self.FileNamesMoveTo(SystemConfig.GetValue("StaffDataUploadDir"), "sData_" + _sfID + "*", SystemConfig.GetValue("UploadDirBackup") + "stfData.bak/fileData.bak/");
                //저장                                                                                  //sf.sData = FileLib.Self.FileSave(HTML.ReplaceToDB(btnData.Value), SystemConfig.GetValue("StaffUploadDir")+"fileData/", "sData_" + sfID + "_" + System.DateTime.Today.ToShortDateString());
                FileLib.Self.FileSave(btnData, SystemConfig.GetValue("StaffUploadDir") + "fileData/", FileLib.Self.GetFileNameWithoutExtension(_ssb.sData));
                //Response.End();
            }
            return true;
        }
        
    }
}