<%@ TRANSACTION = Required LANGUAGE = "VBScript" %>
<!-- shopConfig Start -->
	<!--#include File = "../../Config/Config.asp" -->
<!-- shopConfig End -->

<!-- DB Connection -->
	<!--#include File = "../../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->

<!-- Function Start -->
<!--#include File= "../../Include_asp/CommonFunctions.asp"-->
<!--#include File="../../Include_asp/Functions.asp"-->
<!-- Function End -->

<!-- stats_function -Start -->
<!--#include File="statsFunction.asp"-->
<!-- stats_function -End -->

<%
	Response.Buffer=True

	'프락시 서버 캐싱방지
	'서버에 존재하는 프록시로 부터 페이지를 전혀 캐싱하지 못하게 함.
	Response.Expires = -1
	Response.Expiresabsolute = Now()
	Response.CacheControl = "private"
	Response.AddHeader "pragma", "no-cache"
	Response.AddHeader "cache-control", "private"
	Server.ScriptTimeout = 1000000000

'On Error Resume Next


'웹사이트 접속시 각종 정보 얻기
HTTP_REFERER = Request.ServerVariables("HTTP_REFERER")
'HTTPS = Request.ServerVariables("HTTPS")
'LOCAL_ADDR = Request.ServerVariables("LOCAL_ADDR")
PATH_INFO = Request.ServerVariables("PATH_INFO")
REMOTE_ADDR = Request.ServerVariables("REMOTE_ADDR")
REMOTE_HOST = Request.ServerVariables("REMOTE_HOST")
SERVER_NAME = Request.ServerVariables("SERVER_NAME")
SERVER_PORT = Request.ServerVariables("SERVER_PORT")
URL = Request.ServerVariables("URL")
HTTP_HOST = Request.ServerVariables("HTTP_HOST")
HTTP_USER_AGENT = Request.ServerVariables("HTTP_USER_AGENT")
'HTTP_COOKIE = Request.ServerVariables("HTTP_COOKIE")
'Session.SessionID

HTTP_REFERER=replace(HTTP_REFERER,"http://","")
HTTP_REFERER=replace(HTTP_REFERER,"www.","")


''''''''''''''''''''
'Get쿼리에 대한 내용'
''''''''''''''''''''

pcw = Trim(Request("pcw"))	'	?pcw=아이디;200;10002

    'pageName를 정한다.
    'session("PageTitleName") = "메인페이지"

CameToThePage = session("PageTitleName")            '각 페이지에서 넘겨 줘야 될 듯
session("PageTitleName") = ""                       '다시 초기화



''''''''''''''''''''''' 변수 실제값과 매핑  '''''''''''''''
if pcw <> "" then
	PCWvalue = GetPCWvalue(pcw)
	PmoterID = PCWvalue(0)
	stat_Pname = PCWvalue(1)
	CameFromPage = PCWvalue(2)
	WhatsAbout = PCWvalue(3)

	Session("Pname") = stat_Pname
else
	PmoterID = "SiteURL"
	stat_Pname = Application("shopName")
	CameFromPage = "관련정보없음"
	WhatsAbout = "관련정보없음"
end if
''''''''''''''''''''''' 변수 실제값과 매핑  '''''''''''''''



'''''''''''''''''''''
'  출력테스트        '
'''''''''''''''''''''
'Response.write(HTTP_REFERER & "<br>")
'Response.write(PATH_INFO & "<br>")
'Response.write(REMOTE_ADDR & "<br>")
'Response.write(REMOTE_HOST & "<br>")
'Response.write(SERVER_NAME & "<br>")
'Response.write(SERVER_PORT & "<br>")
'Response.write(HTTP_HOST & "<br>")
'Response.write(HTTP_USER_AGENT & "<br>")
'Response.write(HTTP_COOKIE & "<br>")
'Response.write(Session.SessionID & "<br>")
'Response.write(PmoterID & "<br>")
'Response.write(stat_Pname & "<br>")
'Response.write(CameFromPage & "<br>")
'Response.write(WhatsAbout & "<br>")
'Response.write(pcw & "<br>")
'Response.write("한시간 후의 시간 : " & DateAdd("h", 1, now) & "<br>")



%>

<!-- a href="http://192.168.1.100?p=rocktry&c=100&w=10000"> 페이지 이동 </a -->
<script language="JavaScript" type="text/JavaScript">
<!--
    document.title += " - [<%= CameToThePage %>]";
     cpu = navigator.cpuClass;
    if( window.screen ){
        scr = window.screen.width+'*'+window.screen.height;
    }
-->
</script>

<%

if session("stat_Key") = "" and Request.Cookies("stat_Key") = "" then        '처음으로 사이트에 접속한겨.
    '카운터 작성 - 최대 stat_Key 값을 가져 온다.
	stat_Key = NextNumber("vStatistics", "stat_Key", "", 0)

    'stat_Key를 PK로 vStatistics에 첫 데이타를 기록한당.
    SQL = "INSERT INTO vStatistics(stat_Key,stat_sNAME,stat_hHOST,stat_sPORT,stat_pINFO,stat_ADDR,stat_HOST,stat_uAGENT,stat_hREFERER,stat_PmoterID,stat_Pname,stat_CameFromPage,stat_CameToThePage,stat_WhatsAbout,stat_SessionID,stat_date) VALUES"
    SQL = SQL & "(" & stat_Key
    SQL = SQL & ",'" & SERVER_NAME & "'"
    SQL = SQL & ",'" & HTTP_HOST & "'"
    SQL = SQL & ",'" & SERVER_PORT & "'"
    SQL = SQL & ",'" & PATH_INFO & "'"
    SQL = SQL & ",'" & REMOTE_ADDR & "'"
    SQL = SQL & ",'" & REMOTE_HOST & "'"
    SQL = SQL & ",'" & HTTP_USER_AGENT & "'"
    SQL = SQL & ",'" & HTTP_REFERER & "'"
    SQL = SQL & ",'" & PmoterID & "'"
    SQL = SQL & ",'" & stat_Pname & "'"
    SQL = SQL & ",'" & CameFromPage & "'"
    SQL = SQL & ",'" & CameToThePage & "'"
    SQL = SQL & ",'" & WhatsAbout & "'"
    SQL = SQL & ",'" & Session.SessionID & "'"
    SQL = SQL &",getdate())"
    dbConn.Execute SQL

    session("stat_Key") = stat_Key
    Response.Cookies("stat_Key") = stat_Key
    Response.Cookies("stat_Key").Expires  = DateAdd("h", 1, now)        '1시간뒤 쿠키삭제

else

    '이미 세션이나 쿠키값이 있으면 stat_Key에 대입
    if session("stat_Key") <> "" then
        stat_Key = session("stat_Key")
    elseif Request.Cookies("stat_Key") <> "" then
        stat_Key = Request.Cookies("stat_Key")
    else
        Response.write("stat_Key값 에러입니다")
        Response.end
    end if

end if

if Request.Cookies("DetailLog") = "Yes" then        '세부로그기록
    '이전에 바로 저장된 log_hREFERER 값을 가져온다.
    SQL = "SELECT TOP 1 log_pINFO FROM vStat_Log "
    SQL = SQL & " ORDER BY log_date DESC "
    Set rsLog = Server.CreateObject("ADODB.Recordset")
    rsLog.Open SQL,db,1
    if not rsLog.EOF or not rsLog.BOF then
        log_pINFO = Trim(rsLog("log_pINFO"))      '바로 이전값
    end if
    rsLog.Close
    Set rsLog = Nothing
    '현 로그와 바로 이전 log_hREFERER 비교하여 다르면 로그를 작성한다.
    if PATH_INFO <> log_pINFO then
        'log_Key를  PK로 vStatistics에 첫 데이타를 기록한당.
        SQL = "INSERT INTO vStat_Log(log_Key,log_date,log_CameToThePage,log_SessionID,log_hREFERER,log_pINFO) VALUES"
        SQL = SQL & "(" & stat_Key
        SQL = SQL & ",getdate()"
        SQL = SQL & ",'" & CameToThePage & "'"
        SQL = SQL & ",'" & Session.SessionID & "'"
        SQL = SQL & ",'" & HTTP_REFERER & "'"
        SQL = SQL & ",'" & PATH_INFO & "')"
        db.Execute(SQL)
    end if
end if	'if Request.Cookies("DetailLog") = "Yes" then        '세부로그기록


    '회원아이디가 로그인 되었는지 확인해서 통계에 업데이트한다.
    if session("MbrID") <> "" then
        SQL = "Update vStatistics set stat_MbrID = '" & session("MbrID") & "'"
        SQL = SQL & " where stat_Key = " & stat_Key
        SQL = SQL & " and stat_MbrID is Null"
        dbConn.Execute SQL
    end if


    '페이지이름이 변경됐으면 기존의 데이타를 업데이트한다.(트레픽이 없을때 온한다.)
    'Call UpdatePageName(PATH_INFO,CameToThePage)

%>


<!-- PowerCGI 카운터 시작테스트 -->
<!-- A HREF="/admin/Statistics/statics.php?db=rocktry"><IMG SRC="http://counter.powercgi.net/Counter.php?db=rocktry" width="1" height="1" BORDER=0></A -->
<!-- PowerCGI 카운터 끝 -->


<%
    ' The Transacted Script Commit Handler.  This sub-routine
    ' will be called if the transacted script commits.
    Sub OnTransactionCommit()
		'Response.Write "<P><B>업데이트가 성공적으로 이루어졌습니다</B>."
    End Sub


    ' The Transacted Script Abort Handler.  This sub-routine
    ' will be called if the script transacted aborts
    Sub OnTransactionAbort()
		Response.Write "<P><B>업데이트가 제대로 이루어지지 않았습니다</B>."
    End Sub
%>