<!-- #INCLUDE FILE="odbc_connection.inc" -->
<%
'on error resume next

Set objBrowsCap=Server.CreateObject("MSWC.BrowserType")
sAppName=objBrowsCap.Browser
sAppVer=objBrowsCap.Version
HandlesJScript=objBrowsCap.javascript
HandlesCookies=objBrowsCap.Cookies
set objBrowsCap=nothing

'initialize variable
session("VisitLogged")=1

session("browser")="sAppName:" & sAppName & "/sAppVer:" & sAppVer

sAppName=left(sAppName,1)
if sAppName="" then sAppName="??"
sAppVer=left(Cstr(sAppVer),4)
sRemote_Addr=request.serverVariables("REMOTE_ADDR")
HTTP_REFERER=Request.ServerVariables("HTTP_REFERER")
if len(HTTP_REFERER)>40 then HTTP_REFERER=left(HTTP_REFERER,40)

WhereFrom=replace(HTTP_REFERER,"http://","")
WhereFrom=replace(WhereFrom,"www.","")
i=instr(WhereFrom,"/")
if i>0 then WhereFrom=left(WhereFrom,i-1)
i=instr(WhereFrom,"@")
if i>0 then WhereFrom=left(WhereFrom,i-1)
if instr(WhereFrom,"blue-sea.com")>0 then WhereFrom=""

if sAppName="N" then
	sAppName="NS"
else
	sAppName="IE"
end if

if HandlesJScript=true then
	HandlesJScript=1
else
	HandlesJScript=0
end if

user_name=request.serverVariables("Logon_User")
if (isnull(user_name) or user_name="") then user_name="na"

	sSQL="INSERT INTO tbl_Log_Visits ("
	sSQL=sSQL & "BrowserBrand"
	sSQL=sSQL & ",BrowserVersion"
	sSQL=sSQL & ",Remote_Addr"
	if WhereFrom<>"" then sSQL=sSQL & ",IP_Came_From"
	sSQL=sSQL & ",hitDate"
	sSQL=sSQL & ",hitTime"
	sSQL=sSQL & ",intSessionID"
	sSQL=sSQL & ",HandlesJScript"
	sSQL=sSQL & ",user_name"
	sSQL=sSQL & ") "
	sSQL=sSQL & "Values ("
	sSQL=sSQL & "'" & sAppName & "'"
	sSQL=sSQL & "," & sAppVer
	sSQL=sSQL & ",'" & sRemote_Addr & "'"
	if WhereFrom<>"" then sSQL=sSQL & ",'" & WhereFrom & "'"
	sSQL=sSQL & ",'" & date & "'"
	sSQL=sSQL & ",'" & time & "'"
	sSQL=sSQL & "," & Session.SessionID
	sSQL=sSQL & "," & HandlesJScript
	sSQL=sSQL & ",'" & user_name & "'"
	sSQL=sSQL & ")"
	'response.write sSQL & "<BR>"
	set RS=conn.execute(sSQL)
	set RS=nothing
%>
