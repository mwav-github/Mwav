<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->
<%
	'MbrID값이 입력이나 업데이트 되었을 경우, 단순세션보기, 둘다 널값이면 에러.
	MbrID = Trim(Request("MbrID"))
	sMode = Request("sMode")
	
	if MbrID = "" And Session("MbrID") <> "" then 
		MbrID = Session("MbrID")
	elseif MbrID = "" And Session("MbrID") = "" then
		Response.Redirect(UrlRootDir)
	end if	
	
	SQL = "SELECT MbrPW,MbrName,phone,cellularP,MbrEmail,sex,AddrZip,AddrCity,AddrStt,findingID,findingA,SSN1,SSN2 "
	SQL = SQL + " FROM vMember "
	SQL = SQL + " WHERE MbrID='" & MbrID & "'"
	RSresult = OpenRS(rs,SQL,1)
	'Response.Write("RSresult=" + RSresult)
											'set rs = db.Execute(sql)
	if RSresult <> "Empty" then
		'MbrID = trim(rs("MbrID"))
		MbrPW = trim(rs("MbrPW"))
		MbrName = trim(rs("MbrName"))
		phone = trim(rs("phone"))
		cellularP = trim(rs("cellularP"))
		MbrEmail = trim(rs("MbrEmail"))
		sex = trim(rs("sex"))
		AddrZip = trim(rs("AddrZip"))
		AddrCity = trim(rs("AddrCity"))
		AddrStt = trim(rs("AddrStt"))
		findingID = trim(rs("findingID"))
		'Question = trim(rs("Question"))
		findingA = trim(rs("findingA"))
		SSN1 = trim(rs("SSN1"))
		SSN2 = trim(rs("SSN2"))
		Call CloseRS(rs)
		'보여지는 변수매핑
		SSN = SSN1 & "-" & SSN2
		if findingID <> "" then
			Question = PickUpValue("vFindingUserInfo", "Question", "findingID = " & findingID )
		else
			Question = "-"
		end if
	else
		Response.Redirect(UrlRootDir)
	end if	'if RSresult <> "Empty" then

	'''''''''vMbrHiddenValue
	SQL = "SELECT level4,mailing,IPaddress "
	SQL = SQL + " FROM vMbrHiddenValue "
	SQL = SQL + " WHERE MbrID='" & MbrID & "'"
	RSresult = OpenRS(rs,SQL,1)
	if RSresult <> "Empty" then
		level4 = trim(rs("level4"))
		mailing = trim(rs("mailing"))
		IPaddress = trim(rs("IPaddress"))
		'보여지는 변수매핑
		if mailing = "True" then 
			mailing = "수신신청"
		else
			mailing = "수신거부"
		end if
	else
		Response.Redirect(UrlRootDir)
	end if	'if RSresult = "Empty" then


'Response.end
	

%>

<html>
<head>
<title>[<%= Request.Cookies("siteTitle") %>] - 회원가입</title>
<meta name="keywords" content="캠코더 카메라 메모리">
<meta name="description" content="최고의 캠코더 전문사이트">
<meta name="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
<meta http-equiv="refresh" content="<%= refl %>">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<base href="<%= Application("SiteURLDir") %>" target="_self">
<link href="Include_css/Style.css" rel="stylesheet" type="text/css">
<link href="Include_css/Object.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="Include_js/CommonFunctions.js"></script>
<script language="JavaScript" src="Include_js/Function.js"></script>
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <!-- FrontHeader Start -->
      <!--#include File = "../../SiteHeader/FrontHeader.asp" -->
      <!-- FrontHeader End --> </td>
  </tr>
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td> <!-- FrontHeader Start -->
            <!--#include File = "../../ShopComponents/MainMenu/MainMenuBar.asp" -->
            <!-- FrontHeader End --> </td>
        </tr>
        <tr>
          <td>
<base href="<%= Application("SiteURLDir") %>CommonAccessories/MbrUsers/" target="_self">
	<!-- MemberUserDisplay Start -->
	        <TABLE cellSpacing=0 cellPadding=0 width=100% align=center bgColor=#616e5b border=0>
              <TR>
                <TD width=160><IMG height=45 src="Images/muDisplay.gif" width=160></TD>
                <TD class=locationnav>&nbsp;</TD>
              </TR>
            </TABLE>
    <!-- MemberUserDisplay End --> </td>
        </tr>
        <tr>
          <td height="300" align="center">
<SCRIPT language=JavaScript>
<!--
function whereToGo(flag) {
	if( flag == "IDSeek") {
		if (CheckID(document.frmMbr.MbrID, 4, 15, '회원아이디')) {
			NewWindow('../../CommonAccessories/IDSeek/IDSeek.asp',  document.frmMbr, frmMbr.MbrID, 418, 300);
			return;
		}
	}
	if( flag == "zipCode") {
		NewWindow('../../CommonAccessories/PostSeek/PostSeek.asp', document.frmMbr, frmMbr.AddrZip, 426, 400);
		return;
	}
	return;
}

-->
</SCRIPT>
<table width="750" border="0" cellspacing="0" cellpadding="0">
<form method="post" name="frmMbr" onSubmit="return SubmitMbr(this)">
<input name="sMode" type="hidden" id="sMode" value="<%= sMode %>">
  <tr>
   <td align="center"> <table width="100%" border="0" cellpadding="1" cellspacing="0">
       <tr>
         <td height="25" colspan="4">&nbsp; </td>
       </tr>
       <tr>
         <td height="50" colspan="4"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0"><img src="Images/muBasicInfo.gif" width="114" height="18" align="absmiddle">
           | 아래와 같이 회원으로 등록되었습니다. 감사합니다.</td>
       </tr>
       <% if sMode = "i" or company <> "" then %>
       <% end if %>
       <!--  여기가 직장 정보 끝 -->
       <% if session("level4") >= 2 then %>
       <% end if %>
     </table>
     <table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="#dfdfdf">
       <tr>
         <td>
           <table width="100%" border="0" cellpadding="1" cellspacing="1">
             <tr>
               <th width="120" height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               아이디<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td width="260" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                 <%= MbrID %> </td>
               <th width="120" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               이름(성별)<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td width="200" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               <%= MbrName %> <img src="../../Images/TransparentImage.gif" width="10" height="10">(<%= sex %>)</td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               일반전화번호<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= phone %></td>
               <th align="left" bgcolor="#f2f2f2"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               핸드폰</th>
               <td bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= cellularP %> </td>
             </tr>
             <tr>
               <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
               자택주소<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td height="30" colspan="3" bgcolor="#FFFFFF"> <img src="../../Images/TransparentImage.gif" width="10" height="10" border="0">
                 <%= AddrZip %> <%= AddrCity %> <%= AddrStt %></td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               비밀번호<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= MbrPW %> </td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               비밀번호힌트<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= Question %></td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               비밀번호답변<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= findingA %></td>
               <th align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               메일링수신<IMG height="12" src="Images/muBasicStar.gif" width=12></th>
               <td bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10"><%= mailing %></td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">
               이메일주소<IMG height="12" src="Images/muBasicStar.gif" width=12> </th>
               <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= MbrEmail %> </td>
             </tr>
             <tr>
               <th height="35" align="left" bgcolor="#f2f2f2"><img src="../../Images/TransparentImage.gif" width="10" height="10">주민등록번호</th>
               <td colspan="3" bgcolor="#FFFFFF"><img src="../../Images/TransparentImage.gif" width="10" height="10">
                 <%= SSN %> </td>
             </tr>
             <% if sMode = "i" or company <> "" then %>
             <% end if %>
             <!--  여기가 직장 정보 끝 -->
             <% if session("level4") >= 2 then %>
             <% end if %>
           </table></td>
 </tr>
              </table>
                    <TABLE height="12"0 cellSpacing=0 cellPadding=10 width="100%" border=0>
                      <TR>
                        <TD width="50%" align="center">
                        <% if sMode = "i" then %>
                        <a href="muLoginDisplay.asp"><img src="Images/mu_ok.gif" border="0" align="top"></a>
                         &nbsp;
                            <!-- input name="btnUpdate2" type="button" id="btnUpdate24" onClick="JavaScript:SubmitJ('정보를 수정합니까?', this.form, 'MbrInput_ok.asp?sMode=u')" value="부가사항입력"-->                          
                        <% end if %>
                        <% if sMode = "u" then %>
                          <input name="btnOk" type="button" id="btnOk" onClick="javascript:history.go(-2);" value="확 인">
						<% end if %>
						</TD>
                      </TR>
                    </TABLE>
                    </td>
  </tr>
</form>
</table>




          </td>
        </tr>
        <tr>
          <td width="100" valign="top"> </td>
        </tr>
        <tr>
          <td> <!-- FrontFooter Start -->
            <!--#include File = "../../SiteFooter/FrontFooter.asp" -->
            <!-- FrontFooter End --> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
