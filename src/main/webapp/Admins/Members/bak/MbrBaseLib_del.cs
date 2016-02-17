using System;
using System.Web;
using System.Collections;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using JinsLibrary;
using JinsLibrary.FILE;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;

namespace KistelSite.Admins.Members
{
	public class MbrBase : MbrBaseLib
	{	
		public int member_id;
		public System.Int16 cbProMbr;
		//기본회원정보		
		public string loginID;
		public string loginPW;
		public string MbrName;
		public string MbrEmail;
		public string phone;	
		public string cellularP;
		public string zipcode;
		public string address;
		public string findingID;        					
		public string findingA;
		public string SSN;
		public System.Int16 newsLetter;
		//회원평가치
		//public System.Int16 mLevel;
		//public System.Int64 howMuch;
		//public int howMany;
		//public int RFund;
		//public int RFundAC;
		//public int point;
		//public int pointAC;
		//public int unpaid;
		//public int unpaidAC;
		public string rcmderID;
		public string IPaddress;
		//부가회원정보
		public string homepage;
		public string messenger;
		public string hobbies;
		public string carInfo;
		public string children;
		public string avataImage;
		public string monthlyPay;
		public string mark;
		public string SLBirth;
		public string BirthDay;
		public string Married;			//음력 결혼이라........
		public string WeddingDay;
		//회사정보
        public string company;
		public string jobType;
		public string officeP;
		public string oZipcode;
		public string oAddress;

		private DBLib dbUtil;
		private SqlCommand myCommand;
		//private SqlParameter[] mySqlParameters;
		
		public int Insert()
		{			
			FillSlqParameters("i");
			return dbUtil.ExecProcedure(myCommand,"sp_Members");
		}
		public int Update()
		{
			FillSlqParameters("u");
			return dbUtil.ExecProcedure(myCommand,"sp_Members");
		}
		public int Insert_OptionJob()
		{			
			FillSlqParameters("iu");
			return dbUtil.ExecProcedure(myCommand,"sp_MemberOption_Job");
		}
		public int Update_OptionJob()
		{
			FillSlqParameters("iu");
			return dbUtil.ExecProcedure(myCommand,"sp_MemberOption_Job");
		}		
		public void FillSlqParameters(string mode)	// mode i,u
		{
			myCommand = new SqlCommand();	//("sp_Members", dbUtil.SqlConnection);
			myCommand.CommandType = CommandType.StoredProcedure;

			myCommand.Parameters.Add("@member_id", SqlDbType.Int).Value				= member_id;
			if(mode != "iu")	//주정보
			{
				SqlParameter sp_mode = new SqlParameter("@sp_mode", SqlDbType.VarChar, 1);
				sp_mode.Value = mode;
				myCommand.Parameters.Add(sp_mode);
				
				myCommand.Parameters.Add("@cbProMbr", SqlDbType.Bit).Value				= cbProMbr;
				myCommand.Parameters.Add("@loginID", SqlDbType.VarChar, 15).Value		= loginID;
				myCommand.Parameters.Add("@loginPW", SqlDbType.VarChar, 15).Value		= loginPW;
				myCommand.Parameters.Add("@MbrName", SqlDbType.VarChar, 50).Value		= MbrName;
				myCommand.Parameters.Add("@MbrEmail", SqlDbType.VarChar, 50).Value		= MbrEmail;
				myCommand.Parameters.Add("@phone", SqlDbType.VarChar, 50).Value			= phone;
				myCommand.Parameters.Add("@cellularP", SqlDbType.VarChar, 50).Value		= cellularP;
				myCommand.Parameters.Add("@zipcode", SqlDbType.VarChar, 20).Value		= zipcode;
				myCommand.Parameters.Add("@address", SqlDbType.VarChar, 200).Value		= address;
				myCommand.Parameters.Add("@findingID", SqlDbType.TinyInt).Value			= findingID;
				myCommand.Parameters.Add("@findingA", SqlDbType.VarChar, 20).Value		= findingA;
				myCommand.Parameters.Add("@SSN", SqlDbType.VarChar, 50).Value			= SSN;
				myCommand.Parameters.Add("@newsLetter", SqlDbType.Bit).Value			= newsLetter;
				myCommand.Parameters.Add("@rcmderID", SqlDbType.VarChar, 15).Value		= rcmderID;
			}
			else	//부가정보
			{
				myCommand.Parameters.Add("@homepage", SqlDbType.VarChar, 100).Value		= homepage;
				myCommand.Parameters.Add("@messenger", SqlDbType.VarChar, 100).Value	= messenger;
				myCommand.Parameters.Add("@hobbies", SqlDbType.VarChar, 100).Value		= hobbies;
				if(carInfo != "")
					myCommand.Parameters.Add("@carInfo", SqlDbType.TinyInt).Value			= carInfo;
				else
					myCommand.Parameters.Add("@carInfo", SqlDbType.TinyInt).Value			= DBNull.Value;
				if(children != "")
					myCommand.Parameters.Add("@children", SqlDbType.TinyInt).Value			= children;
				else
					myCommand.Parameters.Add("@children", SqlDbType.TinyInt).Value			= DBNull.Value;
				if(monthlyPay != "")
					myCommand.Parameters.Add("@monthlyPay", SqlDbType.TinyInt).Value		= monthlyPay;
				else
					myCommand.Parameters.Add("@monthlyPay", SqlDbType.TinyInt).Value		= DBNull.Value;
				myCommand.Parameters.Add("@avataImage", SqlDbType.VarChar, 50).Value	= avataImage;
				myCommand.Parameters.Add("@mark", SqlDbType.VarChar, 1000).Value		= mark;
				//직업정보
				myCommand.Parameters.Add("@company", SqlDbType.VarChar, 50).Value		= company;
				myCommand.Parameters.Add("@jobType", SqlDbType.VarChar, 30).Value		= jobType;
				myCommand.Parameters.Add("@officeP", SqlDbType.VarChar, 30).Value		= officeP;
				myCommand.Parameters.Add("@zipcode", SqlDbType.VarChar, 20).Value		= oZipcode;
				myCommand.Parameters.Add("@address", SqlDbType.VarChar, 200).Value		= oAddress;
				//기념일정보
				myCommand.Parameters.Add("@SLBirth", SqlDbType.NChar, 1).Value			= SLBirth;
				if(BirthDay != "")
					myCommand.Parameters.Add("@BirthDay", SqlDbType.SmallDateTime).Value	= BirthDay;
				else
					myCommand.Parameters.Add("@BirthDay", SqlDbType.SmallDateTime).Value	= DBNull.Value;
				myCommand.Parameters.Add("@Married", SqlDbType.NChar, 1).Value		= Married;
				if(WeddingDay != "")
					myCommand.Parameters.Add("@WeddingDay", SqlDbType.SmallDateTime).Value	= WeddingDay;
				else
					myCommand.Parameters.Add("@WeddingDay", SqlDbType.SmallDateTime).Value	= DBNull.Value;
//HttpContext.Current.Response.Write("WeddingDay = " + WeddingDay +"<br>");
			}
			myCommand.Parameters.Add("@IPaddress", SqlDbType.VarChar, 50).Value		= IPaddress;
			////////////////
			myCommand.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
		}
		public MbrBase()
		{
			dbUtil = new DBLib();
		}
		
	}
	
	/// <summary>
	/// MbrBaseLib에 대한 요약 설명입니다.      /// 프로세서를 쓴다면 이게 필요한강?
	/// </summary>
	public class MbrBaseLib : System.Web.UI.Page
	{
		private static DBLib dbUtil;
		private static string whichList = "";
		//회원데이터 삭제
		public static void DeleteMember(string mode, string member_id)
		{
			dbUtil = new DBLib();
			//(실제로 업데이트)
			if(mode == "d") 
			{
				string[] setNameValue = new string[2] 
				{ "leaveDT=GetDate()", "IPaddress = '" + WebUtil.CurrentRequest.UserHostAddress  + "_" + Cookie.Self["sLoginID"] + "'" };
				dbUtil.Update_EN("t_MemberValue", setNameValue , "member_id = " + member_id);
			} else if(mode == "dd") //게시물 영구삭제(실제삭제)
			{				
				MbrFilesMoveTo(member_id, dbUtil.Select_DR("avataImage","t_MemberOption","member_id=" + member_id));
				dbUtil.Delete_EN("t_MemberJob", "member_id = " + member_id);
				dbUtil.Delete_EN("t_MemberOption", "member_id = " + member_id);
				dbUtil.Delete_EN("t_MemberValue", "member_id = " + member_id);
				dbUtil.Delete_EN("t_Members", "member_id = " + member_id);
			}
			dbUtil.SqlConnection.Close();
			URLQuery.Self.Remove("mode");
			HttpContext.Current.Response.Redirect(whichList + "?" + URLQuery.Self.GetQueryString());
		}
		//회원데이터 연관파일 삭제(실제이동) 
		public static void MbrFilesMoveTo(string member_id, SqlDataReader dr)
		{
			string avataImage = dr[0].ToString();
			//관련이미지 이동
			if(avataImage != "")
				FileLib.Self.FileMoveTo(SystemConfig.GetValue("MemberPicUploadDir") + avataImage, SystemConfig.GetValue("MemberPicUploadDir") + "Avata.bak/" + avataImage);
		}
		//아이디 중복확인
		public static bool LoginID_Exist(string loginID)
		{
			string member_id = GetMember_id(loginID);
			if(member_id == null)
				return false;		//기본적으로 로그인 아이디가 없음.
			else
			{
				if(IsMemberLeaved(member_id))
					return false;		//회원이 떠낫으므로 아이디 사용가능
				else
					return true;		//아이디사용하는 회원 존재.
			}
		}
		//탈퇴회원인가 확인
		public static bool IsMemberLeaved(string member_id)
		{
			dbUtil = new DBLib();
			if(dbUtil.GetRecordCount("t_MemberValue", "member_id='" + HTML.ReplaceToDB(member_id) + "' AND leaveDT IS NULL") > 0)
			{
				//DB닫기
				dbUtil.SqlConnection.Close();
				return false;
			}
			else
				return true;
		}

		//member_id 받아서 회원아이디 리턴
		public static string GetLoginID(object member_id)
		{
			string loginID = "NoData";
		//HttpContext.Current.Response.Write(member_id + "<br>");
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("loginID","t_Members", "member_id= "+ member_id ); //System.Convert.ToInt16
			if(dr.Read()) 
			{
				loginID = dr["loginID"].ToString(); 				
			}
			dr.Close();
			return loginID;
		}
		//member_id 받아서 회원이름 리턴
		public static string GetMbrName(object member_id)
		{
			string MbrName = "";
			//HttpContext.Current.Response.Write(member_id + "<br>");
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("MbrName", "t_Members", "member_id="+ member_id );
			if(dr.Read()) 
			{
				MbrName = dr["MbrName"].ToString(); 				
			}
			dr.Close();
			return MbrName;
		}
		
		//LoginID 받아서 member_id 리턴
		public static string GetMember_id(object loginID)
		{
			string member_id = null;
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("member_id", "t_Members", "loginID= '" + loginID + "'"); //System.Convert.ToInt16
			while(dr.Read()) 
			{	
				//충분히 복수 나옴.
				member_id += dr["member_id"].ToString() + "\n";
			}
			//DataReader와 DBConnection닫기
			dr.Close();			
			dbUtil.SqlConnection.Close();
			if(member_id != null)
				member_id = member_id.Substring(0,member_id.Length-1);
	//HttpContext.Current.Response.Write("member_id = " + member_id + "<br>");
			return member_id;
		}
		public static SqlDataReader GetMember_idFromLoginID(string loginID, bool isActiveMbr)
		{
			string whereClause = "loginID LIKE '%" + loginID + "%'";
			if(isActiveMbr)
				whereClause += " AND (retireDT Is Null OR retireDT = '')";
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("member_id", "t_Members", whereClause); 
			//복수나올 가능성 때문에 dr로 넘김.
			return dr; //받는 쪽에서 닫아 줘야 함.
		}	
		public static SqlDataReader GetMember_idFromName(string MbrName, bool isActiveMbr)
		{
			string whereClause = "MbrName LIKE '%" + MbrName + "%'";
			if(isActiveMbr)
				whereClause += " AND (retireDT Is Null OR retireDT = '')";
			dbUtil = new DBLib();
			SqlDataReader dr = dbUtil.Select_DR("member_id", "t_Members", whereClause); 
			//복수나올 가능성 때문에 dr로 넘김.
			return dr; //받는 쪽에서 닫아 줘야 함.
		}
	
		//종합 회원정보
		public static string GetTotalMemberInfo()
		{
			return Cookie.Self["sName"] + "(" + Cookie.Self["loginID"] + ")";
		}

		public static string GetTotalMemberInfo(object member_id)
		{
			return GetMbrName(member_id) + "(" + GetLoginID(member_id) + ")";
		}


		//ddlSelMenu 선택에 따른 where 쿼리문 생성
		public static string GetSelMenuQuery(string selMenuValue)
		{
			string selMenuQuery = "";
			switch(selMenuValue)
			{ 
				case "255" :	//전회원
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '')";
					break;
				case "101" :	//주주
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=101";
					break;				
				case "5" :		//최우수(플래티늄)
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=5";
					break;
				case "4" :		//최우수(골드)
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=4";
					break;
				case "3" :		//최우수(실버)
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=3";
					break;
				case "2" :		//우수회원
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=2";
					break;	
				case "1" :		//정회원
					selMenuQuery = "(leaveDT Is Null OR leaveDT = '') AND mLevel=1";
					break;
				case "0" :		//불량회원
					selMenuQuery = "mLevel=0";
					break;
				case "-1" :		//퇴사회원
					selMenuQuery = "(leaveDT Is NOT Null)";
					break;
				default:
					goto case "255";
			}
			return selMenuQuery;
		}
		//ddlSelMenu 상태값 레이블링
		public string GetStatusText(object ddlValue)
		{
			string returnValue = "";
			switch(ddlValue.ToString())
			{ 
				case "255" :	//전회원
					returnValue = "전회원";
					break;
				case "101" :	//주주
					returnValue = "주주";
					break;				
				case "5" :		//최우수(플래티늄)
					returnValue = "최우수(플래티늄)";
					break;
				case "4" :		//최우수(골드)
					returnValue = "최우수(골드)";
					break;
				case "3" :		//최우수(실버)
					returnValue = "최우수(실버)";
					break;
				case "2" :		//우수회원
					returnValue = "우수회원";
					break;	
				case "1" :		//정회원
					returnValue = "정회원";
					break;
				case "0" :		//불량회원
					returnValue = "불량회원";
					break;
				case "-1" :		//퇴사회원
					returnValue = "퇴사회원";
					break;
				default:
					returnValue = "Error";
					break;
			}
			return returnValue;			
		}

		public string GetNewsLetterText(object newsLetter)
		{
			return JinsLibrary.Text.BoolToYesNo(newsLetter);
		}

		public string GetMonthlyPayText(object monthlyPay)
		{
			if(monthlyPay.ToString() != "")
			{
				SortedList mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList("MonthlyPay.resx");
				//if(mySL.ContainsKey(drMember["monthlyPay"]))
				return mySL[ Convert.ToInt16(monthlyPay) ].ToString();
			}
			else
				return "";
		}
		public string GetCarInfoText(object carInfo)
		{
			if(carInfo.ToString() != "")
			{
				SortedList mySL =  JinsLibrary.XML.XmlLib.Self.GetResxList("CarInfo.resx");
				//if(mySL.ContainsKey(drMember["monthlyPay"]))
				return mySL[ Convert.ToInt16(carInfo) ].ToString();
			}
			else
				return "";
		}
		public string GetWhichList(string ml)
		{
			whichList = "";
			switch(ml)
			{
				case ""	   :		//회원기본리스트
				case "bsc" :	
					whichList = "MbrList.aspx";
					break;
				case "opt" :		//회원부가리스트
					whichList = "MbrOptList.aspx";
					break;
				case "val" :		//회원평가리스트
					whichList = "MbrValList.aspx";
					break;
				default:
					goto case "bsc";
			}
			URLQuery.Self.Remove("ml");
			return whichList;	
		}

		public static void Modify(string member_id)
		{
			URLQuery.Self["mode"] = "u";
			URLQuery.Self["mbID"] = member_id;
			WebUtil.CurrentResponse.Redirect("MbrForm.aspx?"+ URLQuery.Self.GetQueryString());
		}
		public static void Delete(string member_id)
		{
			DeleteMember("d", member_id);
		}
		public static void Eliminate(string member_id)
		{
			DeleteMember("dd", member_id);
		}

		//CanView + CanModify = CanAccess;	CanView + CanModify + CanDelete = CanAllAccess
		public static Boolean CanAccess(string leaveDT)
		{
			if(Cookie.Self["DeptName"] == "기획/관리" && leaveDT == "")
				return true;
			else
				return false;
		}		
		public static Boolean CanDelete(string member_id)
		{
			if(CanAccess(string.Empty) && Convert.ToInt16(Cookie.Self["sLevel"]) >= 30)
				return true;
			else
				return false;
		}
		//관리콘트롤에 "없음"을 표시할때
		public bool DisplayNone(bool hlView, bool ibModfy)
		{
			if(hlView || ibModfy)
			{
				return false;
			}
			else
				return true;
		}

		public MbrBaseLib()
		{
		}
	}
}
