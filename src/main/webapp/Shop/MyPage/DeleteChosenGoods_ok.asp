<!-- ShopSetting Start -->
	<!--#include File = "../../SiteSetting.asp" -->
<!-- ShopSetting End -->

<%
	'상품코드
	MbrID = Request.QueryString("MbrID")
	gCode = Request.QueryString("g")
	'MbrID, gCode 값이 안넘어 오면
	if MbrID = "" or gCode = "" then
		Call ShowAlertMsg("비정상적인 접속입니다!!")
	end if

	'찜한 상품 DB입력
	Set Cmd = Server.CreateObject("ADODB.Command")
	With Cmd
		.ActiveConnection = dbConn
		.CommandType = adCmdText
		SQL = "DELETE FROM vChosenGoods"
		SQL = SQL & " WHERE MbrID = ? and gCode = ?"
		.CommandText = SQL
		.Parameters.Append Cmd.CreateParameter("@MbrID", adVarChar, adParamInput, 15, MbrID)
		.Parameters.Append Cmd.CreateParameter("@gCode", adChar, adParamInput, 15, gCode)
		.Execute ,,adExecuteNoRecords
	end With
	Set Cmd = nothing		

	Call GotoThePage("해당상품을 삭제했습니다.", "MyPage.asp")
	
%>	
<% 
	'Server.Execute(Application("SiteRoot") & "Admin/Statistics/statsEngine.asp") 
	Call CloseDB()
%>