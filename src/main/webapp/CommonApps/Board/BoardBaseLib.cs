using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using JinsLibrary;
using JinsLibrary.FILE;
using JinsLibrary.CONFIG;
using JinsLibrary.STATEMANAGE;
using KistelSite.Admins.CompanyMgr.Staffs;

namespace KistelSite.CommonApps.Board
{
	public class BoardBase : System.Web.UI.Page
	{	
		public int da_id;
		public string daCategory;
		public string daType;
		public string daName;
		public string daDescription;
		public System.Int16 daStatus;
		public int staff_id;
		public string DNSecurity;
		public System.Int16 SLSecurity;

		private DBLib dbUtil;
		private SqlCommand myCommand;
		//private SqlParameter[] mySqlParameters;
		
		public int Insert()
		{			
			FillSlqParameters("i");
			return dbUtil.ExecProcedure(myCommand,"sp_DocumentAssets");
		}
		public int Update()
		{
			FillSlqParameters("u");
			return dbUtil.ExecProcedure(myCommand,"sp_DocumentAssets");
		}
		
		public void FillSlqParameters(string mode)	// mode i,u
		{
			myCommand = new SqlCommand();	//("sp_Assets", dbUtil.SqlConnection);
			myCommand.CommandType = CommandType.StoredProcedure;

			SqlParameter sp_mode = new SqlParameter("@sp_mode", SqlDbType.VarChar, 1);
			sp_mode.Value = mode;
			myCommand.Parameters.Add(sp_mode);
			
			myCommand.Parameters.Add("@da_id", SqlDbType.Int).Value						= da_id;
			myCommand.Parameters.Add("@daCategory", SqlDbType.VarChar, 50).Value		= daCategory;
			myCommand.Parameters.Add("@daType", SqlDbType.VarChar, 50).Value			= daType;
			myCommand.Parameters.Add("@daName", SqlDbType.VarChar, 200).Value			= daName;
			myCommand.Parameters.Add("@daDescription", SqlDbType.VarChar, 4000).Value	= daDescription;
			myCommand.Parameters.Add("@daStatus", SqlDbType.TinyInt).Value				= daStatus;
			myCommand.Parameters.Add("@staff_id", SqlDbType.Int).Value					= staff_id;
			myCommand.Parameters.Add("@DNSecurity", SqlDbType.NVarChar, 10).Value		= DNSecurity;
			myCommand.Parameters.Add("@SLSecurity", SqlDbType.TinyInt).Value			= SLSecurity;
			////////////////
			myCommand.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
		}
		public BoardBase()
		{
			dbUtil = new DBLib();
		}
		
	}
/*	
	public class DocFileBase : System.Web.UI.Page
	{	
		public int df_id;
		public int dfOrder;
		public string dfName;
		public string dfDescription;
		public string dfOriginName;
		public int dfDLcount;

		private DBLib dbUtil;
		private SqlCommand myCommand;
		//private SqlParameter[] mySqlParameters;
		
		public int Insert()
		{			
			FillSlqParameters("i");
			return dbUtil.ExecProcedure(myCommand,"sp_DocFileAssets");
		}
		public int Update()
		{
			FillSlqParameters("u");
			return dbUtil.ExecProcedure(myCommand,"sp_DocFileAssets");
		}
		
		public void FillSlqParameters(string mode)	// mode i,u
		{
			myCommand = new SqlCommand();	//("sp_Assets", dbUtil.SqlConnection);
			myCommand.CommandType = CommandType.StoredProcedure;

			SqlParameter sp_mode = new SqlParameter("@sp_mode", SqlDbType.VarChar, 1);
			sp_mode.Value = mode;
			myCommand.Parameters.Add(sp_mode);
			
			myCommand.Parameters.Add("@df_id", SqlDbType.Int).Value						= df_id;
			myCommand.Parameters.Add("@dfOrder", SqlDbType.TinyInt).Value				= dfOrder;
			myCommand.Parameters.Add("@dfName", SqlDbType.VarChar, 100).Value			= dfName;
			myCommand.Parameters.Add("@dfDescription", SqlDbType.VarChar, 200).Value	= dfDescription;
			myCommand.Parameters.Add("@dfOriginName", SqlDbType.VarChar, 100).Value		= dfOriginName;
			myCommand.Parameters.Add("@dfDLcount", SqlDbType.Int).Value					= dfDLcount;
			////////////////
			myCommand.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
		}
		public DocFileBase()
		{
			dbUtil = new DBLib();
		}
		
	}
	*/
	/// <summary>
	/// DocBaseLib에 대한 요약 설명입니다.      /// 프로세서를 쓴다면 이게 필요한강?
	/// </summary>
	public class BoardBaseLib : System.Web.UI.Page
	{
		private static bool btnView;
		private static bool btnModify;
		//문서데이터 삭제
		public static void DeleteDoc(string mode, string da_id)
		{
			URLQuery.Self.RemoveAll();
			DBLib dbUtil = new DBLib();
			//(실제로 업데이트)
			if(mode == "d") 
			{
				string[] setNameValue = new string[3] 
				{ "daModifyDT=GetDate()", "daStatus=0", "daDescription = daDescription + '\r\n\r\n\r\n" +  Cookie.Self["sLoginID"] + "의한 삭제'" };
				dbUtil.Update_EN("t_DocumentAssets", setNameValue , "da_id = " + da_id);
			} 
			else if(mode == "dd") //게시물 영구삭제(실제삭제)
			{				
				//관련문서파일삭제
				SqlDataReader drDelFiles = dbUtil.Select_DR("dfName","t_DocFileAssets","df_id=" + da_id);
				while(drDelFiles.Read())
				{
					//FileLib.Self.FileDelete(SystemConfig.GetValue("DocUploadDir") + drDelFiles["dfName"].ToString());	
					string backupDir  = SystemConfig.GetValue("UploadDirBackup") + "docData.bak/";
					FileLib.Self.FileMoveTo(SystemConfig.GetValue("DocUploadDir") + drDelFiles["dfName"].ToString(), backupDir + drDelFiles["dfName"].ToString());
				}
				drDelFiles.Close();
				//관련레코드 삭제
				dbUtil.Delete_EN("t_DocFileAssets", "df_id = " + da_id);
				dbUtil.Delete_EN("t_DocumentAssets", "da_id = " + da_id);
				URLQuery.Self["smv"] = "0";
			}
			dbUtil.SqlConnection.Close();
		}

		//ddlSelMenu 선택에 따른 where 쿼리문 생성
		public static string GetSelMenuQuery(string selMenuValue)
		{
			string selMenuQuery = "";
			switch(selMenuValue)
			{ 
				case "5" :		//대외비
					selMenuQuery = "daStatus = 5";
					break;
				case "34" :		//정규문서
					selMenuQuery = "(daStatus = 3 Or daStatus = 4)";
					break;
				case "2" :		//승인요청
					selMenuQuery = "daStatus = 2";
					break;	
				case "1" :		//임시문서
					selMenuQuery = "daStatus = 1";
					break;
				case "0" :		//파기요청문서
					selMenuQuery = "daStatus = 0";
					break;
				case "255" :		//공개문서
					selMenuQuery = "daStatus = 255";
					break;
				default:
					goto case "34";
			}
			return selMenuQuery;
		}

		//보기버튼을 만든다.
		public static string ViewButton(object daID, object DNSecurity, object SLSecurity)
		{
			string retValue;
			if( CanView(DNSecurity.ToString(), Convert.ToInt16(SLSecurity)) )
			{				
				URLQuery.Self.RemoveAll();
				URLQuery.Self["daID"] = (string)daID.ToString();
				URLQuery.Self["cp"] = HttpContext.Current.Request["cp"];
				URLQuery.Self["smv"] = KistelSite.Admins.CompanyMgr.Docs.DocList.SelMenuValue.ToString();
				retValue = "DocView.aspx?" + URLQuery.Self.GetQueryString();
				retValue = HTML.MakeLink(retValue, "<img src='../../zImages/btn_admin_view.gif'>");
				btnView = true;
			}
			else
			{
				btnView = false;
				retValue = "";	
			}
			return retValue;
		}
		public static Boolean CanView(string DNSecurity, System.Int16 SLSecurity)
		{
			if(DNSecurity == Cookie.Self["DeptName"] || DNSecurity == "all") //부서통화
			{
				if( SLSecurity == 0 || SLSecurity <= Convert.ToInt16(Cookie.Self["sLevel"]) ) //권한통과
				{
					return true;
				}
			}
			return false;
		}

		//수정버튼을 만든다.
		public static string ModifyButton(object daID)
		{
			string retValue;
			if( (Cookie.Self["staff_id"].ToString() == PostState.Self["staff_id"].ToString()) || (Cookie.Self["DeptName"].ToString() =="기획/관리") )
			{
				btnModify = true;
				URLQuery.Self.RemoveAll();
				URLQuery.Self["mode"] = "u";
				URLQuery.Self["daID"] = (string)daID.ToString();
				URLQuery.Self["cp"] = HttpContext.Current.Request["cp"];
				URLQuery.Self["smv"] = bList.SelMenuValue.ToString();
				retValue = HTML.MakeLink("javascript:ConfirmJ('수정하시겠습니까?','DocForm.aspx?"+ URLQuery.Self.GetQueryString() + "')","<img src='../../zImages/btn_admin_modify.gif'>");
			}
			else
			{
				btnModify = false;
				retValue = "";	
			}
			return retValue;
		}
		//삭제버튼을 만든다.
		public static string DeleteButton(string daID, string DNSecurity, System.Int16 SLSecurity,System.Int16 daStatus)
		{			
			string retValue = "";
			if( daStatus > 0 && CanDelete(DNSecurity, SLSecurity) )
			{
				URLQuery.Self.RemoveAll();
				URLQuery.Self["mode"] = "d";
				URLQuery.Self["daID"] = (string)daID.ToString();
				URLQuery.Self["cp"] = HttpContext.Current.Request["cp"];
				retValue = HTML.MakeLink("javascript:ConfirmJ('삭제하시겠습니까?','DocList.aspx?"+ URLQuery.Self.GetQueryString() + "')","<img src='../../zImages/btn_admin_delete.gif'>");
			}
			return retValue;
		}
		
		public static Boolean CanDelete(string DNSecurity, System.Int16 SLSecurity)
		{
//ClientAction.ShowInfoMsg(DNSecurity.ToString());
			if(DNSecurity == "all" || DNSecurity == "기획/관리" || DNSecurity == Cookie.Self["DeptName"] || DNSecurity == "") //부서통화
			{
				if(SLSecurity <= Convert.ToInt16(Cookie.Self["sLevel"])) //권한통과
				{
					return true;
				}
			}
			return false;
		}

		//완전삭제버튼을 만든다.
		public static string DeletePerfectButton(string daID, System.Int16 daStatus)
		{	
			string retValue;
			if( daStatus == 0 && Cookie.Self["DeptName"] == "기획/관리" && Convert.ToInt16(Cookie.Self["sLevel"]) >= 30 )
			{
				URLQuery.Self.RemoveAll();
				URLQuery.Self["mode"] = "dd";
				URLQuery.Self["daID"] = daID;
				retValue = HTML.MakeLink("javascript:ConfirmJ('문서자료를 영구히 삭제하시겠습니까?','DocList.aspx?"+ URLQuery.Self.GetQueryString() + "')","<img src='../../zImages/btn_admin_completedel.gif'>");
			}
			else
				retValue = "";

			return retValue;
		}
		
		//관리콘트롤에 "없음"을 표시할때
		public static string DisplayNone()
		{
			if(btnView == false && btnModify == false) 
			{
				return "없음";
			}
			else
			{
				return String.Empty;
			}
		}
		
		public static string GetStatus(object daStatus)
		{
			string retValue = daStatus.ToString();
			switch(retValue)
			{ 
				case "5" :		
					retValue = "대외비";
					break;
				case "4" :		
					retValue = "중요문서";
					break;
				case "3" :		
					retValue = "일반문서";
					break;
				case "2" :		
					retValue = "승인요청";
					break;	
				case "1" :
					retValue = "임시문서";
					break;
				case "0" :		//파기요청문서
					retValue = "파기문서";
					break;
				case "255" :	//파기요청문서
					retValue = "공개문서";
					break;
				default:
					retValue = "등급미정";
					break;
			}
			return retValue;
		}


		public BoardBaseLib()
		{
		}
	}
}
