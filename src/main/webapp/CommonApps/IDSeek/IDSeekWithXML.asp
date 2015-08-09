<%@ Language=VBScript %>
<!-- Admin Setting -->
	<!--#include File="../../Admin/AdminSetting.asp"-->
<!-- Admin Setting -->

<!-- DB Connection -->
	<!--#include File = "../../Config/Connection/DBconnection.asp" -->
<!-- DB Connection -->

<!-- function Start -->
<!--#include File= "../../Include_asp/CommonFunctions.asp"-->
<!-- function End -->

<%

	tableName =trim(Request.QueryString("tableName"))
	whereClause =trim(Request.QueryString("whereClause"))

	pkupValue = Mid(whereClause,1,InStr(whereClause, "=")-1)

	SQL = "SELECT Top 1 " & pkupValue & " FROM " & tableName
	SQL = SQL & " WHERE " & whereClause
	RSresult = OpenRS(rs,SQL,1)

	if RSresult <> "Empty" then
		Response.Write("<result>1</result>")
		'Response.Write "<result>" & RSresult & "</result>"
		Call CloseRS(rs)
	else
		Response.Write("<result>0</result>")
	end if
	Call CloseDB()

	'Set Conn = Server.CreateObject("ADODB.Connection")
	'Conn.ConnectionString = Application("cs")
	'Conn.Open
	'Set Rs = Conn.Execute("select * from login where u_id='" & Replace(Request("id"),"'", "''") & "'")

	'If Rs.BOF Or Rs.EOF Then
	'	Response.Write "<result>1</result>"
	'Else
	'	Response.Write "<result>0</result>"
	'End If

	'<script language="javascript">

	'function checkID(strID)
	'{
	'	// 유효한 문자의 집합?
	'	return true;
	'}

	'function checkExists()
	'{
	'	var id = document.frmJoin.txtID.value;
	'
	'	if (checkID(id))
	'	{
	'		var doc = new ActiveXObject("MSXML2.DOMDocument.4.0");
	'		doc.async = false;
	'		doc.load("checkID.asp?id=" + id)
	'		alert(doc.documentElement.text);

	'		if(doc.documentElement.text == "1")
	'			alert("사용 가능한 아이디입니다.");
	'		else
	'			alert("이미 사용중인 아이디입니다.");
	'	}
	'	else
	'	{
	'		alert("유효한 아이디가 아닙니다.\r\n아이디는 4자 이상 20자 이하의 영문자와 숫자 -의 조합니다.");
	'	}

	'}
	'</script>

%>