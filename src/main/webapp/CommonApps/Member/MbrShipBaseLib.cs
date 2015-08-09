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

using MiddleTier.Member.Basic;
using MiddleTier.Member.Option;
using MiddleTier.Member.Value;

namespace KistelSite.CommonApps.MemberShip
{
	
	/// <summary>
	/// MbrBaseLib에 대한 요약 설명입니다.      /// 프로세서를 쓴다면 이게 필요한강?
	/// </summary>
	public class MbrShipBaseLib 
	{
		private MbrBasicBiz mbb;
		private MbrOptionBiz mob;
		private MbrValueBiz mvb;
/*		
		
		/// <summary>
		/// Member update to the status of deletion.
		/// </summary>
		/// <param name="member_id">member_id pk</param>
		public void DeleteMember(string member_id)
		{
			mbb.DeleteMember(member_id);
		}

		/// <summary>
		/// Delete a member data for good.
		/// </summary>
		/// <param name="member_id">member_id pk</param>
		public void EliminateMember(string member_id)
		{
			//avataImage image moving, delete all related tables.
			mob.MbrAvataImageMoveTo(member_id);
			mbb.EliminateMember(member_id);
			//HttpContext.Current.Response.Redirect(whichList + "?" + URLQuery.Self.GetQueryString());
		}


		











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
				//MbrFilesMoveTo(member_id, dbUtil.Select_DR("avataImage","t_MemberOption","member_id=" + member_id));
				dbUtil.Delete_EN("t_MemberJob", "member_id = " + member_id);
				dbUtil.Delete_EN("t_MemberOption", "member_id = " + member_id);
				dbUtil.Delete_EN("t_MemberValue", "member_id = " + member_id);
				dbUtil.Delete_EN("t_Members", "member_id = " + member_id);
			}
			dbUtil.SqlConnection.Close();
			URLQuery.Self.Remove("mode");
			HttpContext.Current.Response.Redirect(whichList + "?" + URLQuery.Self.GetQueryString());
		}

*/


























		/*
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
		*/
		//탈퇴회원인가 확인
//		public static bool IsMemberLeaved(string member_id)
//		{
//			dbUtil = new DBLib();
//			if(dbUtil.GetRecordCount("t_MemberValue", "member_id='" + HTML.ReplaceToDB(member_id) + "' AND leaveDT IS NULL") > 0)
//			{
//				//DB닫기
//				dbUtil.SqlConnection.Close();
//				return false;
//			}
//			else
//				return true;
//		}
		/*
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
			SqlDataReader dr = dbUtil.Select_DR("sName", "t_Members", "member_id="+ member_id );
			if(dr.Read()) 
			{
				MbrName = dr["sName"].ToString(); 				
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

		*/
		public MbrShipBaseLib()
		{
			mbb = new MbrBasicBiz();
			mob = new MbrOptionBiz();
			mvb = new MbrValueBiz();		
		}
		
	}
}
