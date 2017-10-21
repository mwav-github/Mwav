<%
	
	Response.Buffer = false


	

	'DB연결오류 검증
	bln_DbOk = True
	
	'폼값을 받아온다.
	title = Trim(Request.Form("title"))'사이트제목
	table_name = Trim(Request.Form("table_name"))'사이트이름(테이블앞에붙는다.)
	db_server  = Trim(Request.Form("db_server"))'DB서버 
	db_name = Trim(Request.Form("db_name"))'해당DB제목
	db_user = Trim(Request.Form("db_user"))'로그인계정
	db_pass = Trim(Request.Form("db_pass"))'로그인 비밀번호
	
	
	On Error Resume Next
	
	Set db = Server.CreateObject("ADODB.Connection")

	'str_con = "Persist Security Info=False;User ID="&db_user&";"
	'str_con = str_con &"password="&db_pass&";"
	'str_con = str_con &"Data Source="&db_server
	'db.provider = "SQLOLEDB.1" 'SQL서버를 쓴다면 보통 이렇게 쓴다.
    'db.Open  str_con
    str="uid="& db_user &";pwd="& db_pass &";driver={SQL Server};server="& db_server &";database="& db_name
    'Response.Write str

      
     db.Open str
  
	'db.defaultDatabase = db_name
	 
	If Err.Number <> 0 Then 
    'Response.Write "에러발생1"
				bln_DbOk = False	
	Else
	
				'Response.Write "에러발생2"
	
				bln_DbOk = True	
	
				
				'테이블이름을 짖는다.
				static_table = table_name&"_static"
				
				
				'#### 통계분석에 필요한 DBinclude 화일 생성(inc_static.asp)
				
				'static이란폴더를 물리적패스로 변환시킴
				str_path = Server.mappath(".")
				'Response.Write str_path
				'연결정보와 인쿠르드구문을 담고있는 소스텍스트 경로를 붙임
				str_source = str_path&"\count_setup\static.txt"
				
				dim fs 
				
				Set fs = Server.CreateObject("Scripting.FileSystemObject")
				'정해진 파일을 읽어서 변수에 저장
				Set objfile = fs.GetFile(str_source)
				Set text_stream  = objfile.OpenAstextStream
			 
				'소스텍스트를 읽어온다.
				str_inc = text_stream.readAll()
				
				'사용자가 입력한 사항으로 교체시킨다.
				str_inc  = replace(str_inc,"<title>",title)
				str_inc  = replace(str_inc,"<hit_table>",hit_table)
				str_inc  = replace(str_inc,"<static_table>",static_table)
				str_inc  = replace(str_inc,"<db_server>",db_server)
				str_inc  = replace(str_inc,"<db_name>",db_name)
				str_inc  = replace(str_inc,"<db_user>",db_user)
				str_inc  = replace(str_inc,"<db_pass>",db_pass)
				
				
				Set  text_stream = nothing
				Set objfile = nothing
			   
				'인쿠르드화일생성을 위한 경로설정
				str_target = str_path&"\static\inc_static.asp"
				Set f1 = fs.CreateTextFile(str_target,1,0)
				
				'변환된 텍스트를 저장
				f1.write(str_inc) 
				
				if fs.FileExists(str_target) then
				Response.Write "str_target"&str_target
                Response.write "inc_static.asp이 만들어 졌다"
				end if
				
				Set f1 = nothing

				
				'####  SQL스크립트 화일 처리
				'테이블생성 SQL스크립트 화일경로 
				path_sql = str_path&"\count_setup\count.sql"
				
				
				Set f1 = fs.OpenTextFile(path_sql)
				
				'SQL스크립트에 사용자가 입력한 테이블 명으로 교체
				SQL = f1.ReadAll()
				SQL = replace(SQL,"static_table",static_table)
				
				set f1 = nothing

			   '테이블 생성
			   '#### 연결객체를 이용한 쿼리실행(빠른실행을 위해 레코드셋객체를 만들지 않음)
				dbConn.Execute SQL ,,AdCmdText + adExecuteNoRecords
	            
				'#### global.asa화일에 들어갈 내용을 만드는 블럭
				
				global_path = str_path&"\count_setup\global.txt"

				Set objfile = fs.GetFile(global_path)
				Set text_stream  = objfile.OpenAstextStream
				
				str_global = text_stream.ReadAll() 

				str_global = replace(str_global,"<hit_table>",hit_table)
				str_global = replace(str_global,"<static_table>",static_table)
				str_global = replace(str_global,"<db_server>",db_server)
				str_global = replace(str_global,"<db_name>",db_name)
				str_global = replace(str_global,"<db_user>",db_user)
				str_global = replace(str_global,"<db_pass>",db_pass)
				'str_global = replace(str_global,chr(13),"<br>")
				'str_global = replace(str_global,chr(10),"&nbsp;")
				
				Set  text_stream = nothing
				Set objfile = nothing

				global_path = str_path&"\global.asa"
				Set f1 = fs.CreateTextFile(global_path,1)
				'변환된 텍스트를 저장
				f1.write(str_global) 

				Set f1 = nothing
	  End If

%>


<html>
<head>
<title>:::::통계접속 완성 :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
.height {  font-family: "굴림"; font-size: 9pt; color: #5e5e5e; text-decoration: none; line-height: 18px}
.lesson {  font-family: "굴림"; font-size: 9pt; color: #5E5E5E; text-decoration: none}
.column {  font-family: "굴림"; font-size: 9pt; color: #5E5E5E; text-decoration: none}
.board {  font-family: "굴림"; font-size: 9pt; color: #5E5E5E; text-decoration: none}
a.column:hover {  font-family: "굴림"; font-size: 9pt; color: #2D756D; text-decoration: none}
a.lesson:hover {  font-family: "굴림"; font-size: 9pt; color: #609F5C; text-decoration: none}
a.board:hover {  font-family: "굴림"; font-size: 9pt; color: #2D4875; text-decoration: none}
.border_daily {  border: 1px solid; background-color: #E7DBBD; font-family: "굴림체"; font-size: 12px; color: #333333; text-decoration: none; text-align: center; border-color: #999999 #9C9A9C #9C9A9C}
.text07 {  font-family: "굴림체"; font-size: 9pt; color: #CC3300; text-decoration: none}
a.text07:hover {  font-family: "굴림체"; font-size: 9pt; color: #FF6600; text-decoration: none}
td { font-family: "굴림"; font-size: 9pt; color: ##414141; text-decoration: none} 
.left { font-family: "굴림"; font-size: 9pt; color: #FFFFFF; text-decoration: none} 
a.left:hover { font-family: "굴림"; font-size: 9pt; color: #6699FF; text-decoration: 
none} a.left:active { font-family: "굴림"; font-size: 9pt; color: #000000; text-decoration: 
none} .top { font-family: "굴림"; font-size: 9pt; color: #FFFFFF; text-decoration: 
none} a.top:hover { font-family: "굴림"; font-size: 9pt; color: #FFFFFF; text-decoration: 
none} .border { border: 1px #E7DBBD solid; font-size: 9pt; color: #CC0000; text-decoration: 
none; font-family: "굴림"; background-color: #FFFFFF} .link { font-family: "굴림"; 
font-size: 9pt; color: #000000; text-decoration: none} a.link:hover { font-family: 
"굴림"; font-size: 9pt; color: #006633; text-decoration: none} 
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<%
If Err.Number =0 Then '데이타 베이스 연결 오류라면 
					' 오류메시지를 출력한다.
'Response.Write err.number 
'Response.Write db.Errors.Count
%>

<table width="666" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5BA8D" align="center">
  <tr bgcolor="#E0DABA"> 
    <td  align="center" height="25"><b><font color="#990000">DB연결 오류</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="149"><font color="#CC3300">죄송합니다.<br>
      해당 DB서버에 연결할수 없습니다.<br>
      내용은 아래 사항을 참고 하십시요.</font> <br>
      <br>
      <font color="#CC3300"><br>
      <b><font color="#333333">&nbsp;네임(</font></b><font color="#CE0000">Table이름</font><font color="#333333"></font><b><font color="#333333">)</font></b><font color="#333333"> 
      : <%=table_name%><br>
      </font><b><font color="#333333">&nbsp;DB서버이름(</font></b><font color="#333333"><font color="#CE0000">컴퓨터아이디나 
      아이피주소</font></font><b><font color="#333333">)</font></b><font color="#333333"> 
      : </font><font color="#333333"><%=db_server%></font><br>
      <b><font color="#333333">DB이름(</font></b><font color="#333333"><font color="#CE0000">해당 
      DB</font></font><b><font color="#333333">) </font></b><font color="#333333"> 
      : </font><font color="#333333"><%=db_name%></font><br>
      <b><font color="#333333">&nbsp;DB로그인유저(</font></b><font color="#CE0000">해당 
      DB유저계정</font><b><font color="#333333">)</font></b><font color="#CC3300"><font color="#333333"> 
      : </font></font><font color="#CC3300"><font color="#333333"><%=db_user%></font></font><font color="#333333"><br>
      <b><font color="#333333">&nbsp;DB로그인비밀번호(</font></b><font color="#CE0000">해당유저 
      password</font><font color="#CC3300"><b><font color="#333333">)</font></b></font></font></font><font color="#CC3300"><font color="#333333"> 
      : </font></font><font color="#CC3300"><font color="#333333"><%=db_pass%></font></font><br>
      <br>
      에러발생건수 : <b><%=db.Errors.Count%></b> 회<br>
        <br>
      
	  <table width="433" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5BA8D">
  <%
  		For i = 0 to db.Errors.Count +1
  
				Set objError = db.Errors.item(i)


  %>
        <tr>
          <td bgcolor="#FFFFFF">세부내역 <br>
            에러번호 : <%=objError.number%><br>
            에러출처 : <%=objError.Source%><br>
            OLE 에러 번호 : <%=objError.NativeError%><br>
            에러 메시지 : <%=objError.description%>
          </td>
        </tr>
   <%
			Next   
   %>
      </table>

	  <br>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td align="center"><a href="setup.htm" class="link">☜돌아가기</a></td>
  </tr>
</table>
<%
	Else
%>

<br>
<br>
  <div align="center">
    
  <table width="666" border="0" cellspacing="1" cellpadding="4" bgcolor="#C5BA8D" align="center">
    <tr bgcolor="#E0DABA"> 
      <td  align="center" height="25"><b><font color="#990000">생성 완료 </font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25"><font color="#CC3300"></font>&nbsp; 
        <p><font color="#CC3300"><br>
          모든 작업이 완료 되었습니다.<br>
          <br>
          <b>global.asa</b> 화일이 생성되었습니다.<br>
          <b>global.asa</b> 해당파일을 사이트 루트로 이동시키십시요.<b><br>
          <br>
          static</b>폴더를 이동하시고 싶으신 디렉토리로 이동시키시면 됩니다.<br>
          링크는 <b>static</b>폴더의 <b>static.asp</b> 파일입니다.<br>
          <br>
          </font></p>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td align="center">&nbsp; </td>
    </tr>
  </table>
    <br>
  </div>
</body>
</html>
<%

 End If
%>